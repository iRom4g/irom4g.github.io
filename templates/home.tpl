{include file='header.tpl'}

{* JAVASCRIPT FOR ROLLOVERS *}
{literal}
<script language="JavaScript">
<!-- 
  Rollimage0 = new Array()
  Rollimage1 = new Array()
  Rollimage0['join']= new Image(204,36);
  Rollimage0['join'].src = "./images/home_join.gif";
  Rollimage1['join'] = new Image(204,36);
  Rollimage1['join'].src = "./images/home_join2.gif";

  function SwapOut(imgname, imgsrc) {
    imgname.src = Rollimage1[imgsrc].src;
    return true;
  }
  function SwapBack(imgname, imgsrc) {
    imgname.src = Rollimage0[imgsrc].src; 
    return true;
  }
//-->
</script>
{/literal}

<table cellpadding='0' cellspacing='0' width='100%'>
<tr>
<td valign='top'>
  <img src='./images/world.gif' border='0'>
</td>
<td class='portal_text'>
  <b>{$home1}</b> {$home2}
  <br><br>
  <a href='signup.php'><img src='./images/home_join.gif' border='0' onmouseover="SwapOut(this, 'join')" onmouseout="SwapBack(this, 'join')" name='join'></a>
</td>
</tr>
</table>

<br>

<table cellpadding='0' cellspacing='0' width='100%'>
<tr>
<td valign='top' width='190'>
{* BEGIN LEFT COLUMN CONTENT *}

  {* SHOW LOGIN FORM IF USER IS NOT LOGGED IN *}
  {if $user->user_exists == 0}
    <table cellpadding='0' cellspacing='0' class='portal_table' width='100%'>
    <tr><td class='header'>{$home3}</td></tr>
    <tr>
    <td class='portal_box'>
      <form action='login.php' method='post'>
      <table cellpadding='0' cellspacing='0' align='center'>
      <tr><td>{$home4}<br><input type='text' class='text' name='email' size='25' maxlength='100' value='{$prev_email}'></td></tr>
      <tr><td style='padding-top: 6px;'>{$home5}<br><input type='password' class='text' name='password' size='25' maxlength='100'></td></tr>
      <tr><td style='padding-top: 6px;'><input type='checkbox' class='checkbox' name='persistent' value='1' id='rememberme'> <label for='rememberme'>{$home14}</label></td></tr>
      <tr>
        <td style='padding-top: 6px;'>
          <table cellpadding='0' cellspacing='0'>
          <tr>
          <td>
            <input type='submit' class='button' value='{$home6}'>&nbsp;
            <NOSCRIPT><input type='hidden' name='javascript_disabled' value='1'></NOSCRIPT>
            <input type='hidden' name='task' value='dologin'>
            <input type='hidden' name='ip' value='{$ip}'>
            </form>
          </td>
          <td>
            <form action='signup.php' method='post'>
            <input type='submit' class='button' value='{$home7}'>
            </form>
          </td>
          </tr>
          </table>
        </td>
      </tr>
      </table>
    </td>
    </tr>
    </table>

  {* SHOW HELLO MESSAGE IF USER IS LOGGED IN *}
  {else}
    <table cellpadding='0' cellspacing='0' class='portal_table' width='100%'>
    <tr>
    <td class='portal_login'>
      <a href='{$url->url_create('profile',$user->user_info.user_username)}'><img src='{$user->user_photo("./images/nophoto.gif")}' width='{$misc->photo_size($user->user_photo("./images/nophoto.gif"),'90','90','w')}' border='0' class='photo' alt="{$user->user_info.user_username}{$home8}"></a>
      <br>{$home9} {$user->user_info.user_username}!
      <br>[ <a href='user_logout.php'>{$home10}</a> ]
    </td>
    </tr>
    </table>
  {/if}

  {* SHOW NETWORK STATISTICS *}
  <table cellpadding='0' cellspacing='0' class='portal_table' width='100%'>
  <tr><td class='header'>{$home11}</td></tr>
  <tr>
  <td class='portal_box'>
    &#149; {$home12} {$total_members} {$home13}
    {if $setting.setting_connection_allow != 0}<br>&#149; {$home18} {$total_friends} {$home19}{/if}
    <br>&#149; {$home24} {$total_comments} {$home25}
  </td>
  </tr>
  </table>

