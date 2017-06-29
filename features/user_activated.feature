# language: ru

Функционал: Водитель ожидает активации от администратора
  Как зарегестрировавшийся водитель
  Я не могу подать заявку
  Так как жду авторизации

  Сценарий: Активация перевозчика.
    Допустим в системе есть неактивированный перевозчик с номером "555777888"
    И он заходит в систему
    И он зайдет на страницу личного профиля
    То он увидит надпись "Не активирован"
    Допустим в приложении есть администратор
    И он заходит в систему
    Если он перейдет на страницу неактивированных пользователей, и нажмет кнопку активации перевозчика с номером "555777888"
    То перевозчик с номером "555777888" будет в списке активированных перевозчиков
    Допустим в систему вошел перевозчик с номером "996555777888" и паролем "qweqwe"
    Если он перейдет на страницу личного профиля 
    То он увидит свой статус как "Активирован"


