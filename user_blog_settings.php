<?
$page = "user_blog_settings";
include "header.php";

if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }

// ENSURE BLOGS ARE ENABLED FOR THIS USER
if($user->level_info[level_blog_allow] == 0) { header("Location: user_home.php"); exit(); }

// SET VARS
$result = 0;


// SAVE NEW CSS
if($task == "dosave") {
  $style_blog = addslashes(strip_tags(htmlspecialchars_decode($_POST['style_blog'], ENT_QUOTES)));
  $usersetting_notify_blogcomment = $_POST['usersetting_notify_blogcomment'];


  $database->database_query("UPDATE se_blogstyles SET blogstyle_css='$style_blog' WHERE blogstyle_user_id='".$user->user_info[user_id]."'");
  $database->database_query("UPDATE se_usersettings SET usersetting_notify_blogcomment='$usersetting_notify_blogcomment' WHERE usersetting_user_id='".$user->user_info[user_id]."'");
  $user->user_lastupdate();
  $user = new se_user(Array($user->user_info[user_id]));
  $result = 1;
}



// GET THIS USER'S BLOG CSS
$style_query = $database->database_query("SELECT blogstyle_css FROM se_blogstyles WHERE blogstyle_user_id='".$user->user_info[user_id]."' LIMIT 1");
if($database->database_num_rows($style_query) == 1) { 
  $style_info = $database->database_fetch_assoc($style_query); 
} else {
  $database->database_query("INSERT INTO se_blogstyles (blogstyle_user_id, blogstyle_css) VALUES ('".$user->user_info[user_id]."', '')");
  $style_info = $database->database_fetch_assoc($database->database_query("SELECT blogstyle_css FROM se_blogstyles WHERE blogstyle_user_id='".$user->user_info[user_id]."' LIMIT 1")); 
}


// ASSIGN USER SETTINGS
$user->user_settings();

// ASSIGN SMARTY VARIABLES AND DISPLAY BLOG STYLE PAGE
$smarty->assign('style_blog', htmlspecialchars($style_info[blogstyle_css]));
$smarty->assign('result', $result);
include "footer.php";
?>