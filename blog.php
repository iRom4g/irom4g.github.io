<?
$page = "blog";
include "header.php";


// DISPLAY ERROR PAGE IF USER IS NOT LOGGED IN AND ADMIN SETTING REQUIRES REGISTRATION
if($user->user_exists == 0 & $setting[setting_permission_blog] == 0) {
  $page = "error";
  $smarty->assign('error_header', $blog[12]);
  $smarty->assign('error_message', $blog[13]);
  $smarty->assign('error_submit', $blog[14]);
  include "footer.php";
}

// DISPLAY ERROR PAGE IF NO BLOG OWNER
if($owner->user_exists == 0) {
  $page = "error";
  $smarty->assign('error_header', $blog[12]);
  $smarty->assign('error_message', $blog[1]);
  $smarty->assign('error_submit', $blog[14]);
  include "footer.php";
}

// ENSURE BLOGS ARE ENABLED FOR THIS USER
if($owner->level_info[level_blog_allow] == 0) { header("Location: ".$url->url_create('profile', $owner->user_info[user_username])); exit(); }


if(isset($_POST['p'])) { $p = $_POST['p']; } elseif(isset($_GET['p'])) { $p = $_GET['p']; } else { $p = 1; }

// SET PRIVACY LEVEL AND WHERE CLAUSE
$privacy_level = $owner->user_privacy_max($user, $owner->level_info[level_blog_privacy]);
$min_privacy = true_privacy(0, $owner->level_info[level_blog_privacy]);
$where = "((blogentry_privacy>='$min_privacy' AND blogentry_privacy<='$privacy_level') OR (blogentry_privacy<'$min_privacy' AND '$min_privacy'<='$privacy_level'))";


// CREATE BLOG OBJECT
$entries_per_page = (int)$owner->level_info[level_blog_entries];
if($entries_per_page <= 0) { $entries_per_page = 10; }
$blog = new se_blog($owner->user_info[user_id]);


// GET TOTAL ENTRIES
$total_blogentries = $blog->blog_entries_total($where);

// MAKE ENTRY PAGES
$page_vars = make_page($total_blogentries, $entries_per_page, $p);

// GET ENTRY ARRAY
$blogentries = $blog->blog_entries_list($page_vars[0], $entries_per_page, "blogentry_date DESC", $where);

// GET CUSTOM BLOG STYLE IF ALLOWED
if($owner->level_info[level_blog_style] != 0) {
  $blogstyle_info = $database->database_fetch_assoc($database->database_query("SELECT blogstyle_css FROM se_blogstyles WHERE blogstyle_user_id='".$owner->user_info[user_id]."' LIMIT 1"));
  $global_css = $blogstyle_info[blogstyle_css];
}



// ASSIGN VARIABLES AND DISPLAY BLOG PAGE
$smarty->assign('entries', $blogentries);
$smarty->assign('total_blogentries', $total_blogentries);
$smarty->assign('p', $page_vars[1]);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($blogentries));
include "footer.php";
?>