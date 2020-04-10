{include file='header.tpl'}

<img src='./images/icons/report48.gif' border='0' class='icon_big'>
<div class='page_header'>{$user_report_sent1}</div>
<div>{$user_report_sent2}</div>

<br>

{* SHOW RETURN BUTTON IF URL IS SET *}
{if $return_url != ""}
  <br>
  <form action='{$return_url}' method='POST'>
  <input type='submit' class='button' value='{$user_report_sent3}'>
  </form>
{/if}

{include file='footer.tpl'}