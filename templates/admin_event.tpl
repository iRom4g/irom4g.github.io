{include file='admin_header.tpl'}

<h2>{$admin_event1}</h2>
{$admin_event2}

<br><br>

{if $result != 0}
  <div class='success'><img src='../images/success.gif' class='icon' border='0'> {$admin_event3}</div>
{/if}


  {* JAVASCRIPT FOR ADDING CATEGORIES *}
  {literal}
  <script type="text/javascript">
  {/literal}
  <!-- Begin
  var eventcat_id = {$num_cats}+1;
  {literal}
  function addInput(fieldname) {
    var ni = document.getElementById(fieldname);
    var newdiv = document.createElement('div');
    var divIdName = 'my'+eventcat_id+'Div';
    newdiv.setAttribute('id',divIdName);
    newdiv.innerHTML = "<table cellpadding='0' cellspacing='0'><tr><td><input type='text' class='text' name='eventcat_title" + eventcat_id +"' size='30' maxlength='100'></td></tr><tr><td><p id='newsubcategory" + eventcat_id +"' style='margin: 0px;'></p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"javascript:addInput2('newsubcategory', '" + eventcat_id +"')\">Add Subcategory</a></td></tr><tr><td><input type='hidden' name='num_subcat_" + eventcat_id +"' id='num_subcat_" + eventcat_id +"' value='0'></td></tr><tr><td>&nbsp;</td></tr></table>";
    ni.appendChild(newdiv);
    eventcat_id++;
    window.document.eventForm.num_eventcategories.value=eventcat_id;
  }
  function addInput2(fieldname, catid) {
    fieldname = fieldname+catid;
    dep_cat_id = document.getElementById('num_subcat_'+catid).value;

    var ni = document.getElementById(fieldname);
    var newdiv = document.createElement('div');
    var divIdName = 'my'+dep_cat_id+'Div';
    newdiv.setAttribute('id',divIdName);
    newdiv.innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='text' name='eventcat_title" + catid + "_" + dep_cat_id + "' class='text' size='30' maxlength='50'><br>";
    ni.appendChild(newdiv);
    dep_cat_id++;
    document.getElementById('num_subcat_'+catid).value=dep_cat_id;
  }
  // End -->
  </script>
  {/literal}


<form action='admin_event.php' method='POST' name='eventForm'>

<table cellpadding='0' cellspacing='0' width='600'>
<td class='header'>{$admin_event10}</td>
</tr>
<td class='setting1'>
  {$admin_event11}
</td>
</tr>
<tr>
<td class='setting2'>
  <table cellpadding='2' cellspacing='0'>
  <tr>
  <td><input type='radio' name='setting_permission_event' id='permission_event_1' value='1'{if $permission_event == 1} CHECKED{/if}></td>
  <td><label for='permission_event_1'>{$admin_event13}</label></td>
  </tr>
  <tr>
  <td><input type='radio' name='setting_permission_event' id='permission_event_0' value='0'{if $permission_event == 0} CHECKED{/if}></td>
  <td><label for='permission_event_0'>{$admin_event14}</label></td>
  </tr>
  </table>
</td>
</tr>
</table>
  
<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr><td class='header'>{$admin_event21}</td></tr>
<td class='setting1'>
  {$admin_event22}
