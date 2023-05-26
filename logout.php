<?php 

require_once('class/User.php');

    if (isset($_COOKIE["logined_user_id"]) && isset ($_COOKIE["uuid"])) {
        $user = new User();
        $user->delete_uuid($_COOKIE["logined_user_id"], $_COOKIE["uuid"]);          //Удаляем uuid сессии из базы
    }
    setcookie("logined_user_id","999", time()-86400, "/");          //удаляем куки из браузера
    setcookie("uuid", "999", time()-86400, "/");