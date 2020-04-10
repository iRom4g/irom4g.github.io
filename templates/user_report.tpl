{include file='header.tpl'}

<img src='./images/icons/report48.gif' border='0' class='icon_big'>
<div class='page_header'>{$user_report1}</div>
<div>{$user_report2}</div>

<br><br>

<form action='user_report.php' method='POST'>

<div><b>{$user_report3}</b></div>

<table cellpadding='0' cellspacing='0'>
<tr>
<td>&nbsp;<input type='radio' name='report_reason' id='report_type1' value='1' checked='checked'></td>
<td><label for='report_type1'>{$user_report4}</td>
</tr>
<tr>
<td>&nbsp;<input type='radio' name='report_reason' id='report_type2' value='2'></td>
<td><label for='report_type2'>{$user_report5}</td>
</tr>
<tr>
<td>&nbsp;<input type='radio' name='report_reason' id='report_type3' value='3'></td>
<td><label for='report_type3'>{$user_report6}</td>
</tr>
<tr>
<td>&nbsp;<input type='radio' name='report_reason' id='report_type0' value='0'></td>
<td><label for='report_type0'>{$user_report7}</td>
</tr>
</table>

<br>

<div><b>{$user_report8}</b></div>
<textarea name='report_details' rows='5' cols='70'></textarea>

<br><br>

<table cellpadding='0' cellspacing='0'>
<tr>
<td>
  <input type='submit' class='button' value='{$user_report9}'>&nbsp;
  <input type='hidden' name='task' value='dosend'>
  <input type='hidden' name='return_url' value='{$return_url}'>
  </form>
</td>
<td>
  <form action='{$return_url}' method='POST'>
  <input type='submit' class='button' value='{$user_report10}'>
  </form>
</td>
</tr>
</table>

{include file='footer.tpl'}