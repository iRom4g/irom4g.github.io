<?
// SET GENERAL VARIABLES, AVAILABLE ON EVERY PAGE
$header_group[1] = "Groups";
$header_group[2] = "Groups";

// ASSIGN ALL SMARTY GENERAL GROUP VARIABLES
reset($header_group);
while(list($key, $val) = each($header_group)) {
  $smarty->assign("header_group".$key, $val);
}



// ASSIGN ALL CLASS/FUNCTION FILE VARIABLES
$functions_group[1] = "Everyone";
$functions_group[2] = "All Registered Users";
$functions_group[3] = "Only Group Members, Their Friends, and Their Friends' Friends";
$functions_group[4] = "Only Group Members and Their Friends";
$functions_group[5] = "Only Group Members and Group Leader's Friends";
$functions_group[6] = "Only Group Members";
$functions_group[7] = "Only Group Leader";
$functions_group[8] = "Nobody";
$functions_group[9] = "groups/group photos";
$functions_group[10] = "Photo in group: ";
$functions_group[11] = " new group invite(s)";

$class_group[1] = "Please ensure you have completed all the required fields.";
$class_group[2] = "Please ensure you have filled out the fields in the proper format.";
$class_group[3] = "You do not have enough free space to upload ";
$class_group[4] = "MONTH";
$class_group[5] = "DAY";
$class_group[6] = "YEAR";



