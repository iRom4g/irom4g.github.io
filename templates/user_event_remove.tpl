{include file='header.tpl'}

  <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1> Мои встречи</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">

    <div class="clearFix tBar">
     <ul class="tabs" id="friendTabs" style="width:550px;float:left;">
	  <li class="activeLink"><a href="user_event.php" style="width:7em">Мои события</a></li>
        <li><a href="user_event_settings.php" style="width:11em">Настройки Событий</a></li>
        <li><a href="user_event_browse.php" style="width:10.5em">Обзор Событий</a></li>
      </ul>
    </div>


<table cellpadding='0' cellspacing='0' width='100%'><tr><td class='page'>

<img src='./images/icons/event48.gif' border='0' class='icon_big'>

{if $event->eventmember_info.eventmember_status == -1}
  <div class='page_header'>{$user_event_remove7} <a href='event.php?event_id={$event->event_info.event_id}'>{$event->event_info.event_title}</a></div>
  <div>{$user_event_remove8}</div>
{else}
  <div class='page_header'>{$user_event_remove4} <a href='event.php?event_id={$event->event_info.event_id}'>{$event->event_info.event_title}</a></div>
  <div>{$user_event_remove5}</div>
{/if}

<br>

{* SHOW WARNING THAT EVENT WILL BE DELETED IF USER IS THE CREATOR *}
{if $event->event_info.event_user_id == $user->user_info.user_id}
  <br>
  <table cellpadding='0' cellspacing='0'>
  <tr><td class='result' style='text-align: left;'>
    {$user_event_remove6}
  </td></tr></table>
{/if}

<br>

<table cellpadding='0' cellspacing='0'>
<tr>
<td>
  <form action='user_event_remove.php' method='post'>
  <input type='submit' class='button' value='{if $event->eventmember_info.eventmember_status == -1}{$user_event_remove2}{else}{$user_event_remove9}{/if}'>&nbsp;
  <input type='hidden' name='event_id' value='{$event->event_info.event_id}'>
  <input type='hidden' name='task' value='doleave'>
  <input type='hidden' name='return_url' value='{$return_url}'>
  </form>
</td>
<td>
  <form action='user_event_remove.php' method='post'>
  <input type='submit' class='button' value='{if $event->eventmember_info.eventmember_status == -1}{$user_event_remove12}{else}{$user_event_remove10}{/if}'>
  <input type='hidden' name='task' value='cancel'>
  <input type='hidden' name='return_url' value='{$return_url}'>
  <input type='hidden' name='event_id' value='{$event->event_info.event_id}'>
  </form>
</td>
</tr>
</table>

</td></tr></table>

{include file='footer.tpl'}