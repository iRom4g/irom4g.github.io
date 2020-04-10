<?
$page = "user_group_edit_invite";
include "header.php";

if(isset($_GET['group_id'])) { $group_id = $_GET['group_id']; } elseif(isset($_POST['group_id'])) { $group_id = $_POST['group_id']; } else { $group_id = 0; }
if(isset($_GET['task'])) { $task = $_GET['task']; } elseif(isset($_POST['task'])) { $task = $_POST['task']; } else { $task = "main"; }


// INITIALIZE GROUP OBJECT
$group = new se_group($user->user_info[user_id], $group_id);

if($group->group_exists == 0) { header("Location: user_group.php"); exit(); }
if($group->user_rank == 0 | $group->user_rank == -1) { header("Location: user_group.php"); exit(); }




// SET EMPTY VARS
$result = "";
$result2 = "";





// INVITE USERS
if($task == "doinvites") {
  $num_invited = $_POST['num_invited'];

  // LOOP THROUGH INVITED USERS
  $invited_count_success = 0;
  for($i=1;$i<=$num_invited;$i++) {
    $var = "invited_username".$i;
    $invited_username = $_POST[$var];
    // IF FIELD IS NOT BLANK, CHECK IF USER WITH THIS USERNAME EXISTS AND IS NOT ALREADY A MEMBER OF THE GROUP
    if(str_replace(" ", "", $invited_username) != "") {
      $invited_query = $database->database_query("SELECT se_users.user_id, se_users.user_username, se_users.user_email, se_usersettings.usersetting_notify_groupinvite FROM se_users LEFT JOIN se_usersettings ON se_users.user_id=se_usersettings.usersetting_user_id LEFT JOIN se_groupmembers ON se_users.user_id=se_groupmembers.groupmember_user_id AND se_groupmembers.groupmember_group_id='$group_id' WHERE se_users.user_username='$invited_username' AND se_groupmembers.groupmember_id IS NULL LIMIT 1");
      if($database->database_num_rows($invited_query) == 1) {
	$invited_info = $database->database_fetch_assoc($invited_query);
	$database->database_query("INSERT INTO se_groupmembers (groupmember_user_id, 
								groupmember_group_id, 
								groupmember_status,
								groupmember_approved) VALUES (
								'$invited_info[user_id]',
								'$group_id',
								'0',
								'1')");
	// SEND INVITE EMAIL
        if($invited_info[usersetting_notify_groupinvite] == 1) { send_generic($invited_info[user_email], "$setting[setting_email_fromname] <$setting[setting_email_fromemail]>", $setting[setting_email_groupinvite_subject], $setting[setting_email_groupinvite_message], Array('[username]', '[groupname]', '[link]'), Array($invited_info[user_username], $group->group_info[group_title], "<a href=\"".$url->url_base."login.php\">".$url->url_base."login.php</a>")); }
	$invited_count_success++;
      }
    }
  }

  $result = "$invited_count_success $user_group_edit_invite[1]";
}






// RUN VALIDATION FOR UNINVITE, APPROVE, OR REJECT MEMBER TASKS
if($task == "uninvite" OR $task == "approve" OR $task == "reject") {
  // MAKE SURE GROUP MEMBER ID EXISTS IN TABLE
  $groupmember_id = $_GET['groupmember_id'];
  $groupmember_query = $database->database_query("SELECT groupmember_id, groupmember_group_id, groupmember_user_id, groupmember_status, groupmember_approved FROM se_groupmembers WHERE groupmember_id='$groupmember_id' AND groupmember_group_id='".$group->group_info[group_id]."' LIMIT 1");
  if($database->database_num_rows($groupmember_query) != 1) { header("Location: user_group_edit_invite.php?group_id=".$group->group_info[group_id]); exit; }
  $groupmember_info = $database->database_fetch_assoc($groupmember_query);
}

// UNINVITE MEMBER
if($task == "uninvite") {
  // MAKE SURE GROUP MEMBER BELONGS TO THIS GROUP AND HAS STATUS=0, APPROVED=1
  if($groupmember_info[groupmember_status] == 0 OR $groupmember_info[groupmember_approved] == 1) { 
    $database->database_query("DELETE FROM se_groupmembers WHERE groupmember_id='$groupmember_info[groupmember_id]' LIMIT 1");
    $result2 = $user_group_edit_invite[2];
  }
}

// APPROVE MEMBER
if($task == "approve") {
  // MAKE SURE GROUP MEMBER BELONGS TO THIS GROUP AND HAS STATUS=0, APPROVED=0
  if($groupmember_info[groupmember_status] == 0 OR $groupmember_info[groupmember_approved] == 0) { 
    $database->database_query("UPDATE se_groupmembers SET groupmember_status='1', groupmember_approved='1' WHERE groupmember_id='$groupmember_info[groupmember_id]' LIMIT 1");
    $result = $user_group_edit_invite[3];

    // INSERT ACTION
    $new_member = new se_user(Array($groupmember_info[groupmember_user_id]));
    $group_title_short = $group->group_info[group_title];
    if(strlen($group_title_short) > 100) { $group_title_short = substr($group_title_short, 0, 97); $group_title_short .= "..."; }
    $actions->actions_add($new_member, "joingroup", Array('[username]', '[id]', '[title]'), Array($new_member->user_info[user_username], $group->group_info[group_id], $group_title_short));
  }
}

// REJECT MEMBER
if($task == "reject") {
  // MAKE SURE GROUP MEMBER BELONGS TO THIS GROUP AND HAS STATUS=0, APPROVED=0
  if($groupmember_info[groupmember_status] == 0 OR $groupmember_info[groupmember_approved] == 0) { 
    $database->database_query("DELETE FROM se_groupmembers WHERE groupmember_id='$groupmember_info[groupmember_id]' AND groupmember_group_id='$groupmember_info[groupmember_group_id]' LIMIT 1");
    $result2 = $user_group_edit_invite[4];
  }
}

// GET MEMBERS AWAITING APPROVAL
$where = "(se_groupmembers.groupmember_status='0' AND se_groupmembers.groupmember_approved='0')";
$unapproved_users_total = $group->group_member_total($where);
$unapproved_array = $group->group_member_list(0, $unapproved_users_total, "groupmember_id DESC", $where);

// GET INVITED USERS
$where = "(se_groupmembers.groupmember_status='0' AND se_groupmembers.groupmember_approved='1')";
$invited_users_total = $group->group_member_total($where);
$invited_array = $group->group_member_list(0, $invited_users_total, "groupmember_id DESC", $where);

// GET LIST OF FRIENDS FOR SUGGEST BOX
$total_friends = $user->user_friend_total(0);
$friends = $user->user_friend_list(0, $total_friends, 0);

// ASSIGN SMARTY VARIABLES AND DISPLAY EDIT INVITE PAGE
$smarty->assign('result', $result);
$smarty->assign('result2', $result2);
$smarty->assign('group', $group);
$smarty->assign('invited', $invited_array);
$smarty->assign('unapproved', $unapproved_array);
$smarty->assign('friends', $friends);
include "footer.php";
?>