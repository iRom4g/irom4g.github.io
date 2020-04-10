{include file='header.tpl'}

<div class='page_header'>{$signup_verify6}</div>

{if $is_error == 0}
  <div class='success'><img src='./images/success.gif' border='0' class='icon'> {$signup_verify7} {$subnet_changed} {$signup_verify8}</div>
  <br>
  <form action='login.php' method='GET'>
  <input type='submit' class='button' value='{$signup_verify9}'>
  </form>
{else}
  {if $resend == 0}
    <div>{$signup_verify10}</div>
    <br>
    <form action='signup_verify.php' method='POST'>
    {$signup_verify11}<br><input type='text' class='text' name='resend_email' size='40' maxlength='70'>
    <br><br>
    <input type='submit' class='button' value='{$signup_verify12}'>
    <input type='hidden' name='task' value='resend'>
    </form>
  {else}
    {if $is_resend_error == 0}
      <div class='success'><img src='./images/success.gif' border='0' class='icon'> {$signup_verify13}</div>
    {else}
      <div class='success'><img src='./images/error.gif' border='0' class='icon'>{$error_message}</div>
    {/if}
  {/if}
{/if}

{include file='footer.tpl'}