{include file='header.tpl'}

  <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1>Мои альбомы</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">

    <div class="clearFix tBar">
     <ul class="tabs" id="friendTabs" style="width:550px;float:left;">
	  <li class="activeLink"><a href="user_album.php" style="width:7em">Мои альбомы</a></li>
        <li><a href="user_album_settings.php" style="width:11em">Параметры альбома</a></li>
        <li><a href="user_album_friends.php" style="width:11.5em">Альбомы моих друзей</a></li>
     </ul>
    </div>

<table cellpadding='0' cellspacing='0' width='100%'><tr><td class='page'>

<table cellpadding='0' cellspacing='0'>
<tr>
<td width='100%'>
  <img src='./images/icons/image48.gif' border='0' class='icon_big'>
  <div class='page_header'>{$user_album_edit6}</div>
  <div>{$user_album_edit7}</div>
</td>
<td align='right' valign='top'>
  <table cellpadding='0' cellspacing='0' width='120'>
  <tr><td class='button' nowrap='nowrap'><a href='user_album.php?album_id={$album_id}'><img src='./images/icons/album_back16.gif' border='0' class='icon'>{$user_album_edit8}</a></td></tr>
  </table>
</td>
</tr>
</table>

<br>

{* SHOW RESULT MESSAGE *}
{if $result != 0}
  <div class='success'><img src='./images/success.gif' border='0' class='icon'> {$user_album_edit2}</div>
{/if}

{* SHOW ERROR MESSAGE *}
{if $is_error != 0}
  <div class='error'><img src='./images/error.gif' border='0' class='icon'> {$user_album_edit1}</div>
{/if}

<form action='user_album_edit.php' method='post'>

<b>{$user_album_edit9}</b><br>
<input name='album_title' type='text' class='text' maxlength='50' size='50' value='{$album_title}'>
<br><br>
<b>{$user_album_edit10}</b><br>
<textarea name='album_desc' rows='6' cols='50'>{$album_desc}</textarea>

<br>

{* SHOW SEARCH PRIVACY OPTIONS IF ALLOWED BY ADMIN *}
{if $user->level_info.level_album_search == 1}
  <br>
  <div><b>{$user_album_edit11}</b></div>
  <table cellpadding='0' cellspacing='0'>
    <tr><td><input type='radio' name='album_search' id='album_search_1' value='1'{if $album_search == 1} CHECKED{/if}></td><td><label for='album_search_1'>{$user_album_edit12}</label></td></tr>
    <tr><td><input type='radio' name='album_search' id='album_search_0' value='0'{if $album_search == 0} CHECKED{/if}></td><td><label for='album_search_0'>{$user_album_edit13}</label></td></tr>
  </table>
{/if}

{* SHOW PRIVACY OPTIONS IF ALLOWED BY ADMIN *}
{if $privacy_options|@count > 1}
  <br>
  <div><b>{$user_album_edit14}</b></div>
  <table cellpadding='0' cellspacing='0'>
  {section name=privacy_loop loop=$privacy_options}
    <tr><td><input type='radio' name='album_privacy' id='{$privacy_options[privacy_loop].privacy_id}' value='{$privacy_options[privacy_loop].privacy_value}'{if $album_privacy == $privacy_options[privacy_loop].privacy_value} CHECKED{/if}></td><td><label for='{$privacy_options[privacy_loop].privacy_id}'>{$privacy_options[privacy_loop].privacy_option}</label></td></tr>
  {/section}
  </table>
{/if}

{* SHOW COMMENT OPTIONS IF ALLOWED BY ADMIN *}
{if $comment_options|@count > 1}
  <br>
  <div><b>{$user_album_edit15}</b></div>
  <table cellpadding='0' cellspacing='0'>
  {section name=comment_loop loop=$comment_options}
    <tr><td><input type='radio' name='album_comments' id='{$comment_options[comment_loop].comment_id}' value='{$comment_options[comment_loop].comment_value}'{if $album_comments == $comment_options[comment_loop].comment_value} CHECKED{/if}></td><td><label for='{$comment_options[comment_loop].comment_id}'>{$comment_options[comment_loop].comment_option}</label></td></tr>
  {/section}
  </table>
{/if}

<br>

<table cellpadding='0' cellspacing='0'>
<tr>
<td>
  <input type='submit' class='button' value='{$user_album_edit16}'>&nbsp;
  <input type='hidden' name='task' value='dosave'>
  <input type='hidden' name='album_id' value='{$album_id}'>
  </form>
</td>
<td>
  <form action='user_album_update.php' method='POST'>
  <input type='submit' class='button' value='{$user_album_edit17}'>
  <input type='hidden' name='album_id' value='{$album_id}'>
</td>
</tr>
</table>

</td></tr></table>

{include file='footer.tpl'}