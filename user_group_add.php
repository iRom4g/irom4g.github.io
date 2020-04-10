<?
$page = "user_group_add";
include "header.php";

if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }

// INITIALIZE VARIABLES
$is_error = 0;
$error_message = "";
$group_title = "";
$group_desc = "";
$group_privacy = true_privacy(0, $user->level_info[level_group_privacy]);
$group_comments = true_privacy(0, $user->level_info[level_group_comments]);
$group_discussion = true_privacy(0, $user->level_info[level_group_discussion]);
$group_search = 1;
$groupcat_id = 0;
$subgroupcat_id = 0;




// INITIALIZE GROUP OBJECT
$new_group = new se_group($user->user_info[user_id], 0);



// RETRIEVE AND/OR VALIDATE GROUP FIELDS
if($task == "doadd") { $validate = 1; } else { $validate = 0; }
$new_group->group_fields($validate, 0);
if($validate == 1) { $is_error = $new_group->is_error; $error_message = $new_group->error_message; }


// CHECK TO MAKE SURE USER HAS LESS THAN MAX NUMBER OF GROUPS ALLOWED
$owned_where = "(se_groups.group_user_id='".$user->user_info[user_id]."')";
$total_groups_owned = $new_group->group_total($owned_where);
if($total_groups_owned >= $user->level_info[level_group_maxnum]) {
  $is_error = 1;
  $error_message = $user_group_add[2];
  $task = "main";
}



// ATTEMPT TO ADD GROUP
if($task == "doadd") {
  $group_title = censor($_POST['group_title']);
  $group_desc = censor(str_replace("\r\n", "<br>", $_POST['group_desc']));
  $groupcat_id = $_POST['groupcat_id'];
  $subgroupcat_id = $_POST['subgroupcat_id'];
  $group_approval = $_POST['group_approval'];
  $group_search = $_POST['group_search'];
  $group_privacy = $_POST['group_privacy'];
  $group_comments = $_POST['group_comments'];
  $group_discussion = $_POST['group_discussion'];
 
  // CHECK TO MAKE SURE TITLE HAS BEEN ENTERED
  if(str_replace(" ", "", $group_title) == "") {
    $is_error = 1;
    $error_message = $user_group_add[1];
  }

  // CHECK THAT PRIVACY IS NOT BLANK
  if($group_privacy == "") { $group_privacy = true_privacy(0, $user->level_info[level_group_privacy]); }
  if($group_comments == "") { $group_comments = true_privacy(0, $user->level_info[level_group_comments]); }
  if($group_discussion == "") { $group_discussion = true_privacy(0, $user->level_info[level_group_discussion]); }

  // CHECK THAT SEARCH IS NOT BLANK
  if($user->level_info[level_group_search] == 0) { $group_search = 1; }

  // CHECK THAT APPROVAL IS NOT BLANK
  if($user->level_info[level_group_approval] == 0) { $group_approval = 0; }


  // IF NO ERROR, SAVE GROUP
  if($is_error == 0) {

    if($subgroupcat_id != 0) { $groupcat_id = $subgroupcat_id; }
    $group_id = $new_group->group_create($group_title, $group_desc, $groupcat_id, $group_search, $group_privacy, $group_comments, $group_discussion, $group_approval);

    // INSERT ACTION
    $group_title_short = $group_title;
    if(strlen($group_title_short) > 100) { $group_title_short = substr($group_title_short, 0, 97); $group_title_short .= "..."; }
    $actions->actions_add($user, "newgroup", Array('[username]', '[id]', '[title]'), Array($user->user_info[user_username], $group_id, $group_title_short));

    header("Location: user_group_edit.php?group_id=$group_id&justadded=1");
    exit();
  }
}






// GET GROUP CATEGORIES
$categories_array = Array();
$categories_query = $database->database_query("SELECT * FROM se_groupcats WHERE groupcat_dependency='0' ORDER BY groupcat_id");
while($category = $database->database_fetch_assoc($categories_query)) {
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
for($p=0;$p<strlen($user->level_info[level_group_privacy]);$p++) {
  $privacy_level = substr($user->level_info[level_group_privacy], $p, 1);
  if(group_privacy_levels($privacy_level) != "") {
    $privacy_options[] = Array('privacy_id' => "group_privacy".$privacy_level,
				'privacy_value' => $privacy_level,
				'privacy_option' => group_privacy_levels($privacy_level));
  }
}


// GET AVAILABLE GROUP COMMENTS OPTIONS
$comment_options = Array();
for($p=0;$p<strlen($user->level_info[level_group_comments]);$p++) {
  $comment_level = substr($user->level_info[level_group_comments], $p, 1);
  if(group_privacy_levels($comment_level) != "") {
    $comment_options[] = Array('comment_id' => "group_comment".$comment_level,
				'comment_value' => $comment_level,
				'comment_option' => group_privacy_levels($comment_level));
  }
}

// GET AVAILABLE GROUP DISCUSSION OPTIONS
$discussion_options = Array();
for($p=0;$p<strlen($user->level_info[level_group_discussion]);$p++) {
  $discussion_level = substr($user->level_info[level_group_discussion], $p, 1);
  if(group_privacy_levels($discussion_level) != "") {
    $discussion_options[] = Array('discussion_id' => "group_discussion".$discussion_level,
				'discussion_value' => $discussion_level,
				'discussion_option' => group_privacy_levels($discussion_level));
  }
}


// ASSIGN VARIABLES AND SHOW ADD GROUPS PAGE
$smarty->assign('is_error', $is_error);
$smarty->assign('error_message', $error_message);
$smarty->assign('fields', $new_group->group_fields);
$smarty->assign('cats', $categories_array);
$smarty->assign('group_title', $group_title);
$smarty->assign('group_desc', str_replace("<br>", "\r\n", $group_desc));
$smarty->assign('group_search', $group_search);
$smarty->assign('group_privacy', $group_privacy);
$smarty->assign('group_comments', $group_comments);
$smarty->assign('group_discussion', $group_discussion);
$smarty->assign('privacy_options', $privacy_options);
$smarty->assign('comment_options', $comment_options);
$smarty->assign('discussion_options', $discussion_options);
$smarty->assign('groupcat_id', $groupcat_id);
$smarty->assign('subgroupcat_id', $subgroupcat_id);
include "footer.php";
?>