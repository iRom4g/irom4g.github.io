{include file='header.tpl'}
  {* SHOW BIRTHDAYS *}

{* SHOW TODAY *}
{if $today_users != 0}
  <table cellpadding='0' cellspacing='0' class='portal_table' align='center' width='100%'>
  <tr><td class='header'>Сегодня день рождения</td></tr>
  <tr>
  <td class='portal_box'>
    {section name=today_users_loop loop=$today_users max=20}
      {* START NEW ROW *}
      {cycle name="startrow2" values="<table cellpadding='0' cellspacing='0' align='center'><tr>,,,,"}
      <td class='portal_member'>
    <a href='{$url->url_create('profile',$today_users[today_users_loop].user->user_info.user_username)}'>{$today_users[today_users_loop].user->user_info.user_username|truncate:15}<br>
    <img src='{$today_users[today_users_loop].user->user_photo('./images/nophoto.gif')}' class='photo' width='{$misc->photo_size($today_users[today_users_loop].user->user_photo('./images/nophoto.gif'),'90','90','w')}' border='0'></a></td>
     {* END ROW AFTER 7 RESULTS *}
      {if $smarty.section.today_users_loop.last == true}
        </tr></table>
      {else}
        {cycle name="endrow2" values=",,,,</tr></table>"}
      {/if}
    {/section}
  </td>
  </tr>
  </table>
{/if}


{* SHOW TOMORROW *}
{if $tomorrow_users != 0}
  <table cellpadding='0' cellspacing='0' class='portal_table' align='center' width='100%'>
  <tr><td class='header'>Завтра день рождения</td></tr>
  <tr>
  <td class='portal_box'>
    {section name=tomorrow_users_loop loop=$tomorrow_users max=20}
      {* START NEW ROW *}
      {cycle name="startrow3" values="<table cellpadding='0' cellspacing='0' align='center'><tr>,,,,"}
      <td class='portal_member'>
    <a href='{$url->url_create('profile',$tomorrow_users[tomorrow_users_loop].user->user_info.user_username)}'>{$tomorrow_users[tomorrow_users_loop].user->user_info.user_username|truncate:15}<br>
    <img src='{$tomorrow_users[tomorrow_users_loop].user->user_photo('./images/nophoto.gif')}' class='photo' width='{$misc->photo_size($tomorrow_users[tomorrow_users_loop].user->user_photo('./images/nophoto.gif'),'90','90','w')}' border='0'></a></td>
     {* END ROW AFTER 7 RESULTS *}
      {if $smarty.section.tomorrow_users_loop.last == true}
        </tr></table>
      {else}
        {cycle name="endrow3" values=",,,,</tr></table>"}
      {/if}
    {/section}
  </td>
  </tr>
  </table>
{/if}


{* SHOW WEEK *}
{if $week_users != 0}
  <table cellpadding='0' cellspacing='0' class='portal_table' align='center' width='100%'>
  <tr><td class='header'>День рождения на этой неделе</td></tr>
  <tr>
  <td class='portal_box'>
    {section name=week_users_loop loop=$week_users max=20}
      {* START NEW ROW *}
      {cycle name="startrow4" values="<table cellpadding='0' cellspacing='0' align='center'><tr>,,,,"}
      <td class='portal_member'>
    <a href='{$url->url_create('profile',$week_users[week_users_loop].user->user_info.user_username)}'>{$week_users[week_users_loop].user->user_info.user_username|truncate:15}<br>
    <img src='{$week_users[week_users_loop].user->user_photo('./images/nophoto.gif')}' class='photo' width='{$misc->photo_size($week_users[week_users_loop].user->user_photo('./images/nophoto.gif'),'90','90','w')}' border='0'></a><br>
    {$week_users[week_users_loop].date}
		</td>
     {* END ROW AFTER 7 RESULTS *}
      {if $smarty.section.week_users_loop.last == true}
        </tr></table>
      {else}
        {cycle name="endrow4" values=",,,,</tr></table>"}
      {/if}
    {/section}
  </td>
  </tr>
  </table>
{/if}


{* SHOW MONTH *}
{if $month_users != 0}
  <table cellpadding='0' cellspacing='0' class='portal_table' align='center' width='100%'>
  <tr><td class='header'>День рождения в этом месяце</td></tr>
  <tr>
  <td class='portal_box'>
    {section name=month_users_loop loop=$month_users max=20}
      {* START NEW ROW *}
      {cycle name="startrow5" values="<table cellpadding='0' cellspacing='0' align='center'><tr>,,,,,,"}
      <td class='portal_member'>
    <a href='{$url->url_create('profile',$month_users[month_users_loop].user->user_info.user_username)}'>{$month_users[month_users_loop].user->user_info.user_username|truncate:15}<br>
    <img src='{$month_users[month_users_loop].user->user_photo('./images/nophoto.gif')}' class='photo' width='{$misc->photo_size($month_users[month_users_loop].user->user_photo('./images/nophoto.gif'),'90','90','w')}' border='0'></a><br>
    {$month_users[month_users_loop].date}
		</td>
     {* END ROW AFTER 7 RESULTS *}
      {if $smarty.section.month_users_loop.last == true}
        </tr></table>
      {else}
        {cycle name="endrow5" values=",,,,,,</tr></table>"}
      {/if}
    {/section}
  </td>
  </tr>
  </table>
{/if}
{include file='footer.tpl'}