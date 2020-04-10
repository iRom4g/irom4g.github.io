<?
$page = "user_group_join";
include "header.php";

if(isset($_POST['group_id'])) { $group_id = $_POST['group_id']; } elseif(isset($_GET['group_id'])) { $group_id = $_GET['group_id']; } else { $group_id = 0; }
if(isset($_POST['return_url'])) { $return_url = $_POST['return_url']; } elseif(isset($_GET['return_url'])) { $return_url = $_GET['return_url']; } else { $return_url = $url->url_base."user_group.php"; }
if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }

// SET EMPTY VARS
$result = "";
$error_message = "";
$is_error = 0;

// INITIALIZE GROUP OBJECT
$group = new se_group($user->user_info[user_id], $group_id);
if($group->group_exists == 0) { header("Location: user_group.php"); exit(); }


// MAKE SURE USER IS NOT IN GROUP
$member_query = $database->database_query("SELECT groupmember_id, groupmember_rank, groupmember_status FROM se_groupmembers WHERE groupmember_group_id='".$group->group_info[group_id]."' AND groupmember_user_id='".$user->user_info[user_id]."' LIMIT 1");
if($database->database_num_rows($member_query) == 1) {
  $member_info = $database->database_fetch_assoc($member_query);
  if($member_info[groupmember_status] == 1) {
    $error_message = $user_group_join[1];
  } else {
    $error_message = $user_group_join[2];
  }
  $is_error = 1;
  $task = "main";
}



// JOIN GROUP
if($task == "dojoin") {

  // USER HAS NOT YET BEEN INVITED
  if($member_info[groupmember_status] == "") {

    // IF GROUP REQUIRES APPROVAL
    if($group->group_info[group_approval] == 1) {
      $groupmember_status = 0;
      $groupmember_approved = 0;
      $result = $user_group_join[12];
      $groupowner_info = $database->database_fetch_assoc($database->database_query("SELECT se_users.user_id, se_users.user_username, se_users.user_email, se_usersettings.usersetting_notify_groupmemberrequest FROM se_users LEFT JOIN se_usersettings ON se_users.user_id=se_usersettings.usersetting_user_id WHERE se_users.user_id='".$group->group_info[group_user_id]."'"));
      if($groupowner_info[usersetting_notify_groupmemberrequest] == 1) { send_generic($groupowner_info[user_email], "$setting[setting_email_fromname] <$setting[setting_email_fromemail]>", $setting[setting_email_groupmemberrequest_subject], $setting[setting_email_groupmemberrequest_message], Array('[username]', '[requester]', '[groupname]', '[link]'), Array($groupowner_info[user_username], $user->user_info[user_username], $group->group_info[group_title], "<a href=\"".$url->url_base."login.php\">".$url->url_base."login.php</a>")); }

    // IF GROUP DOES NOT REQUIRE APPROVAL
    } else {
      $groupmember_status = 1;
      $groupmember_approved = 1;
      $result = $user_group_join[3];
    }

    $database->database_query("INSERT INTO se_groupmembers (groupmember_user_id,
							    groupmember_group_id,
							    groupmember_status,
							    groupmember_approved,
							    groupmember_rank
							    ) VALUES (
							    '".$user->user_info[user_id]."',
							    '".$group->group_info[group_id]."',
							    '$groupmember_status',
							    '$groupmember_approved',
							    '0')");

  // USER HAS ALREADY BEEN INVITED
  } elseif($member_info[groupmember_status] == 0) {

    $groupmember_status = 1;
    $groupmember_approved = 1;
    $result = $user_group_join[3];

    $database->database_query("UPDATE se_groupmembers SET groupmember_status='$groupmember_status', groupmember_approved='$groupmember_approved' WHERE groupmember_user_id='".$user->user_info[user_id]."' AND groupmember_group_id='".$group->group_info[group_id]."'");
  }

  // INSERT ACTION IF MEMBER IS APPROVED
  if($groupmember_approved == 1) {
    $group_title_short = $group->group_info[group_title];
    if(strlen($group_title_short) > 100) { $group_title_short = substr($group_title_short, 0, 97); $group_title_short .= "..."; }
    $actions->actions_add($user, "joingroup", Array('[username]', '[id]', '[title]'), Array($user->user_info[user_username], $group->group_info[group_id], $group_title_short));
  }

}




// ASSIGN SMARTY VARIABLES AND DISPLAY JOIN GROUPS PAGE
$smarty->assign('group', $group);
$smarty->assign('return_url', $return_url);
$smarty->assign('result', $result);
$smarty->assign('error_message', $error_message);
include "footer.php";
?>