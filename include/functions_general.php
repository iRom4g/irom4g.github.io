<?

//  THIS FILE CONTAINS GENERAL FUNCTIONS
//  FUNCTIONS IN THIS FILE:
//    cheader()
//    make_page()
//    bumplog()
//    randomcode()
//    is_email_address()
//    str_ireplace()
//    htmlspecialchars_decode()
//    str_split()
//    security()
//    select_subnet()
//    link_field_values()
//    censor()
//    dirsize()
//    online_users()
//    true_privacy()
//    user_privacy_levels()
//    search_profile()
//    getmicrotime()
//    ChopText()












// THIS FUNCTION CHANGES LOCATION HEADER TO REDIRECT FOR IIS PRIOR TO SETTING COOKIES
// INPUT: $url REPRESENTING THE URL TO REDIRECT TO
// OUTPUT: 
function cheader($url) {
	if(ereg("Microsoft", $_SERVER['SERVER_SOFTWARE'])) {
	  header("Refresh: 0; URL=$url");
	} else {
	  header("Location: $url");
	}
	exit();
} // END cheader() FUNCTION









// THIS FUNCTION RETURNS APPROPRIATE PAGE VARIABLES
// INPUT: $total_items REPRESENTING THE TOTAL NUMBER OF ITEMS
//	  $items_per_page REPRESENTING THE NUMBER OF ITEMS PER PAGE
//	  $p REPRESENTING THE CURRENT PAGE
// OUTPUT: AN ARRAY CONTAINING THE STARTING ITEM, THE PAGE, AND THE MAX PAGE
function make_page($total_items, $items_per_page, $p) {

	if(($total_items % $items_per_page) != 0) { $maxpage = ($total_items) / $items_per_page + 1; } else { $maxpage = ($total_items) / $items_per_page; }
	$maxpage = (int) $maxpage;
	if($maxpage <= 0) { $maxpage = 1; }
	if($p > $maxpage) { $p = $maxpage; } elseif($p < 1) { $p = 1; }
	$start = ($p - 1) * $items_per_page;

	return Array($start, $p, $maxpage);

} // END make_page() FUNCTION









// THIS FUNCTION BUMPS LOGIN LOG
// INPUT:
// OUTPUT: 
function bumplog() {
	global $database;
	$log_entries = $database->database_num_rows($database->database_query("SELECT login_id FROM se_logins"));
	if($log_entries > 1000) {
	  $oldest_log = $database->database_fetch_assoc($database->database_query("SELECT login_id FROM se_logins ORDER BY login_id ASC LIMIT 0,1"));
	  $database->database_query("DELETE FROM se_logins WHERE login_id='$oldest_log[login_id]'");
	  bumplog();
	}
} // END bumplog() FUNCTION









// THIS FUNCTION RETURNS A RANDOM CODE OF DEFAULT LENGTH 8
// INPUT: $len (OPTIONAL) REPRESENTING THE LENGTH OF THE RANDOM STRING
// OUTPUT: A RANDOM ALPHANUMERIC STRING
function randomcode($len="8") {

	$code = NULL;
	for($i=0;$i<$len;$i++) {
	  $char = chr(rand(48,122));
	  while(!ereg("[a-zA-Z0-9]", $char)) {
	    if($char == $lchar) { continue; }
	    $char = chr(rand(48,90));
	  }
	  $pass .= $char;
	  $lchar = $char;
	}
	return $pass;

} // END randomcode() FUNCTION









// THIS FUNCTION CHECKS IF PROVIDED STRING IS AN EMAIL ADDRESS
// INPUT: $email REPRESENTING THE EMAIL ADDRESS TO CHECK
// OUTPUT: TRUE/FALSE DEPENDING ON WHETHER THE EMAIL ADDRESS IS VALIDLY CONSTRUCTED
function is_email_address($email) {

	$regexp="/^[a-z0-9]+([_\\.-][a-z0-9]+)*@([a-z0-9]+([\.-][a-z0-9]+)*)+\\.[a-z]{2,}$/i";
	if(!preg_match($regexp, $email) ) { return false; } else { return true; }

} // END is_email_address() FUNCTION









// THIS FUNCTION SETS STR_IREPLACE IF FUNCTION DOESN'T EXIST
// INPUT: $search REPRESENTING THE STRING TO SEARCH FOR
//	  $replace REPRESENTING THE STRING TO REPLACE IT WITH
//	  $subject REPRESENTING THE STRING WITHIN WHICH TO SEARCH
// OUTPUT: RETURNS A STRING IN WHICH ONE STRING HAS BEEN CASE-INSENSITIVELY REPLACED BY ANOTHER
if(!function_exists('str_ireplace')) {
function str_ireplace($search, $replace, $subject) {
	$search = preg_quote($search, "/");
	return preg_replace("/".$search."/i", $replace, $subject); 
} 
} // END str_ireplace() FUNCTION









