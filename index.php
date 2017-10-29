<?php
// git test
include("blocks/db.php"); // Соединяемся с базой данных
$result = mysqli_query($db,"SELECT title,meta_d,meta_k,text FROM settings WHERE page='index'");//Обращаемся к таблице в БД

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
?>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="keywords" content="<?php echo $myrow['meta_k'] ?>">
<meta name="description" content="<?php echo $myrow['meta_d'] ?>">



<title><?php echo $myrow['title'] ?></title>
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
      <?php echo $myrow['text'];
//      require_once ('vendor/autoload.php');
//      eval (\Psy\sh());
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