<?
$page = "user_album_update";
include "header.php";

if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }
if(isset($_GET['album_id'])) { $album_id = $_GET['album_id']; } elseif(isset($_POST['album_id'])) { $album_id = $_POST['album_id']; } else { $album_id = 0; }

// ENSURE ALBUMS ARE ENABLED FOR THIS USER
if($user->level_info[level_album_allow] == 0) { header("Location: user_home.php"); exit(); }

// BE SURE ALBUM BELONGS TO THIS USER
$album = $database->database_query("SELECT * FROM se_albums WHERE album_id='$album_id' AND album_user_id='".$user->user_info[user_id]."'");
if($database->database_num_rows($album) != 1) { header("Location: user_album.php"); exit(); }
$album_info = $database->database_fetch_assoc($album);


// SET VARS
$result = 0;
$album = new se_album($user->user_info[user_id]);



// UPDATE FILES IN THIS ALBUM
if($task == "doupdate") {

  // GET TOTAL FILES
  $total_files = $album->album_files($album_info[album_id]);

  // DELETE NECESSARY FILES
  $album->album_media_delete(0, $total_files, "media_id ASC", "(media_album_id='$album_info[album_id]')");

  // UPDATE NECESSARY FILES
  $media_array = $album->album_media_update(0, $total_files, "media_id ASC", "(media_album_id='$album_info[album_id]')");

  // SET ALBUM COVER AND UPDATE DATE
  $newdate = time();
  $album_info[album_cover] = $_POST['album_cover'];
  if(!in_array($album_info[album_cover], $media_array)) { $album_info[album_cover] = $media_array[0]; }
  $database->database_query("UPDATE se_albums SET album_cover='$album_info[album_cover]', album_dateupdated='$new_date' WHERE album_id='$album_id'");

  // UPDATE LAST UPDATE DATE (SAY THAT 10 TIMES FAST)
  $user->user_lastupdate();

  // SHOW SUCCESS MESSAGE
  $result = 1;

}



// SHOW FILES IN THIS ALBUM
$total_files = $album->album_files($album_info[album_id]);
$file_array = $album->album_media_list(0, $total_files, "media_id ASC", "(media_album_id='$album_info[album_id]')");


// ASSIGN VARIABLES AND SHOW UDPATE ALBUMS PAGE
$smarty->assign('result', $result);
$smarty->assign('files', $file_array);
$smarty->assign('files_total', $total_files);
$smarty->assign('album_id', $album_info[album_id]);
$smarty->assign('album_title', $album_info[album_title]);
$smarty->assign('album_views', $album_info[album_views]);
$smarty->assign('album_cover', $album_info[album_cover]);
include "footer.php";
?>