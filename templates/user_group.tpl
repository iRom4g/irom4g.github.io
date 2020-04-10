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
	  <li class="activeLink"><a href="user_group.php" style="width:7em">{$user_group1}</a></li>
        <li><a href="user_group_invites.php" style="width:11em">{$user_group2}</a></li>
        <li><a href="user_group_settings.php" style="width:10.5em">{$user_group15}</a></li>
        <li><a href="user_group_browse.php" style="width:7em">{$user_group3}</a></li>
     </ul>
    </div>

<table cellpadding='0' cellspacing='0' width='100%'><tr><td class='page'>

<table cellpadding='0' cellspacing='0'>
<tr>
<td class='group_left'>
   <img src='./images/icons/group48.gif' border='0' class='icon_big'>
   <div class='page_header'>{$user_group4}</div>
   {$user_group5}<a href='user_group_browse.php'>{$user_group6}</a>.
</td>

{* SHOW CREATE GROUP BUTTON *}
<td class='group_right' align='right'>
  <table cellpadding='0' cellspacing='0' align='right'>
  <tr><td class='button' nowrap='nowrap'>
    <a href='user_group_add.php'><img src='./images/icons/newgroup16.gif' border='0' class='icon'>{$user_group7}</a>
  </td></tr></table>
</td>

</tr>
</table>

{* SHOW NO GROUPS MESSAGE *}
{if $total_groups == 0}
  <br>
  <table cellpadding='0' cellspacing='0' align='center'><tr>
  <td class='result'><img src='./images/icons/bulb16.gif' border='0' class='icon'>{$user_group8}</td>
  </tr></table>
{/if}

{section name=group_loop loop=$groups}
  <div class='group_row'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td><a href='group.php?group_id={$groups[group_loop].group->group_info.group_id}'><img src='{$groups[group_loop].group->group_photo('./images/nophoto.gif')}' class='photo' width='{$misc->photo_size($groups[group_loop].group->group_photo('./images/nophoto.gif'),'100','100','w')}' border='0'></a></td>
  <td class='group_row1' width='100%'>
    <div><font class='big'><img src='./images/icons/group16.gif' border='0' class='icon'><a href='group.php?group_id={$groups[group_loop].group->group_info.group_id}'>{$groups[group_loop].group->group_info.group_title}</a></font></div><br>
    <table cellpadding='0' cellspacing='0'>
    <tr><td>{$user_group9} &nbsp;</td><td>{$groups[group_loop].group_members} {$user_group10}</td></tr>
    <tr><td>{$user_group11} &nbsp;</td><td><a href='{$url->url_create('profile', $groups[group_loop].group_leader->user_info.user_username)}'>{$groups[group_loop].group_leader->user_info.user_username}</a></td></tr>
    </table>
  </td>
  <td class='group_row2' NOWRAP>
  <a href='group.php?group_id={$groups[group_loop].group->group_info.group_id}'>{$user_group12}</a><br>
  {if $groups[group_loop].group_rank != 0}<a href='user_group_edit.php?group_id={$groups[group_loop].group->group_info.group_id}'>{$user_group13}</a><br>{/if}
  <a href='user_group_leave.php?group_id={$groups[group_loop].group->group_info.group_id}'>{$user_group14}</a><br>
  </td>
  </tr>
  </table>
  </div>
{/section}

</td></tr></table>
</div></div></div>

{include file='footer.tpl'}