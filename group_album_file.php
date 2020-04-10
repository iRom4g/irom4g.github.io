<?
$page = "group_album_file";
include "header.php";

// MAKE SURE MEDIA VARS ARE SET IN URL
if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }
if(isset($_POST['groupmedia_id'])) { $groupmedia_id = $_POST['groupmedia_id']; } elseif(isset($_GET['groupmedia_id'])) { $groupmedia_id = $_GET['groupmedia_id']; } else { $groupmedia_id = 0; }
if(isset($_POST['group_id'])) { $group_id = $_POST['group_id']; } elseif(isset($_GET['group_id'])) { $group_id = $_GET['group_id']; } else { $group_id = 0; }

// DISPLAY ERROR PAGE IF USER IS NOT LOGGED IN AND ADMIN SETTING REQUIRES REGISTRATION
if($user->user_exists == 0 & $setting[setting_permission_group] == 0) {
  $smarty->assign('error_header', $group_album_file[15]);
  $smarty->assign('error_message', $group_album_file[17]);
  $smarty->assign('error_submit', $group_album_file[25]);
  $smarty->display("error.tpl");
  exit();
}


// INITIALIZE GROUP OBJECT
$group = new se_group($user->user_info[user_id], $group_id);
if($group->group_exists == 0) { header("Location: home.php"); exit(); }

// GET GROUP ALBUM INFO
$groupalbum_info = $database->database_fetch_assoc($database->database_query("SELECT * FROM se_groupalbums WHERE groupalbum_group_id='".$group->group_info[group_id]."' LIMIT 1"));


// MAKE SURE MEDIA EXISTS
$groupmedia_query = $database->database_query("SELECT * FROM se_groupmedia WHERE groupmedia_id='$groupmedia_id' AND groupmedia_groupalbum_id='$groupalbum_info[groupalbum_id]' LIMIT 1");
if($database->database_num_rows($groupmedia_query) != 1) { header("Location: group.php?group_id=".$group->group_info[group_id]); exit(); }
$groupmedia_info = $database->database_fetch_assoc($groupmedia_query);

// GET PRIVACY LEVEL
$privacy_level = $group->group_privacy_max($user, $group->groupowner_level_info[level_profile_privacy]);
$allowed_privacy = true_privacy($group->group_info[group_privacy], $group->groupowner_level_info[level_profile_privacy]);
$is_group_private = 0;
if($privacy_level < $allowed_privacy) { header("Location: group.php?group_id=".$group->group_info[group_id]); exit(); }


// UPDATE ALBUM VIEWS
$groupalbum_views_new = $groupalbum_info[groupalbum_views] + 1;
$database->database_query("UPDATE se_groupalbums SET groupalbum_views='$groupalbum_views_new' WHERE groupalbum_id='$groupalbum_info[groupalbum_id]' LIMIT 1");

// CHECK IF USER IS ALLOWED TO COMMENT
$allowed_to_comment = 1;
$comment_level = $group->group_privacy_max($user, $group->groupowner_level_info[level_group_comments]);
$allowed_comment = true_privacy($group->group_info[group_comments], $group->groupowner_level_info[level_group_comments]);
if($comment_level < $allowed_comment) { $allowed_to_comment = 0; }


// IF A COMMENT IS BEING POSTED
if($task == "dopost" & $allowed_to_comment != 0) {

  $comment_date = time();
  $comment_body = $_POST['comment_body'];

  // RETRIEVE AND CHECK SECURITY CODE IF NECESSARY
  if($setting[setting_comment_code] != 0) {
    session_start();
    $code = $_SESSION['code'];
    if($code == "") { $code = randomcode(); }
    $comment_secure = $_POST['comment_secure'];

    if($comment_secure != $code) { $is_error = 1; }
  }

  // MAKE SURE COMMENT BODY IS NOT EMPTY
  $comment_body = censor(str_replace("\r\n", "<br>", $comment_body));
  $comment_body = preg_replace('/(<br>){3,}/is', '<br><br>', $comment_body);
  $comment_body = ChopText($comment_body);
  if(str_replace(" ", "", $comment_body) == "") { $is_error = 1; $comment_body = ""; }

  // ADD COMMENT IF NO ERROR
  if($is_error == 0) {
    $database->database_query("INSERT INTO se_groupmediacomments (groupmediacomment_groupmedia_id, groupmediacomment_authoruser_id, groupmediacomment_date, groupmediacomment_body) VALUES ('$groupmedia_info[groupmedia_id]', '".$user->user_info[user_id]."', '$comment_date', '$comment_body')");

    // INSERT ACTION IF USER EXISTS
    if($user->user_exists != 0) {
      $commenter = $user->user_info[user_username];
      $comment_body_encoded = $comment_body;
      if(strlen($comment_body_encoded) > 250) { 
        $comment_body_encoded = substr($comment_body_encoded, 0, 240);
        $comment_body_encoded .= "...";
      }
      $comment_body_encoded = htmlspecialchars(str_replace("<br>", " ", $comment_body_encoded));
      $actions->actions_add($user, "groupmediacomment", Array('[username]', '[id]', '[id2]', '[title]', '[comment]'), Array($commenter, $group->group_info[group_id], $groupmedia_info[groupmedia_id], $group->group_info[group_title], $comment_body_encoded));
    } else { 
      $commenter = $group_album_file[14];
    }

    // SEND COMMENT NOTIFICATION IF NECESSARY
    $groupowner_info = $database->database_fetch_assoc($database->database_query("SELECT se_users.user_id, se_users.user_username, se_users.user_email, se_usersettings.usersetting_notify_groupmediacomment FROM se_users LEFT JOIN se_usersettings ON se_users.user_id=se_usersettings.usersetting_user_id WHERE se_users.user_id='".$group->group_info[group_user_id]."'"));
    if($groupowner_info[usersetting_notify_groupmediacomment] == 1 & $groupowner_info[user_id] != $user->user_info[user_id]) { 
      send_generic($groupowner_info[user_email], "$setting[setting_email_fromname] <$setting[setting_email_fromemail]>", $setting[setting_email_groupmediacomment_subject], $setting[setting_email_groupmediacomment_message], Array('[username]', '[commenter]', '[groupname]', '[link]'), Array($groupowner_info[user_username], $commenter, $group->group_info[group_title], "<a href=\"".$url->url_base."group_album_file.php?group_id=".$group->group_info[group_id]."&groupmedia_id=$groupmedia_info[groupmedia_id]\">".$url->url_base."group_album_file.php?group_id=".$group->group_info[group_id]."&groupmedia_id=$groupmedia_info[groupmedia_id]</a>")); 
    }
  }

  echo "<html><head><script type=\"text/javascript\">";
  echo "window.parent.addComment('$is_error', '$comment_body', '$comment_date');";
  echo "</script></head><body></body></html>";
  exit();
}



