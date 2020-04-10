{include file='header.tpl'}

<table class='tabs' cellpadding='0' cellspacing='0'>
<tr>
<td class='tab0'>&nbsp;</td>
{section name=tab_loop loop=$tabs}
  <td class='tab2' NOWRAP><a href='user_editprofile.php?tab_id={$tabs[tab_loop].tab_id}'>{$tabs[tab_loop].tab_name}</a></td><td class='tab'>&nbsp;</td>
{/section}
{if $user->level_info.level_profile_status != 0}<td class='tab1' NOWRAP><a href='user_editprofile_status.php'>{$user_editprofile_status2}</a></td><td class='tab'>&nbsp;</td>{/if}
{if $user->level_info.level_photo_allow != 0}<td class='tab2' NOWRAP><a href='user_editprofile_photo.php'>{$user_editprofile_status3}</a></td><td class='tab'>&nbsp;</td>{/if}
<td class='tab2' NOWRAP><a href='user_editprofile_comments.php'>{$user_editprofile_status5}</td><td class='tab'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='user_editprofile_settings.php'>{$user_editprofile_status6}</a></td>
<td class='tab3'>&nbsp;</td>
</tr>
</table>

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