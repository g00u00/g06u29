<?php
if(strpos($_SERVER['HTTP_HOST'], 'marsh') !== false){
    define('ENVIRONMENT',   'local');
    define('TEMPLATE_PATH', 'public_html/templates/');
    define('INCLUDE_PATH',  'public_html/includes/');
}
else{
    define('ENVIRONMENT',   'production');
    define('TEMPLATE_PATH', 'templates/');
    define('INCLUDE_PATH',  'includes/');
}
    include_once INCLUDE_PATH.'includes.php';
    include_once TEMPLATE_PATH.'common.php';
    include_once TEMPLATE_PATH.'navbar.php';
    include_once INCLUDE_PATH.'mysql_conf.php';
    define('DB_HOST', $config['host']);
    define('DB_USER', $config['user']);
    define('DB_PWWS', $config['pwws']);
    define('DB_NAME', $config['db']);

    if(array_key_exists('action', $_GET)){
        switch($_GET['action']){
            case 'add_task':
                include TEMPLATE_PATH.'add_task.php';
                break;
            case 'show_resources':
                include TEMPLATE_PATH.'show_resources.php';
                break;
            case 'edit_task':
                include TEMPLATE_PATH.'edit_task.php';
                break;
            case 'edit_identificator':
                include TEMPLATE_PATH.'edit_identificator.php';
                break;
            case 'edit_resource':
                include TEMPLATE_PATH.'edit_resource.php';
                break;
            case 'show_resource':
                include TEMPLATE_PATH.'show_resource.php';
                break;
            case 'add_resource':
                include TEMPLATE_PATH.'add_resource.php';
                break;
            case 'add_resources':
                include TEMPLATE_PATH.'add_resources.php';
                break;
            case 'add_identificator':
                if(isset($_GET['id'])){
                    $id = $_GET['id'];
                }else{
                    $id = null;
                }
                include TEMPLATE_PATH.'add_identificator.php';
                break;
            case 'resource_table':
                include TEMPLATE_PATH.'resource_table.php';
                break;
            case 'identificator_table':
                include TEMPLATE_PATH.'identificator_table.php';
                break;
            case 'delete_task':
                $task = new Task();
                $id = $_GET['id'];
                $task->deleteById($id);
                header('Location: '."/");
                break;
            case 'delete_resource':
                $resource = new Resource_info();
                $id = $_GET['id'];
                $resource->deleteById($id);
                header('Location: '."/?action=resource_table");
                break;
            case 'delete_identificator':
                $resource = new Resource();
                $id = $_GET['id'];
                $resource->deleteById($id);
                header('Location: '."/?action=identificator_table");
                break;
            case 'delete_connection':
                $connection = new Task_resource();
                $id_resource = $_GET['id_r'];
                $id_task = $_GET['id_t'];
                $connection->deleteByIds($id_resource, $id_task);
                header('Location: '."/?action=show_resources&id=$id_task");
                break;
            case 'show_interval':
                include TEMPLATE_PATH.'search_interval.php';
                break;
            case 'interval_table':
                include TEMPLATE_PATH.'interval_table.php';
                break;
            default:
                include TEMPLATE_PATH.'task_table.php';
        }
    }
    else{
        include TEMPLATE_PATH.'task_table.php';
    }
?>