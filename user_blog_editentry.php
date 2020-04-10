<?
$page = "user_blog_editentry";
include "header.php";

if(isset($_POST['task'])) { $task = $_POST['task']; } else { $task = "main"; }
if(isset($_GET['blogentry_id'])) { $blogentry_id = $_GET['blogentry_id']; } elseif(isset($_POST['blogentry_id'])) { $blogentry_id = $_POST['blogentry_id']; } else { $blogentry_id = 0; }

// ENSURE BLOGS ARE ENABLED FOR THIS USER
if($user->level_info[level_blog_allow] == 0) { header("Location: user_home.php"); exit(); }

// MAKE SURE THIS BLOG ENTRY BELONGS TO THIS USER AND IS NUMERIC
$blogentry = $database->database_query("SELECT * FROM se_blogentries WHERE blogentry_id='$blogentry_id' AND blogentry_user_id='".$user->user_info[user_id]."' LIMIT 1");
if($database->database_num_rows($blogentry) != 1) { header("Location: user_blog.php"); exit(); }
$blogentry_info = $database->database_fetch_assoc($blogentry);

// START BLOG METHOD 
$blog = new se_blog($user->user_info[user_id]);


// EDIT THIS ENTRY
if($task == "doedit") {
  $blogentry_title = $_POST['blogentry_title'];
  $blogentry_body = $_POST['blogentry_body'];
  $blogentry_blogentrycat_id = $_POST['blogentry_blogentrycat_id'];
  $blogentry_search = $_POST['blogentry_search'];
  $blogentry_privacy = $_POST['blogentry_privacy'];
  $blogentry_comments = $_POST['blogentry_comments'];

  // POST ENTRY
  $blog->blog_entry_post($blogentry_id, $blogentry_title, $blogentry_body, $blogentry_blogentrycat_id, $blogentry_search, $blogentry_privacy, $blogentry_comments);
 
  // UPDATE LAST UPDATE DATE (SAY THAT 10 TIMES FAST)
  $user->user_lastupdate();

  // SEND USER BACK TO VIEW ENTRIES PAGE
  header("Location: user_blog.php");
  exit();
}


// CONVERT HTML CHARACTERS BACK
$blogentry_info[blogentry_body] = str_replace("\r\n", "", html_entity_decode($blogentry_info[blogentry_body]));


// GET BLOG ENTRY CATEGORIES
$blogentrycats_query = $database->database_query("SELECT * FROM se_blogentrycats ORDER BY blogentrycat_id ASC");
$blogentrycats_array = Array();
while($blogentrycat = $database->database_fetch_assoc($blogentrycats_query)) {
  $blogentrycats_array[] = Array('blogentrycat_id' => $blogentrycat[blogentrycat_id],
			       'blogentrycat_title' => $blogentrycat[blogentrycat_title]);
}


// GET TOTAL COMMENTS POSTED ON THIS ENTRY
$comments_total = $database->database_num_rows($database->database_query("SELECT blogcomment_id FROM se_blogcomments WHERE blogcomment_blogentry_id='$blogentry_info[blogentry_id]'"));


// GET AVAILABLE BLOG PRIVACY OPTIONS
$privacy_options = Array();
for($p=0;$p<strlen($user->level_info[level_blog_privacy]);$p++) {
  $privacy_level = substr($user->level_info[level_blog_privacy], $p, 1);
  if(user_privacy_levels($privacy_level) != "") {
    $privacy_options[] = Array('privacy_id' => "blog_privacy".$privacy_level,
				'privacy_value' => $privacy_level,
				'privacy_option' => user_privacy_levels($privacy_level));
  }
}


// GET AVAILABLE BLOG COMMENT OPTIONS
$comment_options = Array();
for($p=0;$p<strlen($user->level_info[level_blog_comments]);$p++) {
  $comment_level = substr($user->level_info[level_blog_comments], $p, 1);
  if(user_privacy_levels($comment_level) != "") {
    $comment_options[] = Array('comment_id' => "blog_comment".$comment_level,
				'comment_value' => $comment_level,
				'comment_option' => user_privacy_levels($comment_level));
  }
}



// ASSIGN VARIABLES AND SHOW EDIT BLOG ENTRY PAGE
$smarty->assign('blogentrycats', $blogentrycats_array);
$smarty->assign('blogentry_info', $blogentry_info);
$smarty->assign('blogentry_privacy', true_privacy($blogentry_info[blogentry_privacy], $user->level_info[level_blog_privacy]));
$smarty->assign('blogentry_comments', true_privacy($blogentry_info[blogentry_comments], $user->level_info[level_blog_comments]));
$smarty->assign('search_blogs', $user->level_info[level_blog_search]);
$smarty->assign('privacy_options', $privacy_options);
$smarty->assign('comment_options', $comment_options);
$smarty->assign('comments_total', $comments_total);
include "footer.php";
?>