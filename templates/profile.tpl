{assign var=profilepage value="1"}
{include file='header.tpl'}
{php}
require('_drawrating.php');
{/php}

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
  commentSubmit.value = '';
  commentSubmit.disabled = true;
  
}
function addComment(is_error, comment_body, comment_date) {
  if(is_error == 1) {
    var commentError = document.getElementById('comment_error');
    commentError.style.display = 'block';
    if(comment_body == '') {
      commentError.innerHTML = '{/literal}{$profile46}{literal}';
    } else {
      commentError.innerHTML = '{/literal}{$profile47}{literal}';
    }
    var commentSubmit = document.getElementById('comment_submit');
    commentSubmit.value = '{/literal}{$profile48}{literal}';
    commentSubmit.disabled = false;
  } else {
    var commentError = document.getElementById('comment_error');
    commentError.style.display = 'none';
    commentError.innerHTML = '';

    var commentBody = document.getElementById('comment_body');
    commentBody.value = '';
    addText(commentBody);

    var commentSubmit = document.getElementById('comment_submit');
    commentSubmit.value = '{/literal}{$profile48}{literal}';
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
      newTable += "<a href='{$url->url_create('profile',$user->user_info.user_username)}'><img src='{$user->user_photo('./images/nophoto.gif')}' class='photo' border='0' width='{$misc->photo_size($user->user_photo('./images/nophoto.gif'),'50','199','w')}'></a></td><td class='info'><div class='header'><form id='delpost_{$comments[comment_loop].comment_id}' action='user_editprofile_comments.php' method='post' target='DelCommentWindow_{$comments[comment_loop].comment_id}' ><input type='hidden' name='comment_{$comments[comment_loop].comment_id}' value='1'><input type='hidden' name='task' value='delete'><input type='hidden' name='p' value='1'></form><a href='{$url->url_create('profile',$user->user_info.user_username)}' style='font-weight: bold;'>{$user->user_info.user_username}</a> написал <br><small>{$datetime->cdate("`$setting.setting_dateformat` в `$setting.setting_timeformat`", $datetime->timezone($smarty.now, $global_timezone))}</small></div><div class='text'>"+comment_body+"</div><div id='comment_error' style='display: none;'></div><iframe name='DelCommentWindow_{$comments[comment_loop].comment_id}' style='display: none' src=''></iframe></div>";
      newTable += "<div class='actions'><a href='{$url->url_create('profile',$user->user_info.user_username)}#comments'><small>Написать на моей стене</small></a></div></td></tr></table>";
    {literal}
    newComment.innerHTML = newTable;
    var profileComments = document.getElementById('profile_comments');
    var prevComment = document.getElementById('comment_'+last_comment);
    profileComments.insertBefore(newComment, prevComment);
    next_comment++;
    last_comment++;
  }
}

function action_delete(action_id) {
  var divname = 'action_' + action_id;
  var newsrc = 'action_delete.php?action_id=' + action_id;
  hidediv(divname);
  document.getElementById('actionimage').src = newsrc;
  document.getElementById('actions_total').value--;
  if(document.getElementById('actions_total').value == 0) {
    document.getElementById('actions').style.display = "none";
  }
}

//-->
</script>
{/literal}

  <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1> <b>{if $is_online == 1}ВСети{/if}</b>{$owner->user_info.user_username} - профиль</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">

<div id="userProfile" class="clearFix">

 <div id="leftColumn">
  <div align="center">
   <IMG SRC='{$owner->user_photo("./images/nophoto.gif")}' ALT ='' />
  </div>
  <div id="profileActions">

