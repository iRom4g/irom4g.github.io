{include file='admin_header.tpl'}

<h2>{$admin_profile_addfield1}</h2>
{$admin_profile_addfield2}

<br><br>

{if $is_error != 0}
<div class='error'><img src='../images/error.gif' class='icon' border='0'> {$error_message}</div>
{/if}


{literal}
<script language='JavaScript'>
<!--
function showmaxlength() {

  if(document.getElementById('field_type').value=='') {
    document.getElementById('box1').style.display = "none";
    document.getElementById('box3').style.display = "none";
    document.getElementById('box4').style.display = "none";
    document.getElementById('box5').style.display = "none";
    document.getElementById('box6').style.display = "none";
  }

  if(document.getElementById('field_type').value=='1') {
    document.getElementById('box1').style.display = "block";
    document.getElementById('box3').style.display = "none";
    document.getElementById('box4').style.display = "none";
    document.getElementById('box5').style.display = "none";
    document.getElementById('box6').style.display = "block";
  }

  if(document.getElementById('field_type').value=='2') {
    document.getElementById('box1').style.display = "none";
    document.getElementById('box3').style.display = "none";
    document.getElementById('box4').style.display = "none";
    document.getElementById('box5').style.display = "none";
    document.getElementById('box6').style.display = "block";
  }

  if(document.getElementById('field_type').value=='3') {
    document.getElementById('box1').style.display = "none";
    document.getElementById('box3').style.display = "block";
    document.getElementById('box4').style.display = "none";
    document.getElementById('box5').style.display = "none";
    document.getElementById('box6').style.display = "none";
  }

  if(document.getElementById('field_type').value=='4') {
    document.getElementById('box1').style.display = "none";
    document.getElementById('box3').style.display = "none";
    document.getElementById('box4').style.display = "block";
    document.getElementById('box5').style.display = "none";
    document.getElementById('box6').style.display = "none";
  }

  if(document.getElementById('field_type').value=='5') {
    document.getElementById('box1').style.display = "none";
    document.getElementById('box3').style.display = "none";
    document.getElementById('box4').style.display = "none";
    document.getElementById('box5').style.display = "block";
    document.getElementById('box6').style.display = "none";
  }

}

// -->
</script>

<script type="text/javascript">
<!-- Begin
{/literal}
var select_id = {$num_select_options};
var radio_id = {$num_radio_options};
{literal}

function addInput(fieldname) {
  if(fieldname == 'newfields3') {
    var ni = document.getElementById(fieldname);
    var newdiv = document.createElement('div');
    var divIdName = 'my'+select_id+'Div';
    newdiv.setAttribute('id',divIdName);
    newdiv.innerHTML = "<input type='text' name='select_label" + select_id +"' class='text' size='30' maxlength='50' value=''><select name='select_dependency" + select_id +"' class='text'><option value='0'>{/literal}{$admin_profile_addfield3}{literal}</option><option value='1'>{/literal}{$admin_profile_addfield4}{literal}</option></select><input type='text' class='text' name='select_dependent_label" + select_id +"' size='30' maxlength='100' value=''><br>";
    ni.appendChild(newdiv);
    select_id++;
    window.document.info.num_select_options.value=select_id;
  } else if(fieldname == 'newfields4') {
    var ni = document.getElementById(fieldname);
    var newdiv = document.createElement('div');
    var divIdName = 'my'+radio_id+'Div';
    newdiv.setAttribute('id',divIdName);
    newdiv.innerHTML = "<input type='text' name='radio_label" + radio_id +"' class='text' size='30' maxlength='50'><select name='radio_dependency" + radio_id +"' class='text'><option value='0'>{/literal}{$admin_profile_addfield3}{literal}</option><option value='1'>{/literal}{$admin_profile_addfield4}{literal}</option></select><input type='text' class='text' name='radio_dependent_label" + radio_id +"' size='30' maxlength='100'><br>";
    ni.appendChild(newdiv);
    radio_id++;
    window.document.info.num_radio_options.value=radio_id;
  }
}


// End -->
</script>
{/literal}

