<td valign="top" width="182" bgcolor="#EBEAEA" class="left">
    <p class="nav_title">Навигация </p>

    <?php
    //Обращаемся к таблице в БД для вывода в цикле списка кагеторий
    $result2 = mysqli_query($db, "SELECT * FROM categories");

    //Проверяем успешный ли запрос к БД, содержится ли результат в переменной результата
    if (!$result2) {
        echo "Запрос к базе данных не проходит. <br> Сообщите об этом администратору burn1603@gmail.com <br>";
        exit("Код ошибки: " . mysqli_error($db));
    }

//	Выводим в цикле названия категорий
if (mysqli_num_rows($result2)>0)
    {
    $myrow2=mysqli_fetch_array($result2);
    do {
        printf("<p class='nav_list'><a href='view_cat.php?cat=%s'>%s</a></p>", $myrow2['id'], $myrow2['title']);

    } while ($myrow2 = mysqli_fetch_array($result2));
    } else {
    echo "В результирующей выборке нет рядов.";
}

?>

    <p class="nav_title">Последние заметки </p>

    <?php

    // Делаем запрос к таблице с заметками data
    //Обращаемся к таблице в БД
    $result3 = mysqli_query($db, "SELECT title,id  FROM data ORDER BY date DESC, id DESC LIMIT 5");

    //Проверяем успешный ли запрос к БД, содержится ли результат в переменной результата
    if (!$result3) {
        echo "Запрос к базе данных не проходит. <br> Сообщите об этом администратору burn1603@gmail.com <br>";
        exit("Код ошибки: " . mysqli_error($db));
    }
//
    if (mysqli_num_rows($result3) > 0) {
        $myrow3 = mysqli_fetch_array($result3);
    } else
        echo "В результирующей выборке нет рядов.";

    //    Выводим список последних заменток
    do
    {
        printf ("<p class='nav_list'><a href='view_post.php?id=%s'>%s</a></p>",$myrow3['id'],$myrow3['title']);
    }

    while ($myrow3=mysqli_fetch_array($result3));

    ?>
    <p class="nav_title">Архив </p>

    <?php
    //формируем блок Архив
    $result4 = mysqli_query($db,"SELECT DISTINCT LEFT (date,7) AS month FROM data ORDER BY month DESC");//Обращаемся к таблице в БД

    //Проверяем успешный ли запрос к БД, содержится ли результат в переменной результата
    if (!$result4){
        echo "Запрос к базе данных не проходит. <br> Сообщите об этом администратору burn1603@gmail.com <br>";
        exit("Код ошибки: ". mysqli_error($db));
    }

    if (mysqli_num_rows($result4)>0)
    {
        $myrow4=mysqli_fetch_array($result4);
        do {
            printf ("<p class='nav_list'><a href='view_date.php?date=%s'>%s</a></p>",$myrow4['month'],$myrow4['month']);
        }
        while ($myrow4=mysqli_fetch_array($result4));
    }
    else
        echo "В результирующей выборке нет рядов.";
    ?>
    <p class="nav_title">Блоги друзей</p>

    <?php
    //Блок блогов друзей
    $result5 = mysqli_query($db,"SELECT * FROM friends_blogs");//Обращаемся к таблице в БД

    if (mysqli_num_rows($result5)>0)
    {
        $myrow5=mysqli_fetch_array($result5);
        do {
            printf ("<p class='nav_list'><a href='%s' target='_blank'>%s</a></p>",$myrow5['link'],$myrow5['title']);
        }
        while ($myrow5=mysqli_fetch_array($result5));
    }
    else
        echo "В результирующей выборке нет рядов.";
    ?>
<!--    Блок поиска-->
    <p class="nav_title">Поиск</p>
    <form action="view_search.php" method="post">
        <p class="search_t">Поисковый запрос должен быть не короче 4-х символов</p>
        <p> <input type="text" name="search" size="25" maxlength="40"></p>
        <p> <input class="search_b" type="submit" name="submit_s" value="Искать"></p>


    </form>

</td>