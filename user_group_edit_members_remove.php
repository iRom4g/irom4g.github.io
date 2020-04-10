<?
$page = "user_group_edit_members_remove";
include "header.php";

if(isset($_POST['group_id'])) { $group_id = $_POST['group_id']; } elseif(isset($_GET['group_id'])) { $group_id = $_GET['group_id']; } else { $group_id = 0; }
if(isset($_POST['member_id'])) { $member_id = $_POST['member_id']; } elseif(isset($_GET['member_id'])) { $member_id = $_GET['member_id']; } else { $member_id = 0; }
if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }

// VALIDATE MEMBER
$member_query = $database->database_query("SELECT se_groupmembers.*, se_users.user_username FROM se_groupmembers LEFT JOIN se_users ON se_groupmembers.groupmember_user_id=se_users.user_id WHERE se_groupmembers.groupmember_id='$member_id' LIMIT 1");
if($database->database_num_rows($member_query) != 1) { header("Location: user_group_edit_members.php"); exit; }
$member_info = $database->database_fetch_assoc($member_query);


// INITIALIZE GROUP OBJECT
$group = new se_group($user->user_info[user_id], $group_id);

if($group->group_exists == 0) { header("Location: user_group.php"); exit(); }
if($group->user_rank == 0 | $group->user_rank == -1) { header("Location: user_group.php"); exit(); }
if($group->user_rank <= $member_info[groupmember_rank]) { header("Location: user_group_edit_members.php"); exit(); }

// DELETE USER
if($task == "doremove") {
  $database->database_query("DELETE FROM se_groupmembers WHERE groupmember_id='$member_info[groupmember_id]' AND groupmember_group_id='".$group->group_info[group_id]."' LIMIT 1");
  header("Location: user_group_edit_members.php?group_id=".$group->group_info[group_id]); exit;
}


// ASSIGN SMARTY VARIABLES AND DISPLAY REMOVE MEMBER PAGE
$smarty->assign('group', $group);
$smarty->assign('member_id', $member_id);
include "footer.php";
?>