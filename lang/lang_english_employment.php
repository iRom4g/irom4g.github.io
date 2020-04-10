<?php

// SET GENERAL VARIABLES, AVAILABLE ON EVERY PAGE
$header_employment[1] = "Employment";
$header_employment[2] = "Manage Employments";
$header_employment[3] = "Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec"; // drop down attended month
$header_employment[4] = "Employer:";
$header_employment[5] = "Position:";
$header_employment[6] = "Description:";
$header_employment[7] = "Location:";
$header_employment[8] = "Time Period:";
$header_employment[9] = "present";
$header_employment[10] = "to";

// ASSIGN ALL SMARTY GENERAL VARIABLES
foreach ($header_employment as $key=>$val) {
  $smarty->assign("header_employment".$key, $val);
}


// SET LANGUAGE PAGE VARIABLES
switch ($page) {

  case "user_employment":
    $user_employment[1] = "My Employment";
    $user_employment[2] = "You can manage your employmental history using the form below. Employer name is required.";
    $user_employment[3] = "Are you sure?";
    $user_employment[4] = "Add New Employement (name is required)";
    $user_employment[5] = "Delete This Employment";
    $user_employment[6] = "Employer:";
    $user_employment[7] = "Position:";
    $user_employment[8] = "Description:";
    $user_employment[9] = "Location:";
    $user_employment[10] = "Time/Period:";
    $user_employment[11] = "I currently work here.";
    $user_employment[12] = "to";
    $user_employment[13] = "Save Changes";
    $user_employment[14] = "Changes saved.";
    $user_employment[15] = "Month:";
    $user_employment[16] = "Year:";
    $user_employment[17] = "present";
    break;
	
case "admin_levels_employmentsettings":
	$admin_levels_employmentsettings[1] = "Employment Settings";
	$admin_levels_employmentsettings[2] = "If you have enabled employments, your users will have the option of creating employments. Use this page to configure your employment settings.";
	$admin_levels_employmentsettings[3] = "Allow Employments?";
	$admin_levels_employmentsettings[4] = "If you have selected YES, your users will have the option of creating employments. Note that if you switch this from YES to NO, users will lose any current employments they have.";
	$admin_levels_employmentsettings[5] = "Yes, users can create employments.";
	$admin_levels_employmentsettings[6] = "No, users cannot create employments.";
	$admin_levels_employmentsettings[7] = "Save Changes";
	$admin_levels_employmentsettings[8] = "Your changes have been saved.";
	$admin_levels_employmentsettings[9] = "Editing User Level:";
	$admin_levels_employmentsettings[10] = "You are currently editing this user level's settings. Remember, these settings only apply to the users that belong to this user level. When you're finished, you can edit the <a href='admin_levels.php'>other levels here</a>.";

	break;
}

// ASSIGN ALL SMARTY VARIABLES
if (is_array(${"$page"})) {
  foreach (${"$page"} as $key=>$val) {
    $smarty->assign($page.$key, $val);
  }
}

