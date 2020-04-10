{include file='header.tpl'}

<table class='tabs' cellpadding='0' cellspacing='0'>
<tr>
<td class='tab0'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='user_friends.php'>{$user_friends_settings1}</a></td>
<td class='tab'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='user_friends_requests.php'>{$user_friends_settings2}</a></td>
<td class='tab'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='user_friends_requests_outgoing.php'>{$user_friends_settings11}</a></td>
<td class='tab'>&nbsp;</td>
<td class='tab1' NOWRAP><a href='user_friends_settings.php'>{$user_friends_settings3}</a></td>
<td class='tab3'>&nbsp;</td>
</tr>
</table>

<img src='./images/icons/friends48.gif' border='0' class='icon_big'>
<div class='page_header'>{$user_friends_settings4}</div>
<div>{$user_friends_settings5}</div>

<br>

{* SHOW SUCCESS MESSAGE *}
{if $result != 0}
  <table cellpadding='0' cellspacing='0'><tr><td class='result'>
  <div class='success'><img src='./images/success.gif' border='0' class='icon'> {$user_friends_settings6}</div>
  </td></tr></table>
{/if}

<br>

<form action='user_friends_settings.php' method='POST'>

<div><b>{$user_friends_settings7}</b></div>
<div class='form_desc'>{$user_friends_settings8}</div>
<table cellpadding='0' cellspacing='0'>
<tr><td><input type='checkbox' value='1' id='friendrequest' name='usersetting_notify_friendrequest'{if $user->usersetting_info.usersetting_notify_friendrequest == 1} CHECKED{/if}></td><td><label for='friendrequest'>{$user_friends_settings9}</label></td></tr>
</table>
<br>

<input type='submit' class='button' value='{$user_friends_settings10}'>
<input type='hidden' name='task' value='dosave'>
</form>


{include file='footer.tpl'}