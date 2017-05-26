# language: ru

Функционал: : Пользователи оставляют друг другу отзывы
  Для того, чтобы у пользователей был рейтинг
  Я хочу иметь возможность оставлять отзыв
  В качестве водителя или клиента

  Предыстория:
    Дано в приложении есть заказчик
    И у заказчика есть заказ
    Также в приложении есть перевозчик
    И у перевозчика есть предложение с ценой "80 000"
    И заказчик выбрал предложение перевозчика
    И перевозчик выполнил работу

  @todo
  @wip
  @javascript
  Сценарий: Водитель оставляет отзыв о клиенте
    Тогда он заходит в систему
    И он перейдёт на страницу просмотра этого заказа
    И увидит форму оставления отзыва
    Если он оставит отзыв
    То отзыв будет виден в профиле того кому он его оставил

  @todo
  Сценарий: Клиент оставляет отзыв о водителе