{if $owner->user_info.user_username != $user->user_info.user_username}
    {if $total_friends != 0}
   <a href='profile_friends.php?user={$owner->user_info.user_username}'>Друзья {$owner->user_info.user_username|truncate:10:"...":true}{$profile8}</a>
    {/if}
    {if $friendship_allowed != 0 && $user->user_exists != 0}
      {if $is_friend == TRUE}
      <a href='user_friends_confirm.php?task=remove&user={$owner->user_info.user_username}&return_url={$url->url_create('profile', $owner->user_info.user_username)}'>{$profile41}</a>
      {else}
      <a href='user_friends_add.php?user={$owner->user_info.user_username}'>Добавить в друзья</a>
      {/if}
    {/if}
    <a href='user_messages_new.php?to={$owner->user_info.user_username}'>{$profile10}</a>
{else}
    {if $total_friends != 0}
   <a href='profile_friends.php?user={$owner->user_info.user_username}'>Мои друзья</a>
    {/if}
   <a href='user_editprofile.php'>Редактировать страницу</a>
{/if}


  </div>

    {* BEGIN FRIEND LIST *}
{if $total_friends != 0 }
  <div id="friends" class="flexOpen">
   <div class="bOpen">
    <div class="flexHeader clearFix" onclick="return collapseBox('friends', this, 0.65, 0.30)" onfocus="blur()">
     <div><h2>Друзья <span>({$total_friends})</span></h2></div>
    </div>
   </div>
   <div class="c">
    <div class="whenOpen">
     <div class="fSub clearFix">
      <h3>
       <div class="fDetails wSeeAll">
        Всего друзей ({$total_friends})
       </div>
       <div class="fSeeAll">
        <a href="profile_friends.php?user={$owner->user_info.user_username}">&darr; Все</a>
       </div>
      </h3>
     </div>
     <div class="flexBox clearFix no_padding" style="margin-left:-7px">
      <div id = "fBox">

 
        {* LOOP THROUGH FRIENDS *}
        {if $total_friends >= 6}
        {assign var=cont value="0"}
        <table class='friendTable' cellpadding='0' cellspacing='0' height='100%'><tr>
          {section name=friend_loop loop=6}
          {* START NEW ROW *}
          <td height="100%" style="vertical-align: middle;">
          {assign var=cont value="`$cont+1`"}
          <a href='{$url->url_create('profile',$friends[friend_loop]->user_info.user_username)}'>
          <img src='{$friends[friend_loop]->user_photo('./images/nophoto.gif')}' width='{$misc->photo_size($friends[friend_loop]->user_photo('./images/nophoto.gif'),'50','999','w')}'><br>
          {$friends[friend_loop]->user_info.user_username}</a></td>
          {* END ROW AFTER 3 RESULTS *}
          {if $cont == 3}</tr>{/if}
          {if $cont == 6}</tr>{/if}
          {/section}
         {else}
         {assign var=cont value="0"}
        <table class='friendTable' cellpadding='0' cellspacing='0' height='100%'><tr>
          {section name=friend_loop loop=$friends}
          {* START NEW ROW *}
          <td height="100%" style="vertical-align: middle;">
          {assign var=cont value="`$cont+1`"}
          <a href='{$url->url_create('profile',$friends[friend_loop]->user_info.user_username)}'>
          <img src='{$friends[friend_loop]->user_photo('./images/nophoto.gif')}' width='{$misc->photo_size($friends[friend_loop]->user_photo('./images/nophoto.gif'),'50','999','w')}'><br>
          {$friends[friend_loop]->user_info.user_username}</a></td>
          {* END ROW AFTER 3 RESULTS *}
          {if $cont == 3}</tr>{/if}
          {if $cont == 6}</tr>{/if}
          {/section}
         {/if}
        </tr></table>
         </div>
     </div>
    </div>
   </div>
  </div>
    {/if}
    {* END FRIEND LIST *}




         {assign var=cont1 value="0"}
         {section name=friendsonline loop=$friends}
            {if $friends[friendsonline]->user_info.user_online == 1}
               {assign var=cont1 value="`$cont1+1`"}
            {/if}
         {/section}



 {* BEGIN ONLINE FRIEND LIST *}
       {if $cont1 != 0}
  <div id="friendsOnline" class="flexOpen">
   <div class="bOpen">
    <div class="flexHeader clearFix" onclick="return collapseBox('friendsOnline', this, 0.65, 0.30)" onfocus="blur()">
     <div><h2>Друзья ВСети<span> ({$cont1})</span></h2></div>
    </div>
   </div>
   <div class="c">
    <div class="whenOpen">
     <div class="fSub clearFix">
      <h3>
       <div class="fDetails wSeeAll">
        Друзей ВСети ({$cont1})
       </div>
       <div class="fSeeAll">
        <a href="profile_friends.php?user={$owner->user_info.user_username}">&darr; Все</a>
       </div>
      </h3>
     </div>
     <div class="flexBox clearFix no_padding" style="margin-left:-7px">
      <div id = "fBox">
        {* LOOP THROUGH FRIENDS *}
        {assign var=cont1 value="0"}
        <table class='friendTable' cellpadding='0' cellspacing='0' height='100%'><tr>
        {section name=friendsonline loop=$friends}
          {if $friends[friendsonline]->user_info.user_online == 1}
          {* START NEW ROW *}
          <td height="100%" style="vertical-align: middle;">
          {assign var=cont1 value="`$cont1+1`"}<a href='{$url->url_create('profile',$friends[friendsonline]->user_info.user_username)}'>
          <img src='{$friends[friendsonline]->user_photo('./images/nophoto.gif')}' width='{$misc->photo_size($friends[friendsonline]->user_photo('./images/nophoto.gif'),'50','999','w')}'><br>
          {$friends[friendsonline]->user_info.user_username}</a>
          </td>
          {* END ROW AFTER 3 RESULTS *}
          {if $cont1 == 3}</tr>{/if}
          {if $cont1 == 6}</tr>{/if}
          {/if}
        {/section}
        </tr></table>
       </div>
     </div>
    </div>
   </div>
  </div>
    {/if}

 {* END ONLINE FRIEND LIST *}



