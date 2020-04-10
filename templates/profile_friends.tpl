{include file='header.tpl'}

<img src='./images/icons/search48.gif' border='0' class='icon_big'>
<div class='page_header'><a href='{$url->url_create('profile',$owner->user_info.user_username)}'>{$owner->user_info.user_username}</a>{$profile_friends1}</div>
<div>{$profile_friends2}<a href='{$url->url_create('profile',$owner->user_info.user_username)}'>{$owner->user_info.user_username}</a>{$profile_friends3}</div>

<br>

{* SHOW NO FRIENDS NOTICE IF NECESSARY *}
{if $total_friends == 0}
  <br>
  <table cellpadding='0' cellspacing='0'>
  <tr><td class='result'>
    <img src='./images/icons/bulb22.gif' border='0' class='icon'> <b><a href='{$url->url_create('profile',$owner->user_info.user_username)}'>{$owner->user_info.user_username}</a></b>{$profile_friends4}
  </td></tr></table>
{/if}

{* DISPLAY PAGINATION MENU IF APPLICABLE *}
{if $maxpage > 1}
  <br>
  <div class='center'>
  {if $p != 1}<a href='profile_friends.php?user={$owner->user_info.user_username}&s={$s}&p={math equation='p-1' p=$p}'>&#171; {$profile_friends5}</a>{else}<font class='disabled'>&#171; {$profile_friends5}</font>{/if}
  {if $p_start == $p_end}
    &nbsp;|&nbsp; {$profile_friends6} {$p_start} {$profile_friends7} {$total_friends} &nbsp;|&nbsp; 
  {else}
    &nbsp;|&nbsp; {$profile_friends6} {$p_start}-{$p_end} {$profile_friends7} {$total_friends} &nbsp;|&nbsp; 
  {/if}
  {if $p != $maxpage}<a href='profile_friends.php?user={$owner->user_info.user_username}&s={$s}&p={math equation='p+1' p=$p}'>{$profile_friends8} &#187;</a>{else}<font class='disabled'>{$profile_friends8} &#187;</font>{/if}
  </div>
{/if}
  
<br>

{* LIST FRIENDS *}
{section name=friend_loop loop=$friends}
  <div class='browse_friends_result'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td class='browse_friends_result0'>
    <div style='width: 90px; text-align: center;'>
    <a href='{$url->url_create('profile',$friends[friend_loop]->user_info.user_username)}'><img src='{$friends[friend_loop]->user_photo('./images/nophoto.gif')}' class='photo' width='{$misc->photo_size($friends[friend_loop]->user_photo('./images/nophoto.gif'),'90','90','w')}' border='0' alt="{$friends[friend_loop]->user_info.user_username}{$profile_friends9}"></a>
    </div>
  </td>
  <td class='browse_friends_result1' width='100%' valign='top'>
    <table cellpadding='0' cellspacing='0'>
    <tr><td width='100'>{$profile_friends15}</td><td><a href='{$url->url_create('profile',$friends[friend_loop]->user_info.user_username)}'><b>{$friends[friend_loop]->user_info.user_username}</b></a></td></tr>
    {if $friends[friend_loop]->user_info.user_dateupdated != "0"}<tr><td>{$profile_friends16}</td><td>{$datetime->time_since($friends[friend_loop]->user_info.user_dateupdated)}</td></tr>{/if}
    {if $friends[friend_loop]->user_info.user_lastlogindate != "0"}<tr><td>{$profile_friends17}</td><td>{$datetime->time_since($friends[friend_loop]->user_info.user_lastlogindate)}</td></tr>{/if}
    </table>
  </td>
  <td class='browse_friends_result2' valign='top' nowrap='nowrap' align='right'>
    <a href='{$url->url_create('profile',$friends[friend_loop]->user_info.user_username)}'>{$profile_friends10}</a>{if $user->level_info.level_message_allow != 0}<br><a href='user_messages_new.php?to={$friends[friend_loop]->user_info.user_username}'>{$profile_friends12}</a>{/if}
  </td>
  </tr>
  </table>
  </div>
{/section}
 
{* DISPLAY PAGINATION MENU IF APPLICABLE *}
{if $maxpage > 1}
  <br>
  <div class='center'>
  {if $p != 1}<a href='profile_friends.php?user={$owner->user_info.user_username}&s={$s}&p={math equation='p-1' p=$p}'>&#171; {$profile_friends5}</a>{else}<font class='disabled'>&#171; {$profile_friends5}</font>{/if}
  {if $p_start == $p_end}
    &nbsp;|&nbsp; {$profile_friends6} {$p_start} {$profile_friends7} {$total_friends} &nbsp;|&nbsp; 
  {else}
    &nbsp;|&nbsp; {$profile_friends6} {$p_start}-{$p_end} {$profile_friends7} {$total_friends} &nbsp;|&nbsp; 
  {/if}
  {if $p != $maxpage}<a href='profile_friends.php?user={$owner->user_info.user_username}&s={$s}&p={math equation='p+1' p=$p}'>{$profile_friends8} &#187;</a>{else}<font class='disabled'>{$profile_friends8} &#187;</font>{/if}
  </div>
{/if}

{include file='footer.tpl'}