{include file='admin_header.tpl'}

<h2>{$admin_ads1}</h2>
{$admin_ads2}

<br><br>

<table cellpadding='0' cellspacing='0' width='100%'>
<tr>
<td>
  <form action='admin_ads_add.php' method='post'>
  <input type='submit' class='button' value='{$admin_ads3}'>&nbsp;
  </form>
</td>
{if $ads_total > 0}
  <td align='right'>
    <form action='admin_ads.php' method='post'>
    <input type='submit' class='button' value='{$admin_ads4}'>
    </form>
  </td>
{/if}
</tr>
</table>

<br>

<table cellpadding='0' cellspacing='0' class='list' width='100%'>
<tr>
<td class='header' width='10'><a class='header' href='admin_ads.php?s={$i}'>{$admin_ads5}</a>&nbsp;</td>
<td class='header' width='100%'><a class='header' href='admin_ads.php?s={$n}'>{$admin_ads6}</a>&nbsp;</td>
<td class='header' align='center'>{$admin_ads7}&nbsp;</td>
<td class='header' align='center' align='center'><a class='header' href='admin_ads.php?s={$v}'>{$admin_ads8}</a>&nbsp;</td>
<td class='header' align='center' align='center'><a class='header' href='admin_ads.php?s={$c}'>{$admin_ads9}</a>&nbsp;</td>
<td class='header' align='center' align='center'>{$admin_ads10}&nbsp;</td>
<td class='header' nowrap='nowrap' width='10'>{$admin_ads11}</td>
</tr>
  {section name='ad_loop' loop=$ads}
    {if $ads[ad_loop].ad_total_views == "" OR $ads[ad_loop].ad_total_views == 0}
      {assign var=ad_views value="<font style='color: #AAAAAA;'>---</font>"}
    {else}
      {assign var=ad_views value=$ads[ad_loop].ad_total_views}
    {/if}
    {if $ads[ad_loop].ad_total_clicks == "" OR $ads[ad_loop].ad_total_clicks == 0}
      {assign var=ad_clicks value="<font style='color: #AAAAAA;'>---</font>"}
    {else}
      {assign var=ad_clicks value=$ads[ad_loop].ad_total_clicks}
    {/if}
    {if $ads[ad_loop].ad_name == ""}
      {assign var='ad_name' value="<i>$admin_ads12</i>"}
    {else}
      {assign var='ad_name' value=$ads[ad_loop].ad_name}
    {/if}
    <tr class='{cycle values="background1,background2"}'>
    <td class='item'>{$ads[ad_loop].ad_id}&nbsp;</td>
    <td class='item'>{$ad_name}&nbsp;</td>
    <td class='item' nowrap='nowrap' align='center'>{$ads[ad_loop].ad_status}&nbsp;</td>
    <td class='item' align='center'>{$ad_views}&nbsp;</td>
    <td class='item' align='center'>{$ad_clicks}&nbsp;</td>
    <td class='item' align='center'>{$ads[ad_loop].ad_ctr}&nbsp;</td>
    <td class='item' nowrap='nowrap'>
      [ <a href='admin_ads_edit.php?ad_id={$ads[ad_loop].ad_id}'>{$admin_ads13}</a> ] 
      {if $ads[ad_loop].ad_paused == 0}
        [ <a href='admin_ads.php?task=pause&ad_id={$ads[ad_loop].ad_id}'>{$admin_ads14}</a> ] 
      {elseif $ads[ad_loop].ad_paused == 1}
        [ <a href='admin_ads.php?task=unpause&ad_id={$ads[ad_loop].ad_id}'>{$admin_ads15}</a> ] 
      {/if}
      [ <a href='admin_ads.php?task=confirm&ad_id={$ads[ad_loop].ad_id}'>{$admin_ads16}</a> ]
    </td>
  {/section}
  {if $ads_total == 0}
    <tr>
    <td colspan='6' class='stat2' align='center'>
      {$admin_ads17}
    </td>
    </tr>
  {/if}
</table>

</td>
</tr>
</table>


{include file='admin_footer.tpl'}