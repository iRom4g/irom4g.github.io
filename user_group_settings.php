<?
$page = "user_group_settings";
include "header.php";

if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }

// SET VARS
$result = 0;

// SAVE NEW SETTINGS
if($task == "dosave") {
  $usersetting_notify_groupinvite = $_POST['usersetting_notify_groupinvite'];
  $usersetting_notify_groupcomment = $_POST['usersetting_notify_groupcomment'];
  $usersetting_notify_groupmediacomment = $_POST['usersetting_notify_groupmediacomment'];
  $usersetting_notify_groupmemberrequest = $_POST['usersetting_notify_groupmemberrequest'];

  // UPDATE DATABASE
  $database->database_query("UPDATE se_usersettings SET usersetting_notify_groupinvite='$usersetting_notify_groupinvite', usersetting_notify_groupcomment='$usersetting_notify_groupcomment', usersetting_notify_groupmediacomment='$usersetting_notify_groupmediacomment', usersetting_notify_groupmemberrequest='$usersetting_notify_groupmemberrequest' WHERE usersetting_user_id='".$user->user_info[user_id]."'");
  $user = new se_user(Array($user->user_info[user_id]));
  $result = 1;
}

// ASSIGN USER SETTINGS
$user->user_settings();

// ASSIGN VARIABLES AND INCLUDE FOOTER
$smarty->assign('result', $result);
include "footer.php";
?>