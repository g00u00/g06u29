<?php
/**
 * Created by PhpStorm.
 * User: Yulia Laryushina
 * Date: 13.10.14
 * Time: 21:46
 */
$task = new Task();
/**
 * @var Task $current
 */
echo '<script>
    var delete = confirm("Вы действительно хотите удалить задачу '.$_GET['id'].'?");
    alert("Удаляю");
</script>
</body>';
$current = $task->selectById($_GET['id']);