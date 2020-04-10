<?


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



// SET HEADER VARIABLES
$header[1] = "Search:";
$header[2] = "Go";
$header[3] = "Home";
$header[4] = "Search";
$header[5] = "Invite";
$header[6] = "Help";
$header[7] = "Hello,";
$header[8] = "Logout";
$header[9] = "Signup";
$header[10] = "Login";
$header[11] = "My Home";
$header[12] = "Profile";
$header[13] = "edit";


$header[16] = "Friends";

$header[18] = "Messages";
$header[19] = "Settings";
$header[20] = "Social Network";

$header[22] = "Default";
$header[23] = "An Error Has Occurred";
$header[24] = "You do not have permission to view this page. The user whose page you are trying to view has placed you on their blocklist.";
$header[25] = "Return";

// ASSIGN ALL SMARTY HEADER VARIABLES
reset($header);
while(list($key, $val) = each($header)) {
  $smarty->assign("header".$key, $val);
}


// ASSIGN ALL CLASS/FUNCTION FILE VARIABLES
$class_datetime[1] = "seconds ago";
$class_datetime[2] = "minutes ago";
$class_datetime[3] = "hours ago";
$class_datetime[4] = "days ago";
$class_datetime[5] = "weeks ago";
$class_datetime[6] = "months ago";
$class_datetime[7] = "years ago";

$class_upload[1] = "Upload failed. Please try again. If this problem persists, please contact the administrator for assistance.";
$class_upload[2] = "The size of your uploaded file is greater than the maximum allowed filesize.";
$class_upload[3] = "Your file's filetype is not allowed.";
$class_upload[4] = "Your image's dimensions are greater than the maximum allowed width and height.";

$class_user[1] = "Default";
$class_user[2] = "Your browser does not have Javascript enabled. Please enable Javascript and try again.";
$class_user[3] = "The login details you provided were invalid. Please try again.";
$class_user[4] = "The administrator has disabled your account.";
$class_user[5] = "You have not yet verified your email address. If you would like to have the email resent to you, please <a href='signup_verify.php'>click here</a>.";
$class_user[6] = "Please ensure you have completed all the required fields.";
$class_user[7] = "Please ensure your username is alphanumeric.";
$class_user[8] = "The username you selected is banned. Please choose another.";
$class_user[9] = "The username you selected is reserved. Please choose another.";
$class_user[10] = "The email address you provided is banned. Please provide another.";
$class_user[11] = "The email address you provided is not a valid email address.";
$class_user[12] = "The username you selected has already been taken. Please choose another.";
$class_user[13] = "The email address you provided has already been taken. Please provide another.";
$class_user[14] = "The old password you provided is incorrect. Please try again.";
$class_user[15] = "Please be sure you have provided the same password in both new password fields.";
$class_user[16] = "Please provide a password with at least 6 letters or numbers.";
$class_user[17] = "Please ensure your password is alphanumeric.";
$class_user[18] = "Please ensure you have filled out the fields in the proper format.";
$class_user[19] = "Your network has been changed from ";
$class_user[20] = " to ";
$class_user[21] = "Once you verify your email address, your network will be changed from ";
$class_user[22] = "You must enter a message.";
$class_user[23] = "The username you have specified is not a real user.";
$class_user[24] = "You may not send yourself a message.";
$class_user[25] = "The user you are trying to send a message to has placed you on their block list.";
$class_user[26] = "You are not friends with the user you are trying to send a message to. You can only send private messages to friends.";
$class_user[27] = "MONTH";
$class_user[28] = "DAY";
$class_user[29] = "YEAR";

$functions_general[1] = "Everyone";
$functions_general[2] = "All Registered Users";
$functions_general[3] = "Only My Friends and Everyone within My Subnetwork";
$functions_general[4] = "Only My Friends and Their Friends within My Subnetwork";
$functions_general[5] = "Only My Friends";
$functions_general[6] = "Only Me";
$functions_general[7] = "Nobody";
$functions_general[8] = "profiles";
$functions_general[9] = "'s Profile";



