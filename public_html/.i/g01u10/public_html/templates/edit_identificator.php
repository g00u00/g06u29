<?php
/**
 * Created by PhpStorm.
 * User: Yulia Laryushina
 * Date: 07.11.14
 * Time: 22:31
 */
$resource = new Resource();
$current = $resource->selectById($_GET['id']);

if($_POST){
    $errors = validateForm();
    if(empty($errors)){
        $resource->updateRow($_GET['id'], iconv('utf-8', 'cp1251', $_POST['name']), $_POST['price']);
        header('Location: '."/?action=identificator_table");
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
            <h3 class="panel-title">Изменить дополнительный идентификатор</h3>
        </div>
    </div>
<form class="bs-example bs-example-form" method="post" action ='.$_SERVER['REQUEST_URI'].'>
    <div class="input-group giant-cell center-block">
      <span class="input-group-addon">Введите новое название дополнительного идентификатора</span>
      '.generateErrors('name', $errors).'
      <input type="text" class="form-control" name="name" value="'.$current->getName().'">
    </div>
    <div class="input-group giant-cell center-block">
      <span class="input-group-addon">Введите цену дополнительного идентификатора</span>
      '.generateErrors('price', $errors).'
      <input type="text" class="form-control" name="price" value="'.$current->getPrice().'">
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
    if(!$_POST['price']){
        $errors['price'] = 'Ресурс не может быть бесплатным';
    }
    if($price = $_POST['price']){
        $price = str_replace(',', '.', $price);
        $_POST['price'] = $price;
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