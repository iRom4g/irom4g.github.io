<?

//  THIS CLASS CONTAINS COMMENT-RELATED METHODS 
//  IT IS USED FOR ALL COMMENTING (INCLUDING PLUGINS)
//  METHODS IN THIS CLASS:
//    se_comment()
//    comment_total()
//    comment_list()
//    comment_post()
//    comment_delete()
//    comment_delete_selected()





class se_comment {

	// INITIALIZE VARIABLES
	var $is_error;			// DETERMINES WHETHER THERE IS AN ERROR OR NOT
	var $error_message;		// CONTAINS RELEVANT ERROR MESSAGE

	var $comment_type;		// CONTAINS THE PREFIX CORRESPONDING TO THE COMMENT TYPE (EX: PROFILE FOR SE_PROFILECOMMENTS)
	var $comment_identifier;	// CONTAINS THE IDENTIFYING COLUMN IN THE TABLE (EX: USER_ID FOR SE_PROFILECOMMENTS)
	var $comment_identifying_value;	// CONTAINS THE VALUE TO MATCH TO THE IDENTIFIER








	// THIS METHOD SETS INITIAL VARS
	// INPUT: $type REPRESENTING THE PREFIX CORRESPONDING TO THE COMMENT TYPE
	//	  $identifier REPRESENTING THE IDENTIFYING COLUMN IN THE TABLE
	// OUTPUT: 
	function se_comment($type, $identifier, $identifying_value) {

	  $this->comment_type = $type;
	  $this->comment_identifier = $identifier;
	  $this->comment_identifying_value = $identifying_value;

	} // END se_comment() METHOD








	// THIS METHOD RETURNS THE TOTAL NUMBER OF COMMENTS
	// INPUT:
	// OUTPUT: AN INTEGER REPRESENTING THE NUMBER OF COMMENTS
	function comment_total() {
	  global $database;

	  $comment_query = "SELECT ".$this->comment_type."comment_id FROM se_".$this->comment_type."comments WHERE ".$this->comment_type."comment_".$this->comment_identifier."='".$this->comment_identifying_value."'";
	  $comments_total = $database->database_num_rows($database->database_query($comment_query));

	  return $comments_total;

	} // END comment_total() METHOD








	// THIS METHOD RETURNS AN ARRAY CONTAINING COMMENT INFO
	// INPUT: $start REPRESENTING THE COMMENT TO START WITH
	//	  $limit REPRESENTING THE NUMBER OF COMMENTS TO RETURN
	// OUTPUT: AN ARRAY OF COMMENTS
	function comment_list($start, $limit) {
	  global $database;

	  $comment_array = Array();
	  $comment_query = "SELECT se_".$this->comment_type."comments.*, se_users.user_id, se_users.user_username, se_users.user_photo FROM se_".$this->comment_type."comments LEFT JOIN se_users ON se_".$this->comment_type."comments.".$this->comment_type."comment_authoruser_id=se_users.user_id WHERE ".$this->comment_type."comment_".$this->comment_identifier."='".$this->comment_identifying_value."' ORDER BY ".$this->comment_type."comment_id DESC LIMIT $start, $limit";
	  $comments = $database->database_query($comment_query);
	  while($comment_info = $database->database_fetch_assoc($comments)) {

	    // CREATE AN OBJECT FOR AUTHOR
	    $author = new se_user();
	    $author->user_info[user_id] = $comment_info[user_id];
	    $author->user_info[user_username] = $comment_info[user_username];
	    $author->user_info[user_photo] = $comment_info[user_photo];

	    // SET COMMENT ARRAY
	    $comment_array[] = Array('comment_id' => $comment_info[$this->comment_type.'comment_id'],
					'comment_author' => $author,
					'comment_date' => $comment_info[$this->comment_type.'comment_date'],
					'comment_body' => $comment_info[$this->comment_type.'comment_body']);
	  }

	  return $comment_array;

	} // END comment_list() METHOD








	// THIS METHOD POSTS A COMMENT
	// INPUT: 
	// OUTPUT: 
	function comment_post() {
	  global $database;



	} // END comment_post() METHOD








	// THIS METHOD DELETES A SINGLE COMMENT
	// INPUT: $comment_id REPRESENTING THE ID OF THE COMMENT TO DELETE
	// OUTPUT: 
	function comment_delete($comment_id) {
	  global $database;



	} // END comment_delete() METHOD








	// THIS METHOD DELETES MANY COMMENTS BASED ON WHAT HAS BEEN POSTED
	// INPUT: $start REPRESENTING THE COMMENT TO START WITH
	//	  $limit REPRESENTING THE NUMBER OF COMMENTS TO RETURN
	// OUTPUT: 
	function comment_delete_selected($start, $limit) {
	  global $database;

	  $delete_query = "";
	  $comment_query = "SELECT se_".$this->comment_type."comments.".$this->comment_type."comment_id FROM se_".$this->comment_type."comments WHERE ".$this->comment_type."comment_".$this->comment_identifier."='".$this->comment_identifying_value."' ORDER BY ".$this->comment_type."comment_id DESC LIMIT $start, $limit";
	  $comments = $database->database_query($comment_query);
	  while($comment_info = $database->database_fetch_assoc($comments)) {
	    $var = "comment_".$comment_info[$this->comment_type.'comment_id'];

	    if($_POST[$var] == 1) {
	      if($delete_query != "") { $delete_query .= " OR "; }
	      $delete_query .= $this->comment_type."comment_id='".$comment_info[$this->comment_type.'comment_id']."'";
	    }
	  }

	  if($delete_query != "") { $database->database_query("DELETE FROM se_".$this->comment_type."comments WHERE $delete_query"); }

	} // END comment_delete_selected() METHOD

}
?>