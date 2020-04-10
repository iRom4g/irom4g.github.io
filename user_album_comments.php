<?
$page = "user_album_comments";
include "header.php";

if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }
if(isset($_POST['album_id'])) { $album_id = $_POST['album_id']; } elseif(isset($_GET['album_id'])) { $album_id = $_GET['album_id']; } else { $album_id = 0; }
if(isset($_POST['media_id'])) { $media_id = $_POST['media_id']; } elseif(isset($_GET['media_id'])) { $media_id = $_GET['media_id']; } else { $media_id = 0; }
if(isset($_POST['p'])) { $p = $_POST['p']; } elseif(isset($_GET['p'])) { $p = $_GET['p']; } else { $p = 1; }


// ENSURE ALBUMS ARE ENABLED FOR THIS USER
if($user->level_info[level_album_allow] == 0) { header("Location: user_home.php"); exit(); }


// BE SURE ALBUM BELONGS TO THIS USER
$album = $database->database_query("SELECT * FROM se_albums WHERE album_id='$album_id' AND album_user_id='".$user->user_info[user_id]."'");
if($database->database_num_rows($album) != 1) { header("Location: user_album.php"); exit(); }
$album_info = $database->database_fetch_assoc($album);

// MAKE SURE MEDIA EXISTS
$media_query = $database->database_query("SELECT * FROM se_media WHERE media_id='$media_id' AND media_album_id='$album_id' LIMIT 1");
if($database->database_num_rows($media_query) != 1) { header("Location: user_album_update.php?album_id=$album_id"); exit(); }
$media_info = $database->database_fetch_assoc($media_query);



// CREATE MEDIA COMMENT OBJECT
$comments_per_page = 10;
$comment = new se_comment('media', 'media_id', $media_info[media_id]);


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
$smarty->assign('media_id', $media_id);
$smarty->assign('album_id', $album_id);
$smarty->assign('comments', $comments);
$smarty->assign('total_comments', $total_comments);
$smarty->assign('p', $page_vars[1]);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($comments));
include "footer.php";
?>