{include file='header.tpl'}

<table class='tabs' cellpadding='0' cellspacing='0'>
<tr>
<td class='tab0'>&nbsp;</td>
<td class='tab1' NOWRAP><a href='user_friends.php'>{$user_friends_confirm3}</a></td>
<td class='tab'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='user_friends_requests.php'>{$user_friends_confirm4}</a></td>
<td class='tab'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='user_friends_requests_outgoing.php'>{$user_friends_confirm17}</a></td>
<td class='tab'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='user_friends_settings.php'>{$user_friends_confirm16}</a></td>
<td class='tab3'>&nbsp;</td>
</tr>
</table>

{literal}
<script language='JavaScript'>
<!--
function show_other() {
	if(document.confirmform.friend_type.options[document.confirmform.friend_type.selectedIndex].value == 'other_friendtype') {
		document.getElementById('other').style.display='block';
		document.getElementById('friend_type_other').focus();
	} else {
		document.getElementById('other').style.display='none';
		document.getElementById('friend_type_other').value = '';
	}
}
// -->
</script>
{/literal}

<img src='./images/icons/friends48.gif' border='0' class='icon_big'>
<div class='page_header'>{$user_friends_confirm5}</div>
<div>{$user_friends_confirm6} <a href='{$url->url_create('profile', $owner->user_info.user_username)}'>{$owner->user_info.user_username}</a>.</div>

<br><br>

<form action='user_friends_confirm.php' method='POST' name='confirmform'>
<table cellpadding='0' cellspacing='0'>

{* SHOW FRIEND TYPES IF APPLICABLE *}
{if $friend_types != ""}
  <tr>
  <td>
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td class='form1'>{$user_friends_confirm7}</td>
    <td class='form2'>
      <select name='friend_type' onChange='javascript: show_other();' style='margin-top: 0px;'>
      <option></option>
        {section name=type_loop loop=$friend_types}
          <option value='{$friend_types[type_loop]}'{if $friend_type == $friend_types[type_loop]} SELECTED{/if}>{$friend_types[type_loop]}</option>
        {/section}
      {if $setting.setting_connection_other != 0}<option value='other_friendtype'{if $friend_type_other != ""} SELECTED{/if}>{$user_friends_confirm8}</option>{/if}
      </select>
    </td>
    <td>
      {* SHOW OTHER SPECIFY FIELD IF NECESSARY *}
      {if $setting.setting_connection_other != 0}
	<table cellpadding='0' cellspacing='0' style='display: {if $friend_type_other != ""}block{else}none{/if};' id='other'>
        <tr>
        <td class='form1'>&nbsp;&nbsp; {$user_friends_confirm9}</td>
        <td class='form2' valign='middle'><input type='text' class='text' name='friend_type_other' id='friend_type_other' value='{$friend_type_other}' maxlength='50'></td>
        </tr>
	</table>
      {else}
        <input type='hidden' name='friend_type_other' value=''>
      {/if}
    </td>
    </tr>
    </table>
  </td>
  </tr>

{else}

  {if $setting.setting_connection_other != 0}
    <tr>
    <td class='form1'>{$user_friends_confirm10}</td>
    <td class='form2'><input type='text' name='friend_type_other' value='{$friend_type_other}' maxlength='50'></td>
    </tr>
  {else}
    <input type='hidden' name='friend_type_other' value=''>
  {/if}
  <input type='hidden' name='friend_type' value=''>
{/if}
</table>

<br>

{* SHOW FRIEND EXPLANATION IF APPLICABLE *}
{if $setting.setting_connection_explain != 0}
<table cellpadding='0' cellspacing='0'>
<tr>
<td>
  <b>{$user_friends_confirm11} <a href='{$url->url_create('profile', $owner->user_info.user_username)}'>{$owner->user_info.user_username}</a>{$user_friends_confirm12}</b><br>
  <textarea name='friend_explain' rows='5' cols='60' style='margin-top: 3px;'>{$friend_explain}</textarea>
</td>
</tr>
</table>
{else}
  <input type='hidden' name='friend_explain' value=''>
{/if}  


<table cellpadding='0' cellspacing='0'>
<tr><td colspan='2'>&nbsp;</td></tr>
<tr>
<td colspan='2'>
   <table cellpadding='0' cellspacing='0'>
   <tr>
   <td>
   <input type='submit' class='button' value='{$user_friends_confirm13}'>&nbsp;
   <input type='hidden' name='task' value='editdo'>
   <input type='hidden' name='user' value='{$owner->user_info.user_username}'>
   </form>
   </td>
   <td>
     <form action='user_friends.php' method='POST'>
     <input type='submit' class='button' value='{$user_friends_confirm14}'>
     <input type='hidden' name='task' value='cancel'>
     <input type='hidden' name='user' value='{$owner->user_info.user_username}'>
     </form>
   </td>
   </tr>
   </table>
</td>
</tr>
</table>

{include file='footer.tpl'}