<?
$page = "group";
include "header.php";

if(isset($_GET['group_id'])) { $group_id = $_GET['group_id']; } else { $group_id = 0; }

// DISPLAY ERROR PAGE IF USER IS NOT LOGGED IN AND ADMIN SETTING REQUIRES REGISTRATION
if($user->user_exists == 0 & $setting[setting_permission_group] == 0) {
  $page = "error";
  $smarty->assign('error_header', $group[28]);
  $smarty->assign('error_message', $group[30]);
  $smarty->assign('error_submit', $group[39]);
  include "footer.php";
}


// INITIALIZE GROUP OBJECT
$group_test = new se_group($user->user_info[user_id], $group_id);
if($group_test->group_exists == 0) { 
  $page = "error";
  $smarty->assign('error_header', $group[28]);
  $smarty->assign('error_message', $group[41]);
  $smarty->assign('error_submit', $group[39]);
  include "footer.php";
}
$group = $group_test;


// GET PRIVACY LEVEL
$privacy_level = $group->group_privacy_max($user, $group->groupowner_level_info[level_profile_privacy]);
$allowed_privacy = true_privacy($group->group_info[group_privacy], $group->groupowner_level_info[level_profile_privacy]);
$is_group_private = 0;
if($privacy_level < $allowed_privacy) { $is_group_private = 1; }



// UPDATE GROUP VIEWS IF GROUP VISIBLE
if($is_group_private == 0) {
  $group_views = $group->group_info[group_views]+1;
  $database->database_query("UPDATE se_groups SET group_views='$group_views' WHERE group_id='".$group->group_info[group_id]."'");
}

// GET GROUP LEADER INFO
$groupowner_info = $database->database_fetch_assoc($database->database_query("SELECT user_id, user_username FROM se_users WHERE user_id='".$group->group_info[group_user_id]."'"));

// GET GROUP CATEGORY
$group_category = "";
$group_category_query = $database->database_query("SELECT groupcat_id, groupcat_title FROM se_groupcats WHERE groupcat_id='".$group->group_info[group_groupcat_id]."' LIMIT 1");
if($database->database_num_rows($group_category_query) == 1) {
  $group_category_info = $database->database_fetch_assoc($group_category_query);
  $group_category = $group_category_info[groupcat_title];
}

// GET GROUP FIELDS
$group->group_fields(0, 1);

// GET GROUP COMMENTS
$comment = new se_comment('group', 'group_id', $group->group_info[group_id]);
$total_comments = $comment->comment_total();
$comments = $comment->comment_list(0, 10);


// GET TOTAL MEMBERS AND MEMBER ARRAY
$where = "(se_groupmembers.groupmember_status='1')";
$total_members = $group->group_member_total($where);
$members = $group->group_member_list(0, 6, "RAND()", $where);


// CHECK IF USER IS ALLOWED TO COMMENT
$allowed_to_comment = 1;
$comment_level = $group->group_privacy_max($user, $group->groupowner_level_info[level_group_comments]);
$allowed_comment = true_privacy($group->group_info[group_comments], $group->groupowner_level_info[level_group_comments]);
if($comment_level < $allowed_comment) { $allowed_to_comment = 0; }


// GET CUSTOM GROUP STYLE IF ALLOWED
if($group->groupowner_level_info[level_group_style] != 0 & $is_group_private == 0) { 
  $groupstyle_info = $database->database_fetch_assoc($database->database_query("SELECT groupstyle_css FROM se_groupstyles WHERE groupstyle_group_id='".$group->group_info[group_id]."' LIMIT 1")); 
  $global_css = $groupstyle_info[groupstyle_css];
}




// GET GROUP DISCUSSION TOPICS
$total_topics = $group->group_topic_total();
$topics = $group->group_topic_list(0, 3);

// CHECK IF USER IS ALLOWED TO POST IN DISCUSSION
$allowed_to_discuss = 1;
$discussion_level = $group->group_privacy_max($user, $group->groupowner_level_info[level_group_discussion]);
$allowed_discussion = true_privacy($group->group_info[group_discussion], $group->groupowner_level_info[level_group_discussion]);
if($discussion_level < $allowed_discussion) { $allowed_to_discuss = 0; }






// SHOW FILES IN THIS ALBUM
$groupalbum_info = $database->database_fetch_assoc($database->database_query("SELECT groupalbum_id FROM se_groupalbums WHERE groupalbum_group_id='".$group->group_info[group_id]."' LIMIT 1"));
$total_files = $group->group_media_total($groupalbum_info[groupalbum_id]);
$file_array = $group->group_media_list(0, 5, "RAND()", "(groupmedia_groupalbum_id='$groupalbum_info[groupalbum_id]')");

// CRANK SMILES START // 
$asconf['smiles'] = "baffled,biggrin,confused,dull,eek,growl,nerd,no,oo,redface,rofl,rolleyes,sad,sorry,tongue,wink,yes"; 
$i = 0; 
$smilies = explode(",", $asconf['smiles']); 
        foreach($smilies as $smile) { 
            $i++; $smile = trim($smile); 
            $outsmile .= "<img class=\"smileys\" src=\"./templates/images/smiles/$smile.gif\" alt=\"$smile\" onclick=\"addsmiley(':$smile:')\" />"; } 
// CRANK SMILES END // 



// ASSIGN VARIABLES AND DISPLAY GROUP PAGE
$smarty->assign('group', $group);
$smarty->assign('asmiles', $outsmile);
$smarty->assign('groupowner_info', $groupowner_info);
$smarty->assign('group_category', $group_category);
$smarty->assign('comments', $comments);
$smarty->assign('total_comments', $total_comments);
$smarty->assign('members', $members);
$smarty->assign('total_members', $total_members);
$smarty->assign('is_group_private', $is_group_private);
$smarty->assign('allowed_to_comment', $allowed_to_comment);
$smarty->assign('fields', $group->group_fields);
$smarty->assign('files', $file_array);
$smarty->assign('total_files', $total_files);
$smarty->assign('topics', $topics);
$smarty->assign('total_topics', $total_topics);
$smarty->assign('allowed_to_discuss', $allowed_to_discuss);

include "footer.php";
?>