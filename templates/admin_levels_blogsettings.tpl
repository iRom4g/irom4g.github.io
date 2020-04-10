{include file='admin_header.tpl'}

<h2>{$admin_levels_blogsettings29} {$level_name}</h2>
{$admin_levels_blogsettings30}

<table cellspacing='0' cellpadding='0' width='100%' style='margin-top: 20px;'>
<tr>
<td class='vert_tab0'>&nbsp;</td>
<td valign='top' class='pagecell' rowspan='{math equation='x+2' x=$level_menu|@count}'>

  <h2>{$admin_levels_blogsettings1}</h2>
  {$admin_levels_blogsettings2}

  <br><br>

  {if $result != 0}
  <div class='success'><img src='../images/success.gif' class='icon' border='0'> {$admin_levels_blogsettings7}</div>
  {/if}

  {if $is_error != 0}
  <div class='error'><img src='../images/error.gif' class='icon' border='0'> {$admin_levels_blogsettings8}</div>
  {/if}

  <form action='admin_levels_blogsettings.php' name='info' method='POST'>
  <table cellpadding='0' cellspacing='0' width='600'>
  <tr><td class='header'>{$admin_levels_blogsettings9}</td></tr>
  <tr><td class='setting1'>
  {$admin_levels_blogsettings10}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    <tr><td><input type='radio' name='level_blog_allow' id='blog_allow_1' value='1'{if $blog_allow == 1} CHECKED{/if}>&nbsp;</td><td><label for='blog_allow_1'>{$admin_levels_blogsettings11}</label></td></tr>
    <tr><td><input type='radio' name='level_blog_allow' id='blog_allow_0' value='0'{if $blog_allow == 0} CHECKED{/if}>&nbsp;</td><td><label for='blog_allow_0'>{$admin_levels_blogsettings12}</label></td></tr>
    </table>
  </td></tr></table>
  
  <br>
  
  <table cellpadding='0' cellspacing='0' width='600'>
  <tr>
  <td class='header'>{$admin_levels_blogsettings3}</td>
  </tr>
  <td class='setting1'>
  {$admin_levels_blogsettings4}
  </td>
  </tr>
  <tr>
  <td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    <tr><td><input type='text' class='text' size='2' name='level_blog_entries' maxlength='3' value='{$entries_value}'></td><td>&nbsp; {$admin_levels_blogsettings5}</td></tr>
    </table>
  </td>
  </tr>
  </table>

  <br>

  <table cellpadding='0' cellspacing='0' width='600'>
  <tr><td class='header'>{$admin_levels_blogsettings26}</td></tr>
  <tr><td class='setting1'>
  {$admin_levels_blogsettings20}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
      <tr><td><input type='radio' name='level_blog_search' id='blog_search_1' value='1'{if $blog_search == 1} CHECKED{/if}></td><td><label for='blog_search_1'>{$admin_levels_blogsettings21}</label>&nbsp;&nbsp;</td></tr>
      <tr><td><input type='radio' name='level_blog_search' id='blog_search_0' value='0'{if $blog_search == 0} CHECKED{/if}></td><td><label for='blog_search_0'>{$admin_levels_blogsettings22}</label>&nbsp;&nbsp;</td></tr>
    </table>
  </td></tr>
  <tr><td class='setting1'>
  {$admin_levels_blogsettings27}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    {section name=privacy_loop loop=$blog_privacy}
      <tr><td><input type='checkbox' name='{$blog_privacy[privacy_loop].privacy_name}' id='{$blog_privacy[privacy_loop].privacy_name}' value='{$blog_privacy[privacy_loop].privacy_value}'{if $blog_privacy[privacy_loop].privacy_selected == 1} CHECKED{/if}></td><td><label for='{$blog_privacy[privacy_loop].privacy_name}'>{$blog_privacy[privacy_loop].privacy_option}</label>&nbsp;&nbsp;</td></tr>
    {/section}
    </table>
  </td></tr>
  <tr><td class='setting1'>
  {$admin_levels_blogsettings28}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    {section name=comment_loop loop=$blog_comments}
      <tr><td><input type='checkbox' name='{$blog_comments[comment_loop].comment_name}' id='{$blog_comments[comment_loop].comment_name}' value='{$blog_comments[comment_loop].comment_value}'{if $blog_comments[comment_loop].comment_selected == 1} CHECKED{/if}></td><td><label for='{$blog_comments[comment_loop].comment_name}'>{$blog_comments[comment_loop].comment_option}</label>&nbsp;&nbsp;</td></tr>
    {/section}
    </table>
  </td></tr>
  </table>
  
  <br>
  
  <table cellpadding='0' cellspacing='0' width='600'>
  <tr>
  <td class='header'>{$admin_levels_blogsettings13}</td>
  </tr>
  <td class='setting1'>
  {$admin_levels_blogsettings14}
  </td>
  </tr>
  <tr>
  <td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    <tr><td><input type='radio' name='level_blog_style' id='blog_style_1' value='1'{if $blog_style == 1} CHECKED{/if}>&nbsp;</td><td><label for='blog_style_1'>{$admin_levels_blogsettings15}</label></td></tr>
    <tr><td><input type='radio' name='level_blog_style' id='blog_style_0' value='0'{if $blog_style == 0} CHECKED{/if}>&nbsp;</td><td><label for='blog_style_0'>{$admin_levels_blogsettings16}</label></td></tr>
    </table>
  </td>
  </tr>
  </table>
 
  <br>
  
  <input type='submit' class='button' value='{$admin_levels_blogsettings6}'>
  <input type='hidden' name='task' value='dosave'>
  <input type='hidden' name='level_id' value='{$level_id}'>
  </form>
  
</td>
</tr>

{section name=menu_loop loop=$level_menu}
  <tr><td width='100' nowrap='nowrap' class='vert_tab' style='{if $smarty.section.menu_loop.first != TRUE} border-top: none;{/if}{if $level_menu[menu_loop].page == $page} border-right: none;{/if}'><a href='{$level_menu[menu_loop].link}?level_id={$level_id}'>{$level_menu[menu_loop].title}</td></tr>
{/section}

<tr>
<td class='vert_tab0'>
  <div style='height: 1200px;'>&nbsp;</div>
</td>
</tr>
</table>


{include file='admin_footer.tpl'}