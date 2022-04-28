<?php
/**
 * Created by PhpStorm.
 * User: Yulia Laryushina
 * Date: 14.10.14
 * Time: 2:29
 */
if(!isset($ids)){
    $ids = null;
}elseif($ids==='not_found'){
    $ids = 0;
}
if(isset($_GET['type'])){
    $type = $_GET['type'];
}else{
    $type = null;
}
 if(array_key_exists('type_id', $_GET)){
     $id = $_GET['type_id'];
     $r_type = 'resource';
     $resources = new Resource_info();
     $resource = $resources->selectById($id);
     $total_sum = $resources->requestTotal($id, $ids);
     $resourceTotal = $resources->getTotalCostIndicators($id, $ids);
     $link = '/?action=show_interval&type_id='.$resource->getId();
 }
 else{
     $id = $_GET['id'];
     $r_type = 'identificator';
     $resources = new Resource();
     $resource = $resources->selectById($id);
     $total_sum = $resources->requestTotal($id, $ids);
     $resourceTotal = $resources->getTotalCostIndicators($id, $ids);
     $link = '/?action=show_interval&id='.$resource->getId();
}

echo '
    <div class="panel panel-primary">
        <div class="panel-heading">
            <p class="panel-title">Показатели'.getSentence($type).' для '.$resource->getStateR().' "'.$resource->getName().'" /номер '.$id.'</p>
        </div>
    </div>
    <button type="button" class="btn btn-default"
        onclick="location.href=\''.$link.'\'">
        <span class="glyphicon glyphicon-search"></span> Найти информацию за временной интервал для '.$resource->getName().'
    </button>
    '.generateAddButton($r_type, $resource).'
    <div class="panel panel-body">
        <p> Общие затраты'.getSentence($type).' по '.$resource->getStateD().' "'.$resource->getName().'" в проекте составляют: <b>'.$total_sum['total'].
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

function getSentence($type){
    if($type){
        $start = new DateTime("@" .$_GET['start']);
        $end = new DateTime("@" .$_GET['end']);
        $start = $start->format('Y-m-d H:i:s');
        $end = $end->format('Y-m-d H:i:s');
        return ' за период с '.$start.' по '.$end;
    }
    else return '';
}

function generateAddButton($r_type, $resource){
    if($r_type === 'resource'){
        return '
    <button type="button" class="btn btn-default"
        onclick="location.href=\'/?action=add_identificator&id='.$resource->getId().'\'">
        <span class="glyphicon glyphicon-plus"></span> Добавить дополнительный идентификатор
    </button>';
    }else{
        return '';
    }
}