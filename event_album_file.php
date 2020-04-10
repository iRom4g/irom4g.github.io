<?
$page = "event_album_file";
include "header.php";

// MAKE SURE MEDIA VARS ARE SET IN URL
if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }
if(isset($_POST['eventmedia_id'])) { $eventmedia_id = $_POST['eventmedia_id']; } elseif(isset($_GET['eventmedia_id'])) { $eventmedia_id = $_GET['eventmedia_id']; } else { $eventmedia_id = 0; }
if(isset($_POST['event_id'])) { $event_id = $_POST['event_id']; } elseif(isset($_GET['event_id'])) { $event_id = $_GET['event_id']; } else { $event_id = 0; }

// DISPLAY ERROR PAGE IF USER IS NOT LOGGED IN AND ADMIN SETTING REQUIRES REGISTRATION
if($user->user_exists == 0 & $setting[setting_permission_event] == 0) {
  $smarty->assign('error_header', $event_album_file[15]);
  $smarty->assign('error_message', $event_album_file[17]);
  $smarty->assign('error_submit', $event_album_file[25]);
  $smarty->display("error.tpl");
  exit();
}


// INITIALIZE EVENT OBJECT
$event = new se_event($user->user_info[user_id], $event_id);
if($event->event_exists == 0) { header("Location: home.php"); exit(); }

// GET EVENT ALBUM INFO
$eventalbum_info = $database->database_fetch_assoc($database->database_query("SELECT * FROM se_eventalbums WHERE eventalbum_event_id='".$event->event_info[event_id]."' LIMIT 1"));


// MAKE SURE MEDIA EXISTS
$eventmedia_query = $database->database_query("SELECT * FROM se_eventmedia WHERE eventmedia_id='$eventmedia_id' AND eventmedia_eventalbum_id='$eventalbum_info[eventalbum_id]' LIMIT 1");
if($database->database_num_rows($eventmedia_query) != 1) { header("Location: event.php?event_id=".$event->event_info[event_id]); exit(); }
$eventmedia_info = $database->database_fetch_assoc($eventmedia_query);

// GET PRIVACY LEVEL
$privacy_level = $event->event_privacy_max($user, $event->eventowner_level_info[level_event_privacy]);
$allowed_privacy = true_privacy($event->event_info[event_privacy], $event->eventowner_level_info[level_event_privacy]);
$is_event_private = 0;
if($privacy_level < $allowed_privacy) { header("Location: event.php?event_id=".$event->event_info[event_id]); exit(); }


// UPDATE ALBUM VIEWS
$eventalbum_views_new = $eventalbum_info[eventalbum_views] + 1;
$database->database_query("UPDATE se_eventalbums SET eventalbum_views='$eventalbum_views_new' WHERE eventalbum_id='$eventalbum_info[eventalbum_id]' LIMIT 1");

// CHECK IF USER IS ALLOWED TO COMMENT
$allowed_to_comment = 1;
$comment_level = $event->event_privacy_max($user, $event->eventowner_level_info[level_event_comments]);
$allowed_comment = true_privacy($event->event_info[event_comments], $event->eventowner_level_info[level_event_comments]);
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
    $database->database_query("INSERT INTO se_eventmediacomments (eventmediacomment_eventmedia_id, eventmediacomment_authoruser_id, eventmediacomment_date, eventmediacomment_body) VALUES ('$eventmedia_info[eventmedia_id]', '".$user->user_info[user_id]."', '$comment_date', '$comment_body')");

    // INSERT ACTION IF USER EXISTS
    if($user->user_exists != 0) {
      $commenter = $user->user_info[user_username];
      $comment_body_encoded = $comment_body;
      if(strlen($comment_body_encoded) > 250) { 
        $comment_body_encoded = substr($comment_body_encoded, 0, 240);
        $comment_body_encoded .= "...";
      }
      $comment_body_encoded = htmlspecialchars(str_replace("<br>", " ", $comment_body_encoded));
      $actions->actions_add($user, "eventmediacomment", Array('[username]', '[id]', '[id2]', '[title]', '[comment]'), Array($commenter, $event->event_info[event_id], $eventmedia_info[eventmedia_id], $event->event_info[event_title], $comment_body_encoded));
    } else { 
      $commenter = $event_album_file[14];
    }

    // SEND COMMENT NOTIFICATION IF NECESSARY
    $eventowner_info = $database->database_fetch_assoc($database->database_query("SELECT se_users.user_id, se_users.user_username, se_users.user_email, se_usersettings.usersetting_notify_eventmediacomment FROM se_users LEFT JOIN se_usersettings ON se_users.user_id=se_usersettings.usersetting_user_id WHERE se_users.user_id='".$event->event_info[event_user_id]."'"));
    if($eventowner_info[usersetting_notify_eventmediacomment] == 1 & $eventowner_info[user_id] != $user->user_info[user_id]) { 
      send_generic($eventowner_info[user_email], "$setting[setting_email_fromname] <$setting[setting_email_fromemail]>", $setting[setting_email_eventmediacomment_subject], $setting[setting_email_eventmediacomment_message], Array('[username]', '[commenter]', '[eventname]', '[link]'), Array($eventowner_info[user_username], $commenter, $event->event_info[event_title], "<a href=\"".$url->url_base."event_album_file.php?event_id=".$event->event_info[event_id]."&eventmedia_id=$eventmedia_info[eventmedia_id]\">".$url->url_base."event_album_file.php?event_id=".$event->event_info[event_id]."&eventmedia_id=$eventmedia_info[eventmedia_id]</a>")); 
    }
  }

  echo "<html><head><script type=\"text/javascript\">";
  echo "window.parent.addComment('$is_error', '$comment_body', '$comment_date');";
  echo "</script></head><body></body></html>";
  exit();
}



