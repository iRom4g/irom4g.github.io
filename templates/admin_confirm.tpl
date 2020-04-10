{include file='admin_header.tpl'}

<h2>{$headline}</h2>
{$instructions}

<br><br>

<table cellpadding='0' cellspacing='0'>
<form action='{$confirm_form_action}' method='POST'>
<tr>
<td><input type='submit' class='button' value='{$confirm_submit}'>&nbsp;</td>
{section name=confirm_loop loop=$confirm_hidden}
  <input type='hidden' name='{$confirm_hidden[confirm_loop].name}' value='{$confirm_hidden[confirm_loop].value}'>
{/section}
</form>
<form action='{$cancel_form_action}' method='POST'>
<td><input type='submit' class='button' value='{$cancel_submit}'></td>
{section name=cancel_loop loop=$cancel_hidden}
  <input type='hidden' name='{$cancel_hidden[cancel_loop].name}' value='{$cancel_hidden[cancel_loop].value}'>
{/section}
</form>
</tr>
</table>

{include file='admin_footer.tpl'}