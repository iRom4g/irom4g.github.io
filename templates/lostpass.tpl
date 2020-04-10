{include file='header.tpl'}

<div class='page_header'>{$lostpass1}</div>

{$lostpass2}

<br><br>

{* SHOW SUCCESS MESSAGE IF NO ERROR *}
{if $submitted == 1 AND $is_error == 0}

  <table cellpadding='0' cellspacing='0'>
  <tr><td class='result'>
    <div class='success'><img src='./images/success.gif' border='0' class='icon'> {$lostpass3}</div>
  </td></tr></table>

{else}

  {if $is_error == 1}{$lostpass4}{/if}
 
  <table cellpadding='0' cellspacing='0' class='form'>
  <form action='lostpass.php' method='POST'>
  <tr>
  <td class='form1'>{$lostpass5}</td>
  <td class='form2'><input type='text' class='text' name='user_email' maxlength='70' size='40'></td>
  </tr>
  <tr>
  <td class='form1'>&nbsp;</td>
  <td class='form2'>
    <table cellpadding='0' cellspacing='0'>
    <td><input type='submit' class='button' value='{$lostpass6}'>&nbsp;</td>
    <input type='hidden' name='task' value='send_email'>
    </form>
    <form action='login.php' method='POST'>
    <td><input type='submit' class='button' value='{$lostpass7}'></td>
    </tr>
    </form>
    </table>
  </td>
  </tr>
  </form>
  </table>

{/if}

{include file='footer.tpl'}