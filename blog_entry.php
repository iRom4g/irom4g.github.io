<?
$page = "blog_entry";
include "header.php";

// DISPLAY ERROR PAGE IF USER IS NOT LOGGED IN AND ADMIN SETTING REQUIRES REGISTRATION
if($user->user_exists == 0 & $setting[setting_permission_blog] == 0) {
  $page = "error";
  $smarty->assign('error_header', $blog_entry[13]);
  $smarty->assign('error_message', $blog_entry[23]);
  $smarty->assign('error_submit', $blog_entry[22]);
  include "footer.php";
}

// DISPLAY ERROR PAGE IF NO BLOG OWNER
if($owner->user_exists == 0) {
  $page = "error";
  $smarty->assign('error_header', $blog_entry[13]);
  $smarty->assign('error_message', $blog_entry[12]);
  $smarty->assign('error_submit', $blog_entry[22]);
  include "footer.php";
}

// ENSURE BLOGS ARE ENABLED FOR THIS USER
if($owner->level_info[level_blog_allow] == 0) { header("Location: ".$url->url_create('profile', $owner->user_info[user_username])); exit(); }


if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }
if(isset($_GET['blogentry_id'])) { $blogentry_id = $_GET['blogentry_id']; } elseif(isset($_POST['blogentry_id'])) { $blogentry_id = $_POST['blogentry_id']; } else { $blogentry_id = 0; }

// MAKE SURE ENTRY ID IS SET AND VALID
$blogentry_query = $database->database_query("SELECT se_blogentries.*, se_blogentrycats.blogentrycat_title FROM se_blogentries LEFT JOIN se_blogentrycats ON se_blogentries.blogentry_blogentrycat_id=se_blogentrycats.blogentrycat_id WHERE blogentry_id='$blogentry_id'");
if($database->database_num_rows($blogentry_query) != 1) { header("Location: ".$url->url_create('blog', $owner->user_info[user_username])); exit(); }
$blogentry_info = $database->database_fetch_assoc($blogentry_query);


// GET PRIVACY LEVEL
$privacy_level = $owner->user_privacy_max($user, $owner->level_info[level_blog_privacy]);
if($privacy_level < true_privacy($blogentry_info[blogentry_privacy], $owner->level_info[level_blog_privacy])) {
  $page = "error";
  $smarty->assign('error_header', $blog_entry[13]);
  $smarty->assign('error_message', $blog_entry[1]);
  $smarty->assign('error_submit', $blog_entry[22]);
  include "footer.php";
}


// UPDATE ENTRY VIEWS
$blogentry_views = $blogentry_info[blogentry_views]+1;
$database->database_query("UPDATE se_blogentries SET blogentry_views='$blogentry_views' WHERE blogentry_id='$blogentry_info[blogentry_id]'");

// GET ENTRY COMMENT PRIVACY
$allowed_to_comment = 1;
$comment_level = $owner->user_privacy_max($user, $owner->level_info[level_blog_comments]);
if($comment_level < true_privacy($blogentry_info[blogentry_comments], $owner->level_info[level_blog_comments])) { $allowed_to_comment = 0; }


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
    $database->database_query("INSERT INTO se_blogcomments (blogcomment_blogentry_id, blogcomment_authoruser_id, blogcomment_date, blogcomment_body) VALUES ('$blogentry_info[blogentry_id]', '".$user->user_info[user_id]."', '$comment_date', '$comment_body')");

    // INSERT ACTION IF USER EXISTS
    if($user->user_exists != 0) {
      $commenter = $user->user_info[user_username];
      $comment_body_encoded = $comment_body;
      if(strlen($comment_body_encoded) > 250) { 
        $comment_body_encoded = substr($comment_body_encoded, 0, 240);
        $comment_body_encoded .= "...";
      }
      $comment_body_encoded = htmlspecialchars(str_replace("<br>", " ", $comment_body_encoded));
      $actions->actions_add($user, "blogcomment", Array('[username1]', '[username2]', '[id]', '[comment]'), Array($commenter, $owner->user_info[user_username], $blogentry_id, $comment_body_encoded));
    } else {
      $commenter = $blog_entry[11];
    }

    // SEND COMMENT NOTIFICATION IF NECESSARY
    $owner->user_settings();
    if($owner->usersetting_info[usersetting_notify_blogcomment] == 1 & $owner->user_info[user_id] != $user->user_info[user_id]) { 
      send_generic($owner->user_info[user_email], "$setting[setting_email_fromname] <$setting[setting_email_fromemail]>", $setting[setting_email_blogcomment_subject], $setting[setting_email_blogcomment_message], Array('[username]', '[commenter]', '[link]'), Array($owner->user_info[user_username], $commenter, "<a href=\"".$url->url_create("blog_entry", $owner->user_info[user_username], $blogentry_info[blogentry_id])."\">".$url->url_create("blog_entry", $owner->user_info[user_username], $blogentry_info[blogentry_id])."</a>")); 
    }

  }

  echo "<html><head><script type=\"text/javascript\">";
  echo "window.parent.addComment('$is_error', '$comment_body', '$comment_date');";
  echo "</script></head><body></body></html>";
  exit();
}



// MAKE SURE TITLE IS NOT EMPTY
if($blogentry_info[blogentry_title] == "") { $blogentry_info[blogentry_title] = $blog_entry[5]; }

// CONVERT HTML CHARACTERS BACK
$blogentry_info[blogentry_body] = str_replace("\r\n", "", html_entity_decode($blogentry_info[blogentry_body]));


// GET BLOG COMMENTS
$comment = new se_comment('blog', 'blogentry_id', $blogentry_info[blogentry_id]);
$total_comments = $comment->comment_total();
$comments = $comment->comment_list(0, $total_comments);


// GET CUSTOM BLOG STYLE IF ALLOWED
if($owner->level_info[level_blog_style] != 0) {
  $blogstyle_info = $database->database_fetch_assoc($database->database_query("SELECT blogstyle_css FROM se_blogstyles WHERE blogstyle_user_id='".$owner->user_info[user_id]."' LIMIT 1"));
  $global_css = $blogstyle_info[blogstyle_css];
}





// ASSIGN VARIABLES AND DISPLAY BLOG PAGE
$smarty->assign('comments', $comments);
$smarty->assign('total_comments', $total_comments);
$smarty->assign('blogentry_info', $blogentry_info);
$smarty->assign('allowed_to_comment', $allowed_to_comment);
include "footer.php";
?>