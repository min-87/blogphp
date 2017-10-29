<?php
//Создание архива заметок. Вывод заметок за определенный месяцы
include("blocks/db.php");
if (isset($_GET["date"]))
{
    $date=$_GET["date"];
}
else {
    exit ("<p> Вы обратились к файлу без необходимых параметров. Проверьте адресную строку. </p> ");
}
$date_title=$date;
$date_begin=$date;
$date++;
$date_end=$date;
$date_begin=$date_begin."-01";
$date_end=$date_end."-01";


?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">

<title><?php echo "Список заметок за $date_title"?></title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>	
<table width="690" border="1" align="center" cellpadding="0" cellspacing="0" class="main_border">
  <tbody>
    <tr>
    <?php include("blocks/header.php"); ?>
    </tr>
    <tr>
      <?php include("blocks/lefttd.php"); ?>
      <td width="508" valign="top"  bgcolor="#FFFFFF">
      <p><?php

	// Запрос к базе данных с проверкой
	 $result = mysqli_query($db,"SELECT title, id, date, author, views, description, mini_img FROM data WHERE date>'$date_begin' 
AND date<'$date_end'");
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
		  
		  // Выводим табличку заметок в цикле
		  do{			
	printf ("
		<table  align='center' class='post_table'>
		        <tbody>
		          <tr class='post_title'>
		            <td >
					<p class='post_name'> <img align='left' class='mini' src='%s'> 
					<a href='view_post.php?id=%s'>%s</a></p>
					<p class='post_adds'>Дата добавления заметки: %s </p>
					<p class='post_adds'>Автор заметки: %s </p>
					</td>
		            </tr>
		          <tr>
		            <td >%s
					<p class='post_view'>Просмотров: %s </p>
					</td>
		            </tr>
		          </tbody>
		  </table>",$myrow['mini_img'],  $myrow['id'],$myrow['title'],$myrow['date'], $myrow['author'], $myrow['description'], $myrow['views']);
	}
				
	while ($myrow=mysqli_fetch_array($result));
		  ?>
       </td>
    </tr>
    <tr>
      <?php include("blocks/footer.php"); ?>
    </tr>
  </tbody>
</table>
</body>
</html>