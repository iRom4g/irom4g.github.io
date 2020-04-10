{assign var=profilepage value="1"}
{assign var=upl value=""}
{assign var=upl1  value="<img id='progr2' style='float:right; margin-top:3px' src='images/upload.gif'>"}
{include file='header.tpl'}
<link rel='stylesheet' href='css/group.css' type='text/css' />
<link rel='stylesheet' href='css/profilepro.css' type='text/css' />
<link rel='stylesheet' href='css/mail2.css' type='text/css' />

  <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1>{$group->group_info.group_title}</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">


{* JAVASCRIPT FOR ADDING COMMENT *}
{literal}
<script type='text/javascript'>
<!--
var comment_changed = 0;
var first_comment = 1;
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
  commentSubmit.value = "{/literal}{literal}";
  commentSubmit.disabled = true;
  
}

function addComment(is_error, comment_body, comment_date) {
  if(is_error == 1) {
    var commentError = document.getElementById('comment_error');
    commentError.style.display = 'block';
    if(comment_body == '') {
      commentError.innerHTML = '{/literal}{$group33}{literal}';
    } else {
      commentError.innerHTML = '{/literal}{$group34}{literal}';
    }
    var commentSubmit = document.getElementById('comment_submit');
    commentSubmit.value = '{/literal}{$group24}{literal}';
    commentSubmit.disabled = false;
  } else {
    var commentError = document.getElementById('comment_error');
    commentError.style.display = 'none';
    commentError.innerHTML = '';

    var commentBody = document.getElementById('comment_body');
    commentBody.value = '';
    addText(commentBody);

    var commentSubmit = document.getElementById('comment_submit');
    commentSubmit.value = '{/literal}{$group24}{literal}';
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

    if(total_comments > 10) {
      var oldComment = document.getElementById('comment_'+first_comment);
      if(oldComment) { oldComment.style.display = 'none'; first_comment++; }
    }

    var newComment = document.createElement('div');
    var divIdName = 'comment_'+next_comment;
    newComment.setAttribute('id',divIdName);
    var newTable = "<table class='wallpost' border='0' cellspacing='0' width='100%'><tr><td class='image'>";
    {/literal}
        newTable += "<a href='{$url->url_create('profile',$user->user_info.user_username)}'><img src='{$user->user_photo('./images/nophoto.gif')}' class='photo' border='0' width='{$misc->photo_size($user->user_photo('./images/nophoto.gif'),'50','175','w')}'></a></td><td class='info'><div class='header'> <a style='font-weight: bold;' href='{$url->url_create('profile',$comments[comment_loop].comment_author->user_info.user_username)}'>{$user->user_info.user_username}</a> <b>написал(а)</b><br /> <small>{$datetime->cdate("`$setting.setting_dateformat` в `$setting.setting_timeformat`", $datetime->timezone($smarty.now, $global_timezone))}</small></div>";
        newTable += "<div class='text'>"+comment_body+"</div><div class='actions'><a href='user_messages_new.php?to={$comments[comment_loop].comment_author->user_info.user_username}'><small>Сообщение</small></a> <span style='font-size:10px'>|</span> <a href='{$url->url_create('profile',$comments[comment_loop].comment_author->user_info.user_username)}#comments'><small>Написать на его стене</small></a></div></td></tr></table>";
    {literal}
    newComment.innerHTML = newTable;
    var profileComments = document.getElementById('profile_comments');
    var prevComment = document.getElementById('comment_'+last_comment);
    profileComments.insertBefore(newComment, prevComment);
    next_comment++;
    last_comment++;
  }
}
//-->
</script>
{/literal}


