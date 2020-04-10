{include file='header.tpl'}

  <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1> Мои встречи</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">

    <div class="clearFix tBar">
     <ul class="tabs" id="friendTabs" style="width:550px;float:left;">
	  <li ><a href="user_event.php" style="width:7em">Мои события</a></li>
        <li ><a href="user_event_settings.php" style="width:11em">Настройки Событий</a></li>
        <li class="activeLink"><a href="user_event_browse.php" style="width:10.5em">Обзор Событий</a></li>
      </ul>
    </div>

<img src='./images/icons/event48.gif' border='0' class='icon_big'>
<div class='page_header'>{$user_event_browse4}</div>
<div>{$user_event_browse5}</div>

<br><br><br>

<table cellpadding='0' cellspacing='0' width='100%'>
<tr>
<td class='event_browse_left'>

  {* SHOW HEADER TEXT *}
  <div class='event_browse_title'>
    {if $nocat == 1}
      {$user_event_browse2}
    {elseif $eventcat_title != ""}
      {$eventcat_title}
    {else}
      {$user_event_browse9}
    {/if} 
    ({$total_events} {if $total_events != 1}{$user_event_browse7}{else}{$user_event_browse8}{/if})
  </div>

  {* SHOW ZERO EVENTS FOUND NOTICE *}
  {if $total_events == 0}
    <br>
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td class='result'><img src='./images/icons/bulb16.gif' border='0' class='icon'>{$user_event_browse10}</td>
    </tr>
    </table>
  {/if}

  {* DISPLAY PAGINATION MENU IF APPLICABLE *}
  {if $maxpage > 1}
    <br>
    <div class='center'>
    {if $p != 1}<a href='user_event_browse.php?eventcat_id={$eventcat_id}&p={math equation='p-1' p=$p}'>&#171; {$user_event_browse16}</a>{else}<font class='disabled'>&#171; {$user_event_browse16}</font>{/if}
    {if $p_start == $p_end}
      &nbsp;|&nbsp; {$user_event_browse17} {$p_start} {$user_event_browse18} {$total_events} &nbsp;|&nbsp; 
    {else}
      &nbsp;|&nbsp; {$user_event_browse19} {$p_start}-{$p_end} {$user_event_browse18} {$total_events} &nbsp;|&nbsp; 
    {/if}
    {if $p != $maxpage}<a href='user_event_browse.php?eventcat_id={$eventcat_id}&p={math equation='p+1' p=$p}'>{$user_event_browse20} &#187;</a>{else}<font class='disabled'>{$user_event_browse20} &#187;</font>{/if}
    </div>
  {/if}

  {* SHOW EVENTS IN THIS CATEGORY *}
  {section name=event_loop loop=$events}
    <div class='event_row'>
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td valign='top'><a href='event.php?event_id={$events[event_loop].event->event_info.event_id}'><img src='{$events[event_loop].event->event_photo('./images/nophoto.gif')}' class='photo' width='{$misc->photo_size($events[event_loop].event->event_photo('./images/nophoto.gif'),'100','100','w')}' border='0'></a></td>
    <td valign='top' class='event_row1' width='100%'>
      <div><font class='big'><img src='./images/icons/event16.gif' border='0' class='icon'><a href='event.php?event_id={$events[event_loop].event->event_info.event_id}'>{$events[event_loop].event->event_info.event_title}</a></font></div>
      <div style='padding-top: 5px;'>{$events[event_loop].event->event_info.event_desc|replace:'<br>':' '|truncate:300:"..."}</div>
      <br>
      <table cellpadding='0' cellspacing='0'>
      {assign var=event_date_start value=$datetime->timezone($events[event_loop].event->event_info.event_date_start, $global_timezone)}
      {assign var=event_date_end value=$datetime->timezone($events[event_loop].event->event_info.event_date_end, $global_timezone)}
      {if $datetime->cdate("F j, Y", $event_date_start) == $datetime->cdate("F j, Y", $event_date_end)}
        {assign var=start_dateformat value="`$setting.setting_dateformat` `$user_event_browse22` `$setting.setting_timeformat`"}
        {assign var=end_dateformat value=$setting.setting_timeformat}
      {else}
        {assign var=start_dateformat value="`$setting.setting_dateformat`, `$setting.setting_timeformat`"}
        {assign var=end_dateformat value="`$setting.setting_dateformat`, `$setting.setting_timeformat`"}
      {/if}
      <tr><td>{$user_event_browse11} &nbsp;</td><td>{$datetime->cdate("`$start_dateformat`", $event_date_start)} {$user_event_browse23} {$datetime->cdate("`$end_dateformat`", $event_date_end)}</td></tr>
      {if $events[event_loop].event->event_info.event_host != ""}<tr><td>{$user_event_browse13} &nbsp;</td><td>{$events[event_loop].event->event_info.event_host}</td></tr>{/if}
      </table>
    </td>
    <td class='event_row2' NOWRAP>
      <a href='event.php?event_id={$events[event_loop].event->event_info.event_id}'>{$user_event_browse14}</a><br>
      <a href='user_event_rsvp.php?event_id={$events[event_loop].event->event_info.event_id}&return_url={$url->url_current()}'>{$user_event_browse15}</a><br>
    </td>
    </tr>
    </table>
    </div>
  {/section}

  {* DISPLAY PAGINATION MENU IF APPLICABLE *}
  {if $maxpage > 1}
    <br>
    <div class='center'>
    {if $p != 1}<a href='user_event_browse.php?eventcat_id={$eventcat_id}&p={math equation='p-1' p=$p}'>&#171; {$user_event_browse16}</a>{else}<font class='disabled'>&#171; {$user_event_browse16}</font>{/if}
    {if $p_start == $p_end}
      &nbsp;|&nbsp; {$user_event_browse17} {$p_start} {$user_event_browse18} {$total_events} &nbsp;|&nbsp; 
    {else}
      &nbsp;|&nbsp; {$user_event_browse19} {$p_start}-{$p_end} {$user_event_browse18} {$total_events} &nbsp;|&nbsp; 
    {/if}
    {if $p != $maxpage}<a href='user_event_browse.php?eventcat_id={$eventcat_id}&p={math equation='p+1' p=$p}'>{$user_event_browse20} &#187;</a>{else}<font class='disabled'>{$user_event_browse20} &#187;</font>{/if}
    </div>
  {/if}

