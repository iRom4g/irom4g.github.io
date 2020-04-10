{include file='header.tpl'}

  <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1>{$event->event_info.event_title}</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">

<img src='./images/icons/search48.gif' border='0' class='icon_big'>
<div class='page_header'>{$event_members1} <a href='event.php?event_id={$event->event_info.event_id}'>{$event->event_info.event_title}</a></div>
<div>{$event_members2} "<a href='event.php?event_id={$event->event_info.event_id}'>{$event->event_info.event_title}</a>"</div>

<br><br>

<table cellpadding='0' cellspacing='0' align='center'>
<tr>
<td align='right'>{$event_members17}&nbsp;</td>
<td>
  <form action='event_members.php' method='post' name='status'>
  <select name='status' class='small' onChange='document.status.submit();'>
  <option value=''{if $status == ""} SELECTED{/if}>{$event_members18}</option>
  <option value='1'{if $status == "1"} SELECTED{/if}>{$event_members19}</option>
  <option value='2'{if $status == "2"} SELECTED{/if}>{$event_members20}</option>
  <option value='3'{if $status == "3"} SELECTED{/if}>{$event_members21}</option>
  <option value='0'{if $status == "0"} SELECTED{/if}>{$event_members22}</option>
  </select>
  <input type='hidden' name='event_id' value='{$event->event_info.event_id}'>
  </form>
</td>
</tr>
</table>

{* DISPLAY PAGINATION MENU IF APPLICABLE *}
{if $maxpage > 1}
  <br>
  <table cellpadding='0' cellspacing='0' width='100%'>
  <tr>
  <td align='center'>
  {if $p != 1}<a href='event_members.php?event_id={$event->event_info.event_id}&p={math equation='p-1' p=$p}'>&#171; {$event_members3}</a>{else}<font class='disabled'>&#171; {$event_members3}</font>{/if}
  {if $p_start == $p_end}
    &nbsp;|&nbsp; {$event_members4} {$p_start} {$event_members5} {$total_members} &nbsp;|&nbsp; 
  {else}
    &nbsp;|&nbsp; {$event_members6} {$p_start}-{$p_end} {$event_members5} {$total_members} &nbsp;|&nbsp; 
  {/if}
  {if $p != $maxpage}<a href='event_members.php?event_id={$event->event_info.event_id}&p={math equation='p+1' p=$p}'>{$event_members7} &#187;</a>{else}<font class='disabled'>{$event_members7} &#187;</font>{/if}
  </td>
  </tr>
  </table>
{/if}
  
<br>

{* LIST MEMBERS *}
{section name=member_loop loop=$members}
  <div class='browse_events_result'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td class='browse_events_result0'><a href='{$url->url_create('profile', $members[member_loop].member->user_info.user_username)}'><img src='{$members[member_loop].member->user_photo('./images/nophoto.gif')}' class='photo' width='{$misc->photo_size($members[member_loop].member->user_photo('./images/nophoto.gif'),'90','90','w')}' border='0'></a></td>
  <td class='browse_events_result1' width='100%' valign='top'>
    <div style='margin-bottom: 5px;'><img src='./images/icons/user16.gif' border='0' class='icon'><font class='big'><a href='{$url->url_create('profile', $members[member_loop].member->user_info.user_username)}'>{$members[member_loop].member->user_info.user_username}</a></font></div>
    <table cellpadding='0' cellspacing='0'>
    {if $members[member_loop].member->user_info.user_dateupdated != "0"}<tr><td>{$event_members9}</td><td>{$datetime->time_since($members[member_loop].member->user_info.user_dateupdated)}</td></tr>{/if}
    {if $members[member_loop].member->user_info.user_lastlogindate != "0"}<tr><td>{$event_members10}</td><td>{$datetime->time_since($members[member_loop].member->user_info.user_lastlogindate)}</td></tr>{/if}
    <tr><td width='100'>{$event_members25}</td><td>
      {if $members[member_loop].eventmember_status == 1}{$event_members19}
      {elseif $members[member_loop].eventmember_status == 2}{$event_members20}
      {elseif $members[member_loop].eventmember_status == 3}{$event_members21}
      {elseif $members[member_loop].eventmember_status == 0}{$event_members22}
      {/if}
    </td></tr>
    </table>
  </td>
  <td class='browse_events_result2' valign='top' nowrap='nowrap'>
    <a href='{$url->url_create('profile', $members[member_loop].member->user_info.user_username)}'>{$event_members11}</a>
    <br><a href='user_friends_add.php?user={$members[member_loop].member->user_info.user_username}'>{$event_members12}</a>
    <br><a href='user_messages_new.php?to={$members[member_loop].member->user_info.user_username}'>{$event_members13}</a>
  </td>
  </tr>
  </table>
  </div>
{sectionelse}
  {* DISPLAY MESSAGE IF NO GUESTS *}
  <br>
  <table cellpadding='0' cellspacing='0' align='center'>
  <tr><td class='result'>
    <img src='./images/icons/bulb16.gif' border='0' class='icon'>{$event_members24}
  </td></tr>
  </table>

{/section}
 
{* DISPLAY PAGINATION MENU IF APPLICABLE *}
{if $maxpage > 1}
  <br>
  <table cellpadding='0' cellspacing='0' width='100%'>
  <tr>
  <td align='center'>
  {if $p != 1}<a href='event_members.php?event_id={$event->event_info.event_id}&p={math equation='p-1' p=$p}'>&#171; {$event_members3}</a>{else}<font class='disabled'>&#171; {$event_members3}</font>{/if}
  {if $p_start == $p_end}
    &nbsp;|&nbsp; {$event_members4} {$p_start} {$event_members5} {$total_members} &nbsp;|&nbsp; 
  {else}
    &nbsp;|&nbsp; {$event_members6} {$p_start}-{$p_end} {$event_members5} {$total_members} &nbsp;|&nbsp; 
  {/if}
  {if $p != $maxpage}<a href='event_members.php?event_id={$event->event_info.event_id}&p={math equation='p+1' p=$p}'>{$event_members7} &#187;</a>{else}<font class='disabled'>{$event_members7} &#187;</font>{/if}
  </td>
  </tr>
  </table>
{/if}



{include file='footer.tpl'}