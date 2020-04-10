{include file='header.tpl'}

  <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1>{$event->event_info.event_title}</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">

<div class='page_header'><img src='./images/icons/album22.gif' border='0' class='icon'> <a href='event.php?event_id={$event->event_info.event_id}'>{$event->event_info.event_title}</a>{$event_album2}</div>

{* DISPLAY PAGINATION MENU IF APPLICABLE *}
{if $maxpage > 1}
  <br>
  <div class='center'>
  {if $p != 1}<a href='event_album.php?event_id={$event->event_info.event_id}&p={math equation='p-1' p=$p}'>&#171; {$event_album5}</a>{else}<font class='disabled'>&#171; {$event_album5}</font>{/if}
  {if $p_start == $p_end}
    &nbsp;|&nbsp; {$event_album6} {$p_start} {$event_album7} {$total_eventmedia} &nbsp;|&nbsp; 
  {else}
    &nbsp;|&nbsp; {$event_album8} {$p_start}-{$p_end} {$event_album7} {$total_eventmedia} &nbsp;|&nbsp; 
  {/if}
  {if $p != $maxpage}<a href='event_album.php?event_id={$event->event_info.event_id}&p={math equation='p+1' p=$p}'>{$event_album9} &#187;</a>{else}<font class='disabled'>{$event_album9} &#187;</font>{/if}
  </div>
{/if}

<br>

<table cellpadding='0' cellspacing='0' align='center'>
<tr>
<td>

{* SHOW FILES IN THIS ALBUM *}
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

  {* START NEW ROW *}
  {cycle name="startrow" values="<table cellpadding='0' cellspacing='0'><tr>,,,"}
  {* SHOW THUMBNAIL *}
  <td style='padding: 15px; text-align: center; vertical-align: middle;'>
    {$files[file_loop].eventmedia_title|truncate:20:"...":true}
    <div class='album_thumb2' style='width: 120; text-align: center; vertical-align: middle;'>
      <a href='event_album_file.php?eventmedia_id={$files[file_loop].eventmedia_id}&event_id={$event->event_info.event_id}'><img src='{$file_src}' border='0'  width='{$misc->photo_size($file_src,'90','90','w')}'></a>
    </div>
  </td>
  {* END ROW AFTER 3 RESULTS *}
  {if $smarty.section.file_loop.last == true}
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
  {if $p != 1}<a href='event_album.php?event_id={$event->event_info.event_id}&p={math equation='p-1' p=$p}'>&#171; {$event_album5}</a>{else}<font class='disabled'>&#171; {$event_album5}</font>{/if}
  {if $p_start == $p_end}
    &nbsp;|&nbsp; {$event_album6} {$p_start} {$event_album7} {$total_eventmedia} &nbsp;|&nbsp; 
  {else}
    &nbsp;|&nbsp; {$event_album8} {$p_start}-{$p_end} {$event_album7} {$total_eventmedia} &nbsp;|&nbsp; 
  {/if}
  {if $p != $maxpage}<a href='event_album.php?event_id={$event->event_info.event_id}&p={math equation='p+1' p=$p}'>{$event_album9} &#187;</a>{else}<font class='disabled'>{$event_album9} &#187;</font>{/if}
  </div>
{/if}


{include file='footer.tpl'}