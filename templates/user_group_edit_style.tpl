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
        <li><a href="user_group_edit_members.php?group_id={$group->group_info.group_id}" style="width:6em">Участники</a></li>
        <li><a href="user_group_edit_invite.php?group_id={$group->group_info.group_id}" style="width:7em">Приглашения</a></li>
        <li><a href="user_group_edit_files.php?group_id={$group->group_info.group_id}" style="width:3.5em">Фото</a></li>
        <li><a href="user_group_edit_comments.php?group_id={$group->group_info.group_id}" style="width:7em">Комментарии</a></li>
        {if $group->groupowner_level_info.level_group_style == 1}<li class="activeLink"><a href="user_group_edit_style.php?group_id={$group->group_info.group_id}" style="width:7.5em">Стиль группы</a></li>{/if}
        {if $group->user_rank == 2}<li><a href="user_group_edit_delete.php?group_id={$group->group_info.group_id}" style="width:4.5em">Удалить</a></li>{/if}
       </ul>
    </div>

<div>
   <img src='./images/icons/group_edit48.gif' border='0' class='icon_big'>
   <div class='page_header'>{$user_group_edit_style10} <a href='group.php?group_id={$group->group_info.group_id}'>{$group->group_info.group_title|truncate:30:"...":true}</a></div>
   {$user_group_edit_style11}
</div>

<br>

{* SHOW SUCCESS MESSAGE *}
{if $result != 0}
  <br>
  <table cellpadding='0' cellspacing='0'><tr>
  <td class='result'><img src='./images/success.gif' border='0' class='icon'> {$user_group_edit_style1}</div></td>
  </tr></table>
{/if}

<br>

<form action='user_group_edit_style.php' method='POST'>
<textarea name='style_group' rows='17' cols='50' style='width: 100%; font-family: courier, serif;'>{$style_group}</textarea>
<br>
<br>
<input type='submit' class='button' value='{$user_group_edit_style12}'>
<input type='hidden' name='group_id' value='{$group->group_info.group_id}'>
<input type='hidden' name='task' value='dosave'>
</form>


{include file='footer.tpl'}