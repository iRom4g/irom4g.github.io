{include file='admin_header.tpl'}

<h2>{$admin_album1}</h2>
{$admin_album2}

<br><br>

{if $result != 0}
  <div class='success'><img src='../images/success.gif' class='icon' border='0'> {$admin_album3}</div>
{/if}

<form action='admin_album.php' method='POST'>


<table cellpadding='0' cellspacing='0' width='600'>
<td class='header'>{$admin_album10}</td>
</tr>
<td class='setting1'>
  {$admin_album11}
</td>
</tr>
<tr>
<td class='setting2'>
  <table cellpadding='2' cellspacing='0'>
  <tr>
  <td><input type='radio' name='setting_permission_album' id='permission_album_1' value='1'{if $permission_album == 1} CHECKED{/if}></td>
  <td><label for='permission_album_1'>{$admin_album13}</label></td>
  </tr>
  <tr>
  <td><input type='radio' name='setting_permission_album' id='permission_album_0' value='0'{if $permission_album == 0} CHECKED{/if}></td>
  <td><label for='permission_album_0'>{$admin_album14}</label></td>
  </tr>
  </table>
</td>
</tr>
</table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr>
<td class='header'>{$admin_album6}</td>
</tr>
<td class='setting1'>
  {$admin_album7}
</td>
</tr>
<tr>
<td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td width='80'>{$admin_album4}</td>
  <td><input type='text' class='text' size='30' name='setting_email_mediacomment_subject' value='{$setting_email_mediacomment_subject}' maxlength='200'></td>
  </tr><tr>
  <td valign='top'>{$admin_album5}</td>
  <td><textarea rows='6' cols='80' class='text' name='setting_email_mediacomment_message'>{$setting_email_mediacomment_message}</textarea><br>{$admin_album8}</td>
  </tr>
  </table>
</td>
</tr>
</table>

<br>

<input type='submit' class='button' value='{$admin_album9}'>
<input type='hidden' name='task' value='dosave'>
</form>


{include file='admin_footer.tpl'}