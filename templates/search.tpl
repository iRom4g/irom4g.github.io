{include file='header.tpl'}

<img src='./images/icons/search48.gif' border='0' class='icon_big'>
<div class='page_header'>{$search1}</div>
<div>{$search2}</div>

<br><br>

<form action='search.php' name='search_form' method='post'>
<table cellpadding='0' cellspacing='0' align='center'>
<tr>
<td class='search'>
  <table cellpadding='0' cellspacing='0' align='center'>
  <tr>
  <td>{$search3}</td>
  <td>&nbsp;<input type='text' size='30' class='text' name='search_text' value='{$search_text}' maxlength='100'></td>
  <td>
    &nbsp;<input type='submit' class='button' value='{$search4}'>
    <input type='hidden' name='task' value='dosearch'>
    <input type='hidden' name='t' value='0'>
  </td>
  </tr>
  <tr>
  <td>&nbsp;</td>
  <td colspan='2'>&nbsp;<a href='search_advanced.php'>{$search5}</a></td>
  </tr>
  </table>
</div>
</form>
</td>
</tr>
</table>

<br>

{if $search_text != ""}

  {if $is_results == 0}

    <table cellpadding='0' cellspacing='0' align='center'>
    <tr>
    <td class='result'>
      <img src='./images/icons/bulb16.gif' class='icon'>
      {$search6} "<b>{$search_text}</b>" {$search7}
    </td>
    </tr>
    </table>

  {else}


    {* SHOW DIFFERENT RESULT TOTALS *}
    <table class='tabs' cellpadding='0' cellspacing='0'>
    <tr>
    <td class='tab0'>&nbsp;</td>
      {section name=search_loop loop=$search_objects}
        <td class='tab{if $t == $search_objects[search_loop].search_type}1{else}2{/if}' NOWRAP>{if $search_objects[search_loop].search_total == 0}{$search_objects[search_loop].search_total} {$search_objects[search_loop].search_item}{else}<a href='search.php?task=dosearch&search_text={$url_search}&t={$search_objects[search_loop].search_type}'>{$search_objects[search_loop].search_total} {$search_objects[search_loop].search_item}</a>{/if}</td>
        <td class='tab'>&nbsp;</td>
      {/section}
      <td class='tab3'>&nbsp;</td>
    </tr>
    </table>

    <div class='search_results'>

      {* SHOW PAGES *}
      {if $p != 1}<a href='search.php?task=dosearch&search_text={$url_search}&t={$t}&p={math equation='p-1' p=$p}'>&#171; {$search14}</a> &nbsp;|&nbsp;&nbsp;{/if}
      {if $p_start == $p_end}
        <b>{$search15} {$p_start} {$search16} {$total_results} {$search17}</b> ({$search_time} {$search18}) 
      {else}
        <b>{$search15} {$p_start} - {$p_end} {$search16} {$total_results} {$search17}</b> ({$search_time} {$search18}) 
      {/if}
      {if $p != $maxpage}&nbsp;&nbsp;|&nbsp; <a href='search.php?task=dosearch&search_text={$url_search}&t={$t}&p={math equation='p+1' p=$p}'>{$search19} &#187;</a>{/if}

      <br><br>

      {* SHOW RESULTS *}
      {section name=result_loop loop=$results}
	
	{* SET ICON *}
	{if $results[result_loop].result_icon != ''}
	  {assign var='result_icon' value=$results[result_loop].result_icon}
	{elseif $results[result_loop].result_user != ''}
	  {assign var='result_icon' value=$results[result_loop].result_user->user_photo('./images/nophoto.gif')}
	{else}
	  {assign var='result_icon' value='./images/icons/search_profile22.gif'}
	{/if}

	<div class='search_result{cycle values="1,2"}'>
	<table cellpadding='0' cellspacing='0'>
        <tr>
        <td valign='top' style='padding-right: 3px;'>
	  <div style='width: 90px; text-align: center;'><a href="{$results[result_loop].result_url}" class="title"><img src='{$result_icon}' class='photo' width='{$misc->photo_size($result_icon,'80','80','w')}' border='0'></a></div>
	</td>
	<td valign='top'>
          <div class='search_result_text'>
            <a href="{$results[result_loop].result_url}" class="title">{$results[result_loop].result_name}</a>
            <div class='search_result_text2'>{$results[result_loop].result_desc}</div>
	    {if $results[result_loop].result_online == 1}<div style='margin-top: 5px;'><img src='./images/icons/online16.gif' border='0' class='icon'>{$search11}</div>{/if}
          </div>
	</td>
	</tr>
	</table>
	</div>

      {/section}

      {* SHOW PAGES *}
      <br>
      {if $p != 1}<a href='search.php?task=dosearch&search_text={$url_search}&t={$t}&p={math equation='p-1' p=$p}'>&#171; {$search14}</a> &nbsp;|&nbsp;&nbsp;{/if}
      {if $p_start == $p_end}
        <b>{$search15} {$p_start} {$search16} {$total_results} {$search17}</b> ({$search_time} {$search18}) 
      {else}
        <b>{$search15} {$p_start} - {$p_end} {$search16} {$total_results} {$search17}</b> ({$search_time} {$search18}) 
      {/if}
      {if $p != $maxpage}&nbsp;&nbsp;|&nbsp; <a href='search.php?task=dosearch&search_text={$url_search}&t={$t}&p={math equation='p+1' p=$p}'>{$search19} &#187;</a>{/if}


    </div>
  {/if}
{/if}


{* JAVASCRIPT TO AUTOFOCUS ON SEARCH FIELD *}
{literal}
<script language="JavaScript">
<!--
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
function windowonload() { document.search_form.search_text.focus(); } 
// -->
{/literal}
</script>

{include file='footer.tpl'}