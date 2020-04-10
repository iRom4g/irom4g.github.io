<?
$page = "invite";
include "header.php";

// DISPLAY ERROR PAGE IF USER IS NOT LOGGED IN AND ADMIN SETTING REQUIRES REGISTRATION
if($user->user_exists == 0 & $setting[setting_permission_invite] == 0) {
  $page = "error";
  $smarty->assign('error_header', $invite[13]);
  $smarty->assign('error_message', $invite[12]);
  $smarty->assign('error_submit', $invite[14]);
  include "footer.php";
}

if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }

// SET EMPTY VARS
$is_error = "";
$result = "";

// CHECK IF INVITE CODES SET TO ADMINS ONLY
if($setting[setting_signup_invite] == 1) {
  header("Location: user_home.php");
  exit();
}

// RETRIEVE AND CHECK SECURITY CODE IF NECESSARY
if($task != "main" && $setting[setting_invite_code] != 0) {
  session_start();
  $code = $_SESSION['code'];
  if($code == "") { $code = randomcode(); }
  $invite_secure = $_POST['invite_secure'];
  if($invite_secure != $code) {
    $is_error = 1;
    $error_message = $invite[16];
 }
}


// SEND INVITATIONS
if($task == "doinvite" AND $is_error != 1) {
  $invite_emails = $_POST['invite_emails'];
  $invite_message = $_POST['invite_message'];

  if($invite_emails == "") {
    $is_error = 1;
    $error_message = $invite[17];
  } else {
    if($setting[setting_signup_invite] == 0) {
      send_invitation($user->user_info, $invite_emails, $invite_message);
    } else {
      send_invitecode($user->user_info, $invite_emails, $invite_message);
    }
    $result = $invite[1];
  }
}


// ASSIGN VARIABLES AND INCLUDE FOOTER
$smarty->assign('result', $result);
$smarty->assign('error_message', $error_message);
include "footer.php";
?>