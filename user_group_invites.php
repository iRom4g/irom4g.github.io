<?
$page = "user_group_invites";
include "header.php";

if(isset($_POST['group_id'])) { $group_id = $_POST['group_id']; } elseif(isset($_GET['group_id'])) { $group_id = $_GET['group_id']; } else { $group_id = 0; }
if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }

// SET INITIAL VARIABLES
$result_accepted = "";
$result_rejected = "";
$group_title = "";



// ACCEPT INVITATION
if($task == "accept") {
  $group = new se_group($user->user_info[user_id], $group_id);
  if($group->group_exists == 0) { header("Location: user_group_invites.php"); exit(); }
  $database->database_query("UPDATE se_groupmembers SET groupmember_status='1' WHERE groupmember_group_id='".$group->group_info[group_id]."' AND groupmember_user_id='".$user->user_info[user_id]."' AND groupmember_status='0' LIMIT 1");
  $group_title = $group->group_info[group_title];
  $result_accepted = $user_group_invites[1];

  // INSERT ACTION
  $group_title_short = $group->group_info[group_title];
  if(strlen($group_title_short) > 100) { $group_title_short = substr($group_title_short, 0, 97); $group_title_short .= "..."; }
  $actions->actions_add($user, "joingroup", Array('[username]', '[id]', '[title]'), Array($user->user_info[user_username], $group->group_info[group_id], $group_title_short));
}


// REJECT INVITATION
if($task == "reject") {
  $group = new se_group($user->user_info[user_id], $group_id);
  if($group->group_exists == 0) { header("Location: user_group_invites.php"); exit(); }
  $database->database_query("DELETE FROM se_groupmembers WHERE groupmember_group_id='".$group->group_info[group_id]."' AND groupmember_user_id='".$user->user_info[user_id]."' AND groupmember_status='0' LIMIT 1");
  $group_title = $group->group_info[group_title];
  $result_rejected = $user_group_invites[2];
}









// SET VARIABLES AND INITIALIZE GROUP OBJECT
$group = new se_group($user->user_info[user_id]);
$sort_by = "se_groups.group_id";
$where = "(se_groupmembers.groupmember_status='0' AND se_groupmembers.groupmember_approved='1')";

// GET TOTAL GROUPS
$total_groups = $group->group_total($where);

// GET GROUPS ARRAY
$group_array = $group->group_list(0, $total_groups, $sort_by, $where, 1);


// ASSIGN SMARTY VARIABLES AND DISPLAY GROUP INVITES PAGE
$smarty->assign('group_id', $group_id);
$smarty->assign('group_title', $group_title);
$smarty->assign('result_accepted', $result_accepted);
$smarty->assign('result_rejected', $result_rejected);
$smarty->assign('groups', $group_array);
$smarty->assign('total_groups', $total_groups);
include "footer.php";
?>