<?
$page = "user_group_edit";
include "header.php";

if(isset($_POST['group_id'])) { $group_id = $_POST['group_id']; } elseif(isset($_GET['group_id'])) { $group_id = $_GET['group_id']; } else { $group_id = 0; }
if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }
if(isset($_POST['justadded'])) { $justadded = $_POST['justadded']; } elseif(isset($_GET['justadded'])) { $justadded = $_GET['justadded']; } else { $justadded = ""; }


// INITIALIZE GROUP OBJECT
$group = new se_group($user->user_info[user_id], $group_id);

if($group->group_exists == 0) { header("Location: user_group.php"); exit(); }
if($group->user_rank == 0 | $group->user_rank == -1) { header("Location: user_group.php"); exit(); }


// SET ERROR VARIABLES
$is_error = 0;
$result = 0;
$error_message = "";


// CHECK FOR ADMIN ALLOWANCE OF PHOTO
if($group->groupowner_level_info[level_group_photo] == 0 & ($task == "remove" | $task == "upload")) { $task = "main"; }


// DELETE PHOTO
if($task == "remove") { $group->group_photo_delete(); $group->group_lastupdate(); }

// UPLOAD PHOTO
if($task == "upload") {
  $group->group_photo_upload("photo");
  $is_error = $group->is_error;
  $error_message = $group->error_message;
  if($is_error == 0) { $group->group_lastupdate(); }
}



// RETRIEVE AND/OR VALIDATE GROUP FIELDS
if($task == "dosave") { $validate = 1; } else { $validate = 0; }
$group->group_fields($validate, 0);
if($validate == 1) { $is_error = $group->is_error; $error_message = $group->error_message; }






if($task == "dosave") {
  // GET BASIC GROUP INFO
  $group_title = censor($_POST['group_title']);
  $group_desc = censor(str_replace("\r\n", "<br>", $_POST['group_desc']));
  $groupcat_id = $_POST['groupcat_id'];
  $subgroupcat_id = $_POST['subgroupcat_id'];
  $group_search = $_POST['group_search'];
  $group_privacy = $_POST['group_privacy'];
  $group_comments = $_POST['group_comments'];
  $group_discussion = $_POST['group_discussion'];
  $group_approval = $_POST['group_approval'];

  // CHECK TO MAKE SURE TITLE HAS BEEN ENTERED
  if(str_replace(" ", "", $group_title) == "") {
    $is_error = 1;
    $error_message = $user_group_edit[8];
  }

  // CHECK THAT PRIVACY IS NOT BLANK
  if($group_privacy == "") { $group_privacy = true_privacy(0, $group->groupowner_level_info[level_group_privacy]); }
  if($group_comments == "") { $group_comments = true_privacy(0, $group->groupowner_level_info[level_group_comments]); }
  if($group_discussion == "") { $group_discussion = true_privacy(0, $group->groupowner_level_info[level_group_discussion]); }

  // CHECK THAT SEARCH IS NOT BLANK
  if($group->groupowner_level_info[level_group_search] == 0) { $group_search = 1; }

  // CHECK THAT APPROVAL IS NOT BLANK
  if($group->groupowner_level_info[level_group_approval] == 0) { $group_approval = 0; }

  // IF NO ERROR, SAVE GROUP
  if($is_error == 0) {
    if($subgroupcat_id != 0) { $new_groupcat_id = $subgroupcat_id; } else { $new_groupcat_id = $groupcat_id; }

    // UPDATE GROUP VALUES
    $groupvalue_query = "UPDATE se_groupvalues SET ".$group->group_field_query." WHERE groupvalue_group_id='".$group->group_info[group_id]."'";
    $database->database_query($groupvalue_query);

    // IF NEW MEMBER APPROVAL SETTING IS CHANGED TO 0, APPROVE ALL WAITING MEMBERS
    if($group_approval == 0) {
      $database->database_query("UPDATE se_groupmembers SET groupmember_status='1', groupmember_approved='1' WHERE groupmember_group_id='".$group->group_info[group_id]."' AND groupmember_approved='0'");
    }

    // UPDATE GROUP
    $database->database_query("UPDATE se_groups SET group_title='$group_title', group_groupcat_id='$new_groupcat_id', group_desc='$group_desc', group_search='$group_search', group_privacy='$group_privacy', group_comments='$group_comments', group_discussion='$group_discussion', group_approval='$group_approval' WHERE group_id='".$group->group_info[group_id]."'");
    $database->database_query("UPDATE se_groupalbums SET groupalbum_privacy='$group_privacy', groupalbum_comments='$group_comments', groupalbum_search='$group_search' WHERE groupalbum_group_id='".$group->group_info[group_id]."'");

    // RESET RESULTS
    $group->group_info = $database->database_fetch_assoc($database->database_query("SELECT * FROM se_groups WHERE group_id='".$group->group_info[group_id]."'"));
    $group->groupvalue_info = $database->database_fetch_assoc($database->database_query("SELECT * FROM se_groupvalues WHERE groupvalue_group_id='".$group->group_info[group_id]."'"));

    // SET RESULT MESSAGE
    $result = 1;

    $group->group_lastupdate();
  }




} else {
  $group_title = $group->group_info[group_title];
  $group_desc = str_replace("<br>", "\r\n", $group->group_info[group_desc]);
  $group_approval = $group->group_info[group_approval];
  $group_search = $group->group_info[group_search];
  $group_privacy = $group->group_info[group_privacy];
  $group_comments = $group->group_info[group_comments];
  $group_discussion = $group->group_info[group_discussion];
  if($group->group_info[group_groupcat_id] == 0) {
    $groupcat_id = 0;
    $subgroupcat_id = 0;
  } else {
    $groupcat = $database->database_fetch_assoc($database->database_query("SELECT groupcat_id, groupcat_dependency FROM se_groupcats WHERE groupcat_id='".$group->group_info[group_groupcat_id]."'"));
    if($groupcat[groupcat_dependency] == 0) {
      $groupcat_id = $groupcat[groupcat_id];
      $subgroupcat_id = "0";
    } else {
      $parentgroupcat = $database->database_fetch_assoc($database->database_query("SELECT groupcat_id FROM se_groupcats WHERE groupcat_id='$groupcat[groupcat_dependency]'"));
      $groupcat_id = $parentgroupcat[groupcat_id];
      $subgroupcat_id = $groupcat[groupcat_id];
    }
  }
}





