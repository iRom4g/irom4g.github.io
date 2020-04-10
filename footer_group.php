<?

switch($page) {

  // CODE FOR PROFILE PAGE
  case "profile":
	$group = new se_group($owner->user_info[user_id]);
	$sort_by = "se_groupmembers.groupmember_rank DESC, se_groups.group_title";
	$where = "(se_groupmembers.groupmember_status='1')";

	// GET TOTAL GROUPS
	$total_groups = $group->group_total($where);

	// GET GROUPS ARRAY
	$groups = $group->group_list(0, $total_groups, $sort_by, $where, 1);

	// ASSIGN GROUPS SMARY VARIABLE
	$smarty->assign('groups', $groups);
	$smarty->assign('total_groups', $total_groups);
	break;



}
?>