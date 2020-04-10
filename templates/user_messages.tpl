{include file='header.tpl'}

 <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1> Личные сообщения</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">

<div class="mailbox">
 
    <div class="clearFix tBar">
     <ul class="tabs">
      <li class="activeLink"><a href="user_messages.php" style="width:7em">{$user_messages1}</a></li>
      <li ><a href="user_messages_outbox.php" style="width:12em">{$user_messages2}</a></li>
      <li ><a href="user_messages_settings.php" style="width:11em">{$user_messages22}</a></li>
     </ul>
    </div>

 <div class="bar clearFix actionBar">
{$user_messages4} {if $user_unread_pms > 0}<b>{/if}{$user_unread_pms} {$user_messages5} {if $user_unread_pms > 0}</b>{/if}{$user_messages6}  
<div id="compose">
    <a href="user_messages_new.php">{$user_messages7}</a>
  </div>
 </div>
 <div class="bar clearFix summaryBar">

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
{* SHOW SUCCESS MESSAGE *}
{if $justsent == 1}
  <div id='message'>{$user_messages8}</div>
{/if}

</div>

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





{* CHECK IF THERE ARE NO MESSAGES IN INBOX *}
{if $total_pms == 0}

  <div class='center'>
  <table cellpadding='0' cellspacing='0'><tr>
  <td class='result'><img src='./images/icons/bulb16.gif' border='0' class='icon'>{$user_messages14}</td>
  </tr></table>
  </div>

{else}

  <form action='user_messages.php' method='post' name='messageform'>
  <table cellspacing="0" class="inbox">
  <tr>
   <th class="messageStatus"></th>
   <th class="messageChooser"><input type='checkbox' name='select_all' onClick='javascript:doCheckAll()'></th>
   <th class="messagePicture">&nbsp;</th>
   <th class="messageFrom">{$user_messages15}</th>
   <th class="messageSnippet">{$user_messages16}</th>
   <th class="messageActions">{$user_messages17}</th>
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
    <td class="messageStatus"></td>
    <td class='messageChooser' width='1'><input type='checkbox' name='message_{$pms[pm_loop].pm_id}' value='1'></td>
    <td class='messagePicture' width='1'><a href='{$url->url_create('profile', $pms[pm_loop].pm_user->user_info.user_username)}'><img src='{$pms[pm_loop].pm_user->user_photo('./images/nophoto.gif')}' border='0' class='photo' width='{$misc->photo_size($pms[pm_loop].pm_user->user_photo('./images/nophoto.gif'),'50','150','w')}' alt="{$pms[pm_loop].pm_user->user_info.user_username}{$user_messages18}"></a></td>
    <td class='messageFrom' width='130' nowrap='nowrap'>
      <b><a href='{$url->url_create('profile', $pms[pm_loop].pm_user->user_info.user_username)}'>{$pms[pm_loop].pm_user->user_info.user_username}</a></b>
      <div class='messages_date'>{$datetime->cdate("`$setting.setting_timeformat` `$setting.setting_dateformat`", $datetime->timezone($pms[pm_loop].pm_date, $global_timezone))}</div>
    </td>
    <td class='messageSnippet' width='100%'>
      <b><a href='user_messages_view.php?pm_id={$pms[pm_loop].pm_id}'>{$pms[pm_loop].pm_subject|truncate:50}</b>
      <br>{$pms[pm_loop].pm_body|truncate:100|choptext:40:"<br>"}</a>
    </td>
    <td class='messageActions' align='right'>
      <a href='user_messages_new.php?pm_id={$pms[pm_loop].pm_id}'>{$user_messages19}</a><br>
      <a href='user_messages_view.php?pm_id={$pms[pm_loop].pm_id}&task=delete'>{$user_messages20}</a>
    </td>
    </tr>
  {/section}
  </table>

  <br>

    <input type='hidden' name='task' value='deleteselected'>
    <input type='hidden' name='p' value='{$p}'>
  </form>
{* SHOW DELETE MESSAGES BUTTON *}
{if $total_pms != 0}
      <div style='height:30px; float:left; margin-right:0px'>

<ul class='nNav'>
<li style="margin-left:0px">
<b class="nc"><b class="nc1"><b></b></b><b class="nc2"><b></b></b></b>
<span class="ncc"><a href="javascript:document.messageform.submit()">{$user_messages21}</a></span>
<b class="nc"><b class="nc2"><b></b></b><b class="nc1"><b></b></b></b>
</li>
</ul>
      </div> {/if}      
{/if}
</div></div></div>
{include file='footer.tpl'}