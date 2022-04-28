<?php
/**
 * Created by PhpStorm.
 * User: Yulia Laryushina
 * Date: 09.10.14
 * Time: 23:19
 */

class Resource_info extends MysqlHandler{

    protected $_table = 'resources_info';

    public function getId(){
        return $this->id;
    }

    public function getName(){
        return iconv('cp1251', 'utf-8', $this->name);
    }

    public function getUnit(){
        return iconv('cp1251', 'utf-8', $this->unit);
    }

    public function getType(){
        return $this->type;
    }

    public function getTotal(){
        return $this->total;
    }

    public function requestTotal($id, $tasks_ids = null){
        $resource = new Resource();
        $connection = new Task_resource();

        $stmt = 'SELECT SUM(price*quantity) as total FROM '.$resource->getTable().'
                  join '.$connection->getTable().' on '.$connection->getTable().'.id_resource='.$resource->getTable().'.id
                  join '.$this->getTable().' on '.$resource->getTable().'.resource_type='.$this->getTable().'.id
                  where '.$this->getTable().'.id='.$id;
        if($tasks_ids!==null){
            $stmt.=' and id_task in ('.$tasks_ids.')';
        }
        if($result = $this->_adapter->query($stmt)){
            $sum = $result->fetch_assoc();
            if(!$sum['total']){
                return array('total' => 0);
            }
            return $sum;
        }
        return 0;
    }

    public function getTotalCostIndicators($id, $tasks_ids = null){
        $connection = new Task_resource();
        $tasks = new Task();
        $resource = new Resource();

        $data = array();

        $stmt = 'SELECT '.$connection->getTable().'.id_task, title, price, quantity, '.$this->getTable().'.name FROM '.$resource->getTable().'
                join '.$connection->getTable().' on '.$connection->getTable().'.id_resource='.$resource->getTable().'.id
                join '.$tasks->getTable().' on '.$tasks->getTable().'.id='.$connection->getTable().'.id_task
                join '.$this->getTable().' on '.$this->getTable().'.id='.$resource->getTable().'.resource_type
                where '.$this->getTable().'.id='.$id;

        if($tasks_ids!==null){
            $stmt.=' and id_task in ('.$tasks_ids.')';
        }

        if($result = $this->_adapter->query($stmt)){
            while ($obj = $result->fetch_object($resource->getClass())) {
                $data[]=$obj;
            }
            return $data;
        }

        return 'Не могу получить значения';
    }

    public function updateRow($id, $name, $unit){
        $stmt = "UPDATE ".$this->getTable()."
            SET `name` = '".$name."',
                `unit` = '".$unit."'
            where id=".$id;
        if(!$this->_adapter->query($stmt)){
            return 'Не могу обновить ресурс';
        }
    }

    public function saveRow($name, $unit, $type){
        $stmt = "INSERT INTO ".$this->getTable()."
            (`name`, `unit`, `type`)
            VALUES ('".$name."', '".$unit."', '".$type."')";
        if(!$this->_adapter->query($stmt)){
            return 'Не могу создать ресурс';
        }
    }

    public function fetchAll(){

        $stmt = 'SELECT * FROM '.$this->_table;

        if($result = $this->_adapter->query($stmt)){
            while ($obj = $result->fetch_object($this->_class)) {
                $data[]=$obj;
            }
            return $data;
        }

        return 'Не могу получить значения';
    }

    public function getStateR(){
        return "ресурса";
    }

    public function getStateD(){
        return "ресурсу";
    }

    public function getStateI(){
        return "Ресурс";
    }
} 