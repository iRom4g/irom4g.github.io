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
	  <li ><a href="user_event_edit.php?event_id={$event->event_info.event_id}" style="width:8.5em">Детали События</a></li>
        <li><a href="user_event_edit_members.php?event_id={$event->event_info.event_id}" style="width:7.5em">Приглашения</a></li>
        <li class="activeLink"><a href="user_event_edit_files.php?event_id={$event->event_info.event_id}" style="width:6.5em">Фотографии</a></li>
        <li><a href="user_event_edit_comments.php?event_id={$event->event_info.event_id}" style="width:8em">Коментарии</a></li>
        {if $event->eventowner_level_info.level_event_style == 1}<li><a href="user_event_edit_style.php?event_id={$event->event_info.event_id}" style="width:8em">Стили События</a></li>{/if}
        <li><a href="user_event_edit_delete.php?event_id={$event->event_info.event_id}" style="width:10em">Отменить Событие</a></li>
        <li><a href="user_event.php" style="width:4em">Назад</a></li>
      </ul>
    </div>

<table cellpadding='0' cellspacing='0' width='100%'><tr><td class='page'>



<table cellpadding='0' cellspacing='0'>
<tr>
<td width='100%'>

   <img src='./images/icons/event_files48.gif' border='0' class='icon_big'>
   <div class='page_header'>{$user_event_edit_files_upload9} <a href='event.php?event_id={$event->event_info.event_id}'>{$event->event_info.event_title|truncate:30:"...":true}</a></div>
   {$user_event_edit_files_upload10}

</td>
<td align='right' valign='top'>

  <table cellpadding='0' cellspacing='0' width='120'>
  <tr><td class='button' nowrap='nowrap'><img src='./images/icons/album_back16.gif' border='0' class='icon'>&nbsp; <a href='user_event_edit_files.php?event_id={$event->event_info.event_id}'>{$user_event_edit_files_upload11}</a></td></tr>
  </table>

</td>
</tr>
</table>

<br><br>

<div>
  {$user_event_edit_files_upload12} {$space_left} MB {$user_event_edit_files_upload13}<br>
  {$user_event_edit_files_upload14} {$allowed_exts}<br>
  {$user_event_edit_files_upload15} {$max_filesize} KB.
</div>

{* SHOW IMAGES UPLOADED MESSAGE *}
{if $file1_result != "" OR $file2_result != "" OR $file3_result != "" OR $file4_result != "" OR $file5_result != ""}
  <br>
  <table cellpadding='0' cellspacing='0'>
  <tr><td class='result'>
    <div class='success' style='text-align: left;'> 
      <div>{$file1_result}</div>
      <div>{$file2_result}</div>
      <div>{$file3_result}</div>
      <div>{$file4_result}</div>
      <div>{$file5_result}</div>
    </div>
  </td>
  </tr>
  </table>
{/if}

<br>

<form action='user_event_edit_files_upload.php' name='uploadform' method='post' onsubmit='doupload()' enctype='multipart/form-data'>

<div id='div1'>
  <table cellpadding='0' cellspacing='0' class='form'>
  <tr>
  <td class='form1' width='65'><img src='./images/icons/album_files22.gif' border='0' class='icon'>&nbsp; {$user_event_edit_files_upload16}</td>
  <td class='form2'><input type='file' name='file1' size='60' class='text' onchange="showdiv('div2');showdiv('div_submit');"></td>
  </tr>
  </table>
</div>

<div id='div2' style='display: none;'>
  <table cellpadding='0' cellspacing='0' class='form'>
  <tr>
  <td class='form1' width='65'><img src='./images/icons/album_files22.gif' border='0' class='icon'>&nbsp; {$user_event_edit_files_upload17}</td>
  <td class='form2'><input type='file' name='file2' size='60' class='text' onchange="showdiv('div3');"></td>
  </tr>
  </table>
</div>

<div id='div3' style='display: none;'>
  <table cellpadding='0' cellspacing='0' class='form'>
  <tr>
  <td class='form1' width='65'><img src='./images/icons/album_files22.gif' border='0' class='icon'>&nbsp; {$user_event_edit_files_upload18}</td>
  <td class='form2'><input type='file' name='file3' size='60' class='text' onchange="showdiv('div4');"></td>
  </tr>
  </table>
</div>

<div id='div4' style='display: none;'>
  <table cellpadding='0' cellspacing='0' class='form'>
  <tr>
  <td class='form1' width='65'><img src='./images/icons/album_files22.gif' border='0' class='icon'>&nbsp; {$user_event_edit_files_upload19}</td>
  <td class='form2'><input type='file' name='file4' size='60' class='text' onchange="showdiv('div5');"></td>
  </tr>
  </table>
</div>

<div id='div5' style='display: none;'>
  <table cellpadding='0' cellspacing='0' class='form'>
  <tr>
  <td class='form1' width='65'><img src='./images/icons/album_files22.gif' border='0' class='icon'>&nbsp; {$user_event_edit_files_upload20}</td>
  <td class='form2'><input type='file' name='file5' size='60' class='text'></td>
  </tr>
  </table>
</div>

<div id='div_submit' style='display: none;'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td class='form1' width='65'>&nbsp;</td>
  <td class='form1'>
    <input type='submit' class='button' name='submit' value='{$user_event_edit_files_upload21}'>&nbsp;
    <input type='hidden' name='task' value='doupload'>
    <input type='hidden' name='MAX_FILE_SIZE' value='50000000'>
    <input type='hidden' name='event_id' value='{$event->event_info.event_id}'>
  </td>
  <td class='form2'>
    &nbsp;<input type='text' class='album_uploadstatus' name='status' id='status' readonly='readonly'>
    </form>
  </td>
  </tr>
  </table>
</div>

{literal}
<script lang='javascript'>
<!--
function doupload() {
document.uploadform.submit.disabled = true;
document.uploadform.status.value = "{/literal}{$user_event_edit_files_upload22}{literal}";
window.setTimeout("doMsg1()", 400);
}
function doMsg1() {
document.uploadform.status.value  = document.uploadform.status.value + '.';
if(document.uploadform.status.value == '{/literal}{$user_event_edit_files_upload22}{literal}'+'....') { document.uploadform.status.value = '{/literal}{$user_event_edit_files_upload22}{literal}'; }
window.setTimeout("doMsg1()", 400);
}
// -->
</script>
{/literal}


</td></tr></table>

{include file='footer.tpl'}