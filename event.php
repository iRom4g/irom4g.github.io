<?
$page = "event";
include "header.php";

if(isset($_GET['event_id'])) { $event_id = $_GET['event_id']; } else { $event_id = 0; }

// DISPLAY ERROR PAGE IF USER IS NOT LOGGED IN AND ADMIN SETTING REQUIRES REGISTRATION
if($user->user_exists == 0 & $setting[setting_permission_event] == 0) {
  $page = "error";
  $smarty->assign('error_header', $event[28]);
  $smarty->assign('error_message', $event[30]);
  $smarty->assign('error_submit', $event[39]);
  include "footer.php";
}


// INITIALIZE EVENT OBJECT
$event_test = new se_event($user->user_info[user_id], $event_id);
if($event_test->event_exists == 0) { 
  $page = "error";
  $smarty->assign('error_header', $event[28]);
  $smarty->assign('error_message', $event[41]);
  $smarty->assign('error_submit', $event[39]);
  include "footer.php";
}
$event = $event_test;


// GET PRIVACY LEVEL
$privacy_level = $event->event_privacy_max($user, $event->eventowner_level_info[level_event_privacy]);
$allowed_privacy = true_privacy($event->event_info[event_privacy], $event->eventowner_level_info[level_event_privacy]);
$is_event_private = 0;
if($privacy_level < $allowed_privacy) { $is_event_private = 1; }

// UPDATE EVENT VIEWS IF EVENT VISIBLE
if($is_event_private == 0) {
  $event_views = $event->event_info[event_views]+1;
  $database->database_query("UPDATE se_events SET event_views='$event_views' WHERE event_id='".$event->event_info[event_id]."'");
}

// GET EVENT LEADER INFO
$eventowner_info = $database->database_fetch_assoc($database->database_query("SELECT user_id, user_username FROM se_users WHERE user_id='".$event->event_info[event_user_id]."'"));

// GET EVENT CATEGORY
$event_category = "";
$parent_category = "";
$event_category_query = $database->database_query("SELECT eventcat_id, eventcat_title, eventcat_dependency FROM se_eventcats WHERE eventcat_id='".$event->event_info[event_eventcat_id]."' LIMIT 1");
if($database->database_num_rows($event_category_query) == 1) {
  $event_category_info = $database->database_fetch_assoc($event_category_query);
  $event_category = $event_category_info[eventcat_title];
  if($event_category_info[eventcat_dependency] != 0) {
    $parent_category = $database->database_fetch_assoc($database->database_query("SELECT eventcat_id, eventcat_title FROM se_eventcats WHERE eventcat_id='".$event_category_info[eventcat_dependency]."' LIMIT 1"));
  }
}


// GET EVENT COMMENTS
$comment = new se_comment('event', 'event_id', $event->event_info[event_id]);
$total_comments = $comment->comment_total();
$comments = $comment->comment_list(0, 10);


// GET INVITED MEMBERS
$where = "(se_eventmembers.eventmember_status<>'-1')";
$total_invited = $event->event_member_total($where);
$members_invited = $event->event_member_list(0, 5, "RAND()", $where);

// GET GUESTS WHO HAVEN'T RESPONDED YET
$where = "(se_eventmembers.eventmember_status='0')";
$total_mia = $event->event_member_total($where);
$members_mia = $event->event_member_list(0, 3, "RAND()", $where);

// GET ATTENDING GUESTS
$where = "(se_eventmembers.eventmember_status='1')";
$total_attending = $event->event_member_total($where);
$members_attending = $event->event_member_list(0, 5, "RAND()", $where);

// GET "MAYBE" GUESTS
$where = "(se_eventmembers.eventmember_status='2')";
$total_maybe = $event->event_member_total($where);
$members_maybe = $event->event_member_list(0, 3, "RAND()", $where);

// GET GUESTS NOT ATTENDING
$where = "(se_eventmembers.eventmember_status='3')";
$total_notattending = $event->event_member_total($where);
$members_notattending = $event->event_member_list(0, 3, "RAND()", $where);


// CHECK IF USER IS ALLOWED TO COMMENT
$allowed_to_comment = 1;
$comment_level = $event->event_privacy_max($user, $event->eventowner_level_info[level_event_comments]);
$allowed_comment = true_privacy($event->event_info[event_comments], $event->eventowner_level_info[level_event_comments]);
if($comment_level < $allowed_comment) { $allowed_to_comment = 0; }


// GET CUSTOM EVENT STYLE IF ALLOWED
if($event->eventowner_level_info[level_event_style] != 0 & $is_event_private == 0) { 
  $eventstyle_info = $database->database_fetch_assoc($database->database_query("SELECT eventstyle_css FROM se_eventstyles WHERE eventstyle_event_id='".$event->event_info[event_id]."' LIMIT 1")); 
  $global_css = $eventstyle_info[eventstyle_css];
}











// SHOW FILES IN THIS ALBUM
$eventalbum_info = $database->database_fetch_assoc($database->database_query("SELECT eventalbum_id FROM se_eventalbums WHERE eventalbum_event_id='".$event->event_info[event_id]."' LIMIT 1"));
$total_files = $event->event_media_total($eventalbum_info[eventalbum_id]);
$file_array = $event->event_media_list(0, 5, "RAND()", "(eventmedia_eventalbum_id='$eventalbum_info[eventalbum_id]')");




// ASSIGN VARIABLES AND DISPLAY EVENT PAGE
$smarty->assign('event', $event);
$smarty->assign('eventowner_info', $eventowner_info);
$smarty->assign('event_category', $event_category);
$smarty->assign('parent_category', $parent_category);
$smarty->assign('comments', $comments);
$smarty->assign('total_comments', $total_comments);
$smarty->assign('total_invited', $total_invited);
$smarty->assign('members_invited', $members_invited);
$smarty->assign('total_attending', $total_attending);
$smarty->assign('members_attending', $members_attending);
$smarty->assign('total_maybe', $total_maybe);
$smarty->assign('members_maybe', $members_maybe);
$smarty->assign('total_notattending', $total_notattending);
$smarty->assign('members_notattending', $members_notattending);
$smarty->assign('total_mia', $total_mia);
$smarty->assign('members_mia', $members_mia);
$smarty->assign('is_event_private', $is_event_private);
$smarty->assign('allowed_to_comment', $allowed_to_comment);
$smarty->assign('files', $file_array);
$smarty->assign('total_files', $total_files);
include "footer.php";
?>