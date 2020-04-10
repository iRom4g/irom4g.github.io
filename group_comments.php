<?
$page = "group_comments";
include "header.php";

if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }
if(isset($_POST['p'])) { $p = $_POST['p']; } elseif(isset($_GET['p'])) { $p = $_GET['p']; } else { $p = 1; }
if(isset($_POST['group_id'])) { $group_id = $_POST['group_id']; } elseif(isset($_GET['group_id'])) { $group_id = $_GET['group_id']; } else { $group_id = 0; }

// DISPLAY ERROR PAGE IF USER IS NOT LOGGED IN AND ADMIN SETTING REQUIRES REGISTRATION
if($user->user_exists == 0 & $setting[setting_permission_group] == 0) {
  $page = "error";
  $smarty->assign('error_header', $group_comments[20]);
  $smarty->assign('error_message', $group_comments[22]);
  $smarty->assign('error_submit', $group_comments[23]);
  include "footer.php";
}


// INITIALIZE GROUP OBJECT
$group = new se_group($user->user_info[user_id], $group_id);
if($group->group_exists == 0) { header("Location: home.php"); exit(); }

// GET PRIVACY LEVEL
$privacy_level = $group->group_privacy_max($user, $group->groupowner_level_info[level_profile_privacy]);
$allowed_privacy = true_privacy($group->group_info[group_privacy], $group->groupowner_level_info[level_profile_privacy]);
$is_group_private = 0;
if($privacy_level < $allowed_privacy) { header("Location: group.php?group_id=".$group->group_info[group_id]); exit(); }


// SET VARS
$is_error = 0;
$refresh = 0;
$allowed_to_comment = 1;


// CHECK IF USER IS ALLOWED TO COMMENT
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
    $database->database_query("INSERT INTO se_groupcomments (groupcomment_group_id, groupcomment_authoruser_id, groupcomment_date, groupcomment_body) VALUES ('".$group->group_info[group_id]."', '".$user->user_info[user_id]."', '$comment_date', '$comment_body')");

    // INSERT ACTION IF USER EXISTS
    if($user->user_exists != 0) {
      $commenter = $user->user_info[user_username];
      $comment_body_encoded = $comment_body;
      if(strlen($comment_body_encoded) > 250) { 
        $comment_body_encoded = substr($comment_body_encoded, 0, 240);
        $comment_body_encoded .= "...";
      }
      $comment_body_encoded = htmlspecialchars(str_replace("<br>", " ", $comment_body_encoded));
      $actions->actions_add($user, "groupcomment", Array('[username]', '[id]', '[title]', '[comment]'), Array($commenter, $group->group_info[group_id], $group->group_info[group_title], $comment_body_encoded));
    } else { 
      $commenter = $group_comments[12];
    }

    // GET GROUP LEADER INFO AND SEND NOTIFICATION IF COMMENTER IS NOT LEADER
    $groupowner_info = $database->database_fetch_assoc($database->database_query("SELECT se_users.user_id, se_users.user_username, se_users.user_email, se_usersettings.usersetting_notify_groupcomment FROM se_users LEFT JOIN se_usersettings ON se_users.user_id=se_usersettings.usersetting_user_id WHERE se_users.user_id='".$group->group_info[group_user_id]."'"));
    if($groupowner_info[usersetting_notify_groupcomment] == 1 & $groupowner_info[user_id] != $user->user_info[user_id]) { 
      send_generic($groupowner_info[user_email], "$setting[setting_email_fromname] <$setting[setting_email_fromemail]>", $setting[setting_email_groupcomment_subject], $setting[setting_email_groupcomment_message], Array('[username]', '[commenter]', '[groupname]', '[link]'), Array($groupowner_info[user_username], $commenter, $group->group_info[group_title], "<a href=\"".$url->url_base."group.php?group_id=".$group->group_info[group_id]."\">".$url->url_base."group.php?group_id=".$group->group_info[group_id]."</a>")); 
    }
  }

  echo "<html><head><script type=\"text/javascript\">";
  echo "window.parent.addComment('$is_error', '$comment_body', '$comment_date');";
  echo "</script></head><body></body></html>";
  exit();
}



// START COMMENT OBJECT
$comment = new se_comment('group', 'group_id', $group->group_info[group_id]);

// GET TOTAL COMMENTS
$total_comments = $comment->comment_total();

// MAKE COMMENT PAGES
$comments_per_page = 10;
$page_vars = make_page($total_comments, $comments_per_page, $p);

// GET GROUP COMMENTS
$comments = $comment->comment_list($page_vars[0], $comments_per_page);


// GET CUSTOM GROUP STYLE IF ALLOWED
if($group->groupowner_level_info[level_group_style] != 0) { 
  $groupstyle_info = $database->database_fetch_assoc($database->database_query("SELECT groupstyle_css FROM se_groupstyles WHERE groupstyle_group_id='".$group->group_info[group_id]."' LIMIT 1")); 
  $global_css = $groupstyle_info[groupstyle_css];
}


// ASSIGN VARIABLES AND INCLUDE FOOTER
$smarty->assign('group', $group);
$smarty->assign('comments', $comments);
$smarty->assign('allowed_to_comment', $allowed_to_comment);
$smarty->assign('p', $page_vars[1]);
$smarty->assign('total_comments', $total_comments);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($comments));
include "footer.php";
?>