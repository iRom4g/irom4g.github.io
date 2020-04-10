{include file='admin_header.tpl'}



{* SHOW MAIN PAGE *}
{if $task == "main"}
  <h2>{$admin_announcements1}</h2>
  {$admin_announcements2}
  <br><br>
  <b><a href='admin_announcements.php?task=post&type=email'>{$admin_announcements3}</a></b>
  <br>{$admin_announcements4}
  <br><br>
  <b><a href='admin_announcements.php?task=post&type=news'>{$admin_announcements5}</a></b>
  <br>{$admin_announcements6}

  <br><br>

  {* LIST PAST ANNOUNCEMENTS *}
  {if $news_total > 0}
    <table cellpadding='0' cellspacing='0' class='list'>
    <tr>
    <td class='header' width='10'>{$admin_announcements7}</td>
    <td class='header' width='80%'>{$admin_announcements8}</td>
    <td class='header' width='50'>{$admin_announcements9}</td>
    </tr>
    {section name=news_loop loop=$news}
      <tr class='{cycle values="background1,background2"}'>
      <td class='item' valign='top'>{$news[news_loop].item_id}</td>
      <td class='item'>
        <div><b>{if $news[news_loop].item_subject != ""}{$news[news_loop].item_subject|truncate:50:"...":true}{else}<i>{$admin_announcements10}</i>{/if}</b></div>
        <div>{if $news[news_loop].item_date != ""}{$news[news_loop].item_date}{else}<i>{$admin_announcements11}</i>{/if}</div>
        <br><div>{$news[news_loop].item_body|truncate:300:"...":true}</div>
      </td>
      <td class='item' valign='top' nowrap='nowrap' align='right'>
        [ <a href='admin_announcements.php?task=post&type=news&announcement_id={$news[news_loop].item_id}'>{$admin_announcements12}</a> ]
        {if $smarty.section.news_loop.last != true}<br>[ <a href='admin_announcements.php?task=moveup&type=news&announcement_id={$news[news_loop].item_id}'>{$admin_announcements13}</a> ]{/if}
        <br>[ <a href='admin_announcements.php?task=dodelete&type=news&announcement_id={$news[news_loop].item_id}'>{$admin_announcements14}</a> ]
      </td>
      </tr>
    {/section}
    </table>
  {/if}
{/if}




{* POST NEWS ITEM *}
{if $task == "post" AND $type == "news"}
  <h2>{$admin_announcements15}</h2>
  {$admin_announcements16}
  <br><br>
  <form action='admin_announcements.php' method='post'>
  <b>{$admin_announcements17}</b>
  <br><input type='text' name='date' size='50' class='text' maxlength='200' value='{$item_date}'>
  <br>{$admin_announcements18}
  <br><br>
  <b>{$admin_announcements19}</b>
  <br><input type='text' name='subject' size='50' class='text' maxlength='200' value='{$item_subject}'>
  <br><br>
  <b>{$admin_announcements8}</b> {$admin_announcements20}
  <br><textarea name='body' class='text' rows='7' cols='80'>{$item_body}</textarea>
  <br><br>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td>
    <input type='submit' class='button' value='{$admin_announcements21}'>&nbsp;
    <input type='hidden' name='task' value='dopost'>
    <input type='hidden' name='type' value='news'>
    <input type='hidden' name='announcement_id' value='{$announcement_id}'>
    </form>
  </td>
  <td>
    <form action='admin_announcements.php' method='post'>
    <input type='submit' class='button' value='{$admin_announcements22}'>
    </form>
  </td>
  </tr>
  </table>
{/if}




