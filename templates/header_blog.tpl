<link rel="stylesheet" href="./templates/styles_blog.css" title="stylesheet" type="text/css">  
<script type="text/javascript" src="./include/fckeditor/fckeditor.js"></script>

{* ASSIGN MENU VARIABLES *}
{if $user->level_info.level_blog_allow != 0}
  {array var="blog_menu" value="user_blog.php"}
  {array var="blog_menu" value="blog16.gif"}
  {array var="blog_menu" value=$header_blog1}
  {array var="global_plugin_menu" value=$blog_menu} 
{/if}