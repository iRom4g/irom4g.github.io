{include file='header.tpl'}
<link rel='stylesheet' href='css/search.css' type='text/css' />
<link rel='stylesheet' href='css/dialog2.css' type='text/css' />
<link rel='stylesheet' href='css/board.css' type='text/css' />
<link rel='stylesheet' href='css/notes.css' type='text/css' />

  <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1><a href='{$url->url_base}group.php?group_id={$group->group_info.group_id}'>{$group->group_info.group_title}</a> &raquo; обсуждения</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">

    
<div class="clearFix tBar">
 <ul class="tabs">
  <li class="activeLink">
   <a href="board.php?id=40839" style="width:10em">Обсуждения</a>
  </li>
 </ul>
</div>

<div class="bar clearFix topicBar" style="margin-left:0px;">
 <div style='float:right; padding:10px 5px 0px 0px'>{if $allowed_to_discuss != 0}<a href='group_discussion_post.php?group_id={$group->group_info.group_id}'>Новая тема</a></div>{/if}
</div>

<div class="bar clearFix summaryBar">
 <div class="summary">В группе 334 темы. </div>
 
</div>
<div class="boardTopics">

<table cellpadding='0' cellspacing='0' width='100%' style='margin-bottom: 10px;'>
<tr>
{* DISPLAY PAGINATION MENU IF APPLICABLE *}
{if $maxpage > 1}
  <td align='right'>
    {if $p != 1}<a href='group_discussion.php?group_id={$group->group_info.group_id}&p={math equation='p-1' p=$p}'>&#171; {$group_discussion7}</a>{else}<font class='disabled'>&#171; {$group_discussion7}</font>{/if}
    {if $p_start == $p_end}
      &nbsp;|&nbsp; {$group_discussion8} {$p_start} {$group_discussion9} {$total_topics} &nbsp;|&nbsp; 
    {else}
      &nbsp;|&nbsp; {$group_discussion10} {$p_start}-{$p_end} {$group_discussion9} {$total_topics} &nbsp;|&nbsp; 
    {/if}
    {if $p != $maxpage}<a href='group_discussion.php?group_id={$group->group_info.group_id}&p={math equation='p+1' p=$p}'>{$group_discussion11} &#187;</a>{else}<font class='disabled'>{$group_discussion11} &#187;</font>{/if}
    </div>
  </td>
{/if}
</tr>
</table>

{* LOOP THROUGH GROUP TOPICS *}
{section name=topic_loop loop=$topics}
<div class="boardTopic clearFix" style='border-top-width:1px;'>
<table width="565"><tr><td width="370px">
  <h3 class="topicTitle"><a href="group_discussion_view.php?group_id={$group->group_info.group_id}&grouptopic_id={$topics[topic_loop].grouptopic_id}">{$topics[topic_loop].grouptopic_subject}</a></h3>
  <div class="moreInfo clearFix">
   <div style="float: left;"><span style="color: #333"></span> 
    <span style="color: #888">Создана <span class='topicPages'><br />Сообщений: {$topics[topic_loop].groupposts_total}</span></span>
   </div>
  </div>
</td><td>
  <div style='float:left'>
   <div>Обновление: {$datetime->time_since($topics[topic_loop].grouptopic_date)}</div> <div>Автор: <a href=""></a></div>
  </div>
</td></tr>
</table>
</div>
  
{/section}

<table cellpadding='0' cellspacing='0' width='100%' style='margin-top: 5px;'>
<tr>
<td>&nbsp;</td>
{* DISPLAY PAGINATION MENU IF APPLICABLE *}
{if $maxpage > 1}
  <td align='right'>
    {if $p != 1}<a href='group_discussion.php?group_id={$group->group_info.group_id}&p={math equation='p-1' p=$p}'>&#171; {$group_discussion7}</a>{else}<font class='disabled'>&#171; {$group_discussion7}</font>{/if}
    {if $p_start == $p_end}
      &nbsp;|&nbsp; {$group_discussion8} {$p_start} {$group_discussion9} {$total_topics} &nbsp;|&nbsp; 
    {else}
      &nbsp;|&nbsp; {$group_discussion10} {$p_start}-{$p_end} {$group_discussion9} {$total_topics} &nbsp;|&nbsp; 
    {/if}
    {if $p != $maxpage}<a href='group_discussion.php?group_id={$group->group_info.group_id}&p={math equation='p+1' p=$p}'>{$group_discussion11} &#187;</a>{else}<font class='disabled'>{$group_discussion11} &#187;</font>{/if}
    </div>
  </td>
{/if}
</tr>
</table>


{include file='footer.tpl'}