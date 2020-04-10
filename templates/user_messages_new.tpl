{include file='header.tpl'}

<table class='tabs' cellpadding='0' cellspacing='0'>
<tr>
<td class='tab0'>&nbsp;</td>
<td class='tab1' NOWRAP><a href='user_messages.php'>{$user_messages_new5}</a></td>
<td class='tab'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='user_messages_outbox.php'>{$user_messages_new6}</a></td>
<td class='tab'>&nbsp;</td>
<td class='tab2' NOWRAP><a href='user_messages_settings.php'>{$user_messages_new4}</a></td>
<td class='tab3'>&nbsp;</td>
</tr>
</table>

<img src='./images/icons/sendmessage48.gif' border='0' class='icon_big'>
<div class='page_header'>{$user_messages_new7}</div>
<div>{$user_messages_new8}</div>

<br><br>

  {* SHOW ERRORS *}
  {if $is_error}
    <table cellpadding='0' cellspacing='0'>
      <tr><td class='error'>
        <img src='./images/error.gif' border='0' class='icon'> {$error_message}
      </td></tr>
    </table>
  {/if}


  {* VALIDATION IFRAME *}
  <iframe name="validation_frame" id="validation_frame" src="about:blank" style="display:none;" onload="in_validation=false;"></iframe>


  {* VALIDATION *}
  {literal}
  <script language='Javascript'>
  <!--

    var default_target;
    var default_task;
    var last_to_field = '';

    var in_validation = false;
    var pause_validation = false;
    var validation_result = false;

    function send_validation()
    {
      if( default_target!=document.message_form.target && !typeof(default_target)=="undefined" ) return;
      in_validation = true;

      default_target = document.message_form.target;
      default_task = document.message_form.task.value;

      document.message_form.target = 'validation_frame';
      document.message_form.task.value = 'validate';

      document.message_form.submit();
    }

    function recv_validation(result, message)
    {
      if( default_target==document.message_form.target ) return;

      document.message_form.target = default_target;
      document.message_form.task.value = default_task;

      if( result=='0' )
      {
        showdiv('errordiv');
        document.getElementById('errormessagediv').innerHTML = message;
        validation_result = false;
      }
      else
      {
        hidediv('errordiv');
      }
    }






    // Modified suggest script
    function multisuggest(fieldname, divname, match_string)
    {
      var keyword_string_raw = document.getElementById(fieldname).value;
      var keyword_string = keyword_string_raw.toLowerCase();

      var keyword_array_raw = keyword_string_raw.split(/[\s;,]+/ig);
      var keyword_array = keyword_string.split(/[\s;,]+/ig);

      var match_array = match_string.split(/[\s;,]+/ig);

      var result_count = 0;
      var suggestion_list_html = "";

      var keyword_index;
      var username_index;

      //alert(keyword_array_raw.join("&&"));

      for(keyword_index in keyword_array)
      {
        if( keyword_array[keyword_index]=="" || typeof(keyword_array[keyword_index])=="undefined" ) continue;

        for(match_index in match_array)
        {
          var match_item = match_array[match_index].toLowerCase();

          if( match_item.indexOf(keyword_array[keyword_index])==-1 ) continue;

          var match_regex = new RegExp("("+keyword_array[keyword_index]+")", "i");
          var match_label = match_array[match_index].replace(match_regex, "<b>$1</b>");

          suggestion_list_html +=
            "<div class='suggest_item'>" +
            "<a class='suggest' href=\"javascript:insertTo('" + fieldname + "', '" + divname + "', '" + keyword_index + "', '" + match_array[match_index] + "')\">" +
              match_label +
            "</a>" +
            "</div>";

          result_count++;
        }
      }

      if( result_count>0)
      {
        document.getElementById(divname).innerHTML = suggestion_list_html;
        document.getElementById(divname).style.display = "block";
      }
      else
      {
        document.getElementById(divname).innerHTML = "";
        document.getElementById(divname).style.display = "none";
      }
    }

    function insertTo(fieldname, divname, keyword_index, matched_string)
    {
      var keyword_string_raw = document.getElementById(fieldname).value;
      var keyword_array = keyword_string_raw.split(/[\s;,]+/ig);

      keyword_array[keyword_index] = matched_string;


      document.getElementById(fieldname).value = keyword_array.join('; ');
      document.getElementById(divname).style.display = "none";
    }




    function submit_validation()
    {
      if( validation_result==false || in_validation==true )
      {
        showdiv('errordiv');
        document.getElementById('errormessagediv').innerHTML = "{/literal}{$user_messages_new1}{literal}";
        return false;
      }

      else if( document.message_form.message.value=='' || typeof(document.message_form.message.value)=="undefined" )
      {
        showdiv('errordiv');
        document.getElementById('errormessagediv').innerHTML = "{/literal}{$user_messages_new2}{literal}";
        return false;
      }

      return true;
    }

  //-->
  </script>
  {/literal}

  <table cellpadding='0' cellspacing='0'>
  <form action='user_messages_new.php' method='POST' name="message_form" onsubmit="return submit_validation();">
    <tr>
    <td class='form1'>{$user_messages_new9}</td>
    <td class='form2' valign='bottom'><b><a href='{$url->url_create('profile',$user->user_info.user_username)}'>{$user->user_info.user_username}</a></b></td>
    </tr>
    <tr>
    <td class='form1' valign='top'>{$user_messages_new10}</td>
    <td class='form2' valign='top'>

      <table cellpadding='0' cellspacing='0'>
      <tr>
        <td valign='top'>
          <input
            type='text'
            class='text'
            name='to'
            id='to'
            value='{$to}'
            tabindex='1'
            size='30'
            maxlength='50'
            autocomplete='off'
            onblur='setTimeout("send_validation();", 500);'
            onkeyup="multisuggest('to', 'suggest', '{section name=friends_loop loop=$friends}{$friends[friends_loop]->user_info.user_username}{if $smarty.section.friends_loop.last != true},{/if}{/section}');"
          >

        </td>
        <td>

          <div id="errordiv" style="display:none;" class="result">
            <img src='./images/error.gif' border='0' class='icon' style="margin-left:20px; float:left;">
            <div class='error' id="errormessagediv" style="display:inline;"></div>
          </div>

        </td>
      </tr>
      <tr>
        <td>
          <div id="suggest" class='suggest'></div> 
        </td>
      </tr>
      </table> 
</td>
</tr>
<tr>
<td class='form1'>{$user_messages_new11}</td>
<td class='form2'><input type='text' class='text' name='subject' tabindex='2' value='{$subject}' size='30' maxlength='250' onfocus="hidediv('suggest');"></td>
</tr>
<tr>
<td class='form1'>{$user_messages_new12}</td>
<td class='form2'><textarea rows='10' cols='70' tabindex='3' name='message'>{$message}</textarea></td>
</tr>
<tr>
<td class='form1'>&nbsp;</td>
<td class='form2'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td><input type='submit' class='button' value='{$user_messages_new13}'>&nbsp;</td>
  <input type='hidden' name='task' value='send'>
  <input type='hidden' name='convo_id' value='{$convo_id}'>
  </form>
  <td><input type='button' class='button' value='{$user_messages_new14}' onClick='history.go(-1)'></td>
  </tr>
  </form>
  </table>
</td>
</tr>
</table>

{include file='footer.tpl'}