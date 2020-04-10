<?
$page = "home";
include "header.php";

// DISPLAY ERROR PAGE IF USER IS NOT LOGGED IN AND ADMIN SETTING REQUIRES REGISTRATION
if($user->user_exists == 0 & $setting[setting_permission_portal] == 0) {
  $page = "error";
  $smarty->assign('error_header', $home[41]);
  $smarty->assign('error_message', $home[40]);
  $smarty->assign('error_submit', $home[27]);
  include "footer.php";
}

// IF PREVIOUSLY LOGGED IN EMAIL COOKIE AVAILABLE, SET IT
if(isset($_COOKIE['prev_email'])) { $prev_email = $_COOKIE['prev_email']; } else { $prev_email = ""; }

// GET RECENT SIGNUPS
$signups_query = $database->database_query("SELECT user_id, user_username, user_photo FROM se_users WHERE user_verified='1' AND user_enabled='1' ORDER BY user_signupdate DESC LIMIT 20");
$signup_array = Array();
while($signup = $database->database_fetch_assoc($signups_query)) {

  $signup_user = new se_user();
  $signup_user->user_info[user_id] = $signup[user_id];
  $signup_user->user_info[user_username] = $signup[user_username];
  $signup_user->user_info[user_photo] = $signup[user_photo];

  $signup_array[] = $signup_user;
}



// GET RECENT POPULAR USERS (MOST FRIENDS)
$friends_query = $database->database_query("SELECT count(se_friends.friend_user_id2) AS num_friends, se_users.user_id, se_users.user_username, se_users.user_photo FROM se_friends LEFT JOIN se_users ON se_friends.friend_user_id1=se_users.user_id WHERE se_friends.friend_status='1' GROUP BY se_users.user_id ORDER BY num_friends DESC LIMIT 20");
$friend_array = Array();
while($friend = $database->database_fetch_assoc($friends_query)) {

  $friend_user = new se_user();
  $friend_user->user_info[user_id] = $friend[user_id];
  $friend_user->user_info[user_username] = $friend[user_username];
  $friend_user->user_info[user_photo] = $friend[user_photo];

  $friend_array[] = Array('friend' => $friend_user,
		       'total_friends' => $friend[num_friends]);
}




// GET RECENT LOGINS
$logins_query = $database->database_query("SELECT user_id, user_username, user_photo FROM se_users ORDER BY user_lastlogindate DESC LIMIT 20");
$login_array = Array();
while($login = $database->database_fetch_assoc($logins_query)) {

  $login_user = new se_user();
  $login_user->user_info[user_id] = $login[user_id];
  $login_user->user_info[user_username] = $login[user_username];
  $login_user->user_info[user_photo] = $login[user_photo];

  $login_array[] = $login_user;
}



// GET NEWS ITEMS
$news = $database->database_query("SELECT * FROM se_announcements ORDER BY announcement_order DESC LIMIT 20");
$news_array = Array();
$news_count = 0;
while($item = $database->database_fetch_assoc($news)) {

  // CONVERT SUBJECT/BODY BACK TO HTML
  $item['announcement_body'] = htmlspecialchars_decode($item['announcement_body'], ENT_QUOTES);
  $item['announcement_subject'] = htmlspecialchars_decode($item['announcement_subject'], ENT_QUOTES);

  $news_array[$news_count] = Array('item_id' => $item[announcement_id],
				   'item_date' => $item[announcement_date],
				   'item_subject' => $item[announcement_subject],
				   'item_body' => $item[announcement_body]);
  $news_count++;
}






// UPDATE REFERRING URLS TABLE
update_refurls();


// GET TOTALS
$total_members = $database->database_num_rows($database->database_query("SELECT user_id FROM se_users"));
$total_friends = $database->database_num_rows($database->database_query("SELECT friend_id FROM se_friends WHERE friend_status='1'"));

// LOOP THROUGH COMMENT TABLES TO GET TOTAL COMMENTS
$total_comments = 0;
$comment_tables = $database->database_query("SHOW TABLES FROM `$database_name` LIKE 'se_%comments'");
while($table_info = $database->database_fetch_array($comment_tables)) {
  $comment_type = strrev(substr(strrev(substr($table_info[0], 3)), 8));
  $total_comments += $database->database_num_rows($database->database_query("SELECT ".$comment_type."comment_id FROM se_".$comment_type."comments"));
}


// ASSIGN SMARTY VARIABLES AND INCLUDE FOOTER
$smarty->assign('prev_email', $prev_email);
$smarty->assign('signups', $signup_array);
$smarty->assign('friends', $friend_array);
$smarty->assign('logins', $login_array);
$smarty->assign('news', $news_array);
$smarty->assign('news_total', $news_count);
$smarty->assign('total_members', $total_members);
$smarty->assign('total_friends', $total_friends);
$smarty->assign('total_comments', $total_comments);
$smarty->assign('ip', $_SERVER['REMOTE_ADDR']);
$smarty->assign('online_users', online_users());
include "footer.php";
?>