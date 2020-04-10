{include file='header.tpl'}

<table class='tabs' cellpadding='0' cellspacing='0'>
<tr>
<td class='tab0'>&nbsp;</td>
<td class='tab1' NOWRAP><a href='user_account.php'>{$user_account12}</a></td>
<td class='tab'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='user_account_pass.php'>{$user_account13}</a></td>
<td class='tab'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='user_account_delete.php'>{$user_account14}</a></td>
<td class='tab3'>&nbsp;</td>
</tr>
</table>

<img src='./images/icons/settings48.gif' border='0' class='icon_big'>
<div class='page_header'>{$user_account15}</div>
<div>{$user_account16}</div>

<br><br>

{* JAVASCRIPT FOR ADDING NEW FIELDS TO BLOCK LIST *}
<script type="text/javascript">
<!-- 
var blocked_id = {$num_blocked};
{literal}
function addInput(fieldname) {
  var ni = document.getElementById(fieldname);
  var newdiv = document.createElement('div');
  var divIdName = 'my'+blocked_id+'Div';
  newdiv.setAttribute('id',divIdName);
  newdiv.innerHTML = "<input type='text' name='blocked" + blocked_id +"' size='25' class='text' maxlength='50'>&nbsp;<br>";
  ni.appendChild(newdiv);
  blocked_id++;
  window.document.info.num_blocked.value=blocked_id;
}
{/literal}
// -->
</script>

{* SHOW ERROR OR SUCCESS MESSAGES *}
{if $result != ""}
  <table cellpadding='0' cellspacing='0'>
  <tr><td class='success'><img src='./images/success.gif' border='0' class='icon'>{$result}</td></tr>
  </table>
{elseif $error_message != ""}
  <table cellpadding='0' cellspacing='0'>
  <tr><td class='error'><img src='./images/error.gif' border='0' class='icon'>{$error_message}</td></tr>
  </table>
{/if}

<form action='user_account.php' method='post' name='info'>
<table cellpadding='0' cellspacing='0'>
<tr>
<td class='form1'>{$user_account17}</td>
<td class='form2'>
  <input name='user_email' type='text' class='text' size='40' maxlength='70' value='{$user->user_info.user_email}'>
  {if $user->user_info.user_email != $user->user_info.user_newemail & $user->user_info.user_newemail != "" & $setting.setting_signup_verify != 0}<div class='form_desc'>{$user_account18} {$user->user_info.user_newemail}</div>{/if}
  {if $setting.setting_subnet_field1_id == 0 | $setting.setting_subnet_field2_id == 0}<div class='form_desc'>{$user_account19} {$user->subnet_info.subnet_name}</div>{/if}
</td>
</tr>
<tr>
<td class='form1'>{$user_account20}</td>
<td class='form2'>
  <input name='user_username' type='text' class='text' size='40' maxlength='50' value='{$user->user_info.user_username}'>
  <img src='./images/icons/tip.gif' border='0' class='icon' onMouseover="tip('{$user_account21}')"; onMouseout="hidetip()">
  <div class='form_desc'>{$user_account4}</div>
</td>
</tr>
<tr>
<td class='form1'>{$user_account22}</td>
<td class='form2'>
  <select name='user_timezone'>
  <option value='-8'{if $user->user_info.user_timezone == "-8"} SELECTED{/if}>Pacific Time (US & Canada)</option>
  <option value='-7'{if $user->user_info.user_timezone == "-7"} SELECTED{/if}>Mountain Time (US & Canada)</option>
  <option value='-6'{if $user->user_info.user_timezone == "-6"} SELECTED{/if}>Central Time (US & Canada)</option>
  <option value='-5'{if $user->user_info.user_timezone == "-5"} SELECTED{/if}>Eastern Time (US & Canada)</option>
  <option value='-4'{if $user->user_info.user_timezone == "-4"} SELECTED{/if}>Atlantic Time (Canada)</option>
  <option value='-9'{if $user->user_info.user_timezone == "-9"} SELECTED{/if}>Alaska (US & Canada)</option>
  <option value='-10'{if $user->user_info.user_timezone == "-10"} SELECTED{/if}>Hawaii (US)</option>
  <option value='-11'{if $user->user_info.user_timezone == "-11"} SELECTED{/if}>Midway Island, Samoa</option>
  <option value='-12'{if $user->user_info.user_timezone == "-12"} SELECTED{/if}>Eniwetok, Kwajalein</option>
  <option value='-3.3'{if $user->user_info.user_timezone == "-3.3"} SELECTED{/if}>Newfoundland</option>
  <option value='-3'{if $user->user_info.user_timezone == "-3"} SELECTED{/if}>Brasilia, Buenos Aires, Georgetown</option>
  <option value='-2'{if $user->user_info.user_timezone == "-2"} SELECTED{/if}>Mid-Atlantic</option>
  <option value='-1'{if $user->user_info.user_timezone == "-1"} SELECTED{/if}>Azores, Cape Verde Is.</option>
  <option value='0'{if $user->user_info.user_timezone == "0"} SELECTED{/if}>Greenwich Mean Time (Lisbon, London)</option>
  <option value='1'{if $user->user_info.user_timezone == "1"} SELECTED{/if}>Amsterdam, Berlin, Paris, Rome, Madrid</option>
  <option value='2'{if $user->user_info.user_timezone == "2"} SELECTED{/if}>Athens, Helsinki, Istanbul, Cairo, E. Europe</option>
  <option value='3'{if $user->user_info.user_timezone == "3"} SELECTED{/if}>Baghdad, Kuwait, Nairobi, Moscow</option>
  <option value='3.3'{if $user->user_info.user_timezone == "3.3"} SELECTED{/if}>Tehran</option>
  <option value='4'{if $user->user_info.user_timezone == "4"} SELECTED{/if}>Abu Dhabi, Kazan, Muscat</option>
  <option value='4.3'{if $user->user_info.user_timezone == "4.3"} SELECTED{/if}>Kabul</option>
  <option value='5'{if $user->user_info.user_timezone == "5"} SELECTED{/if}>Islamabad, Karachi, Tashkent</option>
  <option value='5.5'{if $user->user_info.user_timezone == "5.5"} SELECTED{/if}>Bombay, Calcutta, New Delhi</option>
  <option value='6'{if $user->user_info.user_timezone == "6"} SELECTED{/if}>Almaty, Dhaka</option>
  <option value='7'{if $user->user_info.user_timezone == "7"} SELECTED{/if}>Bangkok, Jakarta, Hanoi</option>
  <option value='8'{if $user->user_info.user_timezone == "8"} SELECTED{/if}>Beijing, Hong Kong, Singapore, Taipei</option>
  <option value='9'{if $user->user_info.user_timezone == "9"} SELECTED{/if}>Tokyo, Osaka, Sapporto, Seoul, Yakutsk</option>
  <option value='9.3'{if $user->user_info.user_timezone == "9.3"} SELECTED{/if}>Adelaide, Darwin</option>
  <option value='10'{if $user->user_info.user_timezone == "10"} SELECTED{/if}>Brisbane, Melbourne, Sydney, Guam</option>
  <option value='11'{if $user->user_info.user_timezone == "11"} SELECTED{/if}>Magadan, Soloman Is., New Caledonia</option>
  <option value='12'{if $user->user_info.user_timezone == "12"} SELECTED{/if}>Fiji, Kamchatka, Marshall Is., Wellington</option>
  </select>