{* COMPOSE EMAIL ANNOUNCEMENT *}
{if $task == "post" AND $type == "email"}
  <h2>{$admin_announcements3}</h2>
  {$admin_announcements23}
  <br><br>

  {if $is_error == 1}
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td class='error'><img src='../images/error.gif' border='0' class='icon2'>{$error_msg}</td>
    </tr>
    </table>
    <br>
  {/if}

  <table cellpadding='5' cellspacing='0'>
  <form action='admin_announcements.php' method='POST'>
  <tr>
  <td align='right'><b>{$admin_announcements24}</b></td>
  <td><input type='text' class='text' name='from' size='40' value='{$em_from}'></td>
  </tr>
  <tr>
  <td align='right'><b>{$admin_announcements19}</b></td>
  <td><input type='text' class='text' name='subject' size='40' value='{$em_sub}'></td>
  </tr>
  <tr>
  <td align='right' valign='top'><b>{$admin_announcements8}</b></td>
  <td><textarea name='message' class='text' rows='8' cols='80'>{$em_mess}</textarea></td>
  </tr>
  <tr>
  <td align='right' nowrap='nowrap'><b>{$admin_announcements25}</b></td>
  <td nowrap='nowrap'>
  <select class='text' name='emails_at_a_time'>
  <option value='1'{if $emails_at_a_time == 1} selected='selected'{/if}>1 {$admin_announcements35}</option>
  <option value='2'{if $emails_at_a_time == 2} selected='selected'{/if}>2 {$admin_announcements26}</option>
  <option value='3'{if $emails_at_a_time == 3} selected='selected'{/if}>3 {$admin_announcements26}</option>
  <option value='4'{if $emails_at_a_time == 4} selected='selected'{/if}>4 {$admin_announcements26}</option>
  <option value='5'{if $emails_at_a_time == 5} selected='selected'{/if}>5 {$admin_announcements26}</option>
  </select>
  <div>
  </td>
  </tr>

  {* DETERMINE HOW MANY LEVELS AND SUBNETS TO SHOW BEFORE ADDING SCROLLBARS *}
  {assign var='subnets_total' value=$subnets_total+1}
  {if $levels_total > 10 OR $subnets_total > 10}
    {assign var='options_to_show' value='10'}
  {elseif $levels_total > $subnets_total}
    {assign var='options_to_show' value=$levels_total}
  {elseif $levels_total < $subnets_total}
    {assign var='options_to_show' value=$subnets_total}
  {elseif $levels_total == $subnets_total}
    {assign var='options_to_show' value=$levels_total}
  {/if}

  <tr>
  <td align='right' valign='top'><b>{$admin_announcements38}</b></td>
  <td valign='top'>
    {$admin_announcements39}
    <br><br>
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td>{$admin_announcements40}</td>
    <td style='padding-left: 10px;'>{$admin_announcements41}</td>
    </tr>
    <tr>
    <td>
      <select size='{$options_to_show}' class='text' name='levels[]' multiple='multiple' style='width: 300px;'>
      {section name=level_loop loop=$levels}
        <option value='{$levels[level_loop].level_id}'{if $levels[level_loop].level_selected == 1} selected='selected'{/if}>{$levels[level_loop].level_name|truncate:75:"...":true}{if $levels[level_loop].level_default == 1} {$admin_announcements42}{/if}</option>
      {/section}
      </select>
    </td>
    <td style='padding-left: 10px;'>
      <select size='{$options_to_show}' class='text' name='subnets[]' multiple='multiple' style='width: 300px;'>
      {section name=subnet_loop loop=$subnets}
        <option value='{$subnets[subnet_loop].subnet_id}'{if $subnets[subnet_loop].subnet_selected == 1} selected='selected'{/if}>{$subnets[subnet_loop].subnet_name|truncate:75:"...":true}</option>
      {/section}
      </select>
    </td>
    </tr>
    </table>
  </td>
  </tr>
  <tr>
  <td>&nbsp;</td>
  <td>
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td>
      <input type='submit' class='button' value='{$admin_announcements27}'>&nbsp;
      <input type='hidden' name='task' value='dosend'>
      <input type='hidden' name='type' value='email'>
      </form>
    </td>
    <td>
      <form action='admin_announcements.php' method='post'>
      <input type='submit' class='button' value='{$admin_announcements22}'>
      </form>
    </td>
    </tr>
    </table>
  </td>
  </tr>
  </table>
{/if}




{* SEND ANNOUNCEMENTS *}
{if $task == "dosend" AND $type == "email"}
  {if $totalinset < $emails_at_a_time}

    <h2>{$admin_announcements28}</h2>
    {$admin_announcements29}
    <br><br>
    <form action='admin_announcements.php' method='post'>
    <input type='submit' class='button' value='{$admin_announcements30}'>
    </form>

  {else}

    {assign var=startnum value=$start1-1}
    {assign var=finishnum value=$finish1-1}

    <h2>{$admin_announcements31}</h2>
    {$admin_announcements32} <b>#{$startnum} - #{$finishnum} {$admin_announcements43} {$total}</b><br>
    {$admin_announcements33}
    <br><br>
    <form action='admin_announcements.php' name='nextset' method='POST'>
    <input type='submit' class='button' value='{$admin_announcements34}'>
    <input type='hidden' name='start' value='{$finish}'>
    <input type='hidden' name='from' value='{$em_from}'>
    <input type='hidden' name='subject' value='{$em_sub}'>
    <input type='hidden' name='message' value='{$em_mess}'>
    <input type='hidden' name='levels' value='{$levels}'>
    <input type='hidden' name='subnets' value='{$subnets}'>
    <input type='hidden' name='emails_at_a_time' value='{$emails_at_a_time}'>
    <input type='hidden' name='task' value='dosend'>
    <input type='hidden' name='type' value='email'>
    <input type='hidden' name='total' value='{$total}'>
    </form>

    <script language="JavaScript">
    {literal}
    <!--
    function SymError() { return true; }
    window.onerror = SymError;
    var SymRealWinOpen = window.open;
    function SymWinOpen(url, name, attributes) { return (new Object()); }
    window.open = SymWinOpen;
    appendEvent = function(el, evname, func) {
     if (el.attachEvent) { // IE
       el.attachEvent('on' + evname, func);
     } else if (el.addEventListener) { // Gecko / W3C
       el.addEventListener(evname, func, true);
     } else {
       el['on' + evname] = func;
     }
    };
    appendEvent(window, 'load', windowonload);
    function windowonload() { 
      setTimeout("document.nextset.submit()", 3000);
    } 
    {/literal}
    // -->
    </script>

  {/if}

{/if}



{include file='admin_footer.tpl'}