<?php
    $item_id = $_GET['id'];
    $table = $_GET['table'];
    
    $dbc = mysqli_connect('malibu.beget.ru', 'russel28_db', '25844852', 'russel28_db')
        or die ('Cant connect to db');
    $query = "SELECT * FROM $table WHERE id = '" . $item_id . "'";
    mysqli_query($dbc, "SET NAMES utf8");
    mysqli_query($dbc, "SET CHARACTER SET utf8");
    
    $result = mysqli_query($dbc, $query)
        or die ('Cant select');
    $row = mysqli_fetch_array($result); 
    
    $take_it = "<div class='popup_img_container'>" .  "<a href='images/items/" . $_GET['table'] . "/" . $row['item_img'] .
        "' rel='lightbox[" . $row['id'] . "]'><img src='images/items/" . $_GET['table'] . "/" . $row['item_img'] . "'alt='' /></a>" .
    "<a class='popup_small_img_1' rel='lightbox[". $row['id']. "]' href='images/items/" . $_GET['table'] . "/full/" .
    $row['item_img_1_full'] . "'>" . 
    "<img src='images/items/" . $_GET['table'] . "/full/" . $row['item_img_1_full'] . "' alt=''' /></a>" . 
    
    "<a class='popup_small_img_2' rel='lightbox[". $row['id']. "]' href='images/items/" . $_GET['table'] . "/full/" .
    $row['item_img_2_full'] . "'>" . 
    "<img src='images/items/" . $_GET['table'] . "/full/" . $row['item_img_2_full'] . "' alt=''' /></a>" . "</div>";
    
    $take_it .= "<h1 class='popup_name'>" . $row['item_name'] . "</h1>" . 
    "<h1 class='popup_brand'>" . $row['item_firm'] . "</h1>";
    
    $take_it .= "<h2>Описание</h2>" . "<p>" . $row['item_description'] . "</p>";
    
    $benefits = explode('&', $row['item_benefits']);
    if ($benefits)
    {
        $take_it .= "<h2>Особенности</h2><ul>";
        foreach($benefits as $key=>$value){
            $take_it .= "<li>$value</li>";
        }
        $take_it .= "</ul>";
    }
    $take_it .= "<h4 class='popup_price'>" . $row['item_cost'] . " <span>руб.</span></h4>";
    $take_it .= "<a href='#21' class='popup_order' onclick='showCallModal(\"" . $row['item_name'] . "\")'>Заказать!</a>";
        
    echo "$take_it";
?>