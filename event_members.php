<?
$page = "event_members";
include "header.php";

// GET PAGE VARIABLE
if(isset($_POST['p'])) { $p = $_POST['p']; } elseif(isset($_GET['p'])) { $p = $_GET['p']; } else { $p = 1; }
if(isset($_POST['event_id'])) { $event_id = $_POST['event_id']; } elseif(isset($_GET['event_id'])) { $event_id = $_GET['event_id']; } else { $event_id = 0; }
if(isset($_POST['status'])) { $status = $_POST['status']; } elseif(isset($_GET['status'])) { $status = $_GET['status']; } else { $status = ""; }

// DISPLAY ERROR PAGE IF USER IS NOT LOGGED IN AND ADMIN SETTING REQUIRES REGISTRATION
if($user->user_exists == 0 & $setting[setting_permission_event] == 0) {
  $page = "error";
  $smarty->assign('error_header', $event_members[14]);
  $smarty->assign('error_message', $event_members[15]);
  $smarty->assign('error_submit', $event_members[16]);
  include "footer.php";
}


// INITIALIZE EVENT OBJECT
$event = new se_event($user->user_info[user_id], $event_id);
if($event->event_exists == 0) { header("Location: home.php"); exit(); }

// GET PRIVACY LEVEL
$privacy_level = $event->event_privacy_max($user, $event->eventowner_level_info[level_event_privacy]);
$allowed_privacy = true_privacy($event->event_info[event_privacy], $event->eventowner_level_info[level_event_privacy]);
$is_event_private = 0;
if($privacy_level < $allowed_privacy) { header("Location: event.php?event_id=".$event->event_info[event_id]); exit(); }



// SET WHERE/SORT
$sort = "se_users.user_username";
switch($status) {
  case "0":
  case "1":
  case "2":
  case "3":
    $where = "(se_eventmembers.eventmember_status='$status')";
    break;
  default:
    $where = "(se_eventmembers.eventmember_status<>'-1')";
}

// GET TOTAL MEMBERS
$total_members = $event->event_member_total($where);

// MAKE MEMBER PAGES
$members_per_page = 10;
$page_vars = make_page($total_members, $members_per_page, $p);

// GET MEMBER ARRAY
$members = $event->event_member_list($page_vars[0], $members_per_page, $sort, $where);

// ASSIGN VARIABLES AND DISPLAY BROWSE PAGE
$smarty->assign('event', $event);
$smarty->assign('members', $members);
$smarty->assign('total_members', $total_members);
$smarty->assign('status', $status);
$smarty->assign('p', $page_vars[1]);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($members));
include "footer.php";
?>