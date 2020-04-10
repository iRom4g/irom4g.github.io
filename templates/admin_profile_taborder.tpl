{include file='admin_header.tpl'}

<h2>{$admin_profile_taborder1}</h2>
{$admin_profile_taborder2}

<br><br>

<table cellpadding='0' cellspacing='0'>
{section name=tab_loop loop=$tabs}
<tr>
  {if $tabs[tab_loop].tab_order != "first"}
    <td>&nbsp;&nbsp; <a href='admin_profile_taborder.php?task=reorder&tab_id={$tabs[tab_loop].tab_prev}&o={$o}'><img src='../images/arrow_up.gif' border='0'></a></td>
  {else}
    <td>&nbsp;&nbsp;</td>
  {/if}

  {if $tabs[tab_loop].tab_order != "last"}
    <td>&nbsp;&nbsp; <a href='admin_profile_taborder.php?task=reorder&tab_id={$tabs[tab_loop].tab_id}&o={$o}'><img src='../images/arrow_down.gif' border='0'></a></td>
  {else}
    <td>&nbsp;&nbsp;</td>
  {/if}

  <td>&nbsp;&nbsp; {$tabs[tab_loop].tab_name}</td>

</tr>
{/section}
</table>

<br>

<form action='admin_profile_edittab.php' method='POST'>
<input type='submit' class='button' value='{$admin_profile_taborder3}'>
<input type='hidden' name='task' value='cancel'>
<input type='hidden' name='o' value='{$o}'>
</form>

{include file='admin_footer.tpl'}