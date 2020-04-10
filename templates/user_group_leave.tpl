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
<div class='page_header'>{$user_group_leave4} <a href='group.php?group_id={$group->group_info.group_id}'>{$group->group_info.group_title}</a></div>
<div>{$user_group_leave5}</div>

<br>

{* SHOW WARNING THAT GROUP WILL BE DELETED IF USER IS THE OWNER *}
{if $group->user_rank == 2}
  <br>
  <table cellpadding='0' cellspacing='0'>
  <tr><td class='result' style='text-align: left;'>
    {$user_group_leave6}
    <a href='user_group_edit_members.php?group_id={$group->group_info.group_id}'>{$user_group_leave7}</a>
    {$user_group_leave8}
  </td></tr></table>
{/if}

<br>

<table cellpadding='0' cellspacing='0'>
<tr>
<td>
  <form action='user_group_leave.php' method='post'>
  <input type='submit' class='button' value='{$user_group_leave9}'>&nbsp;
  <input type='hidden' name='group_id' value='{$group->group_info.group_id}'>
  <input type='hidden' name='task' value='doleave'>
  </form>
</td>
<td>
  <form action='user_group.php' method='post'>
  <input type='submit' class='button' value='{$user_group_leave10}'>
  </form>
</td>
</tr>
</table>

</td></tr></table>
</div></div></div>
{include file='footer.tpl'}