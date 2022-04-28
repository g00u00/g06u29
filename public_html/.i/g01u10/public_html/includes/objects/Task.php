<?php
/**
 * Created by PhpStorm.
 * User: Yulia Laryushina
 * Date: 09.10.14
 * Time: 23:19
 */

class Task extends MysqlHandler{

    protected $_table = 'tasks';

    public function getId(){
        return $this->id;
    }

    public function getDuration(){
        return iconv('cp1251', 'utf-8', $this->duration);
    }

    public function getTitle(){
        return iconv('cp1251', 'utf-8', $this->title);
    }

    public function getStart(){
        return $this->date_start;
    }

    public function getEnd(){
        return $this->date_end;
    }

    public function selectByInterval($start, $end){
        $stmt = 'SELECT * FROM '.$this->_table.'
                where date_start > "'.$start.'"
                and date_end < "'.$end.'"';
        if ($result = $this->_adapter->query($stmt)){
            while ($obj = $result->fetch_object($this->_class)) {
                $values[] = $obj;
            }
            if(empty($values)){
                return 'В указанный интервал ни одна задача не была завершена';
            }
            return $values;
        }
        return 'Не могу получить значения';
    }

    public function getSum(){
        $resource = new Resource();
        $connection = new Task_resource();

        $sum = 0;

        $stmt = 'SELECT * FROM '.$this->_table.'
                  join '.$connection->getTable().' on '.$this->_table.'.id = '.$connection->getTable().'.id_task
                  join '.$resource->getTable().' on '.$resource->getTable().'.id = '.$connection->getTable().'.id_resource
                  where '.$this->_table.'.id = '.$this->getId().'';
        if ($result = $this->_adapter->query($stmt)){
            while ($obj = $result->fetch_object()) {
                $sum += $obj->quantity*$obj->price;
            }

        }
        return $sum;
    }

    public function saveRow($duration, $title, $start, $end){
        $stmt = "INSERT INTO ".$this->getTable()."
            (`duration`, `title`, `date_start`, `date_end`)
            VALUES ('".$duration."', '".$title."', '".$start."', '".$end."')";
        if(!$this->_adapter->query($stmt)){
            return 'Не могу создать задачу';
        }
    }

    public function updateRow($id, $duration, $title, $start, $end){
        $stmt = "UPDATE ".$this->getTable()."
            SET `duration` = '".$duration."',
                `title` = '".$title."',
                `date_start` = '".$start."',
                `date_end` = '".$end."'
            where id=".$id;
        if(!$this->_adapter->query($stmt)){
            return 'Не могу обновить задачу';
        }
    }

    public function deleteById($id){
        $stmt = 'DELETE FROM '.$this->_table.' where id = '. $id;
        if(!$result = $this->_adapter->query($stmt)){
            return 'Не могу получить значение';
        }
        $connection = new Task_resource();
        $connection->deleteByTaskId($id);
    }
} 