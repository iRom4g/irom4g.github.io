<?
$page = "user_group_edit_member";
include "header.php";

if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }
if(isset($_POST['group_id'])) { $group_id = $_POST['group_id']; } elseif(isset($_GET['group_id'])) { $group_id = $_GET['group_id']; } else { $group_id = 0; }
if(isset($_POST['member_id'])) { $member_id = $_POST['member_id']; } elseif(isset($_GET['member_id'])) { $member_id = $_GET['member_id']; } else { $member_id = 0; }


// VALIDATE MEMBER
$member_query = $database->database_query("SELECT se_groupmembers.*, se_users.user_username FROM se_groupmembers LEFT JOIN se_users ON se_groupmembers.groupmember_user_id=se_users.user_id WHERE se_groupmembers.groupmember_id='$member_id' LIMIT 1");
if($database->database_num_rows($member_query) != 1) { header("Location: user_group_edit_members.php"); exit; }
$member_info = $database->database_fetch_assoc($member_query);


// INITIALIZE GROUP OBJECT
$group = new se_group($user->user_info[user_id], $group_id);

if($group->group_exists == 0) { header("Location: user_group.php"); exit(); }
if($group->user_rank == 0 | $group->user_rank == -1) { header("Location: user_group.php"); exit(); }
if($group->user_rank < $member_info[groupmember_rank]) { header("Location: user_group_edit_members.php"); exit(); }







// SAVE CHANGES TO MEMBER
if($task == "dosave") {
  $member_rank = $_POST['member_rank'];
  $member_title = $_POST['member_title'];

  // DO NOT CHANGE TITLE IF ADMIN HAS TURNED OFF MEMBER TITLES
  if($group->groupowner_level_info[level_group_titles] != 1) { $member_title = $member_info[groupmember_title]; }

  // DO NOT CHANGE RANK IF ADMIN HAS TURNED OFF OFFICERS BUT MEMBER WAS SOMEHOW SET TO OFFICER
  if($group->groupowner_level_info[level_group_officers] != 1 AND $member_rank == 1) { $member_rank = $member_info[groupmember_rank]; }

  // IF EDITOR IS AN OFFICER, DONT ALLOW RANK CHANGE
  if($group->user_rank != 2) { $member_rank = $member_info[groupmember_rank]; }

  // SAVE CHANGES
  $database->database_query("UPDATE se_groupmembers SET groupmember_title='$member_title', groupmember_rank='$member_rank' WHERE groupmember_id='$member_info[groupmember_id]' AND groupmember_group_id='".$group->group_info[group_id]."' LIMIT 1");

  // IF THIS MEMBER WAS SET TO OWNER, DEMOTE OLD OWNER TO MEMBER
  if($member_info[groupmember_rank] < 2 AND $member_rank == 2) {
    $database->database_query("UPDATE se_groupmembers SET groupmember_rank='0' WHERE groupmember_id<>'$member_info[groupmember_id]' AND groupmember_rank='2' AND groupmember_group_id='".$group->group_info[group_id]."'");
    $database->database_query("UPDATE se_groups SET group_user_id='$member_info[groupmember_user_id]' WHERE group_id='".$group->group_info[group_id]."'");
  }

  // SEND BACK TO VIEW MEMBERS PAGE
  header("Location: user_group_edit_members.php?group_id=".$group->group_info[group_id]); exit;
}



// ASSIGN SMARTY VARIABLES AND DISPLAY EDIT MEMBER PAGE
$smarty->assign('member_info', $member_info);
$smarty->assign('group', $group);
include "footer.php";
?>