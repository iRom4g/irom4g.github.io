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
	  <li class="activeLink"><a href="user_album.php" style="width:7em">{$user_album1}</a></li>
        <li><a href="user_album_settings.php" style="width:11em">{$user_album2}</a></li>
        <li><a href="user_album_friends.php" style="width:11.5em">{$user_album3}</a></li>
     </ul>
    </div>

<table cellpadding='0' cellspacing='0' width='100%'><tr><td class='page'>

<img src='./images/icons/image48.gif' border='0' class='icon_big'>
<div class='page_header'>{$user_album4}</div>
<div>
  {$user_album5} {$albums_total} {$user_album6} {$total_files} {$user_album7}<br>
  {$user_album5} {$space_free} {$user_album8}
</div>

<br>

<table cellpadding='0' cellspacing='0'>
<tr>
<td>
  <table cellpadding='0' cellspacing='0'>
  <tr><td class='button' nowrap='nowrap'>
    <a href='user_album_add.php'><img src='./images/icons/newalbum16.gif' border='0' class='icon'>{$user_album9}</a>
  </td></tr></table>
</td>
<td style='padding-left: 10px; font-weight: bold;'>
  {$user_album10} <a href='{$url->url_create('albums', $user->user_info.user_username)}'>{$url->url_create('albums', $user->user_info.user_username)}</a>
</td>
</tr>
</table>


<br>

{* LOOP THROUGH ALBUMS *}
{section name=album_loop loop=$albums}

  {* SET ALBUM COVER *}
  {if $albums[album_loop].album_cover_id == 0}
    {assign var='album_cover_src' value='./images/icons/folder_big.gif'}
  {else}
    {* IF IMAGE, GET THUMBNAIL *}
    {if $albums[album_loop].album_cover_ext == "jpeg" OR $albums[album_loop].album_cover_ext == "jpg" OR $albums[album_loop].album_cover_ext == "gif" OR $albums[album_loop].album_cover_ext == "png" OR $albums[album_loop].album_cover_ext == "bmp"}
      {assign var='album_cover_dir' value=$url->url_userdir($user->user_info.user_id)}
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


  {* CHECK IF ALBUM IS UNTITLED *}
  {if $albums[album_loop].album_title != ""}
    {assign var="album_title" value=$albums[album_loop].album_title|truncate:30:"...":true}
  {else}
    {assign var="album_title" value=$user_album11}
  {/if}

  <div class='album_row'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td valign='top'>
    <table cellpadding='0' cellspacing='0' width='220'>
    <tr><td class='album_photo'><a href='user_album_update.php?album_id={$albums[album_loop].album_id}'><img src='{$album_cover_src}' border='0'></a></td></tr>
    </table>
  </td>
  <td class='album_row1' width='100%'>
    <div><font class='big'><img src='./images/icons/album16.gif' border='0' class='icon'><a href='user_album_update.php?album_id={$albums[album_loop].album_id}'>{$album_title}</a></font></div><br>
    <table cellpadding='0' cellspacing='0'>
    <tr><td width='100'>{$user_album12} &nbsp;</td><td>{$datetime->time_since($albums[album_loop].album_datecreated)}</td></tr>
    {if $albums[album_loop].album_dateupdated != 0}<tr><td>{$user_album13} &nbsp;</td><td>{$datetime->time_since($albums[album_loop].album_dateupdated)}</td></tr>{/if}
    <tr><td>{$user_album14} &nbsp;</td><td>{$albums[album_loop].album_files} {$user_album15} ({$albums[album_loop].album_space} MB)</td></tr>
    <tr><td>{$user_album16} &nbsp;</td><td>{$albums[album_loop].album_views} {$user_album17}</td></tr>
    <tr><td valign='top'>{$user_album18} &nbsp;</td><td>{$albums[album_loop].album_privacy}</td></tr>
    </table>
    <br><div>{$albums[album_loop].album_desc|truncate:197}</div>
  </td>
  <td class='album_row2' NOWRAP>
    <a href='{$url->url_create('album', $user->user_info.user_username, $albums[album_loop].album_id)}'>{$user_album19}</a><br>
    <a href='user_album_update.php?album_id={$albums[album_loop].album_id}'>{$user_album20}</a><br>
    <a href='user_album_delete.php?album_id={$albums[album_loop].album_id}'>{$user_album21}</a>
  </td>
  </tr>
  </table>
  </div>
{/section}

{* IF THERE ARE NO ALBUMS, SHOW NOTE *}
{if $albums_total == 0}
  <table cellpadding='0' cellspacing='0' align='center'>
  <tr><td class='result'>
    <img src='./images/icons/bulb16.gif' border='0' class='icon'>{$user_album22} <a href='user_album_add.php'>{$user_album23}</a></div>
  </td></tr>
  </table>
{/if}

</td></tr></table>
</div></div></div>

{include file='footer.tpl'}