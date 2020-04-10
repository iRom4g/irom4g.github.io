{include file='header.tpl'}
<div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1> Мои настройки</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">

    <div class="clearFix tBar">
     <ul class="tabs" id="friendTabs" style="width:550px;float:left;">
	  <li><a href="user_account.php" style="width:7em">Настройки</a></li>
        <li class="activeLink"><a href="user_account_pass.php" style="width:9em">Изменить пароль</a></li>
        <li><a href="user_account_delete.php" style="width:12.8em">Удалить учетную запись</a></li>
     </ul>
    </div>

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