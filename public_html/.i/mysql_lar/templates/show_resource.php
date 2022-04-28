<?php
/**
 * Created by PhpStorm.
 * User: Yulia Laryushina
 * Date: 14.10.14
 * Time: 2:29
 */
 if(array_key_exists('id', $_GET)){
     $id = $_GET['id'];
     $resources = new Resource();
     $resource = $resources->selectById($id);
     $total_sum = $resources->requestTotal($id);
     $resourceTotal = $resources->getTotalCostIndicators($id);
 }
 else{
     $id = $_GET['type_id'];
     $resources = new Resource_info();
     $resource = $resources->selectById($id);
     $total_sum = $resources->requestTotal($id);
     $resourceTotal = $resources->getTotalCostIndicators($id);
}

echo '
    <div class="panel panel-primary">
        <div class="panel-heading">
            <p class="panel-title">Показатели для '.$resource->getStateR().' "'.$resource->getName().'" /номер '.$id.'</p>
        </div>
    </div>
    <div class="panel panel-body">
        <p> Общие затраты по '.$resource->getStateD().' "'.$resource->getName().'" в проекте составляют: <b>'.$total_sum['total'].
    ' руб.</b><p/>
        <p> '.$resource->getStateI().' "'.$resource->getName().'" расходуется на задачи:
        <table class="table">
            <thead>
            <tr>
                '.getHeadings().'
            </tr>
            </thead>
            <tbody>
            '.generateFields($resourceTotal).'
            </tbody>
            </table><p/>
    </div>';

function generateFields($resource_list){
    $adding = '';
    /**
     * @var Resource $resource
     */
    foreach($resource_list as $resource){
        $adding.=
        '<tr>
            <td class ="small-cell cell">'.$resource->getIdTask().'</td>
            <td class ="small-cell cell">'.setTaskHref($resource->getIdTask(), $resource->getTitle()).'</td>
            <td class ="small-cell cell">'.$resource->getQuantity().'</td>
            <td class ="small-cell cell">'.$resource->getPrice()*$resource->getQuantity().'</td>
        </tr>';
    }
    return $adding;
}

function getHeadings(){
    return '<tr>
                <th class="middle-cell cell">Номер</th>
                <th class="middle-cell cell">Название</th>
                <th class="middle-cell cell">Количество</th>
                <th class="middle-cell cell">Сумма затрат</th>
            </tr>';
}

function setTaskHref($id, $title){
    return '<a href="/?action=show_resources&id='.$id.'"> '.$title.'</a>';
}