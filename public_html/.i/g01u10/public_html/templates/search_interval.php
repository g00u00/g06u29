<?php
/**
 * Created by PhpStorm.
 * User: Yulia Laryushina
 * Date: 13.10.14
 * Time: 21:47
 */

if(isset($_GET['id'])){
    $attributes['type'] = 'identificator';
    $attributes['id'] = $_GET['id'];
}elseif(isset($_GET['type_id'])){
    $attributes['type'] = 'resource';
    $attributes['id'] = $_GET['type_id'];
}

if($_POST){
    $errors = validateForm();
    if(empty($errors)){
        $start = strtotime($_POST['start']);
        $end = strtotime($_POST['end']);
        if(isset($attributes)){
            $link = "/?action=interval_table&start="
                .$start."&end=".$end."&type=".$attributes['type']."&id=".$attributes['id'];
            header('Location: '.$link);
        }else{
            header('Location: '."/?action=interval_table&start=".$start."&end=".$end."&type=all");
        }
    }
    else{
        generateForm(null, $errors);
    }
}
else{
    generateForm();
}

function generateForm($attributes = null, $errors = null){
    $title = "";
    if($attributes){
        $title = getTitle($attributes['type'], $attributes['id']);
    }
    echo '
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">Поиск затрат'.$title.' за временной интервал</h3>
        </div>
    </div>
<form class="bs-example bs-example-form" method="post" action ='.$_SERVER['REQUEST_URI'].'>
    <div class="input-group giant-cell center-block">
        '.generateErrors('dates', $errors).'
    </div>
    <div class="input-group-btn giant-cell center-block"">
      <span class="input-group-addon">Введите начало и конец интервала</span>
      <input class="datetimepicker" name="start" type="text" >
      <input class="datetimepicker" name="end" type="text" >
    </div>
    <div class="input-group large-cell center-block">
      <input type="submit" class="form-control" value="Найти">
    </div>
  </form>
    </body>
            <script type="text/javascript" src="public_html/js/jquery.datetimepicker.js"></script>
            <link href="public_html/css/jquery.datetimepicker.css" media="screen" rel="stylesheet" type="text/css">
            <script>
                    jQuery(".datetimepicker").datetimepicker({
                    format:"Y-m-d H:i:s",
                    inline:true
                    });
            </script>';
}

function getTitle($alias, $id){
    if($alias=='resource'){
        return ' на ресурс №'.$id;
    }elseif($alias=='identificator'){
        return ' на дополнительный идентификатор №'.$id;
    }
    return ' на неизвестно что №'.$id;
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
    if(!$_POST['start']){
        $errors['dates'] = 'Введите начало/окончание интервала в красивых календариках снизу';
    }
    if(!$_POST['end']){
        $errors['dates'] = 'Введите начало/окончание интервала в красивых календариках снизу';
    }
    if($_POST['start'] && $_POST['end']){
        $start = DateTime::createFromFormat('Y-m-d H:i:s', $_POST['start']);
        $end = DateTime::createFromFormat('Y-m-d H:i:s', $_POST['end']);
        if($end < $start){
            $errors['dates'] = 'Сохраняйте логику!';
        }
    }
    return $errors;
}