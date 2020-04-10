<?

if($folder == "base") {
	$serverpath = ".";
} else {
	$serverpath = "..";
}

// SPECIFY PATHS TO SMARTY RESOURCES
$smartypath_template_dir = realpath("$serverpath/templates");
$smartypath_compile_dir = realpath("$serverpath/include/smarty/templates_c");
$smartypath_cache_dir = realpath("$serverpath/include/smarty/cache");
$smartypath_config_dir = realpath("$serverpath/include/smarty/configs");

// INITIATE SMARTY CLASS
require("$serverpath/include/smarty/Smarty.class.php");
$smarty = new Smarty();

// ASSIGN SMARTY TEMPLATE DIRECTORY PATHS
$smarty->template_dir = $smartypath_template_dir;
$smarty->compile_dir = $smartypath_compile_dir;
$smarty->cache_dir = $smartypath_cache_dir;
$smarty->config_dir = $smartypath_config_dir;

?>
