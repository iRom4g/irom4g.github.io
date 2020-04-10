<?



//########## ADMIN SECTION LANGUAGE FILE ###############
//
// This file contains all the language variables for
// the admin directory.
//
//########## MULTILANGUAGE DATE/TIME ###################
//
// Set the current locale so that date
// and time functions will display in
// the correct language. More information
// about this setting can be found on the
// official PHP website:
// http://www.php.net/manual/en/function.setlocale.php
// Also set the variable $multi_language
// to "yes" if you want dates and times
// to be translated.
//
   setlocale(LC_ALL, 'C');
   $multi_language = "no";
//
//
// Please note that this is function is
// system dependent. To find out what codes
// are supported by your system, uncomment
// the following function and load any page
// that uses this file. At the top of the 
// page you should see a large paragraph
// containing all the possible language
// codes.
//
// system('locale -a');
//
//######################################################







// HEADER VARIABLES (INCLUDED ON ALL ADMIN PAGES)
$admin_header[1] = "Admin Panel";
$admin_header[2] = "Hello,";
$admin_header[3] = "user(s) are currently logged in.";
$admin_header[4] = "user(s) have signed up today.";
$admin_header[5] = "Network Management";
$admin_header[6] = "Summary";
$admin_header[7] = "View Users";
$admin_header[8] = "View Admins";
$admin_header[9] = "Global Settings";
$admin_header[10] = "Signup Settings";
$admin_header[11] = "HTML Templates";
$admin_header[12] = "Profile Fields";
$admin_header[13] = "Subnetworks";
$admin_header[14] = "Banning/Spam";
$admin_header[15] = "User Connections";
$admin_header[16] = "URL Settings";
$admin_header[17] = "View Plugins";
$admin_header[18] = "General Settings";
$admin_header[19] = "Statistics";
$admin_header[20] = "User Levels";
$admin_header[21] = "Other Tools";
$admin_header[22] = "Access Log";
$admin_header[23] = "Logout";
$admin_header[24] = "!";
$admin_header[25] = "Announcements";
$admin_header[26] = "System Emails";
$admin_header[27] = "View Reports";
$admin_header[28] = "Invite Users";
$admin_header[29] = "Level Settings";
$admin_header[30] = "User Settings";
$admin_header[31] = "Message Settings";
$admin_header[32] = "Ad Campaigns";
$admin_header[33] = "Recent Activity Feed";



// ASSIGN ALL SMARTY ADMIN HEADER VARIABLES
reset($admin_header);
while(list($key, $val) = each($admin_header)) {
  $smarty->assign("admin_header".$key, $val);
}


// ASSIGN ALL ADMIN-SPECIFIC CLASS/FUNCTION FILE VARIABLES
$class_admin[1] = "Your browser does not have Javascript enabled. Please enable Javascript and try again.";
$class_admin[2] = "The login details you provided were invalid. Did you <a href='admin_lostpass.php'>forget your password</a>?";
$class_admin[3] = "You must complete all the fields.";
$class_admin[4] = "The Old Password field must match this admin's old password.";
$class_admin[5] = "Username and Password fields must be alpha-numeric.";
$class_admin[6] = "The username you have entered is already in use by another admin.";
$class_admin[7] = "Passwords must be at least 6 characters in length.";
$class_admin[8] = "Password and Password Confirmation fields must match.";



