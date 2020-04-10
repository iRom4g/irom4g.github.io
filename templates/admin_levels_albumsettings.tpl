{include file='admin_header.tpl'}

<h2>{$admin_levels_albumsettings35} {$level_name}</h2>
{$admin_levels_albumsettings36}

<table cellspacing='0' cellpadding='0' width='100%' style='margin-top: 20px;'>
<tr>
<td class='vert_tab0'>&nbsp;</td>
<td valign='top' class='pagecell' rowspan='{math equation='x+2' x=$level_menu|@count}'>

  <h2>{$admin_levels_albumsettings1}</h2>
  {$admin_levels_albumsettings2}

  <br><br>

  {* SHOW SUCCESS MESSAGE *}
  {if $result != 0}
    <div class='success'><img src='../images/success.gif' class='icon' border='0'> {$admin_levels_albumsettings15}</div>
  {/if}

  {* SHOW ERROR MESSAGE *}
  {if $is_error != 0}
    <div class='error'><img src='../images/error.gif' class='icon' border='0'> {$error_message}</div>
  {/if}

  <table cellpadding='0' cellspacing='0' width='600'>
  <form action='admin_levels_albumsettings.php' method='POST'>
  <tr><td class='header'>{$admin_levels_albumsettings3}</td></tr>
  <tr><td class='setting1'>
  {$admin_levels_albumsettings4}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    <tr><td><input type='radio' name='level_album_allow' id='album_allow_1' value='1'{if $album_allow == 1} CHECKED{/if}>&nbsp;</td><td><label for='album_allow_1'>{$admin_levels_albumsettings5}</label></td></tr>
    <tr><td><input type='radio' name='level_album_allow' id='album_allow_0' value='0'{if $album_allow == 0} CHECKED{/if}>&nbsp;</td><td><label for='album_allow_0'>{$admin_levels_albumsettings6}</label></td></tr>
    </table>
  </td></tr></table>

  <br>

  <table cellpadding='0' cellspacing='0' width='600'>
  <tr><td class='header'>{$admin_levels_albumsettings38}</td></tr>
  <tr><td class='setting1'>
  {$admin_levels_albumsettings32}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
      <tr><td><input type='radio' name='level_album_search' id='album_search_1' value='1'{if $album_search == 1} CHECKED{/if}></td><td><label for='album_search_1'>{$admin_levels_albumsettings33}</label>&nbsp;&nbsp;</td></tr>
      <tr><td><input type='radio' name='level_album_search' id='album_search_0' value='0'{if $album_search == 0} CHECKED{/if}></td><td><label for='album_search_0'>{$admin_levels_albumsettings34}</label>&nbsp;&nbsp;</td></tr>
    </table>
  </td></tr>
  <tr><td class='setting1'>
  {$admin_levels_albumsettings39}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    {section name=privacy_loop loop=$album_privacy}
      <tr><td><input type='checkbox' name='{$album_privacy[privacy_loop].privacy_name}' id='{$album_privacy[privacy_loop].privacy_name}' value='{$album_privacy[privacy_loop].privacy_value}'{if $album_privacy[privacy_loop].privacy_selected == 1} CHECKED{/if}></td><td><label for='{$album_privacy[privacy_loop].privacy_name}'>{$album_privacy[privacy_loop].privacy_option}</label>&nbsp;&nbsp;</td></tr>
    {/section}
    </table>
  </td></tr>
  <tr><td class='setting1'>
  {$admin_levels_albumsettings40}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    {section name=comment_loop loop=$album_comments}
      <tr><td><input type='checkbox' name='{$album_comments[comment_loop].comment_name}' id='{$album_comments[comment_loop].comment_name}' value='{$album_comments[comment_loop].comment_value}'{if $album_comments[comment_loop].comment_selected == 1} CHECKED{/if}></td><td><label for='{$album_comments[comment_loop].comment_name}'>{$album_comments[comment_loop].comment_option}</label>&nbsp;&nbsp;</td></tr>
    {/section}
    </table>
  </td></tr>
  </table>
  
  <br>

  <table cellpadding='0' cellspacing='0' width='600'>
  <tr><td class='header'>{$admin_levels_albumsettings28}</td></tr>
  <tr><td class='setting1'>
  {$admin_levels_albumsettings29}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    <tr><td><input type='text' name='level_album_maxnum' value='{$album_maxnum}' maxlength='3' size='5'>&nbsp;{$admin_levels_albumsettings31}</tr>
    </table>
  </td></tr></table>

  <br>

  <table cellpadding='0' cellspacing='0' width='600'>
  <tr><td class='header'>{$admin_levels_albumsettings7}</td></tr>
  <tr><td class='setting1'>
  {$admin_levels_albumsettings8}
  </td></tr><tr><td class='setting2'>
  <textarea name='level_album_exts' rows='2' cols='40' class='text' style='width: 100%;'>{$album_exts_value}</textarea>
  </td></tr></table>

  <br>

  <table cellpadding='0' cellspacing='0' width='600'>
  <tr><td class='header'>{$admin_levels_albumsettings9}</td></tr>
  <tr><td class='setting1'>
  {$admin_levels_albumsettings10}
  </td></tr><tr><td class='setting2'>
  <textarea name='level_album_mimes' rows='2' cols='40' class='text' style='width: 100%;'>{$album_mimes_value}</textarea>
  </td></tr></table>

  <br>

  <table cellpadding='0' cellspacing='0' width='600'>
  <tr><td class='header'>{$admin_levels_albumsettings11}</td></tr>
  <tr><td class='setting1'>
  {$admin_levels_albumsettings12}
  </td></tr><tr><td class='setting2'>
  <select name='level_album_storage' class='text'>
  <option value='102400'{if $album_storage == 102400} SELECTED{/if}>100 Kb</option>
  <option value='204800'{if $album_storage == 204800} SELECTED{/if}>200 Kb</option>
  <option value='512000'{if $album_storage == 512000} SELECTED{/if}>500 Kb</option>
  <option value='1048576'{if $album_storage == 1048576} SELECTED{/if}>1 MB</option>
  <option value='2097152'{if $album_storage == 2097152} SELECTED{/if}>2 MB</option>
  <option value='3145728'{if $album_storage == 3145728} SELECTED{/if}>3 MB</option>
  <option value='4194304'{if $album_storage == 4194304} SELECTED{/if}>4 MB</option>
  <option value='5242880'{if $album_storage == 5242880} SELECTED{/if}>5 MB</option>
  <option value='6291456'{if $album_storage == 6291456} SELECTED{/if}>6 MB</option>
  <option value='7340032'{if $album_storage == 7340032} SELECTED{/if}>7 MB</option>
  <option value='8388608'{if $album_storage == 8388608} SELECTED{/if}>8 MB</option>
  <option value='9437184'{if $album_storage == 9437184} SELECTED{/if}>9 MB</option>
  <option value='10485760'{if $album_storage == 10485760} SELECTED{/if}>10 MB</option>
  <option value='15728640'{if $album_storage == 15728640} SELECTED{/if}>15 MB</option>
  <option value='20971520'{if $album_storage == 20971520} SELECTED{/if}>20 MB</option>
  <option value='26214400'{if $album_storage == 26214400} SELECTED{/if}>25 MB</option>
  <option value='52428800'{if $album_storage == 52428800} SELECTED{/if}>50 MB</option>
  <option value='78643200'{if $album_storage == 78643200} SELECTED{/if}>75 MB</option>
  <option value='104857600'{if $album_storage == 104857600} SELECTED{/if}>100 MB</option>
  <option value='209715200'{if $album_storage == 209715200} SELECTED{/if}>200 MB</option>
  <option value='314572800'{if $album_storage == 314572800} SELECTED{/if}>300 MB</option>
  <option value='419430400'{if $album_storage == 419430400} SELECTED{/if}>400 MB</option>
  <option value='524288000'{if $album_storage == 524288000} SELECTED{/if}>500 MB</option>
  <option value='629145600'{if $album_storage == 629145600} SELECTED{/if}>600 MB</option>
  <option value='734003200'{if $album_storage == 734003200} SELECTED{/if}>700 MB</option>
  <option value='838860800'{if $album_storage == 838860800} SELECTED{/if}>800 MB</option>
  <option value='943718400'{if $album_storage == 943718400} SELECTED{/if}>900 MB</option>
  <option value='1073741824'{if $album_storage == 1073741824} SELECTED{/if}>1 GB</option>
  <option value='2147483648'{if $album_storage == 2147483648} SELECTED{/if}>2 GB</option>
  <option value='5368709120'{if $album_storage == 5368709120} SELECTED{/if}>5 GB</option>
  <option value='10737418240'{if $album_storage == 10737418240} SELECTED{/if}>10 GB</option>
  <option value='0'{if $album_storage == 0} SELECTED{/if}>{$admin_levels_albumsettings13}</option>
  </select>
  </td></tr></table>

  <br>

  <table cellpadding='0' cellspacing='0' width='600'>
  <tr><td class='header'>{$admin_levels_albumsettings16}</td></tr>
  <tr><td class='setting1'>
  {$admin_levels_albumsettings17}
  </td></tr><tr><td class='setting2'>
  <input type='text' class='text' size='5' name='level_album_maxsize' maxlength='6' value='{$album_maxsize}'> KB
  </td></tr>
  <tr><td class='setting1'>
  {$admin_levels_albumsettings20}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td>{$admin_levels_albumsettings21} &nbsp;</td>
    <td><input type='text' class='text' name='level_album_width' value='{$album_width}' maxlength='4' size='3'> &nbsp;</td>
    <td>{$admin_levels_albumsettings23}</td>
    </tr>
    <tr>
    <td>{$admin_levels_albumsettings22} &nbsp;</td>
    <td><input type='text' class='text' name='level_album_height' value='{$album_height}' maxlength='4' size='3'> &nbsp;</td>
    <td>{$admin_levels_albumsettings23}</td>
    </tr>
    </table>
  </td></tr>
  </table>

  <br>

  <table cellpadding='0' cellspacing='0' width='600'>
  <tr><td class='header'>{$admin_levels_albumsettings24}</td></tr>
  <tr><td class='setting1'>
  {$admin_levels_albumsettings25}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    <tr><td><input type='radio' name='level_album_style' id='album_style_1' value='1'{if $album_style == 1} CHECKED{/if}>&nbsp;</td><td><label for='album_style_1'>{$admin_levels_albumsettings26}</label></td></tr>
    <tr><td><input type='radio' name='level_album_style' id='album_style_0' value='0'{if $album_style == 0} CHECKED{/if}>&nbsp;</td><td><label for='album_style_0'>{$admin_levels_albumsettings27}</label></td></tr>
    </table>
  </td></tr></table>

  <br>
  
  <input type='submit' class='button' value='{$admin_levels_albumsettings14}'>
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
  <div style='height: 1650px;'>&nbsp;</div>
</td>
</tr>
</table>

{include file='admin_footer.tpl'}