</td></tr>
<tr>
<td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr><td><b>{$admin_event21}</b></td></tr>
  {section name=eventcats_loop loop=$categories}
    <tr><td><input type='text' class='text' name='eventcat_title{$categories[eventcats_loop].eventcat_id}' value='{$categories[eventcats_loop].eventcat_title}' size='30' maxlength='100'></td></tr>
    <tr><td>
    {section name=subcats_loop loop=$categories[eventcats_loop].dep_eventcats}
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='text' name='eventcat_title{$categories[eventcats_loop].eventcat_id}_{$categories[eventcats_loop].dep_eventcats[subcats_loop].dep_eventcat_id}' value='{$categories[eventcats_loop].dep_eventcats[subcats_loop].dep_eventcat_title}' class='text' size='30' maxlength='50'><br>
    {/section}
    <p id='newsubcategory{$categories[eventcats_loop].eventcat_id}' style='margin: 0px;'></p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:addInput2('newsubcategory', '{$categories[eventcats_loop].eventcat_id}')">{$admin_event24}</a></td></tr>
    <tr><td><input type='hidden' id='num_subcat_{$categories[eventcats_loop].eventcat_id}' name='num_subcat_{$categories[eventcats_loop].eventcat_id}' value='{$categories[eventcats_loop].eventcat_num_deps}'></td></tr>
    <tr><td>&nbsp;</td></tr>
  {/section}
  </td>
  </tr>
  </table>
  <p id='newcategory' style='margin: 0px;'></p>
  <a href="javascript:addInput('newcategory')">{$admin_event23}</a></td><input type='hidden' name='num_eventcategories' value='{$num_cats}'></tr>
</td>
</tr>
</table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr>
<td class='header'>{$admin_event6}</td>
</tr>
<td class='setting1'>
  {$admin_event7}
</td>
</tr>
<tr>
<td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td width='80'>{$admin_event4}</td>
  <td><input type='text' class='text' size='30' name='setting_email_eventinvite_subject' value='{$setting_email_eventinvite_subject}' maxlength='200'></td>
  </tr><tr>
  <td valign='top'>{$admin_event5}</td>
  <td><textarea rows='6' cols='80' class='text' name='setting_email_eventinvite_message'>{$setting_email_eventinvite_message}</textarea><br>{$admin_event8}</td>
  </tr>
  </table>
</td>
</tr>
</table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr>
<td class='header'>{$admin_event15}</td>
</tr>
<td class='setting1'>
  {$admin_event16}
</td>
</tr>
<tr>
<td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td width='80'>{$admin_event4}</td>
  <td><input type='text' class='text' size='30' name='setting_email_eventcomment_subject' value='{$setting_email_eventcomment_subject}' maxlength='200'></td>
  </tr><tr>
  <td valign='top'>{$admin_event5}</td>
  <td><textarea rows='6' cols='80' class='text' name='setting_email_eventcomment_message'>{$setting_email_eventcomment_message}</textarea><br>{$admin_event17}</td>
  </tr>
  </table>
</td>
</tr>
</table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr>
<td class='header'>{$admin_event18}</td>
</tr>
<td class='setting1'>
  {$admin_event19}
</td>
</tr>
<tr>
<td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td width='80'>{$admin_event4}</td>
  <td><input type='text' class='text' size='30' name='setting_email_eventmediacomment_subject' value='{$setting_email_eventmediacomment_subject}' maxlength='200'></td>
  </tr><tr>
  <td valign='top'>{$admin_event5}</td>
  <td><textarea rows='6' cols='80' class='text' name='setting_email_eventmediacomment_message'>{$setting_email_eventmediacomment_message}</textarea><br>{$admin_event20}</td>
  </tr>
  </table>
</td>
</tr>
</table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr>
<td class='header'>{$admin_event28}</td>
</tr>
<td class='setting1'>
  {$admin_event29}
</td>
</tr>
<tr>
<td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td width='80'>{$admin_event4}</td>
  <td><input type='text' class='text' size='30' name='setting_email_eventmemberrequest_subject' value='{$setting_email_eventmemberrequest_subject}' maxlength='200'></td>
  </tr><tr>
  <td valign='top'>{$admin_event5}</td>
  <td><textarea rows='6' cols='80' class='text' name='setting_email_eventmemberrequest_message'>{$setting_email_eventmemberrequest_message}</textarea><br>{$admin_event30}</td>
  </tr>
  </table>
</td>
</tr>
</table>

<br>

<input type='submit' class='button' value='{$admin_event9}'>
<input type='hidden' name='task' value='dosave'>
</form>


{include file='admin_footer.tpl'}