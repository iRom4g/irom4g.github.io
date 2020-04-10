<?
$page = "help_tos";
include "header.php";

// ASSIGN VARIABLES AND INCLUDE FOOTER
$smarty->assign('terms_of_service', htmlspecialchars_decode($setting[setting_signup_tostext], ENT_QUOTES));
include "footer.php";
?>