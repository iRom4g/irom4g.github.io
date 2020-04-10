{include file='header.tpl'}

{if $step == 5}
{* SHOW COMPLETION PAGE *}
  <img src='./images/icons/signup48.gif' border='0' class='icon_big'>
  <div class='page_header'>{$signup19}</div>
  <div>{$signup20}
  {if $setting.setting_signup_enable == 0}{$signup21}{/if}
  {if $setting.setting_signup_randpass == 1}{$signup22}{/if}
  {if $setting.setting_signup_verify == 0}{$signup23}{else}{$signup24}{/if}
  </div>
  <br><br>
  {if $setting.setting_signup_verify == 0 AND $setting.setting_signup_enable != 0 AND $setting.setting_signup_randpass == 0}
    <form action='login.php' method='GET'>
    <input type='submit' class='button' value='{$signup25}'>
    <input type='hidden' name='email' value='{$new_user->user_info.user_email}'>
    </form>
  {else}
    <form action='home.php' method='GET'>
    <input type='submit' class='button' value='{$signup26}'>
    </form>
  {/if}

{* SHOW STEP FOUR *}
{elseif $step == 4}
  <img src='./images/icons/signup48.gif' border='0' class='icon_big'>
  <div class='page_header'>{$signup27}</div>
  <div>{$signup28}</div>
  <br><br>

  <form action='signup.php' method='POST'>
  <table cellpadding='0' cellspacing='0' class='form'>
  <tr>
    <td>
      <b>{$signup29}</b>
      <div>{$signup30}</div>
      <textarea name='invite_emails' rows='3' cols='70' style='margin-top: 3px;'></textarea><br><br>
    </td>
  </tr>
  <tr>
    <td>
      <b>{$signup31}</b>
      <div>{$signup32}</div>
      <textarea name='invite_message' rows='3' cols='70' style='margin-top: 3px;'></textarea>
    </td>
  </tr>
  </table>

  <br>

  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td>
    <input type='submit' class='button' value='{$signup33}'>&nbsp;
    <input type='hidden' name='task' value='{$next_task}'>
    </form>
  </td>
  <td>
    <form action='signup.php' method='POST'><input type='submit' class='button' value='{$signup34}'>
    <input type='hidden' name='task' value='{$next_task}'>
    <input type='hidden' name='step' value='{$step}'>
    </form>
  </td>
  </tr>
  </table>





{* SHOW STEP THREE *}
{elseif $step == 3}
  <img src='./images/icons/signup48.gif' border='0' class='icon_big'>
  <div class='page_header'>{$signup35}</div>
  <div>{$signup36}</div><br>
  <br>

  {* SHOW ERROR MESSAGE *}
  {if $error_message != ""}
    <table cellpadding='0' cellspacing='0'>
    <tr><td class='result'>
      <div class='error'><img src='./images/error.gif' border='0' class='icon'> {$error_message}</div>
    </td></tr></table>
    <br>
  {/if}

  <table cellpadding='0' cellspacing='0' align='center' width='450'>
  <tr>
  <td class='signup_photo'>
    <form action='signup.php' method='POST' enctype='multipart/form-data'>
    <input type='file' class='text' name='photo' size='40'>
    <input type='submit' class='button' value='{$signup37}'>
    <input type='hidden' name='step' value='{$step}'>
    <input type='hidden' name='task' value='{$next_task}'>
    <input type='hidden' name='MAX_FILE_SIZE' value='5000000'>
    </form>
    <div class='signup_photo_desc'>
      {$signup38} {$new_user->level_info.level_photo_exts}.
    </div>
  </td>
  </table>

  <br>

  {* SHOW USER PHOTO IF ONE HAS BEEN UPLOADED, OTHERWISE SHOW SKIP BUTTON *}
  {if $new_user->user_photo() != ""}
    <div class='center'>
      <img src='{$new_user->user_photo()}' border='0' class='photo'><br><br>
      <form action='signup.php' method='POST'>
      <input type='submit' class='button' value='{$signup39}'>
      <input type='hidden' name='task' value='{$last_task}'>
      </form>
    </div>
  {else}
    <div class='center'>
      <div style='font-size: 16pt; font-weight: bold;'>{$signup4}</div><br>
      <form action='signup.php' method='POST'>
      <input type='submit' class='button' value='{$signup34}'>
      <input type='hidden' name='task' value='{$last_task}'>
      </form>
    </div>
  {/if}

  <br>




