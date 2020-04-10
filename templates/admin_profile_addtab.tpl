{include file='admin_header.tpl'}

<h2>{$admin_profile_addtab6}</h2>
{$admin_profile_addtab2}

<br><br>

{if $is_error != 0}
<div class='error'><img src='../images/error.gif' class='icon' border='0'> {$admin_profile_addtab1}</div>
{/if}

<table cellpadding='0' cellspacing='0'>
<form action='admin_profile_addtab.php' method='POST'>
<tr>
<td class='form1'>{$admin_profile_addtab3}</td>
<td><input type='text' name='tab_name' size='40' class='text' value='{$tab_name}' maxlength='50'></td>
</tr>
<tr>
<td class='form1'>&nbsp;</td>
<td>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td><input type='submit' value='{$admin_profile_addtab4}' class='button'>&nbsp;</td>
  <input type='hidden' name='task' value='addtab'>
  <input type='hidden' name='o' value='{$o}'>
  </form>
  <form action='admin_profile_addtab.php' method='POST'>
  <td>
  <input type='submit' value='{$admin_profile_addtab5}' class='button'></td>
  <input type='hidden' name='task' value='cancel'>
  <input type='hidden' name='o' value='{$o}'>
  </form>
  </tr>
  </table>
</td>
</tr>
</table>


{include file='admin_footer.tpl'}