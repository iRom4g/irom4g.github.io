<?

//  THIS CLASS CONTAINS ADMIN-RELATED METHODS.
//  IT IS USED DURING THE CREATION, MODIFICATION AND DELETION OF AN ADMIN.
//  METHODS IN THIS CLASS:
//    se_admin()
//    admin_create()
//    admin_checkCookies()
//    admin_login()
//    admin_account()
//    admin_edit()
//    admin_clear()
//    admin_logout()
//    admin_delete()



class se_admin {

	// INITIALIZE VARIABLES
	var $is_error;			// DETERMINES WHETHER THERE IS AN ERROR OR NOT
	var $error_message;		// CONTAINS RELEVANT ERROR MESSAGE
	var $admin_exists;		// DETERMINES WHETHER WE ARE EDITING AN EXISTING ADMIN OR NOT
	var $admin_salt;		// CONTAINS THE SALT USED TO ENCRYPT THE ADMIN PASSWORD

	var $admin_info;		// CONTAINS ADMIN'S INFORMATION FROM SE_ADMINS TABLE
	var $admin_super;		// DETERMINES WHETHER ADMIN IS A SUPER ADMIN OR NOT









	// THIS METHOD SETS INITIAL VARS SUCH AS ADMIN INFO
	// INPUT: $admin_id (OPTIONAL) REPRESENTING A ADMIN'S ADMIN_ID
	//	  $admin_username (OPTIONAL) REPRESENTING AN ADMIN'S ADMIN_USERNAME
	// OUTPUT: 
	function se_admin($admin_id = 0, $admin_username = "") {
	  global $database;

	  // SET INITIAL VARIABLES
	  $this->is_error = 0;
	  $this->error_message = "";
	  $this->admin_exists = 0;
	  $this->admin_salt = "$1$"."admin123"."$";
	  $this->admin_super = 0;
	  
	  // VERIFY ADMIN_ID IS VALID AND SET APPROPRIATE OBJECT VARIABLES
	  if($admin_id != 0 | $admin_username != "") {
	    $admin = $database->database_query("SELECT * FROM se_admins WHERE admin_id='$admin_id' OR admin_username='$admin_username'");
	    if($database->database_num_rows($admin) == 1) {
	      $this->admin_exists = 1;
	      $this->admin_info = $database->database_fetch_assoc($admin);
	      $super = $database->database_fetch_assoc($database->database_query("SELECT admin_id FROM se_admins ORDER BY admin_id LIMIT 1"));
	      if($super[admin_id] == $this->admin_info[admin_id]) { $this->admin_super = 1; }
	    }
	  }

	} // END se_admin() METHOD








	// THIS METHOD CREATES A USER ACCOUNT USING THE GIVEN INFORMATION
	// INPUT: $admin_username REPRESENTING THE DESIRED USERNAME
	//	  $admin_password REPRESENTING THE DESIRED PASSWORD
	//	  $admin_name REPRESENTING THE DESIRED NAME
	//	  $admin_email REPRESENTING THE DESIRED EMAIL
	// OUTPUT: 
	function admin_create($admin_username, $admin_password, $admin_name, $admin_email) {
	  global $database;

	  $admin_password_encrypted = crypt($admin_password, $this->admin_salt);
	  $database->database_query("INSERT INTO se_admins (admin_username, admin_password, admin_name, admin_email) VALUES ('$admin_username', '$admin_password_encrypted', '$admin_name', '$admin_email')");
	
	} // END admin_create() METHOD








	// THIS METHOD VERIFIES LOGIN COOKIES AND SETS APPROPRIATE OBJECT VARIABLES
	// INPUT: 
	// OUTPUT: 
	function admin_checkCookies() {

	  if(isset($_COOKIE['admin_id']) & isset($_COOKIE['admin_username']) & isset($_COOKIE['admin_password'])) {
	    // GET ADMIN ROW IF AVAILABLE
	    $admin_id = $_COOKIE['admin_id'];
	    $this->se_admin($admin_id);

	    // VERIFY ADMIN LOGIN COOKIE VALUES
	    if($this->admin_exists == 0 | ($_COOKIE['admin_username'] != crypt($this->admin_info[admin_username], $this->admin_salt) | $_COOKIE['admin_password'] != $this->admin_info[admin_password])) {
	      $this->se_admin();
	    }
	  }

	} // END admin_checkCookies() METHOD








	// THIS METHOD TRIES TO LOG AN ADMIN IN IF THERE IS NO ERROR
	// INPUT: 
	// OUTPUT: 
	function admin_login() {
	  global $class_admin;

	  $this->se_admin(0, $_POST['username']);

	  // SHOW ERROR IF JAVASCRIPT IS DIABLED
	  if(isset($_POST['javascript']) & $_POST['javascript'] == "no") {
	    $this->is_error = 1;
	    $this->error_message = $class_admin[1];
	  } elseif($this->admin_exists == 0) {
	    $this->is_error = 1;
	    $this->error_message = $class_admin[2];
	  } elseif(crypt($_POST['password'], $this->admin_salt) != $this->admin_info[admin_password]) {
	    $this->is_error = 1;
	    $this->error_message = $class_admin[2];
	  } else {
	    setcookie("admin_id", $this->admin_info[admin_id], 0, "/");
	    setcookie("admin_username", crypt($this->admin_info[admin_username], $this->admin_salt), 0, "/");
	    setcookie("admin_password", $this->admin_info[admin_password], 0, "/");
	  }

	} // END admin_login() METHOD









