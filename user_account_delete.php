<?
$page = "user_account_delete";
include "header.php";

if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }


// DELETE THIS USER
if($task == "dodelete") {
  $user->user_delete();
  $user->user_setcookies();
  cheader("home.php");
  exit;
}


// ASSIGN SMARTY VARIABLES AND INCLUDE FOOTER
include "footer.php";
?>