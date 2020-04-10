{include file='header.tpl'}

{* SHOW PAGE TITLE *}
{if $showfields == 1}
  <img src='./images/icons/search48.gif' border='0' class='icon_big'>
  <div class='page_header'>{$search_advanced1}</div>
  <div>{$search_advanced2}</div>
{elseif $showfields == 0}
  <img src='./images/icons/search48.gif' border='0' class='icon_big'>
  <div class='page_header'>{$search_advanced16} "{$linkedfield_title}: {$linkedfield_value}"</div>
  <div>{$search_advanced17} {$total_users} {$search_advanced18} "{$linkedfield_title}: {$linkedfield_value}"</div>
{/if}

<br><br>

{* SHOW FIELDS IF USER IS DOING A MANUAL SEARCH *}
{if $showfields == 1}
  <form action='search_advanced.php' method='POST'>
  <table cellpadding='0' cellspacing='0' width='100%'>
  <tr><td class='browse_header'>{$search_advanced3}</td></tr>
  <tr>
  <td class='browse_fields'>

    {* SHOW PROFILE TABS AND BROWSABLE FIELDS *}
    {* LOOP THROUGH TABS *}
    {section name=tab_loop loop=$tabs}

      {* LOOP THROUGH FIELDS IN TAB *}
      {section name=field_loop loop=$tabs[tab_loop].fields}

        {* START NEW ROW *}
        {cycle name="startfieldrow" values="<table cellpadding='0' cellspacing='0'><tr>,,,,"}
        <td class='browse_field'>

          {$tabs[tab_loop].fields[field_loop].field_title}<br>

          {if $tabs[tab_loop].fields[field_loop].field_type == 1 | $tabs[tab_loop].fields[field_loop].field_type == 2}
            {* TEXT FIELD *}
            <input type='text' class='text' name='field_{$tabs[tab_loop].fields[field_loop].field_id}' value='{$tabs[tab_loop].fields[field_loop].field_value}' maxlength='100'>

          {elseif $tabs[tab_loop].fields[field_loop].field_type == 3 | $tabs[tab_loop].fields[field_loop].field_type == 4}
          {* SELECT BOX *}
            <select name='field_{$tabs[tab_loop].fields[field_loop].field_id}'><option value='-1'></option>
            {* LOOP THROUGH FIELD OPTIONS *}
            {section name=option_loop loop=$tabs[tab_loop].fields[field_loop].field_options}
              <option value='{$tabs[tab_loop].fields[field_loop].field_options[option_loop].option_id}'{if $tabs[tab_loop].fields[field_loop].field_options[option_loop].option_id == $tabs[tab_loop].fields[field_loop].field_value} SELECTED{/if}>{$tabs[tab_loop].fields[field_loop].field_options[option_loop].option_label|truncate:30:"...":true}</option>
            {/section}
            </select>

          {elseif $tabs[tab_loop].fields[field_loop].field_type == 5}
          {* DATE FIELD *}

            <table cellpadding='0' cellspacing='0'>
            <tr>
            <td>
              <select name='field_{$tabs[tab_loop].fields[field_loop].field_id}_1'>
              {section name=date1 loop=$tabs[tab_loop].fields[field_loop].date_array1}
                <option value='{$tabs[tab_loop].fields[field_loop].date_array1[date1].value}'{$tabs[tab_loop].fields[field_loop].date_array1[date1].selected}>{$tabs[tab_loop].fields[field_loop].date_array1[date1].name}</option>
              {/section}
              </select>
            </td>
            <td>
              <select name='field_{$tabs[tab_loop].fields[field_loop].field_id}_2'>
              {section name=date2 loop=$tabs[tab_loop].fields[field_loop].date_array2}
                <option value='{$tabs[tab_loop].fields[field_loop].date_array2[date2].value}'{$tabs[tab_loop].fields[field_loop].date_array2[date2].selected}>{$tabs[tab_loop].fields[field_loop].date_array2[date2].name}</option>
              {/section}
              </select>
            </td>
            <td>
              <select name='field_{$tabs[tab_loop].fields[field_loop].field_id}_3'>
              {section name=date3 loop=$tabs[tab_loop].fields[field_loop].date_array3}
                <option value='{$tabs[tab_loop].fields[field_loop].date_array3[date3].value}'{$tabs[tab_loop].fields[field_loop].date_array3[date3].selected}>{$tabs[tab_loop].fields[field_loop].date_array3[date3].name}</option>
              {/section}
              </select>
            </td>
            </tr>
            </table>
        {/if}

        </td>

        {* END ROW AFTER 4 FIELDS *}
        {if $smarty.section.field_loop.last == true AND $smarty.section.tab_loop.last == true}
          </tr></table>
        {else}
          {cycle name="endfieldrow" values=",,,,</tr></table>"}
        {/if}

      {/section}
    {/section}

    {* SHOW SUBMIT BUTTON *}
    <div class='browse_submit'>
      <input type='submit' class='button' value='{$search_advanced4}'>&nbsp;&nbsp;
      {$search_advanced22} 
      <select name='sort' class='small'>
      <option value='user_dateupdated DESC'{if $sort == "user_dateupdated DESC"} SELECTED{/if}>{$search_advanced23}</option>
      <option value='user_dateupdated ASC'{if $sort == "user_dateupdated ASC"} SELECTED{/if}>{$search_advanced5}</option>
      <option value='user_lastlogindate DESC'{if $sort == "user_lastlogindate DESC"} SELECTED{/if}>{$search_advanced24}</option>
      <option value='user_lastlogindate ASC'{if $sort == "user_lastlogindate ASC"} SELECTED{/if}>{$search_advanced6}</option>
      <option value='user_signupdate DESC'{if $sort == "user_signupdate DESC"} SELECTED{/if}>{$search_advanced25}</option>
      <option value='user_signupdate ASC'{if $sort == "user_signupdate ASC"} SELECTED{/if}>{$search_advanced7}</option>
      </select>
      <input type='hidden' name='task' value='dosearch'>
    </div>

  </td>
  </tr>
  </table>
  </form>
{/if}


