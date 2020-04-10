{include file='header.tpl'}

  <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1> Мои встречи</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">

    <div class="clearFix tBar">
     <ul class="tabs" id="friendTabs" style="width:600px;float:left;">
	  <li ><a href="user_event_edit.php?event_id={$event->event_info.event_id}" style="width:8.5em">Детали События</a></li>
        <li class="activeLink"><a href="user_event_edit_members.php?event_id={$event->event_info.event_id}" style="width:7.5em">Приглашения</a></li>
        <li><a href="user_event_edit_files.php?event_id={$event->event_info.event_id}" style="width:6.5em">Фотографии</a></li>
        <li><a href="user_event_edit_comments.php?event_id={$event->event_info.event_id}" style="width:8em">Коментарии</a></li>
        {if $event->eventowner_level_info.level_event_style == 1}<li><a href="user_event_edit_style.php?event_id={$event->event_info.event_id}" style="width:8em">Стили События</a></li>{/if}
        <li><a href="user_event_edit_delete.php?event_id={$event->event_info.event_id}" style="width:10em">Отменить Событие</a></li>
        <li><a href="user_event.php" style="width:4em">Назад</a></li>
      </ul>
    </div>


{* JAVASCRIPT FOR ADDING MORE USERNAMES TO INVITE *}
{literal}
<script type="text/javascript">
{/literal}
<!-- Begin
var invite_username_id = 1;
{literal}
function addInput(fieldname) {
  if(invite_username_id < 30) {
    invite_username_id++;
    var ni = document.getElementById(fieldname);
    var newdiv = document.createElement('div');
    var divIdName = 'my'+invite_username_id+'Div';
    newdiv.setAttribute('id',divIdName);
    newdiv.innerHTML = "<table cellpadding='0' cellspacing='0'><tr><td class='form1' width='100'>{/literal}{$user_group_edit_invite17}{literal} </td><td class='form2'><input type='text' id='invited_username" + invite_username_id +"' name='invited_username" + invite_username_id +"' class='text' size='30' maxlength='50' onkeyup=\"suggest('invited_username" + invite_username_id +"', 'suggest" + invite_username_id +"', '{/literal}{section name=friends_loop loop=$friends}{$friends[friends_loop]->user_info.user_username}{if $smarty.section.friends_loop.last != true},{/if}{/section}{literal}');\" autocomplete='off'><br><div id='suggest" + invite_username_id +"' class='suggest'></div></td></tr></table>";
    ni.appendChild(newdiv);
    window.document.info.num_invited.value=invite_username_id;
  }
}
// End -->
</script>
{/literal}


<table cellpadding='0' cellspacing='0' width='100%'><tr><td class='page'>

<div>
   <img src='./images/icons/event48.gif' border='0' class='icon_big'>
   <div class='page_header'>{$user_event_edit_members9} <a href='event.php?event_id={$event->event_info.event_id}'>{$event->event_info.event_title|truncate:30:"...":true}</a></div>
   {$user_event_edit_members10}
</div>

<br><br>

{* SHOW POSITIVE RESULT MESSAGE *}
{if $result != ""}
  <table cellpadding='0' cellspacing='0'><tr>
  <td class='result'><img src='./images/icons/plus16.gif' border='0' class='icon'>{$result}</td>
  </tr></table>
  <br>
{/if}

<br>

{* SHOW MEMBERS REQUESTING INVITATION *}
{if $event->eventowner_level_info.level_event_inviteonly == 1 AND $event->event_info.event_inviteonly == 1 AND $unapproved|@count != 0}
  <table cellpadding='0' cellspacing='0' width='100%' style='margin-bottom: 15px;'>
  <tr>
  <td class='event_header'>{$user_event_edit_members35} ({$unapproved|@count})</td>
  </tr>
  <tr>
  <td class='event_box'>
    <div>{$user_event_edit_members36}</div>
    {section name=unapproved_loop loop=$unapproved}
      <div style='margin-top: 6px;'>
        <img src='./images/icons/user16.gif' border='0' class='icon'><b><a href='{$url->url_create('profile', $unapproved[unapproved_loop].member->user_info.user_username)}'>{$unapproved[unapproved_loop].member->user_info.user_username}</a></b>
        &nbsp;[ <a href='user_event_edit_members.php?event_id={$event->event_info.event_id}&task=invite&eventmember_id={$unapproved[unapproved_loop].eventmember_id}'>{$user_event_edit_members37}</a> ] [ <a href='user_event_edit_members.php?event_id={$event->event_info.event_id}&task=remove&eventmember_id={$unapproved[unapproved_loop].eventmember_id}'>{$user_event_edit_members38}</a> ]
      </div>
    {/section}
  </td>
  </tr>
  </table>
{/if}

