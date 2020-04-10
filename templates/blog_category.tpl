{include file='header.tpl'}

  <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1>{$blog_category1} {$blogentrycat_title}

</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">


{* SHOW BLOG ENTRIES *}
{section name=entries_loop loop=$entries}
  {* MAKE SURE TITLE IS NOT BLANK *}
  {if $entries[entries_loop].blogentry_title != ""}
    {assign var='blogentry_title' value=$entries[entries_loop].blogentry_title}
  {else}
    {assign var='blogentry_title' value='$blog_category2'}
  {/if}
  <div class='blog_entry{cycle values="1,2"}'>
    <table cellpadding='0' cellspacing='0' width='100%'>
    <tr>
    <td valign='top' width='1' style='padding-right: 10px; text-align: center;'>
      <a href='{$url->url_create('profile', $entries[entries_loop].blogentry_author->user_info.user_username)}'><img src='{$entries[entries_loop].blogentry_author->user_photo('./images/nophoto.gif')}' class='photo' width='{$misc->photo_size($entries[entries_loop].blogentry_author->user_photo('./images/nophoto.gif'),'80','80','w')}' border='0'><br>{$entries[entries_loop].blogentry_author->user_info.user_username|truncate:12:"...":true}</a>
    </td>
    <td valign='top'>
      <div class='blog_title'><a href='{$url->url_create('blog_entry', $entries[entries_loop].blogentry_author->user_info.user_username, $entries[entries_loop].blogentry_id)}'>{$blogentry_title}</a></div>
      <div class='blog_date'>
        {$datetime->cdate("`$setting.setting_timeformat` `$blog_entry21` `$setting.setting_dateformat`", $datetime->timezone($entries[entries_loop].blogentry_date, $global_timezone))} - 
        <a href='{$url->url_create('blog_entry', $entries[entries_loop].blogentry_author->user_info.user_username, $entries[entries_loop].blogentry_id)}'>{$entries[entries_loop].total_comments} {$blog_category3}</a> - 
        [ <a href='{$url->url_create('blog_entry', $entries[entries_loop].blogentry_author->user_info.user_username, $entries[entries_loop].blogentry_id)}'>{$blog_category4}</a> ]
      </div>
      <div class='blog_body'>{$entries[entries_loop].blogentry_body}</div>
    </td>
    </tr>
    </table>
  </div>
{/section}

{* DISPLAY PAGINATION MENU IF APPLICABLE *}
{if $maxpage > 1}
  <br>
  <div class='center'>
  {if $p != 1}<a href='blog_category.php?blogentrycat_id={$blogentrycat_id}&p={math equation='p-1' p=$p}'>&#171; {$blog_category6}</a>{else}<font class='disabled'>&#171; {$blog_category6}</font>{/if}
  {if $p_start == $p_end}
    &nbsp;|&nbsp; {$blog_category7} {$p_start} {$blog_category8} {$total_blogentries} &nbsp;|&nbsp; 
  {else}
    &nbsp;|&nbsp; {$blog_category9} {$p_start}-{$p_end} {$blog_category8} {$total_blogentries} &nbsp;|&nbsp; 
  {/if}
  {if $p != $maxpage}<a href='blog_category.php?blogentrycat_id={$blogentrycat_id}&p={math equation='p+1' p=$p}'>{$blog_category10} &#187;</a>{else}<font class='disabled'>{$blog_category10} &#187;</font>{/if}
  </div>
{/if}

{include file='footer.tpl'}