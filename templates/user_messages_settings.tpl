{include file='header.tpl'}

<table class='tabs' cellpadding='0' cellspacing='0'>
<tr>
<td class='tab0'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='user_messages.php'>{$user_messages_settings1}</a></td>
<td class='tab'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='user_messages_outbox.php'>{$user_messages_settings2}</a></td>
<td class='tab'>&nbsp;</td>
<td class='tab1' NOWRAP><a href='user_messages_settings.php'>{$user_messages_settings3}</a></td>
<td class='tab3'>&nbsp;</td>
</tr>
</table>

<img src='./images/icons/messages48.gif' border='0' class='icon_big'>
<div class='page_header'>{$user_messages_settings4}</div>
<div>{$user_messages_settings5}</div>

<br>

{* SHOW SUCCESS MESSAGE *}
{if $result != 0}
  <table cellpadding='0' cellspacing='0'><tr><td class='result'>
  <div class='success'><img src='./images/success.gif' border='0' class='icon'> {$user_messages_settings6}</div>
  </td></tr></table>
{/if}

<br>

<form action='user_messages_settings.php' method='POST'>

<div><b>{$user_messages_settings7}</b></div>
<div class='form_desc'>{$user_messages_settings8}</div>
<table cellpadding='0' cellspacing='0'>
<tr><td><input type='checkbox' value='1' id='message' name='usersetting_notify_message'{if $user->usersetting_info.usersetting_notify_message == 1} CHECKED{/if}></td><td><label for='message'>{$user_messages_settings9}</label></td></tr>
</table>
<br>

<input type='submit' class='button' value='{$user_messages_settings10}'>
<input type='hidden' name='task' value='dosave'>
</form>


{include file='footer.tpl'}