<?php
/**
 * Created by PhpStorm.
 * User: Yulia Laryushina
 * Date: 13.10.14
 * Time: 21:46
 */

$id = $_GET['id'];
$resources = new Resource();
$resource_list = $resources->selectByTaskId($id);
$task = new Task();
$current = $task->selectById($id);

echo '
    <div class="panel panel-primary">
        <div class="panel-heading">
            <p class="panel-title">Ресурсы для задачи "'.$current->getTitle().'" /номер '.$id.'</p>
            <p class="panel-title">Дата начала '.$current->getStart().'</p>
            <p class="panel-title">Дата окончания '.$current->getEnd().'</p>
            <p class="panel-title">Суммарные затраты '.$current->getSum().' руб.</p>
        </div>
        <button type="button" class="btn btn-default" onclick="location.href=\'/?action=add_resources&id='.$id.'\'">
            <span class="glyphicon glyphicon-plus"></span> Назначить ресурс
        </button>
        </a><br>
        <div class="panel-body">
            <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title cell">Материальные ресурсы</h3>
            </div>
            <div class="panel-body">
            <table class="table">
            <thead>
            <tr>
                '.getHeadings().'
            </tr>
            </thead>
            <tbody>
            '.generateFields($resource_list, '0').'
            </tbody>
            </table>
            </div>
            </div>
            <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title cell">Нематериальные ресурсы</h3>
            </div>
            <div class="panel-body">
            <table class="table">
            <thead>
            <tr>
                '.getHeadings().'
            </tr>
            </thead>
            <tbody>
            '.generateFields($resource_list, '1').'
            </tbody>
            </table>
            </div>
            </div>
        </div>
    </div>
    </body>';

function generateFields($resource_list, $type){
    $adding = '';
    $cost_sum = 0;
    if($resource_list){
    /**
     * @var Resource $resource
     */
    foreach($resource_list as $resource){
        if($type === $resource->getType()){
            $adding.=
        '<tr>
            <td class="small-cell cell">'.$resource->getIdResource().'</td>
            <td class="large-cell cell">'.setResourceHref($resource->getTypeId(), $resource->getName(), 'common').'</td>
            <td class="giant-cell cell"">'.setResourceHref($resource->getIdResource(), $resource->getTitle(), 'partial').'</td>
            <td class="middle-cell cell">'.$resource->getPrice().'</td>
            <td class="middle-cell cell">'.$resource->getUnit().'</td>
            <td class="small-cell cell">'.$resource->getQuantity().'</td>
            <td class="middle-cell cell">'.$resource->getCost().'</td>
            <td class="cell">
                <a class="pointer" onClick="deleteConnection('.$resource->getIdResource().','.$resource->getIdTask().')">
                    Удалить назначение</a><br>
            </td>
        </tr>';
            $cost_sum += $resource->getCost();
        }
    }
    $adding.=
        '<tr>
            <td colspan="8" class="right-oriented-cell"> Суммарные затраты на <u>'.$resource->getTypeName($type)
            .' </u> ресурсы составляют <b>'.$cost_sum.' руб. </b> </td>
        </tr>';
    }
    return $adding;
}

function getHeadings(){
    return '<tr>
                <th class="cell">Номер</th>
                <th class="cell">Название</th>
                <th class="cell">Дополнительный идентификатор</th>
                <th class="cell">Цена</th>
                <th class="cell">Единица измерения</th>
                <th class="cell">Количество</th>
                <th class="cell">Стоимость</th>
                <th class="cell">Действия</th>
            </tr>';
}

function setResourceHref($id, $title, $mode){
    if($mode === 'common'){
        return '<a href="/?action=show_resource&type_id='.$id.'"> '.$title.'</a>';
    }
    return '<a href="/?action=show_resource&id='.$id.'"> '.$title.'</a>';
}