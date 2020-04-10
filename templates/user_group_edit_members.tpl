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
   <img src='./images/icons/group48.gif' border='0' class='icon_big'>
   <div class='page_header'>{$user_group_edit_members9} <a href='group.php?group_id={$group->group_info.group_id}'>{$group->group_info.group_title|truncate:30:"...":true}</a></div>
   {$user_group_edit_members10}
</div>

<br><br>

<form action='user_group_edit_members.php' method='POST'>
<table cellpadding='0' cellspacing='0' align='center' width='100%'>
<tr>
<td align='center'>
<div class='friends_search' align='center'>
  <table cellpadding='0' cellspacing='0' align='center'>
  <tr>
  <td nowrap='nowrap'>{$user_group_edit_members34}</td>
  <td nowrap='nowrap'>
    &nbsp;
    <select name='search_rank'>
    <option value='0'{if $search_rank == 0} SELECTED{/if}>{$user_group_edit_members11}</option>
    <option value='1'{if $search_rank == 1} SELECTED{/if}>{$user_group_edit_members12}</option>
    </select>
  </td>
  <td nowrap='nowrap'>
    &nbsp;<input type='text' maxlength='100' class='search' name='search' value='{$search}'>&nbsp;
  </td>
  <td nowrap='nowrap'>
    <input type='submit' class='button' value='{$user_group_edit_members13}'>
    <input type='hidden' name='p' value='{$p}'>
    <input type='hidden' name='group_id' value='{$group->group_info.group_id}'>
  </td>
  </tr>
  <tr>
  <td nowrap='nowrap'>{$user_group_edit_members14}</td>
  <td nowrap='nowrap' colspan='3'>
    &nbsp;
    <select name='s' class='small'>
    <option value='{$u}'{if $s == "ud"} SELECTED{/if}>{$user_group_edit_members15}</option>
    <option value='{$l}'{if $s == "ld"} SELECTED{/if}>{$user_group_edit_members16}</option>
    <option value='{$t}'{if $s == "t"} SELECTED{/if}>{$user_group_edit_members17}</option>
    <option value='{$r}'{if $s == "r"} SELECTED{/if}>{$user_group_edit_members18}</option>
    </select>
  </td>
  </tr>
  </table>
  </form>
</div>
</td>
</tr>
</table>

{* DISPLAY PAGINATION MENU IF APPLICABLE *}
{if $maxpage > 1}
  <br>
  <div class='center'>
  {if $p != 1}<a href='user_group_edit_members.php?group_id={$group->group_info.group_id}&s={$s}&search={$search}&p={math equation='p-1' p=$p}'>&#171; {$user_group_edit_members19}</a>{else}<font class='disabled'>&#171; {$user_group_edit_members19}</font>{/if}
  {if $p_start == $p_end}
    &nbsp;|&nbsp; {$user_group_edit_members20} {$p_start} {$user_group_edit_members21} {$total_members} &nbsp;|&nbsp; 
  {else}
    &nbsp;|&nbsp; {$user_group_edit_members22} {$p_start}-{$p_end} {$user_group_edit_members21} {$total_members} &nbsp;|&nbsp; 
  {/if}
  {if $p != $maxpage}<a href='user_group_edit_members.php?group_id={$group->group_info.group_id}&s={$s}&search={$search}&p={math equation='p+1' p=$p}'>{$user_group_edit_members23} &#187;</a>{else}<font class='disabled'>{$user_group_edit_members23} &#187;</font>{/if}
  </div>
{/if}
  
<br>
 
