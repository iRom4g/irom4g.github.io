{include file='header.tpl'}
<link rel='stylesheet' href='css/board.css?2' type='text/css' />
<link rel='stylesheet' href='css/search.css' type='text/css' />

 <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1><a href='{$url->url_base}group.php?group_id={$group->group_info.group_id}'>{$group->group_info.group_title}</a> &raquo; <a href='group_discussion.php?group_id={$group->group_info.group_id}'>обсуждения</a> &raquo; тема</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">
<br>
<div class="clearFix tBar">
 <ul class="tabs">
  <li>
   <a href="group_discussion.php?group_id={$group->group_info.group_id}" style="width:10em">Обсуждения</a>
  </li>
  <li class="activeLink">
   <a href="group_discussion_view.php?group_id={$group->group_info.group_id}&grouptopic_id=1{$topic_info.grouptopic_id}" style="width:9em">Просмотр темы</a>
  </li>
 </ul>
</div>

<div class="bar clearFix topicBar" style="margin-left:0px;">
<h2>Тема: <span><a href="group_discussion_view.php?group_id={$group->group_info.group_id}&grouptopic_id=1{$topic_info.grouptopic_id}" style="width:9em">{$topic_info.grouptopic_subject}</a></span></h2>
</div>
<div class="bar clearFix summaryBar">

 <div class="summary">В теме {$total_posts} сообщений.
{if $maxpage > 1}На странице сообщения {$p_start}-{$p_end}. </div>
 <ul class='pageList'>
  {if $p != 1}<li><a href='group_discussion_view.php?group_id={$group->group_info.group_id}&grouptopic_id={$topic_info.grouptopic_id}&p={math equation='p-1' p=$p}'>{math equation='p-1' p=$p}</a></li>{/if}
  <li class='current'><a>{$p}</a></li>
  {if $p != $maxpage}<li><a href='group_discussion_view.php?group_id={$group->group_info.group_id}&grouptopic_id={$topic_info.grouptopic_id}&p={math equation='p+1' p=$p}'>{math equation='p+1' p=$p}</a></li>{/if}
 </ul>
{else}
</div>
{/if}
 </div>



{* LOOP THROUGH GROUP POSTS *}
<div id="media_comments">
{assign var=id value="$p1"}
{section name=post_loop loop=$posts}
{assign var=id value="`$id+1`"}
<a name = "n{$id}">
<div class="post clearFix" id="post{$id}">
 <div class="postData clearFix">
  <div class="info">
   <div>
    <a href='{$url->url_create('profile',$posts[post_loop].grouppost_author->user_info.user_username)}'>
     <img src='{$posts[post_loop].grouppost_author->user_photo('./images/nophoto.gif')}' class='photo' border='0' width='{$misc->photo_size($posts[post_loop].grouppost_author->user_photo('./images/nophoto.gif'),'75','75','w')}'>
   </a>
   </div>
   <div class="postIndex">#{$id}</div>
  </div><div class="postBody">
  <div class="postHeader">
   <span class="postAuthor"><a href='{$url->url_create('profile',$posts[post_loop].grouppost_author->user_info.user_username)}'>{$posts[post_loop].grouppost_author->user_info.user_username}</a></span> <span class="timestamp">{$datetime->cdate("`$setting.setting_timeformat` `$group_discussion_view13` `$setting.setting_dateformat`", $datetime->timezone($posts[post_loop].grouppost_date, $global_timezone))}</span>
  </div>
  <div class="postMessage">{$posts[post_loop].grouppost_body}</div>
  </div>
  <div class="postOptions">
  <ul id="nav">
   <li><a href='user_messages_new.php?to={$posts[post_loop].grouppost_author->user_info.user_username}'>Сообщение</a></li>
   {if ($posts[post_loop].grouppost_author->user_info.user_id != 0 && $user->user_info.user_id == $posts[post_loop].grouppost_author->user_info.user_id) || $group->user_rank == 2 || $group->user_rank == 1}<li><a href='group_discussion_delete.php?group_id={$group->group_info.group_id}&grouptopic_id={$topic_info.grouptopic_id}&grouppost_id={$posts[post_loop].grouppost_id}'>Удалить</a></li>{/if}
  </ul>
  </div>
 </div>
</div>
{/section}
</div>

<a name = "end"></a>
<div id="addPost">
 <h4>Ваш комментарий</h4>
 <form action='group_discussion_post.php' name="postmessage" method='post'>
  <textarea name="topic_body" id="topic_body" rows="7" cols="60" style="width: 400px">{$topic_body}</textarea>
  {if $setting.setting_group_discussion_code == 1}
  <table cellspacing='0' cellpadding='0'>
  <tr>
    <td valign='top'><img src='./images/secure.php' id='secure_image' border='0' height='20' width='67' class='signup_code'>&nbsp;</td>
    <td style='padding-top: 4px;'><input type='text' name='comment_secure' id='comment_secure' class='text' size='6' maxlength='10'>&nbsp;</td>
    <td><img src='./images/icons/tip.gif' border='0' class='icon' onMouseover="tip('{$group_discussion_post13}')"; onMouseout="hidetip()"></td>
  </tr>
  </table>
  {/if}
  <br><br>
  <ul class="buttonRow" style="margin-top:-7px; width:300px; height: 2.3em;">
   <li style="width:14.5em"><a style="width:13.5em" href="javascript:document.postmessage.submit();">Добавить сообщение</a></li>
  </ul>
  <input type='hidden' name='task' value='dopost'>
  <input type='hidden' name='group_id' value='{$group->group_info.group_id}'>
  <input type='hidden' name='grouptopic_id' value='{$topic_info.grouptopic_id}'>
 </form>
</div>


    
   </div>
  </div>
  </div>

  </div>
  <div id="boxHolder"></div>

{* <table cellpadding='0' cellspacing='0' width='100%' style='margin-top: 5px;'>
<tr>
<td>&nbsp;</td>
{if $maxpage > 1}
  <td align='right'>
    {if $p != 1}<a href='group_discussion_view.php?group_id={$group->group_info.group_id}&grouptopic_id={$topic_info.grouptopic_id}&p={math equation='p-1' p=$p}'>&#171; {$group_discussion_view7}</a>{else}<font class='disabled'>&#171; {$group_discussion_view7}</font>{/if}
    {if $p_start == $p_end}
      &nbsp;|&nbsp; {$group_discussion_view8} {$p_start} {$group_discussion_view9} {$total_posts} &nbsp;|&nbsp; 
    {else}
      &nbsp;|&nbsp; {$group_discussion_view10} {$p_start}-{$p_end} {$group_discussion_view9} {$total_posts} &nbsp;|&nbsp; 
    {/if}
    {if $p != $maxpage}<a href='group_discussion_view.php?group_id={$group->group_info.group_id}&grouptopic_id={$topic_info.grouptopic_id}&p={math equation='p+1' p=$p}'>{$group_discussion_view11} &#187;</a>{else}<font class='disabled'>{$group_discussion_view11} &#187;</font>{/if}
    </div>
  </td>
{/if}
</tr>
</table> *}



{include file='footer.tpl'}