## Проект страницы авторизации и показа информации о пользователе

Демо доступно по адресу: http://f0823733.xsph.ru/php_js_auth/

### Установка:

- Импортируйте файл `CREATE_users.sql` в вашу базу данных MySQL. В нём содержатся данные о таблице `users`.
- Отредактируйте файл `class/Db_source.php` и впишите настройки вашей базы данных.
- Запустите.
- В качестве логина можно использовать `admin` или `admin@domain.com` или от `user1` до `user20`. Пароль у всех идентичный - `password`.

### Описание:

Страница написана на HTML/CSS/JS в качестве фронтенда. PHP используется как некий мини-API для обработки запросов к БД и работе с cookies.

На странице логина введены всевозможные проверки как перед процессом логина, так и после него.

В качестве макета используется некое подобие самописного SPA, позволяющее не перезагружать страницу при входе и выходе.

Реализована синхронизация и валидация coockies-сессий пользователя с базой данных, имеется возможность назависомого входа с нескольких устройств одновременно.

Реализована защита от подбора пароля путём запрета неправильного ввода чаще, чем в 10 секунд.

В базе данных имеется несколько индексов (id, уникальный логин, уникальный e-mail), но в данном случае используется только id пользователя.

Пароли в базе данных захэшированы с помощью bcrypt.