<?
$page = "event_album";
include "header.php";

if(isset($_POST['p'])) { $p = $_POST['p']; } elseif(isset($_GET['p'])) { $p = $_GET['p']; } else { $p = 1; }
if(isset($_GET['event_id'])) { $event_id = $_GET['event_id']; } else { $event_id = 0; }

// DISPLAY ERROR PAGE IF USER IS NOT LOGGED IN AND ADMIN SETTING REQUIRES REGISTRATION
if($user->user_exists == 0 & $setting[setting_permission_event] == 0) {
  $smarty->assign('error_header', $event_album[3]);
  $smarty->assign('error_message', $event_album[4]);
  $smarty->assign('error_submit', $event_album[10]);
  $smarty->display("error.tpl");
  exit();
}

// INITIALIZE EVENT OBJECT
$event = new se_event($user->user_info[user_id], $event_id);
if($event->event_exists == 0) { header("Location: home.php"); exit(); }

// GET EVENT ALBUM INFO
$eventalbum_info = $database->database_fetch_assoc($database->database_query("SELECT * FROM se_eventalbums WHERE eventalbum_event_id='".$event->event_info[event_id]."' LIMIT 1"));


// GET PRIVACY LEVEL
$privacy_level = $event->event_privacy_max($user, $event->eventowner_level_info[level_event_privacy]);
$allowed_privacy = true_privacy($event->event_info[event_privacy], $event->eventowner_level_info[level_event_privacy]);
$is_event_private = 0;
if($privacy_level < $allowed_privacy) { header("Location: event.php?event_id=".$event->event_info[event_id]); exit(); }


// UPDATE ALBUM VIEWS
$eventalbum_views_new = $eventalbum_info[eventalbum_views] + 1;
$database->database_query("UPDATE se_eventalbums SET eventalbum_views='$eventalbum_views_new' WHERE eventalbum_id='$eventalbum_info[eventalbum_id]' LIMIT 1");



// GET TOTAL FILES IN EVENT ALBUM
$total_files = $event->event_media_total($eventalbum_info[eventalbum_id]);

// MAKE MEDIA PAGES
$files_per_page = 16;
$page_vars = make_page($total_files, $files_per_page, $p);

// GET MEDIA ARRAY
$file_array = $event->event_media_list($page_vars[0], $files_per_page, "eventmedia_id ASC", "(eventmedia_eventalbum_id='$eventalbum_info[eventalbum_id]')");


// GET CUSTOM EVENT STYLE IF ALLOWED
if($event->eventowner_level_info[level_event_style] != 0 & $is_event_private == 0) { 
  $eventstyle_info = $database->database_fetch_assoc($database->database_query("SELECT eventstyle_css FROM se_eventstyles WHERE eventstyle_event_id='".$event->event_info[event_id]."' LIMIT 1")); 
  $global_css = $eventstyle_info[eventstyle_css];
}




// ASSIGN VARIABLES AND DISPLAY EVENT ALBUM PAGE
$smarty->assign('event', $event);
$smarty->assign('files', $file_array);
$smarty->assign('total_files', $total_files);
$smarty->assign('p', $page_vars[1]);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($file_array));
include "footer.php";
?>