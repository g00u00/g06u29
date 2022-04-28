<?php
/**
 * Created by PhpStorm.
 * User: Yulia Laryushina
 * Date: 09.10.14
 * Time: 23:19
 */

class Resource extends MysqlHandler{

    protected $_table = 'resource';

    public function getId(){
        return $this->id;
    }

    public function getName(){
        return iconv('cp1251', 'utf-8', $this->name);
    }

    public function getPrice(){
        return $this->price;
    }

    public function getType(){
        return $this->type;
    }

    public function getIdResource(){
        return $this->id_resource;
    }

    public function getUnit(){
        return iconv('cp1251', 'utf-8', $this->unit);
    }

    public function getQuantity(){
        return $this->quantity;
    }

    public function getResourceType(){
        return $this->resource_type;
    }

    public function getTitle(){
        return iconv('cp1251', 'utf-8', $this->title);
    }

    public function getCost(){
        return $this->quantity*$this->price;
    }

    public function getTypeName($type){
        if($type === '0'){return 'материальные';}
        return 'нематериальные';
    }

    public function getIdTask(){
        return $this->id_task;
    }

    public function getTypeId(){
        return $this->type_id;
    }

    public function selectByTaskId($id){
        $resource_info = new Resource_info();
        $connection = new Task_resource();

        $data = array();

        $stmt = 'SELECT id_resource, id_task, unit, price, quantity, type, '.$resource_info->getTable().'.id as type_id ,'.$this->_table.'.name as title, '.$resource_info->getTable().'.name FROM '.$this->_table.'
            join '.$connection->getTable().' on '.$this->_table.'.id = '.$connection->getTable().'.id_resource
            join '.$resource_info->getTable().' on '.$resource_info->getTable().'.id = '.$this->_table.'.resource_type
            where '.$connection->getTable().'.id_task = '.$id.'';

        if($result = $this->_adapter->query($stmt)){
            while ($obj = $result->fetch_object($this->_class)) {
                $data[]=$obj;
            }
            return $data;
        }

        return 'Не могу получить значения';
    }

    public function getTotalCostIndicators($id){
        $connection = new Task_resource();
        $tasks = new Task();

        $data = array();

        $stmt = 'SELECT '.$connection->getTable().'.id_task, title, price, quantity, name FROM '.$this->getTable().'
                join '.$connection->getTable().' on '.$connection->getTable().'.id_resource='.$this->getTable().'.id
                join '.$tasks->getTable().' on '.$tasks->getTable().'.id='.$connection->getTable().'.id_task
                where '.$this->getTable().'.id='.$id;

        if($result = $this->_adapter->query($stmt)){
            while ($obj = $result->fetch_object($this->_class)) {
                $data[]=$obj;
            }
            return $data;
        }

        return 'Не могу получить значения';
    }

    public function requestTotal($id){
        $connection = new Task_resource();
        $stmt = 'SELECT SUM(price*quantity) as total FROM '.$this->getTable().'
                 join '.$connection->getTable().' on '.$connection->getTable().'.id_resource='.$this->getTable().'.id
                 where '.$this->getTable().'.id='.$id;

        if($result = $this->_adapter->query($stmt)){
            $sum = $result->fetch_assoc();
            if(!$sum['total']){
                return array('total' => 0);
            }
            return $sum;
        }
        return 0;
    }

    public function saveRow($name, $price, $type){
        $stmt = "INSERT INTO ".$this->getTable()."
            (`name`, `price`, `resource_type`)
            VALUES ('".$name."', ".$price.", ".$type.")";
        if(!$this->_adapter->query($stmt)){
            return 'Не могу создать дополнительный идентификатор';
        }
    }

    public function fetchAll(){
        $resource_info = new Resource_info();

        $stmt = 'SELECT '.$this->_table.'.id, unit, price, type, '.$resource_info->getTable().'.id as type_id ,'.$this->_table.'.name as title, '.$resource_info->getTable().'.name FROM '.$this->_table.'
            join '.$resource_info->getTable().' on '.$resource_info->getTable().'.id = '.$this->_table.'.resource_type';

        if($result = $this->_adapter->query($stmt)){
            while ($obj = $result->fetch_object($this->_class)) {
                $data[]=$obj;
            }
            return $data;
        }

        return 'Не могу получить значения';
    }

    public function getStateR(){
        return "дополнительного идентификатора";
    }

    public function getStateD(){
        return "дополнительному идентификатору";
    }

    public function getStateI(){
        return "Дополнительный идентификатор";
    }

} 