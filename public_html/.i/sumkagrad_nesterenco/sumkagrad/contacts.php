<!DOCTYPE html>
<html>
<head>
    <meta content="text/html; charset=utf-8">
    <title>Контакты - СумкаГрад</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/lightbox.css">

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.easing.min.js"></script>
    <script type="text/javascript" src="js/jquery.bpopup.min.js"></script>
    <script type="text/javascript" src="js/lightbox.js"></script>
    <script type="text/javascript" src="js/myscripts.js"></script>
</head>
<body>
<div id="main_wrapper">
    <div id="send_results"><!--Для вывода отчёта об отправке--></div>
    <div id="header">
        <?php
            include "header.php";
        ?>
    </div>
    
    <?php
        include "brands.php";
    ?>
	
    <div id="other_pages" class="contacts">
        <h1>Наши контакты</h1>

        <h3>Заказывайте товар следующим способом:</h3>
        <h2 id="contacts_vk">контакте</h2>
        <ul>
            <li><span>http://vk.com/ivanovivan</span> - Иванов Иван</li>
            <li><span>http://vk.com/ivanovivana</span> - Иванова Ивана</li>
            <li><span>http://vk.com/sumkagrad</span> - Официальная страница ВК</li>
        </ul>

        <h2 id="contacts_phone">Закажите звонок или позвоните сами</h2>
        <ul>
            <li><span>info@sumkagrad.ru</span></li>
            <li><span>8-925-000-2588</span></li>
            <li><span>8-916-747-6475</span></li>
        </ul>
        <div class="clear"></div>
    </div>

    <?php
        include "footer.php";
    ?>

    <div class="popup_modal" id="call_modal">
        <h1 style="display: none;" id="call_type"></h1>
        <h2>Оставьте заявку</h2>
        <h3>И мы свяжемся с Вами!</h3>
        <form>
            <input type="text" placeholder="Ваше имя" id="call_name" />
            <input type="text" placeholder="Ваш E-mail" id="call_email" />
            <input type="text" placeholder="Ваш телефон" id="call_telephone" />
        </form>
        <a href="#2" id="call_submit">Отправить</a>
    </div>
</div>
</body>
</html>