{* SHOW STEP TWO *}
{elseif $step == 2}
  <img src='./images/icons/signup48.gif' border='0' class='icon_big'>
  <div class='page_header'>{$signup40}</div>
  <div>{$signup41}</div><br>
  <br><br>

  {* SHOW ERROR MESSAGE *}
  {if $error_message != ""}
    <table cellpadding='0' cellspacing='0'>
    <tr><td class='result'>
      <div class='error'><img src='./images/error.gif' border='0' class='icon'> {$error_message}</div>
    </td></tr></table>
    <br>
  {/if}

  <form action='signup.php' method='POST'>
  {* LOOP THROUGH TABS *}
  {section name=tab_loop loop=$tabs}
    <div class='signup_header'>{$tabs[tab_loop].tab_name}</div>
    <table cellpadding='0' cellspacing='0'>

    {* LOOP THROUGH FIELDS IN TAB *}
    {section name=field_loop loop=$tabs[tab_loop].fields}
      <tr>
      <td class='form1' width='150'>{$tabs[tab_loop].fields[field_loop].field_title}{if $tabs[tab_loop].fields[field_loop].field_required != 0}*{/if}</td>
      <td class='form2'>



      {if $tabs[tab_loop].fields[field_loop].field_type == 1}
      {* TEXT FIELD *}
        <div><input type='text' class='text' name='field_{$tabs[tab_loop].fields[field_loop].field_id}' value='{$tabs[tab_loop].fields[field_loop].field_value}' style='{$tabs[tab_loop].fields[field_loop].field_style}' maxlength='{$tabs[tab_loop].fields[field_loop].field_maxlength}'></div>
        <div class='form_desc'>{$tabs[tab_loop].fields[field_loop].field_desc}</div>



      {elseif $tabs[tab_loop].fields[field_loop].field_type == 2}
      {* TEXTAREA *}
        <div><textarea rows='6' cols='50' name='field_{$tabs[tab_loop].fields[field_loop].field_id}' style='{$tabs[tab_loop].fields[field_loop].field_style}'>{$tabs[tab_loop].fields[field_loop].field_value}</textarea></div>
        <div class='form_desc'>{$tabs[tab_loop].fields[field_loop].field_desc}</div>



      {* SELECT BOX *}
      {elseif $tabs[tab_loop].fields[field_loop].field_type == 3}
        <div><select name='field_{$tabs[tab_loop].fields[field_loop].field_id}' id='field_{$tabs[tab_loop].fields[field_loop].field_id}' onchange="ShowHideSelectDeps({$tabs[tab_loop].fields[field_loop].field_id})" style='{$tabs[tab_loop].fields[field_loop].field_style}'>
        <option value='-1'></option>
        {* LOOP THROUGH FIELD OPTIONS *}
        {section name=option_loop loop=$tabs[tab_loop].fields[field_loop].field_options}
          <option id='op' value='{$tabs[tab_loop].fields[field_loop].field_options[option_loop].option_id}'{if $tabs[tab_loop].fields[field_loop].field_options[option_loop].option_id == $tabs[tab_loop].fields[field_loop].field_value} SELECTED{/if}>{$tabs[tab_loop].fields[field_loop].field_options[option_loop].option_label}</option>
        {/section}
        </select>
        </div>
        {* LOOP THROUGH DEPENDENT FIELDS *}
        {section name=option_loop loop=$tabs[tab_loop].fields[field_loop].field_options}
          {if $tabs[tab_loop].fields[field_loop].field_options[option_loop].option_dependency == 1}
            <div id='field_{$tabs[tab_loop].fields[field_loop].field_id}_option{$tabs[tab_loop].fields[field_loop].field_options[option_loop].option_id}' style='margin: 5px 5px 10px 5px;{if $tabs[tab_loop].fields[field_loop].field_options[option_loop].option_id != $tabs[tab_loop].fields[field_loop].field_value} display: none;{/if}'>
            {$tabs[tab_loop].fields[field_loop].field_options[option_loop].dep_field_title}{if $tabs[tab_loop].fields[field_loop].field_options[option_loop].dep_field_required != 0}*{/if}
            <input type='text' class='text' name='field_{$tabs[tab_loop].fields[field_loop].field_options[option_loop].dep_field_id}' value='{$tabs[tab_loop].fields[field_loop].field_options[option_loop].dep_field_value}' style='{$tabs[tab_loop].fields[field_loop].field_options[option_loop].dep_field_style}' maxlength='{$tabs[tab_loop].fields[field_loop].field_options[option_loop].dep_field_maxlength}'>
            </div>
	  {else}
            <div id='field_{$tabs[tab_loop].fields[field_loop].field_id}_option{$tabs[tab_loop].fields[field_loop].field_options[option_loop].option_id}' style='display: none;'></div>
          {/if}
        {/section}
        <div class='form_desc'>{$tabs[tab_loop].fields[field_loop].field_desc}</div>
    


      {* RADIO BUTTONS *}
      {elseif $tabs[tab_loop].fields[field_loop].field_type == 4}
    
        {* LOOP THROUGH FIELD OPTIONS *}
        {section name=option_loop loop=$tabs[tab_loop].fields[field_loop].field_options}
          <div>
          <input type='radio' class='radio' onclick="ShowHideRadioDeps({$tabs[tab_loop].fields[field_loop].field_id}, {$tabs[tab_loop].fields[field_loop].field_options[option_loop].option_id}, 'field_{$tabs[tab_loop].fields[field_loop].field_options[option_loop].dep_field_id}', {$tabs[tab_loop].fields[field_loop].field_options|@count})" style='{$tabs[tab_loop].fields[field_loop].field_style}' name='field_{$tabs[tab_loop].fields[field_loop].field_id}' id='label_{$tabs[tab_loop].fields[field_loop].field_id}_{$tabs[tab_loop].fields[field_loop].field_options[option_loop].option_id}' value='{$tabs[tab_loop].fields[field_loop].field_options[option_loop].option_id}'{if $tabs[tab_loop].fields[field_loop].field_options[option_loop].option_id == $tabs[tab_loop].fields[field_loop].field_value} CHECKED{/if}>
          <label for='label_{$tabs[tab_loop].fields[field_loop].field_id}_{$tabs[tab_loop].fields[field_loop].field_options[option_loop].option_id}'>{$tabs[tab_loop].fields[field_loop].field_options[option_loop].option_label}</label>

          {* DISPLAY DEPENDENT FIELDS *}
          {if $tabs[tab_loop].fields[field_loop].field_options[option_loop].option_dependency == 1}
            <div id='field_{$tabs[tab_loop].fields[field_loop].field_id}_radio{$tabs[tab_loop].fields[field_loop].field_options[option_loop].option_id}' style='margin: 0px 5px 10px 23px;{if $tabs[tab_loop].fields[field_loop].field_options[option_loop].option_id != $tabs[tab_loop].fields[field_loop].field_value} display: none;{/if}'>
            {$tabs[tab_loop].fields[field_loop].field_options[option_loop].dep_field_title}
            {if $tabs[tab_loop].fields[field_loop].field_options[option_loop].dep_field_required != 0}*{/if}
            <input type='text' class='text' name='field_{$tabs[tab_loop].fields[field_loop].field_options[option_loop].dep_field_id}' id='field_{$tabs[tab_loop].fields[field_loop].field_options[option_loop].dep_field_id}' value='{$tabs[tab_loop].fields[field_loop].field_options[option_loop].dep_field_value}' style='{$tabs[tab_loop].fields[field_loop].field_options[option_loop].dep_field_style}' maxlength='{$tabs[tab_loop].fields[field_loop].field_options[option_loop].dep_field_maxlength}'>
            </div>
	  {else}
            <div id='field_{$tabs[tab_loop].fields[field_loop].field_id}_radio{$tabs[tab_loop].fields[field_loop].field_options[option_loop].option_id}' style='display: none;'></div>
          {/if}

          </div>
        {/section}
        <div class='form_desc'>{$tabs[tab_loop].fields[field_loop].field_desc}</div>




      {elseif $tabs[tab_loop].fields[field_loop].field_type == 5}
      {* DATE FIELD *}
        <div>
        <select name='field_{$tabs[tab_loop].fields[field_loop].field_id}_1' style='{$tabs[tab_loop].fields[field_loop].field_style}'>
        {section name=date1 loop=$tabs[tab_loop].fields[field_loop].date_array1}
          <option value='{$tabs[tab_loop].fields[field_loop].date_array1[date1].value}'{$tabs[tab_loop].fields[field_loop].date_array1[date1].selected}>{$tabs[tab_loop].fields[field_loop].date_array1[date1].name}</option>
        {/section}
        </select>

        <select name='field_{$tabs[tab_loop].fields[field_loop].field_id}_2' style='{$tabs[tab_loop].fields[field_loop].field_style}'>
        {section name=date2 loop=$tabs[tab_loop].fields[field_loop].date_array2}
          <option value='{$tabs[tab_loop].fields[field_loop].date_array2[date2].value}'{$tabs[tab_loop].fields[field_loop].date_array2[date2].selected}>{$tabs[tab_loop].fields[field_loop].date_array2[date2].name}</option>
        {/section}
        </select>

        <select name='field_{$tabs[tab_loop].fields[field_loop].field_id}_3' style='{$tabs[tab_loop].fields[field_loop].field_style}'>
        {section name=date3 loop=$tabs[tab_loop].fields[field_loop].date_array3}
          <option value='{$tabs[tab_loop].fields[field_loop].date_array3[date3].value}'{$tabs[tab_loop].fields[field_loop].date_array3[date3].selected}>{$tabs[tab_loop].fields[field_loop].date_array3[date3].name}</option>
        {/section}
        </select>
        </div>
        <div class='form_desc'>{$tabs[tab_loop].fields[field_loop].field_desc}</div>
      {/if}


      {if $tabs[tab_loop].fields[field_loop].field_error != ""}<div class='form_error'><img src='./images/icons/error16.gif' border='0' class='icon'> {$tabs[tab_loop].fields[field_loop].field_error}</div>{/if}
    </td>
    </tr>
    {/section}
  </table>
  <br>
  {/section}

  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td class='form1' width='100'>&nbsp;</td>
  <td class='form2'><input type='submit' class='button' value='{$signup25}'></td>
  </tr>
  </table>
  <input type='hidden' name='task' value='{$next_task}'>
  <input type='hidden' name='step' value='{$step}'>
  <input type='hidden' name='signup_email' value='{$signup_email}'>
  <input type='hidden' name='signup_password' value='{$signup_password}'>
  <input type='hidden' name='signup_password2' value='{$signup_password2}'>
  <input type='hidden' name='signup_username' value='{$signup_username}'>
  <input type='hidden' name='signup_timezone' value='{$signup_timezone}'>
  <input type='hidden' name='signup_lang' value='{$signup_lang}'>
  <input type='hidden' name='signup_invite' value='{$signup_invite}'>
  <input type='hidden' name='signup_secure' value='{$signup_secure}'>
  <input type='hidden' name='signup_agree' value='{$signup_agree}'>
  </form>










