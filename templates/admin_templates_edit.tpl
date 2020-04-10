{include file='admin_header.tpl'}

<h2>{$admin_templates_edit1}</h2>
{$admin_templates_edit2}

<br><br>

{if $error_message == ""}
<!-- SHOW EDIT TEMPLATE FORM -->
  <form action='admin_templates_edit.php' method='POST'>
  <textarea name='template_code' rows='40' class='template'>{$template_code}</textarea>
  <br>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td><input type='submit' class='button' value='{$admin_templates_edit3}'>&nbsp;</td>
  <input type='hidden' name='task' value='save'>
  <input type='hidden' name='t' value='{$filename}'>
  </form>
  <form action='admin_templates.php' method='POST'>
  <td><input type='submit' class='button' value='{$admin_templates_edit4}'></td>
  </tr>
  </table>
{else}
<!-- SHOW ERROR -->
  <div class='error'>{$error_message}</div>
  <table cellpadding='0' cellspacing='0'>
  <form action='admin_templates.php' method='POST'>
  <tr>
  <td><input type='submit' class='button' value='{$admin_templates_edit10}'></td>
  </tr>
  </form>
  </table>
{/if}

{include file='admin_footer.tpl'}