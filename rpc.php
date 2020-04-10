<?php
header("Cache-Control: no-cache");
header("Pragma: nocache");
require('include/database_config.php');
$rating_tableName = 'se_ratings';
$rating_path_db = '';
$rating_path_rpc = '';
$rating_unitwidth = 30;
$rating_conn = mysql_connect($database_host, $database_username, $database_password) or die('Error connecting to mysql');
$vote_sent = preg_replace("/[^0-9]/", "", $_REQUEST['j']);
$id_sent = preg_replace("/[^0-9a-zA-Z]/", "", $_REQUEST['q']);
$ip_num = preg_replace("/[^0-9\.]/", "", $_REQUEST['t']);
$units = preg_replace("/[^0-9]/", "", $_REQUEST['c']);
$ip = $_SERVER['REMOTE_ADDR'];
if ($vote_sent > $units) die("Sorry, vote appears to be invalid.");
$query = mysql_query("SELECT total_votes, total_value, used_ips FROM ".$database_name.".".$rating_tableName." WHERE id='" . $id_sent . "' ") or die(" Error: " . mysql_error());
$numbers = mysql_fetch_assoc($query);
$checkIP = unserialize($numbers['used_ips']);
$count = $numbers['total_votes'];
$current_rating = $numbers['total_value'];
$sum = $vote_sent + $current_rating;
$tense = ($count == 1) ? "vote" : "votes";
($sum == 0 ? $added = 0 : $added = $count + 1);
((is_array($checkIP)) ? array_push($checkIP, $ip_num) : $checkIP = array($ip_num));
$insertip = serialize($checkIP);
$voted = mysql_num_rows(mysql_query("SELECT used_ips FROM ".$database_name.".".$rating_tableName." WHERE used_ips LIKE '%" . $ip . "%' AND id='" . $id_sent . "' "));
if (!$voted)
{
		if (($vote_sent >= 1 && $vote_sent <= $units) && ($ip == $ip_num))
		{
				$update = "UPDATE ".$database_name.".".$rating_tableName." SET total_votes='" . $added . "', total_value='" . $sum . "', used_ips='" . $insertip . "' WHERE id='" . $id_sent . "'";
				$result = mysql_query($update);
		}
}
$newtotals = mysql_query("SELECT total_votes, total_value, used_ips FROM ".$database_name.".".$rating_tableName." WHERE id='" . $id_sent . "' ") or die(" Error: " . mysql_error());
$numbers = mysql_fetch_assoc($newtotals);
$count = $numbers['total_votes'];
$current_rating = $numbers['total_value'];
$tense = ($count == 1) ? "vote" : "votes";
$new_back = array();
$new_back[] .= '<ul class="unit-rating" style="width:' . $units * $rating_unitwidth . 'px;">';
$new_back[] .= '<li class="current-rating" style="width:' . @number_format($current_rating / $count, 2) * $rating_unitwidth . 'px;">Current rating.</li>';
$new_back[] .= '<li class="r1-unit">1</li>';
$new_back[] .= '<li class="r2-unit">2</li>';
$new_back[] .= '<li class="r3-unit">3</li>';
$new_back[] .= '<li class="r4-unit">4</li>';
$new_back[] .= '<li class="r5-unit">5</li>';
$new_back[] .= '<li class="r6-unit">6</li>';
$new_back[] .= '<li class="r7-unit">7</li>';
$new_back[] .= '<li class="r8-unit">8</li>';
$new_back[] .= '<li class="r9-unit">9</li>';
$new_back[] .= '<li class="r10-unit">10</li>';
$new_back[] .= '</ul>';
$new_back[] .= '<p class="voted">' . $id_sent . '. Rating: <strong>' . @number_format($sum / $added, 1) . '</strong>/' . $units . ' (' . $count . ' ' . $tense . ' cast) ';
$new_back[] .= '<span class="thanks"><br />Thanks for voting!</span></p>';
$allnewback = join("\n", $new_back);
$output = "unit_long$id_sent|$allnewback";
echo $output;
?>