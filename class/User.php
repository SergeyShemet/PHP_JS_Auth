<?php
                        //Класс пользователя и его работа с базой данных
class User
{
    private $data_source;

    function __construct() {
        require_once('Db_source.php');
        $this->data_source = new Db_source();
    }

    function get_user_by_id($user_id) {

        $query = "SELECT * FROM users WHERE id = ?";
        $param_type = "i";
        $param_array = array($user_id);
        $user_result = $this->data_source->select($query, $param_type, $param_array);
        unset($user_result[0]["password"]); //Удаляем пароль из возвращаемого объекта
        return $user_result[0];
    }

    public function process_login($username, $password) {
        $query = "SELECT * FROM users WHERE username = ? OR email = ?";
        $param_array = array($username, $username);
        $param_type = "ss";
        $user_result = $this->data_source->select($query, $param_type, $param_array);
        if (!empty($user_result)) {
            $hashed_password = $user_result[0]["password"];
            if (password_verify($password, $hashed_password)) {
                                    // Здесь устанавливаем куки 
                unset($user_result[0]["password"]); //Удаляем пароль из возвращаемого объекта
                return $user_result[0]; // возвращаем объект пользователя с полной информацией
            }
        }
        return ['error' => 'Неправильное имя пользователя или пароль!'];
    }

    public function update_uuid($user_id, $uuid) {
        $a = $this->get_user_by_id($user_id);
        if ($a["session_uuids"] == "") {
            $uuids = [];   
        } else { 
            $uuids = explode(",",$a["session_uuids"]);
        }
        array_push($uuids, $uuid); //   добавляем свежий uuid в базу
        $final_uuids = implode(",",$uuids); //  Добавляем текущую сессию и записываем в БД

        $query = "UPDATE users SET session_uuids = ? WHERE id = ?";
        $param_array = array($final_uuids, $user_id);
        $param_type = "si";
        $this->data_source->execute($query, $param_type, $param_array);
    }

    public function delete_uuid($user_id, $uuid) {
        $a = $this->get_user_by_id($user_id);
        if ($a["session_uuids"] == "") {
            $uuids = [];   
        } else { 
            $uuids = explode(",",$a["session_uuids"]);
        }
        $uuids = array_diff($uuids, [$uuid]);   //  Удаляем текущую сессию и записываем в БД
        $final_uuids = implode(",",$uuids);

        $query = "UPDATE users SET session_uuids = ? WHERE id = ?";
        $param_array = array($final_uuids, $user_id);
        $param_type = "si";
        $this->data_source->execute($query, $param_type, $param_array);
    }

    public function generate_and_set_session_key($user) {

    }

}