{* SHOW STEP ONE *}
{else}
  <img src='./images/icons/signup48.gif' border='0' class='icon_big'>
  <div class='page_header'>{$signup42}</div>
  <div>{$signup43}</div>
  <br><br>

  {* SHOW ERROR MESSAGE *}
  {if $error_message != ""}
    <table cellpadding='0' cellspacing='0'>
    <tr><td class='result'>
      <div class='error'><img src='./images/error.gif' border='0' class='icon'> {$error_message}</div>
    </td></tr></table>
    <br>
  {/if}

  <form action='signup.php' method='POST'>
  <div class='signup_header'>{$signup44}</div>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td class='form1' width='100'>{$signup45}</td>
  <td class='form2'>
    <input name='signup_email' type='text' class='text' maxlength='70' size='40' value='{$signup_email}'>
    <div class='form_desc'>{$signup46}</div>
  </td>
  </tr>

  {if $setting.setting_signup_randpass == 0}
    <tr>
    <td class='form1'>{$signup47}</td>
    <td class='form2'>
      <input name='signup_password' type='password' class='text' maxlength='50' size='40' value='{$signup_password}'>
      <div class='form_desc'>{$signup48}</div>
    </td>
    </tr>
    <tr>
    <td class='form1'>{$signup49}</td>
    <td class='form2'>
      <input name='signup_password2' type='password' class='text' maxlength='50' size='40' value='{$signup_password2}'>
      <div class='form_desc'>{$signup50}</div>
    </td>
    </tr>
  {else}
    <input type='hidden' name='signup_password' value=''>
    <input type='hidden' name='signup_password2' value=''>
  {/if}
  </table>

  <br>

  <div class='signup_header'>{$signup51}</div>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td class='form1'>{$signup52}</td>
  <td class='form2'>
    <input name='signup_username' type='text' class='text' maxlength='50' size='40' value='{$signup_username}'>
    <img src='./images/icons/tip.gif' border='0' class='icon' onMouseover="tip('{$signup53}')"; onMouseout="hidetip()">
    <div class='form_desc'>{$signup54}</div>
  </td>
  </tr>
  <tr>
  <td class='form1' width='100'>{$signup55}</td>
  <td class='form2'>
    <select name='signup_timezone'>
    <option value='-8'{if $signup_timezone == "-8"} SELECTED{/if}>Pacific Time (US & Canada)</option>
    <option value='-7'{if $signup_timezone == "-7"} SELECTED{/if}>Mountain Time (US & Canada)</option>
    <option value='-6'{if $signup_timezone == "-6"} SELECTED{/if}>Central Time (US & Canada)</option>
    <option value='-5'{if $signup_timezone == "-5"} SELECTED{/if}>Eastern Time (US & Canada)</option>
    <option value='-4'{if $signup_timezone == "-4"} SELECTED{/if}>Atlantic Time (Canada)</option>
    <option value='-9'{if $signup_timezone == "-9"} SELECTED{/if}>Alaska (US & Canada)</option>
    <option value='-10'{if $signup_timezone == "-10"} SELECTED{/if}>Hawaii (US)</option>
    <option value='-11'{if $signup_timezone == "-11"} SELECTED{/if}>Midway Island, Samoa</option>
    <option value='-12'{if $signup_timezone == "-12"} SELECTED{/if}>Eniwetok, Kwajalein</option>
    <option value='-3.3'{if $signup_timezone == "-3.3"} SELECTED{/if}>Newfoundland</option>
    <option value='-3'{if $signup_timezone == "-3"} SELECTED{/if}>Brasilia, Buenos Aires, Georgetown</option>
    <option value='-2'{if $signup_timezone == "-2"} SELECTED{/if}>Mid-Atlantic</option>
    <option value='-1'{if $signup_timezone == "-1"} SELECTED{/if}>Azores, Cape Verde Is.</option>
    <option value='0'{if $signup_timezone == "0"} SELECTED{/if}>Greenwich Mean Time (Lisbon, London)</option>
    <option value='1'{if $signup_timezone == "1"} SELECTED{/if}>Amsterdam, Berlin, Paris, Rome, Madrid</option>
    <option value='2'{if $signup_timezone == "2"} SELECTED{/if}>Athens, Helsinki, Istanbul, Cairo, E. Europe</option>
    <option value='3'{if $signup_timezone == "3"} SELECTED{/if}>Baghdad, Kuwait, Nairobi, Moscow</option>
    <option value='3.3'{if $signup_timezone == "3.3"} SELECTED{/if}>Tehran</option>
    <option value='4'{if $signup_timezone == "4"} SELECTED{/if}>Abu Dhabi, Kazan, Muscat</option>
    <option value='4.3'{if $signup_timezone == "4.3"} SELECTED{/if}>Kabul</option>
    <option value='5'{if $signup_timezone == "5"} SELECTED{/if}>Islamabad, Karachi, Tashkent</option>
    <option value='5.5'{if $signup_timezone == "5.5"} SELECTED{/if}>Bombay, Calcutta, New Delhi</option>
    <option value='6'{if $signup_timezone == "6"} SELECTED{/if}>Almaty, Dhaka</option>
    <option value='7'{if $signup_timezone == "7"} SELECTED{/if}>Bangkok, Jakarta, Hanoi</option>
    <option value='8'{if $signup_timezone == "8"} SELECTED{/if}>Beijing, Hong Kong, Singapore, Taipei</option>
    <option value='9'{if $signup_timezone == "9"} SELECTED{/if}>Tokyo, Osaka, Sapporto, Seoul, Yakutsk</option>
    <option value='9.3'{if $signup_timezone == "9.3"} SELECTED{/if}>Adelaide, Darwin</option>
    <option value='10'{if $signup_timezone == "10"} SELECTED{/if}>Brisbane, Melbourne, Sydney, Guam</option>
    <option value='11'{if $signup_timezone == "11"} SELECTED{/if}>Magadan, Soloman Is., New Caledonia</option>
    <option value='12'{if $signup_timezone == "12"} SELECTED{/if}>Fiji, Kamchatka, Marshall Is., Wellington</option>
    </select>
  </td>
  </tr>
  {if $setting.setting_lang_allow == 1}
    <tr>
    <td class='form1'>{$signup3}</td>
    <td class='form2'>
      <select name='signup_lang'>
        {section name=lang_loop loop=$lang_options}
          <option value='{$lang_options[lang_loop]}'{if $setting.setting_lang_default|lower == $lang_options[lang_loop]|lower} selected='selected'{/if}>{$lang_options[lang_loop]}</option>
        {/section}
      </select>
    </td>
    </tr>
  {/if}
  </table>

  {if $setting.setting_signup_code == 1 OR $setting.setting_signup_tos == 1 OR $setting.setting_signup_invite != 0}
    <br>
    <div class='signup_header'>{$signup56}</div>
    <table cellpadding='0' cellspacing='0'>
  {/if}

  {if $setting.setting_signup_invite != 0}
    <tr>
    <td class='form1' width='100'>{$signup57}</td>
    <td class='form2'><input type='text' name='signup_invite' value='{$signup_invite}' class='text' size='10' maxlength='10''></td>
    </tr>
  {/if}

  {if $setting.setting_signup_code == 1}
    <tr>
    <td class='form1' width='100'>{$signup58}</td>
    <td class='form2'>
      <table cellpadding='0' cellspacing='0'>
      <tr>
      <td><input type='text' name='signup_secure' class='text' size='6' maxlength='10'>&nbsp;</td>
      <td>
        <table cellpadding='0' cellspacing='0'>
        <tr>
        <td><img src='./images/secure.php' border='0' height='20' width='67' class='signup_code'>&nbsp;&nbsp;</td>
        <td><img src='./images/icons/tip.gif' border='0' class='icon' onMouseover="tip('{$signup59}')"; onMouseout="hidetip()"></td>
        </tr>
        </table>
      </td>
      </tr>
      </table>
    </td>
    </tr>
  {/if}

  {if $setting.setting_signup_tos == 1}
    <tr>
    <td class='form1' width='100'>&nbsp;</td>
    <td class='form2'><input type='checkbox' name='signup_agree' id='tos' value='1'{if $signup_agree == 1} CHECKED{/if}><label for='tos'> {$signup60}</label></td>
    </tr>
  {/if}

  <tr><td colspan='2'>&nbsp;</td></tr>
  <tr>
  <td class='form1'>&nbsp;</td>
  <td class='form2'><input type='submit' class='button' value='{$signup25}'></td>
  </tr>
  </table>
  <input type='hidden' name='task' value='{$next_task}'>
  <input type='hidden' name='step' value='{$step}'>
  </form>

{/if}


{include file='footer.tpl'}