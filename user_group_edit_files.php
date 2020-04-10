<?
$page = "user_group_edit_files";
include "header.php";

if(isset($_GET['group_id'])) { $group_id = $_GET['group_id']; } elseif(isset($_POST['group_id'])) { $group_id = $_POST['group_id']; } else { $group_id = 0; }
if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }

// INITIALIZE GROUP OBJECT
$group = new se_group($user->user_info[user_id], $group_id);

if($group->group_exists == 0) { header("Location: user_group.php"); exit(); }
if($group->user_rank == 0 | $group->user_rank == -1) { header("Location: user_group.php"); exit(); }


// GET GROUP ALBUM INFO
$groupalbum_info = $database->database_fetch_assoc($database->database_query("SELECT * FROM se_groupalbums WHERE groupalbum_group_id='".$group->group_info[group_id]."' LIMIT 1"));





// UPDATE FILES IN THIS GROUP ALBUM
if($task == "doupdate") {

  // GET TOTAL FILES
  $total_files = $group->group_media_total($groupalbum_info[groupalbum_id]);

  // DELETE NECESSARY FILES
  $group->group_media_delete(0, $total_files, "groupmedia_id ASC", "(groupmedia_groupalbum_id='$groupalbum_info[groupalbum_id]')");

  // UPDATE NECESSARY FILES
  $media_array = $group->group_media_update(0, $total_files, "groupmedia_id ASC", "(groupmedia_groupalbum_id='$groupalbum_info[groupalbum_id]')");

  // SET ALBUM COVER AND UPDATE DATE
  $newdate = time();
  $groupalbum_info[groupalbum_cover] = $_POST['groupalbum_cover'];
  if(!in_array($groupalbum_info[groupalbum_cover], $media_array)) { $groupalbum_info[groupalbum_cover] = $media_array[0]; }
  $database->database_query("UPDATE se_groupalbums SET groupalbum_cover='$groupalbum_info[groupalbum_cover]', groupalbum_dateupdated='$new_date' WHERE groupalbum_id='$groupalbum_info[groupalbum_id]'");

  // UPDATE LAST UPDATE DATE (SAY THAT 10 TIMES FAST)
  $group->group_lastupdate();

  // SHOW SUCCESS MESSAGE
  $result = 1;

}






// SHOW FILES IN THIS ALBUM
$total_files = $group->group_media_total($groupalbum_info[groupalbum_id]);
$file_array = $group->group_media_list(0, $total_files, "groupmedia_id ASC", "(groupmedia_groupalbum_id='$groupalbum_info[groupalbum_id]')");





// ASSIGN VARIABLES AND SHOW USER EDIT GROUP PAGE
$smarty->assign('group', $group);
$smarty->assign('result', $result);
$smarty->assign('files', $file_array);
$smarty->assign('files_total', $total_files);
$smarty->assign('groupalbum_id', $groupalbum_info[groupalbum_id]);
include "footer.php";
?>