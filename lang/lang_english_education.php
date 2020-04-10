<?php

// SET GENERAL VARIABLES, AVAILABLE ON EVERY PAGE
$header_education[1] = "Education";
$header_education[2] = "Manage Schools";
$header_education[3] = "Elementary School|High School|College|Graduate School|Professional School"; // drop down attended for / school type
$header_education[4] = "Attended for:";
$header_education[5] = "Degree";
$header_education[6] = "Concentration";

// ASSIGN ALL SMARTY GENERAL VARIABLES
foreach ($header_education as $key=>$val) {
  $smarty->assign("header_education".$key, $val);
}


// SET LANGUAGE PAGE VARIABLES
switch ($page) {

  case "user_education":
    $user_education[1] = "My Education";
    $user_education[2] = "You can manage your educational history using the form below.";
    $user_education[3] = "Are you sure?";
    $user_education[4] = "Add New School (name is required)";
    $user_education[5] = "Delete This School";
    $user_education[6] = "Name:";
    $user_education[7] = "Attended for:";
    $user_education[8] = "Class Year:";
    $user_education[9] = "Degree:";
    $user_education[10] = "Concentration:";
    $user_education[11] = "2nd Concentration:";
    $user_education[12] = "3rd Concentration:";
    $user_education[13] = "Save Changes";
    $user_education[14] = "Changes saved.";
    break;
	
case "admin_levels_educationsettings":
	$admin_levels_educationsettings[1] = "Education Settings";
	$admin_levels_educationsettings[2] = "If you have enabled educations, your users will have the option of creating educations. Use this page to configure your education settings.";
	$admin_levels_educationsettings[3] = "Allow Educations?";
	$admin_levels_educationsettings[4] = "If you have selected YES, your users will have the option of creating educations. Note that if you switch this from YES to NO, users will lose any current educations they have.";
	$admin_levels_educationsettings[5] = "Yes, users can create educations.";
	$admin_levels_educationsettings[6] = "No, users cannot create educations.";
	$admin_levels_educationsettings[7] = "Save Changes";
	$admin_levels_educationsettings[8] = "Your changes have been saved.";
	$admin_levels_educationsettings[9] = "Editing User Level:";
	$admin_levels_educationsettings[10] = "You are currently editing this user level's settings. Remember, these settings only apply to the users that belong to this user level. When you're finished, you can edit the <a href='admin_levels.php'>other levels here</a>.";

	break;
    
}

// ASSIGN ALL SMARTY VARIABLES
if (is_array(${"$page"})) {
  foreach (${"$page"} as $key=>$val) {
    $smarty->assign($page.$key, $val);
  }
}

