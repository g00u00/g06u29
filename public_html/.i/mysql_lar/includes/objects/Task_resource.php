<?php
/**
 * Created by PhpStorm.
 * User: Yulia Laryushina
 * Date: 09.10.14
 * Time: 23:19
 */

class Task_resource extends MysqlHandler{

    protected $_table = 'resource_task';

    public function getIdResource(){
        return $this->id_resource;
    }

    public function getIdTask(){
        return $this->id_task;
    }

    public function getQuantity(){
        return $this->quantity;
    }

    public function saveRow($res, $task, $quantity){
        $stmt = "SELECT * FROM ".$this->getTable()."
                where id_resource = $res AND id_task = $task";
        if($result = $this->_adapter->query($stmt)){
            $obj = $result->fetch_object($this->_class);
            if($obj){
                $stmt = "UPDATE ".$this->getTable()."
                        SET `quantity` = $quantity+$obj->quantity
                        WHERE id_resource = $res
                        AND id_task = $task";
            }
            else{
                $stmt = "INSERT INTO ".$this->getTable()."
                        (`id_resource`, `id_task`, `quantity`)
                        VALUES ($res, $task, $quantity)";
            }

        }
        if(!$this->_adapter->query($stmt)){
            return 'Не могу создать дополнительный идентификатор';
        }
    }

    public function deleteByIds($id_resource, $id_task){
        $stmt = 'DELETE FROM '.$this->_table.' where id_resource = '. $id_resource .' AND id_task = '. $id_task;
        if(!$result = $this->_adapter->query($stmt)){
            return 'Не могу получить значение';
        }
    }

} 