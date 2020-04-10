<?php

// SET GENERAL VARIABLES, AVAILABLE ON EVERY PAGE
$header_education[1] = "Образование";
$header_education[2] = "Редактировать образование";
$header_education[3] = "Вуз или школа:"; // drop down attended for / school type
$header_education[4] = "Факультет или класс:";
$header_education[5] = "Факультет или класс";
$header_education[7] = "Статус:";
$header_education[8] = "Форма обучения:";
$header_education[6] = "Кафедра:";

// ASSIGN ALL SMARTY GENERAL VARIABLES
foreach ($header_education as $key=>$val) {
  $smarty->assign("header_education".$key, $val);
}


// SET LANGUAGE PAGE VARIABLES
switch ($page) {

  case "user_education":
    $user_education[1] = "Мое образование";
    $user_education[2] = "Вы можете управлять анкетой, используя форму ниже.";
    $user_education[3] = "Вы уверены?";
    $user_education[4] = "Добавить новую школу (имя не обязательно)";
    $user_education[5] = "Удалить это заведение";
    $user_education[6] = "Вуз или номер школы";
    $user_education[7] = "Тип образования";
    $user_education[8] = "Год обучения:";
    $user_education[9] = "Факультет:";
    $user_education[10] = "Кафедра:";
    $user_education[11] = "Форма обучения:";
    $user_education[12] = "Статус:";
    $user_education[13] = "Сохранить изменения";
    $user_education[14] = "Сохранено.";
    break;
	
case "admin_levels_educationsettings":
	$admin_levels_educationsettings[1] = "Настройки образования";
	$admin_levels_educationsettings[2] = "Если вы разрешите образования, ваши пользователи смогут указать свое образование. Используйте эту страницу, чтобы разместить ваши настройки.";
	$admin_levels_educationsettings[3] = "Разрешить образования?";
	$admin_levels_educationsettings[4] = "Если вы выбрали, ДА, ваши пользователи будут иметь возможность создания образований. Если НЕТ, то все настройки пользователей будут сброшены.";
	$admin_levels_educationsettings[5] = "Да, разрешить.";
	$admin_levels_educationsettings[6] = "Нет, не разрешать.";
	$admin_levels_educationsettings[7] = "Сохранить изменения";
	$admin_levels_educationsettings[8] = "Изменения сохранены.";
	$admin_levels_educationsettings[9] = "Изменить уровни пользователей:";
	$admin_levels_educationsettings[10] = "Отредактируйте установки этого уровня пользователя. Не забывайте, эти установки касаются только пользователей этого уровня пользователей. Когда вы закончите, вы можете отредактировать <a href='admin_levels.php'>другие уровни пользователей</a>.";

	break;
    
}

// ASSIGN ALL SMARTY VARIABLES
if (is_array(${"$page"})) {
  foreach (${"$page"} as $key=>$val) {
    $smarty->assign($page.$key, $val);
  }
}