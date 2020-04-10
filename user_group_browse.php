<?
$page = "user_group_browse";
include "header.php";

if(isset($_POST['groupcat_id'])) { $groupcat_id = $_POST['groupcat_id']; } elseif(isset($_GET['groupcat_id'])) { $groupcat_id = $_GET['groupcat_id']; } else { $groupcat_id = ""; }
if(isset($_POST['p'])) { $p = $_POST['p']; } elseif(isset($_GET['p'])) { $p = $_GET['p']; } else { $p = 1; }

// CREATE GROUP OBJECT
$group = new se_group();


// SHOW CATEGORIES PAGE
if($groupcat_id == "") {

  // GET GROUP CATEGORIES
  $groupcats = $database->database_query("SELECT se_groupcats.*, count(se_groups.group_id) AS total_cat_groups FROM se_groupcats LEFT JOIN se_groups ON se_groupcats.groupcat_id=se_groups.group_groupcat_id AND se_groups.group_search='1' WHERE se_groupcats.groupcat_dependency='0' GROUP BY se_groupcats.groupcat_id");

  // LOOP THROUGH GROUP CATEGORIES AND SUBCATEGORIES
  $categories = Array();
  $groups_totalincats = 0;
  while($groupcat = $database->database_fetch_assoc($groupcats)) {

    // LOOP THROUGH SUBCATS AND PUT THEM INTO AN ARRAY
    $groupsubcats = $database->database_query("SELECT se_groupcats.*, count(se_groups.group_id) AS total_subcat_groups FROM se_groupcats LEFT JOIN se_groups ON se_groupcats.groupcat_id=se_groups.group_groupcat_id AND se_groups.group_search='1' WHERE se_groupcats.groupcat_dependency='$groupcat[groupcat_id]' GROUP BY se_groupcats.groupcat_id");
    $total_subcat_groups = 0;
    $subcategory_array = Array();
    while($groupsubcat = $database->database_fetch_assoc($groupsubcats)) {
      $subcategory_array[] = Array('subcategory_id' => $groupsubcat[groupcat_id],
					'subcategory_title' => $groupsubcat[groupcat_title],
					'subcategory_totalgroups' => $groupsubcat[total_subcat_groups]);
      $total_subcat_groups += $groupsubcat[total_subcat_groups];
    }

    // GET TOTAL GROUPS IN THIS CATEGORY AND ALL ITS SUBCATS
    $total_cat_groups = $groupcat[total_cat_groups]+$total_subcat_groups;

    // PUT CATEGORY DATA INTO AN ARRAY
    $categories[] = Array('groupcat_id' => $groupcat[groupcat_id],
  			'groupcat_title' => $groupcat[groupcat_title],
			'groupcat_totalgroups' => $total_cat_groups,
			'groupcat_subcats' => $subcategory_array);
    $groups_totalincats += $total_cat_groups;
  }

  // DETERMINE HOW MANY GROUPS EXIST THAT ARE UNCATEGORIZED
  $total_groups = $group->group_total("(group_search='1')");
  $groups_totalnocat = $total_groups - $groups_totalincats;

}





// SHOW GROUPS WITHIN A CATEGORY
if($groupcat_id != "") {

  $where = "(group_search='1'";

  // SHOW CATEGORIZED GROUPS
  if($groupcat_id > 0) {

    // GET INFORMATION ABOUT THIS CATEGORY, MAKE SURE IT EXISTS
    $category_query = $database->database_query("SELECT * FROM se_groupcats WHERE groupcat_id='$groupcat_id' LIMIT 1");
    if($database->database_num_rows($category_query) != 1) { header("Location: user_group_browse.php"); exit; }
    $category_info = $database->database_fetch_assoc($category_query);

    // GET SUBCATEGORIES
    $subcategory_query = $database->database_query("SELECT * FROM se_groupcats WHERE groupcat_dependency='$groupcat_id'");

    // BUILD QUERY AND CREATE SUBCATS ARRAY
    $where .= " AND (group_groupcat_id='$groupcat_id'";
    while($subcategory = $database->database_fetch_assoc($subcategory_query)) {
      $where .= " OR group_groupcat_id='$subcategory[groupcat_id]'";
    }
    $where .= ")";


  // SHOW UNCATEGORIZED GROUPS
  } else {
    $where .= " AND group_groupcat_id='0'";
  }

  $where .= ")";

  // GET TOTAL GROUPS
  $total_groups = $group->group_total($where);

  // MAKE GROUP PAGES
  $groups_per_page = 20;
  $page_vars = make_page($total_groups, $groups_per_page, $p);

  // GET GROUPS
  $group_array = $group->group_list($page_vars[0], $groups_per_page, "group_id DESC", $where, 1);

}


// ASSIGN SMARTY VARIABLES AND DISPLAY BROWSE GROUPS PAGE
$smarty->assign('groups_totalnocat', $groups_totalnocat);
$smarty->assign('total_groups', $total_groups);
$smarty->assign('categories', $categories);
$smarty->assign('groupcat_id', $groupcat_id);
$smarty->assign('groupcat_title', $category_info[groupcat_title]);
$smarty->assign('groups', $group_array);
$smarty->assign('p', $page_vars[1]);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($group_array));
include "footer.php";
?>