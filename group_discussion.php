<?
$page = "group_discussion";
include "header.php";

if(isset($_POST['p'])) { $p = $_POST['p']; } elseif(isset($_GET['p'])) { $p = $_GET['p']; } else { $p = 1; }
if(isset($_POST['group_id'])) { $group_id = $_POST['group_id']; } elseif(isset($_GET['group_id'])) { $group_id = $_GET['group_id']; } else { $group_id = 0; }

// DISPLAY ERROR PAGE IF USER IS NOT LOGGED IN AND ADMIN SETTING REQUIRES REGISTRATION
if($user->user_exists == 0 & $setting[setting_permission_group] == 0) {
  $page = "error";
  $smarty->assign('error_header', $group_discussion[1]);
  $smarty->assign('error_message', $group_discussion[2]);
  $smarty->assign('error_submit', $group_discussion[3]);
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
$allowed_to_discuss = 1;
$discussion_level = $group->group_privacy_max($user, $group->groupowner_level_info[level_group_discussion]);
$allowed_discussion = true_privacy($group->group_info[group_discussion], $group->groupowner_level_info[level_group_discussion]);
if($discussion_level < $allowed_discussion) { $allowed_to_discuss = 0; }

// GET TOTAL TOPICS
$total_topics = $group->group_topic_total();

// MAKE TOPIC PAGES
$topics_per_page = 10;
$page_vars = make_page($total_topics, $topics_per_page, $p);

// GET GROUP TOPICS
$topics = $group->group_topic_list($page_vars[0], $topics_per_page);

// GET CUSTOM GROUP STYLE IF ALLOWED
if($group->groupowner_level_info[level_group_style] != 0) { 
  $groupstyle_info = $database->database_fetch_assoc($database->database_query("SELECT groupstyle_css FROM se_groupstyles WHERE groupstyle_group_id='".$group->group_info[group_id]."' LIMIT 1")); 
  $global_css = $groupstyle_info[groupstyle_css];
}

// ASSIGN VARIABLES AND INCLUDE FOOTER
$smarty->assign('group', $group);
$smarty->assign('topics', $topics);
$smarty->assign('allowed_to_discuss', $allowed_to_discuss);
$smarty->assign('p', $page_vars[1]);
$smarty->assign('total_topics', $total_topics);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($topics));
include "footer.php";
?>