{include file='admin_header.tpl'}

<h2>{$admin_group1}</h2>
{$admin_group2}

<br><br>

{if $result != 0}
  <div class='success'><img src='../images/success.gif' class='icon' border='0'> {$admin_group3}</div>
{/if}


  {* JAVASCRIPT FOR CHANGING GROUP FIELD ORDER *}
  {literal}
  <script type='text/javascript'>
  <!--
  function ChangeOrder(groupDown, groupUp) {
    // SWAP INNER HTML
    var downHtml = document.getElementById('group_'+groupDown).innerHTML;
    var upHtml = document.getElementById('group_'+groupUp).innerHTML;
    document.getElementById('group_'+groupDown).innerHTML = upHtml;
    document.getElementById('group_'+groupUp).innerHTML = downHtml;
    // SWAP IDS NOW THAT INNER HTML HAS BEEN SWITCHED
    document.getElementById('group_'+groupDown).id = 'tempID';
    document.getElementById('group_'+groupUp).id = 'group_'+groupDown;
    document.getElementById('tempID').id = 'group_'+groupUp;
    // SWAP ARROW VISIBILITY
    var upUpVisibility = document.getElementById('arrowup_'+groupUp).style.visibility;
    var upDownVisibility = document.getElementById('arrowdown_'+groupUp).style.visibility;
    var downUpVisibility = document.getElementById('arrowup_'+groupDown).style.visibility;
    var downDownVisibility = document.getElementById('arrowdown_'+groupDown).style.visibility;
    document.getElementById('arrowup_'+groupUp).style.visibility = downUpVisibility;
    document.getElementById('arrowdown_'+groupUp).style.visibility = downDownVisibility;
    document.getElementById('arrowup_'+groupDown).style.visibility = upUpVisibility;
    document.getElementById('arrowdown_'+groupDown).style.visibility = upDownVisibility;
  }
  //-->
  </script>
  {/literal}


  {* JAVASCRIPT FOR ADDING CATEGORIES *}
  {literal}
  <script type="text/javascript">
  {/literal}
  <!-- Begin
  var groupcat_id = {$num_cats}+1;
  {literal}
  function addInput(fieldname) {
    var ni = document.getElementById(fieldname);
    var newdiv = document.createElement('div');
    var divIdName = 'my'+groupcat_id+'Div';
    newdiv.setAttribute('id',divIdName);
    newdiv.innerHTML = "<table cellpadding='0' cellspacing='0'><tr><td><input type='text' class='text' name='groupcat_title" + groupcat_id +"' size='30' maxlength='100'></td></tr><tr><td><p id='newsubcategory" + groupcat_id +"' style='margin: 0px;'></p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"javascript:addInput2('newsubcategory', '" + groupcat_id +"')\">Add Subcategory</a></td></tr><tr><td><input type='hidden' name='num_subcat_" + groupcat_id +"' id='num_subcat_" + groupcat_id +"' value='0'></td></tr><tr><td>&nbsp;</td></tr></table>";
    ni.appendChild(newdiv);
    groupcat_id++;
    window.document.groupForm.num_groupcategories.value=groupcat_id;
  }
  function addInput2(fieldname, catid) {
    fieldname = fieldname+catid;
    dep_cat_id = document.getElementById('num_subcat_'+catid).value;

    var ni = document.getElementById(fieldname);
    var newdiv = document.createElement('div');
    var divIdName = 'my'+dep_cat_id+'Div';
    newdiv.setAttribute('id',divIdName);
    newdiv.innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='text' name='groupcat_title" + catid + "_" + dep_cat_id + "' class='text' size='30' maxlength='50'><br>";
    ni.appendChild(newdiv);
    dep_cat_id++;
    document.getElementById('num_subcat_'+catid).value=dep_cat_id;
  }
  // End -->
  </script>
  {/literal}


<form action='admin_group.php' method='POST' name='groupForm'>

<table cellpadding='0' cellspacing='0' width='600'>
<td class='header'>{$admin_group10}</td>
</tr>
<td class='setting1'>
  {$admin_group11}
