var activity_update_just_now = "��������� ������ ���";
var activity_cant_update = "�� ������� �������� ������.";
var activity_deleted = "������ ������.";
var activity_change_status = "[ �������� ������ ]";


var admin2_school = "�����";
var admin2_gymnasium = "��������";
var admin2_liceum = "�����";
var admin2_internat = "�����-��������";
var admin2_evening = "�������� �����";
var admin2_music = "����������� �����";
var admin2_sports = "���������� �����";
var admin2_artistic = "���. �����";
var admin2_art = "����� ��������";
var admin2_garten = "������� ���";
var admin2_prof_liceum = "����. �����";
var admin2_colledge = "�������";
var admin2_tech = "��������";
var admin2_spec_school = "�������";
var admin2_prof_tech = "���";
var admin2_prof = "����. �������";
var admin2_full_univ_name = "������ �������� ����";
var admin2_ready = "������";
var admin2_cancel = "������";
var admin2_search = "�����";
var admin2_edit = "�������������";
var admin2_list = "������";
var admin2_hide_list = "������ ������";
var admin2_server_error = "������ �������.";


var audio_flash_needed = "��� ����, ����� ��������������� �������������, ��� ���������� ���������� Flash-�������������.";


var audio_edit_editing = "�������������� �����������";
var audio_edit_singer = "�����������";
var audio_edit_name = "��������";
var audio_edit_text = "����� �����";
var audio_edit_additionally = "�������������";
var audio_edit_dont_show_search = "�� �������� ��� ������";
var audio_edit_edit = "�������������";
var audio_edit_cancel = "������";
var audio_edit_unknown = "����������� �����������";
var audio_edit_noname = "��� ��������";
var audio_edit_deleting = "�������� �����������";
var audio_edit_sure_delete = "�� ������������� ������ ������� ��� �����������?";
var audio_edit_yes = "��";
var audio_edit_no = "���";


var base_rotating = "������������";
var base_uploading_photo = "��� �������� ����������";
var base_dont_close = "����������, �� ���������� ��� ����, ���� ���������� �� ����������.";


var blog_tryagain = "��������� ����������� ������. ���������� �����.";
var blog_wrote_m = "�������";
var blog_wrote_fm = "��������";
var blog_delete = "�������";
var blog_comm_deleted = "����������� ������.";
var blog_renewpage = "��������� ����������� ������. ���������� ������������� ��������.";
var blog_comment_sent = "���������";
var blog_comment_sending = "������������";
var blog_comment_not_sent = "�� ���������";



var bookmarks_dont_watch = "�� �������";
var bookmarks_sure_dont_watch = "�� ������������� �� ������ ������ ������� �� ����� �������������?";
var bookmarks_yes = "��";
var bookmarks_no = "���";


var common_Jan = "������";
var common_Feb = "�������";
var common_Mar = "�����";
var common_Apr = "������";
var common_May = "���";
var common_Jun = "����";
var common_Jul = "����";
var common_Aug = "�������";
var common_Sep = "��������";
var common_Oct = "�������";
var common_Nov = "������";
var common_Dec = "�������";


var editor_descr = "��������";
var editor_adding_audio = "���������� �����������";
var editor_insert_audio = "�������� �����������";
var editor_singer_name = "����������� - ��������";
var editor_cancel = "������";
var editor_adding_link = "���������� ������";
var editor_insert_link = "�������� ������";


var events_menus_error_xmlhttp = "������ ��� �������� XMLHTTP";


var friend_showed = "������������";
var friend_first = "������";


var functions_sure_delete = "�� ������������� ������ ������� ��� ������?";


var groups_enter_post = "������� ���������:";
var groups_group_admin = "������������� ������";
var groups_edit = "�������������";
var groups_cancel = "������";
var groups_delete_manager = "�������� ������������";
var groups_sure_delete_manager = "�� ������������� ������ ������� ����� �������� �� �������������?";
var groups_yes = "��";
var groups_no = "���";
var groups_editing_link = "�������������� ������";
var groups_enter_name = "������� ��������:";
var groups_deleting_link = "�������� ������";
var groups_sure_delete_link = "�� ������������� ������ ������� ������ �� ��� ������?";
var groups_cancel2 = "��������";
var groups_partic_accepted = "�������� ������.";
var groups_appl_rejected = "������ ���������.";
var groups_inv_cancelled = "����������� ��������.";
var groups_partic_deleted = "�������� ������.";
var groups_assigning_manager = "���������� ������������";
var groups_assign = "���������";
var groups_assigned = "�������� �������� �������������.";


