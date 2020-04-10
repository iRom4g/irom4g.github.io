<?

switch($page) {

  // CODE FOR PROFILE PAGE
  case "profile":
	// CHECK IF OWNER IS ALLOWED TO HAVE ALBUMS
	$albums = Array();
	$total_albums = 0;
	if($owner->level_info[level_album_allow] != 0) {

	  // START ALBUM
	  $album = new se_album($owner->user_info[user_id]);
	  $albums_per_page = 3;
	  $sort = "album_id DESC";

	  // GET PRIVACY LEVEL AND SET WHERE
	  $privacy_level = $owner->user_privacy_max($user, $owner->level_info[level_album_privacy]);
	  $where = "(album_privacy<='$privacy_level')";

	  // GET TOTAL ALBUMS
	  $total_albums = $album->album_total($where);

	  // GET ALBUM ARRAY
	  $albums = $album->album_list(0, $albums_per_page, $sort, $where);

	}

	// ASSIGN ALBUMS SMARY VARIABLE
	$smarty->assign('albums', $albums);
	$smarty->assign('total_albums', $total_albums);
	break;



}
?>