{* BEGIN ALBUMS *}
{if $owner->level_info.level_album_allow != 0 AND $total_albums > 0}
<div id="albums" class="flexOpen">
 <div class="bOpen">
  <div class="flexHeader clearFix" onclick="return collapseBox('albums', this, 0.65, 0.30)" onfocus="blur()">
   <div><h2>Альбомы <span>({$total_albums})</span></h2></div>
  </div>
 </div>
 <div class="c">
  <div class="whenOpen">
   <div class="fSub clearFix">
    <h3>
     <div class="fDetails wSeeAll">
      {$total_albums} альбомов
     </div>
     <div class="fSeeAll">
      {if $total_albums > 3}&nbsp;[ <a href='{$url->url_create('albums', $owner->user_info.user_username)}'>{$header_album3}</a> ]{/if}
     </div>
    </h3>
   </div>


    {* LOOP THROUGH FIRST 3 ALBUMS *}
    {section name=album_loop loop=$albums}

      {* SET ALBUM COVER *}
      {if $albums[album_loop].album_cover_id == 0}
        {assign var='album_cover_src' value='./images/icons/folder_big.gif'}
      {else}
        {* IF IMAGE, GET THUMBNAIL *}
        {if $albums[album_loop].album_cover_ext == "jpeg" OR $albums[album_loop].album_cover_ext == "jpg" OR $albums[album_loop].album_cover_ext == "gif" OR $albums[album_loop].album_cover_ext == "png" OR $albums[album_loop].album_cover_ext == "bmp"}
          {assign var='album_cover_dir' value=$url->url_userdir($owner->user_info.user_id)}
          {assign var='album_cover_src' value="`$album_cover_dir``$albums[album_loop].album_cover_id`_thumb.jpg"}
        {* SET THUMB PATH FOR AUDIO *}
        {elseif $albums[album_loop].album_cover_ext == "mp3" OR $albums[album_loop].album_cover_ext == "mp4" OR $albums[album_loop].album_cover_ext == "wav"}
          {assign var='album_cover_src' value='./images/icons/audio_big.gif'}
        {* SET THUMB PATH FOR VIDEO *}
        {elseif $albums[album_loop].album_cover_ext == "mpeg" OR $albums[album_loop].album_cover_ext == "mpg" OR $albums[album_loop].album_cover_ext == "mpa" OR $albums[album_loop].album_cover_ext == "avi" OR $albums[album_loop].album_cover_ext == "swf" OR $albums[album_loop].album_cover_ext == "mov" OR $albums[album_loop].album_cover_ext == "ram" OR $albums[album_loop].album_cover_ext == "rm"}
          {assign var='album_cover_src' value='./images/icons/video_big.gif'}
        {* SET THUMB PATH FOR UNKNOWN *}
        {else}
          {assign var='album_cover_src' value='./images/icons/file_big.gif'}
        {/if}
      {/if}

      {* SET ALBUM TITLE *}
      {if $albums[album_loop].album_title != ""}
        {assign var="album_title" value=$albums[album_loop].album_title}
      {else}
        {assign var="album_title" value=$header_album4}
      {/if}

   <div class="flexBox clearFix aPad">

