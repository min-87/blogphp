<?php
//Файл обработки поиска
include("blocks/db.php");
//Страховка от хостингов, которые не поддерживают глобальные переменные
if (isset($_POST['search'])) {$search=$_POST['search'];}
if (isset($_POST['submit_s'])) {$submit_s=$_POST['submit_s'];}

if (isset($submit_s)) {
    if (strlen($search)<4){
        exit ("Поисковый запрос меньше 4-х символов" );
    }
}
else exit("Вы обратились к странице без необходимых параметров");

// Обработаем поисковую переменную
$search=trim($search);
$search=stripcslashes($search);
$search=htmlspecialchars($search);
?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">

<title><?php echo "Список заметок по запросу -  $search"?></title>
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

	// Составляем запрос к таблице по совпадению с поисковой строкой
	 $result = mysqli_query($db,"SELECT title, id, date, author, views, description, mini_img FROM data WHERE text  LIKE '%$search%'");
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