</td>
<td class='event_browse_right'>

  {* LIST CATEGORIES *}
  <table cellpadding='0' cellspacing='0' width='100%' style='margin-bottom: 3px;'>
  <tr>
  <td class='event_browse_cat2' nowrap='nowrap' style='padding-left: 6px;'>
    <b><a href='user_event_browse.php'>{$user_event_browse12}</a></b>
  </td>
  </tr>
  </table>
  {section name=cat_loop loop=$categories}
    <table cellpadding='0' cellspacing='0' width='100%' style='margin-bottom: 3px;'>
    <tr>
    <td class='event_browse_cat1' width='1'>
      <a href='javascript:void(0)' onClick="expandcats('subcats{$categories[cat_loop].eventcat_id}', '0')"><span id='subcats{$categories[cat_loop].eventcat_id}_icon'>{if $categories[cat_loop].eventcat_expanded != 1}<img src='./images/icons/plus16.gif' border='0'>{else}<img src='./images/icons/minus16.gif' border='0'>{/if}</span></a>
    </td>
    <td class='event_browse_cat2' nowrap='nowrap'>
      <b><a href='user_event_browse.php?eventcat_id={$categories[cat_loop].eventcat_id}' onClick="expandcats('subcats{$categories[cat_loop].eventcat_id}', '1')">{$categories[cat_loop].eventcat_title|truncate:40:"...":true}</a></b>
      {if $categories[cat_loop].eventcat_totalevents > 0}
        &nbsp;({$categories[cat_loop].eventcat_totalevents} {if $categories[cat_loop].eventcat_totalevents != 1}{$user_event_browse7}{else}{$user_event_browse8}{/if})
      {/if}
    </td>
    </tr>
    </table>

    {* LIST SUBCATEGORIES *}
    <div id='subcats{$categories[cat_loop].eventcat_id}' style='{if $categories[cat_loop].eventcat_expanded != 1}display: none; {/if}padding: 3px 3px 8px 10px;'>
      {section name=subcat_loop loop=$categories[cat_loop].eventcat_subcats}
        <div>
          <a href='user_event_browse.php?eventcat_id={$categories[cat_loop].eventcat_subcats[subcat_loop].subcategory_id}'>{$categories[cat_loop].eventcat_subcats[subcat_loop].subcategory_title|truncate:20:"...":true}</a>
          {if $categories[cat_loop].eventcat_subcats[subcat_loop].subcategory_totalevents > 0}
            <font class='small'>({$categories[cat_loop].eventcat_subcats[subcat_loop].subcategory_totalevents} {if $categories[cat_loop].eventcat_subcats[subcat_loop].subcategory_totalevents != 1}{$user_event_browse7}{else}{$user_event_browse8}{/if})</font>
          {/if}
        </div>
      {/section}
    </div>
  {/section}

  {* SHOW UNCATEGORIZED EVENTS CATGORY IF ANY EVENTS HAVE NO CAT *}
  {if $events_totalnocat > 0}

    <table cellpadding='0' cellspacing='0' width='100%'{if not $smarty.section.cat_loop.last} style='margin-bottom: 3px;'{/if}>
    <tr>
    <td class='event_browse_cat1' width='1'>
      <img src='./images/icons/minus16_disabled.gif' border='0'>
    </td>
    <td class='event_browse_cat2' nowrap='nowrap'>
      <b><a href='user_event_browse.php?eventcat_id=0'>{$user_event_browse9}</a></b>
      {if $events_totalnocat > 0}
        &nbsp;({$events_totalnocat} {if $events_totalnocat != 1}{$user_event_browse7}{else}{$user_event_browse8}{/if})
      {/if}
    </td>
    </tr>
    </table>
  {/if}
</td>
</tr>
</table>

{literal}
<script type='text/javascript'>
<!--
function expandcats(id1, linkclicked) {
  var icon_var = id1 + '_icon';
  if(document.getElementById(id1).style.display == "none") {
    document.getElementById(id1).style.display = "block";
    document.getElementById(icon_var).innerHTML = "<img src='./images/icons/minus16.gif' border='0'>"; 
    setCookie(id1, "1");
  } else {
    if(linkclicked == 0) {
      document.getElementById(id1).style.display = "none";
      document.getElementById(icon_var).innerHTML = "<img src='./images/icons/plus16.gif' border='0'>"; 
      setCookie(id1, "0");
    }
  }
  document.getElementById(icon_var).blur();
}
//-->
</script>
{/literal}

{include file='footer.tpl'}