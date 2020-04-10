            function prepareRequest() {

                var http_request = false;

                if (window.XMLHttpRequest) { // Mozilla, Safari,...
                    http_request = new XMLHttpRequest();
                    if (http_request.overrideMimeType) {
                        // See note below about this line
                    }
                } else if (window.ActiveXObject) { // IE
                    try {
                        http_request = new ActiveXObject("Msxml2.XMLHTTP");
                    } catch (e) {
                        try {
                            http_request = new ActiveXObject("Microsoft.XMLHTTP");
                        } catch (e) {}
                    }
                }
                if (!http_request) {
                  alert('Ошибка при создании XMLHTTP'); return false;
                }
		return http_request;
	    }
	
            function makeRequest(url, this_value, list_value) {
		
                http_request = prepareRequest();
		
		var myvalue1 = ge(this_value).value;
                prevDiv = document.getElementById(list_value); 

	        prevDiv.innerHTML = "<select class='select'><option values='0'>...Идёт загрузка...</option></select>";
                http_request.onreadystatechange = function() { alertContents(http_request, list_value); }
                http_request.open('POST', url);
	        http_request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=windows-1251');
		http_request.send('uni='+escape(myvalue1));
            }

            function showMore(url, list_value) {		
                http_request = prepareRequest();
		prevDiv = document.getElementById(list_value);
	        prevDiv.innerHTML = "<option values='0'>...Идёт загрузка...</option>";
                http_request.onreadystatechange = function() {alertContents(http_request, list_value); }
                http_request.open('POST', url);
	        http_request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=windows-1251');
		http_request.send('uni=1');
            }

            function alertContents(http_request, list_value) {
            var PickText, prevDiv;
                if (http_request.readyState == 4) {
                    if (http_request.status == 200) {
                        PickText = parseResponse(http_request.responseText);
                    } else {
                        PickText = 'There was a problem with the request.';
                    }
		  prevDiv = document.getElementById(list_value); 
		  prevDiv.innerHTML = PickText;
                }
            }

	function kotUrlEncode(s) {
		return s.replace('%','%25','g').replace('&','%26','g').replace('+','%2B','g').replace('?','%3F','g');
	}

            function makeFRequest(url, n) {
		
                http_request = prepareRequest();		
		page = page + 1;
		if (n==3 || n==4) 
		{var seed=ge('reply_field').value; } else
		{var seed=ge('seed').value;}
		hide('msg'); hide('dld');
		if (n > 1) {var mid=ge('to_id').value; pbar = "progr2";} else 
		{pbar = "progr"; var mid=ge('mid').value;}
		ge(pbar).style.visibility = 'visible'; 
		ge(pbar).style.display = 'inline';
		setTimeout('ge(pbar).src = "images/upload.gif"', 200);
                http_request.onreadystatechange = function() { alertFContents(http_request, n); }
                http_request.open('POST', url);
	        http_request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=windows-1251');
		http_request.send('seed='+kotUrlEncode(seed)+'&fpage='+page+'&mid='+mid+'&n='+n);
		if (seed.charAt(0)=='!') alert(kotUrlEncode(seed));
            }

            function alertFContents(http_request, n) {
            var PickText, prevDiv;
                if (http_request.readyState == 4) {
                    if (http_request.status == 200) {
                        PickText = parseResponse(http_request.responseText);
                    } else {
                        PickText = 'There was a problem with the request.';
                    }
		  if (n>1) {var prevDiv = ge('fBox2'); pbar = "progr2";} else {var prevDiv = ge('fBox'); pbar = "progr";}
		  if (n==3) {hide('r'); show('msg');}
		  if (n==4) {show('dld');}
		  prevDiv.innerHTML = PickText;
		  ge(pbar).style.visibility = 'hidden'; 
  		  ge(pbar).style.display = 'none';
                }
            }

function parseResponse(response)
	{
    response= response.replace(/^[\s\n]+/g, '');

    if(response.substr(0,10)=="<noscript>")
    {
      try{
        var arr = response.substr(10).split("</noscript>");
        eval(arr[0]);
        return arr[1];
      }catch(e){return response;}
    }else{return response;}
	}