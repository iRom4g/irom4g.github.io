<?
$page = "user_event_browse";
include "header.php";

if(isset($_POST['eventcat_id'])) { $eventcat_id = $_POST['eventcat_id']; } elseif(isset($_GET['eventcat_id'])) { $eventcat_id = $_GET['eventcat_id']; } else { $eventcat_id = ""; }
if(isset($_POST['p'])) { $p = $_POST['p']; } elseif(isset($_GET['p'])) { $p = $_GET['p']; } else { $p = 1; }

// CREATE EVENT OBJECT
$now = time();
$event = new se_event();

// FIND OUT WHICH CATEGORY TO OPEN
$open_cat = "";
$open_cat_query = $database->database_query("SELECT eventcat_id, eventcat_dependency FROM se_eventcats WHERE eventcat_id='$eventcat_id'");
if($database->database_num_rows($open_cat_query) == 1) {
  $open_cat = $database->database_fetch_assoc($open_cat_query);
  if($open_cat[eventcat_dependency] != 0) {
    $parent_cat = $database->database_fetch_assoc($database->database_query("SELECT eventcat_id FROM se_eventcats WHERE eventcat_id='$open_cat[eventcat_dependency]'"));
    $open_cat = $parent_cat[eventcat_id];
  } else {
    $open_cat = $open_cat[eventcat_id];
  }
}


// GET EVENT CATEGORIES
$eventcats = $database->database_query("SELECT se_eventcats.*, count(se_events.event_id) AS total_cat_events FROM se_eventcats LEFT JOIN se_events ON se_eventcats.eventcat_id=se_events.event_eventcat_id AND se_events.event_search='1' AND se_events.event_date_start>'$now' WHERE se_eventcats.eventcat_dependency='0' GROUP BY se_eventcats.eventcat_id");

// LOOP THROUGH EVENT CATEGORIES AND SUBCATEGORIES
$categories = Array();
$events_totalincats = 0;
while($eventcat = $database->database_fetch_assoc($eventcats)) {

  // LOOP THROUGH SUBCATS AND PUT THEM INTO AN ARRAY
  $eventsubcats = $database->database_query("SELECT se_eventcats.*, count(se_events.event_id) AS total_subcat_events FROM se_eventcats LEFT JOIN se_events ON se_eventcats.eventcat_id=se_events.event_eventcat_id AND se_events.event_search='1' AND se_events.event_date_start>'$now' WHERE se_eventcats.eventcat_dependency='$eventcat[eventcat_id]' GROUP BY se_eventcats.eventcat_id");
  $total_subcat_events = 0;
  $subcategory_array = Array();
  while($eventsubcat = $database->database_fetch_assoc($eventsubcats)) {
    $subcategory_array[] = Array('subcategory_id' => $eventsubcat[eventcat_id],
				 'subcategory_title' => $eventsubcat[eventcat_title],
				 'subcategory_totalevents' => $eventsubcat[total_subcat_events]);
    $total_subcat_events += $eventsubcat[total_subcat_events];
  }

  // GET TOTAL EVENTS IN THIS CATEGORY AND ALL ITS SUBCATS
  $total_cat_events = $eventcat[total_cat_events]+$total_subcat_events;

  // SEE IF THIS CATEGORY HAS ALREADY BEEN EXPANDED WITH JAVASCRIPT
  $eventcat_expanded = 0;
  $eventcatvar = "subcats$eventcat[eventcat_id]";
  if((isset($_COOKIE[$eventcatvar]) AND $_COOKIE[$eventcatvar] == 1) OR $open_cat == $eventcat[eventcat_id]) {
    $eventcat_expanded = 1;
  }

  // PUT CATEGORY DATA INTO AN ARRAY
  $categories[] = Array('eventcat_id' => $eventcat[eventcat_id],
  			'eventcat_title' => $eventcat[eventcat_title],
			'eventcat_totalevents' => $total_cat_events,
			'eventcat_expanded' => $eventcat_expanded,
			'eventcat_subcats' => $subcategory_array);
  $events_totalincats += $total_cat_events;
}

// DETERMINE HOW MANY EVENTS EXIST THAT ARE UNCATEGORIZED
$total_events = $event->event_total("(event_search='1' AND event_date_start>'$now')");
$events_totalnocat = $total_events - $events_totalincats;








// SHOW EVENTS
$where = "(event_date_start>'$now' AND event_search='1'";
$nocat = 0;

// SHOW CATEGORIZED EVENTS AND OTHER EVENTS
if($eventcat_id != "" AND is_numeric($eventcat_id) AND $eventcat_id != 0) {

  // GET INFORMATION ABOUT THIS CATEGORY, MAKE SURE IT EXISTS
  $category_query = $database->database_query("SELECT * FROM se_eventcats WHERE eventcat_id='$eventcat_id' LIMIT 1");
  if($database->database_num_rows($category_query) != 1) { header("Location: user_event_browse.php"); exit; }
  $category_info = $database->database_fetch_assoc($category_query);

  // GET PARENT CATEGORY INFORMATION IF IT EXISTS
  $parentcategory_query = $database->database_query("SELECT * FROM se_eventcats WHERE eventcat_id='$category_info[eventcat_dependency]' LIMIT 1");
  if($database->database_num_rows($category_query) == 1) { 
    $parentcategory_info = $database->database_fetch_assoc($parentcategory_query);
  } else {
    $parentcategory_info = "";
  }

  // GET SUBCATEGORIES
  $subcategory_query = $database->database_query("SELECT * FROM se_eventcats WHERE eventcat_dependency='$eventcat_id'");

  // BUILD QUERY AND CREATE SUBCATS ARRAY
  $where .= " AND (event_eventcat_id='$eventcat_id'";
  while($subcategory = $database->database_fetch_assoc($subcategory_query)) {
    $where .= " OR event_eventcat_id='$subcategory[eventcat_id]'";
  }
  $where .= ")";

// SHOW ALL EVENTS
} elseif($eventcat_id != "" AND is_numeric($eventcat_id) AND $eventcat_id == 0) {

  $where .= " AND event_eventcat_id='0'";

} else {

  $where .= "";
  $nocat = 1;

}

$where .= ")";

// GET TOTAL EVENTS
$total_events = $event->event_total($where);

// MAKE EVENT PAGES
$events_per_page = 20;
$page_vars = make_page($total_events, $events_per_page, $p);

// GET EVENTS
$event_array = $event->event_list($page_vars[0], $events_per_page, "event_date_start ASC", $where, 1);






// ASSIGN SMARTY VARIABLES AND DISPLAY BROWSE EVENTS PAGE
$smarty->assign('events_totalnocat', $events_totalnocat);
$smarty->assign('total_events', $total_events);
$smarty->assign('categories', $categories);
$smarty->assign('eventcat_id', $eventcat_id);
$smarty->assign('eventcat_title', $category_info[eventcat_title]);
$smarty->assign('events', $event_array);
$smarty->assign('nocat', $nocat);
$smarty->assign('parentcategory_id', $parentcategory_info[eventcat_id]);
$smarty->assign('parentcategory_title', $parentcategory_info[eventcat_title]);
$smarty->assign('p', $page_vars[1]);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($event_array));
include "footer.php";
?>