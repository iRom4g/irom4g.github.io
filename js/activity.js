activity_editor = {
  
  active:             false,  // Is Editor Visible
  menu_active:        false,  // Is Suggestion Menu Visible
  activity_text:        '',
  
  activity_blur:        false,
  activity_reblur:      false,

  //
  // Functions to transition between modes
  //
  
  setup: function(initial_activity) {
    this.activity_text = initial_activity;
  },
  
  reset: function() {
    ge('edit_activity_text').value='';
    return false;
  },                 
  
  show: function() {
    if (!this.active) {
	  historyAjaxHide();
      hide('profile_activity');
      hide('profile_empty_activity');
      this.hide_menu();
      show('activity_editor');
      if (ge('activity_text').firstChild) {
        this.activity_text = ge('activity_text').firstChild.nodeValue;
      }
      ge('edit_activity_text').value = this.activity_text;
      ge('edit_activity_text').focus();
      ge('edit_activity_text').select();
      this.activity_blur = true;
	  setTimeout(function() { activity_editor.active = true; }, 200);
      // this.active = true;
    } else {
      ge('edit_activity_text').focus();
    }
    return false;
  },
  
  hide: function() {
    if (!this.active) {
      return;
    }
	setTimeout(function() { activity_editor.active = false; }, 200);
    // this.active = false;
    this.activity_blur = false;
    hide('activity_editor');
    show((this.activity_text != '') ? 'profile_activity' : 'profile_empty_activity');
	//if (this.activity_text != '') {
	//	show('profile_activity');
	//}
    return false;
  },
  
  toggle_menu: function(event) {
   if (this.isSafari() || this.isIE() || this.isOpera()) {
     this.activity_reblur = true;
    }
    if (this.menu_active) {
      return this.hide_menu();
    } else {
      return this.show_menu();
    }
  },

  show_menu: function(event) {
    this.menu_active = true;
    ge('edit_activity_toggle').style.backgroundImage='url(/images/activity_on.gif)';
    ge('edit_activity_toggle').style.backgroundColor='#fff';   
    ge('edit_activity_select').style.display='block';
    return false;
  },
  
  hide_menu: function() {
    this.menu_active = false;
    ge('edit_activity_toggle').style.backgroundImage='url(/images/activity_off.gif)';
    ge('edit_activity_toggle').style.backgroundColor='#D8DFEA';
    hide('edit_activity_select');
    return false;
  },
  
  activity_select: function(elem) {
    if (this.isSafari() || this.isIE() || this.isOpera()) {
      this.activity_reblur = true;
    }
    this.hide_menu();
    ge('edit_activity_text').value = elem.innerHTML;
    ge('edit_activity_text').focus();
    ge('edit_activity_text').select();
	return false;
  },
  
  menu_over: function(elem) {
		elem.style.backgroundColor = '#45688E';
		elem.style.color = '#fff';  	
  },
  
  menu_out: function(elem) {
		elem.style.backgroundColor = 'white';
		elem.style.color = '#000';  	
  },

  blur: function(real_blur) {
  	if (this.isOpera()&& !real_blur) {
		setTimeout(function() { activity_editor.blur(1); }, 100);
		return false;	
	}
    if (this.activity_reblur) {
      ge('edit_activity_text').focus();
      this.activity_reblur = false;
      return false;
    }
    if (this.activity_blur) {
      if (ge('edit_activity_text').value != this.activity_text) {
        this.submit_activity_set(ge('edit_activity_text').value);
      } else {
        this.hide();
      }
    }
    return true;
  },

  //
  // Ajax
  //

  activity_set: function(activity) {
    this.activity_text = activity || '';
    this.reset();
    this.hide();
    if (activity != null && activity != '') {		
      ge('activity_text').innerHTML = this.activity_text;
      ge('activity_time_link').innerHTML = activity_update_just_now;
    } else {
      ge('activity_text').innerHTML = activity_cant_update;
    }
  },
    
  submit_activity_set: function(activity) {
    if (activity == null || activity == '') return;
    ajax = new Ajax();
    ajax.onDone = function(ajaxObj, response) { ge('edit_activity_text').style.backgroundImage=''; this.activity_set(response); }.bind(this);
    ajax.onFail = function(ajaxObj) { ge('edit_activity_text').style.backgroundImage=''; this.activity_set(null); }.bind(this);
	ge('edit_activity_text').style.backgroundImage='url(/images/progress_candy_hor.gif)'; 
    ajax.post('/profile.php', {'setactivity':activity, 'activityhash': ge('activityhash').value});
    return false;
  },
  
  activity_cleared: function() {
    this.activity_text = '';
    ge('activity_text').innerHTML = '';
    this.hide();
    ge('activity_blank_nag').innerHTML=activity_deleted;
    setTimeout(function(){
		// hide('activity_blank_nag');
      	ge('activity_blank_nag').innerHTML = activity_change_status;
    }.bind(this), 2500);
  },

  submit_activity_clear: function() {
    this.activity_blur = false;
    ajax = new Ajax();
    ajax.onDone = function(ajaxObj, response) { ge('edit_activity_text').style.backgroundImage=''; this.activity_cleared(); }.bind(this);
    ajax.onFail = function(ajaxObj) { ge('edit_activity_text').style.backgroundImage=''; this.activity_cleared(); }.bind(this); // fingers crossed
	ge('edit_activity_text').style.backgroundImage='url(/images/progress_candy_hor.gif)'; 
    ajax.post('/profile.php', {'clearactivity':'1', 'activityhash': ge('activityhash').value});
    return false;
  },
  
  //
  // User Interaction
  //
  
  handle_key_press: function(event) {
    event = event || window.event;
    key_code = event.keyCode || event.which;
    
    if (key_code == this.KEYS.RETURN) {
      if (ge('edit_activity_text').value != '')
        this.submit_activity_set(ge('edit_activity_text').value);
      return false;
    }
    if (key_code == this.KEYS.ESC) {
      this.toggle();
      return false;
    }
    return true;
  },
  
  KEYS: {BACKSPACE:8,TAB:9,RETURN:13,ESC:27,LEFT:37,UP:38,RIGHT:39,DOWN:40,DELETE:46},
  
  isOpera: function() {
	return (navigator.userAgent.toLowerCase().indexOf("opera")!=-1);  	
  },
  
  isIE: function() {
	return (navigator.userAgent.toLowerCase().indexOf("msie")!=-1);
  },
  
  isSafari: function() {
	return(navigator.userAgent.indexOf("Safari")!=-1);		
  }  
}

