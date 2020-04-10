{include file='admin_header.tpl'}

<h2>{$admin_viewadmins1}</h2>
{$admin_viewadmins2}

<br><br>

<table cellpadding='0' cellspacing='0' class='list'>
<tr>
<td class='header' width='10'>{$admin_viewadmins3}</td>
<td class='header'>{$admin_viewadmins4}</td>
<td class='header'>{$admin_viewadmins5}</td>
<td class='header'>{$admin_viewadmins6}</td>
<td class='header'>{$admin_viewadmins7}</td>
<td class='header'>{$admin_viewadmins8}</td>
</tr>
<!-- LOOP THROUGH ADMINS -->
{section name=admin_loop loop=$admins}
  <tr class='{cycle values="background1,background2"}'>
  <td class='item'>{$admins[admin_loop].admin_id}</td>
  <td class='item'>{$admins[admin_loop].admin_username}</td>
  <td class='item'>{$admins[admin_loop].admin_name}</td>
  <td class='item'><a href='mailto:{$admins[admin_loop].admin_email}'>{$admins[admin_loop].admin_email}</a></td>
  <td class='item'>{if $admins[admin_loop].admin_status == "0"}{$admin_viewadmins9}{else}{$admin_viewadmins10}{/if}</td>
  <td class='item'><a href='admin_viewadmins_edit.php?admin_id={$admins[admin_loop].admin_id}'>{$admin_viewadmins11}</a>{if $admins[admin_loop].admin_status != "0"} | <a href='admin_viewadmins.php?task=confirmdeleteadmin&admin_id={$admins[admin_loop].admin_id}'>{$admin_viewadmins12}</a>{/if}</td>
  </tr>
{/section}
</table>

<br>

<form action='admin_viewadmins_add.php' method='POST'>
<input type='submit' class='button' value='{$admin_viewadmins13}'>
<input type='hidden' name='task' value='main'>
</form>

{include file='admin_footer.tpl'}