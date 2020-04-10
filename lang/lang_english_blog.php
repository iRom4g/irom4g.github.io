<?

// SET GENERAL VARIABLES, AVAILABLE ON EVERY PAGE
$header_blog[1] = "Blog";
$header_blog[2] = "Blog Entries";
$header_blog[3] = "view all entries";
$header_blog[4] = "Untitled";
$header_blog[5] = "Posted";

// ASSIGN ALL SMARTY GENERAL BLOG VARIABLES
reset($header_blog);
while(list($key, $val) = each($header_blog)) {
  $smarty->assign("header_blog".$key, $val);
}



// ASSIGN ALL CLASS/FUNCTION FILE VARIABLES
$functions_blog[1] = "Posted by ";
$functions_blog[2] = "blog entries";
$functions_blog[3] = "Untitled";




// SET LANGUAGE PAGE VARIABLES
switch ($page) {

  case "admin_blog":
	$admin_blog[1] = "General Blog Settings";
	$admin_blog[2] = "This page contains general blog settings that affect your entire social network.";
	$admin_blog[3] = "Your changes have been saved.";
	$admin_blog[4] = "Subject";
	$admin_blog[5] = "Message";
	$admin_blog[6] = "New Blog Entry Comment Email";
	$admin_blog[7] = "This is the email that gets sent to a user when a new comment is posted on one of their blog entries. For more system emails, please visit the <a href='admin_emails.php'>System Emails</a> page.";
	$admin_blog[8] = "[username] - replaced with the username of the recepient.<br>[commenter] - replaced with the name of the user who posted the comment.<br>[link] - replaced with the link to the blog entry.";
	$admin_blog[9] = "Save Changes";
	$admin_blog[10] = "Public Permission Defaults";
	$admin_blog[11] = "Select whether or not you want to let the public (visitors that are not logged-in) to view the following sections of your social network. In some cases (such as Profiles, Blogs, and Albums), if you have given them the option, your users will be able to make their pages private even though you have made them publically viewable here. For more permissions settings, please visit the <a href='admin_general.php'>General Settings</a> page.";
	$admin_blog[12] = "Blogs";
	$admin_blog[13] = "Yes, the public can view blogs unless they are made private.";
	$admin_blog[14] = "No, the public cannot view blogs.";
	$admin_blog[15] = "Blog Entry Categories";
	$admin_blog[16] = "If you want to allow your users to categorize their blog entries, create the categories below. This feature is useful if you want to list all your users' blog entries that  If you have no categories, your users will not be given the option of assigning a blog category.";
	$admin_blog[17] = "Add Category";
	break;

  case "admin_levels_blogsettings":
	$admin_levels_blogsettings[1] = "Blog Settings";
	$admin_levels_blogsettings[2] = "If you have allowed users to have blogs, you can adjust their details from this page.";
	$admin_levels_blogsettings[3] = "Entries Per Page";
	$admin_levels_blogsettings[4] = "How many blog entries will be shown per page? (Enter a number between 1 and 999)";
	$admin_levels_blogsettings[5] = "entries per page";
	$admin_levels_blogsettings[6] = "Save Changes";
	$admin_levels_blogsettings[7] = "Your changes have been saved.";
	$admin_levels_blogsettings[8] = "Your entries per page field must contain an integer between 1 and 999.";
	$admin_levels_blogsettings[9] = "Allow Blogs?";
	$admin_levels_blogsettings[10] = "Do you want to let users have blogs? If set to no, all other settings on this page will not apply.";
	$admin_levels_blogsettings[11] = "Yes, allow blogs.";
	$admin_levels_blogsettings[12] = "No, do not allow blogs.";
	$admin_levels_blogsettings[13] = "Allow Custom CSS Styles?";
	$admin_levels_blogsettings[14] = "If you enable this feature, your users will be able to customize the colors and fonts of their blogs by altering their CSS styles.";
	$admin_levels_blogsettings[15] = "Yes, enable custom CSS styles.";
	$admin_levels_blogsettings[16] = "No, disable custom CSS styles.";



	$admin_levels_blogsettings[20] = "<b>Search Privacy Options</b><br>If you enable this feature, users will be able to exclude their blog entries from search results. Otherwise, all blog entries will be included in search results.";
	$admin_levels_blogsettings[21] = "Yes, allow users to exclude their blog entries from search results.";
	$admin_levels_blogsettings[22] = "No, force all blog entries to be included in search results.";
	$admin_levels_blogsettings[26] = "Blog Privacy Options";
	$admin_levels_blogsettings[27] = "<b>Blog Entry Privacy</b><br>Your users can choose from any of the options checked below when they decide who can see their blog entries. These options appear on your users' \"Add Entry\" and \"Edit Entry\" pages. If you do not check any options, everyone will be allowed to view blogs.";
	$admin_levels_blogsettings[28] = "<b>Blog Comment Options</b><br>Your users can choose from any of the options checked below when they decide who can post comments on their entries. If you do not check any options, everyone will be allowed to post comments on entries.";
	$admin_levels_blogsettings[29] = "Editing User Level:";
	$admin_levels_blogsettings[30] = "You are currently editing this user level's settings. Remember, these settings only apply to the users that belong to this user level. When you're finished, you can edit the <a href='admin_levels.php'>other levels here</a>.";
	break;

  case "admin_viewblogs":
	$admin_viewblogs[1] = "View Blog Entries";
	$admin_viewblogs[2] = "This page lists all of the blog entries your users have posted. You can use this page to monitor these blogs and delete offensive material if necessary. Entering criteria into the filter fields will help you find specific blog entries. Leaving the filter fields blank will show all the blog entries on your social network.";
	$admin_viewblogs[3] = "Title";
	$admin_viewblogs[4] = "Owner";
	$admin_viewblogs[5] = "Filter";
	$admin_viewblogs[6] = "ID";
	$admin_viewblogs[7] = "Views";
	$admin_viewblogs[8] = "Date";
	$admin_viewblogs[9] = "Options";
	$admin_viewblogs[10] = "view";
	$admin_viewblogs[11] = "delete";
	$admin_viewblogs[12] = "Blog Entries Found";
	$admin_viewblogs[13] = "Page:";
	$admin_viewblogs[14] = "Delete Blog Entry";
	$admin_viewblogs[15] = "Are you sure you want to delete this blog entry?";
	$admin_viewblogs[16] = "Cancel";
	$admin_viewblogs[17] = "No entries were found.";
	$admin_viewblogs[18] = "Untitled";
	$admin_viewblogs[19] = "Delete Selected";
	break;

  case "blog":
	$blog[1] = "The user you're looking for doesn't exist!";
	$blog[2] = "'s Blog";
	$blog[3] = "has not posted any blog entries.";
	$blog[4] = "Untitled";
	$blog[5] = "comments";
	$blog[6] = "post comment";
	$blog[7] = "Last Page";
	$blog[8] = "viewing entry";
	$blog[9] = "of";
	$blog[10] = "viewing entries";
	$blog[11] = "Next Page";
	$blog[12] = "An Error Has Occurred";
	$blog[13] = "You must be logged in to view this page. <a href='login.php'>Click here</a> to login.";
	$blog[14] = "Return";
	break;

  case "blog_category":
	$blog_category[1] = "All Blog Entries About";
	$blog_category[2] = "Untitled";
	$blog_category[3] = "comments";
	$blog_category[4] = "post comment";

	$blog_category[6] = "Last Page";
	$blog_category[7] = "viewing entry";
	$blog_category[8] = "of";
	$blog_category[9] = "viewing entries";
	$blog_category[10] = "Next Page";
	break;

  case "blog_entry":
	$blog_entry[1] = "You do not have permission to view this file.";
	$blog_entry[2] = "'s Blog Entry:";
	$blog_entry[3] = "'s";
	$blog_entry[4] = "blog";
	$blog_entry[5] = "Untitled";
	$blog_entry[6] = "post comment";
	$blog_entry[7] = "Filed under:";
	$blog_entry[8] = "Comments";
	$blog_entry[9] = "Comment by";
	$blog_entry[10] = "on";
	$blog_entry[11] = "Anonymous";
	$blog_entry[12] = "The user you're looking for doesn't exist.";
	$blog_entry[13] = "An Error Has Occurred";
	$blog_entry[14] = "Write Something...";
	$blog_entry[15] = "Posting...";
	$blog_entry[16] = "Please enter a message.";
	$blog_entry[17] = "You have entered the wrong security code.";
	$blog_entry[18] = "Post Comment";
	$blog_entry[19] = "Enter the numbers you see in this image into the field to its right. This helps keep our site free of spam.";
	$blog_entry[20] = "message";
	$blog_entry[21] = "\o\\n";  //THESE CHARACTERS ARE BEING ESCAPED BECAUSE THEY ARE BEING USED IN A DATE FUNCTION
	$blog_entry[22] = "Return";
	$blog_entry[23] = "You must be logged in to view this page. <a href='login.php'>Click here</a> to login.";
	$blog_entry[24] = "Back to ";
	$blog_entry[25] = "'s Blog";
	$blog_entry[26] = "Report Inappropriate Content";
	break;

  case "user_blog":
	$user_blog[1] = "View Entries";
	$user_blog[2] = "Blog Settings";
	$user_blog[3] = "My Blog Entries";
	$user_blog[4] = "Your blog is a place for you to share your personal thoughts and news with other people. Use this page to search for and manage blog entries that you have already written.";
	$user_blog[5] = "Compose New Entry";
	$user_blog[6] = "Search Entries";
	$user_blog[7] = "My Blog Link:";
	$user_blog[8] = "Search entries for:";
	$user_blog[9] = "Last Page";
	$user_blog[10] = "viewing entry";
	$user_blog[11] = "of";
	$user_blog[12] = "viewing entries";
	$user_blog[13] = "Next Page";
	$user_blog[14] = "No blog entries were found.";
	$user_blog[15] = "You do not have any blog entries.";
	$user_blog[16] = "Click here";
	$user_blog[17] = "to write one.";
	$user_blog[18] = "Date";
	$user_blog[19] = "Title";
	$user_blog[20] = "Comments";
	$user_blog[21] = "Untitled";
	$user_blog[22] = "comments";
	$user_blog[23] = "edit";
	$user_blog[24] = "delete";
	$user_blog[25] = "Delete Selected";
	$user_blog[26] = "Search";
	$user_blog[27] = "Options";
	break;

  case "user_blog_comments":
	$user_blog_comments[1] = "View Entries";
	$user_blog_comments[2] = "Blog Settings";
	$user_blog_comments[3] = "Blog Entry Comments";
	$user_blog_comments[4] = "To delete comments, click their checkboxes and then click the \"Delete Selected\" button below the comment list.";
	$user_blog_comments[5] = "Back to this Entry";
	$user_blog_comments[6] = "Back to Entry List";
	$user_blog_comments[7] = "Last Page";
	$user_blog_comments[8] = "comment";
	$user_blog_comments[9] = "of";
	$user_blog_comments[10] = "comments";
	$user_blog_comments[11] = "Next Page";
	$user_blog_comments[12] = "No comments have been posted about this blog entry.";
	$user_blog_comments[13] = "Anonymous";
	$user_blog_comments[14] = "Delete Selected";
	$user_blog_comments[15] = "select all comments";
	$user_blog_comments[16] = "\o\\n";  //THESE CHARACTERS ARE BEING ESCAPED BECAUSE THEY ARE BEING USED IN A DATE FUNCTION
	break;

  case "user_blog_deleteentry":
	$user_blog_deleteentry[1] = "View Entries";
	$user_blog_deleteentry[2] = "Blog Settings";
	$user_blog_deleteentry[3] = "Delete Blog Entry?";
	$user_blog_deleteentry[4] = "Are you sure you want to delete this blog entry? It will be removed from your blog and permanently deleted!";
	$user_blog_deleteentry[5] = "Delete Entry";
	$user_blog_deleteentry[6] = "Cancel";
	break;

  case "user_blog_editentry":
	$user_blog_editentry[1] = "View Entries";
	$user_blog_editentry[2] = "Blog Settings";
	$user_blog_editentry[3] = "Edit Blog Entry";
	$user_blog_editentry[4] = "Make any desired changes to this blog entry, then click the \"Edit Entry\" button to save your changes.";
	$user_blog_editentry[5] = "Title:";
	$user_blog_editentry[6] = "Category:";
	$user_blog_editentry[7] = "Comments:";
	$user_blog_editentry[8] = "Show Entry Settings";
	$user_blog_editentry[9] = "Hide Entry Settings";
	$user_blog_editentry[10] = "Include this blog entry in search results?";
	$user_blog_editentry[11] = "Yes, include this blog entry in search results.";
	$user_blog_editentry[12] = "No, exclude this blog entry from search results.";
	$user_blog_editentry[13] = "Who can see this entry?";
	$user_blog_editentry[14] = "Who can comment on this entry?";
	$user_blog_editentry[15] = "Post Entry";
	$user_blog_editentry[16] = "Preview Entry";
	$user_blog_editentry[17] = "Cancel";
	break;

  case "user_blog_flash":
	$user_blog_flash[1] = "Upload Flash";
	$user_blog_flash[2] = "New Album:";
	$user_blog_flash[3] = "Upload";
	$user_blog_flash[4] = "OR";
	$user_blog_flash[5] = "Flash URL";
	$user_blog_flash[6] = "Width";
	$user_blog_flash[7] = "Height";
	$user_blog_flash[8] = "Preview";
	$user_blog_flash[9] = "Insert Flash";
	$user_blog_flash[10] = "Cancel";
	$user_blog_flash[11] = "File uploads are not allowed.";
	$user_blog_flash[12] = "Insert Flash";
	$user_blog_flash[13] = "Upload Images"; // This is the name of the album to which flash files will be uploaded through the WYSIWYG blog entry editor.
	$user_blog_flash[14] = "Your flash file was uploaded successfully.";
	break;

  case "user_blog_image":
	$user_blog_image[1] = "File uploads aren't allowed.";
	$user_blog_image[2] = "Create Album & Upload Image"; // USED IN JAVASCRIPT, NO QUOTES OR SPECIAL CHARS ALLOWED
	$user_blog_image[3] = "Upload Image"; // USED IN JAVASCRIPT, NO QUOTES OR SPECIAL CHARS ALLOWED
	$user_blog_image[4] = "Option 1: Upload image from your computer.";
	$user_blog_image[5] = "Upload Image";
	$user_blog_image[6] = "Store in Album:";
	$user_blog_image[7] = "Create New Album";
	$user_blog_image[8] = "New album name:";
	$user_blog_image[9] = "Upload Image";
	$user_blog_image[10] = "Option 2: Insert image from a link.";
	$user_blog_image[11] = "Image URL";
	$user_blog_image[12] = "Width";
	$user_blog_image[13] = "Height";
	$user_blog_image[14] = "Border";
	$user_blog_image[15] = "Preview";
	$user_blog_image[16] = "Insert Image";
	$user_blog_image[17] = "Cancel";
	$user_blog_image[18] = "Insert Image";
	$user_blog_image[19] = "Upload Images"; // This is the name of the album to which images will be uploaded through the WYSIWYG blog entry editor.
	$user_blog_image[20] = "Your image was uploaded successfully.";
	break;

  case "user_blog_link":
	$user_blog_link[1] = "Insert Link";
	$user_blog_link[2] = "Link Name";
	$user_blog_link[3] = "URL";
	$user_blog_link[4] = "Add Link";
	$user_blog_link[5] = "Cancel";
	break;

  case "user_blog_newentry":
	$user_blog_newentry[1] = "View Entries";
	$user_blog_newentry[2] = "Blog Settings";
	$user_blog_newentry[3] = "New Blog Entry";
	$user_blog_newentry[4] = "Write your new entry below, then click \"Post Entry\" to publish the entry on your blog.";
	$user_blog_newentry[5] = "Title:";
	$user_blog_newentry[6] = "Category:";
	$user_blog_newentry[7] = "Show Entry Settings";
	$user_blog_newentry[8] = "Hide Entry Settings";
	$user_blog_newentry[9] = "Include this blog entry in search results?";
	$user_blog_newentry[10] = "Yes, include this blog entry in search results.";
	$user_blog_newentry[11] = "No, exclude this blog entry from search results.";
	$user_blog_newentry[12] = "Who can see this entry?";
	$user_blog_newentry[13] = "Who can comment on this entry?";
	$user_blog_newentry[14] = "Post Entry";
	$user_blog_newentry[15] = "Preview Entry";
	$user_blog_newentry[16] = "Cancel";
	break;

  case "user_blog_preview":
	$user_blog_preview[1] = "Untitled";
	break;

  case "user_blog_settings":
	$user_blog_settings[1] = "Your changes have been saved.";
	$user_blog_settings[2] = "View Entries";
	$user_blog_settings[3] = "Blog Settings";
	$user_blog_settings[4] = "Custom Blog Styles";
	$user_blog_settings[5] = "You can change the colors, fonts, and styles of your blog by adding CSS code below. The contents of the text area below will be output between &lt;style&gt; tags on your blog.";
	$user_blog_settings[6] = "Save Changes";
	$user_blog_settings[7] = "Edit Blog Settings";
	$user_blog_settings[8] = "Edit blog settings such as your blog's style.";
	$user_blog_settings[9] = "Blog Notification";
	$user_blog_settings[10] = "Do you want to be notified by email when someone posts a comment on your blog entries?";
	$user_blog_settings[11] = "Yes, notify me when someone writes a comment on my blog entries.";
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