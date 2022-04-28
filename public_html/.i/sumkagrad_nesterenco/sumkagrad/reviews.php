<!DOCTYPE html>
<html>
<head>
    <meta content="text/html; charset=utf-8">
    <title>Отзывы - СумкаГрад</title>
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
    
    <?php include "brands.php";?>
	
    <div id="other_pages" class="reviews">
        <h1>Отзывы</h1>

        <?php
            mysqli_query($dbc, "SET NAMES utf8");
            mysqli_query($dbc, "SET CHARACTER SET utf8");
            $table = 'reviews';
            $query = "SELECT * FROM $table";
            $result = mysqli_query($dbc, $query)
                or die ($dbc->error);

            if(mysqli_num_rows($result) == 0) {
                echo "<p>Отзывов нет :(</p>";
            }

            while($row = mysqli_fetch_array($result)){
                echo "<div class=\"review\">";
                echo "<img src=\"images/reviews/photos/" . $row['photo'] . "\" 'alt='' />";
                echo "<h4>" . $row['name'] . "</h4>";
                echo "<h6>" . $row['firm'] . "</h6>";
                echo "<p class='review_text'>" . $row['review_text'] . "</p>";
                echo "</div>";
            }
            mysqli_close($dbc);
        ?>

        <!--
        <div class="review">
            <img src="images/reviews/1.png" alt="">
            <h4>Жан-Клод Ван Дамм</h4>
            <h6>Приобрёл сумку D&G</h6>
            <h5>+79102730523 | jan_klod@mail.ru | vk.com/janklod</h5>
            <p class="review_text">Разнообразный и богатый опыт реализация намеченных плановых заданий играет важную роль
                в формировании направлений прогрессивного развития. Разнообразный и богатый опыт сложившаяся
                структура организации представляет собой интересный эксперимент проверки дальнейших направлений
                развития.</p>
        </div>

        <div class="review right">
            <img src="images/reviews/1.png" alt="">
            <h4>Жан-Клод Ван Дамм</h4>
            <h6>Приобрёл сумку D&G</h6>
            <h5>+79102730523 | jan_klod@mail.ru | vk.com/janklod</h5>
            <p class="review_text">Разнообразный и богатый опыт реализация намеченных плановых заданий играет важную роль
                в формировании направлений прогрессивного развития. Разнообразный и богатый опыт сложившаяся
                структура организации представляет собой интересный эксперимент проверки дальнейших направлений
                развития.</p>
        </div>
        -->

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
</body>
</html>