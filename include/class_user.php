<?

//  THIS CLASS CONTAINS USER-RELATED METHODS.
//  IT IS USED DURING THE CREATION, MODIFICATION AND DELETION OF A USER.
//  METHODS IN THIS CLASS:
//    se_user()
//    user_settings()
//    user_checkCookies()
//    user_login()
//    user_setcookies()
//    user_clear()
//    user_logout()
//    user_account()
//    user_password()
//    user_fields()
//    user_subnet_select()
//    user_lastupdate()
//    user_photo()
//    user_photo_upload()
//    user_photo_delete()
//    user_friend_total()
//    user_friend_list()
//    user_friend_add()
//    user_friend_remove()
//    user_friend_of_friend()
//    user_friended()
//    user_blocked()
//    user_privacy_max()
//    user_message_total()
//    user_message_list()
//    user_message_send()
//    user_message_delete_selected()
//    user_create()
//    user_delete()


class se_user {

	// INITIALIZE VARIABLES
	var $is_error;			// DETERMINES WHETHER THERE IS AN ERROR OR NOT
	var $error_message;		// CONTAINS RELEVANT ERROR MESSAGE
	var $user_exists;		// DETERMINES WHETHER WE ARE EDITING AN EXISTING USER OR NOT

	var $user_info;			// CONTAINS USER'S INFORMATION FROM SE_USERS TABLE
	var $profile_info;		// CONTAINS USER'S INFORMATION FROM SE_PROFILES TABLE
	var $level_info;		// CONTAINS USER'S INFORMATION FROM SE_LEVELS TABLE
	var $subnet_info;		// CONTAINS USER'S INFORMATION FROM SE_SUBNETS TABLE
	var $usersetting_info;		// CONTAINS USER'S INFORMATION FROM SE_USERSETTINGS TABLE
	
	var $user_salt;			// CONTAINS THE SALT USED TO ENCRYPT USER'S PASSWORD

	var $profile_tabs;		// CONTAINS ARRAY OF PROFILE TABS WITH CORRESPONDING FIELD ARRAYS
	var $profile_fields;		// CONTAINS ARRAY OF PROFILE FIELDS FROM TAB SPECIFIED
	var $profile_fields_new;	// CONTAINS ARRAY OF NEW (UNSAVED) PROFILE FIELD VALUES
	var $profile_field_query;	// CONTAINS A PARTIAL DATABASE QUERY TO SAVE/RETRIEVE PROFILE FIELD VALUES

	var $url_string;		// CONTAINS VARIOUS PARTIAL URL STRINGS (SITUATION DEPENDENT)









	// THIS METHOD SETS INITIAL VARS SUCH AS USER INFO AND LEVEL INFO
	// INPUT: $user_unique (OPTIONAL) REPRESENTING AN ARRAY:
	//		$user_unique[0] REPRESENTS THE USER'S ID (user_id)
	//		$user_unique[1] REPRESENTS THE USER'S USERNAME (user_username)
	//		$user_unique[2] REPRESENTS THE USER'S EMAIL (user_email)
	//	  $select_fields (OPTIONAL) REPRESENTING AN ARRAY:
	//		$select_fields[0] REPRESENTS THE FIELDS TO SELECT FROM THE SE_USERS TABLE
	//		$select_fields[1] REPRESENTS THE FIELDS TO SELECT FROM THE SE_PROFILES TABLE (QUERY WILL NOT RUN AT ALL IF VALUE IS LEFT BLANK)
	//		$select_fields[2] REPRESENTS THE FIELDS TO SELECT FROM THE SE_LEVELS TABLE (QUERY WILL NOT RUN AT ALL IF VALUE IS LEFT BLANK)
	//		$select_fields[3] REPRESENTS THE FIELDS TO SELECT FROM THE SE_SUBNETS TABLE (QUERY WILL NOT RUN AT ALL IF VALUE IS LEFT BLANK)
	//	  
	// OUTPUT: 
	function se_user($user_unique = Array('0', '', ''), $select_fields = Array('*', '*', '*', '*')) {
	  global $database, $class_user;

	  // SET VARS
	  $this->is_error = 0;
	  $this->error_message = "";
	  $this->user_exists = 0;
	  $this->user_info[user_id] = 0;
	  
	  // VERIFY USER_ID/USER_USERNAME/USER_EMAIL IS VALID AND SET APPROPRIATE OBJECT VARIABLES
	  if($user_unique[0] != 0 | $user_unique[1] != "" | $user_unique[2] != "") {

	    // SET USERNAME AND EMAIL TO LOWERCASE
	    $user_username = strtolower($user_unique[1]);
	    $user_email = strtolower($user_unique[2]);

	    // SELECT USER USING SPECIFIED SELECTION PARAMETER
	    $user = $database->database_query("SELECT $select_fields[0] FROM se_users WHERE user_id='$user_unique[0]' OR LOWER(user_username)='$user_username' OR LOWER(user_email)='$user_email'");
	    if($database->database_num_rows($user) == 1) {
	      $this->user_exists = 1;
	      $this->user_info = $database->database_fetch_assoc($user);

	      // SET USER SALT
	      $this->user_salt = "$1$".substr($this->user_info[user_code], 0, 8)."$";

	      // SELECT PROFILE INFO
	      if($select_fields[1] != "") { $this->profile_info = $database->database_fetch_assoc($database->database_query("SELECT $select_fields[1] FROM se_profiles WHERE profile_user_id='".$this->user_info[user_id]."'")); }

	      // SELECT LEVEL INFO
	      if($select_fields[2] != "") { $this->level_info = $database->database_fetch_assoc($database->database_query("SELECT * FROM se_levels WHERE level_id='".$this->user_info[user_level_id]."'")); }

	      // SELECT SUBNET INFO
	      if($this->user_info[user_subnet_id] != 0) {
	        if($select_fields[3] != "") { $this->subnet_info = $database->database_fetch_assoc($database->database_query("SELECT subnet_id, subnet_name FROM se_subnets WHERE subnet_id='".$this->user_info[user_subnet_id]."'")); }
	      } else {
	        $this->subnet_info[subnet_id] = 0;
		$this->subnet_info[subnet_name] = $class_user[1];
	      }	
	    }
	  }

	} // END se_user() METHOD








	// THIS METHOD POPULATES THE USERSETTING VARIABLE
	// INPUT: $select_fields (OPTIONAL) REPRESENTING THE FIELDS TO SELECT FROM THE USERSETTINGS TABLE
	// OUTPUT: 
	function user_settings($select_fields = "*") {
	  global $database;

	  $this->usersetting_info = $database->database_fetch_assoc($database->database_query("SELECT $select_fields FROM se_usersettings WHERE usersetting_user_id='".$this->user_info[user_id]."'"));

	} // END user_settings() METHOD








	// THIS METHOD VERIFIES LOGIN COOKIES, SETS APPROPRIATE OBJECT VARIABLES, AND UPDATES LAST ACTIVE TIME
	// INPUT: 
	// OUTPUT: 
	function user_checkCookies() {
	  global $database, $setting;

	  if(isset($_COOKIE['user_id']) & isset($_COOKIE['user_email']) & isset($_COOKIE['user_password'])) {

	    // GET USER ROW IF AVAILABLE
	    $user_id = $_COOKIE['user_id'];
	    $this->se_user(Array($user_id));

	    // VERIFY USER EXISTS, LOGIN COOKIE VALUES ARE CORRECT, AND EMAIL HAS BEEN VERIFIED - ELSE RESET USER CLASS
	    if($this->user_exists == 0 | $_COOKIE['user_email'] != crypt($this->user_info[user_email], $this->user_salt) | $_COOKIE['user_password'] != $this->user_info[user_password] | ($this->user_info[user_verified] == 0 & $setting[setting_signup_verify] != 0)) {
	      $this->user_clear();
	    }
	  }

	  // IF USER LOGGED IN, UPDATE LAST ACTIVITY
	  if($this->user_exists != 0) {
	    $time_current = time();
	    $database->database_query("UPDATE se_users SET user_lastactive='$time_current' WHERE user_id='".$this->user_info[user_id]."'");
	  }

	} // END user_checkCookies() METHOD








	// THIS METHOD TRIES TO LOG A USER IN IF THERE IS NO ERROR
	// INPUT: $email REPRESENTING THE LOGIN EMAIL
	//	  $password REPRESENTING THE LOGIN PASSWORD
	//	  $javascript_disabled (OPTIONAL) A BOOLEAN REPRESENTING WHETHER JAVASCRIPT IS DISABLED OR NOT
	//	  $persistent (OPTIONAL) A BOOLEAN SPECIFYING WHETHER COOKIES SHOULD BE PERSISTENT OR NOT
	// OUTPUT: 
	function user_login($email, $password, $javascript_disabled = 0, $persistent = 0) {
	  global $database, $setting, $class_user;
	
	  $this->se_user(Array(0, "", $email));

	  $current_time = time();
	  $login_result = 0;

	  // SHOW ERROR IF JAVASCRIPT IS DIABLED
	  if($javascript_disabled == 1) {
	    $this->is_error = 1;
	    $this->error_message = $class_user[2];

	  // SHOW ERROR IF NO USER ROW FOUND
	  } elseif($this->user_exists == 0) {
	    $this->is_error = 1;
	    $this->error_message = $class_user[3];

	  // VALIDATE PASSWORD
	  } elseif(str_replace(" ", "", $password) == "" | crypt($password, $this->user_salt) != $this->user_info[user_password]) {
	    $this->is_error = 1;
	    $this->error_message = $class_user[3];
	  
	  // CHECK IF USER IS ENABLED
	  } elseif($this->user_info[user_enabled] == 0) {
	    $this->is_error = 1;
	    $this->error_message = $class_user[4];

	  // CHECK IF EMAIL IS VERIFIED
	  } elseif($this->user_info[user_verified] == 0 & $setting[setting_signup_verify] != 0) {
	    $this->is_error = 1;
	    $this->error_message = $class_user[5];
	  
	  // INITIATE LOGIN AND ENCRYPT COOKIES
	  } else {

	    // SET LOGIN RESULT VAR
	    $login_result = 1;

	    // UPDATE USER LOGIN INFO
	    $database->database_query("UPDATE se_users SET user_lastlogindate='$current_time', user_logins=user_logins+1 WHERE user_id='".$this->user_info[user_id]."'");

	    // LOG USER IN
	    $this->user_setcookies($persistent);

	    // UPDATE LOGIN STATS
	    update_stats("logins");

	  }

	  // BUMP LOG
	  $database->database_query("INSERT INTO se_logins (login_email, login_date, login_ip, login_result) VALUES ('$email', '$current_time', '".$_SERVER['REMOTE_ADDR']."', '$login_result')");
	  bumplog();

	} // END user_login() METHOD








