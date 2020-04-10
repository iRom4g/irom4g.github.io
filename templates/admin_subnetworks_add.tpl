{include file='admin_header.tpl'}

<h2>{$admin_subnetworks_add1}</h2>
{$admin_subnetworks_add2}

<br><br>

{if $error_message != ""}
<div class='error'><img src='../images/error.gif' class='icon' border='0'> {$error_message}</div>
{/if}

<table cellpadding='0' cellspacing='0'>
<form action='admin_subnetworks_add.php' method='POST'>
<tr>
<td class='form1'>{$admin_subnetworks_add3}</td>
<td class='form2'><input type='text' class='text' name='subnet_name' value='{$subnet_name}' size='40' maxlength='50'></td>
</tr>
<tr>
<td class='form1'>{$admin_subnetworks_add4}</td>
<td class='form2'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td>
  <select class='text'>
  <option>{$primary_field_title}</option>
  </select>&nbsp;
  </td>
  <td>
  <select class='text' name='subnet_field1_qual'>
  <option></option>
  <option value='=='{if $field1_qual == "=="} SELECTED{/if}>{$admin_subnetworks_add6}</option>
  <option value='!='{if $field1_qual == "!="} SELECTED{/if}>{$admin_subnetworks_add7}</option>
  <option value='>'{if $field1_qual == ">"} SELECTED{/if}>{$admin_subnetworks_add8}</option>
  <option value='<'{if $field1_qual == "<"} SELECTED{/if}>{$admin_subnetworks_add9}</option>
  <option value='>='{if $field1_qual == ">="} SELECTED{/if}>{$admin_subnetworks_add10}</option>
  <option value='<='{if $field1_qual == "<="} SELECTED{/if}>{$admin_subnetworks_add11}</option>
  </select>&nbsp;
  </td>
  <td>
    {* TEXT FIELD *}
    {if $primary_field.field_type == 1 OR $primary_field.field_type == 2}
      <input type='text' class='text' name='subnet_field1_value' value='{$subnet_field1_value}' maxlength='250' size='30'>

    {* SELECT BOX *}
    {elseif $primary_field.field_type == 3 OR $primary_field.field_type == 4}
      <select name='subnet_field1_value'>
      <option></option>
      {* LOOP THROUGH FIELD OPTIONS *}
      {section name=option_loop loop=$primary_field.field_options}
        <option value='{$primary_field.field_options[option_loop].option_id}'{$primary_field.field_options[option_loop].option_value}>{$primary_field.field_options[option_loop].option_label}</option>
      {/section}
      </select>

    {* DATE FIELD *}
    {elseif $primary_field.field_type == 5}
      <select name='subnet_field1_value_1'>
      {section name=date1 loop=$primary_field.date_array1}
        <option value='{$primary_field.date_array1[date1].value}'{$primary_field.date_array1[date1].selected}>{$primary_field.date_array1[date1].name}</option>
      {/section}
      </select>
 
      <select name='subnet_field1_value_2'>
      {section name=date2 loop=$primary_field.date_array2}
        <option value='{$primary_field.date_array2[date2].value}'{$primary_field.date_array2[date2].selected}>{$primary_field.date_array2[date2].name}</option>
      {/section}
      </select>

      <select name='subnet_field1_value_3'>
      {section name=date3 loop=$primary_field.date_array3}
        <option value='{$primary_field.date_array3[date3].value}'{$primary_field.date_array3[date3].selected}>{$primary_field.date_array3[date3].name}</option>
      {/section}
      </select>
    {/if}
  </td>
  </tr>
  </table>
</td>
</tr>
{if $secondary_field_id != -1}
<tr>
<td class='form1'>&nbsp;</td>
<td class='form2'>{$admin_subnetworks_add5}</td>
</tr>
<tr>
<td class='form1'>&nbsp;</td>
<td class='form2'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td>
  <select class='text'>
  <option>{$secondary_field_title}</option>
  </select>&nbsp;
  </td>
  <td>
  <select class='text' name='subnet_field2_qual'>
  <option></option>
  <option value='=='{if $field2_qual == "=="} SELECTED{/if}>{$admin_subnetworks_add6}</option>
  <option value='!='{if $field2_qual == "!="} SELECTED{/if}>{$admin_subnetworks_add7}</option>
  <option value='>'{if $field2_qual == ">"} SELECTED{/if}>{$admin_subnetworks_add8}</option>
  <option value='<'{if $field2_qual == "<"} SELECTED{/if}>{$admin_subnetworks_add9}</option>
  <option value='>='{if $field2_qual == ">="} SELECTED{/if}>{$admin_subnetworks_add10}</option>
  <option value='<='{if $field2_qual == "<="} SELECTED{/if}>{$admin_subnetworks_add11}</option>
  </select>&nbsp;
  </td>
  <td>
    {* TEXT FIELD *}
    {if $secondary_field.field_type == 1 OR $secondary_field.field_type == 2}
      <input type='text' class='text' name='subnet_field2_value' value='{$subnet_field2_value}' maxlength='250' size='30'>

    {* SELECT BOX *}
    {elseif $secondary_field.field_type == 3 OR $secondary_field.field_type == 4}
      <select name='subnet_field2_value'>
      <option></option>
      {* LOOP THROUGH FIELD OPTIONS *}
      {section name=option_loop loop=$secondary_field.field_options}
        <option value='{$secondary_field.field_options[option_loop].option_id}'{$secondary_field.field_options[option_loop].option_value}>{$secondary_field.field_options[option_loop].option_label}</option>
      {/section}
      </select>

    {* DATE FIELD *}
    {elseif $secondary_field.field_type == 5}
      <select name='subnet_field2_value_1'>
      {section name=date1 loop=$secondary_field.date_array1}
        <option value='{$secondary_field.date_array1[date1].value}'{$secondary_field.date_array1[date1].selected}>{$secondary_field.date_array1[date1].name}</option>
      {/section}
      </select>
 
      <select name='subnet_field2_value_2'>
      {section name=date2 loop=$secondary_field.date_array2}
        <option value='{$secondary_field.date_array2[date2].value}'{$secondary_field.date_array2[date2].selected}>{$secondary_field.date_array2[date2].name}</option>
      {/section}
      </select>

      <select name='subnet_field2_value_3'>
      {section name=date3 loop=$secondary_field.date_array3}
        <option value='{$secondary_field.date_array3[date3].value}'{$secondary_field.date_array3[date3].selected}>{$secondary_field.date_array3[date3].name}</option>
      {/section}
      </select>
    {/if}
  </td>
  </tr>
  </table>
</td>
</tr>
{/if}
<tr>
<td class='form1'>&nbsp;</td>
<td class='form2'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td><input type='submit' class='button' value='{$admin_subnetworks_add12}'>&nbsp;</td>
  <input type='hidden' name='task' value='doadd'>
  <input type='hidden' name='s' value='{$s}'>
  </form>
  <form action='admin_subnetworks.php' method='POST'>
  <td><input type='submit' class='button' value='{$admin_subnetworks_add13}'></td>
  </tr>
  <input type='hidden' name='s' value='{$s}'>
  </form>
  </table>
</td>
</tr>
</table>

{include file='admin_footer.tpl'}