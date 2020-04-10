<?
$page = "user_blog_deleteentry";
include "header.php";

if(isset($_POST['task'])) { $task = $_POST['task']; } else { $task = "main"; }
if(isset($_GET['blogentry_id'])) { $blogentry_id = $_GET['blogentry_id']; } elseif(isset($_POST['blogentry_id'])) { $blogentry_id = $_POST['blogentry_id']; } else { $blogentry_id = 0; }

// ENSURE BLOGS ARE ENABLED FOR THIS USER
if($user->level_info[level_blog_allow] == 0) { header("Location: user_home.php"); exit(); }

// MAKE SURE THIS BLOG ENTRY BELONGS TO THIS USER AND IS NUMERIC
$blogentry = $database->database_query("SELECT * FROM se_blogentries WHERE blogentry_id='$blogentry_id' AND blogentry_user_id='".$user->user_info[user_id]."' LIMIT 1");
if($database->database_num_rows($blogentry) != 1) { header("Location: user_blog.php"); exit(); }


// START BLOG METHOD 
$blog = new se_blog($user->user_info[user_id]);




// DELETE THIS ENTRY
if($task == "dodelete") {

  $blog->blog_entry_delete($blogentry_id);

  header("Location: user_blog.php");
  exit();
}


// ASSIGN SMARTY VARIABLES AND DISPLAY DELETE ENTRY PAGE
$smarty->assign('blogentry_id', $blogentry_id);
include "footer.php";
?>