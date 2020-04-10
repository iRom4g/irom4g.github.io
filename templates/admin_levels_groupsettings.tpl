{include file='admin_header.tpl'}

<h2>{$admin_levels_groupsettings63} {$level_name}</h2>
{$admin_levels_groupsettings64}

<table cellspacing='0' cellpadding='0' width='100%' style='margin-top: 20px;'>
<tr>
<td class='vert_tab0'>&nbsp;</td>
<td valign='top' class='pagecell' rowspan='{math equation='x+2' x=$level_menu|@count}'>


  <h2>{$admin_levels_groupsettings1}</h2>
  {$admin_levels_groupsettings2}

  <br><br>

  {if $result != 0}
    <div class='success'><img src='../images/success.gif' class='icon' border='0'> {$admin_levels_groupsettings8}</div>
  {/if}

  {if $is_error != 0}
    <div class='error'><img src='../images/error.gif' class='icon' border='0'> {$error_message}</div>
  {/if}

  <form action='admin_levels_groupsettings.php' method='POST'>
  <table cellpadding='0' cellspacing='0' width='600'>
  <tr><td class='header'>{$admin_levels_groupsettings3}</td></tr>
  <tr><td class='setting1'>
  {$admin_levels_groupsettings4}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    <tr><td><input type='radio' name='level_group_allow' id='group_allow_1' value='1'{if $group_allow == 1} CHECKED{/if}>&nbsp;</td><td><label for='group_allow_1'>{$admin_levels_groupsettings5}</label></td></tr>
    <tr><td><input type='radio' name='level_group_allow' id='group_allow_0' value='0'{if $group_allow == 0} CHECKED{/if}>&nbsp;</td><td><label for='group_allow_0'>{$admin_levels_groupsettings6}</label></td></tr>
    </table>
  </td></tr></table>

  <br>

  <table cellpadding='0' cellspacing='0' width='600'>
  <tr><td class='header'>{$admin_levels_groupsettings9}</td></tr>
  <td class='setting1'>
  {$admin_levels_groupsettings10}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    <tr><td><input type='radio' name='level_group_photo' id='group_photo_1' value='1'{if $group_photo == 1} CHECKED{/if}>&nbsp;</td><td><label for='group_photo_1'>{$admin_levels_groupsettings11}</label></td></tr>
    <tr><td><input type='radio' name='level_group_photo' id='group_photo_0' value='0'{if $group_photo == 0} CHECKED{/if}>&nbsp;</td><td><label for='group_photo_0'>{$admin_levels_groupsettings12}</label></td></tr>
    </table>
  </td></tr>
  <tr>
  <td class='setting1'>
  {$admin_levels_groupsettings13}
  </td>
  </tr>
  <tr>
  <td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td>{$admin_levels_groupsettings14} &nbsp;</td>
    <td><input type='text' class='text' name='level_group_photo_width' value='{$group_photo_width}' maxlength='3' size='3'> &nbsp;</td>
    <td>{$admin_levels_groupsettings15}</td>
    </tr>
    <tr>
    <td>{$admin_levels_groupsettings16} &nbsp;</td>
    <td><input type='text' class='text' name='level_group_photo_height' value='{$group_photo_height}' maxlength='3' size='3'> &nbsp;</td>
    <td>{$admin_levels_groupsettings15}</td>
    </tr>
    </table>
  </td>
  </tr>
  <tr>
  <td class='setting1'>
  {$admin_levels_groupsettings17}
  </td>
  </tr>
  <tr>
  <td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td>{$admin_levels_groupsettings18} &nbsp;</td>
    <td><input type='text' class='text' name='level_group_photo_exts' value='{$group_photo_exts}' size='40' maxlength='50'></td>
    </tr>
    </table>
  </td>
  </tr>
  </table>
  
  <br>

  <table cellpadding='0' cellspacing='0' width='600'>
  <tr><td class='header'>{$admin_levels_groupsettings62}</td></tr>
  <tr><td class='setting1'>
  {$admin_levels_groupsettings59}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
      <tr><td><input type='radio' name='level_group_search' id='group_search_1' value='1'{if $group_search == 1} CHECKED{/if}></td><td><label for='group_search_1'>{$admin_levels_groupsettings60}</label>&nbsp;&nbsp;</td></tr>
      <tr><td><input type='radio' name='level_group_search' id='group_search_0' value='0'{if $group_search == 0} CHECKED{/if}></td><td><label for='group_search_0'>{$admin_levels_groupsettings61}</label>&nbsp;&nbsp;</td></tr>
    </table>
  </td></tr>
  <tr><td class='setting1'>
  {$admin_levels_groupsettings65}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    {section name=privacy_loop loop=$group_privacy}
      <tr><td><input type='checkbox' name='{$group_privacy[privacy_loop].privacy_name}' id='{$group_privacy[privacy_loop].privacy_name}' value='{$group_privacy[privacy_loop].privacy_value}'{if $group_privacy[privacy_loop].privacy_selected == 1} CHECKED{/if}></td><td><label for='{$group_privacy[privacy_loop].privacy_name}'>{$group_privacy[privacy_loop].privacy_option}</label>&nbsp;&nbsp;</td></tr>
    {/section}
    </table>
  </td></tr>
  <tr><td class='setting1'>
  {$admin_levels_groupsettings66}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    {section name=comment_loop loop=$group_comments}
      <tr><td><input type='checkbox' name='{$group_comments[comment_loop].comment_name}' id='{$group_comments[comment_loop].comment_name}' value='{$group_comments[comment_loop].comment_value}'{if $group_comments[comment_loop].comment_selected == 1} CHECKED{/if}></td><td><label for='{$group_comments[comment_loop].comment_name}'>{$group_comments[comment_loop].comment_option}</label>&nbsp;&nbsp;</td></tr>
    {/section}
    </table>
  </td></tr>
  <tr><td class='setting1'>
  {$admin_levels_groupsettings52}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    {section name=discussion_loop loop=$group_discussion}
      <tr><td><input type='checkbox' name='{$group_discussion[discussion_loop].discussion_name}' id='{$group_discussion[discussion_loop].discussion_name}' value='{$group_discussion[discussion_loop].discussion_value}'{if $group_discussion[discussion_loop].discussion_selected == 1} CHECKED{/if}></td><td><label for='{$group_discussion[discussion_loop].discussion_name}'>{$group_discussion[discussion_loop].discussion_option}</label>&nbsp;&nbsp;</td></tr>
    {/section}
    </table>
  </td></tr>
  </table>
  
  <br>

  <table cellpadding='0' cellspacing='0' width='600'>
  <tr>
  <td class='header'>{$admin_levels_groupsettings19}</td>
  </tr>
  <td class='setting1'>
  {$admin_levels_groupsettings20}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    <tr><td><input type='radio' name='level_group_titles' id='group_titles_1' value='1'{if $group_titles == 1} CHECKED{/if}>&nbsp;</td><td><label for='group_titles_1'>{$admin_levels_groupsettings21}</label></td></tr>
    <tr><td><input type='radio' name='level_group_titles' id='group_titles_0' value='0'{if $group_titles == 0} CHECKED{/if}>&nbsp;</td><td><label for='group_titles_0'>{$admin_levels_groupsettings22}</label></td></tr>
    </table>
  </td></tr></table>
  
  <br>

  <table cellpadding='0' cellspacing='0' width='600'>
  <tr>
  <td class='header'>{$admin_levels_groupsettings23}</td>
  </tr>
  <td class='setting1'>
  {$admin_levels_groupsettings24}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    <tr><td><input type='radio' name='level_group_officers' id='group_officers_1' value='1'{if $group_officers == 1} CHECKED{/if}>&nbsp;</td><td><label for='group_officers_1'>{$admin_levels_groupsettings25}</label></td></tr>
    <tr><td><input type='radio' name='level_group_officers' id='group_officers_0' value='0'{if $group_officers == 0} CHECKED{/if}>&nbsp;</td><td><label for='group_officers_0'>{$admin_levels_groupsettings26}</label></td></tr>
    </table>
  </td></tr></table>
  
  <br>

  <table cellpadding='0' cellspacing='0' width='600'>
  <tr>
  <td class='header'>{$admin_levels_groupsettings27}</td>
  </tr>
  <td class='setting1'>
  {$admin_levels_groupsettings28}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    <tr><td><input type='radio' name='level_group_approval' id='group_approval_1' value='1'{if $group_approval == 1} CHECKED{/if}>&nbsp;</td><td><label for='group_approval_1'>{$admin_levels_groupsettings29}</label></td></tr>
    <tr><td><input type='radio' name='level_group_approval' id='group_approval_0' value='0'{if $group_approval == 0} CHECKED{/if}>&nbsp;</td><td><label for='group_approval_0'>{$admin_levels_groupsettings30}</label></td></tr>
    </table>
  </td></tr></table>
  
  <br>

  <table cellpadding='0' cellspacing='0' width='600'>
  <tr>
  <td class='header'>{$admin_levels_groupsettings31}</td>
  </tr>
  <td class='setting1'>
  {$admin_levels_groupsettings32}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    <tr><td><input type='radio' name='level_group_style' id='group_style_1' value='1'{if $group_style == 1} CHECKED{/if}>&nbsp;</td><td><label for='group_style_1'>{$admin_levels_groupsettings33}</label></td></tr>
    <tr><td><input type='radio' name='level_group_style' id='group_style_0' value='0'{if $group_style == 0} CHECKED{/if}>&nbsp;</td><td><label for='group_style_0'>{$admin_levels_groupsettings34}</label></td></tr>
    </table>
  </td></tr></table>
  
  <br>

  <table cellpadding='0' cellspacing='0' width='600'>
  <tr><td class='header'>{$admin_levels_groupsettings35}</td></tr>
  <tr><td class='setting1'>
  {$admin_levels_groupsettings36}
  </td></tr><tr><td class='setting2'>
  <textarea name='level_group_album_exts' rows='2' cols='40' class='text' style='width: 100%;'>{$group_album_exts}</textarea>
  </td></tr>
  <tr><td class='setting1'>
  {$admin_levels_groupsettings37}
  </td></tr><tr><td class='setting2'>
  <textarea name='level_group_album_mimes' rows='2' cols='40' class='text' style='width: 100%;'>{$group_album_mimes}</textarea>
  </td></tr>
  <tr><td class='setting1'>
  {$admin_levels_groupsettings38}
  </td></tr><tr><td class='setting2'>
  <select name='level_group_album_storage' class='text'>
  <option value='102400'{if $group_album_storage == 102400} SELECTED{/if}>100 Kb</option>
  <option value='204800'{if $group_album_storage == 204800} SELECTED{/if}>200 Kb</option>
  <option value='512000'{if $group_album_storage == 512000} SELECTED{/if}>500 Kb</option>
  <option value='1048576'{if $group_album_storage == 1048576} SELECTED{/if}>1 MB</option>
  <option value='2097152'{if $group_album_storage == 2097152} SELECTED{/if}>2 MB</option>
  <option value='3145728'{if $group_album_storage == 3145728} SELECTED{/if}>3 MB</option>
  <option value='4194304'{if $group_album_storage == 4194304} SELECTED{/if}>4 MB</option>
  <option value='5242880'{if $group_album_storage == 5242880} SELECTED{/if}>5 MB</option>
  <option value='6291456'{if $group_album_storage == 6291456} SELECTED{/if}>6 MB</option>
  <option value='7340032'{if $group_album_storage == 7340032} SELECTED{/if}>7 MB</option>
  <option value='8388608'{if $group_album_storage == 8388608} SELECTED{/if}>8 MB</option>
  <option value='9437184'{if $group_album_storage == 9437184} SELECTED{/if}>9 MB</option>
  <option value='10485760'{if $group_album_storage == 10485760} SELECTED{/if}>10 MB</option>
  <option value='15728640'{if $group_album_storage == 15728640} SELECTED{/if}>15 MB</option>
  <option value='20971520'{if $group_album_storage == 20971520} SELECTED{/if}>20 MB</option>
  <option value='26214400'{if $group_album_storage == 26214400} SELECTED{/if}>25 MB</option>
  <option value='52428800'{if $group_album_storage == 52428800} SELECTED{/if}>50 MB</option>
  <option value='78643200'{if $group_album_storage == 78643200} SELECTED{/if}>75 MB</option>
  <option value='104857600'{if $group_album_storage == 104857600} SELECTED{/if}>100 MB</option>
  <option value='209715200'{if $group_album_storage == 209715200} SELECTED{/if}>200 MB</option>
  <option value='314572800'{if $group_album_storage == 314572800} SELECTED{/if}>300 MB</option>
  <option value='419430400'{if $group_album_storage == 419430400} SELECTED{/if}>400 MB</option>
  <option value='524288000'{if $group_album_storage == 524288000} SELECTED{/if}>500 MB</option>
  <option value='629145600'{if $group_album_storage == 629145600} SELECTED{/if}>600 MB</option>
  <option value='734003200'{if $group_album_storage == 734003200} SELECTED{/if}>700 MB</option>
  <option value='838860800'{if $group_album_storage == 838860800} SELECTED{/if}>800 MB</option>
  <option value='943718400'{if $group_album_storage == 943718400} SELECTED{/if}>900 MB</option>
  <option value='1073741824'{if $group_album_storage == 1073741824} SELECTED{/if}>1 GB</option>
  <option value='2147483648'{if $group_album_storage == 2147483648} SELECTED{/if}>2 GB</option>
  <option value='5368709120'{if $group_album_storage == 5368709120} SELECTED{/if}>5 GB</option>
  <option value='10737418240'{if $group_album_storage == 10737418240} SELECTED{/if}>10 GB</option>
  <option value='0'{if $group_album_storage == 0} SELECTED{/if}>{$admin_levels_groupsettings39}</option>
  </select>
  </td></tr>
  <tr><td class='setting1'>
  {$admin_levels_groupsettings40}
  </td></tr><tr><td class='setting2'>
  <input type='text' class='text' size='5' name='level_group_album_maxsize' maxlength='6' value='{$group_album_maxsize}'> KB
  </td></tr>
  <tr><td class='setting1'>
  {$admin_levels_groupsettings41}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td>{$admin_levels_groupsettings42} &nbsp;</td>
    <td><input type='text' class='text' name='level_group_album_width' value='{$group_album_width}' maxlength='4' size='3'> &nbsp;</td>
    <td>{$admin_levels_groupsettings44}</td>
    </tr>
    <tr>
    <td>{$admin_levels_groupsettings43} &nbsp;</td>
    <td><input type='text' class='text' name='level_group_album_height' value='{$group_album_height}' maxlength='4' size='3'> &nbsp;</td>
    <td>{$admin_levels_groupsettings44}</td>
    </tr>
    </table>
  </td></tr>
  </table>
  
  <br>

  <table cellpadding='0' cellspacing='0' width='600'>
  <tr><td class='header'>{$admin_levels_groupsettings45}</td></tr>
  <tr><td class='setting1'>
  {$admin_levels_groupsettings46}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    <tr><td><input type='text' name='level_group_maxnum' value='{$group_maxnum}' maxlength='3' size='5'>&nbsp;{$admin_levels_groupsettings47}</tr>
    </table>
  </td></tr></table>
  
  <br>

  <input type='submit' class='button' value='{$admin_levels_groupsettings7}'>
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
  <div style='height: 2500px;'>&nbsp;</div>
</td>
</tr>
</table>

{include file='admin_footer.tpl'}