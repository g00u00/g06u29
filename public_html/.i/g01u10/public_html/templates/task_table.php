<?php
/**
 * Created by PhpStorm.
 * User: Yulia Laryushina
 * Date: 08.10.14
 * Time: 20:31
 */

$tasks = new Task();
$result = $tasks->select();

echo '
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">Список всех задач</h3>
        </div>
    </div>
    <button type="button" class="btn btn-default" onclick="location.href=\'/?action=show_interval\'">
        <span class="glyphicon glyphicon-search"></span> Найти информацию за временной интервал
    </button>
    <table class="table">
        <thead>
        <tr>
            <th class="cell">Номер</th>
            <th class="cell">Название</th>
            <th class="cell">Дата и время начала</th>
            <th class="cell">Длительность</th>
            <th class="cell">Дата и время окончания</th>
            <th class="cell">Суммарная стоимость</th>
            <th class="cell">Дополнительно</th>
        </tr>
        </thead>
        <tbody>
        '.generateFields($result).'
        </tbody>
    </table>
    </body>';

function generateFields($result){
    $adding = '';
    $total_sum = 0;
    /**
     * @var Task $task
     */
    foreach($result as $number=>$task){
        $adding.='<tr>
            <td class="cell">'.$task->getId().'</td>
            <td class="cell">'.$task->getTitle().'</td>
            <td class="cell">'.$task->getStart().'</td>
            <td class="cell">'.$task->getDuration().'</td>
            <td class="cell">'.$task->getEnd().'</td>
            <td class="cell">'.$task->getSum().' руб.</td>
            <td class="cell">
                <a href="/?action=show_resources&id='.$task->getId().'">Посмотреть ресурсы</a><br>
                <a href="/?action=edit_task&id='.$task->getId().'">Редактировать задачу</a><br>
                <a href="/?action=add_resources&id='.$task->getId().'">Назначить ресурс</a><br>
                <a class="pointer" onClick="askConfirmation('.$task->getId().', \'task\')">Удалить задачу</a><br>
            </td>
          </tr>';
        $total_sum += $task->getSum();
    }
    $adding.=
        '<tr>
            <td colspan="8" class="right-oriented-cell"> Суммарные затраты на проект составляют <b>'.$total_sum.' руб. </b> </td>
        </tr>';
    return $adding;
}

