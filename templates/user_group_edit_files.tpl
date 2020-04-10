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
        <li class="activeLink"><a href="user_group_edit_files.php?group_id={$group->group_info.group_id}" style="width:3.5em">Фото</a></li>
        <li><a href="user_group_edit_comments.php?group_id={$group->group_info.group_id}" style="width:7em">Комментарии</a></li>
        {if $group->groupowner_level_info.level_group_style == 1}<li><a href="user_group_edit_style.php?group_id={$group->group_info.group_id}" style="width:7.5em">Стиль группы</a></li>{/if}
        {if $group->user_rank == 2}<li><a href="user_group_edit_delete.php?group_id={$group->group_info.group_id}" style="width:4.5em">Удалить</a></li>{/if}
       </ul>
    </div>

<table cellpadding='0' cellspacing='0' width='100%'><tr><td class='page'>

<table cellpadding='0' cellspacing='0'>
<tr>
<td class='album_left' width='100%'>
  <div>
    <img src='./images/icons/group_files48.gif' border='0' class='icon_big'>
    <div class='page_header'>{$user_group_edit_files10} <a href='group.php?group_id={$group->group_info.group_id}'>{$group->group_info.group_title|truncate:30:"...":true}</a></div>
    {$user_group_edit_files11}
    <b>{$files_total}</b>
  </div>
</td>
<td class='album_right'>
  <table cellpadding='0' cellspacing='0'>
  <tr><td class='button' nowrap='nowrap'>
    <a href='user_group_edit_files_upload.php?group_id={$group->group_info.group_id}'><img src='./images/icons/addimages16.gif' border='0' class='icon'></a> 
    &nbsp;<a href='user_group_edit_files_upload.php?group_id={$group->group_info.group_id}'>{$user_group_edit_files12}</a>
  </td></tr></table>
</td>
</tr>
</table>

<br>

{* SHOW RESULT MESSAGE *}
{if $result != 0 AND $files_total > 0}
  <table cellpadding='0' cellspacing='0'>
  <tr><td class='result'>
    <img src='./images/success.gif' border='0' class='icon'> {$user_group_edit_files1}
  </td></tr></table>
{/if}

{* SHOW FILES IF THERE ARE ANY *}
{if $files_total > 0}
  <form action='user_group_edit_files.php' method='POST'>
  {section name=file_loop loop=$files}

    {* IF IMAGE, GET THUMBNAIL *}
    {if $files[file_loop].groupmedia_ext == "jpeg" OR $files[file_loop].groupmedia_ext == "jpg" OR $files[file_loop].groupmedia_ext == "gif" OR $files[file_loop].groupmedia_ext == "png" OR $files[file_loop].groupmedia_ext == "bmp"}
      {assign var='file_dir' value=$group->group_dir($group->group_info.group_id)}
      {assign var='file_src' value="`$file_dir``$files[file_loop].groupmedia_id`_thumb.jpg"}
    {* SET THUMB PATH FOR AUDIO *}
    {elseif $files[file_loop].groupmedia_ext == "mp3" OR $files[file_loop].groupmedia_ext == "mp4" OR $files[file_loop].groupmedia_ext == "wav"}
      {assign var='file_src' value='./images/icons/audio_big.gif'}
    {* SET THUMB PATH FOR VIDEO *}
    {elseif $files[file_loop].groupmedia_ext == "mpeg" OR $files[file_loop].groupmedia_ext == "mpg" OR $files[file_loop].groupmedia_ext == "mpa" OR $files[file_loop].groupmedia_ext == "avi" OR $files[file_loop].groupmedia_ext == "swf" OR $files[file_loop].groupmedia_ext == "mov" OR $files[file_loop].groupmedia_ext == "ram" OR $files[file_loop].groupmedia_ext == "rm"}
      {assign var='file_src' value='./images/icons/video_big.gif'}
    {* SET THUMB PATH FOR UNKNOWN *}
    {else}
      {assign var='file_src' value='./images/icons/file_big.gif'}
    {/if}

    <div class='album_row'>
    <a name='{$files[file_loop].groupmedia_id}'></a>
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td>
      <table cellpadding='0' cellspacing='0' width='220'>
      <tr>
      <td class='album_photo'><a href='group_album_file.php?group_id={$group->group_info.group_id}&groupmedia_id={$files[file_loop].groupmedia_id}'><img src='{$file_src}' border='0'></a></td>
      </tr>
      </table>
    </td>
    <td class='album_row1' width='100%'>
      <table cellpadding='0' cellspacing='0'>
      <tr>
      <td>
        {$user_group_edit_files13}<br><input type='text' name='groupmedia_title_{$files[file_loop].groupmedia_id}' class='text' size='30' maxlength='50' value='{$files[file_loop].groupmedia_title}'>
        {if $files[file_loop].groupmedia_comments_total > 0}&nbsp;&nbsp;&nbsp; <b>[ <a href='user_group_edit_files_comments.php?group_id={$group->group_info.group_id}&groupmedia_id={$files[file_loop].groupmedia_id}'>{$files[file_loop].groupmedia_comments_total} {$user_group_edit_files14}</a> ]</b>{/if}
      </td>
      </tr>
      <tr><td><br>{$user_group_edit_files15}<br><textarea name='groupmedia_desc_{$files[file_loop].groupmedia_id}' rows='3' cols='52'>{$files[file_loop].groupmedia_desc}</textarea></td></tr>
      </table>
      <table cellpadding='0' cellspacing='0' class='album_photooptions'>
      <tr>
      <td><input type='checkbox' name='delete_groupmedia_{$files[file_loop].groupmedia_id}' id='delete_groupmedia_{$files[file_loop].groupmedia_id}' value='1'></td><td><label for='delete_groupmedia_{$files[file_loop].groupmedia_id}'>{$user_group_edit_files16}</label> &nbsp;</td>
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
  <td><input type='submit' class='button' value='{$user_group_edit_files17}'>&nbsp;
  <input type='hidden' name='task' value='doupdate'>
  <input type='hidden' name='group_id' value='{$group->group_info.group_id}'>
  </form>
  </td>
  </tr>
  </table>
{/if}


</td></tr></table>

{include file='footer.tpl'}