{include file='admin_header.tpl'}

<h2>{$admin_profile_editdepfield1}</h2>
{$admin_profile_editdepfield2}

<br><br>

<table cellpadding='0' cellspacing='0'>
<form action='admin_profile_editdepfield.php' method='POST'>
<tr>
<td class='form1'>{$admin_profile_editdepfield12}</td>
<td class='form2'><a href='admin_profile_editfield.php?field_id={$field_parent_id}&o={$o}'>{$field_parent_title}</a></td>
</tr>
<tr>
<td class='form1'>{$admin_profile_editdepfield3}</td>
<td class='form2'><input type='text' class='text' name='field_title' value='{$field_title}' maxlength='100' size='30'></td>
</tr>
<tr>
<td class='form1'>{$admin_profile_editdepfield4}</td>
<td class='form2'><input type='text' class='text' name='field_style' value='{$field_style}' maxlength='200' size='30'></td>
</tr>
<tr>
<td class='form1'>{$admin_profile_editdepfield14}</td>
<td class='form2'>
<select name='field_required' class='text'>
<option value='0'{if $field_required == 0} SELECTED{/if}>{$admin_profile_editdepfield16}</option>
<option value='1'{if $field_required == 1} SELECTED{/if}>{$admin_profile_editdepfield15}</option>
</select>
</td>
</tr>
<tr>
<td class='form1'>{$admin_profile_editdepfield17}</td>
<td class='form2'>
<select name='field_browsable' class='text'>
<option value='2'{if $field_browsable == 2} SELECTED{/if}>{$admin_profile_editdepfield18}</option>
<option value='-1'{if $field_browsable == -1} SELECTED{/if}>{$admin_profile_editdepfield19}</option>
</select>
</td>
</tr>
<tr>
<td class='form1' width='150'>{$admin_profile_editdepfield13}</td>
<td class='form2'>
<select name='field_maxlength' class='text'>
<option{if $field_maxlength == 50} SELECTED{/if}>50</option>
<option{if $field_maxlength == 100} SELECTED{/if}>100</option>
<option{if $field_maxlength == 150} SELECTED{/if}>150</option>
<option{if $field_maxlength == 200} SELECTED{/if}>200</option>
<option{if $field_maxlength == 250} SELECTED{/if}>250</option>
</select>
</td>
</tr>
<tr>
<td class='form1'>{$admin_profile_editdepfield5}</td>
<td class='form2'>
<input type='text' class='text' name='field_link' value='{$field_link}' size='30' maxlength='250'>
<br>{$admin_profile_editdepfield6}
</td>
</tr>
<tr>
<td class='form1'>{$admin_profile_editdepfield7}</td>
<td class='form2'><input type='text' class='text' name='field_regex' value='{$field_regex}' maxlength='250' size='30'><br>{$admin_profile_editdepfield8}</td>
</tr>
<tr>
<td class='form1'>&nbsp;</td>
<td class='form2'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td><input type='submit' class='button' value='{$admin_profile_editdepfield10}'>&nbsp;</td>
  <input type='hidden' name='task' value='editdepfield'>
  <input type='hidden' name='field_id' value='{$field_id}'>
  <input type='hidden' name='o' value='{$o}'>
  </form>
  <form action='admin_profile_editdepfield.php' method='POST'>
  <td><input type='submit' class='button' value='{$admin_profile_editdepfield11}'></td>
  <input type='hidden' name='task' value='cancel'>
  <input type='hidden' name='field_id' value='{$field_id}'>
  <input type='hidden' name='o' value='{$o}'>
  </tr>
  </table>
</td>
</tr>
</table>

{include file='admin_footer.tpl'}