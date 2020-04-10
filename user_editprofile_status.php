<?
$page = "user_editprofile_status";
include "header.php";

if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }
if(isset($_POST['return_url'])) { $return_url = $_POST['return_url']; } elseif(isset($_GET['return_url'])) { $return_url = $_GET['return_url']; } else { $return_url = ""; }
if(isset($_POST['is_ajax'])) { $is_ajax = $_POST['is_ajax']; } elseif(isset($_GET['is_ajax'])) { $is_ajax = $_GET['is_ajax']; } else { $is_ajax = ""; }


// SET VARS
$result = 0;

// CHECK IF STATUS FEATURE IS DISABLED BY ADMIN
if($user->level_info[level_profile_status] != 1) {
  header("Location: user_editprofile.php");
  exit();
}




// OUTPUT BLANK PAGE FOR AJAX USE
if($task == "blank") {
  echo "<html><head></head><body></body></html>";
  exit;
}





// SAVE NEW STATUS
if($task == "dosave") {
  $status_new = censor($_POST['status_new']);
  $database->database_query("UPDATE se_users SET user_status='$status_new' WHERE user_id='".$user->user_info[user_id]."' LIMIT 1");
  $user->user_lastupdate();
  $user->user_info[user_status] = $status_new;

  // INSERT ACTION IF STATUS IS NOT EMPTY
  if(str_replace(" ", "", $status_new) != "") {
    $actions->actions_add($user, "editstatus", Array('[username]', '[status]'), Array($user->user_info[user_username], str_replace("&", "&amp;", $status_new)), 600);
  }

  $result = 1;

  // IF THIS IS BEING USED BY AJAX, OUTPUT BLANK PAGE
  if($is_ajax == 1) { echo "<html><head></head><body></body></html>"; exit; }

  // IF RETURN URL IS SET, GO THERE
  if($return_url != "") { header("Location: $return_url"); exit; }
}



// GET TABS TO DISPLAY ON TOP MENU
$user->user_fields(1);
$tab_array = $user->profile_tabs;


// ASSIGN SMARTY VARIABLES AND INCLUDE FOOTER
$smarty->assign('tabs', $tab_array);
$smarty->assign('result', $result);
$smarty->assign('return_url', $return_url);
include "footer.php";
?>