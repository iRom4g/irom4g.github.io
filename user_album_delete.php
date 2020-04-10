<?
$page = "user_album_delete";
include "header.php";

if(isset($_POST['task'])) { $task = $_POST['task']; } else { $task = "main"; }
if(isset($_POST['album_id'])) { $album_id = $_POST['album_id']; } elseif(isset($_GET['album_id'])) { $album_id = $_GET['album_id']; } else { $album_id = 0; }

// ENSURE ALBUMS ARE ENABLED FOR THIS USER
if($user->level_info[level_album_allow] == 0) { header("Location: user_home.php"); exit(); }

// BE SURE ALBUM BELONGS TO THIS USER
$album = $database->database_query("SELECT * FROM se_albums WHERE album_id='$album_id' AND album_user_id='".$user->user_info[user_id]."'");
if($database->database_num_rows($album) != 1) { header("Location: user_album.php"); exit(); }
$album_info = $database->database_fetch_assoc($album);

// DELETE ALBUM
if($task == "dodelete") {

  $album = new se_album($user->user_info[user_id]);
  $album->album_delete($album_info[album_id]);

  // SEND BACK TO ALBUMS PAGE
  header("Location: user_album.php");
  exit();
}


// ASSIGN VARIABLES AND SHOW DELETE ALBUM PAGE
$smarty->assign('album_id', $album_id);
$smarty->assign('album_title', $album_info[album_title]);
include "footer.php";
?>