</td>
<td valign='top' style='padding-left: 10px;'>
{* BEGIN RIGHT COLUMN CONTENT *}

  {* SHOW RECENT NEWS ANNOUNCEMENTS IF MORE THAN ZERO *}  
  {if $news_total > 0}
    <table cellpadding='0' cellspacing='0' class='portal_table' width='100%'>
    <tr><td class='header'>{$home26}</td></tr>
    <tr>
    <td class='portal_box'>
      {section name=news_loop loop=$news max=5}
        <table cellpadding='0' cellspacing='0'>
        <tr>
        <td valign='top'><img src='./images/icons/news16.gif' border='0' class='icon'></td>
        <td valign='top'><b>{$news[news_loop].item_subject}</b><br>{$news[news_loop].item_date}<br>{$news[news_loop].item_body}</td>
        </tr>
        </table>
        {if $smarty.section.news_loop.last == false}<br>{/if}
      {/section}
    </td>
    </tr>
    </table>
  {/if}

  {* SHOW ONLINE USERS IF MORE THAN ZERO *}
  {if $online_users|@count > 0}
    <table cellpadding='0' cellspacing='0' class='portal_table' align='center' width='100%'>
    <tr><td class='header'>{$home31} ({$online_users|@count})</td></tr>
    <tr>
    <td class='portal_box'>
      {section name=online_users_loop loop=$online_users max=20}{if $smarty.section.online_users_loop.rownum != 1}, {/if}<a href='{$url->url_create('profile',$online_users[online_users_loop])}'>{$online_users[online_users_loop]}</a>{/section}
    </td>
    </tr>
    </table>
  {/if}

  {* SHOW LAST SIGNUPS *}
  <table cellpadding='0' cellspacing='0' class='portal_table' align='center' width='100%'>
  <tr><td class='header'>{$home33}</td></tr>
  <tr>
  <td class='portal_box'>
    {if $signups|@count > 0}
      {section name=signups_loop loop=$signups max=5}
        {* START NEW ROW *}
        {cycle name="startrow" values="<table cellpadding='0' cellspacing='0' align='center'><tr>,,,,"}
        <td class='portal_member'><a href='{$url->url_create('profile',$signups[signups_loop]->user_info.user_username)}'>{$signups[signups_loop]->user_info.user_username|truncate:15:"...":true}<br><img src='{$signups[signups_loop]->user_photo('./images/nophoto.gif')}' class='photo' width='{$misc->photo_size($signups[signups_loop]->user_photo('./images/nophoto.gif'),'90','90','w')}' border='0'></a></td>
        {* END ROW AFTER 5 RESULTS *}
        {if $smarty.section.signups_loop.last == true}
          </tr></table>
        {else}
          {cycle name="endrow" values=",,,,</tr></table>"}
        {/if}
      {/section}
    {else}
      {$home34}
    {/if}
  </td>
  </tr>
  </table>


{* SHOW MOST POPULAR USERS (MOST FRIENDS) *}
{if $setting.setting_connection_allow != 0}
  <table cellpadding='0' cellspacing='0' class='portal_table' align='center' width='100%'>
  <tr><td class='header'>{$home35}</td></tr>
  <tr>
  <td class='portal_box'>
  {if $friends|@count > 0}
    {section name=friends_loop loop=$friends max=5}
      {* START NEW ROW *}
      {cycle name="startrow2" values="<table cellpadding='0' cellspacing='0' align='center'><tr>,,,,"}
      <td class='portal_member'><a href='{$url->url_create('profile',$friends[friends_loop].friend->user_info.user_username)}'>{$friends[friends_loop].friend->user_info.user_username|truncate:15}<br><img src='{$friends[friends_loop].friend->user_photo('./images/nophoto.gif')}' class='photo' width='{$misc->photo_size($friends[friends_loop].friend->user_photo('./images/nophoto.gif'),'90','90','w')}' border='0'></a><br>{$friends[friends_loop].total_friends} {$home36}</td>
      {* END ROW AFTER 5 RESULTS *}
      {if $smarty.section.friends_loop.last == true}
        </tr></table>
      {else}
        {cycle name="endrow2" values=",,,,</tr></table>"}
      {/if}
    {/section}
  {else}
    {$home37}
  {/if}
  </td>
  </tr>
  </table>
{/if}

{* SHOW LAST LOGINS *}
<table cellpadding='0' cellspacing='0' class='portal_table' align='center' width='100%'>
<tr><td class='header'>{$home38}</td></tr>
<tr>
<td class='portal_box'>
{if $logins|@count > 0}
  {section name=login_loop loop=$logins max=5}
    {* START NEW ROW *}
    {cycle name="startrow3" values="<table cellpadding='0' cellspacing='0' align='center'><tr>,,,,"}
    <td class='portal_member'><a href='{$url->url_create('profile',$logins[login_loop]->user_info.user_username)}'>{$logins[login_loop]->user_info.user_username}<br><img src='{$logins[login_loop]->user_photo('./images/nophoto.gif')}' class='photo' width='{$misc->photo_size($logins[login_loop]->user_photo('./images/nophoto.gif'),'90','90','w')}' border='0'></a></td>
    {* END ROW AFTER 5 RESULTS *}
    {if $smarty.section.login_loop.last == true}
      </tr></table>
    {else}
      {cycle name="endrow3" values=",,,,</tr></table>"}
    {/if}
  {/section}
{else}
  {$home39}
{/if}
</td>
</tr>
</table>

{* END RIGHT COLUMN *}
</td>
</tr>
</table>

{include file='footer.tpl'}