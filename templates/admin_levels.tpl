{include file='admin_header.tpl'}

<h2>{$admin_levels1}</h2>
{$admin_levels2}

<br><br>

{if $is_error != 0}
  <div class='error'><img src='../images/error.gif' border='0' class='icon'> {$admin_levels15}</div>
{/if}

{if $result == 2}
  <div class='success'><img src='../images/success.gif' class='icon' border='0'> {$admin_levels16}</div>
{/if}

<form action='admin_levels_add.php' method='GET'>
<input type='submit' class='button' value='{$admin_levels3}'>
</form>

<br>

<table cellpadding='0' cellspacing='0' class='list'>
<tr>
<td class='header' width='10'><a class='header' href='admin_levels.php?s={$i}'>{$admin_levels4}</a></td>
<td class='header'><a class='header' href='admin_levels.php?s={$n}'>{$admin_levels5}</a></td>
<td class='header' align='center'><a class='header' href='admin_levels.php?s={$u}'>{$admin_levels6}</td>
<td class='header' align='center'>{$admin_levels14}</td>
<td class='header' width='100'>{$admin_levels7}</td>
</tr>
{section name=level_loop loop=$levels}
  <tr class='{cycle values="background2,background1"}'>
  <td class='item'>{$levels[level_loop].level_id}</td>
  <td class='item'>{$levels[level_loop].level_name}</td>
  <td class='item' align='center'><a href='admin_viewusers.php?f_level={$levels[level_loop].level_id}'>{$levels[level_loop].level_users} {$admin_levels17}</a></td>
  <td class='item' align='center'><a href='admin_levels.php?task=savechanges&default={$levels[level_loop].level_id}'><img src='../images/icons/{if $levels[level_loop].level_default == 1}admin_checkbox2.gif{else}admin_checkbox1.gif{/if}' border='0' class='icon'></a></td>
  <td class='item'>[ <a href='admin_levels_edit.php?level_id={$levels[level_loop].level_id}'>{$admin_levels8}</a> ] [ <a href='admin_levels.php?task=confirm&level_id={$levels[level_loop].level_id}'>{$admin_levels9}</a> ]</td>
  </tr>
{/section}
</table>

{include file='admin_footer.tpl'}