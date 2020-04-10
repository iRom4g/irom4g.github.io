{include file='header.tpl'}

<table class='tabs' cellpadding='0' cellspacing='0'>
<tr>
<td class='tab0'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='user_account.php'>{$user_account_pass7}</a></td>
<td class='tab'>&nbsp;</td>
<td class='tab1' NOWRAP><a href='user_account_pass.php'>{$user_account_pass8}</a></td>
<td class='tab'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='user_account_delete.php'>{$user_account_pass9}</a></td>
<td class='tab3'>&nbsp;</td>
</tr>
</table>

<img src='./images/icons/privacy48.gif' border='0' class='icon_big'>
<div class='page_header'>{$user_account_pass10}</div>
<div>{$user_account_pass11}</div>

<br>

{* SHOW SUCCESS OR ERROR MESSAGE *}
{if $result != 0}
  <div class='success'><img src='./images/success.gif' border='0' class='icon'> {$user_account_pass6}</div><br>
{elseif $is_error != 0}
  <div class='error'><img src='./images/error.gif' border='0' class='icon'> {$error_message}</div><br>
{/if}

<form action='user_account_pass.php' method='POST'>
<table cellpadding='0' cellspacing='0'>
<tr>
<td class='form1'>{$user_account_pass12}</td>
<td class='form2'><input type='password' name='password_old' class='text' size='30' maxlength='50'></td>
</tr>
<tr>
<td class='form1'>{$user_account_pass13}</td>
<td class='form2'><input type='password' name='password_new' class='text' size='30' maxlength='50'></td>
</tr>
<tr>
<td class='form1'>{$user_account_pass14}</td>
<td class='form2'><input type='password' name='password_new2' class='text' size='30' maxlength='50'></td>
</tr>
<tr>
<td class='form1'>&nbsp;</td>
<td class='form2'><input type='submit' class='button' value='{$user_account_pass15}'></td>
</tr>
</table>
<input type='hidden' name='task' value='dosave'>
</form>

{include file='footer.tpl'}