{* BEGIN GROUPS *}
{if $total_groups != 0}
  <table cellpadding='0' cellspacing='0' width='100%' style='margin-bottom: 10px;'>
  <tr><td class='header'>{$header_group2} ({$total_groups})</td></tr>
  <tr>
  <td class='profile'>
    {section name=group_loop loop=$groups}
      <a href='group.php?group_id={$groups[group_loop].group->group_info.group_id}'>{$groups[group_loop].group->group_info.group_title}</a>{if !$smarty.section.group_loop.last},{/if}
    {/section}
  </td>
  </tr>
  </table>
{/if}
{* END GROUPS *}