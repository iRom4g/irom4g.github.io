<?
$page = "user_logout";
include "header.php";

$user->user_logout();

// FORWARD TO USER LOGIN PAGE
cheader("home.php");
exit();
?>