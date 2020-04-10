{include file='header.tpl'}

  <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1> Мои группы</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">

    <div class="clearFix tBar">
     <ul class="tabs" id="friendTabs" style="width:550px;float:left;">
	  <li class="activeLink"><a href="user_group_edit.php?group_id={$group->group_info.group_id}" style="width:9.5em">Параметры группы</a></li>
        <li><a href="user_group_edit_members.php?group_id={$group->group_info.group_id}" style="width:6em">Участники</a></li>
        <li><a href="user_group_edit_invite.php?group_id={$group->group_info.group_id}" style="width:7em">Приглашения</a></li>
        <li><a href="user_group_edit_files.php?group_id={$group->group_info.group_id}" style="width:3.5em">Фото</a></li>
        <li><a href="user_group_edit_comments.php?group_id={$group->group_info.group_id}" style="width:7em">Комментарии</a></li>
        {if $group->groupowner_level_info.level_group_style == 1}<li><a href="user_group_edit_style.php?group_id={$group->group_info.group_id}" style="width:7.5em">Стиль группы</a></li>{/if}
        {if $group->user_rank == 2}<li><a href="user_group_edit_delete.php?group_id={$group->group_info.group_id}" style="width:4.5em">Удалить</a></li>{/if}
       </ul>
    </div>
<table cellpadding='0' cellspacing='0' width='100%'><tr><td class='page'>

<div>
   <img src='./images/icons/group_edit48.gif' border='0' class='icon_big'>
   <div class='page_header'>{$user_group_edit17} <a href='group.php?group_id={$group->group_info.group_id}'>{$group->group_info.group_title|truncate:30:"...":true}</a></div>
   {$user_group_edit18}
</div>

<br>

{* IF GROUP WAS JUST CREATED, SHOW SUCCESS MESSAGE *}
{if $justadded == 1}
  <br>
  <table cellpadding='0' cellspacing='0'>
  <tr><td class='result'>
    <img src='./images/success.gif' border='0' class='icon'>{$user_group_edit19}
  </td></tr></table>
{/if}

{literal}
<script type='text/javascript'>
<!--
var subcats = new Array();
{/literal}
{section name=cat_loop loop=$cats}
subcats[{$cats[cat_loop].groupcat_id}] = new Array('0', '' {section name=subcat_loop loop=$cats[cat_loop].subcats}{if $smarty.section.subcat_loop.first == TRUE},{/if} '{$cats[cat_loop].subcats[subcat_loop].subgroupcat_id}', '{$cats[cat_loop].subcats[subcat_loop].subgroupcat_title}'{if $smarty.section.subcat_loop.last != true},{/if}{/section});
{/section}
{literal}
function populate() {
  var groupcat_id = document.getElementById('groupcats').options[document.getElementById('groupcats').selectedIndex].value;
  if(!groupcat_id) return;
  var list = subcats[groupcat_id];
  document.getElementById('subgroupcats').options.length = 0;
  var selected_op = 0;
  for(i=0;i<list.length;i+=2)
  {
    if({/literal}{$subgroupcat_id}{literal} == list[i]) {
      var selected = true;
      var selected_op = i/2;
    } else {
      var selected = false;
    }
    document.getElementById('subgroupcats').options[i/2] = new Option(list[i+1],list[i],selected);
  }
  document.getElementById('subgroupcats').options[selected_op].selected = true;
  if(document.getElementById('subgroupcats').options.length == 1) {
    document.getElementById('subgroupcats').style.visibility = 'hidden';
  } else {
    document.getElementById('subgroupcats').style.visibility = 'visible';
  }
}

//-->
</script>
{/literal}

<br>

{* SHOW RESULT MESSAGE *}
{if $result != 0}
  <table cellpadding='0' cellspacing='0'>
  <tr><td class='result'>
    <img src='./images/success.gif' border='0' class='icon'>{$user_group_edit9}
  </td></tr></table><br>
{/if}

{* SHOW ERROR MESSAGE *}
{if $is_error != 0}
  <table cellpadding='0' cellspacing='0'>
  <tr><td class='result'>
    <img src='./images/error.gif' class='icon' border='0'>{$error_message}
  </td></tr></table><br>
{/if}

<div class='header'>{$user_group_edit20}</div>

<br>

