{include file='header.tpl'}

<div class='page_header'><a href='{$url->url_base}group.php?group_id={$group->group_info.group_id}'>{$group->group_info.group_title}</a> &#187; <a href='group_discussion.php?group_id={$group->group_info.group_id}'>{$group_discussion_delete11}</a> &#187; {if $grouppost_id == 0}{$group_discussion_delete4}{else}{$group_discussion_delete5}{/if}</div>

<br>

<form action='group_discussion_delete.php' method='post'>

{if $grouppost_id == 0}
  {$group_discussion_delete6}
{else}
  {$group_discussion_delete7}
{/if}

<br><br>

<table cellpadding='0' cellspacing='0'>
<tr>
<td>
  <input type='submit' class='button' value='{if $grouppost_id == 0}{$group_discussion_delete8}{else}{$group_discussion_delete9}{/if}'>&nbsp;
  <input type='hidden' name='task' value='delete'>
  <input type='hidden' name='group_id' value='{$group->group_info.group_id}'>
  <input type='hidden' name='grouptopic_id' value='{$grouptopic_id}'>
  <input type='hidden' name='grouppost_id' value='{$grouppost_id}'>
  </form>
</td>
<td>
  <form action='group_discussion_view.php' method='get'>
  <input type='submit' class='button' value='{$group_discussion_delete10}'>
  <input type='hidden' name='task' value='cancel'>
  <input type='hidden' name='group_id' value='{$group->group_info.group_id}'>
  {if $grouppost_id != 0}<input type='hidden' name='grouptopic_id' value='{$grouptopic_id}'>{/if}
  </form>
</td>
</tr>
</table>

{include file='footer.tpl'}