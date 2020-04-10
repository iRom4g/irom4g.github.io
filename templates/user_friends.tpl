{include file='header.tpl'}

<table class='tabs' cellpadding='0' cellspacing='0'>
<tr>
<td class='tab0'>&nbsp;</td>
<td class='tab1' NOWRAP><a href='user_friends.php'>{$user_friends1}</a></td>
<td class='tab'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='user_friends_requests.php'>{$user_friends2}</a></td>
<td class='tab'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='user_friends_requests_outgoing.php'>{$user_friends28}</a></td>
<td class='tab'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='user_friends_settings.php'>{$user_friends27}</a></td>
<td class='tab3'>&nbsp;</td>
</tr>
</table>

<img src='./images/icons/friends48.gif' border='0' class='icon_big'>
<div class='page_header'>{$user_friends3}</div>
<div>{$user_friends4}</div>

<br><br>

<table cellpadding='0' cellspacing='0' align='center'>
<tr>
<td class='friends_search'>
  <table cellpadding='0' cellspacing='0' align='center'>
  <tr>
  <td align='right'>{$user_friends6} &nbsp;</td>
  <td>
    <form action='user_friends.php' method='POST' name='searchform'>
    <input type='text' maxlength='100' size='30' class='text' id='search' name='search' value='{$search}' onkeyup="suggest('search', 'suggest', '{section name=friend_loop loop=$friends}{$friends[friend_loop]->user_info.user_username}{if $smarty.section.friend_loop.last != true},{/if}{/section}');" autocomplete='off'>&nbsp;
    <br><div id='suggest' class='suggest'></div>
  </td>
  <td>
    <input type='submit' class='button' value='{$user_friends7}'>
    <input type='hidden' name='s' value='{$s}'>
    <input type='hidden' name='p' value='{$p}'>
  </td>
  </tr>
  <tr>
  <td class='friends_sort' align='right'>{$user_friends8} &nbsp;</td>
  <td class='friends_sort'>
    <select name='s' class='small'>
    <option value='{$u}'{if $s == "ud"} SELECTED{/if}>{$user_friends9}</option>
    <option value='{$l}'{if $s == "ld"} SELECTED{/if}>{$user_friends10}</option>
    <option value='{$t}'{if $s == "t"} SELECTED{/if}>{$user_friends11}</option>
    </select>
    </form>
  </td>
  </tr>
  </table>
</td>
</tr>
</table>

{* SHOW MESSAGE IF USER HAS NO FRIENDS *}
{if $total_friends == 0 AND $search == ""}
  <br>
  <table cellpadding='0' cellspacing='0' align='center'>
  <tr><td class='result'>
    <img src='./images/icons/bulb16.gif' border='0' class='icon'>{$user_friends5}
  </td></tr>
  </table>
{/if}

{* DISPLAY MESSAGE IF NO FRIENDS *}
{if $total_friends == 0}

  {* DISPLAY MESSAGE IF NO SEARCHED FRIENDS *}
  {if $search != ""}
    <br>
    <table cellpadding='0' cellspacing='0' align='center'>
    <tr><td class='result'>
      <img src='./images/icons/bulb16.gif' border='0' class='icon'>{$user_friends12}
    </td></tr>
    </table>
  {/if}

