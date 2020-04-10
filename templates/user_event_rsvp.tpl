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

{* SHOW RESULT *}
{if $is_result != 0}
  <img src='./images/icons/event48.gif' border='0' class='icon_big'>

  {if $event->event_info.event_inviteonly == 1 AND $event->is_member == 0}
    <div class='page_header'>{$user_event_rsvp7} <a href='event.php?event_id={$event->event_info.event_id}'>{$event->event_info.event_title}</a></div>
    <div>{$user_event_rsvp8}</div>
  {else}
    <div class='page_header'>{$user_event_rsvp5} <a href='event.php?event_id={$event->event_info.event_id}'>{$event->event_info.event_title}</a></div>
    <div>{$user_event_rsvp14}</div>
  {/if}

  <br>
  <br>
  <table cellpadding='0' cellspacing='0'>
  <tr><td class='result'>
    <div class='success'><img src='./images/success.gif' border='0' class='icon'> {$result}</div>
  </td></tr></table>
  <br>

  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td>
    <form action='{$return_url}' method='POST'>
    <input type='submit' class='button' value='{$user_event_rsvp11}'>
    </form>
  </td>
  </tr>
  </table>



{* NO ERROR OR RESULT *}
{else}

  {* USER IS NOT A MEMBER, INVITE ONLY IS ON *}
  {if $event->event_info.event_inviteonly == 1 AND $event->is_member == 0}
    <img src='./images/icons/event48.gif' border='0' class='icon_big'>
    <div class='page_header'>{$user_event_rsvp7} <a href='event.php?event_id={$event->event_info.event_id}'>{$event->event_info.event_title}</a></div>
    <div>{$user_event_rsvp8}</div>
  
    <br>
    <br>
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td>
      <form action='user_event_rsvp.php' method='POST'>
      <input type='submit' class='button' value='{$user_event_rsvp9}'>&nbsp;
      <input type='hidden' name='event_id' value='{$event->event_info.event_id}'>
      <input type='hidden' name='return_url' value='{$return_url}'>
      <input type='hidden' name='task' value='dorequest'>
      </form>
    </td>
    <td>
      <form action='{$return_url}' method='POST'>
      <input type='submit' class='button' value='{$user_event_rsvp10}'>
      </form>
    </td>
    </tr>
    </table>

  {* USER IS HAS REQUESTED MEMBERSHIP AND INVITE ONLY IS ON *}
  {elseif $event->event_info.event_inviteonly == 1 AND $event->is_member == 1 AND $event->eventmember_info.eventmember_status==-1}
  
    <img src='./images/icons/event48.gif' border='0' class='icon_big'>
    <div class='page_header'>{$user_event_rsvp7} <a href='event.php?event_id={$event->event_info.event_id}'>{$event->event_info.event_title}</a></div>
    <div>{$user_event_rsvp8}</div>

    <br>
    <br>
    <table cellpadding='0' cellspacing='0'>
    <tr><td class='result'>
      <div class='error'><img src='./images/error.gif' border='0' class='icon'> {$user_event_rsvp2}</div>
    </td></tr></table>
    <br>

    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td>
      <form action='{$return_url}' method='post'>
      <input type='submit' class='button' value='{$user_event_rsvp11}'>
      </form>
    </td>
    </tr>
    </table>

  {* USER IS NOT A MEMBER AND INVITE ONLY IS TURNED OFF -OR- USER IS CHANGING RSVP *}
  {else}
    <img src='./images/icons/event48.gif' border='0' class='icon_big'>
    <div class='page_header'>{$user_event_rsvp5} <a href='event.php?event_id={$event->event_info.event_id}'>{$event->event_info.event_title}</a></div>
    <div>{$user_event_rsvp14}</div>
  
    <br><br>

    {* SHOW ERROR MESSAGE *}
    {if $is_error != 0}
      <table cellpadding='0' cellspacing='0'>
      <tr><td class='result'>
        <img src='./images/error.gif' class='icon' border='0'>{$user_event_rsvp19}
      </td></tr></table><br>
    {/if}

    <table cellpadding='0' cellspacing='0' class='form'>
    <tr>
    <td class='form2'>
      <form action='user_event_rsvp.php' method='post'>
      <table cellpadding='2' cellspacing='0'>
      <tr>
      <td><input id='rsvp1' type='radio' name='rsvp_response' value='1'{if $event->eventmember_info.eventmember_status == 1} CHECKED{/if}></td>
      <td><label for='rsvp1'>{$user_event_rsvp16}</label></td>
      </tr>
      <tr>
      <td><input id='rsvp2' type='radio' name='rsvp_response' value='2'{if $event->eventmember_info.eventmember_status == 2} CHECKED{/if}></td>
      <td><label for='rsvp2'>{$user_event_rsvp17}</label></td>
      </tr>
      <tr>
      <td><input id='rsvp3' type='radio' name='rsvp_response' value='3'{if $event->eventmember_info.eventmember_status == 3} CHECKED{/if}></td>
      <td><label for='rsvp3'>{$user_event_rsvp18}</label></td>
      </tr>
      </table>
    </td>
    </tr>
    </table>

    <br>

    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td>
      <input type='submit' class='button' value='{$user_event_rsvp1}'>&nbsp;
      <input type='hidden' name='event_id' value='{$event->event_info.event_id}'>
      <input type='hidden' name='return_url' value='{$return_url}'>
      <input type='hidden' name='task' value='dorsvp'>
      </form>
    </td>
    <td>
      <form action='{$return_url}' method='post'>
      <input type='submit' class='button' value='{$user_event_rsvp10}'>
      </form>
    </td>
    </tr>
    </table>

  {/if}

{/if}

{include file='footer.tpl'}