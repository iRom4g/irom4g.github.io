<link rel="stylesheet" href="./templates/styles_album.css" title="stylesheet" type="text/css">  

{* ASSIGN MENU VARIABLES *}
{if $user->level_info.level_album_allow != 0}
  {array var="album_menu" value="user_album.php"}
  {array var="album_menu" value="album16.gif"}
  {array var="album_menu" value=$header_album1}
  {array var="global_plugin_menu" value=$album_menu} 
{/if}