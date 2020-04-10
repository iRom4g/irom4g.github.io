{include file='admin_header.tpl'}

<h2>{$admin_viewusers_edit1} {$user_username}</h2>
{$admin_viewusers_edit2}

<br><br>

{if $error_message != ""}
  <div class='error'><img src='../images/error.gif' border='0' class='icon'> {$error_message}</div>
{/if}

{if $result != ""}
  <div class='success'><img src='../images/success.gif' border='0' class='icon'> {$result}</div>
{/if}


<table cellpadding='0' cellspacing='0' class='stats'>
<tr>
<td class='stat0'>
<table cellpadding='0' cellspacing='0'>
<tr>
<td><b>{$admin_viewusers_edit4}</b> {$total_friends}</td>
<td style='padding-left: 20px;'><b>{$admin_viewusers_edit5}</b> {$total_logins}</td>
<td style='padding-left: 20px;'><b>{$admin_viewusers_edit6}</b> {$total_messages}</td>
<td style='padding-left: 20px;'><b>{$admin_viewusers_edit15}</b> {$total_profilecomments}</td>
<td style='padding-left: 20px;'><b>{$admin_viewusers_edit7}</b> {$last_login}</td>
</tr>
</table>
</td>
</tr>
</table>

<br>

<form action='admin_viewusers_edit.php' method='POST'>
<table cellpadding='0' cellspacing='0'>
<tr>
<td class='form1'>{$admin_viewusers_edit8}</td>
<td class='form2'>
  <input type='text' class='text' name='user_email' value='{$user_email}' size='30' maxlength='70'>
  {if $user_verified == 0} 
  <br>({$admin_viewusers_edit22} - <a href='admin_viewusers_edit.php?user_id={$user_id}&task=resend&s={$s}&p={$p}&f_user={$f_user}&f_email={$f_email}&f_level={$f_level}&f_enabled={$f_enabled}'>{$admin_viewusers_edit23}</a> - <a href='admin_viewusers_edit.php?user_id={$user_id}&task=verify&s={$s}&p={$p}&f_user={$f_user}&f_email={$f_email}&f_level={$f_level}&f_enabled={$f_enabled}'>{$admin_viewusers_edit28}</a>)
  {/if}
</td>
</tr>
<tr>
<td class='form1'>{$admin_viewusers_edit9}</td>
<td class='form2'><input type='text' class='text' name='user_username' value='{$user_username}' size='30' maxlength='50'></td>
</tr>
<tr>
<td class='form1'>{$admin_viewusers_edit10}</td>
<td class='form2'><input type='password' class='text' name='user_password' value='' size='30' maxlength='50'><br>{$admin_viewusers_edit3}</td>
</tr>
<tr>
<td class='form1'>{$admin_viewusers_edit11}</td>
<td class='form2'><select class='text' name='user_enabled'><option value='1'{if $user_enabled == 1} SELECTED{/if}>{$admin_viewusers_edit24}</option><option value='0'{if $user_enabled == 0} SELECTED{/if}>{$admin_viewusers_edit25}</option></td>
</tr>
<tr>
<td class='form1'>{$admin_viewusers_edit31}</td>
<td class='form2'><select class='text' name='user_level_id'>{section name=level_loop loop=$levels}<option value='{$levels[level_loop].level_id}'{if $user_level_id == $levels[level_loop].level_id} SELECTED{/if}>{$levels[level_loop].level_name}</option>{/section}</td>
</tr>
<tr>
<td class='form1'>{$admin_viewusers_edit27}</td>
<td class='form2'><input type='text' class='text' name='user_invitesleft' value='{$user_invitesleft}' maxlength='3' size='2'></td>
</tr>
<tr>
<td class='form1'>&nbsp;</td>
<td class='form2'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td><input type='submit' class='button' value='{$admin_viewusers_edit12}'>&nbsp;</td>
  <input type='hidden' name='task' value='edituser'>
  <input type='hidden' name='user_id' value='{$user_id}'>
  <input type='hidden' name='s' value='{$s}'>
  <input type='hidden' name='p' value='{$p}'>
  <input type='hidden' name='f_user' value='{$f_user}'>
  <input type='hidden' name='f_email' value='{$f_email}'>
  <input type='hidden' name='f_level' value='{$f_level}'>
  <input type='hidden' name='f_enabled' value='{$f_enabled}'>
  </form>
  <form action='admin_viewusers_edit.php' method='POST'>
  <td><input type='submit' class='button' value='{$admin_viewusers_edit13}'></td>
  <input type='hidden' name='s' value='{$s}'>
  <input type='hidden' name='p' value='{$p}'>
  <input type='hidden' name='f_user' value='{$f_user}'>
  <input type='hidden' name='f_email' value='{$f_email}'>
  <input type='hidden' name='f_level' value='{$f_level}'>
  <input type='hidden' name='f_enabled' value='{$f_enabled}'>
  </tr>
  </form>
  </table>
</td>
</tr>
</form>
</table>





{include file='admin_footer.tpl'}