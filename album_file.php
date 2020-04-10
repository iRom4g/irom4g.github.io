<?
$page = "album_file";
include "header.php";


// DISPLAY ERROR PAGE IF USER IS NOT LOGGED IN AND ADMIN SETTING REQUIRES REGISTRATION
if($user->user_exists == 0 & $setting[setting_permission_album] == 0) {
  $page = "error";
  $smarty->assign('error_header', $album_file[17]);
  $smarty->assign('error_message', $album_file[18]);
  $smarty->assign('error_submit', $album_file[24]);
  include "footer.php";
}

// DISPLAY ERROR PAGE IF NO ALBUM OWNER
if($owner->user_exists == 0) {
  $page = "error";
  $smarty->assign('error_header', $album_file[17]);
  $smarty->assign('error_message', $album_file[1]);
  $smarty->assign('error_submit', $album_file[24]);
  include "footer.php";
}

// ENSURE ALBUMS ARE ENABLED FOR THIS USER
if($owner->level_info[level_album_allow] == 0) { header("Location: ".$url->url_create('profile', $owner->user_info[user_username])); exit(); }

if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }
if(isset($_POST['album_id'])) { $album_id = $_POST['album_id']; } elseif(isset($_GET['album_id'])) { $album_id = $_GET['album_id']; } else { $album_id = 0; }
if(isset($_POST['media_id'])) { $media_id = $_POST['media_id']; } elseif(isset($_GET['media_id'])) { $media_id = $_GET['media_id']; } else { $media_id = 0; }

// BE SURE ALBUM BELONGS TO THIS USER
$album = $database->database_query("SELECT * FROM se_albums WHERE album_id='$album_id' AND album_user_id='".$owner->user_info[user_id]."'");
if($database->database_num_rows($album) != 1) { header("Location: ".$url->url_create('albums', $owner->user_info[user_username])); exit(); }
$album_info = $database->database_fetch_assoc($album);

// CHECK PRIVACY
$privacy_level = $owner->user_privacy_max($user, $owner->level_info[level_album_privacy]);
if($privacy_level < true_privacy($album_info[album_privacy], $owner->level_info[level_album_privacy])) {
  // ASSIGN VARIABLES AND DISPLAY ERROR PAGE
  $page = "error";
  $smarty->assign('error_header', $album_file[17]);
  $smarty->assign('error_message', $album_file[2]);
  $smarty->assign('error_submit', $album_file[24]);
  include "footer.php";
}

// MAKE SURE MEDIA EXISTS
$media_query = $database->database_query("SELECT * FROM se_media WHERE media_id='$media_id' AND media_album_id='$album_id' LIMIT 1");
if($database->database_num_rows($media_query) != 1) { header("Location: ".$url->url_create('album', $owner->user_info[user_username], $album_id)); exit(); }
$media_info = $database->database_fetch_assoc($media_query);

// GET ALBUM COMMENT PRIVACY
$allowed_to_comment = 1;
$comment_level = $owner->user_privacy_max($user, $owner->level_info[level_album_comments]);
if($comment_level < true_privacy($album_info[album_comments], $owner->level_info[level_album_comments])) { $allowed_to_comment = 0; }



// IF A COMMENT IS BEING POSTED
if($task == "dopost" & $allowed_to_comment != 0) {

  $comment_date = time();
  $comment_body = $_POST['comment_body'];

  // RETRIEVE AND CHECK SECURITY CODE IF NECESSARY
  if($setting[setting_comment_code] != 0) {
    session_start();
    $code = $_SESSION['code'];
    if($code == "") { $code = randomcode(); }
    $comment_secure = $_POST['comment_secure'];

    if($comment_secure != $code) { $is_error = 1; }
  }

  // MAKE SURE COMMENT BODY IS NOT EMPTY
  $comment_body = censor(str_replace("\r\n", "<br>", $comment_body));
  $comment_body = preg_replace('/(<br>){3,}/is', '<br><br>', $comment_body);
  $comment_body = ChopText($comment_body);
  if(str_replace(" ", "", $comment_body) == "") { $is_error = 1; $comment_body = ""; }

  // ADD COMMENT IF NO ERROR
  if($is_error == 0) {
    $database->database_query("INSERT INTO se_mediacomments (mediacomment_media_id, mediacomment_authoruser_id, mediacomment_date, mediacomment_body) VALUES ('$media_info[media_id]', '".$user->user_info[user_id]."', '$comment_date', '$comment_body')");

    // INSERT ACTION IF USER EXISTS
    if($user->user_exists != 0) {
      $commenter = $user->user_info[user_username];
      $comment_body_encoded = $comment_body;
      if(strlen($comment_body_encoded) > 250) { 
        $comment_body_encoded = substr($comment_body_encoded, 0, 240);
        $comment_body_encoded .= "...";
      }
      $comment_body_encoded = htmlspecialchars(str_replace("<br>", " ", $comment_body_encoded));
      $actions->actions_add($user, "mediacomment", Array('[username1]', '[username2]', '[albumid]', '[mediaid]', '[comment]'), Array($commenter, $owner->user_info[user_username], $album_info[album_id], $media_info[media_id], $comment_body_encoded));
    } else { 
      $commenter = $album_file[19];
    }

    // SEND COMMENT NOTIFICATION IF NECESSARY
    $owner->user_settings();
    if($owner->usersetting_info[usersetting_notify_mediacomment] == 1 & $owner->user_info[user_id] != $user->user_info[user_id]) { 
      if($user->user_exists != 0) { $commenter = $user->user_info[user_username]; } else { $commenter = $album_file[19]; }
      send_generic($owner->user_info[user_email], "$setting[setting_email_fromname] <$setting[setting_email_fromemail]>", $setting[setting_email_mediacomment_subject], $setting[setting_email_mediacomment_message], Array('[username]', '[commenter]', '[link]'), Array($owner->user_info[user_username], $commenter, "<a href=\"".$url->url_create("album_file", $owner->user_info[user_username], $album_info[album_id], $media_info[media_id])."\">".$url->url_create("album_file", $owner->user_info[user_username], $album_info[album_id], $media_info[media_id])."</a>")); 
    }
  }

  echo "<html><head><script type=\"text/javascript\">";
  echo "window.parent.addComment('$is_error', '$comment_body', '$comment_date');";
  echo "</script></head><body></body></html>";
  exit();
}



