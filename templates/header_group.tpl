<link rel="stylesheet" href="./templates/styles_group.css" title="stylesheet" type="text/css">  

{* ASSIGN MENU VARIABLES *}
{if $user->level_info.level_group_allow != 0}
  {array var="group_menu" value="user_group.php"}
  {array var="group_menu" value="group16.gif"}
  {array var="group_menu" value=$header_group1}
  {array var="global_plugin_menu" value=$group_menu} 
{/if}