{if $owner->level_info.level_album_allow != 0 AND $total_albums > 0}

   {* IF MORE THAN 3 ALBUMS, SHOW VIEW MORE LINKS *}
    {if $total_albums > 3}&nbsp;[ <a href='{$url->url_create('albums', $owner->user_info.user_username)}'>{$header_album3}</a> ]{/if}
       <table cellpadding='0' cellspacing='0'>
      <tr>
      <td width='1' style='padding: 5px 5px 5px 0px;' valign='top'><a href='{$url->url_create('album', $owner->user_info.user_username, $albums[album_loop].album_id)}'><img src='{$album_cover_src}' border='0' class='photo' width='{$misc->photo_size($album_cover_src,'75','75','w')}'></a></td>
      <td valign='top' style='padding: 2px 0px 0px 0px;'>
        <b><a href='{$url->url_create('album', $owner->user_info.user_username, $albums[album_loop].album_id)}'>{$album_title|truncate:17:"...":true}</a></b>
        {if $albums[album_loop].album_dateupdated > 0}<br>{$header_album5} {$datetime->time_since($albums[album_loop].album_dateupdated)}{/if}
      </td>
      </tr>
      </table>
{/if}

  </div>
  {/section}
  </div>
 </div>
</div>
{/if}
{* END ALBUMS *}


{* BEGIN BLOG ENTRIES *}
{if $owner->level_info.level_blog_allow != 0 AND $total_entries > 0}
<div id="notes" class="flexOpen">
 <div class="bOpen">
  <div class="flexHeader clearFix" onclick="return collapseBox('notes', this, 0.65, 0.30)" onfocus="blur()">
   <div><h2>{$header_blog2} <span>({$total_entries})</span></h2></div>
  </div>
 </div>
 <div class="c" >
  <div class="whenOpen">
   <div class="fSub clearFix">
    <h3>
     <div class="fDetails wSeeAll">
      {$total_entries} заметк{if $total_entries == 1}а{else}и{/if}.
     </div>
     <div class="fSeeAll">
      <a href='{$url->url_create('blog', $owner->user_info.user_username)}'>Все</a>
     </div>
    </h3>
   </div>
   <div class="flexBox clearFix aPad">
    <ul class="notes_titles">
 {section name=entry_loop loop=$entries}
   <li class="written">
   <a href='{$url->url_create('blog_entry', $owner->user_info.user_username, $entries[entry_loop].blogentry_id)}'>{if $entries[entry_loop].blogentry_title == ""}{$header_blog4}{else}{$entries[entry_loop].blogentry_title|truncate:35:"...":true}{/if}</a><small>{$datetime->time_since($entries[entry_loop].blogentry_date)}</small>
   </li>
{/section}
    </ul>
   </div>  
  </div>
 </div>
</div>
   



{/if}
{* END BLOG ENTRIES *}



{* BEGIN GROUPS *}
{if $total_groups != 0}
<div id="groups" class="flexOpen">
 <div class="bOpen">
  <div class="flexHeader clearFix" onclick="return collapseBox('groups', this, 0.65, 0.30)" onfocus="blur()">
   <div><h2>Группы <span>({$total_groups})</span></h2></div>
    <div class="flexEdit" >
    </div>
  </div>
 </div>
 <div class="c" >
  <div class="whenOpen">
   <div class="fSub clearFix">
    <h3>
     <div class="fDetails wSeeAll">
      {$total_groups} {if $total_groups ==1 }группа{/if} {if $total_groups >=2 AND $total_groups <=4 }группы{/if} {if $total_groups > 4}групп{/if} 
     </div>
     <div class="fSeeAll">
      <a href="user_group_browse.php">&darr; Все</a>
     </div>
    </h3>
   </div>
   <div class="flexBox clearFix aPad">
        {section name=group_loop loop=$groups}
      <a href='group.php?group_id={$groups[group_loop].group->group_info.group_id}'>{$groups[group_loop].group->group_info.group_title}</a>{if !$smarty.section.group_loop.last} &#x25AA;{/if}
    {/section}
   </div>  
  </div>
 </div>
</div>
{/if}
{* END GROUPS *}
</div>


