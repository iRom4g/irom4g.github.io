{include file='admin_header.tpl'}

<h2>{$admin_log1}</h2>
{$admin_log2}

<br><br>

<table cellpadding='0' cellspacing='0' class='list'>
<tr>
<td class='header'>{$admin_log3}</td>
<td class='header'>{$admin_log5}</td>
<td class='header'>{$admin_log4}</td>
<td class='header'>{$admin_log6}</td>
<td class='header'>{$admin_log7} ({$admin_log8})</td>
</tr>
{section name=login_loop loop=$logins}
<tr class='{cycle values="background1,background2"}'>
<td class='item'>{$logins[login_loop].login_id}</td>
<td class='item'>{$datetime->cdate("g:i:s a, M. j", $datetime->timezone($logins[login_loop].login_date, $setting.setting_timezone))}</td>
<td class='item'><a href='mailto:{$logins[login_loop].login_email}'>{$logins[login_loop].login_email}</a>&nbsp;</td>
<td class='item'>
{if $logins[login_loop].login_result == 0}
  <font color='#FF0000'>{$admin_log10}</font>
{else}
  {$admin_log9}
{/if}
</td>
<td class='item'>{$logins[login_loop].login_ip} {$logins[login_loop].login_hostname}&nbsp;</td>
</tr>
{/section}
</table> 


{include file='admin_footer.tpl'}