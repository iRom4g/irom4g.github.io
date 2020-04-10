{include file='header.tpl'}

{* UNBLOCK USER *}
{if $task == "unblock"}
  {* DISPLAY CONFIRMATION QUESTION *}
  {if $confirm == 1}
    <img src='./images/icons/unblock48.gif' border='0' class='icon_big'>
    <div class='page_header'>{$user_friends_block17} <a href='{$url->url_create('profile', $owner->user_info.user_username)}'>{$owner->user_info.user_username}</a>{$user_friends_block8}</div>
    <div>{$user_friends_block18} <a href='{$url->url_create('profile', $owner->user_info.user_username)}'>{$owner->user_info.user_username}</a>{$user_friends_block8}</div>
    <br><br>
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td>
      <form action='user_friends_block.php' method='POST'>
      <input type='submit' class='button' value='{$user_friends_block19}'>&nbsp;
      <input type='hidden' name='task' value='unblock'>
      <input type='hidden' name='confirm' value='1'>
      <input type='hidden' name='user' value='{$owner->user_info.user_username}'>
      </form>
    </td>
    <td>
      <form action='user_friends_block.php' method='POST'>
      <input type='submit' class='button' value='{$user_friends_block10}'>
      <input type='hidden' name='task' value='cancel'>
      <input type='hidden' name='user' value='{$owner->user_info.user_username}'>
      </form>
    </td>
    </tr>
    </table>

  {* DISPLAY RESULT *}
  {else}

    <img src='./images/icons/unblock48.gif' border='0' class='icon_big'>
    <div class='page_header'><a href='{$url->url_create('profile', $owner->user_info.user_username)}'>{$owner->user_info.user_username}</a> {$user_friends_block20}</div>
    <div>{$result}</div>
    <br><br>
  
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td>
      <form action='profile.php' method='get'>
      <input type='submit' class='button' value='{$user_friends_block11}'>
      <input type='hidden' name='user' value='{$owner->user_info.user_username}'>
      </form>
    </td>
    </tr>
    </table>

  {/if}



{* BLOCK USER *}
{else}
  {* DISPLAY CONFIRMATION QUESTION *}
  {if $confirm == 1}
    <img src='./images/icons/block48.gif' border='0' class='icon_big'>
    <div class='page_header'>{$user_friends_block6} <a href='{$url->url_create('profile', $owner->user_info.user_username)}'>{$owner->user_info.user_username}</a>{$user_friends_block8}</div>
    <div>{$user_friends_block7} <a href='{$url->url_create('profile', $owner->user_info.user_username)}'>{$owner->user_info.user_username}</a>{$user_friends_block8}</div>
    <br><br>
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td>
      <form action='user_friends_block.php' method='POST'>
      <input type='submit' class='button' value='{$user_friends_block9}'>&nbsp;
      <input type='hidden' name='task' value='block'>
      <input type='hidden' name='confirm' value='1'>
      <input type='hidden' name='user' value='{$owner->user_info.user_username}'>
      </form>
    </td>
    <td>
      <form action='user_friends_block.php' method='POST'>
      <input type='submit' class='button' value='{$user_friends_block10}'>
      <input type='hidden' name='task' value='cancel'>
      <input type='hidden' name='user' value='{$owner->user_info.user_username}'>
      </form>
    </td>
    </tr>
    </table>

  {* DISPLAY RESULT *}
  {else}

    <img src='./images/icons/block48.gif' border='0' class='icon_big'>
    <div class='page_header'><a href='{$url->url_create('profile', $owner->user_info.user_username)}'>{$owner->user_info.user_username}</a> {$user_friends_block12}</div>
    <div>{$result}</div>
    <br><br>
  
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td>
      <form action='profile.php' method='get'>
      <input type='submit' class='button' value='{$user_friends_block11}'>
      <input type='hidden' name='user' value='{$owner->user_info.user_username}'>
      </form>
    </td>
    </tr>
    </table>

  {/if}
{/if}

{include file='footer.tpl'}