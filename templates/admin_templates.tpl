{include file='admin_header.tpl'}

<h2>{$admin_templates1}</h2>
{$admin_templates2}

<br><br>

<div class='floatleft' style='width: 200px;'>
<b>{$admin_templates3}</b><br>
<table cellpadding='0' cellspacing='0'>
{section name=file_loop loop=$user_files}
<tr>
<td><img src='../images/icon_file.gif' border='0'>&nbsp;</td>
<td><a href='admin_templates_edit.php?t={$user_files[file_loop].filename}'>{$user_files[file_loop].filename}</a></td>
</tr>
{/section}
</table>
</div>

<div class='floatleft' style='width: 200px;'>
<b>{$admin_templates4}</b><br>
<table cellpadding='0' cellspacing='0'>
{section name=file_loop loop=$base_files}
<tr>
<td><img src='../images/icon_file.gif' border='0'>&nbsp;</td>
<td><a href='admin_templates_edit.php?t={$base_files[file_loop].filename}'>{$base_files[file_loop].filename}</a></td>
</tr>
{/section}
</table>
</div>

<div>
<b>{$admin_templates5}</b><br>
<table cellpadding='0' cellspacing='0'>
{section name=file_loop loop=$head_files}
<tr>
<td><img src='../images/icon_file.gif' border='0'>&nbsp;</td>
<td><a href='admin_templates_edit.php?t={$head_files[file_loop].filename}'>{$head_files[file_loop].filename}</a></td>
</tr>
{/section}
</table>
</div>


{include file='admin_footer.tpl'}