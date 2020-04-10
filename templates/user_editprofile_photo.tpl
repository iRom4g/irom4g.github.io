{include file='header.tpl'}

  <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1>{$user_editprofile_photo11}</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">

    <div class="clearFix tBar">
     <ul class="tabs">
    {section name=tab_loop loop=$tabs}
    {if $tabs[tab_loop].tab_id == $tab_id}<li class="activeLink"><a href='user_editprofile.php?tab_id={$tabs[tab_loop].tab_id}'>{$tabs[tab_loop].tab_name}</a>
    {else}<li><a href='user_editprofile.php?tab_id={$tabs[tab_loop].tab_id}'>{$tabs[tab_loop].tab_name}</a>{/if}
    {/section}
   {if $user->level_info.level_photo_allow != 0}<li class="activeLink"><a href="user_editprofile_photo.php" style="width:6.2em">{$user_editprofile_photo7}</a></li>{/if}
   {if $user->level_info.level_profile_status != 0}<li><a href="user_editprofile_status.php" style="width:6.2em">{$user_editprofile_photo6}</a></li>{/if}
    <li><a href="user_editprofile_comments.php" style="width:8.2em">{$user_editprofile_photo9}</a></li>
    <li><a href="user_editprofile_settings.php" style="width:10.2em">{$user_editprofile_photo10}</a></li>
     </ul>
    </div>

    

    <div class="editorPanel clearFix">
    <img src='./images/icons/editprofile48.gif' border='0' class='icon_big'>
<div class='page_header'>{$user_editprofile11} {$pagename}</div>
<div>{$user_editprofile12}</div>

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