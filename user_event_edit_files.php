<?
$page = "user_event_edit_files";
include "header.php";

if(isset($_GET['event_id'])) { $event_id = $_GET['event_id']; } elseif(isset($_POST['event_id'])) { $event_id = $_POST['event_id']; } else { $event_id = 0; }
if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }

// INITIALIZE EVENT OBJECT
$event = new se_event($user->user_info[user_id], $event_id);

if($event->event_exists == 0) { header("Location: user_event.php"); exit(); }
if($event->event_info[event_user_id] != $user->user_info[user_id]) { header("Location: user_event.php"); exit(); }


// GET EVENT ALBUM INFO
$eventalbum_info = $database->database_fetch_assoc($database->database_query("SELECT * FROM se_eventalbums WHERE eventalbum_event_id='".$event->event_info[event_id]."' LIMIT 1"));





// UPDATE FILES IN THIS EVENT ALBUM
if($task == "doupdate") {

  // GET TOTAL FILES
  $total_files = $event->event_media_total($eventalbum_info[eventalbum_id]);

  // DELETE NECESSARY FILES
  $event->event_media_delete(0, $total_files, "eventmedia_id ASC", "(eventmedia_eventalbum_id='$eventalbum_info[eventalbum_id]')");

  // UPDATE NECESSARY FILES
  $media_array = $event->event_media_update(0, $total_files, "eventmedia_id ASC", "(eventmedia_eventalbum_id='$eventalbum_info[eventalbum_id]')");

  // SET ALBUM COVER AND UPDATE DATE
  $newdate = time();
  $eventalbum_info[eventalbum_cover] = $_POST['eventalbum_cover'];
  if(!in_array($eventalbum_info[eventalbum_cover], $media_array)) { $eventalbum_info[eventalbum_cover] = $media_array[0]; }
  $database->database_query("UPDATE se_eventalbums SET eventalbum_cover='$eventalbum_info[eventalbum_cover]', eventalbum_dateupdated='$new_date' WHERE eventalbum_id='$eventalbum_info[eventalbum_id]'");

  // UPDATE LAST UPDATE DATE (SAY THAT 10 TIMES FAST)
  $event->event_lastupdate();

  // SHOW SUCCESS MESSAGE
  $result = 1;

}






// SHOW FILES IN THIS ALBUM
$total_files = $event->event_media_total($eventalbum_info[eventalbum_id]);
$file_array = $event->event_media_list(0, $total_files, "eventmedia_id ASC", "(eventmedia_eventalbum_id='$eventalbum_info[eventalbum_id]')");





// ASSIGN VARIABLES AND SHOW USER EDIT EVENT PHOTO PAGE
$smarty->assign('event', $event);
$smarty->assign('result', $result);
$smarty->assign('files', $file_array);
$smarty->assign('files_total', $total_files);
$smarty->assign('eventalbum_id', $eventalbum_info[eventalbum_id]);
include "footer.php";
?>