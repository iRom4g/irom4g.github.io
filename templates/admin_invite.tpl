{include file='admin_header.tpl'}

<h2>{$admin_invite1}</h2>
{$admin_invite2}

<br><br>

{if $result != 0}
<div class='success'><img src='../images/success.gif' class='icon' border='0'> {$admin_invite6}</div>
{/if}

<table cellpadding='0' cellspacing='0' width='600'>
<form action='admin_invite.php' method='POST'>
<tr>
<td class='header'>{$admin_invite3}</td>
</tr>
<td class='setting1'>
{$admin_invite4}
<br><br>
<textarea name='invite_emails' rows='3' cols='40' class='text' style='width: 100%;'></textarea>
</td>
</tr>
</table>

<br>

<input type='submit' class='button' value='{$admin_invite5}'>
<input type='hidden' name='task' value='doinvite'>

</form>



{include file='admin_footer.tpl'}