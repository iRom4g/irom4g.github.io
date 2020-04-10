<?
// SET GENERAL VARIABLES, AVAILABLE ON EVERY PAGE
$header_event[1] = "События";
$header_event[2] = "Календарь";

// ASSIGN ALL SMARTY GENERAL EVENT VARIABLES
reset($header_event);
while(list($key, $val) = each($header_event)) {
  $smarty->assign("header_event".$key, $val);
}



// ASSIGN ALL CLASS/FUNCTION FILE VARIABLES
$functions_event[1] = "Каждый";
$functions_event[2] = "Все Зарегистрированные Пользователи";
$functions_event[3] = "Только Приглашенные Пользователи, Их Друзья, и Друзья Их Друзей";
$functions_event[4] = "Только Приглашенные Пользователи и Их Друзья";
$functions_event[5] = "Только Приглашенные Пользователи и Друзья Создателя События";
$functions_event[6] = "Только Приглашенные Пользователи";
$functions_event[7] = "Только Создатель События";
$functions_event[8] = "Никто";
$functions_event[9] = "События/События фотографий";
$functions_event[10] = "фото в Событиях: ";
$functions_event[11] = " новое событие приглашение";

$class_event[1] = "У Вас нет достаточного места что бы загрузить файл";



// SET LANGUAGE PAGE VARIABLES
switch ($page) {

  case "admin_event":
	$admin_event[1] = "общие Параметры Настройки Событий";
	$admin_event[2] = "Эта страница содержит общие параметры Настройки Событий, которые затрагивают вашу социальную сеть.";
	$admin_event[3] = "Ваши изменения были сохранены.";
	$admin_event[4] = "Тема";
	$admin_event[5] = "Сообщение";
	$admin_event[6] = "Приглашение к Событию, Email";
	$admin_event[7] = "Это - письмо, которое посылают пользователям, когда они приглашены посетить Событий. Для большего количества электронных писем системы, пожалуйста посетите  <a href='admin_emails.php'>Системные письма</a> страницу.";
	$admin_event[8] = "[username] - замененный именем пользователя получателя.<br>[eventname] - замененный названием события.<br>[link] - замененный адресом к логину.";
	$admin_event[9] = "Изменения сохранены";
	$admin_event[10] = "Общество Значения по умолчанию Разрешения";
	$admin_event[11] = " Выберите, действительно ли Вы хотите позволить общественности (посетителям которые не зарегистрированы) чтобы просматривали следующие разделы вашей социальной сети. В некоторых случаях (типа Профилей, Blogs, и Альбомов), если Вы дали им,  опция, ваши пользователи будет способны делать страницы личными даже при том, что Вы сделали их публично просматриваемыми здесь. Для большего количества параметров настройки разрешений, пожалуйста посетите <a href='admin_general.php'>General Settings</a> page.";
	$admin_event[12] = "События";
	$admin_event[13] = "Да, общественность может просматривать События, если они не сделаны приватными.";
	$admin_event[14] = "Нет, общественность не может просматривать События.";
	$admin_event[15] = "Новое событие комментарии Email";
	$admin_event[16] = "Это - сообщение, которая вышлется пользователю, когда новый комментарий отправлен по почте относительно События, который они создали. Для просмотра большего количества системных электронных писем, пожалуйста посетите <a href='admin_emails.php'>System Emails</a> page.";
	$admin_event[17] = "[username] - replaced with the username of the recepient.<br>[commenter] - replaced with the name of the user who posted the comment.<br>[eventname] - replaced with the name of the event.<br>[link] - replaced with the link to the event.";
	$admin_event[18] = "New Event Media Comment Email";
	$admin_event[19] = "This is the email that gets sent to a user when a new comment is posted on one of the photos/files for an event they have created. For more system emails, please visit the <a href='admin_emails.php'>System Emails</a> page.";
	$admin_event[20] = "[username] - replaced with the username of the recepient.<br>[commenter] - replaced with the name of the user who posted the comment.<br>[eventname] - replaced with the name of the event.<br>[link] - replaced with the link to the photo.";
	$admin_event[21] = "Event Categories";
	$admin_event[22] = "You may want to allow your users to categorize their События by subject, location, etc. Categorized События make it easier for users to find and attend События that interest them. If you want to allow event categories, you can create them (along with subcategories) below.";
	$admin_event[23] = "Add Category";
	$admin_event[24] = "Add Subcategory";



	$admin_event[28] = "New Event Invitation Request Email";
	$admin_event[29] = "This is the email that gets sent to a user when someone requests an invitation to an event they created. For more system emails, please visit the <a href='admin_emails.php'>System Emails</a> page.";
	$admin_event[30] = "[username] - replaced with the username of the recepient.<br>[requester] - replaced with the name of the user who is requesting an invitation.<br>[eventname] - replaced with the name of the event.<br>[link] - replaced with a link to login.";
	break;

case "admin_levels_eventsettings":
	$admin_levels_eventsettings[1] = "Настройки Событий";
	$admin_levels_eventsettings[2] = "Если Вы включили, События, ваши пользователи будут иметь опцию создания событий и приглашения пользователей. Используйте эту страницу, чтобы настроить ваши параметры событий.";
	$admin_levels_eventsettings[3] = "Включить события?";
	$admin_levels_eventsettings[4] = "Если Вы выбрали ДА, ваши пользователи, будут иметь опцию создания и связи к Событиям. Обратите внимание, что, если Вы переключаете, это ДА на НЕТ, пользователи потеряют все связи к событиям, которые они имеют";
	$admin_levels_eventsettings[5] = "Да, пользователи могут создавать события.";
	$admin_levels_eventsettings[6] = "Нет, пользователи не могут создавать события.";
	$admin_levels_eventsettings[7] = "Сохранить изменения";
	$admin_levels_eventsettings[8] = "Ваши изменения были сохранены.";
	$admin_levels_eventsettings[9] = "Включить к Событиям фотографии?";
	$admin_levels_eventsettings[10] = "Если Вы включите, эту функуцию, то пользователям будет доступно загружать маленький значок фотографии при создании или редактировании события. Это может быть отображено рядом с названием(именем) события на профилях пользователей.";
	$admin_levels_eventsettings[11] = "Да, пользователи могут загружать значок фотографии, когда они создают / редактируют события";
	$admin_levels_eventsettings[12] = "No, users can not upload a photo icon when they create/edit an event.";
	$admin_levels_eventsettings[13] = "If you have selected YES above, please input the maximum dimensions for the event photos. If your users upload a photo that is larger than these dimensions, the server will attempt to scale them down automatically. This feature requires that your PHP server is compiled with support for the GD Libraries.";
	$admin_levels_eventsettings[14] = "Maximum Width:";
	$admin_levels_eventsettings[15] = "(in pixels, between 1 and 999)";
	$admin_levels_eventsettings[16] = "Maximum Height:";
	$admin_levels_eventsettings[17] = "What file types do you want to allow for event photos (gif, jpg, jpeg, or png)? Separate file types with commas, i.e. jpg, jpeg, gif, png";
	$admin_levels_eventsettings[18] = "Allowed File Types:";
	$admin_levels_eventsettings[19] = "<b>Search Privacy Options</b><br>If you enable this feature, event leaders will be able to exclude their event from search results. Otherwise, all События will be included in search results.";
	$admin_levels_eventsettings[20] = "Yes, allow event leaders to exclude their События from search results.";
	$admin_levels_eventsettings[21] = "No, force all События to be included in search results.";
	$admin_levels_eventsettings[22] = "Event Privacy Options";
	$admin_levels_eventsettings[23] = "Editing User Level:";
	$admin_levels_eventsettings[24] = "You are currently editing this user level's settings. Remember, these settings only apply to the users that belong to this user level. When you're finished, you can edit the <a href='admin_levels.php'>other levels here</a>.";
	$admin_levels_eventsettings[25] = "<b>Overall Event Privacy</b><br>Event Creators can choose from any of the options checked below when they decide who can view their События. If you do not check any options, everyone will be allowed to view События.";
	$admin_levels_eventsettings[26] = "<b>Event Comment Options</b><br>Event Creators can choose from any of the options checked below when they decide who can post comments on their События. If you do not check any options, everyone will be allowed to post comments on События.";
	$admin_levels_eventsettings[27] = "Allow Invite-Only События?";
	$admin_levels_eventsettings[28] = "Do you want to give event creators the ability to create invite-only События? If set to YES, event creators will be able to set События to \"invite-only\". This means only invited users will be able to RSVP to the event and un-invited users will need to request an invitation";
	$admin_levels_eventsettings[29] = "Yes, optionally allow invite-only События.";
	$admin_levels_eventsettings[30] = "No, do not allow invite-only События.";
	$admin_levels_eventsettings[31] = "Allow custom CSS styles?";
	$admin_levels_eventsettings[32] = "If you enable this feature, your users will be able to customize the colors and fonts of their События by altering their CSS styles. ";
	$admin_levels_eventsettings[33] = "Yes, allow custom css.";
	$admin_levels_eventsettings[34] = "No, do not allow custom css.";
	$admin_levels_eventsettings[35] = "Event File Settings";
	$admin_levels_eventsettings[36] = "List the following file extensions that users are allowed to upload. Separate file extensions with commas, for example: jpg, gif, jpeg, png, bmp";
	$admin_levels_eventsettings[37] = "To successfully upload a file, the file must have an allowed filetype extension as well as an allowed MIME type. This pr События users from disguising malicious files with a fake extension. Separate MIME types with commas, for example: image/jpeg, image/gif, image/png, image/bmp";
	$admin_levels_eventsettings[38] = "How much storage space should each event have to store its files?";
	$admin_levels_eventsettings[39] = "Unlimited";
	$admin_levels_eventsettings[40] = "Enter the maximum filesize for uploaded files in KB. This must be a number between 1 and 204800.";
	$admin_levels_eventsettings[41] = "Enter the maximum width and height (in pixels) for images uploaded to События. Images with dimensions outside this range will be sized down accordingly if your server has the GD Libraries installed. Note that unusual image types like BMP, TIFF, RAW, and others may not be resized.";
	$admin_levels_eventsettings[42] = "Maximum Width:";
	$admin_levels_eventsettings[43] = "Maximum Height:";
	$admin_levels_eventsettings[44] = "(in pixels, between 1 and 9999)";



	$admin_levels_eventsettings[48] = "Photo width and height must be integers between 1 and 999.";
	$admin_levels_eventsettings[49] = "Your maximum filesize field must contain an integer between 1 and 204800.";
	$admin_levels_eventsettings[50] = "Your maximum width and height fields must contain integers between 1 and 9999.";
	break;

case "admin_viewevents":
	$admin_viewevents[1] = "Просмотреть события";
	$admin_viewevents[2] = "Эта страница перечисляет все События, которые пользователи создали в нашей социальной сети. Вы можете использовать эту страницу, чтобы контролировать эти События и удалять оскорбительные или нежелательные материалы в случае необходимости. Ввод критериев в поле фильтра поможет Вам найти определенные События. Если оставить поле фильтра пустым то, покажет все События на нашей социальной сети.";
	$admin_viewevents[3] = "Заголовок";
	$admin_viewevents[4] = "Создатель";
	$admin_viewevents[5] = "Фильтр";
	$admin_viewevents[6] = "ID";
	$admin_viewevents[7] = "Заголовок";
	$admin_viewevents[8] = "Создатель";

	$admin_viewevents[10] = "Дата События";
	$admin_viewevents[11] = "Опции";
	$admin_viewevents[12] = "просмотр";
	$admin_viewevents[13] = "удалить";
	$admin_viewevents[14] = "Найденные События";
	$admin_viewevents[15] = "Страница:";
	$admin_viewevents[16] = "Удалить События";
	$admin_viewevents[17] = "Вы уверены, что хотите удалить это Событие?";
	$admin_viewevents[18] = "Отмена";
	$admin_viewevents[19] = "События не найдены.";
	$admin_viewevents[20] = "Удалить выбранное";
	break;

  case "event":
	$event[1] = "Вы не имеете разрешения просматривать это событие.";
	$event[2] = "Приглашенные гости";
	$event[3] = "Запросить приглашение";
	$event[4] = "Перейти к этому событию";
	$event[5] = "Статистика события";
	$event[6] = "Администратор события:";
	$event[7] = "Просмотров:";
	$event[8] = "раз(а)";
	$event[9] = "Приглашено:";
	$event[10] = "гостя(ей)";
	$event[11] = "Фотографии:";
	$event[12] = "фото";
	$event[13] = "Последнее обновление:";
	$event[14] = "Информация События";
	$event[15] = "Имя События:";
	$event[16] = "Описание:";
	$event[17] = "Категория:";
	$event[18] = "Подтвержденные Гости";
	$event[19] = "просмотр всех подвержденных гостей";
	$event[20] = "Событие Время/Дата:";
	$event[21] = "Фотографии";
	$event[22] = "просмотр всех фотографий";
	$event[23] = "Комментарии";
	$event[24] = "Отправить Комментарий";
	$event[25] = "просмотреть все комментарии";
	$event[26] = "Анонимный";
	$event[27] = "сообщение";
	$event[28] = "Произошла ошибка";
	$event[29] = "Обзор фотографий";
	$event[30] = "Вы должны войти для просмотра этой страницы. <a href='login.php'>Нажмите здесь</a> чтобы Войти.";
	$event[31] = "Write Something...";
	$event[32] = "Posting...";
	$event[33] = "Пожалуйста введите сообщение.";
	$event[34] = "Вы ввели неправильный секретный код.";
	$event[35] = "";	  //THESE CHARACTERS ARE BEING ESCAPED BECAUSE THEY ARE BEING USED IN A DATE FUNCTION
	$event[36] = "Введите секретный код указанный на картинке. Это помогает нам избавиться от спама.";
	$event[37] = "Приватное Событие";
	$event[38] = "Пожаловаться на Событие";
	$event[39] = "Вернуться";
	$event[40] = "ответить";
	$event[41] = "Событие которое Вы ищете, было удалено или не существует.";
	$event[42] = "Другие Гости";
	$event[43] = "Может быть придут";
	$event[44] = "Не придут";
	$event[45] = "В ожидание ответа";
	$event[46] = "до";
	$event[47] = "RSVP к этому событию";
	$event[48] = "Изменить Ваш RSVP";
	$event[49] = "Отменить Событие";
	$event[50] = "Удалить из Моих Событий";
	$event[51] = "";	  //THESE CHARACTERS ARE BEING ESCAPED BECAUSE THEY ARE BEING USED IN A DATE FUNCTION
	$event[52] = "Ожидание приглашения...";
	$event[53] = "Отменить запрос приглашения";
	$event[54] = "Host:";
	$event[55] = "Месторасположение:";
	break;

  case "event_album":
	$event_album[1] = "Вы не имеете разрешения смотреть этот альбом..";
	$event_album[2] = "- Фото";
	$event_album[3] = "Произошла ошибка";
	$event_album[4] = "Вы должны войти на сайт, чтобы просмотреть эту страницу. <a href='login.php'>Нажмите здесь</a> чтобы Войти.";
	$event_album[5] = "Предыдущая страница";
	$event_album[6] = "Посмотреть изображение";
	$event_album[7] = "of";
	$event_album[8] = "Посмотреть изображения";
	$event_album[9] = "Следующая страница";
	$event_album[10] = "Вернуться";
	break;

  case "event_album_file":
	$event_album_file[1] = "У вас нет разрешения смотреть этот файл.";
	$event_album_file[2] = "- Фото";
	$event_album_file[3] = "Без имени";
	$event_album_file[4] = "фотографии";
	$event_album_file[5] = "загрузить audio";
	$event_album_file[6] = "загрузить video";
	$event_album_file[7] = "загрузить этот файл";
	$event_album_file[8] = "Вернуться к";
	$event_album_file[9] = "- Альбом";
	$event_album_file[10] = "Комментарий";
	$event_album_file[11] = "Нет содержания";
	$event_album_file[12] = "Комментарии";
	$event_album_file[13] = "на";
	$event_album_file[14] = "Аноним";
	$event_album_file[15] = "Произошла ошибка";
	$event_album_file[16] = "By";
	$event_album_file[17] = "Вы должны войти чтобы посмотреть эту страницу. <a href='login.php'>Нажмите здесь</a> чтобы Войти.";
	$event_album_file[18] = "Write Something...";
	$event_album_file[19] = "Posting...";
	$event_album_file[20] = "Пожалуйста введите сообщение.";
	$event_album_file[21] = "Вы ввели неправильный секретный код.";
	$event_album_file[22] = "";  //THESE CHARACTERS ARE BEING ESCAPED BECAUSE THEY ARE BEING USED IN A DATE FUNCTION
	$event_album_file[23] = "сообщение";
	$event_album_file[24] = "Введите секретный код указанный на картинке. Это помогает нам избавиться от спама.";
	$event_album_file[25] = "Вернуться";
	break;

  case "event_comments":
	$event_comments[1] = "сообщение";
	$event_comments[2] = "";	  //THESE CHARACTERS ARE BEING ESCAPED BECAUSE THEY ARE BEING USED IN A DATE FUNCTION
	$event_comments[3] = "Комментарии About";

	$event_comments[5] = "Вернуться к";

	$event_comments[7] = "Последняя страница";
	$event_comments[8] = "видимые комментарий";
	$event_comments[9] = "of";
	$event_comments[10] = "видимые комментарий";
	$event_comments[11] = "Следующая страница";
	$event_comments[12] = "Анонимный";

	$event_comments[14] = "Write Something...";
	$event_comments[15] = "Posting...";
	$event_comments[16] = "Пожалуйста введите сообщение.";
	$event_comments[17] = "Вы ввели неправильный секретный код.";
	$event_comments[18] = "Отправленные комментарии";
	$event_comments[19] = "Введите секретный код указанный на картинке. Это помогает нам избавиться от спама.";
	$event_comments[20] = "Произошла ошибка";

	$event_comments[22] = "Вы должны войти чтобы посмотреть эту страницу. <a href='login.php'>Нажмите здесь</a> чтобы Войти.";
	$event_comments[23] = "Вернуться";
	break;

  case "event_members":
	$event_members[1] = "Гостевой лист для События ";
	$event_members[2] = "следующие люди были приглашены на Событие ";
	$event_members[3] = "Предыдущая страница";
	$event_members[4] = "просмотр гостей";
	$event_members[5] = "of";
	$event_members[6] = "просмотр гостей";
	$event_members[7] = "Следующая страница";
	$event_members[8] = "Имя пользователя:";
	$event_members[9] = "Последнее обновление:";
	$event_members[10] = "Последний вход в систему:";
	$event_members[11] = "Просмотр Профиля";
	$event_members[12] = "Добавить в Друзья";
	$event_members[13] = "Отправить сообщение";
	$event_members[14] = "Произошла ошибка";
	$event_members[15] = "Вы должны войти чтобы посмотреть эту страницу. <a href='login.php'>Нажмите здесь</a> чтобы Войти.";
	$event_members[16] = "Вернуться";
	$event_members[17] = "Просмотр Гостей:";
	$event_members[18] = "Все Приглашенные";
	$event_members[19] = "Приду обязательно";
	$event_members[20] = "Может быть приду";
	$event_members[21] = "Нет не приду";
	$event_members[22] = "Ожидать Ответ";
	$event_members[23] = "Подтвердить";
	$event_members[24] = "Гостей не найдено.";
	$event_members[25] = "RSVP:";
	break;

  case "profile_event_calendar":
	$profile_event_calendar[1] = "- События на";
	$profile_event_calendar[2] = "закрыть";
	$profile_event_calendar[3] = "Когда:";
	$profile_event_calendar[4] = "до";
	$profile_event_calendar[5] = "Просмотр События";
	$profile_event_calendar[6] = "Хост:";
	$profile_event_calendar[7] = "RSVP:";
	$profile_event_calendar[8] = "Приду обязательно";
	$profile_event_calendar[9] = "Может быть приду";
	$profile_event_calendar[10] = "Нет не приду";
	$profile_event_calendar[11] = "Ожидание Ответа";
	$profile_event_calendar[12] = "- RSVP:";
	$profile_event_calendar[13] = "";	  //THESE CHARACTERS ARE BEING ESCAPED BECAUSE THEY ARE BEING USED IN A DATE FUNCTION
	break;

  case "user_event":
	$user_event[1] = "Мои События";
	$user_event[2] = "закрыть";
	$user_event[3] = "Обзор Событий";
	$user_event[4] = "Мои События";
	$user_event[5] = "Все События, созданные Вами или если вы были приглашены на События других участников.<br>Для обзора Событий, перейдите на ";
	$user_event[6] = "Страницу обзора Событий";
	$user_event[7] = "Создать Новое Событие";
	$user_event[8] = "У вас нет Событий в этом месяце.";
	$user_event[9] = "Оказал гостепреимство:";
	$user_event[10] = "Категория:";
	$user_event[11] = "Где:";
	$user_event[12] = "RSVP";
	$user_event[13] = "Редактировать Событие";
	$user_event[14] = "Отменить Событие";
	$user_event[15] = "Настройки Событий";
	$user_event[16] = "Когда:";
	$user_event[17] = "Ваш RSVP:";
	$user_event[18] = "Ожидание Ответа";
	$user_event[19] = "Приду обязательно";
	$user_event[20] = "Может быть приду";
	$user_event[21] = "Нет не приду";
	$user_event[22] = "Удалить Событие";
	$user_event[23] = "до";
	$user_event[24] = "Понедельник";
	$user_event[25] = "Вторник";
	$user_event[26] = "Среда";
	$user_event[27] = "Четверг";
	$user_event[28] = "Пятница";
	$user_event[29] = "Субботаy";
	$user_event[30] = "Воскресенье";
	$user_event[31] = "Просмотр События";
	$user_event[32] = "Событие(я) ожидающие вашего ответа.";
	$user_event[33] = "RSVP к Событию";
	$user_event[34] = "Событие(я) ожидающие вашего ответа";
	$user_event[35] = "Host:";
	$user_event[36] = "";	  //THESE CHARACTERS ARE BEING ESCAPED BECAUSE THEY ARE BEING USED IN A DATE FUNCTION
	break;

  case "user_event_add":
	$user_event_add[1] = "Пожалуйста введите название вашего События.";
	$user_event_add[2] = "Детали События";
	$user_event_add[3] = "Пожалуйста заполните все требуемые поля.";
	$user_event_add[4] = "в";
	$user_event_add[5] = "Мои События";

	$user_event_add[7] = "Просмотр События";
	$user_event_add[8] = "Создать Новое Событие";
	$user_event_add[9] = "Пожалуйста напишите краткую информацию для Вашего нового События. После того, как создадите Событие, Вы можете начинать приглашать других пользователей к нему.";
	$user_event_add[10] = "Имя События*";
	$user_event_add[11] = "Описание События";
	$user_event_add[12] = "Категория События";
	$user_event_add[13] = "Настройки События";
	$user_event_add[14] = "Только по приглашениям";
	$user_event_add[15] = "Пользователи могут сообщать о RSVP могут без приглашения. (RSVP - \"пожалуйста, сообщите, сможете ли вы прийти\". )";
	$user_event_add[16] = "Пользователи должны быть приглашены прежде, чем они могут отправить RSVP.";
	$user_event_add[17] = "Когда люди просматривают это Событие, им нужно автоматически сразу отправлять сообщение RSVP, или они должны сначала запросить приглашение?";
	$user_event_add[18] = "Включать это Событие в Поиск/Обзор?";
	$user_event_add[19] = "Да, включить это Событие в, Поиск / Обзор результатов.";
	$user_event_add[20] = "Нет, не включать это Событие в, Поиск / Обзор результатов.";
	$user_event_add[21] = "Кто может видеть это Событие?";
	$user_event_add[22] = "Вы можете решить кто может видеть это Событие.";
	$user_event_add[23] = "Разрешить комментарии?";
	$user_event_add[24] = "Вы можете разрешить кому можно отправлять комментарии по почте.";
	$user_event_add[25] = "Вставить Событие";
	$user_event_add[26] = "Отменить";
	$user_event_add[27] = "Настройки Событий";
	$user_event_add[28] = "Начало*";
	$user_event_add[29] = "Окончание*";
	$user_event_add[30] = "Недопустимое окончание времени - проверьте окончание вашего События, Событие не может заканчиваться раньше начала..";
	$user_event_add[31] = "Недопустимое начало времени - проверьте начало вашего События, время находится в будущем.";
	$user_event_add[32] = "Host:";
	$user_event_add[33] = "Расположение:";
	break;

  case "user_event_browse":
	$user_event_browse[1] = "Мои События";
	$user_event_browse[2] = "Все События";
	$user_event_browse[3] = "Обзор Событий";
	$user_event_browse[4] = "Обзор Событий";
	$user_event_browse[5] = "Поиск События которое Вас интересует. Выберите категорию ниже, или ищите Событие с Вашими ключевыми словами на <a href='search.php'>странице поиска</a>. <br> RSVP в переводе с Французкого \"Пожалуйста, сообщите, сможете ли вы прийти\".";
	$user_event_browse[6] = "Категория Событий";
	$user_event_browse[7] = "События";
	$user_event_browse[8] = "событие";
	$user_event_browse[9] = "Другое";
	$user_event_browse[10] = "Не найдено Событий в данной категории.";
	$user_event_browse[11] = "Когда:";
	$user_event_browse[12] = "Все События";
	$user_event_browse[13] = "Host:";
	$user_event_browse[14] = "Просмотреть Событие";
	$user_event_browse[15] = "RSVP к Событию";
	$user_event_browse[16] = "Предыдущая страница";
	$user_event_browse[17] = "просмотрено события";
	$user_event_browse[18] = "of";
	$user_event_browse[19] = "viewing События";
	$user_event_browse[20] = "Следующая страница";
	$user_event_browse[21] = "Настройки Событий";
	$user_event_browse[22] = "";	  //THESE CHARACTERS ARE BEING ESCAPED BECAUSE THEY ARE BEING USED IN A DATE FUNCTION
	$user_event_browse[23] = "до";
	break;

  case "user_event_edit":
	$user_event_edit[1] = "Размер Фотографий должен быть не более 4MB";
	$user_event_edit[2] = "Фотографии должны иметь одно из следующих расширений:";
	$user_event_edit[3] = "Фотографии должны быть меньше или соответствовать размерам:";
	$user_event_edit[4] = "pixels";
	$user_event_edit[5] = "Ваша фотография не загружена. Пожалуйста повторите попытку. Если ошибка повторится напишите нам письмо с подробным описанием ошибки.";
	$user_event_edit[6] = "Пожалуйста заполните все необходимые поля.";

	$user_event_edit[8] = "Пожалуйста введите имя Вашего События.";
	$user_event_edit[9] = "Ваши изменения сохранены.";
	$user_event_edit[10] = "Детали События";
	$user_event_edit[11] = "Приглашения";
	$user_event_edit[12] = "at";
	$user_event_edit[13] = "Фотографии";
	$user_event_edit[14] = "Комментарии";
	$user_event_edit[15] = "Стили События";
	$user_event_edit[16] = "Отменить Событие";
	$user_event_edit[17] = "Редактирование События:";
	$user_event_edit[18] = "Детали этого События отображены и могут быть изменены ниже.";
	$user_event_edit[19] = "Ваше Событие успешно создано! Вы можете добавить фотографию и редактировать детали События ниже.";
	$user_event_edit[20] = "Фотография События";
	$user_event_edit[21] = "Текущая Фотография";
	$user_event_edit[22] = "удалить фотографию";
	$user_event_edit[23] = "Загрузить Фото";
	$user_event_edit[24] = "Загрузить";
	$user_event_edit[25] = "Размер Фотографии должен быть не более 4MB, с одним из следующих расширений:";
	$user_event_edit[26] = "Детали События";
	$user_event_edit[27] = "Имя События*";
	$user_event_edit[28] = "Описание События";
	$user_event_edit[29] = "Категория События";
	$user_event_edit[30] = "Настройки Событий";
	$user_event_edit[31] = "Только приглашения";
	$user_event_edit[32] = "Пользователи могут сообщать о RSVP без приглашения. (RSVP - \"пожалуйста, сообщите, сможете ли вы прийти\". )";
	$user_event_edit[33] = "Пользователи должны быть приглашены прежде, чем они могут сообщить о RSVP.";
	$user_event_edit[34] = "Когда люди хотят посетить это Событие, им нужно разрешить сообщать о RSVP сразу? или они должны запросить приглашение? Одобрение / отрицание запросов приглашения может управляться через ";
	$user_event_edit[35] = "Примечание: Если Вы отметите \" Только по Приглашениям \" любые запросы приглашения будут автоматически одобрены.";
	$user_event_edit[36] = "Включать это Событие в, Поиск / Просмотр результатов?";
	$user_event_edit[37] = "Да, включать это Событие в, Поиск / Просмотр результатов.";
	$user_event_edit[38] = "Нет, не включать это Событие в, Поиск / Просмотр результатов.";
	$user_event_edit[39] = "Кто может просматривать это Событие?";
	$user_event_edit[40] = "Вы можете разрешить кто может видеть это Событие.";
	$user_event_edit[41] = "Разрешить комментарии?";
	$user_event_edit[42] = "Вы можете разрешить кто может писать комментарии.";
	$user_event_edit[43] = "Сохранить Изменения";
	$user_event_edit[44] = "Страница приглашений";
	$user_event_edit[45] = "Отмена";
	$user_event_edit[46] = "&#171; Вернуться к Событиям";
	$user_event_edit[47] = "Начало*";
	$user_event_edit[48] = "Конец*";
	$user_event_edit[49] = "Недопустимое окончание времени - проверьте окончание вашего События, Событие не может заканчиваться раньше начала.";
	$user_event_edit[50] = "Недопустимое начало времени - проверьте начало вашего События, время находится в будущем.";
	$user_event_edit[51] = "Host:";
	$user_event_edit[52] = "Location:";
	break;

  case "user_event_edit_comments":
	$user_event_edit_comments[1] = "Детали События";
	$user_event_edit_comments[2] = "Приглашения";

	$user_event_edit_comments[4] = "Фотографии";
	$user_event_edit_comments[5] = "Комментарии";
	$user_event_edit_comments[6] = "Стили События";
	$user_event_edit_comments[7] = "Отменить Событие";
	$user_event_edit_comments[8] = "Вернуться к Событиям";
	$user_event_edit_comments[9] = "Комментарии Событий:";
	$user_event_edit_comments[10] = "Комментарии написанные для этого События. Для того чтобы удалить комментарий, выберите его и нажмите кнопку \"Удалить Выбранное\".";
	$user_event_edit_comments[11] = "Предыдущая Страница";
	$user_event_edit_comments[12] = "комментарий";
	$user_event_edit_comments[13] = "of";
	$user_event_edit_comments[14] = "комментарии";
	$user_event_edit_comments[15] = "Следующая Страницаe";
	$user_event_edit_comments[16] = "Нет комментариев для данного События.";
	$user_event_edit_comments[17] = "Анонимный";
	$user_event_edit_comments[18] = "Удалить Выделенное";
	$user_event_edit_comments[19] = "";  //THESE CHARACTERS ARE BEING ESCAPED BECAUSE THEY ARE BEING USED IN A DATE FUNCTION
	$user_event_edit_comments[20] = "выбрать все комментарии";
	break;

  case "user_event_edit_delete":
	$user_event_edit_delete[1] = "Детали События";
	$user_event_edit_delete[2] = "Приглашения";

	$user_event_edit_delete[4] = "Фотографии";
	$user_event_edit_delete[5] = "Комментарии";
	$user_event_edit_delete[6] = "Стиль События";
	$user_event_edit_delete[7] = "Отменить Событие";
	$user_event_edit_delete[8] = "Вернуться к Событиям";
	$user_event_edit_delete[9] = "Отменить Событие:";
	$user_event_edit_delete[10] = "Вы уверены, что Вы хотите отменить это Событие? Все его содержание будет удалено, и все члены будут уведомлены, что Событие было отменено.";
	$user_event_edit_delete[11] = "Отменит Событие";
	$user_event_edit_delete[12] = "Нет, не отменять";
	break;

  case "user_event_edit_files":
	$user_event_edit_files[1] = "Ваши изменения сохранены.";
	$user_event_edit_files[2] = "Детали События";
	$user_event_edit_files[3] = "Приглашения";

	$user_event_edit_files[5] = "Фотографии";
	$user_event_edit_files[6] = "Комментарии";
	$user_event_edit_files[7] = "Стиль События";
	$user_event_edit_files[8] = "Отменить Событие";
	$user_event_edit_files[9] = "Вернуться к Событиям";
	$user_event_edit_files[10] = "Файлы События:";
	$user_event_edit_files[11] = "Управление фотографиями и новыми файлами в этом Событии.<br>Всего файлов в этом Альбоме: ";
	$user_event_edit_files[12] = "Добавить новый файл";
	$user_event_edit_files[13] = "Заголовок";
	$user_event_edit_files[14] = "комментарии";
	$user_event_edit_files[15] = "Надпись";
	$user_event_edit_files[16] = "Удалить Фото";
	$user_event_edit_files[17] = "Сохранить Изменения";
	break;

  case "user_event_edit_files_comments":
	$user_event_edit_files_comments[1] = "Детали События";
	$user_event_edit_files_comments[2] = "Invites";

	$user_event_edit_files_comments[4] = "Photos";
	$user_event_edit_files_comments[5] = "Comments";
	$user_event_edit_files_comments[6] = "Event Style";
	$user_event_edit_files_comments[7] = "Cancel Event";
	$user_event_edit_files_comments[8] = "Вернуться к Событиям";
	$user_event_edit_files_comments[9] = "Photo Comments";
	$user_event_edit_files_comments[10] = "To delete comments, click their checkboxes and then click the \"Delete Selected\" button below the comment list.";
	$user_event_edit_files_comments[11] = "Last Page";
	$user_event_edit_files_comments[12] = "comment";
	$user_event_edit_files_comments[13] = "of";
	$user_event_edit_files_comments[14] = "comments";
	$user_event_edit_files_comments[15] = "Next Page";
	$user_event_edit_files_comments[16] = "No comments have been posted about this photo.";
	$user_event_edit_files_comments[17] = "Anonymous";
	$user_event_edit_files_comments[18] = "Delete Selected";
	$user_event_edit_files_comments[19] = "";  //THESE CHARACTERS ARE BEING ESCAPED BECAUSE THEY ARE BEING USED IN A DATE FUNCTION
	$user_event_edit_files_comments[20] = "select all comments";
	$user_event_edit_files_comments[21] = "Back to Photos";
	break;

  case "user_event_edit_files_upload":
	$user_event_edit_files_upload[1] = "Детали События";
	$user_event_edit_files_upload[2] = "Приглашение";

	$user_event_edit_files_upload[4] = "Фотографии";
	$user_event_edit_files_upload[5] = "Комментарии";
	$user_event_edit_files_upload[6] = "Стиль События";
	$user_event_edit_files_upload[7] = "Отменить Событие";
	$user_event_edit_files_upload[8] = "Вернуться к Событиям";
	$user_event_edit_files_upload[9] = "Загрузить фотографии:";
	$user_event_edit_files_upload[10] = "Чтобы загрузить фотографии от вашего компьютера, щелкните кнопку \"Browse\", выберите их на вашем компьютере, затем нажмите \"Загрузить фотографии\".";
	$user_event_edit_files_upload[11] = "Вернуться к Фотографиям";
	$user_event_edit_files_upload[12] = "У Вас есть";
	$user_event_edit_files_upload[13] = "свободного места.";
	$user_event_edit_files_upload[14] = "Вы можете загружать файлы следующих типов:";
	$user_event_edit_files_upload[15] = "Вы можете загружать файлы размером до ";
	$user_event_edit_files_upload[16] = "Файл 1:";
	$user_event_edit_files_upload[17] = "Файл 2:";
	$user_event_edit_files_upload[18] = "Файл 3:";
	$user_event_edit_files_upload[19] = "Файл 4:";
	$user_event_edit_files_upload[20] = "Файл 5:";
	$user_event_edit_files_upload[21] = "Загрузить Фотографии";
	$user_event_edit_files_upload[22] = "ЗАГРУЗКА"; // USED IN JAVASCRIPT, NO QUOTES OR SPECIAL CHARACTERS ALLOWED
	$user_event_edit_files_upload[23] = "успешно загружено.";
	break;

  case "user_event_edit_members":
	$user_event_edit_members[1] = "Детали События";
	$user_event_edit_members[2] = "Приглашения";
	$user_event_edit_members[3] = "пользователь(и) успешно приглашен(ы) посетить это Событие.";
	$user_event_edit_members[4] = "Фотографии";
	$user_event_edit_members[5] = "Комментарии";
	$user_event_edit_members[6] = "Стиль События";
	$user_event_edit_members[7] = "Отменить Событие";
	$user_event_edit_members[8] = "Вернуться к Событиям";
	$user_event_edit_members[9] = "Обзор Гостей:";
	$user_event_edit_members[10] = "Используйте эту страницу, чтобы перечислять/искать гостей Событий, одобрять/отклонять просьбы о приглашениях (если это доступно), и приглашать дополнительных пользователей на ваше Событие.";
	$user_event_edit_members[11] = "Отправить приглашение";
	$user_event_edit_members[12] = "Чтобы пригласить кого-то посетить это Событие, введите имя пользователя в поле ниже.";
	$user_event_edit_members[13] = "Поиск";
	$user_event_edit_members[14] = "Сортировать по:";
	$user_event_edit_members[15] = "Недавно присоединенный";
	$user_event_edit_members[16] = "Недавно вошедший";
	$user_event_edit_members[17] = "Имя пользователя:";
	$user_event_edit_members[18] = "Приглашение";
	$user_event_edit_members[19] = "Предыдущая Страница";
	$user_event_edit_members[20] = "просмотр входа";
	$user_event_edit_members[21] = "of";
	$user_event_edit_members[22] = "просмотр входов";
	$user_event_edit_members[23] = "Следующая Страница";
	$user_event_edit_members[24] = "Последнее Обновление:";
	$user_event_edit_members[25] = "Последний Вход:";
	$user_event_edit_members[26] = "Все Приглашенные";
	$user_event_edit_members[27] = "Приду обязательно";
	$user_event_edit_members[28] = "Может быть приду";
	$user_event_edit_members[29] = "Нет не приду";
	$user_event_edit_members[30] = "Ожидание ответа";
	$user_event_edit_members[31] = "Добавить еще пользователя";
	$user_event_edit_members[32] = "Удалить из Приглашенных";
	$user_event_edit_members[33] = "Отправить Сообщение";
	$user_event_edit_members[34] = "Поиск:";
	$user_event_edit_members[35] = "Пользователи требующие приглашения";
	$user_event_edit_members[36] = "Следующие люди хотят посетить это Событие и просят приглашение";
	$user_event_edit_members[37] = "приглашение";
	$user_event_edit_members[38] = "отклонить";
	$user_event_edit_members[39] = "Просьба 1 человека о приглашении отклонена.";
	$user_event_edit_members[40] = "Просьба 1 человека о приглашении одобрена.";
	$user_event_edit_members[41] = "RSVP:";
	$user_event_edit_members[42] = "1 человек был удален из Приглашенных.";
	break;

  case "user_event_edit_style":
	$user_event_edit_style[1] = "Your changes have been saved.";
	$user_event_edit_style[2] = "Детали События";
	$user_event_edit_style[3] = "Invites";

	$user_event_edit_style[5] = "Photos";
	$user_event_edit_style[6] = "Comments";
	$user_event_edit_style[7] = "Event Style";
	$user_event_edit_style[8] = "Cancel Event";
	$user_event_edit_style[9] = "Вернуться к Событиям";
	$user_event_edit_style[10] = "Customize Event:";
	$user_event_edit_style[11] = "You can change the colors, fonts, and styles of your event page by adding CSS code below. The contents of the text area below will be output between &lt;style&gt; tags on your event page.";
	$user_event_edit_style[12] = "Save Changes";
	break;

  case "user_event_rsvp":
	$user_event_rsvp[1] = "RSVP";
	$user_event_rsvp[2] = "Вы уже просили приглашение на это Событие.";
	$user_event_rsvp[3] = "Ваш ответ для этого События был сохранен.";
	$user_event_rsvp[4] = "Мои События";
	$user_event_rsvp[5] = "RSVP к ";
	$user_event_rsvp[6] = "Обзор Событий";
	$user_event_rsvp[7] = "Запрос Приглашения";
	$user_event_rsvp[8] = "Этот Событие - только по приглашениям. Чтобы запросить приглашение, щелкните кнопку \"Запрос Приглашения\" ниже.";
	$user_event_rsvp[9] = "Запрос Приглашения";
	$user_event_rsvp[10] = "Отмена";
	$user_event_rsvp[11] = "Возврат";
	$user_event_rsvp[12] = "Вы уже порсили приглашение на это Событие. Администратор События возможно скоро, подтвердит или отклонит ваш запрос";
	$user_event_rsvp[13] = "Настройки Событий";
	$user_event_rsvp[14] = "Ответ на приглашение События, пожалуйста выберите свой ответ RSVP ниже. <br> RSVP в переводе с Французкого \"Пожалуйста, сообщите, сможете ли вы прийти\".";
	$user_event_rsvp[15] = "Вы посетите это Событие?";
	$user_event_rsvp[16] = "Да, я обязательно приду на это Событие.";
	$user_event_rsvp[17] = "Может быть приду на это Событие.";
	$user_event_rsvp[18] = "Нет, я не приду на это Событие.";
	$user_event_rsvp[19] = "Пожалуйста выберите опцию ответа RSVP.";
	break;

  case "user_event_remove":
	$user_event_remove[1] = "Мои События";
	$user_event_remove[2] = "Cancel Request";
	$user_event_remove[3] = "Обзор Событий";
	$user_event_remove[4] = "Удалить";
	$user_event_remove[5] = "Are you sure you want to remove this event?";
	$user_event_remove[6] = "<b>Please note that you are the creator/administrator of this event. If you remove this event, the entire event will be deleted.</b>";
	$user_event_remove[7] = "Cancel Invitation Request to";
	$user_event_remove[8] = "Are you sure you want to cancel your request for an invitation to this event?";
	$user_event_remove[9] = "Remove Event";
	$user_event_remove[10] = "Cancel";
	$user_event_remove[11] = "Настройки Событий";
	$user_event_remove[12] = "Do Not Cancel Request";
	break;

  case "user_event_settings":
	$user_event_settings[1] = "Мои События";

	$user_event_settings[3] = "Обзор Событий";
	$user_event_settings[4] = "Параметры Событий";
	$user_event_settings[5] = "Параметры Событий";
	$user_event_settings[6] = "Здесь Вы сможете отредактировать настройки отправки уведомлений на Ваш Email.";
	$user_event_settings[7] = "Ваши изменения сохранены.";
	$user_event_settings[8] = "Сохранить изменения";
	$user_event_settings[9] = "Уведомления Событий";
	$user_event_settings[10] = "Проставьте галочки рядом с уведомлениями, которые бы Вы хотели получить по Email.";
	$user_event_settings[11] = "Оповестить меня, когда кто - то приглашает меня к Событию.";
	$user_event_settings[12] = "Оповестить меня, когда кто - то оставляет комментарий в моем Событии.";
	$user_event_settings[13] = "Оповестить меня, когда кто - то оставляет комментарий в моем Событии к Фотографиям.";
	$user_event_settings[14] = "Оповестить меня, когда кто - то запрашивает приглашение на моё Событие.";
	$user_event_settings[15] = "Оповестить меня, когда кто - то отменяет Событие на которое я был приглашен.";
	break;

}

// ASSIGN ALL SMARTY VARIABLES
if(is_array(${"$page"})) {
  reset(${"$page"});
  while(list($key, $val) = each(${"$page"})) {
    $smarty->assign($page.$key, $val);
  }
}
?>