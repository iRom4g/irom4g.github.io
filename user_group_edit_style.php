<?
$page = "user_group_edit_style";
include "header.php";

if(isset($_POST['group_id'])) { $group_id = $_POST['group_id']; } elseif(isset($_GET['group_id'])) { $group_id = $_GET['group_id']; } else { $group_id = 0; }
if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }

// INITIALIZE GROUP OBJECT
$group = new se_group($user->user_info[user_id], $group_id);

if($group->group_exists == 0) { header("Location: user_group.php"); exit(); }
if($group->user_rank == 0 | $group->user_rank == -1) { header("Location: user_group.php"); exit(); }

// SET EMPTY VARS
$result = 0;

// CHECK IF CUSTOM CSS IS DISABLED BY ADMIN
if($group->groupowner_level_info[level_group_style] != 1) { header("Location: user_group_edit.php?group_id=".$group->group_info[group_id]); exit(); }


// SAVE NEW CSS
if($task == "dosave") {
  $style_group = addslashes(strip_tags(htmlspecialchars_decode($_POST['style_group'], ENT_QUOTES)));
  $database->database_query("UPDATE se_groupstyles SET groupstyle_css='$style_group' WHERE groupstyle_group_id='".$group->group_info[group_id]."'");
  $result = 1;
}


// GET THIS USER'S GROUP CSS
$style_query = $database->database_query("SELECT groupstyle_css FROM se_groupstyles WHERE groupstyle_group_id='".$group->group_info[group_id]."' LIMIT 1");
if($database->database_num_rows($style_query) == 1) { 
  $style_info = $database->database_fetch_assoc($style_query); 
} else {
  $database->database_query("INSERT INTO se_groupstyles (groupstyle_group_id, groupstyle_css) VALUES ('".$group->group_info[group_id]."', '')");
  $style_info = $database->database_fetch_assoc($database->database_query("SELECT groupstyle_css FROM se_groupstyles WHERE groupstyle_group_id='".$group->group_info[group_id]."' LIMIT 1")); 
}

// ASSIGN SMARTY VARIABLES AND DISPLAY EDIT STYLE PAGE
$smarty->assign('group', $group);
$smarty->assign('result', $result);
$smarty->assign('style_group', htmlspecialchars($style_info[groupstyle_css]));
include "footer.php";
?>