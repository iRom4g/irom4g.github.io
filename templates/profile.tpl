{include file='header.tpl'}
{php}
require('_drawrating.php');
{/php}

{* JAVASCRIPT FOR ADDING COMMENT *}
{literal}
<script type='text/javascript'>
<!--
var comment_changed = 0;
var first_comment = 1;
var last_comment = {/literal}{$comments|@count}{literal};
var next_comment = last_comment+1;
var total_comments = {/literal}{$total_comments}{literal};

function removeText(commentBody) {
  if(comment_changed == 0) {
    commentBody.value='';
    commentBody.style.color='#000000';
    comment_changed = 1;
  }
}

function addText(commentBody) {
  if(commentBody.value == '') {
    commentBody.value = '{/literal}{$profile44}{literal}';
    commentBody.style.color = '#888888';
    comment_changed = 0;
  }
}

function checkText() {
  if(comment_changed == 0) { 
    var commentBody = document.getElementById('comment_body');
    commentBody.value=''; 
  }
  var commentSubmit = document.getElementById('comment_submit');
  commentSubmit.value = '{/literal}{$profile45}{literal}';
  commentSubmit.disabled = true;
  
}

function addComment(is_error, comment_body, comment_date) {
  if(is_error == 1) {
    var commentError = document.getElementById('comment_error');
    commentError.style.display = 'block';
    if(comment_body == '') {
      commentError.innerHTML = '{/literal}{$profile46}{literal}';
    } else {
      commentError.innerHTML = '{/literal}{$profile47}{literal}';
    }
    var commentSubmit = document.getElementById('comment_submit');
    commentSubmit.value = '{/literal}{$profile48}{literal}';
    commentSubmit.disabled = false;
  } else {
    var commentError = document.getElementById('comment_error');
    commentError.style.display = 'none';
    commentError.innerHTML = '';

    var commentBody = document.getElementById('comment_body');
    commentBody.value = '';
    addText(commentBody);

    var commentSubmit = document.getElementById('comment_submit');
    commentSubmit.value = '{/literal}{$profile48}{literal}';
    commentSubmit.disabled = false;

    if(document.getElementById('comment_secure')) {
      var commentSecure = document.getElementById('comment_secure');
      commentSecure.value=''
      var secureImage = document.getElementById('secure_image');
      secureImage.src = secureImage.src + '?' + (new Date()).getTime();
    }

    total_comments++;
    var totalComments = document.getElementById('total_comments');
    totalComments.innerHTML = total_comments;

    if(total_comments > 10) {
      var oldComment = document.getElementById('comment_'+first_comment);
      if(oldComment) { oldComment.style.display = 'none'; first_comment++; }
    }

    var newComment = document.createElement('div');
    var divIdName = 'comment_'+next_comment;
    newComment.setAttribute('id',divIdName);
    var newTable = "<table cellpadding='0' cellspacing='0' width='100%'><tr><td class='profile_item1' width='80'>";
    {/literal}
      {if $user->user_info.user_id != 0}
        newTable += "<a href='{$url->url_create('profile',$user->user_info.user_username)}'><img src='{$user->user_photo('./images/nophoto.gif')}' class='photo' border='0' width='{$misc->photo_size($user->user_photo('./images/nophoto.gif'),'75','75','w')}'></a></td><td class='profile_item2'><table cellpadding='0' cellspacing='0' width='100%'><tr><td class='profile_comment_author'><b><a href='{$url->url_create('profile',$user->user_info.user_username)}'>{$user->user_info.user_username}</a></b> - {$datetime->cdate("`$setting.setting_timeformat` `$profile20` `$setting.setting_dateformat`", $datetime->timezone($smarty.now, $global_timezone))}</td><td class='profile_comment_author' align='right' nowrap='nowrap'><a href='{$url->url_create('profile',$user->user_info.user_username)}#comments'>{$profile26}</a>&nbsp;|&nbsp;<a href='user_messages_new.php?to={$user->user_info.user_username}'>{$profile34}</a></td>";
      {else}
        newTable += "<img src='./images/nophoto.gif' class='photo' border='0' width='75'></td><td class='profile_item2'><table cellpadding='0' cellspacing='0' width='100%'><tr><td class='profile_comment_author'><b>{$profile33}</b> - {$datetime->cdate("`$setting.setting_timeformat` `$profile20` `$setting.setting_dateformat`", $datetime->timezone($smarty.now, $global_timezone))}</td><td class='profile_comment_author' align='right' nowrap='nowrap'>&nbsp;</td>";
      {/if}
      newTable += "</tr><tr><td colspan='2' class='profile_comment_body'>"+comment_body+"</td></tr></table></td></tr></table>";
    {literal}
    newComment.innerHTML = newTable;
    var profileComments = document.getElementById('profile_comments');
    var prevComment = document.getElementById('comment_'+last_comment);
    profileComments.insertBefore(newComment, prevComment);
    next_comment++;
    last_comment++;
  }
}

