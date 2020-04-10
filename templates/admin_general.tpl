{include file='admin_header.tpl'}

<h2>{$admin_general1}</h2>
{$admin_general2}

<br><br>

{if $result != 0}
<div class='success'><img src='../images/success.gif' class='icon' border='0'> {$admin_general8}</div>
{/if}

<table cellpadding='0' cellspacing='0' width='600'>
<tr><form action='admin_general.php' method='POST'>
<td class='header'>{$admin_general9}</td>
</tr>
<tr>
<td class='setting1'>
{$admin_general10}
</td>
</tr>
<tr>
<td class='setting2'>
<b>{$admin_general11}</b><br>
<input type='radio' name='setting_permission_profile' id='permission_profile_1' value='1'{if $permission_profile == 1} CHECKED{/if}><label for='permission_profile_1'>{$admin_general12}</label><br>
<input type='radio' name='setting_permission_profile' id='permission_profile_0' value='0'{if $permission_profile == 0} CHECKED{/if}><label for='permission_profile_0'>{$admin_general13}</label><br>
</td>
</tr>
<tr>
<td class='setting2'>
<b>{$admin_general14}</b><br>
<input type='radio' name='setting_permission_invite' id='permission_invite_1' value='1'{if $permission_invite == 1} CHECKED{/if}><label for='permission_invite_1'>{$admin_general15}</label><br>
<input type='radio' name='setting_permission_invite' id='permission_invite_0' value='0'{if $permission_invite == 0} CHECKED{/if}><label for='permission_invite_0'>{$admin_general16}</label><br>
</td>
</tr>
<tr>
<td class='setting2'>
<b>{$admin_general17}</b><br>
<input type='radio' name='setting_permission_search' id='permission_search_1' value='1'{if $permission_search == 1} CHECKED{/if}><label for='permission_search_1'>{$admin_general18}</label><br>
<input type='radio' name='setting_permission_search' id='permission_search_0' value='0'{if $permission_search == 0} CHECKED{/if}><label for='permission_search_0'>{$admin_general19}</label><br>
</td>
</tr>
<tr>
<td class='setting2'>
<b>{$admin_general20}</b><br>
<input type='radio' name='setting_permission_portal' id='permission_portal_1' value='1'{if $permission_portal == 1} CHECKED{/if}><label for='permission_portal_1'>{$admin_general21}</label><br>
<input type='radio' name='setting_permission_portal' id='permission_portal_0' value='0'{if $permission_portal == 0} CHECKED{/if}><label for='permission_portal_0'>{$admin_general22}</label><br>
</td>
</tr>
</table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr>
<td class='header'>{$admin_general23}</td>
</tr>
<tr>
<td class='setting1'>
{$admin_general24}
</td>
</tr>
<tr>
<td class='setting2'>
<select name='setting_lang_default' class='text'>
{section name=lang_loop loop=$lang_options}
  <option value='{$lang_options[lang_loop]}'{if $lang_value == $lang_options[lang_loop]|lower} SELECTED{/if}>{$lang_options[lang_loop]}</option>
{/section}
</select>
</td>
</tr>
<tr>
<td class='setting1'>
{$admin_general25}
</td>
</tr>
<tr>
<td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td><input type='radio' name='setting_lang_allow' id='lang_allow_1' value='1'{if $lang_allow == 1} checked='checked'{/if}></td>
  <td><label for='lang_allow_1'>{$admin_general26}</label></td>
  </tr>
  <tr>
  <td><input type='radio' name='setting_lang_allow' id='lang_allow_0' value='0'{if $lang_allow == 0} checked='checked'{/if}></td>
  <td><label for='lang_allow_0'>{$admin_general27}</label></td>
  </tr>
  </table>