<div class="two_column profile clearFix" id="group">
{* BEGIN LEFT COLUMN *}
 <div class="left">
    {* SHOW GROUP INFORMATION *}
 <div class="flexOpen" id="information">
   <div class="bOpen">
    <div class="flexHeader clearFix" onclick="return collapseBox('information', this, 0.90, 0.50, true)" onfocus="blur()">
     <div><h2>{$group14}</h2></div>
    </div>
   </div>
   <div class="c" >
    <div class="flexBox clearFix ">
      <table cellpadding='0' cellspacing='0'>
      {if $group->group_info.group_title != ""}<tr><td width='100' valign='top' nowrap='nowrap'>{$group15}</td><td>{$group->group_info.group_title}</td></tr>{/if}
      {if $group->group_info.group_desc != ""}<tr><td valign='top' nowrap='nowrap'>{$group16}</td><td>{$group->group_info.group_desc}</td></tr>{/if}
      {if $group_category != ""}<tr><td valign='top' nowrap='nowrap'>{$group17}</td><td><a href='user_group_browse.php?groupcat_id={$group->group_info.group_groupcat_id}'>{$group_category}</a></td></tr>{/if}
      {* LOOP THROUGH GROUP FIELDS, DISPLAY IF NOT BLANK *}
      {section name=field_loop loop=$fields}
        <tr>
        <td width='100' valign='top' nowrap='nowrap'>{$fields[field_loop].field_title}:</td>
        <td>{$fields[field_loop].field_value_group}</td>
        </tr>
      {/section}
      </table>
    </td>
    </tr>
    </table>

    </div>
   </div>
  </div>
    {* END GROUP INFORMATION *}

    {* SHOW DISCUSSION *}
{if $total_topics != 0 }
    {if ($group->group_info.group_discussion != 7 && $group->groupowner_level_info.level_group_discussion != 7)}
   <div class="flexOpen" id="topics">
   <div class="bOpen">
    <div class="flexHeader clearFix" onclick="return collapseBox('topics', this, 0.90, 0.50, true)" onfocus="blur()">
     <div><h2>{$group42} <span>({$total_topics})</span></h2></div>
    </div>
   </div>
   <div class="c" >
    <div class="fSub clearFix">
     <h3>
      <div style="float:left">
       В группе <a href='group_discussion.php?group_id={$group->group_info.group_id}'>{$total_topics} темы</a>.
      </div>
      <div style="float:right">
       <a href='group_discussion_post.php?group_id={$group->group_info.group_id}'>Новая тема</a><span class="divide">|</span><a href='group_discussion.php?group_id={$group->group_info.group_id}'>Все</a>
      </div>
     </h3>
    </div>
    <div class="clearFix">
        {* LOOP THROUGH TOPICS *}
        {section name=topic_loop loop=$topics}
        <div class="boardTopic clearFix">
	  <div class="topicInfo">
	  <h3 class="topicTitle"><a href='group_discussion_view.php?group_id={$group->group_info.group_id}&grouptopic_id={$topics[topic_loop].grouptopic_id}'>{$topics[topic_loop].grouptopic_subject}</a></h3><div class="moreInfo clearFix"><div style="float: left;"><span style="color: #333">
	    {$topics[topic_loop].groupposts_total} {$group46} </span>{$datetime->time_since($topics[topic_loop].grouptopic_date)}<a href='group_discussion_view.php?group_id={$group->group_info.group_id}&grouptopic_id={$topics[topic_loop].grouptopic_id}'>&rarr;</a></div></div>
	  </div></div>
        {/section}
   </div></div></div>
    {/if}{/if}
{if $total_topics == 0 }
  <div class="flexOpen" id="topics">
   <div class="bOpen">
    <div class="flexHeader clearFix" onclick="return collapseBox('topics', this, 0.90, 0.50, true)" onfocus="blur()">
     <div><h2>Обсуждения</h2></div>
    </div>
   </div>
   <div class="c" >
    <div class="flexBox clearFix photos">
     <div class='fallback'>В группе ещё нет тем. <a href="group_discussion_post.php?group_id={$group->group_info.group_id}">Создать тему...</a></div>
    </div>
   </div>
  </div>
{/if}
    {* END DISCUSSION *}


    {* SHOW PHOTOS *}
    {if $total_files != 0}
  <div class="flexOpen" id="photos">
   <div class="bOpen">
    <div class="flexHeader clearFix" onclick="return collapseBox('photos', this, 0.90, 0.50, true)" onfocus="blur()">
     <div><h2>{$group21} <span>({$total_files}) </span></h2></div>
    </div>
   </div>
   <div class="c" >
    <div class="fSub clearFix">
     <h3>
      <div style="float:left">
       В основном альбоме группы <a href="group_album.php?group_id={$group->group_info.group_id}">{$total_files} фотографий</a>.
      </div>
      <div style="float:right">
       {if $group->user_rank != -1}<a href="user_group_edit_files_upload.php?group_id={$group->group_info.group_id}">Добавить</a><span class="divide">|</span>{/if}<a href="group_album.php?group_id={$group->group_info.group_id}">Все</a>
      </div>
     </h3>
    </div>
    <div class="flexBox clearFix">
     <table class="img_table" cellspacing="0" border="0" height="100%">
      <tr>
 
        {* LOOP THROUGH PHOTOS *}
        {section name=file_loop loop=$files max=4}

          {* IF IMAGE, GET THUMBNAIL *}
          {if $files[file_loop].groupmedia_ext == "jpeg" OR $files[file_loop].groupmedia_ext == "jpg" OR $files[file_loop].groupmedia_ext == "gif" OR $files[file_loop].groupmedia_ext == "png" OR $files[file_loop].groupmedia_ext == "bmp"}
            {assign var='file_dir' value=$group->group_dir($group->group_info.group_id)}
            {assign var='file_src' value="`$file_dir``$files[file_loop].groupmedia_id`_thumb.jpg"}
          {* SET THUMB PATH FOR AUDIO *}
          {elseif $files[file_loop].groupmedia_ext == "mp3" OR $files[file_loop].groupmedia_ext == "mp4" OR $files[file_loop].groupmedia_ext == "wav"}
            {assign var='file_src' value='./images/icons/audio_big.gif'}
          {* SET THUMB PATH FOR VIDEO *}
          {elseif $files[file_loop].groupmedia_ext == "mpeg" OR $files[file_loop].groupmedia_ext == "mpg" OR $files[file_loop].groupmedia_ext == "mpa" OR $files[file_loop].groupmedia_ext == "avi" OR $files[file_loop].groupmedia_ext == "swf" OR $files[file_loop].groupmedia_ext == "mov" OR $files[file_loop].groupmedia_ext == "ram" OR $files[file_loop].groupmedia_ext == "rm"}
            {assign var='file_src' value='./images/icons/video_big.gif'}
          {* SET THUMB PATH FOR UNKNOWN *}
          {else}
            {assign var='file_src' value='./images/icons/file_big.gif'}
          {/if}

          {* START NEW ROW *}
          {cycle name="startrow2" values="<td><table height='100%'><tr>,,,,"}
          <td class="image" height="100%"><a href='group_album_file.php?group_id={$group->group_info.group_id}&groupmedia_id={$files[file_loop].groupmedia_id}'><img src='{$file_src}' class='photo' border='0' width='{$misc->photo_size($file_src,'75','200','w')}'></a></td>
          {* END ROW AFTER 4 RESULTS *}
          {if $smarty.section.file_loop.last == true}
            </tr></table></td>
          {else}
            {cycle name="endrow2" values=",,,,</tr></table></td>"}
          {/if}
        {/section}
      </tr>
     </table>
    </div>
   </div>
  </div>

    {else}
    <div class="flexOpen" id="photos">
   <div class="bOpen">
    <div class="flexHeader clearFix" onclick="return collapseBox('photos', this, 0.90, 0.50, true)" onfocus="blur()">
     <div><h2>Фотографии</h2></div>
    </div>
   </div>
   <div class="c" >
    <div class="flexBox clearFix photos">
     <div class='fallback'>В основном альбоме нет фотографий. {if $group->user_rank != -1}<a href='user_group_edit_files_upload.php?group_id={$group->group_info.group_id}'>Добавить...</a>{/if}</div>
    </div>
   </div>
  </div>
    {/if}
    {* END PHOTOS *}


    {* SHOW MEMBERS *}
