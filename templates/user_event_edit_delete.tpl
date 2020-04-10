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
     <ul class="tabs" id="friendTabs" style="width:600px;float:left;">
	  <li><a href="user_event_edit.php?event_id={$event->event_info.event_id}" style="width:8.5em">Детали События</a></li>
        <li><a href="user_event_edit_members.php?event_id={$event->event_info.event_id}" style="width:7.5em">Приглашения</a></li>
        <li><a href="user_event_edit_files.php?event_id={$event->event_info.event_id}" style="width:6.5em">Фотографии</a></li>
        <li><a href="user_event_edit_comments.php?event_id={$event->event_info.event_id}" style="width:8em">Коментарии</a></li>
        {if $event->eventowner_level_info.level_event_style == 1}<li><a href="user_event_edit_style.php?event_id={$event->event_info.event_id}" style="width:8em">Стили События</a></li>{/if}
        <li class="activeLink"><a href="user_event_edit_delete.php?event_id={$event->event_info.event_id}" style="width:10em">Отменить Событие</a></li>
        <li><a href="user_event.php" style="width:4em">Назад</a></li>
      </ul>
    </div>

<table cellpadding='0' cellspacing='0' width='100%'><tr><td class='page'>

<div>
   <img src='./images/icons/event_delete48.gif' border='0' class='icon_big'>
   <div class='page_header'>{$user_event_edit_delete9} <a href='event.php?event_id={$event->event_info.event_id}'>{$event->event_info.event_title|truncate:30:"...":true}</a></div>
   {$user_event_edit_delete10}
</div>

<br>

<table cellpadding='0' cellspacing='0'>
<tr>
<td>
  <form action='user_event_edit_delete.php' method='post'>
  <input type='submit' class='button' value='{$user_event_edit_delete11}'>&nbsp;
  <input type='hidden' name='task' value='dodelete'>
  <input type='hidden' name='event_id' value='{$event->event_info.event_id}'>
  </form>
</td>
<td>
  <form action='user_event_edit.php' method='get'>
  <input type='submit' class='button' value='{$user_event_edit_delete12}'>
  <input type='hidden' name='event_id' value='{$event->event_info.event_id}'>
  </form>
</td>
</tr>
</table>

</td></tr></table>

{include file='footer.tpl'}