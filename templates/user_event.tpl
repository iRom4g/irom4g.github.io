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
	  <li class="activeLink"><a href="user_event.php" style="width:7em">Мои события</a></li>
        <li><a href="user_event_settings.php" style="width:11em">Настройки Событий</a></li>
        <li><a href="user_event_browse.php" style="width:10.5em">Обзор Событий</a></li>
      </ul>
    </div>


<table cellpadding='0' cellspacing='0'>
<tr>
<td class='event_left'>
   <img src='./images/icons/event48.gif' border='0' class='icon_big'>
   <div class='page_header'>{$user_event4}</div>
   {$user_event5}<a href='user_event_browse.php'>{$user_event6}</a>.
</td>
{* SHOW CREATE EVENT BUTTON *}
<td class='event_right' align='right'>
  <table cellpadding='0' cellspacing='0' align='right'>
  <tr><td class='button' nowrap='nowrap'>
    <a href='user_event_add.php'><img src='./images/icons/newevent16.gif' border='0' class='icon'>{$user_event7}</a>
  </td></tr></table>
</td>
</tr>
</table>

{literal}
<script type='text/javascript'>
<!--
var open_id = '{/literal}{if $show_notification == 1 & $total_waiting_events != 0}event_waiting{/if}{literal}';
function se_popup(id1) {
  if(open_id != '') { se_popup_close(open_id); }
  document.body.appendChild(document.getElementById(id1));
  document.getElementById(id1).style.display = 'block';
  open_id = id1;
}
function se_popup_close(id1) {
  document.getElementById(id1).style.display = 'none';
}
//-->
</script>
{/literal}

<br>

{* SHOW NOTIFICATION FOR UNANSWERED EVENTS *}
{if $total_waiting_events != 0}
  <table cellpadding='0' cellspacing='0' align='center'><tr><td class='result'>
    <a href='javascript:void(0)' onClick="se_popup('event_waiting')"><img src='./images/icons/plus16.gif' border='0' class='icon'>{$total_waiting_events} {$user_event32}</a>
  </td></tr></table>
  <br>

  <table id='event_waiting' cellpadding='0' cellspacing='0' class='profile_event_popup2' {if $show_notification == 1}style='display: block;'{/if}>
  <tr><td class='profile_event_transparent' colspan='3' style='height: 20px;'>&nbsp;</td></tr>
  <tr>
  <td class='profile_event_transparent' style='width: 20px;'>&nbsp;</td>
  <td class='profile_event_popup2'>
    <table cellpadding='0' cellspacing='0' width='100%'>
    <tr>
    <td class='profile_event_popup_title'>{$total_waiting_events} {$user_event34}</td>
    <td class='profile_event_popup_title' align='right'>[ <a href='javascript:void(0)' onClick="se_popup_close('event_waiting')">{$user_event2}</a> ]</td>
    </tr>
    </table>

    {section name=waiting_loop loop=$waiting_events}

      <div class='profile_event_spacer'></div>

      <table cellpadding='0' cellspacing='0' width='100%'>
      <tr>
      <td valign='top' width='20' style='padding-right: 10px;'>
        <a href='event.php?event_id={$waiting_events[waiting_loop].event->event_info.event_id}'><img src="{$waiting_events[waiting_loop].event->event_photo('./images/nophoto.gif')}" class='photo' width="{$misc->photo_size($waiting_events[waiting_loop].event->event_photo('./images/nophoto.gif'),'100','100','w')}" border='0'></a>
      </td>
      <td valign='top' align='left'>
        <div><font class='big'><img src='./images/icons/event16.gif' border='0' class='icon'><a href='event.php?event_id={$waiting_events[waiting_loop].event->event_info.event_id}'>{$waiting_events[waiting_loop].event->event_info.event_title}</a></font></div>
        <div style='padding-top: 5px;'>{$waiting_events[waiting_loop].event->event_info.event_desc|replace:'<br>':' '|truncate:300:"..."}</div>
        <br>
        <table cellpadding='0' cellspacing='0'> 
        {assign var=event_date_start value=$datetime->timezone($waiting_events[waiting_loop].event->event_info.event_date_start, $global_timezone)}
        {assign var=event_date_end value=$datetime->timezone($waiting_events[waiting_loop].event->event_info.event_date_end, $global_timezone)}
	{if $datetime->cdate("F j, Y", $event_date_start) == $datetime->cdate("F j, Y", $event_date_end)}
	  {assign var=start_dateformat value="`$setting.setting_dateformat` `$user_event36` `$setting.setting_timeformat`"}
	  {assign var=end_dateformat value=$setting.setting_timeformat}
	{else}
	  {assign var=start_dateformat value="`$setting.setting_dateformat`, `$setting.setting_timeformat`"}
	  {assign var=end_dateformat value="`$setting.setting_dateformat`, `$setting.setting_timeformat`"}
	{/if}
        <tr><td>{$user_event16} &nbsp;</td><td>{$datetime->cdate("`$start_dateformat`", $event_date_start)} {$user_event23} {$datetime->cdate("`$end_dateformat`", $event_date_end)}</td></tr>
        {if $waiting_events[waiting_loop].event->event_info.event_host != ""}<tr><td>{$user_event35} &nbsp;</td><td>{$waiting_events[waiting_loop].event->event_info.event_host}</td></tr>{/if}
        <tr><td>{$user_event17} &nbsp;</td><td><a href='user_event_rsvp.php?event_id={$waiting_events[waiting_loop].event->event_info.event_id}'>
        {if $waiting_events[waiting_loop].event_status == 0}{$user_event18}
        {elseif $waiting_events[waiting_loop].event_status == 1}{$user_event19}
        {elseif $waiting_events[waiting_loop].event_status == 2}{$user_event20}
        {elseif $waiting_events[waiting_loop].event_status == 3}{$user_event21}
        {/if}
        </a></td></tr>
        </table>
      </td>
      <td valign='top' align='right' nowrap='nowrap'>
	<div style='padding-left: 10px;'>
        <a href='event.php?event_id={$waiting_events[waiting_loop].event->event_info.event_id}'>{$user_event31}</a><br>
        <a href='user_event_rsvp.php?event_id={$waiting_events[waiting_loop].event->event_info.event_id}'>{$user_event33}</a><br>
        {if $waiting_events[waiting_loop].event->event_info.event_user_id == $user->user_info.user_id}
          <a href='user_event_edit.php?event_id={$waiting_events[waiting_loop].event->event_info.event_id}'>{$user_event13}</a><br>
          <a href='user_event_edit_delete.php?event_id={$waiting_events[waiting_loop].event->event_info.event_id}'>{$user_event14}</a><br>
        {else}
          <a href='user_event_remove.php?event_id={$waiting_events[waiting_loop].event->event_info.event_id}&return_url={$url->url_current()}'>{$user_event22}</a><br>
        {/if}
	</div>
      </td>
      </tr>
      </table>

    {/section}
  </td>
  <td class='profile_event_transparent' style='width: 20px;'>&nbsp;</td>
  </tr>
  <tr><td colspan='3' class='profile_event_transparent' style='height: 20px;'>&nbsp;</td></tr>
  </table>
{/if}

