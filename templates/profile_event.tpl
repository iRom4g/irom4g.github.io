{* BEGIN EVENTS *}
<table cellpadding='0' cellspacing='0' width='100%' style='margin-bottom: 10px;'>
<tr><td class='header'>{$header_event2}</td></tr>
<tr>
<td class='profile'>
<iframe name='calendarframe' id='calendarframe' src="{$url->url_base}/profile_event_calendar.php?user={$owner->user_info.user_username}" width="100%" height='100%' scrolling='no' frameborder='0'></iframe>
</td>
</tr>
</table>
<p id='show_event'></p>
{literal}
<script type='text/javascript'>
<!--
function se_popup(id1) {
  se_popup_close();
  table = parent.frames['calendarframe'].document.getElementById(id1);
  var ni = document.getElementById('show_event');
  var newdiv = document.createElement('div');
  newdiv.setAttribute('id','mydiv');
  newdiv.innerHTML = '<table width="550" cellpadding="0" cellspacing="0" class="profile_event_popup" style="display:block;">'+table.innerHTML+'</table>';
  ni.appendChild(newdiv);
}
function se_popup_close() {
  var d = document.getElementById('show_event');
  if(document.getElementById('mydiv')) {
    var olddiv = document.getElementById('mydiv');
    d.removeChild(olddiv);
  }
}
//-->
</script>
{/literal}
{* END EVENTS *}