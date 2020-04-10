<?
$page = "user_event_settings";
include "header.php";

if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }

// SET VARS
$result = 0;

// SAVE NEW SETTINGS
if($task == "dosave") {
  $usersetting_notify_eventinvite = $_POST['usersetting_notify_eventinvite'];
  $usersetting_notify_eventcomment = $_POST['usersetting_notify_eventcomment'];
  $usersetting_notify_eventmediacomment = $_POST['usersetting_notify_eventmediacomment'];
  $usersetting_notify_eventmemberrequest = $_POST['usersetting_notify_eventmemberrequest'];

  // UPDATE DATABASE
  $database->database_query("UPDATE se_usersettings SET usersetting_notify_eventinvite='$usersetting_notify_eventinvite', usersetting_notify_eventcomment='$usersetting_notify_eventcomment', usersetting_notify_eventmediacomment='$usersetting_notify_eventmediacomment', usersetting_notify_eventmemberrequest='$usersetting_notify_eventmemberrequest' WHERE usersetting_user_id='".$user->user_info[user_id]."'");
  $user = new se_user(Array($user->user_info[user_id]));
  $result = 1;
}

// ASSIGN USER SETTINGS
$user->user_settings();

// ASSIGN VARIABLES AND INCLUDE FOOTER
$smarty->assign('result', $result);
include "footer.php";
?>