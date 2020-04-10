<?
$page = "admin_viewreports_edit";
include "admin_header.php";

if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }





if($task == "dodelete") {
  $report_id = $_POST['report_id'];
  if(!is_numeric($report_id)) { header("Location: admin_viewreports.php"); exit; }
  $report_query = $database->database_query("SELECT report_id FROM se_reports WHERE report_id='$report_id' LIMIT 1");
  if($database->database_num_rows($report_query) != 0) {
    $database->database_query("DELETE FROM se_reports WHERE report_id='$report_id'");
  }
  header("Location: admin_viewreports.php"); exit;
}






// GET REPORT INFORMATION
$report_id = $_GET['report_id'];
if(!is_numeric($report_id)) { header("Location: admin_viewreports.php"); exit; }
$report_query = $database->database_query("SELECT * FROM se_reports WHERE report_id='$report_id' LIMIT 1");
if($database->database_num_rows($report_query) == 0) { 
  header("Location: admin_viewreports.php"); exit;
} else {
  $report_info = $database->database_fetch_assoc($report_query);
}

// MAKE SURE INFO IS SAFE TO DISPLAY ON PAGE
$report_id = $report_info[report_id];
$report_user_id = $report_info[report_user_id];
$report_reason = $report_info[report_reason];
$report_details = htmlspecialchars(strip_tags($report_info[report_details]));

// GET OBJECT URL
$report_url = urldecode($report_info[report_url]);
$report_url = str_replace("&amp;", "&", $report_url);

// GET USERNAME FORM REPORTER ID
$reporter_info = $database->database_fetch_assoc($database->database_query("SELECT user_username FROM se_users WHERE user_id='$report_user_id' LIMIT 1"));
$report_username = $reporter_info[user_username];

// DECODE REASON TYPE
switch($report_reason) {
  case "1":
    $report_reason = $admin_viewreports_edit[9]; break;
  case "2":
    $report_reason = $admin_viewreports_edit[10]; break;
  case "3":
    $report_reason = $admin_viewreports_edit[11]; break;
  default:
  case "0":
    $report_reason = $admin_viewreports_edit[12]; break;
}


// ASSIGN SMARTY VARIABLES AND DISPLAY VIEW REPORTS PAGE
$smarty->assign('report_id', $report_id);
$smarty->assign('report_user_id', $report_info[report_user_id]);
$smarty->assign('report_username', $report_username);
$smarty->assign('report_url', $report_url);
$smarty->assign('report_url_encoded', $report_info[report_url]);
$smarty->assign('report_reason', $report_reason);
$smarty->assign('report_details', $report_details);
$smarty->display("$page.tpl");
exit();
?>