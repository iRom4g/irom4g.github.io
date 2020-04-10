{include file='header.tpl'}
<link rel='stylesheet' href='css/search.css' type='text/css' /><link rel='stylesheet' href='css/photos.css?18' type='text/css' />

  <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1><a href='{$url->url_create('profile', $owner->user_info.user_username)}'>{$owner->user_info.user_username}</a> » <a href='{$url->url_create('albums', $owner->user_info.user_username)}'>{$album6}</a> &#187; {$album_title}

</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">



{* SET ALBUM TITLE *}
{if $album_title == ""}{assign var="album_title" value=$album4}{/if}

<div class='page_header'><a href='{$url->url_create('profile', $owner->user_info.user_username)}'>{$owner->user_info.user_username}</a>{$album5} <a href='{$url->url_create('albums', $owner->user_info.user_username)}'>{$album6}</a> &#187; {$album_title}</div>

{if $album_desc != ""}<div>{$album_desc}</div>{/if}

{* DISPLAY PAGINATION MENU IF APPLICABLE *}
{if $maxpage > 1}
  <br>
  <div class='center'>
  {if $p != 1}<a href='{$url->url_create('album', $owner->user_info.user_username, $album_id)}/&p={math equation='p-1' p=$p}'>&#171; {$album9}</a>{else}<font class='disabled'>&#171; {$album9}</font>{/if}
  {if $p_start == $p_end}
    &nbsp;|&nbsp; {$album10} {$p_start} {$album11} {$total_files} &nbsp;|&nbsp; 
  {else}
    &nbsp;|&nbsp; {$album12} {$p_start}-{$p_end} {$album11} {$total_files} &nbsp;|&nbsp; 
  {/if}
  {if $p != $maxpage}<a href='{$url->url_create('album', $owner->user_info.user_username, $album_id)}/&p={math equation='p+1' p=$p}'>{$album13} &#187;</a>{else}<font class='disabled'>{$album13} &#187;</font>{/if}
  </div>
{/if}

<br>

<table cellpadding='0' cellspacing='0' align='center'>
<tr>
<td>

{* SHOW FILES IN THIS ALBUM *}
{section name=files_loop loop=$files}

  {* IF IMAGE, GET THUMBNAIL *}
  {if $files[files_loop].media_ext == "jpeg" OR $files[files_loop].media_ext == "jpg" OR $files[files_loop].media_ext == "gif" OR $files[files_loop].media_ext == "png" OR $files[files_loop].media_ext == "bmp"}
    {assign var='file_dir' value=$url->url_userdir($owner->user_info.user_id)}
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

  {* START NEW ROW *}
  {cycle name="startrow" values="<table cellpadding='0' cellspacing='0'><tr>,,,"}
  {* SHOW THUMBNAIL *}
  <td style='padding: 15px; text-align: center; vertical-align: middle;'>
    {$files[files_loop].media_title|truncate:20:"...":true}&nbsp;
    <div class='album_thumb2' style='width: 120; text-align: center; vertical-align: middle;'>
      <a href='{$url->url_create('album_file', $owner->user_info.user_username, $album_id, $files[files_loop].media_id)}'><img src='{$file_src}' border='0' width='{$misc->photo_size($file_src,'90','90','w')}'></a>
    </div>
  </td>
  {* END ROW AFTER 3 RESULTS *}
  {if $smarty.section.files_loop.last == true}
    </tr></table>
  {else}
    {cycle name="endrow" values=",,,</tr></table>"}
  {/if}

{/section}

</td>
</tr>
</table>

{* DISPLAY PAGINATION MENU IF APPLICABLE *}
{if $maxpage > 1}
  <br>
  <div class='center'>
  {if $p != 1}<a href='{$url->url_create('album', $owner->user_info.user_username, $album_id)}/&p={math equation='p-1' p=$p}'>&#171; {$album9}</a>{else}<font class='disabled'>&#171; {$album9}</font>{/if}
  {if $p_start == $p_end}
    &nbsp;|&nbsp; {$album10} {$p_start} {$album11} {$total_files} &nbsp;|&nbsp; 
  {else}
    &nbsp;|&nbsp; {$album12} {$p_start}-{$p_end} {$album11} {$total_files} &nbsp;|&nbsp; 
  {/if}
  {if $p != $maxpage}<a href='{$url->url_create('album', $owner->user_info.user_username, $album_id)}/&p={math equation='p+1' p=$p}'>{$album13} &#187;</a>{else}<font class='disabled'>{$album13} &#187;</font>{/if}
  </div>
{/if}

{include file='footer.tpl'}