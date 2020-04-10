{include file='header.tpl'}

<img src='./images/icons/friend_add48.gif' border='0' class='icon_big'>
<div class='page_header'>{$user_friends_add9}</div>
<div>
{$user_friends_add10} <b><a href='{$url->url_create('profile', $owner->user_info.user_username)}'>{$owner->user_info.user_username}</a></b> {$user_friends_add11}
</div>

<br><br>

{* DISPLAY RESULT *}
{if $result != ""}

  {* SET ICON FOR RESULT MESSAGE *}
  {if $is_error != ""}
    {assign var="icon" value="error.gif"}
  {else}
    {assign var="icon" value="success.gif"}
  {/if}

  <table cellpadding='0' cellspacing='0'>
  <tr><td class='result'>
    <img src='./images/{$icon}' class='icon'> 
    {$result}
  </td></tr>
  </table>
{/if}


{* DISPLAY BACK BUTTON IF NO CONFIRMATION *}
{if $confirm != 1}
  <br>
  <form action='profile.php' method='get'>
  <input type='submit' class='button' value='{$user_friends_add12}'>
  <input type='hidden' name='user' value='{$owner->user_info.user_username}'>
  </form>
{/if}


{* DISPLAY CONFIRMATION *}
{if $confirm == 1}

  {literal}
  <script language='JavaScript'>
  <!--
  function show_other() {
  	if(document.addform.friend_type.options[document.addform.friend_type.selectedIndex].value == 'other_friendtype') {
  		document.getElementById('other').style.display='block';
  	} else {
  		document.getElementById('other').style.display='none';
  	}
  }
  // -->
  </script>
  {/literal}

  <form action='user_friends_add.php' method='POST' name='addform'>
  <div>{$user_friends_add13} <a href='{$url->url_create('profile', $owner->user_info.user_username)}'>{$owner->user_info.user_username}</a>.</div><br>

  <table cellpadding='0' cellspacing='0'>
  {* SHOW FRIEND TYPES IF APPLICABLE *}
  {if $friend_types != ""}
    <tr>
    <td class='form1'>{$user_friends_add14}</td>
    <td class='form2'>
    <select name='friend_type' onChange='javascript: show_other();'>
    <option></option>
    {section name=type_loop loop=$friend_types}
      <option value='{$friend_types[type_loop]}'>{$friend_types[type_loop]}</option>
    {/section}
    {if $friend_other != 0}<option value='other_friendtype'>{$user_friends_add15}</option>{/if}
    </select>
    </td>

    {if $friend_other != 0}
      <td class='form2' style='display: none;' id='other'>&nbsp;<input type='text' class='text' name='friend_type_other' maxlength='50'></td>
    {else}
      <input type='hidden' name='friend_type_other' value=''>
    {/if}

    </tr>
  {else}
    {if $friend_other != 0}
      <tr>
      <td class='form1'>{$user_friends_add16}</td>
      <td class='form2'><input type='text' name='friend_type_other' maxlength='50'></td>
      </tr>
    {else}
      <input type='hidden' name='friend_type_other' value=''>
    {/if}
    <input type='hidden' name='friend_type' value=''>
  {/if}
  </table>

  <br>

  {* SHOW FRIEND EXPLANATION IF APPLICABLE *}
  {if $friend_explain != 0}
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td>
    <b>{$user_friends_add17}</b><br>
    <textarea name='friend_explain' rows='5' cols='60'></textarea>
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
     <input type='submit' class='button' value='{$user_friends_add18}'>&nbsp;
     <input type='hidden' name='task' value='add'>
     <input type='hidden' name='user' value='{$owner->user_info.user_username}'>
     </form>
     </td>
     <td>
       <form action='user_friends_add.php' method='POST'>
       <input type='submit' class='button' value='{$user_friends_add19}'>
       <input type='hidden' name='task' value='cancel'>
       <input type='hidden' name='user' value='{$owner->user_info.user_username}'>
       </form>
     </td>
     </tr>
     </table>
  </td>
  </tr>
  </table>
{/if}

{include file='footer.tpl'}