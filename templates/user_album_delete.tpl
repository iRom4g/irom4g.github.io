{include file='header.tpl'}

  <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1> Удаление альбома</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">

 
 <div style="margin:10px auto;">
 <table id="dialog" border="0" cellspacing="0">
  <tbody>
   <tr>
    <td class="dialog" style="width:250px">
     <h4>Удаление альбома</h4>
     <p>Вы уверены, что хотите удалить альбом?</p>
      <form action='user_album_delete.php' method='post' name="deleteAlbum" >
      <input type='hidden' name='task' value='dodelete'>
      <input type='hidden' name='album_id' value='{$album_id}'>
      </form>
    
     </div>
     <div style='height:25px; float:right; margin-right:10px'>

    <ul class='nNav'>
     <li style="margin-left:0px">
      <b class="nc"><b class="nc1"><b></b></b><b class="nc2"><b></b></b></b>
      <span class="ncc"><a href="javascript:this.disabled=true; document.getElementById('deleteAlbum').submit();">Удалить</a></span>
      <b class="nc"><b class="nc2"><b></b></b><b class="nc1"><b></b></b></b>
     </li>
     <li>
      <b class="nc"><b class="nc1"><b></b></b><b class="nc2"><b></b></b></b>
      <span class="ncc"><a href="javascript:document.location='user_album.php'">Отмена</a></span>
      <b class="nc"><b class="nc2"><b></b></b><b class="nc1"><b></b></b></b>
     </li>
    </ul>

     </div>
    </td>
   </tr>
  </tbody>
 </table>
 <div id="shadowLine" style="width:272px"></div>
 </div>


    
   </div>
  </div>
  </div>

  </div>
  <div id="boxHolder"></div>
{include file='footer.tpl'}