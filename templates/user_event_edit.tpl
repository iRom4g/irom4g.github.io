{include file='header.tpl'}

  <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1> Мои встречи</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">

    <div class="clearFix tBar">
     <ul class="tabs" id="friendTabs" style="width:600px;float:left;">
	  <li class="activeLink"><a href="user_event_edit.php?event_id={$event->event_info.event_id}" style="width:8.5em">Детали События</a></li>
        <li><a href="user_event_edit_members.php?event_id={$event->event_info.event_id}" style="width:7.5em">Приглашения</a></li>
        <li><a href="user_event_edit_files.php?event_id={$event->event_info.event_id}" style="width:6.5em">Фотографии</a></li>
        <li><a href="user_event_edit_comments.php?event_id={$event->event_info.event_id}" style="width:8em">Коментарии</a></li>
        {if $event->eventowner_level_info.level_event_style == 1}<li><a href="user_event_edit_style.php?event_id={$event->event_info.event_id}" style="width:8em">Стили События</a></li>{/if}
        <li><a href="user_event_edit_delete.php?event_id={$event->event_info.event_id}" style="width:10em">Отменить Событие</a></li>
        <li><a href="user_event.php" style="width:4em">Назад</a></li>
      </ul>
    </div>


<table cellpadding='0' cellspacing='0' width='100%'><tr><td class='page'>

<div>
   <img src='./images/icons/event_edit48.gif' border='0' class='icon_big'>
   <div class='page_header'>{$user_event_edit17} <a href='event.php?event_id={$event->event_info.event_id}'>{$event->event_info.event_title|truncate:30:"...":true}</a></div>
   {$user_event_edit18}
</div>

<br><br>

{* IF EVENT WAS JUST CREATED, SHOW SUCCESS MESSAGE *}
{if $justadded == 1}
  <br>
  <table cellpadding='0' cellspacing='0'>
  <tr><td class='result'>
    <img src='./images/success.gif' border='0' class='icon'>{$user_event_edit19}
  </td></tr></table>
{/if}

