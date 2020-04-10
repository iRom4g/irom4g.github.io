<?
$page = "user_group_edit_members";
include "header.php";

if(isset($_POST['group_id'])) { $group_id = $_POST['group_id']; } elseif(isset($_GET['group_id'])) { $group_id = $_GET['group_id']; } else { $group_id = 0; }
if(isset($_POST['search'])) { $search = $_POST['search']; } elseif(isset($_GET['search'])) { $search = $_GET['search']; } else { $search = ""; }
if(isset($_POST['search_rank'])) { $search_rank = $_POST['search_rank']; } elseif(isset($_GET['search_rank'])) { $search_rank = $_GET['search_rank']; } else { $search_rank = ""; }
if(isset($_POST['p'])) { $p = $_POST['p']; } elseif(isset($_GET['p'])) { $p = $_GET['p']; } else { $p = 1; }
if(isset($_POST['s'])) { $s = $_POST['s']; } elseif(isset($_GET['s'])) { $s = $_GET['s']; } else { $s = "u"; }

// INITIALIZE GROUP OBJECT
$group = new se_group($user->user_info[user_id], $group_id);

if($group->group_exists == 0) { header("Location: user_group.php"); exit(); }
if($group->user_rank == 0 | $group->user_rank == -1) { header("Location: user_group.php"); exit(); }



// SET FRIEND SORT-BY VARIABLES FOR HEADING LINKS
$u = "ud";    // LAST UPDATE DATE
$l = "ld";    // LAST LOGIN DATE
$t = "t";     // MEMBER TITLE
$r = "r";     // MEMBER RANK

// SET SORT VARIABLE FOR DATABASE QUERY
if($s == "ud") {
  $sort = "se_users.user_dateupdated DESC";
  $u = "ud";
} elseif($s == "ld") {
  $sort = "se_users.user_lastlogindate DESC";
  $l = "ld";
} elseif($s == "t") {
  $sort = "se_groupmembers.groupmember_title";
  $t = "t";
} elseif($s == "r") {
  $sort = "se_groupmembers.groupmember_rank DESC";
  $r = "r";
} else {
  $sort = "se_users.user_dateupdated DESC";
  $u = "ud";
}


// SET WHERE CLAUSE
$where = "(se_groupmembers.groupmember_status='1'";
if($search_rank == "1") { $where .= " AND se_groupmembers.groupmember_rank <> '0'"; }
if($search != "") { $where .= " AND (se_users.user_username LIKE '%$search%' OR se_users.user_email LIKE '%$search%')"; }
$where .= ")";


// GET TOTAL MEMBERS
$total_members = $group->group_member_total($where);

// MAKE MEMBER PAGES
$members_per_page = 10;
$page_vars = make_page($total_members, $members_per_page, $p);

// GET MEMBER ARRAY
$members = $group->group_member_list($page_vars[0], $members_per_page, $sort, $where);



// ASSIGN VARIABLES AND SHOW USER EDIT GROUP MEMBERS PAGE
$smarty->assign('group', $group);
$smarty->assign('total_members', $total_members);
$smarty->assign('members', $members);
$smarty->assign('p', $page_vars[1]);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($members));
$smarty->assign('u', $u);
$smarty->assign('l', $l);
$smarty->assign('t', $t);
$smarty->assign('r', $r);
$smarty->assign('s', $s);
$smarty->assign('search', $search);
$smarty->assign('search_rank', $search_rank);
include "footer.php";
?>