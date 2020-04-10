<?
$page = "group_discussion_delete";
include "header.php";

if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = ""; }
if(isset($_POST['group_id'])) { $group_id = $_POST['group_id']; } elseif(isset($_GET['group_id'])) { $group_id = $_GET['group_id']; } else { $group_id = 0; }
if(isset($_POST['grouptopic_id'])) { $grouptopic_id = $_POST['grouptopic_id']; } elseif(isset($_GET['grouptopic_id'])) { $grouptopic_id = $_GET['grouptopic_id']; } else { $grouptopic_id = 0; }
if(isset($_POST['grouppost_id'])) { $grouppost_id = $_POST['grouppost_id']; } elseif(isset($_GET['grouppost_id'])) { $grouppost_id = $_GET['grouppost_id']; } else { $grouppost_id = 0; }

// DISPLAY ERROR PAGE IF USER IS NOT LOGGED IN AND ADMIN SETTING REQUIRES REGISTRATION
if($user->user_exists == 0 & $setting[setting_permission_group] == 0) {
  $page = "error";
  $smarty->assign('error_header', $group_discussion_delete[1]);
  $smarty->assign('error_message', $group_discussion_delete[2]);
  $smarty->assign('error_submit', $group_discussion_delete[3]);
  include "footer.php";
}

// INITIALIZE GROUP OBJECT
$group = new se_group($user->user_info[user_id], $group_id);
if($group->group_exists == 0) { header("Location: home.php"); exit(); }


// CHECK THAT TOPIC EXISTS AND GET TOPIC INFO
$topic = $database->database_query("SELECT * FROM se_grouptopics WHERE grouptopic_id='$grouptopic_id' AND grouptopic_group_id='".$group->group_info[group_id]."'");
if($database->database_num_rows($topic) != 1) { header("Location: group_discussion.php?group_id=".$group->group_info[group_id]); exit(); }
$topic_info = $database->database_fetch_assoc($topic);


// CHECK THAT POST EXISTS AND GET POST INFO
if($grouppost_id != 0) {
  $post = $database->database_query("SELECT * FROM se_groupposts WHERE grouppost_id='$grouppost_id' AND grouppost_grouptopic_id='$grouptopic_id'");
  if($database->database_num_rows($post) != 1) { header("Location: group_discussion.php?group_id=".$group->group_info[group_id]); exit(); }
  $post_info = $database->database_fetch_assoc($post);

  // MAKE SURE USER IS ALLOWED TO DELETE OBJECT
  if(!(($post_info[grouppost_authoruser_id] != 0 || $user->user_info[user_id] == $post_info[grouppost_authoruser_id]) || $group->user_rank == 2 || $group->user_rank == 1)) {
    header("Location: group_discussion.php?group_id=".$group->group_info[group_id]);
    exit();
  }

  // ENSURE WE ARE DELETING THE POST
  if($task == "delete") { $task = "postdelete"; }


// GROUP TOPIC DELETION
} else {

  // MAKE SURE USER IS ALLOWED TO DELETE OBJECT
  if($group->user_rank != 2 && $group->user_rank != 1) {
    header("Location: group_discussion.php?group_id=".$group->group_info[group_id]);
    exit();
  }

  // ENSURE WE ARE DELETING THE TOPIC
  if($task == "delete") { $task = "topicdelete"; }

}




// DELETE TOPIC
if($task == "topicdelete") {
  $database->database_query("DELETE FROM se_grouptopics WHERE grouptopic_id='$grouptopic_id' AND grouptopic_group_id='".$group->group_info[group_id]."'");
  $database->database_query("DELETE FROM se_groupposts WHERE grouppost_grouptopic_id='$grouptopic_id'");
  header("Location: group_discussion_view.php?group_id=".$group->group_info[group_id]."&grouptopic_id=$grouptopic_id");
  exit();

// DELETE POST
} elseif($task == "postdelete") {
  $database->database_query("DELETE FROM se_groupposts WHERE grouppost_id='$grouppost_id' AND grouppost_grouptopic_id='$grouptopic_id'");
  if($database->database_num_rows($database->database_query("SELECT grouppost_id FROM se_groupposts WHERE grouppost_grouptopic_id='$grouptopic_id'")) == 0) {
    $database->database_query("DELETE FROM se_grouptopics WHERE grouptopic_id='$grouptopic_id' AND grouptopic_group_id='".$group->group_info[group_id]."'");
  }
  header("Location: group_discussion_view.php?group_id=".$group->group_info[group_id]."&grouptopic_id=$grouptopic_id");
  exit();

}




// GET CUSTOM GROUP STYLE IF ALLOWED
if($group->groupowner_level_info[level_group_style] != 0) { 
  $groupstyle_info = $database->database_fetch_assoc($database->database_query("SELECT groupstyle_css FROM se_groupstyles WHERE groupstyle_group_id='".$group->group_info[group_id]."' LIMIT 1")); 
  $global_css = $groupstyle_info[groupstyle_css];
}

// ASSIGN VARIABLES AND INCLUDE FOOTER
$smarty->assign('group', $group);
$smarty->assign('grouptopic_id', $grouptopic_id);
$smarty->assign('grouppost_id', $grouppost_id);
include "footer.php";
?>