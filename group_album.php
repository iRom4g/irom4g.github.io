<?
$page = "group_album";
include "header.php";

if(isset($_POST['p'])) { $p = $_POST['p']; } elseif(isset($_GET['p'])) { $p = $_GET['p']; } else { $p = 1; }
if(isset($_GET['group_id'])) { $group_id = $_GET['group_id']; } else { $group_id = 0; }

// DISPLAY ERROR PAGE IF USER IS NOT LOGGED IN AND ADMIN SETTING REQUIRES REGISTRATION
if($user->user_exists == 0 & $setting[setting_permission_group] == 0) {
  $smarty->assign('error_header', $group_album[3]);
  $smarty->assign('error_message', $group_album[4]);
  $smarty->assign('error_submit', $group_album[10]);
  $smarty->display("error.tpl");
  exit();
}

// INITIALIZE GROUP OBJECT
$group = new se_group($user->user_info[user_id], $group_id);
if($group->group_exists == 0) { header("Location: home.php"); exit(); }

// GET GROUP ALBUM INFO
$groupalbum_info = $database->database_fetch_assoc($database->database_query("SELECT * FROM se_groupalbums WHERE groupalbum_group_id='".$group->group_info[group_id]."' LIMIT 1"));


// GET PRIVACY LEVEL
$privacy_level = $group->group_privacy_max($user, $group->groupowner_level_info[level_profile_privacy]);
$allowed_privacy = true_privacy($group->group_info[group_privacy], $group->groupowner_level_info[level_profile_privacy]);
$is_group_private = 0;
if($privacy_level < $allowed_privacy) { header("Location: group.php?group_id=".$group->group_info[group_id]); exit(); }


// UPDATE ALBUM VIEWS
$groupalbum_views_new = $groupalbum_info[groupalbum_views] + 1;
$database->database_query("UPDATE se_groupalbums SET groupalbum_views='$groupalbum_views_new' WHERE groupalbum_id='$groupalbum_info[groupalbum_id]' LIMIT 1");



// GET TOTAL FILES IN GROUP ALBUM
$total_files = $group->group_media_total($groupalbum_info[groupalbum_id]);

// MAKE MEDIA PAGES
$files_per_page = 16;
$page_vars = make_page($total_files, $files_per_page, $p);

// GET MEDIA ARRAY
$file_array = $group->group_media_list($page_vars[0], $files_per_page, "groupmedia_id ASC", "(groupmedia_groupalbum_id='$groupalbum_info[groupalbum_id]')");


// GET CUSTOM GROUP STYLE IF ALLOWED
if($group->groupowner_level_info[level_group_style] != 0 & $is_group_private == 0) { 
  $groupstyle_info = $database->database_fetch_assoc($database->database_query("SELECT groupstyle_css FROM se_groupstyles WHERE groupstyle_group_id='".$group->group_info[group_id]."' LIMIT 1")); 
  $global_css = $groupstyle_info[groupstyle_css];
}




// ASSIGN VARIABLES AND DISPLAY GROUP ALBUM PAGE
$smarty->assign('group', $group);
$smarty->assign('files', $file_array);
$smarty->assign('total_files', $total_files);
$smarty->assign('p', $page_vars[1]);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($file_array));
include "footer.php";
?>