// SET LANGUAGE PAGE VARIABLES
switch ($page) {

  case "help":
	$help[1] = "FAQ";
	$help[2] = "Terms of Service";
	$help[3] = "Contact Us";
	$help[4] = "Frequently Asked Questions";
	$help[5] = "If you need help, the answer to your question is likely to be found on this page.";
	$help[6] = "Your Account";
	$help[7] = "I can't login, or I forgot my username or password.";
	$help[8] = "If you can't login, check to make sure that your \"caps lock\" key is off. Your username and password are CaSe SeNsItIvE. If you still cannot login, you can request to <a href='lostpass.php'>reset your password</a> or <a href='help_contact.php'>contact us</a>.";
	$help[9] = "How can I delete my account?";
	$help[10] = "If you are aboslutely sure that you want to delete your account, you can do so <a href='user_account_delete.php'>here</a>. Please note that your account will be permanently deleted and irrecoverable!";
	$help[11] = "How can I update my profile?";
	$help[12] = "To update your profile, you must visit the <a href='user_editprofile.php'>Edit Profile</a> page. You can move through the different parts of your profile by clicking the tabs at the top of the page.";
	$help[13] = "How can I update my email address?";
	$help[14] = "You can update your email address on the <a href='user_account.php'>My Account</a> page.";
	$help[15] = "How can I report an error or other problem with the site?";
	$help[16] = "To report an error or problem with the site, you can contact us <a href='help_contact.php'>here</a>.";
	$help[17] = "Reporting Abuse";
	$help[18] = "How can I deal with someone that is bothering me?";
	$help[19] = "If someone is bothering or harassing you, blocking them is usually the best solution. Visit the <a href='user_account.php'>Account Settings</a> page to learn how to block people. If someone continues to harass you despite your efforts, you can report them <a href='help_contact.php'>here</a>.";
	$help[20] = "How can I report spam or other inappropriate content?";
	$help[21] = "You can report spam, pornography, or any other inappropriate content <a href='help_contact.php'>here</a>.";
	$help[22] = "Privacy";
	$help[23] = "Is my information kept private?";
	$help[24] = "Absolutely. We do not share any personally identifying information about you to any third party.";
	$help[25] = "How can I make my profile private?";
	$help[26] = "If the administrator has enabled it, you can make your profile private by visiting the <a href='user_editprofile_settings.php'>Profile Privacy</a> page.";
	$help[27] = "How can I block users from contacting me?";
	$help[28] = "You can block people by adding their username to your blocked users list. Visit the <a href='user_account.php'>Account Settings</a> page to learn more about how to block people.";
	break;

  case "help_contact":
	$help_contact[1] = "Help Request:";
	$help_contact[2] = "Hello";
	$help_contact[3] = "You have received a support request:";
	$help_contact[4] = "Email:";
	$help_contact[5] = "Name:";
	$help_contact[6] = "Subject:";
	$help_contact[7] = "Your message has been received. We will assist you as soon as possible.";
	$help_contact[8] = "FAQ";
	$help_contact[9] = "Terms of Service";
	$help_contact[10] = "Contact Us";
	$help_contact[11] = "Contact Us";
	$help_contact[12] = "If you want to ask us a question directly, please submit your message with the following form.";
	$help_contact[13] = "Name:";
	$help_contact[14] = "Email Address:";
	$help_contact[15] = "Subject:";
	$help_contact[16] = "Message:";
	$help_contact[17] = "Send Message";
	$help_contact[18] = "Please provide a valid email address.";
	$help_contact[19] = "Please provide a detailed message.";
	$help_contact[20] = "Please provide your name.";
	break;

  case "help_tos":
	$help_tos[1] = "FAQ";
	$help_tos[2] = "Terms of Service";
	$help_tos[3] = "Contact Us";
	$help_tos[4] = "Terms of Service";
	break;

  case "home":
	$home[1] = "Welcome to the social network!";
	$home[2] = "This page is an example of what your social network's portal can look like. Various statistics about your social network can be displayed, as exemplified below. This gives users a convenient way to find the newest content and interesting people on your social network. You can also use this page to display news or any other content you place into the template.";
	$home[3] = "Member Login";
	$home[4] = "Email:";
	$home[5] = "Password:";
	$home[6] = "Login";
	$home[7] = "Signup";
	$home[8] = "'s Profile";
	$home[9] = "Hello,";
	$home[10] = "Logout";
	$home[11] = "Network Statistics";
	$home[12] = "Members:";
	$home[13] = "members";
	$home[14] = "Remember Me";



	$home[18] = "Friendships:";
	$home[19] = "friends";




	$home[24] = "Comments:";
	$home[25] = "comments";
	$home[26] = "Recent News";
	$home[27] = "Return";



	$home[31] = "Members Online";

	$home[33] = "Newest Members";
	$home[34] = "No members have signed up yet.";
	$home[35] = "Most Popular Members";
	$home[36] = "friends";
	$home[37] = "No members have become friends yet.";
	$home[38] = "Members Last Logged In";
	$home[39] = "No members have logged in yet.";
	$home[40] = "You must be logged in to view this page. <a href='login.php'>Click here</a> to login.";
	$home[41] = "An Error Has Occurred.";
	break;

  case "invite":
	$invite[1] = "Your invitations have been sent.";
	$invite[2] = "Invite Your Friends";
	$invite[3] = "Invite your friends to join! Enter up to 10 email addresses of your friends separated by commas in the field below.";
	$invite[4] = "You have";
	$invite[5] = "invite(s) remaining.";
	$invite[6] = "When they signup, they will be instantly added to your friends list.";
	$invite[7] = "To:";
	$invite[8] = "Separate multiple email addresses (up to 5) with commas.";
	$invite[9] = "Message:";
	$invite[10] = "Type your message here. (optional)";
	$invite[11] = "Send Invitation";
	$invite[12] = "You must be logged in to view this page. <a href='login.php'>Click here</a> to login.";
	$invite[13] = "An Error Has Occurred.";
	$invite[14] = "Return";
	$invite[15] = "Enter the numbers you see in this image into the field to its left. This helps keep our site free of spam.";
	$invite[16] = "Please make sure you have correctly entered the verification code.";
	$invite[17] = "Please enter at least one recipient email address for your invitation.";
	break;

  case "login":
	$login[1] = "<br>If you are still waiting to receive your verification email, <a href='signup_verify.php'>click here</a> to resend it.";
	$login[2] = "Remember Me?";
	$login[3] = "Account Login";
	$login[4] = "Email:";
	$login[5] = "Password:";
	$login[6] = "Login";
	$login[7] = "Forgot password?";
	$login[8] = "Welcome to the social network! If you already have an account, you can login below.<br>If you don't have an account, you can <a href='signup.php'>sign up here</a>!";
	break;

  case "lostpass":
	$lostpass[1] = "Lost Password";
	$lostpass[2] = "If you cannot login because you have forgotten your password, please enter your email address in the field below.";
	$lostpass[3] = "You have been sent an email with instructions how to reset your password. If the email does not arrive within several minutes, be sure to check your spam or junk mail folders.";
	$lostpass[4] = "The email you have entered was not found in the database. Please try again.";
	$lostpass[5] = "Email Address:";
	$lostpass[6] = "Send Password";
	$lostpass[7] = "Cancel";
	break;

  case "lostpass_reset":




	$lostpass_reset[5] = "Lost Password Reset";
	$lostpass_reset[6] = "Your password has been reset. <a href='login.php'>Click here</a> to login.";
	$lostpass_reset[7] = "Complete the form below to reset your password.";
	$lostpass_reset[8] = "New Password:";
	$lostpass_reset[9] = "Confirm New Password:";
	$lostpass_reset[10] = "Reset Password";
	$lostpass_reset[11] = "Cancel";
	$lostpass_reset[12] = "This link is invalid or expired. Please <a href='lostpass.php'>resubmit</a> your password request and follow the link sent to your email address.";
	break;

  case "profile":
	$profile[1] = "An Error Has Occurred";
	$profile[2] = "The profile you are looking for has been deleted or does not exist.";
	$profile[3] = "Private Profile";
	$profile[4] = "You do not have permission to view this profile.";
	$profile[5] = "'s Profile";
	$profile[6] = "'s profile";
	$profile[7] = "View";
	$profile[8] = "'s Friends";
	$profile[9] = "Add to My Friends";
	$profile[10] = "Send Message";
	$profile[11] = "Report this Person";
	$profile[12] = "Block this Person";
	$profile[13] = "update";
	$profile[14] = "is";
	$profile[15] = "Statistics";
	$profile[16] = "Profile Views:";
	$profile[17] = "views";
	$profile[18] = "Friends:";
	$profile[19] = "friends";
	$profile[20] = "\o\\n";	  //THESE CHARACTERS ARE BEING ESCAPED BECAUSE THEY ARE BEING USED IN A DATE FUNCTION
	$profile[21] = "is online.";
	$profile[22] = "Last Update:";
	$profile[23] = "Signup Date:";
	$profile[24] = "Recent Activity";
	$profile[25] = "view all";
	$profile[26] = "reply";





	$profile[32] = "comments";
	$profile[33] = "Anonymous";
	$profile[34] = "message";
	$profile[35] = "Friends";
	$profile[36] = "Status";
	$profile[37] = "years old";
	$profile[38] = "Comments";

	$profile[40] = "You must be logged in to view this page. <a href='login.php'>Click here</a> to login.";
	$profile[41] = "Remove from My Friends";
	$profile[42] = "Unblock this Person";
	$profile[43] = "Return";
	$profile[44] = "Write Something...";
	$profile[45] = "Posting...";
	$profile[46] = "Please enter a message.";
	$profile[47] = "You have entered the wrong security code.";
	$profile[48] = "Post Comment";
	$profile[49] = "Enter the numbers you see in this image into the field to its right. This helps keep our site free of spam.";
	break;

  case "profile_comments":
	$profile_comments[1] = "message";
	$profile_comments[2] = "\o\\n";	  //THESE CHARACTERS ARE BEING ESCAPED BECAUSE THEY ARE BEING USED IN A DATE FUNCTION
	$profile_comments[3] = "Comments About";

	$profile_comments[5] = "Back to";
	$profile_comments[6] = "'s Profile";
	$profile_comments[7] = "Last Page";
	$profile_comments[8] = "showing comment";
	$profile_comments[9] = "of";
	$profile_comments[10] = "showing comments";
	$profile_comments[11] = "Next Page";
	$profile_comments[12] = "Anonymous";

	$profile_comments[14] = "Write Something...";
	$profile_comments[15] = "Posting...";
	$profile_comments[16] = "Please enter a message.";
	$profile_comments[17] = "You have entered the wrong security code.";
	$profile_comments[18] = "Post Comment";
	$profile_comments[19] = "Enter the numbers you see in this image into the field to its right. This helps keep our site free of spam.";
	$profile_comments[20] = "An Error Has Occurred";
	$profile_comments[21] = "The profile you are looking for has been deleted or does not exist.";
	$profile_comments[22] = "You must be logged in to view this page. <a href='login.php'>Click here</a> to login.";
	$profile_comments[23] = "Return";
	break;

  case "profile_friends":
	$profile_friends[1] = "'s Friends";
	$profile_friends[2] = "The following people are listed as ";
	$profile_friends[3] = "'s friends.";
	$profile_friends[4] = " has not yet added any friends.";
	$profile_friends[5] = "Last Page";
	$profile_friends[6] = "viewing friends";
	$profile_friends[7] = "of";
	$profile_friends[8] = "Next Page";
	$profile_friends[9] = "'s Profile";
	$profile_friends[10] = "View Profile";
	$profile_friends[11] = "You must be logged in to view this page. <a href='login.php'>Click here</a> to login.";
	$profile_friends[12] = "Send Message";
	$profile_friends[13] = "Return";

	$profile_friends[15] = "Username:";
	$profile_friends[16] = "Last Update:";
	$profile_friends[17] = "Last Login:";
	$profile_friends[18] = "An Error Has Occurred";
	$profile_friends[19] = "The user you are looking for has been deleted or does not exist.";
	break;

  case "search":
	$search[1] = "Search";
	$search[2] = "Search the social network.";
	$search[3] = "Search for:";
	$search[4] = "Search";
	$search[5] = "Advanced Search";
	$search[6] = "No results for";
	$search[7] = "were found.";
	$search[8] = "results";
	$search[9] = "including";
	$search[10] = "profiles";
	$search[11] = "Currently Online";


	$search[14] = "Last Page";
	$search[15] = "Displaying";
	$search[16] = "of";
	$search[17] = "matches";
	$search[18] = "seconds";
	$search[19] = "Next Page";






	$search[26] = "You must be logged in to view this page. <a href='login.php'>Click here</a> to login.";
	$search[27] = "An Error Has Occurred.";
	$search[28] = "Return";
	break;

  case "search_advanced":
	$search_advanced[1] = "Advanced Search Members";
	$search_advanced[2] = "Search through our members with your own keywords and criteria.";
	$search_advanced[3] = "Search Criteria";
	$search_advanced[4] = "Update Results";
	$search_advanced[5] = "Last Update (Asc)";
	$search_advanced[6] = "Last Login (Asc)";
	$search_advanced[7] = "Last Signup (Asc)";
	$search_advanced[8] = "No people matched your search criteria.";
	$search_advanced[9] = "Online";
	$search_advanced[10] = "Last Page";
	$search_advanced[11] = "viewing result";
	$search_advanced[12] = "viewing results";
	$search_advanced[13] = "of";
	$search_advanced[14] = "Next Page";
	$search_advanced[15] = "'s Profile";
	$search_advanced[16] = "Browsing members that match";
	$search_advanced[17] = "We found";
	$search_advanced[18] = "member(s) with profiles that match";
	$search_advanced[19] = "You must be logged in to view this page. <a href='login.php'>Click here</a> to login.";
	$search_advanced[20] = "An Error Has Occurred.";
	$search_advanced[21] = "Return";
	$search_advanced[22] = "Sort Results By:";
	$search_advanced[23] = "Last Update (Desc)";
	$search_advanced[24] = "Last Login (Desc)";
	$search_advanced[25] = "Last Signup (Desc)";
	break;

  case "signup":
	$signup[1] = "You must agree to the terms of service to signup.";
	$signup[2] = "Please make sure you have correctly entered the verification code.";
	$signup[3] = "Language:";
	$signup[4] = "OR";
	$signup[5] = "The invite code and email address combination you have entered is invalid.";
	$signup[6] = "The invite code you have entered is invalid.";	












	$signup[19] = "Signup Complete!";
	$signup[20] = "Congratulations! You have successfully created your account. ";
	$signup[21] = "You will be able to login after you have been approved by an administrator.";
	$signup[22] = "Your password has been sent to the email address you provided.";
	$signup[23] = "Click the button below to login.";
	$signup[24] = "An email has been sent to the email address you provided. Please follow the link in that email to verify your email address.";
	$signup[25] = "Continue...";
	$signup[26] = "Return to Home";
	$signup[27] = "Invite Your Friends";
	$signup[28] = "Invite your friends to join! Enter the email addresses of your friends separated by commas in the field below.";
	$signup[29] = "Send Invitations To:";
	$signup[30] = "Enter your friends' email addresses (up to 5) below, separated by commas.";
	$signup[31] = "Your Message";
	$signup[32] = "If you want to include a personal message in your invitations, enter it here. (optional)";
	$signup[33] = "Send Invitations";
	$signup[34] = "Skip This Step";
	$signup[35] = "Upload Your Photo";
	$signup[36] = "Upload a photo of yourself from your computer. This will be the icon other people will see on your profile.";
	$signup[37] = "Upload";
	$signup[38] = "To upload your photo, click the \"Browse\" button, locate the photo on your computer, and click the \"Upload\" button. Your photo must be less than 4 MB in size and must be one of these types:";
	$signup[39] = "Keep This Photo";
	$signup[40] = "Create Your Profile";
	$signup[41] = "Tell us a little more about yourself. Fields marked with an asterisk (*) are required.";
	$signup[42] = "Create Your Account";
	$signup[43] = "Welcome to the social network! To create your account, please provide the following information.";
	$signup[44] = "Login Information";
	$signup[45] = "Email Address:";
	$signup[46] = "You will use your email address to login.";
	$signup[47] = "Password:";
	$signup[48] = "Enter a password with at least 6 characters.";
	$signup[49] = "Password Again:";
	$signup[50] = "Enter your password again for confirmation.";
	$signup[51] = "Account Information";
	$signup[52] = "Username:";
	$signup[53] = "This is the name others see when they view your profile. If you decide to change your username, you must enter one that has not already been taken by another person.";
	$signup[54] = "This will be the name people see when they view your profile.";
	$signup[55] = "Timezone:";
	$signup[56] = "Security Information";
	$signup[57] = "Invitation Code:";
	$signup[58] = "Security Code:";
	$signup[59] = "Enter the numbers you see in this image into the field to its left. This helps keep our site free of spam.";
	$signup[60] = "I have read and agree to the <a href='help_tos.php' target='_blank'>terms of service</a>.";
	break;
	
  case "signup_verify":
	$signup_verify[1] = "Another user has already taken this email address.";


	$signup_verify[4] = "There is no user in the system with that email address. Please <a href='home.php'>click here</a> to return to the home page.";
	$signup_verify[5] = "The email address you have provided is already verified. If you have forgotten your password, please <a href='lostpass.php'>click here</a> to have it sent to you.";
	$signup_verify[6] = "Email Address Verification";
	$signup_verify[7] = "Congratulations! You have successfully verified your email address.";
	$signup_verify[8] = "Click the button below to login.";
	$signup_verify[9] = "Continue To Login...";
	$signup_verify[10] = "To have the email verification resent, enter your email address in the field below. If you have reached this page in error, <a href='home.php'>click here</a> to return to the home page.";
	$signup_verify[11] = "Your Email Address";
	$signup_verify[12] = "Resend Verification";
	$signup_verify[13] = "A new verification email has been sent to the email address you provided. Please follow the link within to verify your account.";
	break;

  case "user_account":
	$user_account[1] = "Language:";
	$user_account[2] = "Recent Activity Privacy:";
	$user_account[3] = "Which of the following things do you want to have published about you in the <a href='user_home.php'>recent activity feed</a>?<br>Note that changing this setting will only affect future news feed items.";
	$user_account[4] = "Note that changing your username will clear your recent activity feed.";





	$user_account[10] = "Your changes have been saved. Before your new email becomes active, you must follow the link in the email sent to you.";
	$user_account[11] = "Your changes have been saved.";
	$user_account[12] = "Settings";
	$user_account[13] = "Change Password";
	$user_account[14] = "Delete Account";
	$user_account[15] = "Account Settings";
	$user_account[16] = "If necessary, you can make changes to your account settings below.";
	$user_account[17] = "Email Address:";
	$user_account[18] = "Waiting for verification for";
	$user_account[19] = "Changing this field may change which network you belong to.<br>You currently belong to the network:";
	$user_account[20] = "Username:";
	$user_account[21] = "This is the name others see when they view your profile. If you decide to change your username, you must enter one that has not already been taken by another person.";
	$user_account[22] = "Timezone:";










	$user_account[33] = "Block List:";
	$user_account[34] = "Adding a person to your block list makes your profile (and all of your other content) unviewable to them. Any connections you have to the blocked person will be canceled. To add someone to your block list, click the &quot;Add New Person&quot; link and enter their username. If you enter a username of someone that does not exist or has been deleted, they will not be added to your block list.";
	$user_account[35] = "Add New Person";
	$user_account[36] = "Save Changes";
	break;

  case "user_account_delete":
	$user_account_delete[1] = "Settings";
	$user_account_delete[2] = "Change Password";
	$user_account_delete[3] = "Delete Account";
	$user_account_delete[4] = "Delete Account?";
	$user_account_delete[5] = "Are you sure you want to delete your account? All of your account data, including any files you have uploaded, will be permanently deleted! Upon deletion of your account, you will be automatically logged out.";
	$user_account_delete[6] = "Delete My Account";
	$user_account_delete[7] = "Cancel";
	break;

  case "user_account_pass":





	$user_account_pass[6] = "Your changes have been saved.";
	$user_account_pass[7] = "Settings";
	$user_account_pass[8] = "Change Password";
	$user_account_pass[9] = "Delete Account";
	$user_account_pass[10] = "Change Password";
	$user_account_pass[11] = "If you want to change your account password, please complete the following form.";
	$user_account_pass[12] = "Old Password:";
	$user_account_pass[13] = "New Password:";
	$user_account_pass[14] = "New Password Again:";
	$user_account_pass[15] = "Save Changes";
	break;

  case "user_editprofile":
	$user_editprofile[1] = "Changing this field may change which network you belong to.<br>You currently belong to:";



	$user_editprofile[5] = "Your changes have been saved!";
	$user_editprofile[6] = "Status";
	$user_editprofile[7] = "Photo";

	$user_editprofile[9] = "Comments";
	$user_editprofile[10] = "Profile Settings";
	$user_editprofile[11] = "Edit Profile:";
	$user_editprofile[12] = "Please provide some information about yourself.";
	$user_editprofile[13] = "Save Changes";
	break;

  case "user_editprofile_comments":
	$user_editprofile_comments[1] = "Status";
	$user_editprofile_comments[2] = "Photo";
	$user_editprofile_comments[3] = "\o\\n";  //THESE CHARACTERS ARE BEING ESCAPED BECAUSE THEY ARE BEING USED IN A DATE FUNCTION
	$user_editprofile_comments[4] = "Comments";
	$user_editprofile_comments[5] = "Profile Settings";
	$user_editprofile_comments[6] = "Profile Comments";
	$user_editprofile_comments[7] = "The comments below have been posted on your profile by other people. To delete comments, click their checkboxes and then click the \"Delete Selected\" button below the comment list.";
	$user_editprofile_comments[8] = "select all comments";
	$user_editprofile_comments[9] = "Last Page";
	$user_editprofile_comments[10] = "showing comment";
	$user_editprofile_comments[11] = "of";
	$user_editprofile_comments[12] = "showing comments";
	$user_editprofile_comments[13] = "Next Page";
	$user_editprofile_comments[14] = "No comments have been posted on your profile.";
	$user_editprofile_comments[15] = "Anonymous";
	$user_editprofile_comments[16] = "Delete Selected";
	break;

  case "user_editprofile_photo":





	$user_editprofile_photo[6] = "Status";
	$user_editprofile_photo[7] = "Photo";

	$user_editprofile_photo[9] = "Comments";
	$user_editprofile_photo[10] = "Profile Settings";
	$user_editprofile_photo[11] = "Edit My Photo";
	$user_editprofile_photo[12] = "This photo is your personal icon and will be displayed on your profile.";
	$user_editprofile_photo[13] = "remove photo";
	$user_editprofile_photo[14] = "Upload";
	$user_editprofile_photo[15] = "Images must be less than 4 MB in size with one of the following extensions:";
	$user_editprofile_photo[16] = "Current Photo";
	$user_editprofile_photo[17] = "Upload Photo";
	break;

  case "user_editprofile_settings":
	$user_editprofile_settings[1] = "Your changes have been saved.";
	$user_editprofile_settings[2] = "Status";
	$user_editprofile_settings[3] = "Photo";

	$user_editprofile_settings[5] = "Comments";
	$user_editprofile_settings[6] = "Profile Settings";
	$user_editprofile_settings[7] = "Edit Profile Settings";
	$user_editprofile_settings[8] = "Edit profile settings such as your profile's style and privacy.";
	$user_editprofile_settings[9] = "Save Changes";
	$user_editprofile_settings[10] = "Profile Style";
	$user_editprofile_settings[11] = "Add your own CSS code below to give your profile a more personalized look.<br>The contents of the text area below will be output between &lt;style&gt; tags on your profile.";
	$user_editprofile_settings[12] = "Profile Privacy";
	$user_editprofile_settings[13] = "Who can view your profile?";
	$user_editprofile_settings[14] = "Comments Privacy";
	$user_editprofile_settings[15] = "Who can post comments on your profile?";
	$user_editprofile_settings[16] = "Search Privacy";
	$user_editprofile_settings[17] = "Do you want to be included in search results?";
	$user_editprofile_settings[18] = "Yes, include my profile in search results.";
	$user_editprofile_settings[19] = "No, do not include my profile in search results.";
	$user_editprofile_settings[20] = "Profile Notification";
	$user_editprofile_settings[21] = "Do you want to be notified by email when someone posts a comment on your profile?";
	$user_editprofile_settings[22] = "Yes, notify me when someone writes a comment on my profile.";
	break;

  case "user_editprofile_status":
	$user_editprofile_status[1] = "Your status has been updated.";
	$user_editprofile_status[2] = "Status";
	$user_editprofile_status[3] = "Photo";

	$user_editprofile_status[5] = "Comments";
	$user_editprofile_status[6] = "Profile Settings";
	$user_editprofile_status[7] = "Update My Status";
	$user_editprofile_status[8] = "Update your status message to let your friends know what you're up to.";
	$user_editprofile_status[9] = "Update";
	$user_editprofile_status[10] = "is";
	break;

  case "user_friends":
	$user_friends[1] = "Current Friends";
	$user_friends[2] = "Friend Requests";
	$user_friends[3] = "My Friends";
	$user_friends[4] = "Everyone currently on your friend list is shown here. To search for a specific friend, enter a keyword in the field below.";
	$user_friends[5] = "Your friend list is empty.";
	$user_friends[6] = "Search my friends:";
	$user_friends[7] = "Search";
	$user_friends[8] = "Sort by:";
	$user_friends[9] = "Recently Updated";
	$user_friends[10] = "Recently Logged In";
	$user_friends[11] = "Friend Type";
	$user_friends[12] = "None of your friends match your search criteria.";
	$user_friends[13] = "Last Page";
	$user_friends[14] = "viewing friend";
	$user_friends[15] = "viewing friends";
	$user_friends[16] = "of";
	$user_friends[17] = "Next Page";
	$user_friends[18] = "'s Profile";
	$user_friends[19] = "Last Update:";
	$user_friends[20] = "Last Login:";
	$user_friends[21] = "Friend Type:";
	$user_friends[22] = "Details:";
	$user_friends[23] = "Edit Friendship";
	$user_friends[24] = "Remove Friend";
	$user_friends[25] = "Send Message";
	$user_friends[26] = "View Friends";
	$user_friends[27] = "Friend Settings";
	$user_friends[28] = "Outgoing Friend Requests";
	break;

  case "user_friends_add":
	$user_friends_add[1] = "An Error Has Occurred";
	$user_friends_add[2] = "The person you are looking for has been deleted or does not exist.";
	$user_friends_add[3] = "This user has placed you on their blocklist.";
	$user_friends_add[4] = "You may not add yourself as a friend.";
	$user_friends_add[5] = "This user is already your friend.";
	$user_friends_add[6] = "This user is waiting for a confirmation from you. <a href='user_friends_requests.php'>Click here</a> to view your friend requests.";
	$user_friends_add[7] = "A message has been sent to this user to confirm your friendship.";
	$user_friends_add[8] = "This user has been added to your friendlist.";
	$user_friends_add[9] = "Add Friend";
	$user_friends_add[10] = "You are about to add";
	$user_friends_add[11] = "to your friends.<br>If you add this person to your friends, they will be able to see your profile (even if it's viewable by friends only).";
	$user_friends_add[12] = "Return to Profile";
	$user_friends_add[13] = "Tell us more about how you know";
	$user_friends_add[14] = "Friend Type:";
	$user_friends_add[15] = "Other:";
	$user_friends_add[16] = "Friend Type:";
	$user_friends_add[17] = "How do you know this person?";
	$user_friends_add[18] = "Add Friend";
	$user_friends_add[19] = "Cancel";
	$user_friends_add[20] = "You have already sent a friend request to this user. They must confirm the friendship before you can become friends.";
	$user_friends_add[21] = "You are not allowed to add this person to your friends.";
	$user_friends_add[22] = "Return";
	break;

  case "user_friends_block":
	$user_friends_block[1] = "The person you are trying to block does not exist or has been deleted.";
	$user_friends_block[2] = "You cannot block yourself.";
	$user_friends_block[3] = "You have already blocked this person.";
	$user_friends_block[4] = "An Error Has Occurred";
	$user_friends_block[5] = "You have successfully blocked";
	$user_friends_block[6] = "Block";
	$user_friends_block[7] = "Are you sure you want to block";
	$user_friends_block[8] = "?";
	$user_friends_block[9] = "Block User";
	$user_friends_block[10] = "Cancel";
	$user_friends_block[11] = "Return";
	$user_friends_block[12] = "Blocked.";
	$user_friends_block[13] = "You have not blocked this person.";
	$user_friends_block[14] = "You cannot unblock yourself.";
	$user_friends_block[15] = "The person you are trying to unblock does not exist or has been deleted.";
	$user_friends_block[16] = "You have successfully unblocked";
	$user_friends_block[17] = "Unblock";
	$user_friends_block[18] = "Are you sure you want to unblock";
	$user_friends_block[19] = "Unblock User";
	$user_friends_block[20] = "Unblocked.";
	$user_friends_block[21] = "Return";
	break;

  case "user_friends_confirm":
	$user_friends_confirm[1] = "An Error Has Occurred";
	$user_friends_confirm[2] = "The user you're looking for doesn't exist!";
	$user_friends_confirm[3] = "Current Friends";
	$user_friends_confirm[4] = "Friend Requests";
	$user_friends_confirm[5] = "Friendship Details";
	$user_friends_confirm[6] = "Tell us more about how you know";
	$user_friends_confirm[7] = "Friend Type:";
	$user_friends_confirm[8] = "Other";
	$user_friends_confirm[9] = "Specify:";
	$user_friends_confirm[10] = "Friend Type:";
	$user_friends_confirm[11] = "How do you know";
	$user_friends_confirm[12] = "?";
	$user_friends_confirm[13] = "Edit Friendship";
	$user_friends_confirm[14] = "Cancel";
	$user_friends_confirm[15] = "Return";
	$user_friends_confirm[16] = "Friend Settings";
	$user_friends_confirm[17] = "Outgoing Friend Requests";
	break;

  case "user_friends_requests":
	$user_friends_requests[1] = "Current Friends";
	$user_friends_requests[2] = "Friend Requests";
	$user_friends_requests[3] = "Friend Requests";
	$user_friends_requests[4] = "When other people request to become your friend, their requests appear here. You can approve or reject their requests.";
	$user_friends_requests[5] = "You do not have any friend requests at this time.";
	$user_friends_requests[6] = "Last Update:";
	$user_friends_requests[7] = "Last Login:";
	$user_friends_requests[8] = "Friend Type:";
	$user_friends_requests[9] = "Details:";
	$user_friends_requests[10] = "Confirm Friendship";
	$user_friends_requests[11] = "Reject Friendship";
	$user_friends_requests[12] = "Send Message";
	$user_friends_requests[13] = "Last Page";
	$user_friends_requests[14] = "viewing friend";
	$user_friends_requests[15] = "viewing friends";
	$user_friends_requests[16] = "of";
	$user_friends_requests[17] = "Next Page";
	$user_friends_requests[18] = "Friend Settings";
	$user_friends_requests[19] = "Outgoing Friend Requests";
	break;

  case "user_friends_requests_outgoing":
	$user_friends_requests_outgoing[1] = "Current Friends";
	$user_friends_requests_outgoing[2] = "Friend Requests";
	$user_friends_requests_outgoing[3] = "Outgoing Friend Requests";
	$user_friends_requests_outgoing[4] = "When you ask other people to be your friend, your pending requests will appear here until they are approved or rejected.";
	$user_friends_requests_outgoing[5] = "You do not have any friend requests at this time.";
	$user_friends_requests_outgoing[6] = "Last Update:";
	$user_friends_requests_outgoing[7] = "Last Login:";
	$user_friends_requests_outgoing[8] = "Friend Type:";
	$user_friends_requests_outgoing[9] = "Details:";
	$user_friends_requests_outgoing[10] = "Confirm Friendship";
	$user_friends_requests_outgoing[11] = "Cancel Friendship Request";
	$user_friends_requests_outgoing[12] = "Send Message";
	$user_friends_requests_outgoing[13] = "Last Page";
	$user_friends_requests_outgoing[14] = "viewing friend";
	$user_friends_requests_outgoing[15] = "viewing friends";
	$user_friends_requests_outgoing[16] = "of";
	$user_friends_requests_outgoing[17] = "Next Page";
	$user_friends_requests_outgoing[18] = "Friend Settings";
	$user_friends_requests_outgoing[19] = "Outgoing Friend Requests";
	break;

  case "user_friends_settings":
	$user_friends_settings[1] = "Current Friends";
	$user_friends_settings[2] = "Friend Requests";
	$user_friends_settings[3] = "Friend Settings";
	$user_friends_settings[4] = "Friend Settings";
	$user_friends_settings[5] = "Edit your friend settings such as email notifications on this page.";
	$user_friends_settings[6] = "Your changes have been saved.";
	$user_friends_settings[7] = "Friendship Notification";
	$user_friends_settings[8] = "Do you want to be notified by email when someone requests friendship with you?";
	$user_friends_settings[9] = "Yes, notify me when someone invites me to become friends.";
	$user_friends_settings[10] = "Save Changes";
	$user_friends_settings[11] = "Outgoing Friend Requests";
	break;

  case "user_home":
	$user_home[1] = "What's New?";
	$user_home[2] = "My Profile Link:";
	$user_home[3] = "Notifications";
	$user_home[4] = "Update your status.";
	$user_home[5] = "profile views";
	$user_home[6] = "reset";
	$user_home[7] = "save";
	$user_home[8] = "cancel";
	$user_home[9] = "There has not been any recent activity on the social network.";
	$user_home[10] = "Members Online";
	$user_home[11] = "My Status";
	$user_home[12] = "update";
	$user_home[13] = "I am";
	$user_home[14] = "new messages";
	$user_home[15] = "new friend request(s)";

	$user_home[17] = "View My Profile";

	$user_home[19] = "Edit My Profile";

	$user_home[21] = "View My Friends";





	$user_home[27] = "Browse For People";

	$user_home[29] = "Recent News";
	$user_home[30] = "There have been no news announcements posted recently.";
	break;

  case "user_messages":
	$user_messages[1] = "Inbox";
	$user_messages[2] = "Sent Messages";
	$user_messages[3] = "My Message Inbox";
	$user_messages[4] = "You have";
	$user_messages[5] = "unread message(s)";
	$user_messages[6] = "in your inbox.";
	$user_messages[7] = "Compose New Message";
	$user_messages[8] = "Your message was sent successfully.";
	$user_messages[9] = "Last Page";
	$user_messages[10] = "viewing message";
	$user_messages[11] = "viewing messages";
	$user_messages[12] = "of";
	$user_messages[13] = "Next Page";
	$user_messages[14] = "Your inbox is empty. When you receive messages in the future, they will be listed here.";
	$user_messages[15] = "From";
	$user_messages[16] = "Subject";
	$user_messages[17] = "Options";
	$user_messages[18] = "'s Profile";
	$user_messages[19] = "reply";
	$user_messages[20] = "delete";
	$user_messages[21] = "Delete Selected";
	$user_messages[22] = "Message Settings";
	break;

  case "user_messages_new":
	$user_messages_new[1] = "Please input valid users to send message to.";
	$user_messages_new[2] = "Please enter a message.";
	$user_messages_new[3] = "Please limit your recipients to five (5) users.";
	$user_messages_new[4] = "Message Settings";
	$user_messages_new[5] = "Inbox";
	$user_messages_new[6] = "Sent Messages";
	$user_messages_new[7] = "Compose New Message";
	$user_messages_new[8] = "Create your new message with the form below.";
	$user_messages_new[9] = "From:";
	$user_messages_new[10] = "To:";
	$user_messages_new[11] = "Subject:";
	$user_messages_new[12] = "Message:";
	$user_messages_new[13] = "Send Message";
	$user_messages_new[14] = "Cancel";
	$user_messages_new[15] = "Please enter a recipient.";
	$user_messages_new[16] = "is not a valid username.";
	$user_messages_new[17] = "You are not allowed to message user";
	break;

  case "user_messages_outbox":
	$user_messages_outbox[1] = "Inbox";
	$user_messages_outbox[2] = "Sent Messages";
	$user_messages_outbox[3] = "My Sent Messages";
	$user_messages_outbox[4] = "You have";
	$user_messages_outbox[5] = "total message(s) in your outbox.";
	$user_messages_outbox[6] = "Compose New Message";
	$user_messages_outbox[7] = "Last Page";
	$user_messages_outbox[8] = "viewing message";
	$user_messages_outbox[9] = "viewing messages";
	$user_messages_outbox[10] = "of";
	$user_messages_outbox[11] = "Next Page";
	$user_messages_outbox[12] = "Your outbox is empty. When you send messages in the future, they will be listed here.";
	$user_messages_outbox[13] = "To";
	$user_messages_outbox[14] = "Subject";
	$user_messages_outbox[15] = "Options";
	$user_messages_outbox[16] = "'s Profile";
	$user_messages_outbox[17] = "delete";
	$user_messages_outbox[18] = "Delete Selected";
	$user_messages_outbox[19] = "Message Settings";
	break;

  case "user_messages_settings":
	$user_messages_settings[1] = "Inbox";
	$user_messages_settings[2] = "Sent Messages";
	$user_messages_settings[3] = "Message Settings";
	$user_messages_settings[4] = "Message Settings";
	$user_messages_settings[5] = "Edit your message settings such as email notifications on this page.";
	$user_messages_settings[6] = "Your changes have been saved.";
	$user_messages_settings[7] = "Message Notification";
	$user_messages_settings[8] = "Do you want to be notified by email when someone sends you a message?";
	$user_messages_settings[9] = "Yes, notify me when someone sends me a message.";
	$user_messages_settings[10] = "Save Changes";
	break;

  case "user_messages_view":
	$user_messages_view[1] = "Inbox";
	$user_messages_view[2] = "Sent Messages";
	$user_messages_view[3] = "To:";
	$user_messages_view[4] = "Sent:";
	$user_messages_view[5] = "Close";
	$user_messages_view[6] = "Reply";
	$user_messages_view[7] = "Delete";
	$user_messages_view[8] = "Conversation History";
	$user_messages_view[9] = "Sent";
	$user_messages_view[10] = "Received";
	$user_messages_view[11] = "Message Settings";
	break;

  case "user_report":
	$user_report[1] = "Notify an Administrator";
	$user_report[2] = "Please complete the following form to notify the administration.";
	$user_report[3] = "What are you reporting?";
	$user_report[4] = "Spam";
	$user_report[5] = "Inappropriate content";
	$user_report[6] = "Abuse";
	$user_report[7] = "Other";
	$user_report[8] = "Please give us a short description of the problem.";
	$user_report[9] = "Send Report";
	$user_report[10] = "Cancel";
	$user_report[11] = "An Error Has Occurred";
	$user_report[12] = "You must be logged in to perform this action.";
	$user_report[13] = "Return";
	break;

  case "user_report_sent":
	$user_report_sent[1] = "Report Received";
	$user_report_sent[2] = "Thank you for your report. We have received it and will process it as soon as possible.";
	$user_report_sent[3] = "Return";
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