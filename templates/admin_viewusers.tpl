{include file='admin_header.tpl'}

<h2>{$admin_viewusers1}</h2>
{$admin_viewusers2}

<br><br>

<table cellpadding='0' cellspacing='0' align='center'>
<tr>
<td align='center'>
<div class='box'>
<table cellpadding='0' cellspacing='0' align='center'>
<tr><form action='admin_viewusers.php' method='POST'>
<td>{$admin_viewusers3}<br><input type='text' class='text' name='f_user' value='{$f_user}' size='15' maxlength='50'>&nbsp;</td>
<td>{$admin_viewusers5}<br><input type='text' class='text' name='f_email' value='{$f_email}' size='15' maxlength='70'>&nbsp;</td>
<td>{$admin_viewusers24}<br><select class='text' name='f_level'><option></option>{section name=level_loop loop=$levels}<option value='{$levels[level_loop].level_id}'{if $f_level == $levels[level_loop].level_id} SELECTED{/if}>{$levels[level_loop].level_name}</option>{/section}</select>&nbsp;</td>
<td>{$admin_viewusers25}<br><select class='text' name='f_subnet'><option></option>{section name=subnet_loop loop=$subnets}<option value='{$subnets[subnet_loop].subnet_id}'{if $f_subnet == $subnets[subnet_loop].subnet_id} SELECTED{/if}>{$subnets[subnet_loop].subnet_name}</option>{/section}</select>&nbsp;</td>
<td>{$admin_viewusers6}<br><select class='text' name='f_enabled'><option></option><option value='1'{if $f_enabled == "1"} SELECTED{/if}>{$admin_viewusers9}</option><option value='0'{if $f_enabled == "0"} SELECTED{/if}>{$admin_viewusers10}</option></select>&nbsp;&nbsp;&nbsp;</td>
<td valign='bottom'><input type='submit' class='button' value='{$admin_viewusers14}'></td>
<input type='hidden' name='s' value='{$s}'>
</form>
</tr>
</table>
</div>
</td></tr></table>
  
<br>

{if $total_users == 0}

  <table cellpadding='0' cellspacing='0' width='400' align='center'>
  <tr>
  <td align='center'>
  <div class='box'><b>{$admin_viewusers21}</b></div>
  </td></tr></table>
  <br>

