{include file='admin_header.tpl'}

<h2>{$admin_banning1}</h2>
{$admin_banning2}

<br><br>

{if $result != 0}
<div class='success'><img src='../images/success.gif' class='icon' border='0'> {$admin_banning16}</div>
{/if}

<table cellpadding='0' cellspacing='0' width='600'>
<form action='admin_banning.php' method='POST'>
<tr>
<td class='header'>{$admin_banning3}</td>
</tr>
<td class='setting1'>
{$admin_banning4}
<br><br>
<textarea name='banned_ips' rows='3' cols='40' class='text' style='width: 100%;'>{$setting_banned_ips}</textarea>
</td>
</tr>
</table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr>
<td class='header'>{$admin_banning5}</td>
</tr>
<td class='setting1'>
{$admin_banning6}
<br><br>
<textarea name='banned_emails' rows='3' cols='40' class='text' style='width: 100%;'>{$setting_banned_emails}</textarea>
</td>
</tr>
</table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr>
<td class='header'>{$admin_banning7}</td>
</tr>
<td class='setting1'>
{$admin_banning8}
<br><br>
<textarea name='banned_usernames' rows='3' cols='40' class='text' style='width: 100%;'>{$setting_banned_usernames}</textarea>
</td>
</tr>
</table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr>
<td class='header'>{$admin_banning9}</td>
</tr>
<td class='setting1'>
{$admin_banning10}
<br><br>
<textarea name='banned_words' rows='3' cols='40' class='text' style='width: 100%;'>{$setting_banned_words}</textarea>
</td>
</tr>
</table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr>
<td class='header'>{$admin_banning11}</td>
</tr>
<td class='setting1'>
{$admin_banning12}
</td></tr><tr><td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr><td><input type='radio' name='comment_code' id='comment_code_1' value='1'{if $setting_comment_code == 1} CHECKED{/if}>&nbsp;</td><td><label for='comment_code_1'>{$admin_banning13}</label></td></tr>
  <tr><td><input type='radio' name='comment_code' id='comment_code_0' value='0'{if $setting_comment_code == 0} CHECKED{/if}>&nbsp;</td><td><label for='comment_code_0'>{$admin_banning14}</label></td></tr>
  </table>
</td></tr></table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr>
<td class='header'>{$admin_banning17}</td>
</tr>
<td class='setting1'>
{$admin_banning18}
</td></tr><tr><td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr><td><input type='radio' name='invite_code' id='invite_code_1' value='1'{if $setting_invite_code == 1} CHECKED{/if}>&nbsp;</td><td><label for='invite_code_1'>{$admin_banning19}</label></td></tr>
  <tr><td><input type='radio' name='invite_code' id='invite_code_0' value='0'{if $setting_invite_code == 0} CHECKED{/if}>&nbsp;</td><td><label for='invite_code_0'>{$admin_banning20}</label></td></tr>
  </table>
</td></tr></table>

<br>

<input type='submit' class='button' value='{$admin_banning15}'>
<input type='hidden' name='task' value='dosave'>

</form>



{include file='admin_footer.tpl'}