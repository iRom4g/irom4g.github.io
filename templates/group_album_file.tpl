{include file='header.tpl'}
<link rel="stylesheet" href="css/rustyle.css" type="text/css" />
<link rel='stylesheet' href='css/dialog2.css' type='text/css' />
<link rel='stylesheet' href='css/mail2.css' type='text/css' />
<link rel='stylesheet' href='css/rustylex.css' type='text/css' />
<link rel='stylesheet' href='css/search.css' type='text/css' />
<link rel='stylesheet' href='css/photos.css' type='text/css' />

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
    commentBody.value = '';
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
  commentSubmit.value = '{/literal}{$group_album_file19}{literal}';
  commentSubmit.disabled = true;
  
}

function addComment(is_error, comment_body, comment_date) {
  if(is_error == 1) {
    var commentError = document.getElementById('comment_error');
    commentError.style.display = 'block';
    if(comment_body == '') {
      commentError.innerHTML = '{/literal}{$group_album_file20}{literal}';
    } else {
      commentError.innerHTML = '{/literal}{$group_album_file21}{literal}';
    }
    var commentSubmit = document.getElementById('comment_submit');
    commentSubmit.value = '{/literal}{$group_album_file10}{literal}';
    commentSubmit.disabled = false;
  } else {
    var commentError = document.getElementById('comment_error');
    commentError.style.display = 'none';
    commentError.innerHTML = '';

    var commentBody = document.getElementById('comment_body');
    commentBody.value = '';
    addText(commentBody);

    var commentSubmit = document.getElementById('comment_submit');
    commentSubmit.value = '{/literal}{$group_album_file10}{literal}';
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
    var newTable = "<table class='wallpost' border='0' cellspacing='0' width='100%'><tr><td class='image'>";
    {/literal}
      {if $user->user_info.user_id != 0}
        newTable += "<a href='{$url->url_create('profile',$user->user_info.user_username)}'><img src='{$user->user_photo('./images/nophoto.gif')}' class='photo' border='0' width='{$misc->photo_size($user->user_photo('./images/nophoto.gif'),'50','190','w')}'></a></td><td class='info'><div class='header'><a href='{$url->url_create('profile',$user->user_info.user_username)}'><b>{$user->user_info.user_username}</a></b> написал <br> <small>{$datetime->cdate("`$setting.setting_timeformat` `$group_album_file22` `$setting.setting_dateformat`", $datetime->timezone($smarty.now, $global_timezone))}</small>";
      {else}
        newTable += "<img src='./images/nophoto.gif' class='photo' border='0' width='67'></td><td class='album_item2'><table cellpadding='0' cellspacing='0' width='100%'><tr><td class='album_comment_author'><b>{$group_album_file14}</b> - {$datetime->cdate("`$setting.setting_timeformat` `$group_album_file22` `$setting.setting_dateformat`", $datetime->timezone($smarty.now, $global_timezone))}</td><td class='album_comment_author' align='right' nowrap='nowrap'>&nbsp;</td>";
      {/if}
      newTable += "</div><div class='text'>"+comment_body+"</div><div class='actions'><small><a href='user_messages_new.php?to={$user->user_info.user_username}'></a></small></div></td></tr></table>";
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


  <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1><a href='group.php?group_id={$group->group_info.group_id}'>{$group->group_info.group_title}</a> -> <a href='group_album.php?group_id={$group->group_info.group_id}'>{$group_album_file4}</a> -> {$groupmedia_info.groupmedia_title}</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">


{* SET MEDIA PATH *}
{assign var='groupmedia_dir' value=$group->group_dir($group->group_info.group_id)}
{assign var='groupmedia_path' value="`$groupmedia_dir``$groupmedia_info.groupmedia_id`.`$groupmedia_info.groupmedia_ext`"}

{* DISPLAY IMAGE *}
{if $groupmedia_info.groupmedia_ext == "jpg" OR 
    $groupmedia_info.groupmedia_ext == "jpeg" OR 
    $groupmedia_info.groupmedia_ext == "gif" OR 
    $groupmedia_info.groupmedia_ext == "png" OR 
    $groupmedia_info.groupmedia_ext == "bmp"}
  {assign var='file_src' value="<img src='`$groupmedia_path`' border='0'>"}

{* DISPLAY AUDIO *}
{elseif $groupmedia_info.groupmedia_ext == "mp3" OR 
        $groupmedia_info.groupmedia_ext == "mp4" OR 
        $groupmedia_info.groupmedia_ext == "wav"}
  {assign var='groupmedia_download' value="[ <a href='`$groupmedia_path`'>`$group_album_file5`</a> ]"}
  {assign var='file_src' value="<a href='`$groupmedia_path`'><img src='./images/icons/audio_big.gif' border='0'></a>"}

{* DISPLAY WINDOWS VIDEO *}
{elseif $groupmedia_info.groupmedia_ext == "mpeg" OR 
	$groupmedia_info.groupmedia_ext == "mpg" OR 
	$groupmedia_info.groupmedia_ext == "mpa" OR 
	$groupmedia_info.groupmedia_ext == "avi" OR 
	$groupmedia_info.groupmedia_ext == "ram" OR 
	$groupmedia_info.groupmedia_ext == "rm"}
  {assign var='groupmedia_download' value="[ <a href='`$groupmedia_path`'>`$group_album_file6`</a> ]"}
  {assign var='file_src' value="
    <object id='video'
      classid='CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6'
      type='application/x-oleobject'>
      <param name='url' value='`$groupmedia_path`'>
      <param name='sendplaystatechangeevents' value='True'>
      <param name='autostart' value='true'>
      <param name='autosize' value='true'>
      <param name='uimode' value='mini'>
      <param name='playcount' value='9999'>
    </OBJECT>
  "}

{* DISPLAY QUICKTIME FILE *}
{elseif $groupmedia_info.groupmedia_ext == "mov" OR 
	$groupmedia_info.groupmedia_ext == "moov" OR 
	$groupmedia_info.groupmedia_ext == "movie" OR 
	$groupmedia_info.groupmedia_ext == "qtm" OR 
	$groupmedia_info.groupmedia_ext == "qt"}
  {assign var='groupmedia_download' value="[ <a href='`$groupmedia_path`'>`$group_album_file6`</a> ]"}
  {assign var='file_src' value="
    <embed src='`$groupmedia_path`' controller='true' autosize='1' scale='1' width='550' height='350'>
  "}

{* EMBED FLASH FILE *}
{elseif $groupmedia_info.groupmedia_ext == "swf"}
  {assign var='file_src' value="
    <object width='350' height='250' classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0' id='mymoviename'> 
      <param name='movie' value='$groupmedia_path'>  
      <param name='quality' value='high'> 
      <param name='bgcolor' value='#ffffff'> 
      <embed src='`$groupmedia_path`' quality='high' bgcolor='#ffffff' name='Flash Movie' type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer'> 
      </embed> 
    </object> 
  "}

{* DISPLAY UNKNOWN FILETYPE *}
{else}
  {assign var='groupmedia_download' value="[ <a href='`$groupmedia_path`'>`$group_album_file7`</a> ]"}
  {assign var='file_src' value="<a href='`$groupmedia_path`'><img src='./images/icons/file_big.gif' border='0'></a>"}
{/if}





<div class="bar clearFix summaryBar">
 <div class="summary"><a class="notbold" href="group_album.php?group_id={$group->group_info.group_id}">Вернуться к альбому</a><span class='divider'>|</span><a class="notbold" href="group.php?group_id={$group->group_info.group_id}">Вернуться к группе</a></div>
 <ul class='pageList pagePhoto'>{if $link_first != "#"}<li><a id="prevp" href='{$link_first}'>&larr;</a></li>{/if}{if $link_next != "#"}<li><a id='nextp' href='{$link_next}'>&rarr;</a></li>{/if}</ul>
</div>
<div id="photoborder" class="clearfix" onMouseOut="currentTagArea = null; tagtimerID = setTimeout(function(), 100);">
 
	<div id="photoareaouter">
<div id="photoarea">
		{if $link_next != "#"}<a href="{$link_next}" id="myphotolink">{$file_src}</a>{else}{$file_src}{/if}
	 	<div id="tagframe2" ><div id="tagframe2inside3">{$file_src}</div></div>
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
<span class="text"></span>
</div>

  <div id="photocaption">
   {$groupmedia_info.groupmedia_desc}
   </div>
  <div class="clearFix">
   <div id="photodate"></div>
  </div>
 </div>
</div>
<div id="photoinfo">
{* <div id="photoactions">
 <a href="#">Редактировать фото</a>
 </div> *}


{* BEGIN COMMENTS *}

<div id="photocomment">
<div class='album' id='media_comments'>

  {* LOOP THROUGH GROUP MEDIA COMMENTS *}
  {section name=comment_loop loop=$comments}
    <div id='comment_{math equation='t-c' t=$comments|@count c=$smarty.section.comment_loop.index}'>
    <table class="wallpost" border="0" cellspacing="0" width="100%">
    <tr>
    <td class="image">
      {if $comments[comment_loop].comment_author->user_info.user_id != 0}
        <a href='{$url->url_create('profile',$comments[comment_loop].comment_author->user_info.user_username)}'><img src='{$comments[comment_loop].comment_author->user_photo('./images/nophoto.gif')}' class='photo' border='0' width='{$misc->photo_size($comments[comment_loop].comment_author->user_photo('./images/nophoto.gif'),'50','190','w')}'></a>
      {else}
        <img src='./images/nophoto.gif' class='photo' border='0' width='67'>
      {/if}
    </td>
    <td class="info">
      <div class="header">
      {if $comments[comment_loop].comment_author->user_info.user_id != 0}<a href='{$url->url_create('profile',$comments[comment_loop].comment_author->user_info.user_username)}' style='font-weight: bold;'>{$comments[comment_loop].comment_author->user_info.user_username}</a>{else}{$group_album_file14}{/if} написал<br> <small>{$datetime->cdate("`$setting.setting_timeformat` `$group_album_file22` `$setting.setting_dateformat`", $datetime->timezone($comments[comment_loop].comment_date, $global_timezone))}</small></div>
      <div class='text'>{$comments[comment_loop].comment_body}</div>
      <div class='actions'>
      <small> <a href='user_messages_new.php?to={$comments[comment_loop].comment_author->user_info.user_username}'>{$group_album_file23}</a></small>
      </div>
    </td>
    </tr>
    </table>
    </div>
  {/section}
</div>
    
  
{if $allowed_to_comment != 0}
<div id="photoaddcomment">
   <div id='comment_error' style='color: #FF0000; display: none;'></div>
   <iframe name='AddCommentWindow' style='display: none' src=''></iframe>  
 <div style="float:left"><div id="photoCommHead">Ваш комментарий (<span id='total_comments'>{$total_comments}</span>)</div></div>
    <form id='comment_submit' name='comment_submit'  action='group_album_file.php' method='post' target='AddCommentWindow' onSubmit='checkText()'>
    <textarea name='comment_body' id='comment_body' rows="7" cols="60" style="width: 400px" onfocus='removeText(this)' onblur='addText(this)'></textarea>
    {if $setting.setting_comment_code == 1}
      <td width='75' valign='top'><img src='./images/secure.php' id='secure_image' border='0' height='20' width='67' class='signup_code'></td>
      <td width='68' style='padding-top: 4px;'><input type='text' name='comment_secure' id='comment_secure' class='text' size='6' maxlength='10'></td>
      <td width='10'><img src='./images/icons/tip.gif' border='0' class='icon' onMouseover="tip('{$group_album_file24}')"; onMouseout="hidetip()"></td>
    {/if}
  <br>
  <ul class="buttonRow" style="margin-top:4px">
   <li><a style="width:11.5em" href="javascript:document.comment_submit.submit(); " onclick="postComment(); return false;">Добавить комментарий</a></li>
  </ul>
    <input type='hidden' name='groupmedia_id' value='{$groupmedia_info.groupmedia_id}'>
    <input type='hidden' name='group_id' value='{$group->group_info.group_id}'>
    <input type='hidden' name='task' value='dopost'>
 </form>
</div>
<br clear="both">
</div>
    
   </div>
  </div>
  </div>




{/if}
{* END COMMENTS *}


{include file='footer.tpl'}