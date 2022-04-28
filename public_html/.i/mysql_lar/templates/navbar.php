<?php
/**
 * Created by PhpStorm.
 * User: Yulia Laryushina
 * Date: 14.10.14
 * Time: 2:06
 */
echo '
<div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-8">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a href="/" class="navbar-brand">Оценка ресурсных затрат</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-8">
          <ul class="nav navbar-nav">
            <li class="active"><a href="/">Задачи</a></li>
            <li><a href=/?action=resource_table>Ресурсы</a></li>
            <li><a href=/?action=identificator_table>Дополнительные идентификаторы</a></li>
            <li><a href="/?action=add_task">Добавить задачу</a></li>
            <li><a href=/?action=add_resource>Добавить ресурс</a></li>
            <li><a href=/?action=add_identificator>Добавить дополнительный идентификатор</a></li>
          </ul>
        </div>
      </div>';