	// THIS METHOD SETS USER LOGIN COOKIES
	// INPUT: $persistent (OPTIONAL) REPRESENTING WHETHER THE COOKIES SHOULD BE PERSISTENT OR NOT
	// OUTPUT: 
	function user_setcookies($persistent = 0) {
	  
	  $cookie_id = $cookie_email = $cookie_password = "";
	  if(!empty($this->user_info) && !empty($this->user_info['user_email']) && !empty($this->user_info['user_id']) && !empty($this->user_info['user_password'])) {
	    $cookie_id = $this->user_info['user_id'];
	    $cookie_email = crypt($this->user_info['user_email'], $this->user_salt);
	    $cookie_password = $this->user_info['user_password'];
	    if($persistent == 0) { $cookie_time = 0; } else { $cookie_time = time()+99999999; }
	  } else {
	    $cookie_time = time()-3600;
	  }

	  setcookie("user_id", $cookie_id, $cookie_time, "/");
	  setcookie("user_email", $cookie_email, $cookie_time, "/");
	  setcookie("user_password", $cookie_password, $cookie_time, "/");

	} // END user_setcookies() METHOD








	// THIS METHOD CLEARS ALL THE CURRENT OBJECT VARIABLES
	// INPUT:
	// OUTPUT:
	function user_clear() {
	  $this->is_error = 0;
	  $this->error_message = "";
	  $this->user_exists = 0;

	  $this->user_info = "";
	  $this->profile_info = "";
	  $this->level_info = "";
	  $this->subnet_info = "";

	  $this->new_pms_total = "";
	  $this->friend_requests_total = "";

	  $this->profile_tabs = "";
	  $this->profile_fields = "";
	  $this->profile_fields_new = "";
	  $this->profile_field_query = "";
	} // END user_clear() METHOD








	// THIS METHOD LOGS A USER OUT
	// INPUT:
	// OUTPUT:
	function user_logout() {
	  global $database;

	  // CLEAR LAST ACTIVITY DATE
	  $database->database_query("UPDATE se_users SET user_lastactive='' WHERE user_id='".$this->user_info[user_id]."'");

	  // CREATE PLAINTEXT USER EMAIL COOKIE WHILE LOGGED OUT
	  setcookie("prev_email", $this->user_info[user_email], time()+99999999, "/");

	  $this->user_clear();
	  $this->user_setcookies();
	} // END user_logout() METHOD









	// THIS METHOD VALIDATES USER ACCOUNT INPUT
	// INPUT: $email REPRESENTING THE DESIRED EMAIL
	//	  $username REPRESENTING THE DESIRED USERNAME
	// OUTPUT: 
	function user_account($email, $username) {
	  global $database, $setting, $class_user;

	  // MAKE SURE FIELDS ARE FILLED OUT
	  if(str_replace(" ", "", $email) == "" OR str_replace(" ", "", $username) == "") { $this->is_error = 1; $this->error_message = $class_user[6]; }

	  // MAKE SURE USERNAME IS ALPHANUMERIC
	  if(ereg('[^A-Za-z0-9]', $username)) { $this->is_error = 1; $this->error_message = $class_user[7]; }

	  // MAKE SURE USERNAME IS NOT BANNED
	  $banned_usernames = explode(",", strtolower($setting[setting_banned_usernames]));
	  if(in_array(strtolower($username), $banned_usernames) === TRUE & str_replace(" ", "", $username) != "") { $this->is_error = 1; $this->error_message = $class_user[8]; }

	  // MAKE SURE USERNAME IS NOT RESERVED
	  if(is_dir($username)) { $this->is_error = 1; $this->error_message = $class_user[9]; }

	  // MAKE SURE EMAIL IS NOT BANNED
	  $banned_emails = explode(",", strtolower($setting[setting_banned_emails]));
	  $wildcard_ban = "*".strstr(strtolower($email), "@");
	  if((in_array(strtolower($email), $banned_emails) === TRUE | in_array(strtolower($wildcard_ban), $banned_emails) === TRUE) & str_replace(" ", "", $email) != "") { $this->is_error = 1; $this->error_message = $class_user[10]; }

	  // MAKE SURE EMAIL IS VALID
	  if(!is_email_address($email)) { $this->is_error = 1; $this->error_message = $class_user[11]; }

	  // MAKE SURE USERNAME IS UNIQUE
	  $lowercase_username = strtolower($username);
	  $username_query = $database->database_query("SELECT user_username FROM se_users WHERE LOWER(user_username)='$lowercase_username' LIMIT 1");
	  if(strtolower($this->user_info[user_username]) != $lowercase_username & $database->database_num_rows($username_query) != 0) { $this->is_error = 1; $this->error_message = $class_user[12]; }

	  // MAKE SURE EMAIL IS UNIQUE
	  $lowercase_email = strtolower($email);
	  $email_query = $database->database_query("SELECT user_email FROM se_users WHERE LOWER(user_email)='$lowercase_email' LIMIT 1");  
	  if(strtolower($this->user_info[user_email]) != $lowercase_email & $database->database_num_rows($email_query) != 0) { $this->is_error = 1; $this->error_message = $class_user[13]; }

	} // END user_account() METHOD









	// THIS METHOD VALIDATES USER PASSWORD INPUT
	// INPUT: $password_old REPRESENTING THE EXISTING PASSWORD
	//	  $password REPRESENTING THE DESIRED PASSWORD
	//	  $password_confirm REPRESENTING THE PASSWORD CONFIRMATION FIELD
	//	  $check_old (OPTIONAL) REPRESENTING WHETHER THE OLD PASSWORD SHOULD BE VERIFIED OR NOT
	// OUTPUT: 
	function user_password($password_old, $password, $password_confirm, $check_old = 1) {
	  global $class_user;

	  // CHECK FOR EMPTY PASSWORDS
	  if(str_replace(" ", "", $password) == "" | str_replace(" ", "", $password_confirm) == "" | ($check_old == 1 & str_replace(" ", "", $password_old) == "")) { $this->is_error = 1; $this->error_message = $class_user[6]; }

	  // CHECK FOR OLD PASSWORD MATCH
	  if($check_old == 1 & crypt($password_old, $this->user_salt) != $this->user_info[user_password]) { $this->is_error = 1; $this->error_message = $class_user[14]; }

	  // MAKE SURE BOTH PASSWORDS ARE IDENTICAL
	  if($password != $password_confirm) { $this->is_error = 1; $this->error_message = $class_user[15]; }

	  // MAKE SURE PASSWORD IS LONGER THAN 5 CHARS
	  if(str_replace(" ", "", $password) != "" & strlen($password) < 6) { $this->is_error = 1; $this->error_message = $class_user[16]; }

	  // MAKE SURE PASSWORD IS ALPHANUMERIC
	  if(ereg('[^A-Za-z0-9]', $password)) { $this->is_error = 1; $this->error_message = $class_user[17]; }


	} // END user_password() METHOD









