<?
$page = "user_group";
include "header.php";

// Hack by Passtor //
$uid = $user->user_info[user_id];
$result = $database -> database_query("SELECT `profile_36` FROM `se_profiles` WHERE `profile_user_id` = '$uid'");

if($result != FALSE)
{
		$t_arr = $database -> database_fetch_array($result);
		$group_name = $t_arr[0];
		$group_name = trim($group_name);

		if($group_name != '')
		{
				$group_title = censor($group_name);
				$result = $database -> database_query("SELECT `group_id` FROM `se_groups` WHERE `group_title` LIKE '%$group_title%'");
				$rows = $database -> database_num_rows($result);
				//echo 'rows:', $rows, '<br>';

				if($rows == 0)
				{
						//echo 'new group.<br>';
						$new_group = new se_group($user->user_info[user_id], 0);
						$group_desc = '';
						$group_privacy = true_privacy(0, $user->level_info[level_group_privacy]);
						$group_comments = true_privacy(0, $user->level_info[level_group_comments]);
						$group_search = 1;
						$groupcat_id = 0;
						$subgroupcat_id = 0;
						$group_approval = 1;

						if ($group_privacy == '')
						{
								$group_privacy = true_privacy(0, $user->level_info[level_group_privacy]);
						}

						if ($group_comments == '')
						{
								$group_comments = true_privacy(0, $user->level_info[level_group_comments]);
						}

						if ($user->level_info[level_group_search] == 0)
						{
								$group_search = 1;
						}

						if ($subgroupcat_id != 0)
						{
								$groupcat_id = $subgroupcat_id;
						}
						$new_group->group_create($group_title, $group_desc, $groupcat_id, $group_search, $group_privacy, $group_comments, $group_approval);
				}
				else
				{
						list($group_id) = $database -> database_fetch_array($result);
						//echo "group exist # $group_id <br>";
						$member_query = $database->database_query("SELECT groupmember_id, groupmember_rank, groupmember_status FROM se_groupmembers WHERE groupmember_group_id='".$group_id."' AND groupmember_user_id='".$uid."' LIMIT 1");

						if($database->database_num_rows($member_query) == 1)
						{
								$member_info = $database->database_fetch_assoc($member_query);

								if($member_info[groupmember_status] != 1)
								{
										$database->database_query("INSERT INTO se_groupmembers (groupmember_user_id, groupmember_group_id, groupmember_status, groupmember_approved, groupmember_rank) VALUES ( '" . $uid . "', '" . $group_id . "', '1', '1', '0')");
								}
						}
						else
						{
								//echo "add member <br>";
								$database->database_query("INSERT INTO se_groupmembers (groupmember_user_id, groupmember_group_id, groupmember_status, groupmember_approved, groupmember_rank) VALUES ( '" . $uid . "', '" . $group_id . "', '1', '1', '0')");
						}
				}
		}
}
// End of hack//




// GET RECENT ACTIVITY (ACTIONS)
$actions = $actions->actions_display();
// GET FRIENDS LIST
$friends = $user->user_friend_list(0, 5, 0, 1, "RAND()");
$total_friends = $user->user_friend_total();
$smarty->assign('friends', $friends);
$smarty->assign('total_friends', $total_friends);



$group = new se_group($user->user_info[user_id]);
$sort_by = "se_groupmembers.groupmember_rank DESC, se_groups.group_title";
$where = "(se_groupmembers.groupmember_status='1')";
$total_groups = $group->group_total($where);
$group_array = $group->group_list(0, $total_groups, $sort_by, $where, 1);
$smarty->assign('groups', $group_array);
$smarty->assign('total_groups', $total_groups);
$smarty->assign('notifications', $notifications);
$smarty->assign('total_friends', $total_friends);
$smarty->assign('total_friend_requests', $total_friend_requests);
$smarty->assign('news', $news_array);
$smarty->assign('news_total', $news_count);
$smarty->assign('actions', $actions);
$smarty->assign('online_users', online_users());
include "footer.php";
?>