{* SHOW PHOTO ON LEFT AND UPLOAD FIELD ON RIGHT *}
<table cellpadding='0' cellspacing='0'>
<tr>
<td class='editprofile_photoleft'>
  <div class='center'>
  {$user_group_edit21}<br>
  <table cellpadding='0' cellspacing='0' width='202'>
  <tr><td class='editprofile_photo'><img src='{$group->group_photo("./images/nophoto.gif")}' border='0'></td></tr>
  </table>
  {if $group->group_photo() != ""}  <br>[ <a href='user_group_edit.php?group_id={$group->group_info.group_id}&task=remove'>{$user_group_edit22}</a> ]{/if}
  </div>
</td>
<td class='editprofile_photoright'>
  <form action='user_group_edit.php' method='POST' enctype='multipart/form-data'>
  {$user_group_edit23}<br><input type='file' class='text' name='photo' size='30'>
  <input type='submit' class='button' value='{$user_group_edit24}'>
  <input type='hidden' name='task' value='upload'>
  <input type='hidden' name='MAX_FILE_SIZE' value='5000000'>
  <input type='hidden' name='group_id' value='{$group->group_info.group_id}'>
  </form>
  <br>{$user_group_edit25} {$group->groupowner_level_info.level_group_photo_exts}
</td>
</tr>
</table>

<br>

<div class='header'>{$user_group_edit26}</div>

<form action='user_group_edit.php' method='POST'>
<table cellpadding='0' cellspacing='0'>
<td class='form1'>{$user_group_edit27}</td>
<td class='form2'><input type='text' class='text' name='group_title' value='{$group_title}' maxlength='100' size='30'></td>
</tr>
<tr>
<td class='form1'>{$user_group_edit28}</td>
<td class='form2'><textarea rows='6' cols='50' name='group_desc'>{$group_desc}</textarea></td>
</tr>
{if $cats|@count != 0}
  <tr>
  <td class='form1'>{$user_group_edit29}</td>
  <td class='form2'>
    <select name='groupcat_id' id='groupcats' onChange='populate();'><option value='0'></option>
    {section name=cat_loop loop=$cats}
      <option value='{$cats[cat_loop].groupcat_id}'{if $groupcat_id == $cats[cat_loop].groupcat_id} SELECTED{/if}>{$cats[cat_loop].groupcat_title}</option>
    {/section}
    </select>&nbsp;
    <select name='subgroupcat_id' id='subgroupcats' style='visibility: hidden;'><option value='0'></option></select>
    {literal}
    <script type='text/javascript'>
    <!--
    if({/literal}{$groupcat_id}{literal} != 0) {
      populate();
    }
    //-->
    </script>
    {/literal}
  </td>
  </tr>
{/if}
  {* LOOP THROUGH FIELDS IN TAB *}
  {section name=field_loop loop=$fields}
    <tr>
    <td class='form1'>{$fields[field_loop].field_title}{if $fields[field_loop].field_required != 0}*{/if}</td>
    <td class='form2'>


    {if $fields[field_loop].field_type == 1}
    {* TEXT FIELD *}
      <div><input type='text' class='text' name='field_{$fields[field_loop].field_id}' value='{$fields[field_loop].field_value}' style='{$fields[field_loop].field_style}' maxlength='{$fields[field_loop].field_maxlength}'></div>
      <div class='form_desc'>{$fields[field_loop].field_desc}</div>


    {elseif $fields[field_loop].field_type == 2}
    {* TEXTAREA *}
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





    {elseif $fields[field_loop].field_type == 5}
    {* DATE FIELD *}
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

    {* SHOW FIELD ERROR IF NECESSARY *}
    {if $fields[field_loop].field_error != ""}<div class='form_error'><img src='./images/icons/error16.gif' border='0' class='icon'> {$fields[field_loop].field_error}</div>{/if}
    </td>
    </tr>
  {/section}
</tr>
</table>

<br>

{* SHOW GROUP SETTINGS *}
<div class='header'>{$user_group_edit30}</div>

<table cellpadding='0' cellspacing='0'>

{* SHOW NEW MEMBER APPROVAL SETTING IF ALLOWED BY ADMIN *}
{if $group->groupowner_level_info.level_group_approval == 1}
  <tr>
  <td class='form1' width='120'>{$user_group_edit31}</td>
  <td class='form2'>
    <table cellpadding='0' cellspacing='0'>
    <tr><td><input type='radio' name='group_approval' id='group_approval0' value='0'{if $group_approval == 0} CHECKED{/if}></td><td><label for='group_approval0'>{$user_group_edit32}</label></td></tr>
    <tr><td><input type='radio' name='group_approval' id='group_approval1' value='1'{if $group_approval == 1} CHECKED{/if}></td><td><label for='group_approval1'>{$user_group_edit33}</label></td></tr>
    </table>
    <div class='form_desc'>
    {$user_group_edit34} <a href='user_group_edit_invite.php?group_id={$group->group_info.group_id}'>{$user_group_edit44}</a>.
    {if $group_approval == 1}{$user_group_edit35}{/if}
    </div>
  </td>
  </tr>
  <tr><td colspan='2'>&nbsp;</td></tr>
{/if}

