{include file='header.tpl'}

  <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1> Мои группы</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">
    <div class="clearFix tBar">
     <ul class="tabs" id="friendTabs" style="width:550px;float:left;">
	  <li><a href="user_group.php" style="width:7em">Мои группы</a></li>
        <li><a href="user_group_invites.php" style="width:11em">Приглашения группы</a></li>
        <li  class="activeLink"><a href="user_group_settings.php" style="width:10.5em">Настройки группы</a></li>
        <li><a href="user_group_browse.php" style="width:7em">Обзор групп</a></li>
     </ul>
    </div>

<img src='./images/icons/group48.gif' border='0' class='icon_big'>
<div class='page_header'>{$user_group_settings5}</div>
<div>{$user_group_settings6}</div>

<br>

{* SHOW SUCCESS MESSAGE *}
{if $result != 0}
  <table cellpadding='0' cellspacing='0'><tr><td class='result'>
  <div class='success'><img src='./images/success.gif' border='0' class='icon'> {$user_group_settings7}</div>
  </td></tr></table>
{/if}

<br>

<form action='user_group_settings.php' method='POST'>

<div><b>{$user_group_settings9}</b></div>
<div class='form_desc'>{$user_group_settings10}</div>
<table cellpadding='0' cellspacing='0'>
<tr><td><input type='checkbox' value='1' id='groupinvite' name='usersetting_notify_groupinvite'{if $user->usersetting_info.usersetting_notify_groupinvite == 1} CHECKED{/if}></td><td><label for='groupinvite'>{$user_group_settings11}</label></td></tr>
</table>

{* ONLY DISPLAY IF USER CAN CREATE GROUPS *}
{if $user->level_info.level_group_allow != 0}
  <table cellpadding='0' cellspacing='0'>
  <tr><td><input type='checkbox' value='1' id='groupcomment' name='usersetting_notify_groupcomment'{if $user->usersetting_info.usersetting_notify_groupcomment == 1} CHECKED{/if}></td><td><label for='groupcomment'>{$user_group_settings12}</label></td></tr>
  </table>
  <table cellpadding='0' cellspacing='0'>
  <tr><td><input type='checkbox' value='1' id='groupmediacomment' name='usersetting_notify_groupmediacomment'{if $user->usersetting_info.usersetting_notify_groupmediacomment == 1} CHECKED{/if}></td><td><label for='groupmediacomment'>{$user_group_settings13}</label></td></tr>
  </table>
  <table cellpadding='0' cellspacing='0'>
  <tr><td><input type='checkbox' value='1' id='groupmemberrequest' name='usersetting_notify_groupmemberrequest'{if $user->usersetting_info.usersetting_notify_groupmemberrequest == 1} CHECKED{/if}></td><td><label for='groupmemberrequest'>{$user_group_settings14}</label></td></tr>
  </table>
{/if}

<br>

<input type='submit' class='button' value='{$user_group_settings8}'>
<input type='hidden' name='task' value='dosave'>
</form>
</div></div></div>

{include file='footer.tpl'}