</td>
</tr>

{* SHOW LANG SETTING *}
{if $setting.setting_lang_allow == 1}
  <tr>
  <td class='form1'>{$user_account1}</td>
  <td class='form2'>
    <select name='user_lang'>
      {section name=lang_loop loop=$lang_options}
        <option value='{$lang_options[lang_loop]}'{if $user->user_info.user_lang == $lang_options[lang_loop]|lower} selected='selected'{/if}>{$lang_options[lang_loop]}</option>
      {/section}
    </select>
  </td>
  </tr>
{/if}

{* SHOW ACTION PRIVACY SETTING *}
{if $setting.setting_actions_privacy == 1}
  <tr>
  <td class='form1'>{$user_account2}</td>
  <td class='form2'>
    <div style='padding: 3px 0px 5px 0px;'>{$user_account3}</div>
    <table cellpadding='0' cellspacing='0'>
    {section name=actiontypes_loop loop=$actiontypes}
      {if $actiontypes[actiontypes_loop].actiontype_desc != ""}
        <tr>
        <td><input type='checkbox' name='actiontype_id_{$actiontypes[actiontypes_loop].actiontype_id}' id='actiontype_id_{$actiontypes[actiontypes_loop].actiontype_id}' value='{$actiontypes[actiontypes_loop].actiontype_id}'{if $actiontypes[actiontypes_loop].actiontype_selected == 1} checked='checked'{/if}></td>
        <td><label for='actiontype_id_{$actiontypes[actiontypes_loop].actiontype_id}'>{$actiontypes[actiontypes_loop].actiontype_desc}</label></td>
        </tr>
      {else}
        <input type='hidden' name='actiontype_id_{$actiontypes[actiontypes_loop].actiontype_id}' value='{$actiontypes[actiontypes_loop].actiontype_id}'>
      {/if}
    {/section}
    </table>
    <input type='hidden' name='actiontypes_max_id' value='{$actiontypes_max_id}'>
  </td>
  </tr>
{/if}

{* SHOW BLOCKLIST *}
{if $user->level_info.level_profile_block != 0}
  <tr>
  <td class='form1'>{$user_account33}</td>
  <td class='form2'>
    <table cellpadding='0' cellspacing='0'>
    {* SHOW CURRENT BLOCKED USERS *}
    {section name=blocked_loop loop=$blocked_users}
      <tr>
      <td>
        <input type='text' class='text' name='blocked{$smarty.section.blocked_loop.index}' size='25' maxlength='50' value='{$blocked_users[blocked_loop]}'>
        {if $smarty.section.blocked_loop.first}<img src='./images/icons/tip.gif' border='0' class='icon' onMouseover="tip('{$user_account34}')"; onMouseout="hidetip()">{/if}
      </td>
      </tr>
    {/section}
    {if $smarty.section.blocked_loop.total == 0}
      <tr>
      <td>
        <input type='text' class='text' name='blocked0' size='25' maxlength='50' value=''>
        <img src='./images/icons/tip.gif' border='0' class='icon' onMouseover="tip('{$user_account34}')"; onMouseout="hidetip()">
      </td>
      </tr>
    {/if}
    <tr><td><p id='newblock'></p></td></tr>
    <tr><td><a href="javascript:addInput('newblock')">{$user_account35}</a></td></tr>
    </table>
    <input type='hidden' name='num_blocked' value='{$num_blocked}'>
  </td>
  </tr>
{/if}

<tr>
<td class='form1'>&nbsp;</td>
<td class='form2'><input type='submit' class='button' value='{$user_account36}'></td>
</tr>
</table>
<input type='hidden' name='task' value='dosave'>
</form>

{include file='footer.tpl'}