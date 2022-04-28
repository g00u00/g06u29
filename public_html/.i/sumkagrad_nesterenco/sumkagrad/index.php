<!DOCTYPE html>
<html>
<head>
    <meta content="text/html; charset=utf-8">
    <title>Главная - СумкаГрад</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/lightbox.css">

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.easing.min.js"></script>
    <script type="text/javascript" src="js/jquery.bpopup.min.js"></script>
    <script type="text/javascript" src="js/jquery.countdown.js" ></script>
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
    
    <div id="action_wrapper">
        <div id="triggers">
            <div id="trigger_1" class="trigger">
                <h3><span>0</span>% предоплаты</h3>
                <h4><span>Сначала товар<br />потом деньги</span></h4>
                <a href="#12" onclick="showCallModal('Заказ звонка. Триггер 0% предоплаты')">Закажите сейчас</a>
            </div>
            <div id="trigger_2" class="trigger">
                <h3><span>100</span>% гарантия</h3>
                <h4><span>Не понравился товар?<br />Мы вернём вам деньги</span></h4>
                <a href="#12" onclick="showCallModal('Заказ звонка. Триггер 100% гарантия')">Закажите сейчас</a>
            </div>
            <div id="trigger_3" class="trigger">
                <h3><span>Доставка</span></h3>
                <h4><span>Бесплатная доставка<br />по Москве</span></h4>
                <a href="#12" onclick="showCallModal('Заказ звонка. Триггер бесплатная доставка')">Закажите сейчас</a>
            </div>
        </div>
        <h1>Специальное предложение</h1>

        <div id="action">
            <!--<h2>Получите 50% скидку<br /><span>на сумку от “Adidas”</span></h2>
            <img src="images/action/photo.png" alt=""/>
            <h3>Старая цена:</h3><span class="action_old_price">6300 руб.</span>
            <h4>Новая цена:</h4><span class="action_new_price">3150 руб.</span>
            <a href="#23" id="ac_learn_more">Узнать больше</a>
            <a href="#21" id="ac_order">Заказать сейчас</a>-->
            <?php
                //$dbc = mysqli_connect('db4free.net', 'sumkagrad', '65F1gawX', 'sumkagrad')
                  //  or die ('Cant connect to db');
                $table = 'discount';
                $query = "SELECT * FROM $table";
                $result = mysqli_query($dbc, $query)
                    or die ($dbc->error);
                $row = mysqli_fetch_array($result);

                $query = "SELECT * FROM " . $row['name_of_the_table'] . " WHERE id=\"" . $row['id_in_the_table'] . "\"";
                echo "<h2>Женская сумка<br><span>Michael Kors</span></h2>";
                echo "<a href='images/items/Michael Kors/mk8568.png' rel='lightbox'><img src=\"images/items/Michael Kors/mk8568.png\" alt='' /></a>";
                echo "<h3>Старая цена:</h3><span class=\"action_old_price\">15 000 р.</span>";
                echo "<h4>Новая цена:</h4><span class=\"action_new_price\">7 500 р.</span>";
                $element_id = "showMore(" . $row['id_in_the_table'] . ", \"" . $row['name_of_the_table'] . "\")";
                echo "<a href='#21' id='ac_learn_more' onclick='" . $element_id . "'>подробнее</a>";
                echo "<a href='#21' id='ac_order' onclick='showCallModal(\"23\")'>заказать</a>";
            ?>
            <h6>До конца акции осталось:</h6>
            <div id="count_dimension"></div>
            <div id="countdown">

            </div>
        </div>
        <div class="clear"></div>
    </div>
    
    <?php include 'brands.php';?>
	
    <div id="main_items_wrapper">
        <!-- ОТЗЫВЫ -->
        <div id="main_items_reviews_preview">
            <h1>Отзывы</h1>

            <?php
            mysqli_query($dbc, "SET NAMES utf8");
            mysqli_query($dbc, "SET CHARACTER SET utf8");
            $table = 'reviews';
            $query = "SELECT * FROM $table";
            $result = mysqli_query($dbc, $query)
                or die ($dbc->error);

            $ik = 0;
            while($row = mysqli_fetch_array($result)){
                echo "<div class=\"review_preview\">";
                echo "<img src=\"images/reviews/photos/". $row['photo'] ."\" 'alt='' />";
                echo "<h2 class='review_preview_senders_name'>". $row["name"] ."</h2>";
                echo "<p class='review_preview_text'>".substr($row["review_text"], 0, 35)."...</p>";
                echo "<a href='reviews.php' class='review_preview_read'>Читать полностью</a>";
                echo "</div>";
                $ik++;
            }
            ?>

        <!--
            <div class="review_preview">
                <img src="images/reviews/preview/1.png" alt="" />
                <h2 class="review_preview_senders_name">Альберт Энштейн</h2>
                <p class="review_preview_text">Хорошие сумки!<br />Давно такие искал.</p>
                <a href="#21" class="review_preview_read">читать полностью</a>
            </div>
        -->
        </div>
        
        <!-- ЧАСТО ПРОСМАТРИВАЕМЫЕ -->
        <div id="main_items" style="padding-bottom: 30px">
            <h1>Лучшие предложения</h1>
            <?php include 'catalog_print.php';
                printItemsByFirm($dbc, "top");
            ?>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>
    
    <?php
        include "footer.php";
    ?>



    <div class="popup_modal" id="more_item">
        <div class="fade_div"></div>
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