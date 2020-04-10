{include file='admin_header.tpl'}

<h2>{$admin_subnetworks1}</h2>
{$admin_subnetworks2}

<br><br>

{literal}
<script language='JavaScript'>
<!--
function showdiv(id1, id2) {
  document.getElementById(id1).style.display='block';
  document.getElementById(id2).style.display='none';
}
//-->
</script>
{/literal}

<div id='button1' style='display: block;'>
  [ <a href="javascript:showdiv('help', 'button1')">{$admin_subnetworks24}</a> ]
  <br><br>
</div>

<div id='help' style='display: none;'>
  {$admin_subnetworks22}
  <br><br>
</div>


{if $result != ""}
<div class='success'><img src='../images/success.gif' class='icon' border='0'> {$result}</div>
{/if}

<div class='center'>
<div class='box' style='width: 500px;'>

<table cellpadding='0' cellspacing='0'>
<tr><form action='admin_subnetworks.php' method='POST'><td>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td align='right'>{$admin_subnetworks3} &nbsp;</td>
  <td>
  <select class='text' name='field1_id'>
  <option></option>
  <option value='0'{if $primary_field_id == "0"} SELECTED{/if}>{$admin_subnetworks16}</option>
  {section name=field_loop loop=$fields}
    <option value='{$fields[field_loop].field_id}'{if $primary_field_id == $fields[field_loop].field_id} SELECTED{/if}>{$fields[field_loop].field_title}</option>
  {/section}
  </select>
  </td>
  </tr>
  <tr>
  <td align='right'>{$admin_subnetworks4} &nbsp;</td>
  <td>
  <select class='text' name='field2_id'>
  <option></option>
  <option value='0'{if $secondary_field_id == "0"} SELECTED{/if}>{$admin_subnetworks16}</option>
  {section name=field_loop loop=$fields}
    <option value='{$fields[field_loop].field_id}'{if $secondary_field_id == $fields[field_loop].field_id} SELECTED{/if}>{$fields[field_loop].field_title}</option>
  {/section}
  </select>
  </td>
  </tr>
  </table>
</td><td>
&nbsp; <input type='submit' class='button' value='{$admin_subnetworks5}'>
</td><input type='hidden' name='task' value='doupdate'><input type='hidden' name='s' value='{$s}'></form></tr></table>
</div>
</div>

<br>

<form action='admin_subnetworks_add.php' method='GET'>
<input type='submit' class='button' value='{$admin_subnetworks6}'>
<input type='hidden' name='s' value='{$s}'>
</form>

<br>

<table cellpadding='0' cellspacing='0' class='list'>
<tr>
<td class='header' width='10'><a class='header' href='admin_subnetworks.php?s={$i}'>{$admin_subnetworks7}</a></td>
<td class='header' width='200'><a class='header' href='admin_subnetworks.php?s={$n}'>{$admin_subnetworks8}</a></td>
<td class='header' align='center'><a class='header' href='admin_subnetworks.php?s={$u}'>{$admin_subnetworks9}</a></td>
<td class='header'>{$admin_subnetworks10}</td>
<td class='header' width='100'>{$admin_subnetworks11}</td>
</tr>
<tr class='background1'>
<td class='item'>0</td>
<td class='item'>{$admin_subnetworks14}</td>
<td class='item' align='center'><a href='admin_viewusers.php?f_subnet=0'>{$default_users}</a></td>
<td class='item'>{$admin_subnetworks15}</td>
<td class='item'>&nbsp;</td>
</tr>
{section name=subnet_loop loop=$subnets}
  <tr class='{cycle values="background2,background1"}'>
  <td class='item'>{$subnets[subnet_loop].subnet_id}</td>
  <td class='item'>{$subnets[subnet_loop].subnet_name}</td>
  <td class='item' align='center'><a href='admin_viewusers.php?f_subnet={$subnets[subnet_loop].subnet_id}'>{$subnets[subnet_loop].subnet_users}</a></td>
  <td class='item'>{$primary_field_title} {$subnets[subnet_loop].subnet_field1_qual} {$subnets[subnet_loop].subnet_field1_value}<br>{$subnets[subnet_loop].subnet_field2_title} {$subnets[subnet_loop].subnet_field2_qual} {$subnets[subnet_loop].subnet_field2_value}</td>
  <td class='item'>[ <a href='admin_subnetworks_edit.php?s={$s}&subnet_id={$subnets[subnet_loop].subnet_id}'>{$admin_subnetworks12}</a> ] [ <a href='admin_subnetworks.php?s={$s}&task=confirm&subnet_id={$subnets[subnet_loop].subnet_id}'>{$admin_subnetworks13}</a> ]</td>
  </tr>
{/section}
</table>


{include file='admin_footer.tpl'}