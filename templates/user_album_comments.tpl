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
	  <li class="activeLink"><a href="user_album.php" style="width:7em">{$user_album_comments1}</a></li>
        <li><a href="user_album_settings.php" style="width:11em">{$user_album_comments2}</a></li>
        <li><a href="user_album_friends.php" style="width:11.5em">{$user_album_comments3}</a></li>
     </ul>
    </div>

<img src='./images/icons/image48.gif' border='0' class='icon_big'>
<div class='page_header'>{$user_album_comments4}</div>
<div>{$user_album_comments5}</div>

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

<table cellpadding='0' cellspacing='0'>
<tr>
<td style='padding-right: 10px;'>
  <table cellpadding='0' cellspacing='0'>
  <tr><td class='button' nowrap='nowrap'><a href='user_album_update.php?album_id={$album_id}'>{$user_album_comments6}</a></td></tr>
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
  <td>&nbsp;[ <a href='javascript:doCheckAll()'>{$user_album_comments15}</a> ]</td>
  </tr>
  </table>
</td>

{* DISPLAY PAGINATION MENU IF APPLICABLE *}
{if $maxpage > 1}
  <td align='right'>
  {if $p != 1}<a href='user_album_comments.php?album_id={$album_id}&media_id={$media_id}&p={math equation='p-1' p=$p}'>&#171; {$user_album_comments7}</a>{else}<font class='disabled'>&#171; {$user_album_comments7}</font>{/if}
  {if $p_start == $p_end}
    &nbsp;|&nbsp; {$user_album_comments8} {$p_start} {$user_album_comments9} {$total_comments} &nbsp;|&nbsp; 
  {else}
    &nbsp;|&nbsp; {$user_album_comments10} {$p_start}-{$p_end} {$user_album_comments9} {$total_comments} &nbsp;|&nbsp; 
  {/if}
  {if $p != $maxpage}<a href='user_album_comments.php?album_id={$album_id}&media_id={$media_id}&p={math equation='p+1' p=$p}'>{$user_album_comments11} &#187;</a>{else}<font class='disabled'>{$user_album_comments11} &#187;</font>{/if}
  </td>
{/if}

</tr>
</table>




{if $total_comments == 0}
  {* DISPLAY MESSAGE IF THERE ARE NO COMMENTS *}
  <table cellpadding='0' cellspacing='0'>
  <tr><td class='result'><img src='./images/icons/bulb22.gif' class='icon' border='0'> {$user_album_comments12}</td></tr>
  </table>

{else}
  {* SHOW COMMENTS IF THERE ARE ANY *}
  <form action='user_album_comments.php' method='post' name='comments'>
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
     - {$datetime->cdate("`$setting.setting_timeformat` `$user_album_comments16` `$setting.setting_dateformat`", $datetime->timezone($comments[comment_loop].comment_date, $global_timezone))}
    </div>
    {$comments[comment_loop].comment_body}
    </td>
    </tr>
    </table>
  {/section}

  <br>

  <input type='submit' class='button' value='{$user_album_comments14}'>
  <input type='hidden' name='task' value='delete'>
  <input type='hidden' name='p' value='{$p}'>
  <input type='hidden' name='album_id' value='{$album_id}'>
  <input type='hidden' name='media_id' value='{$media_id}'>
  </form>
{/if}


</td></tr></table>

{include file='footer.tpl'}