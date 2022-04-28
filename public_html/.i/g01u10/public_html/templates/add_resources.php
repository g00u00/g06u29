<?php
/**
 * Created by PhpStorm.
 * User: Yulia Laryushina
 * Date: 20.10.14
 * Time: 3:19
 */

$task_id = $_GET['id'];

$connection = new Task_resource();
$task = new Task();
$current = $task->selectById($task_id);

echo '    <div class="panel panel-primary">
        <div class="panel-heading">
            <p class="panel-title">Добавить дополнительные идентификаторы для задачи "
                '.$current->getTitle().'" /номер '.$task_id.'</p>
            <p class="panel-title">Дата начала '.$current->getStart().'</p>
            <p class="panel-title">Дата окончания '.$current->getEnd().'</p>
        </div>
        </div>';

if($_POST){
    $errors = validateForm();
    if(empty($errors)){
        $connection->saveRow($_POST['resource'], $task_id, $_POST['quantity']);
        header('Location: '."/?action=show_resources&id=".$task_id);
    }
    else{
        generateForm($errors);
    }
}
else{
    generateForm();
}

function generateForm($errors = null){
    echo '
<form class="bs-example bs-example-form" method="post" action ='.$_SERVER['REQUEST_URI'].'>
    <div class="input-group giant-cell center-block">
      <span class="input-group-addon">Выберите дополнительный идентификатор</span>
      <select name="resource">
            '.generateSelect().'
      </select>
    </div>
    <div class="input-group giant-cell center-block">
      <span class="input-group-addon">Введите количество</span>
      '.generateErrors('quantity', $errors).'
      <input type="text" class="form-control" name="quantity" placeholder="Количество(целое число)">
    </div>
    <div class="input-group large-cell center-block">
      <input type="submit" class="form-control" value="Добавить">
    </div>
  </form>
    </body>';
}

function generateErrors($name, $errors){
    if($errors){
        if(array_key_exists($name, $errors)){
            return '<span align="center">'.$errors[$name].'</span>';
        }
    }
}

function validateForm(){
    $errors = array();
    if(!$_POST['quantity']){
        $errors['quantity'] = 'Поле количества не должно быть пустым';
    }
    if($_POST['quantity']){
        if(!intval($_POST['quantity'])){
            $errors['quantity'] = 'Введите ЦЕЛОЕ число';
        }
    }
    return $errors;
}

function generateSelect(){
    $resource = new Resource();
    $list = $resource->fetchAll();
    $select = '<option disabled>Выберите дополнительный идентификатор</option>';
    foreach ($list as $resource){
        $select .= '<option value="'.$resource->getId().'">'.$resource->getTitle().'/'.$resource->getName().'(единица измерения: '.$resource->getUnit().')</option>';
    }
    return $select;
}