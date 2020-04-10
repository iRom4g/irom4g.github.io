<?
$page = "albums";
include "header.php";

// DISPLAY ERROR PAGE IF USER IS NOT LOGGED IN AND ADMIN SETTING REQUIRES REGISTRATION
if($user->user_exists == 0 & $setting[setting_permission_album] == 0) {
  $page = "error";
  $smarty->assign('error_header', $albums[6]);
  $smarty->assign('error_message', $albums[7]);
  $smarty->assign('error_submit', $albums[8]);
  include "footer.php";
}

// DISPLAY ERROR PAGE IF NO ALBUM OWNER
if($owner->user_exists == 0) {
  $page = "error";
  $smarty->assign('error_header', $albums[6]);
  $smarty->assign('error_message', $albums[1]);
  $smarty->assign('error_submit', $albums[8]);
  include "footer.php";
}

// ENSURE ALBUMS ARE ENABLED FOR THIS USER
if($owner->level_info[level_album_allow] == 0) { header("Location: ".$url->url_create('profile', $owner->user_info[user_username])); exit(); }


// SET PRIVACY LEVEL AND WHERE CLAUSE
$privacy_level = $owner->user_privacy_max($user, $owner->level_info[level_album_privacy]);
$where = "(album_privacy<='$privacy_level')";


// CREATE ALBUM OBJECT
$album = new se_album($owner->user_info[user_id]);

// GET TOTAL ALBUMS
$total_albums = $album->album_total($where);

// GET ALBUM ARRAY
$album_array = $album->album_list(0, $total_albums, "album_id DESC", $where);

// GET CUSTOM ALBUM STYLE IF ALLOWED
if($owner->level_info[level_album_style] != 0) {
  $albumstyle_info = $database->database_fetch_assoc($database->database_query("SELECT albumstyle_css FROM se_albumstyles WHERE albumstyle_user_id='".$owner->user_info[user_id]."' LIMIT 1"));
  $global_css = $albumstyle_info[albumstyle_css];
}


// ASSIGN SMARTY VARIABLES AND DISPLAY ALBUMS PAGE
$smarty->assign('albums', $album_array);
$smarty->assign('total_albums', $total_albums);
include "footer.php";
?>