	// THIS METHOD LOOPS AND/OR VALIDATES USER ACCOUNT INPUT
	// INPUT: $admin_username REPRESENTING THE DESIRED USERNAME
	//	  $admin_password_old REPRESENTING THE ADMIN'S OLD PASSWORD, IF ONE EXISTS
	//	  $admin_password REPRESENTING THE DESIRED PASSWORD
	//	  $admin_password_confirm REPRESENTING THE PASSWORD CONFIRMATION FIELD
	//	  $admin_name REPRESENTING THE DESIRED NAME
	//	  $admin_email REPRESENTING THE DESIRED EMAIL
	// OUTPUT: 
	function admin_account($admin_username, $admin_password_old, $admin_password, $admin_password_confirm, $admin_name, $admin_email) {
	  global $database, $class_admin;

	  // CHECK FOR EMPTY FIELDS
	  if(str_replace(" ", "", $admin_username) == "" | str_replace(" ", "", $admin_name) == "" | str_replace(" ", "", $admin_email) == "") { $this->is_error = 1; $this->error_message = $class_admin[3]; }

	  // CHECK FOR EMPTY PASSWORDS
	  if(($this->admin_info[admin_password] == "" & str_replace(" ", "", $admin_password) == "") | ($this->admin_info[admin_password] != "" & (str_replace(" ", "", $admin_password_old) == "" | str_replace(" ", "", $admin_password) == "" | str_replace(" ", "", $admin_password_confirm) == "") & (str_replace(" ", "", $admin_password_old) != "" | str_replace(" ", "", $admin_password) != "" | str_replace(" ", "", $admin_password_confirm) != ""))) { $this->is_error = 1; $this->error_message = $class_admin[3]; }

	  // CHECK FOR OLD PASSWORD MATCH
	  if(str_replace(" ", "", $admin_password_old) != "" & crypt($admin_password_old, $this->admin_salt) != $this->admin_info[admin_password]) { $this->is_error = 1; $this->error_message = $class_admin[4]; }
  
	  // CHECK FOR INVALID USERNAME OR PASSWORD
	  if(preg_match("/[^a-zA-Z0-9]/", $admin_username) | preg_match("/[^a-zA-Z0-9]/", $admin_password)) { $this->is_error = 1; $this->error_message = $class_admin[5]; }

	  // CHECK FOR DUPLICATE USERNAME
	  $lowercase_username = strtolower($admin_username);
	  if(strtolower($this->admin_info[admin_username]) != $lowercase_username & $database->database_num_rows($database->database_query("SELECT admin_id FROM se_admins WHERE LOWER(admin_username)='$lowercase_username'")) != 0) { $this->is_error = 1; $this->error_message = $class_admin[6]; }

	  // CHECK FOR PASSWORD LENGTH
	  if(str_replace(" ", "", $admin_password) != "" & strlen($admin_password) < 6) { $this->is_error = 1; $this->error_message = $class_admin[7]; }
	
	  // CHECK FOR PASSWORD MATCH
	  if(str_replace(" ", "", $admin_password) != "" & $admin_password != $admin_password_confirm) { $this->is_error = 1; $this->error_message = $class_admin[8]; }

	} // END admin_account() METHOD








	// THIS METHOD EDITS A USER ACCOUNT USING THE GIVEN INFORMATION
	// INPUT: $admin_username REPRESENTING THE DESIRED USERNAME
	//	  $admin_password REPRESENTING THE DESIRED PASSWORD
	//	  $admin_name REPRESENTING THE DESIRED NAME
	//	  $admin_email REPRESENTING THE DESIRED EMAIL
	// OUTPUT: 
	function admin_edit($admin_username, $admin_password, $admin_name, $admin_email) {
	  global $database;

	  if(str_replace(" ", "", $admin_password) != "") {
	    $admin_password_encrypted = crypt($admin_password, $this->admin_salt);
	  } else {
	    $admin_password_encrypted = $this->admin_info[admin_password];
	  }
	
	  $database->database_query("UPDATE se_admins SET admin_username='$admin_username', admin_password='$admin_password_encrypted', admin_name='$admin_name', admin_email='$admin_email' WHERE admin_id='".$this->admin_info[admin_id]."'");

	  // RESET COOKIE IF CURRENT ADMIN IS LOGGED IN
	  global $admin;
	  if($admin->admin_info[admin_id] == $this->admin_info[admin_id]) {
	    setcookie("admin_password", "$admin_password_encrypted", 0, "/");
	  }
	
	} // END admin_edit() METHOD








	// THIS METHOD CLEARS OBJECT VARS
	// INPUT: 
	// OUTPUT: 
	function admin_clear() {

	  $this->is_error = 0;
	  $this->error_message = "";
	  $this->admin_exists = 0;
	  $this->admin_info = "";

	} // END admin_clear() METHOD








	// THIS METHOD LOGS AN ADMIN OUT
	// INPUT: 
	// OUTPUT: 
	function admin_logout() {

	  setcookie("admin_id", "", 0, "/");
	  setcookie("admin_username", "", 0, "/");
	  setcookie("admin_password", "", 0, "/");
	  $this->admin_clear();

	} // END admin_logout() METHOD








	// THIS METHOD DELETES THE ADMIN CURRENTLY ASSOCIATED WITH THIS OBJECT
	// INPUT: 
	// OUTPUT:
	function admin_delete() {
	  global $database;

	  $database->database_query("DELETE FROM se_admins WHERE admin_id='".$this->admin_info[admin_id]."'");
	  $this->admin_clear();

	}  // END admin_delete() METHOD

}


?>