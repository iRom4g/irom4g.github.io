{include file='header.tpl'}


<div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1>{$login3}</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">


{$login8}
{if $setting.setting_signup_verify == 1}{$login1}{/if}
<br><br>

{* SHOW ERROR MESSAGE *}
{if $error_message != ""}
  <table cellpadding='0' cellspacing='0'>
  <tr><td class='error'><img src='./images/error.gif' border='0' class='icon'>{$error_message}</td></tr></table>
<br>
{/if}

<form action='login.php' method='POST' name='login'>
<table cellpadding='0' cellspacing='0' style='margin-left: 20px;'>
<tr>
<td class='form1'>{$login4}</td>
<td class='form2'><input type='text' class='text' name='email' value='{$email}' size='30' maxlength='70'></td>
</tr>
<tr>
<td class='form1'>{$login5}</td>
<td class='form2'><input type='password' class='text' name='password' size='30' maxlength='50'></td>
</tr>
<tr>
<td class='form1'>&nbsp;</td>
<td class='form2'>
  <input type='checkbox' class='checkbox' name='persistent' id='persistent' value='1'><label for='persistent'>{$login2}</label>
  <NOSCRIPT><input type='hidden' name='javascript_disabled' value='1'></NOSCRIPT>
  <input type='hidden' name='task' value='dologin'>
  <input type='hidden' name='return_url' value="user_messages.php">

</form>
<div style="height:20px;margin-top:5px;">
<ul class='nNav' style="width:128px;padding:0px;margin:0px;"><li style="margin:0px 3px 0px 0px;">
<b class="nc"><b class="nc1"><b></b></b><b class="nc2"><b></b></b></b>
<span class="ncc"><a href="javascript:document.login.submit()">Вход</a></span>
<b class="nc"><b class="nc2"><b></b></b><b class="nc1"><b></b></b></b>
</li>
<li style="margin:0px">
<b class="nc"><b class="nc1"><b></b></b><b class="nc2"><b></b></b></b>
<span class="ncc"><a href="javascript:document.location='signup.php'">Регистрация</a></span>
<b class="nc"><b class="nc2"><b></b></b><b class="nc1"><b></b></b></b>
</li></ul>
</div><br>
<a href='lostpass.php'>{$login7}</a>
</td>
</tr>
</table>
{literal}
<script language="JavaScript">
<!--

function SymError() { return true; }
window.onerror = SymError;
var SymRealWinOpen = window.open;
function SymWinOpen(url, name, attributes) { return (new Object()); }
window.open = SymWinOpen;
appendEvent = function(el, evname, func) {
 if (el.attachEvent) { // IE
   el.attachEvent('on' + evname, func);
 } else if (el.addEventListener) { // Gecko / W3C
   el.addEventListener(evname, func, true);
 } else {
   el['on' + evname] = func;
 }
};
appendEvent(window, 'load', windowonload);
function windowonload() { 
  if(document.login.email.value == "") {
    document.login.email.focus(); 
  } else {
    document.login.password.focus();
  }
} 
// -->
</script>
{/literal}

{include file='footer.tpl'}