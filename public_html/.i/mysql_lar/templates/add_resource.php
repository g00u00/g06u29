<?php
/**
 * Created by PhpStorm.
 * User: Yulia Laryushina
 * Date: 20.10.14
 * Time: 0:59
 */

$resource = new Resource_info();

if($_POST){
    $errors = validateForm();
    if(empty($errors)){
        $resource->saveRow(iconv('utf-8', 'cp1251', $_POST['name']), iconv('utf-8', 'cp1251', $_POST['unit']), $_POST['type']);
        include TEMPLATE_PATH.'resource_table.php';
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
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">Добавить новый ресурс</h3>
        </div>
    </div>
<form class="bs-example bs-example-form" method="post" action ='.$_SERVER['REQUEST_URI'].'>
    <div class="input-group giant-cell center-block">
      <span class="input-group-addon">Введите название ресурса</span>
      '.generateErrors('name', $errors).'
      <input type="text" class="form-control" name="name" placeholder="Название ресурса">
    </div>
    <div class="input-group giant-cell center-block">
      <span class="input-group-addon">Введите единицу измерения ресурса</span>
      '.generateErrors('unit', $errors).'
      <input type="text" class="form-control" name="unit" placeholder="Единица измерения(штука, час, другое и тд)">
    </div>
    <div class="input-group giant-cell center-block">
      <span class="input-group-addon">Введите тип ресурса</span>
      <input type="radio" name="type" value="0"> Материальный<Br>
      <input type="radio" name="type" value="1"> Нематериальный<Br>
    </div>
    <div class="input-group large-cell center-block">
      <input type="submit" class="form-control" value="Создать">
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