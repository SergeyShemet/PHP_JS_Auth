<?php       //Проверяем куки, проверяем соответствие сессии из БД, если всё правильно - отправляем данные.

require_once('class/User.php');
    
    if (isset($_COOKIE["logined_user_id"]) && isset ($_COOKIE["uuid"])) {
        $user = new User();
        $a = $user->get_user_by_id($_COOKIE["logined_user_id"]);
        $current_uuid = $_COOKIE["uuid"];
        $uuids = explode(",",$a["session_uuids"]);
        if (array_search($current_uuid, $uuids) > -1) {             
            echo json_encode($a);                                //если все параметры сошлись, то отправляем информацию о пользователе
            exit();
        }
    }

echo json_encode(["error" => "Новая сессия"]);