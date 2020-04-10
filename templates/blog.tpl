{include file='header.tpl'}

  <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1><a href='{$url->url_create('profile', $owner->user_info.user_username)}'>{$owner->user_info.user_username}</a>{$blog2}

</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">



{* SHOW NO ENTRIES MESSAGE IF NECESSARY *}
{if $total_blogentries == 0}
  <table cellpadding='0' cellspacing='0'>
  <tr><td class='result'>
    <img src='./images/icons/bulb22.gif' border='0' class='icon'> <b><a href='{$url->url_create('profile', $owner->user_info.user_username)}'>{$owner->user_info.user_username}</a></b> {$blog3}
  </td></tr>
  </table>
{/if}

{* SHOW BLOG ENTRIES *}
{section name=entries_loop loop=$entries}
  {* MAKE SURE TITLE IS NOT BLANK *}
  {if $entries[entries_loop].blogentry_title != ""}
    {assign var='blogentry_title' value=$entries[entries_loop].blogentry_title}
  {else}
    {assign var='blogentry_title' value=$blog4}
  {/if}
  <div class='blog_entry{cycle values="1,2"}'>
    <table cellpadding='0' cellspacing='0' width='100%'>
    <tr>
    <td valign='top' width='1' style='padding-top: 1px;'><img src='./images/icons/blogentry16.gif' border='0' class='icon'></td>
    <td valign='top'>
      <div class='blog_title'><a href='{$url->url_create('blog_entry', $owner->user_info.user_username, $entries[entries_loop].blogentry_id)}'>{$blogentry_title}</a></div>
      <div class='blog_date'>
        {$datetime->cdate("`$setting.setting_timeformat` `$blog_entry21` `$setting.setting_dateformat`", $datetime->timezone($entries[entries_loop].blogentry_date, $global_timezone))} - 
        <a href='{$url->url_create('blog_entry', $owner->user_info.user_username, $entries[entries_loop].blogentry_id)}'>{$entries[entries_loop].total_comments} {$blog5}</a>
        {if $entries[entries_loop].allowed_to_comment != 0} - [ <a href='{$url->url_create('blog_entry', $owner->user_info.user_username, $entries[entries_loop].blogentry_id)}'>{$blog6}</a> ]{/if}
      </div>
      {* SHOW ENTRY CATEGORY *}
      {if $entries[entries_loop].blogentry_blogentrycat_title != ""}
        <div class='blog_category'>Filed under: <a href='blog_category.php?blogentrycat_id={$entries[entries_loop].blogentry_blogentrycat_id}'>{$entries[entries_loop].blogentry_blogentrycat_title}</a></div>
      {/if}
      <div class='blog_body'>{$entries[entries_loop].blogentry_body|choptext:75:"<br>"}</div>
    </td>
    </tr>
    </table>
  </div>
{/section}

{* DISPLAY PAGINATION MENU IF APPLICABLE *}
{if $maxpage > 1}
  <br>
  <div class='center'>
  {if $p != 1}<a href='{$url->url_create('blog', $owner->user_info.user_username)}&p={math equation='p-1' p=$p}'>&#171; {$blog7}</a>{else}<font class='disabled'>&#171; {$blog7}</font>{/if}
  {if $p_start == $p_end}
    &nbsp;|&nbsp; {$blog8} {$p_start} {$blog9} {$total_blogentries} &nbsp;|&nbsp; 
  {else}
    &nbsp;|&nbsp; {$blog10} {$p_start}-{$p_end} {$blog9} {$total_blogentries} &nbsp;|&nbsp; 
  {/if}
  {if $p != $maxpage}<a href='{$url->url_create('blog', $owner->user_info.user_username)}&p={math equation='p+1' p=$p}'>{$blog11} &#187;</a>{else}<font class='disabled'>{$blog11} &#187;</font>{/if}
  </div>
{/if}

{include file='footer.tpl'}