<?
$page = "user_event_edit_style";
include "header.php";

if(isset($_POST['event_id'])) { $event_id = $_POST['event_id']; } elseif(isset($_GET['event_id'])) { $event_id = $_GET['event_id']; } else { $event_id = 0; }
if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }

// INITIALIZE EVENT OBJECT
$event = new se_event($user->user_info[user_id], $event_id);

if($event->event_exists == 0) { header("Location: user_event.php"); exit(); }
if($event->event_info[event_user_id] != $user->user_info[user_id]) { header("Location: user_event.php"); exit(); }

// SET EMPTY VARS
$result = 0;

// CHECK IF CUSTOM CSS IS DISABLED BY ADMIN
if($event->eventowner_level_info[level_event_style] != 1) { header("Location: user_event_edit.php?event_id=".$event->event_info[event_id]); exit(); }


// SAVE NEW CSS
if($task == "dosave") {
  $style_event = addslashes(strip_tags(htmlspecialchars_decode($_POST['style_event'], ENT_QUOTES)));
  $database->database_query("UPDATE se_eventstyles SET eventstyle_css='$style_event' WHERE eventstyle_event_id='".$event->event_info[event_id]."'");
  $result = 1;
}


// GET THIS USER'S EVENT CSS
$style_query = $database->database_query("SELECT eventstyle_css FROM se_eventstyles WHERE eventstyle_event_id='".$event->event_info[event_id]."' LIMIT 1");
if($database->database_num_rows($style_query) == 1) { 
  $style_info = $database->database_fetch_assoc($style_query); 
} else {
  $database->database_query("INSERT INTO se_eventstyles (eventstyle_event_id, eventstyle_css) VALUES ('".$event->event_info[event_id]."', '')");
  $style_info = $database->database_fetch_assoc($database->database_query("SELECT eventstyle_css FROM se_eventstyles WHERE eventstyle_event_id='".$event->event_info[event_id]."' LIMIT 1")); 
}

// ASSIGN SMARTY VARIABLES AND DISPLAY EDIT STYLE PAGE
$smarty->assign('event', $event);
$smarty->assign('result', $result);
$smarty->assign('style_event', htmlspecialchars($style_info[eventstyle_css]));
include "footer.php";
?>