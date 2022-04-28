<!DOCTYPE html>
<html>
<head>
	<meta content="text/html; charset=utf-8">
    <title>MK - СумкаГрад</title>
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
        <?php include "header.php";?>
    </div>

    <?php include "brands.php";?>

    <div id="main_items_wrapper">        
        <!-- КАТАЛОГ -->
        <div id="main_items_catalog">
            <!--<ul>
                <h3>Раздел: <span><a href="#12">Michael Kors</a></span></h3>
                <li><a href="catalog_dkny.php">Dkny</a></li>
                <li><a href="catalog_gucci.php">Gucci</a></li>
                <li><a href="catalog_lv.php">Louis Vuitton</a></li>
                <li><a href="catalog_furla.php">Furla</a></li>
            </ul>-->
            <h1>Каталог</h1>
                <?php
                    include "catalog_print.php";
                    /*Вывод товаров MK*/
                    $firm = $_GET['firm'];
                    switch($firm){
                        case 'furla': $firm = 'Furla'; break;
                        case 'lv': $firm = 'Louis Vuitton'; break;
                        case 'kors': $firm = 'Michael Kors'; break;
                        case 'dkny': $firm = 'DKNY'; break;
                        case 'gucci': $firm = 'GUCCI'; break;
                        default: $firm = 'all';
                    }
                    printItemsByFirm($dbc, $firm);
                ?>
            <div class="clear"></div>
        </div>
    </div>

    <?php
        include "footer.php";
    ?>
    
    <div class="popup_modal" id="more_item">
        <div class="fade_div">
            <!--<div class="popup_img_container">
                <img src="images/items/michael_kors/mk8568.png" alt="">
                <a class="popup_small_img_1" rel="lightbox[1]" href="images/items/michael_kors/mk8568.png"><img src="images/items/michael_kors/mk8568.png" alt="" /></a>
                <a class="popup_small_img_2" rel="lightbox[1]" href="images/items/michael_kors/mk8568.png"><img src="images/items/michael_kors/mk8568.png" alt="" /></a>
            </div>
            <h1 class="popup_name">Michael Kors Tote - East West Logo</h1>
            <h1 class="popup_brand">Michael Kors</h1>
            <h2>Описание</h2>
            <p>Задача организации, в особенности же начало повседневной работы по формированию позиции играет важную роль в 
            формировании дальнейших направлений развития. Повседневная практика показывает, что дальнейшее развитие различных
             форм деятельности позволяет выполнять важные задания по разработке дальнейших направлений развития. С другой 
             стороны укрепление и развитие структуры способствует подготовки и реализации систем массового участия. Идейные 
             соображения высшего порядка, а также консультация с широким активом позволяет оценить значение систем массового
             участия.</p>
             
             <h2>Особенности</h2>
             <ul>
                <li>Повседневная практика показывает</li>
                <li>Повседневная практика показывает</li>
                <li>Повседневная практика показывает</li>
                <li>Повседневная практика показывает</li>
                <li>Повседневная практика показывает</li>
             </ul>
            
            <h4 class="popup_price">5 599 <span>руб.</span></h4>
            
            <a href="#21" class="popup_order">Заказать!</a>
        </div>-->
    </div>
    </div>
    
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