{include file='header.tpl'}

<table class='tabs' cellpadding='0' cellspacing='0'>
<tr>
<td class='tab0'>&nbsp;</td>
<td class='tab1' NOWRAP><a href='user_messages.php'>{$user_messages1}</a></td>
<td class='tab'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='user_messages_outbox.php'>{$user_messages2}</a></td>
<td class='tab'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='user_messages_settings.php'>{$user_messages22}</a></td>
<td class='tab3'>&nbsp;</td>
</tr>
</table>

<table cellpadding='0' cellspacing='0'>
<tr>
<td class='messages_left'>
  <img src='./images/icons/messages48.gif' border='0' class='icon_big'>
  <div class='page_header'>{$user_messages3}</div>
  <div>{$user_messages4} {if $user_unread_pms > 0}<b>{/if}{$user_unread_pms} {$user_messages5} {if $user_unread_pms > 0}</b>{/if}{$user_messages6}</div>
</td>
<td class='messages_right'>
  <table cellpadding='0' cellspacing='0'>
  <tr><td class='button' nowrap='nowrap'>
    <a href='user_messages_new.php'><img src='./images/icons/sendmessage16.gif' border='0' class='icon'>{$user_messages7}</a>
  </td></tr></table>
</td>
</tr>
</table>

<br>

{* SHOW SUCCESS MESSAGE *}
{if $justsent == 1}
  <table cellpadding='0' cellspacing='0'>
  <tr><td class='success'>
    <img src='./images/success.gif' border='0' class='icon'>{$user_messages8}
  </td></tr></table>
  <br>
{/if}

{* JAVASCRIPT FOR CHECK ALL MESSAGES FEATURE *}
{literal}
  <script language='JavaScript'> 
  <!---
  var checkboxcount = 1;
  function doCheckAll() {
    if(checkboxcount == 0) {
      with (document.messageform) {
      for (var i=0; i < elements.length; i++) {
      if (elements[i].type == 'checkbox') {
      elements[i].checked = false;
      }}
      checkboxcount = checkboxcount + 1;
      }
    } else
      with (document.messageform) {
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


{* DISPLAY PAGINATION MENU IF APPLICABLE *}
{if $maxpage > 1}
  <div class='center'>
  {if $p != 1}<a href='user_messages.php?p={math equation='p-1' p=$p}'>&#171; {$user_messages9}</a>{else}<font class='disabled'>&#171; {$user_messages9}</font>{/if}
  {if $p_start == $p_end}
    &nbsp;|&nbsp; {$user_messages10} {$p_start} {$user_messages12} {$total_pms} &nbsp;|&nbsp; 
  {else}
    &nbsp;|&nbsp; {$user_messages11} {$p_start}-{$p_end} {$user_messages12} {$total_pms} &nbsp;|&nbsp; 
  {/if}
  {if $p != $maxpage}<a href='user_messages.php?p={math equation='p+1' p=$p}'>{$user_messages13} &#187;</a>{else}<font class='disabled'>{$user_messages13} &#187;</font>{/if}
  </div>
<br>
{/if}


{* CHECK IF THERE ARE NO MESSAGES IN INBOX *}
{if $total_pms == 0}

  <div class='center'>
  <table cellpadding='0' cellspacing='0'><tr>
  <td class='result'><img src='./images/icons/bulb16.gif' border='0' class='icon'>{$user_messages14}</td>
  </tr></table>
  </div>

{else}

  <form action='user_messages.php' method='post' name='messageform'>
  <table class='messages_table' cellpadding='0' cellspacing='0'>
  <tr>
  <td class='messages_header'><input type='checkbox' name='select_all' onClick='javascript:doCheckAll()'></td>
  <td class='messages_header'>&nbsp;</td>
  <td class='messages_header'>{$user_messages15}</td>
  <td class='messages_header'>{$user_messages16}</td>
  <td class='messages_header' width='80' align='right'>{$user_messages17}</td>
  </tr>
  {* LIST INBOX MESSAGES *}
  {section name=pm_loop loop=$pms}

    {* IF MESSAGE IS NEW, HIGHLIGHT ROW *}
    {if $pms[pm_loop].pm_status == 0}
      {assign var='row_class' value='messages_unread'}
    {else}
      {assign var='row_class' value='messages_read'}
    {/if}

    <tr class='{$row_class}'>
    <td class='messages_message' width='1'><input type='checkbox' name='message_{$pms[pm_loop].pm_id}' value='1'></td>
    <td class='messages_message' width='1'><a href='{$url->url_create('profile', $pms[pm_loop].pm_user->user_info.user_username)}'><img src='{$pms[pm_loop].pm_user->user_photo('./images/nophoto.gif')}' border='0' class='photo' width='{$misc->photo_size($pms[pm_loop].pm_user->user_photo('./images/nophoto.gif'),'90','90','w')}' alt="{$pms[pm_loop].pm_user->user_info.user_username}{$user_messages18}"></a></td>
    <td class='messages_message' width='130' nowrap='nowrap'>
      <b><a href='{$url->url_create('profile', $pms[pm_loop].pm_user->user_info.user_username)}'>{$pms[pm_loop].pm_user->user_info.user_username}</a></b>
      <div class='messages_date'>{$datetime->cdate("`$setting.setting_timeformat` `$setting.setting_dateformat`", $datetime->timezone($pms[pm_loop].pm_date, $global_timezone))}</div>
    </td>
    <td class='messages_message' width='100%'>
      <b><a href='user_messages_view.php?pm_id={$pms[pm_loop].pm_id}'>{$pms[pm_loop].pm_subject|truncate:50}</b>
      <br>{$pms[pm_loop].pm_body|truncate:100|choptext:75:"<br>"}</a>
    </td>
    <td class='messages_message' align='right'>
      <a href='user_messages_new.php?pm_id={$pms[pm_loop].pm_id}'>{$user_messages19}</a><br>
      <a href='user_messages_view.php?pm_id={$pms[pm_loop].pm_id}&task=delete'>{$user_messages20}</a>
    </td>
    </tr>
  {/section}
  </table>

  <br>

  {* SHOW DELETE MESSAGES BUTTON *}
  {if $total_pms != 0}
    <input type='submit' class='button' value='{$user_messages21}'>
    <input type='hidden' name='task' value='deleteselected'>
    <input type='hidden' name='p' value='{$p}'>
  {/if}

  </form>

{/if}

{include file='footer.tpl'}