// PAGE SPECIFIC VARIABLES
switch ($page) {

case "admin_activity":
	$admin_activity[1] = "Recent Activity Feed Settings";
	$admin_activity[2] = "The recent activity feed is an auto-updating list of actions that have recently occurred on your social network. This information is displayed (by default) on users' \"My Home\" page. Also, each user's own personal activity list will be displayed on their profile page if enabled below. Please note that some of the settings here are not retroactive, meaning that changes you make here may not affect old feed items.";
	$admin_activity[3] = "Your changes have been saved.";
	$admin_activity[4] = "Which actions do you want to include in the activity list?";
	$admin_activity[5] = "All of the possible actions that can appear in your recent activity feed are shown below. You can choose not to include them in the recent activity feed by unchecking them, or you can alter their text. Note that some of the actions have variables that are replaced by the system (e.g. [username]). Also, note that installing new plugins may add new actions. Unchecking the checkbox next to an action will disable that action type, however any previously recorded actions of that type will not be deleted from the feed.<br><br>Remember to include a brief description of each action type (in the description fields below) - these are displayed on the users' account settings page (if action type privacy is enabled below). If you want to exclude any of these action types from your users' settings page, simply leave the description blank.";
	$admin_activity[6] = "Action Text";
	$admin_activity[7] = "Keyword";
	$admin_activity[8] = "How many actions should be stored about each user?";
	$admin_activity[9] = "How many recent actions do you want to store in the database for each user? A higher value will show more information about each user's activity, while a lower value will increase database performance. Note: If the number of actions you want to display on each user's profile is less than the number of actions you want to store in the database, you can edit the \"profile.tpl\" template file to limit the number of actions dispalyed.";
	$admin_activity[10] = "action(s) stored in the database and published on each user's profile page";
	$admin_activity[11] = "Feed Limits";
	$admin_activity[12] = "How many total actions do you want to display in the recent activity feed?";
	$admin_activity[13] = "action(s) published in the recent activity feed";
	$admin_activity[14] = "How long do want items to be visible in the recent activity feed? A shorter amount of time will generally result in a shorter list of actions. For small social networks, a longer time period may be more appropriate.";
	$admin_activity[15] = "minute";
	$admin_activity[16] = "minutes";
	$admin_activity[17] = "hour";
	$admin_activity[18] = "hours";
	$admin_activity[19] = "day";
	$admin_activity[20] = "days";
	$admin_activity[21] = "week";
	$admin_activity[22] = "weeks";
	$admin_activity[23] = "month";
	$admin_activity[24] = "How many actions per user can be shown on the recent activity feed? It's important to have a nice mix of actions from various users on your social network, so here you can set a limit on the number of actions published about each user at any given time. For smaller social networks, a higher number of published actions per user might be more appropriate.";
	$admin_activity[25] = "action(s) published per user in the recent activity feed";
	$admin_activity[26] = "Should users be allowed to delete actions published about themselves?";
	$admin_activity[27] = "Do you want to give users the option of deleting actions published about themselves? This is generally an important freedom to give users because it helps to maintain their privacy.";
	$admin_activity[28] = "Yes, allow users to delete actions about themselves.";
	$admin_activity[29] = "No, users may not delete actions about themselves.";
	$admin_activity[30] = "Whose actions should users see in the recent activity list?";
	$admin_activity[31] = "When a user is looking at the recent activity feed, whose actions should they see? For smaller networks, it may make more sense to show recent actions from \"All Registered Users\" so the feed is quickly populated.";
	$admin_activity[32] = "Should users be able to prevent certain action types from being published?";
	$admin_activity[33] = "Do you want to allow users to prevent specific action types from being published about them? If yes, a setting will appear on your users' account settings page allowing them to choose which action types to NOT publish in the recent activity feed.";
	$admin_activity[34] = "Save Changes";
	$admin_activity[35] = "Yes, users can specify which action types will not be published about them.";
	$admin_activity[36] = "No, users cannot specify what actions will be published or not published about them.";
	$admin_activity[37] = "Description";
	break;

case "admin_ads":
	$admin_ads[1] = "Advertising Campaigns";
	$admin_ads[2] = "Displaying advertisements is an excellent way to monetize your social network. By creating ad campaigns, you can determine exactly where your ads will appear, how long they will be displayed, and who they will be shown to. The key to generating substantial revenue from your social network is to create targeted ad campaigns. This means that you should make an effort to show specific ads to users based on their interests or personal characteristics (e.g. their profile information). To accomplish this, ad campaigns can be created for specific <a href='admin_levels.php'>user levels</a> and/or <a href='admin_subnetworks.php'>subnetworks</a>.";
	$admin_ads[3] = "Create New Campaign";
	$admin_ads[4] = "Refresh Stats";
	$admin_ads[5] = "ID";
	$admin_ads[6] = "Name";
	$admin_ads[7] = "Status";
	$admin_ads[8] = "Views";
	$admin_ads[9] = "Clicks";
	$admin_ads[10] = "CTR";
	$admin_ads[11] = "Options";
	$admin_ads[12] = "Untitled Campaign";
	$admin_ads[13] = "edit";
	$admin_ads[14] = "pause";
	$admin_ads[15] = "unpause";
	$admin_ads[16] = "delete";
	$admin_ads[17] = "There are currently no advertising campaigns on your social network.";
	$admin_ads[18] = "Delete Ad Campaign?";
	$admin_ads[19] = "Are you sure you want to delete this ad campaign?";
	$admin_ads[20] = "Delete Campaign";
	$admin_ads[21] = "Cancel";
	$admin_ads[22] = "Active";
	$admin_ads[23] = "Waiting For Start Date";
	$admin_ads[24] = "Completed";
	$admin_ads[25] = "Paused";
	break;

case "admin_ads_add":
	$admin_ads_add[1] = "Please upload a banner or specify your advertisement HTML for this campaign.";
	$admin_ads_add[2] = "Please provide a name for this advertising campaign.";
	$admin_ads_add[3] = "Please provide a complete start date for this campaign.";
	$admin_ads_add[4] = "Please provide a complete end date for this campaign.";
	$admin_ads_add[5] = "Please select an end date that is later than your start date.";
	$admin_ads_add[6] = "Please provide a maximum number of views for this campaign. This must be an integer (e.g. 250000).";
	$admin_ads_add[7] = "Please provide a maximum number of clicks for this campaign. This must be an integer (e.g. 250).";
	$admin_ads_add[8] = "Please provide a minimum CTR limit in the form of a percentage of clicks to views (e.g. 1.50%). This value may not exceed 100%.";
	$admin_ads_add[9] = "Create Advertising Campaign";
	$admin_ads_add[10] = "Follow this guide to design and launch a new advertising campaign.";
	$admin_ads_add[11] = "Advertisement Media";
	$admin_ads_add[12] = "Upload a banner image from your computer or specify your advertisement HTML code (e.g. Google Adsense). If you choose to upload an image, it must be a valid GIF, JPG, JPEG, or PNG file under 200kb.";
	$admin_ads_add[13] = "Upload Banner Image";
	$admin_ads_add[14] = "OR";
	$admin_ads_add[15] = "Insert Banner HTML";
	$admin_ads_add[16] = "Upload Banner Image";
	$admin_ads_add[17] = "File:";
	$admin_ads_add[18] = "Link URL:";
	$admin_ads_add[19] = "Upload Banner & Preview";
	$admin_ads_add[20] = "Cancel";
	$admin_ads_add[21] = "Insert Banner HTML Code";
	$admin_ads_add[22] = "Save HTML Code & Preview";
	$admin_ads_add[23] = "Save Banner";
	$admin_ads_add[24] = "Banner Preview";
	$admin_ads_add[25] = "Remove Banner";
	$admin_ads_add[26] = "Please choose a file from your hard drive to upload."; // USED IN JAVASCRIPT, DONT USE APOSTROPHES (')
	$admin_ads_add[27] = "The file you specified failed to upload. Please make sure this is a valid image file and the /uploads_admin/ads directory is writeable on the server."; // USED IN JAVASCRIPT, DONT USE APOSTROPHES (')
	$admin_ads_add[28] = "Please insert your banner HTML before continuing."; // USED IN JAVASCRIPT, DONT USE APOSTROPHES (')
	$admin_ads_add[29] = "Campaign Information";
	$admin_ads_add[30] = "Begin by naming this campaign and determining its start date and ending terms. If you select an ending date, the campaign will end immediately when that date is reached. If you specify a certain number of total views allowed or total clicks allowed, the campaign will end when that number of views or clicks is reached. If you specify a minimum CTR (click-through ratio, which is the ratio of clicks to views) and the campaign's CTR goes below your limit, the campaign will end. If you decide to specify a minimum CTR limit, you should enter it as a percentage of clicks to views (e.g. 0.05%). To create a campaign with no definite end, don't specify an end date or any other limits and your campaign will continue until you choose to end it.";
	$admin_ads_add[31] = "Note: Current date is";
	$admin_ads_add[32] = "Campaign Name:";
	$admin_ads_add[33] = "Start Date:";
	$admin_ads_add[34] = "Jan";
	$admin_ads_add[35] = "Feb";
	$admin_ads_add[36] = "Mar";
	$admin_ads_add[37] = "Apr";
	$admin_ads_add[38] = "May";
	$admin_ads_add[39] = "Jun";
	$admin_ads_add[40] = "Jul";
	$admin_ads_add[41] = "Aug";
	$admin_ads_add[42] = "Sep";
	$admin_ads_add[43] = "Oct";
	$admin_ads_add[44] = "Nov";
	$admin_ads_add[45] = "Dec";
	$admin_ads_add[46] = "AM";
	$admin_ads_add[47] = "PM";
	$admin_ads_add[48] = "End Date:";
	$admin_ads_add[49] = "Don't end this campaign on a specific date.";
	$admin_ads_add[50] = "End this campaign on a specific date.";
	$admin_ads_add[51] = "Total Views Allowed:";
	$admin_ads_add[52] = "Unlimited";
	$admin_ads_add[53] = "Total Clicks Allowed:";
	$admin_ads_add[54] = "Minimum CTR:";
	$admin_ads_add[55] = "Select Placement Position";
	$admin_ads_add[56] = "Where on the page do you want your banners to display? You can place your banners at the very top of the page, just above the main content area, to the left of the content area, to the right of the content area, or at the very bottom of the page. Please note that this automatic placement will NOT work if you have removed the advertisement code Smarty variables from your header.tpl and footer.tpl files. Also note that if you select a position below, the banner will show up in that position on every page of the social network. You can insert banners on a single page (or a few pages) by following the manual insertion instructions below.";
	$admin_ads_add[57] = "If you want to have this advertisement display somewhere other than the site-wide positions shown above (e.g. within the content on a single page), you can insert the following code into any of your <a href='admin_templates.php' target='_blank'>templates</a> and it will display your advertisement once you've created the campaign.";
	$admin_ads_add[58] = "Select Audience";
	$admin_ads_add[59] = "Specify which users will be shown advertisements from this campaign. To include the entire user population in this campaign, leave all of the <a href='admin_levels.php' target='_blank'>user levels</a> and <a href='admin_subnetworks.php' target='_blank'>subnetworks</a> selected. To select multiple user levels or subnetworks, use CTRL-click. Note that this advertising campaign will only be displayed to logged-in users that match both a user level <b>AND</b> a subnetwork you've selected.";
	$admin_ads_add[60] = "Subnetworks";
	$admin_ads_add[61] = "(signup default)";
	$admin_ads_add[62] = "Also show this advertisement to visitors that are not logged in.";
	$admin_ads_add[63] = "Create New Campaign";
	$admin_ads_add[64] = "Cancel";
	$admin_ads_add[65] = "Edit HTML";
	$admin_ads_add[66] = "Default Subnetwork";
	break;

case "admin_ads_edit":
	$admin_ads_edit[1] = "Please upload a banner or specify your advertisement HTML for this campaign.";
	$admin_ads_edit[2] = "Please provide a name for this advertising campaign.";
	$admin_ads_edit[3] = "Please provide a complete start date for this campaign.";
	$admin_ads_edit[4] = "Please provide a complete end date for this campaign.";
	$admin_ads_edit[5] = "Please select an end date that is later than your start date.";
	$admin_ads_edit[6] = "Please provide a maximum number of views for this campaign. This must be an integer (e.g. 250000).";
	$admin_ads_edit[7] = "Please provide a maximum number of clicks for this campaign. This must be an integer (e.g. 250).";
	$admin_ads_edit[8] = "Please provide a minimum CTR limit in the form of a percentage of clicks to views (e.g. 1.50%). This value may not exceed 100%.";
	$admin_ads_edit[9] = "Edit Advertising Campaign";
	$admin_ads_edit[10] = "Edit this advertising campaign's details below.";
	$admin_ads_edit[11] = "Advertisement Media";
	$admin_ads_edit[12] = "Upload a banner image from your computer or specify your advertisement HTML code (e.g. Google Adsense). If you choose to upload an image, it must be a valid GIF, JPG, JPEG, or PNG file under 200kb.";
	$admin_ads_edit[13] = "Upload Banner Image";
	$admin_ads_edit[14] = "OR";
	$admin_ads_edit[15] = "Insert Banner HTML";
	$admin_ads_edit[16] = "Upload Banner Image";
	$admin_ads_edit[17] = "File:";
	$admin_ads_edit[18] = "Link URL:";
	$admin_ads_edit[19] = "Upload Banner & Preview";
	$admin_ads_edit[20] = "Cancel";
	$admin_ads_edit[21] = "Insert Banner HTML Code";
	$admin_ads_edit[22] = "Save HTML Code & Preview";
	$admin_ads_edit[23] = "Banner Preview";
	$admin_ads_edit[24] = "Save Banner";
	$admin_ads_edit[25] = "Remove Banner";
	$admin_ads_edit[26] = "Please choose a file from your hard drive to upload."; // USED IN JAVASCRIPT, DONT USE APOSTROPHES (')
	$admin_ads_edit[27] = "The file you specified failed to upload. Please make sure this is a valid image file and the /uploads_admin/ads directory is writeable on the server."; // USED IN JAVASCRIPT, DONT USE APOSTROPHES (')
	$admin_ads_edit[28] = "Please insert your banner HTML before continuing."; // USED IN JAVASCRIPT, DONT USE APOSTROPHES (')
	$admin_ads_edit[29] = "Campaign Information";
	$admin_ads_edit[30] = "Begin by naming this campaign and determining its start date and ending terms. If you select an ending date, the campaign will end immediately when that date is reached. If you specify a certain number of total views allowed or total clicks allowed, the campaign will end when that number of views or clicks is reached. If you specify a minimum CTR (click-through ratio, which is the ratio of clicks to views) and the campaign's CTR goes below your limit, the campaign will end. If you decide to specify a minimum CTR limit, you should enter it as a percentage of clicks to views (e.g. 0.05%). To create a campaign with no definite end, don't specify an end date or any other limits and your campaign will continue until you choose to end it.";
	$admin_ads_edit[31] = "Note: Current date is";
	$admin_ads_edit[32] = "Campaign Name:";
	$admin_ads_edit[33] = "Start Date:";
	$admin_ads_edit[34] = "Jan";
	$admin_ads_edit[35] = "Feb";
	$admin_ads_edit[36] = "Mar";
	$admin_ads_edit[37] = "Apr";
	$admin_ads_edit[38] = "May";
	$admin_ads_edit[39] = "Jun";
	$admin_ads_edit[40] = "Jul";
	$admin_ads_edit[41] = "Aug";
	$admin_ads_edit[42] = "Sep";
	$admin_ads_edit[43] = "Oct";
	$admin_ads_edit[44] = "Nov";
	$admin_ads_edit[45] = "Dec";
	$admin_ads_edit[46] = "AM";
	$admin_ads_edit[47] = "PM";
	$admin_ads_edit[48] = "End Date:";
	$admin_ads_edit[49] = "Don't end this campaign on a specific date.";
	$admin_ads_edit[50] = "End this campaign on a specific date.";
	$admin_ads_edit[51] = "Total Views Allowed:";
	$admin_ads_edit[52] = "Unlimited";
	$admin_ads_edit[53] = "Total Clicks Allowed:";
	$admin_ads_edit[54] = "Minimum CTR:";
	$admin_ads_edit[55] = "Select Placement Position";
	$admin_ads_edit[56] = "Where on the page do you want your banners to display? You can place your banners at the very top of the page, just above the main content area, to the left of the content area, to the right of the content area, or at the very bottom of the page. Please note that this automatic placement will NOT work if you have removed the advertisement code Smarty variables from your header.tpl and footer.tpl files. Also note that if you select a position below, the banner will show up in that position on every page of the social network. You can insert banners on a single page (or a few pages) by following the manual insertion instructions below.";
	$admin_ads_edit[57] = "If you want to have this advertisement display somewhere other than the site-wide positions shown above (e.g. within the content on a single page), you can insert the following code into any of your <a href='admin_templates.php' target='_blank'>templates</a> and it will display your advertisement.";
	$admin_ads_edit[58] = "Select Audience";
	$admin_ads_edit[59] = "Specify which users will be shown advertisements from this campaign. To include the entire user population in this campaign, leave all of the <a href='admin_levels.php' target='_blank'>user levels</a> and <a href='admin_subnetworks.php' target='_blank'>subnetworks</a> selected. To select multiple user levels or subnetworks, use CTRL-click. Note that this advertising campaign will only be displayed to logged-in users that match both a user level <b>AND</b> a subnetwork you've selected.";
	$admin_ads_edit[60] = "Subnetworks";
	$admin_ads_edit[61] = "(signup default)";
	$admin_ads_edit[62] = "User Levels";
	$admin_ads_edit[63] = "Also show this advertisement to visitors that are not logged in.";
	$admin_ads_edit[64] = "Save Changes";
	$admin_ads_edit[65] = "Edit HTML";
	$admin_ads_edit[66] = "Default Subnetwork";
	break;

case "admin_announcements":
	$admin_announcements[1] = "Announcements";
	$admin_announcements[2] = "You can use announcements to get a message out to all the users on your social network. You can submit announcements via email or news items.";
	$admin_announcements[3] = "Send Email Announcement";
	$admin_announcements[4] = "Your announcement will be sent as an email to all of the users on your social network. If you have many users, this process may take some time to complete. ";
	$admin_announcements[5] = "Post News Item";
	$admin_announcements[6] = "Your announcement will be posted on your social network portal page. Regardless of the size of your social network, this process is instantaneous. If you have posted any news items in the past, they will be listed below. If you have included HTML in your news items, it will not be rendered below but will display properly on your portal page.";
	$admin_announcements[7] = "ID";
	$admin_announcements[8] = "Contents";
	$admin_announcements[9] = "Options";
	$admin_announcements[10] = "Untitled";
	$admin_announcements[11] = "No Date Provided";
	$admin_announcements[12] = "edit item";
	$admin_announcements[13] = "move down";
	$admin_announcements[14] = "delete";
	$admin_announcements[15] = "Post News Item";
	$admin_announcements[16] = "Please complete the following form to post your news item.";
	$admin_announcements[17] = "Date";
	$admin_announcements[18] = "(date will be displayed exactly as you enter it above)";
	$admin_announcements[19] = "Subject";
	$admin_announcements[20] = "(HTML OK)";
	$admin_announcements[21] = "Save News Item";
	$admin_announcements[22] = "Cancel";
	$admin_announcements[23] = "Use this form to compose an email message to be sent to every registered user on the social network. When you click the send button below, the system will begin looping through the user database and emailing the message to each user. Increasing the number of emails per page will make the process complete more quickly. However, if your server is currently under stress or you're simply not concerned about time, selecting a lower number of emails per page will reduce the risk of a timeout.";
	$admin_announcements[24] = "From";
	$admin_announcements[25] = "Emails Per Page";
	$admin_announcements[26] = "emails per page";
	$admin_announcements[27] = "Send Announcement";
	$admin_announcements[28] = "Emailing Complete";
	$admin_announcements[29] = "The emailing process has been completed. All users on your social network have been sent an email with your announcement.";
	$admin_announcements[30] = "Return";
	$admin_announcements[31] = "Emailing in Progress";
	$admin_announcements[32] = "Your announcement is being sent to users";
	$admin_announcements[33] = "This page will refresh and email the next set of users in several seconds. If it does not automatically continue within a minute, click the continue button below.";
	$admin_announcements[34] = "Continue...";
	$admin_announcements[35] = "email per page";
	$admin_announcements[36] = "Please provide a message body for this announcement.";
	$admin_announcements[37] = "Please select at least one user level or subnetwork that will receive this announcement.";
	$admin_announcements[38] = "Recipients";
	$admin_announcements[39] = "Select which users will receive this email announcement. By default, all <a href='admin_levels.php'>user levels</a> and <a href='admin_subnetworks.php'>subnetworks</a> are selected - this means that every user on your social network will receive this announcement. Use CTRL-click to select or deselect multiple user levels or subnetworks. If a user matches any user level OR subnetwork you have selected here, they will receive this announcement.";
	$admin_announcements[40] = "User Levels";
	$admin_announcements[41] = "Subnetworks";
	$admin_announcements[42] = "(default)";
	$admin_announcements[43] = "of";
	$admin_announcements[44] = "Default Subnetwork";
	break;

case "admin_banning":
	$admin_banning[1] = "Banning/Spam Settings";
	$admin_banning[2] = "Social networks are often the target of aggressive spam tactics. This most often comes in the form of fake user accounts and spam in comments. On this page, you can manage various anti-spam and censorship features. Note: To turn on the signup image verification feature (a popular anti-spam tool), see the <a href='admin_signup.php'>Signup Settings</a> page.";
	$admin_banning[3] = "Ban Users by IP Address";
	$admin_banning[4] = "To ban users by their IP address, enter their address into the field below. Addresses should be separated by commas, like <i>123.456.789.123, 23.45.67.89</i>";
	$admin_banning[5] = "Ban Users by Email Address";
	$admin_banning[6] = "To ban users by their email address, enter their email into the field below. Emails should be separated by commas, like <i>user1@domain1.com, user2@domain2.com</i>. Note that you can ban all email addresses with a specific domain as follows: <i>*@domain.com</i>";
	$admin_banning[7] = "Ban Users by Username";
	$admin_banning[8] = "Enter the usernames that are not permitted on your social network. Usernames should be separated by commas, like <i>username1, username2</i>";
	$admin_banning[9] = "Censored Words on Profiles and plugins";
	$admin_banning[10] = "Enter any words that you you want to censor on your users' profiles as well as any plugins you have installed. These will be replaced with asterisks (*). Separate words by commas like <i>word1, word2</i>";
	$admin_banning[11] = "Require users to enter validation code when commenting?";
	$admin_banning[12] = "If you have selected Yes, an image containing a random sequence of 6 numbers will be shown to users on the \"write a comment\" page. Users will be required to enter these numbers into the Verification Code field in order to post their comment. This feature helps prevent users from trying to create comment spam. For this feature to work properly, your server must have the GD Libraries (2.0 or higher) installed and configured to work with PHP. If you are seeing errors, try turning this off. ";
	$admin_banning[13] = "Yes, enable validation code for commenting.";
	$admin_banning[14] = "No, disable validation code for commenting.";
	$admin_banning[15] = "Save Changes";
	$admin_banning[16] = "Your changes have been saved.";
	$admin_banning[17] = "Require users to enter validation code when inviting others?";
	$admin_banning[18] = "If you have selected Yes, an image containing a random sequence of 6 numbers will be shown to users on the \"invite\" page. Users will be required to enter these numbers into the Verification Code field in order to send their invitation. This feature helps prevent users from trying to create comment spam. For this feature to work properly, your server must have the GD Libraries (2.0 or higher) installed and configured to work with PHP. If you are seeing errors, try turning this off.";
	$admin_banning[19] = "Yes, enable validation code for inviting.";
	$admin_banning[20] = "No, disable validation code for inviting.";
	break;

case "admin_connections":
	$admin_connections[1] = "User Friendship Settings";
	$admin_connections[2] = "Facilitating associations and relationships between users is essential to building a successful social network. There are several different types of connections that can exist between users. Use this page to determine how your users will associate with each other. Note that although we refer to these relationships as \"friendships\" in this control panel, you should use a word that best fits with your social network's theme. For example, if you are running a business-oriented social network, you may want to change this word to \"connections.\"";
	$admin_connections[3] = "Who can users invite to become friends?";
	$admin_connections[4] = "Please select who users can invite to become their friends. Note that if you select \"nobody\", none of the other settings on this page will apply.";
	$admin_connections[5] = "Users cannot invite anyone to become friends.";
	$admin_connections[6] = "Users can invite any other user to become friends.";
	$admin_connections[7] = "Users can only invite other users in the same subnetwork to become friends.";
	$admin_connections[8] = "Users can only invite their current friends' friends to become friends.";
	$admin_connections[9] = "Nobody";
	$admin_connections[10] = "Anybody";
	$admin_connections[11] = "Same Subnetwork";
	$admin_connections[12] = "Friends of Friends";
	$admin_connections[13] = "Friendship Framework";
	$admin_connections[14] = "Please select how you want the friendship request process to work. If you change this setting from \"Verified Friendships\" to \"Unverified Friendships\", all pending friendships will be automatically confirmed.";
	$admin_connections[15] = "Verified Friendships (Two-way)";
	$admin_connections[16] = "Verified Friendships (One-way)";
	$admin_connections[17] = "Unverified Friendships (Two-way)";
	$admin_connections[18] = "Unverified Friendships (One-way)";
	$admin_connections[19] = "When UserA invites UserB to become friends, UserB is added to UserA's friend list and UserA is added to UserB's friend list after UserB confirms the friendship.";
	$admin_connections[20] = "When UserA invites UserB to become friends, UserB is added to UserA's friend list after UserB confirms the friendship.";
	$admin_connections[21] = "When UserA invites UserB to become friends, UserB is immediately listed in UserA's friend list, and UserA is immediately listed in UserB's friend list.";
	$admin_connections[22] = "When UserA invites UserB to become friends, UserB is immediately listed in UserA's friend list.";
	$admin_connections[23] = "Save Changes";
	$admin_connections[24] = "Your changes have been saved.";
	$admin_connections[25] = "Friendship Types";
	$admin_connections[26] = "Add friendship types to allow your users to specify their varying degrees of friendships. Example friendship types include \"Acquaintance\", \"Co-Worker\", \"Best Friend\", \"Significant Other\", etc. If you only specify one friendship type or leave this area blank, users will not be prompted to specify a friendship type when connecting to other users.";
	$admin_connections[27] = "Friendship Types";
	$admin_connections[28] = "Add New Type";
	$admin_connections[29] = "Custom Friendship Types";
	$admin_connections[30] = "Allow users to specify a custom friendship type.";
	$admin_connections[31] = "Do not allow users to specify a custom friendship type.";
	$admin_connections[32] = "Friendship Explanation";
	$admin_connections[33] = "Allow users to provide an explanation of their friendships.";
	$admin_connections[34] = "Do not allow users to provide an explanation of their friendships.";
	break;

case "admin_emails":
	$admin_emails[1] = "System Email Settings";
	$admin_emails[2] = "This page allows you to change the content of email messages sent by the system.";
	$admin_emails[3] = "Save Changes";
	$admin_emails[4] = "From Address";
	$admin_emails[5] = "Enter the name and email address you want the emails from the system to come from in the fields below.";
	$admin_emails[6] = "From Name:";
	$admin_emails[7] = "From Address:";
	$admin_emails[8] = "Subject";
	$admin_emails[9] = "Message";
	$admin_emails[10] = "Invite Code Email";
	$admin_emails[11] = "This is the email that gets sent if you allow users to join by invite only.";
	$admin_emails[12] = "Invitation Email";
	$admin_emails[13] = "This is the email that gets sent when users invite their friends to join during the signup process.";
	$admin_emails[14] = "Verification Email";
	$admin_emails[15] = "This is the email that gets sent to users to verify their email addresses.";
	$admin_emails[16] = "New Password Email";
	$admin_emails[17] = "This is the email that gets sent if you have chosen to create a random password for users upon signup.";
	$admin_emails[18] = "Welcome Email";
	$admin_emails[19] = "This is the email that gets sent when a user signs up.";
	$admin_emails[20] = "[username] - replaced with the username of the sender.<br>[email] - replaced with the email address of the sender.<br>[message] - replaced with the custom message written by the sender.<br>[code] - replaced with the invite code.<br>[link] - replaced with the link to signup.";
	$admin_emails[21] = "[username] - replaced with the username of the sender.<br>[email] - replaced with the email address of the sender.<br>[message] - replaced with the custom message written by the sender.<br>[link] - replaced with the link to signup.";
	$admin_emails[22] = "[username] - replaced with the username of the recepient.<br>[email] - replaced with the email address of the recepient.<br>[link] - replaced with the link to verify recepient's email address.";
	$admin_emails[23] = "[username] - replaced with the username of the recepient.<br>[email] - replaced with the email address of the recepient.<br>[password] - replaced with the recepient's randomly generated password.<br>[link] - replaced with the link to login.";
	$admin_emails[24] = "[username] - replaced with the username of the recepient.<br>[email] - replaced with the email address of the recepient.<br>[password] - replaced with the password of the recepient.<br>[link] - replaced with the link to login.";
	$admin_emails[25] = "New Profile Comment Email";
	$admin_emails[26] = "This is the email that gets sent to a user when a new comment is posted on their profile.";
	$admin_emails[27] = "[username] - replaced with the username of the recepient.<br>[commenter] - replaced with the name of the user who posted the comment.<br>[link] - replaced with the link to the user's profile.";
	$admin_emails[28] = "Lost Password Email";
	$admin_emails[29] = "This is the email that gets sent if a user forgets their password and requests to create a new one.";
	$admin_emails[30] = "[username] - replaced with the username of the recepient.<br>[email] - replaced with the email address of the recepient.<br>[link] - replaced with the link to create a new password.";
	$admin_emails[31] = "Friend Request Email";
	$admin_emails[32] = "This is the email that gets sent to a user when they are added as a friend by another user.";
	$admin_emails[33] = "[username] - replaced with the username of the recepient.<br>[friendname] - replaced with the name of the user making the friend request.<br>[link] - replaced with the link to login.";
	$admin_emails[34] = "New Message Email";
	$admin_emails[35] = "This is the email that gets sent to a user when they receive a new message.";
	$admin_emails[36] = "[username] - replaced with the username of the recepient.<br>[sender] - replaced with the name of the user who sent the message.<br>[link] - replaced with the link to login.";
	$admin_emails[37] = "Your changes have been saved.";
	break;

case "admin_general":
	$admin_general[1] = "General Settings";
	$admin_general[2] = "This page contains general settings that affect your entire social network.";
	$admin_general[3] = "Timezone";
	$admin_general[4] = "Please select a default timezone setting for your social network. This will be the default timezone applied to users' accounts if they do not select a timezone during signup, or if they are not logged in.";
	$admin_general[5] = "Date Format";
	$admin_general[6] = "Select the date format you want to use on your social network. This will affect the appearance of the dates that appear on your social network pages.";
	$admin_general[7] = "Save Changes";
	$admin_general[8] = "Your changes have been saved.";
	$admin_general[9] = "Public Permission Defaults";
	$admin_general[10] = "Select whether or not you want to let the public (visitors that are not logged-in) to view the following sections of your social network. In some cases (such as Profiles), if you have given them the option, your users will be able to make their pages private even though you have made them publically viewable here.";
	$admin_general[11] = "Profiles";
	$admin_general[12] = "Yes, the public can view profiles unless they are made private.";
	$admin_general[13] = "No, the public cannot view profiles.";
	$admin_general[14] = "Invite Page";
	$admin_general[15] = "Yes, the public can use the invite page.";
	$admin_general[16] = "No, the public cannot use the invite page.";
	$admin_general[17] = "Search Page";
	$admin_general[18] = "Yes, the public can use the search page.";
	$admin_general[19] = "No, the public cannot use the search page.";
	$admin_general[20] = "Portal Page";
	$admin_general[21] = "Yes, the public view use the portal page.";
	$admin_general[22] = "No, the public cannot view the portal page.";
	$admin_general[23] = "Default Language";
	$admin_general[24] = "Select the language you want to use on your social network. If you want to add more languages, you must create files in your \"lang\" directory with names like \"lang_xxx.php\" and \"lang_xxx_admin.php\". Replace \"xxx\" with the name of your language (e.g. lang_english.php and lang_english_admin.php). If you have plugins installed, remember to create language files for them as well. Your language file names should NOT contain any CAPITAL letters and should NOT exceed 20 characters in length.";
	$admin_general[25] = "If you have more than one language pack, do you want to allow your users to select which one will be used while they are logged in? Note that this will only apply if you have more than one language pack above.";
	$admin_general[26] = "Yes, allow users to choose their own language.";
	$admin_general[27] = "No, all users must use the default language.";
	break;

case "admin_home":
	$admin_home[1] = "Hello, Admin!";
	$admin_home[2] = "Welcome to your social network control panel. Here you can manage and modify every aspect of your social network. Directly below, you will find a quick snapshot of your social network including some useful statistics. ";
	$admin_home[3] = "SocialEngine License:";
	$admin_home[4] = "Version:";
	$admin_home[5] = "Total Users:";
	$admin_home[6] = "Comments:";
	$admin_home[7] = "Private Messages:";
	$admin_home[8] = "User(s) Online:";
	$admin_home[9] = "Warning: You have not yet deleted install.php and/or installsql.php. Leaving these files on your server is a security risk!";
	$admin_home[10] = "Upgrade Available";
	$admin_home[11] = "User Levels:";
	$admin_home[12] = "Abuse Reports:";
	$admin_home[13] = "Friendships:";
	$admin_home[14] = "News Posts:";
	$admin_home[15] = "Signups Today:";
	$admin_home[16] = "Logins Today:";
	$admin_home[17] = "Admin Accounts:";
	$admin_home[18] = "<h2>Getting Started</h2>If you have just setup SocialEngine and are ready to build your social network, here are some helpful suggestions:";
	$admin_home[19] = "1";
	$admin_home[20] = "2";
	$admin_home[21] = "3";
	$admin_home[22] = "4";
	$admin_home[23] = "5";
	$admin_home[24] = "Create Profile Fields";
	$admin_home[25] = "One of the most defining aspects of your social network are your profile fields. These determine what information users share about each other on their profiles. They are an essential for emphasizing your social network's unique theme or subject.";
	$admin_home[26] = "Edit Signup Settings";
	$admin_home[27] = "After you've created your profile fields, you will want to customize the user signup process. Here you can specify what information users have to provide, whether or not they must be invited to signup, and other important details.";
	$admin_home[28] = "Edit Default User Level";
	$admin_home[29] = "Now let's decide what features users have access to and what limits we will place on their accounts. You can accomplish this by editing the default user level or creating additional user levels.";
	$admin_home[30] = "Install Plugins";
	$admin_home[31] = "Plugins give your social network additional functionality and interactivity. If you've already purchased any plugins, now would be an excellent time to install them and configure their settings.";
	$admin_home[32] = "Customize Look & Feel";
	$admin_home[33] = "The next step is to give your new social network its own style! You can edit any of the HTML templates (including a global header template and CSS file) to add your own personal design.";
	break;

case "admin_invite":
	$admin_invite[1] = "Invite Users";
	$admin_invite[2] = "Use this page to invite new users to your social network. You can specify 10 email addresses at a time. If you have specified that users may signup by invitation only, this page will email an invitation code to the email addresses you specify. Otherwise, a simple invitation email will be sent. Both these emails can be modified on your <a href='admin_emails.php'>System Emails</a> page.";
	$admin_invite[3] = "Email Addresses";
	$admin_invite[4] = "Enter email addresses (max 10), separated by commas, in the field below.";
	$admin_invite[5] = "Invite Users";
	$admin_invite[6] = "Invitations have been sent!";
	break;

case "admin_levels":
	$admin_levels[1] = "User Levels";
	$admin_levels[2] = "If you want to put users into different groups with varying access to features (e.g. Bronze, Silver, and Gold membership plans), you can create multiple user groups. You must always have at least one group - your default group (which cannot be deleted). When users signup, they will be placed into the group you have designated as the default group on this page. You can change a user's group by editing their account from the <a href='admin_viewusers.php'>View Users</a> page. If you want to give all users on your social network the same features and limits, you will only need one user level.";
	$admin_levels[3] = "Add User Level";
	$admin_levels[4] = "ID";
	$admin_levels[5] = "Name";
	$admin_levels[6] = "Users";
	$admin_levels[7] = "Options";
	$admin_levels[8] = "edit";
	$admin_levels[9] = "delete";
	$admin_levels[10] = "Delete User Level";
	$admin_levels[11] = "Are you sure you want to delete this user level? All users within this user level will be moved to the default user level.";
	$admin_levels[12] = "Delete Level";
	$admin_levels[13] = "Cancel";
	$admin_levels[14] = "Default";
	$admin_levels[15] = "You may not delete the default user level. Please select/create a new default before attempting to delete this level.";
	$admin_levels[16] = "The user level you selected has been deleted.";
	$admin_levels[17] = "user(s)";
	break;

case "admin_levels_add":
	$admin_levels_add[1] = "Add User Level";
	$admin_levels_add[2] = "To create a user level, complete the following form. Once it is created, you will be able to edit all the settings for this user level.";
	$admin_levels_add[3] = "Name";
	$admin_levels_add[4] = "Description";
	$admin_levels_add[5] = "Add Level";
	$admin_levels_add[6] = "Cancel";
	$admin_levels_add[7] = "Please specify a name for this user level.";
	$admin_levels_add[8] = "Editing User Level:";
	break;

case "admin_levels_edit":
	$admin_levels_edit[1] = "Edit User Level";
	$admin_levels_edit[2] = "To modify this user level, complete the following form.";
	$admin_levels_edit[3] = "Name";
	$admin_levels_edit[4] = "Description";
	$admin_levels_edit[5] = "Save Changes";
	$admin_levels_edit[6] = "Your changes have been saved.";
	$admin_levels_edit[7] = "Please specify a name for this user level.";
	$admin_levels_edit[8] = "Editing User Level:";
	$admin_levels_edit[9] = "You are currently editing this user level's settings. Remember, these settings only apply to the users that belong to this user level. When you're finished, you can edit the <a href='admin_levels.php'>other levels here</a>.";
	break;

case "admin_levels_messagesettings":
	$admin_levels_messagesettings[1] = "Message Settings";
	$admin_levels_messagesettings[2] = "Facilitating user interactivity is the key to developing a successful social network. Allowing private messages between users is an excellent way to increase interactivity. From this page, you can enable the private messaging feature and configure its settings. ";
	$admin_levels_messagesettings[3] = "Who can users send private messages to?";
	$admin_levels_messagesettings[4] = "If set to \"nobody,\" none of the other settings on this page will apply. Otherwise, users will have access to their private message inbox and will be able to send each other messages. ";
	$admin_levels_messagesettings[5] = "Nobody - users cannot send private messages.";
	$admin_levels_messagesettings[6] = "Friends only - users can send private messages to their friends only.";
	$admin_levels_messagesettings[7] = "Everyone - users can send private messages to anyone.";
	$admin_levels_messagesettings[8] = "Inbox/Outbox Capacity";
	$admin_levels_messagesettings[9] = "How many total messages will users be allowed to store in their inbox and outbox? If a user's inbox or outbox is full and a new message arrives, the oldest message will be automatically deleted.";
	$admin_levels_messagesettings[10] = "messages in inbox folder.";
	$admin_levels_messagesettings[11] = "messages in outbox folder.";
	$admin_levels_messagesettings[12] = "Save Changes";
	$admin_levels_messagesettings[13] = "Your changes have been saved.";
	$admin_levels_messagesettings[14] = "Editing User Level:";
	$admin_levels_messagesettings[15] = "You are currently editing this user level's settings. Remember, these settings only apply to the users that belong to this user level. When you're finished, you can edit the <a href='admin_levels.php'>other levels here</a>.";
	break;

case "admin_levels_usersettings":
	$admin_levels_usersettings[1] = "General User Settings";
	$admin_levels_usersettings[2] = "This page contains various settings that affect your users' accounts.";
	$admin_levels_usersettings[3] = "Privacy Options";
	$admin_levels_usersettings[4] = "Search Privacy Options";
	$admin_levels_usersettings[5] = "If you enable this feature, users will be able to exclude themselves from search results. Otherwise, all users will be included in search results.";
	$admin_levels_usersettings[6] = "Profile Privacy Options";
	$admin_levels_usersettings[7] = "Your changes have been saved.";
	$admin_levels_usersettings[8] = "Photo width and height must be integers between 1 and 999";	
	$admin_levels_usersettings[9] = "Photo file types can only be gif, jpg, jpeg, or png.";
	$admin_levels_usersettings[10] = "Allow custom CSS in profiles?";
	$admin_levels_usersettings[11] = "Allow User Photos?";
	$admin_levels_usersettings[12] = "If you enable this feature, users can upload a small photo icon of themselves. This will be shown next to their name/username on their profiles, in search/browse results, next to their private messages, etc.";
	$admin_levels_usersettings[13] = "Yes, users can upload a photo.";
	$admin_levels_usersettings[14] = "No, users can not upload a photo.";
	$admin_levels_usersettings[15] = "If you have selected \"Yes\" above, please input the maximum dimensions for the user photos. If your users upload a photo that is larger than these dimensions, the server will attempt to scale them down automatically. This feature requires that your PHP server is compiled with support for the GD Libraries.";
	$admin_levels_usersettings[16] = "Maximum Width:";
	$admin_levels_usersettings[17] = "(in pixels, between 1 and 999)";
	$admin_levels_usersettings[18] = "Maximum Height:";
	$admin_levels_usersettings[19] = "What file types do you want to allow for user photos (gif, jpg, jpeg, or png)? Separate file types with commas, i.e. <i>jpg, jpeg, gif, png</i>";
	$admin_levels_usersettings[20] = "Allowed File Types:";
	$admin_levels_usersettings[21] = "Save Changes";
	$admin_levels_usersettings[22] = "Enable this feature if you want to allow users to customize the colors and fonts of their profiles with their own CSS styles.";
	$admin_levels_usersettings[23] = "Yes, users can add custom CSS styles to their profiles.";
	$admin_levels_usersettings[24] = "No, users cannot add custom CSS styles to their profiles.";
	$admin_levels_usersettings[25] = "Yes, allow users to exclude themselves from search results.";
	$admin_levels_usersettings[26] = "No, force all users to be included in search results.";
	$admin_levels_usersettings[27] = "Allow profile status messages?";
	$admin_levels_usersettings[28] = "Enable this feature if you want to allow users to show their \"status\" on their profile. By updating their status, users can tell others what they are up to, what's on their minds, etc. ";
	$admin_levels_usersettings[29] = "Yes, allow users to have a \"status\" message.";
	$admin_levels_usersettings[30] = "No, users cannot have a \"status\" message.";
	$admin_levels_usersettings[31] = "Can users block other users?";
	$admin_levels_usersettings[32] = "If set to \"yes,\" users can block other users from sending them private messages, requesting their friendship, and viewing their profile. This helps fight spam and network abuse. ";
	$admin_levels_usersettings[33] = "Yes, users can block other users.";
	$admin_levels_usersettings[34] = "No, users cannot block other users.";
	$admin_levels_usersettings[35] = "Your users can choose from any of the options checked below when they decide who can see their profile. If you do not check any options, everyone will be allowed to view profiles.";
	$admin_levels_usersettings[36] = "Profile Comment Options";
	$admin_levels_usersettings[37] = "Your users can choose from any of the options checked below when they decide who can post comments on their profile. If you do not check any options, everyone will be allowed to post comments on profiles.";
	$admin_levels_usersettings[38] = "Editing User Level:";
	$admin_levels_usersettings[39] = "You are currently editing this user level's settings. Remember, these settings only apply to the users that belong to this user level. When you're finished, you can edit the <a href='admin_levels.php'>other levels here</a>.";
	break;

case "admin_log":
	$admin_log[1] = "Access Log";
	$admin_log[2] = "This page contains a list of the last 300 login attempts. Use this page to observe suspicious login attempts to your social network.";
	$admin_log[3] = "ID";
	$admin_log[4] = "Email";
	$admin_log[5] = "Date";
	$admin_log[6] = "Result";
	$admin_log[7] = "IP";
	$admin_log[8] = "Hostname";
	$admin_log[9] = "Success";
	$admin_log[10] = "Failure";
	break;

case "admin_login":


	$admin_login[3] = "Administrator Login";
	$admin_login[4] = "Username:";
	$admin_login[5] = "Password:";
	$admin_login[6] = "Login";
	$admin_login[7] = "Lost Password";
	break;

case "admin_lostpass":
	$admin_lostpass[1] = "Lost Password";
	$admin_lostpass[2] = "If you cannot login because you have forgotten your password, please enter your email address in the field below.";
	$admin_lostpass[3] = "You have been sent an email with instructions how to reset your password. If the email does not arrive within several minutes, be sure to check your spam or junk mail folders.";
	$admin_lostpass[4] = "The email you have entered was not found in the database. Please try again.";
	$admin_lostpass[5] = "Email Address:";
	$admin_lostpass[6] = "Submit";
	$admin_lostpass[7] = "Cancel";
	$admin_lostpass[8] = "Reset SocialEngine Admin Password Request";
	$admin_lostpass[9] = "Hello,\n\nYou have requested to reset your SocialEngine admin password. If you would like to do so, please click the link below. If you did not request a password reset, simply ignore this email.";
	$admin_lostpass[10] = "Thank You";
	break;

case "admin_lostpass_reset":
	$admin_lostpass_reset[1] = "Please make sure you have completed both fields.";
	$admin_lostpass_reset[2] = "Username and Password fields must be alpha-numeric.";
	$admin_lostpass_reset[3] = "Passwords must be at least 6 characters in length.";
	$admin_lostpass_reset[4] = "Password and Password Confirmation fields must match.";
	$admin_lostpass_reset[5] = "Lost Password Reset";
	$admin_lostpass_reset[6] = "Your password has been reset. <a href='admin_login.php'>Click here</a> to login.";
	$admin_lostpass_reset[7] = "Complete the form below to reset your password.";
	$admin_lostpass_reset[8] = "New Password:";
	$admin_lostpass_reset[9] = "Confirm New Password:";
	$admin_lostpass_reset[10] = "Reset Password";
	$admin_lostpass_reset[11] = "Cancel";
	$admin_lostpass_reset[12] = "This link is invalid or expired. Please <a href='admin_lostpass.php'>resubmit</a> your password request and follow the link sent to your email address.";
	break;

case "admin_profile":
	$admin_profile[1] = "Profile Fields";
	$admin_profile[2] = "Your users will distinguish themselves through their profile page. You must give them profile fields that allow them to describe themselves in a way that is relevant to the theme of your social network. On this page, you can create profile tabs and fields. Tabs allow you to organize your profile fields into sections. Commonly used tabs are 'Personal Info', 'Contact Info', 'About Me', etc., but you should create tabs that organize your fields appropriately. Profile fields are the actual input fields into which your users will enter their information. Likewise, these should be relevant to the unique theme of your social network.";
	$admin_profile[3] = "Add Tab";
	$admin_profile[4] = "Add Field";
	$admin_profile[5] = "User Profile";
	$admin_profile[6] = "Note: You do not have any profile tabs to manage. Click the \"Add Tab\" button above to create one.";
	$admin_profile[7] = "Contract All";
	$admin_profile[8] = "Expand All";
	$admin_profile[9] = "<i>Dependent Field</i>";
	$admin_profile[10] = "(Age)";
	break;

case "admin_profile_addfield":
	$admin_profile_addfield[1] = "Add Profile Field";
	$admin_profile_addfield[2] = "Use this page to create a new profile field. You must specify a name for this field and assign it to a profile tab. To decide whether or not this field will appear on the user signup page, visit <a href='admin_signup.php'>Signup Settings</a>.";
	$admin_profile_addfield[3] = "No dependent field";
	$admin_profile_addfield[4] = "Yes, has dependent field";
	$admin_profile_addfield[5] = "Field Title:";
	$admin_profile_addfield[6] = "Profile Tab:";
	$admin_profile_addfield[7] = "Field Type:";
	$admin_profile_addfield[8] = "Text Field";
	$admin_profile_addfield[9] = "Multi-line Text Area";
	$admin_profile_addfield[10] = "Pull-down Select Box";
	$admin_profile_addfield[11] = "Radio Buttons";
	$admin_profile_addfield[12] = "Inline CSS Style:";
	$admin_profile_addfield[13] = "Field Maxlength:";
	$admin_profile_addfield[14] = "Regex Validation:";
	$admin_profile_addfield[15] = "If you want to force the user to enter data in a certain format,<br>enter the corresponding regular expression above. A preg_match()<br>will be applied when the user enters data. This is optional - if you<br>don't understand or need regular expressions, leave this blank.";
	$admin_profile_addfield[16] = "Custom Error Message:";
	$admin_profile_addfield[17] = "Options:";
	$admin_profile_addfield[18] = "You must specify at least one option.";
	$admin_profile_addfield[19] = "Label";
	$admin_profile_addfield[20] = "Dependency?";
	$admin_profile_addfield[21] = "Dependent Field Label";
	$admin_profile_addfield[22] = "Add New Option";
	$admin_profile_addfield[23] = "Add Field";
	$admin_profile_addfield[24] = "Cancel";
	$admin_profile_addfield[25] = "Birthday?";
	$admin_profile_addfield[26] = "You must specify a field type.";
	$admin_profile_addfield[27] = "Please enter both a value and a label for each option.";
	$admin_profile_addfield[28] = "You must enter a title for this field.";
	$admin_profile_addfield[29] = "Field Description:";
	$admin_profile_addfield[30] = "Searchable/Linked:";
	$admin_profile_addfield[31] = "Searchable, Linked on Profile";
	$admin_profile_addfield[32] = "Searchable";
	$admin_profile_addfield[33] = "Not Searchable";
	$admin_profile_addfield[34] = "Required:";
	$admin_profile_addfield[35] = "Required";
	$admin_profile_addfield[36] = "Not Required";
	$admin_profile_addfield[37] = "Date Field";
	$admin_profile_addfield[38] = "Checking this box will allow for age calculation and members' birthday notifications.";
	$admin_profile_addfield[39] = "Link Field To:";
	$admin_profile_addfield[40] = "If you want this field to link to another URL, enter the link format above. Note that<br> this will override the \"Searchable/Linked\" setting above. Use [field_value] to represent<br> the user's input for this field. Examples:<br><i>Regular link (if user's input is a URL - must begin with \"http://\"):</i> <strong>[field_value]</strong><br><i>Mailto link (if user's input is an email address):</i> <strong>mailto:[field_value]</strong><br><i>AIM Link (if user's input is an AIM screenname):</i> <strong>aim:goim?screenname=[field_value]</strong>";
	$admin_profile_addfield[41] = "Not Searchable, Not Visible on Profile";
	$admin_profile_addfield[42] = "Allowed HTML Tags:";
	$admin_profile_addfield[43] = "By default, the user may not enter any HTML tags into this profile field. If you want<br>to allow specific tags, you can enter them above (separated by commas). Example:<br><i>b, img, a, embed, font<i>";
	break;

case "admin_profile_addtab":
	$admin_profile_addtab[1] = "Please specify a name for this tab.";
	$admin_profile_addtab[2] = "Profile tabs represent the different sections of your users' profiles. When editing their profiles, they will see their profile fields organized within the tabs that you specify. To create a new profile tab, please complete the following form.";
	$admin_profile_addtab[3] = "Tab Name:";
	$admin_profile_addtab[4] = "Add Tab";
	$admin_profile_addtab[5] = "Cancel";
	$admin_profile_addtab[6] = "Create Profile Tab";
	break;

case "admin_profile_editdepfield":
	$admin_profile_editdepfield[1] = "Edit Dependent Profile Field";
	$admin_profile_editdepfield[2] = "Complete this form to edit this dependent field.";
	$admin_profile_editdepfield[3] = "Field Label:";
	$admin_profile_editdepfield[4] = "Inline CSS Style:";
	$admin_profile_editdepfield[5] = "Link Field To:";
	$admin_profile_editdepfield[6] = "If you want this field to link to another URL, enter the link format above.<br> Use [field_value] to represent the user's input for this field. Examples:<br><i>Regular link (if user's input is a URL):</i> <strong>[field_value]</strong><br><i>Mailto link (if user's input is an email address):</i> <strong>mailto:[field_value]</strong><br><i>AIM Link (if user's input is an AIM screenname):</i> <strong>aim:goim?screenname=[field_value]</strong>";
	$admin_profile_editdepfield[7] = "Regex Validation:";
	$admin_profile_editdepfield[8] = "If you want to force the user to enter data in a certain format,<br>enter the corresponding regular expression above. A preg_match()<br>will be applied when the user enters data. This is optional - if you<br>don't understand or need regular expressions, leave this blank.";
	$admin_profile_editdepfield[10] = "Save Changes";
	$admin_profile_editdepfield[11] = "Cancel";
	$admin_profile_editdepfield[12] = "Parent Field:";
	$admin_profile_editdepfield[13] = "Field Maxlength:";
	$admin_profile_editdepfield[14] = "Required:";
	$admin_profile_editdepfield[15] = "Required";
	$admin_profile_editdepfield[16] = "Not Required";
	$admin_profile_editdepfield[17] = "Linked:";
	$admin_profile_editdepfield[18] = "Linked on Profile";
	$admin_profile_editdepfield[19] = "Not Linked on Profile";
	break;

case "admin_profile_editfield":
	$admin_profile_editfield[1] = "Edit Profile Field";
	$admin_profile_editfield[2] = "Use this page to edit a profile field. To decide whether or not this field will appear on the user signup page, visit <a href='admin_signup.php'>Signup Settings</a>.";
	$admin_profile_editfield[3] = "No dependent field";
	$admin_profile_editfield[4] = "Yes, has dependent field";
	$admin_profile_editfield[5] = "Field Title:";
	$admin_profile_editfield[6] = "Profile Tab:";
	$admin_profile_editfield[7] = "Field Type:";
	$admin_profile_editfield[8] = "Text Field";
	$admin_profile_editfield[9] = "Multi-line Text Area";
	$admin_profile_editfield[10] = "Pull-down Select Box";
	$admin_profile_editfield[11] = "Radio Buttons";
	$admin_profile_editfield[12] = "Inline CSS Style:";
	$admin_profile_editfield[13] = "Field Maxlength:";
	$admin_profile_editfield[14] = "Regex Validation:";
	$admin_profile_editfield[15] = "If you want to force the user to enter data in a certain format,<br>enter the corresponding regular expression above. A preg_match()<br>will be applied when the user enters data. This is optional - if you<br>don't understand or need regular expressions, leave this blank.";
	$admin_profile_editfield[16] = "Custom Error Message:";
	$admin_profile_editfield[17] = "Options:";
	$admin_profile_editfield[18] = "You must specify at least one option.";
	$admin_profile_editfield[19] = "Label";
	$admin_profile_editfield[20] = "Dependency?";
	$admin_profile_editfield[21] = "Dependent Field Label";
	$admin_profile_editfield[22] = "Add New Option";
	$admin_profile_editfield[23] = "Edit Field";
	$admin_profile_editfield[24] = "Cancel";
	$admin_profile_editfield[25] = "Birthday?";
	$admin_profile_editfield[26] = "You must specify a field type.";
	$admin_profile_editfield[27] = "Please enter both a value and a label for each option.";
	$admin_profile_editfield[28] = "You must enter a title for this field.";
	$admin_profile_editfield[29] = "Field Description:";
	$admin_profile_editfield[30] = "Searchable/Linked:";
	$admin_profile_editfield[31] = "Searchable, Linked on Profile";
	$admin_profile_editfield[32] = "Searchable";
	$admin_profile_editfield[33] = "Not Searchable";
	$admin_profile_editfield[34] = "Delete Field";
	$admin_profile_editfield[35] = "Confirm Field Deletion";
	$admin_profile_editfield[36] = "Are you sure you want to delete this field and any dependent fields it may have?";
	$admin_profile_editfield[37] = "Required:";
	$admin_profile_editfield[38] = "Required";
	$admin_profile_editfield[39] = "Not Required";
	$admin_profile_editfield[40] = "Date Field";
	$admin_profile_editfield[41] = "Checking this box will allow for age calculation and members' birthday notifications.";
	$admin_profile_editfield[42] = "Link Field To:";
	$admin_profile_editfield[43] = "If you want this field to link to another URL, enter the link format above. Note that<br> this will override the \"Searchable/Linked\" setting above. Use [field_value] to represent<br> the user's input for this field. Examples:<br><i>Regular link (if user's input is a URL - must begin with \"http://\"):</i> <strong>[field_value]</strong><br><i>Mailto link (if user's input is an email address):</i> <strong>mailto:[field_value]</strong><br><i>AIM Link (if user's input is an AIM screenname):</i> <strong>aim:goim?screenname=[field_value]</strong>";
	$admin_profile_editfield[44] = "Not Searchable, Not Visible on Profile";
	$admin_profile_editfield[45] = "Allowed HTML Tags:";
	$admin_profile_editfield[46] = "By default, the user may not enter any HTML tags into this profile field. If you want<br>to allow specific tags, you can enter them above (separated by commas). Example:<br><i>b, img, a, embed, font</i>";
	break;

case "admin_profile_edittab":
	$admin_profile_edittab[1] = "Please specify a name for this tab.";
	$admin_profile_edittab[2] = "Delete Tab";
	$admin_profile_edittab[3] = "Tab Name:";
	$admin_profile_edittab[4] = "Edit Tab";
	$admin_profile_edittab[5] = "Cancel";
	$admin_profile_edittab[6] = "Delete Tab";
	$admin_profile_edittab[7] = "Are you sure you want to delete this tab and all the fields contained within?";
	$admin_profile_edittab[8] = "Back to Tabs";
	$admin_profile_edittab[9] = "Edit Profile Tab";
	$admin_profile_edittab[10] = "Use this page to edit the name of a profile tab. The tab name should be a one or two word phrase to describe the profile fields within the tag. You can also use this page to alter the order in which profile fields are displayed on your users' profiles. To move a field up or down, click the appropriate arrow icon next to the field name.";
	break;

case "admin_profile_taborder":
	$admin_profile_taborder[1] = "Reorder Profile Tabs";
	$admin_profile_taborder[2] = "You can use this page to alter the order in which profile tabs are displayed on your users' profiles. To move a tab up or down, click the appropriate arrow icon next to the tab name.";
	$admin_profile_taborder[3] = "Back to Tabs";
	break;

case "admin_signup":
	$admin_signup[1] = "Signup Settings";
	$admin_signup[2] = "The user signup process is a crucial element of your social network. You need to design a signup process that is user friendly but also gets the initial information you need from new users. On this page, you can configure your signup process.";
	$admin_signup[3] = "Fields on Signup Page";
	$admin_signup[4] = "Your users will have an opportunity to begin filling out their profile when they signup. Below, you can specify which profile fields will appear on the signup page, and which will be required. Keep in mind that a lengthly signup process may deter some users from signing up to your social network. To add or delete profile fields, visit the <a href='admin_profile.php'>Profile Fields</a> page.";
	$admin_signup[5] = "No fields exist within this profile tab.";
	$admin_signup[6] = "How many invites do users get when they signup? (If you want to give a particular user extra invites, you can do so via the <a href='admin_viewusers.php'>View Users</a> page. Please enter a number between 0 and 999 below.";
	$admin_signup[7] = "invites are given to each user when they signup.";
	$admin_signup[8] = "User Photo Upload";
	$admin_signup[9] = "Invite Only?";
	$admin_signup[10] = "Do you want to turn off public signups and only allow invited users to signup? If yes, you can choose to have either admins and users invite new users, or just admins. If set to yes, an invite code will be required on the signup page.";
	$admin_signup[11] = "Yes, admins and users must invite new users before they can signup.";
	$admin_signup[12] = "Yes, admins must invite new users before they can signup.";
	$admin_signup[13] = "No, disable the invite only feature.";
	$admin_signup[14] = "Show \"Invite Friends\" Page?";
	$admin_signup[15] = "If you have selected YES, your users will be shown a page asking them to optionally invite one or more friends to signup. The \"invite friends\" feature is different from the \"invite only\" feature because \"invite friends\" simply sends an email to the invitee instead of sending them an actual invitation code. Because of this, you probably do not want to enable both \"invite friends\" and \"invite only\" features simultaneously.";
	$admin_signup[16] = "Yes, show invite friends page.";
	$admin_signup[17] = "No, do not show invite friends page.";
	$admin_signup[18] = "Verify Email Address?";
	$admin_signup[19] = "Force users to verify their email address before they can login? If set to YES, users will be sent an email with a verification link which they must click to activate their account.";
	$admin_signup[20] = "Yes, verify email addresses.";
	$admin_signup[21] = "No, do not verify email addresses.";
	$admin_signup[22] = "Require Users to Enter a Verification Code?";
	$admin_signup[23] = "If you have selected YES, an image containing a random sequence of 6 numbers will be shown to users on the signup page. Users will be required to enter these numbers into the Verification Code field before they can continue. This feature helps prevent users from trying to automatically create accounts on your system. For this feature to work properly, your server must have the GD Libraries (2.0 or higher) installed and configured to work with PHP. If you are seeing errors or users cannot signup, try turning this off.";
	$admin_signup[24] = "Yes, show verification code image.";
	$admin_signup[25] = "No, do not show verification code image.";
	$admin_signup[26] = "Generate Random Passwords?";
	$admin_signup[27] = "If you have selected YES, a random password will be created for users when they signup. The password will be emailed to them upon the completion of the signup process. This is another method of verifying users' email addresses.";
	$admin_signup[28] = "Yes, generate random passwords and email to new users.";
	$admin_signup[29] = "No, let users choose their own passwords.";
	$admin_signup[30] = "Require users to agree to your terms of service?";
	$admin_signup[31] = "Note: If you have selected YES, users will be forced to click a checkbox during the signup process which signifies that they have read, understand, and agree to your terms of service. Enter your terms of service text in the field below. HTML is OK.";
	$admin_signup[32] = "Yes, make users agree to your terms of service on signup.";
	$admin_signup[33] = "No, users will not be shown a terms of service checkbox on signup.";
	$admin_signup[34] = "Save Changes";
	$admin_signup[35] = "Your changes have been saved.";
	$admin_signup[36] = "Do you want your users to be able to upload a photo of themselves upon signup?";
	$admin_signup[37] = "Yes, give users the option to upload a photo upon signup.";
	$admin_signup[38] = "No, do not allow users to upload a photo upon signup.";
	$admin_signup[39] = "Send Welcome Email?";
	$admin_signup[40] = "Send users a welcome email upon signup? If you have email verification activated, this email will be sent upon verification. You can modify this email on the <a href='admin_emails.php'>System Emails</a> page.";
	$admin_signup[41] = "Yes, send users a welcome email.";
	$admin_signup[42] = "No, do not send users a welcome email.";
	$admin_signup[43] = "Enable Users?";
	$admin_signup[44] = "If you have selected YES, users will automatically be enabled when they signup. If you select NO, you will need to manually enable users through the <a href='admin_viewusers.php'>View Users</a> page. Users that are not enabled cannot login.";
	$admin_signup[45] = "Yes, enable users upon signup.";
	$admin_signup[46] = "No, do not enable users upon signup.";
	$admin_signup[47] = "Should each invite code be bound to each invited email address? If set to NO, anyone with a valid invite code can signup regardless of their email address. If set to YES, anyone with a valid invite code that matches an email address that was invited can signup.";
	$admin_signup[48] = "Yes, check that a user's email address was invited before accepting their invite code.";
	$admin_signup[49] = "No, anyone with an invite code can signup, regardless of their email address.";
	break;

case "admin_stats":
	$admin_stats[1] = "Network Statistics";
	$admin_stats[2] = "Use this page to monitor network usage and traffic patterns. Begin by selecting one of the types of available statistics below.";
	$admin_stats[3] = "Page Views";
	$admin_stats[4] = "Logins";
	$admin_stats[5] = "New Signups";
	$admin_stats[6] = "New Friends";
	$admin_stats[7] = "Week of";
	$admin_stats[8] = " (";
	$admin_stats[9] = ")";
	$admin_stats[10] = "Network Usage";
	$admin_stats[11] = "Quick Summary";
	$admin_stats[12] = "Visits/Impressions";
	$admin_stats[13] = "New Logins";
	$admin_stats[14] = "New Signups";
	$admin_stats[15] = "New Friendships";
	$admin_stats[16] = "Other Stats";
	$admin_stats[17] = "Referring URLs";
	$admin_stats[18] = "Space Used";
	$admin_stats[19] = "Period:";
	$admin_stats[20] = "This Week (Daily)";
	$admin_stats[21] = "This Month (Daily)";
	$admin_stats[22] = "This Year (Monthly)";
	$admin_stats[23] = "Refresh";
	$admin_stats[24] = "Referring URLs";
	$admin_stats[25] = "These are the 100 most common referring URLs tracked from your <a href='../home.php' target='_blank'>home.php</a> file.<br>This indicates that most new traffic is coming from the following URLs.<br>Clearing the list periodically will give you fresh referrer data.";
	$admin_stats[26] = "clear now";
	$admin_stats[27] = "Hits";
	$admin_stats[28] = "Url";
	$admin_stats[29] = "The referrer URL list is currently empty.";
	$admin_stats[30] = "Uploaded Media:";
	$admin_stats[31] = "Database Size:";
	$admin_stats[32] = "Total Space Used (Estimated):";
	$admin_stats[33] = "Quick Network Statistics";
	$admin_stats[34] = "The following data is a quick snapshot of your social network.<br>The data does not include any items that have been deleted.";
	$admin_stats[35] = "Total Users:";
	$admin_stats[36] = "Total Private Messages:";
	$admin_stats[37] = "Total Comments:";
	$admin_stats[38] = "users";
	$admin_stats[39] = "messages";
	$admin_stats[40] = "comments";
	$admin_stats[41] = "Last Period";
	$admin_stats[42] = "Next Period";
	break;

case "admin_subnetworks":
	$admin_subnetworks[1] = "Subnetworks";
	$admin_subnetworks[2] = "Your social network has the ability to organize users into \"subnetworks\" based on profile information they have in common with each other. You can use this to limit access and privacy between subnetworks, display subnetwork-specific content in your templates, or to simply organize your users.";
	$admin_subnetworks[3] = "Primary Requirement Field:";
	$admin_subnetworks[4] = "Secondary Requirement Field:";
	$admin_subnetworks[5] = "Update";
	$admin_subnetworks[6] = "Add New Subnetwork";
	$admin_subnetworks[7] = "ID";
	$admin_subnetworks[8] = "Name";
	$admin_subnetworks[9] = "Users";
	$admin_subnetworks[10] = "Requirements";
	$admin_subnetworks[11] = "Options";
	$admin_subnetworks[12] = "edit";
	$admin_subnetworks[13] = "delete";
	$admin_subnetworks[14] = "Default Subnetwork";
	$admin_subnetworks[15] = "Users Not In Another Subnetwork";
	$admin_subnetworks[16] = "Email Address";
	$admin_subnetworks[17] = "Your requirement fields have been updated.";
	$admin_subnetworks[18] = "Delete Subnetwork";
	$admin_subnetworks[19] = "Are you sure you want to delete this subnetwork? All users within this subnetwork will be moved to the default subnetwork.";
	$admin_subnetworks[20] = "Cancel";
	$admin_subnetworks[21] = "The subnetwork you selected has been deleted.";
	$admin_subnetworks[22] = "<b>Important:</b> The requirement fields you select must be set to \"Required on Signup\" on the <a href='admin_signup.php'>Signup Settings</a> page. If they are not set to \"Required on Signup\", they may not appear during the signup process and users will not have an opportunity to fill them out. Because they have not filled out your requirement fields, they will automatically be placed in the \"Default Subnetwork\" until they fill out the fields. If you already have users in subnetworks on your social network and you change the requirement fields or the requirements of a specific subnetwork, users will remain in the same subnetworks (based on the original requirements or differentation fields you had set) until their profile information is updated. All users that are not sorted into a subnetwork will be placed into the \"Default Subnetwork\" until their profile information is updated and matches the requirements of a different subnetwork. When a subnetwork is deleted, users within the deleted subnetwork will be moved into the \"Default Subnetwork\".<br><br><b>Example:</b> If you wanted to create two subnetworks - one for male users and one for female users - you must create a profile field called \"Gender\" and use it as your primary requirement field below. If you want to have four subnetworks - males in California, females in California, males outside California, females outside California - you should create a profile field called \"location\" and use it as your secondary requirement field. Then, create subnetworks with the appropriate requirements so that these four subnetworks are mutually exclusive.";
	$admin_subnetworks[23] = "(Age)";
	$admin_subnetworks[24] = "Show Detailed Instructions";
	break;

case "admin_subnetworks_add":
	$admin_subnetworks_add[1] = "Add Subnetwork";
	$admin_subnetworks_add[2] = "To create a new subnetwork, complete the following form. You will need to specify who can belong to this subnetwork. You can do this by creating requirements. Note that you must specify a requirement with regards to your primary requirement field. Requirements based on the secondary requirement field are optional. The use of wildcards (*) is accepted when using the \"is equal to (==)\" and \"is not equal to (!=)\" operators. String values (such as words and phrases) will NOT be case sensitive. Please make sure that subnetwork requirements are mutually exclusive; that is, make sure users can only be placed in one subnetwork based on the requirements you provide. If the requirements overlap with another subnetwork's requirements, users will be randomly placed into one of the overlapping subnetworks.";
	$admin_subnetworks_add[3] = "Name";
	$admin_subnetworks_add[4] = "Requirements";
	$admin_subnetworks_add[5] = "And";
	$admin_subnetworks_add[6] = "is equal to ( == )";
	$admin_subnetworks_add[7] = "is not equal to ( != )";
	$admin_subnetworks_add[8] = "is greater than ( > )";
	$admin_subnetworks_add[9] = "is less than ( < )";
	$admin_subnetworks_add[10] = "is greater than or equal to ( >= )";
	$admin_subnetworks_add[11] = "is less than or equal to ( <= )";
	$admin_subnetworks_add[12] = "Add Subnetwork";
	$admin_subnetworks_add[13] = "Cancel";
	$admin_subnetworks_add[14] = "You must specify a primary requirement.";
	$admin_subnetworks_add[15] = "Please specify a name for this subnetwork.";
	$admin_subnetworks_add[16] = "Please complete the secondary requirement or leave it completely blank.";
	$admin_subnetworks_add[17] = "Email Address";
	$admin_subnetworks_add[18] = "(Age)";
	break;

case "admin_subnetworks_edit":
	$admin_subnetworks_edit[1] = "Edit Subnetwork";
	$admin_subnetworks_edit[2] = "To edit this subnetwork, please use the following form. You will need to specify who can belong to this subnetwork. You can do this by creating requirements. Note that you must specify a requirement with regards to your primary requirement field. Requirements based on the secondary requirement field are optional. The use of wildcards (*) is accepted when using the \"is equal to (==)\" and \"is not equal to (!=)\" operators. String values (such as words and phrases) will NOT be case sensitive. Please make sure that subnetwork requirements are mutually exclusive; that is, make sure users can only be placed in one subnetwork based on the requirements you provide. If the requirements overlap with another subnetwork's requirements, users will be randomly placed into one of the overlapping subnetworks.";
	$admin_subnetworks_edit[3] = "Name";
	$admin_subnetworks_edit[4] = "Requirements";
	$admin_subnetworks_edit[5] = "And";
	$admin_subnetworks_edit[6] = "is equal to";
	$admin_subnetworks_edit[7] = "is not equal to";
	$admin_subnetworks_edit[8] = "is greater than";
	$admin_subnetworks_edit[9] = "is less than";
	$admin_subnetworks_edit[10] = "is greater than or equal to";
	$admin_subnetworks_edit[11] = "is less than or equal to";
	$admin_subnetworks_edit[12] = "Edit Subnetwork";
	$admin_subnetworks_edit[13] = "Cancel";
	$admin_subnetworks_edit[14] = "You must specify a requirement with regards to the primary requirement field.";
	$admin_subnetworks_edit[15] = "Please specify a name for this subnetwork.";
	$admin_subnetworks_edit[16] = "Please complete the secondary requirement or leave it completely blank.";
	$admin_subnetworks_edit[17] = "Email Address";
	$admin_subnetworks_edit[18] = "(Age)";
	break;

case "admin_templates":
	$admin_templates[1] = "HTML Templates";
	$admin_templates[2] = "You have complete control over the look and feel of your social network. The PHP code that powers your social network is completely separate from the HTML code used for presentation. Your HTML code is stored in the templates listed below, which can be edited directly on this page. To edit a template, simply click it's name.<br><br><b>About the template system:</b><br>The template system uses Smarty, which is the most advanced and renown third-party PHP templating system available. Although the templates are primarily HTML, some Smarty tags are used for various purposes. For help with the templating system, please visit the <a href='http://smarty.php.net' target='_blank'>Smarty</a> website. Note that many of the tags you will find in the templates are actually language variables. These are used to display bits of text that have been specified in your language pack. To change these bits of text, you must edit the language file you are using in the \"lang\" directory on your server.<br><br><b>Adding your website's header/footer wrapper:</b><br>The simplest way to integrate your social network into your main website is to copy your website's header/footer HTML and paste it into the \"Header/Footer Templates\" below. To make global changes to the CSS stylesheet, you can edit \"styles.css\".";
	$admin_templates[3] = "Logged-in User Pages";
	$admin_templates[4] = "Public Pages";
	$admin_templates[5] = "Header/Footer Templates";
	$admin_templates[6] = "(Global Header HTML)";
	$admin_templates[7] = "(Global Footer HTML)";
	break;

case "admin_templates_edit":
	$admin_templates_edit[1] = "Edit Template";
	$admin_templates_edit[2] = "The HTML and Smarty code for this template is displayed below. After making your desired changes to the template, be sure to click the \"Save Changes\" button. For help with Smarty, see the <a href='http://smarty.php.net' target='_blank'>official website</a> and <a href='http://smarty.php.net/crashcourse.php' target='_blank'>crash course</a>.";
	$admin_templates_edit[3] = "Save Changes";
	$admin_templates_edit[4] = "Cancel";
	$admin_templates_edit[5] = "The file you specified is not a valid template file.";
	$admin_templates_edit[6] = "The template you specified could not be found.";
	$admin_templates_edit[7] = "The template you specified could not be read. Try setting full permissions (CHMOD 777) to this file and the templates directory.";
	$admin_templates_edit[8] = "The template you specified is not writable. Try setting full permissions (CHMOD 777) to this file and the templates directory.";
	$admin_templates_edit[9] = "Cannot write to file";
	$admin_templates_edit[10] = "Return";
	break;

case "admin_url":
	$admin_url[1] = "URL Settings";
	$admin_url[2] = "Some users prefer to have profile addresses (URLs) that are easier to remember, more visually appealing, and more search-engine friendly. By default, your users' URLs will appear in the \"normal\" format as demonstrated below. If you want to give them \"subdirectory URLs\", your web server must be running Apache and have mod_rewrite installed.";
	$admin_url[3] = "After you select a URL style and click the submit button below, you will be prompted with further instructions for enabling the URL style of your choice. Please follow these instructions carefully to ensure that your URLs are working properly.";
	$admin_url[4] = "Normal URLs";
	$admin_url[5] = "Subdirectory URLs";
	$admin_url[6] = "Save Changes";
	$admin_url[7] = " - (Need help? Review the instructions <a href='admin_url_help.php'>here</a>.)";
	$admin_url[8] = "Your changes have been saved.";
	$admin_url[9] = "URL Style";
	$admin_url[10] = "<b>Normal URLs</b><br>Profile URL: http://www.yourdomain.com/profile.php?user=username";
	$admin_url[11] = "<b>Subdirectory URLs</b><br>Profile URL: http://www.yourdomain.com/username";
	break;

case "admin_url_help":
	$admin_url_help[1] = "URL Settings Help";
	$admin_url_help[2] = "The system is now set to use subdirectory URLs, which require an .htaccess file in your SocialEngine root directory. Copy and paste the code in the following box into a blank text file named .htaccess, and place it into your SocialEngine root directory. This is the directory on your server in which you have installed SocialEngine.";
	$admin_url_help[3] = "Return to URL Settings";
	break;

case "admin_viewadmins":
	$admin_viewadmins[1] = "View Admin Accounts";
	$admin_viewadmins[2] = "Your social network can have more than one administrator. This is useful if you want to have a staff of admins who maintain your social network. However, the first admin to be created (upon installation) is the \"superadmin\" and cannot be deleted. The superadmin can create and delete other admin accounts. All admin accounts on your system are listed below.";
	$admin_viewadmins[3] = "ID";
	$admin_viewadmins[4] = "Username";
	$admin_viewadmins[5] = "Name";
	$admin_viewadmins[6] = "Email";
	$admin_viewadmins[7] = "Status";
	$admin_viewadmins[8] = "Options";
	$admin_viewadmins[9] = "Superadmin";
	$admin_viewadmins[10] = "Admin";
	$admin_viewadmins[11] = "edit";
	$admin_viewadmins[12] = "delete";
	$admin_viewadmins[13] = "Add Admin";
	$admin_viewadmins[14] = "Are you sure you want to delete this admin?";
	$admin_viewadmins[15] = "Delete Admin";
	$admin_viewadmins[16] = "Cancel";
	$admin_viewadmins[17] = "Delete Admin?";
	break;

case "admin_viewadmins_add":
	$admin_viewadmins_add[1] = "Add Admin Account";
	$admin_viewadmins_add[2] = "To create a new admin account, please complete the form below. This account will not be able to delete or modify the superadmin account.";
	$admin_viewadmins_add[3] = "Username:";
	$admin_viewadmins_add[4] = "Password:";
	$admin_viewadmins_add[5] = "Confirm Password:";
	$admin_viewadmins_add[6] = "Name:";
	$admin_viewadmins_add[7] = "Email:";
	$admin_viewadmins_add[8] = "Add Admin";
	$admin_viewadmins_add[9] = "Cancel";
	break;

case "admin_viewadmins_edit":
	$admin_viewadmins_edit[1] = "Edit Admin Account";
	$admin_viewadmins_edit[2] = "To edit this admin account, please modify the fields below. To change the password, complete the Old Password, New Password, and New Password Confirmation fields. If you do not wish to change this admin's password, leave those fields blank.";
	$admin_viewadmins_edit[3] = "Username:";
	$admin_viewadmins_edit[4] = "New Password:";
	$admin_viewadmins_edit[5] = "Confirm New Password:";
	$admin_viewadmins_edit[6] = "Name:";
	$admin_viewadmins_edit[7] = "Email:";
	$admin_viewadmins_edit[8] = "Edit Admin";
	$admin_viewadmins_edit[9] = "Cancel";





	$admin_viewadmins_edit[15] = "Old Password";
	break;

case "admin_viewplugins":
	$admin_viewplugins[1] = "View Plugins";
	$admin_viewplugins[2] = "Any SocialEngine plugins that you have installed will appear on this page. Note that some plugins may have user level-specific settings which are available on the <a href='admin_levels.php'>User Levels</a> page.";
	$admin_viewplugins[3] = "There are currently no plugins installed.";
	$admin_viewplugins[4] = "Install Plugin";
	$admin_viewplugins[5] = "Warning: You have not yet deleted install_";
	$admin_viewplugins[6] = "Install Upgrade";
	$admin_viewplugins[7] = "Upgrade Available!";
	$admin_viewplugins[8] = ".php. Leaving this file on your server is a security risk!";
	break;


case "admin_viewreports":
	$admin_viewreports[1] = "View Reports";
	$admin_viewreports[2] = "This page lists all of the reports your users have sent in regarding inappropriate content, system abuse, spam, and so forth. You can use the search field to look for reports that contain a particular word or phrase. Very old reports are periodically deleted by the system.";
	$admin_viewreports[3] = "details";
	$admin_viewreports[4] = "No reports were found.";
	$admin_viewreports[5] = "login & view";
	$admin_viewreports[6] = "delete";
	$admin_viewreports[7] = "Delete Selected";
	$admin_viewreports[8] = "Spam";
	$admin_viewreports[9] = "Content";
	$admin_viewreports[10] = "Abuse";
	$admin_viewreports[11] = "Other";
	$admin_viewreports[12] = "Details";
	$admin_viewreports[13] = "other";
	$admin_viewreports[14] = "Reason";
	$admin_viewreports[15] = "Filter";
	$admin_viewreports[16] = "Total Reports Found";
	$admin_viewreports[17] = "Page:";
	$admin_viewreports[18] = "ID";
	$admin_viewreports[19] = "Username";
	$admin_viewreports[20] = "Options";
	$admin_viewreports[21] = "spam";
	$admin_viewreports[22] = "content";
	$admin_viewreports[23] = "abuse";
	break;

case "admin_viewreports_edit":
	$admin_viewreports_edit[1] = "View Report";
	$admin_viewreports_edit[2] = "This report was sent to you by a concerned user. The report details are listed below, and you can view the subject matter of the report by clicking the link next to \"Object\".";
	$admin_viewreports_edit[3] = "Reporter:";
	$admin_viewreports_edit[4] = "Object:";
	$admin_viewreports_edit[5] = "Reason:";
	$admin_viewreports_edit[6] = "Details:";
	$admin_viewreports_edit[7] = "Delete Report";
	$admin_viewreports_edit[8] = "Cancel";
	$admin_viewreports_edit[9] = "Spam";
	$admin_viewreports_edit[10] = "Inappropriate Content";
	$admin_viewreports_edit[11] = "Abuse";
	$admin_viewreports_edit[12] = "Other";
	break;

case "admin_viewusers":
	$admin_viewusers[1] = "View Users";
	$admin_viewusers[2] = "This page lists all of the users that exist on your social network. For more information about a specific user, click on the \"edit\" link in its row. Click the \"login\" link to login as a specific user. Use the filter fields to find specific users based on your criteria. To view all users on your system, leave all the filter fields blank. ";
	$admin_viewusers[3] = "Username";
	$admin_viewusers[4] = "unverified";
	$admin_viewusers[5] = "Email";
	$admin_viewusers[6] = "Enabled";
	$admin_viewusers[7] = "Signup Date";
	$admin_viewusers[8] = "Options ";
	$admin_viewusers[9] = "Yes";
	$admin_viewusers[10] = "No";
	$admin_viewusers[11] = "edit";
	$admin_viewusers[12] = "delete";
	$admin_viewusers[13] = "login";
	$admin_viewusers[14] = "Filter";
	$admin_viewusers[15] = "ID";
	$admin_viewusers[16] = "Users Found";
	$admin_viewusers[17] = "Page:";
	$admin_viewusers[18] = "Delete User";
	$admin_viewusers[19] = "Are you sure you want to delete this user? Warning: Any plugin objects created by this user will also be deleted!";
	$admin_viewusers[20] = "Cancel";
	$admin_viewusers[21] = "No users were found.";
	$admin_viewusers[22] = "Verified";
	$admin_viewusers[23] = "Delete Selected";
	$admin_viewusers[24] = "User Level";
	$admin_viewusers[25] = "Subnetwork";
	$admin_viewusers[26] = "Default";
	break;

case "admin_viewusers_edit":
	$admin_viewusers_edit[1] = "Edit User:";
	$admin_viewusers_edit[2] = "To edit this users's account, make changes to the form below. If you want to temporarily prevent this user from logging in, you can set the user account to \"disabled\" below.";
	$admin_viewusers_edit[3] = "Only enter if you want to reset pass.";
	$admin_viewusers_edit[4] = "Total Friends:";
	$admin_viewusers_edit[5] = "Total Logins:";
	$admin_viewusers_edit[6] = "Messages Stored:";
	$admin_viewusers_edit[7] = "Last Login:";
	$admin_viewusers_edit[8] = "Email Address:";
	$admin_viewusers_edit[9] = "Username:";
	$admin_viewusers_edit[10] = "Password:";
	$admin_viewusers_edit[11] = "Enabled?";
	$admin_viewusers_edit[12] = "Save Changes";
	$admin_viewusers_edit[13] = "Cancel";
	$admin_viewusers_edit[14] = "Never";
	$admin_viewusers_edit[15] = "Profile Comments Made:";
	$admin_viewusers_edit[16] = "You must fill out all the fields.";
	$admin_viewusers_edit[17] = "Username and Password fields must be alphanumeric.";
	$admin_viewusers_edit[18] = "Please make sure you have entered a valid email address.";
	$admin_viewusers_edit[19] = "The username you have entered is already in use by another user.";
	$admin_viewusers_edit[20] = "The email address you have entered is already in use by another user.";
	$admin_viewusers_edit[21] = "Passwords must be at least 6 characters in length.";
	$admin_viewusers_edit[22] = "unverified";
	$admin_viewusers_edit[23] = "resend verification email";
	$admin_viewusers_edit[24] = "Enabled";
	$admin_viewusers_edit[25] = "Disabled";
	$admin_viewusers_edit[26] = "The number of invites left must be between 0 and 999.";
	$admin_viewusers_edit[27] = "Invites Remaining:";
	$admin_viewusers_edit[28] = "manually verify";
	$admin_viewusers_edit[29] = "Email verification has been resent.";
	$admin_viewusers_edit[30] = "User email has been manually verified.";
	$admin_viewusers_edit[31] = "User Level:";
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