{include file='header.tpl'}

  <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1> Мои заметки -> Удаление записи</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">

    <div class="clearFix tBar">
     <ul class="tabs">
      <li class="activeLink"><a href="user_blog.php" style="width:10em">Просмотр записей</a></li>
      <li ><a href="user_blog_settings.php" style="width:9em">Настройки блога</a></li>
     </ul>
    </div>

<table cellpadding='0' cellspacing='0' width='100%'><tr><td class='page'>

<img src='./images/icons/blog48.gif' border='0' class='icon_big'>
<div class='page_header'>{$user_blog_deleteentry3}</div>
<div>{$user_blog_deleteentry4}</div>

<br>

<table cellpadding='0' cellspacing='0'>
<tr>
<td>
  <form action='user_blog_deleteentry.php' method='post'>
  <input type='submit' class='button' value='{$user_blog_deleteentry5}'>&nbsp;
  <input type='hidden' name='task' value='dodelete'>
  <input type='hidden' name='blogentry_id' value='{$blogentry_id}'>
  </form>
</td>
<form action='user_blog.php' method='POST'>
<td><input type='submit' class='button' value='{$user_blog_deleteentry6}'></td>
</tr>
</table>
</form>

</td></tr></table>

{include file='footer.tpl'}