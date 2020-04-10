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
	  <li><a href="user_album.php" style="width:7em">{$user_album_friends1}</a></li>
        <li><a href="user_album_settings.php" style="width:11em">{$user_album_friends2}</a></li>
        <li class="activeLink"><a href="user_album_friends.php" style="width:11.5em">{$user_album_friends3}</a></li>
     </ul>
    </div>
<table cellpadding='0' cellspacing='0' width='100%'><tr><td class='page'>

<img src='./images/icons/image48.gif' border='0' class='icon_big'>
<div class='page_header'>{$user_album_friends4}</div>
<div>{$user_album_friends5}</div>

<br><br>

{* LOOP THROUGH ALBUMS *}
{section name=album_loop loop=$albums}

  {* SET ALBUM COVER *}
  {if $albums[album_loop].album_cover_id == 0}
    {assign var='album_cover_src' value='./images/icons/folder_big.gif'}
  {else}
    {* IF IMAGE, GET THUMBNAIL *}
    {if $albums[album_loop].album_cover_ext == "jpeg" OR $albums[album_loop].album_cover_ext == "jpg" OR $albums[album_loop].album_cover_ext == "gif" OR $albums[album_loop].album_cover_ext == "png" OR $albums[album_loop].album_cover_ext == "bmp"}
      {assign var='album_cover_dir' value=$url->url_userdir($albums[album_loop].album_author->user_info.user_id)}
      {assign var='album_cover_src' value="`$album_cover_dir``$albums[album_loop].album_cover_id`_thumb.jpg"}
    {* SET THUMB PATH FOR AUDIO *}
    {elseif $albums[album_loop].album_cover_ext == "mp3" OR $albums[album_loop].album_cover_ext == "mp4" OR $albums[album_loop].album_cover_ext == "wav"}
      {assign var='album_cover_src' value='./images/icons/audio_big.gif'}
    {* SET THUMB PATH FOR VIDEO *}
    {elseif $albums[album_loop].album_cover_ext == "mpeg" OR $albums[album_loop].album_cover_ext == "mpg" OR $albums[album_loop].album_cover_ext == "mpa" OR $albums[album_loop].album_cover_ext == "avi" OR $albums[album_loop].album_cover_ext == "swf" OR $albums[album_loop].album_cover_ext == "mov" OR $albums[album_loop].album_cover_ext == "ram" OR $albums[album_loop].album_cover_ext == "rm"}
      {assign var='album_cover_src' value='./images/icons/video_big.gif'}
    {* SET THUMB PATH FOR UNKNOWN *}
    {else}
      {assign var='album_cover_src' value='./images/icons/file_big.gif'}
    {/if}
  {/if}



<div class='album_row'>
<table cellpadding='0' cellspacing='0'>
<tr>
<td valign='top'>
  <table cellpadding='0' cellspacing='0' width='220'>
  <tr>
  <td class='album_photo'><a href='{$url->url_create('album', $albums[album_loop].album_author->user_info.user_username, $albums[album_loop].album_id)}'><img src='{$album_cover_src}' border='0'></a></td>
  </tr>
  </table>
</td>
<td class='album_row1' valign='top'>
  <div><font class='big'><a href='{$url->url_create('album', $albums[album_loop].album_author->user_info.user_username, $albums[album_loop].album_id)}'><img src='./images/icons/album16.gif' border='0' class='icon'>{$albums[album_loop].album_title|truncate:30}</a></font></div><br>
  <table cellpadding='0' cellspacing='0'>
  <tr><td width='100'>{$user_album_friends6}</td><td><a href='{$url->url_create('profile', $albums[album_loop].album_author->user_info.user_username)}'>{$albums[album_loop].album_author->user_info.user_username}</a></td></tr>
  <tr><td>{$user_album_friends7}</td><td>{$datetime->time_since($albums[album_loop].album_datecreated)}</td></tr>
  {if $albums[album_loop].album_dateupdated != 0}<tr><td>{$user_album_friends8}</td><td>{$datetime->time_since($albums[album_loop].album_dateupdated)}</td></tr>{/if}
  <tr><td>{$user_album_friends9}</td><td>{$albums[album_loop].album_files} {$user_album_friends10} ({$albums[album_loop].album_space} MB)</td></tr>
  <tr><td colspan='2'><br>{$albums[album_loop].album_desc|truncate:197}</td></tr>
  </table>
</td>
</tr>
</table>
</div>

{/section}

{* SHOW NO ALBUMS MESSAGE IF NO ALBUMS FOUND *}
{if $albums|@count == 0}
  <div class='align'>
  <br>
  <table cellpadding='0' cellspacing='0' align='center'>
  <tr><td class='result'>
    <img src='./images/icons/bulb22.gif' border='0' class='icon'> {$user_album_friends11}
  </td></tr></table>
  </div>
{/if}

</td></tr></table>

{include file='footer.tpl'}