{* DISPLAY FRIENDS *}
{else}

  {* DISPLAY PAGINATION MENU IF APPLICABLE *}
  {if $maxpage > 1}
    <br>
    <div class='center'>
    {if $p != 1}<a href='user_friends.php?s={$s}&search={$search}&p={math equation='p-1' p=$p}'>&#171; {$user_friends13}</a>{else}<font class='disabled'>&#171; {$user_friends13}</font>{/if}
    {if $p_start == $p_end}
      &nbsp;|&nbsp; {$user_friends14} {$p_start} {$user_friends16} {$total_friends} &nbsp;|&nbsp; 
    {else}
      &nbsp;|&nbsp; {$user_friends15} {$p_start}-{$p_end} {$user_friends16} {$total_friends} &nbsp;|&nbsp; 
    {/if}
    {if $p != $maxpage}<a href='user_friends.php?s={$s}&search={$search}&p={math equation='p+1' p=$p}'>{$user_friends17} &#187;</a>{else}<font class='disabled'>{$user_friends17} &#187;</font>{/if}
    </div>
  {/if}
  
  <br>
 
  {section name=friend_loop loop=$friends}
  {* LOOP THROUGH FRIENDS *}
    <div class='friends_result'>
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td class='friends_result0'><a href='{$url->url_create('profile',$friends[friend_loop]->user_info.user_username)}'><img src='{$friends[friend_loop]->user_photo('./images/nophoto.gif')}' class='photo' width='{$misc->photo_size($friends[friend_loop]->user_photo('./images/nophoto.gif'),'90','90','w')}' border='0' alt="{$friends[friend_loop]->user_info.user_username}{$user_friends18}"></a></td>
    <td class='friends_result1' width='100%' valign='top'>
      <div><font class='big'><a href='{$url->url_create('profile',$friends[friend_loop]->user_info.user_username)}'><img src='./images/icons/user16.gif' border='0' class='icon'></a><a href='{$url->url_create('profile',$friends[friend_loop]->user_info.user_username)}'>{$friends[friend_loop]->user_info.user_username}</a></font></div><br>
      <table cellpadding='0' cellspacing='0'>
      {if $friends[friend_loop]->user_info.user_dateupdated != ""}<tr><td>{$user_friends19} &nbsp;</td><td>{$datetime->time_since($friends[friend_loop]->user_info.user_dateupdated)}</td></tr>{/if}
      {if $friends[friend_loop]->user_info.user_lastlogindate != ""}<tr><td>{$user_friends20} &nbsp;</td><td>{$datetime->time_since($friends[friend_loop]->user_info.user_lastlogindate)}</td></tr>{/if}
      {if $show_details != 0}
        {if $friends[friend_loop]->friend_type != ""}<tr><td>{$user_friends21} &nbsp;</td><td>{$friends[friend_loop]->friend_type}</td></tr>{/if}
        {if $friends[friend_loop]->friend_explain != ""}<tr><td>{$user_friends22} &nbsp;</td><td>{$friends[friend_loop]->friend_explain}</td></tr>{/if}
      {/if}
      </table>
    </td>
    <td class='friends_result2' valign='top' nowrap='nowrap'>
    {if $show_details != 0}<a href='user_friends_confirm.php?user={$friends[friend_loop]->user_info.user_username}&task=edit'>{$user_friends23}</a><br>{/if}
    <a href='user_friends_confirm.php?user={$friends[friend_loop]->user_info.user_username}&task=remove'>{$user_friends24}</a><br>
    <a href='user_messages_new.php?to={$friends[friend_loop]->user_info.user_username}'>{$user_friends25}</a><br>
    <a href='profile_friends.php?user={$friends[friend_loop]->user_info.user_username}'>{$user_friends26}</a><br>
    </td>
    </tr>
    </table>
    </div>
  {/section}
  

  {* DISPLAY PAGINATION MENU IF APPLICABLE *}
  {if $maxpage > 1}
    <br>
    <div class='center'>
    {if $p != 1}<a href='user_friends.php?s={$s}&search={$search}&p={math equation='p-1' p=$p}'>&#171; {$user_friends13}</a>{else}<font class='disabled'>&#171; {$user_friends13}</font>{/if}
    {if $p_start == $p_end}
      &nbsp;|&nbsp; {$user_friends14} {$p_start} {$user_friends16} {$total_friends} &nbsp;|&nbsp; 
    {else}
      &nbsp;|&nbsp; {$user_friends15} {$p_start}-{$p_end} {$user_friends16} {$total_friends} &nbsp;|&nbsp; 
    {/if}
    {if $p != $maxpage}<a href='user_friends.php?s={$s}&search={$search}&p={math equation='p+1' p=$p}'>{$user_friends17} &#187;</a>{else}<font class='disabled'>{$user_friends17} &#187;</font>{/if}
    </div>
  {/if}

{/if}  

{include file='footer.tpl'}