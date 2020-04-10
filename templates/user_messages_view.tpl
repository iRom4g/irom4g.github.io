{include file='header.tpl'}

<table class='tabs' cellpadding='0' cellspacing='0'>
<tr>
<td class='tab0'>&nbsp;</td>
<td class='{if $pm_inbox == 1}tab1{else}tab2{/if}' NOWRAP><a href='user_messages.php'>{$user_messages_view1}</a></td>
<td class='tab'>&nbsp;</td>
<td class='{if $pm_inbox == 1}tab2{else}tab1{/if}' NOWRAP><a href='user_messages_outbox.php'>{$user_messages_view2}</a></td>
<td class='tab'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='user_messages_settings.php'>{$user_messages_view11}</a></td>
<td class='tab3'>&nbsp;</td>
</tr>
</table>

<table cellpadding='0' cellspacing='0'>
<tr>
<td class='messages_view1'>
  <div class='messages_author'>
    <a href='{$url->url_create('profile',$pm_author->user_info.user_username)}'><img class='photo' src='{$pm_author->user_photo('./images/nophoto.gif')}' width='{$misc->photo_size($pm_author->user_photo('./images/nophoto.gif'),'90','90','w')}' border='0'>
    {$pm_author->user_info.user_username|truncate:10:"...":true}</a>
  </div>
</td>
<td class='messages_view2' width='100%'>
  <div class='messages_view2'>
    <div><b>{$pm_subject}</b></div>
    <div>{$user_messages_view3} <b><a href='{$url->url_create('profile', $pm_recepient->user_info.user_username)}'>{$pm_recepient->user_info.user_username}</a></b></div>
    <div class='messages_date'>{$datetime->cdate("`$setting.setting_timeformat` `$setting.setting_dateformat`", $datetime->timezone($pm_date, $global_timezone))}</div>
    <br>
    <div>{$pm_body|choptext:75:"<br>"}</div>
  </div>
</td>
</tr>
<tr>
<td>&nbsp;</td>
<td class='messages_view2'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td>
    <form action='{if $pm_inbox == 1}user_messages.php{else}user_messages_outbox.php{/if}' method='get'>
    <input type='submit' class='button' value='{$user_messages_view5}'>&nbsp;
    </form>
  </td>
  <td>
  {if $pm_inbox == 1}
    <form action='user_messages_new.php' method='get'>
    <input type='submit' class='button' value='{$user_messages_view6}'>&nbsp;
    <input type='hidden' name='pm_id' value='{$pm_id}'>
    </form>
  {else}
    &nbsp;
  {/if}
  </td>
  <td>
    <form action='user_messages_view.php' method='POST'>
    <input type='submit' class='button' value='{$user_messages_view7}'>
    <input type='hidden' name='pm_id' value='{$pm_id}'>
    <input type='hidden' name='task' value='delete'>
    </form>
  </td>
  </tr>
  </table>
</td>
</tr>
</table>

{* SHOW MESSAGE HISTORY *}
{if $convo_total > 0 }
  <br><br>
  <div class='messages_convo'>{$user_messages_view8}</div>
  {section name=convo_loop loop=$convo}
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td class='messages_view1'>
      <div class='messages_author'>
        <a href='{$url->url_create('profile',$convo[convo_loop].pm_author->user_info.user_username)}'><img class='photo' src='{$convo[convo_loop].pm_author->user_photo('./images/nophoto.gif')}' width='{$misc->photo_size($convo[convo_loop].pm_author->user_photo('./images/nophoto.gif'),'90','90','w')}' border='0'>
        {$convo[convo_loop].pm_author->user_info.user_username|truncate:10:"...":true}</a>
      </div>
    </td>
    <td class='messages_view2' width='100%'>
      <div class='messages_view2'>
        <div><b>{$convo[convo_loop].pm_subject}</b></div>
          <div class='messages_date'>{if $convo[convo_loop].pm_author->user_info.user_username == $user->user_info.user_username}{$user_messages_view9}{else}{$user_messages_view10}{/if}: {$datetime->cdate("`$setting.setting_timeformat` `$setting.setting_dateformat`", $datetime->timezone($convo[convo_loop].pm_date, $global_timezone))}</div>
        <br>
        <div>{$convo[convo_loop].pm_body|choptext:75:"<br>"}</div>
      </div>
    </td>
    </tr>
    </table>
  {/section}
{/if}

{include file='footer.tpl'}