</td>
</tr>
<tr>
<td class='setting2'>
  <table cellpadding='2' cellspacing='0'>
  <tr>
  <td><input type='radio' name='setting_permission_group' id='permission_group_1' value='1'{if $permission_group == 1} CHECKED{/if}></td>
  <td><label for='permission_group_1'>{$admin_group13}</label></td>
  </tr>
  <tr>
  <td><input type='radio' name='setting_permission_group' id='permission_group_0' value='0'{if $permission_group == 0} CHECKED{/if}></td>
  <td><label for='permission_group_0'>{$admin_group14}</label></td>
  </tr>
  </table>
</td>
</tr>
</table>
  
<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr><td class='header'>{$admin_group24}</td></tr>
<tr><td class='setting1'>
{$admin_group25}
</td></tr><tr><td class='setting2'>
{* SHOW GROUP FIELDS *}
{if $total_groupfields == 0}
  {$admin_group26}
{else}
  <img src='../images/admin_arrowup.gif' border='0' id='spacer' style='visibility: hidden;'>
  {* LOOP THROUGH FIELDS *}
  {section name=field_loop loop=$fields}
    <span id='group_{$fields[field_loop].groupfield_id}'><a id='down_{$fields[field_loop].groupfield_id}' href='admin_group.php?task=order&groupfield_id={$fields[field_loop].groupfield_id}' target='GroupOrderWindow'><img src='../images/admin_arrowdown.gif' border='0' id='arrowdown_{$fields[field_loop].groupfield_id}' style='visibility: {if $smarty.section.field_loop.last == true}hidden{else}visible{/if};'></a> &nbsp;<b><a href='admin_group_editfield.php?groupfield_id={$fields[field_loop].groupfield_id}'>{$fields[field_loop].groupfield_title}</a></b>
    {* LOOP THROUGH DEPENDENT FIELDS *}
    {section name=dep_field_loop loop=$fields[field_loop].dep_groupfields}
      <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - <b><a href='admin_group_editdepfield.php?groupfield_id={$fields[field_loop].dep_groupfields[dep_field_loop].dep_groupfield_id}'>{$fields[field_loop].dep_groupfields[dep_field_loop].dep_groupfield_title}</a></b>
    {/section}
    <br><a id='up_{$fields[field_loop].groupfield_id}' href='admin_group.php?task=order&groupfield_id={$fields[field_loop].groupfield_id}' target='GroupOrderWindow'><img src='../images/admin_arrowup.gif' border='0' id='arrowup_{$fields[field_loop].groupfield_id}' style='visibility: {if $smarty.section.field_loop.last == true}hidden{else}visible{/if};'></a>
    </span>
  {/section}
  <iframe name='GroupOrderWindow' style='display: none' src=''></iframe>
{/if}
<br><a href='admin_group_addfield.php'>{$admin_group27}</a>
</td></tr></table>
  
<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr><td class='header'>{$admin_group28}</td></tr>
<td class='setting1'>
  {$admin_group29}
</td></tr>
<tr>
<td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr><td><b>{$admin_group28}</b></td></tr>
  {section name=groupcats_loop loop=$categories}
    <tr><td><input type='text' class='text' name='groupcat_title{$categories[groupcats_loop].groupcat_id}' value='{$categories[groupcats_loop].groupcat_title}' size='30' maxlength='100'></td></tr>
    <tr><td>
    {section name=subcats_loop loop=$categories[groupcats_loop].dep_groupcats}
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='text' name='groupcat_title{$categories[groupcats_loop].groupcat_id}_{$categories[groupcats_loop].dep_groupcats[subcats_loop].dep_groupcat_id}' value='{$categories[groupcats_loop].dep_groupcats[subcats_loop].dep_groupcat_title}' class='text' size='30' maxlength='50'><br>
    {/section}
    <p id='newsubcategory{$categories[groupcats_loop].groupcat_id}' style='margin: 0px;'></p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:addInput2('newsubcategory', '{$categories[groupcats_loop].groupcat_id}')">{$admin_group31}</a></td></tr>
    <tr><td><input type='hidden' id='num_subcat_{$categories[groupcats_loop].groupcat_id}' name='num_subcat_{$categories[groupcats_loop].groupcat_id}' value='{$categories[groupcats_loop].groupcat_num_deps}'></td></tr>
    <tr><td>&nbsp;</td></tr>
  {/section}
  </td>
  </tr>
  </table>
  <p id='newcategory' style='margin: 0px;'></p>
  <a href="javascript:addInput('newcategory')">{$admin_group30}</a></td><input type='hidden' name='num_groupcategories' value='{$num_cats}'></tr>
