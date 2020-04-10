<?
// SET GENERAL VARIABLES, AVAILABLE ON EVERY PAGE
$header_chat[1] = "Чат";
// ASSIGN ALL SMARTY GENERAL CHAT VARIABLES
reset($header_chat);
while (list($key, $val) = each($header_chat))
{
		$smarty->assign("header_chat" . $key, $val);
}
// SET LANGUAGE PAGE VARIABLES
switch ($page)
{
		case "admin_chat":
				$admin_chat[1] = "Настройки чата";
				$admin_chat[2] = "Live chat is a great way to encourage user interaction on your social network. Use the settings below to configure how your chat room will work. You can also use this page to kick or ban users from the chatroom.";
				$admin_chat[3] = "Ваши изменения сохранены.";
				$admin_chat[4] = "был(а) исключен(а) из чата.";
				$admin_chat[5] = "Сейчас в чате";
				$admin_chat[6] = "Следующие пользователи сейчас находятся в чате. Нажмите на имя,чтобы <b>исключить</b> из чата. Исключение пользователя не позволит ему входить в чат в течении нескольких минут. Если вы хотите забанить кого-нибудь - смотрите внизу страницы.";
				$admin_chat[7] = "В чате никого.";
				$admin_chat[8] = "Включить чат";
				$admin_chat[9] = "Позволить пользователям входить в чат?";
				$admin_chat[10] = "Да, пользователи могут входить в чат";
				$admin_chat[11] = "Нет, чат закрыт.";
				$admin_chat[12] = "Частота обновления";
				$admin_chat[13] = "The chatroom application connects to your server (using AJAX) every few seconds to get new data. How often do you want this process to occur? A shorter amount of time will make the chat slightly faster but will also consume more server resources. If your server is experiencing slowdown issues, try increasing this value from the default (2 seconds).";
				$admin_chat[14] = "секунд";
				$admin_chat[15] = "Пользователи онлайн";
				$admin_chat[16] = "The chatroom includes a frame that displays what users are currently logged-in to the chat. Do you want this list to simply be a textual list of usernames (like AIM's buddy list), or would you prefer to include each user's photo next to their username? If you expect your room to have many online users, you may want to just show a list of usernames.";
				$admin_chat[17] = "Да, показывать фото каждого пользователя рядом с именем.";
				$admin_chat[18] = "Нет, только показывать список пользователей.";
				$admin_chat[19] = "Забаненые";
				$admin_chat[20] = "If you want to ban certain users from logging into the chat, you can enter their usernames below (separated by commas only).";
				$admin_chat[21] = "Сохранить изменения";
				break;
		case "chat":
				$chat[1] = "Произошла ошибка";
				$chat[2] = "Вы должны войти на сайт чтобы просмотреть эту страницу. <a href='login.php'>Нажмите здесь</a> для входа.";
				$chat[3] = "Вернуться";
				break;
		case "chat_frame":
				$chat_frame[1] = "Добро пожаловать в чат!";
				$chat_frame[2] = "Вы вошли как";
				$chat_frame[3] = " ...";
				$chat_frame[4] = "Чат";
				$chat_frame[5] = "Bold";
				$chat_frame[6] = "Italics";
				$chat_frame[7] = "Подчеркнуть";
				$chat_frame[8] = "Смайлы";
				$chat_frame[9] = "Цвет";
				$chat_frame[10] = "Время";
				$chat_frame[11] = "Звук Вкл/Откл";
				$chat_frame[12] = "чел. в чате";
				$chat_frame[13] = "чел. в чате";
				$chat_frame[14] = "Вы вышли из чата.<br>Либо существует ошибка подключения,<br>или вас исключили из чата.<br><br>Попробуйте войти опять через несколько минут.";
				$chat_frame[15] = "Ваше соединение с чатом истекло.<br><br>Пожалуйста <a href='chat_frame.php'>нажмите здесь</a>, чтобы попробывать подключиться.";
				$chat_frame[16] = "Вы были исключены из чата.<br>Вы сможете войти опять через несколько минут.";
				$chat_frame[17] = "Вы были забанены администратором.";
				$chat_frame[18] = "Чат был отключен администратором.<br>Попробуйте войти позднее!";
				$chat_frame[19] = "Вы не можете войти в чат из-за серверной ошибки.<br>Сообщите об этом админ!";
				$chat_frame[20] = " входит в чат.";
				$chat_frame[21] = " выходит из чата.";
				break;
}
// ASSIGN ALL SMARTY VARIABLES
if (is_array(${"$page"}))
{
		reset(${"$page"});
		while (list($key, $val) = each(${"$page"}))
		{
				$smarty->assign($page . $key, $val);
		}
}
?>