<!DOCTYPE html>
<html>
<head>
    <meta content="text/html; charset=utf-8">
    <title>О нас - СумкаГрад</title>
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
        <h1>О нас</h1>

        <p>Купить качественную сумку без магазинной наценки сегодня довольно непросто.<br> SumkaGrad - это именно то, что поможет Вам найти именно ту модель
            сумки,<br> о которой Вы мечтали и всегда хотели купить.</p>

        <h2>Работа с нами это</h2>
        <ul>
            <li><span>Демократичные цены</span> - покупать в SumkaGrad дешевле и выгоднее
                для наших покупателей</li>
            <li><span>Предоплата 0%</span> - Вы ничем не рискуете, делаете заказ, оплачиваете
                полную сумму при вручении товара</li>
            <li><span>Постоянное обновление (пополнение) ассортимента</span></li>
            <li><span>Быстрый ответ на любой вопрос в режиме 24/7</span></li>
            <li><span>Частые акции, розыгрыши и подарки</span> - постоянные акции радуют
                наших посетителей. Следите за акциями, чтобы совершить самую
                выгодную покупку</li>
            <li><span>Бесплатная доставка по Москве</span> - скажите нам свой адрес, и мы
                бесплатно доставим вам товар</li>
            <li><span>Гарантия качества</span> - если сумка вам не нравится, мы возвращаем
                Вам всю сумму</li>
            <li><span>Разные способы оплаты</span> - возможность оплатить наличным и
                безналичным способом, как Вам будет удобнее</li>
            <li><span>Вступление в клуб VIP клиентов</span> - дополнительная скидка на все
                товары. Плюс к этому, Вы будете в курсе о всех новостях группы</li>
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