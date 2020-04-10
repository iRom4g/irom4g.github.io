{include file='admin_header.tpl'}

<h2>{$admin_connections1}</h2>
{$admin_connections2}

<br><br>

{* SHOW SUCCESS MESSAGE *}
{if $result != 0}
<div class='success'><img src='../images/success.gif' class='icon' border='0'> {$admin_connections24}</div>
{/if}

{* JAVASCRIPT FOR ADDING FRIENDSHIP TYPES *}
{literal}
<script type="text/javascript">
{/literal}
<!-- Begin
var friendtype_id = {$num_friendtypes};
{literal}
function addInput(fieldname) {
  var ni = document.getElementById(fieldname);
  var newdiv = document.createElement('div');
  var divIdName = 'my'+friendtype_id+'Div';
  newdiv.setAttribute('id',divIdName);
  newdiv.innerHTML = "<input type='text' name='friendtype_label" + friendtype_id +"' class='text' size='30' maxlength='50'>&nbsp;<br>";
  ni.appendChild(newdiv);
  friendtype_id++;
  window.document.info.num_friendtypes.value=friendtype_id;
}
// End -->
</script>
{/literal}


<form action='admin_connections.php' method='POST' name='info'>
<table cellpadding='0' cellspacing='0' width='600'>
<tr><td class='header'>{$admin_connections3}</td></tr>
<tr><td class='setting1'>
{$admin_connections4}
</td></tr><tr><td class='setting2'>
  <table cellpadding='0' cellspacing='0'><tr>
  <td style='vertical-align: top;'><input type='radio' name='setting_connection_allow' id='invitation_0' value='0'{if $invitation == 0} CHECKED{/if}>&nbsp;</td>
  <td><label for='invitation_0'><b>{$admin_connections9}</b><br>{$admin_connections5}</label>
  </td></tr></table>
</td></tr>
<tr><td class='setting2'>
  <table cellpadding='0' cellspacing='0'><tr>
  <td style='vertical-align: top;'><input type='radio' name='setting_connection_allow' id='invitation_3' value='3'{if $invitation == 3} CHECKED{/if}>&nbsp;</td>
  <td><label for='invitation_3'><b>{$admin_connections10}</b><br>{$admin_connections6}</label>
  </td></tr></table>
</td></tr>
<tr><td class='setting2'>
  <table cellpadding='0' cellspacing='0'><tr>
  <td style='vertical-align: top;'><input type='radio' name='setting_connection_allow' id='invitation_2' value='2'{if $invitation == 2} CHECKED{/if}>&nbsp;</td>
  <td><label for='invitation_2'><b>{$admin_connections11}</b><br>{$admin_connections7}</label>
  </td></tr></table>
</td></tr>
<tr><td class='setting2'>
  <table cellpadding='0' cellspacing='0'><tr>
  <td style='vertical-align: top;'><input type='radio' name='setting_connection_allow' id='invitation_1' value='1'{if $invitation == 1} CHECKED{/if}>&nbsp;</td>
  <td><label for='invitation_1'><b>{$admin_connections12}</b><br>{$admin_connections8}</label>
  </td></tr></table>
</td></tr>
</table>
<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr><td class='header'>{$admin_connections13}</td></tr>
<tr><td class='setting1'>
{$admin_connections14}
</td></tr><tr><td class='setting2'>
  <table cellpadding='0' cellspacing='0'><tr>
  <td style='vertical-align: top;'><input type='radio' name='setting_connection_framework' id='framework_0' value='0'{if $framework == 0} CHECKED{/if}>&nbsp;</td>
  <td><label for='framework_0'><b>{$admin_connections15}</b><br>{$admin_connections19}</label>
  </td></tr></table>
</td></tr><tr><td class='setting2'>
  <table cellpadding='0' cellspacing='0'><tr>
  <td style='vertical-align: top;'><input type='radio' name='setting_connection_framework' id='framework_1' value='1'{if $framework == 1} CHECKED{/if}>&nbsp;</td>
  <td><label for='framework_1'><b>{$admin_connections16}</b><br>{$admin_connections20}</label>
  </td></tr></table>
</td></tr><tr><td class='setting2'>
  <table cellpadding='0' cellspacing='0'><tr>
  <td style='vertical-align: top;'><input type='radio' name='setting_connection_framework' id='framework_2' value='2'{if $framework == 2} CHECKED{/if}>&nbsp;</td>
  <td><label for='framework_2'><b>{$admin_connections17}</b><br>{$admin_connections21}</label>
  </td></tr></table>
</td></tr><tr><td class='setting2'>
  <table cellpadding='0' cellspacing='0'><tr>
  <td style='vertical-align: top;'><input type='radio' name='setting_connection_framework' id='framework_3' value='3'{if $framework == 3} CHECKED{/if}>&nbsp;</td>
  <td><label for='framework_3'><b>{$admin_connections18}</b><br>{$admin_connections22}</label>
  </td></tr></table>
</td></tr></table>
<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr><td class='header'>{$admin_connections25}</td></tr>
<tr><td class='setting1'>
{$admin_connections26}
</td></tr><tr><td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr><td>{$admin_connections27}</td></tr>

{section name=type_loop loop=$types}
  <tr><td><input type='text' class='text' name='friendtype_label{$types[type_loop].friendtype_id}' value='{$types[type_loop].friendtype_label}' size='30' maxlength='50'>&nbsp;</td></tr>
{/section}

  <tr><td><p id='newtype'></p></td></tr>
  <tr><td><a href="javascript:addInput('newtype')">{$admin_connections28}</a></td><input type='hidden' name='num_friendtypes' value='{$num_friendtypes}'></tr>
  </table>
</td></tr><tr><td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr><td>&nbsp;</td><td><b>{$admin_connections29}</b></td></tr>
  <tr>
  <td style='vertical-align: top;'><input type='radio' name='setting_connection_other' id='other_1' value='1'{if $other == 1} CHECKED{/if}>&nbsp;</td>
  <td><label for='other_1'>{$admin_connections30}</label></td>
  </tr><tr>
  <td style='vertical-align: top;'><input type='radio' name='setting_connection_other' id='other_0' value='0'{if $other == 0} CHECKED{/if}>&nbsp;</td>
  <td><label for='other_0'>{$admin_connections31}</label></td>
  </tr></table>
</td></tr><tr><td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr><td>&nbsp;</td><td><b>{$admin_connections32}</b></td></tr>
  <tr>
  <td style='vertical-align: top;'><input type='radio' name='setting_connection_explain' id='explain_1' value='1'{if $explain == 1} CHECKED{/if}>&nbsp;</td>
  <td><label for='explain_1'>{$admin_connections33}</label></td>
  </tr><tr>
  <td style='vertical-align: top;'><input type='radio' name='setting_connection_explain' id='explain_0' value='0'{if $explain == 0} CHECKED{/if}>&nbsp;</td>
  <td><label for='explain_0'>{$admin_connections34}</label></td>
  </tr></table>
</td></tr></table>
<br>


<input type='submit' class='button' value='{$admin_connections23}'>
<input type='hidden' name='task' value='dosave'>
</form>
{include file='admin_footer.tpl'}