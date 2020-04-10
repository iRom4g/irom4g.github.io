<?
$page = "user_blog";
include "header.php";

if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }
if(isset($_POST['p'])) { $p = $_POST['p']; } elseif(isset($_GET['p'])) { $p = $_GET['p']; } else { $p = 1; }
if(isset($_POST['s'])) { $s = $_POST['s']; } elseif(isset($_GET['s'])) { $s = $_GET['s']; } else { $s = "dd"; }
if(isset($_POST['search'])) { $search = $_POST['search']; } elseif(isset($_GET['search'])) { $search = $_GET['search']; } else { $search = ""; }


// ENSURE BLOGS ARE ENABLED FOR THIS USER
if($user->level_info[level_blog_allow] == 0) { header("Location: user_home.php"); exit(); }



// SET ENTRY SORT-BY VARIABLES FOR HEADING LINKS
$d = "dd";    // BLOGENTRY_DATE
$t = "t";     // BLOGENTRY_TITLE
$c = "cd";    // TOTAL_COMMENTS

// SET SORT VARIABLE FOR DATABASE QUERY
if($s == "d") {
  $sort = "blogentry_date";
  $d = "dd";
} elseif($s == "dd") {
  $sort = "blogentry_date DESC";
  $d = "d";
} elseif($s == "t") {
  $sort = "blogentry_title";
  $t = "td";
} elseif($s == "td") {
  $sort = "blogentry_title DESC";
  $t = "t";
} elseif($s == "c") {
  $sort = "total_comments";
  $c = "cd";
} elseif($s == "cd") {
  $sort = "total_comments DESC";
  $c = "c";
} else {
  $sort = "blogentry_date DESC";
  $d = "d";
}

// SET WHERE CLAUSE
if($search != "") { $where = "(blogentry_title LIKE '%$search%' OR blogentry_body LIKE '%$search%')"; } else { $where = ""; }


// CREATE BLOG OBJECT
$entries_per_page = 10;
$blog = new se_blog($user->user_info[user_id]);

// DELETE NECESSARY ENTRIES
$start = ($p - 1) * $entries_per_page;
if($task == "delete") { $blog->blog_entries_delete($start, $entries_per_page, $sort, $where); }

// GET TOTAL ENTRIES
$total_blogentries = $blog->blog_entries_total($where);

// MAKE ENTRY PAGES
$page_vars = make_page($total_blogentries, $entries_per_page, $p);

// GET ENTRY ARRAY
$blogentries = $blog->blog_entries_list($page_vars[0], $entries_per_page, $sort, $where);



// ASSIGN VARIABLES AND SHOW VIEW ENTRIES PAGE
$smarty->assign('s', $s);
$smarty->assign('d', $d);
$smarty->assign('t', $t);
$smarty->assign('c', $c);
$smarty->assign('search', $search);
$smarty->assign('blogentries', $blogentries);
$smarty->assign('total_blogentries', $total_blogentries);
$smarty->assign('p', $page_vars[1]);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($blogentries));
include "footer.php";
?>