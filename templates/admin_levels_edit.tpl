{include file='admin_header.tpl'}


<h2>{$admin_levels_edit8} {$level_name}</h2>
{$admin_levels_edit9}


<table cellspacing='0' cellpadding='0' width='100%' style='margin-top: 20px;'>
<tr>
<td class='vert_tab0'>&nbsp;</td>
<td valign='top' class='pagecell' rowspan='{math equation='x+2' x=$level_menu|@count}'>

  <h2>{$admin_levels_edit1}</h2>
  {$admin_levels_edit2}

  <br><br>

  {if $result != 0}
    <div class='success'><img src='../images/success.gif' class='icon' border='0'> {$admin_levels_edit6}</div>
  {/if}

  {if $is_error != 0}
    <div class='error'><img src='../images/error.gif' border='0' class='icon'> {$error_message}</div>
  {/if}

  <form action='admin_levels_edit.php' method='POST'>
  {$admin_levels_edit3}<br>
  <input type='text' class='text' name='level_name' value='{$level_name}' size='40' maxlength='50'>
  <br><br>
  {$admin_levels_edit4}<br>
  <textarea name='level_desc' rows='8' cols='60' class='text'>{$level_desc}</textarea>
  <br><br>
  <input type='submit' class='button' value='{$admin_levels_edit5}'>
  <input type='hidden' name='level_id' value='{$level_id}'>
  <input type='hidden' name='task' value='editlevel'>
  </form>

</td>
</tr>

{section name=menu_loop loop=$level_menu}
  <tr><td width='100' nowrap='nowrap' class='vert_tab' style='{if $smarty.section.menu_loop.first != TRUE}border-top: none;{/if}{if $level_menu[menu_loop].page == $page} border-right: none;{/if}'><div style='width: 100px;'><a href='{$level_menu[menu_loop].link}?level_id={$level_id}'>{$level_menu[menu_loop].title}</a></div></td></tr>
{/section}

<tr>
<td class='vert_tab0'>
  <div style='height: 200px;'>&nbsp;</div>
</td>
</tr>
</table>


{include file='admin_footer.tpl'}