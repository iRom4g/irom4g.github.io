<?
$page = "user_friends_settings";
include "header.php";

if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }

// ENSURE CONECTIONS ARE ALLOWED FOR THIS USER
if($setting[setting_connection_allow] == 0) { header("Location: user_home.php"); exit(); }

// SET VARS
$result = 0;

// SAVE NEW SETTINGS
if($task == "dosave") {
  $usersetting_notify_friendrequest = $_POST['usersetting_notify_friendrequest'];

  // UPDATE DATABASE
  $database->database_query("UPDATE se_usersettings SET usersetting_notify_friendrequest='$usersetting_notify_friendrequest' WHERE usersetting_user_id='".$user->user_info[user_id]."'");
  $user->user_lastupdate();
  $user = new se_user(Array($user->user_info[user_id]));
  $result = 1;
}

// ASSIGN USER SETTINGS
$user->user_settings();

// ASSIGN VARIABLES AND INCLUDE FOOTER
$smarty->assign('result', $result);
include "footer.php";
?>