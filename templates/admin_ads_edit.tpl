{include file='admin_header.tpl'}

<h2>{$admin_ads_edit9}</h2>
{$admin_ads_edit10}

<br><br>

{if $is_error == 1}
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td class='error'>
    <img src='../images/error.gif' border='0' class='icon'> {$error_message}
  </td>
  </tr>
  </table>
  <br>
{/if}

<table cellpadding='0' cellspacing='0' width='100%'>
<tr><td class='header'>{$admin_ads_edit11}</td></tr>
<tr><td class='setting1'>
{$admin_ads_edit12}
</td></tr>
<tr><td class='setting2'>

  <table cellpadding='0' cellspacing='0' width='100%'>
  <tr>
  <td id='bannerborder' class='bannerborder{if $ad_html != ""}2{/if}' align='center'>

    <div id='banner_options' style='{if $ad_html != ""}display: none;{/if}'>
      <h3><b><a href="javascript:hidediv('banner_options');showdiv('banner_upload');">{$admin_ads_edit13}</a> &nbsp;&nbsp;{$admin_ads_edit14}&nbsp;&nbsp; <a href="javascript:hidediv('banner_options');showdiv('banner_html');">{$admin_ads_edit15}</a></b></h3>
    </div>

    <div id='banner_upload' style='display: none;'>
      <b>{$admin_ads_edit16}</b>
      <form action='admin_ads_edit.php?task=doupload' enctype='multipart/form-data' method='post' id='uploadform' name='uploadform' target='uploadframe'>
      <table cellpadding='0' cellspacing='0' align='center'>
      <tr>
      <td class='form1'>{$admin_ads_edit17}</td>
      <td class='form2'><input type='file' name='file1' size='40' id='bannersrc' class='text'></td>
      </tr>
      <tr>
      <td class='form1'>{$admin_ads_edit18}</td>
      <td class='form2'><input type='text' name='link' size='52' id='bannerlink' value='http://' class='text'></td>
      </tr>
      <tr>
      <td class='form1'>&nbsp;</td>
      <td class='form2'>
	<div id='banner_upload_submit'>
          [ <a href="javascript:uploadbanner()">{$admin_ads_edit19}</a> ] &nbsp;
          [ <a href="javascript:hidediv('banner_upload');showdiv('banner_options');">{$admin_ads_edit20}</a> ]
	</div>
	<div id='banner_upload_status' style='display: none;'>
	  <img src='../images/admin_uploading.gif' border='0'>
	</div>
      </td>
      </tr>
      </table>
      <input type='hidden' name='task' value='doupload'>
      <input type='hidden' name='ad_id' value='{$ad_id}'>
      </form>
      <iframe id='uploadframe' name='uploadframe' style='display: none;' src="admin_ads_add.php?task=blank"></iframe>
    </div>

    <div id='banner_html' style='display: none;'>
      <b>{$admin_ads_edit21}</b><br>
      <textarea rows='4' cols='90' class='text' id='bannerhtml'></textarea>
      <div style='margin-top: 5px;'>
        [ <a href="javascript:savebanner();">{$admin_ads_edit22}</a> ] &nbsp;
        [ <a href="javascript:hidediv('banner_html');showdiv('banner_options');">{$admin_ads_edit20}</a> ]
      </div>
    </div>

    <div id='banner_preview_html' style='display: none;'>
      <div style='margin-bottom: 5px;'><b>Banner Preview</b></div>
      <div id='banner_html_content'></div>
      <div style='margin-top: 5px;'>
        [ <a href="javascript:savebanner2();">{$admin_ads_edit24}</a> ] &nbsp;
        [ <a href="javascript:hidediv('banner_preview_html');showdiv('banner_html');">{$admin_ads_edit20}</a> ]
      </div>
    </div>

    <div id='banner_preview_upload' style='display: none;'>
      <div style='margin-bottom: 5px;'><b>{$admin_ads_edit23}</b></div>
      <div id='banner_upload_content'></div>
      <div style='margin-top: 5px;'>
        [ <a href="javascript:uploadbanner3();">{$admin_ads_edit24}</a> ] &nbsp;
        [ <a href="javascript:uploadbanner3_cancel();">{$admin_ads_edit20}</a> ]
      </div>
      <form action='admin_ads_edit.php' method='post' id='cancelform' name='cancelform' target='uploadframe'>
      <input type='hidden' name='banner_filename_delete' id='banner_filename_delete' value=''>
      <input type='hidden' name='task' value='cancelbanner'>
      </form>
    </div>

    <div id='banner_final_title' style='{if $ad_html == ""}display: none;{/if} padding-bottom: 3px;'><b>{$admin_ads_edit23}</b></div>
    <div id='banner_final' style='{if $ad_html == ""}display: none;{/if}'>{$ad_html}</div>
    <div id='banner_final_startover' style='{if $ad_html == ""}display: none;{/if} padding-top: 3px;'><a href="javascript:startover()">{$admin_ads_edit25}</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:backtohtml()">{$admin_ads_edit65}</a></div>

  {literal}
  <script language='Javascript'>
  <!--
  function togglefield(id1,id2) {
    if(id2.checked==true) {
      document.getElementById(id1).value='';
      document.getElementById(id1).disabled=true;
      document.getElementById(id1).style.backgroundColor='#DDDDDD';
    } else {
      document.getElementById(id1).disabled=false;
      document.getElementById(id1).style.backgroundColor='#FFFFFF';
    }
  }
  function startover() {
    hidediv('banner_final_title');
    hidediv('banner_final');
    hidediv('banner_final_startover');
    document.getElementById('bannerborder').className='bannerborder';
    showdiv('banner_options');
    document.getElementById('cancelform').submit();
  }
  function backtohtml() {
    hidediv('banner_final_title');
    hidediv('banner_final');
    hidediv('banner_final_startover');
    showdiv('banner_html');
    document.getElementById('bannerhtml').value=document.getElementById('ad_html').value;
  }
  function uploadbanner() {
    var bannersrc = document.getElementById('bannersrc').value;
    if(bannersrc == "") {
      alert('{/literal}{$admin_ads_edit26}{literal}');
    } else {
      document.getElementById('uploadform').submit();
      hidediv('banner_upload_submit');
      showdiv('banner_upload_status');
    }
  }
  function uploadbanner2(imagename,iserror,error_message) {
    if(iserror == 1) {
      hidediv('banner_upload_status');
      showdiv('banner_upload_submit');
      alert('{/literal}{$admin_ads_edit27}{literal}');
    } else {
      hidediv('banner_upload');
      showdiv('banner_preview_upload');
      var bannersrc = "./uploads_admin/ads/"+imagename;
      var bannerlink = document.getElementById('bannerlink').value;
      var bannerhtml = "<a href='"+bannerlink+"' target='_blank'><img src='"+bannersrc+"' border='0'></a>";
      set_preview(document.getElementById('banner_upload_content'), bannerhtml);
      document.getElementById('ad_html').value=bannerhtml;
      document.getElementById('banner_filename_delete').value=imagename;
      document.getElementById('banner_filename').value=imagename;
    }
  }
  function uploadbanner3() {
    hidediv('banner_preview_upload');
    showdiv('banner_final');
    showdiv('banner_final_title');
    showdiv('banner_final_startover');
    hidediv('banner_upload_status');
    showdiv('banner_upload_submit');
    var bannerhtml = document.getElementById('ad_html').value;
    set_preview(document.getElementById('banner_final'), bannerhtml);
    document.getElementById('bannerborder').className='bannerborder2';
  }
  function uploadbanner3_cancel() {
    hidediv('banner_preview_upload');
    hidediv('banner_upload_status');
    showdiv('banner_upload');
    showdiv('banner_upload_submit');
    document.getElementById('cancelform').submit();
  }
  function savebanner() {
    var bannerhtml = document.getElementById('bannerhtml').value;
    if(bannerhtml == "") {
      alert('{/literal}{$admin_ads_edit28}{literal}');
    } else {
      hidediv('banner_html');
      showdiv('banner_preview_html');
      set_preview(document.getElementById('banner_html_content'), bannerhtml);
    }
  }
  function savebanner2() {
    hidediv('banner_preview_html');
    showdiv('banner_final');
    showdiv('banner_final_title');
    showdiv('banner_final_startover');
    var bannerhtml = document.getElementById('bannerhtml').value;
    set_preview(document.getElementById('banner_final'), bannerhtml);
    document.getElementById('bannerborder').className='bannerborder2';
    document.getElementById('ad_html').value=bannerhtml;
  }
  function set_preview(preview_object, banner_html) {
    var banner_html_string = banner_html;
    banner_html_string = banner_html_string.replace(/(.)\.\/uploads\_admin/gi, "$1../uploads_admin");
    preview_object.innerHTML = banner_html_string;
  }
  set_preview(document.getElementById('banner_final'),  
  document.getElementById('banner_final').innerHTML);
  //-->
  </script>
  {/literal}

  </td>
  </tr>
  </table>