	// THIS METHOD LOOPS AND/OR VALIDATES USER PROFILE FIELD INPUT AND CREATES A PARTIAL QUERY TO UPDATE PROFILE TABLE
	// INPUT: $tabs_only (OPTIONAL) REPRESENTING A BOOLEAN THAT DETERMINES WHETHER TO RETRIEVE FIELD INFO OR JUST TABS 
	//	  $tab_id (OPTIONAL) REPRESENTING THE TAB ID OF THE TAB TO BE LISTED - "0" REPRESENTS ALL TABS
	//	  $validate (OPTIONAL) REPRESENTING A BOOLEAN THAT DETERMINES WHETHER TO VALIDATE POST VARS OR NOT
	//	  $signup (OPTIONAL) REPRESENTING A BOOLEAN THAT DETERMINES WHETHER TO DISPLAY ALL OR SIGNUP FIELDS ONLY
	//	  $profile (OPTIONAL) REPRESENTING A BOOLEAN THAT DETERMINES WHETHER TO CREATE FORMATTED PROFILE FIELD VALUES
	//	  $search (OPTIONAL) REPRESENTING A "2" TO CREATE A SEARCH QUERY, A "1" TO CREATE A SEARCH QUERY, AND A "0" TO DO NOTHING
	// OUTPUT: 
	function user_fields($tabs_only = 0, $tab_id = 0, $validate = 0, $signup = 0, $profile = 0, $search = 0) {
	  global $database, $datetime, $setting, $class_user;

	  // INCLUDE FILTER CLASS
	  if(!class_exists("InputFilter")) { include "./include/class_inputfilter.php"; }

	  // SET PROFILE TAB VARIABLES
	  $tab_query = "SELECT * FROM se_tabs"; if($tab_id != 0) { $tab_query .= " WHERE tab_id='$tab_id'"; } $tab_query .= " ORDER BY tab_order";
	  $tabs = $database->database_query($tab_query);

	  // LOOP THROUGH TABS
	  while($tab_info = $database->database_fetch_assoc($tabs)) {

	    // GET NON DEPENDENT FIELDS IN TAB IF NECESSARY
	    if($tabs_only == 0) {
	      $field_count = 0;
	      $this->profile_fields = "";
	      $field_query = "SELECT * FROM se_fields WHERE field_tab_id='$tab_info[tab_id]' AND field_dependency='0'"; if($signup != 0) { $field_query .= " AND field_signup<>'0'"; } if($profile != 0) { $field_query .= " AND field_browsable<>'-1'"; } if($search != 0) { $field_query .= " AND (field_browsable='1' OR field_browsable='2')"; } $field_query .= " ORDER BY field_order";
	      $fields = $database->database_query($field_query);
	      while($field_info = $database->database_fetch_assoc($fields)) {

	        // SET FIELD VARS
	        $is_field_error = 0;
	        $field_value = "";
	        $field_value_profile = "";

	        // FIELD TYPE SWITCH
	        switch($field_info[field_type]) {

	          case 1: // TEXT FIELD
	          case 2: // TEXTAREA

	            // VALIDATE POSTED FIELD VALUE
	            if($validate == 1) {

	              // RETRIEVE POSTED FIELD VALUE AND FILTER FOR ADMIN-SPECIFIED HTML TAGS
		      $xssFilter = new InputFilter(explode(",", $field_info[field_html]), "", 0, 1, 1);
	              $profile_var = "field_".$field_info[field_id];
	              $field_value = security($xssFilter->process(censor($_POST[$profile_var])));

	              if($field_info[field_type] == 2) { $field_value = str_replace("\r\n", "<br>", $field_value); }

	              // CHECK FOR REQUIRED
	              if($field_info[field_required] != 0 & str_replace(" ", "", $field_value) == "") {
	                $this->is_error = 1;
	                $this->error_message = $class_user[6];
	                $is_field_error = 1;
	              }

	              // RUN PREG MATCH (ONLY FOR TEXT FIELDS)
	              if($field_info[field_regex] != "" & str_replace(" ", "", $field_value) != "") {
	                if(!preg_match($field_info[field_regex], $field_value)) {
	                  $this->is_error = 1;
	                  $this->error_message = $class_user[18];
	                  $is_field_error = 1;
	                }
	              }

	              // UPDATE SAVE PROFILE QUERY
	              if($this->profile_field_query != "") { $this->profile_field_query .= ", "; }
	              $this->profile_field_query .= "profile_$field_info[field_id]='$field_value'";

		    // CREATE A SEARCH QUERY FROM POSTED FIELD VALUE
		    } elseif($search == 1) {
		      $var = "field_".$field_info[field_id];
		      if(isset($_POST[$var])) { $field_value = $_POST[$var]; } elseif(isset($_GET[$var])) { $field_value = $_GET[$var]; } else { $field_value = ""; }
		      if($field_value != "") { 
			if($this->profile_field_query != "") { $this->profile_field_query .= " AND "; } 
			$this->profile_field_query .= "profile_$field_info[field_id] LIKE '%$field_value%'"; 
			$this->url_string .= $var."=".urlencode($field_value)."&";
		      }

		    // DO NOT VALIDATE FIELD VALUE AND DON'T CREATE SEARCH VALUE
	            } else {
	              // RETRIEVE DATABASE FIELD VALUE
	              if($this->profile_info != "") {
	                $profile_column = "profile_".$field_info[field_id];
	                $field_value = $this->profile_info[$profile_column];
	              }
	            }

		    // FORMAT VALUE FOR PROFILE
		    if($profile == 1) {

		      // LINK BROWSABLE FIELD VALUES IF NECESSARY
		      if($field_info[field_browsable] == 2) {
		        $br_exploded_field_values = explode("<br>", trim($field_value));
		        $exploded_field_values = Array();
		        foreach($br_exploded_field_values as $key => $value) {
		          $comma_exploded_field_values = explode(",", trim($value));
		          array_walk($comma_exploded_field_values, 'link_field_values', Array($field_info[field_id], "", $field_info[field_link], $field_info[field_browsable]));
			  $exploded_field_values[$key] = implode(", ", $comma_exploded_field_values);
		        }
		        $field_value_profile = implode("<br>", $exploded_field_values);

		      // MAKE SURE TO LINK FIELDS WITH A LINK TAG
		      } else {
			$exploded_field_values = Array(trim($field_value));
			array_walk($exploded_field_values, 'link_field_values', Array($field_info[field_id], "", $field_info[field_link], $field_info[field_browsable]));
			$field_value_profile = implode("", $exploded_field_values);
		      }

		      // DECODE TO MAKE HTML TAGS FOR PROFILE FIELDS VALID
		      $field_value_profile = htmlspecialchars_decode($field_value_profile, ENT_QUOTES);

		    // FORMAT VALUE FOR FORM
		    } else {
		      if($field_info[field_type] == 2) { $field_value = str_replace("<br>", "\r\n", $field_value); }
		    }
	            break;



	          case 3: // SELECT BOX
	          case 4: // RADIO BUTTON

	            // VALIDATE POSTED FIELD
	            if($validate == 1) {

	              // RETRIEVE POSTED FIELD VALUE
	              $profile_var = "field_".$field_info[field_id];
	              $field_value = censor($_POST[$profile_var]);

	              // CHECK FOR REQUIRED
	              if($field_info[field_required] != 0 & $field_value == "-1") {
	                $this->is_error = 1;
	                $this->error_message = $class_user[6];
	                $is_field_error = 1;
	              }

	              // UPDATE SAVE PROFILE QUERY
	              if($this->profile_field_query != "") { $this->profile_field_query .= ", "; }
	              $this->profile_field_query .= "profile_$field_info[field_id]='$field_value'";


		    // CREATE A SEARCH QUERY FROM POSTED FIELD VALUE
		    } elseif($search == 1) {
		      $var = "field_".$field_info[field_id];
		      if(isset($_POST[$var])) { $field_value = $_POST[$var]; } elseif(isset($_GET[$var])) { $field_value = $_GET[$var]; } else { $field_value = ""; }
	              if($field_value != "-1" & $field_value != "") { 
			if($this->profile_field_query != "") { $this->profile_field_query .= " AND "; } 
			$this->profile_field_query .= "profile_$field_info[field_id]='$field_value'"; 
			$this->url_string .= $var."=".urlencode($field_value)."&";
		      }

		    // DO NOT VALIDATE FIELD VALUE AND DON'T CREATE SEARCH VALUE
	            } else {
	              // RETRIEVE DATABASE FIELD VALUE
	              if($this->profile_info != "") {
	                $profile_column = "profile_".$field_info[field_id];
	                $field_value = $this->profile_info[$profile_column];
	              }
	            }

	            // LOOP OVER FIELD OPTIONS
	            $field_options = Array();
	            $options = explode("<~!~>", $field_info[field_options]);
	            $num_options = 0;
	            for($i=0,$max=count($options);$i<$max;$i++) {
	              $dep_field_info = "";
	              $option_dependency = 0;
	              $dep_field_value = "";
	              if(str_replace(" ", "", $options[$i]) != "") {
	                $option = explode("<!>", $options[$i]);
	                $option_id = $option[0];
	                $option_label = $option[1];
	                $option_dependency = $option[2];
	                $option_dependent_field_id = $option[3];

	                // OPTION HAS DEPENDENCY
	                if($option_dependency == "1") { 
	                  $dep_field = $database->database_query("SELECT field_id, field_title, field_maxlength, field_link, field_style, field_browsable, field_required, field_regex FROM se_fields WHERE field_id='$option_dependent_field_id' AND field_dependency='$field_info[field_id]'");
	                  if($database->database_num_rows($dep_field) != "1") {
	                    $dep_field_info = "";
	                    $option_dependency = 0;
	                    $dep_field_value = "";
	                  } else {
	                    $dep_field_info = $database->database_fetch_assoc($dep_field);

	                    // VALIDATE POSTED FIELD VALUE
	                    if($validate == 1) {
	                      // OPTION SELECTED
	                      if($field_value == $option_id) {
	                        $dep_profile_var = "field_".$dep_field_info[field_id];
	                        $dep_field_value = censor($_POST[$dep_profile_var]);
  
	                        // CHECK FOR REQUIRED
	                        if($dep_field_info[field_required] != 0 & str_replace(" ", "", $dep_field_value) == "") {
	                          $this->is_error = 1;
	                          $this->error_message = $class_user[6];
	                          $is_field_error = 1;
	                        }

	                        // RUN PREG MATCH
	                        if($dep_field_info[field_regex] != "" & str_replace(" ", "", $dep_field_value) != "") {
	                          if(!preg_match($dep_field_info[field_regex], $dep_field_value)) {
	                            $this->is_error = 1;
	                            $this->error_message = $class_user[18];
	                            $is_field_error = 1;
	                          }
	                        }

	                      // OPTION NOT SELECTED
	                      } else {
	                        $dep_field_value = "";
	                      }

	    	              // UPDATE SAVE PROFILE QUERY
	    	              if($this->profile_field_query != "") { $this->profile_field_query .= ", "; }
	    	              $this->profile_field_query .= "profile_$dep_field_info[field_id]='$dep_field_value'";


			    // DO NOT VALIDATE POSTED FIELD VALUE
	                    } else {
	                      // RETRIEVE DATABASE FIELD VALUE
	                      if($this->profile_info != "") {
	                      $profile_column = "profile_".$dep_field_info[field_id];
	                      $dep_field_value = $this->profile_info[$profile_column];
	                      }
	                    }
	                  }
	                }

			// FORMAT VALUE FOR PROFILE IF OPTION IS SELECTED
			if($profile == 1 & $field_value == $option_id) {
			  $field_value_profile = $option_label;

			  // LINK FIELD VALUES IF NECESSARY
			  if($field_info[field_browsable] == 2) { 
			    link_field_values($field_value_profile, "", Array($field_info[field_id], $option[0], "", $field_info[field_browsable])); 
			    if($dep_field_value != "") { link_field_values($dep_field_value, "", Array($dep_field_info[field_id], "", $dep_field_info[field_link], $dep_field_info[field_browsable])); }
			  }

			  // ADD DEPENDENT VALUE TO FIELD VALUE
			  if($dep_field_value != "") { $field_value_profile .= " ".$dep_field_info[field_title]." ".$dep_field_value; }
			}
          
	                // SET OPTIONS ARRAY
	                $field_options[$num_options] = Array('option_id' => $option_id,
								'option_label' => $option_label,
								'option_dependency' => $option_dependency,
								'dep_field_id' => $dep_field_info[field_id],
								'dep_field_title' => $dep_field_info[field_title],
								'dep_field_required' => $dep_field_info[field_required],
								'dep_field_maxlength' => $dep_field_info[field_maxlength],
								'dep_field_style' => $dep_field_info[field_style],
								'dep_field_value' => $dep_field_value,
								'dep_field_error' => $dep_field_error);
	                $num_options++;
	              }
	            }
	            break;


	          case 5: // DATE FIELD

		    // SET MONTH, DAY, AND YEAR FORMAT FROM SETTINGS
		    switch($setting[setting_dateformat]) {
		      case "n/j/Y": case "n.j.Y": case "n-j-Y": $month_format = "n"; $day_format = "j"; $year_format = "Y"; $date_order = "mdy"; break;
		      case "Y/n/j": case "Ynj": $month_format = "n"; $day_format = "j"; $year_format = "Y"; $date_order = "ymd"; break;
		      case "Y-n-d": $month_format = "n"; $day_format = "d"; $year_format = "Y"; $date_order = "ymd"; break;
		      case "Y-m-d": $month_format = "m"; $day_format = "d"; $year_format = "Y"; $date_order = "ymd"; break;
		      case "j/n/Y": case "j.n.Y": $month_format = "n"; $day_format = "j"; $year_format = "Y"; $date_order = "dmy"; break;
		      case "M. j, Y": $month_format = "M"; $day_format = "j"; $year_format = "Y"; $date_order = "mdy"; break;
		      case "F j, Y": case "l, F j, Y": $month_format = "F"; $day_format = "j"; $year_format = "Y"; $date_order = "mdy"; break;
		      case "j F Y": case "D j F Y": case "l j F Y": $month_format = "F"; $day_format = "j"; $year_format = "Y"; $date_order = "dmy"; break;
		      case "D-j-M-Y": case "D j M Y": case "j-M-Y": $month_format = "M"; $day_format = "j"; $year_format = "Y"; $date_order = "dmy"; break;
		      case "Y-M-j": $month_format = "M"; $day_format = "j"; $year_format = "Y"; $date_order = "ymd"; break;
		    }  
  

	            // VALIDATE POSTED VALUE
	            if($validate == 1) {
	              // RETRIEVE POSTED FIELD VALUE
	              $profile_var1 = "field_".$field_info[field_id]."_1";
	              $profile_var2 = "field_".$field_info[field_id]."_2";
	              $profile_var3 = "field_".$field_info[field_id]."_3";
	              $field_1 = $_POST[$profile_var1];
	              $field_2 = $_POST[$profile_var2];
	              $field_3 = $_POST[$profile_var3];

	              // ORDER DATE VALUES PROPERLY
	              switch($date_order) {
	                case "mdy": $month = $field_1; $day = $field_2; $year = $field_3; break;
	                case "ymd": $year = $field_1; $month = $field_2; $day = $field_3; break;
	                case "dmy": $day = $field_1; $month = $field_2; $year = $field_3; break;
	              }
  
	              // SET ALL TO BLANK IF ONE FIELD BLANK
	              if($month == 0 | $day == 0 | $year == 0) { $month = 0; $day = 0; $year = 0; }

	              // CONSTRUCT TIMESTAMP FROM MONTH, DAY, YEAR
	              $field_value = $datetime->MakeTime("0", "0", "0", "$month", "$day", "$year");
  
	              // CHECK FOR REQUIRED
	              if($field_info[field_required] != 0 & $field_value == $datetime->MakeTime("0", "0", "0", "0", "0", "0")) {
	                $this->is_error = 1;
	                $this->error_message = $class_user[6];
	                $is_field_error = 1;
	              }

	              // UPDATE SAVE PROFILE QUERY
	              if($this->profile_field_query != "") { $this->profile_field_query .= ", "; }
	              $this->profile_field_query .= "profile_$field_info[field_id]='$field_value'";


		    // CREATE A SEARCH QUERY FROM POSTED FIELD VALUE
		    } elseif($search == 1) {
		      $var1 = "field_".$field_info[field_id]."_1";
		      $var2 = "field_".$field_info[field_id]."_2";
		      $var3 = "field_".$field_info[field_id]."_3";
		      if(isset($_POST[$var1])) { $field_1 = $_POST[$var1]; } elseif(isset($_GET[$var1])) { $field_1 = $_GET[$var1]; } else { $field_1 = ""; }
		      if(isset($_POST[$var2])) { $field_2 = $_POST[$var2]; } elseif(isset($_GET[$var2])) { $field_2 = $_GET[$var2]; } else { $field_2 = ""; }
		      if(isset($_POST[$var3])) { $field_3 = $_POST[$var3]; } elseif(isset($_GET[$var3])) { $field_3 = $_GET[$var3]; } else { $field_3 = ""; }

	              // ORDER DATE VALUES PROPERLY
	              switch($date_order) {
	                case "mdy": $month = $field_1; $day = $field_2; $year = $field_3; break;
	                case "ymd": $year = $field_1; $month = $field_2; $day = $field_3; break;
	                case "dmy": $day = $field_1; $month = $field_2; $year = $field_3; break;
	              }

	              // SET ALL TO BLANK IF ONE FIELD BLANK
	              if($month == 0 | $day == 0 | $year == 0) { $month = 0; $day = 0; $year = 0; }

	              // CONSTRUCT TIMESTAMP FROM MONTH, DAY, YEAR
	              $field_value = $datetime->MakeTime("0", "0", "0", "$month", "$day", "$year");

		      
	              if($field_value != $datetime->MakeTime("0", "0", "0", "0", "0", "0")) { 
			if($this->profile_field_query != "") { $this->profile_field_query .= " AND "; } 
			$this->profile_field_query .= "profile_$field_info[field_id]='$field_value'"; 
			$this->url_string .= $var1."=".urlencode($field_1)."&";
			$this->url_string .= $var2."=".urlencode($field_2)."&";
			$this->url_string .= $var3."=".urlencode($field_3)."&";
		      }

		    // DO NOT VALIDATE FIELD VALUE AND DON'T CREATE SEARCH VALUE
	            } else {
	              // RETRIEVE DATABASE FIELD VALUE
	              if($this->profile_info != "") {
	                $profile_column = "profile_".$field_info[field_id];
	                $field_value = $this->profile_info[$profile_column];
	              } else {
	                $field_value = $datetime->MakeTime("0", "0", "0", "0", "0", "0");
	              }
	            }


		    // FORMAT VALUE FOR PROFILE
		    if($profile == 1) {
	   	      if($field_value != $datetime->MakeTime("0", "0", "0", "0", "0", "0")) { 
	                $field_date = $datetime->MakeDate($field_value);
			$field_time = strtotime("$field_date[1] $field_date[3] $field_date[2]");
			$field_value_profile = $datetime->cdate($setting[setting_dateformat], $field_time); 
			if($field_info[field_browsable] == 2) { link_field_values($field_value_profile, "", Array($field_info[field_id], $field_value, "", $field_info[field_browsable])); }
		      }


		    // FORMAT VALUE FOR FORM
	    	    } else {

	              // DECONSTRUCT TIMESTAMP INTO DATE MONTH, DAY, AND YEAR
	              if($field_value != $datetime->MakeTime("0", "0", "0", "0", "0", "0")) {
	                $field_date = $datetime->MakeDate($field_value);
	                $field_month = $field_date[0]; $field_day = $field_date[1]; $field_year = $field_date[2];
	              } else {
	                $field_month = 0; $field_day = 0; $field_year = 0;
	              }

	              // CONSTRUCT MONTH ARRAY
	              $month_array = Array();
	              $month_array[0] = Array('name' => "[$class_user[27]]", 'value' => "0", 'selected' => "");
	              for($m=1;$m<=12;$m++) {
	                if($field_month == $m) { $selected = " SELECTED"; } else { $selected = ""; }
	                $month_array[$m] = Array('name' => $datetime->cdate("$month_format", mktime(0, 0, 0, $m, 1, 1990)),
	    					'value' => $m,
	    					'selected' => $selected);
	              }
  
	              // CONSTRUCT DAY ARRAY
	              $day_array = Array();
	              $day_array[0] = Array('name' => "[$class_user[28]]", 'value' => "0", 'selected' => "");
	              for($d=1;$d<=31;$d++) {
	                if($field_day == $d) { $selected = " SELECTED"; } else { $selected = ""; }
	                $day_array[$d] = Array('name' => $datetime->cdate("$day_format", mktime(0, 0, 0, 1, $d, 1990)),
	    					'value' => $d,
	    					'selected' => $selected);
	              }

	              // CONSTRUCT YEAR ARRAY
	              $year_array = Array();
	              $year_count = 1;
	              $current_year = $datetime->cdate("Y", time());
	              $year_array[0] = Array('name' => "[$class_user[29]]", 'value' => "0", 'selected' => "");
	              for($y=$current_year;$y>=1920;$y--) {
	                if($field_year == $y) { $selected = " SELECTED"; } else { $selected = ""; }
	                $year_array[$year_count] = Array('name' => $y,
	    						'value' => $y,
	    						'selected' => $selected);
	              $year_count++;
	              }

	              // ORDER DATE ARRAYS PROPERLY
	              switch($date_order) {
	                case "mdy": $date_array1 = $month_array; $date_array2 = $day_array; $date_array3 = $year_array; break;
	                case "ymd": $date_array1 = $year_array; $date_array2 = $month_array; $date_array3 = $day_array; break;
	                case "dmy": $date_array1 = $day_array; $date_array2 = $month_array; $date_array3 = $year_array; break;
	              }
		    }

	            break;

	        }

	        // SET FIELD ERROR IF ERROR OCCURRED
	        if($is_field_error == 1) { $field_error = $field_info[field_error]; } else { $field_error = ""; }

	        // SET FIELD VALUE ARRAY FOR LATER USE IN SUBNET SORTING
	        $this->profile_fields_new["profile_".$field_info[field_id]] = $field_value;

	        // SET FIELD ARRAY AND INCREMENT FIELD COUNT
	        if($profile == 0 | ($profile == 1 & $field_value_profile != "")) {
		  $this->profile_fields[] = Array('field_id' => $field_info[field_id], 
						'field_title' => $field_info[field_title], 
						'field_desc' => $field_info[field_desc],
						'field_type' => $field_info[field_type],
						'field_required' => $field_info[field_required],
						'field_style' => $field_info[field_style],
						'field_maxlength' => $field_info[field_maxlength],
						'field_birthday' => $field_info[field_birthday],
						'field_options' => $field_options,
						'field_value' => $field_value,
						'field_value_profile' => $field_value_profile,
						'field_error' => $field_error,
						'date_array1' => $date_array1,
						'date_array2' => $date_array2,
						'date_array3' => $date_array3);
		  $field_count++;
		}

	      } 
	    }

	    // SET TAB ARRAY AND INCREMENT TAB COUNT IF THERE ARE FIELDS IN THE TAB
	    if($field_count != 0 | $tabs_only == 1) {
	      $this->profile_tabs[] = Array('tab_id' => $tab_info[tab_id], 
						'tab_name' => $tab_info[tab_name], 
						'tab_o' => $tab_o, 
						'tab_status' => $tab_status,
						'tab_order' => $tab_order,
						'fields' => $this->profile_fields);
	    }
	  }
	} // END user_fields() METHOD








