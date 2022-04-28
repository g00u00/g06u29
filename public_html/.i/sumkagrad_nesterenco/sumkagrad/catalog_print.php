<?php
    function printItemsByFirm($dbc, $firmVal){
        switch ($firmVal) {
            case 'all':
                $query = "SELECT * FROM goods"; break;
            case 'top':
                $query = "SELECT * FROM goods where is_top='true'"; break;
            default:
                $query = "SELECT * FROM goods where firm = '$firmVal'"; break;
        }
                    
        $result = mysqli_query($dbc, $query)
            or die ($dbc->error);

        if($firmVal != 'all' && $firmVal != 'top')
            echo "<h2>". $firmVal ."</h2>";
        else if ($firmVal == 'all')
            echo "<h2>Все товары</h2>";

        if(mysqli_num_rows($result) == 0) {
            echo "<p>Раздел пуст</p>";
            return;
        }

        while($row = mysqli_fetch_array($result)){
            $element_id = "showMore(" . $row['id'] . ", \"$firmVal\")";

            echo "<div class='item'>";
            echo "<a href='images/items/" . $row['firm'] . "/" . $row['img'] . "' rel='lightbox'><img src='images/items/". $row['firm'] ."/" . $row['img'] .
                "'alt='' /></a>";
            echo "<h3 class='item_name'>" . $row['name'] . "</h3>";
            echo "<h3 class='item_firm'>" . $row['firm'] . "</h3>";
            echo "<div class='item_order_box'>";
            echo "<a href='#21' style='visibility: hidden;' class='item_more' onclick='" . $element_id . "'>подробнее</a>";
            echo "<a href='#21' class='item_order' onclick='showCallModal(\"" . $row['item_name'] . "\")'>заказать</a></div>";
            echo "<h4 class='item_cost'>" . $row['price'] . " руб.</h4></div>";
       }
        mysqli_close($dbc);
    }
?>