-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 27 2017 г., 14:21
-- Версия сервера: 5.5.53
-- Версия PHP: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `phpblog`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(5) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `meta_k` varchar(255) NOT NULL,
  `meta_d` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `title`, `text`, `meta_k`, `meta_d`) VALUES
(1, 'HTML коддинг', 'Здесь будут заметки о самом простом и понятном языке разметки. С помощью него можно делать много классных вещей.', 'язык, разметка, гипертекст, html', 'заметки об HTML'),
(2, 'PHP мысли', 'Здесь будут заметки о самом красивом и загадочном языке программирования PHP.', 'программирование, пхп, PHP, успех ', 'Заметки о PHP'),
(3, 'Photoshop', 'Здесь будут заметки о самом продвинутом и классном графическом редакторе - Photoshop.', 'работа, графика, обработка', 'О графическом редакторе Photoshop');

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(5) NOT NULL,
  `post` int(5) NOT NULL,
  `text` text NOT NULL,
  `author` varchar(10) NOT NULL,
  `date` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `post`, `text`, `author`, `date`) VALUES
(1, 2, 'Очень интересная статья! Много полезной информации!', 'Владимир', '2017-10-01'),
(2, 2, 'Класс! У меня все получилось, что описано у вас в статье.', 'Валентина', '2017-10-01'),
(3, 3, 'В статье упоминаются занятные моменты. Очень интересно!', 'Анатолий', '2017-10-01'),
(38, 2, 'Проверка почты', 'Владимир', '2017-10-07');

-- --------------------------------------------------------

--
-- Структура таблицы `com_settings`
--

