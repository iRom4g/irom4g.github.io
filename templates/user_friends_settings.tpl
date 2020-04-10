{include file='header.tpl'}

  <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1> Мои друзья</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">

<div class="mailbox">
 
    <div class="clearFix tBar">
     <ul class="tabs" id="friendTabs" style="width:550px;float:left;">
	  <li><a href="user_friends.php" style="width:5em">{$user_friends_settings1}</a></li>
        <li><a href="user_friends_requests.php" style="width:11em">{$user_friends_settings2}</a></li>
        <li><a href="user_friends_requests_outgoing.php" style="width:10.5em">{$user_friends_settings11}</a></li>
        <li class="activeLink"><a href="user_friends_settings.php" style="width:9em">{$user_friends_settings3}</a></li>
     </ul>
	<div id="progAjax" style="float:right;display:none;margin-top:5px;"><IMG SRC="images/upload.gif"/></div>
    </div>

  <div class="bar clearFix actionBar">
<img src='./images/icons/friends48.gif' border='0' class='icon_big'>
<div class='page_header'>{$user_friends_settings4}</div>
<div>{$user_friends_settings5}</div>

<br>

{* SHOW SUCCESS MESSAGE *}
{if $result != 0}
  <table cellpadding='0' cellspacing='0'><tr><td class='result'>
  <div class='success'><img src='./images/success.gif' border='0' class='icon'> {$user_friends_settings6}</div>
  </td></tr></table>
{/if}

<br>

<form action='user_friends_settings.php' method='POST'>

<div><b>{$user_friends_settings7}</b></div>
<div class='form_desc'>{$user_friends_settings8}</div>
<table cellpadding='0' cellspacing='0'>
<tr><td><input type='checkbox' value='1' id='friendrequest' name='usersetting_notify_friendrequest'{if $user->usersetting_info.usersetting_notify_friendrequest == 1} CHECKED{/if}></td><td><label for='friendrequest'>{$user_friends_settings9}</label></td></tr>
</table>
<br>

<input type='submit' class='button' value='{$user_friends_settings10}'>
<input type='hidden' name='task' value='dosave'>
</form>


{include file='footer.tpl'}