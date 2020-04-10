{include file='admin_header.tpl'}

<h2>{$admin_viewgroups1}</h2>
{$admin_viewgroups2}

<br><br>

<table cellpadding='0' cellspacing='0' width='400' align='center'>
<tr>
<td align='center'>
<div class='box'>
<table cellpadding='0' cellspacing='0' align='center'>
<tr><form action='admin_viewgroups.php' method='POST'>
<td>{$admin_viewgroups3}<br><input type='text' class='text' name='f_title' value='{$f_title}' size='15' maxlength='100'>&nbsp;</td>
<td>{$admin_viewgroups8}<br><input type='text' class='text' name='f_owner' value='{$f_owner}' size='15' maxlength='50'>&nbsp;</td>
<td><input type='submit' class='button' value='{$admin_viewgroups5}'></td>
<input type='hidden' name='s' value='{$s}'>
</form>
</tr>
</table>
</div>
</td></tr></table>

<br>

{if $total_groups == 0}

  <table cellpadding='0' cellspacing='0' width='400' align='center'>
  <tr>
  <td align='center'>
    <div class='box' style='width: 300px;'><b>{$admin_viewgroups19}</b></div>
  </td>
  </tr>
  </table>
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

  <div class='pages'>{$total_groups} {$admin_viewgroups14} &nbsp;|&nbsp; {$admin_viewgroups15} {section name=page_loop loop=$pages}{if $pages[page_loop].link == '1'}{$pages[page_loop].page}{else}<a href='admin_viewgroups.php?s={$s}&p={$pages[page_loop].page}&f_title={$f_title}&f_owner={$f_owner}'>{$pages[page_loop].page}</a>{/if} {/section}</div>
  
  <form action='admin_viewgroups.php' method='post' name='items'>
  <table cellpadding='0' cellspacing='0' class='list'>
  <tr>
  <td class='header' width='10'><input type='checkbox' name='select_all' onClick='javascript:doCheckAll()'></td>
  <td class='header' width='10' style='padding-left: 0px;'><a class='header' href='admin_viewgroups.php?s={$i}&p={$p}&f_title={$f_title}&f_owner={$f_owner}'>{$admin_viewgroups6}</a></td>
  <td class='header'><a class='header' href='admin_viewgroups.php?s={$t}&p={$p}&f_title={$f_title}&f_owner={$f_owner}'>{$admin_viewgroups3}</a></td>
  <td class='header'><a class='header' href='admin_viewgroups.php?s={$o}&p={$p}&f_title={$f_title}&f_owner={$f_owner}'>{$admin_viewgroups8}</a></td>
  <td class='header' width='1'><a class='header' href='admin_viewgroups.php?s={$m}&p={$p}&f_title={$f_title}&f_owner={$f_owner}'>{$admin_viewgroups9}</a></td>
  <td class='header' width='100'><a class='header' href='admin_viewgroups.php?s={$d}&p={$p}&f_title={$f_title}&f_owner={$f_owner}'>{$admin_viewgroups10}</a></td>
  <td class='header' width='100'>{$admin_viewgroups11}</td>
  </tr>
  {section name=group_loop loop=$groups}
    <tr class='{cycle values="background1,background2"}'>
    <td class='item' style='padding-right: 0px;'><input type='checkbox' name='delete_group_{$groups[group_loop].group->group_info.group_id}' value='1'></td>
    <td class='item' style='padding-left: 0px;'>{$groups[group_loop].group->group_info.group_id}</td>
    <td class='item'>{$groups[group_loop].group->group_info.group_title}</td>
    <td class='item'><a href='{$url->url_create('profile', $groups[group_loop].group_leader->user_info.user_username)}' target='_blank'>{$groups[group_loop].group_leader->user_info.user_username}</a></td>
    <td class='item' align='center'>{$groups[group_loop].group_members}</td>
    <td class='item'>{assign var=group_datecreated value=$groups[group_loop].group->group_info.group_datecreated}{$datetime->cdate($setting.setting_dateformat, $datetime->timezone($group_datecreated, $setting.setting_timezone))}</td>
    <td class='item'>[ <a href='admin_loginasuser.php?user_id={$groups[group_loop].group->group_info.group_user_id}&url={$url->url_encode("`$url->url_base`group.php?group_id=`$groups[group_loop].group->group_info.group_id`")}' target='_blank'>{$admin_viewgroups12}</a> ] [ <a href='admin_viewgroups.php?task=confirm&group_id={$groups[group_loop].group->group_info.group_id}&s={$s}&p={$p}&f_title={$f_title}&f_owner={$f_owner}'>{$admin_viewgroups13}</a> ]</td>
    </tr>
  {/section}
  </table>

  <table cellpadding='0' cellspacing='0' width='100%'>
  <tr>
  <td>
    <br>
    <input type='submit' class='button' value='{$admin_viewgroups20}'>
    <input type='hidden' name='task' value='delete'>
    <input type='hidden' name='s' value='{$s}'>
    <input type='hidden' name='p' value='{$p}'>
    <input type='hidden' name='f_title' value='{$f_title}'>
    <input type='hidden' name='f_owner' value='{$f_owner}'>
    </form>
  </td>
  <td align='right' valign='top'>
    <div class='pages2'>{$total_groups} {$admin_viewgroups14} &nbsp;|&nbsp; {$admin_viewgroups15} {section name=page_loop loop=$pages}{if $pages[page_loop].link == '1'}{$pages[page_loop].page}{else}<a href='admin_viewgroups.php?s={$s}&p={$pages[page_loop].page}&f_title={$f_title}&f_owner={$f_owner}'>{$pages[page_loop].page}</a>{/if} {/section}</div>
  </td>
  </tr>
  </table>

{/if}

{include file='admin_footer.tpl'}