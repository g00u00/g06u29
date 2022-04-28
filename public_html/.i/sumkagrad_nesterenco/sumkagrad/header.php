<?php
    $dbc = new mysqli('db4free.net', 'sumkagrad', '65F1gawX', 'sumkagrad');
    //$dbc = new mysqli('localhost', 'sumkagrad', '65F1gawX', 'sumkagrad');
    mysqli_query($dbc, "SET NAMES utf8");
    mysqli_query($dbc, "SET CHARACTER SET utf8");
?>
<a href="#12" id="he_call" onclick="showCallModal('Заказ звонка')"></a>
<div id="he_logo_left">
    <h1><a href="index.php">СумкаГрад</a></h1>
    <h2><a href="index.php">интернет-магазин сумок</a></h2>
</div>
<div id="he_logo_right">
    <h3>8-916-747-777-8</h3>
    <h3>8-925-488-588-1</h3>
</div>
<div id="main_menu">
    <?php
        $requestedFile = substr($_SERVER['SCRIPT_NAME'], strrpos($_SERVER['SCRIPT_NAME'], '/') + 1);
    ?>
    <ul>
        <li class="<?php if($requestedFile == 'about.php') echo 'selected'?>"><a href="about.php">О нас</a></li>
        <li class="<?php if($requestedFile == 'catalog.php') echo 'selected'?>"><a href="catalog.php">Каталог</a></li>
        <li class="<?php if($requestedFile == 'reviews.php') echo 'selected'?>"><a href="reviews.php">Отзывы</a></li>
        <li class="<?php if($requestedFile == 'warranty.php') echo 'selected'?>"><a href="warranty.php">Гарантия</a></li>
        <li class="<?php if($requestedFile == 'delivery.php') echo 'selected'?>"><a href="delivery.php">Доставка-Оплата</a></li>
        <li class="<?php if($requestedFile == 'contacts.php') echo 'selected'?>"><a href="contacts.php">Контакты</a></li>
    </ul>
</div>