{* SHOW RESULTS *}
{if $task == "browse" OR $task == "dosearch" OR $task == "main"}

  {* SHOW MESSAGE IF NO RESULTS FOUND *}
  {if $total_users == 0}
    <br>
    <table cellpadding='0' cellspacing='0' align='center'>
    <tr><td class='result'><img src='./images/icons/bulb22.gif' border='0' class='icon'> {$search_advanced8}</td></tr>
    </table>


  {else}

    <br>

      {* DISPLAY PAGINATION MENU IF APPLICABLE *}
      {if $maxpage > 1}
        <br>
        <div class='center'>
        <b>
        {if $p != 1}<a href='search_advanced.php?{$url_string}task={$task}&sort={$sort}&p={math equation='p-1' p=$p}'>&#171; {$search_advanced10}</a>{else}<font class='disabled'>&#171; {$search_advanced10}</font>{/if}
        {if $p_start == $p_end}
          &nbsp;|&nbsp; {$search_advanced11} {$p_start} {$search_advanced13} {$total_users} &nbsp;|&nbsp; 
        {else}
          &nbsp;|&nbsp; {$search_advanced12} {$p_start}-{$p_end} {$search_advanced13} {$total_users} &nbsp;|&nbsp; 
        {/if}
        {if $p != $maxpage}<a href='search_advanced.php?{$url_string}task={$task}&sort={$sort}&p={math equation='p+1' p=$p}'>{$search_advanced14} &#187;</a>{else}<font class='disabled'>{$search_advanced14} &#187;</font>{/if}
        </b>
        </div>
        <br>
      {/if}

      {* DISPLAY BROWSE RESULTS IN THUMBNAIL FORM *}
      {section name=user_loop loop=$users}
        {* START NEW ROW *}
        {cycle name="startrow" values="<table cellpadding='0' cellspacing='0' align='center'><tr>,,,,"}
        {* OUTPUT USER THUMBNAIL *}
        <td class='browse_result'>
          <a href='{$url->url_create('profile',$users[user_loop]->user_info.user_username)}'>{$users[user_loop]->user_info.user_username|truncate:20:"...":true}<br>
          <img src='{$users[user_loop]->user_photo('./images/nophoto.gif')}' class='photo' width='{$misc->photo_size($users[user_loop]->user_photo('./images/nophoto.gif'),'90','90','w')}' border='0' alt="{$users[user_loop]->user_info.user_username}{$search_advanced15}"></a>
          {if $users[user_loop]->user_info.user_online == 1}<div style='margin-top: 3px;'><img src='./images/icons/online16.gif' border='0' class='icon2'>{$search_advanced9}</div>{/if}
        </td>
        {* END ROW AFTER 5 RESULTS *}
        {if $smarty.section.user_loop.last == true}
          </tr></table>
        {else}
          {cycle name="endrow" values=",,,,</tr></table>"}
        {/if}
      {/section}

      {* DISPLAY PAGINATION MENU IF APPLICABLE *}
      {if $maxpage > 1}
        <br><br>
        <div class='center'>
        <b>
        {if $p != 1}<a href='search_advanced.php?{$url_string}task={$task}&sort={$sort}&p={math equation='p-1' p=$p}'>&#171; {$search_advanced10}</a>{else}<font class='disabled'>&#171; {$search_advanced10}</font>{/if}
        {if $p_start == $p_end}
          &nbsp;|&nbsp; {$search_advanced11} {$p_start} {$search_advanced13} {$total_users} &nbsp;|&nbsp; 
        {else}
          &nbsp;|&nbsp; {$search_advanced12} {$p_start}-{$p_end} {$search_advanced13} {$total_users} &nbsp;|&nbsp; 
        {/if}
        {if $p != $maxpage}<a href='search_advanced.php?{$url_string}task={$task}&sort={$sort}&p={math equation='p+1' p=$p}'>{$search_advanced14} &#187;</a>{else}<font class='disabled'>{$search_advanced14} &#187;</font>{/if}
        </b>
        </div>
        <br>
      {/if}

  {/if}
{/if}

{include file='footer.tpl'}