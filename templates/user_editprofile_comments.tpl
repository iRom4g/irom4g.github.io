{include file='header.tpl'}

<table class='tabs' cellpadding='0' cellspacing='0'>
<tr>
<td class='tab0'>&nbsp;</td>
{section name=tab_loop loop=$tabs}
  <td class='tab2' NOWRAP><a href='user_editprofile.php?tab_id={$tabs[tab_loop].tab_id}'>{$tabs[tab_loop].tab_name}</a><td class='tab'>&nbsp;</td></td>
{/section}
{if $user->level_info.level_profile_status != 0}<td class='tab2' NOWRAP><a href='user_editprofile_status.php'>{$user_editprofile_comments1}</a></td><td class='tab'>&nbsp;</td>{/if}
{if $user->level_info.level_photo_allow != 0}<td class='tab2' NOWRAP><a href='user_editprofile_photo.php'>{$user_editprofile_comments2}</a></td><td class='tab'>&nbsp;</td>{/if}
<td class='tab1' NOWRAP><a href='user_editprofile_comments.php'>{$user_editprofile_comments4}</td><td class='tab'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='user_editprofile_settings.php'>{$user_editprofile_comments5}</a></td>
<td class='tab3'>&nbsp;</td>
</tr>
</table>

<img src='./images/icons/editprofile48.gif' border='0' class='icon_big'>
<div class='page_header'>{$user_editprofile_comments6}</div>
<div>{$user_editprofile_comments7}</div>

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

<table cellpadding='0' cellspacing='0' width='100%'>
<tr>
<td width='150'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td><input type='checkbox' name='select_all' id='select_all' onClick='doCheckAll()'></td>
  <td>&nbsp;[ <a href='javascript:doCheckAll()'>{$user_editprofile_comments8}</a> ]</td>
  </tr>
  </table>
</td>

{* DISPLAY PAGINATION MENU IF APPLICABLE *}
{if $maxpage > 1}
  <td align='right'>
    {if $p != 1}<a href='user_editprofile_comments.php?p={math equation='p-1' p=$p}'>&#171; {$user_editprofile_comments9}</a>{else}<font class='disabled'>&#171; {$user_editprofile_comments9}</font>{/if}
    {if $p_start == $p_end}
      &nbsp;|&nbsp; {$user_editprofile_comments10} {$p_start} {$user_editprofile_comments11} {$total_comments} &nbsp;|&nbsp; 
    {else}
      &nbsp;|&nbsp; {$user_editprofile_comments12} {$p_start}-{$p_end} {$user_editprofile_comments11} {$total_comments} &nbsp;|&nbsp; 
    {/if}
    {if $p != $maxpage}<a href='user_editprofile_comments.php?p={math equation='p+1' p=$p}'>{$user_editprofile_comments13} &#187;</a>{else}<font class='disabled'>{$user_editprofile_comments13} &#187;</font>{/if}
  </td>
{/if}

</tr>
</table>


{if $total_comments == 0}
  {* DISPLAY MESSAGE IF THERE ARE NO COMMENTS *}
  <table cellpadding='0' cellspacing='0'>
  <tr><td class='result'><img src='./images/icons/bulb22.gif' class='icon' border='0'> {$user_editprofile_comments14}</td></tr>
  </table>


{else}
  {* LIST COMMENTS *}
  <form action='user_editprofile_comments.php' method='post' name='comments'>
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
     - {$datetime->cdate("`$setting.setting_timeformat` `$user_editprofile_comments3` `$setting.setting_dateformat`", $datetime->timezone($comments[comment_loop].comment_date, $global_timezone))}
    </div>
    {$comments[comment_loop].comment_body}
    </td>
    </tr>
    </table>
  {/section}

  <br>

  <input type='submit' class='button' value='{$user_editprofile_comments16}'>
  <input type='hidden' name='task' value='delete'>
  <input type='hidden' name='p' value='{$p}'>
  </form>
{/if}

{include file='footer.tpl'}