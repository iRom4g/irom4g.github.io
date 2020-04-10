<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
<title>{$global_page_title}</title>
<base href='{$url->url_base}'>
<link rel="stylesheet" href="./templates/styles.css" title="stylesheet" type="text/css">
<link rel="stylesheet" href="css/rustyle.css" type="text/css">
<link rel='stylesheet' href='css/profile.css' type='text/css'>  
<link rel='stylesheet' href='css/typeahead.css' type='text/css' />
{if $profilepage != 1}
<link rel='stylesheet' href='css/dialog2.css' type='text/css' />
<link rel='stylesheet' href='css/rustylex.css' type='text/css' />
<link rel='stylesheet' href='css/mail2.css' type='text/css' />
<link rel='stylesheet' href='css/box.css' type='text/css' />
{else}
{/if}

<script src='js/simpleajax.js'></script>
<script src='js/effects.js'></script>
<script src='js/ajax.js'></script>
<script src='js/activity.js'></script>
<script src="js/functions.js?5"></script>
<script src="js/niftycube.js"></script>
<script src="js/1.js"></script>

{* CODE FOR POPUP TIPS, DO NOT REMOVE *}
<!--[if lte IE 6]><style type="text/css" media="screen">/* <![CDATA[ */ @import url(css/ie.css); /* ]]> */</style><![endif]-->
<!--[if gte IE 7]><style type="text/css" media="screen">/* <![CDATA[ */ @import url(css/ie7.css); /* ]]> */</style><![endif]-->

{* CODE FOR VARIOUS JAVASCRIPT-BASED FEATURES, DO NOT REMOVE *}
<script type="text/javascript" src="./include/js/tips.js"></script>
<script type="text/javascript" src="./include/js/showhide.js"></script>
<script type="text/javascript" src="./include/js/suggest.js"></script>
<script type="text/javascript" src="./include/js/status.js"></script>

{* START CODE FOR AJAX RATING PLUGIN *}
<script type="text/javascript" language="javascript" src="./include/js/behavior.js"></script>
<script type="text/javascript" language="javascript" src="./include/js/rating.js"></script>
<link rel="stylesheet" type="text/css" href="./templates/rating.css" />
{* END CODE FOR AJAX RATING PLUGIN *}
{* ASSIGN PLUGIN MENU ITEMS AND INCLUDE NECESSARY STYLE/JAVASCRIPT FILES *}
{section name=header_loop loop=$global_plugins}{include file="header_`$global_plugins[header_loop]`.tpl"}{/section} 
{array var="global_plugin_menu" value=''}

{* INSERT USER'S CUSTOM CSS IF ANY *}
<style type='text/css'>{$global_css}</style>

</head>
<body>

<div id="pageLayout">



<!-- pageHeader -->

  <div id="pageHeader">

   <h1 id="home"><a href="index.php">�����</a></h1>

 <div id="quickSearch">
    <form method="POST" action="search.php" name="qsearch">
     <input class="inputText inputSearch" type="search" id="quickquery" name="search_text" size="15" placeholder="�����"/>
     <input type="hidden" id="act" name="task" value="dosearch" />
     <input style="display: none;" class="inputSubmit" type="submit" value="Go" />
     <script type="text/javascript">
      //<![CDATA[
      placeholderSetup('quickquery');
      //]]>
     </script>
    </form>
 </div>

{if $user->user_exists != 0}
<ul class="topNav">
 <li style="width:0.2em"></li>
 <li style="width:5.2em"><a href='user_logout.php'>�����</a></li>
 <li style="width:5.3em"><a href='help.php'>������</a>
 <li style="width:7.3em"><a href='invite.php'>����������</a></li>
 <li style="width:5.2em"><a href='user_group_browse.php'>������</a></li>
 <li style="width:4.8em"><a href='search.php'>�����</a></li>
 <li style="width:6.0em"><a href='{$url->url_create('profile', $user->user_info.user_username)}'>�������</a></li>
</ul>
{else} 
<ul class="topNav">
 <li style="width:0.2em"></li>
 <li style="width:5.3em"><a href='help.php'>������</a>
 <li style="width:7.3em"><a href='signup.php'>�����������</a></li>
 <li style="width:4.2em"><a href='login.php'>����</a></li>
</ul>
{/if}

  </div>

<!-- End pageHeader -->



{* START PAGE *}

<!-- sideBar -->

{if $homepage != 1}<div id="sideBar">
{if $user->user_exists != 0}
  
      <ol id='nav'>
    <li id='myprofile'><a href='{$url->url_create('profile', $user->user_info.user_username)}' class='hasedit'>��� ��������</a><a href='user_editprofile.php' class='edit'>���.</a></li>
    <li id='myfriends'>{if $total_friend_requests > 0}<a href='user_friends_requests.php'>��� ������ (<b>{$total_friend_requests}</b>){else}<a href='user_friends.php'>��� ������{/if}</a></li>
    <li><a href='user_album.php'>��� ����������</a></li>
    <li><a href='user_messages.php'>��� ��������� {if $user_unread_pms >0}(<b>{$user_unread_pms}</b>){/if}</a></li>
    <li><a href='user_blog.php'>��� �������</a></li>
    <li>{if $total_group > 0}<a href='user_group_invites.php'>��� ������ (<b>{$total_group}</b>)</a>{else}<a href='user_group.php'>��� ������</a>{/if}</li>
    <li><a href='user_event.php'>��� �������</a></li>
    <li><a href='user_home.php'>��� �������</a></li>
    <li><a href='user_account.php'>��� ���������</a></li>
   </ol> 
{else}
      <div id="sideBar">

   
   <ol id='nav'>
    <li><a href='index.php'>�������</a></li>
    <li><a href='login.php'>����</a></li>
    <li><a href='signup.php'>�����������</a></li>
   </ol>

   <div style="width:124px">
</div></div>

{/if}


{* SHOW NEWS *}
{if $user->user_exists != 0 AND $news_total > 0}
{section name=news_loop loop=$news max=3}
<div class="leftAd" style="margin-bottom:10px">
  <h4>{$news[news_loop].item_subject}</h4>
  <p><div style="text-align: center">
   {$news[news_loop].item_body}
  </div></p>
 </div>
{/section}
{/if}


{* BIRTHDAY INFO *}
{if $user->user_exists != 0 AND $bday_users != 0 }
{section name=bday_users_loop loop=$bday_users max=3 }   
<div class="leftAd" style="margin-bottom:10px">
<h4 style="color:#900">�����������</h4>
<p><div style="text-align: center">
���� �������� <a href='{$url->url_create('profile',$bday_users[bday_users_loop].user->user_info.user_username)}'>
{$bday_users[bday_users_loop].user->user_info.user_username}</a>
</div></p></div>
{/section}
{/if}



</div>
{/if}
<!-- End sideBar -->