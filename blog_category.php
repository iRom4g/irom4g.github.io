<?
$page = "blog_category";
include "header.php";

if(isset($_POST['p'])) { $p = $_POST['p']; } elseif(isset($_GET['p'])) { $p = $_GET['p']; } else { $p = 1; }
if(isset($_POST['blogentrycat_id'])) { $blogentrycat_id = $_POST['blogentrycat_id']; } elseif(isset($_GET['blogentrycat_id'])) { $blogentrycat_id = $_GET['blogentrycat_id']; } else { $blogentrycat_id = 0; }

// ENSURE BLOG ENTRY CATEGORY EXISTS
$blogentrycat_query = $database->database_query("SELECT * FROM se_blogentrycats WHERE blogentrycat_id='$blogentrycat_id' LIMIT 1");
if($database->database_num_rows($blogentrycat_query) != 1) { header("Location: home.php"); exit; }
$blogentrycat_info = $database->database_fetch_assoc($blogentrycat_query);


// CREATE BLOG OBJECT
$blog = new se_blog();

// ADD CRITERIA FOR PRIVACY
if($user->user_exists != 0) { $privacy_level = 1; } else { $privacy_level == 0; }
$where = "(blogentry_blogentrycat_id='$blogentrycat_info[blogentrycat_id]' AND blogentry_privacy<='$privacy_level')";

// GET TOTAL ENTRIES
$total_blogentries = $blog->blog_entries_total($where);

// MAKE ENTRY PAGES
$entries_per_page = 10;
$page_vars = make_page($total_blogentries, $entries_per_page, $p);

// GET ENTRY ARRAY
$blogentries = $blog->blog_entries_list($page_vars[0], $entries_per_page, "blogentry_date", $where);




// ASSIGN VARIABLES AND DISPLAY BLOG PAGE
$smarty->assign('blogentrycat_id', $blogentrycat_id);
$smarty->assign('blogentrycat_title', $blogentrycat_info[blogentrycat_title]);
$smarty->assign('entries', $blogentries);
$smarty->assign('total_blogentries', $total_blogentries);
$smarty->assign('p', $page_vars[1]);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($blogentries));
include "footer.php";
?>