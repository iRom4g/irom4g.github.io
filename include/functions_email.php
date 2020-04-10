<?

//  THIS FILE CONTAINS EMAIL-RELATED FUNCTIONS
//  FUNCTIONS IN THIS CLASS:
//    send_generic()
//    send_verification()
//    send_welcome()
//    send_newpass()
//    send_invitation()
//    send_invitecode()
//    send_lostpassword()
//    send_friendrequest()
//    send_message()
//    send_profilecomment()
//    send_announcement()
//    send_helpcontact()













// THIS FUNCTION SENDS A CUSTOM EMAIL
// INPUT: $recipient REPRESENTING THE RECIPIENT'S EMAIL
//	  $sender REPRESENTING THE SENDER'S NAME/EMAIL
//	  $subject REPRESENTING THE EMAIL SUBJECT
//	  $message REPRESENTING THE EMAIL MESSAGE
//	  $search REPRESENTING THE ARRAY OF STRINGS TO SEARCH FOR
//	  $replace REPRESENTING THE ARRAY OF STRINGS TO REPLACE $search WITH
// OUTPUT: 
function send_generic($recipient, $sender, $subject, $message, $search, $replace) {

	// DECODE SUBJECT AND EMAIL FOR SENDING
	$subject = htmlspecialchars_decode($subject, ENT_QUOTES);
	$message = htmlspecialchars_decode($message, ENT_QUOTES);

	// REPLACE VARIABLES IN SUBJECT AND MESSAGE
	$subject = str_replace($search, $replace, $subject);
	$message = str_replace($search, $replace, $message);

	// ENCODE SUBJECT FOR UTF8
	$subject="=?UTF-8?B?".base64_encode($subject)."?=";

	// REPLACE CARRIAGE RETURNS WITH BREAKS
	$message = str_replace("\n", "<br>", $message);

	// SET HEADERS
	$headers = "MIME-Version: 1.0"."\n";
	$headers .= "Content-type: text/html; charset=utf-8"."\n";
	$headers .= "Content-Transfer-Encoding: 8bit"."\n";
	$headers .= "From: $sender"."\n";
	$headers .= "Return-Path: $sender"."\n";
	$headers .= "Reply-To: $sender";

	// SEND MAIL
	mail($recipient, $subject, $message, $headers);

	return true;
} // END send_generic() FUNCTION









// THIS FUNCTION SENDS A VERIFICATION EMAIL TO A USER
// INPUT: $user_info REPRESENTING THE RECIPIENT'S USER INFO
// OUTPUT: 
function send_verification($user_info) {
	global $setting, $url;

	// GET SERVER INFO
	$prefix = $url->url_base;

	// GET VERIFICATION CODE AND LINK
	$verify_code = md5($user_info[user_code]);
	$time = time();
	$verify_link = "$prefix"."signup_verify.php?u=$user_info[user_id]&verify=$verify_code&d=$time";

	// DECODE SUBJECT AND EMAIL FOR SENDING
	$subject = htmlspecialchars_decode($setting[setting_email_verify_subject], ENT_QUOTES);
	$message = htmlspecialchars_decode($setting[setting_email_verify_message], ENT_QUOTES);

	// REPLACE VARIABLES IN SUBJECT AND MESSAGE
	$subject = str_replace("[username]", $user_info[user_username], $subject);
	$message = str_replace("[username]", $user_info[user_username], $message);
	$subject = str_replace("[email]", $user_info[user_email], $subject);
	$message = str_replace("[email]", $user_info[user_email], $message);
	$subject = str_replace("[link]", "<a href=\"$verify_link\">".$verify_link."</a>", $subject);
	$message = str_replace("[link]", "<a href=\"$verify_link\">".$verify_link."</a>", $message);

	// ENCODE SUBJECT FOR UTF8
	$subject="=?UTF-8?B?".base64_encode($subject)."?=";

	// REPLACE CARRIAGE RETURNS WITH BREAKS
	$message = str_replace("\n", "<br>", $message);

	// SET HEADERS
	$from_email = "$setting[setting_email_fromname] <$setting[setting_email_fromemail]>";
	$headers = "MIME-Version: 1.0"."\n";
	$headers .= "Content-type: text/html; charset=utf-8"."\n";
	$headers .= "Content-Transfer-Encoding: 8bit"."\n";
	$headers .= "From: $from_email"."\n";
	$headers .= "Return-Path: $from_email"."\n";
	$headers .= "Reply-To: $from_email";

	// SEND MAIL
	mail($user_info[user_newemail], $subject, $message, $headers);

	return true;
} // END send_verification() FUNCTION









