<?php
/**
 * Created by PhpStorm.
 * User: Yulia Laryushina
 * Date: 20.10.14
 * Time: 0:59
 */

$resource = new Resource();

if($_POST){
    $errors = validateForm();
    if(empty($errors)){
        $resource->saveRow(iconv('utf-8', 'cp1251', $_POST['name']), $_POST['price'], $_POST['resource']);
        include TEMPLATE_PATH.'identificator_table.php';
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
            <h3 class="panel-title">Добавить новый дополнительный идентификатор</h3>
        </div>
    </div>
<form class="bs-example bs-example-form" method="post" action ='.$_SERVER['REQUEST_URI'].'>
    <div class="input-group giant-cell center-block">
      <span class="input-group-addon">Введите название дополнительного идентификатора</span>
      '.generateErrors('name', $errors).'
      <input type="text" class="form-control" name="name" placeholder="Название дополнительного идентификатора">
    </div>
    <div class="input-group giant-cell center-block">
      <span class="input-group-addon">Введите цену дополнительного идентификатора</span>
      '.generateErrors('price', $errors).'
      <input type="text" class="form-control" name="price" placeholder="Цена(формат 4.2)">
    </div>
    <div class="input-group giant-cell center-block">
      <span class="input-group-addon">Выберите ресурс(к которому относится идентификатор)</span>
      <select name="resource">
            '.generateSelect().'
      </select>
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
    if(!$_POST['price']){
        $errors['price'] = 'Ресурс не может быть бесплатным';
    }
    if($price = $_POST['price']){
        $price = str_replace(',', '.', $price);
        if (!is_numeric($price)){
            $errors['price'] = 'Введите число в формате от 1 до 4 знаков до запятой, от 0 до 2х - после';
        }
        else{
            $parts = explode('.', $price);
            if(strlen($parts[0])<1){
                $errors['price'] = 'Знаков до запятой не меньше 1!';
            }
            if(strlen($parts[0])>6){
                $errors['price'] = 'Знаков до запятой не больше 4!';
            }
            if(array_key_exists('1', $parts)){
                if(strlen($parts[1])>2){
                    $errors['price'] = 'Знаков после запятой не больше 2!';
                }
            }
        }
    }
    return $errors;
}

function generateSelect(){
    $resources = new Resource_info();
    $list = $resources->fetchAll();
    $select = '<option disabled>Выберите ресурс</option>';
    foreach ($list as $resource){
        $select .= '<option value="'.$resource->getId().'">'.$resource->getName().'</option>';
    }
    return $select;
}