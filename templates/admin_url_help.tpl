{include file='admin_header.tpl'}

<h2>{$admin_url_help1}</h2>
{$admin_url_help2}
<br><br>

<form action='admin_url.php' method='POST'>
<textarea wrap='off' rows='25' cols='60' style='font-family: "Courier New", verdana, arial; width: 100%;'>{$htaccess}</textarea>

<br>

<input type='submit' class='button' value='{$admin_url_help3}'>
<input type='hidden' name='task' value='main'>
</form>

{include file='admin_footer.tpl'}