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
	  <li><a href="user_group.php" style="width:7em">Мои группы</a></li>
        <li class="activeLink"><a href="user_group_invites.php" style="width:11em">Приглашения группы</a></li>
        <li><a href="user_group_settings.php" style="width:10.5em">Настройки группы</a></li>
        <li><a href="user_group_browse.php" style="width:7em">Обзор групп</a></li>
     </ul>
    </div>

<img src='./images/icons/group_invite48.gif' border='0' class='icon_big'>
<div class='page_header'>{$user_group_invites6}</div>
<div>{$user_group_invites7}</div>

<br>

{* SHOW ACCEPT MESSAGE *}
{if $result_accepted != ""}
  <br>
  <table cellpadding='0' cellspacing='0' align='center'><tr>
  <td class='result'><img src='./images/icons/plus22.gif' border='0' class='icon'> {$result_accepted} "<a href='group.php?group_id={$group_id}'>{$group_title|truncate:30:"...":true}</a>"</td>
  </tr></table>
{* SHOW REJECT MESSAGE *}
{elseif $result_rejected != ""}
  <br>
  <table cellpadding='0' cellspacing='0' align='center'><tr>
  <td class='result'><img src='./images/icons/minus22.gif' border='0' class='icon'> {$result_rejected} "<a href='group.php?group_id={$group_id}'>{$group_title|truncate:30:"...":true}</a>"</td>
  </tr></table>
{* SHOW NO GROUPS MESSAGE *}
{elseif $total_groups == 0}
  <br>
  <table cellpadding='0' cellspacing='0' align='center'><tr>
  <td class='result'><img src='./images/icons/bulb16.gif' border='0' class='icon'> {$user_group_invites15}</td>
  </tr></table>
{/if}

<br>

{section name=group_loop loop=$groups}
  <div class='group_row'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td><a href='group.php?group_id={$groups[group_loop].group->group_info.group_id}'><img src='{$groups[group_loop].group->group_photo('./images/nophoto.gif')}' class='photo' width='{$misc->photo_size($groups[group_loop].group->group_photo('./images/nophoto.gif'),'100','100','w')}' border='0'></a></td>
  <td class='group_row1' width='100%'>
    <table cellpadding='0' cellspacing='0'>
    <tr><td width='100'>{$user_group_invites8}</td><td><a href='group.php?group_id={$groups[group_loop].group->group_info.group_id}'>{$groups[group_loop].group->group_info.group_title}</a></td></tr>
    <tr><td>{$user_group_invites9}</td><td>{$groups[group_loop].group_members} {$user_group_invites10}</td></tr>
    <tr><td>{$user_group_invites11}</td><td><a href='{$url->url_create('profile', $groups[group_loop].group_leader->user_info.user_username)}'>{$groups[group_loop].group_leader->user_info.user_username}</a></td></tr>
    </table>
  </td>
  <td class='group_row2' NOWRAP>
  <a href='group.php?group_id={$groups[group_loop].group->group_info.group_id}'>{$user_group_invites12}</a><br>
  <a href='user_group_invites.php?task=accept&group_id={$groups[group_loop].group->group_info.group_id}'>{$user_group_invites13}</a><br>
  <a href='user_group_invites.php?task=reject&group_id={$groups[group_loop].group->group_info.group_id}'>{$user_group_invites14}</a><br>
  </td>
  </tr>
  </table>
  </div>
{/section}
</div></div></div>

{include file='footer.tpl'}