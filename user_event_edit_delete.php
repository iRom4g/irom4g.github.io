<?
$page = "user_event_edit_delete";
include "header.php";

if(isset($_GET['task'])) { $task = $_GET['task']; } elseif(isset($_POST['task'])) { $task = $_POST['task']; } else { $task = "main"; }
if(isset($_GET['event_id'])) { $event_id = $_GET['event_id']; } elseif(isset($_POST['event_id'])) { $event_id = $_POST['event_id']; } else { $event_id = 0; }

// INITIALIZE EVENT OBJECT
$event = new se_event($user->user_info[user_id], $event_id);

if($event->event_exists == 0) { header("Location: user_event.php"); exit(); }
if($event->event_info[event_user_id] != $user->user_info[user_id]) { header("Location: user_event.php"); exit(); }




if($task == "dodelete") {
  $event->event_delete($event->event_info[event_id]);
  header("Location: user_event.php");
  exit();
}






// ASSIGN VARIABLES AND SHOW DELETE EVENTS PAGE
$smarty->assign('event', $event);
include "footer.php";
?>