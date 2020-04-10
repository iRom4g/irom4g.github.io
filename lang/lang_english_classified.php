<?

// SET GENERAL VARIABLES, AVAILABLE ON EVERY PAGE
$header_classified[1] = "Classifieds";
$header_classified[2] = "Classifieds";
$header_classified[3] = "view all";
$header_classified[4] = "Untitled";
$header_classified[5] = "Posted";

// ASSIGN ALL SMARTY GENERAL classified VARIABLES
reset($header_classified);
while(list($key, $val) = each($header_classified)) {
  $smarty->assign("header_classified".$key, $val);
}



// ASSIGN ALL CLASS/FUNCTION FILE VARIABLES
$functions_classified[1] = "Posted by ";
$functions_classified[2] = "classified listings";
$functions_classified[3] = "Untitled";

$class_classified[1] = "Please ensure you have completed all the required fields.";
$class_classified[2] = "Please ensure you have filled out the fields in the proper format.";
$class_classified[3] = "MONTH";
$class_classified[4] = "DAY";
$class_classified[5] = "YEAR";



// SET LANGUAGE PAGE VARIABLES
switch ($page) {

  case "admin_classified":
	$admin_classified[1] = "General Classified Settings";
	$admin_classified[2] = "This page contains general classified settings that affect your entire social network.";
	$admin_classified[3] = "Your changes have been saved.";
	$admin_classified[4] = "Subject";
	$admin_classified[5] = "Message";
	$admin_classified[6] = "New Classified Listing Comment Email";
	$admin_classified[7] = "This is the email that gets sent to a user when a new comment is posted on one of their classified listings. For more system emails, please visit the <a href='admin_emails.php'>System Emails</a> page.";
	$admin_classified[8] = "[username] - replaced with the username of the recepient.<br>[commenter] - replaced with the name of the user who posted the comment.<br>[link] - replaced with the link to the classified listing.";
	$admin_classified[9] = "Save Changes";
	$admin_classified[10] = "Public Permission Defaults";
	$admin_classified[11] = "Select whether or not you want to let the public (visitors that are not logged-in) to view classified listings on your social network. In some cases (such as Profiles, Blogs, and Albums), if you have given them the option, your users will be able to make their pages private even though you have made them publically viewable here. For more permissions settings, please visit the <a href='admin_general.php'>General Settings</a> page.";
	$admin_classified[12] = "Classifieds";
	$admin_classified[13] = "Yes, the public can view classifieds unless they are made private.";
	$admin_classified[14] = "No, the public cannot view classifieds.";
	$admin_classified[15] = "Are you sure you want to delete this category? NOTE: If you are deleting a main category, all subcategories and fields will be deleted as well.";
	$admin_classified[16] = "Add Field";
	$admin_classified[17] = "Classified Categories";
	$admin_classified[18] = "Add Category";
	$admin_classified[19] = "Add Subcategory";
	$admin_classified[20] = "Note: You do not have any classified categories to manage. Click the \"Add Category\" link above to create one.";
	$admin_classified[21] = "Classified Categories/Fields";
	$admin_classified[22] = "You may want to allow your users to categorize their classified listings. Categorized listings make it easier for users to find listings that interest them. If you want to allow listing categories, you can create them (along with subcategories) below. Additionally, you can create specialized fields for category listings by clicking \"Add Field\" below.";
	$admin_classified[23] = "Add Category";
	$admin_classified[24] = "Add Subcategory";
	$admin_classified[25] = "Field Title:";
	$admin_classified[26] = "Category:";
	$admin_classified[27] = "Field Type:";
	$admin_classified[28] = "Inline CSS Style:";
	$admin_classified[29] = "Field Description:";
	$admin_classified[30] = "Custom Error Message:";
	$admin_classified[31] = "Required:";
	$admin_classified[32] = "Allowed HTML Tags:";
	$admin_classified[33] = "By default, the user may not enter any HTML tags into this profile field. If you want to allow specific tags, you can enter them above (separated by commas). Example: <i>b, img, a, embed, font<i>";
	$admin_classified[34] = "Field Maxlength:";
	$admin_classified[35] = "Link Field To:";
	$admin_classified[36] = "If you want this field to link to another URL, enter the link format above. Note that this will override the \"Searchable/Linked\" setting above. Use [field_value] to represent the user's input for this field. Examples: <i>Regular link (if user's input is a URL - must begin with \"http://\"):</i> <strong>[field_value]</strong><br><i>Mailto link (if user's input is an email address):</i> <strong>mailto:[field_value]</strong><br><i>AIM Link (if user's input is an AIM screenname):</i> <strong>aim:goim?screenname=[field_value]</strong>";
	$admin_classified[37] = "Regex Validation:";
	$admin_classified[38] = "If you want to force the user to enter data in a certain format, enter the corresponding regular expression above. A preg_match() will be applied when the user enters data. This is optional - if you don't understand or need regular expressions, leave this blank.";
	$admin_classified[39] = "Options:";
	$admin_classified[40] = "Label";
	$admin_classified[41] = "Dependency?";
	$admin_classified[42] = "Dependent Field Label";
	$admin_classified[43] = "No dependent field";
	$admin_classified[44] = "Yes, has dependent field";
	$admin_classified[45] = "Add New Option";
	$admin_classified[46] = "Add Field";
	$admin_classified[47] = "Edit Field";
	$admin_classified[48] = "Cancel";
	$admin_classified[49] = "Text Field";
	$admin_classified[50] = "Multi-line Text Area";
	$admin_classified[51] = "Pull-down Select Box";
	$admin_classified[52] = "Radio Buttons";
	$admin_classified[53] = "Date Field";
	$admin_classified[54] = "Required";
	$admin_classified[55] = "Not Required";
	$admin_classified[56] = "You must specify at least one option.";
	$admin_classified[57] = "You must specify a field type.";
	$admin_classified[58] = "You must enter a title for this field.";
	$admin_classified[59] = "Dependent Field";
	$admin_classified[60] = "Delete Field";
	$admin_classified[61] = "Are you sure you want to delete this field?";
	$admin_classified[62] = "Subcategories";
	$admin_classified[63] = "Search Fields";
	$admin_classified[64] = "Search Type:";
	$admin_classified[65] = "Do Not Display Search Field";
	$admin_classified[66] = "Exact Value Search";
	$admin_classified[67] = "Range Search";
	$admin_classified[68] = "If you would like your users to be able to search for listings based on this field, choose either an \"Exact Value Search\" or a \"Range Search\". If you select \"Exact Value Search\", listings will need to match the exact search value entered by the user. If you select \"Range Search\", users will be able to input minimum and maximum search values. This is useful for numerical fields such as \"price\", \"square footage\", and \"age\". Please note that \"Range Search\" does not work for date fields.";
	break;

  case "admin_levels_classifiedsettings":
	$admin_levels_classifiedsettings[1] = "Classified Settings";
	$admin_levels_classifiedsettings[2] = "If you have allowed users to have classifieds listings, you can adjust their details from this page.";
	$admin_levels_classifiedsettings[3] = "Listings Per Page";
	$admin_levels_classifiedsettings[4] = "How many classified listings will be shown per page? (Enter a number between 1 and 999)";
	$admin_levels_classifiedsettings[5] = "listings per page";
	$admin_levels_classifiedsettings[6] = "Save Changes";
	$admin_levels_classifiedsettings[7] = "Your changes have been saved.";
	$admin_levels_classifiedsettings[8] = "Your listings per page field must contain an integer between 1 and 999.";
	$admin_levels_classifiedsettings[9] = "Allow Classifieds?";
	$admin_levels_classifiedsettings[10] = "Do you want to let users have classified listings? If set to no, all other settings on this page will not apply.";
	$admin_levels_classifiedsettings[11] = "Yes, allow classified listings.";
	$admin_levels_classifiedsettings[12] = "No, do not allow classified listings.";
	$admin_levels_classifiedsettings[13] = "Photo width and height must be integers between 1 and 999.";
	$admin_levels_classifiedsettings[14] = "Your maximum filesize field must contain an integer between 1 and 204800.";
	$admin_levels_classifiedsettings[15] = "Your maximum width and height fields must contain integers between 1 and 9999.";




	$admin_levels_classifiedsettings[20] = "<b>Search Privacy Options</b><br>If you enable this feature, users will be able to exclude their classified listings from search results. Otherwise, all classified listings will be included in search results.";
	$admin_levels_classifiedsettings[21] = "Yes, allow users to exclude their classified listings from search results.";
	$admin_levels_classifiedsettings[22] = "No, force all classified listings to be included in search results.";
	$admin_levels_classifiedsettings[26] = "Classified Privacy Options";
	$admin_levels_classifiedsettings[27] = "<b>Classified Listing Privacy</b><br>Your users can choose from any of the options checked below when they decide who can see their classified listings. These options appear on your users' \"Add listing\" and \"Edit listing\" pages. If you do not check any options, everyone will be allowed to view classifieds.";
	$admin_levels_classifiedsettings[28] = "<b>Classified Comment Options</b><br>Your users can choose from any of the options checked below when they decide who can post comments on their listings. If you do not check any options, everyone will be allowed to post comments on listings.";
	$admin_levels_classifiedsettings[29] = "Editing User Level:";
	$admin_levels_classifiedsettings[30] = "You are currently editing this user level's settings. Remember, these settings only apply to the users that belong to this user level. When you're finished, you can edit the <a href='admin_levels.php'>other levels here</a>.";
	$admin_levels_classifiedsettings[31] = "Allow Classified Photos?";
	$admin_levels_classifiedsettings[32] = "If you enable this feature, users will be able to upload a small photo icon when creating or editing a classified listing. This can be displayed next to the classified name in search/browse results, etc.";
	$admin_levels_classifiedsettings[33] = "Yes, users can upload a photo icon when they create/edit a classified listing.";
	$admin_levels_classifiedsettings[34] = "No, users can not upload a photo icon when they create/edit a classified listing.";
	$admin_levels_classifiedsettings[35] = "If you have selected YES above, please input the maximum dimensions for the classified photos. If your users upload a photo that is larger than these dimensions, the server will attempt to scale them down automatically. This feature requires that your PHP server is compiled with support for the GD Libraries.";
	$admin_levels_classifiedsettings[36] = "Maximum Width:";
	$admin_levels_classifiedsettings[37] = "(in pixels, between 1 and 999)";
	$admin_levels_classifiedsettings[38] = "Maximum Height:";
	$admin_levels_classifiedsettings[39] = "What file types do you want to allow for classified photos (gif, jpg, jpeg, or png)? Separate file types with commas, i.e. jpg, jpeg, gif, png";
	$admin_levels_classifiedsettings[40] = "Allowed File Types:";
	$admin_levels_classifiedsettings[41] = "Classified File Settings";
	$admin_levels_classifiedsettings[42] = "List the following file extensions that users are allowed to upload. Separate file extensions with commas, for example: jpg, gif, jpeg, png, bmp";
	$admin_levels_classifiedsettings[43] = "To successfully upload a file, the file must have an allowed filetype extension as well as an allowed MIME type. This prevents users from disguising malicious files with a fake extension. Separate MIME types with commas, for example: image/jpeg, image/gif, image/png, image/bmp";
	$admin_levels_classifiedsettings[44] = "How much storage space should each listing have to store its files?";
	$admin_levels_classifiedsettings[45] = "Unlimited";
	$admin_levels_classifiedsettings[46] = "Enter the maximum filesize for uploaded files in KB. This must be a number between 1 and 204800.";
	$admin_levels_classifiedsettings[47] = "Enter the maximum width and height (in pixels) for images uploaded to listings. Images with dimensions outside this range will be sized down accordingly if your server has the GD Libraries installed. Note that unusual image types like BMP, TIFF, RAW, and others may not be resized.";
	$admin_levels_classifiedsettings[48] = "Maximum Width:";
	$admin_levels_classifiedsettings[49] = "Maximum Height:";
	$admin_levels_classifiedsettings[50] = "(in pixels, between 1 and 9999)";
	break;

  case "admin_viewclassifieds":
	$admin_viewclassifieds[1] = "View Classified Listings";
	$admin_viewclassifieds[2] = "This page lists all of the classified listings your users have posted. You can use this page to monitor these classifieds and delete offensive material if necessary. Entering criteria into the filter fields will help you find specific classified listings. Leaving the filter fields blank will show all the classified listings on your social network.";
	$admin_viewclassifieds[3] = "Title";
	$admin_viewclassifieds[4] = "Owner";
	$admin_viewclassifieds[5] = "Filter";
	$admin_viewclassifieds[6] = "ID";
	$admin_viewclassifieds[7] = "Views";
	$admin_viewclassifieds[8] = "Date";
	$admin_viewclassifieds[9] = "Options";
	$admin_viewclassifieds[10] = "view";
	$admin_viewclassifieds[11] = "delete";
	$admin_viewclassifieds[12] = "Classified Listings Found";
	$admin_viewclassifieds[13] = "Page:";
	$admin_viewclassifieds[14] = "Delete Classified Listing";
	$admin_viewclassifieds[15] = "Are you sure you want to delete this classified listing?";
	$admin_viewclassifieds[16] = "Cancel";
	$admin_viewclassifieds[17] = "No listings were found.";
	$admin_viewclassifieds[18] = "Untitled";
	$admin_viewclassifieds[19] = "Delete Selected";
	break;

  case "classifieds":
	$classifieds[1] = "The user you're looking for doesn't exist!";
	$classifieds[2] = "'s Classified Listings";
	$classifieds[3] = "has not posted any classified listings.";
	$classifieds[4] = "Untitled";
	$classifieds[5] = "comments";
	$classifieds[6] = "post comment";
	$classifieds[7] = "Last Page";
	$classifieds[8] = "viewing listing";
	$classifieds[9] = "of";
	$classifieds[10] = "viewing listings";
	$classifieds[11] = "Next Page";
	$classifieds[12] = "An Error Has Occurred";
	$classifieds[13] = "You must be logged in to view this page. <a href='login.php'>Click here</a> to login.";
	$classifieds[14] = "Return";
	$classifieds[15] = "Posted on";
	$classifieds[16] = "at";
	$classifieds[17] = "Category:";
	$classifieds[18] = "views";
	break;

  case "classified_category":
	$classified_category[1] = "All Classified Listings About";
	$classified_category[2] = "Untitled";
	$classified_category[3] = "comments";
	$classified_category[4] = "post comment";

	$classified_category[6] = "Last Page";
	$classified_category[7] = "viewing listing";
	$classified_category[8] = "of";
	$classified_category[9] = "viewing listings";
	$classified_category[10] = "Next Page";
	break;

  case "classified":
	$classified[1] = "You do not have permission to view this file.";
	$classified[2] = "'s Classified Listing:";
	$classified[3] = "'s";
	$classified[4] = "Classified Listings";
	$classified[5] = "Untitled";
	$classified[6] = "post comment";
	$classified[7] = "Category:";
	$classified[8] = "Comments";
	$classified[9] = "Comment by";
	$classified[10] = "on";
	$classified[11] = "Anonymous";
	$classified[12] = "The user you're looking for doesn't exist.";
	$classified[13] = "An Error Has Occurred";
	$classified[14] = "Write Something...";
	$classified[15] = "Posting...";
	$classified[16] = "Please enter a message.";
	$classified[17] = "You have entered the wrong security code.";
	$classified[18] = "Post Comment";
	$classified[19] = "Enter the numbers you see in this image into the field to its right. This helps keep our site free of spam.";
	$classified[20] = "message";
	$classified[21] = "Send Private Message";
	$classified[22] = "Return";
	$classified[23] = "You must be logged in to view this page. <a href='login.php'>Click here</a> to login.";
	$classified[24] = "Back to ";
	$classified[25] = "'s Listings";
	$classified[26] = "Report Inappropriate Content";
	$classified[27] = "Posted on";
	$classified[28] = "at";
	$classified[29] = "views";
	$classified[30] = "\o\\n";	  //THESE CHARACTERS ARE BEING ESCAPED BECAUSE THEY ARE BEING USED IN A DATE FUNCTION
	break;

  case "user_classified":
	$user_classified[1] = "View My Listings";
	$user_classified[2] = "Listing Settings";
	$user_classified[3] = "My Classified Listings";
	$user_classified[4] = "Classified listings are a great way to list something for sale, find items you need, look for jobs or simply meet new people.";
	$user_classified[5] = "Post New Listing";
	$user_classified[6] = "Search My Listings";
	$user_classified[7] = "Browse Marketplace";
	$user_classified[8] = "Search my listings for:";
	$user_classified[9] = "Last Page";
	$user_classified[10] = "viewing listing";
	$user_classified[11] = "of";
	$user_classified[12] = "viewing listings";
	$user_classified[13] = "Next Page";
	$user_classified[14] = "No classified listings were found.";
	$user_classified[15] = "You do not have any classified listings.";
	$user_classified[16] = "Click here";
	$user_classified[17] = "to post one.";
	$user_classified[18] = "Date";
	$user_classified[19] = "Title";
	$user_classified[20] = "Comments";
	$user_classified[21] = "Untitled";
	$user_classified[22] = "comments";
	$user_classified[23] = "edit listing";
	$user_classified[24] = "delete";
	$user_classified[25] = "Delete Selected";
	$user_classified[26] = "Search";
	$user_classified[27] = "Options";
	$user_classified[28] = "edit photos";
	$user_classified[29] = "Posted on";
	$user_classified[30] = "views";
	break;

  case "user_classified_browse":
	$user_classified_browse[1] = "View My Listings";
	$user_classified_browse[2] = "Listing Settings";
	$user_classified_browse[3] = "Browse Marketplace";
	$user_classified_browse[4] = "Browse Classified Listings (All Listings)";
	$user_classified_browse[5] = "Welcome to the marketplace! Browse for items, post for-sale listings, or wanted ads.";
	$user_classified_browse[6] = "Last Page";
	$user_classified_browse[7] = "showing listing";
	$user_classified_browse[8] = "of";
	$user_classified_browse[9] = "showing listings";
	$user_classified_browse[10] = "Next Page";
	$user_classified_browse[11] = "Untitled";
	$user_classified_browse[12] = "comments";
	$user_classified_browse[13] = "views";
	$user_classified_browse[14] = "Posted on";
	$user_classified_browse[15] = "All Listings";
	$user_classified_browse[16] = "Search";
	$user_classified_browse[17] = "listings";
	$user_classified_browse[18] = "Browse Classified Listings Matching";
	$user_classified_browse[19] = "Search all listings";
	$user_classified_browse[20] = "(Range)";
	break;

  case "user_classified_delete":
	$user_classified_delete[1] = "View My Listings";
	$user_classified_delete[2] = "Listing Settings";
	$user_classified_delete[3] = "Delete Classified Listing?";
	$user_classified_delete[4] = "Are you sure you want to delete this classified listing? It will be removed from your classified and permanently deleted!";
	$user_classified_delete[5] = "Delete listing";
	$user_classified_delete[6] = "Cancel";
	$user_classified_delete[7] = "Browse Marketplace";
	break;

  case "user_classified_edit":
	$user_classified_edit[1] = "View My Listings";
	$user_classified_edit[2] = "Listing Settings";
	$user_classified_edit[3] = "Edit Classified Listing";
	$user_classified_edit[4] = "Edit the details of this classified listing below.";
	$user_classified_edit[5] = "Title:";
	$user_classified_edit[6] = "Category:";
	$user_classified_edit[7] = "Browse Marketplace";
	$user_classified_edit[8] = "Show Privacy Settings";
	$user_classified_edit[10] = "Include this classified listing in search results?";
	$user_classified_edit[11] = "Yes, include this classified listing in search results.";
	$user_classified_edit[12] = "No, exclude this classified listing from search results.";
	$user_classified_edit[13] = "Who can see this listing?";
	$user_classified_edit[14] = "Who can comment on this listing?";
	$user_classified_edit[15] = "Edit Listing";
	$user_classified_edit[16] = "Please provide a complete title and description for this listing.";
	$user_classified_edit[17] = "Cancel";

	$user_classified_edit[18] = "Description:";
	break;


  case "user_classified_edit_media":
	$user_classified_edit_media[1] = "View My Listings";
	$user_classified_edit_media[2] = "Listing Settings";
	$user_classified_edit_media[3] = "Edit Listing Photos";
	$user_classified_edit_media[4] = "Use this page to change the photos shown on this classified listing.";
	$user_classified_edit_media[5] = "Browse Marketplace";
	$user_classified_edit_media[6] = "Your classified listing has been posted! Do you want to add some photos?";
	$user_classified_edit_media[7] = "Small Photo";
	$user_classified_edit_media[8] = "Upload";
	$user_classified_edit_media[9] = "Replace this photo with:";
	$user_classified_edit_media[10] = "delete photo"; // USED IN JAVASCRIPT, ESCAPE ANY DOUBLE QUOTES
	$user_classified_edit_media[11] = "Large Photos";
	$user_classified_edit_media[12] = "delete photo";
	$user_classified_edit_media[13] = "Deleting photo...";
	$user_classified_edit_media[14] = "Add a photo:";
	$user_classified_edit_media[15] = "Back to Listings";
	$user_classified_edit_media[16] = "Your file could not be uploaded. Please upload a valid image file.";
	$user_classified_edit_media[17] = "Add Photos Now";
	$user_classified_edit_media[18] = "Maybe Later";
	break;

  case "user_classified_new":
	$user_classified_new[1] = "View My Listings";
	$user_classified_new[2] = "Listing Settings";
	$user_classified_new[3] = "Post Classified Listing";
	$user_classified_new[4] = "Write your new listing below, then click \"Post Listing\" to publish the listing on your classified.";
	$user_classified_new[5] = "Title:";
	$user_classified_new[6] = "Category:";
	$user_classified_new[7] = "Show Privacy Settings";
	$user_classified_new[8] = "Browse Marketplace";
	$user_classified_new[9] = "Include this classified listing in search results?";
	$user_classified_new[10] = "Yes, include this classified listing in search results.";
	$user_classified_new[11] = "No, exclude this classified listing from search results.";
	$user_classified_new[12] = "Who can see this listing?";
	$user_classified_new[13] = "Who can comment on this listing?";
	$user_classified_new[14] = "Post Listing";
	$user_classified_new[15] = "Please provide a complete title and description for this listing.";
	$user_classified_new[16] = "Cancel";
	$user_classified_new[17] = "Description:";
	break;

  case "user_classified_preview":
	$user_classified_preview[1] = "Untitled";
	break;

  case "user_classified_settings":
	$user_classified_settings[1] = "Your changes have been saved.";
	$user_classified_settings[2] = "View My Listings";
	$user_classified_settings[3] = "Listing Settings";


	$user_classified_settings[6] = "Save Changes";
	$user_classified_settings[7] = "Edit Classified Settings";
	$user_classified_settings[8] = "Edit settings pertaining to your classified listings.";
	$user_classified_settings[9] = "Comment Notifications";
	$user_classified_settings[10] = "Do you want to be notified by email when someone posts a comment on any of your classified listings?";
	$user_classified_settings[11] = "Yes, notify me when someone writes a comment on my classified listings.";
	$user_classified_settings[12] = "There are no settings available for your classified listings.";
	$user_classified_settings[13] = "Browse Marketplace";
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