{include file='admin_header.tpl'}

<h2>{$admin_signup1}</h2>
{$admin_signup2}

<br>

{if $result != 0}
  <br>
  <div class='success'><img src='../images/success.gif' class='icon' border='0'> {$admin_signup35}</div>
{/if}

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr><td class='header'>{$admin_signup3}</td></tr>
<tr><form action='admin_signup.php' method='POST'><td class='setting1'>
{$admin_signup4}
</td></tr>

{section name=tab_loop loop=$tabs}
  <tr>
  <td class='setting2'>
  <b>{$tabs[tab_loop].tab_name}</b>
  {if $tabs[tab_loop].tab_num_fields == 0}<br><br>{$admin_signup5}{/if}
  {section name=field_loop loop=$tabs[tab_loop].tab_fields}
    <table cellpadding='3' cellspacing='0'>
    <tr>
    <td><input type='checkbox' name='field_signup_{$tabs[tab_loop].tab_fields[field_loop].field_id}' id='field_signup_{$tabs[tab_loop].tab_fields[field_loop].field_id}' value='1'{if $tabs[tab_loop].tab_fields[field_loop].field_signup == 1} CHECKED{/if}></td>
    <td><label for='field_signup_{$tabs[tab_loop].tab_fields[field_loop].field_id}'>{$tabs[tab_loop].tab_fields[field_loop].field_title}</label></td>
    </tr>
    </table>
  {/section}
  </td>
  </tr>
{/section}

</table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr><td class='header'>{$admin_signup8}</td></tr>
<tr><td class='setting1'>
{$admin_signup36}
</td></tr><tr><td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr><td><input type='radio' name='photo' id='photo_1' value='1'{if $photo == 1} CHECKED{/if}>&nbsp;</td><td><label for='photo_1'>{$admin_signup37}</label></td></tr>
  <tr><td><input type='radio' name='photo' id='photo_0' value='0'{if $photo == 0} CHECKED{/if}>&nbsp;</td><td><label for='photo_0'>{$admin_signup38}</label></td></tr>
  </table>
</td></tr></table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr><td class='header'>{$admin_signup43}</td></tr>
<tr><td class='setting1'>
{$admin_signup44}
</td></tr><tr><td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr><td><input type='radio' name='enable' id='enable_1' value='1'{if $enable == 1} CHECKED{/if}>&nbsp;</td><td><label for='enable_1'>{$admin_signup45}</label></td></tr>
  <tr><td><input type='radio' name='enable' id='enable_0' value='0'{if $enable == 0} CHECKED{/if}>&nbsp;</td><td><label for='enable_0'>{$admin_signup46}</label></td></tr>
  </table>
</td></tr></table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr><td class='header'>{$admin_signup39}</td></tr>
<tr><td class='setting1'>
{$admin_signup40}
</td></tr><tr><td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr><td><input type='radio' name='welcome' id='welcome_1' value='1'{if $welcome == 1} CHECKED{/if}>&nbsp;</td><td><label for='welcome_1'>{$admin_signup41}</label></td></tr>
  <tr><td><input type='radio' name='welcome' id='welcome_0' value='0'{if $welcome == 0} CHECKED{/if}>&nbsp;</td><td><label for='welcome_0'>{$admin_signup42}</label></td></tr>
  </table>
</td></tr></table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr><td class='header'>{$admin_signup9}</td></tr>
<tr><td class='setting1'>
{$admin_signup10}
</td></tr><tr><td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr><td><input type='radio' name='invite' id='invite_2' value='2'{if $invite == 2} CHECKED{/if}>&nbsp;</td><td><label for='invite_2'>{$admin_signup11}</label></td></tr>
  <tr><td><input type='radio' name='invite' id='invite_1' value='1'{if $invite == 1} CHECKED{/if}>&nbsp;</td><td><label for='invite_1'>{$admin_signup12}</label></td></tr>
  <tr><td><input type='radio' name='invite' id='invite_0' value='0'{if $invite == 0} CHECKED{/if}>&nbsp;</td><td><label for='invite_0'>{$admin_signup13}</label></td></tr>
  </table>
