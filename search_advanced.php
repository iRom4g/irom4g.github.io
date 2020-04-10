<?
$page = "search_advanced";
include "header.php";

// DISPLAY ERROR PAGE IF USER IS NOT LOGGED IN AND ADMIN SETTING REQUIRES REGISTRATION
if($user->user_exists == 0 & $setting[setting_permission_search] == 0) {
  $page = "error";
  $smarty->assign('error_header', $search_advanced[20]);
  $smarty->assign('error_message', $search_advanced[19]);
  $smarty->assign('error_submit', $search_advanced[21]);
  include "footer.php";
}

if(isset($_POST['task'])) { $task = $_POST['task']; } elseif(isset($_GET['task'])) { $task = $_GET['task']; } else { $task = "main"; }
if(isset($_POST['p'])) { $p = $_POST['p']; } elseif(isset($_GET['p'])) { $p = $_GET['p']; } else { $p = 1; }


// SET VARS
$showfields = 1;
$linkedfield_title = "";
$linkedfield_value = "";
$sort = "user_dateupdated DESC";
$users_per_page = 20;


// BROWSE USERS WITH A VALUE IN A SPECIFIC FIELD
// LINKED FROM PROFILE
if($task == "browse") {

  // GET BASIC VARIABLES
  $field_id = $_GET['field_id'];
  $field_value = $_GET['field_value'];
  $browse_field_value = $field_value;
  $url_string = "field_id=".$field_id."&field_value=".urlencode($field_value)."&";
  $showfields = 0;

  // BEGIN CONSTRUCTING BROWSE QUERY
  $browse_query = "SELECT se_users.user_id, se_users.user_username, se_users.user_photo FROM se_profiles LEFT JOIN se_users ON se_profiles.profile_user_id=se_users.user_id LEFT JOIN se_levels ON se_levels.level_id=se_users.user_level_id WHERE se_users.user_verified='1' AND se_users.user_enabled='1' AND (se_users.user_privacy_search='1' OR se_levels.level_profile_search='0')";

  // GET FIELD INFO
  $field_info = $database->database_fetch_assoc($database->database_query("SELECT field_id, field_title, field_type, field_options, field_dependency FROM se_fields WHERE field_id='$field_id'"));
  $linkedfield_title = $field_info[field_title];

  // GET PARENT FIELD INFO
  if($field_info[field_dependency] != 0) { 
    $parent_field_info = $database->database_fetch_assoc($database->database_query("SELECT field_title, field_type, field_options FROM se_fields WHERE field_id='$field_info[field_dependency]'"));
    $parent_field_title = $parent_field_info[field_title];
    if($parent_field_info[field_type] == 3 | $parent_field_info[field_type] == 4) {
      $options = explode("<~!~>", $parent_field_info[field_options]);
      for($i=0,$max=count($options);$i<$max;$i++) {
        if(str_replace(" ", "", $options[$i]) != "") {
          $option = explode("<!>", $options[$i]);
          $option_id = $option[0];
	  $option_label = $option[1];
	  $option_dependent_field_id = $option[3];
          if($field_info[field_id] == $option[3]) {
            $parent_field_title .= ": $option_label";
          }
        }
      }
    }
    $linkedfield_title = $parent_field_title." ".$linkedfield_title;
  }

  // GET FIELD VALUE
  switch($field_info[field_type]) {
    case 1:
    case 2:
      $browse_field_value = "%".$field_value."%";
      $linkedfield_value = $field_value;
      break;
    case 3:
    case 4:
      $options = explode("<~!~>", $field_info[field_options]);
      for($i=0,$max=count($options);$i<$max;$i++) {
        if(str_replace(" ", "", $options[$i]) != "") {
          $option = explode("<!>", $options[$i]);
          $option_id = $option[0];
	  $option_label = $option[1];
          if($field_value == $option_id) {
            $linkedfield_value = $option_label;
          }
        }
      }
      break;
    case 5:
      $linkedfield_value = $datetime->cdate($setting[setting_dateformat], $field_value);
      break;
  }

  // FINISH BROWSE QUERY
  $browse_query .= " AND profile_".$field_info[field_id]." LIKE '$browse_field_value'";

  // GET TOTAL USERS
  $total_users = $database->database_num_rows($database->database_query($browse_query));

  // MAKE BROWSE PAGES
  $page_vars = make_page($total_users, $users_per_page, $p);

  // ADD LIMIT TO QUERY
  $browse_query .= " ORDER BY $sort LIMIT $page_vars[0], $users_per_page";

  // GET USERS
  $users = $database->database_query($browse_query);
  $user_array = Array();
  while($user_info = $database->database_fetch_assoc($users)) {
    $browse_user = new se_user();
    $browse_user->user_info[user_id] = $user_info[user_id];
    $browse_user->user_info[user_username] = $user_info[user_username];
    $browse_user->user_info[user_photo] = $user_info[user_photo];
    $user_array[] = $browse_user;
  }







// SEARCH THROUGH USERS BASED ON NUMEROUS PROFILE CRITERIA
} else {

  // GET LIST OF FIELDS
  $searcher = new se_user();
  $searcher->user_fields(0, 0, 0, 0, 0, 1);
  $tab_array = $searcher->profile_tabs;
  $url_string = $searcher->url_string;

  // PERFORM SEARCH
  if($task == "dosearch" OR $task == "main") {
    if(isset($_POST['sort'])) { $sort = $_POST['sort']; } elseif(isset($_GET['sort'])) { $sort = $_GET['sort']; } else { $sort = "user_dateupdated DESC"; }

    // BEGIN CONSTRUCTING SEARCH QUERY    
    $search_query = "SELECT se_users.user_id, se_users.user_username, se_users.user_photo FROM se_profiles LEFT JOIN se_users ON se_profiles.profile_user_id=se_users.user_id LEFT JOIN se_levels ON se_levels.level_id=se_users.user_level_id WHERE se_users.user_verified='1' AND se_users.user_enabled='1' AND (se_users.user_privacy_search='1' OR se_levels.level_profile_search='0')";
    if($searcher->profile_field_query != "") { $search_query .= " AND ".$searcher->profile_field_query; }

    // GET TOTAL USERS
    $total_users = $database->database_num_rows($database->database_query($search_query));

    // MAKE SEARCH PAGES
    $page_vars = make_page($total_users, $users_per_page, $p);

    // ADD LIMIT TO QUERY
    $search_query .= " ORDER BY $sort LIMIT $page_vars[0], $users_per_page";

    // GET USERS
    $users = $database->database_query($search_query);
    $user_array = Array();
    $online_users_array = online_users();
    while($user_info = $database->database_fetch_assoc($users)) {
      $search_user = new se_user();
      $search_user->user_info[user_id] = $user_info[user_id];
      $search_user->user_info[user_username] = $user_info[user_username];
      $search_user->user_info[user_photo] = $user_info[user_photo];

      // DETERMINE IF USER IS ONLINE
      if(in_array($search_user->user_info[user_username], $online_users_array)) { 
        $search_user->user_info[user_online] = 1; 
      } else { 
        $search_user->user_info[user_online] = 0; 
      }

      $user_array[] = $search_user;
    }
  }
}




// ASSIGN VARIABLES AND INCLUDE FOOTER
$smarty->assign('users', $user_array);
$smarty->assign('total_users', $total_users);
$smarty->assign('maxpage', $page_vars[2]);
$smarty->assign('p', $page_vars[1]);
$smarty->assign('p_start', $page_vars[0]+1);
$smarty->assign('p_end', $page_vars[0]+count($user_array));
$smarty->assign('showfields', $showfields);
$smarty->assign('url_string', $url_string);
$smarty->assign('linkedfield_title', $linkedfield_title);
$smarty->assign('linkedfield_value', $linkedfield_value);
$smarty->assign('task', $task);
$smarty->assign('tabs', $tab_array);
$smarty->assign('sort', $sort);
include "footer.php";
?>