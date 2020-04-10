<?
// SET GENERAL VARIABLES, AVAILABLE ON EVERY PAGE
$header_music[1] = "Music";
$header_music[2] = "view all";
$header_music[3] = "Untitled";
$header_music[4] = "votes";
$header_music[5] = "'s Music";
 
// ASSIGN ALL SMARTY GENERAL poll VARIABLES
reset($header_music);
while(list($key, $val) = each($header_music)) {
  $smarty->assign("header_music".$key, $val);
}


// ASSIGN ALL CLASS/FUNCTION FILE VARIABLES
$functions_music[1] = "polls";
$functions_music[2] = "Created by ";
$functions_music[3] = "Untitled Poll";



// SET LANGUAGE PAGE VARIABLES
switch ($page) {

  case "user_music_edit":
	$user_music_edit[1] = "My Music Playlist";
	$user_music_edit[2] = "These are the songs you've uploaded to your playlist. People will be able to listen to them on your profile";
	$user_music_edit[3] = "Type in the new title for the track below, then press Update Song to make the changes";
	$user_music_edit[4] = "Edit Music";
	$user_music_edit[5] = "Music Settings";
	$user_music_edit[6] = "Track #";
	$user_music_edit[7] = "Song Title";
	$user_music_edit[8] = "Size";
	$user_music_edit[9] = "Options";
	$user_music_edit[10] = "move up";
	$user_music_edit[11] = "edit";
	$user_music_edit[12] = "delete";
	$user_music_edit[13] = "Upload New Songs";
	$user_music_edit[14] = "You do not have any music";
	break;

  case "user_music_upload":
	$user_music_upload[1] = "Upload New Music";
	$user_music_upload[2] = "Browse for music files on your computer and upload them to your playlist.";
	$user_music_upload[3] = "Back to My Playlist";
	$user_music_upload[4] = "You may upload files with sizes up to";
	$user_music_upload[5] = "You may upload files of the following types:";
	$user_music_upload[6] = "You have";
	$user_music_upload[7] = "MB of free space remaining";
	$user_music_upload[8] = "File: ";
	$user_music_upload[9] = "File 2 ";
	$user_music_upload[10] = "File 3 ";
	$user_music_upload[11] = "File 4 ";
	$user_music_upload[12] = "File 5 ";
	$user_music_upload[13] = "Back to My Playlist";
	$user_music_upload[14] = "The file ";
	$user_music_upload[15] = " has been uploaded successfully";
	$user_music_upload[16] = " was unable to be uploaded, please try again later";
	$user_music_upload[17] = "You may be prompted to allow a Java Applet to download or install. If so, please click 'Yes' or 'OK' to allow it.";
	$user_music_upload[18] = "If the file uploader does not show up after 10-15 seconds, <a href=\"#\" onclick=\"javascript:showBasic(); return false;\">click here</a> to use the basic file uploader";
	$user_music_upload[19] = "<img src='images/icons/music_working.gif' style='vertical-align:middle'>&nbsp;Please wait while the file upload applet loads";
	$user_music_upload[20] = "&nbsp;Your song is uploading, please do not leave this page. You will be notified when it is complete.";
	$user_music_upload[21] = "Upload Song";
	break;

  case "user_music_delete":
	$user_music_delete[1] = "Delete Song?";
	$user_music_delete[2] = "Are your sure you want to delete this song?";
	$user_music_delete[3] = "Delete Song";
	$user_music_delete[4] = "Cancel";
	$user_music_delete[5] = "Edit Music";
	$user_music_delete[6] = "Music Settings";
	break;
	
  case "user_music_settings":
	$user_music_settings[1] = "Edit Music Settings";
	$user_music_settings[2] = "Configure the music player on your profile with these settings.";
	$user_music_settings[3] = "Add Music";
	$user_music_settings[4] = "Edit Music";
	$user_music_settings[5] = "Music Settings";
	$user_music_settings[6] = "Skins";
	$user_music_settings[7] = "Preview";
	$user_music_settings[8] = "Skin Name";
	$user_music_settings[9] = "Autoplay my music on my profile?";
	$user_music_settings[10] = "Yes, make my songs auto-play when people visit my profile.";
	$user_music_settings[11] = "No, visitors to my profile must click the play button to hear my music.";
	$user_music_settings[12] = "Autoplay other people's music on their profiles?";
	$user_music_settings[13] = "Yes, auto-play other people's music when I visit their profiles.";
	$user_music_settings[14] = "No, turn auto-play off when I visit other people's profiles.";
	$user_music_settings[15] = "Save Changes";
	break;
  
  case "admin_viewmusic":
  	$admin_viewmusic[1] = "View User Music";
  	$admin_viewmusic[2] = "This page lists all of the music that your users have posted. You can use this page to monitor the music and delete them if necessary. Entering criteria into the filter fields will help you find specific music. Leaving the filter fields blank will show all the music on your social network.";
  	$admin_viewmusic[3] = "ID";
  	$admin_viewmusic[4] = "Title";
  	$admin_viewmusic[5] = "Owner";
  	$admin_viewmusic[6] = "Date";
  	$admin_viewmusic[7] = "Options";
  	$admin_viewmusic[8] = "delete";
  	$admin_viewmusic[9] = "preview";
  	$admin_viewmusic[10] = "Total Tracks";
  	$admin_viewmusic[11] = "Pages";
  	$admin_viewmusic[12] = "There are no music tracks";
  	$admin_viewmusic[13] = "Filter";
  	$admin_viewmusic[14] = "Delete Selected";
  	$admin_viewmusic[15] = "Delete Song";
  	$admin_viewmusic[16] = "Are you sure you want to delete this song?";
  	$admin_viewmusic[17] = "Cancel";
  	break;
  	
  case "admin_levels_musicsettings":
  	$admin_levels_musicsettings[1] = "Music Settings";
  	$admin_levels_musicsettings[2] = "If you have allowed users to add music to their profiles, you can adjust the details from this page.";
  	$admin_levels_musicsettings[3] = "Allow Music?";
  	$admin_levels_musicsettings[4] = "Do you want to allow users to upload music to their profile?";
  	$admin_levels_musicsettings[5] = "Yes, allow Music";
  	$admin_levels_musicsettings[6] = "No, do not allow Music";
  	$admin_levels_musicsettings[7] = "Maximum Allowed Songs";
  	$admin_levels_musicsettings[8] = "Enter the maximum number of allowed songs. The field must contain an integer between 1 and 999.";
  	$admin_levels_musicsettings[9] = "allowed songs";
  	$admin_levels_musicsettings[10] = "Allowed Filetypes";
  	$admin_levels_musicsettings[11] = "List the following file extensions that users are allowed to upload. Separate file extensions with commas, for example: mp3, mp4";
  	$admin_levels_musicsettings[12] = "Allowed MIME Types";
  	$admin_levels_musicsettings[13] = "To successfully upload a file, the file must have an allowed filetype extension as well as an allowed MIME type. This prevents users from disguising malicious files with a fake extension. Separate MIME types with commas, for example: image/jpeg, image/gif, image/png, image/bmp";
  	$admin_levels_musicsettings[14] = "Allowed Storage Space";
  	$admin_levels_musicsettings[15] = "How much storage space should each user have to store their files?";
  	$admin_levels_musicsettings[16] = "Maximum Filesize";
  	$admin_levels_musicsettings[17] = "Enter the maximum filesize for uploaded files in KB. This must be a number between 1 and 204800.";
  	$admin_levels_musicsettings[18] = "Save Changes";
  	$admin_levels_musicsettings[19] = "Editing User Level";
  	$admin_levels_musicsettings[20] = "You are currently editing this user level's settings. Remember, these settings only apply to the users that belong to this user level. When you're finished, you can edit the <a href='admin_levels.php'>other levels here</a>.";
  	$admin_levels_musicsettings[21] = "Your Changes Have Been Saved";
  	$admin_levels_musicsettings[22] = "Your maximum filesize field must contain an integer between 1 and 204800.";
  	$admin_levels_albumsettings[23] = "Your maximum allowed songs field must contain an integer between 1 and 999.";
  	$admin_levels_musicsettings[24] = "Allow skins?";
  	$admin_levels_musicsettings[25] = "Should the users be able to select their own skins?";
  	$admin_levels_musicsettings[26] = "Yes, allow Skins";
  	$admin_levels_musicsettings[27] = "No, do not allow Skins";
  	$admin_levels_musicsettings[28] = "Default Skin:";
	$admin_levels_musicsettings[29] = "preview";
  	break;
}
// ASSIGN ALL SMARTY VARIABLES
if(is_array(${"$page"})) {
  reset(${"$page"});
  while(list($key, $val) = each(${"$page"})) {
    $smarty->assign($page.$key, $val);
  }
}
?>
