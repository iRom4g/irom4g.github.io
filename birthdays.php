<?
$page = 'birthdays';
include 'header.php';

if ($user->user_exists == 0)
{
		header('Location: home.php');
		exit;
}

// BIRTHDAYS by PASSTOR
include 'include/class_birthdays.php';
$bday = new Birthdays;
$t_flag = $bday -> IsUserBirthday($user->user_info[user_id]);
$t_arr = $bday -> ShowTodayUsers(1);

foreach($t_arr as $t_uid)
{
		$t_info = $bday -> GetProfile($t_uid);
		$t_user = new se_user();
		$t_user -> user_info[user_id] = $t_uid;
		$t_user -> user_info[user_username] = $t_info['user_username'];
		$t_user -> user_info[user_photo] = $t_info['user_photo'];
		$today_users_array[] = array('user' => $t_user, 'date' => $t_info['date']);
}
$t_arr_2 = $bday -> ShowTomorrowUsers(1);

foreach($t_arr_2 as $t_uid)
{
		$t_info = $bday -> GetProfile($t_uid);
		$t_user = new se_user();
		$t_user -> user_info[user_id] = $t_uid;
		$t_user -> user_info[user_username] = $t_info['user_username'];
		$t_user -> user_info[user_photo] = $t_info['user_photo'];
		$tomorrow_users_array[] = array('user' => $t_user, 'date' => $t_info['date']);
}
$t_arr_3= $bday -> ShowWeekUsers(1);

foreach($t_arr_3 as $t_uid)
{
		$t_info = $bday -> GetProfile($t_uid);
		$t_user = new se_user();
		$t_user -> user_info[user_id] = $t_uid;
		$t_user -> user_info[user_username] = $t_info['user_username'];
		$t_user -> user_info[user_photo] = $t_info['user_photo'];
		$week_users_array[] = array('user' => $t_user, 'date' => $t_info['date']);
}
$t_arr_4 = $bday -> ShowMonUsers(1);

foreach($t_arr_4 as $t_uid)
{
		$t_info = $bday -> GetProfile($t_uid);
		$t_user = new se_user();
		$t_user -> user_info[user_id] = $t_uid;
		$t_user -> user_info[user_username] = $t_info['user_username'];
		$t_user -> user_info[user_photo] = $t_info['user_photo'];
		$mon_users_array[] = array('user' => $t_user, 'date' => $t_info['date']);
}


// ASSIGN SMARTY VARS AND INCLUDE FOOTER
$smarty->assign('today_users', $today_users_array);
$smarty->assign('tomorrow_users', $tomorrow_users_array);
$smarty->assign('week_users', $week_users_array);
$smarty->assign('month_users', $mon_users_array);
include 'footer.php';
?>