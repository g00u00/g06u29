<!DOCTYPE html>
<html>
<head>
    <meta content="text/html; charset=utf-8">
    <title>Доставка - СумкаГрад</title>
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
    
    <div id="brands">
        <a class="brand_navigation brand_unselected" id="brands_furla" href="catalog_furla.php">furla</a>
        <a class="brand_navigation brand_unselected" id="brands_lv" href="catalog_lv.php">lv</a>
        <a class="brand_navigation brand_unselected" id="brands_mk" href="catalog_kors.php">mk</a>
        <a class="brand_navigation brand_unselected" id="brands_dkny" href="catalog_dkny.php">dkny</a>
        <a class="brand_navigation brand_unselected" id="brands_gucci" href="catalog_gucci.php">gucci</a>
    </div>
	
    <div id="other_pages">
        <h1>Способы доставки и оплаты заказа</h1>

        <h2>Мы используем 3 варианта доставки и оплаты сумок</h2>
        <ul>
            <li><span>Доставка до двери</span> -  лишь только когда Вы проверили свой товар,
                Вы оплачиваете покупку курьеру</li>
            <li><span>Самовывоз из офиса в Вашем городе</span></li>
            <li><span>Оплата безналичным расчетом, доставка до двери</span> - Вы можете сперва
                оплатить покупку, затем ожидать товар</li>
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