// THIS FUNCTION SETS HTMLSPECIALCHARS_DECODE IF FUNCTION DOESN'T EXIST
// INPUT: $text REPRESENTING THE TEXT TO DECODE
//	  $ent_quotes (OPTIONAL) REPRESENTING WHETHER TO REPLACE DOUBLE QUOTES, ETC
// OUTPUT: A STRING WITH HTML CHARACTERS DECODED
if(!function_exists('htmlspecialchars_decode')) {
function htmlspecialchars_decode($text, $ent_quotes = "") {
	$text = str_replace("&quot;", "\"", $text);
	$text = str_replace("&#039;", "'", $text);
	$text = str_replace("&lt;", "<", $text);
	$text = str_replace("&gt;", ">", $text);
	$text = str_replace("&amp;", "&", $text);
	return $text;
}
} // END htmlspecialchars() FUNCTION









// THIS FUNCTION SETS STR_SPLIT IF FUNCTION DOESN'T EXIST
// INPUT: $string REPRESENTING THE STRING TO SPLIT
//	  $split_length (OPTIONAL) REPRESENTING WHERE TO CUT THE STRING
// OUTPUT: AN ARRAY OF STRINGS 
if(!function_exists('str_split')) { 
function str_split($string, $split_length = 1) { 
	$count = strlen($string);  
	if($split_length < 1) { 
	  return false;  
	} elseif($split_length > $count) { 
	  return array($string); 
	} else { 
	  $num = (int)ceil($count/$split_length);  
	  $ret = array();  
	  for($i=0;$i<$num;$i++) {  
	    $ret[] = substr($string,$i*$split_length,$split_length);  
	  }  
	  return $ret; 
	}      
}  
} // END str_split() FUNCTION









// THIS FUNCTION STRIPSLASHES AND ENCODES HTML ENTITIES FOR SECURITY PURPOSES
// INPUT: $value REPRESENTING A STRING OR ARRAY TO CLEAN
// OUTPUT: THE ARRAY OR STRING WITH HTML CHARACTERS ENCODED
function security($value) {
	if(is_array($value)) {
	  $value = array_map('security', $value);
	} else {
	  if(!get_magic_quotes_gpc()) {
	    $value = htmlspecialchars($value, ENT_QUOTES);
	  } else {
	    $value = htmlspecialchars(stripslashes($value), ENT_QUOTES);
	  }
	  $value = str_replace("\\", "\\\\", $value);
	}
	return $value;
} // END security() FUNCTION









// THIS FUNCTION LINKS FIELD VALUES
// INPUT: $field_value REPRESENTING THE VALUE TO LINK
//	  $key (NEEDED TO USE ARRAY WALK)
//	  $additional REPRESENTING THE ADDITIONAL PARAMETERS
// OUTPUT: 
function link_field_values(&$field_value, $key, $additional) {
	global $url;

	$field_id = $additional[0];
	$field_browse = $additional[1];
	$field_link = $additional[2];
	$field_browsable = $additional[3];
	$field_value = trim($field_value);
	if(str_replace(" ", "", $field_link) == "") {
	  if($field_browsable == 2) {
	    if($field_browse == "") { $field_browse = urlencode(htmlspecialchars_decode($field_value, ENT_QUOTES)); }
	    $browse_url = $url->url_base."search_advanced.php?task=browse&field_id=".$field_id."&field_value=".$field_browse;
	    if($field_value != "") { $field_value = "<a href='$browse_url'>$field_value</a>"; }
	  }
	} else {
	  if($field_value != "") { 
	    $link_to = str_replace("[field_value]", $field_value, $field_link);
	    $field_value = "<a href='$link_to' target='_blank'>$field_value</a>"; 
	  }
	}

} // END link_field_values() FUNCTION









// THIS FUNCTION CENSORS WORDS FROM A STRING
// INPUT: $field_value REPRESENTING THE VALUE TO CENSOR
// OUTPUT: THE VALUE WITH BANNED WORDS CENSORED
function censor($field_value) {
	global $setting;

	$censored_array = explode(",", trim($setting[setting_banned_words]));
	foreach($censored_array as $key => $value) {
	  $replace_value = str_pad("", strlen(trim($value)), "*");
	  $field_value = str_ireplace(trim($value), $replace_value, $field_value);
	}
 
	return $field_value;

} // END censor() FUNCTION









