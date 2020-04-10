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
        {if $event->eventowner_level_info.level_event_style == 1}<li class="activeLink"><a href="user_event_edit_style.php?event_id={$event->event_info.event_id}" style="width:8em">Стили События</a></li>{/if}
        <li><a href="user_event_edit_delete.php?event_id={$event->event_info.event_id}" style="width:10em">Отменить Событие</a></li>
        <li><a href="user_event.php" style="width:4em">Назад</a></li>
      </ul>
    </div>

<div>
   <img src='./images/icons/event_edit48.gif' border='0' class='icon_big'>
   <div class='page_header'>{$user_event_edit_style10} <a href='event.php?event_id={$event->event_info.event_id}'>{$event->event_info.event_title|truncate:30:"...":true}</a></div>
   {$user_event_edit_style11}
</div>

<br>

{* SHOW SUCCESS MESSAGE *}
{if $result != 0}
  <br>
  <table cellpadding='0' cellspacing='0'><tr>
  <td class='result'><img src='./images/success.gif' border='0' class='icon'> {$user_event_edit_style1}</div></td>
  </tr></table>
{/if}

<br>

<form action='user_event_edit_style.php' method='POST'>
<textarea name='style_event' rows='17' cols='50' style='width: 100%; font-family: courier, serif;'>{$style_event}</textarea>
<br>
<br>
<input type='submit' class='button' value='{$user_event_edit_style12}'>
<input type='hidden' name='event_id' value='{$event->event_info.event_id}'>
<input type='hidden' name='task' value='dosave'>
</form>


{include file='footer.tpl'}