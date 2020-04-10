<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>{$user_blog_flash12}</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="robots" content="noindex, nofollow" />
  <script src="./include/fckeditor/editor/dialog/common/fck_dialog_common.js" type="text/javascript"></script>
  <script src="./include/fckeditor/editor/dialog/fck_flash/fck_flash.js" type="text/javascript"></script>
  <link href="./include/fckeditor/editor/dialog/common/fck_dialog_common.css" rel="stylesheet" type="text/css" />

</head>
<body scroll="no" style="overflow: hidden">
  <div id="divInfo">
    <table cellspacing="1" cellpadding="1" border="0" width="100%" height="100%">
      <tr>
        <td>
          <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
              <td width="100%">{$user_blog_flash5}</td>
              <td id="tdBrowse" style="display: none" nowrap="nowrap" rowspan="2"></td>
            </tr>
            <tr>
              <td valign="top"><input id="txtUrl" style="width: 100%" type="text" onblur="UpdatePreview();" /></td>
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
                    <td nowrap="nowrap" align='right'>{$user_blog_flash6} &nbsp;</td>
                    <td><input type="text" size="3" id="txtWidth" /></td>
                  </tr>
                  <tr>
                    <td align='right' nowrap="nowrap">{$user_blog_flash7} &nbsp;</td>
                    <td><input type="text" size="3" id="txtHeight" /></td>
                  </tr>
                </table>
              </td>
              <td width="100%" style="padding-left: 5px;" valign="top">
                <table cellpadding="0" cellspacing="0" width="100%" style="table-layout: fixed">
                  <tr><td>{$user_blog_flash8}</td></tr>
                  <tr><td valign="top"><iframe class="FlashPreviewArea" src="./include/fckeditor/editor/dialog/fck_flash/fck_flash_preview.html" frameborder="0" marginheight="0" marginwidth="0"></iframe></td></tr>
                 </table>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td align="right"><input id="btnOk" type="button" value="{$user_blog_flash9}" onclick="window.parent.Ok();" />&nbsp; <input type="button" value="{$user_blog_flash10}" onclick="window.parent.Cancel();" /></td>
      </tr>
    </table>
  </div>
</body>
</html>
