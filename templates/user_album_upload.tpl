{include file='header.tpl'}

  <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1>Мои альбомы</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">

<table class='tabs' cellpadding='0' cellspacing='0'>
<tr>
<td class='tab0'>&nbsp;</td>
<td class='tab1' NOWRAP><a href='user_album.php'>{$user_album_upload3}</a></td>
<td class='tab'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='user_album_settings.php'>{$user_album_upload4}</a></td>
<td class='tab'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='user_album_friends.php'>{$user_album_upload5}</a></td>
<td class='tab3'>&nbsp;</td>
</tr>
</table>

<table cellpadding='0' cellspacing='0' width='100%'><tr><td class='page'>

<table cellpadding='0' cellspacing='0'>
<tr>
<td width='100%'>

  <img src='./images/icons/image48.gif' border='0' class='icon_big'>
  <div class='page_header'>{$user_album_upload6} <a href='{$url->url_create('album', $user->user_info.user_username, $album_id)}'>{$album_title}</a></div>
  <div>{$user_album_upload7}</div>

</td>
<td align='right' valign='top'>

  <table cellpadding='0' cellspacing='0' width='120'>
  <tr><td class='button' nowrap='nowrap'><a href='user_album_update.php?album_id={$album_id}'><img src='./images/icons/album_back16.gif' border='0' class='icon'>{$user_album_upload8}</a></td></tr>
  </table>

</td>
</tr>
</table>

<br>

<div>{$user_album_upload9} {$space_left} {$user_album_upload17} {$allowed_exts} {$user_album_upload18} {$max_filesize} {$user_album_upload19}</div>

{* SHOW MESSAGE IF NEW ALBUM *}
{if $new_album == 1}
  <br>
  <table cellpadding='0' cellspacing='0'>
  <tr><td class='result'>
    <div class='success'><img src='./images/success.gif' border='0' class='icon'> {$user_album_upload2}</div>
  </td>
  </tr>
  </table>
{/if}

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

<form action='user_album_upload.php' name='uploadform' method='post' onsubmit='doupload()' enctype='multipart/form-data'>

<div id='div1'>
  <table cellpadding='0' cellspacing='0' class='form'>
  <tr>
  <td class='form1' width='65'><img src='./images/icons/album16.gif' border='0' class='icon'>{$user_album_upload10}</td>
  <td class='form2'><input type='file' name='file1' size='60' class='text' onchange="showdiv('div2');showdiv('div_submit');"></td>
  </tr>
  </table>
</div>

<div id='div2' style='display: none;'>
  <table cellpadding='0' cellspacing='0' class='form'>
  <tr>
  <td class='form1' width='65'><img src='./images/icons/album16.gif' border='0' class='icon'>{$user_album_upload11}</td>
  <td class='form2'><input type='file' name='file2' size='60' class='text' onchange="showdiv('div3');"></td>
  </tr>
  </table>
</div>

<div id='div3' style='display: none;'>
  <table cellpadding='0' cellspacing='0' class='form'>
  <tr>
  <td class='form1' width='65'><img src='./images/icons/album16.gif' border='0' class='icon'>{$user_album_upload12}</td>
  <td class='form2'><input type='file' name='file3' size='60' class='text' onchange="showdiv('div4');"></td>
  </tr>
  </table>
</div>

<div id='div4' style='display: none;'>
  <table cellpadding='0' cellspacing='0' class='form'>
  <tr>
  <td class='form1' width='65'><img src='./images/icons/album16.gif' border='0' class='icon'>{$user_album_upload13}</td>
  <td class='form2'><input type='file' name='file4' size='60' class='text' onchange="showdiv('div5');"></td>
  </tr>
  </table>
</div>

<div id='div5' style='display: none;'>
  <table cellpadding='0' cellspacing='0' class='form'>
  <tr>
  <td class='form1' width='65'><img src='./images/icons/album16.gif' border='0' class='icon'>{$user_album_upload14}</td>
  <td class='form2'><input type='file' name='file5' size='60' class='text'></td>
  </tr>
  </table>
</div>

<div id='div_submit' style='display: none;'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td class='form1' width='65'>&nbsp;</td>
  <td class='form1'>
    <input type='submit' class='button' name='submit' value='{$user_album_upload15}'>&nbsp;
    <input type='hidden' name='task' value='doupload'>
    <input type='hidden' name='MAX_FILE_SIZE' value='50000000'>
    <input type='hidden' name='album_id' value='{$album_id}'>
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
document.uploadform.status.value = "{/literal}{$user_album_upload16}{literal}";
window.setTimeout("doMsg1()", 400);
}
function doMsg1() {
document.uploadform.status.value  = document.uploadform.status.value + '.';
if(document.uploadform.status.value == '{/literal}{$user_album_upload16}{literal}'+'....') { document.uploadform.status.value = '{/literal}{$user_album_upload16}{literal}'; }
window.setTimeout("doMsg1()", 400);
}
// -->
</script>
{/literal}

</td></tr></table>

{include file='footer.tpl'}