<?
$page = "user_home";
include "header.php";

if(isset($_GET['task'])) { $task = $_GET['task']; } elseif(isset($_POST['task'])) { $task = $_POST['task']; } else { $task = "main"; }



// RESET PROFILE VIEWS
if($task == "resetviews") {
  $database->database_query("UPDATE se_users SET user_views_profile='0' WHERE user_id='".$user->user_info[user_id]."' LIMIT 1");
  header("Location: user_home.php"); exit;
}



// SET VARIABLES AND INITIALIZE GROUP OBJECT
$group = new se_group($user->user_info[user_id]);
$sort_by = "se_groupmembers.groupmember_rank DESC, se_groups.group_title";
$where = "(se_groupmembers.groupmember_status='1')";

// GET TOTAL GROUPS
$total_groups = $group->group_total($where);

// GET GROUPS ARRAY
$group_array = $group->group_list(0, $total_groups, $sort_by, $where, 1);

// ASSIGN VARIABLES AND SHOW VIEW GROUPS PAGE
$smarty->assign('groups', $group_array);
$smarty->assign('total_groups', $total_groups);


// GET TOTAL FRIEND REQUESTS
$total_friend_requests = $user->user_friend_total(1, 0);


// GET NEWS ITEMS
$news = $database->database_query("SELECT * FROM se_announcements ORDER BY announcement_order DESC LIMIT 3");
$news_array = Array();
$news_count = 0;
while($item = $database->database_fetch_assoc($news)) {

  // CONVERT BODY BACK TO HTML
  $item[announcement_body] = htmlspecialchars_decode($item[announcement_body], ENT_QUOTES);
  $item['announcement_subject'] = htmlspecialchars_decode($item['announcement_subject'], ENT_QUOTES);

  $news_array[$news_count] = Array('item_id' => $item[announcement_id],
				   'item_date' => $item[announcement_date],
				   'item_subject' => $item[announcement_subject],
				   'item_body' => $item[announcement_body]);
  $news_count++;
}


// GET PLUGIN NOTIFICATIONS IF NECESSARY
$notifications = Array();
for($g=0;$g<count($global_plugins);$g++) {
  if(function_exists('notification_'.$global_plugins[$g])) {
    call_user_func_array('notification_'.$global_plugins[$g], array(&$notifications)); 
  }
}


// GET RECENT ACTIVITY (ACTIONS)
$actions = $actions->actions_display();

////////////////////////////////////////////////////////////
// GET FRIENDS LIST
$friends = $user->user_friend_list(0, 5, 0, 1, "RAND()");
$total_friends = $user->user_friend_total();
$smarty->assign('friends', $friends);
$smarty->assign('total_friends', $total_friends);

////////////////////////////////////////////////////////////

// ASSIGN SMARTY VARS AND INCLUDE FOOTER
$smarty->assign('notifications', $notifications);
$smarty->assign('total_friends', $total_friends);
$smarty->assign('total_friend_requests', $total_friend_requests);
$smarty->assign('news', $news_array);
$smarty->assign('news_total', $news_count);
$smarty->assign('actions', $actions);
$smarty->assign('online_users', online_users());
include "footer.php";
?>