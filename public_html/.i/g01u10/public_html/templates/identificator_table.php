<?php
/**
 * Created by PhpStorm.
 * User: Yulia Laryushina
 * Date: 20.10.14
 * Time: 1:07
 */
$resources = new Resource();
$resource_list = $resources->fetchAll();

echo '
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">Список всех дополнительных идентификаторов</h3>
        </div>
    </div>
    <button type="button" class="btn btn-default" onclick="location.href=\'/?action=show_interval\'">
        <span class="glyphicon glyphicon-search"></span> Найти информацию за временной интервал
    </button>
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
    /**
     * @var Resource $resource
     */
    foreach($resource_list as $resource){
        if($type === $resource->getType()){
            $adding.=
                '<tr>
                    <td class="small-cell cell">'.$resource->getId().'</td>
            <td class="giant-cell cell"">'.setResourceHref($resource->getId(), $resource->getTitle(), 'partial').'</td>
            <td class="large-cell cell">'.setResourceHref($resource->getTypeId(), $resource->getName(), 'common').'</td>
            <td class="middle-cell cell">'.$resource->getPrice().'</td>
            <td class="middle-cell cell">'.$resource->getUnit().'</td>
            <td class="cell">
                <a href="/?action=show_interval&id='.$resource->getId().'">Получить информацию за временной интервал</a><br>
                <a href="/?action=edit_identificator&id='.$resource->getId().'">Изменить идентификатор</a><br>
                <a class="pointer" onClick="askConfirmation('.$resource->getId().', \'identificator\')">Удалить идентификатор</a><br>
            </td>
        </tr>';
        }
    }
    return $adding;
}

function getHeadings(){
    return '<tr>
                <th class="cell">Номер</th>
                <th class="cell">Название идентификатора</th>
                <th class="cell">Название группы ресурсов</th>
                <th class="cell">Цена</th>
                <th class="cell">Единица измерения</th>
                <th class="cell">Дополнительно</th>
            </tr>';
}

function setResourceHref($id, $title, $mode){
    if($mode === 'common'){
        return '<a href="/?action=show_resource&type_id='.$id.'"> '.$title.'</a>';
    }
    return '<a href="/?action=show_resource&id='.$id.'"> '.$title.'</a>';
}