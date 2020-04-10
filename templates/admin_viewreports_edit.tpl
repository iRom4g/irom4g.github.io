{include file='admin_header.tpl'}

<h2>{$admin_viewreports_edit1}</h2>
{$admin_viewreports_edit2}

<br><br>

<table cellpadding='0' cellspacing='0'>
<tr>
<td class='form1'>{$admin_viewreports_edit3}</td>
<td class='form2'><a href='{$url->url_create("profile", $report_username)}' target='_blank'>{$report_username}</a></td>
</tr>
<tr>
<td class='form1'>{$admin_viewreports_edit4}</td>
<td class='form2'><a href='admin_loginasuser.php?user_id={$report_user_id}&url={$report_url_encoded}' target='_blank'>{$report_url}</a></td>
</tr>
<tr>
<td class='form1'>{$admin_viewreports_edit5}</td>
<td class='form2'>{$report_reason}</td>
</tr>
<tr>
<td class='form1'>{$admin_viewreports_edit6}</td>
<td class='form2'>{$report_details}</td>
</tr>
<tr><td colspan='2'>&nbsp;</td></tr>
<tr>
<td class='form1'>&nbsp;</td>
<td class='form2'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td>
    <form action='admin_viewreports_edit.php' method='POST'>
    <input type='submit' class='button' value='{$admin_viewreports_edit7}'>&nbsp;
    <input type='hidden' name='report_id' value='{$report_id}'>
    <input type='hidden' name='task' value='dodelete'>
    </form>
  </td>
  <td><form action='admin_viewreports.php' method='POST'><input type='submit' class='button' value='{$admin_viewreports_edit8}'></form></td>
  </tr>
  </table>
</td>
</tr>
</table>

{include file='admin_footer.tpl'}