{section name=member_loop loop=$members}
  <div class='group_member'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td class='group_member0'><a href='{$url->url_create('profile', $members[member_loop].member->user_info.user_username)}'><img src='{$members[member_loop].member->user_photo('./images/nophoto.gif')}' class='photo' width='{$misc->photo_size($members[member_loop].member->user_photo('./images/nophoto.gif'),'90','90','w')}' border='0'></a></td>
  <td class='group_member1' width='100%'>
    <div><font class='big'><img src='./images/icons/user16.gif' border='0' class='icon'><a href='{$url->url_create('profile', $members[member_loop].member->user_info.user_username)}'>{$members[member_loop].member->user_info.user_username}</a></font></div><br>
    <table cellpadding='0' cellspacing='0'>
    {if $members[member_loop].member->user_info.user_dateupdated != "0"}<tr><td>{$user_group_edit_members24} &nbsp;</td><td>{$datetime->time_since($members[member_loop].member->user_info.user_dateupdated)}</td></tr>{/if}
    {if $members[member_loop].member->user_info.user_lastlogindate != "0"}<tr><td>{$user_group_edit_members25} &nbsp;</td><td>{$datetime->time_since($members[member_loop].member->user_info.user_lastlogindate)}</td></tr>{/if}
    <tr><td>{$user_group_edit_members26} &nbsp;</td><td>{if $members[member_loop].groupmember_rank == 2}{$user_group_edit_members27}{elseif $members[member_loop].groupmember_rank == 1}{$user_group_edit_members28}{else}{$user_group_edit_members29}{/if}</td></tr>
    {if $members[member_loop].groupmember_title != ""}<tr><td>{$user_group_edit_members30} &nbsp;</td><td>{$members[member_loop].groupmember_title}</td></tr>{/if}
    </table>
  </td>
  <td class='group_member2' NOWRAP>

  {* IF MEMBER HAS A LOWER RANK OR USER IS OWNER, SHOW EDIT AND REMOVE LINKS *}
  {if $group->user_rank > $members[member_loop].groupmember_rank OR $group->user_rank == 2}
    <a href='user_group_edit_member.php?group_id={$group->group_info.group_id}&member_id={$members[member_loop].groupmember_id}'>{$user_group_edit_members31}</a><br>
    {if $members[member_loop].member->user_info.user_id != $user->user_info.user_id}
      <a href='user_group_edit_members_remove.php?group_id={$group->group_info.group_id}&member_id={$members[member_loop].groupmember_id}'>{$user_group_edit_members32}</a><br>
    {/if}
  {/if}

  {* SHOW SEND MESSAGE LINK IF USER IS NOT LOOKING AT HIMSELF *}
  {if $members[member_loop].member->user_info.user_id != $user->user_info.user_id}
    <a href='user_messages_new.php?to={$members[member_loop].member->user_info.user_username}'>{$user_group_edit_members33}</a><br>
  {/if}

  </td>
  </tr>
  </table>
  </div>
{/section}
 
{* DISPLAY PAGINATION MENU IF APPLICABLE *}
{if $maxpage > 1}
  <br>
  <div class='center'>
  {if $p != 1}<a href='user_group_edit_members.php?group_id={$group->group_info.group_id}&s={$s}&search={$search}&p={math equation='p-1' p=$p}'>&#171; {$user_group_edit_members19}</a>{else}<font class='disabled'>&#171; {$user_group_edit_members19}</font>{/if}
  {if $p_start == $p_end}
    &nbsp;|&nbsp; {$user_group_edit_members20} {$p_start} {$user_group_edit_members21} {$total_members} &nbsp;|&nbsp; 
  {else}
    &nbsp;|&nbsp; {$user_group_edit_members22} {$p_start}-{$p_end} {$user_group_edit_members21} {$total_members} &nbsp;|&nbsp; 
  {/if}
  {if $p != $maxpage}<a href='user_group_edit_members.php?group_id={$group->group_info.group_id}&s={$s}&search={$search}&p={math equation='p+1' p=$p}'>{$user_group_edit_members23} &#187;</a>{else}<font class='disabled'>{$user_group_edit_members23} &#187;</font>{/if}
  </div>
{/if}

</td></tr></table>

{include file='footer.tpl'}