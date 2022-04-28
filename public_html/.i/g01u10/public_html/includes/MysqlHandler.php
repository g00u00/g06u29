<?php
/**
 * Created by PhpStorm.
 * User: Yulia Laryushina
 * Date: 08.10.14
 * Time: 22:19
 */

class MysqlHandler {

    protected $_host = DB_HOST;
    protected $_user = DB_USER;
    protected $_pwws = DB_PWWS;
    protected $_db = DB_NAME;

    /**
     * @var mysqli
     */
    protected $_adapter;

    protected $_table = 'resource';

    protected $_class;

    public function __construct(){

        $this->_class = get_class($this);
        try{
            if(!$this->_adapter){
                $this->_adapter = new mysqli($this->_host, $this->_user, $this->_pwws, $this->_db);
                $this->_adapter->set_charset('cp1251');
            }
        }catch (Exception $e){
            $this->writeLog('Ошибка подключения.'.$e->getMessage());
            die();
        }
        $this->writeLog('Соединение установлено... ' . mysqli_get_host_info($this->_adapter) . "\n");
    }

    public function closeConnection(){
        $this->_adapter->close();
        echo 'Соединение закрыто.';
    }

    public function getTable(){
        return $this->_table;
    }

    public function getClass(){
        return $this->_class;
    }

    public function select(){
        $stmt = 'SELECT * FROM '.$this->_table;
        if ($result = $this->_adapter->query($stmt)){
            while ($obj = $result->fetch_object($this->_class)) {
                $values[] = $obj;
            }
            return $values;
        }
        return 'Не могу получить значения';
    }

    public function selectById($id){
        $stmt = 'SELECT * FROM '.$this->_table.' where id = '. $id;
        if($result = $this->_adapter->query($stmt)){
            $value = $result->fetch_object($this->_class);
            return $value;
        }
        return 'Не могу получить значение';
    }

    public function deleteById($id){
        $stmt = 'DELETE FROM '.$this->_table.' where id = '. $id;
        if(!$result = $this->_adapter->query($stmt)){
            return 'Не могу получить значение';
        }
    }

    public function writeLog($string){
        $fp = fopen("public_html/log/error.log", "a+");
        fwrite($fp, $string);
        fclose($fp);
    }

} 