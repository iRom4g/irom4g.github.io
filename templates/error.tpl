{include file='header.tpl'}

<img src='./images/icons/error48.gif' border='0' class='icon_big'>
<div class='page_header'>{$error_header}</div>
{$error_message}

<br><br><br>
<input type='button' class='button' value='{$error_submit}' onClick='history.go(-1)'>

{include file='footer.tpl'}