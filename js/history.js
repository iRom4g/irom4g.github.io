function prepareRequest() {
var http_request = false; if (window.XMLHttpRequest) {http_request = new XMLHttpRequest();if (http_request.overrideMimeType) {}} else if (window.ActiveXObject) { try {http_request = new ActiveXObject("Msxml2.XMLHTTP");} catch (e) {try {http_request = new ActiveXObject("Microsoft.XMLHTTP");} catch (e) {}}} if (!http_request) {alert('Ошибк  при созд ни XMLHTTP'); return false;}return http_request;}

function getHistory(mid) {	
 http_request = prepareRequest();		
 pbar = "progr"; 
	ge(pbar).style.visibility = 'visible'; 
	ge(pbar).style.display = 'inline';
	setTimeout('ge(pbar).src = "images/upload.gif"', 200);
 http_request.onreadystatechange = function() {showHistory(http_request);}
 http_request.open('POST', 'mail.php?act=history');
 http_request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=windows-1251');
	http_request.send('mid='+mid);
}

function showHistory(http_request) {
var PickText, prevDiv;
 if (http_request.readyState == 4) {
  if (http_request.status == 200) {PickText = http_request.responseText;} else {PickText = 'There was a problem with the request.';}
  var prevDiv = ge('historyContents');prevDiv.innerHTML = PickText;
 }
}