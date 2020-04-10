{include file='header.tpl'}

  <div id="pageBody" class="pageBody">

  <div id="wrapH">
  <div id="wrapHI">
   <div id="header">
    <h1> Мои группы</h1>
   </div>
  </div>
  </div>

  <div id="wrap2">
  <div id="wrap1">
   <div id="content">
    <div class="clearFix tBar">
     <ul class="tabs" id="friendTabs" style="width:550px;float:left;">
	  <li><a href="user_group.php" style="width:7em">Мои группы</a></li>
        <li><a href="user_group_invites.php" style="width:11em">Приглашения группы</a></li>
        <li><a href="user_group_settings.php" style="width:10.5em">Настройки группы</a></li>
        <li  class="activeLink"><a href="user_group_browse.php" style="width:7em">Обзор групп</a></li>
     </ul>
    </div>
<table cellpadding='0' cellspacing='0' width='100%'><tr><td class='page'>

<img src='./images/icons/group_invite48.gif' border='0' class='icon_big'>
<div class='page_header'>{$user_group_browse4}</div>
<div>{$user_group_browse5}</div>

<br><br>


{* SHOW BROWSE CATEGORIES PAGE *}
{if $groupcat_id == ""}
  <div class='header'>{$user_group_browse6}</div>
  <div class='group_list'>
  {* LIST CATEGORIES *}
  {section name=cat_loop loop=$categories}
    <b><a href='user_group_browse.php?groupcat_id={$categories[cat_loop].groupcat_id}'>{$categories[cat_loop].groupcat_title}</a></b>
    &nbsp;({$categories[cat_loop].groupcat_totalgroups} {if $categories[cat_loop].groupcat_totalgroups != 1}{$user_group_browse7}{else}{$user_group_browse8}{/if})
    {* LIST SUBCATEGORIES *}
    {section name=subcat_loop loop=$categories[cat_loop].groupcat_subcats}
      <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='user_group_browse.php?groupcat_id={$categories[cat_loop].groupcat_subcats[subcat_loop].subcategory_id}'>{$categories[cat_loop].groupcat_subcats[subcat_loop].subcategory_title}</a>
        &nbsp;<font class='small'>({$categories[cat_loop].groupcat_subcats[subcat_loop].subcategory_totalgroups} {if $categories[cat_loop].groupcat_subcats[subcat_loop].subcategory_totalgroups != 1}{$user_group_browse7}{else}{$user_group_browse8}{/if})</font>
    {/section}
    <br><br>
  {/section}
  {* SHOW UNCATEGORIZED GROUPS CATGORY IF ANY GROUPS HAVE NO CAT *}
  {if $groups_totalnocat > 0}
    <b><a href='user_group_browse.php?groupcat_id=0'>{$user_group_browse9}</a></b>
    {if $groups_totalnocat != 0}
      &nbsp;<font class='small'>({$groups_totalnocat} {if $groups_totalnocat != 1}{$user_group_browse7}{else}{$user_group_browse8}{/if})</font>
    {/if}
  {/if}
  </div>
{/if}





{* SHOW CATEGORY PAGE *}
{if $groupcat_id != ""}

  {* SHOW HOW MANY GROUPS FOUND *}
  {if $groupcat_title == ""}{assign var='groupcat_title' value=$user_group_browse9}{/if}
  <table cellpadding='0' cellspacing='0'>
  <tr><td class='result'>
  <img src='./images/icons/bulb16.gif' border='0' class='icon'>{$total_groups} {$user_group_browse10} "{$groupcat_title}"
  </td></tr></table>

  {* DISPLAY PAGINATION MENU IF APPLICABLE *}
  {if $maxpage > 1}
    <br>
    <div class='center'>
    {if $p != 1}<a href='user_group_browse.php?groupcat_id={$groupcat_id}&p={math equation='p-1' p=$p}'>&#171; {$user_group_browse16}</a>{else}<font class='disabled'>&#171; {$user_group_browse16}</font>{/if}
    {if $p_start == $p_end}
      &nbsp;|&nbsp; {$user_group_browse17} {$p_start} {$user_group_browse18} {$total_groups} &nbsp;|&nbsp; 
    {else}
      &nbsp;|&nbsp; {$user_group_browse19} {$p_start}-{$p_end} {$user_group_browse18} {$total_groups} &nbsp;|&nbsp; 
    {/if}
    {if $p != $maxpage}<a href='user_group_browse.php?groupcat_id={$groupcat_id}&p={math equation='p+1' p=$p}'>{$user_group_browse20} &#187;</a>{else}<font class='disabled'>{$user_group_browse20} &#187;</font>{/if}
    </div>
  {/if}

  {* SHOW GROUPS IN THIS CATEGORY *}
  {section name=group_loop loop=$groups}
    <div class='group_row'>
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td><a href='group.php?group_id={$groups[group_loop].group->group_info.group_id}'><img src='{$groups[group_loop].group->group_photo('./images/nophoto.gif')}' class='photo' width='{$misc->photo_size($groups[group_loop].group->group_photo('./images/nophoto.gif'),'100','100','w')}' border='0'></a></td>
    <td class='group_row1' width='100%'>
      <div><font class='big'><img src='./images/icons/group16.gif' border='0' class='icon'><a href='group.php?group_id={$groups[group_loop].group->group_info.group_id}'>{$groups[group_loop].group->group_info.group_title}</a></font></div><br>
      <table cellpadding='0' cellspacing='0'>
      <tr><td>{$user_group_browse11} &nbsp;</td><td>{$groups[group_loop].group_members} {$user_group_browse12}</td></tr>
      <tr><td>{$user_group_browse13} &nbsp;</td><td><a href='{$url->url_create('profile', $groups[group_loop].group_leader->user_info.user_username)}'>{$groups[group_loop].group_leader->user_info.user_username}</a></td></tr>
      </table>
    </td>
    <td class='group_row2' NOWRAP>
      <a href='group.php?group_id={$groups[group_loop].group->group_info.group_id}'>{$user_group_browse14}</a><br>
      <a href='user_group_join.php?group_id={$groups[group_loop].group->group_info.group_id}&return_url={$url->url_current()}'>{$user_group_browse15}</a><br>
    </td>
    </tr>
    </table>
    </div>
  {/section}

  {* DISPLAY PAGINATION MENU IF APPLICABLE *}
  {if $maxpage > 1}
    <br>
    <div class='center'>
    {if $p != 1}<a href='user_group_browse.php?groupcat_id={$groupcat_id}&p={math equation='p-1' p=$p}'>&#171; {$user_group_browse16}</a>{else}<font class='disabled'>&#171; {$user_group_browse16}</font>{/if}
    {if $p_start == $p_end}
      &nbsp;|&nbsp; {$user_group_browse17} {$p_start} {$user_group_browse18} {$total_groups} &nbsp;|&nbsp; 
    {else}
      &nbsp;|&nbsp; {$user_group_browse19} {$p_start}-{$p_end} {$user_group_browse18} {$total_groups} &nbsp;|&nbsp; 
    {/if}
    {if $p != $maxpage}<a href='user_group_browse.php?groupcat_id={$groupcat_id}&p={math equation='p+1' p=$p}'>{$user_group_browse20} &#187;</a>{else}<font class='disabled'>{$user_group_browse20} &#187;</font>{/if}
    </div>
  {/if}
{/if}

</td></tr></table>
</div></div></div>
{include file='footer.tpl'}