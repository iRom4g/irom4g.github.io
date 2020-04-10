<?
// REAL PAGE
// $page = "user_blog_preview";

// INCLUDE ALL THE APPROPRIATE LANGUAGE VARIABLES
$page = "blog_entry"; 
include "header.php";


// IS PREVIEW AJAX MOD
$smarty->assign('page_is_preview', 1);


// ENSURE BLOGS ARE ENABLED FOR THIS USER
if($user->level_info[level_blog_allow] == 0) { header("Location: user_home.php"); exit(); }

// SET OWNER AS CURRENT USER
$owner = $user;

// CHECK IF PREVIEW OF OLD ENTRY OR NEW ENTRY
$blogentry_id = $_POST['blogentry_id'];
$entry_query = $database->database_query("SELECT * FROM se_blogentries WHERE blogentry_id='$blogentry_id' AND blogentry_user_id='".$user->user_info[user_id]."'");
if($database->database_num_rows($entry_query) != 1) { 
  $blogentry_info[blogentry_id] = 0;
  $blogentry_info[blogentry_date] = time();
  $blogentry_info[blogentry_views] = 0;
  $blogentry_info[blogentry_privacy] = 0;
  $blogentry_info[blogentry_comments] = 0;
} else {
  $blogentry_info = $database->database_fetch_assoc($entry_query);
}

// INCLUDE FILTER CLASS
include "./include/class_inputfilter.php";
$xssFilter = new InputFilter("", "", 1, 1, 1);

$blogentry_info[blogentry_title] = censor(stripslashes($_POST['blogentry_title']));
$blogentry_info[blogentry_body] = $xssFilter->process(censor(stripslashes($_POST['blogentry_body'])));
$blogentry_info[blogentry_blogentrycat_id] = $_POST['blogentry_blogentrycat_id'];



// GET TITLE OF BLOG ENTRY CATEGORY
$entrycat_info = $database->database_fetch_assoc($database->database_query("SELECT blogentrycat_title FROM se_blogentrycats WHERE blogentrycat_id='$blogentry_info[blogentry_blogentrycat_id]' LIMIT 1"));
$blogentry_info[blogentrycat_title] = $entrycat_info[blogentrycat_title];


// SET COMMENTING
$allowed_to_comment = 0;

// MAKE SURE TITLE IS NOT EMPTY
if($blogentry_info[blogentry_title] == "") { $blogentry_info[blogentry_title] = $user_blog_preview[1]; }

// CONVERT HTML CHARACTERS BACK
$blogentry_info[blogentry_body] = str_replace("\r\n", "", html_entity_decode($blogentry_info[blogentry_body]));


// GET PROFILE COMMENTS
$comment = new se_comment('blog', 'blogentry_id', $blogentry_info[blogentry_id]);
$total_comments = $comment->comment_total();
$comments = $comment->comment_list(0, $total_comments);


// GET CUSTOM BLOG STYLE IF ALLOWED
if($user->level_info[level_blog_style] != 0) {
  $blogstyle_info = $database->database_fetch_assoc($database->database_query("SELECT blogstyle_css FROM se_blogstyles WHERE blogstyle_user_id='".$user->user_info[user_id]."' LIMIT 1"));
  $global_css = $blogstyle_info[blogstyle_css];
}




// ASSIGN VARIABLES AND DISPLAY BLOG PREVIEW PAGE
$smarty->assign('comments', $comments);
$smarty->assign('total_comments', $total_comments);
$smarty->assign('blogentry_info', $blogentry_info);
$smarty->assign('allowed_to_comment', $allowed_to_comment);
include "footer.php";
?>