<html>
<head>
<link rel="stylesheet" href="./templates/styles.css" title="stylesheet" type="text/css"> 
<link rel="stylesheet" href="./templates/styles_event.css" title="stylesheet" type="text/css"> 
</head>
<body>
  <div style='text-align: center; padding-bottom: 5px;'>
    <b><a href='profile_event_calendar.php?user={$owner->user_info.user_username}&date={$date_last}'>&#171;</a> {$month}, {$year} <a href='profile_event_calendar.php?user={$owner->user_info.user_username}&date={$date_next}'>&#187;</a></b>
  </div>

  <table cellpadding='0' cellspacing='0' class='profile_events'>

  {* SHOW DAYS OF MONTH *}
  {assign var='daycount' value=1}
  {section name=calendar loop=$total_cells}

    {* START A NEW ROW *}
    {cycle name="startrow" values="<tr>,,,,,,"}

    {* SHOW EMPTY CELLS BEFORE THE MONTH STARTS *}
    {if $smarty.section.calendar.index+1 < $first_day_of_month OR $smarty.section.calendar.index+1 > $last_day_of_month}
      <td class='profile_events_cellblank'>&nbsp;</td>

    {* SHOW A DAY *}
    {else}
      {assign value=$events.$daycount var=day_events}
      <td class='profile_events_cell{if $today_day == $daycount AND $today_month == $date_current}3{elseif $day_events|@count != 0}2{else}1{/if}' align='center'>
        {if $day_events|@count == 0}
	  {$daycount}
	{else}
	  <a href='javascript:void(0)' onClick="parent.se_popup('day{$daycount}')">{$daycount}</a>


	  <table id='day{$daycount}' cellpadding='0' cellspacing='0' class='profile_event_popup'>
          <tr>
          <td class='profile_event_transparent' colspan='3' style='height: 20px;'>&nbsp;</td>
          </tr>
          <tr>
          <td class='profile_event_transparent' style='width: 20px;'>&nbsp;</td>
          <td class='profile_event_popup2'>

            <table cellpadding='0' cellspacing='0' width='100%'>
            <tr>
            <td class='profile_event_popup_title'>{$owner->user_info.user_username}{$profile_event_calendar1} {$month} {$daycount}</td>
            <td class='profile_event_popup_title' align='right'>[ <a href='javascript:void(0)' onClick="se_popup_close()">{$profile_event_calendar2}</a> ]</td>
            </tr>
            </table>

            {section name=event_loop loop=$day_events}

              <div class='profile_event_spacer'></div>

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
		{if $datetime->cdate("F j, Y", $event_date_start) == $datetime->cdate("F j, Y", $event_date_end)}
		  {assign var=start_dateformat value="`$setting.setting_dateformat` `$profile_event_calendar13` `$setting.setting_timeformat`"}
		  {assign var=end_dateformat value=$setting.setting_timeformat}
		{else}
		  {assign var=start_dateformat value="`$setting.setting_dateformat`, `$setting.setting_timeformat`"}
		  {assign var=end_dateformat value="`$setting.setting_dateformat`, `$setting.setting_timeformat`"}
		{/if}
      		<tr><td valign='top'>{$profile_event_calendar3} &nbsp;</td><td valign='top'>{$datetime->cdate("`$start_dateformat`", $event_date_start)} {$profile_event_calendar4} {$datetime->cdate("`$end_dateformat`", $event_date_end)}</td></tr>
      		{if $day_events[event_loop].event->event_info.event_host != ""}<tr><td valign='top'>{$profile_event_calendar6} &nbsp;</td><td valign='top'>{$day_events[event_loop].event->event_info.event_host}</td></tr>{/if}
	        <tr><td valign='top'>{$owner->user_info.user_username}{$profile_event_calendar12} &nbsp;</td><td valign='top'>
		{if $day_events[event_loop].event_status == 0}{$profile_event_calendar8}
		{elseif $day_events[event_loop].event_status == 1}{$profile_event_calendar9}
		{elseif $day_events[event_loop].event_status == 2}{$profile_event_calendar10}
		{elseif $day_events[event_loop].event_status == 3}{$profile_event_calendar11}
		{/if}
		</td></tr>
      	        </table>
              </td>
              <td valign='top' align='right' nowrap='nowrap'>
	        <a href='event.php?event_id={$day_events[event_loop].event->event_info.event_id}'>{$profile_event_calendar5}</a><br>
              </td>
              </tr>
              </table>

	    {/section}

          </td>
          <td class='profile_event_transparent' style='width: 20px;'>&nbsp;</td>
          </tr>
          <tr>
          <td colspan='3' class='profile_event_transparent' style='height: 20px;'>&nbsp;</td>
          </tr>
          </table>

	{/if}
      </td>
      {assign var='daycount' value=$daycount+1}
    {/if}

    {* END THIS ROW *}
    {cycle name="endrow" values=",,,,,,</tr>"}

  {/section}

  </table>

</body>
</html>