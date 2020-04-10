{include file='header.tpl'}

<table class='tabs' cellpadding='0' cellspacing='0'>
<tr>
<td class='tab0'>&nbsp;</td>
<td class='tab1' NOWRAP><a href='help.php'>{$help1}</a></td>
<td class='tab'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='help_tos.php'>{$help2}</a></td>
<td class='tab'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='help_contact.php'>{$help3}</a></td>
<td class='tab3'>&nbsp;</td>
</tr>
</table>

<img src='./images/icons/help48.gif' border='0' class='icon_big'>
<div class='page_header'>{$help4}</div>
<div>{$help5}</div>

<br><br>

{literal}
<script language="javascript">
<!--
function showhide(id1) {
	if(document.getElementById(id1).style.display=='none') {
		document.getElementById(id1).style.display='block';
	} else {
		document.getElementById(id1).style.display='none';
	}
}
// -->
</script>
{/literal}

<div class='header'>{$help6}</div>
<div class='faq_questions'>
  <a href="javascript:void(0);" onClick="showhide('1');">{$help7}</a><br>
  <div class='faq' style='display: none;' id='1'>{$help8}</div>
  <a href="javascript:void(0);" onClick="showhide('2');">{$help9}</a><br>
  <div class='faq' style='display: none;' id='2'>{$help10}</div>
  <a href="javascript:void(0);" onClick="showhide('3');">{$help11}</a><br>
  <div class='faq' style='display: none;' id='3'>{$help12}</div>
  <a href="javascript:void(0);" onClick="showhide('4');">{$help13}</a><br>
  <div class='faq' style='display: none;' id='4'>{$help14}</div>
  <a href="javascript:void(0);" onClick="showhide('5');">{$help15}</a><br>
  <div class='faq' style='display: none;' id='5'>{$help16}</div>
</div>

<br>

<div class='header'>{$help17}</div>
<div class='faq_questions'>
  <a href="javascript:void(0);" onClick="showhide('6');">{$help18}</a><br>
  <div class='faq' style='display: none;' id='6'>{$help19}</div>
  <a href="javascript:void(0);" onClick="showhide('7');">{$help20}</a><br>
  <div class='faq' style='display: none;' id='7'>{$help21}</div>
</div>

<br>

<div class='header'>{$help22}</div>
<div class='faq_questions'>
  <a href="javascript:void(0);" onClick="showhide('9');">{$help23}</a><br>
  <div class='faq' style='display: none;' id='9'>{$help24}</div>
  <a href="javascript:void(0);" onClick="showhide('10');">{$help25}</a><br>
  <div class='faq' style='display: none;' id='10'>{$help26}</div>
  <a href="javascript:void(0);" onClick="showhide('11');">{$help27}</a><br>
  <div class='faq' style='display: none;' id='11'>{$help28}</div>
</div>

{include file='footer.tpl'}