</td></tr>
</table>

<br>

<form action='admin_ads_edit.php' method='post'>
<input type='hidden' name='ad_html' id='ad_html' value='{$ad_html_encoded}'>
<input type='hidden' name='banner_filename' id='banner_filename' value='{$ad_filename}'>
<table cellpadding='0' cellspacing='0' width='100%'>
<tr><td class='header'>{$admin_ads_edit29}</td></tr>
<tr><td class='setting1'>
{$admin_ads_edit30}
<br><br>
<b>{$admin_ads_edit31} {$nowdate}</b>
</td></tr>
<tr><td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td class='form1'>{$admin_ads_edit32}</td>
  <td class='form2'><input type='text' class='text' name='ad_name' size='64' maxlength='250' value='{$ad_name}'></td>
  </tr>
  <tr>
  <td class='form1'>{$admin_ads_edit33}</td>
  <td class='form2'>
    <select class='text' name='ad_date_start_month'>
    <option></option>
    <option{if $ad_date_start_month == "$admin_ads_edit34"} selected='selected'{/if}>{$admin_ads_edit34}</option>
    <option{if $ad_date_start_month == "$admin_ads_edit35"} selected='selected'{/if}>{$admin_ads_edit35}</option>
    <option{if $ad_date_start_month == "$admin_ads_edit36"} selected='selected'{/if}>{$admin_ads_edit36}</option>
    <option{if $ad_date_start_month == "$admin_ads_edit37"} selected='selected'{/if}>{$admin_ads_edit37}</option>
    <option{if $ad_date_start_month == "$admin_ads_edit38"} selected='selected'{/if}>{$admin_ads_edit38}</option>
    <option{if $ad_date_start_month == "$admin_ads_edit39"} selected='selected'{/if}>{$admin_ads_edit39}</option>
    <option{if $ad_date_start_month == "$admin_ads_edit40"} selected='selected'{/if}>{$admin_ads_edit40}</option>
    <option{if $ad_date_start_month == "$admin_ads_edit41"} selected='selected'{/if}>{$admin_ads_edit41}</option>
    <option{if $ad_date_start_month == "$admin_ads_edit42"} selected='selected'{/if}>{$admin_ads_edit42}</option>
    <option{if $ad_date_start_month == "$admin_ads_edit43"} selected='selected'{/if}>{$admin_ads_edit43}</option>
    <option{if $ad_date_start_month == "$admin_ads_edit44"} selected='selected'{/if}>{$admin_ads_edit44}</option>
    <option{if $ad_date_start_month == "$admin_ads_edit45"} selected='selected'{/if}>{$admin_ads_edit45}</option>
    </select>
    <select class='text' name='ad_date_start_day'>
    <option></option>
    <option{if $ad_date_start_day == "1"} selected='selected'{/if}>1</option>
    <option{if $ad_date_start_day == "2"} selected='selected'{/if}>2</option>
    <option{if $ad_date_start_day == "3"} selected='selected'{/if}>3</option>
    <option{if $ad_date_start_day == "4"} selected='selected'{/if}>4</option>
    <option{if $ad_date_start_day == "5"} selected='selected'{/if}>5</option>
    <option{if $ad_date_start_day == "6"} selected='selected'{/if}>6</option>
    <option{if $ad_date_start_day == "7"} selected='selected'{/if}>7</option>
    <option{if $ad_date_start_day == "8"} selected='selected'{/if}>8</option>
    <option{if $ad_date_start_day == "9"} selected='selected'{/if}>9</option>
    <option{if $ad_date_start_day == "10"} selected='selected'{/if}>10</option>
    <option{if $ad_date_start_day == "11"} selected='selected'{/if}>11</option>
    <option{if $ad_date_start_day == "12"} selected='selected'{/if}>12</option>
    <option{if $ad_date_start_day == "13"} selected='selected'{/if}>13</option>
    <option{if $ad_date_start_day == "14"} selected='selected'{/if}>14</option>
    <option{if $ad_date_start_day == "15"} selected='selected'{/if}>15</option>
    <option{if $ad_date_start_day == "16"} selected='selected'{/if}>16</option>
    <option{if $ad_date_start_day == "17"} selected='selected'{/if}>17</option>
    <option{if $ad_date_start_day == "18"} selected='selected'{/if}>18</option>
    <option{if $ad_date_start_day == "19"} selected='selected'{/if}>19</option>
    <option{if $ad_date_start_day == "20"} selected='selected'{/if}>20</option>
    <option{if $ad_date_start_day == "21"} selected='selected'{/if}>21</option>
    <option{if $ad_date_start_day == "22"} selected='selected'{/if}>22</option>
    <option{if $ad_date_start_day == "23"} selected='selected'{/if}>23</option>
    <option{if $ad_date_start_day == "24"} selected='selected'{/if}>24</option>
    <option{if $ad_date_start_day == "25"} selected='selected'{/if}>25</option>
    <option{if $ad_date_start_day == "26"} selected='selected'{/if}>26</option>
    <option{if $ad_date_start_day == "27"} selected='selected'{/if}>27</option>
    <option{if $ad_date_start_day == "28"} selected='selected'{/if}>28</option>
    <option{if $ad_date_start_day == "29"} selected='selected'{/if}>29</option>
    <option{if $ad_date_start_day == "30"} selected='selected'{/if}>30</option>
    <option{if $ad_date_start_day == "31"} selected='selected'{/if}>31</option>
    </select>
    <select class='text' name='ad_date_start_year'>
    <option></option>
    <option{if $ad_date_start_year == "2007"} selected='selected'{/if}>2007</option>
    <option{if $ad_date_start_year == "2008"} selected='selected'{/if}>2008</option>
    <option{if $ad_date_start_year == "2009"} selected='selected'{/if}>2009</option>
    <option{if $ad_date_start_year == "2010"} selected='selected'{/if}>2010</option>
    <option{if $ad_date_start_year == "2011"} selected='selected'{/if}>2010</option>
    <option{if $ad_date_start_year == "2012"} selected='selected'{/if}>2011</option>
    <option{if $ad_date_start_year == "2013"} selected='selected'{/if}>2012</option>
    <option{if $ad_date_start_year == "2014"} selected='selected'{/if}>2013</option>
    <option{if $ad_date_start_year == "2015"} selected='selected'{/if}>2014</option>
    <option{if $ad_date_start_year == "2016"} selected='selected'{/if}>2015</option>
    <option{if $ad_date_start_year == "2017"} selected='selected'{/if}>2016</option>
    <option{if $ad_date_start_year == "2018"} selected='selected'{/if}>2017</option>
    </select>
    &nbsp;&nbsp;<b>at</b>&nbsp;&nbsp;
    <select class='text' name='ad_date_start_hour'>
    <option></option>
    <option{if $ad_date_start_hour == "1"} selected='selected'{/if}>1</option>
    <option{if $ad_date_start_hour == "2"} selected='selected'{/if}>2</option>
    <option{if $ad_date_start_hour == "3"} selected='selected'{/if}>3</option>
    <option{if $ad_date_start_hour == "4"} selected='selected'{/if}>4</option>
    <option{if $ad_date_start_hour == "5"} selected='selected'{/if}>5</option>
    <option{if $ad_date_start_hour == "6"} selected='selected'{/if}>6</option>
    <option{if $ad_date_start_hour == "7"} selected='selected'{/if}>7</option>
    <option{if $ad_date_start_hour == "8"} selected='selected'{/if}>8</option>
    <option{if $ad_date_start_hour == "9"} selected='selected'{/if}>9</option>
    <option{if $ad_date_start_hour == "10"} selected='selected'{/if}>10</option>
    <option{if $ad_date_start_hour == "11"} selected='selected'{/if}>11</option>
    <option{if $ad_date_start_hour == "12"} selected='selected'{/if}>12</option>
    </select>&nbsp;<b>:</b>&nbsp;
    <select class='text' name='ad_date_start_minute'>
    <option></option>
    <option{if $ad_date_start_minute == "00"} selected='selected'{/if}>00</option>
    <option{if $ad_date_start_minute == "01"} selected='selected'{/if}>01</option>
    <option{if $ad_date_start_minute == "02"} selected='selected'{/if}>02</option>
    <option{if $ad_date_start_minute == "03"} selected='selected'{/if}>03</option>
    <option{if $ad_date_start_minute == "04"} selected='selected'{/if}>04</option>
    <option{if $ad_date_start_minute == "05"} selected='selected'{/if}>05</option>
    <option{if $ad_date_start_minute == "06"} selected='selected'{/if}>06</option>
    <option{if $ad_date_start_minute == "07"} selected='selected'{/if}>07</option>
    <option{if $ad_date_start_minute == "08"} selected='selected'{/if}>08</option>
    <option{if $ad_date_start_minute == "09"} selected='selected'{/if}>09</option>
    <option{if $ad_date_start_minute == "10"} selected='selected'{/if}>10</option>
    <option{if $ad_date_start_minute == "11"} selected='selected'{/if}>11</option>
    <option{if $ad_date_start_minute == "12"} selected='selected'{/if}>12</option>
    <option{if $ad_date_start_minute == "13"} selected='selected'{/if}>13</option>
    <option{if $ad_date_start_minute == "14"} selected='selected'{/if}>14</option>
    <option{if $ad_date_start_minute == "15"} selected='selected'{/if}>15</option>
    <option{if $ad_date_start_minute == "16"} selected='selected'{/if}>16</option>
    <option{if $ad_date_start_minute == "17"} selected='selected'{/if}>17</option>
    <option{if $ad_date_start_minute == "18"} selected='selected'{/if}>18</option>
    <option{if $ad_date_start_minute == "19"} selected='selected'{/if}>19</option>
    <option{if $ad_date_start_minute == "20"} selected='selected'{/if}>20</option>
    <option{if $ad_date_start_minute == "21"} selected='selected'{/if}>21</option>
    <option{if $ad_date_start_minute == "22"} selected='selected'{/if}>22</option>
    <option{if $ad_date_start_minute == "23"} selected='selected'{/if}>23</option>
    <option{if $ad_date_start_minute == "24"} selected='selected'{/if}>24</option>
    <option{if $ad_date_start_minute == "25"} selected='selected'{/if}>25</option>
    <option{if $ad_date_start_minute == "26"} selected='selected'{/if}>26</option>
    <option{if $ad_date_start_minute == "27"} selected='selected'{/if}>27</option>
    <option{if $ad_date_start_minute == "28"} selected='selected'{/if}>28</option>
    <option{if $ad_date_start_minute == "29"} selected='selected'{/if}>29</option>
    <option{if $ad_date_start_minute == "30"} selected='selected'{/if}>30</option>
    <option{if $ad_date_start_minute == "31"} selected='selected'{/if}>31</option>
    <option{if $ad_date_start_minute == "32"} selected='selected'{/if}>32</option>
    <option{if $ad_date_start_minute == "33"} selected='selected'{/if}>33</option>
    <option{if $ad_date_start_minute == "34"} selected='selected'{/if}>34</option>
    <option{if $ad_date_start_minute == "35"} selected='selected'{/if}>35</option>
    <option{if $ad_date_start_minute == "36"} selected='selected'{/if}>36</option>
    <option{if $ad_date_start_minute == "37"} selected='selected'{/if}>37</option>
    <option{if $ad_date_start_minute == "38"} selected='selected'{/if}>38</option>
    <option{if $ad_date_start_minute == "39"} selected='selected'{/if}>39</option>
    <option{if $ad_date_start_minute == "40"} selected='selected'{/if}>40</option>
    <option{if $ad_date_start_minute == "41"} selected='selected'{/if}>41</option>
    <option{if $ad_date_start_minute == "42"} selected='selected'{/if}>42</option>
    <option{if $ad_date_start_minute == "43"} selected='selected'{/if}>43</option>
    <option{if $ad_date_start_minute == "44"} selected='selected'{/if}>44</option>
    <option{if $ad_date_start_minute == "45"} selected='selected'{/if}>45</option>
    <option{if $ad_date_start_minute == "46"} selected='selected'{/if}>46</option>
    <option{if $ad_date_start_minute == "47"} selected='selected'{/if}>47</option>
    <option{if $ad_date_start_minute == "48"} selected='selected'{/if}>48</option>
    <option{if $ad_date_start_minute == "49"} selected='selected'{/if}>49</option>
    <option{if $ad_date_start_minute == "50"} selected='selected'{/if}>50</option>
    <option{if $ad_date_start_minute == "51"} selected='selected'{/if}>51</option>
    <option{if $ad_date_start_minute == "52"} selected='selected'{/if}>52</option>
    <option{if $ad_date_start_minute == "53"} selected='selected'{/if}>53</option>
    <option{if $ad_date_start_minute == "54"} selected='selected'{/if}>54</option>
    <option{if $ad_date_start_minute == "55"} selected='selected'{/if}>55</option>
    <option{if $ad_date_start_minute == "56"} selected='selected'{/if}>56</option>
    <option{if $ad_date_start_minute == "57"} selected='selected'{/if}>57</option>
    <option{if $ad_date_start_minute == "58"} selected='selected'{/if}>58</option>
    <option{if $ad_date_start_minute == "59"} selected='selected'{/if}>59</option>
    </select>
    <select class='text' name='ad_date_start_ampm'>
    <option></option>
    <option{if $ad_date_start_ampm == "$admin_ads_edit46"} selected='selected'{/if}>{$admin_ads_edit46}</option>
    <option{if $ad_date_start_ampm == "$admin_ads_edit47"} selected='selected'{/if}>{$admin_ads_edit47}</option>
    </select>
  </td>
  </tr>
  <tr>
  <td class='form1'>{$admin_ads_edit48}</td>
  <td class='form2'>

    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td><input type='radio' name='ad_date_end_options' id='timelimit0' value='0' onClick="hidediv('enddate')"{if $ad_date_end_options == 0 OR $ad_date_end_options == ""} checked='checked'{/if}></td>
    <td><label for='timelimit0'>{$admin_ads_edit49}</label></td>
    </tr>
    <tr>
    <td><input type='radio' name='ad_date_end_options' id='timelimit1' value='1' onClick="showdiv('enddate')"{if $ad_date_end_options == 1} checked='checked'{/if}></td>
    <td><label for='timelimit1'>{$admin_ads_edit50}</label></td>
    </tr>
    </table>

    <div style='margin-top: 7px; margin-bottom: 2px;{if $ad_date_end_options != 1} display: none;{/if}' id='enddate'>
      <select class='text' name='ad_date_end_month'>
      <option></option>
      <option{if $ad_date_end_month == "$admin_ads_edit34"} selected='selected'{/if}>{$admin_ads_edit34}</option>
      <option{if $ad_date_end_month == "$admin_ads_edit35"} selected='selected'{/if}>{$admin_ads_edit35}</option>
      <option{if $ad_date_end_month == "$admin_ads_edit36"} selected='selected'{/if}>{$admin_ads_edit36}</option>
      <option{if $ad_date_end_month == "$admin_ads_edit37"} selected='selected'{/if}>{$admin_ads_edit37}</option>
      <option{if $ad_date_end_month == "$admin_ads_edit38"} selected='selected'{/if}>{$admin_ads_edit38}</option>
      <option{if $ad_date_end_month == "$admin_ads_edit39"} selected='selected'{/if}>{$admin_ads_edit39}</option>
      <option{if $ad_date_end_month == "$admin_ads_edit40"} selected='selected'{/if}>{$admin_ads_edit40}</option>
      <option{if $ad_date_end_month == "$admin_ads_edit41"} selected='selected'{/if}>{$admin_ads_edit41}</option>
      <option{if $ad_date_end_month == "$admin_ads_edit42"} selected='selected'{/if}>{$admin_ads_edit42}</option>
      <option{if $ad_date_end_month == "$admin_ads_edit43"} selected='selected'{/if}>{$admin_ads_edit43}</option>
      <option{if $ad_date_end_month == "$admin_ads_edit44"} selected='selected'{/if}>{$admin_ads_edit44}</option>
      <option{if $ad_date_end_month == "$admin_ads_edit45"} selected='selected'{/if}>{$admin_ads_edit45}</option>
      </select>
      <select class='text' name='ad_date_end_day'>
      <option></option>
      <option{if $ad_date_end_day == "1"} selected='selected'{/if}>1</option>
      <option{if $ad_date_end_day == "2"} selected='selected'{/if}>2</option>
      <option{if $ad_date_end_day == "3"} selected='selected'{/if}>3</option>
      <option{if $ad_date_end_day == "4"} selected='selected'{/if}>4</option>
      <option{if $ad_date_end_day == "5"} selected='selected'{/if}>5</option>
      <option{if $ad_date_end_day == "6"} selected='selected'{/if}>6</option>
      <option{if $ad_date_end_day == "7"} selected='selected'{/if}>7</option>
      <option{if $ad_date_end_day == "8"} selected='selected'{/if}>8</option>
      <option{if $ad_date_end_day == "9"} selected='selected'{/if}>9</option>
      <option{if $ad_date_end_day == "10"} selected='selected'{/if}>10</option>
      <option{if $ad_date_end_day == "11"} selected='selected'{/if}>11</option>
      <option{if $ad_date_end_day == "12"} selected='selected'{/if}>12</option>
      <option{if $ad_date_end_day == "13"} selected='selected'{/if}>13</option>
      <option{if $ad_date_end_day == "14"} selected='selected'{/if}>14</option>
      <option{if $ad_date_end_day == "15"} selected='selected'{/if}>15</option>
      <option{if $ad_date_end_day == "16"} selected='selected'{/if}>16</option>
      <option{if $ad_date_end_day == "17"} selected='selected'{/if}>17</option>
      <option{if $ad_date_end_day == "18"} selected='selected'{/if}>18</option>
      <option{if $ad_date_end_day == "19"} selected='selected'{/if}>19</option>
      <option{if $ad_date_end_day == "20"} selected='selected'{/if}>20</option>
      <option{if $ad_date_end_day == "21"} selected='selected'{/if}>21</option>
      <option{if $ad_date_end_day == "22"} selected='selected'{/if}>22</option>
      <option{if $ad_date_end_day == "23"} selected='selected'{/if}>23</option>
      <option{if $ad_date_end_day == "24"} selected='selected'{/if}>24</option>
      <option{if $ad_date_end_day == "25"} selected='selected'{/if}>25</option>
      <option{if $ad_date_end_day == "26"} selected='selected'{/if}>26</option>
      <option{if $ad_date_end_day == "27"} selected='selected'{/if}>27</option>
      <option{if $ad_date_end_day == "28"} selected='selected'{/if}>28</option>
      <option{if $ad_date_end_day == "29"} selected='selected'{/if}>29</option>
      <option{if $ad_date_end_day == "30"} selected='selected'{/if}>30</option>
      <option{if $ad_date_end_day == "31"} selected='selected'{/if}>31</option>
      </select>
      <select class='text' name='ad_date_end_year'>
      <option></option>
      <option{if $ad_date_end_year == "2007"} selected='selected'{/if}>2007</option>
      <option{if $ad_date_end_year == "2008"} selected='selected'{/if}>2008</option>
      <option{if $ad_date_end_year == "2009"} selected='selected'{/if}>2009</option>
      <option{if $ad_date_end_year == "2010"} selected='selected'{/if}>2010</option>
      <option{if $ad_date_end_year == "2011"} selected='selected'{/if}>2010</option>
      <option{if $ad_date_end_year == "2012"} selected='selected'{/if}>2011</option>
      <option{if $ad_date_end_year == "2013"} selected='selected'{/if}>2012</option>
      <option{if $ad_date_end_year == "2014"} selected='selected'{/if}>2013</option>
      <option{if $ad_date_end_year == "2015"} selected='selected'{/if}>2014</option>
      <option{if $ad_date_end_year == "2016"} selected='selected'{/if}>2015</option>
      <option{if $ad_date_end_year == "2017"} selected='selected'{/if}>2016</option>
      <option{if $ad_date_end_year == "2018"} selected='selected'{/if}>2017</option>
      </select>
      &nbsp;&nbsp;<b>at</b>&nbsp;&nbsp;
      <select class='text' name='ad_date_end_hour'>
      <option></option>
      <option{if $ad_date_end_hour == "1"} selected='selected'{/if}>1</option>
      <option{if $ad_date_end_hour == "2"} selected='selected'{/if}>2</option>
      <option{if $ad_date_end_hour == "3"} selected='selected'{/if}>3</option>
      <option{if $ad_date_end_hour == "4"} selected='selected'{/if}>4</option>
      <option{if $ad_date_end_hour == "5"} selected='selected'{/if}>5</option>
      <option{if $ad_date_end_hour == "6"} selected='selected'{/if}>6</option>
      <option{if $ad_date_end_hour == "7"} selected='selected'{/if}>7</option>
      <option{if $ad_date_end_hour == "8"} selected='selected'{/if}>8</option>
      <option{if $ad_date_end_hour == "9"} selected='selected'{/if}>9</option>
      <option{if $ad_date_end_hour == "10"} selected='selected'{/if}>10</option>
      <option{if $ad_date_end_hour == "11"} selected='selected'{/if}>11</option>
      <option{if $ad_date_end_hour == "12"} selected='selected'{/if}>12</option>
      </select>&nbsp;<b>:</b>&nbsp;
      <select class='text' name='ad_date_end_minute'>
      <option></option>
      <option{if $ad_date_end_minute == "00"} selected='selected'{/if}>00</option>
      <option{if $ad_date_end_minute == "01"} selected='selected'{/if}>01</option>
      <option{if $ad_date_end_minute == "02"} selected='selected'{/if}>02</option>
      <option{if $ad_date_end_minute == "03"} selected='selected'{/if}>03</option>
      <option{if $ad_date_end_minute == "04"} selected='selected'{/if}>04</option>
      <option{if $ad_date_end_minute == "05"} selected='selected'{/if}>05</option>
      <option{if $ad_date_end_minute == "06"} selected='selected'{/if}>06</option>
      <option{if $ad_date_end_minute == "07"} selected='selected'{/if}>07</option>
      <option{if $ad_date_end_minute == "08"} selected='selected'{/if}>08</option>
      <option{if $ad_date_end_minute == "09"} selected='selected'{/if}>09</option>
      <option{if $ad_date_end_minute == "10"} selected='selected'{/if}>10</option>
      <option{if $ad_date_end_minute == "11"} selected='selected'{/if}>11</option>
      <option{if $ad_date_end_minute == "12"} selected='selected'{/if}>12</option>
      <option{if $ad_date_end_minute == "13"} selected='selected'{/if}>13</option>
      <option{if $ad_date_end_minute == "14"} selected='selected'{/if}>14</option>
      <option{if $ad_date_end_minute == "15"} selected='selected'{/if}>15</option>
      <option{if $ad_date_end_minute == "16"} selected='selected'{/if}>16</option>
      <option{if $ad_date_end_minute == "17"} selected='selected'{/if}>17</option>
      <option{if $ad_date_end_minute == "18"} selected='selected'{/if}>18</option>
      <option{if $ad_date_end_minute == "19"} selected='selected'{/if}>19</option>
      <option{if $ad_date_end_minute == "20"} selected='selected'{/if}>20</option>
      <option{if $ad_date_end_minute == "21"} selected='selected'{/if}>21</option>
      <option{if $ad_date_end_minute == "22"} selected='selected'{/if}>22</option>
      <option{if $ad_date_end_minute == "23"} selected='selected'{/if}>23</option>
      <option{if $ad_date_end_minute == "24"} selected='selected'{/if}>24</option>
      <option{if $ad_date_end_minute == "25"} selected='selected'{/if}>25</option>
      <option{if $ad_date_end_minute == "26"} selected='selected'{/if}>26</option>
      <option{if $ad_date_end_minute == "27"} selected='selected'{/if}>27</option>
      <option{if $ad_date_end_minute == "28"} selected='selected'{/if}>28</option>
      <option{if $ad_date_end_minute == "29"} selected='selected'{/if}>29</option>
      <option{if $ad_date_end_minute == "30"} selected='selected'{/if}>30</option>
      <option{if $ad_date_end_minute == "31"} selected='selected'{/if}>31</option>
      <option{if $ad_date_end_minute == "32"} selected='selected'{/if}>32</option>
      <option{if $ad_date_end_minute == "33"} selected='selected'{/if}>33</option>
      <option{if $ad_date_end_minute == "34"} selected='selected'{/if}>34</option>
      <option{if $ad_date_end_minute == "35"} selected='selected'{/if}>35</option>
      <option{if $ad_date_end_minute == "36"} selected='selected'{/if}>36</option>
      <option{if $ad_date_end_minute == "37"} selected='selected'{/if}>37</option>
      <option{if $ad_date_end_minute == "38"} selected='selected'{/if}>38</option>
      <option{if $ad_date_end_minute == "39"} selected='selected'{/if}>39</option>
      <option{if $ad_date_end_minute == "40"} selected='selected'{/if}>40</option>
      <option{if $ad_date_end_minute == "41"} selected='selected'{/if}>41</option>
      <option{if $ad_date_end_minute == "42"} selected='selected'{/if}>42</option>
      <option{if $ad_date_end_minute == "43"} selected='selected'{/if}>43</option>
      <option{if $ad_date_end_minute == "44"} selected='selected'{/if}>44</option>
      <option{if $ad_date_end_minute == "45"} selected='selected'{/if}>45</option>
      <option{if $ad_date_end_minute == "46"} selected='selected'{/if}>46</option>
      <option{if $ad_date_end_minute == "47"} selected='selected'{/if}>47</option>
      <option{if $ad_date_end_minute == "48"} selected='selected'{/if}>48</option>
      <option{if $ad_date_end_minute == "49"} selected='selected'{/if}>49</option>
      <option{if $ad_date_end_minute == "50"} selected='selected'{/if}>50</option>
      <option{if $ad_date_end_minute == "51"} selected='selected'{/if}>51</option>
      <option{if $ad_date_end_minute == "52"} selected='selected'{/if}>52</option>
      <option{if $ad_date_end_minute == "53"} selected='selected'{/if}>53</option>
      <option{if $ad_date_end_minute == "54"} selected='selected'{/if}>54</option>
      <option{if $ad_date_end_minute == "55"} selected='selected'{/if}>55</option>
      <option{if $ad_date_end_minute == "56"} selected='selected'{/if}>56</option>
      <option{if $ad_date_end_minute == "57"} selected='selected'{/if}>57</option>
      <option{if $ad_date_end_minute == "58"} selected='selected'{/if}>58</option>
      <option{if $ad_date_end_minute == "59"} selected='selected'{/if}>59</option>
      </select>
      <select class='text' name='ad_date_end_ampm'>
      <option></option>
      <option{if $ad_date_end_ampm == "$admin_ads_edit46"} selected='selected'{/if}>{$admin_ads_edit46}</option>
      <option{if $ad_date_end_ampm == "$admin_ads_edit47"} selected='selected'{/if}>{$admin_ads_edit47}</option>
      </select>
    </div>
  </td>
  </tr>
  <tr>
  <td class='form1'>{$admin_ads_edit51}</td>
  <td class='form2'>
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td><input type='text' id='views_field' name='ad_limit_views' class='text' size='7' maxlength='10'{if $ad_limit_views_unlimited != "unchecked"} disabled='disabled' style='background: #DDDDDD;'{/if} value='{if $ad_limit_views_unlimited == 0}{$ad_limit_views}{/if}'>&nbsp;&nbsp;&nbsp;</td>
    <td><input type='checkbox' id='ad_limit_views' name='ad_limit_views_unlimited' value='1' class='checkbox'{if $ad_limit_views_unlimited != "unchecked"} checked='checked'{/if} onClick="togglefield('views_field', this)"> <label for='ad_limit_views'>{$admin_ads_edit52}</label></td>
    </tr>
    </table>
  </td>
  </tr>
  <tr>
  <td class='form1'>{$admin_ads_edit53}</td>
  <td class='form2'>
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td><input type='text' id='clicks_field' name='ad_limit_clicks' class='text' size='7' maxlength='10'{if $ad_limit_clicks_unlimited != "unchecked"} disabled='disabled' style='background: #DDDDDD;'{/if} value='{if $ad_limit_clicks_unlimited == 0}{$ad_limit_clicks}{/if}'>&nbsp;&nbsp;&nbsp;</td>
    <td><input type='checkbox' id='ad_limit_clicks' name='ad_limit_clicks_unlimited' value='1' class='checkbox'{if $ad_limit_clicks_unlimited != "unchecked" OR $ad_limit_clicks_unlimited == ""} checked='checked'{/if} onClick="togglefield('clicks_field', this)"> <label for='ad_limit_clicks'>{$admin_ads_edit52}</label></td>
    </tr>
    </table>
  </td>
  </tr>
  <tr>
  <td class='form1'>{$admin_ads_edit54}</td>
  <td class='form2'>
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td><input type='text' id='minctr_field' name='ad_limit_ctr' class='text' size='7' maxlength='7'{if $ad_limit_ctr_unlimited != "unchecked"} disabled='disabled' style='background: #DDDDDD;'{/if} value='{if $ad_limit_ctr_unlimited == 0}{$ad_limit_ctr}{/if}'>&nbsp;&nbsp;&nbsp;</td>
    <td><input type='checkbox' id='ad_limit_minctr' name='ad_limit_ctr_unlimited' value='1' class='checkbox'{if $ad_limit_ctr_unlimited != "unchecked" OR $ad_limit_ctr_unlimited == ""} checked='checked'{/if} onClick="togglefield('minctr_field', this)"> <label for='ad_limit_minctr'>{$admin_ads_edit52}</label></td>
    </tr>
    </table>
  </td>
  </tr>
  </table>
