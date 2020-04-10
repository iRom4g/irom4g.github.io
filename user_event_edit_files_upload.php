<?
$page = "user_event_edit_files_upload";
include "header.php";

if(isset($_GET['event_id'])) { $event_id = $_GET['event_id']; } elseif(isset($_POST['event_id'])) { $event_id = $_POST['event_id']; } else { $event_id = 0; }
if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }

// INITIALIZE EVENT OBJECT
$event = new se_event($user->user_info[user_id], $event_id);

if($event->event_exists == 0) { header("Location: user_event.php"); exit(); }
if($event->event_info[event_user_id] != $user->user_info[user_id]) { header("Location: user_event.php"); exit(); }


// GET EVENT ALBUM INFO
$eventalbum_info = $database->database_fetch_assoc($database->database_query("SELECT * FROM se_eventalbums WHERE eventalbum_event_id='".$event->event_info[event_id]."' LIMIT 1"));


// GET TOTAL SPACE USED
$space_used = $event->event_media_space();
$space_left = $event->eventowner_level_info[level_event_album_storage] - $space_used;



// UPLOAD FILES
if($task == "doupload") {
  $file_result = Array();

  // RUN FILE UPLOAD FUNCTION FOR EACH SUBMITTED FILE
  $update_eventalbum = 0;
  $new_eventalbum_cover = "";
  for($f=1;$f<6;$f++) {
    $fileid = "file".$f;
    if($_FILES[$fileid]['name'] != "") {
      $file_result[$fileid] = $event->event_media_upload($fileid, $eventalbum_info[eventalbum_id], $space_left);
      if($file_result[$fileid]['is_error'] == 0) {
  	$file_result[$fileid]['message'] = stripslashes($_FILES[$fileid]['name'])." $user_event_edit_files_upload[23]";
	$new_eventalbum_cover = $file_result[$fileid]['media_id'];
        $update_eventalbum = 1;
      }
    }
  }

  // UPDATE EVENT ALBUM UPDATED DATE AND EVENT ALBUM COVER IF FILE UPLOADED
  if($update_eventalbum == 1) {
    $newdate = time();
    if($eventalbum_info[eventalbum_cover] != 0) { $new_eventalbum_cover = $eventalbum_info[eventalbum_cover]; }
    $database->database_query("UPDATE se_eventalbums SET eventalbum_cover='$new_eventalbum_cover', eventalbum_dateupdated='$newdate' WHERE eventalbum_id='$eventalbum_info[eventalbum_id]'");

    // UPDATE LAST UPDATE DATE (SAY THAT 10 TIMES FAST)
    $event->event_lastupdate();
  }

} // END TASK



// GET MAX FILESIZE ALLOWED
$max_filesize_kb = ($event->eventowner_level_info[level_event_album_maxsize]) / 1024;
$max_filesize_kb = round($max_filesize_kb, 0);

// CONVERT UPDATED SPACE LEFT TO MB
$space_left_mb = ($space_left / 1024) / 1024;
$space_left_mb = round($space_left_mb, 2);


// ASSIGN VARIABLES AND SHOW USER EDIT EVENT PAGE
$smarty->assign('file1_result', $file_result[file1][message]);
$smarty->assign('file2_result', $file_result[file2][message]);
$smarty->assign('file3_result', $file_result[file3][message]);
$smarty->assign('file4_result', $file_result[file4][message]);
$smarty->assign('file5_result', $file_result[file5][message]);
$smarty->assign('event', $event);
$smarty->assign('space_left', $space_left_mb);
$smarty->assign('allowed_exts', str_replace(",", ", ", $event->eventowner_level_info[level_event_album_exts]));
$smarty->assign('max_filesize', $max_filesize_kb);
include "footer.php";
?>