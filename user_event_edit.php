<?
$page = "user_event_edit";
include "header.php";

if(isset($_POST['event_id'])) { $event_id = $_POST['event_id']; } elseif(isset($_GET['event_id'])) { $event_id = $_GET['event_id']; } else { $event_id = 0; }
if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }
if(isset($_POST['justadded'])) { $justadded = $_POST['justadded']; } elseif(isset($_GET['justadded'])) { $justadded = $_GET['justadded']; } else { $justadded = ""; }


// INITIALIZE EVENT OBJECT
$event = new se_event($user->user_info[user_id], $event_id);

if($event->event_exists == 0) { header("Location: user_event.php"); exit(); }
if($event->event_info[event_user_id] != $user->user_info[user_id]) { header("Location: user_event.php"); exit(); }


// SET ERROR VARIABLES
$is_error = 0;
$result = 0;
$error_message = "";


// CHECK FOR ADMIN ALLOWANCE OF PHOTO
if($event->eventowner_level_info[level_event_photo] == 0 & ($task == "remove" | $task == "upload")) { $task = "main"; }


// DELETE PHOTO
if($task == "remove") { $event->event_photo_delete(); $event->event_lastupdate(); }

// UPLOAD PHOTO
if($task == "upload") {
  $event->event_photo_upload("photo");
  $is_error = $event->is_error;
  $error_message = $event->error_message;
  if($is_error == 0) { $event->event_lastupdate(); }
}



if($task == "dosave") {
  // GET BASIC EVENT INFO
  $event_title = censor($_POST['event_title']);
  $event_desc = censor(str_replace("\r\n", "<br>", $_POST['event_desc']));
  $event_host = censor($_POST['event_host']);
  $event_location = censor(str_replace("\r\n", "<br>", $_POST['event_location']));
  $eventcat_id = $_POST['eventcat_id'];
  $subeventcat_id = $_POST['subeventcat_id'];
  $event_search = $_POST['event_search'];
  $event_privacy = $_POST['event_privacy'];
  $event_comments = $_POST['event_comments'];
  $event_inviteonly = $_POST['event_inviteonly'];
  if($_POST['event_date_start_hour'] == "12") { $_POST['event_date_start_hour'] = 0; }
  if($_POST['event_date_start_ampm'] == "PM") { $_POST['event_date_start_hour'] += 12; }
  $event_date_start = mktime($_POST['event_date_start_hour'], $_POST['event_date_start_minute'], 0, $_POST['event_date_start_month'], $_POST['event_date_start_day'], $_POST['event_date_start_year']);
  if($_POST['event_date_end_hour'] == "12") { $_POST['event_date_end_hour'] = 0; }
  if($_POST['event_date_end_ampm'] == "PM") { $_POST['event_date_end_hour'] += 12; }
  $event_date_end = mktime($_POST['event_date_end_hour'], $_POST['event_date_end_minute'], 0, $_POST['event_date_end_month'], $_POST['event_date_end_day'], $_POST['event_date_end_year']);

  // CHECK TO MAKE SURE TITLE HAS BEEN ENTERED
  if(str_replace(" ", "", $event_title) == "") {
    $is_error = 1;
    $error_message = $user_event_edit[8];
  }

  // CHECK TO MAKE SURE END DATE IS AFTER START DATE
  if($event_date_end < $event_date_start) {
    $is_error = 1;
    $error_message = $user_event_edit[49];
  }

  // CHECK THAT PRIVACY IS NOT BLANK
  if($event_privacy == "") { $event_privacy = true_privacy(0, $event->eventowner_level_info[level_event_privacy]); }
  if($event_comments == "") { $event_comments = true_privacy(0, $event->eventowner_level_info[level_event_comments]); }

  // CHECK THAT SEARCH IS NOT BLANK
  if($event->eventowner_level_info[level_event_search] == 0) { $event_search = 1; }

  // CHECK THAT INVITE ONLY IS NOT BLANK
  if($event->eventowner_level_info[level_event_inviteonly] == 0) { $event_inviteonly = 0; }

  // IF NO ERROR, SAVE EVENT
  if($is_error == 0) {
    if($subeventcat_id != 0) { $new_eventcat_id = $subeventcat_id; } else { $new_eventcat_id = $eventcat_id; }

    // IF NEW INVITE ONLY SETTING IS CHANGED TO 0, APPROVE ALL REQUESTS FOR INVITATION
    if($event_inviteonly == 0) {
      $database->database_query("UPDATE se_eventmembers SET eventmember_status='0' WHERE eventmember_event_id='".$event->event_info[event_id]."' AND eventmember_status='-1'");
    }

    // UPDATE EVENT
    $database->database_query("UPDATE se_events SET event_title='$event_title', event_eventcat_id='$new_eventcat_id', event_desc='$event_desc', event_date_start='$event_date_start', event_date_end='$event_date_end', event_host='$event_host', event_location='$event_location', event_search='$event_search', event_privacy='$event_privacy', event_comments='$event_comments', event_inviteonly='$event_inviteonly' WHERE event_id='".$event->event_info[event_id]."'");
    $database->database_query("UPDATE se_eventalbums SET eventalbum_privacy='$event_privacy', eventalbum_comments='$event_comments', eventalbum_search='$event_search' WHERE eventalbum_event_id='".$event->event_info[event_id]."'");

    // RESET RESULTS
    $event->event_info = $database->database_fetch_assoc($database->database_query("SELECT * FROM se_events WHERE event_id='".$event->event_info[event_id]."'"));

    // SET RESULT MESSAGE
    $result = 1;

    $event->event_lastupdate();
  }




} else {
  $event_title = $event->event_info[event_title];
  $event_desc = str_replace("<br>", "\r\n", $event->event_info[event_desc]);
  $event_host = $event->event_info[event_host];
  $event_location = str_replace("<br>", "\r\n", $event->event_info[event_location]);
  $event_date_start = $event->event_info[event_date_start];
  $event_date_end = $event->event_info[event_date_end];
  $event_inviteonly = $event->event_info[event_inviteonly];
  $event_search = $event->event_info[event_search];
  $event_privacy = $event->event_info[event_privacy];
  $event_comments = $event->event_info[event_comments];
  if($event->event_info[event_eventcat_id] == 0) {
    $eventcat_id = 0;
    $subeventcat_id = 0;
  } else {
    $eventcat = $database->database_fetch_assoc($database->database_query("SELECT eventcat_id, eventcat_dependency FROM se_eventcats WHERE eventcat_id='".$event->event_info[event_eventcat_id]."'"));
    if($eventcat[eventcat_dependency] == 0) {
      $eventcat_id = $eventcat[eventcat_id];
      $subeventcat_id = "0";
    } else {
      $parenteventcat = $database->database_fetch_assoc($database->database_query("SELECT eventcat_id FROM se_eventcats WHERE eventcat_id='$eventcat[eventcat_dependency]'"));
      $eventcat_id = $parenteventcat[eventcat_id];
      $subeventcat_id = $eventcat[eventcat_id];
    }
  }
}





