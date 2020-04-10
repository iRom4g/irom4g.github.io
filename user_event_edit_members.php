<?
$page = "user_event_edit_members";
include "header.php";

if(isset($_POST['event_id'])) { $event_id = $_POST['event_id']; } elseif(isset($_GET['event_id'])) { $event_id = $_GET['event_id']; } else { $event_id = 0; }
if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }
if(isset($_POST['search'])) { $search = $_POST['search']; } elseif(isset($_GET['search'])) { $search = $_GET['search']; } else { $search = ""; }
if(isset($_POST['status'])) { $status = $_POST['status']; } elseif(isset($_GET['status'])) { $status = $_GET['status']; } else { $status = ""; }
if(isset($_POST['p'])) { $p = $_POST['p']; } elseif(isset($_GET['p'])) { $p = $_GET['p']; } else { $p = 1; }

// INITIALIZE EVENT OBJECT
$event = new se_event($user->user_info[user_id], $event_id);

if($event->event_exists == 0) { header("Location: user_event.php"); exit(); }
if($event->event_info[event_user_id] != $user->user_info[user_id]) { header("Location: user_event.php"); exit(); }


// SET VARS
$result = "";



// INVITE USERS
if($task == "doinvites") {
  $num_invited = $_POST['num_invited'];

  // LOOP THROUGH INVITED USERS
  $invited_count_success = 0;
  for($i=1;$i<=$num_invited;$i++) {
    $var = "invited_username".$i;
    $invited_username = $_POST[$var];
    // IF FIELD IS NOT BLANK, CHECK IF USER WITH THIS USERNAME EXISTS AND IS NOT ALREADY A MEMBER OF THE EVENT
    if(str_replace(" ", "", $invited_username) != "") {
      $invited_query = $database->database_query("SELECT se_users.user_id, se_users.user_username, se_users.user_email, se_usersettings.usersetting_notify_eventinvite FROM se_users LEFT JOIN se_usersettings ON se_users.user_id=se_usersettings.usersetting_user_id LEFT JOIN se_eventmembers ON se_users.user_id=se_eventmembers.eventmember_user_id AND se_eventmembers.eventmember_event_id='$event_id' WHERE se_users.user_username='$invited_username' AND se_eventmembers.eventmember_id IS NULL LIMIT 1");
      if($database->database_num_rows($invited_query) == 1) {
	$invited_info = $database->database_fetch_assoc($invited_query);
	$database->database_query("INSERT INTO se_eventmembers (eventmember_user_id, 
								eventmember_event_id, 
								eventmember_status) VALUES (
								'$invited_info[user_id]',
								'$event_id',
								'0')");
	// SEND INVITE EMAIL
        if($invited_info[usersetting_notify_eventinvite] == 1) { send_generic($invited_info[user_email], "$setting[setting_email_fromname] <$setting[setting_email_fromemail]>", $setting[setting_email_eventinvite_subject], $setting[setting_email_eventinvite_message], Array('[username]', '[eventname]', '[link]'), Array($invited_info[user_username], $event->event_info[event_title], "<a href=\"".$url->url_base."login.php\">".$url->url_base."login.php</a>")); }
	$invited_count_success++;
      }
    }
  }

  $result = "$invited_count_success $user_event_edit_members[3]";
}



// INVITE MEMBER
if($task == "invite") {
  // MAKE SURE EVENT MEMBER EXISTS, BELONGS TO THIS EVENT, AND HAS STATUS=-1
  $eventmember_id = $_GET['eventmember_id'];
  $eventmember_query = $database->database_query("SELECT eventmember_id, eventmember_event_id, eventmember_user_id FROM se_eventmembers WHERE eventmember_id='$eventmember_id' AND eventmember_event_id='".$event->event_info[event_id]."' AND eventmember_status='-1' LIMIT 1");
  if($database->database_num_rows($eventmember_query) != 1) { header("Location: user_event_edit_members.php?event_id=".$event->event_info[event_id]); exit; }
  $eventmember_info = $database->database_fetch_assoc($eventmember_query);
  $database->database_query("UPDATE se_eventmembers SET eventmember_status='0' WHERE eventmember_id='$eventmember_info[eventmember_id]' LIMIT 1");
  $result = $user_event_edit_members[40];
}

// REJECT INVITATION REQUEST OR REMOVE MEMBER
if($task == "remove") {
  // MAKE SURE EVENT MEMBER EXISTS, BELONGS TO THIS EVENT, AND HAS STATUS=-1
  $eventmember_id = $_GET['eventmember_id'];
  $eventmember_query = $database->database_query("SELECT eventmember_id, eventmember_event_id, eventmember_user_id, eventmember_status FROM se_eventmembers WHERE eventmember_id='$eventmember_id' AND eventmember_event_id='".$event->event_info[event_id]."' LIMIT 1");
  if($database->database_num_rows($eventmember_query) != 1) { header("Location: user_event_edit_members.php?event_id=".$event->event_info[event_id]); exit; }
  $eventmember_info = $database->database_fetch_assoc($eventmember_query);
  $database->database_query("DELETE FROM se_eventmembers WHERE eventmember_id='$eventmember_info[eventmember_id]' AND eventmember_event_id='$eventmember_info[eventmember_event_id]' LIMIT 1");
  if($eventmember_info[eventmember_status] == "-1") {
    $result = $user_event_edit_members[39];
  } else {
    $result = $user_event_edit_members[42];
  }
}








// SET SORT/WHERE CLAUSE
$sort = "se_users.user_username";
$where = "(";
switch($status) {
  case "0":
  case "1":
  case "2":
  case "3":
    $where .= "se_eventmembers.eventmember_status='$status'";
    break;
  default:
    $where .= "se_eventmembers.eventmember_status<>'-1'";
}
if($search != "") { $where .= " AND (se_users.user_username LIKE '%$search%' OR se_users.user_email LIKE '%$search%')"; }
$where .= ")";


// GET TOTAL MEMBERS
$total_members = $event->event_member_total($where);

// MAKE MEMBER PAGES
$members_per_page = 10;
$page_vars = make_page($total_members, $members_per_page, $p);

// GET MEMBER ARRAY
$members = $event->event_member_list($page_vars[0], $members_per_page, $sort, $where);

// GET LIST OF FRIENDS FOR SUGGEST BOX
$total_friends = $user->user_friend_total(0);
$friends = $user->user_friend_list(0, $total_friends, 0);

// GET MEMBERS AWAITING APPROVAL
$where = "(se_eventmembers.eventmember_status='-1')";
$unapproved_users_total = $event->event_member_total($where);
$unapproved_array = $event->event_member_list(0, $unapproved_users_total, "eventmember_id DESC", $where);


// ASSIGN VARIABLES AND SHOW USER EDIT EVENT MEMBERS PAGE
$smarty->assign('event', $event);
$smarty->assign('total_members', $total_members);
$smarty->assign('members', $members);
$smarty->assign('p', $page_vars[1]);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($members));
$smarty->assign('u', $u);
$smarty->assign('l', $l);
$smarty->assign('t', $t);
$smarty->assign('r', $r);
$smarty->assign('s', $s);
$smarty->assign('search', $search);
$smarty->assign('status', $status);
$smarty->assign('friends', $friends);
$smarty->assign('unapproved', $unapproved_array);
$smarty->assign('result', $result);
include "footer.php";
?>