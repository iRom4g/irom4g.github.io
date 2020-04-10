{include file='admin_header.tpl'}

<h2>{$admin_levels_eventsettings23} {$level_name}</h2>
{$admin_levels_eventsettings24}

<table cellspacing='0' cellpadding='0' width='100%' style='margin-top: 20px;'>
<tr>
<td class='vert_tab0'>&nbsp;</td>
<td valign='top' class='pagecell' rowspan='{math equation='x+2' x=$level_menu|@count}'>


  <h2>{$admin_levels_eventsettings1}</h2>
  {$admin_levels_eventsettings2}

  <br><br>

  {if $result != 0}
    <div class='success'><img src='../images/success.gif' class='icon' border='0'> {$admin_levels_eventsettings8}</div>
  {/if}

  {if $is_error != 0}
    <div class='error'><img src='../images/error.gif' class='icon' border='0'> {$error_message}</div>
  {/if}

  <form action='admin_levels_eventsettings.php' method='POST'>
  <table cellpadding='0' cellspacing='0' width='600'>
  <tr><td class='header'>{$admin_levels_eventsettings3}</td></tr>
  <tr><td class='setting1'>
  {$admin_levels_eventsettings4}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    <tr><td><input type='radio' name='level_event_allow' id='event_allow_1' value='1'{if $event_allow == 1} CHECKED{/if}>&nbsp;</td><td><label for='event_allow_1'>{$admin_levels_eventsettings5}</label></td></tr>
    <tr><td><input type='radio' name='level_event_allow' id='event_allow_0' value='0'{if $event_allow == 0} CHECKED{/if}>&nbsp;</td><td><label for='event_allow_0'>{$admin_levels_eventsettings6}</label></td></tr>
    </table>
  </td></tr></table>

  <br>

  <table cellpadding='0' cellspacing='0' width='600'>
  <tr><td class='header'>{$admin_levels_eventsettings9}</td></tr>
  <td class='setting1'>
  {$admin_levels_eventsettings10}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    <tr><td><input type='radio' name='level_event_photo' id='event_photo_1' value='1'{if $event_photo == 1} CHECKED{/if}>&nbsp;</td><td><label for='event_photo_1'>{$admin_levels_eventsettings11}</label></td></tr>
    <tr><td><input type='radio' name='level_event_photo' id='event_photo_0' value='0'{if $event_photo == 0} CHECKED{/if}>&nbsp;</td><td><label for='event_photo_0'>{$admin_levels_eventsettings12}</label></td></tr>
    </table>
  </td></tr>
  <tr>
  <td class='setting1'>
  {$admin_levels_eventsettings13}
  </td>
  </tr>
  <tr>
  <td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td>{$admin_levels_eventsettings14} &nbsp;</td>
    <td><input type='text' class='text' name='level_event_photo_width' value='{$event_photo_width}' maxlength='3' size='3'> &nbsp;</td>
    <td>{$admin_levels_eventsettings15}</td>
    </tr>
    <tr>
    <td>{$admin_levels_eventsettings16} &nbsp;</td>
    <td><input type='text' class='text' name='level_event_photo_height' value='{$event_photo_height}' maxlength='3' size='3'> &nbsp;</td>
    <td>{$admin_levels_eventsettings15}</td>
    </tr>
    </table>
  </td>
  </tr>
  <tr>
  <td class='setting1'>
  {$admin_levels_eventsettings17}
  </td>
  </tr>
  <tr>
  <td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td>{$admin_levels_eventsettings18} &nbsp;</td>
    <td><input type='text' class='text' name='level_event_photo_exts' value='{$event_photo_exts}' size='40' maxlength='50'></td>
    </tr>
    </table>
  </td>
  </tr>
  </table>
  
  <br>

  <table cellpadding='0' cellspacing='0' width='600'>
  <tr><td class='header'>{$admin_levels_eventsettings22}</td></tr>
  <tr><td class='setting1'>
  {$admin_levels_eventsettings19}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
      <tr><td><input type='radio' name='level_event_search' id='event_search_1' value='1'{if $event_search == 1} CHECKED{/if}></td><td><label for='event_search_1'>{$admin_levels_eventsettings20}</label>&nbsp;&nbsp;</td></tr>
      <tr><td><input type='radio' name='level_event_search' id='event_search_0' value='0'{if $event_search == 0} CHECKED{/if}></td><td><label for='event_search_0'>{$admin_levels_eventsettings21}</label>&nbsp;&nbsp;</td></tr>
    </table>
  </td></tr>
  <tr><td class='setting1'>
  {$admin_levels_eventsettings25}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    {section name=privacy_loop loop=$event_privacy}
      <tr><td><input type='checkbox' name='{$event_privacy[privacy_loop].privacy_name}' id='{$event_privacy[privacy_loop].privacy_name}' value='{$event_privacy[privacy_loop].privacy_value}'{if $event_privacy[privacy_loop].privacy_selected == 1} CHECKED{/if}></td><td><label for='{$event_privacy[privacy_loop].privacy_name}'>{$event_privacy[privacy_loop].privacy_option}</label>&nbsp;&nbsp;</td></tr>
    {/section}
    </table>
  </td></tr>
  <tr><td class='setting1'>
  {$admin_levels_eventsettings26}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    {section name=comment_loop loop=$event_comments}
      <tr><td><input type='checkbox' name='{$event_comments[comment_loop].comment_name}' id='{$event_comments[comment_loop].comment_name}' value='{$event_comments[comment_loop].comment_value}'{if $event_comments[comment_loop].comment_selected == 1} CHECKED{/if}></td><td><label for='{$event_comments[comment_loop].comment_name}'>{$event_comments[comment_loop].comment_option}</label>&nbsp;&nbsp;</td></tr>
    {/section}
    </table>
  </td></tr>
  </table>
  
  <br>

  <table cellpadding='0' cellspacing='0' width='600'>
  <tr>
  <td class='header'>{$admin_levels_eventsettings27}</td>
  </tr>
  <td class='setting1'>
  {$admin_levels_eventsettings28}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    <tr><td><input type='radio' name='level_event_inviteonly' id='event_inviteonly_1' value='1'{if $event_inviteonly == 1} CHECKED{/if}>&nbsp;</td><td><label for='event_inviteonly_1'>{$admin_levels_eventsettings29}</label></td></tr>
    <tr><td><input type='radio' name='level_event_inviteonly' id='event_inviteonly_0' value='0'{if $event_inviteonly == 0} CHECKED{/if}>&nbsp;</td><td><label for='event_inviteonly_0'>{$admin_levels_eventsettings30}</label></td></tr>
    </table>
  </td></tr></table>
  
  <br>

  <table cellpadding='0' cellspacing='0' width='600'>
  <tr>
  <td class='header'>{$admin_levels_eventsettings31}</td>
  </tr>
  <td class='setting1'>
  {$admin_levels_eventsettings32}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    <tr><td><input type='radio' name='level_event_style' id='event_style_1' value='1'{if $event_style == 1} CHECKED{/if}>&nbsp;</td><td><label for='event_style_1'>{$admin_levels_eventsettings33}</label></td></tr>
    <tr><td><input type='radio' name='level_event_style' id='event_style_0' value='0'{if $event_style == 0} CHECKED{/if}>&nbsp;</td><td><label for='event_style_0'>{$admin_levels_eventsettings34}</label></td></tr>
    </table>
  </td></tr></table>
  
  <br>

  <table cellpadding='0' cellspacing='0' width='600'>
  <tr><td class='header'>{$admin_levels_eventsettings35}</td></tr>
  <tr><td class='setting1'>
  {$admin_levels_eventsettings36}
  </td></tr><tr><td class='setting2'>
  <textarea name='level_event_album_exts' rows='2' cols='40' class='text' style='width: 100%;'>{$event_album_exts}</textarea>
  </td></tr>
  <tr><td class='setting1'>
  {$admin_levels_eventsettings37}
  </td></tr><tr><td class='setting2'>
  <textarea name='level_event_album_mimes' rows='2' cols='40' class='text' style='width: 100%;'>{$event_album_mimes}</textarea>
  </td></tr>
  <tr><td class='setting1'>
  {$admin_levels_eventsettings38}
  </td></tr><tr><td class='setting2'>
  <select name='level_event_album_storage' class='text'>
  <option value='102400'{if $event_album_storage == 102400} SELECTED{/if}>100 Kb</option>
  <option value='204800'{if $event_album_storage == 204800} SELECTED{/if}>200 Kb</option>
  <option value='512000'{if $event_album_storage == 512000} SELECTED{/if}>500 Kb</option>
  <option value='1048576'{if $event_album_storage == 1048576} SELECTED{/if}>1 MB</option>
  <option value='2097152'{if $event_album_storage == 2097152} SELECTED{/if}>2 MB</option>
  <option value='3145728'{if $event_album_storage == 3145728} SELECTED{/if}>3 MB</option>
  <option value='4194304'{if $event_album_storage == 4194304} SELECTED{/if}>4 MB</option>
  <option value='5242880'{if $event_album_storage == 5242880} SELECTED{/if}>5 MB</option>
  <option value='6291456'{if $event_album_storage == 6291456} SELECTED{/if}>6 MB</option>
  <option value='7340032'{if $event_album_storage == 7340032} SELECTED{/if}>7 MB</option>
  <option value='8388608'{if $event_album_storage == 8388608} SELECTED{/if}>8 MB</option>
  <option value='9437184'{if $event_album_storage == 9437184} SELECTED{/if}>9 MB</option>
  <option value='10485760'{if $event_album_storage == 10485760} SELECTED{/if}>10 MB</option>
  <option value='15728640'{if $event_album_storage == 15728640} SELECTED{/if}>15 MB</option>
  <option value='20971520'{if $event_album_storage == 20971520} SELECTED{/if}>20 MB</option>
  <option value='26214400'{if $event_album_storage == 26214400} SELECTED{/if}>25 MB</option>
  <option value='52428800'{if $event_album_storage == 52428800} SELECTED{/if}>50 MB</option>
  <option value='78643200'{if $event_album_storage == 78643200} SELECTED{/if}>75 MB</option>
  <option value='104857600'{if $event_album_storage == 104857600} SELECTED{/if}>100 MB</option>
  <option value='209715200'{if $event_album_storage == 209715200} SELECTED{/if}>200 MB</option>
  <option value='314572800'{if $event_album_storage == 314572800} SELECTED{/if}>300 MB</option>
  <option value='419430400'{if $event_album_storage == 419430400} SELECTED{/if}>400 MB</option>
  <option value='524288000'{if $event_album_storage == 524288000} SELECTED{/if}>500 MB</option>
  <option value='629145600'{if $event_album_storage == 629145600} SELECTED{/if}>600 MB</option>
  <option value='734003200'{if $event_album_storage == 734003200} SELECTED{/if}>700 MB</option>
  <option value='838860800'{if $event_album_storage == 838860800} SELECTED{/if}>800 MB</option>
  <option value='943718400'{if $event_album_storage == 943718400} SELECTED{/if}>900 MB</option>
  <option value='1073741824'{if $event_album_storage == 1073741824} SELECTED{/if}>1 GB</option>
  <option value='2147483648'{if $event_album_storage == 2147483648} SELECTED{/if}>2 GB</option>
  <option value='5368709120'{if $event_album_storage == 5368709120} SELECTED{/if}>5 GB</option>
  <option value='10737418240'{if $event_album_storage == 10737418240} SELECTED{/if}>10 GB</option>
  <option value='0'{if $event_album_storage == 0} SELECTED{/if}>{$admin_levels_eventsettings39}</option>
  </select>
  </td></tr>
  <tr><td class='setting1'>
  {$admin_levels_eventsettings40}
  </td></tr><tr><td class='setting2'>
  <input type='text' class='text' size='5' name='level_event_album_maxsize' maxlength='6' value='{$event_album_maxsize}'> KB
  </td></tr>
  <tr><td class='setting1'>
  {$admin_levels_eventsettings41}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td>{$admin_levels_eventsettings42} &nbsp;</td>
    <td><input type='text' class='text' name='level_event_album_width' value='{$event_album_width}' maxlength='4' size='3'> &nbsp;</td>
    <td>{$admin_levels_eventsettings44}</td>
    </tr>
    <tr>
    <td>{$admin_levels_eventsettings43} &nbsp;</td>
    <td><input type='text' class='text' name='level_event_album_height' value='{$event_album_height}' maxlength='4' size='3'> &nbsp;</td>
    <td>{$admin_levels_eventsettings44}</td>
    </tr>
    </table>
  </td></tr>
  </table>
  
  <br>

  <input type='submit' class='button' value='{$admin_levels_eventsettings7}'>
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