	// THIS METHOD RETURNS A SUBNETWORK ID DEPENDENT ON GIVEN INPUTS
	// INPUT: $email (OPTIONAL) REPRESENTING THE USER'S EMAIL 
	//	  $profile_info (OPTIONAL) REPRESENTING THE USER'S PROFILE INFO
	// OUTPUT: RETURNS AN ARRAY CONTAINING THE SUBNETWORK ID AND RESULT STRINGS
	function user_subnet_select($email = "", $profile_info = "") {
	  global $database, $datetime, $setting, $class_user;

	  // SET DEFAULTS
	  if($email == "") { $email = $this->user_info[user_email]; }
	  if($profile_info == "") { $profile_info = $this->profile_info; }
	  if($this->user_info[user_subnet_id] == "") { $subnet_id = 0; } else { $subnet_id = $this->user_info[user_subnet_id]; }

	  // DETERMINE USER'S PRIMARY SUBNETWORK FIELD VALUE
	  $field1_val = "";
	  switch($setting[setting_subnet_field1_id]) {
	    case -1: break;
	    case 0: $field1_val = $email; break;
	    default:
	      $field1 = $database->database_query("SELECT field_id, field_birthday FROM se_fields WHERE field_id='$setting[setting_subnet_field1_id]'");
	      if($database->database_num_rows($field1) != 0) {
	        $field1_info = $database->database_fetch_assoc($field1);
	        if($field1_info[field_birthday] == 1) {
	          $field1_val = $datetime->age($profile_info["profile_".$field1_info[field_id]]);
	        } else {
	          $field1_val = $profile_info["profile_".$field1_info[field_id]];
	        }
	      }
	  }

	  // DETERMINE USER'S SECONDARY SUBNETWORK FIELD VALUE
	  $field2_val = "";
	  switch($setting[setting_subnet_field2_id]) {
	    case -1: break;
	    case 0: $field2_val = $email; break;
	    default:
	      $field2 = $database->database_query("SELECT field_id, field_birthday FROM se_fields WHERE field_id='$setting[setting_subnet_field2_id]'");
	      if($database->database_num_rows($field2) != 0) {
	        $field2_info = $database->database_fetch_assoc($field2);
	        if($field2_info[field_birthday] == 1) {
	          $field2_val = $datetime->age($profile_info["profile_".$field2_info[field_id]]);
	        } else {
	          $field2_val = $profile_info["profile_".$field2_info[field_id]];
	        }
	      }
	  }

	  // IF FIELD VALUES NOT EMPTY, RUN QUERY
	  if($field1_val != "") {

	    // SET NUMERICAL VALUES
	    $field1_val_num = "'".$field1_val."'";
	    $field2_val_num = "'".$field2_val."'";
	    if(is_numeric($field1_val)) { $field1_val_num = str_replace(" ", "", $field1_val); }
	    if(is_numeric($field2_val)) { $field2_val_num = str_replace(" ", "", $field2_val); }

	    // SET SUBNETWORK QUERY
	    $subnet_query = "SELECT subnet_id, subnet_name FROM se_subnets WHERE
	    ( 
	      (subnet_field1_qual='==' AND '$field1_val' LIKE REPLACE(subnet_field1_value, '*', '%')) OR
	      (subnet_field1_qual='!=' AND '$field1_val' NOT LIKE REPLACE(subnet_field1_value, '*', '%')) OR
	      (subnet_field1_qual='>' AND subnet_field1_value<$field1_val_num) OR
	      (subnet_field1_qual='<' AND subnet_field1_value>$field1_val_num) OR
	      (subnet_field1_qual='>=' AND subnet_field1_value<=$field1_val_num) OR
	      (subnet_field1_qual='<=' AND subnet_field1_value>=$field1_val_num) OR
	      (subnet_field1_qual='' AND subnet_field1_value='')
	    ) AND (
	      (subnet_field2_qual='==' AND '$field2_val' LIKE REPLACE(subnet_field2_value, '*', '%')) OR
	      (subnet_field2_qual='!=' AND '$field2_val' NOT LIKE REPLACE(subnet_field2_value, '*', '%')) OR
	      (subnet_field2_qual='>' AND subnet_field2_value<$field2_val_num) OR
	      (subnet_field2_qual='<' AND subnet_field2_value>$field2_val_num) OR
	      (subnet_field2_qual='>=' AND subnet_field2_value<=$field2_val_num) OR
	      (subnet_field2_qual='<=' AND subnet_field2_value>=$field2_val_num) OR
	      (subnet_field2_qual='' AND subnet_field2_value='')
	    ) LIMIT 1";

	    // RUN SUBNETWORK QUERY AND FIND USER'S SUBNETWORK ID
	    $subnet = $database->database_query($subnet_query);
	    if($database->database_num_rows($subnet) != 0) { 
	      $subnet_info = $database->database_fetch_assoc($subnet);
	      $subnet_id = $subnet_info[subnet_id]; 
	    } else {
	      $subnet_id = 0;
	    }

	  }

	  // IF SUBNETWORK CHANGED, ADD NOTE
	  if($subnet_id != $this->user_info[user_subnet_id]) {
	    if($subnet_id != 0) { $new_subnet = $subnet_info[subnet_name]; } else { $new_subnet = $class_user[1]; }
	    $subnet_changed = $class_user[19].$this->subnet_info[subnet_name].$class_user[20]."$new_subnet.";
	    $subnet_changed_verify = $class_user[21].$this->subnet_info[subnet_name].$class_user[20]."$new_subnet.";
	  }

	  return Array($subnet_id, $new_subnet, $subnet_changed, $subnet_changed_verify);
	  
	} // END user_subnet_select() METHOD








