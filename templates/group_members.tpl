{include file='header.tpl'}

  <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1>Просмотр участников</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">

<table class='tabs' cellpadding='0' cellspacing='0' width='100%'>
<tr><td class='tab0'>&nbsp;</td></tr>
</table>

<table cellpadding='0' cellspacing='0' width='100%'><tr><td class='page'>

<img src='./images/icons/search48.gif' border='0' class='icon_big'>
<div class='page_header'>{$group_members1} <a href='group.php?group_id={$group->group_info.group_id}'>{$group->group_info.group_title}</a></div>
<div>{$group_members2} "<a href='group.php?group_id={$group->group_info.group_id}'>{$group->group_info.group_title}</a>"</div>

<br>

{* DISPLAY PAGINATION MENU IF APPLICABLE *}
{if $maxpage > 1}
  <br>
  <div class='center'>
  {if $p != 1}<a href='group_members.php?group_id={$group->group_info.group_id}&p={math equation='p-1' p=$p}'>&#171; {$group_members3}</a>{else}<font class='disabled'>&#171; {$group_members3}</font>{/if}
  {if $p_start == $p_end}
    &nbsp;|&nbsp; {$group_members4} {$p_start} {$group_members5} {$total_members} &nbsp;|&nbsp; 
  {else}
    &nbsp;|&nbsp; {$group_members6} {$p_start}-{$p_end} {$group_members5} {$total_members} &nbsp;|&nbsp; 
  {/if}
  {if $p != $maxpage}<a href='group_members.php?group_id={$group->group_info.group_id}&p={math equation='p+1' p=$p}'>{$group_members7} &#187;</a>{else}<font class='disabled'>{$group_members7} &#187;</font>{/if}
  </div>
{/if}
  
<br>

{* LIST memberS *}
{section name=member_loop loop=$members}
  <div class='browse_friends_result'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td class='browse_friends_result0'><a href='{$url->url_create('profile', $members[member_loop].member->user_info.user_username)}'><img src='{$members[member_loop].member->user_photo('./images/nophoto.gif')}' class='photo' width='{$misc->photo_size($members[member_loop].member->user_photo('./images/nophoto.gif'),'90','90','w')}' border='0'></a></td>
  <td class='browse_friends_result1' width='100%' valign='top'>
    <table cellpadding='0' cellspacing='0'>
    <tr><td width='100'>{$group_members8}</td><td><a href='{$url->url_create('profile', $members[member_loop].member->user_info.user_username)}'>{$members[member_loop].member->user_info.user_username}</a></td></tr>
    {if $members[member_loop].member->user_info.user_dateupdated != "0"}<tr><td>{$group_members9}</td><td>{$datetime->time_since($members[member_loop].member->user_info.user_dateupdated)}</td></tr>{/if}
    {if $members[member_loop].member->user_info.user_lastlogindate != "0"}<tr><td>{$group_members10}</td><td>{$datetime->time_since($members[member_loop].member->user_info.user_lastlogindate)}</td></tr>{/if}
    </table>
  </td>
  <td class='browse_friends_result2' valign='top' nowrap='nowrap'>
    <a href='{$url->url_create('profile', $members[member_loop].member->user_info.user_username)}'>{$group_members11}</a>
    <br><a href='user_friends_add.php?user={$members[member_loop].member->user_info.user_username}'>{$group_members12}</a>
    <br><a href='user_messages_new.php?to={$members[member_loop].member->user_info.user_username}'>{$group_members13}</a>
  </td>
  </tr>
  </table>
  </div>
{/section}
 
{* DISPLAY PAGINATION MENU IF APPLICABLE *}
{if $maxpage > 1}
  <br>
  <div class='center'>
  {if $p != 1}<a href='group_members.php?group_id={$group->group_info.group_id}&p={math equation='p-1' p=$p}'>&#171; {$group_members3}</a>{else}<font class='disabled'>&#171; {$group_members3}</font>{/if}
  {if $p_start == $p_end}
    &nbsp;|&nbsp; {$group_members4} {$p_start} {$group_members5} {$total_members} &nbsp;|&nbsp; 
  {else}
    &nbsp;|&nbsp; {$group_members6} {$p_start}-{$p_end} {$group_members5} {$total_members} &nbsp;|&nbsp; 
  {/if}
  {if $p != $maxpage}<a href='group_members.php?group_id={$group->group_info.group_id}&p={math equation='p+1' p=$p}'>{$group_members7} &#187;</a>{else}<font class='disabled'>{$group_members7} &#187;</font>{/if}
  </div>
{/if}

</td></tr></table>



{include file='footer.tpl'}