<div class="flexOpen" id="members">
   <div class="bOpen">
    <div class="flexHeader clearFix" onclick="return collapseBox('members', this, 0.90, 0.50, true)" onfocus="blur()">
     <div><h2>{$group18}  <span>(В группе {$total_members} участника.)</span></h2></div>
     <IMG id="progr" style="float:right; display:none; margin-top:3px" SRC="images/upload.gif">
    </div>
   </div>
   <div class="c" >

        <div class="fSub clearFix">
     <h3>
      <div style="float:left">
       В группе <a href='group_members.php?group_id={$group->group_info.group_id}'>{$total_members} участника</a>.
      </div>
      <div style="float:right">
       <a href='group_members.php?group_id={$group->group_info.group_id}'>Все</a>
      </div>
     </h3>
    </div>

    <div class="flexBox clearFix">
     <div id="fBox"><table class="people_table" cellspacing="0" border="0" height="100%">
      <tr>
      {* LOOP THROUGH MEMBERS *}
      {section name=member_loop loop=$members max=6}
        {* START NEW ROW *}
        <td><table height='100%'><tr>        
        <td class="image" height="100%"><a href='{$url->url_create('profile', $members[member_loop].member->user_info.user_username)}'><img src='{$members[member_loop].member->user_photo('./images/nophoto.gif')}' class='photo' border='0' width='{$misc->photo_size($members[member_loop].member->user_photo('./images/nophoto.gif'),'50','150','w')}'></a></td></tr>
        <tr><td class="name">
        <a href='{$url->url_create('profile', $members[member_loop].member->user_info.user_username)}'>
        {$members[member_loop].member->user_info.user_username}</a></td>
       </tr></table></td>
       {/section}
      </tr>
     </table></div>
    </div>
   </div>
  </div>


    {* END MEMBERS *}





    {* BEGIN COMMENTS *}
  <div id="wall" class="flexOpen">
   <div class="bOpen">
    <div class="flexHeader clearFix" onclick="return collapseBox('wall', this, 0.5, 0.25, true)" onfocus="blur()">
     <div><h2>Стена <span id='total_comments'>({$total_comments})</span></h2></div>
     {$upl}
    </div>
   </div>
   <div class="c" >
    <div class="fSub clearFix">
     <h3>
      <div style="float: left;">
      {if $total_comments == 0}На стене пока нет записей.{/if}
      {if $total_comments < 10 AND $total_comments > 0}Показаны <a href="group_comments.php?group_id={$group->group_info.group_id}">{$total_comments}</a> записей.{/if}
      {if $total_comments >= 10}Показаны 10 записей из <a href="group_comments.php?group_id={$group->group_info.group_id}">{$total_comments}</a>.{/if}
      </div>
      <div style="float: right;" >
       <a href="javascript: quickReply('quickReply', 0.55, 0.40, 1); ge('reply_field').value = ''; shide('br');">Написать</a>
      </div>
     </h3>
    </div>
      <div id="quickReply">
     <div id="r" class="r" style="display:none">
      <div style="padding: 5px 12px">
          <form action='group_comments.php' method='post' target='AddCommentWindow' onSubmit='checkText()' name="postMessage" id="postMessage">
          <textarea name='comment_body' id='comment_body' rows='2' cols='65' onfocus='removeText(this)' onblur='addText(this)' style='width:360px; height:80px'></textarea>
          <input type='hidden' name='group_id' value='{$group->group_info.group_id}'>
          <input type='hidden' name='task' value='dopost'>
         </form>
       <div style="height:1.3em; height:25px;">
        <div id = "br" style="text-align:right">
  	<ul class="buttonRow" style="float:right;" class="clearFix">
  	 <li style="width:6.4em;"> <a style="width:5.4em;" onclick="return checkLinks();" id='comment_submit' href="javascript:document.postMessage.submit(); quickReply('quickReply', 0.55, 0.40, 1); ge('reply_field').value = ''; shide('br');">Отправить</a></li>
  	</ul>
        </div>
       </div>
      </div>
     </div>
    </div>
        <div id='comment_error' style='display: none;'></div>
        <iframe name='AddCommentWindow' style='display: none' src=''></iframe>
  <div class="flexBox clearFix" id="fBox2">
 

	<div id='profile_comments'>
      {* LOOP THROUGH PROFILE COMMENTS *}
      {section name=comment_loop loop=$comments}
      <div id='comment_{math equation='t-c' t=$comments|@count c=$smarty.section.comment_loop.index}'>
      <table class="wallpost" border="0" cellspacing="0" width="100%">
      <tr>
       <td class="image">
        <a href='{$url->url_create('profile',$comments[comment_loop].comment_author->user_info.user_username)}'>
         <img src='{$comments[comment_loop].comment_author->user_photo('./images/nophoto.gif')}' class='photo' border='0' width='{$misc->photo_size($comments[comment_loop].comment_author->user_photo('./images/nophoto.gif'),'50','175','w')}'>
       </a>
       </td>
       <td class="info">
        <div class="header">
         <a style="font-weight: bold;" href='{$url->url_create('profile',$comments[comment_loop].comment_author->user_info.user_username)}'>{$comments[comment_loop].comment_author->user_info.user_username}</a> <b>написал(а)</b><br />
         <small>{$datetime->cdate("`$setting.setting_dateformat` в `$setting.setting_timeformat`", $datetime->timezone($comments[comment_loop].comment_date, $global_timezone))}</small>
        </div>
        <div class="text">{$comments[comment_loop].comment_body}</div>
        <div class="actions">
         <a href="user_messages_new.php?to={$comments[comment_loop].comment_author->user_info.user_username}"><small>Сообщение</small></a> <span style='font-size:10px'>|</span> <a href="{$url->url_create('profile',$comments[comment_loop].comment_author->user_info.user_username)}#comments"><small>Написать на его стене</small></a>
        </div>
       </td>
      </tr>
     </table></div>
       {/section}
     </div>
    </div>
   </div>
  </div>
   
    {* END COMMENTS *}

