<?php
/**
 * Created by PhpStorm.
 * User: Yulia Laryushina
 * Date: 13.10.14
 * Time: 21:47
 */

$task = new Task();
/**
 * @var Task $current
 */
$current = $task->selectById($_GET['id']);


if($_POST){
    $errors = validateForm();
    if(empty($errors)){
        $task->updateRow($_GET['id'], iconv('utf-8', 'cp1251', $_POST['duration']), iconv('utf-8', 'cp1251', $_POST['title']), $_POST['start'], $_POST['end']);
        header('Location: '."/?action=task_table");
    }
    else{
        generateForm($errors, $current);
    }
}
else{
    generateForm(null, $current);
}

function generateForm($errors = null, $current = null){
    echo '
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">Изменить задачу (обязательные для изменения поля отмечены звездочкой)</h3>
        </div>
    </div>
<form class="bs-example bs-example-form" method="post" action ='.$_SERVER['REQUEST_URI'].'>
    <div class="input-group giant-cell center-block">
        '.generateErrors('dates', $errors).'
      <span class="input-group-addon">Введите новое название задачи</span>
      '.generateErrors('title', $errors).'
      <input type="text" class="form-control" name="title" value="'.$current->getTitle().'">
    </div>
    <div class="input-group-btn giant-cell center-block"">
      <span class="input-group-addon">Введите новое время начала и время окончания задачи(*)</span>
      <input class="datetimepicker" name="start" type="text" value="'.$current->getStart().'">
      <input class="datetimepicker" name="end" type="text" value="'.$current->getEnd().'">
    </div>
    <div class="input-group large-cell center-block">
      <input type="submit" class="form-control" value="Обновить">
    </div>
  </form>
    </body>
            <script type="text/javascript" src="public_html/js/jquery-1.11.1.min.js"></script>
            <script type="text/javascript" src="public_html/js/jquery.datetimepicker.js"></script>
            <link href="public_html/css/jquery.datetimepicker.css" media="screen" rel="stylesheet" type="text/css">
            <script>
                    jQuery(".datetimepicker").datetimepicker({
                    format:"Y-m-d H:i:s",
                    inline:true
                    });
            </script>';
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
    if(!$_POST['title']){
        $errors['title'] = 'Поле названия не должно быть пустым';
    }
    if(!$_POST['start']){
        $errors['dates'] = 'Введите даты начала/окончания в красивых календариках снизу';
    }
    if(!$_POST['end']){
        $errors['dates'] = 'Введите дату даты начала/окончания в красивых календариках снизу';
    }
    if($_POST['start'] && $_POST['end']){
        $start = DateTime::createFromFormat('Y-m-d H:i:s', $_POST['start']);
        $end = DateTime::createFromFormat('Y-m-d H:i:s', $_POST['end']);
        if($end < $start){
            $errors['dates'] = 'Задача не может начаться после того, как кончилась!';
        }
        else{
            $_POST['duration'] = date_diff($start, $end)->format('%a дн. %h ч.');
        }
    }
    return $errors;
}