// GET GROUP CATEGORIES
$categories_array = Array();
$categories_query = $database->database_query("SELECT * FROM se_groupcats WHERE groupcat_dependency='0' ORDER BY groupcat_id");
while($category = $database->database_fetch_assoc($categories_query)) {
  // GET DEPENDENT GROUP CATS
  $dep_categories_query = $database->database_query("SELECT * FROM se_groupcats WHERE groupcat_dependency='$category[groupcat_id]' ORDER BY groupcat_id");
  $dep_groupcat_array = Array();
  while($dep_category = $database->database_fetch_assoc($dep_categories_query)) {
    $dep_groupcat_array[] = Array('subgroupcat_id' => $dep_category[groupcat_id],
					'subgroupcat_title' => $dep_category[groupcat_title]);
  }

  $categories_array[] = Array('groupcat_id' => $category[groupcat_id],
			       'groupcat_title' => $category[groupcat_title],
			       'subcats' => $dep_groupcat_array);
}




// GET AVAILABLE GROUP PRIVACY OPTIONS
$privacy_options = Array();
for($p=0;$p<strlen($group->groupowner_level_info[level_group_privacy]);$p++) {
  $privacy_level = substr($group->groupowner_level_info[level_group_privacy], $p, 1);
  if(group_privacy_levels($privacy_level) != "") {
    $privacy_options[] = Array('privacy_id' => "group_privacy".$privacy_level,
				'privacy_value' => $privacy_level,
				'privacy_option' => group_privacy_levels($privacy_level));
  }
}

// GET AVAILABLE GROUP COMMENT OPTIONS
$comment_options = Array();
for($p=0;$p<strlen($group->groupowner_level_info[level_group_comments]);$p++) {
  $comment_level = substr($group->groupowner_level_info[level_group_comments], $p, 1);
  if(group_privacy_levels($comment_level) != "") {
    $comment_options[] = Array('comment_id' => "group_comment".$comment_level,
				'comment_value' => $comment_level,
				'comment_option' => group_privacy_levels($comment_level));
  }
}



// GET AVAILABLE GROUP DISCUSSION OPTIONS
$discussion_options = Array();
for($p=0;$p<strlen($group->groupowner_level_info[level_group_discussion]);$p++) {
  $discussion_level = substr($group->groupowner_level_info[level_group_discussion], $p, 1);
  if(group_privacy_levels($discussion_level) != "") {
    $discussion_options[] = Array('discussion_id' => "group_discussion".$discussion_level,
				'discussion_value' => $discussion_level,
				'discussion_option' => group_privacy_levels($discussion_level));
  }
}



// ASSIGN VARIABLES AND SHOW USER EDIT GROUP PAGE
$smarty->assign('result', $result);
$smarty->assign('is_error', $is_error);
$smarty->assign('justadded', $justadded);
$smarty->assign('error_message', $error_message);
$smarty->assign('group', $group);
$smarty->assign('privacy_options', $privacy_options);
$smarty->assign('comment_options', $comment_options);
$smarty->assign('discussion_options', $discussion_options);
$smarty->assign('fields', $group->group_fields);
$smarty->assign('cats', $categories_array);
$smarty->assign('group_title', $group_title);
$smarty->assign('group_desc', $group_desc);
$smarty->assign('groupcat_id', $groupcat_id);
$smarty->assign('subgroupcat_id', $subgroupcat_id);
$smarty->assign('group_approval', $group_approval);
$smarty->assign('group_search', $group_search);
$smarty->assign('group_privacy', true_privacy($group_privacy, $group->groupowner_level_info[level_group_privacy]));
$smarty->assign('group_comments', true_privacy($group_comments, $group->groupowner_level_info[level_group_comments]));
$smarty->assign('group_discussion', true_privacy($group_discussion, $group->groupowner_level_info[level_group_discussion]));
include "footer.php";
?>