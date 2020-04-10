<?
$page = "user_report_sent";
include "header.php";

// GET RETURN URL IF SET
if(isset($_GET['return_url'])) { $return_url = $_GET['return_url']; }
$return_url = urldecode($return_url);
$return_url = str_replace("&amp;", "&", $return_url);

// ASSIGN SMARTY VARS AND INCLUDE FOOTER
$smarty->assign('return_url', $return_url);
include "footer.php";
?>