</td></tr>
</table>

<br>

{literal}
<script language='Javascript'>
<!--
Ads = new Array()
Ads['top1'] = new Image(213,37);
Ads['top1'].src = "../images/admin_ads_top.gif";
Ads['top2'] = new Image(213,37);
Ads['top2'].src = "../images/admin_ads_top2.gif";
Ads['top3'] = new Image(213,37);
Ads['top3'].src = "../images/admin_ads_top3.gif";
Ads['belowmenu1'] = new Image(213,30);
Ads['belowmenu1'].src = "../images/admin_ads_belowmenu.gif";
Ads['belowmenu2'] = new Image(213,30);
Ads['belowmenu2'].src = "../images/admin_ads_belowmenu2.gif";
Ads['belowmenu3'] = new Image(213,30);
Ads['belowmenu3'].src = "../images/admin_ads_belowmenu3.gif";
Ads['left1'] = new Image(37,113);
Ads['left1'].src = "../images/admin_ads_left.gif";
Ads['left2'] = new Image(37,113);
Ads['left2'].src = "../images/admin_ads_left2.gif";
Ads['left3'] = new Image(37,113);
Ads['left3'].src = "../images/admin_ads_left3.gif";
Ads['right1'] = new Image(37,113);
Ads['right1'].src = "../images/admin_ads_right.gif";
Ads['right2'] = new Image(37,113);
Ads['right2'].src = "../images/admin_ads_right2.gif";
Ads['right3'] = new Image(37,113);
Ads['right3'].src = "../images/admin_ads_right3.gif";
Ads['bottom1'] = new Image(213,37);
Ads['bottom1'].src = "../images/admin_ads_bottom.gif";
Ads['bottom2'] = new Image(213,37);
Ads['bottom2'].src = "../images/admin_ads_bottom2.gif";
Ads['bottom3'] = new Image(213,37);
Ads['bottom3'].src = "../images/admin_ads_bottom3.gif";

