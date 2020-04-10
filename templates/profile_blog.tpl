{* BEGIN BLOG ENTRIES *}
{if $owner->level_info.level_blog_allow != 0 AND $total_entries > 0}

  <table cellpadding='0' cellspacing='0' width='100%' style='margin-bottom: 10px;'>
  <tr><td class='header'>
    {$header_blog2} ({$total_entries})
    {* IF MORE THAN 5 ENTRIES, SHOW VIEW MORE LINKS *}
    {if $total_entries > 5}&nbsp;[ <a href='{$url->url_create('blog', $owner->user_info.user_username)}'>{$header_blog3}</a> ]{/if}
  </td></tr>
  <tr>
  <td class='profile'>
    {* LOOP THROUGH FIRST 5 BLOG ENTRIES *}
    {section name=entry_loop loop=$entries}
      <div class='profile_blogentry'>
        <a href='{$url->url_create('blog_entry', $owner->user_info.user_username, $entries[entry_loop].blogentry_id)}'><img src='./images/icons/blog16.gif' border='0' class='icon'>{if $entries[entry_loop].blogentry_title == ""}{$header_blog4}{else}{$entries[entry_loop].blogentry_title|truncate:35:"...":true}{/if}</a>
      </div>
      <div class='profile_blogentry_date'>
        {$header_blog5} {$datetime->time_since($entries[entry_loop].blogentry_date)}
      </div>
    {/section}
  </td>
  </tr>
  </table>

{/if}