// THIS FUNCTION SENDS A WELCOME EMAIL TO THE USER
// INPUT: $user_info REPRESENTING THE RECIPIENT'S USER INFO
//	  $password (OPTIONAL) REPRESENTING THE RECIPIENT'S PASSWORD
// OUTPUT: 
function send_welcome($user_info, $password = "") {
	global $url, $setting;

	// GET SERVER INFO
	$prefix = $url->url_base;

	// DECODE SUBJECT AND EMAIL FOR SENDING
	$subject = htmlspecialchars_decode($setting[setting_email_welcome_subject], ENT_QUOTES);
	$message = htmlspecialchars_decode($setting[setting_email_welcome_message], ENT_QUOTES);

	// REPLACE VARIABLES IN SUBJECT AND MESSAGE
	$subject = str_replace("[username]", $user_info[user_username], $subject);
	$message = str_replace("[username]", $user_info[user_username], $message);
	$subject = str_replace("[email]", $user_info[user_email], $subject);
	$message = str_replace("[email]", $user_info[user_email], $message);
	$subject = str_replace("[password]", $password, $subject);
	$message = str_replace("[password]", $password, $message);
	$subject = str_replace("[link]", "<a href=\"$prefix"."login.php\">$prefix"."login.php</a>", $subject);
	$message = str_replace("[link]", "<a href=\"$prefix"."login.php\">$prefix"."login.php</a>", $message);

	// ENCODE SUBJECT FOR UTF8
	$subject="=?UTF-8?B?".base64_encode($subject)."?=";

	// REPLACE CARRIAGE RETURNS WITH BREAKS
	$message = str_replace("\n", "<br>", $message);

	// SET HEADERS
	$from_email = "$setting[setting_email_fromname] <$setting[setting_email_fromemail]>";
	$headers = "MIME-Version: 1.0"."\n";
	$headers .= "Content-type: text/html; charset=utf-8"."\n";
	$headers .= "Content-Transfer-Encoding: 8bit"."\n";
	$headers .= "From: $from_email"."\n";
	$headers .= "Return-Path: $from_email"."\n";
	$headers .= "Reply-To: $from_email";

	// SEND MAIL
	mail($user_info[user_email], $subject, $message, $headers);

	return true;
} // END send_welcome() FUNCTION









// THIS FUNCTION SENDS A NEW PASSWORD EMAIL TO THE USER
// INPUT: $user_info REPRESENTING THE RECIPIENT'S USER INFO
//	  $newpass REPRESENTING THE USER'S NEW PASSWORD
// OUTPUT:
function send_newpass($user_info, $newpass) {
	global $setting, $url;

	// GET SERVER INFO
	$prefix = $url->url_base;

	// DECODE SUBJECT AND EMAIL FOR SENDING
	$subject = htmlspecialchars_decode($setting[setting_email_newpass_subject], ENT_QUOTES);
	$message = htmlspecialchars_decode($setting[setting_email_newpass_message], ENT_QUOTES);

	// REPLACE VARIABLES IN SUBJECT AND MESSAGE
	$subject = str_replace("[username]", $user_info[user_username], $subject);
	$message = str_replace("[username]", $user_info[user_username], $message);
	$subject = str_replace("[email]", $user_info[user_email], $subject);
	$message = str_replace("[email]", $user_info[user_email], $message);
	$subject = str_replace("[password]", $newpass, $subject);
	$message = str_replace("[password]", $newpass, $message);
	$subject = str_replace("[link]", "<a href=\"$prefix"."login.php\">$prefix"."login.php</a>", $subject);
	$message = str_replace("[link]", "<a href=\"$prefix"."login.php\">$prefix"."login.php</a>", $message);

	// ENCODE SUBJECT FOR UTF8
	$subject="=?UTF-8?B?".base64_encode($subject)."?=";

	// REPLACE CARRIAGE RETURNS WITH BREAKS
	$message = str_replace("\n", "<br>", $message);

	// SET HEADERS
	$from_email = "$setting[setting_email_fromname] <$setting[setting_email_fromemail]>";
	$headers = "MIME-Version: 1.0"."\n";
	$headers .= "Content-type: text/html; charset=utf-8"."\n";
	$headers .= "Content-Transfer-Encoding: 8bit"."\n";
	$headers .= "From: $from_email"."\n";
	$headers .= "Return-Path: $from_email"."\n";
	$headers .= "Reply-To: $from_email";

	// SEND MAIL
	mail($user_info[user_email], $subject, $message, $headers);

	return true;
} // END send_newpass() FUNCTION









