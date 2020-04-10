{include file='header.tpl'}

  <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1>Редактирование профиля</h1>
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
   {if $user->level_info.level_photo_allow != 0}<li><a href="user_editprofile_photo.php" style="width:6.2em">{$user_editprofile_status3}</a></li>{/if}
   {if $user->level_info.level_profile_status != 0}<li class="activeLink"><a href="user_editprofile_status.php" style="width:6.2em">{$user_editprofile_status2}</a></li>{/if}
    <li><a href="user_editprofile_comments.php" style="width:8.2em">{$user_editprofile_status5}</a></li>
    <li><a href="user_editprofile_settings.php" style="width:10.2em">{$user_editprofile_status6}</a></li>
     </ul>
    </div>

    

    <div class="editorPanel clearFix">
     <img src='./images/icons/editprofile48.gif' border='0' class='icon_big'>
<div class='page_header'>{$user_editprofile_status7}</div>
<div>{$user_editprofile_status8}</div>

{* SHOW SUCCESS MESSAGE *}
{if $result != 0}
  <br>
  <table cellpadding='0' cellspacing='0'><tr><td class='result'>
  <div class='success'><img src='./images/success.gif' border='0' class='icon'> {$user_editprofile_status1}</div>
  </td></tr></table>
{/if}

<br><br>



<div class='center'>

<center>
<div style='width: 500px; padding: 10px; background: #FFFFFF; border: 1px solid #CCCCCC;'>
  <form action='user_editprofile_status.php' method='POST'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td><img src='./images/icons/status16.gif' border='0' class='icon'>&nbsp;</td>
  <td><b>{$user->user_info.user_username} {$user_editprofile_status10}</b></td>
  <td>&nbsp;<input type='text' class='text' name='status_new' size='50' maxlength='100' value='{$user->user_info.user_status}'></td>
  <td>&nbsp;<input type='submit' class='button' value='{$user_editprofile_status9}'></td>
  </tr>
  </table>
  <input type='hidden' name='task' value='dosave'>
  <input type='hidden' name='return_url' value='{$return_url}'>
  </form>
</div>
</center>

<br>

</div>

{include file='footer.tpl'}