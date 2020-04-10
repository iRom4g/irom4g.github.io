<?
$page = "user_blog_newentry";
include "header.php";

if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }

// ENSURE BLOGS ARE ENABLED FOR THIS USER
if($user->level_info[level_blog_allow] == 0) { header("Location: user_home.php"); exit(); }


// START BLOG METHOD 
$blog = new se_blog($user->user_info[user_id]);

// BEGIN POST ENTRY TASK
if($task == "dosave") {
  $blogentry_title = $_POST['blogentry_title'];
  $blogentry_body = $_POST['blogentry_body'];
  $blogentry_blogentrycat_id = $_POST['blogentry_blogentrycat_id'];
  $blogentry_search = $_POST['blogentry_search'];
  $blogentry_privacy = $_POST['blogentry_privacy'];
  $blogentry_comments = $_POST['blogentry_comments'];

  // POST ENTRY
  $blog->blog_entry_post(0, $blogentry_title, $blogentry_body, $blogentry_blogentrycat_id, $blogentry_search, $blogentry_privacy, $blogentry_comments);
 
  // UPDATE LAST UPDATE DATE (SAY THAT 10 TIMES FAST)
  $user->user_lastupdate();

  // INSERT ACTION
  $newentry_query = $database->database_query("SELECT blogentry_id FROM se_blogentries WHERE blogentry_user_id='".$user->user_info[user_id]."' ORDER BY blogentry_id DESC LIMIT 1");
  $newentry_info = $database->database_fetch_assoc($newentry_query);
  if(strlen($blogentry_title) > 100) { $blogentry_title = substr($blogentry_title, 0, 97); $blogentry_title .= "..."; }
  $actions->actions_add($user, "postblog", Array('[username]', '[id]', '[title]'), Array($user->user_info[user_username], $newentry_info[blogentry_id], $blogentry_title));

  // SEND USER BACK TO VIEW ENTRIES PAGE
  header("Location: user_blog.php");
  exit();

}


// GET BLOG ENTRY CATEGORIES
$blogentrycats_query = $database->database_query("SELECT * FROM se_blogentrycats ORDER BY blogentrycat_id ASC");
$blogentrycats_array = Array();
while($blogentrycat = $database->database_fetch_assoc($blogentrycats_query)) {
  $blogentrycats_array[] = Array('blogentrycat_id' => $blogentrycat[blogentrycat_id],
			       'blogentrycat_title' => $blogentrycat[blogentrycat_title]);
}


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


// ASSIGN VARIABLES AND SHOW NEW BLOGENTRY PAGE
$smarty->assign('blogentrycats', $blogentrycats_array);
$smarty->assign('privacy_options', $privacy_options);
$smarty->assign('comment_options', $comment_options);
include "footer.php";
?>