{*НАЧАЛО ПРАВОЙ КОЛОНКИ*}
<div id="rightColumn">
  <div class="accountInfo clearFix" >
   <div class="profileName">
    <h2>{$tabs[0].fields[3].field_value_profile} {$tabs[0].fields[4].field_value_profile} {$tabs[0].fields[5].field_value_profile}</h2>
   </div>
   <div class="profileNetworks">
    <ul>
     <li>{$tabs[0].fields[6].field_value_profile}</li>
    </ul>
   </div>
    <div class="activity_all">
	<div class="left_side">
	 {* SHOW STATUS *}
  <div id='ajax_currentstatus_none'{if $user->user_info.user_status != ""} style='display: none;'{/if}>
  <div class="profile_empty_activity" id="profile_empty_activity" style="display: block">
  {if $owner->user_info.user_username == $user->user_info.user_username}<a href="javascript:void(0);" onClick="changeStatus()">[ Изменить статус ]</a>{/if}
  </div></div>
      <div id='ajax_currentstatus'{if $user->user_info.user_status == ""} style='display: none;'{/if}>
        <span id='ajax_currentstatus_value'>{$owner->user_info.user_status|choptext:12:"<br>"}</span>
        {if $owner->user_info.user_username == $user->user_info.user_username}<small><a href="javascript:void(0);" onClick="changeStatus()">ред.</a></small>{/if}
      </div>
      <div id='ajax_changestatus' style='display: none;'>
	<form action='user_editprofile_status.php' method='post' id='ajax_statusform' target='ajax_statusframe' onSubmit="changeStatus_do()">
      Новый статус:  
	<input type='text' class='text_small' name='status_new' id='status_new' maxlength='100' value='{$user->user_info.user_status}' size='10' style='width: 140px; margin: 2px 0px 2px 0px;'>  
        <a href="javascript:void(0);" onClick="changeStatus_submit();">Сохранить</a> | 
        <a href="javascript:void(0);" onClick="changeStatus_return();">Отмена</a>
	<input type='hidden' name='task' value='dosave'>
	<input type='hidden' name='is_ajax' value='1'>
	</form>
      </div>
      <iframe id='uploadframe' name='ajax_statusframe' style='display: none;' src="user_editprofile_status.php?task=blank"></iframe> 
    </td>
    </tr>
    </table>
  </td>
  </tr>
  </table>
</div></div></div>


