<?

// ENSURE THIS IS BEING INCLUDED IN AN SE SCRIPT
if(!defined('SE_PAGE')) { exit(); }

// INCLUDE PLUGIN FOOTERS
for($g=0;$g<count($global_plugins);$g++) {
  if(file_exists("footer_".$global_plugins[$g].".php")) { include "footer_".$global_plugins[$g].".php"; } 
}



// ASSIGN LOGGED-IN USER VARS
if($user->user_exists != 0) { 
  $smarty->assign('user_unread_pms', $user->user_message_total(0, 1));
}

// ASSIGN GLOBAL SMARTY OBJECTS/VARIABLES AND DISPLAY PAGE
$smarty->assign('url', $url);
$smarty->assign('misc', $misc);
$smarty->assign('datetime', $datetime);
$smarty->assign('database', $database);
$smarty->assign('user', $user);
$smarty->assign('owner', $owner);
$smarty->assign('ads', $ads);
$smarty->assign('setting', $setting);
$smarty->assign_by_ref('global_plugin_menu', $dummy = null);
$smarty->assign('global_plugins', $global_plugins);
$smarty->assign('global_page', $page);
$smarty->assign('global_page_title', $header[20]);
$smarty->assign('global_css', $global_css);
$smarty->assign('global_timezone', $global_timezone);
$smarty->display("$page.tpl");
exit();
?>