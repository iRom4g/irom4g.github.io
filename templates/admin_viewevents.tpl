{include file='admin_header.tpl'}

<h2>{$admin_viewevents1}</h2>
{$admin_viewevents2}

<br><br>

<table cellpadding='0' cellspacing='0' width='400' align='center'>
<tr>
<td align='center'>
<div class='box'>
<table cellpadding='0' cellspacing='0' align='center'>
<tr><form action='admin_viewevents.php' method='POST'>
<td>{$admin_viewevents3}<br><input type='text' class='text' name='f_title' value='{$f_title}' size='15' maxlength='100'>&nbsp;</td>
<td>{$admin_viewevents8}<br><input type='text' class='text' name='f_owner' value='{$f_owner}' size='15' maxlength='50'>&nbsp;</td>
<td><input type='submit' class='button' value='{$admin_viewevents5}'></td>
<input type='hidden' name='s' value='{$s}'>
</form>
</tr>
</table>
</div>
</td></tr></table>

<br>

{if $total_events == 0}

  <table cellpadding='0' cellspacing='0' width='400' align='center'>
  <tr>
  <td align='center'>
    <div class='box' style='width: 300px;'><b>{$admin_viewevents19}</b></div>
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

  <div class='pages'>{$total_events} {$admin_viewevents14} &nbsp;|&nbsp; {$admin_viewevents15} {section name=page_loop loop=$pages}{if $pages[page_loop].link == '1'}{$pages[page_loop].page}{else}<a href='admin_viewevents.php?s={$s}&p={$pages[page_loop].page}&f_title={$f_title}&f_owner={$f_owner}'>{$pages[page_loop].page}</a>{/if} {/section}</div>
  
  <form action='admin_viewevents.php' method='post' name='items'>
  <table cellpadding='0' cellspacing='0' class='list'>
  <tr>
  <td class='header' width='10'><input type='checkbox' name='select_all' onClick='javascript:doCheckAll()'></td>
  <td class='header' width='10' style='padding-left: 0px;'><a class='header' href='admin_viewevents.php?s={$i}&p={$p}&f_title={$f_title}&f_owner={$f_owner}'>{$admin_viewevents6}</a></td>
  <td class='header'><a class='header' href='admin_viewevents.php?s={$t}&p={$p}&f_title={$f_title}&f_owner={$f_owner}'>{$admin_viewevents3}</a></td>
  <td class='header'><a class='header' href='admin_viewevents.php?s={$o}&p={$p}&f_title={$f_title}&f_owner={$f_owner}'>{$admin_viewevents8}</a></td>
  <td class='header' width='150'><a class='header' href='admin_viewevents.php?s={$d}&p={$p}&f_title={$f_title}&f_owner={$f_owner}'>{$admin_viewevents10}</a></td>
  <td class='header' width='100'>{$admin_viewevents11}</td>
  </tr>
  {section name=event_loop loop=$events}
    <tr class='{cycle values="background1,background2"}'>
    <td class='item' style='padding-right: 0px;'><input type='checkbox' name='delete_event_{$events[event_loop].event->event_info.event_id}' value='1'></td>
    <td class='item' style='padding-left: 0px;'>{$events[event_loop].event->event_info.event_id}</td>
    <td class='item'>{$events[event_loop].event->event_info.event_title}</td>
    <td class='item'><a href='{$url->url_create('profile', $events[event_loop].event_creator->user_info.user_username)}' target='_blank'>{$events[event_loop].event_creator->user_info.user_username}</a></td>
    {assign var=event_date_start value=$datetime->timezone($events[event_loop].event->event_info.event_date_start, $global_timezone)}
    <td class='item'>{$datetime->cdate("`$setting.setting_dateformat` `$event51` `$setting.setting_timeformat`", $event_date_start)}</td>
    <td class='item'>[ <a href='admin_loginasuser.php?user_id={$events[event_loop].event->event_info.event_user_id}&url={$url->url_encode("`$url->url_base`event.php?event_id=`$events[event_loop].event->event_info.event_id`")}' target='_blank'>{$admin_viewevents12}</a> ] [ <a href='admin_viewevents.php?task=confirm&event_id={$events[event_loop].event->event_info.event_id}&s={$s}&p={$p}&f_title={$f_title}&f_owner={$f_owner}'>{$admin_viewevents13}</a> ]</td>
    </tr>
  {/section}
  </table>

  <table cellpadding='0' cellspacing='0' width='100%'>
  <tr>
  <td>
    <br>
    <input type='submit' class='button' value='{$admin_viewevents20}'>
    <input type='hidden' name='task' value='delete'>
    <input type='hidden' name='s' value='{$s}'>
    <input type='hidden' name='p' value='{$p}'>
    <input type='hidden' name='f_title' value='{$f_title}'>
    <input type='hidden' name='f_owner' value='{$f_owner}'>
    </form>
  </td>
  <td align='right' valign='top'>
    <div class='pages2'>{$total_events} {$admin_viewevents14} &nbsp;|&nbsp; {$admin_viewevents15} {section name=page_loop loop=$pages}{if $pages[page_loop].link == '1'}{$pages[page_loop].page}{else}<a href='admin_viewevents.php?s={$s}&p={$pages[page_loop].page}&f_title={$f_title}&f_owner={$f_owner}'>{$pages[page_loop].page}</a>{/if} {/section}</div>
  </td>
  </tr>
  </table>

{/if}

{include file='admin_footer.tpl'}