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
	  <li class="activeLink"><a href="user_group.php" style="width:7em">Мои группы</a></li>
        <li><a href="user_group_invites.php" style="width:11em">Приглашения в группу</a></li>
        <li><a href="user_group_settings.php" style="width:10.5em">Настройки группы</a></li>
        <li><a href="user_group_browse.php" style="width:7em">Обзор групп</a></li>
     </ul>
    </div>

<table cellpadding='0' cellspacing='0' width='100%'><tr><td class='page'>

<img src='./images/icons/group48.gif' border='0' class='icon_big'>
<div class='page_header'>{$user_group_join7} <a href='group.php?group_id={$group->group_info.group_id}'>{$group->group_info.group_title}</a></div>
<div>{$user_group_join8}</div>

<br>

{* SHOW ERROR MESAGE *}
{if $error_message != ""}
  <br>
  <table cellpadding='0' cellspacing='0'>
  <tr><td class='result'>
    <div class='error'><img src='./images/error.gif' border='0' class='icon'> {$error_message}</div>
  </td></tr></table>
  <br>
{/if}

{* SHOW RESULT MESAGE *}
{if $result != ""}
  <br>
  <table cellpadding='0' cellspacing='0'>
  <tr><td class='result'>
    <div class='success'><img src='./images/success.gif' border='0' class='icon'> {$result}</div>
  </td></tr></table>
  <br>
{/if}

{* SHOW JOIN GROUP BUTTONS *}
{if $error_message == "" AND $result == ""}
  <br>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td>
    <form action='user_group_join.php' method='post'>
    <input type='submit' class='button' value='{$user_group_join9}'>&nbsp;
    <input type='hidden' name='group_id' value='{$group->group_info.group_id}'>
    <input type='hidden' name='task' value='dojoin'>
    </form>
  </td>
  <td>
    <form action='{$return_url}' method='post'>
    <input type='submit' class='button' value='{$user_group_join10}'>
    </form>
  </td>
  </tr>
  </table>
{else}
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td>
    <form action='group.php?group_id={$group->group_info.group_id}' method='POST'>
    <input type='submit' class='button' value='{$user_group_join11}'>
    </form>
  </td>
  </tr>
  </table>
{/if}


</td></tr></table>
</div></div></div>
{include file='footer.tpl'}