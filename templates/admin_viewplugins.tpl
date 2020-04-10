{include file='admin_header.tpl'}

<h2>{$admin_viewplugins1}</h2>
{$admin_viewplugins2}

<br><br>

{if $plugins_ready|@count == 0 & $plugins_installed|@count == 0}
<table cellpadding='0' cellspacing='0'>
<tr>
<td class='result'>
  <img src='../images/icons/bulb16.gif' border='0' class='icon'>
  <b>{$admin_viewplugins3}</b>
</td>
</tr>
</table>
<br>
{/if}

{* LIST READY-TO-BE-INSTALLED PLUGINS *}
{section name=ready_loop loop=$plugins_ready}
  <table width='100%' cellpadding='0' cellspacing='0' class='stats' style='margin-bottom: 10px;'>
  <tr>
  <td class='plugin'>
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td><img src='../images/icons/{$plugins_ready[ready_loop].plugin_icon}' border='0' class='icon2'></td>
    <td class='plugin_name'>{$plugins_ready[ready_loop].plugin_name} v{$plugins_ready[ready_loop].plugin_version}</td>
    </tr>
    </table>
    <div style='margin-top: 5px;'>{$plugins_ready[ready_loop].plugin_desc}</div>
    <div style='margin-top: 7px;'>
      <a href='admin_viewplugins.php?install={$plugins_ready[ready_loop].plugin_type}'>{$admin_viewplugins4}</a>
    </div>
  </td>
  </tr>
</table>
{/section}

{* LIST INSTALLED PLUGINS *}
{section name=installed_loop loop=$plugins_installed}
  <table width='100%' cellpadding='0' cellspacing='0' class='stats' style='margin-bottom: 10px;'>
  <tr>
  <td class='plugin'>
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td><img src='../images/icons/{$plugins_installed[installed_loop].plugin_icon}' border='0' class='icon2'></td>
    <td class='plugin_name'>{$plugins_installed[installed_loop].plugin_name} v{$plugins_installed[installed_loop].plugin_version}</td>
    </tr>
    </table>
    <div style='margin-top: 5px;'>{$plugins_installed[installed_loop].plugin_desc}</div>
    {if $plugins_installed[installed_loop].plugin_version_ready != "" & $plugins_installed[installed_loop].plugin_version_ready <= $plugins_installed[installed_loop].plugin_version}
      <table width='100%' cellpadding='0' cellspacing='0' style='margin-top: 10px; margin-bottom: 3px;'>
      <tr>
      <td class='error'>
        <img src='../images/icons/error16.gif' border='0' class='icon'>
        {$admin_viewplugins5}{$plugins_installed[installed_loop].plugin_type}{$admin_viewplugins8}
      </td>
      </tr>
      </table>
    {/if}
    <div style='margin-top: 7px;'>
      {if $plugins_installed[installed_loop].plugin_version_ready > $plugins_installed[installed_loop].plugin_version}
        <a href='admin_viewplugins.php?install={$plugins_installed[installed_loop].plugin_type}'>{$admin_viewplugins6}</a> | 
      {elseif $plugins_installed[installed_loop].plugin_version_avail > $plugins_installed[installed_loop].plugin_version}
        <a href='#' target='_blank'>{$admin_viewplugins7}</a> | 
      {/if}
      {section name=page_loop loop=$plugins_installed[installed_loop].plugin_pages_main}
      <a href='{$plugins_installed[installed_loop].plugin_pages_main[page_loop].file}'>{$plugins_installed[installed_loop].plugin_pages_main[page_loop].title}</a>{if $smarty.section.page_loop.last != TRUE} | {/if}
      {/section}
    </div>
  </td>
  </tr>
  </table>
{/section}

{include file='admin_footer.tpl'}