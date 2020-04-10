<?
$page = "user_friends_confirm";
include "header.php";


if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }

// CHECK FOR REDIRECTION URL
if(isset($_POST['return_url'])) { $return_url = $_POST['return_url']; } elseif(isset($_GET['return_url'])) { $return_url = $_GET['return_url']; } else { $return_url = ""; }
$return_url = urldecode($return_url);
$return_url = str_replace("&amp;", "&", $return_url);

// ENSURE CONECTIONS ARE ALLOWED FOR THIS USER
if($setting[setting_connection_allow] == 0) { header("Location: user_home.php"); exit(); }

// DISPLAY ERROR PAGE IF NO OWNER
if($owner->user_exists == 0) {
  $page = "error";
  $smarty->assign('error_header', $user_friends_confirm[1]);
  $smarty->assign('error_message', $user_friends_confirm[2]);
  $smarty->assign('error_submit', $user_friends_confirm[15]);
  include "footer.php";
}


// GET FRIEND TYPES IF AVAILABLE
$connection_types = explode("<!>", trim($setting[setting_connection_types]));
if(count($connection_types) == 0 | str_replace(" ", "", $setting[setting_connection_types]) == "") { $friend_types = ""; } else { $friend_types = $connection_types; }





// RETURN USER TO FRIEND REQUEST PAGE IF INCORRECT USER IS SELECTED
if($task == "remove" | $task == "edit" | $task == "editdo") {
  $friend = $database->database_query("SELECT friend_id FROM se_friends WHERE friend_user_id1='".$user->user_info[user_id]."' AND friend_user_id2='".$owner->user_info[user_id]."' AND friend_status='1'");
  if($database->database_num_rows($friend) != 1) { header("Location: user_friends.php"); exit(); }
} elseif($task == "cancelrequest") {
  $friend = $database->database_query("SELECT friend_id FROM se_friends WHERE friend_user_id1='".$user->user_info[user_id]."' AND friend_user_id2='".$owner->user_info[user_id]."' AND friend_status='0'");
  if($database->database_num_rows($friend) != 1) { header("Location: user_friends_requests_outgoing.php"); exit(); }
} else {
  $friend = $database->database_query("SELECT friend_id FROM se_friends WHERE friend_user_id1='".$owner->user_info[user_id]."' AND friend_user_id2='".$user->user_info[user_id]."' AND friend_status='0'");
  if($database->database_num_rows($friend) != 1) { header("Location: user_friends_requests.php"); exit(); }
}








// CANCEL
if($task == "cancel") {
  header("Location: user_friends_requests.php");
  exit();
}





// CANCEL FRIENDSHIP REQUEST AND SEND USER BACK
if($task == "cancelrequest") {
  $user->user_friend_remove($owner->user_info[user_id]);
  header("Location: user_friends_requests_outgoing.php");
  exit;
}







// CONFIRM FRIENDSHIP REQUEST
if($task == "confirm") {

  $friend1 = $database->database_query("SELECT friend_id FROM se_friends WHERE friend_user_id1='".$owner->user_info[user_id]."' AND friend_user_id2='".$user->user_info[user_id]."' AND friend_status='0'");
  $friend2 = $database->database_query("SELECT friend_id FROM se_friends WHERE friend_user_id2='".$owner->user_info[user_id]."' AND friend_user_id1='".$user->user_info[user_id]."'");

  // CONFIRM FRIEND REQUEST  
  if($database->database_num_rows($friend1) == 1) {
    $friendship = $database->database_fetch_assoc($friend1);
    $database->database_query("UPDATE se_friends SET friend_status='1' WHERE friend_id='$friendship[friend_id]'");

    // INSERT ACTION
    $actions->actions_add($user, "addfriend", Array('[username1]', '[username2]'), Array($user->user_info[user_username], $owner->user_info[user_username]));

    // INSERT ACTION
    $actions->actions_add($owner, "addfriend", Array('[username1]', '[username2]'), Array($owner->user_info[user_username], $user->user_info[user_username]));

  }

  // INSERT ADDITIONAL ROW IF TWO-DIRECTIONAL CONFIRMED
  if($database->database_num_rows($friend2) == 0 & $setting[setting_connection_framework] == 0) {
    $user->user_friend_add($owner->user_info[user_id], 1, '', '');

  // UPDATE ROW IF TWO-DIRECTIONAL BUT ROW ALREADY EXISTS
  } elseif($database->database_num_rows($friend2) != 0 & $setting[setting_connection_framework] == 0) {
    $friendship = $database->database_fetch_assoc($friend2);
    $database->database_query("UPDATE se_friends SET friend_status='1' WHERE friend_id='$friendship[friend_id]'");
  }

  // UPDATE STATS
  update_stats("friends");

  // DECIDE WHETHER TO EDIT DETAILS
  if($setting[setting_connection_framework] != 0) {
    // DECIDE WHERE TO SEND USER IF ADDITIONAL FRIEND REQUESTS
    if($user->user_friend_total(1, 0) == 0) { header("Location: user_friends.php"); exit(); } else { header("Location: user_friends_requests.php"); exit(); }
  } else {
    if((count($connection_types) == 0 | str_replace(" ", "", $setting[setting_connection_types]) == "") & $setting[setting_connection_other] == 0 & $setting[setting_connection_explain] == 0) {
      if($user->user_friend_total(1, 0) == 0) { header("Location: user_friends.php"); exit(); } else { header("Location: user_friends_requests.php"); exit(); }
    } else {
      $task = "edit";
    }
  }
}












