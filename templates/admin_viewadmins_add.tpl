{include file='admin_header.tpl'}

<h2>{$admin_viewadmins_add1}</h2>
{$admin_viewadmins_add2}

<br><br>

<div class='error'>{$error_message}</div>

<table cellpadding='0' cellspacing='0'>
<form action='admin_viewadmins_add.php' method='POST'>
<tr>
<td class='form1'>{$admin_viewadmins_add3}</td>
<td class='form2'><input type='text' class='text' name='admin_username' value='{$admin_username}' maxlength='50'></td>
</tr>
<tr>
<td class='form1'>{$admin_viewadmins_add4}</td>
<td class='form2'><input type='password' class='text' name='admin_password' maxlength='50'></td>
</tr>
<tr>
<td class='form1'>{$admin_viewadmins_add5}</td>
<td class='form2'><input type='password' class='text' name='admin_password_confirm' maxlength='50'></td>
</tr>
<tr>
<td class='form1'>{$admin_viewadmins_add6}</td>
<td class='form2'><input type='text' class='text' name='admin_name' value='{$admin_name}' maxlength='50'></td>
</tr>
<tr>
<td class='form1'>{$admin_viewadmins_add7}</td>
<td class='form2'><input type='text' class='text' name='admin_email' value='{$admin_email}' maxlength='70'></td>
</tr>
<tr>
<td>&nbsp;</td>
<td class='form2'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td><input type='submit' class='button' value='{$admin_viewadmins_add8}'>&nbsp;</td>
  <input type='hidden' name='task' value='addadmin'>
  </form>
  <form action='admin_viewadmins_add.php' method='POST'>
  <td><input type='submit' class='button' value='{$admin_viewadmins_add9}'></td>
  <input type='hidden' name='task' value='cancel'>
  </form>
</td>
</tr>
</table>

<br>



{include file='admin_footer.tpl'}