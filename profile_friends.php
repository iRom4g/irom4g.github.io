<?
$page = "profile_friends";
include "header.php";

// GET PAGE VARIABLE
if(isset($_POST['p'])) { $p = $_POST['p']; } elseif(isset($_GET['p'])) { $p = $_GET['p']; } else { $p = 1; }

// DISPLAY ERROR PAGE IF USER IS NOT LOGGED IN AND ADMIN SETTING REQUIRES REGISTRATION
if($user->user_exists == 0 & $setting[setting_permission_profile] == 0) {
  $page = "error";
  $smarty->assign('error_header', $profile_friends[18]);
  $smarty->assign('error_message', $profile_friends[11]);
  $smarty->assign('error_submit', $profile_friends[13]);
  include "footer.php";
}

// DISPLAY ERROR PAGE IF NO OWNER
if($owner->user_exists == 0) {
  $page = "error";
  $smarty->assign('error_header', $profile_friends[18]);
  $smarty->assign('error_message', $profile_friends[19]);
  $smarty->assign('error_submit', $profile_friends[13]);
  include "footer.php";
}

// GET PRIVACY LEVEL
$privacy_level = $owner->user_privacy_max($user, $owner->level_info[level_profile_privacy]);
$allowed_privacy = true_privacy($owner->user_info[user_privacy_profile], $owner->level_info[level_profile_privacy]);
if($privacy_level < $allowed_privacy) { header("Location: ".$url->url_create("profile", $owner->user_info[user_username])); exit(); }


// GET TOTAL FRIENDS
$total_friends = $owner->user_friend_total(0);

// MAKE FRIEND PAGES
$friends_per_page = 20;
$page_vars = make_page($total_friends, $friends_per_page, $p);

// GET FRIEND ARRAY
$friends = $owner->user_friend_list($page_vars[0], $friends_per_page, 0);


// ASSIGN VARIABLES AND INCLUDE FOOTER
$smarty->assign('friends', $friends);
$smarty->assign('total_friends', $total_friends);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($friends));
$smarty->assign('p', $page_vars[1]);
include "footer.php";
?>