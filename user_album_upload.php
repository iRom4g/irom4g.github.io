<?
$page = "user_album_upload";
include "header.php";

if(isset($_POST['task'])) { $task = $_POST['task']; } else { $task = "main"; }
if(isset($_POST['album_id'])) { $album_id = $_POST['album_id']; } elseif(isset($_GET['album_id'])) { $album_id = $_GET['album_id']; } else { $album_id = 0; }

// ENSURE ALBUMS ARE ENABLED FOR THIS USER
if($user->level_info[level_album_allow] == 0) { header("Location: user_home.php"); exit(); }

// BE SURE ALBUM BELONGS TO THIS USER
$album = $database->database_query("SELECT * FROM se_albums WHERE album_id='$album_id' AND album_user_id='".$user->user_info[user_id]."'");
if($database->database_num_rows($album) != 1) { header("Location: user_album.php"); exit(); }
$album_info = $database->database_fetch_assoc($album);

// SET ALBUM
$album = new se_album($user->user_info[user_id]);

// SET RESULT AND ERROR VARS
$result = "";
$error_message = "";

// GET TOTAL SPACE USED
$space_used = $album->album_space();
if($user->level_info[level_album_storage]) {
  $space_left = $user->level_info[level_album_storage] - $space_used;
} else {
  $space_left = ( $dfs=disk_free_space("/") ? $dfs : pow(2, 32) );
} 



// UPLOAD FILES
if($task == "doupload") {
  $file_result = Array();

  // RUN FILE UPLOAD FUNCTION FOR EACH SUBMITTED FILE
  $update_album = 0;
  $new_album_cover = "";
  for($f=1;$f<6;$f++) {
    $fileid = "file".$f;
    if($_FILES[$fileid]['name'] != "") {
      $file_result[$fileid] = $album->album_media_upload($fileid, $album_id, $space_left);
      if($file_result[$fileid]['is_error'] == 0) {
  	$file_result[$fileid]['message'] = stripslashes($_FILES[$fileid]['name'])." $user_album_upload[1]";
	$new_album_cover = $file_result[$fileid]['media_id'];
        $update_album = 1;
      }
    }
  }

  // UPDATE ALBUM UPDATED DATE AND ALBUM COVER IF FILE UPLOADED
  if($update_album == 1) {
    $newdate = time();
    if($album_info[album_cover] != 0) { $new_album_cover = $album_info[album_cover]; }
    $database->database_query("UPDATE se_albums SET album_cover='$new_album_cover', album_dateupdated='$newdate' WHERE album_id='$album_id'");

    // UPDATE LAST UPDATE DATE (SAY THAT 10 TIMES FAST)
    $user->user_lastupdate();

    // INSERT ACTION
    $album_title = $album_info[album_title];
    if(strlen($album_title) > 100) { $album_title = substr($album_title, 0, 97); $album_title .= "..."; }
    $actions->actions_add($user, "newmedia", Array('[username]', '[id]', '[title]'), Array($user->user_info[user_username], $album_id, $album_title));

  }

} // END TASK



// FIND OUT IF ALBUM WAS JUST CREATED
if(isset($_GET['new_album']) AND $_GET['new_album'] == 1) { $new_album = 1; } else { $new_album = 0; }

// GET MAX FILESIZE ALLOWED
$max_filesize_kb = ($user->level_info[level_album_maxsize]) / 1024;
$max_filesize_kb = round($max_filesize_kb, 0);

// CONVERT UPDATED SPACE LEFT TO MB
$space_left_mb = ($space_left / 1024) / 1024;
$space_left_mb = round($space_left_mb, 2);


// ASSIGN VARIABLES AND SHOW UPLOAD FILES PAGE
$smarty->assign('new_album', $new_album);
$smarty->assign('file1_result', $file_result[file1][message]);
$smarty->assign('file2_result', $file_result[file2][message]);
$smarty->assign('file3_result', $file_result[file3][message]);
$smarty->assign('file4_result', $file_result[file4][message]);
$smarty->assign('file5_result', $file_result[file5][message]);
$smarty->assign('album_id', $album_id);
$smarty->assign('album_title', $album_info[album_title]);
$smarty->assign('space_left', $space_left_mb);
$smarty->assign('allowed_exts', str_replace(",", ", ", $user->level_info[level_album_exts]));
$smarty->assign('max_filesize', $max_filesize_kb);
include "footer.php";
?>