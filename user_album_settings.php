<?
$page = "user_album_settings";
include "header.php";

if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }

// ENSURE ALBUMS ARE ENABLED FOR THIS USER
if($user->level_info[level_album_allow] == 0) { header("Location: user_home.php"); exit(); }

// SET VARS
$result = 0;


// SAVE NEW CSS
if($task == "dosave") {
  $style_album = addslashes(strip_tags(htmlspecialchars_decode($_POST['style_album'], ENT_QUOTES)));
  $usersetting_notify_mediacomment = $_POST['usersetting_notify_mediacomment'];


  $database->database_query("UPDATE se_albumstyles SET albumstyle_css='$style_album' WHERE albumstyle_user_id='".$user->user_info[user_id]."'");
  $database->database_query("UPDATE se_usersettings SET usersetting_notify_mediacomment='$usersetting_notify_mediacomment' WHERE usersetting_user_id='".$user->user_info[user_id]."'");
  $user->user_lastupdate();
  $user = new se_user(Array($user->user_info[user_id]));
  $result = 1;
}



// GET THIS USER'S ALBUM CSS
$style_query = $database->database_query("SELECT albumstyle_css FROM se_albumstyles WHERE albumstyle_user_id='".$user->user_info[user_id]."' LIMIT 1");
if($database->database_num_rows($style_query) == 1) { 
  $style_info = $database->database_fetch_assoc($style_query); 
} else {
  $database->database_query("INSERT INTO se_albumstyles (albumstyle_user_id, albumstyle_css) VALUES ('".$user->user_info[user_id]."', '')");
  $style_info = $database->database_fetch_assoc($database->database_query("SELECT albumstyle_css FROM se_albumstyles WHERE albumstyle_user_id='".$user->user_info[user_id]."' LIMIT 1")); 
}


// ASSIGN USER SETTINGS
$user->user_settings();

// ASSIGN SMARTY VARIABLES AND DISPLAY ALBUM STYLE PAGE
$smarty->assign('style_album', htmlspecialchars($style_info[albumstyle_css]));
$smarty->assign('result', $result);
include "footer.php";
?>