<?
$page = "user_event_remove";
include "header.php";

if(isset($_POST['event_id'])) { $event_id = $_POST['event_id']; } elseif(isset($_GET['event_id'])) { $event_id = $_GET['event_id']; } else { $event_id = 0; }
if(isset($_POST['return_url'])) { $return_url = $_POST['return_url']; } elseif(isset($_GET['return_url'])) { $return_url = $_GET['return_url']; } else { $return_url = $url->url_base."user_event.php"; }
if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }

// INITIALIZE EVENT OBJECT
$event = new se_event($user->user_info[user_id], $event_id);

if($event->event_exists == 0) { header("Location: user_event.php"); exit(); }
if($event->is_member == 0) { header("Location: user_event.php"); exit(); }

// CANCEL
if($task == "cancel") {
  header("Location: $return_url"); 
  exit();
}


// REMOVE USER FROM THIS EVENT
if($task == "doleave") {
  $database->database_query("DELETE FROM se_eventmembers WHERE eventmember_event_id='".$event->event_info[event_id]."' AND eventmember_user_id='".$user->user_info[user_id]."' LIMIT 1");

  // IF USER IS OWNER OF EVENT, DELETE THE EVENT
  if($event->event_info[event_user_id] == $user->user_info[user_id]) { $event->event_delete(); }

  // RETURN TO EVENT PAGE
  header("Location: $return_url"); 
  exit();
}


// ASSIGN SMARTY VARIABLES AND DISPLAY REMOVE EVENTS PAGE
$smarty->assign('event', $event);
$smarty->assign('return_url', $return_url);
include "footer.php";
?>