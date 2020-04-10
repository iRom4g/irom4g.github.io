<?
$page = "login";
include "header.php";

// USER IS LOGGED IN, FORWARD TO USER HOME
if($user->user_exists != 0) { header("Location: user_home.php"); exit(); }

if(isset($_POST['task'])) { $task = $_POST['task']; } else { $task = "main"; }

// CHECK FOR REDIRECTION URL
if(isset($_POST['return_url'])) { $return_url = $_POST['return_url']; } elseif(isset($_GET['return_url'])) { $return_url = $_GET['return_url']; } else { $return_url = ""; }
$return_url = urldecode($return_url);
$return_url = str_replace("&amp;", "&", $return_url);
if($return_url == "") { $return_url = "user_home.php"; }

// INITIALIZE ERROR VARS
$is_error = 0;
$error_message = "";

// GET EMAIL
if(isset($_POST['email'])) { $email = $_POST['email']; } elseif(isset($_GET['email'])) { $email = $_GET['email']; } else { $email = ""; }

// TRY TO LOGIN
if($task == "dologin") {

  $user->user_login($email, $_POST['password'], $_POST['javascript_disabled'], $_POST['persistent']);

  // IF USER IS LOGGED IN SUCCESSFULLY, FORWARD THEM TO SPECIFIED URL
  if($user->is_error == 0) {

    // INSERT ACTION 
    $actions->actions_add($user, "login", Array('[username]'), Array($user->user_info[user_username]));

    cheader("$return_url");
    exit();
  
  // IF THERE WAS AN ERROR, SET ERROR MESSAGE
  } else {
    $error_message = $user->error_message;
    $user = new se_user();
  }

}



// ASSIGN VARIABLES AND INCLUDE FOOTER
$smarty->assign('email', $email);
$smarty->assign('error_message', $error_message);
$smarty->assign('return_url', $return_url);
include "footer.php";
?>