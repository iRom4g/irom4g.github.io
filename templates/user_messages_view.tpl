{include file='header.tpl'}

  <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1><a href='user_messages.php'>Личные сообщения</a> &raquo; просмотр сообщения</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">

    

 <table id="dialog" border="0" cellspacing="0" width="460" style="margin-top:10px">

  <tbody>
   <tr>
    <td class="dialog">
     <h4>Сообщение</h4>
     <div class='topTime'>{$datetime->cdate("`$setting.setting_timeformat` `$setting.setting_dateformat`", $datetime->timezone($pm_date, $global_timezone))}</div>

     <div id="messageFields">

      <table class="formTable" border="0" cellspacing="0" style="width:420px;">

       <tr>
        <td rowspan="5" style="width:68px; vertical-align:top">
         <a href='{$url->url_create('profile',$pm_author->user_info.user_username)}' id="to_url"><img class='messageImage' src='{$pm_author->user_photo('./images/nophoto.gif')}' width='{$misc->photo_size($pm_author->user_photo('./images/nophoto.gif'),'50','90','w')}' border='0' id="to_image">
        </td>
       </tr>

       <tr class="tallRow">
        <td></td>
        <td class="label" style="width:68px">От кого:</td>
        <td style="width:285px"><a href="{$url->url_create('profile',$pm_author->user_info.user_username)}">{$pm_author->user_info.user_username|truncate:10:"...":true}</a></td>
       </tr>

       <tr class="tallRow">
        <td></td>
        <td class="label">Кому:</td>
        <td><a href='{$url->url_create('profile', $pm_recepient->user_info.user_username)}'>{$pm_recepient->user_info.user_username}</a></td>
       </tr>

       <tr>
        <td></td>
        <td class="label">Тема:</td>
        <td>
         {$pm_subject}
        </td>
       </tr>

       <tr class="tallRow">
        <td></td>
        <td class="label">Сообщение:</td>
        <td style='padding-right:20px'>
         {$pm_body|choptext:30:"<br>"}
        </td>
       </tr>

       <tr class="tallRow">
        <td colspan="4">

    <form action='user_messages_view.php' method='POST'>
    <input type='hidden' name='pm_id' value='{$pm_id}'>
    <input type='hidden' name='task' value='delete'>
    </form>
         <div style="float:right; text-align:right; padding:3px 12px 0px 11px">
          <ul class='nNav'>
           <li style="margin-left:0px">
            <b class="nc"><b class="nc1"><b></b></b><b class="nc2"><b></b></b></b>
            <span class="ncc"><a href="javascript:history.go(-1)">Закрыть</a></span>
            <b class="nc"><b class="nc2"><b></b></b><b class="nc1"><b></b></b></b>
           </li>
           <li>
            <b class="nc"><b class="nc1"><b></b></b><b class="nc2"><b></b></b></b>
            <span class="ncc"><a href="user_messages_view.php?pm_id={$pm_id}&task=delete">Удалить</a></span>
            <b class="nc"><b class="nc2"><b></b></b><b class="nc1"><b></b></b></b>
           </li>
          </ul>
         </div>      

        </td>
       </tr>
  {if $pm_inbox == 1}
       <tr class="tallRow">
        <td colspan="4">
         <div id="quickReply" class="flexShut">
          <div class="r" id="woww" style="display:block;">
           <div style="">
            <form method="POST" action="user_messages_new.php" name="postMessage" id="postMessage" onsubmit="return submit_validation();">
            <input type="hidden" name='to' value='{$pm_author->user_info.user_username}'>
      {literal}
      <script language='Javascript'>
      <!--
        window.onload = document.getElementById('to').focus();
      //-->
      </script>
      {/literal}
            <input type="hidden" name='subject' value='Re:{$pm_subject}'>
            <textarea name="message" style="width:400px; height:100px; margin: 5px 12px">{$message}</textarea>
            <input type='hidden' name='task' value='send'>
            <input type='hidden' name='convo_id' value='{$convo_id}'>
            <input type='hidden' name='pm_id' value='{$pm_id}'>
            </form>
           </div>
          </div>
         </div>

        </td>
       </tr>

       <tr class="tallRow">
        <td colspan="4">

         <div style="float:right; text-align:right; padding:0px 12px 6px 11px">
          <ul class='nNav'>
           <li style="margin-left:0px">
            <b class="nc"><b class="nc1"><b></b></b><b class="nc2"><b></b></b></b>
            <span class="ncc"><a href="javascript:document.postMessage.submit()">Ответить</a></span>
            <b class="nc"><b class="nc2"><b></b></b><b class="nc1"><b></b></b></b>
           </li>
          </ul>
         </div>      

        </td>
       </tr>
  {else}
    &nbsp;
  {/if}
      </table>

   
     </div>

    </td>
   </tr>
  </tbody>
 </table>
 <div id="shadowLine" style="width:458px"></div>
 <br> 
{if $convo_total > 0 }
 <div id='historyContents'>
   <div id="messageHistory"><h4>История сообщений</h4>
  <table>
  {section name=convo_loop loop=$convo}
      <tr><td class="date">{$datetime->cdate("`$setting.setting_timeformat` `$setting.setting_dateformat`", $datetime->timezone($convo[convo_loop].pm_date, $global_timezone))}</td>
      {if $convo[convo_loop].pm_author->user_info.user_username == $user->user_info.user_username}<td class="outgoing">{else}<td class="incoming">{/if}{$convo[convo_loop].pm_author->user_info.user_username|truncate:10:"...":true}:</td>
      <td>{$convo[convo_loop].pm_body|choptext:30:"<br>"}</td></tr>
  {/section}
  </table>
  </div>
</div>
{/if}
   </div>
  </div>
  </div>

  </div>
  <div id="boxHolder"></div>
{include file='footer.tpl'}