	// THIS METHOD UPDATES THE USER'S LAST UPDATE DATE
	// INPUT: 
	// OUTPUT: 
	function user_lastupdate() {
	  global $database;

	  $database->database_query("UPDATE se_users SET user_dateupdated='".time()."' WHERE user_id='".$this->user_info[user_id]."'");
	  
	} // END user_lastupdate() METHOD








	// THIS METHOD OUTPUTS THE PATH TO THE USER'S PHOTO OR THE GIVEN NOPHOTO IMAGE
	// INPUT: $nophoto_image (OPTIONAL) REPRESENTING THE PATH TO AN IMAGE TO OUTPUT IF NO PHOTO EXISTS
	// OUTPUT: A STRING CONTAINING THE PATH TO THE USER'S PHOTO
	function user_photo($nophoto_image = "") {
	  global $url;

	  $user_photo = $url->url_userdir($this->user_info[user_id]).$this->user_info[user_photo];
	  if(!file_exists($user_photo) | $this->user_info[user_photo] == "") { $user_photo = $nophoto_image; }
	  return $user_photo;
	  
	} // END user_photo() METHOD








	// THIS METHOD UPLOADS A USER PHOTO ACCORDING TO SPECIFICATIONS AND RETURNS USER PHOTO
	// INPUT: $photo_name REPRESENTING THE NAME OF THE FILE INPUT
	// OUTPUT: 
	function user_photo_upload($photo_name) {
	  global $database, $url;

	  // SET KEY VARIABLES
	  $file_maxsize = "4194304";
	  $file_exts = explode(",", str_replace(" ", "", strtolower($this->level_info[level_photo_exts])));
	  $file_types = explode(",", str_replace(" ", "", strtolower("image/jpeg, image/jpg, image/jpe, image/pjpeg, image/pjpg, image/x-jpeg, x-jpg, image/gif, image/x-gif, image/png, image/x-png")));
	  $file_maxwidth = $this->level_info[level_photo_width];
	  $file_maxheight = $this->level_info[level_photo_height];
	  $photo_newname = "0_".rand(1000, 9999).".jpg";
	  $file_dest = $url->url_userdir($this->user_info[user_id]).$photo_newname;

	  $new_photo = new se_upload();
	  $new_photo->new_upload($photo_name, $file_maxsize, $file_exts, $file_types, $file_maxwidth, $file_maxheight);

	  // UPLOAD AND RESIZE PHOTO IF NO ERROR
	  if($new_photo->is_error == 0) {

	    // DELETE OLD AVATAR IF EXISTS
	    $this->user_photo_delete();

	    // CHECK IF IMAGE RESIZING IS AVAILABLE, OTHERWISE MOVE UPLOADED IMAGE
	    if($new_photo->is_image == 1) {
	      $new_photo->upload_photo($file_dest);
	    } else {
	      $new_photo->upload_file($file_dest);
	    }

	    // UPDATE USER INFO WITH IMAGE IF STILL NO ERROR
	    if($new_photo->is_error == 0) {
	      $database->database_query("UPDATE se_users SET user_photo='$photo_newname' WHERE user_id='".$this->user_info[user_id]."'");
	      $this->user_info[user_photo] = $photo_newname;
	    }
	  }
	
	  $this->is_error = $new_photo->is_error;
	  $this->error_message = $new_photo->error_message;
	  
	} // END user_photo_upload() METHOD








	// THIS METHOD DELETES A USER PHOTO
	// INPUT: 
	// OUTPUT: 
	function user_photo_delete() {
	  global $database;
	  $user_photo = $this->user_photo();
	  if($user_photo != "") {
	    unlink($user_photo);
	    $database->database_query("UPDATE se_users SET user_photo='' WHERE user_id='".$this->user_info[user_id]."'");
	    $this->user_info[user_photo] = "";
	  }
	} // END user_photo_delete() METHOD








	// THIS METHOD RETURNS THE TOTAL NUMBER OF FRIENDS
	// INPUT: $direction (OPTIONAL) REPRESENTING A "0" FOR OUTGOING CONNECTIONS AND A "1" FOR INCOMING CONNECTIONS
	//	  $friend_status (OPTIONAL) REPRESENTING THE FRIEND STATUS (1 FOR CONFIRMED, 0 FOR PENDING REQUESTS)
	//	  $user_details (OPTIONAL) REPRESENTING WHETHER THE QUERY SHOULD JOIN TO THE USER TABLE OR NOT
	//	  $where (OPTIONAL) REPRESENTING ADDITIONAL THINGS TO INCLUDE IN THE WHERE CLAUSE
	// OUTPUT: AN INTEGER REPRESENTING THE NUMBER OF FRIENDS
	function user_friend_total($direction = 0, $friend_status = 1, $user_details = 0, $where = "") {
	  global $database, $setting;

	  $friend_total = 0;

	  // MAKE SURE CONNECTIONS ARE ALLOWED
	  if($setting[setting_connection_allow] != 0) {

	    // BEGIN FRIEND QUERY
	    $friend_query = "SELECT friend_id FROM se_friends";

	    // JOIN TO FRIEND TABLE IF NECESSARY
	    if($user_details == 1) { 
	      $friend_query .= " LEFT JOIN se_users ON";
	      if($direction == 1) { $friend_query .= " se_friends.friend_user_id1=se_users.user_id"; } else { $friend_query .= " se_friends.friend_user_id2=se_users.user_id"; }
	    }

	    // CONTINUE QUERY
	    $friend_query .= " WHERE friend_status='$friend_status'";

	    // EITHER "LIST OF WHO USER IS A FRIEND OF" OR "LIST OF USER'S FRIENDS"
	    if($direction == 1) { $friend_query .= " AND friend_user_id2='".$this->user_info[user_id]."'"; } else { $friend_query .= " AND friend_user_id1='".$this->user_info[user_id]."'"; }

	    // ADD ADDITIONAL WHERE CLAUSE IF EXISTS
	    if($where != "") { $friend_query .= " AND $where"; }

	    $friend_total = $database->database_num_rows($database->database_query($friend_query));

	  }

	  return $friend_total;

	} // END user_friend_total() METHOD