{*Здесь заканчивается статус и начинается базовая инфа*}
{*Начало инфы*}

  <div class="basicInfo">
   <table class="profileTable" cellpadding="0" cellspacing="0">



    {* SHOW PROFILE TABS AND FIELDS *}
       <tr>
       <td class="label">{$tabs[0].fields[0].field_title}:</td>
       <td class="data">{$tabs[0].fields[0].field_value_profile}</td>        
       </tr>   

       <tr>
       <td class="label">{$tabs[0].fields[1].field_title}:</td>
       <td class="data">{$tabs[0].fields[1].field_value_profile}</td>        
       </tr>   


       <tr>
       <td class="label">{$tabs[0].fields[2].field_title}:</td>
       <td class="data">{$tabs[0].fields[2].field_value_profile}
        {if $tabs[0].fields[2].field_birthday == 1} {$datetime->age($tabs[0].fields[2].field_value)}
        {if $datetime->age($tabs[0].fields[2].field_value) == 0}лет{/if}
        {if $datetime->age($tabs[0].fields[2].field_value) == 1}год{/if}
        {if $datetime->age($tabs[0].fields[2].field_value) >= 2} 
        {if $datetime->age($tabs[0].fields[2].field_value) <= 4}года{/if} 
        {/if}
        {if $datetime->age($tabs[0].fields[2].field_value) >= 5} 
        {if $datetime->age($tabs[0].fields[2].field_value) <= 20}лет{/if} 
        {/if}
        {if $datetime->age($tabs[0].fields[2].field_value) == 21}год{/if}
        {if $datetime->age($tabs[0].fields[2].field_value) >= 22} 
        {if $datetime->age($tabs[0].fields[2].field_value) <= 24}года{/if} 
        {/if}
        {if $datetime->age($tabs[0].fields[2].field_value) >= 25} 
        {if $datetime->age($tabs[0].fields[2].field_value) <= 30}лет{/if} 
        {if $datetime->age($tabs[0].fields[2].field_value) == 31}год{/if}
        {/if}
        {if $datetime->age($tabs[0].fields[2].field_value) >= 32} 
        {if $datetime->age($tabs[0].fields[2].field_value) <= 34}года{/if} 
        {/if}
        {if $datetime->age($tabs[0].fields[2].field_value) >= 35} 
        {if $datetime->age($tabs[0].fields[2].field_value) <= 40}лет{/if}
        {/if}
        {if $datetime->age($tabs[0].fields[2].field_value) == 41}год{/if}
        {if $datetime->age($tabs[0].fields[2].field_value) >= 42} 
        {if $datetime->age($tabs[0].fields[2].field_value) <= 44}года{/if} 
        {/if}
        {if $datetime->age($tabs[0].fields[2].field_value) >= 45} 
        {if $datetime->age($tabs[0].fields[2].field_value) <= 50}лет{/if}
        {/if}
        {if $datetime->age($tabs[0].fields[2].field_value) == 51}год{/if}
        {if $datetime->age($tabs[0].fields[2].field_value) >= 52} 
        {if $datetime->age($tabs[0].fields[2].field_value) <= 54}года{/if}
        {/if} 
        {if $datetime->age($tabs[0].fields[2].field_value) >= 55} 
        {if $datetime->age($tabs[0].fields[2].field_value) <= 60}лет{/if}
        {/if}
{/if}
       </td>        
       </tr>   

    {* END PROFILE TABS AND FIELDS *}


   </table>


  </div>



 <div id="personal" class="flexOpen">
   <div class="bOpen">
    <div class="flexHeader clearFix" onclick="return collapseBox('personal', this, 0.90, 0.50)" onfocus="blur()">
     <div>
      <h2>Информация</h2>
     </div>
    {if $owner->user_info.user_username == $user->user_info.user_username}
     <div class="flexEdit" >
      <a href="user_editprofile.php" onclick="event.cancelBubble = true; " title="">редактировать</a>
     </div>
    {/if}
    </div>
   </div>
   <div class="c">
    <div class="flexBox clearFix">
   


    {* SHOW PROFILE TABS AND FIELDS *}
    {section name=tab_loop loop=$tabs}
    <h4>{$tabs[tab_loop].tab_name}</h4>
    <table class="profileTable" cellpadding="0" cellspacing="0">
	    {section name=field_loop loop=$tabs[tab_loop].fields}
 	  <tr>  <td class="label"> {$tabs[tab_loop].fields[field_loop].field_title}:</td>
    	        <td class="data">  {$tabs[tab_loop].fields[field_loop].field_value_profile}</td>
    	  </tr>
    	   {/section}
    </table>
    {/section}
    {* END PROFILE TABS AND FIELDS *}

</div></div>

{* BEGIN COMMENTS *}
<a name='comments'></a>
 <div id="wall" class="flexOpen">
   <div class="bOpen">
    <div class="flexHeader clearFix" onclick="return collapseBox('wall', this, 0.5, 0.25)" onfocus="blur()">
     <div><h2>Стена</h2></div>
     {if $owner->user_info.user_username == $user->user_info.user_username}
      <div class="flexEdit" >
      <a href="user_editprofile_comments.php" onclick="event.cancelBubble = true; " title="">редактировать</a>
     </div>
	{/if}
     <IMG id="progr2" style="float:right; display:none; margin-top:3px" SRC="images/upload.gif">
    </div>
   </div>
   <div class="c">
    <div class="fSub clearFix">
     <h3>
        <div style="float: left;">
       {if $total_comments == 0} нет записей <span id='total_comments' style="display:none">{$total_comments}</span></a> {/if}
       {if $total_comments == 1} всего <span id='total_comments'>{$total_comments}</span></a> запись {/if}
       {if $total_comments >= 2 AND $total_comments <= 4} всего <span id='total_comments'>{$total_comments}</span></a> записи {/if}
       {if $total_comments >= 5 AND $total_comments <= 9} всего <span id='total_comments'>{$total_comments}</span></a> записей{/if}
       {if $total_comments > 10} показаны 10 из <a href='profile_comments.php?user={$owner->user_info.user_username}'><span id='total_comments'>{$total_comments}</span></a> записей {/if}
        </div>
        <div style="float: right;" >
        <a href="javascript: quickReply('quickReply', 0.55, 0.40, 1); ge('reply_field').value = ''; shide('br');">Написать</a>
       </div>
      </h3>
    </div>
    <div id="quickReply">
     <div id="r" class="r" style="display:none">
      <div style="padding: 5px 12px">
{if $user->user_exists != 0}
     <form action='profile_comments.php' name="wall" method='post' target='AddCommentWindow' onSubmit='checkText()'>
     <textarea name='comment_body' id='comment_body' style="width:360px; height:80px" onfocus='removeText(this)' onblur='addText(this)' class='comment_area'></textarea>     
     {*кнопка*}
      <div style="height:1.3em; height:25px;">
        <div id = "br" style="text-align:right">
  	    <ul class="buttonRow" style="float:right;" class="clearFix">
  	    <li style="width:6.4em;"><a style="width:5.4em;" id='comment_submit' href="javascript:document.wall.submit(); quickReply('quickReply', 0.55, 0.40, 1); ge('reply_field').value = ''; shide('br');">Отправить</a></li>
  	    </ul>
        </div>
      </div>
     {*конец кнопки*}
     <input type='hidden' name='user' value='{$owner->user_info.user_username}'>
     <input type='hidden' name='task' value='dopost'>
      </form>
{else}
<div id='msg'>Вы должны быть авторизированы, чтобы писать на стене</div>
{/if}
      </div>
     </div>
    </div>
       <div id='comment_error' style='display: none;'></div>
       <iframe name='AddCommentWindow' style='display: none' src=''></iframe>