// GET EVENT CATEGORIES
$categories_array = Array();
$categories_query = $database->database_query("SELECT * FROM se_eventcats WHERE eventcat_dependency='0' ORDER BY eventcat_id");
while($category = $database->database_fetch_assoc($categories_query)) {
  // GET DEPENDENT EVENT CATS
  $dep_categories_query = $database->database_query("SELECT * FROM se_eventcats WHERE eventcat_dependency='$category[eventcat_id]' ORDER BY eventcat_id");
  $dep_eventcat_array = Array();
  while($dep_category = $database->database_fetch_assoc($dep_categories_query)) {
    $dep_eventcat_array[] = Array('subeventcat_id' => $dep_category[eventcat_id],
					'subeventcat_title' => $dep_category[eventcat_title]);
  }

  $categories_array[] = Array('eventcat_id' => $category[eventcat_id],
			       'eventcat_title' => $category[eventcat_title],
			       'subcats' => $dep_eventcat_array);
}




// GET AVAILABLE EVENT PRIVACY OPTIONS
$privacy_options = Array();
for($p=0;$p<strlen($event->eventowner_level_info[level_event_privacy]);$p++) {
  $privacy_level = substr($event->eventowner_level_info[level_event_privacy], $p, 1);
  if(event_privacy_levels($privacy_level) != "") {
    $privacy_options[] = Array('privacy_id' => "event_privacy".$privacy_level,
				'privacy_value' => $privacy_level,
				'privacy_option' => event_privacy_levels($privacy_level));
  }
}

// GET AVAILABLE EVENT COMMENT OPTIONS
$comment_options = Array();
for($p=0;$p<strlen($event->eventowner_level_info[level_event_comments]);$p++) {
  $comment_level = substr($event->eventowner_level_info[level_event_comments], $p, 1);
  if(event_privacy_levels($comment_level) != "") {
    $comment_options[] = Array('comment_id' => "event_comment".$comment_level,
				'comment_value' => $comment_level,
				'comment_option' => event_privacy_levels($comment_level));
  }
}



// ASSIGN VARIABLES AND SHOW USER EDIT EVENT PAGE
$smarty->assign('result', $result);
$smarty->assign('is_error', $is_error);
$smarty->assign('justadded', $justadded);
$smarty->assign('error_message', $error_message);
$smarty->assign('event', $event);
$smarty->assign('privacy_options', $privacy_options);
$smarty->assign('comment_options', $comment_options);
$smarty->assign('cats', $categories_array);
$smarty->assign('event_title', $event_title);
$smarty->assign('event_desc', $event_desc);
$smarty->assign('event_date_start', $event_date_start);
$smarty->assign('event_date_end', $event_date_end);
$smarty->assign('event_host', $event_host);
$smarty->assign('event_location', $event_location);
$smarty->assign('eventcat_id', $eventcat_id);
$smarty->assign('subeventcat_id', $subeventcat_id);
$smarty->assign('event_inviteonly', $event_inviteonly);
$smarty->assign('event_search', $event_search);
$smarty->assign('event_privacy', true_privacy($event_privacy, $event->eventowner_level_info[level_event_privacy]));
$smarty->assign('event_comments', true_privacy($event_comments, $event->eventowner_level_info[level_event_comments]));
include "footer.php";
?>