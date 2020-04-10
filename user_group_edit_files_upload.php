<?
$page = "user_group_edit_files_upload";
include "header.php";

if(isset($_GET['group_id'])) { $group_id = $_GET['group_id']; } elseif(isset($_POST['group_id'])) { $group_id = $_POST['group_id']; } else { $group_id = 0; }
if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }

// INITIALIZE GROUP OBJECT
$group = new se_group($user->user_info[user_id], $group_id);

if($group->group_exists == 0) { header("Location: user_group.php"); exit(); }
//if($group->user_rank == 0 | $group->user_rank == -1) { header("Location: user_group.php"); exit(); }


// GET GROUP ALBUM INFO
$groupalbum_info = $database->database_fetch_assoc($database->database_query("SELECT * FROM se_groupalbums WHERE groupalbum_group_id='".$group->group_info[group_id]."' LIMIT 1"));


// GET TOTAL SPACE USED
$space_used = $group->group_media_space();
$space_left = $group->groupowner_level_info[level_group_album_storage] - $space_used;



// UPLOAD FILES
if($task == "doupload") {
  $file_result = Array();

  // RUN FILE UPLOAD FUNCTION FOR EACH SUBMITTED FILE
  $update_groupalbum = 0;
  $new_groupalbum_cover = "";
  for($f=1;$f<6;$f++) {
    $fileid = "file".$f;
    if($_FILES[$fileid]['name'] != "") {
      $file_result[$fileid] = $group->group_media_upload($fileid, $groupalbum_info[groupalbum_id], $space_left);
      if($file_result[$fileid]['is_error'] == 0) {
  	$file_result[$fileid]['message'] = stripslashes($_FILES[$fileid]['name'])." $user_group_edit_files_upload[23]";
	$new_groupalbum_cover = $file_result[$fileid]['media_id'];
        $update_groupalbum = 1;
      }
    }
  }

  // UPDATE GROUP ALBUM UPDATED DATE AND GROUP ALBUM COVER IF FILE UPLOADED
  if($update_groupalbum == 1) {
    $newdate = time();
    if($groupalbum_info[groupalbum_cover] != 0) { $new_groupalbum_cover = $groupalbum_info[groupalbum_cover]; }
    $database->database_query("UPDATE se_groupalbums SET groupalbum_cover='$new_groupalbum_cover', groupalbum_dateupdated='$newdate' WHERE groupalbum_id='$groupalbum_info[groupalbum_id]'");

    // UPDATE LAST UPDATE DATE (SAY THAT 10 TIMES FAST)
    $group->group_lastupdate();
  }

} // END TASK



// GET MAX FILESIZE ALLOWED
$max_filesize_kb = ($group->groupowner_level_info[level_group_album_maxsize]) / 1024;
$max_filesize_kb = round($max_filesize_kb, 0);

// CONVERT UPDATED SPACE LEFT TO MB
$space_left_mb = ($space_left / 1024) / 1024;
$space_left_mb = round($space_left_mb, 2);


// ASSIGN VARIABLES AND SHOW USER EDIT GROUP PAGE
$smarty->assign('file1_result', $file_result[file1][message]);
$smarty->assign('file2_result', $file_result[file2][message]);
$smarty->assign('file3_result', $file_result[file3][message]);
$smarty->assign('file4_result', $file_result[file4][message]);
$smarty->assign('file5_result', $file_result[file5][message]);
$smarty->assign('group', $group);
$smarty->assign('space_left', $space_left_mb);
$smarty->assign('allowed_exts', str_replace(",", ", ", $group->groupowner_level_info[level_group_album_exts]));
$smarty->assign('max_filesize', $max_filesize_kb);
include "footer.php";
?>