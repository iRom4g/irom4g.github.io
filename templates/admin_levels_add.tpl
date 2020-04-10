{include file='admin_header.tpl'}

<h2>{$admin_levels_add1}</h2>
{$admin_levels_add2}

<br><br>

{if $is_error != 0}
<div class='error'><img src='../images/error.gif' border='0' class='icon'> {$error_message}</div>
{/if}

<table cellpadding='0' cellspacing='0'>
<form action='admin_levels_add.php' method='POST'>
<tr>
<td class='form1'>{$admin_levels_add3}</td>
<td class='form2'><input type='text' class='text' name='level_name' value='{$level_name}' size='40' maxlength='50'></td>
</tr>
<tr>
<td class='form1'>{$admin_levels_add4}</td>
<td class='form2'><textarea name='level_desc' rows='4' cols='40' class='text'>{$level_desc}</textarea></td>
</tr>
<tr>
<td class='form1'>&nbsp;</td>
<td class='form2'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td><input type='submit' class='button' value='{$admin_levels_add5}'>&nbsp;</td>
  <input type='hidden' name='task' value='createlevel'>
  </form>
  <form action='admin_levels.php' method='POST'>
  <td><input type='submit' class='button' value='{$admin_levels_add6}'></td>
  </tr>
  </form>
  </table>
</td>
</tr>
</table>




{include file='admin_footer.tpl'}