	// THIS METHOD RETURNS AN ARRAY OF USER'S FRIENDS
	// INPUT: $start REPRESENTING THE FRIEND TO START WITH
	//	  $limit REPRESENTING THE NUMBER OF FRIENDS TO RETURN
	//	  $direction (OPTIONAL) REPRESENTING A "0" FOR OUTGOING CONNECTIONS AND A "1" FOR INCOMING CONNECTIONS
	//	  $friend_status (OPTIONAL) REPRESENTING THE FRIEND STATUS (1 FOR CONFIRMED, 0 FOR PENDING REQUESTS)
	//	  $sort_by (OPTIONAL) REPRESENTING THE ORDER BY CLAUSE
	//	  $where (OPTIONAL) REPRESENTING ADDITIONAL THINGS TO INCLUDE IN THE WHERE CLAUSE
	//	  $friend_details (OPTIONAL) REPRESENTING A BOOLEAN THAT DETERMINES WHETHER OR NOT TO RETRIEVE THE "FRIEND TYPE" AND "FRIEND EXPLANATION"
	// OUTPUT: AN ARRAY OF THE USER'S FRIENDS
	function user_friend_list($start, $limit, $direction = 0, $friend_status = 1, $sort_by = "se_users.user_dateupdated DESC", $where = "", $friend_details = 0) {
	  global $database, $setting;

	  // SET VARIABLE
	  $friend_array = Array();

	  // MAKE SURE CONNECTIONS ARE ALLOWED
	  if($setting[setting_connection_allow] != 0) {

	    // BEGIN FRIEND QUERY
	    $friend_query = "SELECT se_friends.friend_id, se_users.user_id, se_users.user_username, se_users.user_photo, se_users.user_lastlogindate, se_users.user_dateupdated";

	    // GET FRIEND EXPLAIN, IF NECESSARY
	    if($friend_details == 1) { $friend_query .= ", se_friends.friend_type, se_friendexplains.friendexplain_body"; }

	    // CONTINUE QUERY
	    $friend_query .= " FROM se_friends LEFT JOIN se_users ON";

	    // MAKE SURE TO JOIN ON THE CORRECT FIELD (DEPENDENT ON DIRECTION)
	    if($direction == 1) { $friend_query .= " se_friends.friend_user_id1=se_users.user_id"; } else { $friend_query .= " se_friends.friend_user_id2=se_users.user_id"; }
	
	    // JOIN ON FRIEND EXPLAIN TABLE, IF NECESSARY
	    if($friend_details == 1) { $friend_query .= " LEFT JOIN se_friendexplains ON se_friends.friend_id=se_friendexplains.friendexplain_friend_id"; }

	    // CONTINUE QUERY
	    $friend_query .= " WHERE friend_status='$friend_status'";

	    // EITHER "LIST OF WHO USER IS A FRIEND OF" OR "LIST OF USER'S FRIENDS"
	    if($direction == 1) { $friend_query .= " AND friend_user_id2='".$this->user_info[user_id]."'"; } else { $friend_query .= " AND friend_user_id1='".$this->user_info[user_id]."'"; }

	    // ADD ADDITIONAL WHERE CLAUSE IF EXISTS
	    if($where != "") { $friend_query .= " AND $where"; }

	    // SET SORT	AND LIMIT
	    $friend_query .= " ORDER BY $sort_by LIMIT $start, $limit";

	    // LOOP OVER FRIENDS
	    $friends = $database->database_query($friend_query);
	    while($friend_info = $database->database_fetch_assoc($friends)) {

	      // CREATE AN OBJECT FOR FRIEND
	      $friend = new se_user();
	      $friend->user_info[user_id] = $friend_info[user_id];
	      $friend->user_info[user_username] = $friend_info[user_username];
	      $friend->user_info[user_photo] = $friend_info[user_photo];
	      $friend->user_info[user_lastlogindate] = $friend_info[user_lastlogindate];
	      $friend->user_info[user_dateupdated] = $friend_info[user_dateupdated];

	      // SET FRIEND TYPE/EXPLANATION VARS
	      if($friend_details == 1) {
	        $friend->friend_type = $friend_info[friend_type];
	        $friend->friend_explain = $friend_info[friendexplain_body];
	      }

	      // SET FRIEND ARRAY
	      $friend_array[] = $friend;
	    }
	  }

	  // RETURN FRIEND ARRAY
	  return $friend_array;

	} // END user_friend_list() METHOD








	// THIS METHOD ADDS A USER AS A FRIEND OF THE CURRENT USER
	// INPUT: $other_user_id REPRESENTING THE USER ID OF THE FRIEND TO BE ADDED
	//	  $friend_status REPRESENTING WHETHER THE FRIENDSHIP IS CONFIRMED OR NOT
	//	  $friend_type REPRESENTING A STRING WITH THE TYPE OF FRIEND
	//	  $friend_explain REPRESENTING A TEXTUAL EXPLANATION OF THE FRIENDSHIP
	// OUTPUT:
	function user_friend_add($other_user_id, $friend_status, $friend_type, $friend_explain) {
	  global $database;

	  // ADD USER TO FRIENDS
	  $database->database_query("INSERT INTO se_friends (friend_user_id1, friend_user_id2, friend_status, friend_type) VALUES ('".$this->user_info[user_id]."', '$other_user_id', '$friend_status', '$friend_type')");
	  $friend_id = $database->database_insert_id();
	  $database->database_query("INSERT INTO se_friendexplains (friendexplain_friend_id, friendexplain_body) VALUES ('$friend_id', '$friend_explain')");

	  // REMOVE FRIEND FROM BLOCKLIST
	  if($this->user_blocked($other_user_id)) {
	    $blocklist = explode(",", $this->user_info[user_blocklist]);
	    $user_key = array_search($other_user_id, $blocklist);
            $blocklist[$user_key] = "";
	    $this->user_info[user_blocklist] = implode(",", $blocklist);
	    $database->database_query("UPDATE se_users SET user_blocklist='".$this->user_info[user_blocklist]."' WHERE user_id='".$this->user_info[user_id]."'");
	  }

	} // END user_friend_add() METHOD








	// THIS METHOD REMOVES A USER AS A FRIEND OF THE CURRENT USER
	// INPUT: $other_user_id REPRESENTING THE FRIEND'S USER ID
	// OUTPUT: 
	function user_friend_remove($other_user_id) {
	  global $database, $setting;

          // REMOVE IF FRIEND
          $friend1 = $database->database_query("SELECT friend_id FROM se_friends WHERE friend_user_id1='".$this->user_info[user_id]."' AND friend_user_id2='$other_user_id'");
          if($database->database_num_rows($friend1) == 1) {
            $friendship = $database->database_fetch_assoc($friend1);
            $database->database_query("DELETE FROM se_friends WHERE friend_id='$friendship[friend_id]'");
            $database->database_query("DELETE FROM se_friendexplains WHERE friendexplain_friend_id='$friendship[friend_id]'");
          }

          // REMOVE ADDITIONAL ROW IF TWO-DIRECTIONAL
          $friend2 = $database->database_query("SELECT friend_id FROM se_friends WHERE friend_user_id2='".$this->user_info[user_id]."' AND friend_user_id1='$other_user_id'");
          if($database->database_num_rows($friend2) == 1 & ($setting[setting_connection_framework] == 0 | $setting[setting_connection_framework] == 2)) {
            $friendship = $database->database_fetch_assoc($friend2);
            $database->database_query("DELETE FROM se_friends WHERE friend_id='$friendship[friend_id]'");
            $database->database_query("DELETE FROM se_friendexplains WHERE friendexplain_friend_id='$friendship[friend_id]'");    
          }

	} // END user_friend_remove() METHOD








	// THIS METHOD RETURNS TRUE IF THE SPECIFIED USER IS A FRIEND OF A FRIEND OF THE EXISTING USER IN THIS CLASS
	// INPUT: $other_user_id REPRESENTING A USER'S USER ID
	// OUTPUT: RETURNS A BOOLEAN REPRESENTING WHETHER THE SPECIFIED USER IS A FRIEND OF A FRIEND OR NOT
	function user_friend_of_friend($other_user_id) {
	  global $database;

	  if($database->database_num_rows($database->database_query("SELECT t2.friend_user_id2 FROM se_friends AS t1 LEFT JOIN se_friends AS t2 ON t1.friend_user_id2=t2.friend_user_id1 WHERE t1.friend_user_id1='".$this->user_info[user_id]."' AND t2.friend_user_id2='$other_user_id' AND t1.friend_status<>'0' AND t2.friend_status<>'0'")) != 0) {
	    return true;
	  } else {
	    return false;
	  }
	} // END user_friend_of_friend() METHOD








	// THIS METHOD RETURNS TRUE IF THE SPECIFIED USER HAS BEEN FRIENDED BY THE EXISTING USER IN THIS CLASS
	// INPUT: $other_user_id REPRESENTING A USER'S USER ID
	//	  $friend_status (OPTIONAL) REPRESENTING WHETHER THE FRIENDSHIP IS CONFIRMED OR NOT
	// OUTPUT: RETURNS A BOOLEAN REPRESENTING WHETHER THE SPECIFIED USER IS FRIENDED OR NOT
	function user_friended($other_user_id, $friend_status = 1) {
	  global $database;

	  if($database->database_num_rows($database->database_query("SELECT friend_id FROM se_friends WHERE friend_user_id1='".$this->user_info[user_id]."' AND friend_user_id2='$other_user_id' AND friend_status='$friend_status'")) == 1) {
	    return true;
	  } else {
	    return false;
	  }
	} // END user_friended() METHOD








	// THIS METHOD RETURNS TRUE IF THE SPECIFIED USER HAS BEEN BLOCKED BY THE EXISTING USER IN THIS CLASS
	// INPUT: $other_user_id REPRESENTING A USER'S USER ID
	// OUTPUT: RETURNS A BOOLEAN REPRESENTING WHETHER THE SPECIFIED USER IS BLOCKED OR NOT
	function user_blocked($other_user_id) {
	  $blocklist = explode(",", $this->user_info[user_blocklist]);
	  if(in_array($other_user_id, $blocklist) == TRUE & $this->level_info[level_profile_block] != 0) {
	    return true;
	  } else {
	    return false;
	  }
	} // END user_blocked() METHOD








