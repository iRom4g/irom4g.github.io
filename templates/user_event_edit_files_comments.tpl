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
        <li><a href="user_event_edit_members.php?event_id={$event->event_info.event_id}" style="width:7.5em">Приглашения</a></li>
        <li class="activeLink"><a href="user_event_edit_files.php?event_id={$event->event_info.event_id}" style="width:6.5em">Фотографии</a></li>
        <li><a href="user_event_edit_comments.php?event_id={$event->event_info.event_id}" style="width:8em">Коментарии</a></li>
        {if $event->eventowner_level_info.level_event_style == 1}<li><a href="user_event_edit_style.php?event_id={$event->event_info.event_id}" style="width:8em">Стили События</a></li>{/if}
        <li><a href="user_event_edit_delete.php?event_id={$event->event_info.event_id}" style="width:10em">Отменить Событие</a></li>
        <li><a href="user_event.php" style="width:4em">Назад</a></li>
      </ul>
    </div>


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

<table cellpadding='0' cellspacing='0'>
<tr>
<td width='100%'>
  <img src='./images/icons/event_files48.gif' border='0' class='icon_big'>
  <div class='page_header'>{$user_event_edit_files_comments9}</div>
  <div>{$user_event_edit_files_comments10}</div>
</td>
<td align='right'>
  <table cellpadding='0' cellspacing='0'>
  <tr><td class='button' nowrap='nowrap'><img src='./images/icons/album_back16.gif' border='0' class='icon'>&nbsp; <a href='user_event_edit_files.php?event_id={$event->event_info.event_id}'>{$user_event_edit_files_comments21}</a></td></tr>
  </table>
</td>
</tr>
</table>

<br><br>

<table cellpadding='0' cellspacing='0' width='100%'>
<tr>
<td width='150'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td><input type='checkbox' name='select_all' id='select_all' onClick='doCheckAll()'></td>
  <td>&nbsp;[ <a href='javascript:doCheckAll()'>{$user_event_edit_files_comments20}</a> ]</td>
  </tr>
  </table>
</td>

{* DISPLAY PAGINATION MENU IF APPLICABLE *}
{if $maxpage > 1}
  <td align='right'>
  {if $p != 1}<a href='user_event_edit_files_comments.php?event_id={$event->event_info.event_id}&eventmedia_id={$eventmedia_id}&p={math equation='p-1' p=$p}'>&#171; {$user_event_edit_files_comments11}</a>{else}<font class='disabled'>&#171; {$user_event_edit_files_comments11}</font>{/if}
  {if $p_start == $p_end}
    &nbsp;|&nbsp; {$user_event_edit_files_comments12} {$p_start} {$user_event_edit_files_comments13} {$total_comments} &nbsp;|&nbsp; 
  {else}
    &nbsp;|&nbsp; {$user_event_edit_files_comments14} {$p_start}-{$p_end} {$user_event_edit_files_comments13} {$total_comments} &nbsp;|&nbsp; 
  {/if}
  {if $p != $maxpage}<a href='user_event_edit_files_comments.php?event_id={$event->event_info.event_id}&eventmedia_id={$eventmedia_id}&p={math equation='p+1' p=$p}'>{$user_event_edit_files_comments15} &#187;</a>{else}<font class='disabled'>{$user_event_edit_files_comments15} &#187;</font>{/if}
  </td>
{/if}

</tr>
</table>

{if $total_comments == 0}
  {* DISPLAY MESSAGE IF THERE ARE NO COMMENTS *}
  <table cellpadding='0' cellspacing='0'>
  <tr><td class='result'><img src='./images/icons/bulb22.gif' class='icon' border='0'> {$user_event_edit_files_comments16}</td></tr>
  </table>

{else}
  {* SHOW COMMENTS IF THERE ARE ANY *}
  <form action='user_event_edit_files_comments.php' method='post' name='comments'>
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
    <div><b>{if $comments[comment_loop].comment_author->user_info.user_id != 0}<a href='{$url->url_create('profile',$comments[comment_loop].comment_author->user_info.user_username)}'>{$comments[comment_loop].comment_author->user_info.user_username}</a>{else}{$user_editprofile_comments15}{/if}</b>
     - {$datetime->cdate("`$setting.setting_timeformat` `$user_event_edit_files_comments19` `$setting.setting_dateformat`", $datetime->timezone($comments[comment_loop].comment_date, $global_timezone))}
    </div>
    {$comments[comment_loop].comment_body}
    </td>
    </tr>
    </table>
  {/section}

  <br>

  <input type='submit' class='button' value='{$user_event_edit_files_comments18}'>
  <input type='hidden' name='task' value='delete'>
  <input type='hidden' name='p' value='{$p}'>
  <input type='hidden' name='event_id' value='{$event->event_info.event_id}'>
  <input type='hidden' name='eventmedia_id' value='{$eventmedia_id}'>
  </form>
{/if}


{include file='footer.tpl'}