// THIS FUNCTION SENDS GENERIC INVITATION EMAIL TO SPECIFIED EMAILS
// INPUT: $user_info REPRESENTING THE SENDER'S USER INFO
//	  $invite_emails REPRESENTING UP TO 5 COMA-SEPARATED EMAIL ADDRESSES
//	  $invite_message (OPTIONAL) REPRESENTING A CUSTOM USER MESSAGE
// OUTPUT:
function send_invitation($user_info, $invite_emails, $invite_message = "") {
	global $setting, $url;

	// GET SERVER INFO
	$prefix = $url->url_base;

	// MAKE SURE THERE ARE NO MORE THAN 5 EMAILS
	$invite_emails = array_slice(explode(",", $invite_emails), 0, 5);

	// DECODE SUBJECT AND EMAIL FOR SENDING
	$subject = htmlspecialchars_decode($setting[setting_email_invite_subject], ENT_QUOTES);
	$message = htmlspecialchars_decode($setting[setting_email_invite_message], ENT_QUOTES);

	// REPLACE VARIABLES IN EMAIL SUBJECT AND MESSAGE
	$subject = str_replace("[username]", $user_info[user_username], $subject);
	$message = str_replace("[username]", $user_info[user_username], $message);
	$subject = str_replace("[email]", $user_info[user_email], $subject);
	$message = str_replace("[email]", $user_info[user_email], $message);
	$subject = str_replace("[message]", $invite_message, $subject);
	$message = str_replace("[message]", $invite_message, $message);
	$subject = str_replace("[link]", "<a href=\"$prefix"."signup.php\">$prefix"."signup.php</a>", $subject);
	$message = str_replace("[link]", "<a href=\"$prefix"."signup.php\">$prefix"."signup.php</a>", $message);

	// ENCODE SUBJECT FOR UTF8
	$subject="=?UTF-8?B?".base64_encode($subject)."?=";

	// REPLACE CARRIAGE RETURNS WITH BREAKS
	$message = str_replace("\n", "<br>", $message);

	// SET HEADERS
	$from_email = "$setting[setting_email_fromname] <$setting[setting_email_fromemail]>";
	$headers = "MIME-Version: 1.0"."\n";
	$headers .= "Content-type: text/html; charset=utf-8"."\n";
	$headers .= "Content-Transfer-Encoding: 8bit"."\n";
	$headers .= "From: $from_email"."\n";
	$headers .= "Return-Path: $from_email"."\n";
	$headers .= "Reply-To: $from_email";

	// SEND MAIL TO EACH EMAIL
	for($e=0;$e<5;$e++) {
	  $invite_email = str_replace(" ", "", $invite_emails[$e]);
	  if($invite_email != "") {
	    @mail($invite_email, $subject, $message, $headers);
	  }
	}
  
	return true;
} // END send_invitation() FUNCTION