	// THIS METHOD RETURNS MAXIMUM PRIVACY LEVEL VIEWABLE BY A USER WITH REGARD TO THE CURRENT USER
	// INPUT: $other_user REPRESENTING A ANOTHER USER OBJECT
	//	  $allowable_privacy (OPTIONAL) REPRESENTING A STRING OF ALLOWABLE PRIVACY SETTINGS
	// OUTPUT: RETURNS THE INTEGER REPRESENTING THE MAXIMUM PRIVACY LEVEL VIEWABLE BY A USER WITH REGARD TO THE CURRENT USER
	function user_privacy_max($other_user, $allowable_privacy = "012345") {
	  global $database;
	
	  switch(TRUE) {
	
	    // NOBODY
	    // NO ONE HAS $privacy_level = 6

	    // OWNER
	    case($this->user_info[user_id] == $other_user->user_info[user_id]):
	      $privacy_level = 5;
	      break;

	    // FRIEND
	    case($this->user_friended($other_user->user_info[user_id])):
	      $privacy_level = 4;
	      break;
  
	    // FRIEND OF FRIEND WITHIN SAME SUBNETWORK
	    case($this->user_info[user_subnet_id] == $other_user->user_info[user_subnet_id] AND $this->user_friend_of_friend($other_user->user_info[user_id]) == TRUE):
	      $privacy_level = 3;
	      break;

	    // SAME SUBNETWORK
	    case($this->user_info[user_subnet_id] == $other_user->user_info[user_subnet_id]):
	      $privacy_level = 2;
	      break;

	    // REGISTERED USER
	    case($other_user->user_exists != 0):
	      $privacy_level = 1;
	      break;

	    // EVERYONE (DEFAULT)
	    default:
	      $privacy_level = 0;
	      break;
	
	  }

	  // MAKE SURE PRIVACY LEVEL IS ALLOWED BY ADMIN
	  $allowable_privacy = str_split($allowable_privacy);
	  rsort($allowable_privacy);
	  if($privacy_level >= $allowable_privacy[0]) {
	    $privacy_level = 6;
	  }

	  // RETURN PRIVACY LEVEL
	  return $privacy_level;

	} // END user_privacy_max() METHOD








	// THIS METHOD RETURNS THE TOTAL NUMBER OF MESSAGES
	// INPUT: $direction (OPTIONAL) REPRESENTING A "0" FOR MESSAGES SENT TO USER AND "1" FOR MESSAGES SENT BY USER
	//	  $unread_only (OPTIONAL) REPRESENTING A "0" FOR ALL MESSAGES AND A "1" FOR UNREAD MESSAGES ONLY
	// OUTPUT: AN INTEGER REPRESENTING THE NUMBER OF MESSAGES
	function user_message_total($direction = 0, $unread_only = 0) {
	  global $database;

	  $message_total = 0;

	  // MAKE SURE MESSAGES ARE ALLOWED
	  if($this->level_info[level_message_allow] != 0) {

	    // BEGIN MESSAGE QUERY
	    $message_query = "SELECT pm_id FROM se_pms WHERE";

	    // CHECK DIRECTION
	    if($direction == 1) { $message_query .= " pm_authoruser_id='".$this->user_info[user_id]."' AND pm_outbox<>'0'"; } else { $message_query .= " pm_user_id='".$this->user_info[user_id]."' AND pm_status<>'2'"; }

	    // CHECK MESSAGE STATUS
	    if($unread_only == 1) { $message_query .= " AND pm_status='0'"; }

	    // RUN QUERY
	    $message_total = $database->database_num_rows($database->database_query($message_query));

	  }

	  return $message_total;

	} // END user_message_total() METHOD








	// THIS METHOD RETURNS AN ARRAY OF USER'S MESSAGES
	// INPUT: $start REPRESENTING THE MESSAGE TO START WITH
	//	  $limit REPRESENTING THE NUMBER OF MESSAGES TO RETURN
	//	  $direction (OPTIONAL) REPRESENTING A "0" FOR MESSAGES SENT TO USER AND "1" FOR MESSAGES SENT BY USER
	// OUTPUT: AN ARRAY OF THE USER'S MESSAGES
	function user_message_list($start, $limit, $direction = 0) {
	  global $database;

	  // SET VARIABLE
	  $message_array = Array();

	  // MAKE SURE MESSAGES ARE ALLOWED
	  if($this->level_info[level_message_allow] != 0) {

	    // BEGIN MESSAGE QUERY
	    $message_query = "SELECT se_pms.*, se_users.user_id, se_users.user_username, se_users.user_photo FROM se_pms LEFT JOIN se_users ON";

	    // MAKE SURE TO JOIN ON THE CORRECT FIELD (DEPENDENT ON DIRECTION)
	    if($direction == 1) { $message_query .= " se_pms.pm_user_id=se_users.user_id WHERE pm_authoruser_id='".$this->user_info[user_id]."' AND pm_outbox<>'0'"; } else { $message_query .= " se_pms.pm_authoruser_id=se_users.user_id WHERE pm_user_id='".$this->user_info[user_id]."' AND pm_status<>'2'"; }

	    // CONTINUE QUERY
	    $message_query .= " ORDER BY pm_date DESC LIMIT $start, $limit";

	    // LOOP OVER MESSAGES
	    $messages = $database->database_query($message_query);
	    while($message_info = $database->database_fetch_assoc($messages)) {

	      // CREATE AN OBJECT FOR MESSAGE AUTHOR/RECIPIENT
	      $pm_user = new se_user();
	      $pm_user->user_info[user_id] = $message_info[user_id];
	      $pm_user->user_info[user_username] = $message_info[user_username];
	      $pm_user->user_info[user_photo] = $message_info[user_photo];

	      // REMOVE LINE BREAKS FOR LIST
	      $pm_body = str_replace("<br>", "", $message_info[pm_body]);

	      // SET MESSAGE ARRAY
	      $message_array[] = Array('pm_id' => $message_info[pm_id],
				'pm_subject' => $message_info[pm_subject],
				'pm_date' => $message_info[pm_date],
				'pm_status' => $message_info[pm_status],
				'pm_outbox' => $message_info[pm_outbox],
				'pm_body' => $pm_body,
				'pm_user' => $pm_user);
	    }
	  }

	  // RETURN MESSAGE ARRAY
	  return $message_array;

	} // END user_message_list() METHOD








	// THIS METHOD SENDS A MESSAGE TO ANOTHER USER IF NO ERRORS
	// INPUT: $to REPRESENTING THE USERNAME OF THE RECIPIENT
	//	  $subject REPRESENTING THE SUBJECT OF THE MESSAGE
	//	  $message REPRESENTING THE MESSAGE BODY
	//	  $convo_id (OPTIONAL) REPRESENTING THE CONVERSATION ID
	// OUTPUT: 
	function user_message_send($to, $subject, $message, $convo_id = 0) {
	  global $database, $class_user;

	  // VALIDATE CONVERSATION ID
	  if($convo_id == "" OR !is_numeric($convo_id)) { $convo_id = 0; }

	  // GET TO USER
	  $to_user = new se_user(Array(0, $to));

	  // CHECK TO SEE IF MESSAGE IS EMPTY
	  if(str_replace(" ", "", $message) == "") { $this->is_error = 1; $this->error_message = $class_user[22]; }

	  // TO USER DOESN'T EXIST
	  if($to_user->user_exists == 0) { $this->is_error = 1; $this->error_message = $class_user[23]; }

	  // TO USER IS THE SAME AS LOGGED IN USER
	  if($to_user->user_info[user_username] == $this->user_info[user_username]) { $this->is_error = 1; $this->error_message = $class_user[24]; }

	  // TO USER HAS CURRENT USER IN THEIR BLOCK LIST
	  if($to_user->user_blocked($this->user_info[user_id])) { $is_error = 1; $error_message = $class_user[25]; }

	  // TO USER IS NOT A FRIEND AND ADMIN HAS "MESSAGE FRIENDS ONLY" TURNED ON
	  if($this->level_info[level_message_allow] == 1 & $this->user_friended($to_user->user_info[user_id]) == FALSE) { $this->is_error = 1; $this->error_message = $class_user[26]; }

	  // IF NO ERROR, SEND MESSAGE
	  if($this->is_error == 0) {

	    // REPLACE NEWLINES IN BODY WITH BREAKS
	    $message = str_replace("\n", "<br>", $message);

	    // INSERT MESSAGE
	    $pm_date = time();
	    $database->database_query("INSERT INTO se_pms (pm_user_id, pm_authoruser_id, pm_convo_id, pm_date, pm_subject, pm_body, pm_status, pm_outbox) VALUES ('".$to_user->user_info[user_id]."', '".$this->user_info[user_id]."', '$convo_id', '$pm_date', '$subject', '$message', '0', '1')");

	    // SEND MESSAGE NOTIFICATION EMAIL
	    send_message($to_user, $this->user_info[user_username]);

	    // IF OUTBOX IS FULL, DELETE OLDEST MESSAGE
	    $num_outbox = $this->user_message_total(1, 0);
	    if($num_outbox > $this->level_info[level_message_outbox]) {
	      $num_delete = $num_outbox-($this->level_info[level_message_outbox]);
	      $database->database_query("UPDATE se_pms SET pm_outbox='0' WHERE pm_authoruser_id='".$this->user_info[user_id]."' AND pm_outbox<>'0' ORDER BY pm_id ASC LIMIT $num_delete");
	    }      

	    // IF INBOX IS FULL, DELETE OLDEST MESSAGE	
	    $total_pms = $to_user->user_message_total(0, 0);
	    if($num_inbox > $to_user->level_info[level_message_inbox]) {
	      $num_delete = $num_inbox-($to_user->level_info[level_message_inbox]);
	      $database->database_query("UPDATE se_pms SET pm_status='2' WHERE pm_user_id='".$to_user->user_info[user_id]."' AND pm_status<>'2' ORDER BY pm_date ASC LIMIT $num_delete");
	    }

	    // CLEAR PMS
	    $database->database_query("DELETE FROM se_pms WHERE pm_status='2' AND pm_outbox='0'");
	  }

	} // END user_message_send() METHOD








	// THIS METHOD DELETES MANY MESSAGES BASED ON WHAT HAS BEEN POSTED
	// INPUT: $start REPRESENTING THE MESSAGE TO START WITH
	//	  $limit REPRESENTING THE NUMBER OF MESSAGES TO RETURN
	//	  $direction (OPTIONAL) REPRESENTING A "0" FOR MESSAGES SENT TO USER AND "1" FOR MESSAGES SENT BY USER
	// OUTPUT: 
	function user_message_delete_selected($start, $limit, $direction = 0) {
	  global $database;

	  // SET VARIABLE
	  $message_array = Array();

	  // MAKE SURE MESSAGES ARE ALLOWED
	  if($this->level_info[level_message_allow] != 0) {

	    // BEGIN MESSAGE QUERY
	    $message_query = "SELECT pm_id FROM se_pms";

	    // MAKE SURE TO JOIN ON THE CORRECT FIELD (DEPENDENT ON DIRECTION)
	    if($direction == 1) { $message_query .= " WHERE pm_authoruser_id='".$this->user_info[user_id]."' AND pm_outbox<>'0'"; } else { $message_query .= " WHERE pm_user_id='".$this->user_info[user_id]."' AND pm_status<>'2'"; }

	    // CONTINUE QUERY
	    $message_query .= " ORDER BY pm_date DESC LIMIT $start, $limit";

	    // LOOP OVER MESSAGES
	    $delete_query = "";
	    $messages = $database->database_query($message_query);
	    while($message_info = $database->database_fetch_assoc($messages)) {
	      $var = "message_".$message_info[pm_id];

	      // ADD TO DELETE QUERY
	      if($_POST[$var] == 1) {
	        if($delete_query != "") { $delete_query .= " OR "; }
	        $delete_query .= "pm_id='$message_info[pm_id]'";
	      }
	    }

	    // PERFORM UPDATES AND DELETIONS
	    if($delete_query != "") {
	      if($direction == 1) { $setwhere_clause = "pm_outbox='0' WHERE pm_authoruser_id='".$this->user_info[user_id]."'"; } else { $setwhere_clause = "pm_status='2' WHERE pm_user_id='".$this->user_info[user_id]."'"; }
	      $database->database_query("UPDATE se_pms SET $setwhere_clause AND ($delete_query)");
	      $database->database_query("DELETE FROM se_pms WHERE pm_status='2' AND pm_outbox='0'");
	    }
	
	  }

	} // END user_message_delete_selected() METHOD








