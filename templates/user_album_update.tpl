{include file='header.tpl'}

  <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1>Мои альбомы</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">

 <div class="clearFix tBar">
     <ul class="tabs" id="friendTabs" style="width:550px;float:left;">
	  <li class="activeLink"><a href="user_album.php" style="width:7em">{$user_album_update2}</a></li>
        <li><a href="user_album_settings.php" style="width:11em">{$user_album_update3}</a></li>
        <li><a href="user_album_friends.php" style="width:11.5em">{$user_album_update4}</a></li>
     </ul>
    </div>


<table cellpadding='0' cellspacing='0' width='100%'><tr><td class='page'>

<img src='./images/icons/image48.gif' border='0' class='icon_big'>
<div class='page_header'>{$user_album_update5} <a href='{$url->url_create('album', $user->user_info.user_username, $album_id)}'>{$album_title}</a></div>
<div>
  {$user_album_update6} <b>{$files_total} {$user_album_update7}</b> 
  {$user_album_update8} <b>{$album_views} {$user_album_update9}</b>
</div>

<br>

<table cellpadding='0' cellspacing='0'>
<tr>
<td>
  <table cellpadding='0' cellspacing='0' width='140'>
  <tr><td class='button'><img src='./images/icons/album_back16.gif' border='0' class='icon'><a href='user_album.php'>{$user_album_update10}</a></td></tr>
  </table>
</td>
<td style='padding-left: 10px;'>
  <table cellpadding='0' cellspacing='0' width='140'>
  <tr><td class='button'><img src='./images/icons/addimages16.gif' border='0' class='icon'><a href='user_album_upload.php?album_id={$album_id}'>{$user_album_update11}</a></td></tr>
  </table>
</td>
<td style='padding-left: 10px;'>
  <table cellpadding='0' cellspacing='0' width='140'>
  <tr><td class='button'><img src='./images/icons/album_edit16.gif' border='0' class='icon'><a href='user_album_edit.php?album_id={$album_id}'>{$user_album_update12}</a></td></tr>
  </table>
</td>
</tr>
</table>

<br>

{* SHOW NO FILES MESSAGE IF NECESSARY, OTHERWISE SHOW ALBUM STATS *}
{if $files_total == 0}
    <table cellpadding='0' cellspacing='0'>
    <tr><td class='result'>
      <img src='./images/icons/bulb16.gif' border='0' class='icon'>{$user_album_update13} <a href='user_album_upload.php?album_id={$album_id}'>{$user_album_update14}</a>
    </td></tr></table>
{/if}

{* SHOW RESULT MESSAGE *}
{if $result != 0 AND $files_total > 0}
  <div class='success'><img src='./images/success.gif' border='0' class='icon'> {$user_album_update1}</div>
{/if}

{* SHOW FILES IF THERE ARE ANY *}
{if $files_total > 0}
  <form action='user_album_update.php' method='POST'>
  {section name=files_loop loop=$files}

    {* IF IMAGE, GET THUMBNAIL *}
    {if $files[files_loop].media_ext == "jpeg" OR $files[files_loop].media_ext == "jpg" OR $files[files_loop].media_ext == "gif" OR $files[files_loop].media_ext == "png" OR $files[files_loop].media_ext == "bmp"}
      {assign var='file_dir' value=$url->url_userdir($user->user_info.user_id)}
      {assign var='file_src' value="`$file_dir``$files[files_loop].media_id`_thumb.jpg"}
    {* SET THUMB PATH FOR AUDIO *}
    {elseif $files[files_loop].media_ext == "mp3" OR $files[files_loop].media_ext == "mp4" OR $files[files_loop].media_ext == "wav"}
      {assign var='file_src' value='./images/icons/audio_big.gif'}
    {* SET THUMB PATH FOR VIDEO *}
    {elseif $files[files_loop].media_ext == "mpeg" OR $files[files_loop].media_ext == "mpg" OR $files[files_loop].media_ext == "mpa" OR $files[files_loop].media_ext == "avi" OR $files[files_loop].media_ext == "swf" OR $files[files_loop].media_ext == "mov" OR $files[files_loop].media_ext == "ram" OR $files[files_loop].media_ext == "rm"}
      {assign var='file_src' value='./images/icons/video_big.gif'}
    {* SET THUMB PATH FOR UNKNOWN *}
    {else}
      {assign var='file_src' value='./images/icons/file_big.gif'}
    {/if}

    <div class='album_row'>
    <a name='{$files[files_loop].media_id}'></a>
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td>
      <table cellpadding='0' cellspacing='0' width='220'>
      <tr>
      <td class='album_photo'><a href='{$url->url_create('album_file', $user->user_info.user_username, $album_id, $files[files_loop].media_id)}'><img src='{$file_src}' border='0'></a></td>
      </tr>
      </table>
    </td>
    <td class='album_row1' width='100%'>
      <table cellpadding='0' cellspacing='0'>
      <tr>
      <td>
        {$user_album_update15}<br><input type='text' name='media_title_{$files[files_loop].media_id}' class='text' size='30' maxlength='50' value='{$files[files_loop].media_title}'>
        {if $files[files_loop].media_comments_total > 0}&nbsp;&nbsp;&nbsp; <b>[ <a href='user_album_comments.php?album_id={$album_id}&media_id={$files[files_loop].media_id}'>{$files[files_loop].media_comments_total} {$user_album_update16}</a> ]</b>{/if}
        </td>
      </tr>
      <tr><td><br>{$user_album_update17}<br><textarea name='media_desc_{$files[files_loop].media_id}' rows='3' cols='52'>{$files[files_loop].media_desc}</textarea></td></tr>
      </table>
      <table cellpadding='0' cellspacing='0' class='album_photooptions'>
      <tr>
      <td><input type='checkbox' name='delete_media_{$files[files_loop].media_id}' id='delete_media_{$files[files_loop].media_id}' value='1'></td><td><label for='delete_media_{$files[files_loop].media_id}'>{$user_album_update18}</label> &nbsp;</td>
      <td><input type='radio' name='album_cover' id='album_cover_{$files[files_loop].media_id}' value='{$files[files_loop].media_id}'{if $album_cover == $files[files_loop].media_id} CHECKED{/if}></td><td><label for='album_cover_{$files[files_loop].media_id}'>{$user_album_update19}</label> &nbsp;</td>
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
  <td>
    <input type='submit' class='button' value='{$user_album_update20}'>&nbsp;
    <input type='hidden' name='task' value='doupdate'>
    <input type='hidden' name='album_id' value='{$album_id}'>
    </form>
  </td>
  </tr>
  </table>
{/if}

</td></tr></table>

{include file='footer.tpl'}