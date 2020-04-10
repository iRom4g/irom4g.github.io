<?
$page = "group_members";
include "header.php";

// GET PAGE VARIABLE
if(isset($_POST['p'])) { $p = $_POST['p']; } elseif(isset($_GET['p'])) { $p = $_GET['p']; } else { $p = 1; }
if(isset($_POST['group_id'])) { $group_id = $_POST['group_id']; } elseif(isset($_GET['group_id'])) { $group_id = $_GET['group_id']; } else { $group_id = 0; }

// DISPLAY ERROR PAGE IF USER IS NOT LOGGED IN AND ADMIN SETTING REQUIRES REGISTRATION
if($user->user_exists == 0 & $setting[setting_permission_group] == 0) {
  $page = "error";
  $smarty->assign('error_header', $group_members[14]);
  $smarty->assign('error_message', $group_members[15]);
  $smarty->assign('error_submit', $group_members[16]);
  include "footer.php";
}


// INITIALIZE GROUP OBJECT
$group = new se_group($user->user_info[user_id], $group_id);
if($group->group_exists == 0) { header("Location: home.php"); exit(); }

// GET PRIVACY LEVEL
$privacy_level = $group->group_privacy_max($user, $group->groupowner_level_info[level_profile_privacy]);
$allowed_privacy = true_privacy($group->group_info[group_privacy], $group->groupowner_level_info[level_profile_privacy]);
$is_group_private = 0;
if($privacy_level < $allowed_privacy) { header("Location: group.php?group_id=".$group->group_info[group_id]); exit(); }



// SET WHERE/SORT
$sort = "se_users.user_username";
$where = "(se_groupmembers.groupmember_status='1')";

// GET TOTAL MEMBERS
$total_members = $group->group_member_total($where);

// MAKE MEMBER PAGES
$members_per_page = 10;
$page_vars = make_page($total_members, $members_per_page, $p);

// GET MEMBER ARRAY
$members = $group->group_member_list($page_vars[0], $members_per_page, $sort, $where);

// ASSIGN VARIABLES AND DISPLAY BROWSE PAGE
$smarty->assign('group', $group);
$smarty->assign('members', $members);
$smarty->assign('total_members', $total_members);
$smarty->assign('p', $page_vars[1]);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($members));
include "footer.php";
?>