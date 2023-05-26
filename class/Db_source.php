<?php
                            // Класс работы с базой данных через msqli

class Db_source
{

    private const HOST = 'localhost';
    private const USERNAME = 'mysql';
    private const PASSWORD = 'mysql';
    private const DATABASENAME = 'php_js_login_page';

    private $conn;

    function __construct()
    {
        $this->conn = $this->get_connection();
    }

    public function get_connection()
    {
        $conn = new \mysqli(self::HOST, self::USERNAME, self::PASSWORD, self::DATABASENAME);
        if (mysqli_connect_errno()) {
            trigger_error("Ошибка подключения к базе данных.");
        }
        
        $conn->set_charset("utf8");
        return $conn;
    }

    public function select($query, $param_type="", $param_array=array())
    {
        $stmt = $this->conn->prepare($query);
        
        if(!empty($param_type) && !empty($param_array)) {
            $this->bind_query_params($stmt, $param_type, $param_array);
        }
        
        $stmt->execute();
        $result = $stmt->get_result();
        
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $resultset[] = $row;
            }
        }
        
        if (! empty($resultset)) {
            return $resultset;
        }
    }
    
    public function insert($query, $param_type, $param_array)
    {
        print $query;
        $stmt = $this->conn->prepare($query);
        $this->bind_query_params($stmt, $param_type, $param_array);
        $stmt->execute();
        $insert_id = $stmt->insert_id;
        return $insert_id;
    }
    
    public function execute($query, $param_type="", $param_array=array())
    {
        $stmt = $this->conn->prepare($query);
        
        if(!empty($param_type) && !empty($param_array)) {
            $this->bind_query_params($stmt, $param_type, $param_array);
        }
        $stmt->execute();
    }

    public function bind_query_params($stmt, $param_type, $param_array)
    {
        $param_value_reference[] = & $param_type;
        for ($i = 0; $i < count($param_array); $i ++) {
            $param_value_reference[] = & $param_array[$i];
        }
        call_user_func_array(array(
            $stmt,
            'bind_param'
        ), $param_value_reference);
    }
    
    public function num_rows($query, $param_type="", $param_array=array())
    {
        $stmt = $this->conn->prepare($query);
        
        if(!empty($param_type) && !empty($param_array)) {
            $this->bind_query_params($stmt, $param_type, $param_array);
        }
        
        $stmt->execute();
        $stmt->store_result();
        $record_count = $stmt->num_rows;
        return $record_count;
    }
}