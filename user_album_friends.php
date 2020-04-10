<?
$page = "user_album_friends";
include "header.php";


// ENSURE ALBUMS ARE ENABLED FOR THIS USER
if($user->level_info[level_album_allow] == 0) { header("Location: user_home.php"); exit(); }


// SET ALBUM VARS
$album = new se_album($user->user_info[user_id]);
$sort = "se_albums.album_dateupdated DESC";
$albums_per_page = 10;
$album_array = $album->album_list_friends(0, $albums_per_page, $sort, $where);



// ASSIGN VARIABLES AND SHOW FRIENDS' ALBUMS PAGE
$smarty->assign('albums', $album_array);
include "footer.php";
?>