<?
// SET GENERAL VARIABLES, AVAILABLE ON EVERY PAGE
$header_chat[1] = "Chat";

// ASSIGN ALL SMARTY GENERAL CHAT VARIABLES
reset($header_chat);
while(list($key, $val) = each($header_chat)) {
  $smarty->assign("header_chat".$key, $val);
}



// SET LANGUAGE PAGE VARIABLES
switch ($page) {

  case "admin_chat":
	$admin_chat[1] = "Chat Settings";
	$admin_chat[2] = "Live chat is a great way to encourage user interaction on your social network. Use the settings below to configure how your chat room will work. You can also use this page to kick or ban users from the chatroom.";
	$admin_chat[3] = "Your changes have been saved.";
	$admin_chat[4] = "has been kicked from the chatroom.";
	$admin_chat[5] = "Users Currently Chatting";
	$admin_chat[6] = "The following users are currently chatting in the chatroom. Clicking a username will <b>kick</b> them from the chatroom. Kicking a user will prevent them from logging back into the chat for five minutes. If you want to permanently ban someone, see the box at the bottom of this page.";
	$admin_chat[7] = "There are currently no users chatting.";
	$admin_chat[8] = "Enable Chatroom";
	$admin_chat[9] = "Do you want to allow users to join the chatroom? If you change this to \"no\", and users currently chatting will be disconnected.";
	$admin_chat[10] = "Yes, users may login to the chatroom.";
	$admin_chat[11] = "No, the chatroom is closed.";
	$admin_chat[12] = "Update Frequency";
	$admin_chat[13] = "The chatroom application connects to your server (using AJAX) every few seconds to get new data. How often do you want this process to occur? A shorter amount of time will make the chat slightly faster but will also consume more server resources. If your server is experiencing slowdown issues, try increasing this value from the default (2 seconds).";
	$admin_chat[14] = "seconds";
	$admin_chat[15] = "Online User List";
	$admin_chat[16] = "The chatroom includes a frame that displays what users are currently logged-in to the chat. Do you want this list to simply be a textual list of usernames (like AIM's buddy list), or would you prefer to include each user's photo next to their username? If you expect your room to have many online users, you may want to just show a list of usernames.";
	$admin_chat[17] = "Yes, show each user's photo next to their username.";
	$admin_chat[18] = "No, just show a list of usernames.";
	$admin_chat[19] = "Ban Usernames";
	$admin_chat[20] = "If you want to ban certain users from logging into the chat, you can enter their usernames below (separated by commas only).";
	$admin_chat[21] = "Save Changes";
	break;

  case "chat":
	$chat[1] = "An Error Has Occurred";
	$chat[2] = "You must be logged in to view this page. <a href='login.php'>Click here</a> to login.";
	$chat[3] = "Return";
	break;

  case "chat_frame":
	$chat_frame[1] = "Welcome to the chatroom!";
	$chat_frame[2] = "Logging you in as";
	$chat_frame[3] = "...";
	$chat_frame[4] = "Live Chat";
	$chat_frame[5] = "Bold";
	$chat_frame[6] = "Italics";
	$chat_frame[7] = "Underline";
	$chat_frame[8] = "Smilies";
	$chat_frame[9] = "Color";
	$chat_frame[10] = "Timestamp";
	$chat_frame[11] = "Audio On/Off";
	$chat_frame[12] = "person chatting";
	$chat_frame[13] = "people chatting";
	$chat_frame[14] = "Your have been logged out of the chatroom.<br>Either you have experienced a connection issue,<br>or you have been kicked by an administrator.<br><br>Please try again in a few minutes.";
	$chat_frame[15] = "Your connection to the chatroom has timed out.<br><br>Please <a href='chat_frame.php'>click here</a> to login again or try again later.";
	$chat_frame[16] = "You have been kicked from the chatroom by the administrator.<br>You will be able to login again in a few minutes.";
	$chat_frame[17] = "You have been banned from the chatroom by the administrator.";
	$chat_frame[18] = "The chatroom has been disabled by the administrator.<br>Check back soon!";
	$chat_frame[19] = "You could not login due to a server error.<br>Please notify the administrator!";
	$chat_frame[20] = " has just joined the chat.";
	$chat_frame[21] = " has just left the chat.";
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