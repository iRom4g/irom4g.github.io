<?
$page = "group_discussion_post";
include "header.php";

if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }
if(isset($_POST['group_id'])) { $group_id = $_POST['group_id']; } elseif(isset($_GET['group_id'])) { $group_id = $_GET['group_id']; } else { $group_id = 0; }
if(isset($_POST['grouptopic_id'])) { $grouptopic_id = $_POST['grouptopic_id']; } elseif(isset($_GET['grouptopic_id'])) { $grouptopic_id = $_GET['grouptopic_id']; } else { $grouptopic_id = 0; }

// DISPLAY ERROR PAGE IF USER IS NOT LOGGED IN AND ADMIN SETTING REQUIRES REGISTRATION
if($user->user_exists == 0 & $setting[setting_permission_group] == 0) {
  $page = "error";
  $smarty->assign('error_header', $group_discussion_post[1]);
  $smarty->assign('error_message', $group_discussion_post[2]);
  $smarty->assign('error_submit', $group_discussion_post[3]);
  include "footer.php";
}


// INITIALIZE GROUP OBJECT
$group = new se_group($user->user_info[user_id], $group_id);
if($group->group_exists == 0) { header("Location: home.php"); exit(); }

// GET PRIVACY LEVEL
$privacy_level = $group->group_privacy_max($user, $group->groupowner_level_info[level_profile_privacy]);
$allowed_privacy = true_privacy($group->group_info[group_privacy], $group->groupowner_level_info[level_profile_privacy]);
$is_group_private = 0;
if($privacy_level < $allowed_privacy) { header("Location: group.php?group_id=".$group->group_info[group_id]); exit(); }


// CHECK IF USER IS ALLOWED TO DISCUSS
$discussion_level = $group->group_privacy_max($user, $group->groupowner_level_info[level_group_discussion]);
$allowed_discussion = true_privacy($group->group_info[group_discussion], $group->groupowner_level_info[level_group_discussion]);
if($discussion_level < $allowed_discussion) { header("Location: group.php?group_id=".$group->group_info[group_id]); exit(); }


// SET VARS
$is_error = 0;
$error_message = "";
$topic_id = 0;
$topic_subject = "";
$topic_body = "";


// VALIDATE TOPIC ID
$grouptopic = $database->database_query("SELECT * FROM se_grouptopics WHERE grouptopic_id='$grouptopic_id'");
if($database->database_num_rows($grouptopic) == 1) {
  $grouptopic_info = $database->database_fetch_assoc($grouptopic);
  $topic_id = $grouptopic_info[grouptopic_id];
  $topic_subject = $grouptopic_info[grouptopic_subject];
}




// IF TASK IS CANCEL
if($task == "cancel") {
  if($topic_id != 0) {
    header("Location: group_discussion_view.php?group_id=".$group->group_info[group_id]."&grouptopic_id=$grouptopic_id");
    exit();
  } else {
    header("Location: group_discussion.php?group_id=".$group->group_info[group_id]);
    exit();
  }
}


// IF A TOPIC IS BEING POSTED
if($task == "dopost") {
  $topic_date = time();
  $topic_body = censor(str_replace("\r\n", "<br>", $_POST['topic_body']));

  // RETRIEVE AND CHECK SECURITY CODE IF NECESSARY
  if($setting[setting_group_discussion_code] != 0) {
    session_start();
    $code = $_SESSION['code'];
    if($code == "") { $code = randomcode(); }
    $comment_secure = $_POST['comment_secure'];

    if($comment_secure != $code) { $is_error = 1; $error_message = $group_discussion_post[14]; }
  }

  // MAKE SURE TOPIC BODY IS NOT EMPTY
  if(str_replace(" ", "", $topic_body) == "") { $is_error = 1; $error_message = $group_discussion_post[10]; }

  // IF STARTING TOPIC, CHECK THAT SUBJECT IS NOT EMPTY
  if($topic_id == 0) {
    $topic_subject = censor($_POST['topic_subject']);
    if(str_replace(" ", "", $topic_subject) == "") { $is_error = 1; $error_message = $group_discussion_post[9]; }
  }

  // ADD TOPIC IF NO ERROR
  if($is_error == 0) {
    if($topic_id == 0) {
      $database->database_query("INSERT INTO se_grouptopics (grouptopic_group_id, grouptopic_date, grouptopic_subject) VALUES ('".$group->group_info[group_id]."', '$topic_date', '$topic_subject')");
      $topic_id = $database->database_insert_id();
    }
    $database->database_query("INSERT INTO se_groupposts (grouppost_grouptopic_id, grouppost_authoruser_id, grouppost_date, grouppost_body) VALUES ('$topic_id', '".$user->user_info[user_id]."', '$topic_date', '$topic_body')");
    header("Location: group_discussion_view.php?group_id=".$group->group_info[group_id]."&grouptopic_id=".$topic_id);
    exit();
  }
}

// GET CUSTOM GROUP STYLE IF ALLOWED
if($group->groupowner_level_info[level_group_style] != 0) { 
  $groupstyle_info = $database->database_fetch_assoc($database->database_query("SELECT groupstyle_css FROM se_groupstyles WHERE groupstyle_group_id='".$group->group_info[group_id]."' LIMIT 1")); 
  $global_css = $groupstyle_info[groupstyle_css];
}


// ASSIGN VARIABLES AND INCLUDE FOOTER
$smarty->assign('group', $group);
$smarty->assign('is_error', $is_error);
$smarty->assign('error_message', $error_message);
$smarty->assign('topic_id', $topic_id);
$smarty->assign('topic_subject', $topic_subject);
$smarty->assign('topic_body', str_replace("<br>", "\r\n", $topic_body));
include "footer.php";
?>