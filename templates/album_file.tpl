{include file='header.tpl'}
<link rel='stylesheet' href='css/search.css' type='text/css' /><link rel='stylesheet' href='css/photos.css?18' type='text/css' />



{* JAVASCRIPT FOR ADDING COMMENT *}
{literal}
<script type='text/javascript'>
<!--
var comment_changed = 0;
var last_comment = {/literal}{$comments|@count}{literal};
var next_comment = last_comment+1;
var total_comments = {/literal}{$total_comments}{literal};

function removeText(commentBody) {
  if(comment_changed == 0) {
    commentBody.value='';
    commentBody.style.color='#000000';
    comment_changed = 1;
  }
}

function addText(commentBody) {
  if(commentBody.value == '') {
    commentBody.value = '{/literal}{$album_file20}{literal}';
    commentBody.style.color = '#888888';
    comment_changed = 0;
  }
}

function checkText() {
  if(comment_changed == 0) { 
    var commentBody = document.getElementById('comment_body');
    commentBody.value=''; 
  }
  var commentSubmit = document.getElementById('comment_submit');
  commentSubmit.value = '{/literal}{$album_file14}{literal}';
  commentSubmit.disabled = true;
  
}

function addComment(is_error, comment_body, comment_date) {
  if(is_error == 1) {
    var commentError = document.getElementById('comment_error');
    commentError.style.display = 'block';
    if(comment_body == '') {
      commentError.innerHTML = '{/literal}{$album_file15}{literal}';
    } else {
      commentError.innerHTML = '{/literal}{$album_file16}{literal}';
    }
    var commentSubmit = document.getElementById('comment_submit');
    commentSubmit.value = '{/literal}{$album_file11}{literal}';
    commentSubmit.disabled = false;
  } else {
    var commentError = document.getElementById('comment_error');
    commentError.style.display = 'none';
    commentError.innerHTML = '';

    var commentBody = document.getElementById('comment_body');
    commentBody.value = '';
    addText(commentBody);

    var commentSubmit = document.getElementById('comment_submit');
    commentSubmit.value = '{/literal}{$album_file11}{literal}';
    commentSubmit.disabled = false;

    if(document.getElementById('comment_secure')) {
      var commentSecure = document.getElementById('comment_secure');
      commentSecure.value=''
      var secureImage = document.getElementById('secure_image');
      secureImage.src = secureImage.src + '?' + (new Date()).getTime();
    }

    total_comments++;
    var totalComments = document.getElementById('total_comments');
    totalComments.innerHTML = total_comments;

    var newComment = document.createElement('div');
    var divIdName = 'comment_'+next_comment;
    newComment.setAttribute('id',divIdName);
    var newTable = "<table cellpadding='0' cellspacing='0' width='100%'><tr><td class='album_item1' width='80'>";
    {/literal}
      {if $user->user_info.user_id != 0}
        newTable += "<a href='{$url->url_create('profile',$user->user_info.user_username)}'><img src='{$user->user_photo('./images/nophoto.gif')}' class='photo' border='0' width='{$misc->photo_size($user->user_photo('./images/nophoto.gif'),'75','75','w')}'></a></td><td class='album_item2'><table cellpadding='0' cellspacing='0' width='100%'><tr><td class='album_comment_author'><b><a href='{$url->url_create('profile',$user->user_info.user_username)}'>{$user->user_info.user_username}</a></b> - {$datetime->cdate("`$setting.setting_timeformat` `$album_file22` `$setting.setting_dateformat`", $datetime->timezone($smarty.now, $global_timezone))}</td><td class='album_comment_author' align='right' nowrap='nowrap'>&nbsp;[ <a href='user_messages_new.php?to={$user->user_info.user_username}'>{$album_file23}</a> ]</td>";
      {else}
        newTable += "<img src='./images/nophoto.gif' class='photo' border='0' width='75'></td><td class='album_item2'><table cellpadding='0' cellspacing='0' width='100%'><tr><td class='album_comment_author'><b>{$album_file19}</b> - {$datetime->cdate("`$setting.setting_timeformat` `$album_file22` `$setting.setting_dateformat`", $datetime->timezone($smarty.now, $global_timezone))}</td><td class='album_comment_author' align='right' nowrap='nowrap'>&nbsp;</td>";
      {/if}
      newTable += "</tr><tr><td colspan='2' class='album_comment_body'>"+comment_body+"</td></tr></table></td></tr></table>";
    {literal}
    newComment.innerHTML = newTable;
    var mediaComments = document.getElementById('media_comments');
    var prevComment = document.getElementById('comment_'+last_comment);
    mediaComments.insertBefore(newComment, prevComment);
    next_comment++;
    last_comment++;
  }
}
//-->
</script>
{/literal}

