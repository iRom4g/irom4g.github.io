<?
$page = "group_discussion_view";
include "header.php";

if(isset($_POST['p'])) { $p = $_POST['p']; } elseif(isset($_GET['p'])) { $p = $_GET['p']; } else { $p = 1; }
if(isset($_POST['group_id'])) { $group_id = $_POST['group_id']; } elseif(isset($_GET['group_id'])) { $group_id = $_GET['group_id']; } else { $group_id = 0; }
if(isset($_POST['grouptopic_id'])) { $grouptopic_id = $_POST['grouptopic_id']; } elseif(isset($_GET['grouptopic_id'])) { $grouptopic_id = $_GET['grouptopic_id']; } else { $grouptopic_id = 0; }

// DISPLAY ERROR PAGE IF USER IS NOT LOGGED IN AND ADMIN SETTING REQUIRES REGISTRATION
if($user->user_exists == 0 & $setting[setting_permission_group] == 0) {
  $page = "error";
  $smarty->assign('error_header', $group_discussion_view[1]);
  $smarty->assign('error_message', $group_discussion_view[2]);
  $smarty->assign('error_submit', $group_discussion_view[3]);
  include "footer.php";
}

// INITIALIZE GROUP OBJECT
$group = new se_group($user->user_info[user_id], $group_id);
if($group->group_exists == 0) { header("Location: home.php"); exit(); }

// CHECK THAT TOPIC EXISTS AND GET TOPIC INFO
$topic = $database->database_query("SELECT * FROM se_grouptopics WHERE grouptopic_id='$grouptopic_id' AND grouptopic_group_id='".$group->group_info[group_id]."'");
if($database->database_num_rows($topic) != 1) { header("Location: group_discussion.php?group_id=".$group->group_info[group_id]); exit(); }
$topic_info = $database->database_fetch_assoc($topic);

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

// INCREMENT VIEWS FOR THIS TOPIC
$database->database_query("UPDATE se_grouptopics SET grouptopic_views=grouptopic_views+1 WHERE grouptopic_id='$topic_info[grouptopic_id]' LIMIT 1");

// GET TOTAL POSTS
$total_posts = $group->group_post_total("(se_groupposts.grouppost_grouptopic_id='$topic_info[grouptopic_id]')");

// MAKE POST PAGES
$posts_per_page = 10;
$page_vars = make_page($total_posts, $posts_per_page, $p);

// GET GROUP POSTS
$posts = $group->group_post_list($page_vars[0], $posts_per_page, "se_groupposts.grouppost_date ASC", "(se_groupposts.grouppost_grouptopic_id='$topic_info[grouptopic_id]')");

// GET CUSTOM GROUP STYLE IF ALLOWED
if($group->groupowner_level_info[level_group_style] != 0) { 
  $groupstyle_info = $database->database_fetch_assoc($database->database_query("SELECT groupstyle_css FROM se_groupstyles WHERE groupstyle_group_id='".$group->group_info[group_id]."' LIMIT 1")); 
  $global_css = $groupstyle_info[groupstyle_css];
}

$p1 = ($page_vars[1]-1)*10 ;

// ASSIGN VARIABLES AND INCLUDE FOOTER
$smarty->assign('group', $group);
$smarty->assign('posts', $posts);
$smarty->assign('topic_info', $topic_info);
$smarty->assign('allowed_to_discuss', $allowed_to_discuss);
$smarty->assign('p', $page_vars[1]);
$smarty->assign('total_posts', $total_posts);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($posts));
$smarty->assign('p1', $p1);
include "footer.php";
?>