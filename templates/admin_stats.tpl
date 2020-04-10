{include file='admin_header.tpl'}

<h2>{$admin_stats1}</h2>
{$admin_stats2}

<br><br>


<table cellpadding='0' cellspacing='0'>
<tr>
<td width='120' style='text-align: right; padding: 5px; vertical-align: top; line-height: 14pt;' nowrap='nowrap'>

<b>{$admin_stats10}</b><br>
{if $graph == "summary"}<b>{/if}<a href='admin_stats.php?graph=summary'>{$admin_stats11}</a></b><br>
{if $graph == "visits"}<b>{/if}<a href='admin_stats.php?graph=visits'>{$admin_stats12}</a></b><br>
{if $graph == "logins"}<b>{/if}<a href='admin_stats.php?graph=logins'>{$admin_stats13}</a></b><br>
{if $graph == "signups"}<b>{/if}<a href='admin_stats.php?graph=signups'>{$admin_stats14}</a></b><br>
{if $graph == "friends"}<b>{/if}<a href='admin_stats.php?graph=friends'>{$admin_stats15}</a></b><br>

<br>
<b>{$admin_stats16}</b><br>
{if $graph == "referrers"}<b>{/if}<a href='admin_stats.php?graph=referrers'>{$admin_stats17}</a></b><br>
{if $graph == "space"}<b>{/if}<a href='admin_stats.php?graph=space'>{$admin_stats18}</a></b><br>


</td>
<td style='padding: 5px; border: 1px dashed #CCCCCC; text-align: center;' width='550' height='420'>

  {* SHOW CHART *}
  {if $chart != ""}

    <br>
    <form action='admin_stats.php' method='get'>
    <table cellpadding='0' cellspacing='0' align='center'>
    <tr>
    <td style='padding-right: 20px;'><a href='admin_stats.php?period={$period}&graph={$graph}&start={math equation='p+1' p=$start}'><img src='../images/admin_arrowleft.gif' border='0' class='icon2'>{$admin_stats41}</a></td>
    <td>{$admin_stats19}&nbsp;</td>
    <td>
      <select name='period' class='text'>
      <option value='week'{if $period == "week"} SELECTED{/if}>{$admin_stats20}</option>
      <option value='month'{if $period == "month"} SELECTED{/if}>{$admin_stats21}</option>
      <option value='year'{if $period == "year"} SELECTED{/if}>{$admin_stats22}</option>
      </select>&nbsp;
    </td>
    <td>
      <input type='submit' class='button_small' value='{$admin_stats23}'>
    </td>
    <td style='padding-left: 20px;'><a href='admin_stats.php?period={$period}&graph={$graph}&start={math equation='p-1' p=$start}'>{$admin_stats42}<img src='../images/admin_arrowright.gif' border='0' class='icon' style='margin-left: 5px;'></a></td>
    </tr>
    </table>
    <input type='hidden' name='graph' value='{$graph}'>
    </form>
    <br>
    {$chart}

  {* SHOW REFERRING URLS *}
  {elseif $referrers != ""}

    <b>{$admin_stats24}</b><br>
    {$admin_stats25}

    {* IF THERE ARE ANY REFS *}
    {if $referrers_total > 0}
      [ <a href='admin_stats.php?graph=referrers&task=clearrefs'>{$admin_stats26}</a> ]
      <br><br>
      <table cellpadding='0' cellspacing='0' class='stats' style='border-top: none; margin: 10px;'>
      <tr>
      <td class='stat1'><b>{$admin_stats27}</b></td>
      <td class='stat2'><b>{$admin_stats28}</b></td>
      </tr>
      {section name=referrers_loop loop=$referrers}
        <tr>
        <td class='stat1' align='center'>{$referrers[referrers_loop].referrer_hits}</td>
        <td class='stat2'><a href='{$referrers[referrers_loop].referrer_url}' target='_blank'>{$referrers[referrers_loop].referrer_url|truncate:60:"...":true}</a></td>
        </tr>
      {/section}
      </table>
    {else}
    {* THERE ARE NO REFS, SHOW NOTICE *}
      <br><br><i>{$admin_stats29}</i>
    {/if}

  {* SHOW SPACE USED INFO *}
  {elseif $totalspace != ""}
    {$admin_stats30}
    <br><font class='large_gray'>{$media} MB</font>
    <br><br><font class='large_gray'>+</font>
    <br><br>
    {$admin_stats31}
    <br><font class='large_gray'>{$database} MB</font>
    <br><br><font class='large_gray'>=</font>
    <br><br>
    {$admin_stats32}
    <br><font class='large'>{$totalspace} MB</font>

  {* SHOW QUICK SUMMARY *}
  {else}

    <b>{$admin_stats33}</b><br>
    {$admin_stats34}
    <br><br>

    <table cellpadding='0' cellspacing='0' align='center'>
    <tr>
    <td align='right'>{$admin_stats35} &nbsp;</td>
    <td>{$total_users_num} {$admin_stats38}</td>
    </tr>
    <tr>
    <td align='right'>{$admin_stats36} &nbsp;</td>
    <td>{$total_messages_num} {$admin_stats39}</td>
    </tr>
    <tr>
    <td align='right'>{$admin_stats37} &nbsp;</td>
    <td>{$total_comments_num} {$admin_stats40}</td>
    </tr>
    </table>

  {/if}

</td>
</tr>
</table>

{* AUTO-ACTIVATE FLASH OBJECTS IN IE *}
<script type="text/javascript" src="../include/js/activate_flash.js"></script>

{include file='admin_footer.tpl'}