function action_delete(action_id) {
  var divname = 'action_' + action_id;
  var newsrc = 'action_delete.php?action_id=' + action_id;
  hidediv(divname);
  document.getElementById('actionimage').src = newsrc;
  document.getElementById('actions_total').value--;
  if(document.getElementById('actions_total').value == 0) {
    document.getElementById('actions').style.display = "none";
  }
}

//-->
</script>
{/literal}


<div class='page_header'>{$owner->user_info.user_username}{$profile6}</div>

<table cellpadding='0' cellspacing='0' width='100%'>
	<tr>
		<td class='profile_leftside' width='200'>
		{* BEGIN LEFT COLUMN *}
		{* SHOW USER PHOTO *}
			<table cellpadding='0' cellspacing='0' width='100%' style='margin-bottom: 10px;'>
				<tr>
					<td class='profile_photo'><img class='photo' src='{$owner->user_photo("./images/nophoto.gif")}' border='0'></td>
				</tr>
				{* RATING *}
				{if $user->user_exists == 1}
				<tr>
					<td>
						{php}
							$userrating = $this->get_template_vars('user_rating');
							echo rating_bar("".$userrating."",5);
						{/php}
					</td>
				</tr>
				{/if}
			</table>
  {* SHOW BUTTONS IF LOGGED IN AND VIEWING SOMEONE ELSE *}
  {if $owner->user_info.user_username != $user->user_info.user_username}
    <table class='profile_menu' cellpadding='0' cellspacing='0' width='100%'>
 
    {* SHOW VIEW FRIENDS MENU ITEM *}
    {if $total_friends != 0}
      <tr>
      <td class='profile_menu1'><a href='profile_friends.php?user={$owner->user_info.user_username}'><img src='./images/icons/browsefriends16.gif' class='icon' border='0'>{$profile7} {$owner->user_info.user_username|truncate:10:"...":true}{$profile8}</a></td>
      </tr>
    {/if}

    {* SHOW ADD OR REMOVE FRIEND MENU ITEM *}
    {if $friendship_allowed != 0 && $user->user_exists != 0}
      {if $is_friend == TRUE}
        <tr>
        <td class='profile_menu1'><a href='user_friends_confirm.php?task=remove&user={$owner->user_info.user_username}&return_url={$url->url_create('profile', $owner->user_info.user_username)}'><img src='./images/icons/remove_friend16.gif' class='icon' border='0'>{$profile41}</a></td>
        </tr>
      {else}
        <tr>
        <td class='profile_menu1'><a href='user_friends_add.php?user={$owner->user_info.user_username}'><img src='./images/icons/addfriend16.gif' class='icon' border='0'>{$profile9}</a></td>
        </tr>
      {/if}
    {/if}

    {* SHOW SEND MESSAGE MENU ITEM *}
    {if ($user->level_info.level_message_allow == 2 || ($user->level_info.level_message_allow == 1 && $is_friend)) && ($owner->level_info.level_message_allow == 2 || ($owner->level_info.level_message_allow == 1 && $is_friend))}
      <tr>
      <td class='profile_menu1'><a href='user_messages_new.php?to={$owner->user_info.user_username}'><img src='./images/icons/sendmessage16.gif' class='icon' border='0'>{$profile10}</a></td>
      </tr>
    {/if}
 
    {* SHOW REPORT THIS PERSON MENU ITEM *}
    <tr>
    <td class='profile_menu1'><a href='user_report.php?return_url={$url->url_current()}'><img src='./images/icons/report16.gif' class='icon' border='0'>{$profile11}</a></td>
    </tr>

    {* SHOW BLOCK OR UNBLOCK THIS PERSON MENU ITEM *}
    {if $user->level_info.level_profile_block != 0}
      {if $user->user_blocked($owner->user_info.user_id) == TRUE}
        <tr>
        <td class='profile_menu1'><a href='user_friends_block.php?task=unblock&user={$owner->user_info.user_username}'><img src='./images/icons/unblock16.gif' class='icon' border='0'>{$profile42}</a></td>
        </tr>
      {else}
        <tr>
        <td class='profile_menu1'><a href='user_friends_block.php?task=block&user={$owner->user_info.user_username}'><img src='./images/icons/block16.gif' class='icon' border='0'>{$profile12}</a></td>
        </tr>
      {/if}
    {/if}

    </table>
  {/if}

  {* DISPLAY IF PROFILE IS PRIVATE TO VIEWING USER *}
  {if $is_profile_private != 0}

    {* END LEFT COLUMN *}
    </td>
    <td class='profile_rightside'>
    {* BEGIN RIGHT COLUMN *}

      <img src='./images/icons/error48.gif' border='0' class='icon_big'>
      <div class='page_header'>{$profile3}</div>
      {$profile4}

  {* DISPLAY ONLY IF PROFILE IS NOT PRIVATE TO VIEWING USER *}
  {else}

    {* BEGIN STATUS *}
    {if ($owner->level_info.level_profile_status != 0 AND $owner->user_info.user_status != "") OR $is_online == 1}
      <table cellpadding='0' cellspacing='0' width='100%' style='margin-bottom: 10px;'>
      <tr>
      <td class='header'>{$profile36}</td>
      <tr>
      <td class='profile'>
	{if $is_online == 1}
          <table cellpadding='0' cellspacing='0'>
          <tr>
          <td valign='top'><img src='./images/icons/online16.gif' border='0' class='icon'></td>
          <td>{$owner->user_info.user_username} {$profile21}</td>
          </tr>
          </table>
	{/if}
	{if $owner->level_info.level_profile_status != 0 AND $owner->user_info.user_status != ""}
          <table cellpadding='0' cellspacing='0'{if $is_online == 1} style='margin-top: 5px;'{/if}>
          <tr>
          <td valign='top'><img src='./images/icons/status16.gif' border='0' class='icon'></td>
          <td>{$owner->user_info.user_username} {$profile14} {$owner->user_info.user_status|choptext:12:"<br>"}</td>
          </tr>
          </table>
	{/if}
      </td>
      </tr>
      </table>
    {/if}
    {* END STATUS *}

    {* BEGIN STATS *}
    <table cellpadding='0' cellspacing='0' width='100%' style='margin-bottom: 10px;'>
    <tr><td class='header'>{$profile15}</td></tr>
    <tr>
    <td class='profile'>
      <table cellpadding='0' cellspacing='0'>
      <tr><td width='80'>{$profile16}</td><td>{$total_views} {$profile17}</td></tr>
      {if $setting.setting_connection_allow != 0}<tr><td>{$profile18}</td><td>{$total_friends} {$profile19}</td></tr>{/if}
      {if $owner->user_info.user_dateupdated != ""}<tr><td>{$profile22}</td><td>{$datetime->time_since($owner->user_info.user_dateupdated)}</td></tr>{/if}
      {if $owner->user_info.user_signupdate != ""}<tr><td>{$profile23}</td><td>{$datetime->cdate("`$setting.setting_dateformat`", $datetime->timezone("`$owner->user_info.user_signupdate`", $global_timezone))}</td></tr>{/if}
      </table>
    </td>
    </tr>
    </table>
    {* END STATS *}

    {* BEGIN PLUGIN RELATED PROFILE SECTIONS *}
    {section name=profile_loop loop=$global_plugins}{include file="profile_`$global_plugins[profile_loop]`.tpl"}{/section}

  {* END LEFT COLUMN *}
  </td>
  <td class='profile_rightside'>
  {* BEGIN RIGHT COLUMN *}

    {* SHOW RECENT ACTIVITY *}
    {if $actions_total > 0}
      {literal}
      <script language="JavaScript">
      <!-- 
        Rollimage0 = new Array()
        Rollimage1 = new Array()
        Rollimage0['join']= new Image(10,12);
        Rollimage0['join'].src = "./images/icons/action_delete1.gif";
        Rollimage1['join'] = new Image(10,12);
        Rollimage1['join'].src = "./images/icons/action_delete2.gif";

        function SwapOut(imgname, imgsrc) {
          imgname.src = Rollimage1[imgsrc].src;
          return true;
        }
        function SwapBack(imgname, imgsrc) {
          imgname.src = Rollimage0[imgsrc].src; 
          return true;
        }
      //-->
      </script>
      {/literal}

      <table cellpadding='0' cellspacing='0' width='100%' style='margin-bottom: 10px;' id='actions'>
      <tr><td class='header'>{$profile24}</td></tr>
      <tr>
      <td class='profile'>
	{* SHOW RECENT ACTIONS *}
        {section name=actions_loop loop=$actions}
          <div id='action_{$actions[actions_loop].action_id}' class='profile_action{if $smarty.section.actions_loop.last == true}_bottom{/if}'>
	    <table cellpadding='0' cellspacing='0' width='100%'>
	    <tr>
	    <td valign='top'>
	      <table cellpadding='0' cellspacing='0'>
	      <tr>
	      <td valign='top'><img src='./images/icons/{$actions[actions_loop].action_icon}' border='0' class='icon'></td>
	      <td valign='top' width='100%'>
	        <div class='profile_action_date'>
		  {$datetime->time_since($actions[actions_loop].action_date)}
	          {* DISPLAY DELETE LINK IF NECESSARY *}
	          {if $setting.setting_actions_selfdelete == 1 AND $actions[actions_loop].action_user_id == $user->user_info.user_id}
	            <a href="javascript:action_delete('{$actions[actions_loop].action_id}')"><img src='./images/icons/action_delete1.gif' style='vertical-align: middle; margin-left: 3px;' border='0' onmouseover="SwapOut(this, 'join')" onmouseout="SwapBack(this, 'join')" name='join{$actions[actions_loop].action_id}' id='join{$actions[actions_loop].action_id}'></a>
	          {/if}
	        </div>
                {$actions[actions_loop].action_text|choptext:50:"<br>"}
              </td>
	      </tr>
	      </table>
	    </td>
	    </tr>
	    </table>
          </div>
        {/section}
        <input type='hidden' name='actions_total' id='actions_total' value='{$actions_total}'>
        <img id='actionimage' src='./images/trans.gif' border='0' style='display: none;'>
      </td>
      </tr>
      </table>
    {/if}
    {* END RECENT ACTIVITY *}

    {* SHOW PROFILE TABS AND FIELDS *}
    {section name=tab_loop loop=$tabs}
      <table cellpadding='0' cellspacing='0' width='100%' style='margin-bottom: 10px;'>
      <tr><td class='header'>{$tabs[tab_loop].tab_name}</td></tr>
      <tr>
      <td class='profile'>
        <table cellpadding='0' cellspacing='0'>
        {* LOOP THROUGH FIELDS IN TAB, ONLY SHOW FIELDS THAT HAVE BEEN FILLED IN *}
        {section name=field_loop loop=$tabs[tab_loop].fields}
          <tr>
          <td width='130' valign='top'>
            {$tabs[tab_loop].fields[field_loop].field_title}:
          </td>
          <td>
            {$tabs[tab_loop].fields[field_loop].field_value_profile}
            {if $tabs[tab_loop].fields[field_loop].field_birthday == 1} ({$datetime->age($tabs[tab_loop].fields[field_loop].field_value)} {$profile37}){/if}
          </td>
          </tr>
        {/section}
        </table>
      </td>
      </tr>
      </table>
    {/section}
    {* END PROFILE TABS AND FIELDS *}

    {* BEGIN FRIEND LIST *}
    {if $total_friends != 0}
      <table cellpadding='0' cellspacing='0' width='100%' style='margin-bottom: 10px;'>
      <tr><td class='header'>
        {$profile35} ({$total_friends})
        &nbsp;[ <a href='profile_friends.php?user={$owner->user_info.user_username}'>{$profile25} {$profile19}</a> ]
      </td></tr>
      <tr>
      <td class='profile' align='center'>
        {* LOOP THROUGH FRIENDS *}
        {section name=friend_loop loop=$friends}
          {* START NEW ROW *}
          {cycle name="startrow2" values="<table cellpadding='0' cellspacing='0'><tr>,,,,"}
          <td class='profile_friend'><a href='{$url->url_create('profile',$friends[friend_loop]->user_info.user_username)}'><img src='{$friends[friend_loop]->user_photo('./images/nophoto.gif')}' class='photo' border='0' width='{$misc->photo_size($friends[friend_loop]->user_photo('./images/nophoto.gif'),'75','75','w')}'><br>{$friends[friend_loop]->user_info.user_username}</a></td>
          {* END ROW AFTER 4 RESULTS *}
          {if $smarty.section.friend_loop.last == true}
            </tr></table>
          {else}
            {cycle name="endrow2" values=",,,,</tr></table>"}
          {/if}
        {/section}
      </td>
      </tr>
      </table>
    {/if}
    {* END FRIEND LIST *}

    {* BEGIN COMMENTS *}
    <a name='comments'></a>
    <table cellpadding='0' cellspacing='0' width='100%'>
    <tr>  
    <td class='header'>
      {$profile38} (<span id='total_comments'>{$total_comments}</span>)
      {if $total_comments != 0}&nbsp;[ <a href='profile_comments.php?user={$owner->user_info.user_username}'>{$profile25} {$profile32}</a> ]{/if}
    </td>
    </tr>
      {if $allowed_to_comment != 0}
        <tr>
        <td class='profile_postcomment'>
        <form action='profile_comments.php' method='post' target='AddCommentWindow' onSubmit='checkText()'>
        <textarea name='comment_body' id='comment_body' rows='2' cols='65' onfocus='removeText(this)' onblur='addText(this)' class='comment_area'>{$profile44}</textarea>

          <table cellpadding='0' cellspacing='0' width='100%'>
          <tr>
          {if $setting.setting_comment_code == 1}
            <td width='75' valign='top'><img src='./images/secure.php' id='secure_image' border='0' height='20' width='67' class='signup_code'></td>
            <td width='68' style='padding-top: 4px;'><input type='text' name='comment_secure' id='comment_secure' class='text' size='6' maxlength='10'></td>
            <td width='10'><img src='./images/icons/tip.gif' border='0' class='icon' onMouseover="tip('{$profile49}')"; onMouseout="hidetip()"></td>
          {/if}
          <td align='right' style='padding-top: 5px;'>
          <input type='submit' id='comment_submit' class='button' value='{$profile48}'>
          <input type='hidden' name='user' value='{$owner->user_info.user_username}'>
          <input type='hidden' name='task' value='dopost'>
          </form>
          </td>
          </tr>
          </table>
        <div id='comment_error' style='color: #FF0000; display: none;'></div>
        <iframe name='AddCommentWindow' style='display: none' src=''></iframe>
	</div>
	</div>
	</td>
	</tr>
      {/if}
	<tr>
	<td class='profile' id='profile_comments'>

      {* LOOP THROUGH PROFILE COMMENTS *}
      {section name=comment_loop loop=$comments}
        <div id='comment_{math equation='t-c' t=$comments|@count c=$smarty.section.comment_loop.index}'>
        <table cellpadding='0' cellspacing='0' width='100%'>
        <tr>
        <td class='profile_item1' width='80'>
          {if $comments[comment_loop].comment_author->user_info.user_id != 0}
            <a href='{$url->url_create('profile',$comments[comment_loop].comment_author->user_info.user_username)}'><img src='{$comments[comment_loop].comment_author->user_photo('./images/nophoto.gif')}' class='photo' border='0' width='{$misc->photo_size($comments[comment_loop].comment_author->user_photo('./images/nophoto.gif'),'75','75','w')}'></a>
          {else}
            <img src='./images/nophoto.gif' class='photo' border='0' width='75'>
          {/if}
        </td>
        <td class='profile_item2'>
          <table cellpadding='0' cellspacing='0' width='100%'>
          <tr>
          <td class='profile_comment_author'><b>{if $comments[comment_loop].comment_author->user_info.user_id != 0}<a href='{$url->url_create('profile',$comments[comment_loop].comment_author->user_info.user_username)}'>{$comments[comment_loop].comment_author->user_info.user_username}</a>{else}{$profile33}{/if}</b> - {$datetime->cdate("`$setting.setting_timeformat` `$profile20` `$setting.setting_dateformat`", $datetime->timezone($comments[comment_loop].comment_date, $global_timezone))}</td>
          <td class='profile_comment_author' align='right' nowrap='nowrap'>&nbsp;{if $comments[comment_loop].comment_author->user_info.user_id != 0}<a href='{$url->url_create('profile', $comments[comment_loop].comment_author->user_info.user_username)}#comments'>{$profile26}</a>&nbsp;|&nbsp;<a href='user_messages_new.php?to={$comments[comment_loop].comment_author->user_info.user_username}'>{$profile34}</a>{/if}</td>
          </tr>
          <tr>
          <td colspan='2' class='profile_comment_body'>{$comments[comment_loop].comment_body|choptext:50:"<br>"}</td>
          </tr>
          </table>
        </td>
        </tr>
        </table>
        </div>
      {/section}


    </td>
    </tr>
    </table>
    {* END COMMENTS *}

  {/if}
  {* END PRIVACY IF STATEMENT *}

{* END RIGHT COLUMN *}
</td>
</tr>
</table>

{include file='footer.tpl'}