{else}

  {* JAVASCRIPT FOR CHECK ALL *}
  {literal}
  <script language='JavaScript'> 
  <!---
  var checkboxcount = 1;
  function doCheckAll() {
    if(checkboxcount == 0) {
      with (document.items) {
      for (var i=0; i < elements.length; i++) {
      if (elements[i].type == 'checkbox') {
      elements[i].checked = false;
      }}
      checkboxcount = checkboxcount + 1;
      }
    } else
      with (document.items) {
      for (var i=0; i < elements.length; i++) {
      if (elements[i].type == 'checkbox') {
      elements[i].checked = true;
      }}
      checkboxcount = checkboxcount - 1;
      }
  }
  // -->
  </script>
  {/literal}
  
  <div class='pages'>{$total_users} {$admin_viewusers16} &nbsp;|&nbsp; {$admin_viewusers17} {section name=page_loop loop=$pages}{if $pages[page_loop].link == '1'}{$pages[page_loop].page}{else}<a href='admin_viewusers.php?s={$s}&p={$pages[page_loop].page}&f_user={$f_user}&f_email={$f_email}&f_level={$f_level}&f_enabled={$f_enabled}'>{$pages[page_loop].page}</a>{/if} {/section}</div>
  
  <form action='admin_viewusers.php' method='post' name='items'>
  <table cellpadding='0' cellspacing='0' class='list' width='100%'>
  <tr>
  <td class='header' width='10'><input type='checkbox' name='select_all' onClick='javascript:doCheckAll()'></td>
  <td class='header' width='10' style='padding-left: 0px;'><a class='header' href='admin_viewusers.php?s={$i}&p={$p}&f_user={$f_user}&f_email={$f_email}&f_level={$f_level}&f_subnet={$f_subnet}&f_enabled={$f_enabled}'>{$admin_viewusers15}</a></td>
  <td class='header'><a class='header' href='admin_viewusers.php?s={$u}&p={$p}&f_user={$f_user}&f_email={$f_email}&f_level={$f_level}&f_subnet={$f_subnet}&f_enabled={$f_enabled}'>{$admin_viewusers3}</a></td>
  <td class='header'><a class='header' href='admin_viewusers.php?s={$em}&p={$p}&f_user={$f_user}&f_email={$f_email}&f_level={$f_level}&f_subnet={$f_subnet}&f_enabled={$f_enabled}'>{$admin_viewusers5}</a>{if $user_verification != 0} (<a class='header' href='admin_viewusers.php?s={$v}&p={$p}&f_user={$f_user}&f_email={$f_email}&f_level={$f_level}&f_enabled={$f_enabled}'>{$admin_viewusers22}</a>){/if}</td>
  <td class='header'>{$admin_viewusers24}</td>
  <td class='header'>{$admin_viewusers25}</td>
  <td class='header' align='center'>{$admin_viewusers6}</td>
  <td class='header'><a class='header' href='admin_viewusers.php?s={$sd}&p={$p}&f_user={$f_user}&f_email={$f_email}&f_level={$f_level}&f_subnet={$f_subnet}&f_enabled={$f_enabled}'>{$admin_viewusers7}</a></td>
  <td class='header'>{$admin_viewusers8}</td>
  </tr>
  
  <!-- LOOP THROUGH USERS -->
  {section name=user_loop loop=$users}
    <tr class='{cycle values="background1,background2"}'>
    <td class='item' style='padding-right: 0px;'><input type='checkbox' name='item_{$users[user_loop].user_id}' value='1'></td>
    <td class='item' style='padding-left: 0px;'>{$users[user_loop].user_id}</td>
    <td class='item'><a href='{$url->url_create('profile', $users[user_loop].user_username)}'>{$users[user_loop].user_username|truncate:25:"...":true}</a></td>
    <td class='item'><a href='mailto:{$users[user_loop].user_email}'>{$users[user_loop].user_email|truncate:25:"...":true}</a>{if $user_verification != 0 & $users[user_loop].user_verified == 0} ({$admin_viewusers4}){/if}</td>
    <td class='item'><a href='admin_levels_edit.php?level_id={$users[user_loop].user_level_id}'>{$users[user_loop].user_level}</a></td>
    <td class='item'><a href='admin_subnetworks_edit.php?subnet_id={$users[user_loop].user_subnet_id}'>{$users[user_loop].user_subnet}</a></td>
    <td class='item' align='center'>{$users[user_loop].user_enabled}</td>
    <td class='item' nowrap='nowrap'>{$datetime->cdate($setting.setting_dateformat, $datetime->timezone($users[user_loop].user_signupdate, $setting.setting_timezone))}</td>
    <td class='item' nowrap='nowrap'><a href='admin_viewusers_edit.php?user_id={$users[user_loop].user_id}&s={$s}&p={$p}&f_user={$f_user}&f_email={$f_email}&f_level={$f_level}&f_enabled={$f_enabled}'>{$admin_viewusers11}</a> | <a href='admin_viewusers.php?task=confirm&user_id={$users[user_loop].user_id}&s={$s}&p={$p}&f_user={$f_user}&f_email={$f_email}&f_level={$f_level}&f_enabled={$f_enabled}'>{$admin_viewusers12}</a> | <a href='admin_loginasuser.php?user_id={$users[user_loop].user_id}' target='_blank'>{$admin_viewusers13}</a></td>
    </tr>
  {/section}
  </table>

  <table cellpadding='0' cellspacing='0' width='100%'>
  <tr>
  <td>
    <br>
    <input type='submit' class='button' value='{$admin_viewusers23}'>
    <input type='hidden' name='task' value='dodelete'>
    </form>
  </td>
  <td align='right' valign='top'>
    <div class='pages2'>{$total_users} {$admin_viewusers16} &nbsp;|&nbsp; {$admin_viewusers17} {section name=page_loop loop=$pages}{if $pages[page_loop].link == '1'}{$pages[page_loop].page}{else}<a href='admin_viewusers.php?s={$s}&p={$pages[page_loop].page}&f_user={$f_user}&f_email={$f_email}&f_level={$f_level}&f_enabled={$f_enabled}'>{$pages[page_loop].page}</a>{/if} {/section}</div>
  </td>
  </tr>
  </table>

{/if}

{include file='admin_footer.tpl'}