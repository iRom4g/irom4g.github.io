<?
// SET GENERAL VARIABLES, AVAILABLE ON EVERY PAGE
$header_event[1] = "Events";
$header_event[2] = "Calendar";

// ASSIGN ALL SMARTY GENERAL EVENT VARIABLES
reset($header_event);
while(list($key, $val) = each($header_event)) {
  $smarty->assign("header_event".$key, $val);
}



// ASSIGN ALL CLASS/FUNCTION FILE VARIABLES
$functions_event[1] = "Everyone";
$functions_event[2] = "All Registered Users";
$functions_event[3] = "Only Invited Users, Their Friends, and Their Friends' Friends";
$functions_event[4] = "Only Invited Users and Their Friends";
$functions_event[5] = "Only Invited Users and Event Creator's Friends";
$functions_event[6] = "Only Invited Users";
$functions_event[7] = "Only Event Creator";
$functions_event[8] = "Nobody";
$functions_event[9] = "events/event photos";
$functions_event[10] = "Photo in event: ";
$functions_event[11] = " new event invite(s)";

$class_event[1] = "You do not have enough free space to upload ";



// SET LANGUAGE PAGE VARIABLES
switch ($page) {

  case "admin_event":
	$admin_event[1] = "General Event Settings";
	$admin_event[2] = "This page contains general event settings that affect your entire social network.";
	$admin_event[3] = "Your changes have been saved.";
	$admin_event[4] = "Subject";
	$admin_event[5] = "Message";
	$admin_event[6] = "Event Invitation Email";
	$admin_event[7] = "This is the email that gets sent to a user when they are invited to attend an event. For more system emails, please visit the <a href='admin_emails.php'>System Emails</a> page.";
	$admin_event[8] = "[username] - replaced with the username of the recepient.<br>[eventname] - replaced with the name of the event.<br>[link] - replaced with the link to login.";
	$admin_event[9] = "Save Changes";
	$admin_event[10] = "Public Permission Defaults";
	$admin_event[11] = "Select whether or not you want to let the public (visitors that are not logged-in) to view the following sections of your social network. In some cases (such as Profiles, Blogs, and Albums), if you have given them the option, your users will be able to make their pages private even though you have made them publically viewable here. For more permissions settings, please visit the <a href='admin_general.php'>General Settings</a> page.";
	$admin_event[12] = "Events";
	$admin_event[13] = "Yes, the public can view events unless they are made private.";
	$admin_event[14] = "No, the public cannot view events.";
	$admin_event[15] = "New Event Comment Email";
	$admin_event[16] = "This is the email that gets sent to a user when a new comment is posted about an event they have created. For more system emails, please visit the <a href='admin_emails.php'>System Emails</a> page.";
	$admin_event[17] = "[username] - replaced with the username of the recepient.<br>[commenter] - replaced with the name of the user who posted the comment.<br>[eventname] - replaced with the name of the event.<br>[link] - replaced with the link to the event.";
	$admin_event[18] = "New Event Media Comment Email";
	$admin_event[19] = "This is the email that gets sent to a user when a new comment is posted on one of the photos/files for an event they have created. For more system emails, please visit the <a href='admin_emails.php'>System Emails</a> page.";
	$admin_event[20] = "[username] - replaced with the username of the recepient.<br>[commenter] - replaced with the name of the user who posted the comment.<br>[eventname] - replaced with the name of the event.<br>[link] - replaced with the link to the photo.";
	$admin_event[21] = "Event Categories";
	$admin_event[22] = "You may want to allow your users to categorize their events by subject, location, etc. Categorized events make it easier for users to find and attend events that interest them. If you want to allow event categories, you can create them (along with subcategories) below.";
	$admin_event[23] = "Add Category";
	$admin_event[24] = "Add Subcategory";



	$admin_event[28] = "New Event Invitation Request Email";
	$admin_event[29] = "This is the email that gets sent to a user when someone requests an invitation to an event they created. For more system emails, please visit the <a href='admin_emails.php'>System Emails</a> page.";
	$admin_event[30] = "[username] - replaced with the username of the recepient.<br>[requester] - replaced with the name of the user who is requesting an invitation.<br>[eventname] - replaced with the name of the event.<br>[link] - replaced with a link to login.";
	break;

case "admin_levels_eventsettings":
	$admin_levels_eventsettings[1] = "Event Settings";
	$admin_levels_eventsettings[2] = "If you have enabled events, your users will have the option of creating events and inviting users. Use this page to configure your event settings.";
	$admin_levels_eventsettings[3] = "Allow Events?";
	$admin_levels_eventsettings[4] = "If you have selected YES, your users will have the option of creating and RSVPing to events. Note that if you switch this from YES to NO, users will lose any current events they have.";
	$admin_levels_eventsettings[5] = "Yes, users can create events.";
	$admin_levels_eventsettings[6] = "No, users cannot create events.";
	$admin_levels_eventsettings[7] = "Save Changes";
	$admin_levels_eventsettings[8] = "Your changes have been saved.";
	$admin_levels_eventsettings[9] = "Allow Event Photos?";
	$admin_levels_eventsettings[10] = "If you enable this feature, users will be able to upload a small photo icon when creating or editing an event. This can be displayed next to the event name on users' profiles, in search/browse results, etc.";
	$admin_levels_eventsettings[11] = "Yes, users can upload a photo icon when they create/edit an event.";
	$admin_levels_eventsettings[12] = "No, users can not upload a photo icon when they create/edit an event.";
	$admin_levels_eventsettings[13] = "If you have selected YES above, please input the maximum dimensions for the event photos. If your users upload a photo that is larger than these dimensions, the server will attempt to scale them down automatically. This feature requires that your PHP server is compiled with support for the GD Libraries.";
	$admin_levels_eventsettings[14] = "Maximum Width:";
	$admin_levels_eventsettings[15] = "(in pixels, between 1 and 999)";
	$admin_levels_eventsettings[16] = "Maximum Height:";
	$admin_levels_eventsettings[17] = "What file types do you want to allow for event photos (gif, jpg, jpeg, or png)? Separate file types with commas, i.e. jpg, jpeg, gif, png";
	$admin_levels_eventsettings[18] = "Allowed File Types:";
	$admin_levels_eventsettings[19] = "<b>Search Privacy Options</b><br>If you enable this feature, event leaders will be able to exclude their event from search results. Otherwise, all events will be included in search results.";
	$admin_levels_eventsettings[20] = "Yes, allow event leaders to exclude their events from search results.";
	$admin_levels_eventsettings[21] = "No, force all events to be included in search results.";
	$admin_levels_eventsettings[22] = "Event Privacy Options";
	$admin_levels_eventsettings[23] = "Editing User Level:";
	$admin_levels_eventsettings[24] = "You are currently editing this user level's settings. Remember, these settings only apply to the users that belong to this user level. When you're finished, you can edit the <a href='admin_levels.php'>other levels here</a>.";
	$admin_levels_eventsettings[25] = "<b>Overall Event Privacy</b><br>Event Creators can choose from any of the options checked below when they decide who can view their events. If you do not check any options, everyone will be allowed to view events.";
	$admin_levels_eventsettings[26] = "<b>Event Comment Options</b><br>Event Creators can choose from any of the options checked below when they decide who can post comments on their events. If you do not check any options, everyone will be allowed to post comments on events.";
	$admin_levels_eventsettings[27] = "Allow Invite-Only Events?";
	$admin_levels_eventsettings[28] = "Do you want to give event creators the ability to create invite-only events? If set to YES, event creators will be able to set events to \"invite-only\". This means only invited users will be able to RSVP to the event and un-invited users will need to request an invitation";
	$admin_levels_eventsettings[29] = "Yes, optionally allow invite-only events.";
	$admin_levels_eventsettings[30] = "No, do not allow invite-only events.";
	$admin_levels_eventsettings[31] = "Allow custom CSS styles?";
	$admin_levels_eventsettings[32] = "If you enable this feature, your users will be able to customize the colors and fonts of their events by altering their CSS styles. ";
	$admin_levels_eventsettings[33] = "Yes, allow custom css.";
	$admin_levels_eventsettings[34] = "No, do not allow custom css.";
	$admin_levels_eventsettings[35] = "Event File Settings";
	$admin_levels_eventsettings[36] = "List the following file extensions that users are allowed to upload. Separate file extensions with commas, for example: jpg, gif, jpeg, png, bmp";
	$admin_levels_eventsettings[37] = "To successfully upload a file, the file must have an allowed filetype extension as well as an allowed MIME type. This prevents users from disguising malicious files with a fake extension. Separate MIME types with commas, for example: image/jpeg, image/gif, image/png, image/bmp";
	$admin_levels_eventsettings[38] = "How much storage space should each event have to store its files?";
	$admin_levels_eventsettings[39] = "Unlimited";
	$admin_levels_eventsettings[40] = "Enter the maximum filesize for uploaded files in KB. This must be a number between 1 and 204800.";
	$admin_levels_eventsettings[41] = "Enter the maximum width and height (in pixels) for images uploaded to events. Images with dimensions outside this range will be sized down accordingly if your server has the GD Libraries installed. Note that unusual image types like BMP, TIFF, RAW, and others may not be resized.";
	$admin_levels_eventsettings[42] = "Maximum Width:";
	$admin_levels_eventsettings[43] = "Maximum Height:";
	$admin_levels_eventsettings[44] = "(in pixels, between 1 and 9999)";



	$admin_levels_eventsettings[48] = "Photo width and height must be integers between 1 and 999.";
	$admin_levels_eventsettings[49] = "Your maximum filesize field must contain an integer between 1 and 204800.";
	$admin_levels_eventsettings[50] = "Your maximum width and height fields must contain integers between 1 and 9999.";
	break;

case "admin_viewevents":
	$admin_viewevents[1] = "View Events";
	$admin_viewevents[2] = "This page lists all of the events that users have created on your social network. You can use this page to monitor these events and delete offensive or unwanted material if necessary. Entering criteria into the filter fields will help you find specific events. Leaving the filter fields blank will show all the events on your social network.";
	$admin_viewevents[3] = "Title";
	$admin_viewevents[4] = "Creator";
	$admin_viewevents[5] = "Filter";
	$admin_viewevents[6] = "ID";
	$admin_viewevents[7] = "Title";
	$admin_viewevents[8] = "Creator";

	$admin_viewevents[10] = "Event Date";
	$admin_viewevents[11] = "Options";
	$admin_viewevents[12] = "view";
	$admin_viewevents[13] = "delete";
	$admin_viewevents[14] = "Events Found";
	$admin_viewevents[15] = "Page:";
	$admin_viewevents[16] = "Delete Event";
	$admin_viewevents[17] = "Are you sure you want to delete this event?";
	$admin_viewevents[18] = "Cancel";
	$admin_viewevents[19] = "No events were found.";
	$admin_viewevents[20] = "Delete Selected";
	break;

  case "event":
	$event[1] = "You do not have permission to view this event.";
	$event[2] = "Browse Guestlist";
	$event[3] = "Request an Invitation";
	$event[4] = "Attend this Event";
	$event[5] = "Event Statistics";
	$event[6] = "Event Admin:";
	$event[7] = "Views:";
	$event[8] = "views";
	$event[9] = "Invites:";
	$event[10] = "invited guests";
	$event[11] = "Photos:";
	$event[12] = "photos";
	$event[13] = "Last Update:";
	$event[14] = "Event Information";
	$event[15] = "Event Name:";
	$event[16] = "Description:";
	$event[17] = "Category:";
	$event[18] = "Confirmed Guests";
	$event[19] = "view all confirmed guests";
	$event[20] = "Event Date/Time:";
	$event[21] = "Photos";
	$event[22] = "view all photos";
	$event[23] = "Comments";
	$event[24] = "Post Comment";
	$event[25] = "view all comments";
	$event[26] = "Anonymous";
	$event[27] = "message";
	$event[28] = "An Error Has Occurred";
	$event[29] = "Browse Photos";
	$event[30] = "You must be logged in to view this page. <a href='login.php'>Click here</a> to login.";
	$event[31] = "Write Something...";
	$event[32] = "Posting...";
	$event[33] = "Please enter a message.";
	$event[34] = "You have entered the wrong security code.";
	$event[35] = "\o\\n";	  //THESE CHARACTERS ARE BEING ESCAPED BECAUSE THEY ARE BEING USED IN A DATE FUNCTION
	$event[36] = "Enter the numbers you see in this image into the field to its right. This helps keep our site free of spam.";
	$event[37] = "Private Event";
	$event[38] = "Report this Event";
	$event[39] = "Return";
	$event[40] = "reply";
	$event[41] = "The event you are looking for has been deleted or does not exist.";
	$event[42] = "Other Guests";
	$event[43] = "Maybe Attending";
	$event[44] = "Not Attending";
	$event[45] = "Awaiting Response";
	$event[46] = "until";
	$event[47] = "RSVP to this Event";
	$event[48] = "Change your RSVP";
	$event[49] = "Cancel Event";
	$event[50] = "Remove from My Events";
	$event[51] = "&#0102;&#0114;&#0111;&#0109;";	  //THESE CHARACTERS ARE BEING ESCAPED BECAUSE THEY ARE BEING USED IN A DATE FUNCTION
	$event[52] = "Awaiting Invitation...";
	$event[53] = "Cancel Invite Request";
	$event[54] = "Host:";
	$event[55] = "Location:";
	break;

  case "event_album":
	$event_album[1] = "You do not have permission to view this album.";
	$event_album[2] = "'s Photos";
	$event_album[3] = "An Error Has Occurred";
	$event_album[4] = "You must be logged in to view this page. <a href='login.php'>Click here</a> to login.";
	$event_album[5] = "Last Page";
	$event_album[6] = "viewing image";
	$event_album[7] = "of";
	$event_album[8] = "viewing images";
	$event_album[9] = "Next Page";
	$event_album[10] = "Return";
	break;

  case "event_album_file":
	$event_album_file[1] = "You do not have permission to view this file.";
	$event_album_file[2] = "'s Photo";
	$event_album_file[3] = "Untitled";
	$event_album_file[4] = "photos";
	$event_album_file[5] = "download audio";
	$event_album_file[6] = "download video";
	$event_album_file[7] = "download this file";
	$event_album_file[8] = "Return to";
	$event_album_file[9] = "'s Album";
	$event_album_file[10] = "Post Comment";
	$event_album_file[11] = "Report Inappropriate Content";
	$event_album_file[12] = "Comments";
	$event_album_file[13] = "on";
	$event_album_file[14] = "Anonymous";
	$event_album_file[15] = "An Error Has Occurred";
	$event_album_file[16] = "By";
	$event_album_file[17] = "You must be logged in to view this page. <a href='login.php'>Click here</a> to login.";
	$event_album_file[18] = "Write Something...";
	$event_album_file[19] = "Posting...";
	$event_album_file[20] = "Please enter a message.";
	$event_album_file[21] = "You have entered the wrong security code.";
	$event_album_file[22] = "\o\\n";  //THESE CHARACTERS ARE BEING ESCAPED BECAUSE THEY ARE BEING USED IN A DATE FUNCTION
	$event_album_file[23] = "message";
	$event_album_file[24] = "Enter the numbers you see in this image into the field to its right. This helps keep our site free of spam.";
	$event_album_file[25] = "Return";
	break;

  case "event_comments":
	$event_comments[1] = "message";
	$event_comments[2] = "\o\\n";	  //THESE CHARACTERS ARE BEING ESCAPED BECAUSE THEY ARE BEING USED IN A DATE FUNCTION
	$event_comments[3] = "Comments About";

	$event_comments[5] = "Back to";

	$event_comments[7] = "Last Page";
	$event_comments[8] = "showing comment";
	$event_comments[9] = "of";
	$event_comments[10] = "showing comments";
	$event_comments[11] = "Next Page";
	$event_comments[12] = "Anonymous";

	$event_comments[14] = "Write Something...";
	$event_comments[15] = "Posting...";
	$event_comments[16] = "Please enter a message.";
	$event_comments[17] = "You have entered the wrong security code.";
	$event_comments[18] = "Post Comment";
	$event_comments[19] = "Enter the numbers you see in this image into the field to its right. This helps keep our site free of spam.";
	$event_comments[20] = "An Error Has Occurred";

	$event_comments[22] = "You must be logged in to view this page. <a href='login.php'>Click here</a> to login.";
	$event_comments[23] = "Return";
	break;

  case "event_members":
	$event_members[1] = "Guestlist for ";
	$event_members[2] = "The following people have been invited to";
	$event_members[3] = "Last Page";
	$event_members[4] = "viewing guests";
	$event_members[5] = "of";
	$event_members[6] = "viewing guests";
	$event_members[7] = "Next Page";
	$event_members[8] = "Username:";
	$event_members[9] = "Last Update:";
	$event_members[10] = "Last Login:";
	$event_members[11] = "View Profile";
	$event_members[12] = "Add to Friends";
	$event_members[13] = "Send Message";
	$event_members[14] = "An Error Has Occurred";
	$event_members[15] = "You must be logged in to view this page. <a href='login.php'>Click here</a> to login.";
	$event_members[16] = "Return";
	$event_members[17] = "View Guests:";
	$event_members[18] = "All Invited";
	$event_members[19] = "Attending";
	$event_members[20] = "Maybe Attending";
	$event_members[21] = "Not Attending";
	$event_members[22] = "Awaiting Response";
	$event_members[23] = "Submit";
	$event_members[24] = "No guests found.";
	$event_members[25] = "RSVP:";
	break;

  case "profile_event_calendar":
	$profile_event_calendar[1] = "'s Events on";
	$profile_event_calendar[2] = "close";
	$profile_event_calendar[3] = "When:";
	$profile_event_calendar[4] = "until";
	$profile_event_calendar[5] = "View Event";
	$profile_event_calendar[6] = "Host:";
	$profile_event_calendar[7] = "RSVP:";
	$profile_event_calendar[8] = "Attending";
	$profile_event_calendar[9] = "Maybe Attending";
	$profile_event_calendar[10] = "Not Attending";
	$profile_event_calendar[11] = "Awaiting Response";
	$profile_event_calendar[12] = "'s RSVP:";
	$profile_event_calendar[13] = "&#0102;&#0114;&#0111;&#0109;";	  //THESE CHARACTERS ARE BEING ESCAPED BECAUSE THEY ARE BEING USED IN A DATE FUNCTION
	break;

  case "user_event":
	$user_event[1] = "My Events";
	$user_event[2] = "close";
	$user_event[3] = "Browse Events";
	$user_event[4] = "My Events";
	$user_event[5] = "Below are all of the events that you've created or been invited to.<br>To search for upcoming events to join, visit the ";
	$user_event[6] = "Browse Events page";
	$user_event[7] = "Create New Event";
	$user_event[8] = "You do not have any events this month.";
	$user_event[9] = "Hosted By:";
	$user_event[10] = "Category:";
	$user_event[11] = "Where:";
	$user_event[12] = "RSVP";
	$user_event[13] = "Edit Event";
	$user_event[14] = "Cancel Event";
	$user_event[15] = "Event Settings";
	$user_event[16] = "When:";
	$user_event[17] = "Your RSVP:";
	$user_event[18] = "Awaiting Response";
	$user_event[19] = "Attending";
	$user_event[20] = "Maybe Attending";
	$user_event[21] = "Not Attending";
	$user_event[22] = "Remove Event";
	$user_event[23] = "until";
	$user_event[24] = "Monday";
	$user_event[25] = "Tuesday";
	$user_event[26] = "Wednesday";
	$user_event[27] = "Thursday";
	$user_event[28] = "Friday";
	$user_event[29] = "Saturday";
	$user_event[30] = "Sunday";
	$user_event[31] = "View Event";
	$user_event[32] = "event(s) awaiting your response.";
	$user_event[33] = "RSVP to Event";
	$user_event[34] = "Event(s) Awaiting Your Response";
	$user_event[35] = "Host:";
	$user_event[36] = "&#0102;&#0114;&#0111;&#0109;"; 	//THESE CHARACTERS ARE BEING ESCAPED BECAUSE THEY ARE BEING USED IN A DATE FUNCTION
	break;

  case "user_event_add":
	$user_event_add[1] = "Please enter a name for your event.";
	$user_event_add[2] = "Event Details";
	$user_event_add[3] = "Please complete all required fields.";
	$user_event_add[4] = "at";
	$user_event_add[5] = "My Events";

	$user_event_add[7] = "Browse Events";
	$user_event_add[8] = "Create New Event";
	$user_event_add[9] = "Please give us some information about your new event. After you have created your event, you can begin inviting other users to attend.";
	$user_event_add[10] = "Event Name*";
	$user_event_add[11] = "Event Description";
	$user_event_add[12] = "Event Category";
	$user_event_add[13] = "Event Settings";
	$user_event_add[14] = "Invite Only";
	$user_event_add[15] = "Users can RSVP without invitation.";
	$user_event_add[16] = "Users must be invited before they can RSVP.";
	$user_event_add[17] = "When people try to attend this event, should they be allowed to RSVP immediately, or should they be forced to request an invitation?";
	$user_event_add[18] = "Include this event in search/browse results?";
	$user_event_add[19] = "Yes, include this event in search/browse results.";
	$user_event_add[20] = "No, exclude this event from search/browse results.";
	$user_event_add[21] = "Who can see this event?";
	$user_event_add[22] = "You can decide who gets to see this event.";
	$user_event_add[23] = "Allow Comments?";
	$user_event_add[24] = "You can decide who can post comments in this event.";
	$user_event_add[25] = "Add Event";
	$user_event_add[26] = "Cancel";
	$user_event_add[27] = "Event Settings";
	$user_event_add[28] = "Start Time*";
	$user_event_add[29] = "End Time*";
	$user_event_add[30] = "Invalid end time - make sure your event's end time is after its start time.";
	$user_event_add[31] = "Invalid start time - make sure your event's start time is in the future.";
	$user_event_add[32] = "Host:";
	$user_event_add[33] = "Location:";
	break;

  case "user_event_browse":
	$user_event_browse[1] = "My Events";
	$user_event_browse[2] = "Upcoming Events";
	$user_event_browse[3] = "Browse Events";
	$user_event_browse[4] = "Browse Upcoming Events";
	$user_event_browse[5] = "Finding a event that interests you is easy! Just select a category below, or search for a event with your own keywords on the <a href='search.php'>search page</a>.";
	$user_event_browse[6] = "Event Categories";
	$user_event_browse[7] = "events";
	$user_event_browse[8] = "event";
	$user_event_browse[9] = "Other";
	$user_event_browse[10] = "No upcoming events were found in this category.";
	$user_event_browse[11] = "When:";
	$user_event_browse[12] = "All Events";
	$user_event_browse[13] = "Host:";
	$user_event_browse[14] = "View Event";
	$user_event_browse[15] = "RSVP to Event";
	$user_event_browse[16] = "Last Page";
	$user_event_browse[17] = "viewing event";
	$user_event_browse[18] = "of";
	$user_event_browse[19] = "viewing events";
	$user_event_browse[20] = "Next Page";
	$user_event_browse[21] = "Event Settings";
	$user_event_browse[22] = "&#0102;&#0114;&#0111;&#0109;";	  //THESE CHARACTERS ARE BEING ESCAPED BECAUSE THEY ARE BEING USED IN A DATE FUNCTION
	$user_event_browse[23] = "until";
	break;

  case "user_event_edit":
	$user_event_edit[1] = "Photos must be less than 4MB in size";
	$user_event_edit[2] = "Photos must have one of the following extensions:";
	$user_event_edit[3] = "Photos must be less than or equal to the following dimensions:";
	$user_event_edit[4] = "pixels";
	$user_event_edit[5] = "Your photo failed to upload. Please try again. If this error persists, please contact support.";
	$user_event_edit[6] = "Please complete all required fields.";

	$user_event_edit[8] = "Please enter a name for your event.";
	$user_event_edit[9] = "Your changes have been saved.";
	$user_event_edit[10] = "Event Details";
	$user_event_edit[11] = "Invites";
	$user_event_edit[12] = "at";
	$user_event_edit[13] = "Photos";
	$user_event_edit[14] = "Comments";
	$user_event_edit[15] = "Event Style";
	$user_event_edit[16] = "Cancel Event";
	$user_event_edit[17] = "Edit Event:";
	$user_event_edit[18] = "All of this event's details are displayed and can be changed below.";
	$user_event_edit[19] = "Your event was successfully created! You can add a photo and edit the event details below.";
	$user_event_edit[20] = "Event Photo";
	$user_event_edit[21] = "Current Photo";
	$user_event_edit[22] = "remove photo";
	$user_event_edit[23] = "Upload Photo";
	$user_event_edit[24] = "Upload";
	$user_event_edit[25] = "Images must be less than 4 MB in size with one of the following extensions:";
	$user_event_edit[26] = "Event Details";
	$user_event_edit[27] = "Event Name*";
	$user_event_edit[28] = "Event Description";
	$user_event_edit[29] = "Event Category";
	$user_event_edit[30] = "Event Settings";
	$user_event_edit[31] = "Invite Only";
	$user_event_edit[32] = "Users can RSVP without invitation.";
	$user_event_edit[33] = "Users must be invited before they can RSVP.";
	$user_event_edit[34] = "When people try to attend this event, should they be allowed to RSVP immediately, or should they be forced to request an invitation? Approving/denying invitation requests can be managed from the";
	$user_event_edit[35] = "Note: If you turn the \"Invite Only\" feature off, any invitation requests will be automatically approved.";
	$user_event_edit[36] = "Include this event in search/browse results?";
	$user_event_edit[37] = "Yes, include this event in search/browse results.";
	$user_event_edit[38] = "No, exclude this event from search/browse results.";
	$user_event_edit[39] = "Who can see this event?";
	$user_event_edit[40] = "You can decide who gets to see this event.";
	$user_event_edit[41] = "Allow Comments?";
	$user_event_edit[42] = "You can decide who can post comments in this event.";
	$user_event_edit[43] = "Save Changes";
	$user_event_edit[44] = "invites page";
	$user_event_edit[45] = "Cancel";
	$user_event_edit[46] = "&#171; Back to My Events";
	$user_event_edit[47] = "Start Time*";
	$user_event_edit[48] = "End Time*";
	$user_event_edit[49] = "Invalid end time - make sure your event's end time is after its start time.";
	$user_event_edit[50] = "Invalid start time - make sure your event's start time is in the future.";
	$user_event_edit[51] = "Host:";
	$user_event_edit[52] = "Location:";
	break;

  case "user_event_edit_comments":
	$user_event_edit_comments[1] = "Event Details";
	$user_event_edit_comments[2] = "Invites";

	$user_event_edit_comments[4] = "Photos";
	$user_event_edit_comments[5] = "Comments";
	$user_event_edit_comments[6] = "Event Style";
	$user_event_edit_comments[7] = "Cancel Event";
	$user_event_edit_comments[8] = "Back to My Events";
	$user_event_edit_comments[9] = "Event Comments:";
	$user_event_edit_comments[10] = "The comments below have been written about this event by other people. To delete comments, click their checkboxes and then click the \"Delete Selected\" button below the comment list.";
	$user_event_edit_comments[11] = "Last Page";
	$user_event_edit_comments[12] = "comment";
	$user_event_edit_comments[13] = "of";
	$user_event_edit_comments[14] = "comments";
	$user_event_edit_comments[15] = "Next Page";
	$user_event_edit_comments[16] = "No comments have been posted about this event.";
	$user_event_edit_comments[17] = "Anonymous";
	$user_event_edit_comments[18] = "Delete Selected";
	$user_event_edit_comments[19] = "\o\\n";  //THESE CHARACTERS ARE BEING ESCAPED BECAUSE THEY ARE BEING USED IN A DATE FUNCTION
	$user_event_edit_comments[20] = "select all comments";
	break;

  case "user_event_edit_delete":
	$user_event_edit_delete[1] = "Event Details";
	$user_event_edit_delete[2] = "Invites";

	$user_event_edit_delete[4] = "Photos";
	$user_event_edit_delete[5] = "Comments";
	$user_event_edit_delete[6] = "Event Style";
	$user_event_edit_delete[7] = "Cancel Event";
	$user_event_edit_delete[8] = "Back to My Events";
	$user_event_edit_delete[9] = "Cancel Event:";
	$user_event_edit_delete[10] = "Are you sure you want to cancel this event? All of its content will be permanently deleted, and all members will be notified that it has been cancelled.";
	$user_event_edit_delete[11] = "Cancel Event";
	$user_event_edit_delete[12] = "Do Not Cancel";
	break;

  case "user_event_edit_files":
	$user_event_edit_files[1] = "Your changes have been saved.";
	$user_event_edit_files[2] = "Event Details";
	$user_event_edit_files[3] = "Invites";

	$user_event_edit_files[5] = "Photos";
	$user_event_edit_files[6] = "Comments";
	$user_event_edit_files[7] = "Event Style";
	$user_event_edit_files[8] = "Cancel Event";
	$user_event_edit_files[9] = "Back to My Events";
	$user_event_edit_files[10] = "Event Photos:";
	$user_event_edit_files[11] = "Manage this event's photos and files from this page.<br>Total files in this album: ";
	$user_event_edit_files[12] = "Add New Photos";
	$user_event_edit_files[13] = "Title";
	$user_event_edit_files[14] = "comments";
	$user_event_edit_files[15] = "Caption";
	$user_event_edit_files[16] = "Delete Photo";
	$user_event_edit_files[17] = "Save Changes";
	break;

  case "user_event_edit_files_comments":
	$user_event_edit_files_comments[1] = "Event Details";
	$user_event_edit_files_comments[2] = "Invites";

	$user_event_edit_files_comments[4] = "Photos";
	$user_event_edit_files_comments[5] = "Comments";
	$user_event_edit_files_comments[6] = "Event Style";
	$user_event_edit_files_comments[7] = "Cancel Event";
	$user_event_edit_files_comments[8] = "Back to My Events";
	$user_event_edit_files_comments[9] = "Photo Comments";
	$user_event_edit_files_comments[10] = "To delete comments, click their checkboxes and then click the \"Delete Selected\" button below the comment list.";
	$user_event_edit_files_comments[11] = "Last Page";
	$user_event_edit_files_comments[12] = "comment";
	$user_event_edit_files_comments[13] = "of";
	$user_event_edit_files_comments[14] = "comments";
	$user_event_edit_files_comments[15] = "Next Page";
	$user_event_edit_files_comments[16] = "No comments have been posted about this photo.";
	$user_event_edit_files_comments[17] = "Anonymous";
	$user_event_edit_files_comments[18] = "Delete Selected";
	$user_event_edit_files_comments[19] = "\o\\n";  //THESE CHARACTERS ARE BEING ESCAPED BECAUSE THEY ARE BEING USED IN A DATE FUNCTION
	$user_event_edit_files_comments[20] = "select all comments";
	$user_event_edit_files_comments[21] = "Back to Photos";
	break;

  case "user_event_edit_files_upload":
	$user_event_edit_files_upload[1] = "Event Details";
	$user_event_edit_files_upload[2] = "Invites";

	$user_event_edit_files_upload[4] = "Photos";
	$user_event_edit_files_upload[5] = "Comments";
	$user_event_edit_files_upload[6] = "Event Style";
	$user_event_edit_files_upload[7] = "Cancel Event";
	$user_event_edit_files_upload[8] = "Back to My Events";
	$user_event_edit_files_upload[9] = "Upload Photos:";
	$user_event_edit_files_upload[10] = "To upload photos from your computer, click the \"Browse\" button, locate them on your computer, then click the \"Upload Photos\" button.";
	$user_event_edit_files_upload[11] = "Back to Photos";
	$user_event_edit_files_upload[12] = "You have";
	$user_event_edit_files_upload[13] = "of free space remaining.";
	$user_event_edit_files_upload[14] = "You may upload files of the following types:";
	$user_event_edit_files_upload[15] = "You may upload files with sizes up to";
	$user_event_edit_files_upload[16] = "File 1:";
	$user_event_edit_files_upload[17] = "File 2:";
	$user_event_edit_files_upload[18] = "File 3:";
	$user_event_edit_files_upload[19] = "File 4:";
	$user_event_edit_files_upload[20] = "File 5:";
	$user_event_edit_files_upload[21] = "Upload Photos";
	$user_event_edit_files_upload[22] = "UPLOADING"; // USED IN JAVASCRIPT, NO QUOTES OR SPECIAL CHARACTERS ALLOWED
	$user_event_edit_files_upload[23] = "was uploaded successfully.";
	break;

  case "user_event_edit_members":
	$user_event_edit_members[1] = "Event Details";
	$user_event_edit_members[2] = "Invites";
	$user_event_edit_members[3] = "user(s) were successfully invited to attend this event.";
	$user_event_edit_members[4] = "Photos";
	$user_event_edit_members[5] = "Comments";
	$user_event_edit_members[6] = "Event Style";
	$user_event_edit_members[7] = "Cancel Event";
	$user_event_edit_members[8] = "Back to My Events";
	$user_event_edit_members[9] = "Browse Guestlist:";
	$user_event_edit_members[10] = "Use this page to list/search for event guests, approve/reject requests for invitations (if available), and invite additional users to your event.";
	$user_event_edit_members[11] = "Send Invitations";
	$user_event_edit_members[12] = "To invite someone to attend this event, enter the person's username in the field below.";
	$user_event_edit_members[13] = "Search";
	$user_event_edit_members[14] = "Sort by:";
	$user_event_edit_members[15] = "Recently Updated";
	$user_event_edit_members[16] = "Recently Logged In";
	$user_event_edit_members[17] = "Username:";
	$user_event_edit_members[18] = "Invite";
	$user_event_edit_members[19] = "Last Page";
	$user_event_edit_members[20] = "viewing entry";
	$user_event_edit_members[21] = "of";
	$user_event_edit_members[22] = "viewing entries";
	$user_event_edit_members[23] = "Next Page";
	$user_event_edit_members[24] = "Last Update:";
	$user_event_edit_members[25] = "Last Login:";
	$user_event_edit_members[26] = "All Invited";
	$user_event_edit_members[27] = "Attending";
	$user_event_edit_members[28] = "Maybe Attending";
	$user_event_edit_members[29] = "Not Attending";
	$user_event_edit_members[30] = "Awaiting Response";
	$user_event_edit_members[31] = "Add Another Person";
	$user_event_edit_members[32] = "Remove from Guest List";
	$user_event_edit_members[33] = "Send Message";
	$user_event_edit_members[34] = "Search:";
	$user_event_edit_members[35] = "Users Requesting Invitation";
	$user_event_edit_members[36] = "The following people want to attend this event and have requested an invitation.";
	$user_event_edit_members[37] = "invite";
	$user_event_edit_members[38] = "reject";
	$user_event_edit_members[39] = "1 person's request for an invitation was rejected.";
	$user_event_edit_members[40] = "1 person's request for an invitation was granted.";
	$user_event_edit_members[41] = "RSVP:";
	$user_event_edit_members[42] = "1 person has been removed from the guestlist.";
	$user_event_edit_members[43] = "Guest List";
	break;

  case "user_event_edit_style":
	$user_event_edit_style[1] = "Your changes have been saved.";
	$user_event_edit_style[2] = "Event Details";
	$user_event_edit_style[3] = "Invites";

	$user_event_edit_style[5] = "Photos";
	$user_event_edit_style[6] = "Comments";
	$user_event_edit_style[7] = "Event Style";
	$user_event_edit_style[8] = "Cancel Event";
	$user_event_edit_style[9] = "Back to My Events";
	$user_event_edit_style[10] = "Customize Event:";
	$user_event_edit_style[11] = "You can change the colors, fonts, and styles of your event page by adding CSS code below. The contents of the text area below will be output between &lt;style&gt; tags on your event page.";
	$user_event_edit_style[12] = "Save Changes";
	break;

  case "user_event_rsvp":
	$user_event_rsvp[1] = "RSVP";
	$user_event_rsvp[2] = "You have already requested an invitation to this event.";
	$user_event_rsvp[3] = "Your RSVP for this event has been saved.";
	$user_event_rsvp[4] = "My Events";
	$user_event_rsvp[5] = "RSVP to";
	$user_event_rsvp[6] = "Browse Events";
	$user_event_rsvp[7] = "Request Invitation to";
	$user_event_rsvp[8] = "This event is attendable by invitation only. To request an invitation, click the \"Request Invitation\" button below.";
	$user_event_rsvp[9] = "Request Invitation";
	$user_event_rsvp[10] = "Cancel";
	$user_event_rsvp[11] = "Return";
	$user_event_rsvp[12] = "You have requested an invitation to this event. The event administrator will confirm or reject your request soon.";
	$user_event_rsvp[13] = "Event Settings";
	$user_event_rsvp[14] = "To RSVP to this event, please select the appropriate option below.";
	$user_event_rsvp[15] = "Will you be attending this event?";
	$user_event_rsvp[16] = "Yes, I will be attending this event.";
	$user_event_rsvp[17] = "I will maybe attend this event.";
	$user_event_rsvp[18] = "No, I will not be attending this event.";
	$user_event_rsvp[19] = "Please select an RSVP option below.";
	break;

  case "user_event_remove":
	$user_event_remove[1] = "My Events";
	$user_event_remove[2] = "Cancel Request";
	$user_event_remove[3] = "Browse Events";
	$user_event_remove[4] = "Remove";
	$user_event_remove[5] = "Are you sure you want to remove this event?";
	$user_event_remove[6] = "<b>Please note that you are the creator/administrator of this event. If you remove this event, the entire event will be deleted.</b>";
	$user_event_remove[7] = "Cancel Invitation Request to";
	$user_event_remove[8] = "Are you sure you want to cancel your request for an invitation to this event?";
	$user_event_remove[9] = "Remove Event";
	$user_event_remove[10] = "Cancel";
	$user_event_remove[11] = "Event Settings";
	$user_event_remove[12] = "Do Not Cancel Request";
	break;

  case "user_event_settings":
	$user_event_settings[1] = "My Events";

	$user_event_settings[3] = "Browse Events";
	$user_event_settings[4] = "Event Settings";
	$user_event_settings[5] = "Event Settings";
	$user_event_settings[6] = "Edit your event settings such as email notifications on this page.";
	$user_event_settings[7] = "Your changes have been saved.";
	$user_event_settings[8] = "Save Changes";
	$user_event_settings[9] = "Event Notifications";
	$user_event_settings[10] = "Check the boxes next to the email notifications you would like to receive.";
	$user_event_settings[11] = "Notify me when someone invites me to attend an event.";
	$user_event_settings[12] = "Notify me when someone writes a comment on an event I created.";
	$user_event_settings[13] = "Notify me when someone writes a comment on one of the photos in an event I created.";
	$user_event_settings[14] = "Notify me when someone requests an invitation to an event I created.";
	$user_event_settings[15] = "Notify me when someone cancels an event I was invited to.";
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