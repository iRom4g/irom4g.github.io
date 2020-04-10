<?
$page = "user_editprofile_photo";
include "header.php";

if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }

// CHECK FOR ADMIN ALLOWANCE OF PHOTO
if($user->level_info[level_photo_allow] == 0) { header("Location: user_home.php"); exit(); }

// SET ERROR VARIABLES
$is_error = 0;
$error_message = "";

// DELETE PHOTO
if($task == "remove") { $user->user_photo_delete(); $user->user_lastupdate(); }

// UPLOAD PHOTO
if($task == "upload") {
  $user->user_photo_upload("photo");
  $is_error = $user->is_error;
  $error_message = $user->error_message;
  if($is_error == 0) { 

    // SAVE LAST UPDATE DATE
    $user->user_lastupdate(); 

    // DETERMINE SIZE OF THUMBNAIL TO SHOW IN ACTION
    $photo_width = $misc->photo_size($user->user_photo(), "100", "100", "w");
    $photo_height = $misc->photo_size($user->user_photo(), "100", "100", "h");

    // INSERT ACTION
    $actions->actions_add($user, "editphoto", Array('[username]', '[photo]', '[width]', '[height]'), Array($user->user_info[user_username], $user->user_photo(), $photo_width, $photo_height), 999999999);

  }
}

// GET TABS TO DISPLAY ON TOP MENU
$user->user_fields(1);
$tab_array = $user->profile_tabs;

// ASSIGN VARIABLES AND INCLUDE FOOTER
$smarty->assign('is_error', $is_error);
$smarty->assign('error_message', $error_message);
$smarty->assign('tabs', $tab_array);
include "footer.php";
?>