// THIS FUNCTION SENDS INVITATION CODE EMAIL TO SPECIFIED EMAILS
// INPUT: $user_info REPRESENTING THE SENDER'S USER INFO
//	  $invite_emails REPRESENTING UP TO 5 COMA-SEPARATED EMAIL ADDRESSES
//	  $invite_message (OPTIONAL) REPRESENTING A CUSTOM USER MESSAGE
// OUTPUT:
function send_invitecode($user_info, $invite_emails, $invite_message="") {
	global $database, $setting, $url;

	// SET VARIABLES
	$time = time();
	$invites_left = $user_info[user_invitesleft];

	// GET SERVER INFO
	$prefix = $url->url_base;
  
	$emails = explode(",", $invite_emails);
	for($e=0;$e<5;$e++) {
	  $email = str_replace(" ", "", $emails[$e]);
	  if($email != "" & $invites_left > 0) {

	    // CREATE CODE AND INSERT INTO DATABASE
	    $invite_code = randomcode();
	    $database->database_query("INSERT INTO se_invites (invite_user_id, invite_date, invite_email, invite_code) VALUES ('$user_info[user_id]', '$time', '$email', '$invite_code')");

	    // DECODE SUBJECT AND EMAIL FOR SENDING
	    $subject = htmlspecialchars_decode($setting[setting_email_invitecode_subject], ENT_QUOTES);
	    $message = htmlspecialchars_decode($setting[setting_email_invitecode_message], ENT_QUOTES);
   
	    // REPLACE VARIABLES IN EMAIL SUBJECT AND MESSAGE
	    $subject = str_replace("[username]", $user_info[user_username], $subject);
	    $message = str_replace("[username]", $user_info[user_username], $message);
	    $subject = str_replace("[email]", $user_info[user_email], $subject);
	    $message = str_replace("[email]", $user_info[user_email], $message);
	    $subject = str_replace("[message]", $invite_message, $subject);
	    $message = str_replace("[message]", $invite_message, $message);
	    $subject = str_replace("[code]", $invite_code, $subject);
	    $message = str_replace("[code]", $invite_code, $message);
	    $subject = str_replace("[link]", "<a href=\"$prefix"."signup.php?signup_email=$email&signup_invite=$invite_code\">$prefix"."signup.php?signup_email=$email&signup_invite=$invite_code</a>", $subject);
	    $message = str_replace("[link]", "<a href=\"$prefix"."signup.php?signup_email=$email&signup_invite=$invite_code\">$prefix"."signup.php?signup_email=$email&signup_invite=$invite_code</a>", $message);

	    // ENCODE SUBJECT FOR UTF8
	    $subject="=?UTF-8?B?".base64_encode($subject)."?=";

	    // REPLACE CARRIAGE RETURNS WITH BREAKS
	    $message = str_replace("\n", "<br>", $message);

	    // SET HEADERS
	    $from_email = "$setting[setting_email_fromname] <$setting[setting_email_fromemail]>";
	    $headers = "MIME-Version: 1.0"."\n";
	    $headers .= "Content-type: text/html; charset=utf-8"."\n";
	    $headers .= "Content-Transfer-Encoding: 8bit"."\n";
	    $headers .= "From: $from_email"."\n";
	    $headers .= "Return-Path: $from_email"."\n";
	    $headers .= "Reply-To: $from_email";

	    // SEND MAIL
	    @mail($email, $subject, $message, $headers);
     
    	    // DECREASE INVITES IF NOT ADMIN
	    if($user_info[user_id] != 0) { $invites_left--; }
	  }
	}
  
	// UPDATE NEW INVITES LEFT IF NOT ADMIN
	if($user_info[user_id] != 0) {
	  $database->database_query("UPDATE se_users SET user_invitesleft='$invites_left' WHERE user_id='$user_info[user_id]'");
	}

	return true;
} // END send_invitecode() FUNCTION









