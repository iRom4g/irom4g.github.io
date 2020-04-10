{include file='header.tpl'}

  <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1><a href='group.php?group_id={$group->group_info.group_id}'>{$group->group_info.group_title}</a>{$group_album2}</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">

<table class='tabs' cellpadding='0' cellspacing='0' width='100%'>
<tr><td class='tab0'> </td></tr>
</table>

<table cellpadding='0' cellspacing='0' width='100%'><tr><td class='page'>
{* DISPLAY PAGINATION MENU IF APPLICABLE *}
{if $maxpage > 1}
  <br>
  <div class='center'>
  {if $p != 1}<a href='group_album.php?group_id={$group->group_info.group_id}&p={math equation='p-1' p=$p}'>&#171; {$group_album5}</a>{else}<font class='disabled'>&#171; {$group_album5}</font>{/if}
  {if $p_start == $p_end}
    &nbsp;|&nbsp; {$group_album6} {$p_start} {$group_album7} {$total_groupmedia} &nbsp;|&nbsp; 
  {else}
    &nbsp;|&nbsp; {$group_album8} {$p_start}-{$p_end} {$group_album7} {$total_groupmedia} &nbsp;|&nbsp; 
  {/if}
  {if $p != $maxpage}<a href='group_album.php?group_id={$group->group_info.group_id}&p={math equation='p+1' p=$p}'>{$group_album9} &#187;</a>{else}<font class='disabled'>{$group_album9} &#187;</font>{/if}
  </div>
{/if}

<br>

<table cellpadding='0' cellspacing='0' align='center'>
<tr>
<td>

{* SHOW FILES IN THIS ALBUM *}
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

  {* START NEW ROW *}
  {cycle name="startrow" values="<table cellpadding='0' cellspacing='0'><tr>,,,"}
  {* SHOW THUMBNAIL *}
  <td style='padding: 15px; text-align: center; vertical-align: middle;'>
    {if $files[file_loop].groupmedia_title != ""}{$files[file_loop].groupmedia_title|truncate:20:"...":true} {/if}
    <div class='album_thumb2' style='width: 120; text-align: center; vertical-align: middle;'>
      <a href='group_album_file.php?groupmedia_id={$files[file_loop].groupmedia_id}&group_id={$group->group_info.group_id}'><img src='{$file_src}' border='0'  width='{$misc->photo_size($file_src,'90','90','w')}'></a>
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
  {if $p != 1}<a href='group_album.php?group_id={$group->group_info.group_id}&p={math equation='p-1' p=$p}'>&#171; {$group_album5}</a>{else}<font class='disabled'>&#171; {$group_album5}</font>{/if}
  {if $p_start == $p_end}
    &nbsp;|&nbsp; {$group_album6} {$p_start} {$group_album7} {$total_groupmedia} &nbsp;|&nbsp; 
  {else}
    &nbsp;|&nbsp; {$group_album8} {$p_start}-{$p_end} {$group_album7} {$total_groupmedia} &nbsp;|&nbsp; 
  {/if}
  {if $p != $maxpage}<a href='group_album.php?group_id={$group->group_info.group_id}&p={math equation='p+1' p=$p}'>{$group_album9} &#187;</a>{else}<font class='disabled'>{$group_album9} &#187;</font>{/if}
  </div>
{/if}

</td></tr></table>

{include file='footer.tpl'}