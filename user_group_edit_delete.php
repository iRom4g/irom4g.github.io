<?
$page = "user_group_edit_delete";
include "header.php";

if(isset($_GET['task'])) { $task = $_GET['task']; } elseif(isset($_POST['task'])) { $task = $_POST['task']; } else { $task = "main"; }
if(isset($_GET['group_id'])) { $group_id = $_GET['group_id']; } elseif(isset($_POST['group_id'])) { $group_id = $_POST['group_id']; } else { $group_id = 0; }

// INITIALIZE GROUP OBJECT
$group = new se_group($user->user_info[user_id], $group_id);

if($group->group_exists == 0) { header("Location: user_group.php"); exit(); }
if($group->user_rank != 2) { header("Location: user_group.php"); exit(); }




if($task == "dodelete") {
  $group->group_delete($group->group_info[group_id]);
  header("Location: user_group.php");
  exit();
}






// ASSIGN VARIABLES AND SHOW DELETE GROUPS PAGE
$smarty->assign('group', $group);
include "footer.php";
?>