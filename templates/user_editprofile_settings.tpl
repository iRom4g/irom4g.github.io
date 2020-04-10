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
   {if $user->level_info.level_photo_allow != 0}<li><a href="user_editprofile_photo.php" style="width:6.2em">{$user_editprofile_settings3}</a></li>{/if}
   {if $user->level_info.level_profile_status != 0}<li><a href="user_editprofile_status.php" style="width:6.2em">{$user_editprofile_settings2}</a></li>{/if}
    <li><a href="user_editprofile_comments.php" style="width:8.2em">{$user_editprofile_settings5}</a></li>
    <li class="activeLink"><a href="user_editprofile_settings.php" style="width:10.2em">{$user_editprofile_settings6}</a></li>
     </ul>
    </div>

    

    <div class="editorPanel clearFix">
     <img src='./images/icons/editprofile48.gif' border='0' class='icon_big'>
<div class='page_header'>{$user_editprofile_settings7}</div>
<div>{$user_editprofile_settings8}</div>

<br>

{* SHOW SUCCESS MESSAGE *}
{if $result != 0}
  <table cellpadding='0' cellspacing='0'><tr><td class='result'>
  <div class='success'><img src='./images/success.gif' border='0' class='icon'> {$user_editprofile_settings1}</div>
  </td></tr></table>
{/if}

<br>

<form action='user_editprofile_settings.php' method='POST'>

{if $user->level_info.level_profile_style == 1}
  <div><b>{$user_editprofile_settings10}</b></div>
  <div class='form_desc'>{$user_editprofile_settings11}</div>
  <textarea name='style_profile' rows='17' cols='50' style='width: 100%; font-family: courier, serif;'>{$style_profile}</textarea>
  <br><br>
{/if}


{if $privacy_profile_options|@count > 1}
  <div><b>{$user_editprofile_settings12}</b></div>
  <div class='form_desc'>{$user_editprofile_settings13}</div>
  <table cellpadding='0' cellspacing='0' class='editprofile_options'>
  {* LIST PRIVACY OPTIONS *}
  {section name=privacy_profile_loop loop=$privacy_profile_options}
    <tr><td><input type='radio' name='privacy_profile' id='{$privacy_profile_options[privacy_profile_loop].privacy_id}' value='{$privacy_profile_options[privacy_profile_loop].privacy_value}'{if $privacy_profile == $privacy_profile_options[privacy_profile_loop].privacy_value} CHECKED{/if}></td><td><label for='{$privacy_profile_options[privacy_profile_loop].privacy_id}'>{$privacy_profile_options[privacy_profile_loop].privacy_option}</label></td></tr>
  {/section}
  </table>
  <br>
{/if}

{if $comments_profile_options|@count > 1}
  <div><b>{$user_editprofile_settings14}</b></div>
  <div class='form_desc'>{$user_editprofile_settings15}</div>
  <table cellpadding='0' cellspacing='0' class='editprofile_options'>
  {* LIST PRIVACY OPTIONS *}
  {section name=comments_profile_loop loop=$comments_profile_options}
    <tr><td><input type='radio' name='comments_profile' id='{$comments_profile_options[comments_profile_loop].privacy_id}' value='{$comments_profile_options[comments_profile_loop].privacy_value}'{if $comments_profile == $comments_profile_options[comments_profile_loop].privacy_value} CHECKED{/if}></td><td><label for='{$comments_profile_options[comments_profile_loop].privacy_id}'>{$comments_profile_options[comments_profile_loop].privacy_option}</label></td></tr>
  {/section}
  </table>
  <br>
{/if}

{if $user->level_info.level_profile_search == 1}
  <div><b>{$user_editprofile_settings16}</b></div>
  <div class='form_desc'>{$user_editprofile_settings17}</div>
  <table cellpadding='0' cellspacing='0' class='editprofile_options'>
  <tr><td><input type='radio' name='search_profile' id='search_profile1' value='1'{if $user->user_info.user_privacy_search == 1} CHECKED{/if}></td><td><label for='search_profile1'>{$user_editprofile_settings18}</label></td></tr>
  <tr><td><input type='radio' name='search_profile' id='search_profile0' value='0'{if $user->user_info.user_privacy_search == 0} CHECKED{/if}></td><td><label for='search_profile0'>{$user_editprofile_settings19}</label></td></tr>
  </table>
  <br>
{/if}

{if $user->level_info.level_profile_comments !== "6"}
  <div><b>{$user_editprofile_settings20}</b></div>
  <div class='form_desc'>{$user_editprofile_settings21}</div>
  <table cellpadding='0' cellspacing='0' class='editprofile_options'>
  <tr><td><input type='checkbox' value='1' id='profilecomment' name='usersetting_notify_profilecomment'{if $user->usersetting_info.usersetting_notify_profilecomment == 1} CHECKED{/if}></td><td><label for='profilecomment'>{$user_editprofile_settings22}</label></td></tr>
  </table>
  <br>
{/if}


<input type='submit' class='button' value='{$user_editprofile_settings9}'>
<input type='hidden' name='task' value='dosave'>
</form>

{include file='footer.tpl'}