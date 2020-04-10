<?
$page = "user_event_add";
include "header.php";

if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }

// INITIALIZE VARIABLES
$is_error = 0;
$error_message = "";
$event_title = "";
$event_desc = "";
$event_host = "";
$event_location = "";
$event_privacy = true_privacy(0, $user->level_info[level_event_privacy]);
$event_comments = true_privacy(0, $user->level_info[level_event_comments]);
$event_search = 1;
$eventcat_id = 0;
$subeventcat_id = 0;
$event_date_start = time()+(60*60);
$event_date_end = time()+(60*60*2);




// INITIALIZE EVENT OBJECT
$new_event = new se_event($user->user_info[user_id], 0);



// ATTEMPT TO ADD EVENT
if($task == "doadd") {
  $event_title = censor($_POST['event_title']);
  $event_desc = censor(str_replace("\r\n", "<br>", $_POST['event_desc']));
  $event_host = censor($_POST['event_host']);
  $event_location = censor(str_replace("\r\n", "<br>", $_POST['event_location']));
  $eventcat_id = $_POST['eventcat_id'];
  $subeventcat_id = $_POST['subeventcat_id'];
  $event_inviteonly = $_POST['event_inviteonly'];
  $event_search = $_POST['event_search'];
  $event_privacy = $_POST['event_privacy'];
  $event_comments = $_POST['event_comments'];
  if($_POST['event_date_start_hour'] == "12") { $_POST['event_date_start_hour'] = 0; }
  if($_POST['event_date_start_ampm'] == "PM") { $_POST['event_date_start_hour'] += 12; }
  $event_date_start = mktime($_POST['event_date_start_hour'], $_POST['event_date_start_minute'], 0, $_POST['event_date_start_month'], $_POST['event_date_start_day'], $_POST['event_date_start_year']);
  if($_POST['event_date_end_hour'] == "12") { $_POST['event_date_end_hour'] = 0; }
  if($_POST['event_date_end_ampm'] == "PM") { $_POST['event_date_end_hour'] += 12; }
  $event_date_end = mktime($_POST['event_date_end_hour'], $_POST['event_date_end_minute'], 0, $_POST['event_date_end_month'], $_POST['event_date_end_day'], $_POST['event_date_end_year']);

  // CHECK TO MAKE SURE TITLE HAS BEEN ENTERED
  if(str_replace(" ", "", $event_title) == "") {
    $is_error = 1;
    $error_message = $user_event_add[1];
  }

  // CHECK TO MAKE SURE END DATE IS AFTER START DATE
  if($event_date_end < $event_date_start) {
    $is_error = 1;
    $error_message = $user_event_add[30];
  }

  // CHECK TO MAKE SURE THAT START DATE IS IN THE FUTURE
  if($event_date_start < time()) {
    $is_error = 1;
    $error_message = $user_event_add[31];
  }

  // CHECK THAT PRIVACY IS NOT BLANK
  if($event_privacy == "") { $event_privacy = true_privacy(0, $user->level_info[level_event_privacy]); }
  if($event_comments == "") { $event_comments = true_privacy(0, $user->level_info[level_event_comments]); }

  // CHECK THAT SEARCH IS NOT BLANK
  if($user->level_info[level_event_search] == 0) { $event_search = 1; }

  // CHECK THAT INVITE ONLY IS NOT BLANK
  if($user->level_info[level_event_inviteonly] == 0) { $event_inviteonly = 0; }


  // IF NO ERROR, SAVE EVENT
  if($is_error == 0) {

    if($subeventcat_id != 0) { $eventcat_id = $subeventcat_id; }
    $event_id = $new_event->event_create($event_title, $event_desc, $eventcat_id, $event_date_start, $event_date_end, $event_host, $event_location, $event_search, $event_privacy, $event_comments, $event_inviteonly);

    // INSERT ACTION
    $event_title_short = $event_title;
    if(strlen($event_title_short) > 100) { $event_title_short = substr($event_title_short, 0, 97); $event_title_short .= "..."; }
    $actions->actions_add($user, "newevent", Array('[username]', '[id]', '[title]'), Array($user->user_info[user_username], $event_id, $event_title_short));

    header("Location: user_event_edit.php?event_id=$event_id&justadded=1");
    exit();
  }
}






// GET EVENT CATEGORIES
$categories_array = Array();
$categories_query = $database->database_query("SELECT * FROM se_eventcats WHERE eventcat_dependency='0' ORDER BY eventcat_id");
while($category = $database->database_fetch_assoc($categories_query)) {
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
for($p=0;$p<strlen($user->level_info[level_event_privacy]);$p++) {
  $privacy_level = substr($user->level_info[level_event_privacy], $p, 1);
  if(event_privacy_levels($privacy_level) != "") {
    $privacy_options[] = Array('privacy_id' => "event_privacy".$privacy_level,
				'privacy_value' => $privacy_level,
				'privacy_option' => event_privacy_levels($privacy_level));
  }
}


// GET AVAILABLE EVENT COMMENTS OPTIONS
$comment_options = Array();
for($p=0;$p<strlen($user->level_info[level_event_comments]);$p++) {
  $comment_level = substr($user->level_info[level_event_comments], $p, 1);
  if(event_privacy_levels($comment_level) != "") {
    $comment_options[] = Array('comment_id' => "event_comment".$comment_level,
				'comment_value' => $comment_level,
				'comment_option' => event_privacy_levels($comment_level));
  }
}




// ASSIGN VARIABLES AND SHOW ADD EVENTS PAGE
$smarty->assign('is_error', $is_error);
$smarty->assign('error_message', $error_message);
$smarty->assign('cats', $categories_array);
$smarty->assign('event_title', $event_title);
$smarty->assign('event_desc', str_replace("<br>", "\r\n", $event_desc));
$smarty->assign('event_date_start', $event_date_start);
$smarty->assign('event_date_end', $event_date_end);
$smarty->assign('event_host', $event_host);
$smarty->assign('event_location', str_replace("<br>", "\r\n", $event_location));
$smarty->assign('event_search', $event_search);
$smarty->assign('event_privacy', $event_privacy);
$smarty->assign('event_comments', $event_comments);
$smarty->assign('privacy_options', $privacy_options);
$smarty->assign('comment_options', $comment_options);
$smarty->assign('eventcat_id', $eventcat_id);
$smarty->assign('subeventcat_id', $subeventcat_id);
include "footer.php";
?>