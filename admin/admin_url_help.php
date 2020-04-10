<?
$page = "admin_url_help";
include "admin_header.php";

$server_array = explode("/", $_SERVER['PHP_SELF']);
$server_array_mod = array_pop($server_array);
$server_array_mod = array_pop($server_array);
$server_info = implode("/", $server_array);


$htaccess = "RewriteEngine On
Options +Followsymlinks
RewriteBase /
RewriteCond %{REQUEST_FILENAME} -d
RewriteRule ^.* - [L,QSA]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteRule ^.*/images/(.*)$ $server_info/images/$1 [L]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteRule ^.*/uploads_user/(.*)$ $server_info/uploads_user/$1 [L]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteRule ^([^/]+)/?$ $server_info/profile.php?user=$1 [L]";



// GET PLUGIN HTACCESS
$plugins = $database->database_query("SELECT plugin_url_htaccess FROM se_plugins ORDER BY plugin_id DESC");
while($plugin_info = $database->database_fetch_assoc($plugins)) {
  $htaccess .= "\r\n".str_replace("\$server_info", $server_info, $plugin_info[plugin_url_htaccess]);
}



// ASSIGN VARIABLES AND SHOW URL HELP PAGE
$smarty->assign('htaccess', $htaccess);
$smarty->display("$page.tpl");
exit();
?>