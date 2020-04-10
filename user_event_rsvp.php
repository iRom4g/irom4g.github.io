<?
$page = "user_event_rsvp";
include "header.php";

if(isset($_POST['event_id'])) { $event_id = $_POST['event_id']; } elseif(isset($_GET['event_id'])) { $event_id = $_GET['event_id']; } else { $event_id = 0; }
if(isset($_POST['return_url'])) { $return_url = $_POST['return_url']; } elseif(isset($_GET['return_url'])) { $return_url = $_GET['return_url']; } else { $return_url = $url->url_base."user_event.php"; }
if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }

// SET EMPTY VARS
$is_error = 0;
$is_result = 0;
$result = "";

// INITIALIZE EVENT OBJECT
$event = new se_event($user->user_info[user_id], $event_id);
if($event->event_exists == 0) { header("Location: user_event.php"); exit(); }

// JOIN EVENT, NO INVITE OR MODIFY RSVP
if($task == "dorsvp") {
  $rsvp_response = (int)$_POST['rsvp_response'];
  if($rsvp_response < 0 || $rsvp_response > 3) { $rsvp_response = 0; }
  if($rsvp_response == 0) { $is_error = 1; }

  // ENSURE USER IS ALLOWED TO DO THIS
  if($is_error == 0 && ($event->is_member == 1 || ($event->is_member == 0 && $event->event_info[event_inviteonly] == 0))) {

    // IF USER IS NOT A MEMBER
    if($event->is_member == 0) {
      $database->database_query("INSERT INTO se_eventmembers (eventmember_user_id, eventmember_event_id, eventmember_status) VALUES ('".$user->user_info[user_id]."', '".$event->event_info[event_id]."', '$rsvp_response')");
    } else {
      $database->database_query("UPDATE se_eventmembers SET eventmember_status='$rsvp_response' WHERE eventmember_user_id='".$user->user_info[user_id]."' AND eventmember_event_id='".$event->event_info[event_id]."'");
    }

    // INSERT ACTION IF ATTENDING
    if($rsvp_response == 1) {
      $event_title_short = $event->event_info[event_title];
      if(strlen($event_title_short) > 100) { $event_title_short = substr($event_title_short, 0, 97); $event_title_short .= "..."; }
      $actions->actions_add($user, "attendevent", Array('[username]', '[id]', '[title]'), Array($user->user_info[user_username], $event->event_info[event_id], $event_title_short));
    }

    // SET RESULT VARS
    $is_result = 1;
    $result = $user_event_rsvp[3];
  }
}


// REQUEST INVITATION
if($task == "dorequest") {
  // INSERT ROW AND SET RESULT VARS IF ALLOWED
  if($event->event_info[event_inviteonly] == 1 && $event->is_member == 0) {
    $database->database_query("INSERT INTO se_eventmembers (eventmember_user_id, eventmember_event_id, eventmember_status) VALUES ('".$user->user_info[user_id]."', '".$event->event_info[event_id]."', '-1')");
    $eventowner_info = $database->database_fetch_assoc($database->database_query("SELECT se_users.user_id, se_users.user_username, se_users.user_email, se_usersettings.usersetting_notify_eventmemberrequest FROM se_users LEFT JOIN se_usersettings ON se_users.user_id=se_usersettings.usersetting_user_id WHERE se_users.user_id='".$event->event_info[event_user_id]."'"));
    if($eventowner_info[usersetting_notify_eventmemberrequest] == 1) { send_generic($eventowner_info[user_email], "$setting[setting_email_fromname] <$setting[setting_email_fromemail]>", $setting[setting_email_eventmemberrequest_subject], $setting[setting_email_eventmemberrequest_message], Array('[username]', '[requester]', '[eventname]', '[link]'), Array($eventowner_info[user_username], $user->user_info[user_username], $event->event_info[event_title], "<a href=\"".$url->url_base."login.php\">".$url->url_base."login.php</a>")); }
    $is_result = 1;
    $result = $user_event_rsvp[12];
  }
}




// ASSIGN SMARTY VARIABLES AND DISPLAY JOIN EVENTS PAGE
$smarty->assign('event', $event);
$smarty->assign('return_url', $return_url);
$smarty->assign('is_result', $is_result);
$smarty->assign('result', $result);
$smarty->assign('is_error', $is_error);
include "footer.php";
?>