historyShown = false;

function getActivityHistory(user_id) {
    ajax = new Ajax();
    ajax.onDone = onGotHistory;
    ajax.onFail = historyAjaxHide;
	historyAjaxProgress();
    ajax.post('/profile.php', {'activityhistory':'1', 'id': user_id});	
}

function onGotHistory(ajaxObj, response) { 
	historyAjaxShow();
	ge('historyContainer').innerHTML = response; 
}

function deleteHistoryItem(item_id) {
    ajax = new Ajax();
    ajax.onDone = onGotHistory;
    ajax.onFail = historyAjaxHide;
	historyAjaxProgress(1);
    ajax.post('/profile.php', {'deletehistoryitem':'1', 'iid': item_id, 'activityhash': ge('activityhash').value});	
}

function historyAjaxProgress(onlyshowprogress) {
	if (!onlyshowprogress) {
		hide('historyContainer');
		hide('historyHeader');
	}
	show('historyProgress');
	show('history');
//	ge('historyHeader').style.backgroundImage='url(/images/progress_candy_hor.gif)'; 
}

function historyAjaxShow() {
//	ge('historyHeader').style.backgroundImage='';
	historyShown = true;
	show('history');
	hide('historyProgress');
	show('historyHeader');
	show('historyContainer');
}

function historyAjaxHide() {
//	ge('historyHeader').style.backgroundImage=''; 
	historyShown = false;
	hide('history');
	hide('historyProgress');
	hide('historyHeader');
	hide('historyContainer');
}