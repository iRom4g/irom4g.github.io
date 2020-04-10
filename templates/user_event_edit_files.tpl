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

<table cellpadding='0' cellspacing='0' width='100%'><tr><td class='page'>

<table cellpadding='0' cellspacing='0'>
<tr>
<td class='album_left' width='100%'>
  <div>
    <img src='./images/icons/event_files48.gif' border='0' class='icon_big'>
    <div class='page_header'>{$user_event_edit_files10} <a href='event.php?event_id={$event->event_info.event_id}'>{$event->event_info.event_title|truncate:30:"...":true}</a></div>
    {$user_event_edit_files11}
    <b>{$files_total}</b>
  </div>
</td>
<td class='album_right'>
  <table cellpadding='0' cellspacing='0'>
  <tr><td class='button' nowrap='nowrap'>
    <a href='user_event_edit_files_upload.php?event_id={$event->event_info.event_id}'><img src='./images/icons/addimages16.gif' border='0' class='icon'></a> 
    &nbsp;<a href='user_event_edit_files_upload.php?event_id={$event->event_info.event_id}'>{$user_event_edit_files12}</a>
  </td></tr></table>
</td>
</tr>
</table>

<br>

{* SHOW RESULT MESSAGE *}
{if $result != 0 AND $files_total > 0}
  <table cellpadding='0' cellspacing='0'>
  <tr><td class='result'>
    <img src='./images/success.gif' border='0' class='icon'> {$user_event_edit_files1}
  </td></tr></table>
{/if}

{* SHOW FILES IF THERE ARE ANY *}
{if $files_total > 0}
  <form action='user_event_edit_files.php' method='POST'>
  {section name=file_loop loop=$files}

    {* IF IMAGE, GET THUMBNAIL *}
    {if $files[file_loop].eventmedia_ext == "jpeg" OR $files[file_loop].eventmedia_ext == "jpg" OR $files[file_loop].eventmedia_ext == "gif" OR $files[file_loop].eventmedia_ext == "png" OR $files[file_loop].eventmedia_ext == "bmp"}
      {assign var='file_dir' value=$event->event_dir($event->event_info.event_id)}
      {assign var='file_src' value="`$file_dir``$files[file_loop].eventmedia_id`_thumb.jpg"}
    {* SET THUMB PATH FOR AUDIO *}
    {elseif $files[file_loop].eventmedia_ext == "mp3" OR $files[file_loop].eventmedia_ext == "mp4" OR $files[file_loop].eventmedia_ext == "wav"}
      {assign var='file_src' value='./images/icons/audio_big.gif'}
    {* SET THUMB PATH FOR VIDEO *}
    {elseif $files[file_loop].eventmedia_ext == "mpeg" OR $files[file_loop].eventmedia_ext == "mpg" OR $files[file_loop].eventmedia_ext == "mpa" OR $files[file_loop].eventmedia_ext == "avi" OR $files[file_loop].eventmedia_ext == "swf" OR $files[file_loop].eventmedia_ext == "mov" OR $files[file_loop].eventmedia_ext == "ram" OR $files[file_loop].eventmedia_ext == "rm"}
      {assign var='file_src' value='./images/icons/video_big.gif'}
    {* SET THUMB PATH FOR UNKNOWN *}
    {else}
      {assign var='file_src' value='./images/icons/file_big.gif'}
    {/if}

    <div class='album_row'>
    <a name='{$files[file_loop].eventmedia_id}'></a>
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td>
      <table cellpadding='0' cellspacing='0' width='220'>
      <tr>
      <td class='album_photo'><a href='event_album_file.php?event_id={$event->event_info.event_id}&eventmedia_id={$files[file_loop].eventmedia_id}'><img src='{$file_src}' border='0'></a></td>
      </tr>
      </table>
    </td>
    <td class='album_row1' width='100%'>
      <table cellpadding='0' cellspacing='0'>
      <tr>
      <td>
        {$user_event_edit_files13}<br><input type='text' name='eventmedia_title_{$files[file_loop].eventmedia_id}' class='text' size='30' maxlength='50' value='{$files[file_loop].eventmedia_title}'>
        {if $files[file_loop].eventmedia_comments_total > 0}&nbsp;&nbsp;&nbsp; <b>[ <a href='user_event_edit_files_comments.php?event_id={$event->event_info.event_id}&eventmedia_id={$files[file_loop].eventmedia_id}'>{$files[file_loop].eventmedia_comments_total} {$user_event_edit_files14}</a> ]</b>{/if}
      </td>
      </tr>
      <tr><td><br>{$user_event_edit_files15}<br><textarea name='eventmedia_desc_{$files[file_loop].eventmedia_id}' rows='3' cols='52'>{$files[file_loop].eventmedia_desc}</textarea></td></tr>
      </table>
      <table cellpadding='0' cellspacing='0' class='album_photooptions'>
      <tr>
      <td><input type='checkbox' name='delete_eventmedia_{$files[file_loop].eventmedia_id}' id='delete_eventmedia_{$files[file_loop].eventmedia_id}' value='1'></td><td><label for='delete_eventmedia_{$files[file_loop].eventmedia_id}'>{$user_event_edit_files16}</label> &nbsp;</td>
      </tr>
      </table>
    </td>
    </tr>
    </table>
    </div>
  {/section}
  <br>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td><input type='submit' class='button' value='{$user_event_edit_files17}'>&nbsp;
  <input type='hidden' name='task' value='doupdate'>
  <input type='hidden' name='event_id' value='{$event->event_info.event_id}'>
  </form>
  </td>
  </tr>
  </table>
{/if}


</td></tr></table>

{include file='footer.tpl'}