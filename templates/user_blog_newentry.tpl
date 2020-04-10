{include file='header.tpl'}

<table class='tabs' cellpadding='0' cellspacing='0'>
<tr>
<td class='tab0'>&nbsp;</td>
<td class='tab1' NOWRAP><a href='user_blog.php'>{$user_blog_newentry1}</a></td>
<td class='tab'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='user_blog_settings.php'>{$user_blog_newentry2}</a></td>
<td class='tab3'>&nbsp;</td>
</tr>
</table>

<table cellpadding='0' cellspacing='0' width='100%'><tr><td class='page'>

<img src='./images/icons/blog48.gif' border='0' class='icon_big'>
<div class='page_header'>{$user_blog_newentry3}</div>
<div>{$user_blog_newentry4}</div>

<br><br>

{* AJAX PREVIEW MOD *}

{literal}
<script type="text/javascript">
<!--
  var blog_form_object;
  var default_blog_target;
  var default_blog_action;

  function do_blog_preview()
  {
    if( typeof(blog_form_object)=="undefined" )
    {
      blog_form_object      = document.getElementById('blogform');
      default_blog_target   = blog_form_object.target;
      default_blog_action   = blog_form_object.action;
    }
    
    blog_form_object.target = 'blogframe';
    blog_form_object.action = 'user_blog_preview.php';
    blog_form_object.submit();
    
    showdiv('entry_preview');
    hidediv('entry_main');
  }
  
  function do_blog_main()
  {
    blog_form_object.target = default_blog_target;
    blog_form_object.action = default_blog_action;
    
    showdiv('entry_main');
    hidediv('entry_preview');

    var d = document.getElementById('previewpane');
    if(document.getElementById('mydiv')) {
      var olddiv = document.getElementById('mydiv');
      d.removeChild(olddiv);
    }
  }

  function show_preview()
  {
    table = parent.frames['blogframe'].document.getElementById('blogpreview');
    var ni = document.getElementById('previewpane');
    var newdiv = document.createElement('div');
    newdiv.setAttribute('id','mydiv');
    newdiv.innerHTML = '<table cellpadding="0" cellspacing="0">'+table.innerHTML+'</table>';
    ni.appendChild(newdiv);
  }
//-->
</script>
{/literal}