function highlight1(id1) {
  var position3 = id1+"3";
  var position2 = id1+"2";
  if(document.getElementById(id1).src != Ads[position3].src) {
    document.getElementById(id1).src=Ads[position2].src;
    document.getElementById(id1).style.cursor='pointer';
  }
}
function highlight2(id1) {
  var position3 = id1+"3";
  var position1 = id1+"1";
  if(document.getElementById(id1).src != Ads[position3].src) {
    document.getElementById(id1).src=Ads[position1].src;
  }
}
function highlight3(id1) {
  var position3 = id1+"3";
  var position2 = id1+"2";
  if(document.getElementById(id1).src != Ads[position3].src) {
    document.getElementById(id1).src=Ads[position3].src;
    document.getElementById("banner_position").value=id1;
    var currentval = document.getElementById("banner_position").value;
    if(currentval == "top") {
      highlight4("belowmenu", "left", "right", "bottom");
    }
    if(currentval == "belowmenu") {
      highlight4("top", "left", "right", "bottom");
    }
    if(currentval == "left") {
      highlight4("top", "belowmenu", "right", "bottom");
    }
    if(currentval == "right") {
      highlight4("top", "belowmenu", "left", "bottom");
    }
    if(currentval == "bottom") {
      highlight4("top", "belowmenu", "left", "right");
    }
  } else {
    document.getElementById(id1).src=Ads[position2].src;
    document.getElementById("banner_position").value="";
  }
}
function highlight4(id1,id2,id3,id4) {
  var position1 = id1+"1";
  document.getElementById(id1).src=Ads[position1].src;
  var position1 = id2+"1";
  document.getElementById(id2).src=Ads[position1].src;
  var position1 = id3+"1";
  document.getElementById(id3).src=Ads[position1].src;
  var position1 = id4+"1";
  document.getElementById(id4).src=Ads[position1].src;
}
//-->
</script>
{/literal}