</td>
</tr>
</table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr>
<td class='header'>{$admin_group32}</td>
</tr>
<td class='setting1'>
{$admin_group33}
</td></tr><tr><td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr><td><input type='radio' name='discussion_code' id='discussion_code_1' value='1'{if $setting_group_discussion_code == 1} CHECKED{/if}>&nbsp;</td><td><label for='discussion_code_1'>{$admin_group34}</label></td></tr>
  <tr><td><input type='radio' name='discussion_code' id='discussion_code_0' value='0'{if $setting_group_discussion_code == 0} CHECKED{/if}>&nbsp;</td><td><label for='discussion_code_0'>{$admin_group35}</label></td></tr>
  </table>
</td></tr></table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr>
<td class='header'>{$admin_group6}</td>
</tr>
<td class='setting1'>
  {$admin_group7}
</td>
</tr>
<tr>
<td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td width='80'>{$admin_group4}</td>
  <td><input type='text' class='text' size='30' name='setting_email_groupinvite_subject' value='{$setting_email_groupinvite_subject}' maxlength='200'></td>
  </tr><tr>
  <td valign='top'>{$admin_group5}</td>
  <td><textarea rows='6' cols='80' class='text' name='setting_email_groupinvite_message'>{$setting_email_groupinvite_message}</textarea><br>{$admin_group8}</td>
  </tr>
  </table>
</td>
</tr>
</table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr>
<td class='header'>{$admin_group15}</td>
</tr>
<td class='setting1'>
  {$admin_group16}
</td>
</tr>
<tr>
<td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td width='80'>{$admin_group4}</td>
  <td><input type='text' class='text' size='30' name='setting_email_groupcomment_subject' value='{$setting_email_groupcomment_subject}' maxlength='200'></td>
  </tr><tr>
  <td valign='top'>{$admin_group5}</td>
  <td><textarea rows='6' cols='80' class='text' name='setting_email_groupcomment_message'>{$setting_email_groupcomment_message}</textarea><br>{$admin_group17}</td>
  </tr>
  </table>
</td>
</tr>
</table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr>
<td class='header'>{$admin_group18}</td>
</tr>
<td class='setting1'>
  {$admin_group19}
</td>
</tr>
<tr>
<td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td width='80'>{$admin_group4}</td>
  <td><input type='text' class='text' size='30' name='setting_email_groupmediacomment_subject' value='{$setting_email_groupmediacomment_subject}' maxlength='200'></td>
  </tr><tr>
  <td valign='top'>{$admin_group5}</td>
  <td><textarea rows='6' cols='80' class='text' name='setting_email_groupmediacomment_message'>{$setting_email_groupmediacomment_message}</textarea><br>{$admin_group20}</td>
  </tr>
  </table>
</td>
</tr>
</table>

<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr>
<td class='header'>{$admin_group21}</td>
</tr>
<td class='setting1'>
  {$admin_group22}
</td>
</tr>
<tr>
<td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td width='80'>{$admin_group4}</td>
  <td><input type='text' class='text' size='30' name='setting_email_groupmemberrequest_subject' value='{$setting_email_groupmemberrequest_subject}' maxlength='200'></td>
  </tr><tr>
  <td valign='top'>{$admin_group5}</td>
  <td><textarea rows='6' cols='80' class='text' name='setting_email_groupmemberrequest_message'>{$setting_email_groupmemberrequest_message}</textarea><br>{$admin_group23}</td>
  </tr>
  </table>
</td>
</tr>
</table>

<br>

<input type='submit' class='button' value='{$admin_group9}'>
<input type='hidden' name='task' value='dosave'>
</form>


{include file='admin_footer.tpl'}