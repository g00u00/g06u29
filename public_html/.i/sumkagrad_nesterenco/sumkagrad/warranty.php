<!DOCTYPE html>
<html>
<head>
    <meta content="text/html; charset=utf-8">
    <title>Гарантия - СумкаГрад</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/lightbox.css">

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.easing.min.js"></script>
    <script type="text/javascript" src="js/jquery.bpopup.min.js"></script>
    <script type="text/javascript" src="js/myscripts.js"></script>
    <script type="text/javascript" src="js/lightbox.js"></script>
</head>
<body>
<div id="main_wrapper">
    <div id="send_results"><!--Для вывода отчёта об отправке--></div>
    <div id="header">
        <?php
            include "header.php";
        ?>
    </div>
    
    <div id="brands">
        <a class="brand_navigation brand_unselected" id="brands_furla" href="catalog_furla.php">furla</a>
        <a class="brand_navigation brand_unselected" id="brands_lv" href="catalog_lv.php">lv</a>
        <a class="brand_navigation brand_unselected" id="brands_mk" href="catalog_kors.php">mk</a>
        <a class="brand_navigation brand_unselected" id="brands_dkny" href="catalog_dkny.php">dkny</a>
        <a class="brand_navigation brand_unselected" id="brands_gucci" href="catalog_gucci.php">gucci</a>
    </div>
	
    <div id="other_pages">
        <h1>Гарантия</h1>

        <h2>Почему стоит покупать у нас</h2>
        <ul>
            <li>Мы готовы вернуть полную сумму денег, если Вам не понравился товар </li>
            <li>Мы готовы предоставить Вам возможность полного возврата денег</li>
            <li>Вы можете попросить деньги обратно или обменять на другой
                товар совершенно бесплатно</li>
            <li><span>Для нас всегда важно, чтобы клиент был удовлетворен своей покупкой</span></li>
        </ul>

        <h2>Вместе с товаром вы получаете</h2>
        <ul>
            <li><span>Товарный чек</span> - гарантийный талон, что дает Вам большую
                гарантию качества</li>
            <li><span>Подарок</span> - Вы получаете вместе с покупкой гарантированный
                подарок от нашего магазина</li>
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