CREATE TABLE `com_settings` (
  `id` int(2) NOT NULL,
  `img` varchar(255) NOT NULL,
  `sum` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `com_settings`
--

INSERT INTO `com_settings` (`id`, `img`, `sum`) VALUES
(1, 'img/sum.jpg', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `data`
--

CREATE TABLE `data` (
  `id` int(5) NOT NULL,
  `meta_k` varchar(255) NOT NULL,
  `meta_d` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `views` int(7) NOT NULL DEFAULT '0',
  `date` date NOT NULL DEFAULT '2017-09-28',
  `title` varchar(255) NOT NULL,
  `mini_img` varchar(255) NOT NULL,
  `cat` int(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `data`
--

INSERT INTO `data` (`id`, `meta_k`, `meta_d`, `description`, `author`, `text`, `views`, `date`, `title`, `mini_img`, `cat`) VALUES
(1, 'Шрифт, фотошоп', 'Как установить шрифт в фотошоп', '<p>Как установить шрифт в Photoshop?</p>\r\n        <p>Файл шрифта имеет расширение ttf или otf. ', 'Василенко Сергей', '<p>Как установить шрифт в Photoshop?</p>\r\n        <p>Файл шрифта имеет расширение ttf или otf. Чтобы добавить его в коллекцию установленных на вашем компьютере шрифтов нужно выполнить такие действия:<br>\r\n          Как установить шрифт в Photoshop?<br>\r\n          Если для решения поставленной вами задачи недостаточно стандартных шрифтов фотошопа, можно легко добавить новый в программу Photoshop.<img src=\"files/290817/fonts/5.jpg\" alt=\"\" width=\"450\"/></p>\r\n        <p> Сначала новый шрифт для фотошоп нужно найти и скачать. Проще всего его выбрать на странице Все шрифты. Скачанный файл шрифта будет, вероятнее всего, в виде архива zip или rar (например: Acadian.zip) и его сначала нужно распаковать. Для этого следует:<br>\r\n          выделить нужный файл шрифта;<br>\r\n          правой кнопкой мыши вызвать контекстное меню, в котором выбрать команду Извлечь;<br>\r\n          указать путь, куда именно извлечь файл шрифта;<br>\r\n          Распакованный файл должен иметь расширение ttf или otf (например: astra.ttf). Чтобы загрузить его в коллекцию установленных на вашем компьютере шрифтов нужно выполнить такие действия:<br>\r\n          Нажать кнопку Пуск;<br>\r\n          Выбрать Настройка&gt;Панель управления;<br>\r\n          В открывшемся окне выбрать Шрифты;<br>\r\n          Открывшееся окно Шрифты содержит все шрифты, установленные в вашей операционной системе. Содержимое этого окна лучше отобразить в виде таблицы – Вид&gt;Таблица;<br>\r\n          Перетянуть файл с новым шрифтом в это окно. Другой способ загрузить шрифт – выполнить команду меню Файл &gt;Установить шрифт и указать файл с новым шрифтом.<br>\r\n          Далее нужно внимательно просмотреть колонку Имя файла в окне Шрифты, найти там установленный вами новый шрифт и сравнить Имя файла с Названием шрифта. Иногда они не совпадают. В окне программы Photoshop отобразится Название шрифта, а не Имя файла.</p>\r\n      <p>Установленный таким образом шрифт можно применять и в других программах, например в Word.</p>', 11, '2017-07-28', 'Как установить шрифт в Photoshop?', 'files/290817/fonts/mini.jpg', 3),
(2, 'Фотошоп, графика, редактор', 'Графический редактор фотошоп', '<p>Adobe Photoshop  — многофункциональный графический редактор, разработанный и распространяемый фирмой Adobe Systems. В основном работает с растровыми изображениями, однако имеет некоторые векторные инструменты. </p>', 'Василенко Сергей', '<p>Adobe Photoshop  — многофункциональный графический редактор, разработанный и распространяемый фирмой Adobe Systems. В основном работает с растровыми изображениями, однако имеет некоторые векторные инструменты. </p>\r\n        <p>Продукт является лидером рынка в области коммерческих средств редактирования растровых изображений и наиболее известным продуктом фирмы Adobe. В настоящее время Photoshop доступен на платформах macOS, Windows, в мобильных системах iOS, Windows Phone и Android[8] . </p>\r\n        <p align=\"center\"><img src=\"files/290817/PShop/6.png\" width=\"330\"  alt=\"\"/></p>\r\n        <p>Также существует версия Photoshop Express для Windows Phone 8 и 8.1[9][10]. Сейчас в США идёт бета-тестирование стриминговой версии продукта для Chrome OS[11][12]. Ранние версии редактора были портированы под SGI IRIX[13], но официальная поддержка была прекращена, начиная с третьей версии продукта. Для версий 8.0 и CS6 возможен запуск под Linux с помощью альтернативы Windows API — Wine[14].</p>', 106, '2017-07-28', 'Adobe Photoshop  — многофункциональный графический редактор', 'files/290817/PShop/mini.png', 3),
(3, 'Заработок, программирование, php', 'Сколько зарабатывает php программист', '<p>С появлением компьютеров и интернета появилось множество дополнительных профессий.<br>\r\n      </p>\r\n        <p>Специалисты по программированию сейчас пользуются спросом, ведь через интернет запускается много разных проектов. </p>', 'Василенко Сергей', '<p>С появлением компьютеров и интернета появилось множество дополнительных профессий.<br>\r\n      </p>\r\n        <p>Специалисты по программированию сейчас пользуются спросом, ведь через интернет запускается много разных проектов. Поэтому, всем абитуриентам стоит задуматься над тем, чтобы выбрать специальность, связанную с компьютерами.</p>\r\n        <p>Как заработать на знании PHP? В этой статье мы рассмотрим одно из направлений программирования. Скриптовый язык активно применяется для разработки приложений.</p>\r\n        <p align=\"center\"><img src=\"files/280917/cash/images-2.jpg\" width=\"225\" height=\"224\" alt=\"\"/></p>\r\n        <p>Технология актуальная уже много лет, а если научиться PHP, можно получать неплохие деньги. Самое главное, что спрос на специалистов из этой области огромный.</p>\r\n        <p>заработать на PHP</p>\r\n        <p align=\"center\"><img src=\"files/280917/cash/znaniya-PHP.jpeg\" width=\"450\" height=\"327\" alt=\"\"/></p>\r\n        <p>Сколько зарабатывает PHP программист?</p>\r\n        <p>Назвать точную сумму невозможно, ведь все работают в разных компаниях, а некоторые и вовсе трудятся на дому. В любом случае, активные работники получают неплохую зарплату.</p>\r\n        <p>Те, кто работает, не выходя из дома, получают ровно столько, сколько успеют выполнить заказов. Расценки в нише устанавливаются редко, чаще всего их обговаривают индивидуально.</p>\r\n        <p>Из плюсов работы PHP программистом стоит отметить серьезные перспективы и актуальность деятельности. Во времена, когда интернет проникает практически во все сферы, работать программистом реально выгодно.</p>\r\n        <p>Только на бирже Weblancer каждый день появляются заказы для профессионалов:</p>', 12, '2017-06-27', 'Сколько зарабатывает php программист?', 'files/280917/cash/mini.jpg', 2),
(4, 'Переменные, глобальность, видимость', 'Предопределенные переменные', '<p>\r\n        Предопределённые переменные </p>\r\n        <p>PHP предоставляет всем скриптам большое количество предопределённых переменных. </p>', 'Василенко Сергей', '<p>\r\n        Предопределённые переменные </p>\r\n        <p>PHP предоставляет всем скриптам большое количество предопределённых переменных. Эти переменные содержат всё, от внешних данных до переменных среды окружения, от текста сообщений об ошибках до последних полученных заголовков.</p>\r\n        <p>См. также ЧАВО под названием &quot;Как register_globals касаются меня?&quot;<br>\r\n          Содержание </p>\r\n          <p align=\"center\"><img src=\"files/280917/var/PHP.png\" width=\"450\"  alt=\"\"/></p>\r\n        <p> Суперглобальные переменные — Суперглобальные переменные - это встроенные переменные, которые всегда доступны во всех областях видимости<br>\r\n          $GLOBALS — Ссылки на все переменные глобальной области видимости<br>\r\n          $_SERVER — Информация о сервере и среде исполнения<br>\r\n          $_GET — GET-переменные HTTP<br>\r\n          $_POST — POST-переменные HTTP<br>\r\n          $_FILES — Переменные файлов, загруженных по HTTP<br>\r\n          $_REQUEST — Переменные HTTP-запроса<br>\r\n          $_SESSION — Переменные сессии<br>\r\n          $_ENV — Переменные окружения<br>\r\n          $_COOKIE — HTTP Куки<br>\r\n          $php_errormsg — Предыдущее сообщение об ошибке<br>\r\n          $HTTP_RAW_POST_DATA — Необработанные POST-данные<br>\r\n          $http_response_header — Заголовки ответов HTTP<br>\r\n          $argc — Количество аргументов переданных скрипту<br>\r\n          $argv — Массив переданных скрипту аргументов<br>\r\n        </p>\r\n      ', 11, '2017-06-28', 'Предопределенные переменные', 'files/280917/var/mini.png', 2),
(5, 'Флоаты, свойство, обтекание', 'Флоаты в CSS', '<p>\r\n        Раскладка в CSS: float</p>\r\n        <p>Маниакальный веблог, 01.12.2005</p>\r\n        <p>Длинная эпопея с написанием статьи о свойстве &quot;float&quot; завершена. Пусть времени ушло много, но мне думается.</p>', 'Василенко Сергей', '<p>\r\n        Раскладка в CSS: float</p>\r\n        <p>Маниакальный веблог, 01.12.2005</p>\r\n        <p>Длинная эпопея с написанием статьи о свойстве &quot;float&quot; завершена. Пусть времени ушло много, но мне думается, что мне удалось максимально доходчиво свести все многообразие поведений этого мощного и несколько странного свойства в одну общую систему.</p>\r\n        <p>Кроме того, эта статья содержит рекордное количество иллюстраций среди всего &quot;Учебника&quot; :-)</p>\r\n        <p>Судьба свойства &quot;float&quot; в CSS слегка похожа на судьбу тега &quot;table&quot; в HTML: ни то, ни другое вообще не задумывалось как средство создания колонок и вообще раскладки элементов. Однако из-за определенных несовершенств механизма позиционирования float используется для этой цели очень широко. А то, что придумывался он для другого, частенько проявляется разными неочевидными эффектами. Однако перед тем, как их показать, я все же расскажу, как float\'ы можно применять для раскладки.</p>\r\n        <p align=\"center\"><img src=\"files/280917/floats/3.png\" width=\"238\"  alt=\"\"/></p>\r\n        <p>В самом начале — небольшое замечание о терминах. В русском языке не сложилось никакого известного термина для этого инструмента (пока, по крайней мере). Поэтому я предпочитаю писать его в исходном написании — &quot;float&quot;. Читается это примерно как &quot;флоут&quot; (ломать скулы произношением &quot;флоАт&quot; не нужно). Заодно тут же прошу простить мне такие вольности как &quot;заfloat\'ить&quot;, &quot;приfloat\'нутый&quot; и т.п. :-)<br>\r\n        Принцип работы</p>\r\n        <p>Как и позиционирование, float используется для того, чтобы двигать боксы. Но в отличие от позиционирования, которым можно двигать боксы практически произвольно, все, что может float — это сдвинуть элемент к одной из сторон потока, правой или левой.</p>\r\n        <p>При этом сам бокс и следующие за ним в потоке приобретают интересное поведение:</p>\r\n        <p> Float\'нутый бокс смещается по горизонтали и прилипает к одной из сторон родителя.<br>\r\n          Float\'нутый бокс перестает раздаваться на всю ширину родительского бокса-контейнера (как это происходит с блоками в потоке). С его неприжатой к родителю свободной стороны появляется свободное место.<br>\r\n          Следующие за ним блочные боксы подтягиваются вверх и занимают его место, как если бы float\'нутого бокса в потоке не было.<br>\r\n          Строчные же боксы внутри подвинувшихся наверх блоков начинают обтекать float\'нутый бокс со свободной стороны.<br>\r\n      </p>', 14, '2017-05-28', ' Раскладка в CSS: float', 'files/280917/floats/mini.png', 1),
(6, 'Письма, верстка, html', 'Html верстка писем', '<p>Светлана Шаповалова, коммерческий автор и переводчик, специально для «Нетологии» адаптировала статью Ли Манро, в которой он рассказывает об основах верстки писем и делится советами по ее оптимизации.</p>\r\n        ', 'Василенко Сергей', '<p>Светлана Шаповалова, коммерческий автор и переводчик, специально для «Нетологии» адаптировала статью Ли Манро, в которой он рассказывает об основах верстки писем и делится советами по ее оптимизации.</p>\r\n        <p>Верстка HTML-писем. Когда веб-разработчики видят эти слова — на глазах у них выступают слезы.</p>\r\n        <p> Если вы верстальщик, то рано или поздно столкнетесь с версткой писем, нравится вам это или нет. HTML-письма — это настоящий олдскул.</p>\r\n        <p>Эдакое путешествие в прошлое, в год, скажем, 1999 — эпоху вебмастеров, Frontpage и WYSIWYG-редакторов и табличной верстки.</p>\r\n        <p>С тех пор в email-дизайне практически ничего не изменилось. А точнее, стало только хуже. Чем больше появляется мобильных устройств и email-клиентов, тем больше трудностей возникает.</p>\r\n        <p align=\"center\"><img src=\"files/290817/post/4.jpg\" width=\"450\"  alt=\"\"/></p>\r\n        <p>Последние несколько лет я провел, проектируя инструменты для разработчиков, и два года из них работал ведущим дизайнером продукта в Mailgun — email-сервиса для разработчиков. Я многое узнал о том, как работают email-рассылки и с какими проблемами сталкиваются разработчики при верстке HTML-писем. В этой статье я поделюсь своими знаниями.<br>\r\n        HTML-шаблоны</p>\r\n        <p>Верстка HTML-шаблонов утомляет. Из-за этого появляется куча убого спроектированных писем — несуразных, однотипных, перегруженных, бессмысленных и раздражающих. Конечно, если вы получаете удовольствие от процесса или вам требуется что-то необычное и уникальное, тогда верстка собственных шаблонов стоит того. В противном случае, поискать хорошие шаблоны можно здесь:</p>\r\n        <p> Litmus Templates<br>\r\n          Really Simple Responsive HTML Email Template<br>\r\n          HTML Email Templates<br>\r\n          Foundation for Emails 2<br>\r\n        </p>', 11, '2017-04-28', 'Верстка HTML-писем', 'files/290817/post/mini.jpg', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `friends_blogs`
--

CREATE TABLE `friends_blogs` (
  `id` int(5) NOT NULL,
  `title` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `friends_blogs`
--

INSERT INTO `friends_blogs` (`id`, `title`, `link`) VALUES
(1, 'Php -manual', 'http://ua2.php.net/manual/ru/index.php'),
(2, 'W3schools.com - php tutorial', 'https://www.w3schools.com/php/'),
(3, 'Web-Reference - самоучитель по html и css', 'https://webref.ru/');

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

CREATE TABLE `settings` (
  `id` int(5) NOT NULL,
  `title` varchar(255) NOT NULL,
  `meta_k` varchar(255) NOT NULL,
  `meta_d` varchar(255) NOT NULL,
  `page` varchar(255) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`id`, `title`, `meta_k`, `meta_d`, `page`, `text`) VALUES
(1, 'Блог странного вебдизайнера', 'Блог,вебдизайн', 'Блог странного вебдизайнера', 'index', ' <p> Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>\r\n      <p> Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `com_settings`
--
ALTER TABLE `com_settings`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Индексы таблицы `friends_blogs`
--
ALTER TABLE `friends_blogs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT для таблицы `com_settings`
--
ALTER TABLE `com_settings`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `data`
--
ALTER TABLE `data`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `friends_blogs`
--
ALTER TABLE `friends_blogs`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
