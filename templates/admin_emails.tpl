{include file='admin_header.tpl'}

<h2>{$admin_emails1}</h2>
{$admin_emails2}

<br><br>

{if $result != 0}
<div class='success'><img src='../images/success.gif' class='icon' border='0'> {$admin_emails37}</div>
{/if}

<table cellpadding='0' cellspacing='0' width='600'>
<tr><form action='admin_emails.php' method='POST'>
<td class='header'>{$admin_emails4}</td>
</tr>
<td class='setting1'>
{$admin_emails5}
</td>
</tr>
<tr>
<td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td width='80'>{$admin_emails6}</td>
  <td><input type='text' class='text' size='30' name='setting_email_fromname' value='{$setting_email_fromname}' maxlength='70'></td>
  </tr>
  <tr>
  <td>{$admin_emails7}</td>
  <td><input type='text' class='text' size='30' name='setting_email_fromemail' value='{$setting_email_fromemail}' maxlength='70'></td>
  </tr>
  </table>
</td>
</tr>
</table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr>
<td class='header'>{$admin_emails10}</td>
</tr>
<td class='setting1'>
{$admin_emails11}
</td>
</tr>
<tr>
<td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td width='80'>{$admin_emails8}</td>
  <td><input type='text' class='text' size='30' name='setting_email_invitecode_subject' value='{$setting_email_invitecode_subject}' maxlength='200'></td>
  </tr><tr>
  <td valign='top'>{$admin_emails9}</td>
  <td><textarea rows='6' cols='80' class='text' name='setting_email_invitecode_message'>{$setting_email_invitecode_message}</textarea><br>{$admin_emails20}</td>
  </tr>
  </table>
</td>
</tr>
</table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr>
<td class='header'>{$admin_emails12}</td>
</tr>
<td class='setting1'>
{$admin_emails13}
</td>
</tr>
<tr>
<td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td width='80'>{$admin_emails8}</td>
  <td><input type='text' class='text' size='30' name='setting_email_invite_subject' value='{$setting_email_invite_subject}' maxlength='200'></td>
  </tr><tr>
  <td valign='top'>{$admin_emails9}</td>
  <td><textarea rows='6' cols='80' class='text' name='setting_email_invite_message'>{$setting_email_invite_message}</textarea><br>{$admin_emails21}</td>
  </tr>
  </table>
</td>
</tr>
</table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr>
<td class='header'>{$admin_emails14}</td>
</tr>
<td class='setting1'>
{$admin_emails15}
</td>
</tr>
<tr>
<td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td width='80'>{$admin_emails8}</td>
  <td><input type='text' class='text' size='30' name='setting_email_verify_subject' value='{$setting_email_verify_subject}' maxlength='200'></td>
  </tr><tr>
  <td valign='top'>{$admin_emails9}</td>
  <td><textarea rows='6' cols='80' class='text' name='setting_email_verify_message'>{$setting_email_verify_message}</textarea><br>{$admin_emails22}</td>
  </tr>
  </table>
</td>
</tr>
</table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr>
<td class='header'>{$admin_emails16}</td>
</tr>
<td class='setting1'>
{$admin_emails17}
</td>
</tr>
<tr>
<td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td width='80'>{$admin_emails8}</td>
  <td><input type='text' class='text' size='30' name='setting_email_newpass_subject' value='{$setting_email_newpass_subject}' maxlength='200'></td>
  </tr><tr>
  <td valign='top'>{$admin_emails9}</td>
  <td><textarea rows='6' cols='80' class='text' name='setting_email_newpass_message'>{$setting_email_newpass_message}</textarea><br>{$admin_emails23}</td>
  </tr>
  </table>
</td>
</tr>
</table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr>
<td class='header'>{$admin_emails18}</td>
</tr>
<td class='setting1'>
{$admin_emails19}
</td>
</tr>
<tr>
<td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td width='80'>{$admin_emails8}</td>
  <td><input type='text' class='text' size='30' name='setting_email_welcome_subject' value='{$setting_email_welcome_subject}' maxlength='200'></td>
  </tr><tr>
  <td valign='top'>{$admin_emails9}</td>
  <td><textarea rows='6' cols='80' class='text' name='setting_email_welcome_message'>{$setting_email_welcome_message}</textarea><br>{$admin_emails24}</td>
  </tr>
  </table>
</td>
</tr>
</table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr>
<td class='header'>{$admin_emails28}</td>
</tr>
<td class='setting1'>
{$admin_emails29}
</td>
</tr>
<tr>
<td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td width='80'>{$admin_emails8}</td>
  <td><input type='text' class='text' size='30' name='setting_email_lostpassword_subject' value='{$setting_email_lostpassword_subject}' maxlength='200'></td>
  </tr><tr>
  <td valign='top'>{$admin_emails9}</td>
  <td><textarea rows='6' cols='80' class='text' name='setting_email_lostpassword_message'>{$setting_email_lostpassword_message}</textarea><br>{$admin_emails30}</td>
  </tr>
  </table>
</td>
</tr>
</table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr>
<td class='header'>{$admin_emails31}</td>
</tr>
<td class='setting1'>
{$admin_emails32}
</td>
</tr>
<tr>
<td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td width='80'>{$admin_emails8}</td>
  <td><input type='text' class='text' size='30' name='setting_email_friendrequest_subject' value='{$setting_email_friendrequest_subject}' maxlength='200'></td>
  </tr><tr>
  <td valign='top'>{$admin_emails9}</td>
  <td><textarea rows='6' cols='80' class='text' name='setting_email_friendrequest_message'>{$setting_email_friendrequest_message}</textarea><br>{$admin_emails33}</td>
  </tr>
  </table>
</td>
</tr>
</table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr>
<td class='header'>{$admin_emails34}</td>
</tr>
<td class='setting1'>
{$admin_emails35}
</td>
</tr>
<tr>
<td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td width='80'>{$admin_emails8}</td>
  <td><input type='text' class='text' size='30' name='setting_email_message_subject' value='{$setting_email_message_subject}' maxlength='200'></td>
  </tr><tr>
  <td valign='top'>{$admin_emails9}</td>
  <td><textarea rows='6' cols='80' class='text' name='setting_email_message_message'>{$setting_email_message_message}</textarea><br>{$admin_emails36}</td>
  </tr>
  </table>
</td>
</tr>
</table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr>
<td class='header'>{$admin_emails25}</td>
</tr>
<td class='setting1'>
{$admin_emails26}
</td>
</tr>
<tr>
<td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td width='80'>{$admin_emails8}</td>
  <td><input type='text' class='text' size='30' name='setting_email_profilecomment_subject' value='{$setting_email_profilecomment_subject}' maxlength='200'></td>
  </tr><tr>
  <td valign='top'>{$admin_emails9}</td>
  <td><textarea rows='6' cols='80' class='text' name='setting_email_profilecomment_message'>{$setting_email_profilecomment_message}</textarea><br>{$admin_emails27}</td>
  </tr>
  </table>
</td>
</tr>
</table>

<br>

<input type='submit' class='button' value='{$admin_emails3}'>
<input type='hidden' name='task' value='dosave'>
</form>


{include file='admin_footer.tpl'}