</td>
</tr>
</table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr>
<td class='header'>{$admin_general3}</td>
</tr>
<tr>
<td class='setting1'>
{$admin_general4}
</td>
</tr>
<tr>
<td class='setting2'>
<select name='setting_timezone' class='text'>
<option value='-8'{if $timezone_value == "-8"} SELECTED{/if}>Pacific Time (US & Canada)</option>
<option value='-7'{if $timezone_value == "-7"} SELECTED{/if}>Mountain Time (US & Canada)</option>
<option value='-6'{if $timezone_value == "-6"} SELECTED{/if}>Central Time (US & Canada)</option>
<option value='-5'{if $timezone_value == "-5"} SELECTED{/if}>Eastern Time (US & Canada)</option>
<option value='-4'{if $timezone_value == "-4"} SELECTED{/if}>Atlantic Time (Canada)</option>
<option value='-9'{if $timezone_value == "-9"} SELECTED{/if}>Alaska (US & Canada)</option>
<option value='-10'{if $timezone_value == "-10"} SELECTED{/if}>Hawaii (US)</option>
<option value='-11'{if $timezone_value == "-11"} SELECTED{/if}>Midway Island, Samoa</option>
<option value='-12'{if $timezone_value == "-12"} SELECTED{/if}>Eniwetok, Kwajalein</option>
<option value='-3.3'{if $timezone_value == "-3.3"} SELECTED{/if}>Newfoundland</option>
<option value='-3'{if $timezone_value == "-3"} SELECTED{/if}>Brasilia, Buenos Aires, Georgetown</option>
<option value='-2'{if $timezone_value == "-2"} SELECTED{/if}>Mid-Atlantic</option>
<option value='-1'{if $timezone_value == "-1"} SELECTED{/if}>Azores, Cape Verde Is.</option>
<option value='0'{if $timezone_value == "0"} SELECTED{/if}>Greenwich Mean Time (Lisbon, London)</option>
<option value='1'{if $timezone_value == "1"} SELECTED{/if}>Amsterdam, Berlin, Paris, Rome, Madrid</option>
<option value='2'{if $timezone_value == "2"} SELECTED{/if}>Athens, Helsinki, Istanbul, Cairo, E. Europe</option>
<option value='3'{if $timezone_value == "3"} SELECTED{/if}>Baghdad, Kuwait, Nairobi, Moscow</option>
<option value='3.3'{if $timezone_value == "3.3"} SELECTED{/if}>Tehran</option>
<option value='4'{if $timezone_value == "4"} SELECTED{/if}>Abu Dhabi, Kazan, Muscat</option>
<option value='4.3'{if $timezone_value == "4.3"} SELECTED{/if}>Kabul</option>
<option value='5'{if $timezone_value == "5"} SELECTED{/if}>Islamabad, Karachi, Tashkent</option>
<option value='5.5'{if $timezone_value == "5.5"} SELECTED{/if}>Bombay, Calcutta, New Delhi</option>
<option value='6'{if $timezone_value == "6"} SELECTED{/if}>Almaty, Dhaka</option>
<option value='7'{if $timezone_value == "7"} SELECTED{/if}>Bangkok, Jakarta, Hanoi</option>
<option value='8'{if $timezone_value == "8"} SELECTED{/if}>Beijing, Hong Kong, Singapore, Taipei</option>
<option value='9'{if $timezone_value == "9"} SELECTED{/if}>Tokyo, Osaka, Sapporto, Seoul, Yakutsk</option>
<option value='9.3'{if $timezone_value == "9.3"} SELECTED{/if}>Adelaide, Darwin</option>
<option value='10'{if $timezone_value == "10"} SELECTED{/if}>Brisbane, Melbourne, Sydney, Guam</option>
<option value='11'{if $timezone_value == "11"} SELECTED{/if}>Magadan, Soloman Is., New Caledonia</option>
<option value='12'{if $timezone_value == "12"} SELECTED{/if}>Fiji, Kamchatka, Marshall Is., Wellington</option>
</select>
</td>
</tr>
</table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr>
<td class='header'>{$admin_general5}</td>
</tr>
<tr>
<td class='setting1'>
{$admin_general6}
</td>
</tr>
<tr>
<td class='setting2'>
<select name='setting_dateformat' class='text'>
<option value='n/j/Y'{if $dateformat_value == "n/j/Y"} SELECTED{/if}>7/17/2006</option>
<option value='n.j.Y'{if $dateformat_value == "n.j.Y"} SELECTED{/if}>7.17.2006</option>
<option value='n-j-Y'{if $dateformat_value == "n-j-Y"} SELECTED{/if}>7-17-2006</option>
<option value='Y/n/j'{if $dateformat_value == "Y/n/j"} SELECTED{/if}>2006/7/17</option>
<option value='Y-n-j'{if $dateformat_value == "Y-n-j"} SELECTED{/if}>2006-7-17</option>
<option value='Y-m-d'{if $dateformat_value == "Y-m-d"} SELECTED{/if}>2006-07-17</option>
<option value='Ynj'{if $dateformat_value == "Ynj"} SELECTED{/if}>2006717</option>
<option value='j/n/Y'{if $dateformat_value == "j/n/Y"} SELECTED{/if}>17/7/2006</option>
<option value='j.n.Y'{if $dateformat_value == "j.n.Y"} SELECTED{/if}>17.7.2006</option>
<option value='M. j, Y'{if $dateformat_value == "M. j, Y"} SELECTED{/if}>Jul. 17, 2006</option>
<option value='F j, Y'{if $dateformat_value == "F j, Y"} SELECTED{/if}>July 17, 2006</option>
<option value='j F Y'{if $dateformat_value == "j F Y"} SELECTED{/if}>17 July 2006</option>
<option value='l, F j, Y'{if $dateformat_value == "l, F j, Y"} SELECTED{/if}>Monday, July 17, 2006</option>
<option value='D-j-M-Y'{if $dateformat_value == "D-j-M-Y"} SELECTED{/if}>Mon-17-Jul-2006</option>
<option value='D j M Y'{if $dateformat_value == "D j M Y"} SELECTED{/if}>Mon 17 Jul 2006</option>
<option value='D j F Y'{if $dateformat_value == "D j F Y"} SELECTED{/if}>Mon 17 July 2006</option>
<option value='l j F Y'{if $dateformat_value == "l j F Y"} SELECTED{/if}>Monday 17 July 2006</option>
<option value='Y-M-j'{if $dateformat_value == "Y-M-j"} SELECTED{/if}>2006-Jul-17</option>
<option value='j-M-Y'{if $dateformat_value == "j-M-Y"} SELECTED{/if}>17-Jul-2006</option>
</select>
<select name='setting_timeformat' class='text'>
<option value='g:i A'{if $timeformat_value == "g:i A"} SELECTED{/if}>9:30 PM</option>
<option value='h:i A'{if $timeformat_value == "h:i A"} SELECTED{/if}>09:30 PM</option>
<option value='g:i'{if $timeformat_value == "g:i"} SELECTED{/if}>9:30</option>
<option value='h:i'{if $timeformat_value == "h:i"} SELECTED{/if}>09:30</option>
<option value='H:i'{if $timeformat_value == "H:i"} SELECTED{/if}>21:30</option>
<option value='H\hi'{if $timeformat_value == "H\hi"} SELECTED{/if}>21h30</option>
</select>
</td>
</tr>
</table>

<br>

<input type='submit' class='button' value='{$admin_general7}'>
<input type='hidden' name='task' value='dosave'>
</form>


{include file='admin_footer.tpl'}