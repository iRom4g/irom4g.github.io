<?

//  THIS CLASS CONTAINS DATE/TIME-RELATED METHODS.
//  IT IS USED TO FORMAT TIMESTAMPS
//  METHODS IN THIS CLASS:
//    cdate()
//    timezone()
//    time_since()
//    age()
//    MakeTime()
//    MakeDate()





class se_datetime {

	// INITIALIZE VARIABLES
	var $is_error;			// DETERMINES WHETHER THERE IS AN ERROR OR NOT









	// THIS METHOD RETURNS A FORMATTED DATE (MULTILANGUAGE)
	// INPUT: $format REPRESENTING A DATE FORMAT BASED ON THE PHP DATE() FUNCTION FORMAT
	//	  $time (OPTIONAL) REPRESENTING A TIMESTAMP
	// OUTPUT: A STRING REPRESENTING A FORMATTED DATE BASED ON THE GIVEN TIMESTAMP
	function cdate($format, $time = "") {
	  global $multi_language;

	  if($time == "") { $time = time(); }

	  if($multi_language != "yes") {
	    return date($format, $time);
	  } else {
	    $date_letters = Array("a", "A", "B", "c", "D", "d", "F", "m", "M", "I", "i", "g", "h", "H", "G", "j", "l", "L", "n", "O", "r", "S", "s", "t", "U", "W", "w", "Y", "y", "z", "Z", "T");
	    $strftime_letters = Array("%p", "%p", "", "", "%a", "%d", "%B", "%m", "%b", "", "%M", "%I", "%I", "%H", "%H", "%e", "%A", "", "%m", "", "", "", "%S", "", "", "%V", "%w", "%Y", "%y", "%j", "", "%Z");
	    $new_format = str_replace($date_letters, $strftime_letters, $format);
	    return strftime($new_format, $time);
	  }

	} // END cdate() METHOD








	// THIS METHOD RETURNS A TIMESTAMP IN THE CORRECT TIMEZONE
	// INPUT: $time REPRESENTING A TIMESTAMP IN SERVER TIME
	//	  $timezone REPRESENTING A TIMEZONE
	// OUTPUT: A TIMESTAMP IN THE CORRECT TIMEZONE
	function timezone($time, $timezone) {

	  $time = $time-(date("Z")-(date("I")*3600));

	  switch($timezone) {
	    case -12: $new_time = $time - 43200; break;
	    case -11: $new_time = $time - 39600; break;
	    case -10: $new_time = $time - 33000; break;
	    case -9: $new_time = $time - 32400; break;
	    case -8: $new_time = $time - 28800; break;
	    case -7: $new_time = $time - 25200; break;
	    case -6: $new_time = $time - 21600; break;
	    case -5: $new_time = $time - 18000; break;
	    case -4: $new_time = $time - 14400; break;
	    case -3.3: $new_time = $time - 11880; break;
	    case -3: $new_time = $time - 10800; break;
	    case -2: $new_time = $time - 7200; break;
	    case -1: $new_time = $time - 3600; break;
	    case 0: $new_time = $time; break;
  	    case 1: $new_time = $time + 3600; break;
  	    case 2: $new_time = $time + 7200; break;
  	    case 3: $new_time = $time + 10800; break;
  	    case 3.3: $new_time = $time + 11880; break;
  	    case 4: $new_time = $time + 14400; break;
  	    case 4.3: $new_time = $time + 15480; break;
  	    case 5: $new_time = $time + 18000; break;
  	    case 5.5: $new_time = $time + 19800; break;
  	    case 6: $new_time = $time + 21600; break;
  	    case 7: $new_time = $time + 25200; break;
  	    case 8: $new_time = $time + 28800; break;
  	    case 9: $new_time = $time + 32400; break;
  	    case 9.3: $new_time = $time + 33480; break;
  	    case 10: $new_time = $time + 33000; break;
  	    case 11: $new_time = $time + 39600; break;
  	    case 12: $new_time = $time + 43200; break;
	  }

	  return $new_time;
  
	} // END timezone() METHOD