{* INVITE NEW MEMBERS *}
<table width='100%' cellpadding='0' cellspacing='0' id='sendinvites' style='margin-bottom: 15px;' align='center'>
<tr>
<td class='event_header'>{$user_event_edit_members11}</td>
</tr>
<tr>
<td class='event_box'>
  {$user_event_edit_members12}
  <br><br>
  <form action='user_event_edit_members.php' method='post' name='info'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td class='form1' width='100'>{$user_event_edit_members17}</td>
  <td class='form2'>
    <input type='text' class='text' name='invited_username1' id='invited_username1' size='30' maxlength='50' onkeyup="suggest('invited_username1', 'suggest1', '{section name=friends_loop loop=$friends}{$friends[friends_loop]->user_info.user_username}{if $smarty.section.friends_loop.last != true},{/if}{/section}');" autocomplete='off'>
    <br>
    <div id='suggest1' class='suggest'></div>
  </td>
  </tr>
  </table>
  <p id='newtype'></p>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td class='form1' width='100'>&nbsp;</td>
  <td class='form2'>
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td><input type='submit' class='button' value='{$user_event_edit_members18}'>&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td><a href="javascript:addInput('newtype')">{$user_event_edit_members31}</a></td>
    </tr>
    </table>
  </td>
  </tr>
  </table>
  <input type='hidden' name='num_invited' value='1'>
  <input type='hidden' name='event_id' value='{$event->event_info.event_id}'>
  <input type='hidden' name='task' value='doinvites'>
  </form>
</td>
</tr>
</table>

