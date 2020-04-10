{include file='admin_header.tpl'}

<h2>{$admin_profile_edittab9}</h2>
{$admin_profile_edittab10}

<br><br>

{if $is_error != 0}
<div class='error'><img src='../images/error.gif' class='icon' border='0'> {$admin_profile_edittab1}</div>
{/if}

<table cellpadding='0' cellspacing='0'>
<form action='admin_profile_edittab.php' method='POST'>
<tr>
<td class='form1'>{$admin_profile_edittab3}</td>
<td class='form2'><input type='text' class='text' size='30' name='tab_name' value='{$tab_name}' maxlength='50'></td>
</tr>
<tr>
<td class='form1'>&nbsp;</td>
<td class='form2'>

  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td><input type='submit' class='button' value='{$admin_profile_edittab4}'>&nbsp;</td>
  <input type='hidden' name='task' value='edittab'>
  <input type='hidden' name='o' value='{$o}'>
  <input type='hidden' name='tab_id' value='{$tab_id}'>
  </form>
  <form action='admin_profile_edittab.php' method='POST'>
  <td><input type='submit' class='button' value='{$admin_profile_edittab6}'>&nbsp;</td>
  <input type='hidden' name='task' value='confirmdeletetab'>
  <input type='hidden' name='o' value='{$o}'>
  <input type='hidden' name='tab_id' value='{$tab_id}'>
  </form>
  <form action='admin_profile_edittab.php' method='POST'>
  <td><input type='submit' class='button' value='{$admin_profile_edittab5}'></td>
  <input type='hidden' name='task' value='cancel'>
  <input type='hidden' name='o' value='{$o}'>
  </form>
  </tr>
  </table>

</td>
</tr>
</table>

<br>

<table cellpadding='0' cellspacing='0'>
{section name=field_loop loop=$fields}
<tr>
  {if $fields[field_loop].field_order != "first"}
    <td>&nbsp;&nbsp; <a href='admin_profile_edittab.php?task=reorder&tab_id={$tab_id}&field_id={$fields[field_loop].field_prev}&o={$o}'><img src='../images/arrow_up.gif' border='0'></a></td>
  {else}
    <td>&nbsp;&nbsp;</td>
  {/if}

  {if $fields[field_loop].field_order != "last"}
    <td>&nbsp;&nbsp; <a href='admin_profile_edittab.php?task=reorder&tab_id={$tab_id}&field_id={$fields[field_loop].field_id}&o={$o}'><img src='../images/arrow_down.gif' border='0'></a></td>
  {else}
    <td>&nbsp;&nbsp;</td>
  {/if}

  <td>&nbsp;&nbsp; {$fields[field_loop].field_title}</td>
</tr>
{/section}
</table>

<br>

<form action='admin_profile_edittab.php' method='POST'>
<input type='submit' class='button' value='{$admin_profile_edittab8}'>
<input type='hidden' name='task' value='cancel'>
<input type='hidden' name='o' value='{$o}'>
</form>

{include file='admin_footer.tpl'}