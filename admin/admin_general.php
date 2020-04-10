<?
$page = "admin_general";
include "admin_header.php";

if(isset($_POST['task'])) { $task = $_POST['task']; } else { $task = "main"; }


// SET RESULT VARIABLE
$result = 0;


// SAVE CHANGES
if($task == "dosave") {
  $setting_lang_default = strtolower($_POST['setting_lang_default']);
  $setting_lang_allow = $_POST['setting_lang_allow'];
  $setting_timezone = $_POST['setting_timezone'];
  $setting_dateformat = $_POST['setting_dateformat'];
  $setting_timeformat = $_POST['setting_timeformat'];
  $setting_permission_profile = $_POST['setting_permission_profile'];
  $setting_permission_invite = $_POST['setting_permission_invite'];
  $setting_permission_search = $_POST['setting_permission_search'];
  $setting_permission_portal = $_POST['setting_permission_portal'];

  $database->database_query("UPDATE se_settings SET 
			setting_lang_default='$setting_lang_default', 
			setting_lang_allow='$setting_lang_allow', 
			setting_timezone='$setting_timezone', 
			setting_dateformat='$setting_dateformat', 
			setting_timeformat='$setting_timeformat',
			setting_permission_profile='$setting_permission_profile',
			setting_permission_invite='$setting_permission_invite',
			setting_permission_search='$setting_permission_search',
			setting_permission_portal='$setting_permission_portal'");

  $setting = $database->database_fetch_assoc($database->database_query("SELECT * FROM se_settings LIMIT 1"));
  $result = 1;
}


// GET LANGUAGE FILE OPTIONS
$lang_options = Array();
$lang_count = 0;
if($dh = opendir("../lang/")) {
  while(($file = readdir($dh)) !== false) {
    if($file != "." & $file != "..") {
      if(preg_match("/lang_([^_]+)\.php/", $file, $matches)) {
        $lang_options[$lang_count] = ucfirst($matches[1]);
        $lang_count++;
      }
    }
  }
  closedir($dh);
}



// ASSIGN VARIABLES AND SHOW GENERAL SETTINGS PAGE
$smarty->assign('result', $result);
$smarty->assign('lang_options', $lang_options);
$smarty->assign('lang_value', $setting[setting_lang_default]);
$smarty->assign('lang_allow', $setting[setting_lang_allow]);
$smarty->assign('timezone_value', $setting[setting_timezone]);
$smarty->assign('dateformat_value', $setting[setting_dateformat]);
$smarty->assign('timeformat_value', $setting[setting_timeformat]);
$smarty->assign('permission_profile', $setting[setting_permission_profile]);
$smarty->assign('permission_invite', $setting[setting_permission_invite]);
$smarty->assign('permission_search', $setting[setting_permission_search]);
$smarty->assign('permission_portal', $setting[setting_permission_portal]);
$smarty->display("$page.tpl");
exit();
?>