<?
$page = "event_comments";
include "header.php";

if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }
if(isset($_POST['p'])) { $p = $_POST['p']; } elseif(isset($_GET['p'])) { $p = $_GET['p']; } else { $p = 1; }
if(isset($_POST['event_id'])) { $event_id = $_POST['event_id']; } elseif(isset($_GET['event_id'])) { $event_id = $_GET['event_id']; } else { $event_id = 0; }

// DISPLAY ERROR PAGE IF USER IS NOT LOGGED IN AND ADMIN SETTING REQUIRES REGISTRATION
if($user->user_exists == 0 & $setting[setting_permission_event] == 0) {
  $page = "error";
  $smarty->assign('error_header', $event_comments[20]);
  $smarty->assign('error_message', $event_comments[22]);
  $smarty->assign('error_submit', $event_comments[23]);
  include "footer.php";
}


// INITIALIZE EVENT OBJECT
$event = new se_event($user->user_info[user_id], $event_id);
if($event->event_exists == 0) { header("Location: home.php"); exit(); }

// GET PRIVACY LEVEL
$privacy_level = $event->event_privacy_max($user, $event->eventowner_level_info[level_event_privacy]);
$allowed_privacy = true_privacy($event->event_info[event_privacy], $event->eventowner_level_info[level_event_privacy]);
$is_event_private = 0;
if($privacy_level < $allowed_privacy) { header("Location: event.php?event_id=".$event->event_info[event_id]); exit(); }


// SET VARS
$is_error = 0;
$refresh = 0;
$allowed_to_comment = 1;


// CHECK IF USER IS ALLOWED TO COMMENT
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
    $database->database_query("INSERT INTO se_eventcomments (eventcomment_event_id, eventcomment_authoruser_id, eventcomment_date, eventcomment_body) VALUES ('".$event->event_info[event_id]."', '".$user->user_info[user_id]."', '$comment_date', '$comment_body')");

    // INSERT ACTION IF USER EXISTS
    if($user->user_exists != 0) {
      $commenter = $user->user_info[user_username];
      $comment_body_encoded = $comment_body;
      if(strlen($comment_body_encoded) > 250) { 
        $comment_body_encoded = substr($comment_body_encoded, 0, 240);
        $comment_body_encoded .= "...";
      }
      $comment_body_encoded = htmlspecialchars(str_replace("<br>", " ", $comment_body_encoded));
      $actions->actions_add($user, "eventcomment", Array('[username]', '[id]', '[title]', '[comment]'), Array($commenter, $event->event_info[event_id], $event->event_info[event_title], $comment_body_encoded));
    } else { 
      $commenter = $event_comments[12];
    }

    // GET EVENT CREATOR INFO AND SEND NOTIFICATION IF COMMENTER IS NOT LEADER
    $eventowner_info = $database->database_fetch_assoc($database->database_query("SELECT se_users.user_id, se_users.user_username, se_users.user_email, se_usersettings.usersetting_notify_eventcomment FROM se_users LEFT JOIN se_usersettings ON se_users.user_id=se_usersettings.usersetting_user_id WHERE se_users.user_id='".$event->event_info[event_user_id]."'"));
    if($eventowner_info[usersetting_notify_eventcomment] == 1 & $eventowner_info[user_id] != $user->user_info[user_id]) { 
      send_generic($eventowner_info[user_email], "$setting[setting_email_fromname] <$setting[setting_email_fromemail]>", $setting[setting_email_eventcomment_subject], $setting[setting_email_eventcomment_message], Array('[username]', '[commenter]', '[eventname]', '[link]'), Array($eventowner_info[user_username], $commenter, $event->event_info[event_title], "<a href=\"".$url->url_base."event.php?event_id=".$event->event_info[event_id]."\">".$url->url_base."event.php?event_id=".$event->event_info[event_id]."</a>")); 
    }
  }

  echo "<html><head><script type=\"text/javascript\">";
  echo "window.parent.addComment('$is_error', '$comment_body', '$comment_date');";
  echo "</script></head><body></body></html>";
  exit();
}



// START COMMENT OBJECT
$comment = new se_comment('event', 'event_id', $event->event_info[event_id]);

// GET TOTAL COMMENTS
$total_comments = $comment->comment_total();

// MAKE COMMENT PAGES
$comments_per_page = 10;
$page_vars = make_page($total_comments, $comments_per_page, $p);

// GET EVENT COMMENTS
$comments = $comment->comment_list($page_vars[0], $comments_per_page);


// GET CUSTOM EVENT STYLE IF ALLOWED
if($event->eventowner_level_info[level_event_style] != 0) { 
  $eventstyle_info = $database->database_fetch_assoc($database->database_query("SELECT eventstyle_css FROM se_eventstyles WHERE eventstyle_event_id='".$event->event_info[event_id]."' LIMIT 1")); 
  $global_css = $eventstyle_info[eventstyle_css];
}


// ASSIGN VARIABLES AND INCLUDE FOOTER
$smarty->assign('event', $event);
$smarty->assign('comments', $comments);
$smarty->assign('allowed_to_comment', $allowed_to_comment);
$smarty->assign('p', $page_vars[1]);
$smarty->assign('total_comments', $total_comments);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($comments));
include "footer.php";
?>