// GET EVENT MEDIA COMMENTS
$comment = new se_comment('eventmedia', 'eventmedia_id', $eventmedia_info[eventmedia_id]);
$total_comments = $comment->comment_total();
$comments = $comment->comment_list(0, $total_comments);




// CREATE BACK MENU LINK
$back = $database->database_query("SELECT eventmedia_id FROM se_eventmedia WHERE eventmedia_eventalbum_id='$eventmedia_info[eventmedia_eventalbum_id]' AND eventmedia_id<'$eventmedia_info[eventmedia_id]' ORDER BY eventmedia_id DESC LIMIT 1");
if($database->database_num_rows($back) == 1) {
  $back_info = $database->database_fetch_assoc($back);
  $link_back = $url->base."event_album_file.php?event_id=".$event->event_info[event_id]."&eventmedia_id=$back_info[eventmedia_id]";
} else {
  $link_back = "#";
}

// CREATE FIRST MENU LINK
$first = $database->database_query("SELECT eventmedia_id FROM se_eventmedia WHERE eventmedia_eventalbum_id='$eventmedia_info[eventmedia_eventalbum_id]' ORDER BY eventmedia_id ASC LIMIT 1");
if($database->database_num_rows($first) == 1 AND $link_back != "#") {
  $first_info = $database->database_fetch_assoc($first);
  $link_first = $url->base."event_album_file.php?event_id=".$event->event_info[event_id]."&eventmedia_id=$first_info[eventmedia_id]";
} else {
  $link_first = "#";
}

// CREATE NEXT MENU LINK
$next = $database->database_query("SELECT eventmedia_id FROM se_eventmedia WHERE eventmedia_eventalbum_id='$eventmedia_info[eventmedia_eventalbum_id]' AND eventmedia_id>'$eventmedia_info[eventmedia_id]' ORDER BY eventmedia_id ASC LIMIT 1");
if($database->database_num_rows($next) == 1) {
  $next_info = $database->database_fetch_assoc($next);
  $link_next = $url->base."event_album_file.php?event_id=".$event->event_info[event_id]."&eventmedia_id=$next_info[eventmedia_id]";
} else {
  $link_next = "#";
}

// CREATE END MENU LINK
$end = $database->database_query("SELECT eventmedia_id FROM se_eventmedia WHERE eventmedia_eventalbum_id='$eventmedia_info[eventmedia_eventalbum_id]' ORDER BY eventmedia_id DESC LIMIT 1");
if($database->database_num_rows($end) == 1 AND $link_next != "#") {
  $end_info = $database->database_fetch_assoc($end);
  $link_end = $url->base."event_album_file.php?event_id=".$event->event_info[event_id]."&eventmedia_id=$end_info[eventmedia_id]";
} else {
  $link_end = "#";
}



// GET CUSTOM EVENT STYLE IF ALLOWED
if($event->eventowner_level_info[level_event_style] != 0 & $is_event_private == 0) { 
  $eventstyle_info = $database->database_fetch_assoc($database->database_query("SELECT eventstyle_css FROM se_eventstyles WHERE eventstyle_event_id='".$event->event_info[event_id]."' LIMIT 1")); 
  $global_css = $eventstyle_info[eventstyle_css];
}





// ASSIGN VARIABLES AND DISPLAY ALBUM FILE PAGE
$smarty->assign('event', $event);
$smarty->assign('eventmedia_info', $eventmedia_info);
$smarty->assign('comments', $comments);
$smarty->assign('total_comments', $total_comments);
$smarty->assign('allowed_to_comment', $allowed_to_comment);
$smarty->assign('link_first', $link_first);
$smarty->assign('link_back', $link_back);
$smarty->assign('link_next', $link_next);
$smarty->assign('link_end', $link_end);
include "footer.php";
?>