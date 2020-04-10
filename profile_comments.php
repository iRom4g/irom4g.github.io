<?
$page = "profile_comments";
include "header.php";

if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }
if(isset($_POST['p'])) { $p = $_POST['p']; } elseif(isset($_GET['p'])) { $p = $_GET['p']; } else { $p = 1; }

// DISPLAY ERROR PAGE IF USER IS NOT LOGGED IN AND ADMIN SETTING REQUIRES REGISTRATION
if($user->user_exists == 0 & $setting[setting_permission_profile] == 0) {
  $page = "error";
  $smarty->assign('error_header', $profile_comments[20]);
  $smarty->assign('error_message', $profile_comments[22]);
  $smarty->assign('error_submit', $profile_comments[23]);
  include "footer.php";
}

// DISPLAY ERROR PAGE IF NO OWNER
if($owner->user_exists == 0) {
  $page = "error";
  $smarty->assign('error_header', $profile_comments[20]);
  $smarty->assign('error_message', $profile_comments[21]);
  $smarty->assign('error_submit', $profile_comments[23]);
  include "footer.php";
}

// GET PRIVACY LEVEL
$privacy_level = $owner->user_privacy_max($user, $owner->level_info[level_profile_privacy]);
$allowed_privacy = true_privacy($owner->user_info[user_privacy_profile], $owner->level_info[level_profile_privacy]);
if($privacy_level < $allowed_privacy) { header("Location: ".$url->url_create('profile', $owner->user_info[user_username])); exit(); }


// SET VARS
$is_error = 0;
$refresh = 0;
$allowed_to_comment = 1;


// CHECK IF USER IS ALLOWED TO COMMENT
$comment_level = $owner->user_privacy_max($user, $owner->level_info[level_profile_comments]);
$allowed_comment = true_privacy($owner->user_info[user_privacy_comments], $owner->level_info[level_profile_comments]);
if($comment_level < $allowed_comment) { $allowed_to_comment = 0; }



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

  // MAKE SURE COMMENT BODY IS NOT EMPTY - ADD BREAKS AND CENSOR
  $comment_body = censor(str_replace("\r\n", "<br>", $comment_body)); 
  $comment_body = preg_replace('/(<br>){3,}/is', '<br><br>', $comment_body);
  $comment_body = ChopText($comment_body);
  if(str_replace(" ", "", $comment_body) == "") { $is_error = 1; $comment_body = ""; }

  // ADD COMMENT IF NO ERROR
  if($is_error == 0) {
    $database->database_query("INSERT INTO se_profilecomments (profilecomment_user_id, profilecomment_authoruser_id, profilecomment_date, profilecomment_body) VALUES ('".$owner->user_info[user_id]."', '".$user->user_info[user_id]."', '$comment_date', '$comment_body')");

    // INSERT ACTION IF USER EXISTS
    if($user->user_exists != 0) {
      $commenter = $user->user_info[user_username];
      $comment_body_encoded = $comment_body;
      if(strlen($comment_body_encoded) > 250) { 
        $comment_body_encoded = substr($comment_body_encoded, 0, 240);
        $comment_body_encoded .= "...";
      }
      $comment_body_encoded = htmlspecialchars(str_replace("<br>", " ", $comment_body_encoded));
      $actions->actions_add($user, "postcomment", Array('[username1]', '[username2]', '[comment]'), Array($commenter, $owner->user_info[user_username], $comment_body_encoded));
    } else { 
      $commenter = $profile_comments[12]; 
    }

    // SEND PROFILE COMMENT NOTIFICATION IF COMMENTER IS NOT OWNER
    if($owner->user_info[user_id] != $user->user_info[user_id]) { send_profilecomment($owner, $commenter); }
  }

  echo "<html><head><script type=\"text/javascript\">";
  echo "window.parent.addComment('$is_error', '$comment_body', '$comment_date');";
  echo "</script></head><body></body></html>";
  exit();
}



// START COMMENT OBJECT
$comment = new se_comment('profile', 'user_id', $owner->user_info[user_id]);

// GET TOTAL COMMENTS
$total_comments = $comment->comment_total();

// MAKE COMMENT PAGES
$comments_per_page = 10;
$page_vars = make_page($total_comments, $comments_per_page, $p);

//GET PROFILE COMMENTS
$comments = $comment->comment_list($page_vars[0], $comments_per_page);


// GET CUSTOM PROFILE STYLE IF ALLOWED
if($user->level_info[level_profile_style] != 0) { 
  $profilestyle_info = $database->database_fetch_assoc($database->database_query("SELECT profilestyle_css FROM se_profilestyles WHERE profilestyle_user_id='".$owner->user_info[user_id]."' LIMIT 1")); 
  $global_css = $profilestyle_info[profilestyle_css];
}


// ASSIGN VARIABLES AND INCLUDE FOOTER
$smarty->assign('comments', $comments);
$smarty->assign('allowed_to_comment', $allowed_to_comment);
$smarty->assign('p', $page_vars[1]);
$smarty->assign('total_comments', $total_comments);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($comments));
include "footer.php";
?>