// UPDATE ALBUM VIEWS
$album_views_new = $album_info[album_views] + 1;
$database->database_query("UPDATE se_albums SET album_views='$album_views_new' WHERE album_id='$album_info[album_id]' LIMIT 1");



// GET MEDIA COMMENTS
$comment = new se_comment('media', 'media_id', $media_info[media_id]);
$total_comments = $comment->comment_total();
$comments = $comment->comment_list(0, $total_comments);


// GET CUSTOM ALBUM STYLE IF ALLOWED
if($owner->level_info[level_album_style] != 0) {
  $albumstyle_info = $database->database_fetch_assoc($database->database_query("SELECT albumstyle_css FROM se_albumstyles WHERE albumstyle_user_id='".$owner->user_info[user_id]."' LIMIT 1"));
  $global_css = $albumstyle_info[albumstyle_css];
}



// CREATE BACK MENU LINK
$back = $database->database_query("SELECT media_id FROM se_media WHERE media_album_id='$media_info[media_album_id]' AND media_id<'$media_id' ORDER BY media_id DESC LIMIT 1");
if($database->database_num_rows($back) == 1) {
  $back_info = $database->database_fetch_assoc($back);
  $link_back = $url->url_create("album_file", $owner->user_info[user_username], $album_id, $back_info[media_id]); 
} else {
  $link_back = "#";
}

// CREATE FIRST MENU LINK
$first = $database->database_query("SELECT media_id FROM se_media WHERE media_album_id='$media_info[media_album_id]' ORDER BY media_id ASC LIMIT 1");
if($database->database_num_rows($first) == 1 AND $link_back != "#") {
  $first_info = $database->database_fetch_assoc($first);
  $link_first = $url->url_create("album_file", $owner->user_info[user_username], $album_id, $first_info[media_id]); 
} else {
  $link_first = "#";
}

// CREATE NEXT MENU LINK
$next = $database->database_query("SELECT media_id FROM se_media WHERE media_album_id='$media_info[media_album_id]' AND media_id>'$media_id' ORDER BY media_id ASC LIMIT 1");
if($database->database_num_rows($next) == 1) {
  $next_info = $database->database_fetch_assoc($next);
  $link_next = $url->url_create("album_file", $owner->user_info[user_username], $album_id, $next_info[media_id]); 
} else {
  $link_next = "#";
}

// CREATE END MENU LINK
$end = $database->database_query("SELECT media_id FROM se_media WHERE media_album_id='$media_info[media_album_id]' ORDER BY media_id DESC LIMIT 1");
if($database->database_num_rows($end) == 1 AND $link_next != "#") {
  $end_info = $database->database_fetch_assoc($end);
  $link_end = $url->url_create("album_file", $owner->user_info[user_username], $album_id, $end_info[media_id]); 
} else {
  $link_end = "#";
}





// ASSIGN VARIABLES AND DISPLAY ALBUM FILE PAGE
$smarty->assign('album_info', $album_info);
$smarty->assign('media_info', $media_info);
$smarty->assign('comments', $comments);
$smarty->assign('total_comments', $total_comments);
$smarty->assign('allowed_to_comment', $allowed_to_comment);
$smarty->assign('link_first', $link_first);
$smarty->assign('link_back', $link_back);
$smarty->assign('link_next', $link_next);
$smarty->assign('link_end', $link_end);
include "footer.php";
?>