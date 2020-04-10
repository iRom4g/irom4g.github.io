{include file='header.tpl'}

<table class='tabs' cellpadding='0' cellspacing='0'>
<tr>
<td class='tab0'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='help.php'>{$help_contact8}</a></td>
<td class='tab'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='help_tos.php'>{$help_contact9}</a></td>
<td class='tab'>&nbsp;</td>
<td class='tab1' NOWRAP><a href='help_contact.php'>{$help_contact10}</a></td>
<td class='tab3'>&nbsp;</td>
</tr>
</table>

<img src='./images/icons/help48.gif' border='0' class='icon_big'>
<div class='page_header'>{$help_contact11}</div>
<div>{$help_contact12}</div>

<br>

{* SHOW SUCCESS MESSAGE *}
{if $result != ""}
  <br>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td class='success'><img src='./images/success.gif' border='0' class='icon'>{$result}</td>
  </tr>
  </table>
{/if}

{* SHOW ERROR MESSAGE *}
{if $is_error == 1}
  <br>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td class='error'><img src='./images/error.gif' border='0' class='icon'>{$error_message}</td>
  </tr>
  </table>
{/if}

<br>

{* SHOW FORM IF NOT ALREADY SUBMITTED *}
{if $success == 0}
  <form action='help_contact.php' method='POST'>
  <table cellpadding='0' cellspacing='0' class='form'>
  <tr>
  <td class='form1'>{$help_contact13}</td>
  <td class='form2'><input type='text' class='text' name='contact_name' maxlength='50' size='30' value='{$contact_name}'></td>
  </tr>
  <tr>
  <td class='form1'>{$help_contact14}</td>
  <td class='form2'><input type='text' class='text' name='contact_email' maxlength='70' size='30' value='{$contact_email}'></td>
  </tr>
  <tr>
  <td class='form1'>{$help_contact15}</td>
  <td class='form2'><input type='text' class='text' name='contact_subject' maxlength='50' size='30' value='{$contact_subject}'></td>
  </tr>
  <tr>
  <td class='form1'>{$help_contact16}</td>
  <td class='form2'><textarea name='contact_message' rows='7' cols='60'>{$contact_message}</textarea></td>
  </tr>
  <tr>
  <td class='form1'>&nbsp;</td>
  <td class='form2'><input type='submit' class='button' value='{$help_contact17}'></td>
  </tr>
  </table>
  <input type='hidden' name='task' value='dosend'>
  </form>
{/if}

{include file='footer.tpl'}