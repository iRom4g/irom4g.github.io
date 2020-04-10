<?
$page = "admin_login";
include "admin_header.php";

if(isset($_POST['task'])) { $task = $_POST['task']; } else { $task = "main"; }


// INITIALIZE ERROR MESSAGE VAR
$error_message = "";


// TRY TO LOGIN
if($task == "dologin") {

  $admin->admin_login();

  // IF ADMIN IS LOGGED IN SUCCESSFULLY, FORWARD THEM TO HOMEPAGE
  if($admin->is_error == 0) {
    cheader("admin_home.php");
    exit();

  // IF THERE WAS AN ERROR, SET ERROR MESSAGE
  } else {
    $error_message = $admin->error_message;
  }

}



// ASSIGN VARIABLES AND SHOW ADMIN LOGIN PAGE
$smarty->assign('error_message', $error_message);
$smarty->display("$page.tpl");
exit();
?>