// THIS FUNCTION SENDS LOST PASSWORD EMAIL
// INPUT: $user_info REPRESENTING THE RECIPIENT'S USER INFO
//	  $lostpassword_code REPRESENTING THE CODE ASSOCIATED WITH RESETTING THE PASSWORD
// OUTPUT:
function send_lostpassword($user_info, $lostpassword_code) {
	global $setting, $url;

	// GET SERVER INFO
	$prefix = $url->url_base;

	// DECODE SUBJECT AND EMAIL FOR SENDING
	$subject = htmlspecialchars_decode($setting[setting_email_lostpassword_subject], ENT_QUOTES);
	$message = htmlspecialchars_decode($setting[setting_email_lostpassword_message], ENT_QUOTES);

	// REPLACE VARIABLES IN EMAIL SUBJECT AND MESSAGE
	$subject = str_replace("[username]", $user_info[user_username], $subject);
	$message = str_replace("[username]", $user_info[user_username], $message);
	$subject = str_replace("[email]", $user_info[user_email], $subject);
	$message = str_replace("[email]", $user_info[user_email], $message);
	$subject = str_replace("[link]", "<a href=\"$prefix"."lostpass_reset.php?user=$user_info[user_username]&r=$lostpassword_code\">$prefix"."lostpass_reset.php?user=$user_info[user_username]&r=$lostpassword_code</a>", $subject);
	$message = str_replace("[link]", "<a href=\"$prefix"."lostpass_reset.php?user=$user_info[user_username]&r=$lostpassword_code\">$prefix"."lostpass_reset.php?user=$user_info[user_username]&r=$lostpassword_code</a>", $message);

	// ENCODE SUBJECT FOR UTF8
	$subject="=?UTF-8?B?".base64_encode($subject)."?=";

	// REPLACE CARRIAGE RETURNS WITH BREAKS
	$message = str_replace("\n", "<br>", $message);

	// SET HEADERS
	$from_email = "$setting[setting_email_fromname] <$setting[setting_email_fromemail]>";
	$headers = "MIME-Version: 1.0"."\n";
	$headers .= "Content-type: text/html; charset=utf-8"."\n";
	$headers .= "Content-Transfer-Encoding: 8bit"."\n";
	$headers .= "From: $from_email"."\n";
	$headers .= "Return-Path: $from_email"."\n";
	$headers .= "Reply-To: $from_email";

	// SEND MAIL
	@mail($user_info[user_email], $subject, $message, $headers);
  
	return true;
} // END send_lostpassword() FUNCTION









// THIS FUNCTION SENDS FRIEND REQUEST TO USER
// INPUT: $owner REPRESENTING THE RECIPIENT'S USER OBJECT
//	  $friendname REPRESENTING THE NAME OF THE USER REQUESTING FRIENDSHIP
// OUTPUT:
function send_friendrequest($owner, $friendname) {
	global $setting, $url;

	// SET USER SETTINGS
	$owner->user_settings();

	// MAKE SURE USER WANTS TO BE NOTIFIED
	if($owner->usersetting_info[usersetting_notify_friendrequest] != 0) {
  
	  // GET SERVER INFO
	  $prefix = $url->url_base;

	  // DECODE SUBJECT AND EMAIL FOR SENDING
	  $subject = htmlspecialchars_decode($setting[setting_email_friendrequest_subject], ENT_QUOTES);
	  $message = htmlspecialchars_decode($setting[setting_email_friendrequest_message], ENT_QUOTES);

	  // REPLACE VARIABLES IN EMAIL SUBJECT AND MESSAGE
	  $subject = str_replace("[username]", $owner->user_info[user_username], $subject);
	  $message = str_replace("[username]", $owner->user_info[user_username], $message);
	  $subject = str_replace("[friendname]", $friendname, $subject);
	  $message = str_replace("[friendname]", $friendname, $message);
	  $subject = str_replace("[link]", "<a href=\"$prefix"."login.php\">$prefix"."login.php</a>", $subject);
	  $message = str_replace("[link]", "<a href=\"$prefix"."login.php\">$prefix"."login.php</a>", $message);

	  // ENCODE SUBJECT FOR UTF8
	  $subject="=?UTF-8?B?".base64_encode($subject)."?=";

	  // REPLACE CARRIAGE RETURNS WITH BREAKS
	  $message = str_replace("\n", "<br>", $message);

	  // SET HEADERS
	  $from_email = "$setting[setting_email_fromname] <$setting[setting_email_fromemail]>";
	  $headers = "MIME-Version: 1.0"."\n";
	  $headers .= "Content-type: text/html; charset=utf-8"."\n";
	  $headers .= "Content-Transfer-Encoding: 8bit"."\n";
	  $headers .= "From: $from_email"."\n";
	  $headers .= "Return-Path: $from_email"."\n";
	  $headers .= "Reply-To: $from_email";

	  // SEND MAIL
	  @mail($owner->user_info[user_email], $subject, $message, $headers);

	}  

	return true;
} // END send_friendrequest() FUNCTION