// THIS FUNCTION RETURNS THE SIZE OF A DIRECTORY
// INPUT: $dirname REPRESENTING THE PATH TO A DIRECTORY
// OUTPUT: THE SIZE OF ALL THE FILES WITHIN THE DIRECTORY
function dirsize($dirname) {
	if(!is_dir($dirname) || !is_readable($dirname)) { return false; }

	$dirname_stack[] = $dirname;
	$size = 0;

	do {
	  $dirname = array_shift($dirname_stack);
	  $handle = opendir($dirname);
	  while(false !== ($file = readdir($handle))) {
	    if($file != '.' && $file != '..' && is_readable($dirname . DIRECTORY_SEPARATOR . $file)) {
	      if(is_dir($dirname . DIRECTORY_SEPARATOR . $file)) {
	        $dirname_stack[] = $dirname . DIRECTORY_SEPARATOR . $file;
	      }
	      $size += filesize($dirname . DIRECTORY_SEPARATOR . $file);
	    }
	  }
	  closedir($handle);
	} while(count($dirname_stack) > 0);

	return $size;

} // END dirsize() FUNCTION









// THIS FUNCTION RETURNS AN ARRAY CONTAINING THE USERNAMES OF ONLINE USERS
// INPUT:
// OUTPUT: AN ARRAY OF USERNAMES FOR USERS CURRENTLY ACTIVE IN THE SYSTEM
function online_users() {
	global $database;

	$onlineusers_array = Array();
	$online_time = time()-10*60;
	$online_users = $database->database_query("SELECT user_username FROM se_users WHERE user_lastactive>'$online_time' ORDER BY user_lastactive DESC LIMIT 2000");
	while($online_user = $database->database_fetch_assoc($online_users)) {
	  $onlineusers_array[] = $online_user[user_username];
	}
	return $onlineusers_array;
} // END online_users() FUNCTION









// THIS FUNCTION RETURNS TRUE PRIVACY LEVEL BASED ON WHAT IS ALLOWED BY ADMIN
// INPUT: $given_privacy REPRESENTING THE PRIVACY SPECIFIED
//	  $allowable_privacy REPRESENTING THE PRIVACY LEVELS ALLOWED BY THE ADMIN
// OUTPUT: THE TRUE PRIVACY LEVEL BASED ON THE ADMIN-ALLOWED PRIVACY OPTIONS
function true_privacy($given_privacy, $allowable_privacy) {

	$true_privacy = $given_privacy;
	$allowable_privacy = str_split($allowable_privacy);
	rsort($allowable_privacy);

	if(!in_array($given_privacy, $allowable_privacy)) {
	  if($given_privacy >= $allowable_privacy[0]) {
	    $true_privacy = $allowable_privacy[0];
	  } else {
	    $allowable_privacy[count($allowable_privacy)+1] = $given_privacy;
	    rsort($allowable_privacy);
	    $given_privacy_key = array_search($given_privacy, $allowable_privacy);
	    $true_privacy = $allowable_privacy[$given_privacy_key-1];
	  }
	}

	return $true_privacy;
} // END true_privacy() FUNCTION









// THIS FUNCTION RETURNS TEXT CORRESPONDING TO THE GIVEN USER PRIVACY LEVEL
// INPUT: $privacy_level REPRESENTING THE LEVEL OF USER PRIVACY
// OUTPUT: A STRING EXPLAINING THE GIVEN PRIVACY SETTING
function user_privacy_levels($privacy_level) {
	global $functions_general;

	switch($privacy_level) {
	  case 0: $privacy = $functions_general[1]; break;
	  case 1: $privacy = $functions_general[2]; break;
	  case 2: $privacy = $functions_general[3]; break;
	  case 3: $privacy = $functions_general[4]; break;
	  case 4: $privacy = $functions_general[5]; break;
	  case 5: $privacy = $functions_general[6]; break;
	  case 6: $privacy = $functions_general[7]; break;
	  default: $privacy = ""; break;
	}

	return $privacy;
} // END user_privacy_levels() FUNCTION









