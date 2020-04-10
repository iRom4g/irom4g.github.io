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
        <li><a href="user_account_pass.php" style="width:9em">Изменить пароль</a></li>
        <li class="activeLink"><a href="user_account_delete.php" style="width:12.8em">Удалить учетную запись</a></li>
     </ul>
    </div>


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