{include file='header.tpl'}
<link rel='stylesheet' href='css/friend.css' type='text/css' />
<link rel='stylesheet' href='css/search.css' type='text/css' />
<link rel='stylesheet' href='css/feed.css' type='text/css' />

  <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1> Мои новости</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">

{* BEGIN MIDDLE COLUMN *}
  {* SHOW RECENT ACTIVITY LIST *}
<div id="mainFeed">
 		<div class='feedDayWrap'><div class='feedDay'>Что нового</div></div>
<div style="padding:10px 10px 20px 10px;">

    {section name=actions_loop loop=$actions}
      {* DISPLAY ACTION *}
      <div id='action_{$actions[actions_loop].action_id}'  class='home_action{if $smarty.section.actions_loop.last == true}_bottom{/if}'>
      <table class="feedTable" cellpadding=0 cellspacing=0 border=0>
	<tr>
 	<td class="feedIconWrap">
 	<img class="feedIcon" src="./images/icons/{$actions[actions_loop].action_icon}">
	</td>
	<td class="feedStory">
 	{$actions[actions_loop].action_text|choptext:50:"<br>"}
	</td> 
	<td class="feedTime">
	 {$datetime->time_since($actions[actions_loop].action_date)}
	</td>
	</tr>
	</table>
      </div>
    {sectionelse}
      {$user_home9}
    {/section}
</div></div>
  </td>
  </tr>
  </table>


{include file='footer.tpl'}