{if $ad_position == "top"}
  {assign var='ad_top' value='3'}
{elseif $ad_position == "belowmenu"}
  {assign var='ad_belowmenu' value='3'}
{elseif $ad_position == "left"}
  {assign var='ad_left' value='3'}
{elseif $ad_position == "right"}
  {assign var='ad_right' value='3'}
{elseif $ad_position == "bottom"}
  {assign var='ad_bottom' value='3'}
{/if}

<table cellpadding='0' cellspacing='0' width='100%'>
<tr><td class='header'>{$admin_ads_edit55}</td></tr>
<tr><td class='setting1'>
  {$admin_ads_edit56}
</td></tr>
<tr><td class='setting2'>
  <table cellpadding='0' cellspacing='0' align='center'>
  <tr>
  <td colspan='3'><img src='../images/admin_ads_top{$ad_top}.gif' border='0' id='top' onMouseOver="highlight1('top')" onMouseOut="highlight2('top')" onClick="highlight3('top')"></td>
  </tr>
  <tr>
  <td colspan='3'><img src='../images/admin_ads_menu.gif' border='0'></td>
  </tr>
  <tr>
  <td colspan='3'><img src='../images/admin_ads_belowmenu{$ad_belowmenu}.gif' border='0' id='belowmenu' onMouseOver="highlight1('belowmenu')" onMouseOut="highlight2('belowmenu')" onClick="highlight3('belowmenu')"></td>
  </tr>
  <tr>
  <td><img src='../images/admin_ads_left{$ad_left}.gif' border='0' id='left' onMouseOver="highlight1('left')" onMouseOut="highlight2('left')" onClick="highlight3('left')"></td>
  <td><img src='../images/admin_ads_content.gif' border='0'></td>
  <td><img src='../images/admin_ads_right{$ad_right}.gif' border='0' id='right' onMouseOver="highlight1('right')" onMouseOut="highlight2('right')" onClick="highlight3('right')"></td>
  </tr>
  <tr>
  <td colspan='3'><img src='../images/admin_ads_bottom{$ad_bottom}.gif' border='0' id='bottom' onMouseOver="highlight1('bottom')" onMouseOut="highlight2('bottom')" onClick="highlight3('bottom')"></td>
  </tr>
  </table>
  <input type='hidden' name='banner_position' id='banner_position' value='{$ad_position}'>
