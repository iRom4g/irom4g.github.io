<?
$page = "user_group_edit_comments";
include "header.php";

if(isset($_POST['group_id'])) { $group_id = $_POST['group_id']; } elseif(isset($_GET['group_id'])) { $group_id = $_GET['group_id']; } else { $group_id = 0; }
if(isset($_POST['p'])) { $p = $_POST['p']; } elseif(isset($_GET['p'])) { $p = $_GET['p']; } else { $p = 1; }
if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }

// INITIALIZE GROUP OBJECT
$group = new se_group($user->user_info[user_id], $group_id);

if($group->group_exists == 0) { header("Location: user_group.php"); exit(); }
if($group->user_rank == 0 | $group->user_rank == -1) { header("Location: user_group.php"); exit(); }


// CREATE PROFILE COMMENT OBJECT
$comments_per_page = 10;
$comment = new se_comment('group', 'group_id', $group->group_info[group_id]);


// DELETE NECESSARY COMMENTS
$start = ($p - 1) * $comments_per_page;
if($task == "delete") { $comment->comment_delete_selected($start, $comments_per_page); }


// GET TOTAL COMMENTS
$total_comments = $comment->comment_total();

// MAKE COMMENT PAGES
$page_vars = make_page($total_comments, $comments_per_page, $p);

// GET COMMENT ARRAY
$comments = $comment->comment_list($page_vars[0], $comments_per_page);







// ASSIGN VARIABLES AND DISPLAY MODERATE COMMENTS PAGE
$smarty->assign('group', $group);
$smarty->assign('comments', $comments);
$smarty->assign('total_comments', $total_comments);
$smarty->assign('p', $page_vars[1]);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($comments));
include "footer.php";
?>