// GET GROUP MEDIA COMMENTS
$comment = new se_comment('groupmedia', 'groupmedia_id', $groupmedia_info[groupmedia_id]);
$total_comments = $comment->comment_total();
$comments = $comment->comment_list(0, $total_comments);




// CREATE BACK MENU LINK
$back = $database->database_query("SELECT groupmedia_id FROM se_groupmedia WHERE groupmedia_groupalbum_id='$groupmedia_info[groupmedia_groupalbum_id]' AND groupmedia_id<'$groupmedia_info[groupmedia_id]' ORDER BY groupmedia_id DESC LIMIT 1");
if($database->database_num_rows($back) == 1) {
  $back_info = $database->database_fetch_assoc($back);
  $link_back = $url->base."group_album_file.php?group_id=".$group->group_info[group_id]."&groupmedia_id=$back_info[groupmedia_id]";
} else {
  $link_back = "#";
}

// CREATE FIRST MENU LINK
$first = $database->database_query("SELECT groupmedia_id FROM se_groupmedia WHERE groupmedia_groupalbum_id='$groupmedia_info[groupmedia_groupalbum_id]' ORDER BY groupmedia_id ASC LIMIT 1");
if($database->database_num_rows($first) == 1 AND $link_back != "#") {
  $first_info = $database->database_fetch_assoc($first);
  $link_first = $url->base."group_album_file.php?group_id=".$group->group_info[group_id]."&groupmedia_id=$first_info[groupmedia_id]";
} else {
  $link_first = "#";
}

// CREATE NEXT MENU LINK
$next = $database->database_query("SELECT groupmedia_id FROM se_groupmedia WHERE groupmedia_groupalbum_id='$groupmedia_info[groupmedia_groupalbum_id]' AND groupmedia_id>'$groupmedia_info[groupmedia_id]' ORDER BY groupmedia_id ASC LIMIT 1");
if($database->database_num_rows($next) == 1) {
  $next_info = $database->database_fetch_assoc($next);
  $link_next = $url->base."group_album_file.php?group_id=".$group->group_info[group_id]."&groupmedia_id=$next_info[groupmedia_id]";
} else {
  $link_next = "#";
}

// CREATE END MENU LINK
$end = $database->database_query("SELECT groupmedia_id FROM se_groupmedia WHERE groupmedia_groupalbum_id='$groupmedia_info[groupmedia_groupalbum_id]' ORDER BY groupmedia_id DESC LIMIT 1");
if($database->database_num_rows($end) == 1 AND $link_next != "#") {
  $end_info = $database->database_fetch_assoc($end);
  $link_end = $url->base."group_album_file.php?group_id=".$group->group_info[group_id]."&groupmedia_id=$end_info[groupmedia_id]";
} else {
  $link_end = "#";
}



// GET CUSTOM GROUP STYLE IF ALLOWED
if($group->groupowner_level_info[level_group_style] != 0 & $is_group_private == 0) { 
  $groupstyle_info = $database->database_fetch_assoc($database->database_query("SELECT groupstyle_css FROM se_groupstyles WHERE groupstyle_group_id='".$group->group_info[group_id]."' LIMIT 1")); 
  $global_css = $groupstyle_info[groupstyle_css];
}





// ASSIGN VARIABLES AND DISPLAY ALBUM FILE PAGE
$smarty->assign('group', $group);
$smarty->assign('groupmedia_info', $groupmedia_info);
$smarty->assign('comments', $comments);
$smarty->assign('total_comments', $total_comments);
$smarty->assign('allowed_to_comment', $allowed_to_comment);
$smarty->assign('link_first', $link_first);
$smarty->assign('link_back', $link_back);
$smarty->assign('link_next', $link_next);
$smarty->assign('link_end', $link_end);
include "footer.php";
?>