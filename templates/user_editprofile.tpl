{include file='header.tpl'}

<table class='tabs' cellpadding='0' cellspacing='0'>
<tr>
<td class='tab0'>&nbsp;</td>
{section name=tab_loop loop=$tabs}
  <td class='tab{if $tabs[tab_loop].tab_id == $tab_id}1{else}2{/if}' NOWRAP><a href='user_editprofile.php?tab_id={$tabs[tab_loop].tab_id}'>{$tabs[tab_loop].tab_name}</a></td>
  <td class='tab'>&nbsp;</td>
  {if $tabs[tab_loop].tab_id == $tab_id}{assign var="pagename" value=$tabs[tab_loop].tab_name}{/if}
{/section}
{if $user->level_info.level_profile_status != 0}<td class='tab2' NOWRAP><a href='user_editprofile_status.php'>{$user_editprofile6}</a></td><td class='tab'>&nbsp;</td>{/if}
{if $user->level_info.level_photo_allow != 0}<td class='tab2' NOWRAP><a href='user_editprofile_photo.php'>{$user_editprofile7}</a></td><td class='tab'>&nbsp;</td>{/if}
<td class='tab2' NOWRAP><a href='user_editprofile_comments.php'>{$user_editprofile9}</td><td class='tab'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='user_editprofile_settings.php'>{$user_editprofile10}</a></td>
<td class='tab3'>&nbsp;</td>
</tr>
</table>

<img src='./images/icons/editprofile48.gif' border='0' class='icon_big'>
<div class='page_header'>{$user_editprofile11} {$pagename}</div>
<div>{$user_editprofile12}</div>

<br><br>

