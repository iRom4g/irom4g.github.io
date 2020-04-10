<?

// SET ERROR REPORTING
error_reporting(E_ALL ^ E_NOTICE);

// CHECK FOR PAGE VARIABLE
if(!isset($page)) { $page = ""; }

// DEFINE SE PAGE CONSTANT
define('SE_PAGE', true);

// INITIATE SMARTY
$folder = "admin";
include "../include/smarty/smarty_config.php";

// INCLUDE VERSION
include "../include/version.php";

// INCLUDE DATABASE INFORMATION
include "../include/database_config.php";

// INCLUDE CLASS/FUNCTION FILES
include "../include/class_database.php";
include "../include/class_datetime.php";
include "../include/class_upload.php";
include "../include/class_user.php";
include "../include/class_url.php";
include "../include/class_misc.php";
include "../include/functions_general.php";
include "../include/functions_email.php";
include "../include/functions_stats.php";

// INCLUDE ADMIN-SPECIFIC CLASS/FUNCTION FILES
include "../include/class_admin.php";

// INITIATE DATABASE CONNECTION
$database = new se_database($database_host, $database_username, $database_password, $database_name);

// GET SETTINGS
$setting = $database->database_fetch_assoc($database->database_query("SELECT * FROM se_settings LIMIT 1"));

// SET GLOBAL DEFAULT LANGUAGE VAR
$global_lang = $setting[setting_lang_default];

// INCLUDE LANGUAGE FILES
include "../lang/lang_".$global_lang.".php";
include "../lang/lang_".$global_lang."_admin.php";


// ENSURE NO SQL INJECTIONS THROUGH POST OR GET ARRAYS
$_POST = security($_POST);
$_GET = security($_GET);

// CREATE URL CLASS
$url = new se_url();

// CREATE DATETIME CLASS
$datetime = new se_datetime();


// CREATE ADMIN OBJECT AND ATTEMPT TO LOG ADMIN IN
$admin = new se_admin();
$admin->admin_checkCookies();

// ADMIN IS NOT LOGGED IN AND NOT ON LOGIN PAGE
if($page != "admin_login" & $page != "admin_lostpass" AND $page != "admin_lostpass_reset" & $admin->admin_exists == 0) { header("Location: admin_login.php"); exit; }




// GET USER LEVEL MENU OPTIONS
$level_menu = Array();
$level_menu[] = Array('page' => 'admin_levels_edit',
			'title' => $admin_header[29],
			'link' => 'admin_levels_edit.php');
$level_menu[] = Array('page' => 'admin_levels_usersettings',
			'title' => $admin_header[30],
			'link' => 'admin_levels_usersettings.php');
$level_menu[] = Array('page' => 'admin_levels_messagesettings',
			'title' => $admin_header[31],
			'link' => 'admin_levels_messagesettings.php');

// GET PLUGIN USER LEVEL MENU OPTIONS AND INCLUDE PLUGIN PAGES
$global_plugins = Array();
$plugins = $database->database_query("SELECT plugin_type, plugin_pages_level FROM se_plugins ORDER BY plugin_id ASC");
while($plugin_info = $database->database_fetch_assoc($plugins)) {
  if(file_exists("admin_header_".$plugin_info[plugin_type].".php")) { include "admin_header_".$plugin_info[plugin_type].".php"; } 
  $global_plugins[] = $plugin_info[plugin_type];

  $plugin_pages_level = explode("<~!~>", $plugin_info[plugin_pages_level]);
  for($l=0;$l<count($plugin_pages_level);$l++) {
    $plugin_page = explode("<!>", $plugin_pages_level[$l]);
    if($plugin_page[0] != "" & $plugin_page[1] != "") {
      $level_page = strrev(substr(strrev($plugin_page[1]), 4));
      $level_menu[] = Array('page' => $level_page,
				'title' => $plugin_page[0],
				'link' => $plugin_page[1]);
    }
  }
}




// ASSIGN ALL SMARTY VARIABLES
$smarty->assign('url', $url);
$smarty->assign('page', $page);
$smarty->assign('admin', $admin);
$smarty->assign('setting', $setting);
$smarty->assign('datetime', $datetime);
$smarty->assign('level_menu', $level_menu);

?>