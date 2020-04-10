{include file='header.tpl'}

<div class='page_header'>{$lostpass_reset5}</div>

{if $valid == 1 AND $submitted == 1}
  
  {$lostpass_reset6}

{elseif $valid == 1 AND $submitted == 0}

  {$lostpass_reset7}

  <br><br>

  {if $is_error == 1}{$error_message}{/if}

  <table cellpadding='0' cellspacing='0' class='form'>
  <form action='lostpass_reset.php' method='POST'>
  <tr>
  <td class='form1'>{$lostpass_reset8}</td>
  <td class='form2'><input type='password' class='text' name='user_password' maxlength='50' size='40'></td>
  </tr>
  <tr>
  <td class='form1'>{$lostpass_reset9}</td>
  <td class='form2'><input type='password' class='text' name='user_password2' maxlength='50' size='40'></td>
  </tr>
  <tr>
  <td class='form1'>&nbsp;</td>
  <td class='form2'>
    <table cellpadding='0' cellspacing='0'>
    <td><input type='submit' class='button' value='{$lostpass_reset10}'>&nbsp;</td>
    <input type='hidden' name='task' value='reset'>
    <input type='hidden' name='r' value='{$r}'>
    <input type='hidden' name='user' value='{$owner->user_info.user_username}'>
    </form>
    <form action='login.php' method='POST'>
    <td><input type='submit' class='button' value='{$lostpass_reset11}'></td>
    </tr>
    </form>
    </table>
  </td>
  </tr>
  </form>
  </table>

{else}

  {$lostpass_reset12}

{/if}

{include file='footer.tpl'}
