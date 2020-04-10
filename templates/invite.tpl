{include file='header.tpl'}

{* SHOW NO INVITES LEFT PAGE *}
{if $setting.setting_signup_invite == 2 & $user->user_info.user_invitesleft == 0}

  <img src='./images/icons/invite48.gif' border='0' class='icon_big'>
  <div class='page_header'>{$invite2}</div>
  <div>{$invite3}</div>
  <br><br>

  {* SHOW NOT LOGGED IN WARNING *}
  {if $user->user_exists == 0}
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td class='error'><img src='./images/icons/error16.gif' border='0' class='icon'> You must be logged in to invite other people.</td>
    </tr>
    </table>
  {else}
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td class='result'><img src='./images/icons/bulb16.gif' border='0' class='icon'> {$invite4} {$user->user_info.user_invitesleft} {$invite5}</td>
    </tr>
    </table>
  {/if}


{* SHOW INVITE PAGE *}
{else}

  <img src='./images/icons/invite48.gif' border='0' class='icon_big'>
  <div class='page_header'>{$invite2}</div>
  <div>{$invite3}</div>
  {if $setting.setting_signup_invite == 2} {$invite6}{/if}
  <br><br>

  {* IF INVITE ONLY FEATURE IS TURNED OFF, HIDE NUMBER OF INVITES LEFT *}
  {if $setting.setting_signup_invite != 0}
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td class='result'><img src='./images/icons/bulb16.gif' border='0' class='icon'> {$invite4} {$user->user_info.user_invitesleft} {$invite5}</td>
    </tr>
    </table>
    <br>
  {/if}

  {* SHOW SUCCESS MESSAGE *}
  {if $result != ""}
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td class='success'><img src='./images/success.gif' border='0' class='icon'>{$result}</td>
    </tr>
    </table>
  {/if}

  {* SHOW ERROR MESSAGE *}
  {if $error_message != ""}
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td class='error'><img src='./images/error.gif' border='0' class='icon'>{$error_message}</td>
    </tr>
    </table>
  {/if}

  <form action='invite.php' method='POST'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td class='form1'>{$invite7}</td>
  <td class='form2'>
  <textarea name='invite_emails' rows='2' cols='60'></textarea><br>
  {$invite8}
  </td>
  </tr>
  <tr>
  <td class='form1'>{$invite9}</td>
  <td class='form2'>
  <textarea name='invite_message' rows='5' cols='60'></textarea><br>
  {$invite10}
  </td>
  </tr>
  {if $setting.setting_invite_code == 1}
    <tr>
    <td class='form1'>&nbsp;</td>
    <td class='form2'>
      <table cellpadding='0' cellspacing='0'>
      <tr>
      <td><input type='text' name='invite_secure' class='text' size='6' maxlength='10'>&nbsp;</td>
      <td><img src='./images/secure.php' border='0' height='20' width='67' class='signup_code'>&nbsp;&nbsp;</td>
      <td><img src='./images/icons/tip.gif' border='0' class='icon' onMouseover="tip('{$invite15}')"; onMouseout="hidetip()"></td>
      </tr>
      </table>
    </td>
    </tr>
  {/if}
  <tr>
  <td class='form1'>&nbsp;</td>
  <td class='form2'><input type='submit' class='button' value='{$invite11}'></td>
  </tr>
  <input type='hidden' name='task' value='doinvite'>
  </form>
  </table>

{/if}
  
{include file='footer.tpl'}