<?
$page = "album";
include "header.php";

// DISPLAY ERROR PAGE IF USER IS NOT LOGGED IN AND ADMIN SETTING REQUIRES REGISTRATION
if($user->user_exists == 0 & $setting[setting_permission_album] == 0) {
  $page = "error";
  $smarty->assign('error_header', $album[7]);
  $smarty->assign('error_message', $album[8]);
  $smarty->assign('error_submit', $album[14]);
  include "footer.php";
}

// DISPLAY ERROR PAGE IF NO ALBUM OWNER
if($owner->user_exists == 0) {
  $page = "error";
  $smarty->assign('error_header', $album[7]);
  $smarty->assign('error_message', $album[1]);
  $smarty->assign('error_submit', $album[14]);
  include "footer.php";
}

// ENSURE ALBUMS ARE ENABLED FOR THIS USER
if($owner->level_info[level_album_allow] == 0) { header("Location: ".$url->url_create('profile', $owner->user_info[user_username])); exit(); }

if(isset($_POST['p'])) { $p = $_POST['p']; } elseif(isset($_GET['p'])) { $p = $_GET['p']; } else { $p = 1; }
if(isset($_GET['album_id'])) { $album_id = $_GET['album_id']; } else { $album_id = 0; }

// BE SURE ALBUM BELONGS TO THIS USER
$album_query = $database->database_query("SELECT * FROM se_albums WHERE album_id='$album_id' AND album_user_id='".$owner->user_info[user_id]."'");
if($database->database_num_rows($album_query) != 1) { header("Location: ".$url->url_create('albums', $owner->user_info[user_username])); exit(); }
$album_info = $database->database_fetch_assoc($album_query);


// CHECK PRIVACY
$privacy_level = $owner->user_privacy_max($user, $owner->level_info[level_album_privacy]);
if($privacy_level < true_privacy($album_info[album_privacy], $owner->level_info[level_album_privacy])) {
  // ASSIGN VARIABLES AND DISPLAY ERROR PAGE
  $page = "error";
  $smarty->assign('error_header', $album[7]);
  $smarty->assign('error_message', $album[2]);
  $smarty->assign('error_submit', $album[14]);
  include "footer.php";
}



// UPDATE ALBUM VIEWS
$album_views_new = $album_info[album_views] + 1;
$database->database_query("UPDATE se_albums SET album_views='$album_views_new' WHERE album_id='$album_info[album_id]' LIMIT 1");



// SET VARS
$result = 0;
$media_per_page = 16;
$album = new se_album($owner->user_info[user_id]);


// GET TOTAL FILES IN ALBUM
$total_files = $album->album_files($album_info[album_id]);

// MAKE MEDIA PAGES
$page_vars = make_page($total_files, $media_per_page, $p);

// GET MEDIA ARRAY
$file_array = $album->album_media_list($page_vars[0], $media_per_page, "media_id ASC", "(media_album_id='$album_info[album_id]')");


// GET CUSTOM ALBUM STYLE IF ALLOWED
if($owner->level_info[level_album_style] != 0) {
  $albumstyle_info = $database->database_fetch_assoc($database->database_query("SELECT albumstyle_css FROM se_albumstyles WHERE albumstyle_user_id='".$owner->user_info[user_id]."' LIMIT 1"));
  $global_css = $albumstyle_info[albumstyle_css];
}



// ASSIGN VARIABLES AND DISPLAY ALBUM PAGE
$smarty->assign('album_id', $album_id);
$smarty->assign('album_title', $album_info[album_title]);
$smarty->assign('album_desc', $album_info[album_desc]);
$smarty->assign('files', $file_array);
$smarty->assign('total_files', $total_files);
$smarty->assign('p', $page_vars[1]);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($file_array));
include "footer.php";
?>