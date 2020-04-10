<html>
<head>
<title>{$admin_login3}</title>

{literal}
<style type='text/css'>
body {
	text-align: center;
	background-color: #EEEEEE;
	background-image: url(../images/admin_login.gif);
	background-repeat: no-repeat;
	background-position: center center;
}
td.box {
	border: 1px dashed #AAAAAA;
	padding: 15px;
	background: #FFFFFF;
	font-family: "Trebuchet MS", tahoma, verdana, serif;
	font-size: 9pt;
}
td.login {
	font-family: "Trebuchet MS", tahoma, verdana, serif;
	font-size: 9pt;
}
input.text {
	font-family: arial, tahoma, verdana, serif;
	font-size: 9pt; 
}
div.error {
	text-align: center;
	padding-top: 3px;
	font-weight: bold;
}
input.button {
	font-family: arial, tahoma, verdana, serif;
	font-size: 9pt;
	background: #DDDDDD;
	padding: 2px;
	font-weight: bold;
}
a:link { color: #336699; }
a:visited { color: #336699; }
a:hover { color: #336699; }
</style>
{/literal}

</head>
<body>

<table height='100%' width='100%' cellpadding='0' cellspacing='0'>
<tr>
<td>

	<table cellpadding='0' cellspacing='0' align='center'>
	<tr>
	<td class='box'>
		<table cellpadding='0' cellspacing='0'>
		<form action='admin_login.php' name='login' method='POST'>
		<tr>
		<td class='login'>{$admin_login4} &nbsp;</td>
		<td class='login'><input type='text' class='text' name='username' maxlength='50'> &nbsp;</td>
		<td class='login'>{$admin_login5} &nbsp;</td>
		<td class='login'><input type='password' class='text' name='password' maxlength='50'> &nbsp;</td>
		<td class='login'><input type='submit' class='button' value='{$admin_login6}'></td>
		</tr>
		<input type='hidden' name='task' value='dologin'>
		<NOSCRIPT><input type='hidden' name='javascript' value='no'></NOSCRIPT>
		</form>
		</table>
	<div class='error'>{$error_message}</div>
	</td>
	</tr>
	</table>
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
function windowonload() { document.login.username.focus(); } 
// -->
</script>

</body>
</html>

{/literal}