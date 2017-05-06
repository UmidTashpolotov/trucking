# language: ru

Функционал: Управление пользователями
  Как администратор
  Я хочу иметь возможность управлять пользователями
  Чтобы добавлять, изменять и удалять пользователей

  Предыстория:
    Дано перевозчик с почтой "worker0@mail.com"
    Допустим в приложении есть администратор
    И он заходит в систему

  Сценарий: Создание пользователя:
    Если захожу на страницу добавления пользователя в админ панели
    И ввожу данные
      | email       | name  | surname | phone    | password | password_confirmation |
      | ppp@mail.ru | Peter | Jackson | 05554342 | qweqwe   | qweqwe                |
    Если нажму кнопку  Создать Пользователя
    То я увижу созданного водителя "Peter" на странице всех водителей

  Сценарий: Изменение данных пользователя
    Если нажимаю кнопку Edit напротив водителя "worker0@mail.com"
    И введу новые данные
      | email       | name  | surname | phone    |
      | qqq@mail.ru | Guffy | Dog     | 05wefd42 |
    Если я нажму кнопку Сохранить Пользователя
    То я увижу измененого водителя "Guffy" на странице всех водителей
  @javascript
  Сценарий: Удаления пользователя
    И нажимаю кнопку Удалить напротив водителя "worker0@mail.com"
    То я не увижу пользователя "worker0@mail.com" на странице всех водителей