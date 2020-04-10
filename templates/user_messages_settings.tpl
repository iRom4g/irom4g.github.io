{include file='header.tpl'}

  <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1> Мои сообщения -> Настройки</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">

    <div class="clearFix tBar">
     <ul class="tabs">
      <li ><a href="user_messages.php" style="width:7em">{$user_messages_settings1}</a></li>
      <li ><a href="user_messages_outbox.php" style="width:12em">{$user_messages_settings2}</a></li>
      <li class="activeLink"><a href="user_messages_settings.php" style="width:11em">{$user_messages_settings3}</a></li>
     </ul>
    </div>

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