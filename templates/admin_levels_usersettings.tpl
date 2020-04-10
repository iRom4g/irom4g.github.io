{include file='admin_header.tpl'}

<h2>{$admin_levels_usersettings38} {$level_name}</h2>
{$admin_levels_usersettings39}

<table cellspacing='0' cellpadding='0' width='100%' style='margin-top: 20px;'>
<tr>
<td class='vert_tab0'>&nbsp;</td>
<td valign='top' class='pagecell' rowspan='{math equation='x+2' x=$level_menu|@count}'>
  <h2>{$admin_levels_usersettings1}</h2>
  {$admin_levels_usersettings2}
  <br><br>

  {if $result != 0}
    <div class='success'><img src='../images/success.gif' class='icon' border='0'> {$admin_levels_usersettings7}</div>
  {/if}

  {if $error_message != ""}
    <div class='error'><img src='../images/error.gif' class='icon' border='0'> {$error_message}</div>
  {/if}

  <form action='admin_levels_usersettings.php' method='post' id='info' name='info'>
  <table cellpadding='0' cellspacing='0' width='100%'>
  <tr><td class='header'>{$admin_levels_usersettings31}</td></tr>
  <tr><td class='setting1'>
  {$admin_levels_usersettings32}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    <tr><td><input type='radio' name='level_profile_block' id='profile_block_1' value='1'{if $profile_block == 1} CHECKED{/if}>&nbsp;</td><td><label for='profile_block_1'>{$admin_levels_usersettings33}</label></td></tr>
    <tr><td><input type='radio' name='level_profile_block' id='profile_block_0' value='0'{if $profile_block == 0} CHECKED{/if}>&nbsp;</td><td><label for='profile_block_0'>{$admin_levels_usersettings34}</label></td></tr>
    </table>
  </td></tr></table>

  <br>

  <table cellpadding='0' cellspacing='0' width='100%'>
  <tr><td class='header'>{$admin_levels_usersettings3}</td></tr>
  <td class='setting1'>
  <b>{$admin_levels_usersettings4}</b><br>
  {$admin_levels_usersettings5}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
      <tr><td><input type='radio' name='profile_search' id='profile_search1' value='1' {if $profile_search == 1} CHECKED{/if}></td><td><label for='profile_search1'>{$admin_levels_usersettings25}</label>&nbsp;&nbsp;</td></tr>
      <tr><td><input type='radio' name='profile_search' id='profile_search0' value='0' {if $profile_search == 0} CHECKED{/if}></td><td><label for='profile_search0'>{$admin_levels_usersettings26}</label>&nbsp;&nbsp;</td></tr>
    </table>
  </td></tr>
  <tr><td class='setting1'>
  <b>{$admin_levels_usersettings6}</b><br>
  {$admin_levels_usersettings35} 
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    {section name=privacy_loop loop=$profile_privacy}
      <tr><td><input type='checkbox' name='{$profile_privacy[privacy_loop].privacy_name}' id='{$profile_privacy[privacy_loop].privacy_name}' value='{$profile_privacy[privacy_loop].privacy_value}'{if $profile_privacy[privacy_loop].privacy_selected == 1} CHECKED{/if}></td><td><label for='{$profile_privacy[privacy_loop].privacy_name}'>{$profile_privacy[privacy_loop].privacy_option}</label>&nbsp;&nbsp;</td></tr>
    {/section}
    </table>
  </td></tr>
  <tr><td class='setting1'>
  <b>{$admin_levels_usersettings36}</b><br>
  {$admin_levels_usersettings37}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    {section name=comment_loop loop=$profile_comments}
      <tr><td><input type='checkbox' name='{$profile_comments[comment_loop].comment_name}' id='{$profile_comments[comment_loop].comment_name}' value='{$profile_comments[comment_loop].comment_value}'{if $profile_comments[comment_loop].comment_selected == 1} CHECKED{/if}></td><td><label for='{$profile_comments[comment_loop].comment_name}'>{$profile_comments[comment_loop].comment_option}</label>&nbsp;&nbsp;</td></tr>
    {/section}
    </table>
  </td></tr>
  </table>
  
  <br>

  <table cellpadding='0' cellspacing='0' width='100%'>
  <tr><td class='header'>{$admin_levels_usersettings11}</td></tr>
  <td class='setting1'>
  {$admin_levels_usersettings12}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    <tr><td><input type='radio' name='photo_allow' id='photo_allow_1' value='1'{if $photo_allow == 1} CHECKED{/if}>&nbsp;</td><td><label for='photo_allow_1'>{$admin_levels_usersettings13}</label></td></tr>
    <tr><td><input type='radio' name='photo_allow' id='photo_allow_0' value='0'{if $photo_allow == 0} CHECKED{/if}>&nbsp;</td><td><label for='photo_allow_0'>{$admin_levels_usersettings14}</label></td></tr>
    </table>
  </td></tr>
  <tr>
  <td class='setting1'>
  {$admin_levels_usersettings15}
  </td>
  </tr>
  <tr>
  <td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td>{$admin_levels_usersettings16} &nbsp;</td>
    <td><input type='text' class='text' name='photo_width' value='{$photo_width}' maxlength='3' size='3'> &nbsp;</td>
    <td>{$admin_levels_usersettings17}</td>
    </tr>
    <tr>
    <td>{$admin_levels_usersettings18} &nbsp;</td>
    <td><input type='text' class='text' name='photo_height' value='{$photo_height}' maxlength='3' size='3'> &nbsp;</td>
    <td>{$admin_levels_usersettings17}</td>
    </tr>
    </table>
  </td>
  </tr>
  <tr>
  <td class='setting1'>
  {$admin_levels_usersettings19}
  </td>
  </tr>
  <tr>
  <td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td>{$admin_levels_usersettings20} &nbsp;</td>
    <td><input type='text' class='text' name='photo_exts' value='{$photo_exts}' size='40' maxlength='50'></td>
    </tr>
    </table>
  </td>
  </tr>
  </table>
  
  <br>

  <table cellpadding='0' cellspacing='0' width='100%'>
  <tr>
  <td class='header'>{$admin_levels_usersettings10}</td>
  </tr>
  <td class='setting1'>
  {$admin_levels_usersettings22}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    <tr><td><input type='radio' name='profile_style' id='profile_style_1' value='1'{if $profile_style == 1} CHECKED{/if}>&nbsp;</td><td><label for='profile_style_1'>{$admin_levels_usersettings23}</label></td></tr>
    <tr><td><input type='radio' name='profile_style' id='profile_style_0' value='0'{if $profile_style == 0} CHECKED{/if}>&nbsp;</td><td><label for='profile_style_0'>{$admin_levels_usersettings24}</label></td></tr>
    </table>
  </td></tr></table>
  
  <br>
  
  <table cellpadding='0' cellspacing='0' width='100%'>
  <tr>
  <td class='header'>{$admin_levels_usersettings27}</td>
  </tr>
  <td class='setting1'>
  {$admin_levels_usersettings28}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    <tr><td><input type='radio' name='profile_status' id='profile_status_1' value='1'{if $profile_status == 1} CHECKED{/if}>&nbsp;</td><td><label for='profile_status_1'>{$admin_levels_usersettings29}</label></td></tr>
    <tr><td><input type='radio' name='profile_status' id='profile_status_0' value='0'{if $profile_status == 0} CHECKED{/if}>&nbsp;</td><td><label for='profile_status_0'>{$admin_levels_usersettings30}</label></td></tr>
    </table>
  </td></tr></table>
  
  <br>

  <input type='submit' class='button' value='{$admin_levels_usersettings21}'>
  <input type='hidden' name='task' value='dosave'>
  <input type='hidden' name='level_id' value='{$level_id}'>
  </form>


</td>
</tr>

{section name=menu_loop loop=$level_menu}
  <tr><td width='100' nowrap='nowrap' class='vert_tab' style='{if $smarty.section.menu_loop.first != TRUE}border-top: none;{/if}{if $level_menu[menu_loop].page == $page} border-right: none;{/if}'><div style='width: 100px;'><a href='{$level_menu[menu_loop].link}?level_id={$level_id}'>{$level_menu[menu_loop].title}</a></div></td></tr>
{/section}

<tr>
<td class='vert_tab0'>
  <div style='height: 1400px;'>&nbsp;</div>
</td>
</tr>
</table>

{include file='admin_footer.tpl'}