{literal}
<script type='text/javascript'>
<!--
var subcats = new Array();
{/literal}
{section name=cat_loop loop=$cats}
subcats[{$cats[cat_loop].eventcat_id}] = new Array('0', '' {section name=subcat_loop loop=$cats[cat_loop].subcats}{if $smarty.section.subcat_loop.first == TRUE},{/if} '{$cats[cat_loop].subcats[subcat_loop].subeventcat_id}', '{$cats[cat_loop].subcats[subcat_loop].subeventcat_title}'{if $smarty.section.subcat_loop.last != true},{/if}{/section});
{/section}
{literal}
function populate() {
  var eventcat_id = document.getElementById('eventcats').options[document.getElementById('eventcats').selectedIndex].value;
  if(!eventcat_id) return;
  var list = subcats[eventcat_id];
  document.getElementById('subeventcats').options.length = 0;
  var selected_op = 0;
  for(i=0;i<list.length;i+=2)
  {
    if({/literal}{$subeventcat_id}{literal} == list[i]) {
      var selected = true;
      var selected_op = i/2;
    } else {
      var selected = false;
    }
    document.getElementById('subeventcats').options[i/2] = new Option(list[i+1],list[i],selected);
  }
  document.getElementById('subeventcats').options[selected_op].selected = true;
  if(document.getElementById('subeventcats').options.length == 1) {
    document.getElementById('subeventcats').style.visibility = 'hidden';
  } else {
    document.getElementById('subeventcats').style.visibility = 'visible';
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
    <img src='./images/success.gif' border='0' class='icon'>{$user_event_edit9}
  </td></tr></table><br>
{/if}

{* SHOW ERROR MESSAGE *}
{if $is_error != 0}
  <table cellpadding='0' cellspacing='0'>
  <tr><td class='result'>
    <img src='./images/error.gif' class='icon' border='0'>{$error_message}
  </td></tr></table><br>
{/if}

<table cellpadding='0' cellspacing='0' width='100%'>
<tr>
<td class='event_header'>{$user_event_edit20}</td>
</tr>
<tr>
<td class='event_box'>

  {* SHOW PHOTO ON LEFT AND UPLOAD FIELD ON RIGHT *}
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td class='editprofile_photoleft'>
    {$user_event_edit21}<br>
    <table cellpadding='0' cellspacing='0' width='202'>
    <tr><td class='editprofile_photo'><img src='{$event->event_photo("./images/nophoto.gif")}' border='0'></td></tr>
    </table>
    {if $event->event_photo() != ""}  <br>[ <a href='user_event_edit.php?event_id={$event->event_info.event_id}&task=remove'>{$user_event_edit22}</a> ]{/if}
  </td>
  <td class='editprofile_photoright'>
    <form action='user_event_edit.php' method='POST' enctype='multipart/form-data'>
    {$user_event_edit23}<br><input type='file' class='text' name='photo' size='30'>
    <input type='submit' class='button' value='{$user_event_edit24}'>
    <input type='hidden' name='task' value='upload'>
    <input type='hidden' name='MAX_FILE_SIZE' value='5000000'>
    <input type='hidden' name='event_id' value='{$event->event_info.event_id}'>
    </form>
    <br>{$user_event_edit25} {$event->eventowner_level_info.level_event_photo_exts}
  </td>
  </tr>
  </table>
</td>
</tr>
</table>

<br>

<table cellpadding='0' cellspacing='0' width='100%'>
<tr>
<td class='event_header'>{$user_event_edit26}</td>
</tr>
<tr>
<td class='event_box'>

<form action='user_event_edit.php' method='post'>
<table cellpadding='0' cellspacing='0'>
<tr>
<td class='form1'>{$user_event_edit27}</td>
<td class='form2'><input type='text' class='text' name='event_title' value='{$event_title}' maxlength='100' size='30'></td>
</tr>
<tr>
<td class='form1'>{$user_event_edit28}</td>
<td class='form2'><textarea rows='6' cols='50' name='event_desc'>{$event_desc}</textarea></td>
</tr>
{if $cats|@count != 0}
  <tr>
  <td class='form1'>{$user_event_edit29}</td>
  <td class='form2'>
    <select name='eventcat_id' id='eventcats' onChange='populate();'><option value='0'></option>
    {section name=cat_loop loop=$cats}
      <option value='{$cats[cat_loop].eventcat_id}'{if $eventcat_id == $cats[cat_loop].eventcat_id} SELECTED{/if}>{$cats[cat_loop].eventcat_title}</option>
    {/section}
    </select>&nbsp;
    <select name='subeventcat_id' id='subeventcats' style='visibility: hidden;'><option value='0'></option></select>
    {literal}
    <script type='text/javascript'>
    <!--
    if({/literal}{$eventcat_id}{literal} != 0) {
      populate();
    }
    //-->
    </script>
    {/literal}
  </td>
  </tr>
{/if}
<tr>
<td class='form1'>{$user_event_edit47}</td>
<td class='form2'>
      <div>
      <select name='event_date_start_month'>
      {section name=month start=1 loop=13 step=1}
        <option value='{$smarty.section.month.index}'{if $smarty.section.month.index == $event_date_start|date_format:"%m"} SELECTED{/if}>{$datetime->cdate("M", $datetime->MakeTime(0, 0, 0, $smarty.section.month.index, 1, 1990))}</option>
      {/section}
      </select>

      <select name='event_date_start_day'>
      {section name=day start=1 loop=32 step=1}
        <option value='{$smarty.section.day.index}'{if $smarty.section.day.index == $event_date_start|date_format:"%d"} SELECTED{/if}>{$smarty.section.day.index}</option>
      {/section}
      </select>

      {capture name=final_year}{math equation="x+11" x=$smarty.now|date_format:"%Y"}{/capture}
      <select name='event_date_start_year'>
      {section name=year start=$smarty.now|date_format:"%Y" loop=$smarty.capture.final_year step=1}
        <option value='{$smarty.section.year.index}'{if $smarty.section.year.index == $event_date_start|date_format:"%Y"} SELECTED{/if}>{$smarty.section.year.index}</option>
      {/section}
      </select>

      {$user_event_edit12}

      <select name='event_date_start_hour'>
      {section name=hour start=1 loop=13 step=1}
        <option value='{$smarty.section.hour.index}'{if $smarty.section.hour.index|str_pad:2:"0":STR_PAD_LEFT == $event_date_start|date_format:"%I"} SELECTED{/if}>{$smarty.section.hour.index}</option>
      {/section}
      </select>

      <select name='event_date_start_minute'>
      {section name=minute start=0 loop=60 step=1}
        <option value='{$smarty.section.minute.index}'{if $smarty.section.minute.index|str_pad:2:"0":STR_PAD_LEFT == $event_date_start|date_format:"%M"} SELECTED{/if}>{$smarty.section.minute.index|str_pad:2:"0":STR_PAD_LEFT}</option>
      {/section}
      </select>

      <select name='event_date_start_ampm'>
        <option value='AM'{if $event_date_start|date_format:"%p" == "AM"} SELECTED{/if}>AM</option>
        <option value='PM'{if $event_date_start|date_format:"%p" == "PM"} SELECTED{/if}>PM</option>
      </select>
      </div>
</td>
</tr>
<tr>
<td class='form1'>{$user_event_edit48}</td>
<td class='form2'>
      <div>
      <select name='event_date_end_month'>
      {section name=month start=1 loop=13 step=1}
        <option value='{$smarty.section.month.index}'{if $smarty.section.month.index == $event_date_end|date_format:"%m"} SELECTED{/if}>{$datetime->cdate("M", $datetime->MakeTime(0, 0, 0, $smarty.section.month.index, 1, 1990))}</option>
      {/section}
      </select>

      <select name='event_date_end_day'>
      {section name=day start=1 loop=32 step=1}
        <option value='{$smarty.section.day.index}'{if $smarty.section.day.index == $event_date_end|date_format:"%d"} SELECTED{/if}>{$smarty.section.day.index}</option>
      {/section}
      </select>

      {capture name=final_year}{math equation="x+11" x=$smarty.now|date_format:"%Y"}{/capture}
      <select name='event_date_end_year'>
      {section name=year start=$smarty.now|date_format:"%Y" loop=$smarty.capture.final_year step=1}
        <option value='{$smarty.section.year.index}'{if $smarty.section.year.index == $event_date_end|date_format:"%Y"} SELECTED{/if}>{$smarty.section.year.index}</option>
      {/section}
      </select>

      {$user_event_edit12}

      <select name='event_date_end_hour'>
      {section name=hour start=1 loop=13 step=1}
        <option value='{$smarty.section.hour.index}'{if $smarty.section.hour.index|str_pad:2:"0":STR_PAD_LEFT == $event_date_end|date_format:"%I"} SELECTED{/if}>{$smarty.section.hour.index}</option>
      {/section}
      </select>

      <select name='event_date_end_minute'>
      {section name=minute start=0 loop=60 step=1}
        <option value='{$smarty.section.minute.index}'{if $smarty.section.minute.index|str_pad:2:"0":STR_PAD_LEFT == $event_date_end|date_format:"%M"} SELECTED{/if}>{$smarty.section.minute.index|str_pad:2:"0":STR_PAD_LEFT}</option>
      {/section}
      </select>

      <select name='event_date_end_ampm'>
        <option value='AM'{if $event_date_end|date_format:"%p" == "AM"} SELECTED{/if}>AM</option>
        <option value='PM'{if $event_date_end|date_format:"%p" == "PM"} SELECTED{/if}>PM</option>
      </select>
      </div>
</td>
</tr>
<tr>
<td class='form1'>{$user_event_edit51}</td>
<td class='form2'><input type='text' class='text' name='event_host' value='{$event_host}' maxlength='250' size='30'></td>
</tr>
<tr>
<td class='form1'>{$user_event_edit52}</td>
<td class='form2'><textarea rows='6' cols='50' name='event_location'>{$event_location}</textarea></td>
</tr>
</table>

</td>
</tr>
</table>

<br>

{* SHOW EVENT SETTINGS *}
<table cellpadding='0' cellspacing='0' width='100%'>
<tr>
<td class='event_header'>{$user_event_edit30}</td>
</tr>
<tr>
<td class='event_box'>

<table cellpadding='0' cellspacing='0'>

{* SHOW NEW MEMBER APPROVAL SETTING IF ALLOWED BY ADMIN *}
{if $user->level_info.level_event_inviteonly == 1}
  <tr>
  <td class='form1' width='120'>{$user_event_edit31}</td>
  <td class='form2'>
    <table cellpadding='0' cellspacing='0'>
    <tr><td><input type='radio' name='event_inviteonly' id='event_inviteonly0' value='0'{if $event_inviteonly == 0} CHECKED{/if}></td><td><label for='event_inviteonly0'>{$user_event_edit32}</label></td></tr>
    <tr><td><input type='radio' name='event_inviteonly' id='event_inviteonly1' value='1'{if $event_inviteonly == 1} CHECKED{/if}></td><td><label for='event_inviteonly1'>{$user_event_edit33}</label></td></tr>
    </table>
    <div class='form_desc'>
    {$user_event_edit34} <a href='user_event_edit_members.php?event_id={$event->event_info.event_id}'>{$user_event_edit44}</a>.
    {if $event_inviteonly == 1}{$user_event_edit35}{/if}
    </div>
  </td>
  </tr>
  <tr><td colspan='2'>&nbsp;</td></tr>
{/if}

{* SHOW SEARCH PRIVACY OPTIONS IF ALLOWED BY ADMIN *}
{if $user->level_info.level_event_search == 1}
  <tr>
  <td class='form1' width='120'>{$user_event_edit36}</td>
  <td class='form2'>
    <table cellpadding='0' cellspacing='0'>
      <tr><td><input type='radio' name='event_search' id='event_search_1' value='1'{if $event_search == 1} CHECKED{/if}></td><td><label for='event_search_1'>{$user_event_edit37}</label></td></tr>
      <tr><td><input type='radio' name='event_search' id='event_search_0' value='0'{if $event_search == 0} CHECKED{/if}></td><td><label for='event_search_0'>{$user_event_edit38}</label></td></tr>
    </table>
  </td>
 </tr>
 <tr><td colspan='2'>&nbsp;</td></tr>
{/if}

{* SHOW ALLOW PRIVACY SETTINGS *}
{if $privacy_options|@count > 1}
  <tr>
  <td class='form1' width='120'>{$user_event_edit39}</td>
  <td class='form2'>
    <table cellpadding='0' cellspacing='0'>
    {section name=privacy_loop loop=$privacy_options}
      <tr><td><input type='radio' name='event_privacy' id='{$privacy_options[privacy_loop].privacy_id}' value='{$privacy_options[privacy_loop].privacy_value}'{if $event_privacy == $privacy_options[privacy_loop].privacy_value} CHECKED{/if}></td><td><label for='{$privacy_options[privacy_loop].privacy_id}'>{$privacy_options[privacy_loop].privacy_option}</label></td></tr>
    {/section}
    </table>
    <div class='form_desc'>{$user_event_edit40}</div>
  </td>
  </tr>
{/if}

{* SHOW ALLOW COMMENT SETTINGS *}
{if $comment_options|@count > 1}
  <tr>
  <td class='form1' width='120'>{$user_event_edit41}</td>
  <td class='form2'>
    <table cellpadding='0' cellspacing='0'>
      {section name=comment_loop loop=$comment_options}
        <tr><td><input type='radio' name='event_comments' id='{$comment_options[comment_loop].comment_id}' value='{$comment_options[comment_loop].comment_value}'{if $event_comments == $comment_options[comment_loop].comment_value} CHECKED{/if}></td><td><label for='{$comment_options[comment_loop].comment_id}'>{$comment_options[comment_loop].comment_option}</label></td></tr>
      {/section}
    </table>
    <div class='form_desc'>{$user_event_edit42}</div>
  </td>
  </tr>
{/if}
</table>

</td>
</tr>
</table>

<br>

{* SHOW SUBMIT BUTTONS *}
<table cellpadding='0' cellspacing='0'>
<tr>
<td>
  <input type='submit' class='button' value='{$user_event_edit43}'>&nbsp;
  <input type='hidden' name='task' value='dosave'>
  <input type='hidden' name='event_id' value='{$event->event_info.event_id}'>
  </form>
</td>
<td>
  <form action='user_event.php' method='GET'>
  <input type='submit' class='button' value='{$user_event_edit45}'>
  </form>
</td>
</tr>
</table>

<br><br>

{include file='footer.tpl'}