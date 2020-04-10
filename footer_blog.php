<?

switch($page) {

  // CODE FOR PROFILE PAGE
  case "profile":
	// CHECK IF OWNER IS ALLOWED TO HAVE A BLOG
	$entries = Array();
	$total_entries = 0;
	if($owner->level_info[level_blog_allow] != 0) {

	  // START BLOG
	  $blog = new se_blog($owner->user_info[user_id]);
	  $entries_per_page = 5;
	  $sort = "blogentry_date DESC";

	  // GET PRIVACY LEVEL AND SET WHERE
	  $privacy_level = $owner->user_privacy_max($user, $owner->level_info[level_blog_privacy]);
	  $where = "(blogentry_privacy<='$privacy_level')";

	  // GET TOTAL ENTRIES
	  $total_entries = $blog->blog_entries_total($where);

	  // GET ENTRY ARRAY
	  $entries = $blog->blog_entries_list(0, $entries_per_page, $sort, $where);

	}

	// ASSIGN ENTRIES SMARY VARIABLE
	$smarty->assign('entries', $entries);
	$smarty->assign('total_entries', $total_entries);
	break;



}
?>