{include file='header.tpl'}

{* JAVASCRIPT FOR ADDING COMMENT *}
{literal}
<script type='text/javascript'>
<!--
var comment_changed = 0;
var first_comment = 1;
var last_comment = {/literal}{$comments|@count}{literal};
var next_comment = last_comment+1;

function removeText(commentBody) {
  if(comment_changed == 0) {
    commentBody.value='';
    commentBody.style.color='#000000';
    comment_changed = 1;
  }
}

function addText(commentBody) {
  if(commentBody.value == '') {
    commentBody.value = '{/literal}{$profile_comments14}{literal}';
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
  commentSubmit.value = '{/literal}{$profile_comments15}{literal}';
  commentSubmit.disabled = true;
  
}

function addComment(is_error, comment_body, comment_date) {
  if(is_error == 1) {
    var commentError = document.getElementById('comment_error');
    commentError.style.display = 'block';
    if(comment_body == '') {
      commentError.innerHTML = '{/literal}{$profile_comments16}{literal}';
    } else {
      commentError.innerHTML = '{/literal}{$profile_comments17}{literal}';
    }
    var commentSubmit = document.getElementById('comment_submit');
    commentSubmit.value = '{/literal}{$profile_comments18}{literal}';
    commentSubmit.disabled = false;
  } else {
    window.location.href = '{/literal}profile_comments.php?user={$owner->user_info.user_username}{literal}';
  }
}
//-->
</script>
{/literal}


<div class='page_header'>{$profile_comments3} <a href='{$url->url_create('profile', $owner->user_info.user_username)}'>{$owner->user_info.user_username}</a></div>

<br>

<table cellpadding='0' cellspacing='0' width='100%' style='margin-bottom: 5px;'>
<tr>
<td>
{if $allowed_to_comment != 0}
  <a href="javascript:showhide('commentbox')"><img src='./images/icons/postcomment16.gif' class='icon' border='0'>{$profile_comments18}</a>
{/if}
&nbsp;&nbsp;
<a href='{$url->url_create('profile', $owner->user_info.user_username)}'><img src='./images/icons/back16.gif' class='icon' border='0'>{$profile_comments5} {$owner->user_info.user_username}{$profile_comments6}</a>
</td>
{* DISPLAY PAGINATION MENU IF APPLICABLE *}
{if $maxpage > 1}
  <td align='right'>
    {if $p != 1}<a href='profile_comments.php?user={$owner->user_info.user_username}&p={math equation='p-1' p=$p}'>&#171; {$profile_comments7}</a>{else}<font class='disabled'>&#171; {$profile_comments7}</font>{/if}
    {if $p_start == $p_end}
      &nbsp;|&nbsp; {$profile_comments8} {$p_start} {$profile_comments9} {$total_comments} &nbsp;|&nbsp; 
    {else}
      &nbsp;|&nbsp; {$profile_comments10} {$p_start}-{$p_end} {$profile_comments9} {$total_comments} &nbsp;|&nbsp; 
    {/if}
    {if $p != $maxpage}<a href='profile_comments.php?user={$owner->user_info.user_username}&p={math equation='p+1' p=$p}'>{$profile_comments11} &#187;</a>{else}<font class='disabled'>{$profile_comments11} &#187;</font>{/if}
    </div>
  </td>
{/if}
</tr>
</table>

{* SHOW POST COMMENT BOX *}
{if $allowed_to_comment != 0}
  <div id='commentbox' style='display: none; margin: 20px 0px 20px 0px;'>
  <table cellpadding='0' cellspacing='0' align='center'>
  <tr>
  <td class='profile_viewcomments_postcomment'>
  <form action='profile_comments.php' method='post' target='AddCommentWindow' onSubmit='checkText()'>
  <textarea name='comment_body' id='comment_body' rows='3' cols='85' onfocus='removeText(this)' onblur='addText(this)' style='color: #888888;'>{$profile_comments14}</textarea>
    <table cellpadding='0' cellspacing='0' width='100%'>
    <tr>
    {if $setting.setting_comment_code == 1}
      <td width='75' valign='top'><img src='./images/secure.php' id='secure_image' border='0' height='20' width='67' class='signup_code'>&nbsp;</td>
      <td width='68' style='padding-top: 4px;'><input type='text' name='comment_secure' id='comment_secure' class='text' size='6' maxlength='10'>&nbsp;</td>
      <td width='10'><img src='./images/icons/tip.gif' border='0' class='icon' onMouseover="tip('{$profile_comments19}')"; onMouseout="hidetip()"></td>
    {/if}
    <td align='right'>
    <input type='submit' id='comment_submit' class='button' value='{$profile_comments18}'>
    <input type='hidden' name='user' value='{$owner->user_info.user_username}'>
    <input type='hidden' name='task' value='dopost'>
    </form>
    </td>
    </tr>
    </table>
  <div id='comment_error' style='color: #FF0000; display: none;'></div>
  <iframe name='AddCommentWindow' style='display: none' src=''></iframe>
  </td>
  </tr>
  </table>
  </div>
{/if}


{* LOOP THROUGH PROFILE COMMENTS *}
{section name=comment_loop loop=$comments}
  <div id='comment_{math equation='t-c' t=$comments|@count c=$smarty.section.comment_loop.index}'>
    <table cellpadding='0' cellspacing='0' width='100%'>
    <tr>
    <td class='profile_item1' width='70'>
      {if $comments[comment_loop].comment_author->user_info.user_id != 0}
        <a href='{$url->url_create('profile',$comments[comment_loop].comment_author->user_info.user_username)}'><img src='{$comments[comment_loop].comment_author->user_photo('./images/nophoto.gif')}' class='photo' border='0' width='{$misc->photo_size($comments[comment_loop].comment_author->user_photo('./images/nophoto.gif'),'75','75','w')}'></a>
      {else}
        <img src='./images/nophoto.gif' class='photo' border='0' width='75'>
      {/if}
    </td>
    <td class='profile_item2'>
      <table cellpadding='0' cellspacing='0' width='100%'>
      <tr>
      <td class='profile_comment_author'><b>{if $comments[comment_loop].comment_author->user_info.user_id != 0}<a href='{$url->url_create('profile',$comments[comment_loop].comment_author->user_info.user_username)}'>{$comments[comment_loop].comment_author->user_info.user_username}</a>{else}{$profile_comments12}{/if}</b> - {$datetime->cdate("`$setting.setting_timeformat` `$profile_comments2` `$setting.setting_dateformat`", $datetime->timezone($comments[comment_loop].comment_date, $global_timezone))}</td>
      <td class='profile_comment_author' align='right' nowrap='nowrap'>&nbsp;[ <a href='user_messages_new.php?to={$comments[comment_loop].comment_author->user_info.user_username}'>{$profile_comments1}</a> ]</td>
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



<table cellpadding='0' cellspacing='0' width='100%' style='margin-top: 5px;'>
<tr>
<td>&nbsp;</td>
{* DISPLAY PAGINATION MENU IF APPLICABLE *}
{if $maxpage > 1}
  <td align='right'>
    {if $p != 1}<a href='profile_comments.php?user={$owner->user_info.user_username}&p={math equation='p-1' p=$p}'>&#171; {$profile_comments7}</a>{else}<font class='disabled'>&#171; {$profile_comments7}</font>{/if}
    {if $p_start == $p_end}
      &nbsp;|&nbsp; {$profile_comments8} {$p_start} {$profile_comments9} {$total_comments} &nbsp;|&nbsp; 
    {else}
      &nbsp;|&nbsp; {$profile_comments10} {$p_start}-{$p_end} {$profile_comments9} {$total_comments} &nbsp;|&nbsp; 
    {/if}
    {if $p != $maxpage}<a href='profile_comments.php?user={$owner->user_info.user_username}&p={math equation='p+1' p=$p}'>{$profile_comments11} &#187;</a>{else}<font class='disabled'>{$profile_comments11} &#187;</font>{/if}
    </div>
  </td>
{/if}
</tr>
</table>


{include file='footer.tpl'}