</td></tr>
<tr><td class='setting1'>{$admin_signup47}</td></tr>
<tr><td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr><td><input type='radio' name='invite_checkemail' id='invite_checkemail_1' value='1'{if $invite_checkemail == 1} CHECKED{/if}>&nbsp;</td><td><label for='invite_checkemail_1'>{$admin_signup48}</label></td></tr>
  <tr><td><input type='radio' name='invite_checkemail' id='invite_checkemail_0' value='0'{if $invite_checkemail == 0} CHECKED{/if}>&nbsp;</td><td><label for='invite_checkemail_0'>{$admin_signup49}</label></td></tr>
  </table>
</td></tr>
<tr><td class='setting1'>{$admin_signup6}</td></tr>
<tr><td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr><td><input type='text' name='invite_numgiven' size='2' maxlength='3' class='text' value='{$invite_numgiven}'>&nbsp;</td><td>{$admin_signup7}</td></tr>
  </table>
</td></tr>
</table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr><td class='header'>{$admin_signup14}</td></tr>
<tr><td class='setting1'>
{$admin_signup15}
</td></tr><tr><td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr><td><input type='radio' name='invitepage' id='invitepage_1' value='1'{if $invitepage == 1} CHECKED{/if}>&nbsp;</td><td><label for='invitepage_1'>{$admin_signup16}</label></td></tr>
  <tr><td><input type='radio' name='invitepage' id='invitepage_0' value='0'{if $invitepage == 0} CHECKED{/if}>&nbsp;</td><td><label for='invitepage_0'>{$admin_signup17}</label></td></tr>
  </table>
</td></tr></table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr><td class='header'>{$admin_signup18}</td></tr>
<tr><td class='setting1'>
{$admin_signup19}
</td></tr><tr><td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr><td><input type='radio' name='verify' id='verify_1' value='1'{if $verify == 1} CHECKED{/if}>&nbsp;</td><td><label for='verify_1'>{$admin_signup20}</label></td></tr>
  <tr><td><input type='radio' name='verify' id='verify_0' value='0'{if $verify == 0} CHECKED{/if}>&nbsp;</td><td><label for='verify_0'>{$admin_signup21}</label></td></tr>
  </table>
</td></tr></table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr><td class='header'>{$admin_signup22}</td></tr>
<tr><td class='setting1'>
{$admin_signup23}
</td></tr><tr><td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr><td><input type='radio' name='code' id='code_1' value='1'{if $code == 1} CHECKED{/if}>&nbsp;</td><td><label for='code_1'>{$admin_signup24}</label></td></tr>
  <tr><td><input type='radio' name='code' id='code_0' value='0'{if $code == 0} CHECKED{/if}>&nbsp;</td><td><label for='code_0'>{$admin_signup25}</label></td></tr>
  </table>
</td></tr></table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr><td class='header'>{$admin_signup26}</td></tr>
<tr><td class='setting1'>
{$admin_signup27}
</td></tr><tr><td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr><td><input type='radio' name='randpass' id='randpass_1' value='1'{if $randpass == 1} CHECKED{/if}>&nbsp;</td><td><label for='randpass_1'>{$admin_signup28}</label></td></tr>
  <tr><td><input type='radio' name='randpass' id='randpass_0' value='0'{if $randpass == 0} CHECKED{/if}>&nbsp;</td><td><label for='randpass_0'>{$admin_signup29}</label></td></tr>
  </table>
</td></tr></table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr><td class='header'>{$admin_signup30}</td></tr>
<tr><td class='setting1'>
{$admin_signup31}
</td></tr><tr><td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr><td><input type='radio' name='tos' id='tos_1' value='1'{if $tos == 1} CHECKED{/if}>&nbsp;</td><td><label for='tos_1'>{$admin_signup32}</label></td></tr>
  <tr><td><input type='radio' name='tos' id='tos_0' value='0'{if $tos == 0} CHECKED{/if}>&nbsp;</td><td><label for='tos_0'>{$admin_signup33}</label></td></tr>
  </table>
<br>
<textarea class='text' name='tostext' rows='5' cols='50' style='width: 100%;'>{$tostext}</textarea>
</td></tr></table>

<br>

<input type='submit' class='button' value='{$admin_signup34}'>
<input type='hidden' name='task' value='dosave'>
</form>


{include file='admin_footer.tpl'}