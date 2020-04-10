<?

//  THIS CLASS IS USED TO OUTPUT AND UPDATE RECENT ACTIVITY ACTIONS
//  METHODS IN THIS CLASS:
//    actions_add()
//    actions_display()

class se_actions {



	// THIS METHOD ADDS A NEW ACTION
	// INPUT: $user REPRESENTING THE USER OBJECT OF THE USER WHO COMMITTED THE ACTION
	//	  $actiontype_name REPRESENTING THE TYPE OF ACTION COMMITTED
	//	  $search (OPTIONAL) REPRESENTING AN ARRYA OF PLACEHOLDERS TO BE REPLACED IN THE ACTION TEXT STRING
	//	  $replace (OPTIONAL) REPRESENTING AN ARRAY OF VALUES FOR THE ACTION TEXT STRING
	//	  $timeframe (OPTIONAL) REPRESENTING THE TIME (IN SEC) AFTER WHICH TO INSERT A NEW ROW - SET TO 0 TO ALWAYS INSERT A NEW ROW
	function actions_add($user, $actiontype_name, $search = "", $replace = "", $timeframe = 0) {
	  global $database, $setting;

	  // SET VARS
	  $publish = 1;

	  // GET CURRENT DATE
	  $nowdate = time();

	  // GET ACTIONTYPE INFO
	  $actiontype_info = $database->database_fetch_assoc($database->database_query("SELECT * FROM se_actiontypes WHERE actiontype_name='$actiontype_name' LIMIT 1"));

	  // DONT PUBLISH IF PRIVACY IS TURNED ON AND USER DISALLOWED THIS ACTION TYPE
	  $user->user_settings();
	  $dontpublish_array = explode(",", $user->usersetting_info[usersetting_actions_dontpublish]);
	  if($setting[setting_actions_privacy] == 1 AND in_array($actiontype_info[actiontype_id], $dontpublish_array)) {
	    $publish = 0;
	  }

	  //MAKE SURE ACTION TYPE IS ENABLED BY ADMIN
	  if($actiontype_info[actiontype_enabled] != 1) { $publish = 0; }

	  // PUBLISH ACTION
	  if($publish == 1) {

	    // DELETE OLDEST ACTION(S) FOR THIS USER IF MAX ACTIONS STORED PER USER IS REACHED
	    $totalactions = $database->database_num_rows($database->database_query("SELECT action_id FROM se_actions WHERE action_user_id='".$user->user_info[user_id]."'"));
	    while($totalactions >= $setting[setting_actions_actionsonprofile]) {
	      $oldest_action = $database->database_fetch_assoc($database->database_query("SELECT action_id FROM se_actions WHERE action_user_id='".$user->user_info[user_id]."' ORDER BY action_id ASC LIMIT 1"));
	      $database->database_query("DELETE FROM se_actions WHERE action_user_id='".$user->user_info[user_id]."' AND action_id='$oldest_action[action_id]' LIMIT 1");
	      $totalactions--;
	    }

	    // GET ACTION TEXT
	    $text = $actiontype_info[actiontype_text];

	    // LOOP THROUGH PLACEHOLDER REPLACEMENT ARRAY
	    $text = str_replace($search, $replace, $text);

	    // ESCAPE SINGLE QUOTES FOR QUERY
	    $text = str_replace("'", "\'", $text);

	    // GET PREVIOUS ACTION OF THE SAME TYPE WITH TIMEFRAME SPECIFICATIONS
	    if($nowdate-$timeframe < 0) { $difference = 0; } else { $difference = $nowdate-$timeframe; }
	    $prev_query = $database->database_query("SELECT action_id FROM se_actions WHERE action_user_id='".$user->user_info[user_id]."' AND action_actiontype_id='$actiontype_info[actiontype_id]' AND action_date>'$difference' ORDER BY action_actiontype_id DESC LIMIT 1");
	    if($database->database_num_rows($prev_query) == 1) {
	      $prev = $database->database_fetch_assoc($prev_query);
	      $update = 1;
	    } else {
	      $update = 0;
	    }

	    // UPDATE OLD ACTION
	    if($update == 1) {
	      $database->database_query("UPDATE se_actions SET action_date='$nowdate', 
								action_subnet_id='".$user->user_info[user_subnet_id]."', 
								action_icon='$actiontype_info[actiontype_icon]', 
								action_text='$text' 
								WHERE action_id='$prev[action_id]' AND action_user_id='".$user->user_info[user_id]."' AND action_actiontype_id='$actiontype_info[actiontype_id]'");

	    
	    // INSERT NEW ACTION
	    } else {
	      $database->database_query("INSERT INTO se_actions (action_actiontype_id,
								action_date, 
								action_user_id, 
								action_subnet_id,
								action_icon,
								action_text) VALUES (
								'$actiontype_info[actiontype_id]',
								'$nowdate', 
								'".$user->user_info[user_id]."', 
								'".$user->user_info[user_subnet_id]."',
								'$actiontype_info[actiontype_icon]',
								'$text')");
	    }

	  }

	} // END actions_add() METHOD










	// THIS METHOD DISPLAYS A LIST OF RECENT UPDATES (ACTIONS) RELATING TO A SPECIFIC USER
	// INPUT: 
	// OUTPUT: LIST OF RECENT UPDATES FOR THAT USER
	function actions_display() {
	  global $database, $user, $owner, $setting;

	  // GET CURRENT DATE
	  $nowdate = time();

	  // BEGIN BUILDING QUERY
	  $actions_query = "SELECT se_actions.* FROM se_actions";

	  // LIMIT RESULTS TO SINGLE USER IF SPECIFIED (FOR DISPLAY ON PROFILE PAGE)
	  if($owner->user_exists != 0) {
	    $actions_query .= " WHERE action_user_id='".$owner->user_info[user_id]."'";


	  // HIDE VIEWING USER'S ACTIONS (FOR DISPLAY ON USER HOME PAGE)
	  } else {

	    // LIMIT RESULTS TO ADMIN'S VISIBILITY SETTING
	    switch($setting[setting_actions_visibility]) {

	      // ONLY MY FRIENDS AND EVERYONE IN MY SUBNETWORK
	      case 2:
	        $actions_query .= " LEFT JOIN se_friends ON se_friends.friend_user_id2=se_actions.action_user_id AND se_friends.friend_user_id1='".$user->user_info[user_id]."' AND se_friends.friend_status='1' WHERE (se_friends.friend_id <> 'NULL' OR se_actions.action_subnet_id='".$user->user_info[user_subnet_id]."') AND";
	        break;

	      // ONLY MY FRIENDS
	      case 4:
	        $actions_query .= " RIGHT JOIN se_friends ON se_friends.friend_user_id2=se_actions.action_user_id AND se_friends.friend_user_id1='".$user->user_info[user_id]."' AND se_friends.friend_status='1' WHERE";
	        break;

	      // DEFAULT
	      default:
		$actions_query .= " WHERE";
	    }

	    // EXCLUDE OWN USER ACTIONS AND LIMIT RESULTS TO TIME PERIOD SPECIFIED BY ADMIN
	    $actions_query .= " se_actions.action_user_id<>'".$user->user_info[user_id]."' AND se_actions.action_date>($nowdate-$setting[setting_actions_showlength])";

	  }


	  // ORDER BY ACTION ID DESCENDING
	  $actions_query .= " ORDER BY action_date DESC";

	  // LIMIT RESULTS TO MAX NUMBER SPECIFIED BY ADMIN
	  $actions_query .= " LIMIT $setting[setting_actions_actionsinlist]";


	  // GET RECENT ACTIVITY FEED
	  $actions = $database->database_query($actions_query);
	  $actions_array = Array();
	  $actions_users_array = Array();
	  $action_text = "";
	  $action_icon = "";
	  while($action = $database->database_fetch_assoc($actions)) {

	    // ONLY DISPLAY THIS ACTION IF MAX OCCURRANCES PER USER HAS NOT YET BEEN REACHED
	    if($owner->user_info[user_id] == 0) {
	      $actions_users_array[] = $action[action_user_id];
	      $occurrances = array_count_values($actions_users_array);
	    }
	    if($occurrances[$action[action_user_id]] <= $setting[setting_actions_actionsperuser]) {
	    
 	      // DECODE HTML OF ACTION STRING
	      $action_text = htmlspecialchars_decode($action[action_text], ENT_QUOTES);

	      // ADD THIS ACTION TO OUTPUT ARRAY
  	      $actions_array[] = Array('action_id' => $action[action_id],
					'action_date' => $action[action_date],
					'action_text' => $action_text,
					'action_user_id' => $action[action_user_id],
					'action_username' => $action_username_info[user_username],
					'action_icon' => $action[action_icon]);
	    }
	  }

	  // RETURN LIST OF ACTIONS
	  return $actions_array;

	} // END actions_display() METHOD







}
?>