// THIS FUNCTION SENDS NEW MESSAGE NOTIFICATION TO USER
// INPUT: $touser REPRESENTING THE RECIPIENT'S USER OBJECT
//	  $sender REPRESENTING THE USERNAME OF THE MESSAGE SENDER
// OUTPUT:
function send_message($touser, $sender) {
	global $setting, $url;

	// SET USER SETTINGS
	$touser->user_settings();

	// MAKE SURE USER WANTS TO BE NOTIFIED
	if($touser->usersetting_info[usersetting_notify_message] != 0) {

	  // GET SERVER INFO
	  $prefix = $url->url_base;

	  // DECODE SUBJECT AND EMAIL FOR SENDING
	  $subject = htmlspecialchars_decode($setting[setting_email_message_subject], ENT_QUOTES);
	  $message = htmlspecialchars_decode($setting[setting_email_message_message], ENT_QUOTES);

	  // REPLACE VARIABLES IN EMAIL SUBJECT AND MESSAGE
	  $subject = str_replace("[username]", $touser->user_info[user_username], $subject);
	  $message = str_replace("[username]", $touser->user_info[user_username], $message);
	  $subject = str_replace("[sender]", $sender, $subject);
	  $message = str_replace("[sender]", $sender, $message);
	  $subject = str_replace("[link]", "<a href=\"$prefix"."login.php\">$prefix"."login.php</a>", $subject);
	  $message = str_replace("[link]", "<a href=\"$prefix"."login.php\">$prefix"."login.php</a>", $message);
  
	  // ENCODE SUBJECT FOR UTF8
	  $subject="=?UTF-8?B?".base64_encode($subject)."?=";

	  // REPLACE CARRIAGE RETURNS WITH BREAKS
	  $message = str_replace("\n", "<br>", $message);

	  // SET HEADERS
	  $from_email = "$setting[setting_email_fromname] <$setting[setting_email_fromemail]>";
	  $headers = "MIME-Version: 1.0"."\n";
	  $headers .= "Content-type: text/html; charset=utf-8"."\n";
	  $headers .= "Content-Transfer-Encoding: 8bit"."\n";
	  $headers .= "From: $from_email"."\n";
	  $headers .= "Return-Path: $from_email"."\n";
	  $headers .= "Reply-To: $from_email";

	  // SEND MAIL
	  @mail($touser->user_info[user_email], $subject, $message, $headers);

	}  

	return true;
} // END send_message() FUNCTION









// THIS FUNCTION SENDS PROFILE COMMENT NOTIFICATION TO USER
// INPUT: $owner REPRESENTING THE RECIPIENT'S USER OBJECT
//	  $commenter REPRESENTING THE COMMENTER'S USERNAME
// OUTPUT:
function send_profilecomment($owner, $commenter) {
	global $setting, $url;

	// SET USER SETTINGS
	$owner->user_settings();

	// MAKE SURE USER WANTS TO BE NOTIFIED
	if($owner->usersetting_info[usersetting_notify_profilecomment] != 0) {

	  // DECODE SUBJECT AND EMAIL FOR SENDING
	  $subject = htmlspecialchars_decode($setting[setting_email_profilecomment_subject], ENT_QUOTES);
	  $message = htmlspecialchars_decode($setting[setting_email_profilecomment_message], ENT_QUOTES);

	  // REPLACE VARIABLES IN EMAIL SUBJECT AND MESSAGE
	  $subject = str_replace("[username]", $owner->user_info[user_username], $subject);
	  $message = str_replace("[username]", $owner->user_info[user_username], $message);
	  $subject = str_replace("[commenter]", $commenter, $subject);
	  $message = str_replace("[commenter]", $commenter, $message);
	  $subject = str_replace("[link]", "<a href=\"".$url->url_create("profile", $owner->user_info[user_username])."\">".$url->url_create("profile", $owner->user_info[user_username])."</a>", $subject);
	  $message = str_replace("[link]", "<a href=\"".$url->url_create("profile", $owner->user_info[user_username])."\">".$url->url_create("profile", $owner->user_info[user_username])."</a>", $message);

	  // ENCODE SUBJECT FOR UTF8
	  $subject="=?UTF-8?B?".base64_encode($subject)."?=";

	  // REPLACE CARRIAGE RETURNS WITH BREAKS
	  $message = str_replace("\n", "<br>", $message);

	  // SET HEADERS
	  $from_email = "$setting[setting_email_fromname] <$setting[setting_email_fromemail]>";
	  $headers = "MIME-Version: 1.0"."\n";
	  $headers .= "Content-type: text/html; charset=utf-8"."\n";
	  $headers .= "Content-Transfer-Encoding: 8bit"."\n";
	  $headers .= "From: $from_email"."\n";
	  $headers .= "Return-Path: $from_email"."\n";
	  $headers .= "Reply-To: $from_email";

	  // SEND MAIL
	  @mail($owner->user_info[user_email], $subject, $message, $headers);

	}  

	return true;
} // END send_profilecomment() FUNCTION









