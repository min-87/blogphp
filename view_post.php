<?php
//Страхуемся от хостингов, которые не поддерживают глобальные переменные
if (isset ($_GET['id']))
{
	$id=$_GET['id'];
}

//Подстраховка, если в переменную $id  ничего не введено
if (!isset ($_GET['id'])) { $id=1;}

include("blocks/db.php"); // Соединяемся с базой данных
// Запрос к базе данных с проверкой
$result = mysqli_query($db,"SELECT * FROM data WHERE id='$id'");


//Проверяем успешный ли запрос к БД, содержится ли результат в переменной результата
if (!$result){
	echo "Запрос к базе данных не проходит. <br> Сообщите об этом администратору burn1603@gmail.com <br>";
	exit("Код ошибки: ". mysqli_error($db));
}

if (mysqli_num_rows($result)>0){
	$myrow=mysqli_fetch_array($result); 
	//Наращиваем счетчик просмотров
	$new_view=$myrow["views"]+1;
	mysqli_query($db,"UPDATE data SET views='$new_view' WHERE id='$id'");
}
else 
	echo "В результирующей выборке нет рядов.";
?>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="keywords" content="<?php echo $myrow['meta_k'] ?>">
<meta name="description" content="<?php echo $myrow['meta_d'] ?>">



<title><?php echo  $myrow['title']?></title>
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
		  
		  printf("<p class='post_title2'>%s</p><p class='post_add'>Дата заметки: %s</p><p class='post_add'>Автор заметки: %s</p>%s<p class='post_view'>Просмотров: %s</p>", $myrow['title'], $myrow['date'], $myrow['author'], $myrow['text'], $myrow['views']);
			  
//			Запрос к БД за адресом проверочной капча-картинки
			   $result4 = mysqli_query($db,"SELECT img FROM com_settings "); //Дальше идет блок обращения к БД с проверкой
//Проверяем успешный ли запрос к БД, содержится ли результат в переменной результата
if (!$result4){
	echo "Запрос к базе данных не проходит. <br> Сообщите об этом администратору burn1603@gmail.com <br>";
	exit("Код ошибки: ". mysqli_error($db));
}

if (mysqli_num_rows($result4)>0){
	$myrow4=mysqli_fetch_array($result4); 
}
else 
	echo "В результирующей выборке нет рядов.";
?>
<!--	Конец запроса за адресом капча картинки	  -->
		  
<!--     Выводим блок комментариев-->
      <p class="comment_title">Комментарии к этой заметке:</p>
      <?php 
			 // запрос к таблице комментариев с проверкой
			  $result3 = mysqli_query($db,"SELECT * FROM comments WHERE post='$id'");	
		  
// обращаемся к таблице комментариев в цикле и выводим комментарии из таблицы на страницу в цикле
		  if (mysqli_num_rows($result3)>0)
		  {
	        $myrow3=mysqli_fetch_array($result3); 
			 do{
				printf("<div class='comment'>Комментарий добавил: <strong>%s</strong> <br>Дата: <strong>%s</strong> <br>
				%s <br></div>",$myrow3['author'], $myrow3['date'],$myrow3['text']); 
			 } 
			  while ($myrow3=mysqli_fetch_array($result3));
		  }
//		  echo $id;
//	 конец	вывода комментариев
	   ?>
<!--     Блок добавления комментария-->
      <p class="comment_title">Добавить комментарий:</p>
      
      <form action="comments.php" method="post">
      
      <p><label >Введите имя: <input name='author' type="text" size="30" maxlength="30"></label></p>
      <p><label>Введите комментарий: <br> <textarea name='text' cols="32" rows="4"></textarea></label></p>
      <p>Введите сумму чисел с картинки: <br> 
      <img style='margin-top: 17px;' src="<?php echo $myrow4["img"]; ?>" width="80" height="40" >
	<input name='pr' style='margin-bottom: 16px;' type="text" size="5" maxlength="5">
      </p>
       <p><input name='id' type="hidden" value="<?php echo $id; ?>"></p>
      <p><input name='sub_com' type="submit" value="Комментировать"></p>
      	
      </form>
<!-- Конец блока добавления комментария     -->
       </td>	
    </tr>
    <tr>
      <?php include("blocks/footer.php"); ?>
    </tr>
  </tbody>
</table>
</body>
</html>