</div>
    {* END LEFT COLUMN *}

    {* BEGIN RIGHT COLUMN *}

 <div class="right">
{* SHOW PHOTO *}
  <div class="picture">
  <img src='{$group->group_photo('./images/nophoto.gif')}'>
  </div>

  <ul id="nav" class="actionspro" style="margin:10px 0px 10px 0px;width:200px">
   <li><a href='group_members.php?group_id={$group->group_info.group_id}'>{$group2} ({$total_members})</a></li>
   {if $total_files != 0}<li><a href='group_album.php?group_id={$group->group_info.group_id}'>{$group29} ({$total_files})</a></li>{/if}
   {if $group->user_rank == -1}<li><a href='user_group_join.php?group_id={$group->group_info.group_id}&return_url={$url->url_current()}'>{$group3}</a></li>{/if}
   {if $group->user_rank != -1}<li><a href='user_group_leave.php?group_id={$group->group_info.group_id}'>{$group4}</a></li>{/if}   
   <li><a href='user_report.php?return_url={$url->url_current()}'>{$group38}</a></li>
  </ul>
 

    {* SHOW STATS *}
  <div class="flexOpen" id="groupType">
   <div class="bOpen">
    <div class="flexHeader clearFix" onclick="return collapseBox('groupType', this, 0.90, 0.50, true)" onfocus="blur()">
     <div><h2>{$group5}</h2></div>
    </div>
   </div>
   <div class="c" >
    <div class="flexBox clearFix admins">
      <table cellpadding='0' cellspacing='0'>
      <tr><td width='70' nowrap='nowrap'>{$group6}</td><td><a href='{$url->url_create('profile', $groupowner_info.user_username)}'>{$groupowner_info.user_username}</a></td></tr>
      <tr><td nowrap='nowrap'>{$group7}</td><td>{$group->group_info.group_views} {$group8}</td></tr>
      <tr><td nowrap='nowrap'>{$group9}</td><td>{$total_members} {$group10}</td></tr>
      <tr><td nowrap='nowrap'>{$group11}</td><td>{$total_files} {$group12}</td></tr>
      <tr><td nowrap='nowrap'>{$group48}</td><td>{$total_topics} {$group47}</td></tr>
      {if $group->group_info.group_dateupdated != 0}<tr><td>{$group13}</td><td>{$datetime->time_since($group->group_info.group_dateupdated)}</td></tr>{/if}
      </table>
    </div>
   </div>
  </div>
    {* END STATS *}


  {* END PRIVACY IF STATEMENT *}
</div>

{* END RIGHT COLUMN *}


{include file='footer.tpl'}