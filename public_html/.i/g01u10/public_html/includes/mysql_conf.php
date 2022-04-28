<?php
if(ENVIRONMENT === 'local'){
    $config = array(
        'host' => 'localhost',
        'user' => 'root',
        'pwws' => 'root',
        'db'   => 'resource_costs_assessment'
    );
}else{
    $config = array(
        'host' => 'localhost',
        'user' => 'g01u10',
        'pwws' => 'yl',
        'db'   => 'g01u10'
    );
};