{if $tab_num_fields != 0}

  {* SHOW RESULT MESSAGE *}
  {if $result != ""}
  <br>
  <table cellpadding='0' cellspacing='0'><tr><td class='result'>
  <div class='success'><img src='./images/success.gif' border='0' class='icon'> {$result}</div>
  </td></tr></table>
  <br>
  {/if}

  {* SHOW ERROR MESSAGE *}
  {if $error_message != ""}
  <br>
  <table cellpadding='0' cellspacing='0'><tr><td class='result'>
  <div class='error'><img src='./images/error.gif' border='0' class='icon'> {$error_message}</div>
  </td></tr></table>
  <br>
  {/if}

  <table cellpadding='0' cellspacing='0' class='form'>
  <form action='user_editprofile.php' method='POST' name='profile'>

  {* LOOP THROUGH FIELDS IN TAB *}
  {section name=field_loop loop=$fields}
    <tr>
    <td class='form1'>{$fields[field_loop].field_title}{if $fields[field_loop].field_required != 0}*{/if}</td>
    <td class='form2'>



    {* TEXT FIELD *}
    {if $fields[field_loop].field_type == 1}
      <div><input type='text' class='text' name='field_{$fields[field_loop].field_id}' value='{$fields[field_loop].field_value}' style='{$fields[field_loop].field_style}' maxlength='{$fields[field_loop].field_maxlength}'></div>
      <div class='form_desc'>{$fields[field_loop].field_desc}</div>



    {* TEXTAREA *}
    {elseif $fields[field_loop].field_type == 2}
      <div><textarea rows='6' cols='50' name='field_{$fields[field_loop].field_id}' style='{$fields[field_loop].field_style}'>{$fields[field_loop].field_value}</textarea></div>
      <div class='form_desc'>{$fields[field_loop].field_desc}</div>



    {* SELECT BOX *}
    {elseif $fields[field_loop].field_type == 3}
      <div><select name='field_{$fields[field_loop].field_id}' id='field_{$fields[field_loop].field_id}' onchange="ShowHideSelectDeps({$fields[field_loop].field_id})" style='{$fields[field_loop].field_style}'>
      <option value='-1'></option>
      {* LOOP THROUGH FIELD OPTIONS *}
      {section name=option_loop loop=$fields[field_loop].field_options}
        <option id='op' value='{$fields[field_loop].field_options[option_loop].option_id}'{if $fields[field_loop].field_options[option_loop].option_id == $fields[field_loop].field_value} SELECTED{/if}>{$fields[field_loop].field_options[option_loop].option_label}</option>
      {/section}
      </select>
      </div>

      {* LOOP THROUGH DEPENDENT FIELDS *}
      {section name=option_loop loop=$fields[field_loop].field_options}
        {if $fields[field_loop].field_options[option_loop].option_dependency == 1}
          <div id='field_{$fields[field_loop].field_id}_option{$fields[field_loop].field_options[option_loop].option_id}' style='margin: 5px 5px 10px 5px;{if $fields[field_loop].field_options[option_loop].option_id != $fields[field_loop].field_value} display: none;{/if}'>
          {$fields[field_loop].field_options[option_loop].dep_field_title}{if $fields[field_loop].field_options[option_loop].dep_field_required != 0}*{/if}
          <input type='text' class='text' name='field_{$fields[field_loop].field_options[option_loop].dep_field_id}' value='{$fields[field_loop].field_options[option_loop].dep_field_value}' style='{$fields[field_loop].field_options[option_loop].dep_field_style}' maxlength='{$fields[field_loop].field_options[option_loop].dep_field_maxlength}'>
          </div>
	{else}
          <div id='field_{$fields[field_loop].field_id}_option{$fields[field_loop].field_options[option_loop].option_id}' style='display: none;'></div>
        {/if}
      {/section}
      <div class='form_desc'>{$fields[field_loop].field_desc}</div>


    {* RADIO BUTTONS *}
    {elseif $fields[field_loop].field_type == 4}
    
      {* LOOP THROUGH FIELD OPTIONS *}
      {section name=option_loop loop=$fields[field_loop].field_options}

        <div>
        <input type='radio' class='radio' onclick="ShowHideRadioDeps({$fields[field_loop].field_id}, {$fields[field_loop].field_options[option_loop].option_id}, 'field_{$fields[field_loop].field_options[option_loop].dep_field_id}', {$fields[field_loop].field_options|@count})" style='{$fields[field_loop].field_style}' name='field_{$fields[field_loop].field_id}' id='label_{$fields[field_loop].field_id}_{$fields[field_loop].field_options[option_loop].option_id}' value='{$fields[field_loop].field_options[option_loop].option_id}'{if $fields[field_loop].field_options[option_loop].option_id == $fields[field_loop].field_value} CHECKED{/if}>
        <label for='label_{$fields[field_loop].field_id}_{$fields[field_loop].field_options[option_loop].option_id}'>{$fields[field_loop].field_options[option_loop].option_label}</label>

        {* DISPLAY DEPENDENT FIELDS *}
        {if $fields[field_loop].field_options[option_loop].option_dependency == 1}
          <div id='field_{$fields[field_loop].field_id}_radio{$fields[field_loop].field_options[option_loop].option_id}' style='margin: 0px 5px 10px 23px;{if $fields[field_loop].field_options[option_loop].option_id != $fields[field_loop].field_value} display: none;{/if}'>
          {$fields[field_loop].field_options[option_loop].dep_field_title}
          {if $fields[field_loop].field_options[option_loop].dep_field_required != 0}*{/if}
          <input type='text' class='text' name='field_{$fields[field_loop].field_options[option_loop].dep_field_id}' id='field_{$fields[field_loop].field_options[option_loop].dep_field_id}' value='{$fields[field_loop].field_options[option_loop].dep_field_value}' style='{$fields[field_loop].field_options[option_loop].dep_field_style}' maxlength='{$fields[field_loop].field_options[option_loop].dep_field_maxlength}'>
          </div>
	{else}
          <div id='field_{$fields[field_loop].field_id}_radio{$fields[field_loop].field_options[option_loop].option_id}' style='display: none;'></div>
        {/if}

        </div>
      {/section}
      <div class='form_desc'>{$fields[field_loop].field_desc}</div>


    {* DATE FIELD *}
    {elseif $fields[field_loop].field_type == 5}
      <div>
      <select name='field_{$fields[field_loop].field_id}_1' style='{$fields[field_loop].field_style}'>
      {section name=date1 loop=$fields[field_loop].date_array1}
        <option value='{$fields[field_loop].date_array1[date1].value}'{$fields[field_loop].date_array1[date1].selected}>{$fields[field_loop].date_array1[date1].name}</option>
      {/section}
      </select>

      <select name='field_{$fields[field_loop].field_id}_2' style='{$fields[field_loop].field_style}'>
      {section name=date2 loop=$fields[field_loop].date_array2}
        <option value='{$fields[field_loop].date_array2[date2].value}'{$fields[field_loop].date_array2[date2].selected}>{$fields[field_loop].date_array2[date2].name}</option>
      {/section}
      </select>

      <select name='field_{$fields[field_loop].field_id}_3' style='{$fields[field_loop].field_style}'>
      {section name=date3 loop=$fields[field_loop].date_array3}
        <option value='{$fields[field_loop].date_array3[date3].value}'{$fields[field_loop].date_array3[date3].selected}>{$fields[field_loop].date_array3[date3].name}</option>
      {/section}
      </select>
      </div>
      <div class='form_desc'>{$fields[field_loop].field_desc}</div>
    {/if}

    {if $fields[field_loop].field_id == $setting.setting_subnet_field1_id | $fields[field_loop].field_id == $setting.setting_subnet_field2_id}{$user_editprofile1} {$user->subnet_info.subnet_name}{/if}

    {* SHOW FIELD ERROR MESSAGE *}
    {if $fields[field_loop].field_error != ""}<div class='form_error'><img src='./images/icons/error16.gif' border='0' class='icon'> {$fields[field_loop].field_error}</div>{/if}
    </td>
    </tr>
  {/section}

  <tr>
  <td class='form1'>&nbsp;</td>
  <td class='form2'><input type='submit' class='button' value='{$user_editprofile13}'></td>
  <input type='hidden' name='task' value='dosave'>
  <input type='hidden' name='tab_id' value='{$tab_id}'>
  </tr>
  </form>
  </table>

{/if}

{include file='footer.tpl'}