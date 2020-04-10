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
        <li class="activeLink"><a href="user_group_edit_comments.php?group_id={$group->group_info.group_id}" style="width:7em">Комментарии</a></li>
        {if $group->groupowner_level_info.level_group_style == 1}<li><a href="user_group_edit_style.php?group_id={$group->group_info.group_id}" style="width:7.5em">Стиль группы</a></li>{/if}
        {if $group->user_rank == 2}<li><a href="user_group_edit_delete.php?group_id={$group->group_info.group_id}" style="width:4.5em">Удалить</a></li>{/if}
       </ul>
    </div>

<table cellpadding='0' cellspacing='0' width='100%'><tr><td class='page'>

<div>
   <img src='./images/icons/group_edit48.gif' border='0' class='icon_big'>
   <div class='page_header'>{$user_group_edit_comments9} <a href='group.php?group_id={$group->group_info.group_id}'>{$group->group_info.group_title|truncate:30:"...":true}</a></div>
   {$user_group_edit_comments10}
</div>

<br><br>

{* JAVASCRIPT FOR CHECK ALL MESSAGES FEATURE *}
{literal}
  <script language='JavaScript'> 
  <!---
  var checkboxcount = 1;
  function doCheckAll() {
    if(checkboxcount == 0) {
      with (document.comments) {
      for (var i=0; i < elements.length; i++) {
      if (elements[i].type == 'checkbox') {
      elements[i].checked = false;
      }}
      checkboxcount = checkboxcount + 1;
      }
      select_all.checked=false;
    } else
      with (document.comments) {
      for (var i=0; i < elements.length; i++) {
      if (elements[i].type == 'checkbox') {
      elements[i].checked = true;
      }}
      checkboxcount = checkboxcount - 1;
      select_all.checked=true;
      }
  }
  // -->
  </script>
{/literal}


<table cellpadding='0' cellspacing='0' width='100%'>
<tr>
{if $total_comments > 0}
  <td width='150'>
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td>&nbsp;[ <a href='javascript:doCheckAll()'>{$user_group_edit_comments20}</a> ]</td>
    </tr>
    </table>
  </td>
{/if}

{* DISPLAY PAGINATION MENU IF APPLICABLE *}
{if $maxpage > 1}
  <td align='right'>
  {if $p != 1}<a href='user_group_edit_comments.php?group_id={$group->group_info.group_id}&p={math equation='p-1' p=$p}'>&#171; {$user_group_edit_comments11}</a>{else}<font class='disabled'>&#171; {$user_group_edit_comments11}</font>{/if}
  {if $p_start == $p_end}
    &nbsp;|&nbsp; {$user_group_edit_comments12} {$p_start} {$user_group_edit_comments13} {$total_comments} &nbsp;|&nbsp; 
  {else}
    &nbsp;|&nbsp; {$user_group_edit_comments14} {$p_start}-{$p_end} {$user_group_edit_comments13} {$total_comments} &nbsp;|&nbsp; 
  {/if}
  {if $p != $maxpage}<a href='user_group_edit_comments.php?group_id={$group->group_info.group_id}&p={math equation='p+1' p=$p}'>{$user_group_edit_comments15} &#187;</a>{else}<font class='disabled'>{$user_group_edit_comments15} &#187;</font>{/if}
  </td>
{/if}

</tr>
</table>


{if $total_comments == 0}
  {* DISPLAY MESSAGE IF THERE ARE NO COMMENTS *}
  <table cellpadding='0' cellspacing='0'>
  <tr><td class='result'><img src='./images/icons/bulb16.gif' class='icon' border='0'> {$user_group_edit_comments16}</td></tr>
  </table>


{else}
  {* LIST COMMENTS *}
  <form action='user_group_edit_comments.php' method='post' name='comments'>
  {section name=comment_loop loop=$comments}
    <div class='editprofile_bar'></div>
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td valign='top'><input type='checkbox' name='comment_{$comments[comment_loop].comment_id}' value='1' style='margin-top: 2px;'></td>
    <td class='editprofile_item1'>
      {if $comments[comment_loop].comment_author->user_info.user_id != 0}
        <a href='{$url->url_create('profile', $comments[comment_loop].comment_author->user_info.user_username)}'><img src='{$comments[comment_loop].comment_author->user_photo('./images/nophoto.gif')}' class='photo' border='0' width='{$misc->photo_size($comments[comment_loop].comment_author->user_photo('./images/nophoto.gif'),'75','75','w')}'></a>
      {else}
        <img src='./images/nophoto.gif' class='photo' border='0' width='75'>
      {/if}
    </td>
    <td class='editprofile_item2'>
    <div><b>{if $comments[comment_loop].comment_author->user_info.user_id != 0}<a href='{$url->url_create('profile',$comments[comment_loop].comment_author->user_info.user_username)}'>{$comments[comment_loop].comment_author->user_info.user_username}</a>{else}{$user_group_edit_comments17}{/if}</b>
     - {$datetime->cdate("`$setting.setting_timeformat` `$user_group_edit_comments19` `$setting.setting_dateformat`", $datetime->timezone($comments[comment_loop].comment_date, $global_timezone))}
    </div>
    {$comments[comment_loop].comment_body}
    </td>
    </tr>
    </table>
  {/section}

  <br>

  <input type='submit' class='button' value='{$user_group_edit_comments18}'>
  <input type='hidden' name='task' value='delete'>
  <input type='hidden' name='p' value='{$p}'>
  <input type='hidden' name='group_id' value='{$group->group_info.group_id}'>
  </form>
{/if}

</td></tr></table>

{include file='footer.tpl'}