// SET LANGUAGE PAGE VARIABLES
switch ($page) {

  case "admin_group":
	$admin_group[1] = "General Group Settings";
	$admin_group[2] = "This page contains general group settings that affect your entire social network.";
	$admin_group[3] = "Your changes have been saved.";
	$admin_group[4] = "Subject";
	$admin_group[5] = "Message";
	$admin_group[6] = "Group Invitation Email";
	$admin_group[7] = "This is the email that gets sent to a user when they are invited to join a group. For more system emails, please visit the <a href='admin_emails.php'>System Emails</a> page.";
	$admin_group[8] = "[username] - replaced with the username of the recepient.<br>[groupname] - replaced with the name of the group.<br>[link] - replaced with the link to login.";
	$admin_group[9] = "Save Changes";
	$admin_group[10] = "Public Permission Defaults";
	$admin_group[11] = "Select whether or not you want to let the public (visitors that are not logged-in) to view the following sections of your social network. In some cases (such as Profiles, Blogs, and Albums), if you have given them the option, your users will be able to make their pages private even though you have made them publically viewable here. For more permissions settings, please visit the <a href='admin_general.php'>General Settings</a> page.";
	$admin_group[12] = "Groups";
	$admin_group[13] = "Yes, the public can view groups unless they are made private.";
	$admin_group[14] = "No, the public cannot view groups.";
	$admin_group[15] = "New Group Comment Email";
	$admin_group[16] = "This is the email that gets sent to a user when a new comment is posted about a group they lead. For more system emails, please visit the <a href='admin_emails.php'>System Emails</a> page.";
	$admin_group[17] = "[username] - replaced with the username of the recepient.<br>[commenter] - replaced with the name of the user who posted the comment.<br>[groupname] - replaced with the name of the group.<br>[link] - replaced with the link to the group.";
	$admin_group[18] = "New Group Media Comment Email";
	$admin_group[19] = "This is the email that gets sent to a user when a new comment is posted on one of the photos/files in a group they lead. For more system emails, please visit the <a href='admin_emails.php'>System Emails</a> page.";
	$admin_group[20] = "[username] - replaced with the username of the recepient.<br>[commenter] - replaced with the name of the user who posted the comment.<br>[groupname] - replaced with the name of the group.<br>[link] - replaced with the link to the photo.";
	$admin_group[21] = "New Group Membership Request Email";
	$admin_group[22] = "This is the email that gets sent to a user when someone requests membership to a group they lead. For more system emails, please visit the <a href='admin_emails.php'>System Emails</a> page.";
	$admin_group[23] = "[username] - replaced with the username of the recepient.<br>[requester] - replaced with the name of the user who is requesting membership.<br>[groupname] - replaced with the name of the group.<br>[link] - replaced with the link to login.";
	$admin_group[24] = "Group Fields";
	$admin_group[25] = "When a group is created, the group creator (owner) will describe the group by filling in some fields with information about the group. Add the fields you want to include below. Some examples of group fields are \"Location\", \"Group Email\", \"Website URL\", etc. Remember that a \"Group Name\" field will always be available and required. Click an arrow next to a field to change the field order.";
	$admin_group[26] = "There are currently no group fields.";
	$admin_group[27] = "Add New Group Field";
	$admin_group[28] = "Group Categories";
	$admin_group[29] = "You may want to allow your users to categorize their groups by subject, location, etc. Categorized groups make it easier for users to find and join groups that interest them. If you want to allow group categories, you can create them (along with subcategories) below.";
	$admin_group[30] = "Add Category";
	$admin_group[31] = "Add Subcategory";
	$admin_group[32] = "Require users to enter validation code when starting or posting in a discussion topic?";
	$admin_group[33] = "If you have selected Yes, an image containing a random sequence of 6 numbers will be shown to users on the \"start a topic\" and \"post topic reply\" page. Users will be required to enter these numbers into the Verification Code field in order to post their topic/reply. This feature helps prevent users from trying to create discussion topic spam. For this feature to work properly, your server must have the GD Libraries (2.0 or higher) installed and configured to work with PHP. If you are seeing errors, try turning this off. ";
	$admin_group[34] = "Yes, enable validation code for discussion topics.";
	$admin_group[35] = "No, disable validation code for discussion topics.";
	break;

case "admin_levels_groupsettings":
	$admin_levels_groupsettings[1] = "User Group Settings";
	$admin_levels_groupsettings[2] = "If you have enabled user groups, your users will have the option of creating groups and inviting members. This is an excellent way to encourage user interaction. Use this page to configure your user group settings.";
	$admin_levels_groupsettings[3] = "Allow User Groups?";
	$admin_levels_groupsettings[4] = "If you have selected YES, your users will have the option of creating and joining groups. Note that if you switch this from YES to NO, users will lose any current group memberships they have.";
	$admin_levels_groupsettings[5] = "Yes, users can create groups.";
	$admin_levels_groupsettings[6] = "No, users cannot create groups.";
	$admin_levels_groupsettings[7] = "Save Changes";
	$admin_levels_groupsettings[8] = "Your changes have been saved.";
	$admin_levels_groupsettings[9] = "Allow Group Photos?";
	$admin_levels_groupsettings[10] = "If you enable this feature, users will be able to upload a small photo icon when creating or editing a group. This can be displayed next to the group name on users' profiles, in search/browse results, etc.";
	$admin_levels_groupsettings[11] = "Yes, users can upload a photo icon when they create/edit a group.";
	$admin_levels_groupsettings[12] = "No, users can not upload a photo icon when they create/edit a group.";
	$admin_levels_groupsettings[13] = "If you have selected YES above, please input the maximum dimensions for the group photos. If your users upload a photo that is larger than these dimensions, the server will attempt to scale them down automatically. This feature requires that your PHP server is compiled with support for the GD Libraries.";
	$admin_levels_groupsettings[14] = "Maximum Width:";
	$admin_levels_groupsettings[15] = "(in pixels, between 1 and 999)";
	$admin_levels_groupsettings[16] = "Maximum Height:";
	$admin_levels_groupsettings[17] = "What file types do you want to allow for group photos (gif, jpg, jpeg, or png)? Separate file types with commas, i.e. jpg, jpeg, gif, png";
	$admin_levels_groupsettings[18] = "Allowed File Types:";
	$admin_levels_groupsettings[19] = "Allow Member Titles?";
	$admin_levels_groupsettings[20] = "If set to YES, group owners/officers will be able to give group members special titles. (e.g. \"President\", \"Vice President\", \"Treasurer\", etc.)";
	$admin_levels_groupsettings[21] = "Yes, allow member titles.";
	$admin_levels_groupsettings[22] = "No, do not allow member titles.";
	$admin_levels_groupsettings[23] = "Allow Group Officers?";
	$admin_levels_groupsettings[24] = "If set to YES, group owners will be able to promote group members to \"officers\". Officers have all of the abilities of group owners, except that they cannot remove the group owner. Note: If this feature was previously set to YES and you change it to NO, any officers that already exist within groups will be automatically demoted to members.";
	$admin_levels_groupsettings[25] = "Yes, allow group officers.";
	$admin_levels_groupsettings[26] = "No, do not allow group officers.";
	$admin_levels_groupsettings[27] = "Allow Member Approval?";
	$admin_levels_groupsettings[28] = "Do you want to give owners and officers the ability to approve new members? If set to YES, group owners and officers will be able to turn on the \"members can join by approval only\" feature. This forces prospective members to wait for approval before they can become a group member.";
	$admin_levels_groupsettings[29] = "Yes, optionally allow the member approval feature.";
	$admin_levels_groupsettings[30] = "No, do not allow the member approval feature.";
	$admin_levels_groupsettings[31] = "Allow custom CSS styles?";
	$admin_levels_groupsettings[32] = "If you enable this feature, your users will be able to customize the colors and fonts of their groups by altering their CSS styles. ";
	$admin_levels_groupsettings[33] = "Yes, allow custom css.";
	$admin_levels_groupsettings[34] = "No, do not allow custom css.";
	$admin_levels_groupsettings[35] = "Group File Settings";
	$admin_levels_groupsettings[36] = "List the following file extensions that users are allowed to upload. Separate file extensions with commas, for example: jpg, gif, jpeg, png, bmp";
	$admin_levels_groupsettings[37] = "To successfully upload a file, the file must have an allowed filetype extension as well as an allowed MIME type. This prevents users from disguising malicious files with a fake extension. Separate MIME types with commas, for example: image/jpeg, image/gif, image/png, image/bmp";
	$admin_levels_groupsettings[38] = "How much storage space should each group have to store its files?";
	$admin_levels_groupsettings[39] = "Unlimited";
	$admin_levels_groupsettings[40] = "Enter the maximum filesize for uploaded files in KB. This must be a number between 1 and 204800.";
	$admin_levels_groupsettings[41] = "Enter the maximum width and height (in pixels) for images uploaded to groups. Images with dimensions outside this range will be sized down accordingly if your server has the GD Libraries installed. Note that unusual image types like BMP, TIFF, RAW, and others may not be resized.";
	$admin_levels_groupsettings[42] = "Maximum Width:";
	$admin_levels_groupsettings[43] = "Maximum Height:";
	$admin_levels_groupsettings[44] = "(in pixels, between 1 and 9999)";
	$admin_levels_groupsettings[45] = "Maximum Allowed Groups";
	$admin_levels_groupsettings[46] = "Enter the maximum number of groups each user can own. This must be an integer between 1 and 999.";
	$admin_levels_groupsettings[47] = "allowed groups";
	$admin_levels_groupsettings[48] = "Photo width and height must be integers between 1 and 999.";
	$admin_levels_groupsettings[49] = "Your maximum filesize field must contain an integer between 1 and 204800.";
	$admin_levels_groupsettings[50] = "Your maximum width and height fields must contain integers between 1 and 9999.";
	$admin_levels_groupsettings[51] = "Your maximum allowed albums field must contain an integer between 1 and 999.";
	$admin_levels_groupsettings[52] = "<b>Group Discussion Options</b><br>Group leaders can choose from any of the options checked below when they decide who can create and post in discussion topics in their groups. If you do not check any options, everyone will be allowed to post discussion topics in groups.";
	





	$admin_levels_groupsettings[59] = "<b>Search Privacy Options</b><br>If you enable this feature, group leaders will be able to exclude their group from search results. Otherwise, all groups will be included in search results.";
	$admin_levels_groupsettings[60] = "Yes, allow group leaders to exclude their groups from search results.";
	$admin_levels_groupsettings[61] = "No, force all groups to be included in search results.";
	$admin_levels_groupsettings[62] = "Group Privacy Options";
	$admin_levels_groupsettings[63] = "Editing User Level:";
	$admin_levels_groupsettings[64] = "You are currently editing this user level's settings. Remember, these settings only apply to the users that belong to this user level. When you're finished, you can edit the <a href='admin_levels.php'>other levels here</a>.";
	$admin_levels_groupsettings[65] = "<b>Overall Group Privacy</b><br>Group leaders can choose from any of the options checked below when they decide who can view their groups. If you do not check any options, everyone will be allowed to view groups.";
	$admin_levels_groupsettings[66] = "<b>Group Comment Options</b><br>Group leaders can choose from any of the options checked below when they decide who can post comments on their groups. If you do not check any options, everyone will be allowed to post comments on groups.";
	break;

case "admin_group_addfield":
	$admin_group_addfield[1] = "Add Group Information Field";
	$admin_group_addfield[2] = "Use this page to create a new group information field. Group information fields are used to collect information about new groups when users create them.";
	$admin_group_addfield[3] = "No dependent field";
	$admin_group_addfield[4] = "Yes, has dependent field";
	$admin_group_addfield[5] = "Field Title:";
	$admin_group_addfield[6] = "Custom Error Message:";
	$admin_group_addfield[7] = "Field Type:";
	$admin_group_addfield[8] = "Text Field";
	$admin_group_addfield[9] = "Multi-line Text Area";
	$admin_group_addfield[10] = "Pull-down Select Box";
	$admin_group_addfield[11] = "Radio Buttons";
	$admin_group_addfield[12] = "Inline CSS Style:";
	$admin_group_addfield[13] = "Field Maxlength:";
	$admin_group_addfield[14] = "Regex Validation:";
	$admin_group_addfield[15] = "If you want to force the user to enter data in a certain format,<br>enter the corresponding regular expression above. A preg_match()<br>will be applied when the user enters data. This is optional - if you<br>don't understand or need regular expressions, leave this blank.";

	$admin_group_addfield[17] = "Options:";
	$admin_group_addfield[18] = "You must specify at least one option.";
	$admin_group_addfield[19] = "Label";
	$admin_group_addfield[20] = "Dependency?";
	$admin_group_addfield[21] = "Dependent Field Label";
	$admin_group_addfield[22] = "Add New Option";
	$admin_group_addfield[23] = "Add Field";
	$admin_group_addfield[24] = "Cancel";

	$admin_group_addfield[26] = "You must specify a field type.";
	$admin_group_addfield[27] = "Please enter both a value and a label for each option.";
	$admin_group_addfield[28] = "You must enter a title for this field.";
	$admin_group_addfield[29] = "Field Description:";




	$admin_group_addfield[34] = "Required:";
	$admin_group_addfield[35] = "Required";
	$admin_group_addfield[36] = "Not Required";
	$admin_group_addfield[37] = "Date Field";
	break;

case "admin_group_editdepfield":
	$admin_group_editdepfield[1] = "Edit Dependent Group Information Field";
	$admin_group_editdepfield[2] = "Complete this form to edit this dependent field.";
	$admin_group_editdepfield[3] = "Field Label:";
	$admin_group_editdepfield[4] = "Inline CSS Style:";




	$admin_group_editdepfield[9] = "Regex Validation:";
	$admin_group_editdepfield[10] = "If you want to force the user to enter data in a certain format,<br>enter the corresponding regular expression above. A preg_match()<br>will be applied when the user enters data. This is optional - if you<br>don't understand or need regular expressions, leave this blank.";


	$admin_group_editdepfield[13] = "Save Changes";
	$admin_group_editdepfield[14] = "Cancel";
	$admin_group_editdepfield[15] = "Parent Field:";
	$admin_group_editdepfield[16] = "Field Maxlength:";
	$admin_group_editdepfield[17] = "Required:";
	$admin_group_editdepfield[18] = "Required";
	$admin_group_editdepfield[19] = "Not Required";
	break;

case "admin_group_editfield":
	$admin_group_editfield[1] = "Edit Group Information Field";
	$admin_group_editfield[2] = "Use this page to edit this group information field. Group information fields are used to collect information about new groups when users create them.";
	$admin_group_editfield[3] = "No dependent field";
	$admin_group_editfield[4] = "Yes, has dependent field";
	$admin_group_editfield[5] = "Field Title:";
	$admin_group_editfield[6] = "Custom Error Message:";
	$admin_group_editfield[7] = "Field Type:";
	$admin_group_editfield[8] = "Text Field";
	$admin_group_editfield[9] = "Multi-line Text Area";
	$admin_group_editfield[10] = "Pull-down Select Box";
	$admin_group_editfield[11] = "Radio Buttons";
	$admin_group_editfield[12] = "Inline CSS Style:";
	$admin_group_editfield[13] = "Field Maxlength:";
	$admin_group_editfield[14] = "Regex Validation:";
	$admin_group_editfield[15] = "If you want to force the user to enter data in a certain format,<br>enter the corresponding regular expression above. A preg_match()<br>will be applied when the user enters data. This is optional - if you<br>don't understand or need regular expressions, leave this blank.";

	$admin_group_editfield[17] = "Options:";
	$admin_group_editfield[18] = "You must specify at least one option.";
	$admin_group_editfield[19] = "Label";
	$admin_group_editfield[20] = "Dependency?";
	$admin_group_editfield[21] = "Dependent Field Label";
	$admin_group_editfield[22] = "Add New Option";
	$admin_group_editfield[23] = "Edit Field";
	$admin_group_editfield[24] = "Cancel";

	$admin_group_editfield[26] = "You must specify a field type.";
	$admin_group_editfield[27] = "Please enter both a value and a label for each option.";
	$admin_group_editfield[28] = "You must enter a title for this field.";
	$admin_group_editfield[29] = "Field Description:";




	$admin_group_editfield[34] = "Delete Field";
	$admin_group_editfield[35] = "Confirm Field Deletion";
	$admin_group_editfield[36] = "Are you sure you want to delete this field and any dependent fields it may have?";
	$admin_group_editfield[37] = "Required:";
	$admin_group_editfield[38] = "Required";
	$admin_group_editfield[39] = "Not Required";
	$admin_group_editfield[40] = "Date Field";
	break;

case "admin_viewgroups":
	$admin_viewgroups[1] = "View User-created Groups";
	$admin_viewgroups[2] = "This page lists all of the groups that users have created on your social network. You can use this page to monitor these groups and delete offensive or unwanted material if necessary. Entering criteria into the filter fields will help you find specific groups. Leaving the filter fields blank will show all the groups on your social network.";
	$admin_viewgroups[3] = "Title";
	$admin_viewgroups[4] = "Creator";
	$admin_viewgroups[5] = "Filter";
	$admin_viewgroups[6] = "ID";
	$admin_viewgroups[7] = "Title";
	$admin_viewgroups[8] = "Owner";
	$admin_viewgroups[9] = "Members";
	$admin_viewgroups[10] = "Date Created";
	$admin_viewgroups[11] = "Options";
	$admin_viewgroups[12] = "view";
	$admin_viewgroups[13] = "delete";
	$admin_viewgroups[14] = "Groups Found";
	$admin_viewgroups[15] = "Page:";
	$admin_viewgroups[16] = "Delete Group";
	$admin_viewgroups[17] = "Are you sure you want to delete this group?";
	$admin_viewgroups[18] = "Cancel";
	$admin_viewgroups[19] = "No groups were found.";
	$admin_viewgroups[20] = "Delete Selected";
	break;

  case "group":
	$group[1] = "You do not have permission to view this group.";
	$group[2] = "Browse Members";
	$group[3] = "Join this Group";
	$group[4] = "Leave this Group";
	$group[5] = "Group Statistics";
	$group[6] = "Leader:";
	$group[7] = "Views:";
	$group[8] = "views";
	$group[9] = "Members:";
	$group[10] = "members";
	$group[11] = "Photos:";
	$group[12] = "photos";
	$group[13] = "Last Update:";
	$group[14] = "Group Information";
	$group[15] = "Group Name:";
	$group[16] = "Description:";
	$group[17] = "Category:";
	$group[18] = "Members";
	$group[19] = "view all";
	$group[20] = "members";
	$group[21] = "Photos";
	$group[22] = "view all photos";
	$group[23] = "Comments";
	$group[24] = "Post Comment";
	$group[25] = "view all comments";
	$group[26] = "Anonymous";
	$group[27] = "message";
	$group[28] = "An Error Has Occurred";
	$group[29] = "Browse Photos";
	$group[30] = "You must be logged in to view this page. <a href='login.php'>Click here</a> to login.";
	$group[31] = "Write Something...";
	$group[32] = "Posting...";
	$group[33] = "Please enter a message.";
	$group[34] = "You have entered the wrong security code.";
	$group[35] = "\o\\n";	  //THESE CHARACTERS ARE BEING ESCAPED BECAUSE THEY ARE BEING USED IN A DATE FUNCTION
	$group[36] = "Enter the numbers you see in this image into the field to its right. This helps keep our site free of spam.";
	$group[37] = "Private Group";
	$group[38] = "Report this Group";
	$group[39] = "Return";
	$group[40] = "reply";
	$group[41] = "The group you are looking for has been deleted or does not exist.";
	$group[42] = "Discussion Topics";
	$group[43] = "view all topics";
	$group[44] = "There are no discussion topics.";
	$group[45] = "start topic";
	$group[46] = "post(s), updated";
	$group[47] = "discussion topics";
	$group[48] = "Topics:";
	break;

  case "group_album":
	$group_album[1] = "You do not have permission to view this album.";
	$group_album[2] = "'s Photos";
	$group_album[3] = "An Error Has Occurred";
	$group_album[4] = "You must be logged in to view this page. <a href='login.php'>Click here</a> to login.";
	$group_album[5] = "Last Page";
	$group_album[6] = "viewing image";
	$group_album[7] = "of";
	$group_album[8] = "viewing images";
	$group_album[9] = "Next Page";
	$group_album[10] = "Return";
	break;

  case "group_album_file":
	$group_album_file[1] = "You do not have permission to view this file.";
	$group_album_file[2] = "'s Photo";
	$group_album_file[3] = "Untitled";
	$group_album_file[4] = "photos";
	$group_album_file[5] = "download audio";
	$group_album_file[6] = "download video";
	$group_album_file[7] = "download this file";
	$group_album_file[8] = "Return to";
	$group_album_file[9] = "'s Album";
	$group_album_file[10] = "Post Comment";
	$group_album_file[11] = "Report Inappropriate Content";
	$group_album_file[12] = "Comments";
	$group_album_file[13] = "on";
	$group_album_file[14] = "Anonymous";
	$group_album_file[15] = "An Error Has Occurred";
	$group_album_file[16] = "By";
	$group_album_file[17] = "You must be logged in to view this page. <a href='login.php'>Click here</a> to login.";
	$group_album_file[18] = "Write Something...";
	$group_album_file[19] = "Posting...";
	$group_album_file[20] = "Please enter a message.";
	$group_album_file[21] = "You have entered the wrong security code.";
	$group_album_file[22] = "\o\\n";  //THESE CHARACTERS ARE BEING ESCAPED BECAUSE THEY ARE BEING USED IN A DATE FUNCTION
	$group_album_file[23] = "message";
	$group_album_file[24] = "Enter the numbers you see in this image into the field to its right. This helps keep our site free of spam.";
	$group_album_file[25] = "Return";
	break;

  case "group_comments":
	$group_comments[1] = "message";
	$group_comments[2] = "\o\\n";	  //THESE CHARACTERS ARE BEING ESCAPED BECAUSE THEY ARE BEING USED IN A DATE FUNCTION
	$group_comments[3] = "Comments About";

	$group_comments[5] = "Back to";

	$group_comments[7] = "Last Page";
	$group_comments[8] = "showing comment";
	$group_comments[9] = "of";
	$group_comments[10] = "showing comments";
	$group_comments[11] = "Next Page";
	$group_comments[12] = "Anonymous";

	$group_comments[14] = "Write Something...";
	$group_comments[15] = "Posting...";
	$group_comments[16] = "Please enter a message.";
	$group_comments[17] = "You have entered the wrong security code.";
	$group_comments[18] = "Post Comment";
	$group_comments[19] = "Enter the numbers you see in this image into the field to its right. This helps keep our site free of spam.";
	$group_comments[20] = "An Error Has Occurred";

	$group_comments[22] = "You must be logged in to view this page. <a href='login.php'>Click here</a> to login.";
	$group_comments[23] = "Return";
	break;

  case "group_discussion":
	$group_discussion[1] = "An Error Has Occurred";
	$group_discussion[2] = "You must be logged in to view this page. <a href='login.php'>Click here</a> to login.";
	$group_discussion[3] = "Return";
	$group_discussion[4] = "Discussion Board";
	$group_discussion[5] = "Start Topic";
	$group_discussion[6] = "Back to";
	$group_discussion[7] = "Last Page";
	$group_discussion[8] = "showing topic";
	$group_discussion[9] = "of";
	$group_discussion[10] = "showing topics";
	$group_discussion[11] = "Next Page";
	$group_discussion[12] = "post(s), updated";
	$group_discussion[13] = "delete";
	$group_discussion[14] = "Topic";
	$group_discussion[15] = "Last Updated";
	$group_discussion[16] = "Replies";
	$group_discussion[17] = "Views";
	$group_discussion[18] = "replies";
	$group_discussion[19] = "views";
	break;

  case "group_discussion_delete":
	$group_discussion_delete[1] = "An Error Has Occurred";
	$group_discussion_delete[2] = "You must be logged in to view this page. <a href='login.php'>Click here</a> to login.";
	$group_discussion_delete[3] = "Return";
	$group_discussion_delete[4] = "Delete Topic";
	$group_discussion_delete[5] = "Delete Post";
	$group_discussion_delete[6] = "Are you sure you want to delete this topic?";
	$group_discussion_delete[7] = "Are you sure you want to delete this post?";
	$group_discussion_delete[8] = "Delete Topic";
	$group_discussion_delete[9] = "Delete Post";
	$group_discussion_delete[10] = "Cancel";
	$group_discussion_delete[11] = "Discussion Board";
	break;

  case "group_discussion_post":
	$group_discussion_post[1] = "An Error Has Occurred";
	$group_discussion_post[2] = "You must be logged in to view this page. <a href='login.php'>Click here</a> to login.";
	$group_discussion_post[3] = "Return";
	$group_discussion_post[4] = "Discussion Board";
	$group_discussion_post[5] = "Start Topic";
	$group_discussion_post[6] = "Post Topic";
	$group_discussion_post[7] = "Topic Subject";
	$group_discussion_post[8] = "Your Message";
	$group_discussion_post[9] = "Please enter a subject.";
	$group_discussion_post[10] = "Please enter a message to post.";
	$group_discussion_post[11] = "Cancel";
	$group_discussion_post[12] = "Post Reply";
	$group_discussion_post[13] = "Enter the numbers you see in this image into the field to its right. This helps keep our site free of spam.";
	$group_discussion_post[14] = "You have entered the wrong security code.";
	break;

  case "group_discussion_view":
	$group_discussion_view[1] = "An Error Has Occurred";
	$group_discussion_view[2] = "You must be logged in to view this page. <a href='login.php'>Click here</a> to login.";
	$group_discussion_view[3] = "Return";
	$group_discussion_view[4] = "Discussion Board";
	$group_discussion_view[5] = "Reply to Topic";
	$group_discussion_view[6] = "Back to Discussion Board";
	$group_discussion_view[7] = "Last Page";
	$group_discussion_view[8] = "showing post";
	$group_discussion_view[9] = "of";
	$group_discussion_view[10] = "showing posts";
	$group_discussion_view[11] = "Next Page";
	$group_discussion_view[12] = "Anonymous";
	$group_discussion_view[13] = "\o\\n";	  //THESE CHARACTERS ARE BEING ESCAPED BECAUSE THEY ARE BEING USED IN A DATE FUNCTION
	$group_discussion_view[14] = "message";
	$group_discussion_view[15] = "delete";
	break;

  case "group_members":
	$group_members[1] = "Members of";
	$group_members[2] = "The following people are members of";
	$group_members[3] = "Last Page";
	$group_members[4] = "viewing members";
	$group_members[5] = "of";
	$group_members[6] = "viewing members";
	$group_members[7] = "Next Page";
	$group_members[8] = "Username:";
	$group_members[9] = "Last Update:";
	$group_members[10] = "Last Login:";
	$group_members[11] = "View Profile";
	$group_members[12] = "Add to Friends";
	$group_members[13] = "Send Message";
	$group_members[14] = "An Error Has Occurred";
	$group_members[15] = "You must be logged in to view this page. <a href='login.php'>Click here</a> to login.";
	$group_members[16] = "Return";
	break;

  case "user_group":
	$user_group[1] = "My Groups";
	$user_group[2] = "Group Invitations";
	$user_group[3] = "Browse Groups";
	$user_group[4] = "My Groups";
	$user_group[5] = "Below are all of the groups that you belong to.<br>To search for new groups to join, visit the ";
	$user_group[6] = "Browse Groups page";
	$user_group[7] = "Create New Group";
	$user_group[8] = "You are not a member of any groups.";
	$user_group[9] = "Size:";
	$user_group[10] = "members";
	$user_group[11] = "Leader:";
	$user_group[12] = "View Group";
	$user_group[13] = "Edit Group";
	$user_group[14] = "Leave Group";
	$user_group[15] = "Group Settings";
	break;

  case "user_group_add":
	$user_group_add[1] = "Please enter a name for your group.";
	$user_group_add[2] = "You have already created the maximum number of groups allowed. To create this new group, you must leave one of the groups you currently own.";
	$user_group_add[3] = "Please complete all required fields.";
	$user_group_add[4] = "Please ensure you have filled out the fields in the proper formats.";
	$user_group_add[5] = "My Groups";
	$user_group_add[6] = "Group Invitations";
	$user_group_add[7] = "Browse Groups";
	$user_group_add[8] = "Create New Group";
	$user_group_add[9] = "Please give us some information about your new group. After you have created your group, you can begin inviting other users to become members.";
	$user_group_add[10] = "Group Name*";
	$user_group_add[11] = "Group Description";
	$user_group_add[12] = "Group Category";
	$user_group_add[13] = "Group Settings";
	$user_group_add[14] = "Member Approval";
	$user_group_add[15] = "New members can join without approval.";
	$user_group_add[16] = "New members must be approved before joining.";
	$user_group_add[17] = "When people try to join this group, should they be allowed to join immediately, or should they be forced to wait for approval?";
	$user_group_add[18] = "Include this group in search/browse results?";
	$user_group_add[19] = "Yes, include this group in search/browse results.";
	$user_group_add[20] = "No, exclude this group from search/browse results.";
	$user_group_add[21] = "Who can see this group?";
	$user_group_add[22] = "You can decide who gets to see this group.";
	$user_group_add[23] = "Allow Comments?";
	$user_group_add[24] = "You can decide who can post comments in this group.";
	$user_group_add[25] = "Add Group";
	$user_group_add[26] = "Cancel";
	$user_group_add[27] = "Group Settings";
	$user_group_add[28] = "Group Details";
	$user_group_add[29] = "Allow Discussion Board?";
	$user_group_add[30] = "You can decide who can create and post in discussion topics in this group.";
	break;

  case "user_group_browse":
	$user_group_browse[1] = "My Groups";
	$user_group_browse[2] = "Group Invitations";
	$user_group_browse[3] = "Browse Groups";
	$user_group_browse[4] = "Browse Groups";
	$user_group_browse[5] = "Finding a group that interests you is easy! Just select a category below, or search for a group with your own keywords on the <a href='search.php'>search page</a>.";
	$user_group_browse[6] = "Group Categories";
	$user_group_browse[7] = "groups";
	$user_group_browse[8] = "group";
	$user_group_browse[9] = "Other";
	$user_group_browse[10] = "group(s) found in";
	$user_group_browse[11] = "Size:";
	$user_group_browse[12] = "member(s)";
	$user_group_browse[13] = "Leader:";
	$user_group_browse[14] = "View Group";
	$user_group_browse[15] = "Join Group";
	$user_group_browse[16] = "Last Page";
	$user_group_browse[17] = "viewing group";
	$user_group_browse[18] = "of";
	$user_group_browse[19] = "viewing groups";
	$user_group_browse[20] = "Next Page";
	$user_group_browse[21] = "Group Settings";
	break;

  case "user_group_edit":
	$user_group_edit[1] = "Photos must be less than 4MB in size";
	$user_group_edit[2] = "Photos must have one of the following extensions:";
	$user_group_edit[3] = "Photos must be less than or equal to the following dimensions:";
	$user_group_edit[4] = "pixels";
	$user_group_edit[5] = "Your photo failed to upload. Please try again. If this error persists, please contact support.";
	$user_group_edit[6] = "Please complete all required fields.";
	$user_group_edit[7] = "Please ensure you have filled out the fields in the proper formats.";
	$user_group_edit[8] = "Please enter a name for your group.";
	$user_group_edit[9] = "Your changes have been saved.";
	$user_group_edit[10] = "Group Details";
	$user_group_edit[11] = "Members";
	$user_group_edit[12] = "Invitations";
	$user_group_edit[13] = "Photos";
	$user_group_edit[14] = "Comments";
	$user_group_edit[15] = "Group Style";
	$user_group_edit[16] = "Delete Group";
	$user_group_edit[17] = "Edit Group:";
	$user_group_edit[18] = "All of this group's details are displayed and can be changed below.";
	$user_group_edit[19] = "Your group was successfully created! You can add a photo and edit the group details below.";
	$user_group_edit[20] = "Group Photo";
	$user_group_edit[21] = "Current Photo";
	$user_group_edit[22] = "remove photo";
	$user_group_edit[23] = "Upload Photo";
	$user_group_edit[24] = "Upload";
	$user_group_edit[25] = "Images must be less than 4 MB in size with one of the following extensions:";
	$user_group_edit[26] = "Group Details";
	$user_group_edit[27] = "Group Name*";
	$user_group_edit[28] = "Group Description";
	$user_group_edit[29] = "Group Category";
	$user_group_edit[30] = "Group Settings";
	$user_group_edit[31] = "Member Approval";
	$user_group_edit[32] = "New members can join without approval.";
	$user_group_edit[33] = "New members must be approved before joining.";
	$user_group_edit[34] = "When people try to join this group, should they be allowed to join immediately, or should they be forced to wait for approval? Approving/denying members can be managed from the";
	$user_group_edit[35] = "Note: If you turn member approval off, any new members awaiting approval will be automatically approved.";
	$user_group_edit[36] = "Include this group in search/browse results?";
	$user_group_edit[37] = "Yes, include this group in search/browse results.";
	$user_group_edit[38] = "No, exclude this group from search/browse results.";
	$user_group_edit[39] = "Who can see this group?";
	$user_group_edit[40] = "You can decide who gets to see this group.";
	$user_group_edit[41] = "Allow Comments?";
	$user_group_edit[42] = "You can decide who can post comments in this group.";
	$user_group_edit[43] = "Save Changes";
	$user_group_edit[44] = "invitations page";
	$user_group_edit[45] = "Cancel";
	$user_group_edit[46] = "&#171; Back to My Groups";
	$user_group_edit[47] = "Allow Discussion Board?";
	$user_group_edit[48] = "You can decide who can create and post in discussion topics in this group.";
	break;

  case "user_group_edit_comments":
	$user_group_edit_comments[1] = "Group Details";
	$user_group_edit_comments[2] = "Members";
	$user_group_edit_comments[3] = "Invitations";
	$user_group_edit_comments[4] = "Photos";
	$user_group_edit_comments[5] = "Comments";
	$user_group_edit_comments[6] = "Group Style";
	$user_group_edit_comments[7] = "Delete Group";
	$user_group_edit_comments[8] = "Back to My Groups";
	$user_group_edit_comments[9] = "Group Comments:";
	$user_group_edit_comments[10] = "The comments below have been written about this group by other people. To delete comments, click their checkboxes and then click the \"Delete Selected\" button below the comment list.";
	$user_group_edit_comments[11] = "Last Page";
	$user_group_edit_comments[12] = "comment";
	$user_group_edit_comments[13] = "of";
	$user_group_edit_comments[14] = "comments";
	$user_group_edit_comments[15] = "Next Page";
	$user_group_edit_comments[16] = "No comments have been posted about this group.";
	$user_group_edit_comments[17] = "Anonymous";
	$user_group_edit_comments[18] = "Delete Selected";
	$user_group_edit_comments[19] = "\o\\n";  //THESE CHARACTERS ARE BEING ESCAPED BECAUSE THEY ARE BEING USED IN A DATE FUNCTION
	$user_group_edit_comments[20] = "select all comments";
	break;

  case "user_group_edit_delete":
	$user_group_edit_delete[1] = "Group Details";
	$user_group_edit_delete[2] = "Members";
	$user_group_edit_delete[3] = "Invitations";
	$user_group_edit_delete[4] = "Photos";
	$user_group_edit_delete[5] = "Comments";
	$user_group_edit_delete[6] = "Group Style";
	$user_group_edit_delete[7] = "Delete Group";
	$user_group_edit_delete[8] = "Back to My Groups";
	$user_group_edit_delete[9] = "Delete Group:";
	$user_group_edit_delete[10] = "Are you sure you want to delete this group? All of its content will be permanently deleted, and all members will be removed.";
	$user_group_edit_delete[11] = "Delete Group";
	$user_group_edit_delete[12] = "Cancel";
	break;

  case "user_group_edit_files":
	$user_group_edit_files[1] = "Your changes have been saved.";
	$user_group_edit_files[2] = "Group Details";
	$user_group_edit_files[3] = "Members";
	$user_group_edit_files[4] = "Invitations";
	$user_group_edit_files[5] = "Photos";
	$user_group_edit_files[6] = "Comments";
	$user_group_edit_files[7] = "Group Style";
	$user_group_edit_files[8] = "Delete Group";
	$user_group_edit_files[9] = "Back to My Groups";
	$user_group_edit_files[10] = "Group Photos:";
	$user_group_edit_files[11] = "Manage this group's photos and files from this page.<br>Total files in this album: ";
	$user_group_edit_files[12] = "Add New Photos";
	$user_group_edit_files[13] = "Title";
	$user_group_edit_files[14] = "comments";
	$user_group_edit_files[15] = "Caption";
	$user_group_edit_files[16] = "Delete Photo";
	$user_group_edit_files[17] = "Save Changes";
	break;

  case "user_group_edit_files_comments":
	$user_group_edit_files_comments[1] = "Group Details";
	$user_group_edit_files_comments[2] = "Members";
	$user_group_edit_files_comments[3] = "Invitations";
	$user_group_edit_files_comments[4] = "Photos";
	$user_group_edit_files_comments[5] = "Comments";
	$user_group_edit_files_comments[6] = "Group Style";
	$user_group_edit_files_comments[7] = "Delete Group";
	$user_group_edit_files_comments[8] = "Back to My Groups";
	$user_group_edit_files_comments[9] = "Photo Comments";
	$user_group_edit_files_comments[10] = "To delete comments, click their checkboxes and then click the \"Delete Selected\" button below the comment list.";
	$user_group_edit_files_comments[11] = "Last Page";
	$user_group_edit_files_comments[12] = "comment";
	$user_group_edit_files_comments[13] = "of";
	$user_group_edit_files_comments[14] = "comments";
	$user_group_edit_files_comments[15] = "Next Page";
	$user_group_edit_files_comments[16] = "No comments have been posted about this photo.";
	$user_group_edit_files_comments[17] = "Anonymous";
	$user_group_edit_files_comments[18] = "Delete Selected";
	$user_group_edit_files_comments[19] = "\o\\n";  //THESE CHARACTERS ARE BEING ESCAPED BECAUSE THEY ARE BEING USED IN A DATE FUNCTION
	$user_group_edit_files_comments[20] = "select all comments";
	$user_group_edit_files_comments[21] = "Back to Photos";
	break;

  case "user_group_edit_files_upload":
	$user_group_edit_files_upload[1] = "Group Details";
	$user_group_edit_files_upload[2] = "Members";
	$user_group_edit_files_upload[3] = "Invitations";
	$user_group_edit_files_upload[4] = "Photos";
	$user_group_edit_files_upload[5] = "Comments";
	$user_group_edit_files_upload[6] = "Group Style";
	$user_group_edit_files_upload[7] = "Delete Group";
	$user_group_edit_files_upload[8] = "Back to My Groups";
	$user_group_edit_files_upload[9] = "Upload Photos:";
	$user_group_edit_files_upload[10] = "To upload photos from your computer, click the \"Browse\" button, locate them on your computer, then click the \"Upload Photos\" button.";
	$user_group_edit_files_upload[11] = "Back to Photos";
	$user_group_edit_files_upload[12] = "You have";
	$user_group_edit_files_upload[13] = "of free space remaining.";
	$user_group_edit_files_upload[14] = "You may upload files of the following types:";
	$user_group_edit_files_upload[15] = "You may upload files with sizes up to";
	$user_group_edit_files_upload[16] = "File 1:";
	$user_group_edit_files_upload[17] = "File 2:";
	$user_group_edit_files_upload[18] = "File 3:";
	$user_group_edit_files_upload[19] = "File 4:";
	$user_group_edit_files_upload[20] = "File 5:";
	$user_group_edit_files_upload[21] = "Upload Photos";
	$user_group_edit_files_upload[22] = "UPLOADING"; // USED IN JAVASCRIPT, NO QUOTES OR SPECIAL CHARACTERS ALLOWED
	$user_group_edit_files_upload[23] = "was uploaded successfully.";
	break;

  case "user_group_edit_invite":
	$user_group_edit_invite[1] = "user(s) were successfully invited to join this group.";
	$user_group_edit_invite[2] = "1 person was uninvited from this group.";
	$user_group_edit_invite[3] = "1 person was approved and has joined this group.";
	$user_group_edit_invite[4] = "1 person was rejected from joining this group.";
	$user_group_edit_invite[5] = "Group Details";
	$user_group_edit_invite[6] = "Members";
	$user_group_edit_invite[7] = "Invitations";
	$user_group_edit_invite[8] = "Photos";
	$user_group_edit_invite[9] = "Comments";
	$user_group_edit_invite[10] = "Group Style";
	$user_group_edit_invite[11] = "Delete Group";
	$user_group_edit_invite[12] = "Back to My Groups";
	$user_group_edit_invite[13] = "Group Invitations:";
	$user_group_edit_invite[14] = "Use this page to invite new members and approve or deny membership requests.";
	$user_group_edit_invite[15] = "Send Invitations";
	$user_group_edit_invite[16] = "To invite someone to join this group, enter the person's username in the field below. Remember that even if this group is set to be viewable by \"members only,\" people that you invite will be able to view the group as though they are members.";
	$user_group_edit_invite[17] = "Username:"; // USED IN JAVASCRIPT, NO QUOTES OR SPECIAL CHARACTERS ALLOWED
	$user_group_edit_invite[18] = "Invite";
	$user_group_edit_invite[19] = "Add Another Person";
	$user_group_edit_invite[20] = "Members Awaiting Approval";
	$user_group_edit_invite[21] = "The following people want to join our group and are waiting for approval.";
	$user_group_edit_invite[22] = "There are no new members waiting for approval.";
	$user_group_edit_invite[23] = "approve";
	$user_group_edit_invite[24] = "reject";
	$user_group_edit_invite[25] = "Invited Members";
	$user_group_edit_invite[26] = "The following people have already been invited to join our group.";
	$user_group_edit_invite[27] = "We are not waiting for confirmation from any invited members.";
	$user_group_edit_invite[28] = "uninvite";
	break;

  case "user_group_edit_member":
	$user_group_edit_member[1] = "Group Details";
	$user_group_edit_member[2] = "Members";
	$user_group_edit_member[3] = "Invitations";
	$user_group_edit_member[4] = "Photos";
	$user_group_edit_member[5] = "Comments";
	$user_group_edit_member[6] = "Group Style";
	$user_group_edit_member[7] = "Delete Group";
	$user_group_edit_member[8] = "Back to My Groups";
	$user_group_edit_member[9] = "Edit Group Member";
	$user_group_edit_member[10] = "Use this page to change this group member's details.";
	$user_group_edit_member[11] = "Member Username:";
	$user_group_edit_member[12] = "Member Title:";
	$user_group_edit_member[13] = "Member Rank:";
	$user_group_edit_member[14] = "Owner";
	$user_group_edit_member[15] = "Member";
	$user_group_edit_member[16] = "Officer";
	$user_group_edit_member[17] = "<b>Warning:</b> You are about to transfer your ownership of this group to this person. Are you sure you want to make this person the new group owner? You will be demoted to member and logged out of the edit group area!";
	$user_group_edit_member[18] = "You are currently the group owner. If you want to give your ownership to another member, find them on the";
	$user_group_edit_member[19] = "Save Changes";
	$user_group_edit_member[20] = "Cancel";
	$user_group_edit_member[21] = "View Members";
	$user_group_edit_member[22] = "page and edit their membership. When you make them the group owner, you will be demoted to the rank of group member.";
	break;

  case "user_group_edit_members":
	$user_group_edit_members[1] = "Group Details";
	$user_group_edit_members[2] = "Members";
	$user_group_edit_members[3] = "Invitations";
	$user_group_edit_members[4] = "Photos";
	$user_group_edit_members[5] = "Comments";
	$user_group_edit_members[6] = "Group Style";
	$user_group_edit_members[7] = "Delete Group";
	$user_group_edit_members[8] = "Back to My Groups";
	$user_group_edit_members[9] = "Browse Members:";
	$user_group_edit_members[10] = "Use this page to list or search for group members.";
	$user_group_edit_members[11] = "All Group Members";
	$user_group_edit_members[12] = "Only Officers";
	$user_group_edit_members[13] = "Search";
	$user_group_edit_members[14] = "Sort by:";
	$user_group_edit_members[15] = "Recently Updated";
	$user_group_edit_members[16] = "Recently Logged In";
	$user_group_edit_members[17] = "Member Title";
	$user_group_edit_members[18] = "Member Rank";
	$user_group_edit_members[19] = "Last Page";
	$user_group_edit_members[20] = "viewing entry";
	$user_group_edit_members[21] = "of";
	$user_group_edit_members[22] = "viewing entries";
	$user_group_edit_members[23] = "Next Page";
	$user_group_edit_members[24] = "Last Update:";
	$user_group_edit_members[25] = "Last Login:";
	$user_group_edit_members[26] = "Member Rank:";
	$user_group_edit_members[27] = "Owner";
	$user_group_edit_members[28] = "Officer";
	$user_group_edit_members[29] = "Member";
	$user_group_edit_members[30] = "Member Title:";
	$user_group_edit_members[31] = "Edit Member Details";
	$user_group_edit_members[32] = "Remove Member";
	$user_group_edit_members[33] = "Send Message";
	$user_group_edit_members[34] = "Search:";
	break;

  case "user_group_edit_members_remove":
	$user_group_edit_members_remove[1] = "Group Details";
	$user_group_edit_members_remove[2] = "Members";
	$user_group_edit_members_remove[3] = "Invitations";
	$user_group_edit_members_remove[4] = "Photos";
	$user_group_edit_members_remove[5] = "Comments";
	$user_group_edit_members_remove[6] = "Group Style";
	$user_group_edit_members_remove[7] = "Delete Group";
	$user_group_edit_members_remove[8] = "Back to My Groups";
	$user_group_edit_members_remove[9] = "Remove Member";
	$user_group_edit_members_remove[10] = "Are you sure you want to remove this member from your group?";
	$user_group_edit_members_remove[11] = "Remove Member";
	$user_group_edit_members_remove[12] = "Cancel";
	break;

  case "user_group_edit_style":
	$user_group_edit_style[1] = "Your changes have been saved.";
	$user_group_edit_style[2] = "Group Details";
	$user_group_edit_style[3] = "Members";
	$user_group_edit_style[4] = "Invitations";
	$user_group_edit_style[5] = "Photos";
	$user_group_edit_style[6] = "Comments";
	$user_group_edit_style[7] = "Group Style";
	$user_group_edit_style[8] = "Delete Group";
	$user_group_edit_style[9] = "Back to My Groups";
	$user_group_edit_style[10] = "Customize Group:";
	$user_group_edit_style[11] = "You can change the colors, fonts, and styles of your group page by adding CSS code below. The contents of the text area below will be output between &lt;style&gt; tags on your group page.";
	$user_group_edit_style[12] = "Save Changes";
	break;

  case "user_group_invites":
	$user_group_invites[1] = "You have joined the group";
	$user_group_invites[2] = "You have declined to join the group";
	$user_group_invites[3] = "My Groups";
	$user_group_invites[4] = "Group Invitations";
	$user_group_invites[5] = "Browse Groups";
	$user_group_invites[6] = "Group Invitations";
	$user_group_invites[7] = "When you receive an invitation to join a group, it will appear on this page until you have either accepted or rejected it.";
	$user_group_invites[8] = "Name:";
	$user_group_invites[9] = "Size:";
	$user_group_invites[10] = "members";
	$user_group_invites[11] = "Leader:";
	$user_group_invites[12] = "View Group";
	$user_group_invites[13] = "Accept Invitation";
	$user_group_invites[14] = "Reject Invitation";
	$user_group_invites[15] = "You have no pending group invitations.";
	$user_group_invites[16] = "Group Settings";
	break;

  case "user_group_join":
	$user_group_join[1] = "You have already joined this group.";
	$user_group_join[2] = "You have already requested to join this group.";
	$user_group_join[3] = "You have successfully joined this group!";
	$user_group_join[4] = "My Groups";
	$user_group_join[5] = "Group Invitations";
	$user_group_join[6] = "Browse Groups";
	$user_group_join[7] = "Join";
	$user_group_join[8] = "Are you sure you want to join this group?";
	$user_group_join[9] = "Join Group";
	$user_group_join[10] = "Cancel";
	$user_group_join[11] = "Return";
	$user_group_join[12] = "You have requested to join this group. A group officer will confirm or reject your request soon.";
	$user_group_join[13] = "Group Settings";
	break;

  case "user_group_leave":
	$user_group_leave[1] = "My Groups";
	$user_group_leave[2] = "Group Invitations";
	$user_group_leave[3] = "Browse Groups";
	$user_group_leave[4] = "Leave";
	$user_group_leave[5] = "Are you sure you want to leave this group?";
	$user_group_leave[6] = "<b>You are currently the owner of this group. If you leave this group now, the entire group will be deleted.</b> If you want to leave this group without deleting it, you must first transfer your ownership to another person.";
	$user_group_leave[7] = "Find another group member";
	$user_group_leave[8] = ", upgrade their rank to owner, and then you can leave this group without it being deleted.";
	$user_group_leave[9] = "Leave Group";
	$user_group_leave[10] = "Cancel";
	$user_group_leave[11] = "Group Settings";
	break;

  case "user_group_settings":
	$user_group_settings[1] = "My Groups";
	$user_group_settings[2] = "Group Invitations";
	$user_group_settings[3] = "Browse Groups";
	$user_group_settings[4] = "Group Settings";
	$user_group_settings[5] = "Group Settings";
	$user_group_settings[6] = "Edit your group settings such as email notifications on this page.";
	$user_group_settings[7] = "Your changes have been saved.";
	$user_group_settings[8] = "Save Changes";
	$user_group_settings[9] = "Group Notifications";
	$user_group_settings[10] = "Check the boxes next to the email notifications you would like to receive.";
	$user_group_settings[11] = "Notify me when someone invites me to join a group.";
	$user_group_settings[12] = "Notify me when someone writes a comment on a group I lead.";
	$user_group_settings[13] = "Notify me when someone writes a comment on one of the photos in a group I lead.";
	$user_group_settings[14] = "Notify me when someone requests membership in a group I lead.";
	break;

}

// ASSIGN ALL SMARTY VARIABLES
if(is_array(${"$page"})) {
  reset(${"$page"});
  while(list($key, $val) = each(${"$page"})) {
    $smarty->assign($page.$key, $val);
  }
}
?>