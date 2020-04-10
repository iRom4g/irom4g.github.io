{include file='header.tpl'}
  <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1> Мои друзья</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">
 
    <div class="clearFix tBar">
     <ul class="tabs" id="friendTabs" style="width:550px;float:left;">
	  <li><a href="user_friends.php" style="width:5em">{$user_friends_requests1}</a></li>
        <li class="activeLink"><a href="user_friends_requests.php" style="width:11em">{$user_friends_requests2}</a></li>
        <li><a href="user_friends_requests_outgoing.php" style="width:10.5em">{$user_friends_requests19}</a></li>
        <li><a href="user_friends_settings.php" style="width:9em">{$user_friends_requests18}</a></li>
     </ul>
	<div id="progAjax" style="float:right;display:none;margin-top:5px;"><IMG SRC="images/upload.gif"/></div>
    </div>

  <div class="bar clearFix actionBar">
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