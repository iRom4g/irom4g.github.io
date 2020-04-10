<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>{$user_blog_image18}</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="robots" content="noindex, nofollow" />
  <script src="./include/fckeditor/editor/dialog/common/fck_dialog_common.js" type="text/javascript"></script>
  <script src="./include/fckeditor/editor/dialog/fck_image/fck_image.js" type="text/javascript"></script>
  <link href="./include/fckeditor/editor/dialog/common/fck_dialog_common.css" rel="stylesheet" type="text/css" />

</head>
<body scroll="no" style="overflow: hidden">
  <div id="divInfo">
    <table cellspacing="1" cellpadding="1" border="0" width="100%" height="100%">
      <tr>
        <td>
          <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
              <td width="100%">{$user_blog_image11}</td>
              <td id="tdBrowse" style="display: none" nowrap="nowrap" rowspan="2"></td>
            </tr>
            <tr>
              <td valign="top"><input id="txtUrl" style="width: 100%" type="text" onblur="UpdatePreview();" /><input type="hidden" id="txtAlt" style="width: 100%" type="text" /></td>
            </tr>
          </table>
        </td>
      </tr>
      <tr height="100%">
        <td valign="top">
          <table cellspacing="0" cellpadding="0" width="100%" border="0" height="100%">
            <tr>
              <td valign="top"><br />
                <table cellspacing="0" cellpadding="0" border="0">
                  <tr>
                    <td nowrap="nowrap" align="right">{$user_blog_image12} &nbsp;</td>
                    <td><input type="text" size="3" id="txtWidth" onkeyup="OnSizeChanged('Width',this.value);" /></td>
                  </tr>
                  <tr>
                    <td nowrap="nowrap" align="right">{$user_blog_image13} &nbsp;</td>
                    <td><input type="text" size="3" id="txtHeight" onkeyup="OnSizeChanged('Height',this.value);" /></td>
                  </tr>
                  <tr>
                    <td nowrap="nowrap" align="right">{$user_blog_image14} &nbsp;</td>
                    <td><input type="text" size="3" value="" id="txtBorder" onChange="UpdatePreview();" /></td>
                  </tr>
                </table>
              </td>
              <td width="100%" style="padding-left: 5px;" valign="top">
                <table cellpadding="0" cellspacing="0" width="100%" style="table-layout: fixed">
                  <tr><td>{$user_blog_image15}</td></tr>
                  <tr><td valign="top"><iframe class="ImagePreviewArea" src="./include/fckeditor/editor/dialog/fck_image/fck_image_preview.html" frameborder="0" marginheight="0" marginwidth="0"></iframe></td></tr>
                 </table>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td align="right"><input id="btnOk" type="button" value="{$user_blog_image16}" onclick="window.parent.Ok();" />&nbsp; <input type="button" value="{$user_blog_image17}" onclick="window.parent.Cancel();" /></td>
      </tr>
    </table>
  </div>
</body>
</html>
