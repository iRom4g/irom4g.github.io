{include file='header.tpl'}

  <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1>{$event->event_info.event_title}</h1>
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
    commentBody.value = '{/literal}{$event31}{literal}';
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
  commentSubmit.value = '{/literal}{$event32}{literal}';
  commentSubmit.disabled = true;
  
}

function addComment(is_error, comment_body, comment_date) {
  if(is_error == 1) {
    var commentError = document.getElementById('comment_error');
    commentError.style.display = 'block';
    if(comment_body == '') {
      commentError.innerHTML = '{/literal}{$event33}{literal}';
    } else {
      commentError.innerHTML = '{/literal}{$event34}{literal}';
    }
    var commentSubmit = document.getElementById('comment_submit');
    commentSubmit.value = '{/literal}{$event24}{literal}';
    commentSubmit.disabled = false;
  } else {
    var commentError = document.getElementById('comment_error');
    commentError.style.display = 'none';
    commentError.innerHTML = '';

    var commentBody = document.getElementById('comment_body');
    commentBody.value = '';
    addText(commentBody);

    var commentSubmit = document.getElementById('comment_submit');
    commentSubmit.value = '{/literal}{$event24}{literal}';
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
    var newTable = "<table cellpadding='0' cellspacing='0' width='100%'><tr><td class='profile_item1' width='80'>";
    {/literal}
      {if $user->user_info.user_id != 0}
        newTable += "<a href='{$url->url_create('profile',$user->user_info.user_username)}'><img src='{$user->user_photo('./images/nophoto.gif')}' class='photo' border='0' width='{$misc->photo_size($user->user_photo('./images/nophoto.gif'),'75','75','w')}'></a></td><td class='profile_item2'><table cellpadding='0' cellspacing='0' width='100%'><tr><td class='profile_comment_author'><b><a href='{$url->url_create('profile',$user->user_info.user_username)}'>{$user->user_info.user_username}</a></b> - {$datetime->cdate("`$setting.setting_timeformat` `$event35` `$setting.setting_dateformat`", $datetime->timezone($smarty.now, $global_timezone))}</td><td class='profile_comment_author' align='right' nowrap='nowrap'><a href='{$url->url_create('profile',$user->user_info.user_username)}#comments'>{$event40}</a>&nbsp;|&nbsp;<a href='user_messages_new.php?to={$user->user_info.user_username}'>{$event27}</a></td>";
      {else}
        newTable += "<img src='./images/nophoto.gif' class='photo' border='0' width='75'></td><td class='profile_item2'><table cellpadding='0' cellspacing='0' width='100%'><tr><td class='profile_comment_author'><b>{$event26}</b> - {$datetime->cdate("`$setting.setting_timeformat` `$event35` `$setting.setting_dateformat`", $datetime->timezone($smarty.now, $global_timezone))}</td><td class='profile_comment_author' align='right' nowrap='nowrap'>&nbsp;</td>";
      {/if}
      newTable += "</tr><tr><td colspan='2' class='profile_comment_body'>"+comment_body+"</td></tr></table></td></tr></table>";
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




<table width='100%' cellpadding='0' cellspacing='0'>
<tr>
<td class='profile_leftside' width='200'>
{* BEGIN LEFT COLUMN *}

  {* SHOW PHOTO *}
  <table cellpadding='0' cellspacing='0' width='100%' style='margin-bottom: 10px;'>
  <tr>
  <td class='profile_photo' width='182'><img class='photo' src='{$event->event_photo('./images/nophoto.gif')}' border='0'></td>
  </tr>
  </table>

  <table class='profile_menu' cellpadding='0' cellspacing='0' width='100%'>

  {* SHOW BROWSE MEMBERS BUTTON *}
  <tr><td class='profile_menu1'><a href='event_members.php?event_id={$event->event_info.event_id}'><img src='./images/icons/browsefriends16.gif' border='0' class='icon'>{$event2} ({$total_invited})</a></td></tr>

  {* SHOW BROWSE IMAGES BUTTON *}
  {if $total_files != 0}
    <tr><td class='profile_menu1'><a href='event_album.php?event_id={$event->event_info.event_id}'><img src='./images/icons/album16.gif' border='0' class='icon'>{$event29} ({$total_files})</a></td></tr>
  {/if}

  {* SHOW JOIN EVENT BUTTON IF NOT ALREADY A MEMBER *}
  {if $event->is_member == 0}
    {if $event->event_info.event_inviteonly == 1}
      <tr><td class='profile_menu1'><a href='user_event_rsvp.php?event_id={$event->event_info.event_id}&return_url={$url->url_current()}'><img src='./images/icons/event_join16.gif' border='0' class='icon'>{$event3}</a></td></tr>
    {else}
      <tr><td class='profile_menu1'><a href='user_event_rsvp.php?event_id={$event->event_info.event_id}&return_url={$url->url_current()}'><img src='./images/icons/event_join16.gif' border='0' class='icon'>{$event4}</a></td></tr>
    {/if}
  {/if}

  {* SHOW REMOVE EVENT BUTTON IF ALREADY A MEMBER *}
  {if $event->is_member == 1}
    {if $event->eventmember_info.eventmember_status == -1}
      <tr><td class='profile_menu1'><div class='event_menu'><img src='./images/icons/event_rsvp16.gif' border='0' class='icon'>{$event52}</div></td></tr>
    {elseif $event->eventmember_info.eventmember_status == 0}
      <tr><td class='profile_menu1'><a href='user_event_rsvp.php?event_id={$event->event_info.event_id}&return_url={$url->url_current()}'><img src='./images/icons/event_rsvp16.gif' border='0' class='icon'>{$event47}</a></td></tr>
    {else}
      <tr><td class='profile_menu1'><a href='user_event_rsvp.php?event_id={$event->event_info.event_id}&return_url={$url->url_current()}'><img src='./images/icons/event_rsvp16.gif' border='0' class='icon'>{$event48}</a></td></tr>
    {/if}

    {if $event->event_info.event_user_id == $user->user_info.user_id}
      <tr><td class='profile_menu1'><a href='user_event_edit_delete.php?event_id={$event->event_info.event_id}'><img src='./images/icons/event_remove16.gif' border='0' class='icon'>{$event49}</a></td></tr>
    {else}
      {if $event->eventmember_info.eventmember_status == -1}
        <tr><td class='profile_menu1'><a href='user_event_remove.php?event_id={$event->event_info.event_id}&return_url={$url->url_current()}'><img src='./images/icons/event_remove16.gif' border='0' class='icon'>{$event53}</a></td></tr>
      {else}
        <tr><td class='profile_menu1'><a href='user_event_remove.php?event_id={$event->event_info.event_id}&return_url={$url->url_current()}'><img src='./images/icons/event_remove16.gif' border='0' class='icon'>{$event50}</a></td></tr>
      {/if}
    {/if}
  {/if}

  {* SHOW REPORT THIS EVENT MENU ITEM *}
  <tr>
  <td class='profile_menu1'><a href='user_report.php?return_url={$url->url_current()}'><img src='./images/icons/report16.gif' class='icon' border='0'>{$event38}</a></td>
  </tr>

  </table>


  {* DISPLAY IF EVENT IS PRIVATE TO VIEWING USER *}
  {if $is_event_private != 0}

    {* END LEFT COLUMN *}
    </td>
    <td class='profile_rightside'>
    {* BEGIN RIGHT COLUMN *}

      <img src='./images/icons/error48.gif' border='0' class='icon_big'>
      <div class='page_header'>{$event37}</div>
      {$event1}

  {* DISPLAY ONLY IF EVENT IS NOT PRIVATE TO VIEWING USER *}
  {else}


    {* SHOW STATS *}
    <table cellpadding='0' cellspacing='0' width='100%' style='margin-bottom: 10px;'>
    <tr>
    <td class='header'>{$event5}</td>
    </tr>
    <tr>
    <td class='profile'>
      <table cellpadding='0' cellspacing='0'>
      <tr><td width='70'>{$event6}</td><td><a href='{$url->url_create('profile', $eventowner_info.user_username)}'>{$eventowner_info.user_username}</a></td></tr>
      <tr><td>{$event7}</td><td>{$event->event_info.event_views} {$event8}</td></tr>
      <tr><td>{$event9}</td><td>{$total_invited} {$event10}</td></tr>
      <tr><td>{$event11}</td><td>{$total_files} {$event12}</td></tr>
      {if $event->event_info.event_dateupdated != 0}<tr><td>{$event13}</td><td>{$datetime->time_since($event->event_info.event_dateupdated)}</td></tr>{/if}
      </table>
    </td>
    </tr>
    </table>
    {* END STATS *}

    {* SHOW OTHER INVITED USERS *}
    {if $total_maybe > 0 OR $total_notattending > 0 OR $total_mia > 0}
      <table cellpadding='0' cellspacing='0' width='100%' style='margin-bottom: 10px;'>
      <tr>
      <td class='header'>{$event42}</td>
      </tr>
    {/if}

    {if $total_maybe > 0}
      <tr>
      <td class='profile'>
        <div class='event_rsvps'><a href='event_members.php?event_id={$event->event_info.event_id}&status=2'>{$event43} ({$total_maybe})</a></div>
        <table cellpadding='0' cellspacing='0' align='center'>
        {* LOOP THROUGH MAYBE-ATTENDING GUESTS *}
        {section name=maybe_loop loop=$members_maybe}
          {* START NEW ROW *}
          {cycle name=notattending_start values="<tr>,,"}
          <td class='profile_friend'><a href='{$url->url_create('profile', $members_maybe[maybe_loop].member->user_info.user_username)}'><img src='{$members_maybe[maybe_loop].member->user_photo('./images/nophoto.gif')}' class='photo' border='0' width='{$misc->photo_size($members_maybe[maybe_loop].member->user_photo('./images/nophoto.gif'),'70','70','w')}'><br>{$members_maybe[maybe_loop].member->user_info.user_username}</a></td>
          {* END ROW AFTER 3 RESULTS *}
          {if $smarty.section.maybe_loop.last == true}
            </tr>
          {else}
            {cycle name=maybe_end values=",,</tr>"}
          {/if}
        {/section}
        </table>
      </td>
      </tr>
    {/if}

    {if $total_notattending > 0}
      <tr>
      <td class='profile'>
        <div class='event_rsvps'><a href='event_members.php?event_id={$event->event_info.event_id}&status=3'>{$event44} ({$total_notattending})</a></div>
        <table cellpadding='0' cellspacing='0' align='center'>
        {* LOOP THROUGH NOT-ATTENDING GUESTS *}
        {section name=notattending_loop loop=$members_notattending}
          {* START NEW ROW *}
          {cycle name=notattending_start values="<tr>,,"}
          <td class='profile_friend'><a href='{$url->url_create('profile', $members_notattending[notattending_loop].member->user_info.user_username)}'><img src='{$members_notattending[notattending_loop].member->user_photo('./images/nophoto.gif')}' class='photo' border='0' width='{$misc->photo_size($members_notattending[notattending_loop].member->user_photo('./images/nophoto.gif'),'70','70','w')}'><br>{$members_notattending[notattending_loop].member->user_info.user_username}</a></td>
          {* END ROW AFTER 3 RESULTS *}
          {if $smarty.section.notattending_loop.last == true}
            </tr>
          {else}
            {cycle name=notattending_end values=",,</tr>"}
          {/if}
        {/section}
        </table>
      </td>
      </tr>
    {/if}

    {if $total_mia > 0}
      <tr>
      <td class='profile'>
        <div class='event_rsvps'><a href='event_members.php?event_id={$event->event_info.event_id}&status=0'>{$event45} ({$total_mia})</a></div>
        <table cellpadding='0' cellspacing='0' align='center'>
        {* LOOP THROUGH GUESTS WHO HAVEN'T RESPONDED *}
        {section name=mia_loop loop=$members_mia}
          {* START NEW ROW *}
          {cycle name=mia_start values="<tr>,,"}
          <td class='profile_friend'><a href='{$url->url_create('profile', $members_mia[mia_loop].member->user_info.user_username)}'><img src='{$members_mia[mia_loop].member->user_photo('./images/nophoto.gif')}' class='photo' border='0' width='{$misc->photo_size($members_mia[mia_loop].member->user_photo('./images/nophoto.gif'),'70','70','w')}'><br>{$members_mia[mia_loop].member->user_info.user_username}</a></td>
          {* END ROW AFTER 3 RESULTS *}
          {if $smarty.section.mia_loop.last == true}
            </tr>
          {else}
            {cycle name=mia_end values=",,</tr>"}
          {/if}
        {/section}
        </table>
      </td>
      </tr>
    {/if}


    {if $total_maybe > 0 OR $total_notattending > 0 OR $total_mia > 0}
      </table>
    {/if}
    {* END INVITED USERS *}


    {* END LEFT COLUMN *}
    </td>
    <td class='profile_rightside'>
    {* BEGIN RIGHT COLUMN *}


    {* SHOW EVENT INFORMATION *}
    <table cellpadding='0' cellspacing='0' width='100%' style='margin-bottom: 10px;'>
    <tr>
    <td class='header'>{$event14}</td>
    </tr>
    <tr>
    <td class='profile'>
      <table cellpadding='0' cellspacing='0'>
      <tr><td valign='top' nowrap='nowrap'>{$event15}</td><td>{$event->event_info.event_title}</td></tr>
      {if $event_category != ""}<tr><td valign='top' nowrap='nowrap'>{$event17}</td><td>{if $parent_category != ""}<a href='user_event_browse.php?eventcat_id={$parent_category.eventcat_id}'>{$parent_category.eventcat_title}</a> >> {/if}<a href='user_event_browse.php?eventcat_id={$event->event_info.event_eventcat_id}'>{$event_category}</a></td></tr>{/if}
      {assign var=event_date_start value=$datetime->timezone($event->event_info.event_date_start, $global_timezone)}
      {assign var=event_date_end value=$datetime->timezone($event->event_info.event_date_end, $global_timezone)}
      {if $datetime->cdate("F j, Y", $event_date_start) == $datetime->cdate("F j, Y", $event_date_end)}
	{assign var=start_dateformat value="`$setting.setting_dateformat` `$event51` `$setting.setting_timeformat`"}
	{assign var=end_dateformat value=$setting.setting_timeformat}
      {else}
	{assign var=start_dateformat value="`$setting.setting_dateformat`, `$setting.setting_timeformat`"}
	{assign var=end_dateformat value="`$setting.setting_dateformat`, `$setting.setting_timeformat`"}
      {/if}
      <tr><td valign='top' nowrap='nowrap' style='padding-right: 10px;'>{$event20}</td><td>{$datetime->cdate("`$start_dateformat`", $event_date_start)} {$event46} {$datetime->cdate("`$end_dateformat`", $event_date_end)}</td></tr>
      {if $event->event_info.event_host != ""}<tr><td valign='top' nowrap='nowrap'>{$event54}</td><td>{$event->event_info.event_host}</td></tr>{/if}
      {if $event->event_info.event_location != ""}<tr><td valign='top' nowrap='nowrap'>{$event55}</td><td>{$event->event_info.event_location}</td></tr>{/if}
      {if $event->event_info.event_desc != ""}<tr><td valign='top' nowrap='nowrap'>{$event16}</td><td>{$event->event_info.event_desc}</td></tr>{/if}
      </table>
    </td>
    </tr>
    </table>
    {* END EVENT INFORMATION *}




    {* SHOW MEMBERS *}
    <table cellpadding='0' cellspacing='0' width='100%' style='margin-bottom: 10px;'>
    <tr>
    <td class='header'>
      {$event18} ({$total_attending})
      &nbsp;<font class='profile_small'>[ <a href='event_members.php?event_id={$event->event_info.event_id}&status=1'>{$event19}</a> ]</font>
    </td>
    </tr>
    <tr>
    <td class='profile'>
      {* LOOP THROUGH ATTENDING GUESTS *}
      {section name=attending_loop loop=$members_attending}
        {* START NEW ROW *}
        {cycle name=attending_start values="<table cellpadding='0' cellspacing='0'><tr>,,,,,"}
        <td class='profile_friend'><a href='{$url->url_create('profile', $members_attending[attending_loop].member->user_info.user_username)}'><img src='{$members_attending[attending_loop].member->user_photo('./images/nophoto.gif')}' class='photo' border='0' width='{$misc->photo_size($members_attending[attending_loop].member->user_photo('./images/nophoto.gif'),'75','75','w')}'><br>{$members_attending[attending_loop].member->user_info.user_username}</a></td>
        {* END ROW AFTER 4 RESULTS *}
        {if $smarty.section.attending_loop.last == true}
          </tr></table>
        {else}
          {cycle name=attending_end values=",,,,,</tr></table>"}
        {/if}
      {/section}
    </td>
    </tr>
    </table>
    {* END MEMBERS *}


    {* SHOW PHOTOS *}
    {if $total_files != 0}
      <table cellpadding='0' cellspacing='0' width='100%' style='margin-bottom: 10px;'>
      <tr>
      <td class='header'>
        {$event21} ({$total_files})
        &nbsp;<font class='profile_small'>[ <a href='event_album.php?event_id={$event->event_info.event_id}'>{$event22}</a> ]</font>
      </td>
      </tr>
      <tr>
      <td class='profile'>
        {* LOOP THROUGH PHOTOS *}
        {section name=file_loop loop=$files max=5}

          {* IF IMAGE, GET THUMBNAIL *}
          {if $files[file_loop].eventmedia_ext == "jpeg" OR $files[file_loop].eventmedia_ext == "jpg" OR $files[file_loop].eventmedia_ext == "gif" OR $files[file_loop].eventmedia_ext == "png" OR $files[file_loop].eventmedia_ext == "bmp"}
            {assign var='file_dir' value=$event->event_dir($event->event_info.event_id)}
            {assign var='file_src' value="`$file_dir``$files[file_loop].eventmedia_id`_thumb.jpg"}
          {* SET THUMB PATH FOR AUDIO *}
          {elseif $files[file_loop].eventmedia_ext == "mp3" OR $files[file_loop].eventmedia_ext == "mp4" OR $files[file_loop].eventmedia_ext == "wav"}
            {assign var='file_src' value='./images/icons/audio_big.gif'}
          {* SET THUMB PATH FOR VIDEO *}
          {elseif $files[file_loop].eventmedia_ext == "mpeg" OR $files[file_loop].eventmedia_ext == "mpg" OR $files[file_loop].eventmedia_ext == "mpa" OR $files[file_loop].eventmedia_ext == "avi" OR $files[file_loop].eventmedia_ext == "swf" OR $files[file_loop].eventmedia_ext == "mov" OR $files[file_loop].eventmedia_ext == "ram" OR $files[file_loop].eventmedia_ext == "rm"}
            {assign var='file_src' value='./images/icons/video_big.gif'}
          {* SET THUMB PATH FOR UNKNOWN *}
          {else}
            {assign var='file_src' value='./images/icons/file_big.gif'}
          {/if}

          {* START NEW ROW *}
          {cycle name="startrow2" values="<table cellpadding='0' cellspacing='0'><tr>,,,,"}
          <td class='profile_friend'><a href='event_album_file.php?event_id={$event->event_info.event_id}&eventmedia_id={$files[file_loop].eventmedia_id}'><img src='{$file_src}' class='photo' border='0' width='{$misc->photo_size($file_src,'75','75','w')}'></a></td>
          {* END ROW AFTER 5 RESULTS *}
          {if $smarty.section.file_loop.last == true}
            </tr></table>
          {else}
            {cycle name="endrow2" values=",,,,</tr></table>"}
          {/if}
        {/section}
      </td>
      </tr>
      </table>
    {/if}
    {* END PHOTOS *}





    {* BEGIN COMMENTS *}
    <table cellpadding='0' cellspacing='0' width='100%'>
    <tr>  
    <td class='header'>
      {$event23} (<span id='total_comments'>{$total_comments}</span>)
      {if $total_comments != 0}&nbsp;[ <a href='event_comments.php?event_id={$event->event_info.event_id}'>{$event25}</a> ]{/if}
    </td>
    </tr>
      {if $allowed_to_comment != 0}
        <tr>
        <td class='profile_postcomment'>
        <form action='event_comments.php' method='post' target='AddCommentWindow' onSubmit='checkText()'>
        <textarea name='comment_body' id='comment_body' rows='2' cols='65' onfocus='removeText(this)' onblur='addText(this)' style='color: #888888; width: 100%;'>{$event31}</textarea>

          <table cellpadding='0' cellspacing='0' width='100%'>
          <tr>
          {if $setting.setting_comment_code == 1}
            <td width='75' valign='top'><img src='./images/secure.php' id='secure_image' border='0' height='20' width='67' class='signup_code'></td>
            <td width='68' style='padding-top: 4px;'><input type='text' name='comment_secure' id='comment_secure' class='text' size='6' maxlength='10'></td>
            <td width='10'><img src='./images/icons/tip.gif' border='0' class='icon' onMouseover="tip('{$event36}')"; onMouseout="hidetip()"></td>
          {/if}
          <td align='right' style='padding-top: 5px;'>
          <input type='submit' id='comment_submit' class='button' value='{$event24}'>
          <input type='hidden' name='event_id' value='{$event->event_info.event_id}'>
          <input type='hidden' name='task' value='dopost'>
          </form>
          </td>
          </tr>
          </table>
        <div id='comment_error' style='color: #FF0000; display: none;'></div>
        <iframe name='AddCommentWindow' style='display: none' src=''></iframe>
	</div>
	</div>
	</td>
	</tr>
      {/if}
	<tr>
	<td class='profile' id='profile_comments'>

      {* LOOP THROUGH EVENT COMMENTS *}
      {section name=comment_loop loop=$comments}
        <div id='comment_{math equation='t-c' t=$comments|@count c=$smarty.section.comment_loop.index}'>
        <table cellpadding='0' cellspacing='0' width='100%'>
        <tr>
        <td class='profile_item1' width='80'>
          {if $comments[comment_loop].comment_author->user_info.user_id != 0}
            <a href='{$url->url_create('profile',$comments[comment_loop].comment_author->user_info.user_username)}'><img src='{$comments[comment_loop].comment_author->user_photo('./images/nophoto.gif')}' class='photo' border='0' width='{$misc->photo_size($comments[comment_loop].comment_author->user_photo('./images/nophoto.gif'),'75','75','w')}'></a>
          {else}
            <img src='./images/nophoto.gif' class='photo' border='0' width='75'>
          {/if}
        </td>
        <td class='profile_item2'>
          <table cellpadding='0' cellspacing='0' width='100%'>
          <tr>
          <td class='profile_comment_author'><b>{if $comments[comment_loop].comment_author->user_info.user_id != 0}<a href='{$url->url_create('profile',$comments[comment_loop].comment_author->user_info.user_username)}'>{$comments[comment_loop].comment_author->user_info.user_username}</a>{else}{$event26}{/if}</b> - {$datetime->cdate("`$setting.setting_timeformat` `$event35` `$setting.setting_dateformat`", $datetime->timezone($comments[comment_loop].comment_date, $global_timezone))}</td>
          <td class='profile_comment_author' align='right' nowrap='nowrap'><a href='{$url->url_create('profile',$comments[comment_loop].comment_author->user_info.user_username)}#comments'>{$event40}</a>&nbsp;|&nbsp;<a href='user_messages_new.php?to={$comments[comment_loop].comment_author->user_info.user_username}'>{$event27}</a></td>
          </tr>
          <tr>
          <td colspan='2' class='profile_comment_body'>{$comments[comment_loop].comment_body}</td>
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


  {/if}
  {* END PRIVACY IF STATEMENT *}


{* END RIGHT COLUMN *}
</td>
</tr>
</table>

{include file='footer.tpl'}