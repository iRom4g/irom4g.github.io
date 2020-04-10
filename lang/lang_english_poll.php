<?
// SET GENERAL VARIABLES, AVAILABLE ON EVERY PAGE
$header_poll[1] = "Polls";
$header_poll[2] = "view all";
$header_poll[3] = "Untitled";
$header_poll[4] = "votes";

// ASSIGN ALL SMARTY GENERAL poll VARIABLES
reset($header_poll);
while(list($key, $val) = each($header_poll)) {
  $smarty->assign("header_poll".$key, $val);
}


// ASSIGN ALL CLASS/FUNCTION FILE VARIABLES
$functions_poll[1] = "polls";
$functions_poll[2] = "Created by ";
$functions_poll[3] = "Untitled Poll";



// SET LANGUAGE PAGE VARIABLES
switch ($page) {

  case "admin_poll":
	$admin_poll[1] = "Poll Settings";
	$admin_poll[2] = "Allowing users to create polls adds some extra interactivity and fun to your social network.<br>For more poll-related settings, see the <a href='admin_levels.php'>user levels</a> area.";
	$admin_poll[3] = "Your changes have been saved.";
	$admin_poll[4] = "Public Permission Defaults";
	$admin_poll[5] = "Select whether or not you want to let the public (visitors that are not logged-in) view polls on your social network. If you have given them the option, your users will be able to make their polls private even though you have made them publically viewable here. For more permissions settings, please visit the General Settings page.";
	$admin_poll[6] = "Yes, public visitors can view polls if allowed by the poll creators.";
	$admin_poll[7] = "No, public visitors can never view polls.";
	$admin_poll[8] = "Save Changes";
	break;

  case "admin_levels_pollsettings":
	$admin_levels_pollsettings[1] = "Poll Settings";
	$admin_levels_pollsettings[2] = "If you have allowed users to have create polls, you can adjust their details from this page.";
	$admin_levels_pollsettings[3] = "Polls Per Page";
	$admin_levels_pollsettings[4] = "How many polls will be shown per page? (Enter a number between 1 and 999)";
	$admin_levels_pollsettings[5] = "polls per page";
	$admin_levels_pollsettings[6] = "Save Changes";
	$admin_levels_pollsettings[7] = "Your changes have been saved.";
	$admin_levels_pollsettings[8] = "Your polls per page field must contain an integer between 1 and 999.";
	$admin_levels_pollsettings[9] = "Allow polls?";
	$admin_levels_pollsettings[10] = "Do you want to let users create polls? If set to no, all other settings on this page will not apply.";
	$admin_levels_pollsettings[11] = "Yes, allow users to create polls.";
	$admin_levels_pollsettings[12] = "No, do not allow users to create polls.";
	$admin_levels_pollsettings[13] = "<b>Search Privacy Options</b><br>If you enable this feature, users will be able to exclude their polls from search results. Otherwise, all polls will be included in search results.";
	$admin_levels_pollsettings[14] = "Yes, allow users to exclude their polls from search results.";
	$admin_levels_pollsettings[15] = "No, force all polls to be included in search results.";
	$admin_levels_pollsettings[16] = "Poll Privacy Options";
	$admin_levels_pollsettings[17] = "<b>Poll Privacy</b><br>Your users can choose from any of the options checked below when they decide who can see their polls. These options appear on your users' \"create poll\" and \"edit poll\" pages. If you do not check any options, everyone will be allowed to view polls.";
	$admin_levels_pollsettings[18] = "<b>Poll Comment Options</b><br>Your users can choose from any of the options checked below when they decide who can post comments on their polls. If you do not check any options, everyone will be allowed to post comments on polls.";
	$admin_levels_pollsettings[19] = "Editing User Level:";
	$admin_levels_pollsettings[20] = "You are currently editing this user level's settings. Remember, these settings only apply to the users that belong to this user level. When you're finished, you can edit the <a href='admin_levels.php'>other levels here</a>.";
	break;

case "admin_viewpolls":
	$admin_viewpolls[1] = "View Polls";
	$admin_viewpolls[2] = "This page lists all of the polls that users have created on your social network. You can use this page to monitor these polls and delete offensive or unwanted material if necessary. Entering criteria into the filter fields will help you find specific polls. Leaving the filter fields blank will show all the polls on your social network.";
	$admin_viewpolls[3] = "Title";
	$admin_viewpolls[4] = "Creator";
	$admin_viewpolls[5] = "Filter";
	$admin_viewpolls[6] = "ID";
	$admin_viewpolls[7] = "Title";
	$admin_viewpolls[8] = "Creator";
	$admin_viewpolls[9] = "Delete this poll?";
	$admin_viewpolls[10] = "Created";
	$admin_viewpolls[11] = "Options";
	$admin_viewpolls[12] = "view";
	$admin_viewpolls[13] = "delete";
	$admin_viewpolls[14] = "polls found";
	$admin_viewpolls[15] = "Page:";
	$admin_viewpolls[16] = "Delete poll";
	$admin_viewpolls[17] = "Are you sure you want to delete this poll?";
	$admin_viewpolls[18] = "Cancel";
	$admin_viewpolls[19] = "No polls were found.";
	$admin_viewpolls[20] = "Delete Selected";
	$admin_viewpolls[21] = "Are you sure you want to delete this poll?";
	$admin_viewpolls[22] = "Delete Poll";
	$admin_viewpolls[23] = "Cancel";
	$admin_viewpolls[24] = "Votes";
	break;

  case "poll":
	$poll[1] = "You do not have permission to view this file.";
	$poll[2] = "Created on";
	$poll[3] = "votes,";
	$poll[4] = "comments,";
	$poll[5] = "views";
	$poll[6] = "post comment";
	$poll[7] = "view results";
	$poll[8] = "Comments";
	$poll[9] = "Comment by";
	$poll[10] = "on";
	$poll[11] = "Anonymous";
	$poll[12] = "The user you're looking for does not exist.";
	$poll[13] = "An Error Has Occurred";
	$poll[14] = "Write Something...";
	$poll[15] = "Posting...";
	$poll[16] = "Please enter a message.";
	$poll[17] = "You have entered the wrong security code.";
	$poll[18] = "Post Comment";
	$poll[19] = "Enter the numbers you see in this image into the field to its right. This helps keep our site free of spam.";
	$poll[20] = "message";
	$poll[21] = "\\a\\t"; // USED IN A DATE FUNCTION, ADD SLASHES TO ESCAPE CHARACTERS
	$poll[22] = "Return";
	$poll[23] = "You must be logged in to view this page. <a href='login.php'>Click here</a> to login.";
	$poll[24] = "Vote";
	$poll[25] = "or";
	$poll[26] = "Back to";
	$poll[27] = "Posted on";
	$poll[28] = "at";
	$poll[29] = "views";
	$poll[30] = "'s polls";
	$poll[31] = "'s";
	$poll[32] = "polls";
	$poll[33] = "Send Message";
	$poll[34] = "Report Inappropriate Content";
	$poll[35] = "votes"; // USED IN JAVASCRIPT, DONT USE SLASHES, QUOTES OR APOSTROPHES
	$poll[36] = "back to options"; // USED IN JAVASCRIPT, DONT USE SLASHES, QUOTES OR APOSTROPHES
  break;

  case "polls":
	$polls[1] = "Please Login";
	$polls[2] = "You must be logged in to view this page. <a href='login.php'>Click here</a> to login.";
	$polls[3] = "Return";
	$polls[4] = "An Error Has Occurred";
	$polls[5] = "The page you are attempting to view does not exist or has been deleted.";
	$polls[6] = "Private Page";
	$polls[7] = "The page you are attempting to view is private.";
	$polls[8] = "polls";
	$polls[9] = "Last Page";
	$polls[10] = "viewing listing";
	$polls[11] = "of";
	$polls[12] = "viewing listings";
	$polls[13] = "Next Page";
	$polls[14] = "Anonymous";
	$polls[15] = "'s";
	$polls[16] = "Write something...";
	$polls[17] = "Posting...";
	$polls[18] = "Post Comment";
	$polls[19] = "\\a\\t"; // USED IN TIME FUNCTION, ESCAPE CHARS
	$polls[20] = "message";
	$polls[21] = "Created on";
	$polls[22] = "votes,";
	$polls[23] = "comments";
	$polls[24] = "view results";
	$polls[25] = "or";
	$polls[26] = "Vote";
	$polls[27] = "votes"; // USED IN JAVASCRIPT, DONT USE SLASHES, QUOTES OR APOSTROPHES
	$polls[28] = "back to options"; // USED IN JAVASCRIPT, DONT USE SLASHES, QUOTES OR APOSTROPHES
	break;

  case "poll_vote":
	$poll_vote[1] = "There was an error while attemting to vote on this poll.";
	$poll_vote[2] = "You must be a registered user to vote on this poll.";
	$poll_vote[3] = "Please select an option before voting.";
	$poll_vote[4] = "You have already voted on this poll.";
	$poll_vote[5] = "Sorry, this poll has been closed for voting.";
	break;

  case "user_poll":
	$user_poll[1] = "My Polls";
	$user_poll[2] = "Browse Other Polls";
	$user_poll[3] = "My Polls";
	$user_poll[4] = "Any polls you've created in the past can be managed here.";
	$user_poll[5] = "Create New Poll";
	$user_poll[6] = "Poll Name";
	$user_poll[7] = "Search my polls for:";
	$user_poll[8] = "Search";
	$user_poll[9] = "Last Page";
	$user_poll[10] = "viewing listing";
	$user_poll[11] = "of";
	$user_poll[12] = "viewing listings";
	$user_poll[13] = "Next Page";
	$user_poll[14] = "Search My Polls";
	$user_poll[15] = "Created";
	$user_poll[16] = "Options";
	$user_poll[17] = "votes,";
	$user_poll[18] = "comments,";
	$user_poll[19] = "views";
	$user_poll[20] = "edit poll";
	$user_poll[21] = "delete";
	$user_poll[22] = "No polls could be found with your search criteria.";
	$user_poll[23] = "You do not currently have any polls. <a href='user_poll_new.php'>Click here</a> to create one!";
	$user_poll[24] = "Untitled";
	$user_poll[25] = "open poll";
	$user_poll[26] = "close poll";
	break;

  case "user_poll_browse":
	$user_poll_browse[1] = "My Polls";
	$user_poll_browse[2] = "Browse Other Polls";
	$user_poll_browse[3] = "Browse Polls";
	$user_poll_browse[4] = "Check out some of the polls other people have created.";
	$user_poll_browse[5] = "Most Recent";
	$user_poll_browse[6] = "Most Votes";
	$user_poll_browse[7] = "Search polls for:";
	$user_poll_browse[8] = "Search";
	$user_poll_browse[9] = "Last Page";
	$user_poll_browse[10] = "viewing listing";
	$user_poll_browse[11] = "of";
	$user_poll_browse[12] = "viewing listings";
	$user_poll_browse[13] = "Next Page";
	$user_poll_browse[14] = "votes";
	$user_poll_browse[15] = "Posted";
	$user_poll_browse[16] = "comments,";
	$user_poll_browse[17] = "views";
	$user_poll_browse[18] = "Untitled Poll";
	$user_poll_browse[19] = "No polls could be found with your search criteria.";
	$user_poll_browse[20] = "No polls were found. <a href='user_poll_new.php'>Click here</a> to create one!";
	break;

  case "user_poll_delete":
	$user_poll_delete[1] = "My Polls";
	$user_poll_delete[2] = "Browse Other Polls";
	$user_poll_delete[3] = "Error";
	$user_poll_delete[4] = "The poll you've selected could not be found.";
	$user_poll_delete[5] = "Return";
	$user_poll_delete[6] = "Delete Poll";
	$user_poll_delete[7] = "Are you sure you want to delete this poll?";
	$user_poll_delete[8] = "Delete Poll";
	$user_poll_delete[9] = "Cancel";
	break;

  case "user_poll_edit":
	$user_poll_edit[1] = "My Polls";
	$user_poll_edit[2] = "Browse Other Polls";
	$user_poll_edit[3] = "Edit Poll";
	$user_poll_edit[4] = "Edit the details of this poll below.";
	$user_poll_edit[5] = "Title:";
	$user_poll_edit[6] = "Description:";
	$user_poll_edit[7] = "Edit Poll";
	$user_poll_edit[8] = "Show Privacy Settings";
	$user_poll_edit[9] = "Please provide a title for this new poll.";
	$user_poll_edit[10] = "Include this poll in search results?";
	$user_poll_edit[11] = "Yes, include this poll in search results.";
	$user_poll_edit[12] = "No, exclude this poll from search results.";
	$user_poll_edit[13] = "Who can see this poll?";
	$user_poll_edit[14] = "Who can comment on this poll?";
	$user_poll_edit[15] = "Cancel";
	$user_poll_edit[16] = "This poll has been opened for voting.";
	$user_poll_edit[17] = "This poll has been closed for voting. No one will be able to vote on it unless it is re-opened.";
	break;

  case "user_poll_new":
	$user_poll_new[1] = "My Polls";
	$user_poll_new[2] = "Browse Other Polls";
	$user_poll_new[3] = "Create New Poll";
	$user_poll_new[4] = "Give your new poll a title and description. If you're asking a question with this poll, you should put it in your title.";
	$user_poll_new[5] = "You cannot create more than twenty options."; // USED IN JAVASCRIPT, DONT USE ANY SLASHES OR QUOTES
	$user_poll_new[6] = "Option"; // USED IN JAVASCRIPT, DONT USE ANY SLASHES OR QUOTES
	$user_poll_new[7] = "Show Privacy Settings";
	$user_poll_new[8] = "Please provide a title for this new poll.";
	$user_poll_new[9] = "Include this poll in search results?";
	$user_poll_new[10] = "Yes, include this poll in search results.";
	$user_poll_new[11] = "No, exclude this poll from search results.";
	$user_poll_new[12] = "Who can see this poll?";
	$user_poll_new[13] = "Who can comment on this poll?";
	$user_poll_new[14] = "Please provide at least two possible options for this poll.";
	$user_poll_new[15] = "Please create a poll with twenty options or less.";
	$user_poll_new[16] = "Title:";
	$user_poll_new[17] = "Description:";
	$user_poll_new[18] = "Poll Options:";
	$user_poll_new[19] = "Option";
	$user_poll_new[20] = "Add Option";
	$user_poll_new[21] = "Create Poll";
	$user_poll_new[22] = "Cancel";
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