{include file='admin_header.tpl'}

<h2>{$admin_profile1}</h2>
{$admin_profile2} 

<br><br>

<table cellpadding='0' cellspacing='0'>
<tr>
<form action='admin_profile_addtab.php' method='POST'>
<td><input type='submit' class='button' value='{$admin_profile3}'>&nbsp;</td>
<input type='hidden' name='o' value='{$o_url}'>
</form>
<form action='admin_profile_addfield.php' method='POST'>
<td><input type='submit' class='button' value='{$admin_profile4}'></td>
<input type='hidden' name='o' value='{$o_url}'>
</form>
</tr>
</table>

<br>

{if $num_tabs != "0"}
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td><img src='../images/tab_top.gif' border='0'></td>
  <td style='padding-left: 3px;'>&nbsp;<a href='admin_profile_taborder.php?o={$o_url}'>{$admin_profile5}</a>
    - <a href='admin_profile.php?o={$all}'>[{$admin_profile8}]</a> - <a href='admin_profile.php'>[{$admin_profile7}]</a>
  </td></tr>
  </table>
{else}
  {$admin_profile6}
{/if}

{* LOOP THROUGH TABS *}
{section name=tab_loop loop=$tabs}
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td><a href='admin_profile.php?o={$tabs[tab_loop].tab_o}'><img src='../images/tab_{$tabs[tab_loop].tab_status}.gif' border='0'></a></td>
  <td style='padding-top: 4px; padding-left: 3px;'>&nbsp;<a href='admin_profile_edittab.php?tab_id={$tabs[tab_loop].tab_id}&o={$o_url}'>{$tabs[tab_loop].tab_name}</a></td>
  </tr>
  </table>
  {* LOOP THROUGH FIELDS *}
  {section name=field_loop loop=$tabs[tab_loop].tab_fields}
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td><img src='../images/space_left{$tabs[tab_loop].tab_order}.gif' border='0'></td>
    <td><img src='../images/field{$tabs[tab_loop].tab_fields[field_loop].field_order}.gif' border='0'></td>
    <td style='padding-top: 4px; padding-left: 3px;'>&nbsp;<a href='admin_profile_editfield.php?field_id={$tabs[tab_loop].tab_fields[field_loop].field_id}&o={$o_url}'>{$tabs[tab_loop].tab_fields[field_loop].field_title}</a>{if $tabs[tab_loop].tab_fields[field_loop].field_birthday == 1} {$admin_profile10}{/if}</td>
    </tr>
    </table>
  {* LOOP THROUGH DEPENDENT FIELDS *}
    {section name=dep_field_loop loop=$tabs[tab_loop].tab_fields[field_loop].dep_fields}
      <table cellpadding='0' cellspacing='0'>
      <tr>
      <td><img src='../images/space_left{$tabs[tab_loop].tab_order}.gif' border='0'></td>
      <td><img src='../images/space_left{$tabs[tab_loop].tab_fields[field_loop].field_order}.gif' border='0'></td>
      <td><img src='../images/field_dep{$tabs[tab_loop].tab_fields[field_loop].dep_fields[dep_field_loop].dep_field_order}.gif' border='0'></td>
      <td style='padding-top: 4px; padding-left: 3px;'>&nbsp;{$tabs[tab_loop].tab_fields[field_loop].dep_fields[dep_field_loop].option_label} <a href='admin_profile_editdepfield.php?field_id={$tabs[tab_loop].tab_fields[field_loop].dep_fields[dep_field_loop].dep_field_id}&o={$o_url}'>{if $tabs[tab_loop].tab_fields[field_loop].dep_fields[dep_field_loop].dep_field_title != ""}{$tabs[tab_loop].tab_fields[field_loop].dep_fields[dep_field_loop].dep_field_title}{else}{$admin_profile9}{/if}</a></td>
      </tr>
      </table>
    {/section}
  {/section}
{/section}
</table>

{include file='admin_footer.tpl'}