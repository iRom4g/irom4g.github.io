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
	  <li><a href="user_group_edit.php?group_id={$group->group_info.group_id}" style="width:9.5em">Параметры группы</a></li>
        <li class="activeLink"><a href="user_group_edit_members.php?group_id={$group->group_info.group_id}" style="width:6em">Участники</a></li>
        <li><a href="user_group_edit_invite.php?group_id={$group->group_info.group_id}" style="width:7em">Приглашения</a></li>
        <li><a href="user_group_edit_files.php?group_id={$group->group_info.group_id}" style="width:3.5em">Фото</a></li>
        <li><a href="user_group_edit_comments.php?group_id={$group->group_info.group_id}" style="width:7em">Комментарии</a></li>
        {if $group->groupowner_level_info.level_group_style == 1}<li><a href="user_group_edit_style.php?group_id={$group->group_info.group_id}" style="width:7.5em">Стиль группы</a></li>{/if}
        {if $group->user_rank == 2}<li><a href="user_group_edit_delete.php?group_id={$group->group_info.group_id}" style="width:4.5em">Удалить</a></li>{/if}
       </ul>
    </div>
<table cellpadding='0' cellspacing='0' width='100%'><tr><td class='page'>

<div>
  <img src='./images/icons/group_delete48.gif' border='0' class='icon_big'>
  <div class='page_header'>{$user_group_edit_members_remove9}</div>
  <div>{$user_group_edit_members_remove10}</div>
</div>

<br><br>

<table cellpadding='0' cellspacing='0'>
<tr>
<td>
  <form action='user_group_edit_members_remove.php' method='post'>
  <input type='submit' class='button' value='{$user_group_edit_members_remove11}'>&nbsp;
  <input type='hidden' name='member_id' value='{$member_id}'>
  <input type='hidden' name='group_id' value='{$group->group_info.group_id}'>
  <input type='hidden' name='task' value='doremove'>
  </form>
</td>
<td>
  <form action='user_group_edit_members.php' method='get'>
  <input type='submit' class='button' value='{$user_group_edit_members_remove12}'>
  <input type='hidden' name='group_id' value='{$group->group_info.group_id}'>
  </form>
</td>
</tr>
</table>

</td></tr></table>

{include file='footer.tpl'}