login_btn.addEventListener("click", () => {                 //Проверяем ввод логина и пароля...
    let a = validate_login(); b = validate_password();      
    if (!a || !b) return;         //Сначала проверяем для показа обеих ошибок пустых окон ввода, если нет - выходим
    enable_login_spinner(true);
    try {
        login_check().then(user => {        //Асинхронный вызов проверки логина и пароля...
            if ('error' in user) {
                enable_login_spinner(false);
                document.getElementById('error_text').innerHTML = user.error;   // Пишем ошибку проверки логина
            } else {
                //Вход успешный
            let login_container = document.getElementById('login_container');
            login_container.style.opacity = "0"; 
            login_success(user);                                //вызываем анимацию окна
            } 
        }).catch(         //если какая-то ошибка в fetch....
            err => {
                document.getElementById('error_text').innerHTML = "Ошибка сети или БД...";
                enable_login_spinner(false);                
        });
    } catch (err) {
        console.log(err);
    }
})


async function login_check()    {           //Основная асинхронная функция ЛОГИНА для возврата объекта из БД
    document.getElementById('error_text').innerHTML="";
    var params = new FormData(login_form); 
    return fetch('login.php', { method: 'POST', body: params})          //fetch - это Promise, возвращаем.
    .then(res => res.json())
    .then((json) => { return json; })       
}

async function login_success(user) {            //Анимация окна авторизации и вызов карточки
    let modal = document.getElementById("login_success_container");
    await new Promise(resolve => setTimeout(resolve, 600));
    document.getElementById('login_container').style.display = "none";
    enable_login_spinner(false);
    document.getElementById("success_text").innerHTML = "Успешная авторизация.<br>Добро пожаловать, " + user.name + "!";
    modal.style.display = "block";
    await new Promise(resolve => setTimeout(resolve, 30));
    modal.style.opacity = "100";

    user.photo_url ?                                    // Пока показываем окошко приветствия - грузим фотку в браузер
            document.getElementById("card_img_url").src = user.photo_url 
        :   document.getElementById("card_img_url").src = "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png";

    await new Promise(resolve => setTimeout(resolve, 7000));
    modal.style.opacity = "0";
    await new Promise(resolve => setTimeout(resolve, 500));
    modal.style.display = "none";
    showcard(user);
}


async function showcard(user) {                 // присваиваем данные из БД и показываем карточку пользователя
    document.getElementById("name").innerHTML = user.name;
    document.getElementById("email").innerHTML = "E-mail: " + user.email;
    document.getElementById("date_of_birth").innerHTML = "Дата рождения: " + date_format(user.date_of_birth);
    user.photo_url ?
            document.getElementById("card_img_url").src = user.photo_url 
        :   document.getElementById("card_img_url").src = "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png";
    let card = document.getElementById("profile_card");
    card.style.display = "flex";
    await new Promise(resolve => setTimeout(resolve, 30));
    card.style.opacity = "100";
}


document.getElementById('pass').addEventListener('keyup', function(event) {         //Обработка Enter при вводе пароля
    if (event.code === 'Enter') {
      document.getElementById('login_btn').click();
    }
 });


logout_btn.addEventListener("click", () => {        //Нажата кнопка выхода из аккаунта
    fetch('logout.php').then(() => { 
        close_card_show_login();
   });
})


async function close_card_show_login() {                        //Убираем карточку пользователя
    let card = document.getElementById("profile_card");     
        card.style.opacity = "0"
        document.getElementById('login_container').style.opacity = "0";
        await new Promise(resolve => setTimeout(resolve, 1000));    //Ждём секунду
        card.style.display = "none";                                //удаляем карту
        document.getElementById('username').value = "";             //Сбрасываем настройки окна логина
        document.getElementById('pass').value = "";
        //location.reload();                //Перезагружаем страницу / Показываем логин
        show_login();
}


async function show_login() {                       //Показываем окно логина
    document.getElementById('login_container').style.margin = "20px"; 
    document.getElementById('login_container').style.display = "flex";
    await new Promise(resolve => setTimeout(resolve, 30));
    document.getElementById('login_container').style.opacity = "100";
}



async function init_check() {                             //Инициализация на старте - сразу же запрос в бекэнд на проверку куков и отправку данных
    fetch('get_info.php').then(res => res.json()).then(user => {        //Асинхронный вызов...
        if ('error' in user) { 
                                //Если новая сессия, вернётся error
            show_login();                      //Показываем окно логина
        } else {
            showcard(user);                                //Если вернулась инфо о пользователе - вызов окна с инфой
        } 
    }).catch(         //если какая-то ошибка в fetch....
        err => {
            document.getElementById('system_error').innerHTML = "Ошибка. Проверьте подключение к БД или PHP-сервер!<br>"+err;               
    });
}

function validate_login() {                                 //Подтверждение логина/пароля
    let i = document.getElementById('login_validate')
    if (document.getElementById('username').value == '') {
        i.style.margin = "-5px 2px 0 2px"
        return false;
    } else {
        i.style.margin = "-25px 2px 0 2px"
        return true;
    }
}

function validate_password() {
    let i = document.getElementById('pass_validate')
    if (document.getElementById('pass').value == '') {
        i.style.margin = "-5px 2px 0 2px"
        return false;
    } else {
        i.style.margin = "-25px 2px 0 2px"
        document.getElementById('error_text').innerHTML=""; //Убираем ошибку при вводе пароля
        return true;
    }
}

function enable_login_spinner(status) {                     //Меняем статус спиннера при загрузке
    let aa = document.getElementById("login_btn");
    if (status) {
        aa.innerHTML = '<div class="lds-ellipsis"><div></div><div></div><div></div><div></div></div>';
    } else {
        aa.innerHTML = '<button type="button" id="login_button" class="enter_btn">Войти</button>';
    }

}

function date_format(date) {                        //Форматируем MySQL дату
    let d = new Date(date);
    return d.getDate() + '.' + (d.getMonth()+1) + '.' + d.getFullYear();
}


init_check()            //Стартуем с запроса в бекэнд...