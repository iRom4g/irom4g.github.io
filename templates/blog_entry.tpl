{include file='header.tpl'}
<link rel='stylesheet' href='css/notes.css' type='text/css'>
 
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
    commentBody.value = '{/literal}{$blog_entry14}{literal}';
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
  commentSubmit.value = '{/literal}{$blog_entry15}{literal}';
  commentSubmit.disabled = true;
  
}

function addComment(is_error, comment_body, comment_date) {
  if(is_error == 1) {
    var commentError = document.getElementById('comment_error');
    commentError.style.display = 'block';
    if(comment_body == '') {
      commentError.innerHTML = '{/literal}{$blog_entry16}{literal}';
    } else {
      commentError.innerHTML = '{/literal}{$blog_entry17}{literal}';
    }
    var commentSubmit = document.getElementById('comment_submit');
    commentSubmit.value = '{/literal}{$blog_entry18}{literal}';
    commentSubmit.disabled = false;
  } else {
    var commentError = document.getElementById('comment_error');
    commentError.style.display = 'none';
    commentError.innerHTML = '';

    var commentBody = document.getElementById('comment_body');
    commentBody.value = '';
    addText(commentBody);

    var commentSubmit = document.getElementById('comment_submit');
    commentSubmit.value = '{/literal}{$blog_entry18}{literal}';
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
    var newTable = "<table cellpadding='0' cellspacing='0' width='100%'><tr><td class='blog_item1' width='80'>";
    {/literal}
      {if $user->user_info.user_id != 0}
        newTable += "<a href='{$url->url_create('profile',$user->user_info.user_username)}'><img src='{$user->user_photo('./images/nophoto.gif')}' class='photo' border='0' width='{$misc->photo_size($user->user_photo('./images/nophoto.gif'),'75','75','w')}'></a></td><td class='blog_item2'><table cellpadding='0' cellspacing='0' width='100%'><tr><td class='blog_comment_author'><b><a href='{$url->url_create('profile',$user->user_info.user_username)}'>{$user->user_info.user_username}</a></b> - {$datetime->cdate("`$setting.setting_timeformat` `$blog_entry21` `$setting.setting_dateformat`", $datetime->timezone($smarty.now, $global_timezone))}</td><td class='blog_comment_author' align='right' nowrap='nowrap'>&nbsp;[ <a href='user_messages_new.php?to={$user->user_info.user_username}'>{$blog_entry20}</a> ]</td>";
      {else}
        newTable += "<img src='./images/nophoto.gif' class='photo' border='0' width='75'></td><td class='blog_item2'><table cellpadding='0' cellspacing='0' width='100%'><tr><td class='blog_comment_author'><b>{$blog_entry11}</b> - {$datetime->cdate("`$setting.setting_timeformat` `$blog_entry21` `$setting.setting_dateformat`", $datetime->timezone($smarty.now, $global_timezone))}</td><td class='blog_comment_author' align='right' nowrap='nowrap'>&nbsp;</td>";
      {/if}
      newTable += "</tr><tr><td colspan='2' class='blog_comment_body'>"+comment_body+"</td></tr></table></td></tr></table>";
    {literal}
    newComment.innerHTML = newTable;
    var blogComments = document.getElementById('blog_comments');
    var prevComment = document.getElementById('comment_'+last_comment);
    blogComments.insertBefore(newComment, prevComment);
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
    <h1> <a href='notes.php'>Мои заметки</a> &raquo; {$blogentry_info.blogentry_title}</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">

    
<div class="bar clearFix summaryBar">
 <div class="summary"><a class="notbold" href='user_blog.php'>К моим заметкам</a></div>
  
</div>


{if isset($page_is_preview)}
<table cellspacing='0' cellpadding='0' id='blogpreview' style='width:100%'>
<tr><td>&nbsp;</td><td class='content' style='width:100%'>
{/if}

<div id="notesBar" class="clearFix">
 <div class="column mainPanel" id="mainPanel">
  
  
  <div class="note wide_note clearFix">
   <div class="note_body">
    <div class="note_header">
     <div class="note_title_share clearFix">
      <div class="note_title">
       {$blogentry_info.blogentry_title}
      </div>
     </div>
     <div class="byline">
      <span><a href="{$url->url_create('profile', $owner->user_info.user_username)}">{$owner->user_info.user_username}</a></span> {$datetime->cdate("`$setting.setting_dateformat` в `$setting.setting_timeformat`", $datetime->timezone($blogentry_info.blogentry_date, $global_timezone))} 
     </div>
    </div>
    <div class="note_content clearFix">
     <div>{$blogentry_info.blogentry_body|choptext:45:"<br>"}
     </div>
    </div>
    <div class="note_footer clearFix">
     <div class="comments_count"><a href="blog_entry.php?user={$owner->user_info.user_username}&blogentry_id={$blogentry_info.blogentry_id}#comments">Комментарии ({$total_comments})</a><span class='divide'>|</span><a href='user_blog_editentry.php?blogentry_id={$blogentry_info.blogentry_id}'>редактировать</a><span class='divide'>|</span><a href='user_blog_deleteentry.php?blogentry_id={$blogentry_info.blogentry_id}'>удалить</a></div>
    </div>
   </div>
  </div>


{if isset($page_is_preview)}
  </td></tr></table>
  <script type='text/javascript'>
  <!--
  parent.show_preview();
  //-->
  </script>
{/if}
<div id="blogcommentsandform" style="padding-left:20px; padding-right: 20px">


{* BEGIN COMMENTS *}  

<a name='comments'></a>
<div id="blogcomments">
<table cellpadding='0' cellspacing='0' width='100%'>
<tr>  
<td class='header'>
  {$blog_entry8} (<span id='total_comments'>{$total_comments}</span>)
</td>
</tr>
{if $allowed_to_comment != 0}
  <tr id='blog_postcomment'>
  <td class='blog_postcomment'>
    <form action='blog_entry.php' method='post' target='AddCommentWindow' onSubmit='checkText()'>
    <textarea name='comment_body' id='comment_body' rows='2' cols='65' onfocus='removeText(this)' onblur='addText(this)' style='color: #888888; width: 100%;'>{$blog_entry14}</textarea>

    <table cellpadding='0' cellspacing='0' width='100%'>
    <tr>
    {if $setting.setting_comment_code == 1}
      <td width='75' valign='top'><img src='./images/secure.php' id='secure_image' border='0' height='20' width='67' class='signup_code'></td>
      <td width='68' style='padding-top: 4px;'><input type='text' name='comment_secure' id='comment_secure' class='text' size='6' maxlength='10'></td>
      <td width='10'><img src='./images/icons/tip.gif' border='0' class='icon' onMouseover="tip('{$blog_entry19}')"; onMouseout="hidetip()"></td>
    {/if}
    <td align='right' style='padding-top: 5px;'>
    <input type='submit' id='comment_submit' class='button' value='{$blog_entry18}'>
    <input type='hidden' name='user' value='{$owner->user_info.user_username}'>
    <input type='hidden' name='blogentry_id' value='{$blogentry_info.blogentry_id}'>
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
<td class='blog' id='blog_comments'>

  {* LOOP THROUGH BLOG COMMENTS *}
  {section name=comment_loop loop=$comments}
    <div id='comment_{math equation='t-c' t=$comments|@count c=$smarty.section.comment_loop.index}'>
     <table class="wallpost" border="0" cellspacing="0" width="100%">
      <tr>
       <td class="image">
      {if $comments[comment_loop].comment_author->user_info.user_id != 0}
        <a href='{$url->url_create('profile',$comments[comment_loop].comment_author->user_info.user_username)}'><img src='{$comments[comment_loop].comment_author->user_photo('./images/nophoto.gif')}' class='photo' border='0' width='{$misc->photo_size($comments[comment_loop].comment_author->user_photo('./images/nophoto.gif'),'50','200','w')}'></a>
      {else}
        <img src='./images/nophoto.gif' class='photo' border='0' width='67'>
      {/if}
       </td>
       <td class="info">
        <div class="header" >
         {if $comments[comment_loop].comment_author->user_info.user_id != 0}<a href='{$url->url_create('profile',$comments[comment_loop].comment_author->user_info.user_username)}' style='font-weight: bold;'>{$comments[comment_loop].comment_author->user_info.user_username}</a>{else}{$blog_entry11}{/if} написала<br />
         <small>{$datetime->cdate("`$setting.setting_dateformat` в `$setting.setting_timeformat`", $datetime->timezone($comments[comment_loop].comment_date, $global_timezone))}</small>
        </div>
        <div class='text'>{$comments[comment_loop].comment_body}</div>
        <div class='actions'>
         <a href=""><small>Ответить</small></a> - <a href="user_messages_new.php?to={$comments[comment_loop].comment_author->user_info.user_username}"><small>Сообщение</small></a>
        </div>
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