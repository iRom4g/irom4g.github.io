{include file='header.tpl'}

<table class='tabs' cellpadding='0' cellspacing='0'>
<tr>
<td class='tab0'>&nbsp;</td>
{section name=tab_loop loop=$tabs}
  <td class='tab2' NOWRAP><a href='user_editprofile.php?tab_id={$tabs[tab_loop].tab_id}'>{$tabs[tab_loop].tab_name}</a><td class='tab'>&nbsp;</td></td>
{/section}
{if $user->level_info.level_profile_status != 0}<td class='tab2' NOWRAP><a href='user_editprofile_status.php'>{$user_editprofile_photo6}</a></td><td class='tab'>&nbsp;</td>{/if}
{if $user->level_info.level_photo_allow != 0}<td class='tab1' NOWRAP><a href='user_editprofile_photo.php'>{$user_editprofile_photo7}</a></td><td class='tab'>&nbsp;</td>{/if}
<td class='tab2' NOWRAP><a href='user_editprofile_comments.php'>{$user_editprofile_photo9}</td><td class='tab'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='user_editprofile_settings.php'>{$user_editprofile_photo10}</a></td>
<td class='tab3'>&nbsp;</td>
</tr>
</table>

<img src='./images/icons/editprofile48.gif' border='0' class='icon_big'>
<div class='page_header'>{$user_editprofile_photo11}</div>
<div>{$user_editprofile_photo12}</div>

<br>

{* SHOW ERROR MESSAGE *}
{if $is_error != 0}
  <br>
  <div class='center'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td class='result'><div class='error'><img src='./images/error.gif' class='icon' border='0'> {$error_message}</div></td>
  </tr>
  </table>
  </div>
{/if}

<br>

{* SHOW PHOTO ON LEFT AND UPLOAD FIELD ON RIGHT *}
<table cellpadding='0' cellspacing='0'>
<tr>
<td class='editprofile_photoleft'>
  {$user_editprofile_photo16}<br>
  <table cellpadding='0' cellspacing='0' width='202'>
  <tr><td class='editprofile_photo'><img src='{$user->user_photo("./images/nophoto.gif")}' border='0'></td></tr>
  </table>
  {* SHOW REMOVE PHOTO LINK IF NECESSARY *}
  {if $user->user_photo() != ""}[ <a href='user_editprofile_photo.php?task=remove'>{$user_editprofile_photo13}</a> ]{/if}
</td>
<td class='editprofile_photoright'>
  <form action='user_editprofile_photo.php' method='POST' enctype='multipart/form-data'>
  {$user_editprofile_photo17}<br><input type='file' class='text' name='photo' size='30'>
  <input type='submit' class='button' value='{$user_editprofile_photo14}'>
  <input type='hidden' name='task' value='upload'>
  <input type='hidden' name='MAX_FILE_SIZE' value='5000000'>
  </form>
  <div>{$user_editprofile_photo15} {$user->level_info.level_photo_exts}</div>
</td>
</tr>
</table>

{include file='footer.tpl'}