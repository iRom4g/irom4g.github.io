<?
$page = "user_album_edit";
include "header.php";

if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }
if(isset($_GET['album_id'])) { $album_id = $_GET['album_id']; } elseif(isset($_POST['album_id'])) { $album_id = $_POST['album_id']; } else { exit(); }

// ENSURE ALBUMS ARE ENABLED FOR THIS USER
if($user->level_info[level_album_allow] == 0) { header("Location: user_home.php"); exit(); }

// BE SURE ALBUM BELONGS TO THIS USER
$album = $database->database_query("SELECT * FROM se_albums WHERE album_id='$album_id' AND album_user_id='".$user->user_info[user_id]."'");
if($database->database_num_rows($album) != 1) { header("Location: user_album.php"); exit(); }
$album_info = $database->database_fetch_assoc($album);

// SET VARIABLES
$result = 0;
$is_error = 0;

// SAVE NEW INFO
if($task == "dosave") {
  $album_title = censor($_POST['album_title']);
  $album_desc = censor(str_replace("\r\n", "<br>", $_POST['album_desc']));
  $album_search = $_POST['album_search'];
  $album_privacy = $_POST['album_privacy'];
  $album_comments = $_POST['album_comments'];
  $album_dateupdated = time();

  // CHECK THAT TITLE IS NOT BLANK
  if(trim($album_title == "")) { $is_error = 1; }

  // CHECK THAT PRIVACY IS NOT BLANK
  if($album_privacy == "") { $album_privacy = true_privacy(0, $user->level_info[level_album_privacy]); }
  if($album_comments == "") { $album_comments = true_privacy(0, $user->level_info[level_album_comments]); }

  // IF NO ERROR, CONTINUE
  if($is_error == 0) {
    // EDIT ALBUM IN DATABASE
    $database->database_query("UPDATE se_albums SET album_title='$album_title',
				    album_desc='$album_desc',
				    album_search='$album_search',
				    album_privacy='$album_privacy',
				    album_comments='$album_comments',
				    album_dateupdated='$album_dateupdated' WHERE album_id='$album_id'");

    // UPDATE LAST UPDATE DATE (SAY THAT 10 TIMES FAST)
    $user->user_lastupdate();

    $result = 1;
    $album_info = $database->database_fetch_assoc($database->database_query("SELECT * FROM se_albums WHERE album_id='$album_id' AND album_user_id='".$user->user_info[user_id]."'"));
  }
}




// GET AVAILABLE ALBUM PRIVACY OPTIONS
$privacy_options = Array();
for($p=0;$p<strlen($user->level_info[level_album_privacy]);$p++) {
  $privacy_level = substr($user->level_info[level_album_privacy], $p, 1);
  if(user_privacy_levels($privacy_level) != "") {
    $privacy_options[] = Array('privacy_id' => "album_privacy".$privacy_level,
				'privacy_value' => $privacy_level,
				'privacy_option' => user_privacy_levels($privacy_level));
  }
}


// GET AVAILABLE ALBUM COMMENT OPTIONS
$comment_options = Array();
for($p=0;$p<strlen($user->level_info[level_album_comments]);$p++) {
  $comment_level = substr($user->level_info[level_album_comments], $p, 1);
  if(user_privacy_levels($comment_level) != "") {
    $comment_options[] = Array('comment_id' => "album_comment".$comment_level,
				'comment_value' => $comment_level,
				'comment_option' => user_privacy_levels($comment_level));
  }
}


// ASSIGN VARIABLES AND SHOW EDIT ALBUMS PAGE
$smarty->assign('result', $result);
$smarty->assign('is_error', $is_error);
$smarty->assign('album_title', $album_info[album_title]);
$smarty->assign('album_desc', str_replace("<br>", "\r\n", $album_info[album_desc]));
$smarty->assign('album_search', $album_info[album_search]);
$smarty->assign('album_privacy', true_privacy($album_info[album_privacy], $user->level_info[level_album_privacy]));
$smarty->assign('album_comments', true_privacy($album_info[album_comments], $user->level_info[level_album_comments]));
$smarty->assign('album_id', $album_id);
$smarty->assign('privacy_options', $privacy_options);
$smarty->assign('comment_options', $comment_options);
include "footer.php";
?>