{include file='admin_header.tpl'}

<h2>{$admin_activity1}</h2>
{$admin_activity2}

<br><br>

{if $result != 0}
  <div class='success'><img src='../images/success.gif' class='icon' border='0'> {$admin_activity3}</div>
  <br>
{/if}

<form action='admin_activity.php' method='post'>
<table cellpadding='0' cellspacing='0' width='600'>
<tr>
<td class='header'>{$admin_activity4}</td>
</tr>
<td class='setting1'>
  {$admin_activity5}
</td></tr><tr><td class='setting2'>

  <table cellpadding='3' cellspacing='0' width='100%'>
  {section name=actiontype_loop loop=$actiontypes}
    <tr>
    <td valign='top' width='1' style='padding-top: 18px;'><input name='actiontype_enabled_{$actiontypes[actiontype_loop].actiontype_id}' type='checkbox' value='1' {if $actiontypes[actiontype_loop].actiontype_enabled == 1} checked='checked'{/if}></td>
    <td valign='top'><b>{$admin_activity6}</b><br><textarea name='actiontype_text_{$actiontypes[actiontype_loop].actiontype_id}' rows='3' style='width: 100%;' class='text'>{$actiontypes[actiontype_loop].actiontype_text}</textarea></td>
    <td valign='top' width='1'><b>{$admin_activity7}</b><br>{$actiontypes[actiontype_loop].actiontype_name}</td>
    </tr>
    <tr>
    <td>&nbsp;</td>
    <td colspan='2'{if $smarty.section.actiontype_loop.last != true} style='padding-bottom: 40px;'{/if}>
      <b>{$admin_activity37}</b><br><input name='actiontype_desc_{$actiontypes[actiontype_loop].actiontype_id}' type='text' size=60' maxlength='200' class='text' value='{$actiontypes[actiontype_loop].actiontype_desc}'>
    </td>
    </tr>
  {/section}
  <input type='hidden' name='actiontypes_total' value='{$actiontypes_total}'>
  </table>

</td></tr>
</table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr>
<td class='header'>{$admin_activity8}</td>
</tr>
<td class='setting1'>
  {$admin_activity9}
</td></tr><tr><td class='setting2'>
  <select class='text' name='actions_actionsonprofile'>
  <option{if $actions_actionsonprofile == "0"} selected='selected'{/if}>0</option>
  <option{if $actions_actionsonprofile == "1"} selected='selected'{/if}>1</option>
  <option{if $actions_actionsonprofile == "2"} selected='selected'{/if}>2</option>
  <option{if $actions_actionsonprofile == "3"} selected='selected'{/if}>3</option>
  <option{if $actions_actionsonprofile == "4"} selected='selected'{/if}>4</option>
  <option{if $actions_actionsonprofile == "5"} selected='selected'{/if}>5</option>
  <option{if $actions_actionsonprofile == "6"} selected='selected'{/if}>6</option>
  <option{if $actions_actionsonprofile == "7"} selected='selected'{/if}>7</option>
  <option{if $actions_actionsonprofile == "8"} selected='selected'{/if}>8</option>
  <option{if $actions_actionsonprofile == "9"} selected='selected'{/if}>9</option>
  <option{if $actions_actionsonprofile == "10"} selected='selected'{/if}>10</option>
  </select> <b>{$admin_activity10}</b>
</td></tr></table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr>
<td class='header'>{$admin_activity11}</td>
</tr>
<tr>
<td class='setting1'>
  {$admin_activity12}
</td></tr><tr><td class='setting2'>
  <select class='text' name='actions_actionsinlist'>
  <option{if $actions_actionsinlist == "0"} selected='selected'{/if}>0</option>
  <option{if $actions_actionsinlist == "1"} selected='selected'{/if}>1</option>
  <option{if $actions_actionsinlist == "2"} selected='selected'{/if}>2</option>
  <option{if $actions_actionsinlist == "3"} selected='selected'{/if}>3</option>
  <option{if $actions_actionsinlist == "4"} selected='selected'{/if}>4</option>
  <option{if $actions_actionsinlist == "5"} selected='selected'{/if}>5</option>
  <option{if $actions_actionsinlist == "6"} selected='selected'{/if}>6</option>
  <option{if $actions_actionsinlist == "7"} selected='selected'{/if}>7</option>
  <option{if $actions_actionsinlist == "8"} selected='selected'{/if}>8</option>
  <option{if $actions_actionsinlist == "9"} selected='selected'{/if}>9</option>
  <option{if $actions_actionsinlist == "10"} selected='selected'{/if}>10</option>
  <option{if $actions_actionsinlist == "15"} selected='selected'{/if}>15</option>
  <option{if $actions_actionsinlist == "20"} selected='selected'{/if}>20</option>
  <option{if $actions_actionsinlist == "25"} selected='selected'{/if}>25</option>
  <option{if $actions_actionsinlist == "30"} selected='selected'{/if}>30</option>
  <option{if $actions_actionsinlist == "35"} selected='selected'{/if}>35</option>
  <option{if $actions_actionsinlist == "40"} selected='selected'{/if}>40</option>
  <option{if $actions_actionsinlist == "45"} selected='selected'{/if}>45</option>
  <option{if $actions_actionsinlist == "50"} selected='selected'{/if}>50</option>
  </select> <b>{$admin_activity13}</b>
</td></tr>
<tr>
<td class='setting1'>
  {$admin_activity14}
