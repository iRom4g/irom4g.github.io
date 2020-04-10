<?
$page = "action_delete";
include "header.php";

if(isset($_GET['action_id'])) { $action_id = $_GET['action_id']; } else { $action_id = 0; }

// MAKE SURE USERS ARE ALLOWED TO DELETE ACTIONS
if($setting[setting_actions_selfdelete] != 1) { exit; }

// DELETE ACTION (IF OWNED BY LOGGED-IN USER)
$action_user_id = $user->user_info[user_id];
$database->database_query("DELETE FROM se_actions WHERE (action_id='$action_id' AND action_user_id='$action_user_id')");

// include "footer.php";
?>