<table cellpadding='0' cellspacing='0' width='100%'>
<tr>
<td align='center'>

  <div class='event_title'><a href='user_event.php?date={$date_last}'>&#171;</a> {$month}, {$year} <a href='user_event.php?date={$date_next}'>&#187;</a></div>

  <table cellpadding='0' cellspacing='0' class='event_calendar'>
  <tr>
  <td class='event_cellheader'>{$user_event24}</td>
  <td class='event_cellheader'>{$user_event25}</td>
  <td class='event_cellheader'>{$user_event26}</td>
  <td class='event_cellheader'>{$user_event27}</td>
  <td class='event_cellheader'>{$user_event28}</td>
  <td class='event_cellheader'>{$user_event29}</td>
  <td class='event_cellheader'>{$user_event30}</td>
  </tr>

  {* SHOW DAYS OF MONTH *}
  {assign var='daycount' value=1}
  {section name=calendar loop=$total_cells}

    {* START A NEW ROW *}
    {cycle name="startrow" values="<tr>,,,,,,"}

    {* SHOW EMPTY CELLS BEFORE THE MONTH STARTS *}
    {if $smarty.section.calendar.index+1 < $first_day_of_month OR $smarty.section.calendar.index+1 > $last_day_of_month}
      <td height='80' class='event_cellblank'>
        <div class='event_cellnum'>&nbsp;</div>
      </td>

    {* SHOW A DAY *}
    {else}
      {assign value=$events.$daycount var=day_events}
      <td height='80' class='event_cell{if $today_month == $date_current AND $today_day == $daycount}3{elseif $day_events|@count != 0}2{else}1{/if}'>

	<table cellpadding='0' cellspacing='0' width='100%' height='100%'>
	<tr>
        <td class='event_celldesc'>
          {section name=event_loop loop=$day_events}
            <a href='javascript:void(0)' onClick="se_popup('event{$day_events[event_loop].event->event_info.event_id}')">{$day_events[event_loop].event->event_info.event_title}</a><br>
	    {if $day_events[event_loop].event->event_info.event_title != ""}
    	      <table id='event{$day_events[event_loop].event->event_info.event_id}' cellpadding='0' cellspacing='0' class='profile_event_popup'>
    	      <tr>
    	      <td class='profile_event_transparent' colspan='3' style='height: 20px;'>&nbsp;</td>
    	      </tr>
    	      <tr>
    	      <td class='profile_event_transparent' style='width: 20px;'>&nbsp;</td>
    	      <td class='profile_event_popup2'>
		<table cellpadding='0' cellspacing='0' width='100%'>
		<tr>
		<td valign='top' width='20' style='padding-right: 10px;'>
		  <a href='event.php?event_id={$day_events[event_loop].event->event_info.event_id}'><img src="{$day_events[event_loop].event->event_photo('./images/nophoto.gif')}" class='photo' width="{$misc->photo_size($day_events[event_loop].event->event_photo('./images/nophoto.gif'),'100','100','w')}" border='0'></a>
		</td>
		<td valign='top' align='left'>
		  <div><font class='big'><img src='./images/icons/event16.gif' border='0' class='icon'><a href='event.php?event_id={$day_events[event_loop].event->event_info.event_id}'>{$day_events[event_loop].event->event_info.event_title}</a></font></div>
		  <div style='padding-top: 5px;'>{$day_events[event_loop].event->event_info.event_desc|replace:'<br>':' '|truncate:300:"..."}</div>
		  <br>
     		  <table cellpadding='0' cellspacing='0'>
		  {assign var=event_date_start value=$datetime->timezone($day_events[event_loop].event->event_info.event_date_start, $global_timezone)}
		  {assign var=event_date_end value=$datetime->timezone($day_events[event_loop].event->event_info.event_date_end, $global_timezone)}
		  {if $datetime->cdate("F j, Y", $event_date_start) == $datetime->cdate("F j, Y", $event_date_end)}{assign var=end_dateformat value=$setting.setting_timeformat}{else}{assign var=end_dateformat value="`$setting.setting_dateformat` `$user_event36` `$setting.setting_timeformat`"}{/if}
		  {if $datetime->cdate("F j, Y", $event_date_start) == $datetime->cdate("F j, Y", $event_date_end)}
		    {assign var=start_dateformat value="`$setting.setting_dateformat` `$user_event36` `$setting.setting_timeformat`"}
		    {assign var=end_dateformat value=$setting.setting_timeformat}
		  {else}
		    {assign var=start_dateformat value="`$setting.setting_dateformat`, `$setting.setting_timeformat`"}
		    {assign var=end_dateformat value="`$setting.setting_dateformat`, `$setting.setting_timeformat`"}
		  {/if}
      		  <tr><td>{$user_event16} &nbsp;</td><td>{$datetime->cdate("`$start_dateformat`", $event_date_start)} {$user_event23} {$datetime->cdate("`$end_dateformat`", $event_date_end)}</td></tr>
		  {if $day_events[event_loop].event->event_info.event_host != ""}<tr><td>{$user_event35} &nbsp;</td><td>{$day_events[event_loop].event->event_info.event_host}</td></tr>{/if}
      		  <tr><td>{$user_event17} &nbsp;</td><td><a href='user_event_rsvp.php?event_id={$day_events[event_loop].event->event_info.event_id}'>
		  {if $day_events[event_loop].event_status == 0}{$user_event18}
		  {elseif $day_events[event_loop].event_status == 1}{$user_event19}
		  {elseif $day_events[event_loop].event_status == 2}{$user_event20}
		  {elseif $day_events[event_loop].event_status == 3}{$user_event21}
		  {/if}
		  </a></td></tr>
      		  </table>
		</td>
		<td valign='top' align='right' nowrap='nowrap'>
	 	  <b>[ <a href='javascript:void(0)' onClick="se_popup_close('event{$day_events[event_loop].event->event_info.event_id}')">{$user_event2}</a> ]</b>
		  <br>
		  <div style='padding-top: 5px;'>
		  <a href='event.php?event_id={$day_events[event_loop].event->event_info.event_id}'>{$user_event31}</a><br>
		  {if $day_events[event_loop].event->event_info.event_user_id == $user->user_info.user_id}
		    <a href='user_event_edit.php?event_id={$day_events[event_loop].event->event_info.event_id}'>{$user_event13}</a><br>
     		    <a href='user_event_edit_delete.php?event_id={$day_events[event_loop].event->event_info.event_id}'>{$user_event14}</a><br>
		  {else}
     		    <a href='user_event_remove.php?event_id={$day_events[event_loop].event->event_info.event_id}&return_url={$url->url_current()}'>{$user_event22}</a><br>
		  {/if}
		  </div>
		</td>
		</tr>
		</table>
    	      </td>
    	      <td class='profile_event_transparent' style='width: 20px;'>&nbsp;</td>
    	      </tr>
    	      <tr>
    	      <td colspan='3' class='profile_event_transparent' style='height: 20px;'>&nbsp;</td>
    	      </tr>
    	      </table>
	    {/if}
          {/section}
	  &nbsp;
        </td>
        </tr>
	<tr>
        <td class='event_cellnum{if $day_events|@count != 0}2{else}1{/if}'>{$daycount}</td>
        </tr>
	</table>

      </td>
      {assign var='daycount' value=$daycount+1}
    {/if}

    {* END THIS ROW *}
    {cycle name="endrow" values=",,,,,,</tr>"}

  {/section}

  </table>

</td>
</tr>
</table>

{include file='footer.tpl'}