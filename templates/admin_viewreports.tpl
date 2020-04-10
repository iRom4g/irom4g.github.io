{include file='admin_header.tpl'}

<h2>{$admin_viewreports1}</h2>
{$admin_viewreports2}

<br><br>

<table cellpadding='0' cellspacing='0' width='400' align='center'>
<tr>
<td align='center'>
<div class='box'>
  <table cellpadding='0' cellspacing='0' align='center'>
  <tr><form action='admin_viewreports.php' method='POST'>
  <td>
    {$admin_viewreports14}<br>
    <select name='f_reason' class='text'>
    <option value=''{if $f_reason == ""} SELECTED{/if}></option>
    <option value='1'{if $f_reason == "1"} SELECTED{/if}>{$admin_viewreports8}</option>
    <option value='2'{if $f_reason == "2"} SELECTED{/if}>{$admin_viewreports9}</option>
    <option value='3'{if $f_reason == "3"} SELECTED{/if}>{$admin_viewreports10}</option>
    <option value='0'{if $f_reason == "0"} SELECTED{/if}>{$admin_viewreports11}</option>
    </select>&nbsp;
  </td>
  <td>{$admin_viewreports12}<br><input type='text' class='text' name='f_details' value='{$f_details}' size='15' maxlength='50'>&nbsp;</td>
  <td><input type='submit' class='button' value='{$admin_viewreports15}'></td>
  <input type='hidden' name='s' value='{$s}'>
  </form>
  </tr>
  </table>
</div>
</td></tr></table>

<br>

{if $total_reports == 0}

  <table cellpadding='0' cellspacing='0' width='400' align='center'>
  <tr>
  <td align='center'>
  <div class='box'><b>{$admin_viewreports4}</b></div>
  </td></tr></table>
  <br>

{else}

  {* JAVASCRIPT FOR CHECK ALL *}
  {literal}
  <script language='JavaScript'> 
  <!---
  var checkboxcount = 1;
  function doCheckAll() {
    if(checkboxcount == 0) {
      with (document.items) {
      for (var i=0; i < elements.length; i++) {
      if (elements[i].type == 'checkbox') {
      elements[i].checked = false;
      }}
      checkboxcount = checkboxcount + 1;
      }
    } else
      with (document.items) {
      for (var i=0; i < elements.length; i++) {
      if (elements[i].type == 'checkbox') {
      elements[i].checked = true;
      }}
      checkboxcount = checkboxcount - 1;
      }
  }
  // -->
  </script>
  {/literal}

  <div class='pages'>{$total_reports} {$admin_viewreports16} &nbsp;|&nbsp; {$admin_viewreports17} {section name=page_loop loop=$pages}{if $pages[page_loop].link == '1'}{$pages[page_loop].page}{else}<a href='admin_viewgroups.php?s={$s}&p={$pages[page_loop].page}&f_title={$f_title}&f_owner={$f_owner}'>{$pages[page_loop].page}</a>{/if} {/section}</div>

  <form action='admin_viewreports.php' method='post' name='items'>
  <table cellpadding='0' cellspacing='0' class='list' width='100%'>
  <tr>
  <td class='header' width='1'><input type='checkbox' name='select_all' onClick='javascript:doCheckAll()'></td>
  <td class='header' width='1' style='padding-left: 0px;'><a class='header' href='admin_viewreports.php?s={$i}&p={$p}&f_object={$f_object}&f_reason={$f_reason}&f_details={$f_details}'>{$admin_viewreports18}</a></td>
  <td class='header' width='5%'><a class='header' href='admin_viewreports.php?s={$u}&p={$p}&f_object={$f_object}&f_reason={$f_reason}&f_details={$f_details}'>{$admin_viewreports19}</a></td>
  <td class='header' width='75%'>{$admin_viewreports12}</td>
  <td class='header' width='5%'>{$admin_viewreports14}</td>
  <td class='header' width='5%'>{$admin_viewreports20}</td>
  </tr>
  {section name=report_loop loop=$reports}
    <tr class='{cycle values="background1,background2"}'>
    <td class='item' nowrap='nowrap' style='padding-right: 0px;'><input type='checkbox' name='item_{$reports[report_loop].report_id}' value='1'></td>
    <td class='item' nowrap='nowrap' style='padding-left: 0px;'>{$reports[report_loop].report_id} &nbsp;</td>
    <td class='item' nowrap='nowrap'><a href='{$url->url_create("profile", $reports[report_loop].report_username)}' target='_blank'>{$reports[report_loop].report_username}</a> &nbsp;</td>
    <td class='item'>{$reports[report_loop].report_details|truncate:90:"...":true} &nbsp;</td>
    <td class='item' nowrap='nowrap'>{$reports[report_loop].report_reason} &nbsp;</td>
    <td class='item' nowrap='nowrap'>
      <a href='admin_loginasuser.php?user_id={$reports[report_loop].report_user_id}&return_url={$reports[report_loop].report_url}' target='_blank'>{$admin_viewreports5}</a> 
      | <a href='admin_viewreports_edit.php?report_id={$reports[report_loop].report_id}'>{$admin_viewreports3}</a>
      | <a href='admin_viewreports.php?task=delete&report_id={$reports[report_loop].report_id}'>{$admin_viewreports6}</a>
    </td>
    </tr>
  {/section}
  </table>

  <table cellpadding='0' cellspacing='0' width='100%'>
  <tr>
  <td>
    <br>
    <input type='submit' class='button' value='{$admin_viewreports7}'>
    <input type='hidden' name='task' value='dodelete'>
    </form>
  </td>
  <td align='right' valign='top'>
    <div class='pages2'>{$total_reports} {$admin_viewreports16} &nbsp;|&nbsp; {$admin_viewreports17} {section name=page_loop loop=$pages}{if $pages[page_loop].link == '1'}{$pages[page_loop].page}{else}<a href='admin_viewgroups.php?s={$s}&p={$pages[page_loop].page}&f_title={$f_title}&f_owner={$f_owner}'>{$pages[page_loop].page}</a>{/if} {/section}</div>
  </td>
  </tr>
  </table>
{/if}


{include file='admin_footer.tpl'}