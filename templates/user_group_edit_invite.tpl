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
        <li class="activeLink"><a href="user_group_edit_invite.php?group_id={$group->group_info.group_id}" style="width:7em">Приглашения</a></li>
        <li><a href="user_group_edit_files.php?group_id={$group->group_info.group_id}" style="width:3.5em">Фото</a></li>
        <li><a href="user_group_edit_comments.php?group_id={$group->group_info.group_id}" style="width:7em">Комментарии</a></li>
        {if $group->groupowner_level_info.level_group_style == 1}<li><a href="user_group_edit_style.php?group_id={$group->group_info.group_id}" style="width:7.5em">Стиль группы</a></li>{/if}
        {if $group->user_rank == 2}<li><a href="user_group_edit_delete.php?group_id={$group->group_info.group_id}" style="width:4.5em">Удалить</a></li>{/if}
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
   <img src='./images/icons/group_invite48.gif' border='0' class='icon_big'>
   <div class='page_header'>{$user_group_edit_invite13} <a href='group.php?group_id={$group->group_info.group_id}'>{$group->group_info.group_title|truncate:30:"...":true}</a></div>
   {$user_group_edit_invite14}
</div>

<br>

{* SHOW POSITIVE RESULT MESSAGE *}
{if $result != ""}
  <table cellpadding='0' cellspacing='0'><tr>
  <td class='result'><img src='./images/icons/plus22.gif' border='0' class='icon'> {$result}</td>
  </tr></table>
  <br>
{/if}

{* SHOW NEGATIVE RESULT MESSAGE *}
{if $result2 != ""}
  <table cellpadding='0' cellspacing='0'><tr>
  <td class='result'><img src='./images/icons/minus22.gif' border='0' class='icon'> {$result2}</td>
  </tr></table>
  <br>
{/if}

<br>

<div class='header'>{$user_group_edit_invite15}</div>
<div class='box'>
{$user_group_edit_invite16}
<br><br>


<form action='user_group_edit_invite.php' method='post' name='info'>
<table cellpadding='0' cellspacing='0'>
<tr>
<td class='form1' width='100'>{$user_group_edit_invite17}</td>
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
  <td><input type='submit' class='button' value='{$user_group_edit_invite18}'>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  <td><a href="javascript:addInput('newtype')">{$user_group_edit_invite19}</a></td>
  </tr>
  </table>
</td>
</tr>
</table>
<input type='hidden' name='num_invited' value='1'>
<input type='hidden' name='group_id' value='{$group->group_info.group_id}'>
<input type='hidden' name='task' value='doinvites'>
</form>
</div>

{* SHOW MEMBERS AWAITING APPROVAL *}
{if $group->groupowner_level_info.level_group_approval == 1 AND $group->group_info.group_approval == 1}
  <br>
  <div class='header'>{$user_group_edit_invite20} ({$unapproved|@count})</div>
  <div class='box'>
  {if $unapproved|@count > 0}
    <div>{$user_group_edit_invite21}</div>
  {else}
    <div>{$user_group_edit_invite22}</div>
  {/if}
  {section name=unapproved_loop loop=$unapproved}
  <img src='./images/icons/user16.gif' border='0' class='icon'>
  <b><a href='{$url->url_create('profile', $unapproved[unapproved_loop].member->user_info.user_username)}'>{$unapproved[unapproved_loop].member->user_info.user_username}</a></b>
  [ <a href='user_group_edit_invite.php?group_id={$group->group_info.group_id}&task=approve&groupmember_id={$unapproved[unapproved_loop].groupmember_id}'>{$user_group_edit_invite23}</a> ] [ <a href='user_group_edit_invite.php?group_id={$group->group_info.group_id}&task=reject&groupmember_id={$unapproved[unapproved_loop].groupmember_id}'>{$user_group_edit_invite24}</a> ]
  <br>
  {/section}
  </div>
{/if}

{* SHOW INVITED MEMBERS *}
<br>
<div class='header'>{$user_group_edit_invite25} ({$invited|@count})</div>
<div class='box'>
{if $invited|@count > 0}
  <div>{$user_group_edit_invite26}</div>
{else}
  <div>{$user_group_edit_invite27}</div>
{/if}
{section name=invited_loop loop=$invited}
  <img src='./images/icons/user16.gif' border='0' class='icon'>
  <b><a href='{$url->url_create('profile', $invited[invited_loop].member->user_info.user_username)}'>{$invited[invited_loop].member->user_info.user_username}</a></b>
  [ <a href='user_group_edit_invite.php?group_id={$group->group_info.group_id}&task=uninvite&groupmember_id={$invited[invited_loop].groupmember_id}'>{$user_group_edit_invite28}</a> ]
  {if $smarty.section.invited_loop.last == false}<br>{/if}
{/section}
</div>

</td></tr></table>

{include file='footer.tpl'}