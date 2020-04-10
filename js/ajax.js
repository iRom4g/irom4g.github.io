function Ajax(doneHandler, failHandler)
{
  newAjax = this;
  this.onDone = doneHandler;
  this.onFail = failHandler;
  this.transport = this.getTransport();
  this.transport.onreadystatechange = ajaxTrampoline(this);
}

Ajax.prototype.get = function (uri, query, force_sync)
{
  // Firefox doesn't call onDone and onFail handlers if you force_sync
  force_sync = force_sync || false;
  if( typeof query != 'string' )
    query = ajaxArrayToQueryString(query);
  fullURI = uri+(query ? ('?'+query) : '');
  this.transport.open('GET', fullURI, !force_sync );
  this.transport.send('');
}

Ajax.prototype.post = function (uri, data, force_sync)
{
  force_sync = force_sync || false;
  if( typeof data != 'string' )
    data = ajaxArrayToQueryString(data);
  var post_form_id=ge('post_form_id');
  if (post_form_id)
    data+='&post_form_id='+post_form_id.value;
  this.transport.open('POST', uri, !force_sync);
  this.transport.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
  this.transport.send(data);
}

Ajax.prototype.stateDispatch = function ()
{
  if( this.transport.readyState == 1 && this.showLoad )
    ajaxShowLoadIndicator();
  
  if( this.transport.readyState == 4 ) {
    if( this.showLoad )
      ajaxHideLoadIndicator();
    if( this.transport.status >= 200 &&
        this.transport.status < 300 &&
        this.transport.responseText.length > 0 ) {
      if( this.onDone ) this.onDone(this, this.transport.responseText);
    } else {
      if( this.onFail ) this.onFail(this);
    }
  }
}

Ajax.prototype.getTransport = function ()
{
  var ajax = null;
  
  try { ajax = new XMLHttpRequest(); }
  catch(e) { ajax = null; }
  
  try { if(!ajax) ajax = new ActiveXObject("Msxml2.XMLHTTP"); }
  catch(e) { ajax = null; }
  
  try { if(!ajax) ajax = new ActiveXObject("Microsoft.XMLHTTP"); }
  catch(e) { ajax = null; }
  
  return ajax;
}

function ajaxTrampoline(ajaxObject)
{
  return function () { ajaxObject.stateDispatch(); };
}

function ajaxArrayToQueryString(queryArray)
{
  var sep = '';
  var query = "";
  
  for( var key in queryArray ) {
    query = query +
      sep +
      encodeURIComponent(key) +
      '=' +
      encodeURIComponent(queryArray[key]);
    sep = '&';
  }
  return query;
}

var ajaxLoadIndicatorRefCount = 0;

function ajaxShowLoadIndicator()
{
  indicatorDiv = ge('ajaxLoadIndicator');
  if( !indicatorDiv ) {
    indicatorDiv = document.createElement("div");
    indicatorDiv.id = 'ajaxLoadIndicator';
    indicatorDiv.innerHTML = 'Loading';
    indicatorDiv.className = 'ajaxLoadIndicator';
    document.body.appendChild(indicatorDiv);
  }
  
  indicatorDiv.style.top = (5 + pageScrollY()) + 'px';
  indicatorDiv.style.left = (5 + pageScrollX()) + 'px';
  indicatorDiv.style.display = 'block';
  ajaxLoadIndicatorRefCount++;
}

function ajaxHideLoadIndicator()
{
  ajaxLoadIndicatorRefCount--;
  if( ajaxLoadIndicatorRefCount == 0 )
    ge('ajaxLoadIndicator').style.display = '';
}