var mail_msg_deleted = "��������� �������.";
var mail_cancel = "������";
var mail_error = "������";
var mail_cant_add_more15 = "�� ������ �������� �� ����� 15 ���������.";
var mail_close = "�������";
var mail_add_1_address = "����������, �������� ���� �� ������ ��������.";
var mail_enter_text = "����������, ������� ����� ���������.";


var matches_yes_accepted = "�������� �������.";
var matches_no_accepted = "����� ������.";
var matches_user_deleted = "������������ ������ �� ������.";
var matches_open = "�������";
var matches_close = "�������";


var merger_cant_get_data = "�� ������� �������� ������:";


function noteExceedsSymbolLimit(n){
  return "������� ��������� ���������� ����� �� " + n + " ����" + getSymbolFlex(n);
}

function noteNSymbolsRemains(n) {
  return "�������� " + n + " ����" + getSymbolFlex(n);
}

function getSymbolFlex(n) {
  n = n%100;
  if (n%10 == 1 && n !=11) {return "";}
  if (n%10 > 1 && n%10 < 5 && (n - n%10 != 10)) {return "�";}
  return "��";
}

var notes_more_than = "������� ��������� ���������� ����� �� + n + ���� + getFlex(n)";
var notes_left_X_symbols = "�������� + n + ���� + getFlex(n)";


var photosedit_report_developers = "��������� ������, ����������, �������� �������������.";
var photosedit_cant_query_server = "�� ������� ��������� ������ � �������";


var photosedit_plain_cant_move = "��������, ���������� ����������� �� �������. ���������� ����������� �������� � ����������� ��� ���.";


var profile_edit_error = "������";
var profile_edit_sel_town_to_save = "����������, �������� ���� �� �����, ���� �� ������ ��������� �������� �����.";
var profile_edit_close = "�������";

var placeTypes = [["",1],
["���", 1],
["������", 0],
["��������", 0],
["����", 0],
["���", 0],
["���", 0],
["����", 0],
["��������-����", 0],
["������������ ����", 0],
["���������", 0],
["�������", 0],
["�������", 0],
["���������", 0],
["������ ������", 0],
["�����������", 1],
["���������", 0],
["���������", 0],
["��� ������", 0],
["������", 0],
["������", 0],
["���������", 0],
["�����", 0],
["���� �� ���������", 0],
["������", 0],
["������", 0],
["������-�����", 0],
["���������� ����", 0],
["�������", 0],
["��������", 0],
["�������", 0],
["����� �������", 0],
["��������������", 0],
["�����", 0],
["���������� ���", 0],
["����������", 0],
["�����", 0],
["�������", 0],
["����������", 0],
["����������� �����", 0],
["����", 0],
["��������", 0],
["�����������", 0],
["���������", 0],
["������", 0],
["�������", 0],
["�����", 0],
["���", 0],
["�����", 0],
["�����������", 0],
["�����������", 0],
["����", 0],
];


var select_select = "��������";
var select_enter = "�������";
var select_uploading = "���� ��������...";
var select_error = "������";
var select_must_sel_var = "���������� ������� ������� �� ������.";
var select_close = "�������";


var simpleajax_loading = "...��� ��������...";


var tagpeople_remove = "������";


var tagshow_you_saved = "�� ��������� �� ���� ����������";
var tagshow_I = "�";
var tagshow_You = "��";
var tagshow_user = "������������";
var tagshow_was_saved = "��� �������� �� ���� ����������";
var tagshow_click_ready = "����� ��������� �������� ������, ������� ������ \"������\".";


var voting_cant_vote = "���, ������������� �� �������. ������������� �������� � ���������� ��� ���.";
var voting_cant_revote = "���, �������������� �� �������. ������������� �������� � ���������� ��� ���.";
var voting_cant_open = "���, ������� ����� �� �������. ������������� �������� � ���������� ��� ���.";
var voting_cant_close = "���, ������� ����� �� �������. ������������� �������� � ���������� ��� ���.";
var voting_cant_place_main = "���, ��������� ����� �� ������� �������� ������ �� �������. ������������� �������� � ���������� ��� ���.";
var voting_cant_remove_main = "���, ������ ����� � ������� �������� ������ �� �������. ������������� �������� � ���������� ��� ���.";
var voting_empty_vars = "������ �������� ������ �����������. ��������� ��� ������� ��.";

var video_comments_marked_as_spam =  "����������� ������� ��� ����.";
var video_comments_error_xmlhttp = "������ ��� �������� XMLHTTP";

var questions_text = "����� �������:";
var questions_topic = "��������:";
var questions_loading = "��������...";
var questions_hide_comms = "������ �����������";
var questions_show_comms = "�������� �����������";

var ebrowse_mn = ['������','�������','����','������','���','����','����','������','��������','�������','������','�������'];
var ebrowse_days = "��������������";
var ebrowse_dayname_length = 2; 