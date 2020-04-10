{include file='header.tpl'}
<link rel='stylesheet' href='css/notes.css' type='text/css'>
  <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1> Мои заметки</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">

    
<div class="bar clearFix summaryBar">
 <div class="summary">{if $total_blogentries == 0}Не найдено ни одной заметки{/if}{if $total_blogentries > 0}Найден{if $total_blogentries ==1}а{else}о{/if} {$total_blogentries} заметк{if $total_blogentries ==1}а{else}и{/if}{/if}</div>
  &nbsp;
</div>
<div id="notesBar" class="clearFix">
 <div class="column mainPanel" id="mainPanel">
  
 
{* JAVASCRIPT FOR CHECK ALL BUTTON *}
{literal}
<script language='JavaScript'> 
<!---
var checkboxcount = 1;
function doCheckAll() {
  if(checkboxcount == 0) {
    with (document.entryform) {
    for (var i=0; i < elements.length; i++) {
    if (elements[i].type == 'checkbox') {
    elements[i].checked = false;
    }}
    checkboxcount = checkboxcount + 1;
    }
  } else
    with (document.entryform) {
    for (var i=0; i < elements.length; i++) {
    if (elements[i].type == 'checkbox') {
    elements[i].checked = true;
    }}
    checkboxcount = checkboxcount - 1;
  }
}
function SymError() { return true; }
window.onerror = SymError;
var SymRealWinOpen = window.open;
function SymWinOpen(url, name, attributes) { return (new Object()); }
window.open = SymWinOpen;
appendEvent = function(el, evname, func) {
 if (el.attachEvent) { // IE
   el.attachEvent('on' + evname, func);
 } else if (el.addEventListener) { // Gecko / W3C
   el.addEventListener(evname, func, true);
 } else {
   el['on' + evname] = func;
 }
};
appendEvent(window, 'load', windowonload);
function windowonload() { 
  document.searchform.search.focus(); 
  document.searchform.search.value+=''; 
} 
// -->
</script>
{/literal}

{* DISPLAY MESSAGE IF NO BLOG ENTRIES *}
{if $total_blogentries == 0}
<div style="padding:20px">
<h4>Добро пожаловать</h4>
<div style="padding:0px 10px 10px 10px">
С помощью заметок Вы можете делиться событиями из жизни с друзьями, а также быть в курсе того, что нового происходит у них.
</div>
</div>

{* DISPLAY ENTRIES *}
{else}

  {* LIST BLOG ENTRIES *}
  {section name=blogentry_loop loop=$blogentries}
    {* CREATE BLOG ENTRY TITLE *}
    {if $blogentries[blogentry_loop].blogentry_title != ""}
      {assign var='blogentry_title' value=$blogentries[blogentry_loop].blogentry_title|truncate:50:"...":false}
    {else}
      {assign var='blogentry_title' value=$user_blog21}
    {/if}
  <div class="note clearFix">
   <div class="profile_thumb">
    <a href="profile.php?id=6262738">
     <img src='{$user->user_photo('./images/nophoto.gif')}' class='photo' border='0' width='{$misc->photo_size($user->user_photo('./images/nophoto.gif'),'50','199','w')}'>
    </a>
   </div>
   <div class="note_body">
    <div class="note_header">
     <div class="note_title_share clearFix">
      <div class="note_title">
       <a href="{$url->url_create('blog_entry', $user->user_info.user_username, $blogentries[blogentry_loop].blogentry_id)}">{$blogentry_title}</a>
      </div>
     </div>
     <div class="byline">
      <span><a href="{$url->url_create('profile', $user->user_info.user_username)}">{$user->user_info.user_username}</a></span> {$datetime->cdate("`$setting.setting_dateformat`", $datetime->timezone($blogentries[blogentry_loop].blogentry_date, $global_timezone))}
     </div>
    </div>
    <div class="note_content clearFix">
     <div>{$blogentries[blogentry_loop].blogentry_body|choptext:40:"<br>"}
     </div>
    </div>
    <div class="note_footer clearFix">
     <div class="comments_count"><a href="user_blog_comments.php?blogentry_id={$blogentries[blogentry_loop].blogentry_id}">Комментарии ({$blogentries[blogentry_loop].total_comments})</a><span class='divide'>|</span><a href='user_blog_editentry.php?blogentry_id={$blogentries[blogentry_loop].blogentry_id}'>редактировать</a><span class='divide'>|</span><a href='user_blog_deleteentry.php?blogentry_id={$blogentries[blogentry_loop].blogentry_id}'>удалить</a></div>
    </div>
   </div>  </div>
   {/section}
{/if}

</div>

 <div class="column sidePanel" id="sidePanel">
  <div id="newNote">
   <div class="add">
    <div style = "padding: 4px 0px 15px 38px">
     <ul class="buttonRow" class="clearFix">
      <li style="width:9.5em"><a style="width:8.5em" href="user_blog_newentry.php">Добавить запись</a></li>
     </ul>
    </div>
   </div>
  </div>
  <div class="activePad"><a href="user_blog.php">Мои заметки</a></div>
  <div class="inactivePad"><a href="user_blog_settings.php">Настройки</a></div>
 </div>
</div>
<div class="bar clearfix footerBar">
 &nbsp;
</div>
    
   </div>
  </div>
  </div>

  </div>
  <div id="boxHolder"></div>


{* DISPLAY PAGINATION MENU IF APPLICABLE *}
{if $maxpage > 1}
  <div class='center'>
  {if $p != 1}<a href='user_blog.php?s={$s}&search={$search}&p={math equation='p-1' p=$p}'>&#171; {$user_blog9}</a>{else}<font class='disabled'>&#171; {$user_blog9}</font>{/if}
  {if $p_start == $p_end}
    &nbsp;|&nbsp; {$user_blog10} {$p_start} {$user_blog11} {$total_blogentries} &nbsp;|&nbsp; 
  {else}
    &nbsp;|&nbsp; {$user_blog12} {$p_start}-{$p_end} {$user_blog11} {$total_blogentries} &nbsp;|&nbsp; 
  {/if}
  {if $p != $maxpage}<a href='user_blog.php?s={$s}&search={$search}&p={math equation='p+1' p=$p}'>{$user_blog13} &#187;</a>{else}<font class='disabled'>{$user_blog13} &#187;</font>{/if}
  </div>
<br>
{/if}



</td></tr></table>

{include file='footer.tpl'}