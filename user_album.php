<?
$page = "user_album";
include "header.php";


// ENSURE ALBUMS ARE ENABLED FOR THIS USER
if($user->level_info[level_album_allow] == 0) { header("Location: user_home.php"); exit(); }

// GET ALBUMS
$album = new se_album($user->user_info[user_id]);
$total_albums = $album->album_total();
$album_array = $album->album_list(0, $total_albums);

$space_used = $album->album_space();
$total_files = $album->album_files();

// CALCULATE SPACE FREE, CONVERT TO MEGABYTES
if($user->level_info[level_album_storage]) {
  $space_free = $user->level_info[level_album_storage] - $space_used;
} else {
  $space_free = ( $dfs=disk_free_space("/") ? $dfs : pow(2, 32) );
} 
$space_free = ($space_free / 1024) / 1024;
$space_free = round($space_free, 2);


// ASSIGN VARIABLES AND SHOW VIEW ALBUMS PAGE
$smarty->assign('space_free', $space_free);
$smarty->assign('total_files', $total_files);
$smarty->assign('albums_total', $total_albums);
$smarty->assign('albums', $album_array);
include "footer.php";
?>