<?
$page = "user_group_edit_files_comments";
include "header.php";


if(isset($_GET['group_id'])) { $group_id = $_GET['group_id']; } elseif(isset($_POST['group_id'])) { $group_id = $_POST['group_id']; } else { $group_id = 0; }
if(isset($_POST['groupmedia_id'])) { $groupmedia_id = $_POST['groupmedia_id']; } elseif(isset($_GET['groupmedia_id'])) { $groupmedia_id = $_GET['groupmedia_id']; } else { $groupmedia_id = 0; }
if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }
if(isset($_POST['p'])) { $p = $_POST['p']; } elseif(isset($_GET['p'])) { $p = $_GET['p']; } else { $p = 1; }

// INITIALIZE GROUP OBJECT
$group = new se_group($user->user_info[user_id], $group_id);

if($group->group_exists == 0) { header("Location: user_group.php"); exit(); }
if($group->user_rank == 0 | $group->user_rank == -1) { header("Location: user_group.php"); exit(); }

// GET GROUP ALBUM INFO
$groupalbum_info = $database->database_fetch_assoc($database->database_query("SELECT * FROM se_groupalbums WHERE groupalbum_group_id='".$group->group_info[group_id]."' LIMIT 1"));

// MAKE SURE MEDIA EXISTS
$groupmedia_query = $database->database_query("SELECT * FROM se_groupmedia WHERE groupmedia_id='$groupmedia_id' AND groupmedia_groupalbum_id='$groupalbum_info[groupalbum_id]' LIMIT 1");
if($database->database_num_rows($groupmedia_query) != 1) { header("Location: user_group_edit_files.php?group_id=".$group->group_info[group_id]); exit(); }
$groupmedia_info = $database->database_fetch_assoc($groupmedia_query);




// CREATE MEDIA COMMENT OBJECT
$comments_per_page = 10;
$comment = new se_comment('groupmedia', 'groupmedia_id', $groupmedia_info[groupmedia_id]);


// DELETE NECESSARY COMMENTS
$start = ($p - 1) * $comments_per_page;
if($task == "delete") { $comment->comment_delete_selected($start, $comments_per_page); }


// GET TOTAL COMMENTS
$total_comments = $comment->comment_total();

// MAKE COMMENT PAGES
$page_vars = make_page($total_comments, $comments_per_page, $p);

// GET COMMENT ARRAY
$comments = $comment->comment_list($page_vars[0], $comments_per_page);



// ASSIGN VARIABLES AND SHOW ALBUM COMMENTS PAGE
$smarty->assign('groupmedia_id', $groupmedia_info[groupmedia_id]);
$smarty->assign('group', $group);
$smarty->assign('comments', $comments);
$smarty->assign('total_comments', $total_comments);
$smarty->assign('p', $page_vars[1]);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($comments));
include "footer.php";
?>