</td></tr><tr><td class='setting2'>
  <select class='text' name='actions_showlength'>
  <option value='60'{if $actions_showlength == "60"} selected='selected'{/if}>1 {$admin_activity15}</option>
  <option value='300'{if $actions_showlength == "300"} selected='selected'{/if}>5 {$admin_activity16}</option>
  <option value='600'{if $actions_showlength == "600"} selected='selected'{/if}>10 {$admin_activity16}</option>
  <option value='1200'{if $actions_showlength == "1200"} selected='selected'{/if}>20 {$admin_activity16}</option>
  <option value='1800'{if $actions_showlength == "1800"} selected='selected'{/if}>30 {$admin_activity16}</option>
  <option value='3600'{if $actions_showlength == "3600"} selected='selected'{/if}>1 {$admin_activity17}</option>
  <option value='10800'{if $actions_showlength == "10800"} selected='selected'{/if}>3 {$admin_activity18}</option>
  <option value='21600'{if $actions_showlength == "21600"} selected='selected'{/if}>6 {$admin_activity18}</option>
  <option value='43200'{if $actions_showlength == "43200"} selected='selected'{/if}>12 {$admin_activity18}</option>
  <option value='86400'{if $actions_showlength == "86400"} selected='selected'{/if}>1 {$admin_activity19}</option>
  <option value='172800'{if $actions_showlength == "172800"} selected='selected'{/if}>2 {$admin_activity20}</option>
  <option value='259200'{if $actions_showlength == "259200"} selected='selected'{/if}>3 {$admin_activity20}</option>
  <option value='604800'{if $actions_showlength == "604800"} selected='selected'{/if}>1 {$admin_activity21}</option>
  <option value='1209600'{if $actions_showlength == "1209600"} selected='selected'{/if}>2 {$admin_activity22}</option>
  <option value='2629743'{if $actions_showlength == "2629743"} selected='selected'{/if}>1 {$admin_activity23}</option>
  </select>
</td></tr>
<tr>
<td class='setting1'>
  {$admin_activity24}
</td></tr><tr><td class='setting2'>
  <select class='text' name='actions_actionsperuser'>
  <option{if $actions_actionsperuser == "0"} selected='selected'{/if}>0</option>
  <option{if $actions_actionsperuser == "1"} selected='selected'{/if}>1</option>
  <option{if $actions_actionsperuser == "2"} selected='selected'{/if}>2</option>
  <option{if $actions_actionsperuser == "3"} selected='selected'{/if}>3</option>
  <option{if $actions_actionsperuser == "4"} selected='selected'{/if}>4</option>
  <option{if $actions_actionsperuser == "5"} selected='selected'{/if}>5</option>
  <option{if $actions_actionsperuser == "6"} selected='selected'{/if}>6</option>
  <option{if $actions_actionsperuser == "7"} selected='selected'{/if}>7</option>
  <option{if $actions_actionsperuser == "8"} selected='selected'{/if}>8</option>
  <option{if $actions_actionsperuser == "9"} selected='selected'{/if}>9</option>
  <option{if $actions_actionsperuser == "10"} selected='selected'{/if}>10</option>
  </select> <b>{$admin_activity25}</b>
</td></tr></table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr>
<td class='header'>{$admin_activity26}</td>
</tr>
<td class='setting1'>
  {$admin_activity27}
</td></tr><tr><td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr><td><input type='radio' name='actions_selfdelete' id='actions_selfdelete_1' value='1'{if $actions_selfdelete == 1} CHECKED{/if}>&nbsp;</td><td><label for='actions_selfdelete_1'>{$admin_activity28}</label></td></tr>
  <tr><td><input type='radio' name='actions_selfdelete' id='actions_selfdelete_0' value='0'{if $actions_selfdelete == 0} CHECKED{/if}>&nbsp;</td><td><label for='actions_selfdelete_0'>{$admin_activity29}</label></td></tr>
  </table>
</td></tr></table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr>
<td class='header'>{$admin_activity30}</td>
</tr>
<td class='setting1'>
  {$admin_activity31}
</td></tr><tr><td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  {section name=visibility_loop loop=$actions_visibility}
    {if $actions_visibility[visibility_loop].privacy_value != 0 AND $actions_visibility[visibility_loop].privacy_value != 3 AND $actions_visibility[visibility_loop].privacy_value != 5}
      <tr><td style='padding-bottom: 3px;'><input type='radio' name='actions_visibility' id='actions_visibility{$actions_visibility[visibility_loop].privacy_value}' value='{$actions_visibility[visibility_loop].privacy_value}'{if $actions_visibility[visibility_loop].privacy_selected == 1} checked='checked'{/if}></td><td><label for='actions_visibility{$actions_visibility[visibility_loop].privacy_value}'>{$actions_visibility[visibility_loop].privacy_option}</label>&nbsp;&nbsp;</td></tr>
    {/if}
  {/section}
  </table>
</td></tr></table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr><td class='header'>{$admin_activity32}</td></tr>
<td class='setting1'>
  {$admin_activity33}
</td></tr><tr><td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr><td><input type='radio' name='actions_privacy' id='actions_privacy_1' value='1'{if $actions_privacy == 1} CHECKED{/if}>&nbsp;</td><td><label for='actions_privacy_1'>{$admin_activity35}</label></td></tr>
  <tr><td><input type='radio' name='actions_privacy' id='actions_privacy_0' value='0'{if $actions_privacy == 0} CHECKED{/if}>&nbsp;</td><td><label for='actions_privacy_0'>{$admin_activity36}</label></td></tr>
  </table>
</td></tr>
</table>

<br>

<input type='hidden' name='task' value='dosave'>
<input type='submit' class='button' value='{$admin_activity34}'>
</form>

{include file='admin_footer.tpl'}