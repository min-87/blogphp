<?php  
//Подсоединяемся к базе данных
$db=mysqli_connect("localhost","bloguser","php");
mysqli_select_db($db,"phpblog");

//Реализуем защиту от хостингов, которые не поддерживают глобальные переменные
if (isset($_POST["author"])) {$author=$_POST["author"];}
if (isset($_POST["text"])) {$text=$_POST["text"];}
if (isset($_POST["sub_com"])) {$sub_com=$_POST["sub_com"];}
if (isset($_POST["id"])) {$id=$_POST["id"];}
if (isset($_POST["pr"])) {$pr=$_POST["pr"];}

//Проверка
//Echo "$author<br> $text<br> $id<br> $sub_com";

//Проверяем заполнены ли все поля
//Обрабатываем текстовые данные спецфункциями
if (!isset($_POST["author"])) {$author="";}
if (!isset($_POST["text"])) {$text="";}
$author=trim($author);
$text=trim($text);
// Делаем проверку на пустоту полей 
if ((empty($author)) || (empty($text)))
{
//	Прерываем программу и вставляем кнопку с возвратом
	echo "<p> Вы ввели не всю информацию. Вернитесь назад и заполните все поля</p>";
	exit("<input name='back' type='button' value='Вернуться назад' onclick='javascript:history.back()'>");
}
//Конец проверки заполнености всех полей

//Обработка спецфункциями текстовых данных
$author=stripcslashes($author);
$text=stripcslashes($text);

$author=htmlspecialchars($author);
$text=htmlspecialchars($text);

//Достаем значение суммы на картинке из базы (с проверкой)
$result = mysqli_query($db,"SELECT sum FROM com_settings ");


//Проверяем успешный ли запрос к БД, содержится ли результат в переменной результата
if (!$result){
	echo "Запрос к базе данных не проходит. <br> Сообщите об этом администратору burn1603@gmail.com <br>";
	exit("Код ошибки: ". mysqli_error($db));
}

if (mysqli_num_rows($result)>0){
	$myrow=mysqli_fetch_array($result); 
}
else 
	echo "В результирующей выборке нет рядов.";

//конец проверки

//Проверям  совпадает ли введенная сумма с картинки
if ($pr == $myrow["sum"]) {
//Сформируем текущую дату
    $date = date("Y-m-d");
//	Запрос на вставку комментария к таблице комментариев
    $result = mysqli_query($db, "INSERT INTO comments (post,author,text,date) VALUES  ('$id','$author','$text','$date') ");
//	Отправление письма на почтовый адрес администратора с уведомлением о добавленном комментарии
    //Делаем отправку письма


    //   переменная адресс
    $adress = "vasilenko.sergey.a@gmail.com";
    // тема
    $subject = "Добавление нового комментария";
    //содержание письма
    // достаем из базы тему заметки
    $result = mysqli_query($db, "SELECT title FROM data  WHERE   id=$id ");
    $myrow = mysqli_fetch_array($result);

    $message = " Добавлен новый комментарий в заметку $myrow[title].\n Автор комментария: $author.\n Содержание комметария: $text.\n
Ссылка на заметку <a> http://phpblog/view_post.php?id=$id </a>";
    //формируем отсылку письма
    mail($adress, $subject, $message);
    // Конец блока отправки письма
}  // Блок отправки на предыдущую страницу
echo "<html><head>
    <meta http-equiv='Refresh' content='0; url=http://phpblog/view_post.php?id=$id'>
</head></html>";
?>


