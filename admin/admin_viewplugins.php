<?
$page = "admin_viewplugins";
include "admin_header.php";

// INSTALL RELEVANT PLUGIN
if(isset($_GET['install'])) {
  $install = $_GET['install'];
  if(file_exists("./install_$install.php")) { 
    include "./install_$install.php"; 
    header("Location: admin_viewplugins.php");
    exit();  
  }
}


// TRY TO READ VERSION FILE FROM SOCIALENGINE SERVER
/**
include "../include/xmlrpc/xmlrpc.inc";
$f = new xmlrpcmsg('versions', array(php_xmlrpc_encode($setting[setting_key])));
$c = new xmlrpc_client("/remote_versions.php", "www.s0c1aleng1ne.not", 80);
$r = &$c->send($f);
$v = $r->value();
if($v != 0) {
  $max = $v->arraysize();
  $versions = Array();
  for($i=0;$i<$max;$i++) {
    $rec = $v->arraymem($i);
    $download_type = $rec->structmem("type");
    $download_version = $rec->structmem("version");
    $versions[$download_type->scalarval()] = $download_version->scalarval();
  }
}
**/

// GET INSTALLED PLUGINS
$plugins_installed = Array();
$plugin_types = Array();
$plugins = $database->database_query("SELECT * FROM se_plugins ORDER BY plugin_id DESC");
while($plugin_info = $database->database_fetch_assoc($plugins)) {

  // CHECK FOR INSTALL FILE
  $plugin_version_ready = "";
  if(file_exists("./install_$plugin_info[plugin_type].php")) {
    include "./install_$plugin_info[plugin_type].php";
    $plugin_version_ready = $plugin_version;
  }

  // GET MAIN PAGES
  $plugin_pages_main = explode("<~!~>", $plugin_info[plugin_pages_main]);
  $main_pages = Array();
  for($l=0;$l<count($plugin_pages_main);$l++) {
    $plugin_page = explode("<!>", $plugin_pages_main[$l]);
    if($plugin_page[0] != "" & $plugin_page[1] != "") {
      $main_pages[] = Array('title' => $plugin_page[0],
				'file' => $plugin_page[1]);
    }
  }

  // SET PLUGIN ARRAYS
  $plugin_types[] = "install_$plugin_info[plugin_type].php";
  $plugins_installed[] = Array('plugin_name' => $plugin_info[plugin_name],
				'plugin_version' => $plugin_info[plugin_version],
				'plugin_type' => $plugin_info[plugin_type],
				'plugin_desc' => $plugin_info[plugin_desc],
				'plugin_icon' => $plugin_info[plugin_icon],
				'plugin_version_avail' => $versions[$plugin_info[plugin_type]],
				'plugin_version_ready' => $plugin_version_ready,
				'plugin_pages_main' => $main_pages);
}


// BEGIN READY-TO-INSTALL PLUGIN ARRAY
$plugins_ready = Array();

// FIND INSTALL FILES
if($dh = opendir("./")) {
  while(($file = readdir($dh)) !== false) {
    if($file != "." & $file != "..") {
      if(strpos($file, "install_") === 0 & !in_array($file, $plugin_types)) {
        include "./$file";
	$plugins_ready[] = Array('plugin_name' => $plugin_name,
				'plugin_version' => $plugin_version,
				'plugin_type' => $plugin_type,
				'plugin_desc' => $plugin_desc,
				'plugin_icon' => $plugin_icon);
      }
    }
  }
  closedir($dh);
}


// ASSIGN VARIABLES AND SHOW ADMIN VIEW PLUGINS PAGE
$smarty->assign('plugins_ready', $plugins_ready);
$smarty->assign('plugins_installed', $plugins_installed);
$smarty->assign('versions', $versions);
$smarty->display("$page.tpl");
exit();
?>