	// THIS METHOD RETURNS A STRING SPECIFYING THE TIME SINCE THE SPECIFIED TIMESTAMP
	// INPUT: $time REPRESENTING A TIMESTAMP
	// OUTPUT: A STRING SPECIFYING THE TIME SINCE THE SPECIFIED TIMESTAMP
	function time_since($time) {
	  global $class_datetime;

	  $now = time();
	  $now_day = date("j", $now);
	  $now_month = date("n", $now);
	  $now_year = date("Y", $now);

	  $time_day = date("j", $time);
	  $time_month = date("n", $time);
	  $time_year = date("Y", $time);
	  $time_since = "";

	  switch(TRUE) {
	  
	    case ($now-$time < 60):
	      // RETURNS SECONDS
	      $seconds = $now-$time;
	      $time_since = "$seconds ".$class_datetime[1];
	      break;
	    case ($now-$time < 3600):
	      // RETURNS MINUTES
	      $minutes = round(($now-$time)/60);
	      $time_since = "$minutes ".$class_datetime[2];
	      break;
	    case ($now-$time < 86400):
	      // RETURNS HOURS
	      $hours = round(($now-$time)/3600);
	      $time_since = "$hours ".$class_datetime[3];
	      break;
	    case ($now-$time < 1209600):
	      // RETURNS DAYS
	      $days = round(($now-$time)/86400);
	      $time_since = "$days ".$class_datetime[4];
	      break;
	    case (mktime(0, 0, 0, $now_month-1, $now_day, $now_year) < mktime(0, 0, 0, $time_month, $time_day, $time_year)):
	      // RETURNS WEEKS
	      $weeks = round(($now-$time)/604800);
	      $time_since = "$weeks ".$class_datetime[5];
	      break;
	    case (mktime(0, 0, 0, $now_month, $now_day, $now_year-1) < mktime(0, 0, 0, $time_month, $time_day, $time_year)):
	      // RETURNS MONTHS
	      if($now_year == $time_year) { $subtract = 0; } else { $subtract = 12; }
	      $months = round($now_month-$time_month+$subtract);
	      $time_since = "$months ".$class_datetime[6];
	      break;
	    default:
	      // RETURNS YEARS
	      if($now_month < $time_month) { 
	        $subtract = 1; 
	      } elseif($now_month == $time_month) {
	        if($now_day < $time_day) { $subtract = 1; } else { $subtract = 0; }
	      } else { 
	        $subtract = 0; 
	      }
	      $years = $now_year-$time_year-$subtract;
	      $time_since = "$years ".$class_datetime[7];
	      break;

	  }

	  if($time_since == "0 years ago") { $time_since = ""; }

	  return $time_since;
  
	} // END time_since() METHOD








	// THIS METHOD RETURNS AN AGE BASED ON A GIVEN TIMESTAMP
	// INPUT: $time REPRESENTING A TIMESTAMP
	// OUTPUT: AN INTEGER REPRESENTING AN AGE BASED ON THE TIMESTAMP
	function age($time) {

	  $now = time();
	  $now_day = date("j", $now);
	  $now_month = date("n", $now);
	  $now_year = date("Y", $now);

	  $time_day = date("j", $time);
	  $time_month = date("n", $time);
	  $time_year = date("Y", $time);

	  // RETURNS YEARS
	  if($now_month < $time_month) { 
	    $subtract = 1; 
	  } elseif($now_month == $time_month) {
	    if($now_day < $time_day) {
	      $subtract = 1;
	    } else {
	      $subtract = 0;
	    }
	  } else { 
	    $subtract = 0; 
	  }
	  $years = $now_year-$time_year-$subtract;
	  return $years;
  
	} // END age() METHOD









	// THIS METHOD MAKES A NEGATIVE TIMESTAMP
	// INPUT: SAME ARGUMENTS AS WOULD BE PASSED TO THE PHP FUNCTION mktime()
	// OUTPUT: A TIMESTAMP THAT CAN BE NEGATIVE
	function MakeTime() {
	  $objArgs = func_get_args();
	  $nCount = count($objArgs);
	  if($nCount < 7) {
	    $objDate = getdate();
	    if($nCount < 1)
	      $objArgs[] = $objDate["hours"];
	    if($nCount < 2)
	      $objArgs[] = $objDate["minutes"];
	    if($nCount < 3)
	      $objArgs[] = $objDate["seconds"];
	    if($nCount < 4)
	      $objArgs[] = $objDate["mon"];
	    if($nCount < 5)
	      $objArgs[] = $objDate["mday"];
	    if($nCount < 6)
	      $objArgs[] = $objDate["year"];
	    if($nCount < 7)
	      $objArgs[] = -1;
	  }
	  $nYear = $objArgs[5];
	  $nOffset = 0;

	  if($nYear < 1970) {
	    $nOffset = -2019686400;
	    $objArgs[5] += 64;
	    if($nYear < 1942) {
	      $objArgs[6] = 0;
	    }
	  }

	  return call_user_func_array("mktime", $objArgs) + $nOffset;
	} // END MakeTime() METHOD









	// THIS METHOD CONVERTS A NEGATIVE TIMESTAMP TO A DATE
	// INPUT: $time REPRESENTING A POSITVE OR NEGATIVE TIMESTAMP
	// OUTPUT: AN ARRAY OF VALUES REPRESENTING THE CORRESPONDING DATE
	function MakeDate($time) {
	  global $datetime;

	  $date = Array();

	  if($time < 0) {
	    $nOffset = -2019686400;
	    $time = $time - $nOffset;
	    $date[0] = $datetime->cdate("n", $time);
	    $date[1] = $datetime->cdate("j", $time);
	    $date[2] = $datetime->cdate("Y", $time)-64;
	    $date[3] = $datetime->cdate("F", $time);
	  } else {
	    $date[0] = $datetime->cdate("n", $time);
	    $date[1] = $datetime->cdate("j", $time);
	    $date[2] = $datetime->cdate("Y", $time);
	    $date[3] = $datetime->cdate("F", $time);
	  }
	  return $date;
	} // END MakeDate() METHOD

}
?>