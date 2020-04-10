<?

//  THIS CLASS CONTAINS DATABASE-RELATED METHODS
//  IT IS USED TO CONNECT TO THE DATABASE, RUN QUERIES, AND REPORT ERRORS
//  CURRENTLY MySQL IS THE DATABASE TYPE, EVENTUALLY ADD SUPPORT FOR OTHER DATABASE TYPES
//  METHODS IN THIS CLASS:
//    se_database()
//    database_connect()
//    database_select()
//    database_query()
//    database_fetch_array()
//    database_fetch_assoc()
//    database_num_rows()
//    database_insert_id()
//    database_error()
//    database_close()






class se_database {

	// INITIALIZE VARIABLES
	var $database_connection;		// VARIABLE REPRESENTING DATABASE LINK IDENTIFIER

	var $log_stats;				// VARIABLE DETERMINING WHETHER QUERY INFO SHOULD BE LOGGED
	var $query_stats;			// ARRAY CONTAINING RELEVANT INFORMATION ABOUT QUERIES RUN







	// THIS METHOD CONNECTS TO THE SERVER AND SELECTS THE DATABASE
	// INPUT: $database_host REPRESENTING THE DATABASE HOST
	//	  $database_username REPRESENTING THE DATABASE USERNAME
	//	  $database_password REPRESENTING THE DATABASE PASSWORD
	//	  $database_name REPRESENTING THE DATABASE NAME
	// OUTPUT: 
	function se_database($database_host, $database_username, $database_password, $database_name) {

	  $this->database_connection = $this->database_connect($database_host, $database_username, $database_password);
	  $this->database_select($database_name);
	
	  $this->log_stats = 1;
	  $this->query_stats = Array();

	} // END se_database() METHOD








	// THIS METHOD CONNECTS TO A DATABASE SERVER
	// INPUT: $database_host REPRESENTING THE DATABASE HOST
	//	  $database_username REPRESENTING THE DATABASE USERNAME
	//	  $database_password REPRESENTING THE DATABASE PASSWORD
	// OUTPUT: RETURNS A DATABASE LINK IDENTIFIER
	function database_connect($database_host, $database_username, $database_password) {

	  return mysql_connect($database_host, $database_username, $database_password, TRUE);

	} // END database_connect() METHOD








	// THIS METHOD SELECTS A DATABASE
	// INPUT: $database_name REPRESENTING THE DATABASE NAME
	// OUTPUT: RETURNS OUTPUT FOR DATABASE SELECTION
	function database_select($database_name) {

	  return mysql_select_db($database_name, $this->database_connection);

	} // END database_select() METHOD








	// THIS METHOD QUERIES A DATABASE
	// INPUT: $database_query REPRESENTING THE DATABASE QUERY TO RUN
	// OUTPUT: RETURNS A DATABASE QUERY RESULT RESOURCE
	function database_query($database_query) {
	
	  $query_timer_start = getmicrotime();
	  $query_result = mysql_query($database_query, $this->database_connection); 
	  
	  if($this->log_stats != 0) {
	    $query_time = round(getmicrotime()-$query_timer_start, 5);
	    $this->query_stats[] = Array('query' => $database_query,
					'time' => $query_time);
	  }

	  return $query_result;

	} // END database_query() METHOD








	// THIS METHOD FETCHES A ROW AS A NUMERIC ARRAY
	// INPUT: $database_result REPRESENTING A DATABASE QUERY RESULT RESOURCE
	// OUTPUT: RETURNS A NUMERIC ARRAY FOR A DATABASE ROW
	function database_fetch_array($database_result) {

	  return mysql_fetch_array($database_result);

	} // END database_fetch_array() METHOD








	// THIS METHOD FETCHES A ROW AS AN ASSOCIATIVE ARRAY
	// INPUT: $database_result REPRESENTING A DATABASE QUERY RESULT RESOURCE
	// OUTPUT: RETURNS AN ASSOCIATIVE ARRAY FOR A DATABASE ROW
	function database_fetch_assoc($database_result) {

	  return mysql_fetch_assoc($database_result);

	} // END database_fetch_assoc() METHOD








	// THIS METHOD RETURNS THE NUMBER OF ROWS IN A RESULT
	// INPUT: $database_result REPRESENTING A DATABASE QUERY RESULT RESOURCE
	// OUTPUT: RETURNS THE NUMBER OF ROWS IN A RESULT
	function database_num_rows($database_result) {

	  return mysql_num_rows($database_result);

	} // END database_num_rows() METHOD








	// THIS METHOD RETURNS THE NUMBER OF ROWS IN A RESULT
	// INPUT: $database_result REPRESENTING A DATABASE QUERY RESULT RESOURCE
	// OUTPUT: RETURNS THE NUMBER OF ROWS IN A RESULT
	function database_affected_rows($database_result) {

	  return mysql_affected_rows($database_result);

	}
	// END database_affected_rows() METHOD 








	// THIS METHOD RETURNS THE ID GENERATED FROM THE PREVIOUS INSERT OPERATION
	// INPUT: 
	// OUTPUT: RETURNS THE ID GENERATED FROM THE PREVIOUS INSERT OPERATION
	function database_insert_id() {

	  return mysql_insert_id($this->database_connection);

	} // END database_insert_id() METHOD








	// THIS METHOD RETURNS THE DATABASE ERROR
	// INPUT: 
	// OUTPUT: 
	function database_error() {

	  return mysql_error($this->database_connection);

	} // END database_error() METHOD








	// THIS METHOD CLOSES A CONNECTION TO THE DATABASE SERVER
	// INPUT: 
	// OUTPUT: 
	function database_close() {

	  mysql_close($this->database_connection);

	} // END database_close() METHOD

}
?>