	// THIS METHOD CREATES A USER ACCOUNT USING THE GIVEN INFORMATION
	// INPUT: $signup_email REPRESENTING THE DESIRED EMAIL
	//	  $signup_username REPRESENTING THE DESIRED USERNAME
	//	  $signup_password REPRESENTING THE DESIRED PASSWORD
	//	  $signup_timezone REPRESENTING THE USER'S TIMEZONE
	//	  $signup_language REPRESENTING THE USER'S SELECTED LANGUAGE
	// OUTPUT: 
	function user_create($signup_email, $signup_username, $signup_password, $signup_timezone, $signup_language) {
	  global $database, $setting, $url;

	  // PRESET VARS
	  $signup_subnet_id = 0;
	  $signup_level_info = $database->database_fetch_assoc($database->database_query("SELECT level_id, level_profile_privacy, level_profile_comments FROM se_levels WHERE level_default='1' LIMIT 1"));
	  $signup_code = randomcode();
	  $signup_date = time();
	  $signup_dateupdated = $signup_date;
	  $signup_invitesleft = $setting[setting_signup_invite_numgiven];
	  $signup_notify_friendrequest = 1;
	  $signup_notify_message = 1;
	  $signup_notify_profilecomment = 1;
	  $signup_privacy_search = 1;

	  // SET WHETHER USER IS ENABLED OR NOT
	  if($setting[setting_signup_enable] == 0) { $signup_enabled = 0; } else { $signup_enabled = 1; }

	  // SET EMAIL VERIFICATION VARIABLE
	  if($setting[setting_signup_verify] == 0) { $signup_verified = 1; } else { $signup_verified = 0; }

	  // CREATE RANDOM PASSWORD IF NECESSARY
	  if($setting[setting_signup_randpass] != 0) { $signup_password = randomcode(10); }

	  // ENCODE PASSWORD WITH MD5
	  $user_salt = "$1$".substr($signup_code, 0, 8)."$";
	  $crypt_password = crypt($signup_password, $user_salt);

	  // SET PRIVACY DEFAULT
	  $allowable_privacy = str_split($signup_level_info[level_profile_privacy]);
	  sort($allowable_privacy);
	  $profile_privacy = $allowable_privacy[0];

	  // SET COMMENT DEFAULT
	  $allowable_comments = str_split($signup_level_info[level_profile_comments]);
	  sort($allowable_comments);
	  $profile_comments = $allowable_comments[0];

	  // GET SUBNET ID
	  $signup_subnet = $this->user_subnet_select($signup_email, $this->profile_fields_new); 
	  $signup_subnet_id = $signup_subnet[0];

	  // ADD USER TO USER TABLE
	  $database->database_query("INSERT INTO se_users (user_level_id,
						user_subnet_id,
						user_email,
						user_newemail,
						user_username,
						user_password,
						user_code,
						user_enabled,
						user_verified,
						user_signupdate,
						user_invitesleft,
						user_timezone,
						user_lang,
						user_dateupdated,
						user_privacy_search,
						user_privacy_profile,
						user_privacy_comments
						) VALUES (
						'$signup_level_info[level_id]',
						'$signup_subnet_id',
						'$signup_email',
						'$signup_email',
						'$signup_username',
						'$crypt_password',
						'$signup_code',
						'$signup_enabled',
						'$signup_verified',
						'$signup_date',
						'$signup_invitesleft',
						'$signup_timezone',
						'$signup_language',
						'$signup_dateupdated',
						'$signup_privacy_search',
						'$profile_privacy',
						'$profile_comments')");

	  // GET USER INFO
	  $user_id = $database->database_insert_id();
	  $this->user_info = $database->database_fetch_assoc($database->database_query("SELECT * FROM se_users WHERE user_id='$user_id'"));
	  $this->level_info = $database->database_fetch_assoc($database->database_query("SELECT * FROM se_levels WHERE level_id='".$this->user_info[user_level_id]."'"));
	  $this->subnet_info = $database->database_fetch_assoc($database->database_query("SELECT subnet_id, subnet_name FROM se_subnets WHERE subnet_id='".$this->user_info[user_subnet_id]."'"));

	  // ADD USER PROFILE
	  $database->database_query("INSERT INTO se_profiles (profile_user_id) VALUES ('".$this->user_info[user_id]."')");
	  if(count($this->profile_tabs) != 0) {
	    $profile_query = "UPDATE se_profiles SET ".$this->profile_field_query." WHERE profile_user_id='".$this->user_info[user_id]."'";
	    $database->database_query($profile_query);
	  }

	  // GET PROFILE INFO
	  $this->profile_info = $database->database_fetch_assoc($database->database_query("SELECT * FROM se_profiles WHERE profile_user_id='".$this->user_info[user_id]."'"));

	  // ADD ROW IN STYLES TABLE
	  $database->database_query("INSERT INTO se_profilestyles (profilestyle_user_id, profilestyle_css) VALUES ('".$this->user_info[user_id]."', '')");

	  // ADD ROW IN SETTINGS TABLE
	  $database->database_query("INSERT INTO se_usersettings (usersetting_user_id, usersetting_notify_friendrequest, usersetting_notify_message, usersetting_notify_profilecomment) VALUES ('".$this->user_info[user_id]."', '$signup_notify_friendrequest', '$signup_notify_message', '$signup_notify_profilecomment')");

	  // ADD USER DIRECTORY
	  $user_directory = $url->url_userdir($this->user_info[user_id]);
	  $user_path_array = explode("/", $user_directory);
	  array_pop($user_path_array);
	  array_pop($user_path_array);
	  $subdir = implode("/", $user_path_array)."/";
	  if(!is_dir($subdir)) { 
	    mkdir($subdir, 0777); 
	    chmod($subdir, 0777); 
	    $handle = fopen($subdir."index.php", 'x+');
	    fclose($handle);
	  }
	  mkdir($user_directory, 0777);
	  chmod($user_directory, 0777);
	  $handle = fopen($user_directory."/index.php", 'x+');
	  fclose($handle);

	  // SEND RANDOM PASSWORD IF NECESSARY
	  if($setting[setting_signup_randpass] != 0) { send_newpass($this->user_info, $signup_password); }

	  // SEND VERIFICATION EMAIL IF REQUIRED
	  if($setting[setting_signup_verify] != 0) { send_verification($this->user_info); }

	  // SEND WELCOME EMAIL IF REQUIRED (AND IF VERIFICATION EMAIL IS NOT BEING SENT)
	  if($setting[setting_signup_welcome] != 0 & $setting[setting_signup_verify] == 0) { send_welcome($this->user_info, $signup_password); }

	} // END user_create() METHOD









	// THIS METHOD DELETES THE USER CURRENTLY ASSOCIATED WITH THIS OBJECT
	// INPUT: 
	// OUTPUT:
	function user_delete() {
	  global $database, $url, $global_plugins;

	  // DELETE ALL PLUGIN OBJECTS RELATED TO THIS USER
	  for($g=0;$g<count($global_plugins);$g++) {
	    if(function_exists('deleteuser_'.$global_plugins[$g])) {
	      call_user_func_array('deleteuser_'.$global_plugins[$g], array($this->user_info[user_id])); 
	    }
	  }

	  // DELETE USER TABLE ROW
	  $database->database_query("DELETE FROM se_users WHERE user_id='".$this->user_info[user_id]."' LIMIT 1");
	  // DELETE USER PROFILE
	  $database->database_query("DELETE FROM se_profiles WHERE profile_user_id='".$this->user_info[user_id]."'");
	  // DELETE USER STYLES
	  $database->database_query("DELETE FROM se_profilestyles WHERE profilestyle_user_id='".$this->user_info[user_id]."'");
	  // DELETE USER-OWNED AND USER-POSTED PROFILE COMMENTS
	  $database->database_query("DELETE FROM se_profilecomments WHERE profilecomment_user_id='".$this->user_info[user_id]."' OR profilecomment_authoruser_id='".$this->user_info[user_id]."'");
	  // DELETE USER-OWNED AND USER-AUTHORED PMS
	  $database->database_query("DELETE FROM se_pms WHERE pm_user_id='".$this->user_info[user_id]."' OR pm_authoruser_id='".$this->user_info[user_id]."'");
	  // DELETE CONNECTIONS TO AND FROM USER
	  $database->database_query("DELETE FROM se_friends, se_friendexplains USING se_friends LEFT JOIN se_friendexplains ON se_friends.friend_id=se_friendexplains.friendexplain_friend_id WHERE se_friends.friend_user_id1='".$this->user_info[user_id]."' OR se_friends.friend_user_id2='".$this->user_info[user_id]."'");
	  // DELETE ALL OF THIS USER'S REPORTS
	  $database->database_query("DELETE FROM se_reports WHERE report_user_id='".$this->user_info[user_id]."'");
	  // DELETE USER ACTIONS
	  $database->database_query("DELETE FROM se_actions WHERE action_user_id='".$this->user_info[user_id]."'");


	  // DELETE USER'S FILES
	  if(is_dir($url->url_userdir($this->user_info[user_id]))) {
	    $dir = $url->url_userdir($this->user_info[user_id]);
	  } else {
	    $dir = ".".$url->url_userdir($this->user_info[user_id]);
	  }
	  if($dh = opendir($dir)) {
	    while(($file = readdir($dh)) !== false) {
	      if($file != "." & $file != "..") {
	        unlink($dir.$file);
	      }
	    }
	    closedir($dh);
	  }
	  rmdir($dir);

	  $this->user_clear();

	}  // END user_delete() METHOD

}


?>