{include file='admin_header.tpl'}

<h2>{$admin_url1}</h2>
{$admin_url2}
<br><br>

{if $result != 0}
<div class='success'><img src='../images/success.gif' class='icon' border='0'> {$admin_url8}</div>
{/if}

<table cellpadding='0' cellspacing='0' width='600'>
<form action='admin_url.php' method='POST'>
<tr><td class='header'>{$admin_url9}</td></tr>
<tr>
<td class='setting1'>
{$admin_url3}
<br><br>
{$admin_url10}
<br>
{section name=url_loop loop=$urls}
{$urls[url_loop].url_title}: {$urls[url_loop].url_regular}<br>
{/section}
<br>
{$admin_url11}
<br>
{section name=url_loop loop=$urls}
{$urls[url_loop].url_title}: {$urls[url_loop].url_subdirectory}<br>
{/section}
</td></tr><tr><td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr><td><input type='radio' name='setting_url' id='setting_url_0' value='0'{if $setting_url == 0} CHECKED{/if}>&nbsp;</td><td><label for='setting_url_0'>{$admin_url4}</label></td></tr>
  <tr><td><input type='radio' name='setting_url' id='setting_url_1' value='1'{if $setting_url == 1} CHECKED{/if}>&nbsp;</td><td><label for='setting_url_1'>{$admin_url5}</label>{if $setting_url == 1}{$admin_url7}{/if}</td></tr>
  </table>
</td></tr></table>
<br>

<input type='submit' class='button' value='{$admin_url6}'>
<input type='hidden' name='task' value='dosave'>
</form>

{include file='admin_footer.tpl'}