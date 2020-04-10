{include file='header.tpl'}

<table class='tabs' cellpadding='0' cellspacing='0'>
<tr>
<td class='tab0'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='user_account.php'>{$user_account_delete1}</a></td>
<td class='tab'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='user_account_pass.php'>{$user_account_delete2}</a></td>
<td class='tab'>&nbsp;</td>
<td class='tab1' NOWRAP><a href='user_account_delete.php'>{$user_account_delete3}</a></td>
<td class='tab3'>&nbsp;</td>
</tr>
</table>

<img src='./images/icons/delete48.gif' border='0' class='icon_big'>
<div class='page_header'>{$user_account_delete4}</div>
<div>{$user_account_delete5}</div>

<br>

<table cellpadding='0' cellspacing='0'>
<tr>
<td>
  <form action='user_account_delete.php' method='POST'>
  <input type='submit' class='button' value='{$user_account_delete6}'>&nbsp;
  <input type='hidden' name='task' value='dodelete'>
  </form>
</td>
<td>
  <form action='user_account.php' method='POST'>
  <input type='submit' class='button' value='{$user_account_delete7}'>
  </form>
</td>
</tr>
</table>

{include file='footer.tpl'}