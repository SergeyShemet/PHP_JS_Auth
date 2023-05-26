<?php
                                        //Принимаем логин и пароль из POST и проверяем
require_once('class/User.php');
$user = new User();

                        //Проверка на подбор пароля.
                        //Проверяем секунды после последнего неудачного входа
if (isset($_COOKIE["last_login_time"])) {
    if (time() <= (int)($_COOKIE["last_login_time"]+10)) { //не чаще одной попытки раз в 10 секунд
            setcookie("last_login_time", time(), time()+60, "/");
            echo json_encode(["error" => "Слишком частые попытки входа! Попробуйте через 10 секунд."]);
            exit();
        }
    }


$a = $user->process_login($_POST["username"],$_POST["password"]);
if (!array_key_exists("error", $a)) {                //Если логин успешный и вернулись данные пользователя
    $uuid = uniqid();
    //вставляем уникальный ключ uniqid в базу данных к сессиям пользователя... 
    $user->update_uuid($a['id'], $uuid);

            //правда этот ключ может быть у десятков пользователей, подключившихся
                //в эту же миллисекунду, но они об этом знать не будут.
    setcookie("logined_user_id", $a["id"], time()+86400, "/");
    setcookie("uuid", $uuid, time()+86400, "/");

} else {        //Логин неверный - возвращаем ошибку
                //Выставляем куку времени для невозможности быстрого перебора паролей
                setcookie("last_login_time", time(), time()+60, "/");
}
echo json_encode($a);