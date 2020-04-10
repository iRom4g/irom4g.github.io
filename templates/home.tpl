{assign var=homepage value="1"}
{include file='header.tpl'}

{* SHOW LOGIN FORM IF USER IS NOT LOGGED IN *}
  {if $user->user_exists == 0}
    <div id="sideBar">
    <div id="quickLogin">
      <form action='login.php' name="login" id="login" method='post'>
      {$home4}<br><input type='text' class='text' name='email' size='20' maxlength='100' value='{$prev_email}'>
      {$home5}<br><input type='password' class='text' name='password' size='20' maxlength='100'>
      <small><input style="margin-top:1px; vertical-align: middle;" type='checkbox' class='checkbox' name='persistent' value='1' id='rememberme'> запомнить меня</small>
      <NOSCRIPT><input type='hidden' name='javascript_disabled' value='1'></NOSCRIPT>
      <input type='hidden' name='task' value='dologin'>
      <input type='hidden' name='ip' value='{$ip}'>
      </form>
<div style="height:20px;margin-top:5px;">
<ul class='nNav' style="width:128px;padding:0px;margin:0px;"><li style="margin:0px 3px 0px 0px;">
<b class="nc"><b class="nc1"><b></b></b><b class="nc2"><b></b></b></b>
<span class="ncc"><a href="javascript:document.login.submit()">Вход</a></span>
<b class="nc"><b class="nc2"><b></b></b><b class="nc1"><b></b></b></b>
</li>
<li style="margin:0px">
<b class="nc"><b class="nc1"><b></b></b><b class="nc2"><b></b></b></b>
<span class="ncc"><a href="javascript:document.location='signup.php'">Регистрация</a></span>
<b class="nc"><b class="nc2"><b></b></b><b class="nc1"><b></b></b></b>
</li></ul>
</div>
    </div>
    </div>

  {* SHOW HELLO MESSAGE IF USER IS LOGGED IN *}
</td>
<td valign='top' style='padding-left: 10px;'>
{else}
 <div id="sideBar">
      <ol id='nav'>
    <li id='myprofile'><a href='{$url->url_create('profile', $user->user_info.user_username)}' class='hasedit'>Моя Страница</a><a href='user_editprofile.php' class='edit'>ред.</a></li>
    <li id='myfriends'>{if $total_friend_requests > 0}<a href='user_friends_requests.php'>Мои Друзья (<b>{$total_friend_requests}</b>){else}<a href='user_friends.php'>Мои Друзья{/if}</a></li>
    <li><a href='user_album.php'>Мои Фотографии</a></li>
    <li><a href='user_messages.php'>Мои Сообщения {if $user_unread_pms >0}(<b>{$user_unread_pms}</b>){/if}</a></li>
    <li><a href='user_blog.php'>Мои Заметки</a></li>
    <li><a href='user_group.php'>Мои Группы</a></li>
    <li><a href='user_event.php'>Мои Встречи</a></li>
    <li><a href='user_account.php'>Мои Настройки</a></li>
   </ol> </div>

  {/if}




{* BEGIN RIGHT COLUMN CONTENT *}
<div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1> Добро пожаловать</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">

<table cellpadding='0' cellspacing='0' width='100%'>
<tr>
<td class='portal_text'>
  <b>{$home1}</b>{$home2}<br><br>
  <br>  Нас уже <b>{$total_members}</b><br><br>
  <a href='signup.php'><h1>Присоединиться</h1></a>
</td>
</tr>
</table>




  {* SHOW ONLINE USERS IF MORE THAN ZERO *}
  {if $online_users|@count > 0}
   <div id="personal" class="flexOpen">
   <div class="bOpen">
    <div class="flexHeader clearFix" onclick="return collapseBox('personal', this, 0.90, 0.50)" onfocus="blur()">
     <div>
      <h2>{$home31} ({$online_users|@count})</h2>
     </div>
    </div>
   </div>
   <div class="c" >
    <div class="flexBox clearFix">
    {section name=online_users_loop loop=$online_users max=20}{if $smarty.section.online_users_loop.rownum != 1}, {/if}<a href='{$url->url_create('profile',$online_users[online_users_loop])}'>{$online_users[online_users_loop]}</a>{/section}
     </div>
    </div>
   </div>
  {/if}

  {* SHOW LAST SIGNUPS *}
  <div id="education" class="flexOpen">
   <div class="bOpen">
    <div class="flexHeader clearFix" onclick="return collapseBox('education', this, 0.90, 0.50)" onfocus="blur()">
     <div>
      <h2>{$home33}</h2>
     </div>
    </div>
   </div>
   <div class="c" >
    <div class="flexBox clearFix">
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
     </div>
    </div>
   </div>


{* SHOW MOST POPULAR USERS (MOST FRIENDS) *}
{if $setting.setting_connection_allow != 0}
  <div id="career" class="flexOpen">
   <div class="bOpen">
    <div class="flexHeader clearFix" onclick="return collapseBox('career', this, 0.90, 0.50)" onfocus="blur()">
     <div>
      <h2>{$home35}</h2>
     </div>
    </div>
   </div>
   <div class="c" >
    <div class="flexBox clearFix">
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
     </div>
    </div>
   </div>
{/if}

{* SHOW LAST LOGINS *}
<div id="places" class="flexOpen">
   <div class="bOpen">
    <div class="flexHeader clearFix" onclick="return collapseBox('places', this, 0.90, 0.50)" onfocus="blur()">
     <div>
      <h2>{$home38}</h2>
     </div>
    </div>
   </div>
   <div class="c" >
    <div class="flexBox clearFix">
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
     </div>
    </div>
   </div>

{* END RIGHT COLUMN *}
</td>
</tr>
</table>
</div></div></div>
{include file='footer.tpl'}