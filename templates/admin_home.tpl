{include file='admin_header.tpl'}

<h2>{$admin_home1}</h2>
{$admin_home2}

<br><br>

{* SHOW INSTALL FILE EXISTS WARNING *}
{if $install_exists == 1}
<table width='100%' cellpadding='0' cellspacing='0' style='margin-bottom: 10px;'>
<tr>
<td class='error'>
  <img src='../images/icons/error16.gif' border='0' class='icon'>
  {$admin_home9}
</td>
</tr>
</table>
{/if}

{* SHOW LICENSE INFO *}
<table width='100%' cellpadding='0' cellspacing='0' class='stats'>
<tr>
<td class='stat0'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td><b>{$admin_home3}</b> {$setting.setting_key}</td>
  <td style='padding-left: 20px;'><b>{$admin_home4}</b> {$version_num}<br></td>
  {if $version_num < $versions.license}
    <td style='padding-left: 20px;'><img src='../images/icons/admin_upgrade16.gif' border='0' class='icon2'>{$admin_home10}<br></td>
  {/if}
  </tr>
  </table>
</td>
</tr>
</table>

{* SHOW QUICK STATS *}
<table width='100%' cellpadding='0' cellspacing='0' class='stats' style='margin-top: 10px;'>
<tr>
<td class='stat0'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td><b>{$admin_home5}</b> {$total_users_num}</td>
  <td style='padding-left: 60px;' align='right'><b>{$admin_home6}</b> {$total_comments_num}</td>
  <td style='padding-left: 60px;' align='right'><b>{$admin_home7}</b> {$total_messages_num}</td>
  <td style='padding-left: 60px;' align='right'><b>{$admin_home11}</b> {$total_user_levels}</td>
  </tr>
  <tr>
  <td><b>Subnetworks:</b> {$total_subnetworks}</td>
  <td style='padding-left: 60px;' align='right'><b>{$admin_home12}</b> {$total_reports}</td>
  <td style='padding-left: 60px;' align='right'><b>{$admin_home13}</b> {$total_friendships}</td>
  <td style='padding-left: 60px;' align='right'><b>{$admin_home14}</b> {$total_announcements}</td>
  </tr>
  <tr>
  <td><b>Views Today:</b> {$views_today}</td>
  <td style='padding-left: 60px;' align='right'><b>{$admin_home15}</b> {$signups_today}</td>
  <td style='padding-left: 60px;' align='right'><b>{$admin_home16}</b> {$logins_today}</td>
  <td style='padding-left: 60px;' align='right'><b>{$admin_home17}</b> {$total_admins}</td>
  </tr>
  </table>

  {* SHOW ONLINE USERS IF MORE THAN ZERO *}
  {if $online_users|@count > 0}
    <br><b>{$online_users|@count} {$admin_home8}</b> 
    {section name=online_users_loop loop=$online_users}{if $smarty.section.online_users_loop.rownum != 1}, {/if}<a href='{$url->url_create("profile", $online_users[online_users_loop])}' target='_blank'>{$online_users[online_users_loop]}</a>{/section}
  {/if}

</td>
</tr>
</table>

<br>

{$admin_home18}

<br>

<table cellpadding='0' cellspacing='0' style='margin-top: 5px;'>
<tr>
<td class='step'>{$admin_home19}</td>
<td><b><a href='admin_profile.php'>{$admin_home24}</a></b><br>{$admin_home25}</td>
</tr>
<tr>
<td class='step'>{$admin_home20}</td>
<td><b><a href='admin_signup.php'>{$admin_home26}</a></b><br>{$admin_home27}</td>
</tr>
<tr>
<td class='step'>{$admin_home21}</td>
<td><b><a href='admin_levels.php'>{$admin_home28}</a></b><br>{$admin_home29}</td>
</tr>
<tr>
<td class='step'>{$admin_home22}</td>
<td><b><a href='admin_viewplugins.php'>{$admin_home30}</a></b><br>{$admin_home31}</td>
</tr>
<tr>
<td class='step'>{$admin_home23}</td>
<td><b><a href='admin_templates.php'>{$admin_home32}</a></b><br>{$admin_home33}</td>
</tr>
</table>

{include file='admin_footer.tpl'}