<form action='admin_profile_addfield.php' name='info' method='POST'>
<table cellpadding='0' cellspacing='0'>
<tr>
<td class='form1' width='150'>{$admin_profile_addfield5}</td>
<td class='form2'><input type='text' class='text' name='field_title' value='{$field_title}' size='30' maxlength='100'></td>
</tr>
<tr>
<td class='form1'>{$admin_profile_addfield6}</td>
<td class='form2'>
<select name='field_tab_id' class='text'>
{section name=tab_loop loop=$tabs}
  <option value='{$tabs[tab_loop].tab_id}'{if $tabs[tab_loop].field_tab_id == 1} SELECTED{/if}>{$tabs[tab_loop].tab_name}</option>
{/section}
</select>
</td>
</tr>
<tr>
<td class='form1'>{$admin_profile_addfield7}</td>
<td class='form2'>
<select name='field_type' id='field_type' class='text' onChange='showmaxlength();'>
<option value=''></option>
<option value='1'{if $field_type == 1} SELECTED{/if}>{$admin_profile_addfield8}</option>
<option value='2'{if $field_type == 2} SELECTED{/if}>{$admin_profile_addfield9}</option>
<option value='3'{if $field_type == 3} SELECTED{/if}>{$admin_profile_addfield10}</option>
<option value='4'{if $field_type == 4} SELECTED{/if}>{$admin_profile_addfield11}</option>
<option value='5'{if $field_type == 5} SELECTED{/if}>{$admin_profile_addfield37}</option>
</select>
</td>
</tr>
<tr>
<td class='form1'>{$admin_profile_addfield12}</td>
<td class='form2'>
<input type='text' class='text' name='field_style' value='{$field_style}' size='30' maxlength='200'>
</td>
</tr>
<tr>
<td class='form1'>{$admin_profile_addfield29}</td>
<td class='form2'>
<textarea name='field_desc' rows='4' cols='40' class='text'>{$field_desc}</textarea>
</td>
</tr>
<tr>
<td class='form1'>{$admin_profile_addfield16}</td>
<td class='form2'>
<input type='text' class='text' name='field_error' value='{$field_error}' size='30' maxlength='250'>
</td>
</tr>
<tr>
<td class='form1'>{$admin_profile_addfield34}</td>
<td class='form2'>
<select name='field_required' class='text'>
<option value='0'{if $field_required == 0} SELECTED{/if}>{$admin_profile_addfield36}</option>
<option value='1'{if $field_required == 1} SELECTED{/if}>{$admin_profile_addfield35}</option>
</select>
</td>
</tr>
<tr>
<td class='form1'>{$admin_profile_addfield30}</td>
<td class='form2'>
<select name='field_browsable' class='text'>
<option value='2'{if $field_browsable == 2} SELECTED{/if}>{$admin_profile_addfield31}</option>
<option value='1'{if $field_browsable == 1} SELECTED{/if}>{$admin_profile_addfield32}</option>
<option value='0'{if $field_browsable == 0} SELECTED{/if}>{$admin_profile_addfield33}</option>
<option value='-1'{if $field_browsable == -1} SELECTED{/if}>{$admin_profile_addfield41}</option>
</select>
</td>
</tr>
</table>

<div id='box6' style='display: {$box6_display}'>
<table cellpadding='0' cellspacing='0'>
<tr>
<td class='form1' width='150' nowrap='nowrap'>{$admin_profile_addfield42}</td>
<td class='form2'>
<input type='text' name='field_html' maxlength='200' size='30' class='text'>
<br>{$admin_profile_addfield43}
</td>
</tr>
</table>
</div>

<div id='box1' name='box1' style='display: {$box1_display};'>
<table cellpadding='0' cellspacing='0'>
<tr>
<td class='form1' width='150'>{$admin_profile_addfield13}</td>
<td class='form2'>
<select name='field_maxlength' class='text'>
<option{if $field_maxlength == 50} SELECTED{/if}>50</option>
<option{if $field_maxlength == 100} SELECTED{/if}>100</option>
<option{if $field_maxlength == 150} SELECTED{/if}>150</option>
<option{if $field_maxlength == 200} SELECTED{/if}>200</option>
<option{if $field_maxlength == 250} SELECTED{/if}>250</option>
</select>
</td>
</tr>
<tr>
<td class='form1'>{$admin_profile_addfield39}</td>
<td class='form2'>
<input type='text' class='text' name='field_link' value='{$field_link}' size='30' maxlength='250'>
<br>{$admin_profile_addfield40}
</td>
</tr>
<tr>
<td class='form1' width='150'>{$admin_profile_addfield14}</td>
<td class='form2'>
<input type='text' class='text' name='field_regex' value='{$field_regex}' size='30' maxlength='250'>
<br>{$admin_profile_addfield15}
</td>
</tr>
</table>
</div>