<div id="entry_main">
{* AJAX PREVIEW MOD *}

  <form action='user_blog_newentry.php' method='post' name='info' id="blogform">
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td class='form1'>{$user_blog_newentry5}</td>
  <td class='form2'><input type='text' name='blogentry_title' class='text' size='50' maxlength='100'></td>
  </tr>

  {* SHOW BLOG CATEGORIES IF ANY EXIST *}
  {if $blogentrycats|@count > 0}
  <tr>
  <td class='form1'>{$user_blog_newentry6}</td>
  <td class='form2'>
  <select name='blogentry_blogentrycat_id'>
  <option value='0'></option>
  {section name=blogentrycat_loop loop=$blogentrycats}
    <option value='{$blogentrycats[blogentrycat_loop].blogentrycat_id}'>{$blogentrycats[blogentrycat_loop].blogentrycat_title}</option>
  {/section}
  </select>
  </td>
  </tr>
  {/if}

  </table>

  <br>

  <script type="text/javascript">
  <!--
  var sBasePath = "./include/fckeditor/" ;
  var sToolbar ;
  var oFCKeditor = new FCKeditor( 'blogentry_body' ) ;
  oFCKeditor.BasePath	= sBasePath ;
  oFCKeditor.Height = "300" ;
  if ( sToolbar != null )
    oFCKeditor.ToolbarSet = sToolbar ;
  oFCKeditor.Value = '' ;
  oFCKeditor.Create() ;
  //-->
  </script>

  {literal}
  <script type="text/javascript">
  <!--
  function fill() {
    window.document.preview.blogentry_title.value = window.document.info.blogentry_title.value;
    var oEditor = FCKeditorAPI.GetInstance('blogentry_body');
    window.document.preview.blogentry_body.value = oEditor.GetXHTML( false );
    window.document.preview.blogentry_blogentrycat_id.value = window.document.info.blogentry_blogentrycat_id.options[window.document.info.blogentry_blogentrycat_id.selectedIndex].value;
  }
  //-->
  </script>
  {/literal}

  {* SHOW SETTINGS LINK IF NECESSARY *}
  {if $privacy_options|@count > 1 OR $comment_options|@count > 1}
    <table cellpadding='0' cellspacing='0' width='100%'>
    <tr>
    <td class='blog_options'>
      <div id='settings_show'>
        <a href="javascript:showdiv('entry_settings');showdiv('settings_hide');hidediv('settings_show');">{$user_blog_newentry7}</a>
      </div>
      <div id='settings_hide' style='display: none;'>
        <a href="javascript:hidediv('entry_settings');hidediv('settings_hide');showdiv('settings_show');">{$user_blog_newentry8}</a>
      </div>
    </td>
    </tr>
    </table>
  {/if}

  <div id='entry_settings' class='blog_settings' style='display: none;'>


    {* SHOW SEARCH PRIVACY OPTIONS IF ALLOWED BY ADMIN *}
    {if $user->level_info.level_blog_search == 1}
      <b>{$user_blog_newentry9}</b>
      <table cellpadding='0' cellspacing='0'>
        <tr><td><input type='radio' name='blogentry_search' id='blogentry_search_1' value='1' CHECKED></td><td><label for='blogentry_search_1'>{$user_blog_newentry10}</label></td></tr>
        <tr><td><input type='radio' name='blogentry_search' id='blogentry_search_0' value='0'></td><td><label for='blogentry_search_0'>{$user_blog_newentry11}</label></td></tr>
      </table>
    {/if}

    {* ADD SPACE IF BOTH OPTIONS ARE AVAILABLE *}
    {if $user->level_info.level_blog_search == 1 AND ($privacy_options|@count > 1 OR $comment_options|@count > 1)}<br>{/if}

    {* SHOW PRIVACY OPTIONS *}
    {if $privacy_options|@count > 1}
      <b>{$user_blog_newentry12}</b>
      <table cellpadding='0' cellspacing='0'>
        {section name=privacy_loop loop=$privacy_options}
          <tr><td><input type='radio' name='blogentry_privacy' id='{$privacy_options[privacy_loop].privacy_id}' value='{$privacy_options[privacy_loop].privacy_value}'{if $smarty.section.privacy_loop.first} CHECKED{/if}></td><td><label for='{$privacy_options[privacy_loop].privacy_id}'>{$privacy_options[privacy_loop].privacy_option}</label></td></tr>
        {/section}
      </table>
    {/if}

    {* ADD SPACE IF BOTH OPTIONS ARE AVAILABLE *}
    {if $privacy_options|@count > 1 AND $comment_options|@count > 1}<br>{/if}

    {* SHOW COMMENT OPTIONS *}
    {if $comment_options|@count > 1}
      <b>{$user_blog_newentry13}</b>
      <table cellpadding='0' cellspacing='0'>
        {section name=comment_loop loop=$comment_options}
          <tr><td><input type='radio' name='blogentry_comments' id='{$comment_options[comment_loop].comment_id}' value='{$comment_options[comment_loop].comment_value}'{if $smarty.section.comment_loop.first} CHECKED{/if}></td><td><label for='{$comment_options[comment_loop].comment_id}'>{$comment_options[comment_loop].comment_option}</label></td></tr>
        {/section}
      </table>
    {/if}

  </div>

  <br>

  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td>
    <input type='submit' class='button' value='{$user_blog_newentry14}'>&nbsp;
    <input type='hidden' name='task' value='dosave'>
    </form>
  </td>
  <td>
    <input type='button' class='button' value='{$user_blog_newentry15}' onClick="do_blog_preview();">&nbsp;
  </td>
  <td>
    <form action='user_blog.php' method='post'>
    <input type='submit' class='button' value='{$user_blog_newentry16}'>
    </form>
  </td>
  </tr>
  </table>



{* AJAX PREVIEW MOD *}
</div>
<div id="entry_preview" style='display: none;'>
  <h2>Preview: (<a href="javascript:void()" onClick="do_blog_main();">Return to Editing</a>)</h2>
  <iframe id="blogframe" name="blogframe" src="about:blank" scrolling="no" style="display:none;width:100%;border:1px solid #000000;height:800px;"></iframe>
  <div id='previewpane' style='padding:0px;border:1px dashed #AAAAAA;'></div>
</div>

{* AJAX PREVIEW MOD *}

</td></tr></table>

{include file='footer.tpl'}