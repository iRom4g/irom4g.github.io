<?
$page = "user_event";
include "header.php";

// GET DATE & NOTIFICATION VARS
if(isset($_GET['date']) AND is_numeric($_GET['date'])) { $date = $_GET['date']; } else { $date = ""; }
if(isset($_GET['show_notification'])) { $show_notification = 1; } else { $show_notification = 0; }

// SELECT MONTH
if($date == "") { $date = mktime(0, 0, 0, date("m", time()), 1, date("Y", time())); } else { $date = mktime(0, 0, 0, date("m", $date), 1, date("Y", $date)); }

// GET LAST AND NEXT MONTHS
$date_next = mktime(0, 0, 0, date("m", $date)+1, 1, date("Y", $date));
$date_last = mktime(0, 0, 0, date("m", $date)-1, 1, date("Y", $date));

// GET NUMBER OF DAYS IN MONTH
$days_in_month = date('t', $date);

// GET FIRST AND LAST DAY OF THE MONTH
$month_text = htmlentities($datetime->cdate("F", $date));
$month_year = htmlentities($datetime->cdate("Y", $date));
$first_day_of_month = date("w", $date);
if($first_day_of_month == 0) { $first_day_of_month = 7; }
$last_day_of_month = ($first_day_of_month-1)+$days_in_month;

// GET TOTAL NUMBER OF CELLS ON TABLE
$total_cells = (floor($last_day_of_month/7)+1)*7;



// SET VARIABLES AND INITIALIZE EVENT OBJECT
$event = new se_event($user->user_info[user_id]);
$sort_by = "se_events.event_date_start ASC";
$where = "(se_events.event_date_start>='$date' AND se_events.event_date_start<'$date_next')";

// GET TOTAL EVENTS
$total_events = $event->event_total($where);

// GET EVENTS ARRAY
$event_array = $event->event_list(0, $total_events, $sort_by, $where, 1);

// REARRANGE EVENTS ARRAY
for($e=0;$e<count($event_array);$e++) {
  $day = date("j", $event_array[$e][event]->event_info[event_date_start]);
  $events[$day][] = $event_array[$e];
}

// GET TOTAL WAITING EVENTS
$sort_by = "se_events.event_date_start ASC";
$where = "(se_eventmembers.eventmember_status='0')";
$total_waiting_events = $event->event_total($where);
$waiting_events = $event->event_list(0, $total_events, $sort_by, $where, 1);

// GET TODAYS DAY AND MONTH
$today_day = date('j', time());
$today_month = mktime(0, 0, 0, date("m", time()), 1, date("Y", time()));

// ASSIGN VARIABLES AND SHOW VIEW EVENTS PAGE
$smarty->assign('events', $events);
$smarty->assign('total_events', $total_events);
$smarty->assign('days_in_month', $days_in_month);
$smarty->assign('first_day_of_month', $first_day_of_month);
$smarty->assign('last_day_of_month', $last_day_of_month);
$smarty->assign('total_cells', $total_cells);
$smarty->assign('month', $month_text);
$smarty->assign('year', $month_year);
$smarty->assign('date_last', $date_last);
$smarty->assign('date_current', $date);
$smarty->assign('date_next', $date_next);
$smarty->assign('waiting_events', $waiting_events);
$smarty->assign('total_waiting_events', $total_waiting_events);
$smarty->assign('show_notification', $show_notification);
$smarty->assign('today_day', $today_day);
$smarty->assign('today_month', $today_month);
include "footer.php";
?>