<div id='box3' name='box3' style='display: {$box3_display};'>
<table cellpadding='0' cellspacing='0'>
<tr>
<td class='form1' width='150' NOWRAP style='vertical-align: top;'>{$admin_profile_addfield17}</td>
<td class='form2'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td>{$admin_profile_addfield19}</td>
  <td>{$admin_profile_addfield20}</td>
  <td>{$admin_profile_addfield21}</td>
  </tr>

{section name=select_loop loop=$select_options}
  <tr>
  <td><input type='text' class='text' name='select_label{$select_options[select_loop].select_id}' value='{$select_options[select_loop].select_label}' size='30' maxlength='50'></td>
  <td><select name='select_dependency{$select_options[select_loop].select_id}' class='text'><option value='0'{if $select_options[select_loop].select_dependency == 0} SELECTED{/if}>{$admin_profile_addfield3}</option><option value='1'{if $select_options[select_loop].select_dependency == 1} SELECTED{/if}>{$admin_profile_addfield4}</option></select></td>
  <td><input type='text' class='text' name='select_dependent_label{$select_options[select_loop].select_id}' value='{$select_options[select_loop].select_dependent_label}' size='30' maxlength='100'></td>
  </tr>
{/section}

  <tr>
  <td colspan='4'><p id='newfields3'></p></td>
  </tr>
  <tr>
  <td colspan='4'><a href="javascript:addInput('newfields3')">{$admin_profile_addfield22}</a></td>
  </tr>
  </table>
&nbsp;
</td>
<input type='hidden' name='num_select_options' value='1'>
</tr>
</table>
</div>

<div id='box4' name='box4' style='display: {$box4_display};'>
<table cellpadding='0' cellspacing='0'>
<tr>
<td class='form1' width='150' style='vertical-align: top;'>{$admin_profile_addfield17}</td>
<td class='form2' style='vertical-align: top;'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td>{$admin_profile_addfield19}</td>
  <td>{$admin_profile_addfield20}</td>
  <td>{$admin_profile_addfield21}</td>
  </tr>

{section name=radio_loop loop=$radio_options}
  <tr>
  <td><input type='text' class='text' name='radio_label{$radio_options[radio_loop].radio_id}' value='{$radio_options[radio_loop].radio_label}' size='30' maxlength='50'></td>
  <td><select name='radio_dependency{$radio_options[radio_loop].radio_id}' class='text'><option value='0'{if $radio_options[radio_loop].radio_dependency == 0} SELECTED{/if}>{$admin_profile_addfield3}</option><option value='1'{if $radio_options[radio_loop].radio_dependency == 1} SELECTED{/if}>{$admin_profile_addfield4}</option></select></td>
  <td><input type='text' class='text' name='radio_dependent_label{$radio_options[radio_loop].radio_id}' value='{$radio_options[radio_loop].radio_dependent_label}' size='30' maxlength='100'></td>
  </tr>
{/section}

  <tr>
  <td colspan='3'><p id='newfields4'></p></td>
  </tr>
  <tr>
  <td colspan='3'><a href="javascript:addInput('newfields4')">{$admin_profile_addfield22}</a></td>
  </tr>
  </table>
&nbsp;
</td>
<input type='hidden' name='num_radio_options' value='1'>
</tr>
</table>
</div>

<div id='box5' name='box5' style='display: {$box5_display};'>
<table cellpadding='0' cellspacing='0'>
<td class='form1' width='150'>{$admin_profile_addfield25}</td>
<td class='form2'>
<input type='checkbox' name='field_birthday' id='field_birthday' value='1'{if $field_birthday == 1} CHECKED{/if}>
<label for='field_birthday'>{$admin_profile_addfield38}</label>
</td>
</tr>
</table>
</div>

<br>

<table cellpadding='0' cellspacing='0'>
<tr>
<td class='form1' width='150'>&nbsp;</td>
<td><input type='submit' class='button' value='{$admin_profile_addfield23}'>&nbsp;</td>
<input type='hidden' name='task' value='addfield'>
<input type='hidden' name='o' value='{$o}'>
</form>
<form action='admin_profile_addfield.php' method='POST'>
<td><input type='submit' class='button' value='{$admin_profile_addfield24}'></td>
<input type='hidden' name='task' value='cancel'>
<input type='hidden' name='o' value='{$o}'>
</tr>
</table>
</form>





{include file='admin_footer.tpl'}