{* SHOW CURRENT MEMBERS *}
<table width='100%' cellpadding='0' cellspacing='0' id='sendinvites' style='margin-bottom: 15px;' align='center'>
<tr>
<td class='event_header'>{$user_event_edit_members43}</td>
</tr>
<tr>
<td class='event_box'>

  <table cellpadding='0' cellspacing='0' align='center' width='100%'>
  <tr>
  <td align='center'>
    <form action='user_event_edit_members.php' method='post'>
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td nowrap='nowrap'>{$user_event_edit_members34}</td>
    <td nowrap='nowrap'>
      &nbsp;
      <select name='status'>
        <option value=''{if $status == ""} SELECTED{/if}>{$user_event_edit_members26}</option>
        <option value='1'{if $status == "1"} SELECTED{/if}>{$user_event_edit_members27}</option>
        <option value='2'{if $status == "2"} SELECTED{/if}>{$user_event_edit_members28}</option>
        <option value='3'{if $status == "3"} SELECTED{/if}>{$user_event_edit_members29}</option>
        <option value='0'{if $status == "0"} SELECTED{/if}>{$user_event_edit_members30}</option>
      </select>
    </td>
    <td nowrap='nowrap'>
      &nbsp;<input type='text' maxlength='100' size='30' class='text' name='search' value='{$search}'>&nbsp;
    </td>
    <td nowrap='nowrap'>
      <input type='submit' class='button' value='{$user_event_edit_members13}'>
      <input type='hidden' name='p' value='{$p}'>
      <input type='hidden' name='event_id' value='{$event->event_info.event_id}'>
    </td>
    </tr>
    </table>
    </form>
  </td>
  </tr>
  </table>

  {* DISPLAY PAGINATION MENU IF APPLICABLE *}
  {if $maxpage > 1}
    <br>
    <div class='center'>
    {if $p != 1}<a href='user_event_edit_members.php?event_id={$event->event_info.event_id}&s={$s}&search={$search}&p={math equation='p-1' p=$p}'>&#171; {$user_event_edit_members19}</a>{else}<font class='disabled'>&#171; {$user_event_edit_members19}</font>{/if}
    {if $p_start == $p_end}
      &nbsp;|&nbsp; {$user_event_edit_members20} {$p_start} {$user_event_edit_members21} {$total_members} &nbsp;|&nbsp; 
    {else}
      &nbsp;|&nbsp; {$user_event_edit_members22} {$p_start}-{$p_end} {$user_event_edit_members21} {$total_members} &nbsp;|&nbsp; 
    {/if}
    {if $p != $maxpage}<a href='user_event_edit_members.php?event_id={$event->event_info.event_id}&s={$s}&search={$search}&p={math equation='p+1' p=$p}'>{$user_event_edit_members23} &#187;</a>{else}<font class='disabled'>{$user_event_edit_members23} &#187;</font>{/if}
    </div>
  {/if}
  
  <br>
 
  {section name=member_loop loop=$members}
    <div class='event_member'>
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td class='event_member0'><a href='{$url->url_create('profile', $members[member_loop].member->user_info.user_username)}'><img src='{$members[member_loop].member->user_photo('./images/nophoto.gif')}' class='photo' width='{$misc->photo_size($members[member_loop].member->user_photo('./images/nophoto.gif'),'90','90','w')}' border='0'></a></td>
    <td class='event_member1' width='100%'>
      <div><font class='big'><img src='./images/icons/user16.gif' border='0' class='icon'><a href='{$url->url_create('profile', $members[member_loop].member->user_info.user_username)}'>{$members[member_loop].member->user_info.user_username}</a></font></div><br>
      <table cellpadding='0' cellspacing='0'>
      {if $members[member_loop].member->user_info.user_dateupdated != "0"}<tr><td>{$user_event_edit_members24} &nbsp;</td><td>{$datetime->time_since($members[member_loop].member->user_info.user_dateupdated)}</td></tr>{/if}
      {if $members[member_loop].member->user_info.user_lastlogindate != "0"}<tr><td>{$user_event_edit_members25} &nbsp;</td><td>{$datetime->time_since($members[member_loop].member->user_info.user_lastlogindate)}</td></tr>{/if}
      <tr><td>{$user_event_edit_members41}</td><td>
        {if $members[member_loop].eventmember_status == 1}{$user_event_edit_members27}
        {elseif $members[member_loop].eventmember_status == 2}{$user_event_edit_members28}
        {elseif $members[member_loop].eventmember_status == 3}{$user_event_edit_members29}
        {elseif $members[member_loop].eventmember_status == 0}{$user_event_edit_members30}
        {/if}
      </td></tr>
      </table>
    </td>
    <td class='event_member2' NOWRAP>
    {* SHOW SEND MESSAGE LINK IF USER IS NOT LOOKING AT HIMSELF *}
    {if $members[member_loop].member->user_info.user_id != $user->user_info.user_id}
      <a href='user_messages_new.php?to={$members[member_loop].member->user_info.user_username}'>{$user_event_edit_members33}</a><br>
      <a href='user_event_edit_members.php?task=remove&event_id={$event->event_info.event_id}&eventmember_id={$members[member_loop].eventmember_id}'>{$user_event_edit_members32}</a><br>
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
    {if $p != 1}<a href='user_event_edit_members.php?event_id={$event->event_info.event_id}&s={$s}&search={$search}&p={math equation='p-1' p=$p}'>&#171; {$user_event_edit_members19}</a>{else}<font class='disabled'>&#171; {$user_event_edit_members19}</font>{/if}
    {if $p_start == $p_end}
      &nbsp;|&nbsp; {$user_event_edit_members20} {$p_start} {$user_event_edit_members21} {$total_members} &nbsp;|&nbsp; 
    {else}
      &nbsp;|&nbsp; {$user_event_edit_members22} {$p_start}-{$p_end} {$user_event_edit_members21} {$total_members} &nbsp;|&nbsp; 
    {/if}
    {if $p != $maxpage}<a href='user_event_edit_members.php?event_id={$event->event_info.event_id}&s={$s}&search={$search}&p={math equation='p+1' p=$p}'>{$user_event_edit_members23} &#187;</a>{else}<font class='disabled'>{$user_event_edit_members23} &#187;</font>{/if}
    </div>
  {/if}

</td>
</tr>
</table>

{include file='footer.tpl'}