{include file='header.tpl'}

  <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1> Мои заметки</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">

    <div class="clearFix tBar">
     <ul class="tabs">
      <li class="activeLink"><a href="user_blog.php" style="width:10em">Просмотр записей</a></li>
      <li ><a href="user_blog_settings.php" style="width:9em">Настройки блога</a></li>
     </ul>
    </div>

<img src='./images/icons/blog48.gif' border='0' class='icon_big'>
<div class='page_header'>{$user_blog_comments3}</div>
<div>{$user_blog_comments4}</div>

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
  <tr><td class='button' nowrap='nowrap'><a href='user_blog_editentry.php?blogentry_id={$blogentry_id}'>{$user_blog_comments5}</a></td></tr>
  </table>
</td>
<td>
  <table cellpadding='0' cellspacing='0'>
  <tr><td class='button' nowrap='nowrap'><a href='user_blog.php'>{$user_blog_comments6}</a></td></tr>
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
  <td>&nbsp;[ <a href='javascript:doCheckAll()'>{$user_blog_comments15}</a> ]</td>
  </tr>
  </table>
</td>

{* DISPLAY PAGINATION MENU IF APPLICABLE *}
{if $maxpage > 1}
  <td align='right'>
    {if $p != 1}<a href='user_blog_comments.php?blogentry_id={$blogentry_id}&p={math equation='p-1' p=$p}'>&#171; {$user_blog_comments7}</a>{else}<font class='disabled'>&#171; {$user_blog_comments7}</font>{/if}
    {if $p_start == $p_end}
      &nbsp;|&nbsp; {$user_blog_comments8} {$p_start} {$user_blog_comments9} {$total_comments} &nbsp;|&nbsp; 
    {else}
      &nbsp;|&nbsp; {$user_blog_comments10} {$p_start}-{$p_end} {$user_blog_comments9} {$total_comments} &nbsp;|&nbsp; 
    {/if}
    {if $p != $maxpage}<a href='user_blog_comments.php?blogentry_id={$blogentry_id}&p={math equation='p+1' p=$p}'>{$user_blog_comments11} &#187;</a>{else}<font class='disabled'>{$user_blog_comments11} &#187;</font>{/if}
  </td>
{/if}

</tr>
</table>

{if $total_comments == 0}
  {* DISPLAY MESSAGE IF THERE ARE NO COMMENTS *}
  <table cellpadding='0' cellspacing='0'>
  <tr><td class='result'><img src='./images/icons/bulb22.gif' class='icon' border='0'> {$user_blog_comments12}</td></tr>
  </table>

{else}
  {* LIST COMMENTS *}
  <form action='user_blog_comments.php' method='post' name='comments'>
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
     - {$datetime->cdate("`$setting.setting_timeformat` `$user_blog_comments16` `$setting.setting_dateformat`", $datetime->timezone($comments[comment_loop].comment_date, $global_timezone))}
    </div>
    {$comments[comment_loop].comment_body}
    </td>
    </tr>
    </table>
  {/section}

  <br>

  <input type='submit' class='button' value='{$user_blog_comments14}'>
  <input type='hidden' name='task' value='delete'>
  <input type='hidden' name='p' value='{$p}'>
  <input type='hidden' name='blogentry_id' value='{$blogentry_id}'>
  </form>
{/if}


{include file='footer.tpl'}