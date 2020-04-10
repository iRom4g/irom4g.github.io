<link rel="stylesheet" href="./templates/styles_event.css" title="stylesheet" type="text/css">  

<script type="text/javascript" src="./include/js/cookies.js"></script>

{* ASSIGN MENU VARIABLES *}
{if $user->level_info.level_event_allow != 0}
  {array var="event_menu" value="user_event.php"}
  {array var="event_menu" value="event16.gif"}
  {array var="event_menu" value=$header_event1}
  {array var="global_plugin_menu" value=$event_menu} 
{/if}