// THIS FUNCTION SEARCHES THROUGH PROFILE INFORMATION
// INPUT: $search_text REPRESENTING THE STRING TO SEARCH FOR
//	  $total_only REPRESENTING 1/0 DEPENDING ON WHETHER OR NOT TO RETURN JUST THE TOTAL RESULTS
//	  $search_objects REPRESENTING AN ARRAY CONTAINING INFORMATION ABOUT THE POSSIBLE OBJECTS TO SEARCH
//	  $results REPRESENTING THE ARRAY OF SEARCH RESULTS
//	  $total_results REPRESENTING THE TOTAL SEARCH RESULTS
// OUTPUT:
function search_profile($search_text, $total_only, &$search_objects, &$results, &$total_results) {
	global $database, $url, $functions_general, $results_per_page, $p;

	// GET FIELDS
	$fields = $database->database_query("SELECT field_id, field_type, field_options FROM se_fields WHERE field_type<>'5' AND (field_dependency<>'0' OR (field_dependency='0' AND (field_browsable='1' OR field_browsable='2')))");
	$profile_query = "se_users.user_username LIKE '%$search_text%'";
    
	// LOOP OVER FIELDS
	while($field_info = $database->database_fetch_assoc($fields)) {
    
	  // TEXT FIELD OR TEXTAREA
	  if($field_info[field_type] == 1 | $field_info[field_type] == 2) {
	    if($profile_query != "") { $profile_query .= " OR "; }
	    $profile_query .= "se_profiles.profile_".$field_info[field_id]." LIKE '%$search_text%'";

	  // RADIO OR SELECT BOX
	  } elseif($field_info[field_type] == 3 | $field_info[field_type] == 4) {
	    // LOOP OVER FIELD OPTIONS
	    $options = explode("<~!~>", $field_info[field_options]);
	    for($i=0,$max=count($options);$i<$max;$i++) {
	      if(str_replace(" ", "", $options[$i]) != "") {
	        $option = explode("<!>", $options[$i]);
	        $option_id = $option[0];
	        $option_label = $option[1];
	        if(strpos($option_label, $search_text)) {
	          if($profile_query != "") { $profile_query .= " OR "; }
	          $profile_query .= "se_profiles.profile_".$field_info[field_id]."='$option_id'";
	        }
	      }
	    }
	  }
	}

	// CONSTRUCT QUERY
	$profile_query = "SELECT se_users.user_id, se_users.user_username, se_users.user_photo FROM se_profiles LEFT JOIN se_users ON se_profiles.profile_user_id=se_users.user_id LEFT JOIN se_levels ON se_levels.level_id=se_users.user_level_id WHERE se_users.user_verified='1' AND se_users.user_enabled='1' AND (se_users.user_privacy_search='1' OR se_levels.level_profile_search='0') AND ($profile_query)";

	// GET TOTAL PROFILES
	$total_profiles = $database->database_num_rows($database->database_query($profile_query." LIMIT 201"));

	// IF NOT TOTAL ONLY
	if($total_only == 0) {

	  // MAKE PROFILE PAGES
	  $start = ($p - 1) * $results_per_page;
	  $limit = $results_per_page+1;

	  // SEARCH PROFILES
	  $online_users_array = online_users();
	  $profiles = $database->database_query($profile_query." ORDER BY se_users.user_id DESC LIMIT $start, $limit");
	  while($profile_info = $database->database_fetch_assoc($profiles)) {

	    // CREATE AN OBJECT FOR USER
	    $profile = new se_user();
	    $profile->user_info[user_id] = $profile_info[user_id];
	    $profile->user_info[user_username] = $profile_info[user_username];
	    $profile->user_info[user_photo] = $profile_info[user_photo];

	    // DETERMINE IF USER IS ONLINE
	    if(in_array($profile_info[user_username], $online_users_array)) { $is_online = 1; } else { $is_online = 0; }

	    $results[] = Array('result_url' => $url->url_create('profile', $profile_info[user_username]),
			       'result_icon' => '',
			       'result_name' => $profile_info[user_username].$functions_general[9],
			       'result_desc' => '',
			       'result_user' => $profile,
			       'result_online' => $is_online);
	  }

	  // SET TOTAL RESULTS
	  $total_results = $total_profiles;

	}

	// SET ARRAY VALUES
	if($total_profiles > 200) { $total_profiles = "200+"; }
	$search_objects[] = Array('search_type' => '0',
				'search_item' => $functions_general[8],
				'search_total' => $total_profiles);


} // END search_profile() FUNCTION









// THIS FUNCTION RETURNS TIME IN SECONDS WITH MICROSECONDS
// INPUT:
// OUTPUT: RETURNS THE TIME IN SECONDS WITH MICROSECONDS
function getmicrotime() {
	list($usec, $sec) = explode(" ",microtime());
	return ((float)$usec + (float)$sec);
} // END getmicrotime() FUNCTION




// THIS FUNCTION LOOKS FOR LONG SUBSTRINGS AND CHOPS THEM
// INPUT: $text REPRESENTING THE STRING TO SEARCH THROUGH
// INPUT: $size (OPTIONAL) REPRESENTING THE NUMBER OF CHARS UNTIL A CHOP OCCURS
// OUTPUT: CHOPPED STRING
function ChopText($text, $size = 50) {
    $new_text = '';
    $text_1 = explode('>',$text);
    $sizeof = sizeof($text_1);
    for ($i=0; $i<$sizeof; ++$i) {
        $text_2 = explode('<',$text_1[$i]);
        if (!empty($text_2[0])) {
            $new_text .= preg_replace('#([^\n\r ]{'. $size .'})#i', '\\1 <br>', $text_2[0]);
        }
        if (!empty($text_2[1])) {
            $new_text .= '<' . $text_2[1] . '>';  
        }
    }
    return $new_text;
} // END ChopText() FUNCTION

?>