// REJECT FRIENDSHIP REQUEST AND SEND USER BACK
if($task == "reject") {
  $owner->user_friend_remove($user->user_info[user_id]);
  if($user->user_friend_total(1, 0) == 0) { header("Location: user_friends.php"); exit(); } else { header("Location: user_friends_requests.php"); exit(); }
}











// REMOVE FRIENDSHIP AND SEND USER BACK
if($task == "remove") {
  $user->user_friend_remove($owner->user_info[user_id]);
  if($return_url == "") { header("Location: user_friends.php"); exit(); } else { header("Location: $return_url"); exit(); }
}











// EDIT FRIENDSHIP DETAILS
if($task == "editdo") {
  $friend_type = $_POST['friend_type'];
  $friend_type_other = censor($_POST['friend_type_other']);
  $friend_explain = censor($_POST['friend_explain']); 

  if(count($connection_types) == 0) { $friend_type = ""; }
  if($setting[setting_connection_other] == 0) { $friend_type_other = ""; }
  if($setting[setting_connection_explain] == 0) { $friend_explain = ""; }

  if($friend_type == "other_friendtype") { $friend_type = ""; }
  if(str_replace(" ", "", $friend_type_other) != "") { $friend_type = $friend_type_other; }

  $friendship = $database->database_fetch_assoc($database->database_query("SELECT friend_id FROM se_friends WHERE friend_user_id2='".$owner->user_info[user_id]."' AND friend_user_id1='".$user->user_info[user_id]."' AND friend_status='1'"));

  $database->database_query("UPDATE se_friends SET friend_type='$friend_type' WHERE friend_id='$friendship[friend_id]'");
  $database->database_query("UPDATE se_friendexplains SET friendexplain_body='$friend_explain' WHERE friendexplain_friend_id='$friendship[friend_id]'");    

  // DECIDE WHERE TO SEND USER IF ADDITIONAL FRIEND REQUESTS
  if($user->user_friend_total(1, 0) == 0) { header("Location: user_friends.php"); exit(); } else { header("Location: user_friends_requests.php"); exit(); }
}




// SHOW EDIT FRIENDSHIP PAGE
if($task == "edit") {

  $friendship = $database->database_fetch_assoc($database->database_query("SELECT friend_id, friend_type FROM se_friends WHERE friend_user_id2='".$owner->user_info[user_id]."' AND friend_user_id1='".$user->user_info[user_id]."' AND friend_status='1'"));
  $friend_explain = $database->database_fetch_assoc($database->database_query("SELECT friendexplain_id, friendexplain_body FROM se_friendexplains WHERE friendexplain_friend_id='$friendship[friend_id]'"));
  
  $friend_type = $friendship[friend_type];
  $friend_type_other = $friendship[friend_type];
  $friend_explain = $friend_explain[friendexplain_body];

  if(count($connection_types) == 0) { $friend_type = ""; }
  if($setting[setting_connection_other] == 0) { $friend_type_other = ""; }
  if($setting[setting_connection_explain] == 0) { $friend_explain = ""; }
  if(in_array($friend_type, $connection_types)) { $friend_type_other = ""; }

}



// ASSIGN VARIABLES AND INCLUDE FOOTER
$smarty->assign('friend_type', $friend_type);
$smarty->assign('friend_type_other', $friend_type_other);
$smarty->assign('friend_explain', $friend_explain);
$smarty->assign('friend_types', $friend_types);
include "footer.php";
?>