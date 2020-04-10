<?
$page = "user_group_leave";
include "header.php";

if(isset($_POST['group_id'])) { $group_id = $_POST['group_id']; } elseif(isset($_GET['group_id'])) { $group_id = $_GET['group_id']; } else { $group_id = 0; }
if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }

// INITIALIZE GROUP OBJECT
$group = new se_group($user->user_info[user_id], $group_id);

if($group->group_exists == 0) { header("Location: user_group.php"); exit(); }
if($group->user_rank == -1) { header("Location: user_group.php"); exit(); }

// REMOVE USER FROM THIS GROUP
if($task == "doleave") {
  $database->database_query("DELETE FROM se_groupmembers WHERE groupmember_group_id='".$group->group_info[group_id]."' AND groupmember_user_id='".$user->user_info[user_id]."' LIMIT 1");

  // IF USER IS OWNER OF GROUP, DELETE THE GROUP
  if($group->user_rank == 2) { $group->group_delete(); }

  // INSERT ACTION
  $group_title_short = $group->group_info[group_title];
  if(strlen($group_title_short) > 100) { $group_title_short = substr($group_title_short, 0, 97); $group_title_short .= "..."; }
  $actions->actions_add($user, "leavegroup", Array('[username]', '[id]', '[title]'), Array($user->user_info[user_username], $group->group_info[group_id], $group_title_short));

  // RETURN TO GROUP PAGE
  header("Location: user_group.php"); 
  exit();
}


// ASSIGN SMARTY VARIABLES AND DISPLAY LEAVE GROUPS PAGE
$smarty->assign('group', $group);
include "footer.php";
?>