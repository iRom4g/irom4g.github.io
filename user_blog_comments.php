<?
$page = "user_blog_comments";
include "header.php";

if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }
if(isset($_POST['blogentry_id'])) { $blogentry_id = $_POST['blogentry_id']; } elseif(isset($_GET['blogentry_id'])) { $blogentry_id = $_GET['blogentry_id']; } else { $blogentry_id = 0; }
if(isset($_POST['p'])) { $p = $_POST['p']; } elseif(isset($_GET['p'])) { $p = $_GET['p']; } else { $p = 1; }

// ENSURE BLOGS ARE ENABLED FOR THIS USER
if($user->level_info[level_blog_allow] == 0) { header("Location: user_home.php"); exit(); }


// MAKE SURE ENTRY ID IS SET AND VALID
$blogentry_query = $database->database_query("SELECT blogentry_id FROM se_blogentries WHERE blogentry_id='$blogentry_id'");
if($database->database_num_rows($blogentry_query) != 1) { header("Location: user_blog.php"); exit(); }
$blogentry_info = $database->database_fetch_assoc($blogentry_query);


// CREATE BLOG COMMENT OBJECT
$comments_per_page = 10;
$comment = new se_comment('blog', 'blogentry_id', $blogentry_info[blogentry_id]);


// DELETE NECESSARY COMMENTS
$start = ($p - 1) * $comments_per_page;
if($task == "delete") { $comment->comment_delete_selected($start, $comments_per_page); }


// GET TOTAL COMMENTS
$total_comments = $comment->comment_total();

// MAKE COMMENT PAGES
$page_vars = make_page($total_comments, $comments_per_page, $p);

// GET COMMENT ARRAY
$comments = $comment->comment_list($page_vars[0], $comments_per_page);



// ASSIGN VARIABLES AND SHOW BLOG COMMENTS PAGE
$smarty->assign('blogentry_id', $blogentry_id);
$smarty->assign('comments', $comments);
$smarty->assign('total_comments', $total_comments);
$smarty->assign('p', $page_vars[1]);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($comments));
include "footer.php";
?>