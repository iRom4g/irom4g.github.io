{include file='header.tpl'}
<link rel='stylesheet' href='css/search.css' type='text/css' />
<link rel='stylesheet' href='css/dialog2.css' type='text/css' />
<link rel='stylesheet' href='css/board.css' type='text/css' />
<link rel='stylesheet' href='css/notes.css' type='text/css' />

 <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1><a href='{$url->url_base}group.php?group_id={$group->group_info.group_id}'>{$group->group_info.group_title}</a> &#187; <a href='group_discussion.php?group_id={$group->group_info.group_id}'>обсуждения</a> &#187; {if $topic_id == 0}новая тема{else} &raquo; оставить коментарий{/if}</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">
<br>
{* SHOW ERROR MESSAGE *}
{if $is_error != 0}
  <div id="msg">{$error_message}</div>
{/if}    
 <div class="clearFix tBar">
  <ul class="tabs">
   <li>
    <a href="group_discussion.php?group_id={$group->group_info.group_id}" style="width:10em">Обсуждения</a>
   </li>
   <li class="activeLink">
    <a href="group_discussion_post.php" style="width:7em">Новая тема</a>
   </li>
  </ul>
 </div>



 <script type="text/javascript">function hasLinks(word)  var linksAllowed = 0;</script>

 <div class="notesEdit clearFix">
  <div class="column mainPanel" id="mainPanel">
  <form action='group_discussion_post.php' method='post' name="editPost" id="editPost">
   {if $topic_id == 0} 
   <div id="fieldTitle" class="clearFix">
    <label for="title" id="label_title">Заголовок:</label>
    <div class="field">
     <input type="text" class="inputText" autocomplete="off" maxlength="255" id="title" name="topic_subject" value="{$topic_subject}" />
    </div>
   </div>
   {/if}
   <div id="fieldBody" class="clearFix">
    <label for="note_content" id="label_note_content">Текст:</label>
    <div class="field">
     <textarea class="textarea" id="post" name="topic_body">{$topic_body}</textarea>
    </div>
   </div>
   {if $setting.setting_group_discussion_code == 1}
  <table cellspacing='0' cellpadding='0'>
  <tr>
    <td valign='top'><img src='./images/secure.php' id='secure_image' border='0' height='20' width='67' class='signup_code'>&nbsp;</td>
    <td style='padding-top: 4px;'><input type='text' name='comment_secure' id='comment_secure' class='text' size='6' maxlength='10'>&nbsp;</td>
    <td><img src='./images/icons/tip.gif' border='0' class='icon' onMouseover="tip('{$group_discussion_post13}')"; onMouseout="hidetip()"></td>
  </tr>
  </table>
  <br><br>
    {/if}
  <input type='hidden' name='task' value='dopost'>
  <input type='hidden' name='group_id' value='{$group->group_info.group_id}'>
  <input type='hidden' name='grouptopic_id' value='{$topic_id}'>
  </form>
  </div>
  <div class="column sidePanel" id="sidePanel">
   <div style = "padding: 10px 0px 15px 34px">
    <ul class="buttonRow" class="clearFix">
     <li style="width:10.5em"><a style="width:9.5em" onclick="if (!linksAllowed && hasLinks(ge('post').value)) " href="javascript:this.disabled=true; ge('editPost').submit();">Создать тему</a></li>
    </ul>
    <ul class="buttonRow" class="clearFix">
     <li style="width:10.5em"><a style="width:9.5em" href="javascript:history.go(-1)">Отмена</a></li>
    </ul>
   </div>
  </div>
 </div>

    
   </div>
  </div>
  </div>

  </div>
  <div id="boxHolder"></div>
<div class='page_header'></div>

{include file='footer.tpl'}