// THIS FUNCTION SENDS ANNOUNCEMENT
// INPUT: $user_email REPRESENTING THE RECIPIENT'S EMAIL
//	  $from_email REPRESENTING THE SENDER'S EMAIL
//	  $subject REPRESENTING THE SUBJECT
//	  $message REPRESENTING THE MESSAGE
// OUTPUT:
function send_announcement($user_email, $from_email, $subject, $message) {

	// DECODE SUBJECT AND EMAIL FOR SENDING
	$from_email = htmlspecialchars_decode($from_email, ENT_QUOTES);
	$subject = htmlspecialchars_decode($subject, ENT_QUOTES);
	$message = htmlspecialchars_decode($message, ENT_QUOTES);

	// ENCODE SUBJECT FOR UTF8
	$subject="=?UTF-8?B?".base64_encode($subject)."?=";

	// REPLACE CARRIAGE RETURNS WITH BREAKS
	$message = str_replace("\n", "<br>", $message);

	// SET HEADERS
	$headers = "MIME-Version: 1.0"."\n";
	$headers .= "Content-type: text/html; charset=utf-8"."\n";
	$headers .= "Content-Transfer-Encoding: 8bit"."\n";
	$headers .= "From: $from_email"."\n";
	$headers .= "Return-Path: $from_email"."\n";
	$headers .= "Reply-To: $from_email";

	// SEND MAIL
	@mail($user_email, $subject, $message, $headers);

	return true;
} // END send_announcement() FUNCTION









// THIS FUNCTION SENDS HELP EMAIL
// INPUT: $admin_email REPRESENTING THE RECIPIENT'S EMAIL ADDRESS
//	  $from_email REPRESENTING THE SENDER'S EMAIL ADDRESS
//	  $subject REPRESENTING THE SUBJECT
//	  $message REPRESENTING THE MESSAGE
// OUTPUT:
function send_helpcontact($admin_email, $from_email, $subject, $message) {

	// DECODE SUBJECT AND EMAIL FOR SENDING
	$from_email = htmlspecialchars_decode($from_email, ENT_QUOTES);
	$subject = htmlspecialchars_decode($subject, ENT_QUOTES);
	$message = htmlspecialchars_decode($message, ENT_QUOTES);

	// ENCODE SUBJECT FOR UTF8
	$subject="=?UTF-8?B?".base64_encode($subject)."?=";

	// REPLACE CARRIAGE RETURNS WITH BREAKS
	$message = str_replace("\n", "<br>", $message);

	// SET HEADERS
	$headers = "MIME-Version: 1.0"."\n";
	$headers .= "Content-type: text/html; charset=utf-8"."\n";
	$headers .= "Content-Transfer-Encoding: 8bit"."\n";
	$headers .= "From: $from_email"."\n";
	$headers .= "Return-Path: $from_email"."\n";
	$headers .= "Reply-To: $from_email";

	// SEND MAIL
	@mail($admin_email, $subject, $message, $headers);

	return true;
} // END send_helpcontact() FUNCTION





?>