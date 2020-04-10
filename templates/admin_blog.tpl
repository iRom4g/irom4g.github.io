{include file='admin_header.tpl'}

<h2>{$admin_blog1}</h2>
{$admin_blog2}

<br><br>

{if $result != 0}
  <div class='success'><img src='../images/success.gif' class='icon' border='0'> {$admin_blog3}</div>
{/if}

<form action='admin_blog.php' method='POST' name='info'>

  {* JAVASCRIPT FOR ADDING BLOG CATEGORIES *}
  {literal}
  <script type="text/javascript">
  {/literal}
  <!-- Begin
  var blogcat_id = {$num_cats}+1;
  {literal}
  function addInput(fieldname) {
    var ni = document.getElementById(fieldname);
    var newdiv = document.createElement('div');
    var divIdName = 'my'+blogcat_id+'Div';
    newdiv.setAttribute('id',divIdName);
    newdiv.innerHTML = "<input type='text' name='blogentrycat_title" + blogcat_id +"' class='text' size='30' maxlength='50'>&nbsp;<br>";
    ni.appendChild(newdiv);
    blogcat_id++;
    window.document.info.num_blogcategories.value=blogcat_id;
  }
  // End -->
  </script>
  {/literal}


<table cellpadding='0' cellspacing='0' width='600'>
<td class='header'>{$admin_blog10}</td>
</tr>
<td class='setting1'>
  {$admin_blog11}
</td>
</tr>
<tr>
<td class='setting2'>
  <table cellpadding='2' cellspacing='0'>
  <tr>
  <td><input type='radio' name='setting_permission_blog' id='permission_blog_1' value='1'{if $permission_blog == 1} CHECKED{/if}></td>
  <td><label for='permission_blog_1'>{$admin_blog13}</label></td>
  </tr>
  <tr>
  <td><input type='radio' name='setting_permission_blog' id='permission_blog_0' value='0'{if $permission_blog == 0} CHECKED{/if}></td>
  <td><label for='permission_blog_0'>{$admin_blog14}</label></td>
  </tr>
  </table>
</td>
</tr>
</table>
  
  <br>
  
  <table cellpadding='0' cellspacing='0' width='600'>
  <tr><td class='header'>{$admin_blog15}</td></tr>
  <tr><td class='setting1'>
  {$admin_blog16}
  </td></tr><tr><td class='setting2'>
    <table cellpadding='0' cellspacing='0'>
    <tr><td><b>{$admin_blog15}</b></td></tr>
    {section name=blogentrycats_loop loop=$blogentrycats}
      <tr><td><input type='text' class='text' name='blogentrycat_title{$blogentrycats[blogentrycats_loop].blogentrycat_id}' value='{$blogentrycats[blogentrycats_loop].blogentrycat_title}' size='30' maxlength='100'>&nbsp;</td></tr>
    {/section}
    <tr><td><p id='newtype'></p></td></tr>
    <tr><td><a href="javascript:addInput('newtype')">{$admin_blog17}</a></td><input type='hidden' name='num_blogcategories' value='{$num_cats}'></tr>
    </table>
  </td></tr>
  </table>
 
<br>

<table cellpadding='0' cellspacing='0' width='600'>
<tr>
<td class='header'>{$admin_blog6}</td>
</tr>
<td class='setting1'>
  {$admin_blog7}
</td>
</tr>
<tr>
<td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td width='80'>{$admin_blog4}</td>
  <td><input type='text' class='text' size='30' name='setting_email_blogcomment_subject' value='{$setting_email_blogcomment_subject}' maxlength='200'></td>
  </tr><tr>
  <td valign='top'>{$admin_blog5}</td>
  <td><textarea rows='6' cols='80' class='text' name='setting_email_blogcomment_message'>{$setting_email_blogcomment_message}</textarea><br>{$admin_blog8}</td>
  </tr>
  </table>
</td>
</tr>
</table>

<br>

<input type='submit' class='button' value='{$admin_blog9}'>
<input type='hidden' name='task' value='dosave'>
</form>


{include file='admin_footer.tpl'}