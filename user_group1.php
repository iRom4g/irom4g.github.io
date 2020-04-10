<?
$page = "user_group";
include "header.php";

// SET VARIABLES AND INITIALIZE GROUP OBJECT
$group = new se_group($user->user_info[user_id]);
$sort_by = "se_groupmembers.groupmember_rank DESC, se_groups.group_title";
$where = "(se_groupmembers.groupmember_status='1')";

// GET TOTAL GROUPS
$total_groups = $group->group_total($where);

// GET GROUPS ARRAY
$group_array = $group->group_list(0, $total_groups, $sort_by, $where, 1);

// ASSIGN VARIABLES AND SHOW VIEW GROUPS PAGE
$smarty->assign('groups', $group_array);
$smarty->assign('total_groups', $total_groups);
include "footer.php";
?>