</td></tr>
<tr><td class='setting1'>
  {$admin_ads_edit57}
  <div style='text-align: center; padding-top: 6px;'>
    <h3><b>{literal}{$ads->ads_display('{/literal}{$ad_id}{literal}')}{/literal}</b></h3>
  </div>
</td></tr>
</table>

<br>

{* DETERMINE HOW MANY LEVELS AND SUBNETS TO SHOW BEFORE ADDING SCROLLBARS *}
{assign var='subnets_total' value=$subnets_total+1}
{if $levels_total > 10 OR $subnets_total > 10}
  {assign var='options_to_show' value='10'}
{elseif $levels_total > $subnets_total}
  {assign var='options_to_show' value=$levels_total}
{elseif $levels_total < $subnets_total}
  {assign var='options_to_show' value=$subnets_total}
{elseif $levels_total == $subnets_total}
  {assign var='options_to_show' value=$levels_total}
{/if}

<table cellpadding='0' cellspacing='0' width='100%'>
<tr><td class='header'>{$admin_ads_edit58}</td></tr>
<tr><td class='setting1'>
  {$admin_ads_edit59}
</td></tr>
<tr><td class='setting2'>
  <table cellpadding='0' cellspacing='0' align='center'>
  <tr>
  <td><b>{$admin_ads_edit62}</b></td>
  <td style='padding-left: 10px;'><b>{$admin_ads_60}</b></td>
  </tr>
  <tr>
  <td>
    <select size='{$options_to_show}' class='text' name='ad_levels[]' multiple='multiple' style='width: 300px;'>
    {section name=level_loop loop=$levels}
      <option value='{$levels[level_loop].level_id}'{if $levels[level_loop].level_selected == 1} selected='selected'{/if}>{$levels[level_loop].level_name|truncate:75:"...":true}{if $levels[level_loop].level_default == 1} {$admin_ads_edit61}{/if}</option>
    {/section}
    </select>
  </td>
  <td style='padding-left: 10px;'>
    <select size='{$options_to_show}' class='text' name='ad_subnets[]' multiple='multiple' style='width: 300px;'>
    {section name=subnet_loop loop=$subnets}
      <option value='{$subnets[subnet_loop].subnet_id}'{if $subnets[subnet_loop].subnet_selected == 1} selected='selected'{/if}>{$subnets[subnet_loop].subnet_name|truncate:75:"...":true}</option>
    {/section}
    </select>
  </td>
  </tr>
  </table>
</td></tr>
<tr><td class='setting2'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td><input type='checkbox' name='ad_public' id='ad_public' value='1'{if $ad_public == 1} checked='checked'{/if}></td>
  <td><label for='ad_public'>{$admin_ads_edit63}</label></td>
  </tr>
  </table>
</td></tr>
</table>

<br>

<table cellpadding='0' cellspacing='0'>
<tr>
<td>
  <input type='submit' class='button' value='{$admin_ads_edit64}'>&nbsp;
  <input type='hidden' name='task' value='dosave'>
  <input type='hidden' name='ad_id' value='{$ad_id}'>
  </form>
</td>
<td>
  <form action='admin_ads.php' method='post'>
  <input type='submit' class='button' value='{$admin_ads_edit20}'>
  </form>
</td>
</tr>
</table>

<br>

</td>
</tr>
</table>


{include file='admin_footer.tpl'}