<div class="flexBox clearFix" id="fBox2">


<div class='profile' id='profile_comments'>

      {* LOOP THROUGH PROFILE COMMENTS *}
      {section name=comment_loop loop=$comments}
        <div id='comment_{math equation='t-c' t=$comments|@count c=$smarty.section.comment_loop.index}'>
        <table class="wallpost" border="0" cellspacing="0" width="100%">
        <tr>
        <td class="image">
         <a href='{$url->url_create('profile',$comments[comment_loop].comment_author->user_info.user_username)}'><img src='{$comments[comment_loop].comment_author->user_photo('./images/nophoto.gif')}' class='photo' border='0' width='{$misc->photo_size($comments[comment_loop].comment_author->user_photo('./images/nophoto.gif'),'50','190','w')}'></a> {if $comments[comment_loop]->user_info.user_online == 1}Online{/if} 
        </td>
        <td class="info">
          <div class="header">
    <form id='delpost_{$comments[comment_loop].comment_id}' action='user_editprofile_comments.php' method='post' target='DelCommentWindow_{$comments[comment_loop].comment_id}' >
    <input type='hidden' name='comment_{$comments[comment_loop].comment_id}' value='1'>    
    <input type='hidden' name='task' value='delete'>
    <input type='hidden' name='p' value='1'>
    </form> 
           {if $comments[comment_loop].comment_author->user_info.user_id != 0}<a href='{$url->url_create('profile',$comments[comment_loop].comment_author->user_info.user_username)}' style="font-weight: bold;">{$comments[comment_loop].comment_author->user_info.user_username}</a>{else}{$profile33}{/if} написал <br> 
           <small>{$datetime->cdate("`$setting.setting_dateformat` в `$setting.setting_timeformat`", $datetime->timezone($comments[comment_loop].comment_date, $global_timezone))}</small>
          </div>
          <div class="text">{$comments[comment_loop].comment_body|choptext:50:"<br>"}
                 <div id='comment_error' style='display: none;'></div>
                 <iframe name='DelCommentWindow_{$comments[comment_loop].comment_id}' style='display: none' src=''></iframe>
          </div>
          <div class="actions">{if $comments[comment_loop].comment_author->user_info.user_id != 0}<a href='{$url->url_create('profile', $comments[comment_loop].comment_author->user_info.user_username)}#comments'><small>{if $user->user_info.user_username != $comments[comment_loop].comment_author->user_info.user_username}Написать на стене{else}Написать на моей стене{/if}</small></a>{if $user->user_info.user_username != $comments[comment_loop].comment_author->user_info.user_username} - <a href='user_messages_new.php?to={$comments[comment_loop].comment_author->user_info.user_username}'><small>Сообщение</small></a>{/if}{if $owner->user_info.user_username == $user->user_info.user_username} - <a href="javascript: document.getElementById('delpost_{$comments[comment_loop].comment_id}').submit();"><small>Удалить</small></a>{/if} 
           {/if}
          </div>
       </td>
      </tr>
     </table>
      {/section}
      </div>

 {include file='footer.tpl'}