{* SHOW SEARCH PRIVACY OPTIONS IF ALLOWED BY ADMIN *}
{if $group->groupowner_level_info.level_group_search == 1}
  <tr>
  <td class='form1' width='120'>{$user_group_edit36}</td>
  <td class='form2'>
    <table cellpadding='0' cellspacing='0'>
      <tr><td><input type='radio' name='group_search' id='group_search_1' value='1'{if $group_search == 1} CHECKED{/if}></td><td><label for='group_search_1'>{$user_group_edit37}</label></td></tr>
      <tr><td><input type='radio' name='group_search' id='group_search_0' value='0'{if $group_search == 0} CHECKED{/if}></td><td><label for='group_search_0'>{$user_group_edit38}</label></td></tr>
    </table>
  </td>
 </tr>
 <tr><td colspan='2'>&nbsp;</td></tr>
{/if}

{* SHOW ALLOW PRIVACY SETTINGS *}
{if $privacy_options|@count > 1}
  <tr>
  <td class='form1' width='120'>{$user_group_edit39}</td>
  <td class='form2'>
    <table cellpadding='0' cellspacing='0'>
    {section name=privacy_loop loop=$privacy_options}
      <tr><td><input type='radio' name='group_privacy' id='{$privacy_options[privacy_loop].privacy_id}' value='{$privacy_options[privacy_loop].privacy_value}'{if $group_privacy == $privacy_options[privacy_loop].privacy_value} CHECKED{/if}></td><td><label for='{$privacy_options[privacy_loop].privacy_id}'>{$privacy_options[privacy_loop].privacy_option}</label></td></tr>
    {/section}
    </table>
    <div class='form_desc'>{$user_group_edit40}</div>
  </td>
  </tr>
{/if}

{* SHOW ALLOW COMMENT SETTINGS *}
{if $comment_options|@count > 1}
  <tr>
  <td class='form1' width='120'>{$user_group_edit41}</td>
  <td class='form2'>
    <table cellpadding='0' cellspacing='0'>
      {section name=comment_loop loop=$comment_options}
        <tr><td><input type='radio' name='group_comments' id='{$comment_options[comment_loop].comment_id}' value='{$comment_options[comment_loop].comment_value}'{if $group_comments == $comment_options[comment_loop].comment_value} CHECKED{/if}></td><td><label for='{$comment_options[comment_loop].comment_id}'>{$comment_options[comment_loop].comment_option}</label></td></tr>
      {/section}
    </table>
    <div class='form_desc'>{$user_group_edit42}</div>
  </td>
  </tr>
{/if}

{* SHOW ALLOW DISCUSSION SETTINGS *}
{if $discussion_options|@count > 1}
  <tr>
  <td class='form1' width='120'>{$user_group_edit47}</td>
  <td class='form2'>
    <table cellpadding='0' cellspacing='0'>
      {section name=discussion_loop loop=$discussion_options}
        <tr><td><input type='radio' name='group_discussion' id='{$discussion_options[discussion_loop].discussion_id}' value='{$discussion_options[discussion_loop].discussion_value}'{if $group_discussion == $discussion_options[discussion_loop].discussion_value} CHECKED{/if}></td><td><label for='{$discussion_options[discussion_loop].discussion_id}'>{$discussion_options[discussion_loop].discussion_option}</label></td></tr>
      {/section}
    </table>
    <div class='form_desc'>{$user_group_edit48}</div>
  </td>
  </tr>
{/if}

</table>

<br>

{* SHOW SUBMIT BUTTONS *}
<table cellpadding='0' cellspacing='0'>
<tr>
<td>
  <input type='submit' class='button' value='{$user_group_edit43}'>&nbsp;
  <input type='hidden' name='task' value='dosave'>
  <input type='hidden' name='group_id' value='{$group->group_info.group_id}'>
  </form>
</td>
<td>
  <form action='user_group.php' method='GET'>
  <input type='submit' class='button' value='{$user_group_edit45}'>
  </form>
</td>
</tr>
</table>

</td></tr></table>

{include file='footer.tpl'}