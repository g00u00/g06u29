<?php
/**
 * Created by PhpStorm.
 * User: Yulia Laryushina
 * Date: 07.11.14
 * Time: 22:30
 */
$resource = new Resource_info();
$current = $resource->selectById($_GET['id']);

if($_POST){
    $errors = validateForm();
    if(empty($errors)){
        $resource->updateRow($_GET['id'], iconv('utf-8', 'cp1251', $_POST['name']), iconv('utf-8', 'cp1251', $_POST['unit']));
        header('Location: '."/?action=resource_table");
    }
    else{
        generateForm($errors, $current);
    }
}
else{
    generateForm(null, $current);
}

function generateForm($errors = null, $current){
    echo '
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">Изменить ресурс</h3>
        </div>
    </div>
<form class="bs-example bs-example-form" method="post" action ='.$_SERVER['REQUEST_URI'].'>
    <div class="input-group giant-cell center-block">
      <span class="input-group-addon">Введите новое название ресурса</span>
      '.generateErrors('name', $errors).'
      <input type="text" class="form-control" name="name" value="'.$current->getName().'">
    </div>
    <div class="input-group giant-cell center-block">
      <span class="input-group-addon">Введите новую единицу измерения ресурса</span>
      '.generateErrors('unit', $errors).'
      <input type="text" class="form-control" name="unit" value="'.$current->getUnit().'">
    </div>
    <div class="input-group large-cell center-block">
      <input type="submit" class="form-control" value="Обновить">
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
    if(!$_POST['name']){
        $errors['name'] = 'Поле названия не должно быть пустым';
    }
    if(!$_POST['unit']){
        $errors['unit'] = 'Единица измерения должна быть указана';
    }
    return $errors;
}