{* SET ALBUM TITLE *}
{if $album_info.album_title == ""}{assign var="album_title" value=$album_file3}{else}{assign var="album_title" value=$album_info.album_title}{/if}




{* SET MEDIA PATH *}
{assign var='media_dir' value=$url->url_userdir($owner->user_info.user_id)}
{assign var='media_path' value="`$media_dir``$media_info.media_id`.`$media_info.media_ext`"}


{* DISPLAY IMAGE *}
{if $media_info.media_ext == "jpg" OR 
    $media_info.media_ext == "jpeg" OR 
    $media_info.media_ext == "gif" OR 
    $media_info.media_ext == "png" OR 
    $media_info.media_ext == "bmp"}
  {assign var='file_src' value="<img src='`$media_path`' border='0'>"}

{* DISPLAY AUDIO *}
{elseif $media_info.media_ext == "mp3" OR 
        $media_info.media_ext == "mp4" OR 
        $media_info.media_ext == "wav"}
  {assign var='media_download' value="[ <a href='`$media_path`'>`$album_file6`</a> ]"}
  {assign var='file_src' value="<a href='`$media_path`'><img src='./images/icons/audio_big.gif' border='0'></a>"}

{* DISPLAY WINDOWS VIDEO *}
{elseif $media_info.media_ext == "mpeg" OR 
	$media_info.media_ext == "mpg" OR 
	$media_info.media_ext == "mpa" OR 
	$media_info.media_ext == "avi" OR 
	$media_info.media_ext == "ram" OR 
	$media_info.media_ext == "rm"}
  {assign var='media_download' value="[ <a href='`$media_path`'>`$album_file7`</a> ]"}
  {assign var='file_src' value="
    <object id='video'
      classid='CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6'
      type='application/x-oleobject'>
      <param name='url' value='`$media_path`'>
      <param name='sendplaystatechangeevents' value='True'>
      <param name='autostart' value='true'>
      <param name='autosize' value='true'>
      <param name='uimode' value='mini'>
      <param name='playcount' value='9999'>
    </OBJECT>
  "}

{* DISPLAY QUICKTIME FILE *}
{elseif $media_info.media_ext == "mov" OR 
	$media_info.media_ext == "moov" OR 
	$media_info.media_ext == "movie" OR 
	$media_info.media_ext == "qtm" OR 
	$media_info.media_ext == "qt"}
  {assign var='media_download' value="[ <a href='`$media_path`'>`$album_file7`</a> ]"}
  {assign var='file_src' value="
    <embed src='`$media_path`' controller='true' autosize='1' scale='1' width='550' height='350'>
  "}

{* EMBED FLASH FILE *}
{elseif $media_info.media_ext == "swf"}
  {assign var='file_src' value="
    <object width='350' height='250' classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0' id='mymoviename'> 
      <param name='movie' value='$media_path'>  
      <param name='quality' value='high'> 
      <param name='bgcolor' value='#ffffff'> 
      <embed src='`$media_path`' quality='high' bgcolor='#ffffff' name='Flash Movie' type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer'> 
      </embed> 
    </object> 
  "}

{* DISPLAY UNKNOWN FILETYPE *}
{else}
  {assign var='media_download' value="[ <a href='`$media_path`'>`$album_file8`</a> ]"}
  {assign var='file_src' value="<a href='`$media_path`'><img src='./images/icons/file_big.gif' border='0'></a>"}
{/if}


  <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1><a href='{$url->url_create('profile', $owner->user_info.user_username)}'>{$owner->user_info.user_username}</a> &#187 <a href='{$url->url_create('albums', $owner->user_info.user_username)}'>{$album_file5}</a> &#187; <a href='{$url->url_create('album', $owner->user_info.user_username, $album_info.album_id)}'>{$album_title}</a>
</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">

<div class="bar clearFix summaryBar">
 <div class="summary"><span class='divider'>|</span><a class="notbold" href="{$url->url_create('album', $owner->user_info.user_username, $album_info.album_id)}">Вернуться к альбому</a></div>
 <ul class='pageList pagePhoto'>{if $link_first != "#"}<li><a id="prevp" href='{$link_first}'>&larr;</a></li>{/if}{if $link_next != "#"}<li><a id='nextp' href='{$link_next}'>&rarr;</a></li>{/if}</ul>
</div>
<div id="tagframe" style="display: none">
 <div id="tagframeinside" onmousedown="frameMouseDown(event);" onmouseup="frameMouseUp()"></div>
</div>
<div id="photoborder" class="clearfix" onMouseOut="currentTagArea = null; tagtimerID = setTimeout(function(), 100);">
 
	<div id="photoareaouter">
<div id="photoarea">
		{if $link_next != "#"}<a href='{$link_next}' id="myphotolink">{$file_src}</a>{else}{$file_src}{/if}
			<div id="tagframe2" ><div id="tagframe2inside3">{$file_src}</div></div>
		<span id="tagname" onMouseMove="clearTimeout(tagtimerID);clearTimeout(tagtimerID-1);return cancelEvent(event);" onMouseOut="currentTagArea = null; tagtimerID = setTimeout(function(), 100);"></span>
		<div id="nw" class="taghandle"></div><div id="n" class="taghandle"></div><div id="ne" class="taghandle"></div>
		<div id="e" class="taghandle"></div><div id="w" class="taghandle"></div>
		<div id="sw" class="taghandle"></div><div id="s" class="taghandle"></div><div id="se" class="taghandle"></div>
		<div id="fadedphoto" class="fadedphoto"></div>
		<div id="fadedphoto_top" class="fadedphoto"></div>
		<div id="fadedphoto_left" class="fadedphoto"></div>
		<div id="fadedphoto_right" class="fadedphoto"></div>
		<div id="fadedphoto_bottom" class="fadedphoto"></div> 
	</div></div>
 <div id="photocaptionleft">

<div id="photoLocation">
 <span class="text">Автор:</span><br />
 <a href='{$url->url_create('profile', $owner->user_info.user_username)}'>{$owner->user_info.user_username}</a> 
</div>

  <div id="photocaption">{$media_info.media_title}</div>
   <div id="phototags">
    
   </div>
  <div class="clearFix">
   <div id="photodate"></div>
  </div>
 </div>
</div>


<br>
{* SHOW ARROWS, HIDE IF NECESSARY *}
<table cellpadding='0' cellspacing='0' align='center'>
<tr>
<td width='30'>{if $link_first != "#"}<a href='{$link_first}'><img src='./images/icons/arrow_start.gif' class='icon' border='0'></a>{/if}</td>
<td width='30'>{if $link_back != "#"}<a href='{$link_back}'><img src='./images/icons/arrow_back.gif' class='icon' border='0'></a>{/if}
</td>
<td width='30'>{if $link_next != "#"}<a href='{$link_next}'><img src='./images/icons/arrow_next.gif' class='icon' border='0'></a>{/if}</td>
<td width='30'>{if $link_end != "#"}<a href='{$link_end}'><img src='./images/icons/arrow_end.gif' class='icon' border='0'></a>{/if}</td>
</tr>
</table>

<br>

{*<table cellpadding='0' cellspacing='0' align='center' width='100%'>
<tr>
<td align='center'>
  <div class='album_title'>{$media_info.media_title}</div>
  {if $media_info.media_desc != ""}{$media_info.media_desc}<br><br>{/if}
  {if $link_next != "#"}<a href='{$link_next}'>{$file_src}</a>{else}{$file_src}{/if}
  {if $media_download != ""}<br><br>{$media_download}{/if}

  <br><br>

  
  <table cellpadding='0' cellspacing='0' align='center'>
  <tr>
  <td>
    <table cellpadding='0' cellspacing='0'>
    <tr><td class='button'>
      <a href='user_report.php?return_url={$url->url_current()}'><img src='./images/icons/report16.gif' border='0' class='icon'>{$album_file12}</a>
    </td></tr>
    </table>
  </td>
  </tr>
  </table>
</td>
</tr>
</table> *}


<br>

{* BEGIN COMMENTS *}
<table cellpadding='0' cellspacing='0' width='100%'>
<tr>  
<td class='header'>
  {$album_file13} (<span id='total_comments'>{$total_comments}</span>)
</td>
</tr>
{if $allowed_to_comment != 0}
  <tr>
  <td class='album_postcomment'>
    <form action='album_file.php' method='post' target='AddCommentWindow' onSubmit='checkText()'>
    <textarea name='comment_body' id='comment_body' rows='2' cols='65' onfocus='removeText(this)' onblur='addText(this)' style='color: #888888; width: 100%;'>{$album_file20}</textarea>

    <table cellpadding='0' cellspacing='0' width='100%'>
    <tr>
    {if $setting.setting_comment_code == 1}
      <td width='75' valign='top'><img src='./images/secure.php' id='secure_image' border='0' height='20' width='67' class='signup_code'></td>
      <td width='68' style='padding-top: 4px;'><input type='text' name='comment_secure' id='comment_secure' class='text' size='6' maxlength='10'></td>
      <td width='10'><img src='./images/icons/tip.gif' border='0' class='icon' onMouseover="tip('{$album_file21}')"; onMouseout="hidetip()"></td>
    {/if}
    <td align='right' style='padding-top: 5px;'>
    <input type='submit' id='comment_submit' class='button' value='{$album_file11}'>
    <input type='hidden' name='user' value='{$owner->user_info.user_username}'>
    <input type='hidden' name='media_id' value='{$media_info.media_id}'>
    <input type='hidden' name='album_id' value='{$album_info.album_id}'>
    <input type='hidden' name='task' value='dopost'>
    </form>
    </td>
    </tr>
    </table>
    <div id='comment_error' style='color: #FF0000; display: none;'></div>
    <iframe name='AddCommentWindow' style='display: none' src=''></iframe>
  </td>
  </tr>
{/if}
<tr>
<td class='album' id='media_comments'>

  {* LOOP THROUGH MEDIA COMMENTS *}
  {section name=comment_loop loop=$comments}
    <div id='comment_{math equation='t-c' t=$comments|@count c=$smarty.section.comment_loop.index}'>
    <table cellpadding='0' cellspacing='0' width='100%'>
    <tr>
    <td class='album_item1' width='80'>
      {if $comments[comment_loop].comment_author->user_info.user_id != 0}
        <a href='{$url->url_create('profile',$comments[comment_loop].comment_author->user_info.user_username)}'><img src='{$comments[comment_loop].comment_author->user_photo('./images/nophoto.gif')}' class='photo' border='0' width='{$misc->photo_size($comments[comment_loop].comment_author->user_photo('./images/nophoto.gif'),'75','75','w')}'></a>
      {else}
        <img src='./images/nophoto.gif' class='photo' border='0' width='75'>
      {/if}
    </td>
    <td class='album_item2'>
      <table cellpadding='0' cellspacing='0' width='100%'>
      <tr>
      <td class='album_comment_author'><b>{if $comments[comment_loop].comment_author->user_info.user_id != 0}<a href='{$url->url_create('profile',$comments[comment_loop].comment_author->user_info.user_username)}'>{$comments[comment_loop].comment_author->user_info.user_username}</a>{else}{$album_file19}{/if}</b> - {$datetime->cdate("`$setting.setting_timeformat` `$album_file22` `$setting.setting_dateformat`", $datetime->timezone($comments[comment_loop].comment_date, $global_timezone))}</td>
      <td class='album_comment_author' align='right' nowrap='nowrap'>&nbsp;[ <a href='user_messages_new.php?to={$comments[comment_loop].comment_author->user_info.user_username}'>{$album_file23}</a> ]</td>
      </tr>
      <tr>
      <td colspan='2' class='album_comment_body'>{$comments[comment_loop].comment_body}</td>
      </tr>
      </table>
    </td>
    </tr>
    </table>
    </div>
  {/section}

</td>
</tr>
</table>
{* END COMMENTS *}





{include file='footer.tpl'}