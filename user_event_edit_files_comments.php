<?
$page = "user_event_edit_files_comments";
include "header.php";


if(isset($_GET['event_id'])) { $event_id = $_GET['event_id']; } elseif(isset($_POST['event_id'])) { $event_id = $_POST['event_id']; } else { $event_id = 0; }
if(isset($_POST['eventmedia_id'])) { $eventmedia_id = $_POST['eventmedia_id']; } elseif(isset($_GET['eventmedia_id'])) { $eventmedia_id = $_GET['eventmedia_id']; } else { $eventmedia_id = 0; }
if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }
if(isset($_POST['p'])) { $p = $_POST['p']; } elseif(isset($_GET['p'])) { $p = $_GET['p']; } else { $p = 1; }

// INITIALIZE EVENT OBJECT
$event = new se_event($user->user_info[user_id], $event_id);

if($event->event_exists == 0) { header("Location: user_event.php"); exit(); }
if($event->event_info[event_user_id] != $user->user_info[user_id]) { header("Location: user_event.php"); exit(); }

// GET EVENT ALBUM INFO
$eventalbum_info = $database->database_fetch_assoc($database->database_query("SELECT * FROM se_eventalbums WHERE eventalbum_event_id='".$event->event_info[event_id]."' LIMIT 1"));

// MAKE SURE MEDIA EXISTS
$eventmedia_query = $database->database_query("SELECT * FROM se_eventmedia WHERE eventmedia_id='$eventmedia_id' AND eventmedia_eventalbum_id='$eventalbum_info[eventalbum_id]' LIMIT 1");
if($database->database_num_rows($eventmedia_query) != 1) { header("Location: user_event_edit_files.php?event_id=".$event->event_info[event_id]); exit(); }
$eventmedia_info = $database->database_fetch_assoc($eventmedia_query);




// CREATE MEDIA COMMENT OBJECT
$comments_per_page = 10;
$comment = new se_comment('eventmedia', 'eventmedia_id', $eventmedia_info[eventmedia_id]);


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
$smarty->assign('eventmedia_id', $eventmedia_info[eventmedia_id]);
$smarty->assign('event', $event);
$smarty->assign('comments', $comments);
$smarty->assign('total_comments', $total_comments);
$smarty->assign('p', $page_vars[1]);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($comments));
include "footer.php";
?>