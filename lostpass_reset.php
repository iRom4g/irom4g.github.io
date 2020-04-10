<?
$page = "lostpass_reset";
include "header.php";

if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }
if(isset($_POST['r'])) { $r = $_POST['r']; } elseif(isset($_GET['r'])) { $r = $_GET['r']; } else { $r = ""; }


// DISPLAY PASSWORD REQUEST FORM
$submitted = 0;
$valid = 0;
$is_error = 0;
$error_message = "";

// ASSIGN USER SETTINGS
$owner->user_settings();

// CHECK VALIDITY OF OWNER
if($owner->user_exists == 0) {
  $is_error = 1;
} elseif($owner->usersetting_info[usersetting_lostpassword_code] != $r | str_replace(" ", "", $owner->usersetting_info[usersetting_lostpassword_code]) == "") {
  $is_error = 1;
} elseif($owner->usersetting_info[usersetting_lostpassword_time] < (time()-86400)) {
  $is_error = 1;
} else {
  $valid = 1;
}


if($task == "reset" & $valid == 1) {

  $user_password = $_POST['user_password'];
  $user_password2 = $_POST['user_password2'];
  $submitted = 1;
  
  // CHECK PASSWORD
  $owner->user_password('', $user_password, $user_password, 0);
  $is_error = $owner->is_error;
  $error_message = $owner->error_message;

  
  // IF THERE WAS NO ERROR, SAVE CHANGES
  if($is_error == 0) {

    // ENCRYPT NEW PASSWORD WITH MD5
    $password_new_crypt = crypt($user_password, $owner->user_salt);

    // SAVE NEW PASSWORD
    $database->database_query("UPDATE se_users SET user_password='$password_new_crypt' WHERE user_id='".$owner->user_info[user_id]."' LIMIT 1");
    $database->database_query("UPDATE se_usersettings SET usersetting_lostpassword_code='', usersetting_lostpassword_time='0' WHERE usersetting_user_id='".$owner->user_info[user_id]."' LIMIT 1");

  } else {
    $submitted = 0;
  }



}




// ASSIGN VARIABLES AND INCLUDE FOOTER
$smarty->assign('submitted', $submitted);
$smarty->assign('valid', $valid);
$smarty->assign('is_error', $is_error);
$smarty->assign('error_message', $error_message);
$smarty->assign('r', $r);
include "footer.php";
?>