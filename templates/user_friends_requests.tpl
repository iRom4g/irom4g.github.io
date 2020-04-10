{include file='header.tpl'}

<table class='tabs' cellpadding='0' cellspacing='0'>
<tr>
<td class='tab0'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='user_friends.php'>{$user_friends_requests1}</a></td>
<td class='tab'>&nbsp;</td>
<td class='tab1' NOWRAP><a href='user_friends_requests.php'>{$user_friends_requests2}</a></td>
<td class='tab'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='user_friends_requests_outgoing.php'>{$user_friends_requests19}</a></td>
<td class='tab'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='user_friends_settings.php'>{$user_friends_requests18}</a></td>
<td class='tab3'>&nbsp;</td>
</tr>
</table>

<img src='./images/icons/friends48.gif' border='0' class='icon_big'>
<div class='page_header'>{$user_friends_requests3}</div>
<div>{$user_friends_requests4}</div>

<br><br>

{* DISPLAY MESSAGE IF NO FRIEND REQUESTS *}
{if $total_friends == 0}

  <table cellpadding='0' cellspacing='0' align='center'>
  <tr><td class='result'><img src='./images/icons/bulb16.gif' border='0' class='icon'>{$user_friends_requests5}</td></tr>
  </table>

{* DISPLAY FRIEND REQUESTS *}
{else}

  {* DISPLAY PAGINATION MENU IF APPLICABLE *}
  {if $maxpage > 1}
    <br>
    <div class='center'>
    {if $p != 1}<a href='user_friends_requests.php?p={math equation='p-1' p=$p}'>&#171; {$user_friends_requests13}</a>{else}<font class='disabled'>&#171; {$user_friends_requests13}</font>{/if}
    {if $p_start == $p_end}
      &nbsp;|&nbsp; {$user_friends_requests14} {$p_start} {$user_friends_requests16} {$total_friends} &nbsp;|&nbsp; 
    {else}
      &nbsp;|&nbsp; {$user_friends_requests15} {$p_start}-{$p_end} {$user_friends_requests16} {$total_friends} &nbsp;|&nbsp; 
    {/if}
    {if $p != $maxpage}<a href='user_friends_requests.php?p={math equation='p+1' p=$p}'>{$user_friends_requests17} &#187;</a>{else}<font class='disabled'>{$user_friends_requests17} &#187;</font>{/if}
    </div>
  {/if}

  {section name=friend_loop loop=$friends}
  {* LOOP THROUGH FRIENDS *}
    <div class='friends_result'>
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td class='friends_result0'><a href='{$url->url_create('profile', $friends[friend_loop]->user_info.user_username)}'><img src='{$friends[friend_loop]->user_photo('./images/nophoto.gif')}' class='photo' width='{$misc->photo_size($friends[friend_loop]->user_photo('./images/nophoto.gif'),'90','90','w')}' border='0' alt="{$friends[friend_loop]->user_info.user_username}{$user_friends_requests6}"></a></td>
    <td class='friends_result1' width='100%'>
      <div><font class='big'><a href='{$url->url_create('profile', $friends[friend_loop]->user_info.user_username)}'><img src='./images/icons/user16.gif' border='0' class='icon'>{$friends[friend_loop]->user_info.user_username}</a></div></font><br>
      <table cellpadding='0' cellspacing='0'>
      <tr><td>{$user_friends_requests6}</td><td>{$datetime->time_since($friends[friend_loop]->user_info.user_dateupdated)}</td></tr>
      <tr><td width='80'>{$user_friends_requests7}</td><td>{$datetime->time_since($friends[friend_loop]->user_info.user_lastlogindate)}</td></tr>
      {if $friends[friend_loop]->friend_type != ""}<tr><td>{$user_friends_requests8}</td><td>{$friends[friend_loop]->friend_type}</td></tr>{/if}
      {if $friends[friend_loop]->friend_explain != ""}<tr><td>{$user_friends_requests9}</td><td>{$friends[friend_loop]->friend_explain}</td></tr>{/if}
      </table>
    </td>
    <td class='friends_result2' NOWRAP>
    <a href='user_friends_confirm.php?user={$friends[friend_loop]->user_info.user_username}&task=confirm'>{$user_friends_requests10}</a><br>
    <a href='user_friends_confirm.php?user={$friends[friend_loop]->user_info.user_username}&task=reject'>{$user_friends_requests11}</a><br>
    {if $user->level_info.level_message_allow == 2}<a href='user_messages_new.php?to={$friends[friend_loop]->user_info.user_username}'>{$user_friends_requests12}</a><br>{/if}
    </td>
    </tr>
    </table>
    </div>
  {/section}

  {* DISPLAY PAGINATION MENU IF APPLICABLE *}
  {if $maxpage > 1}
    <br>
    <div class='center'>
    {if $p != 1}<a href='user_friends_requests.php?p={math equation='p-1' p=$p}'>&#171; {$user_friends_requests13}</a>{else}<font class='disabled'>&#171; {$user_friends_requests13}</font>{/if}
    {if $p_start == $p_end}
      &nbsp;|&nbsp; {$user_friends_requests14} {$p_start} {$user_friends_requests16} {$total_friends} &nbsp;|&nbsp; 
    {else}
      &nbsp;|&nbsp; {$user_friends_requests15} {$p_start}-{$p_end} {$user_friends_requests16} {$total_friends} &nbsp;|&nbsp; 
    {/if}
    {if $p != $maxpage}<a href='user_friends_requests.php?p={math equation='p+1' p=$p}'>{$user_friends_requests17} &#187;</a>{else}<font class='disabled'>{$user_friends_requests17} &#187;</font>{/if}
    </div>
  {/if}
  
{/if}  

{include file='footer.tpl'}