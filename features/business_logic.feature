# language: ru

Функционал: Тестирование бизнесс процесса в приложении

  Сценарий: Новые заказы создаются в статусе "open"
    Если клиент создал новый заказ
    То заказ отображается в статусе "open"

  Сценарий: Удалённые заказы переходят в статус "closed"
    Если клиент решил удалить созданный заказ
    То заказ отображается в статусе "closed"

  Сценарий: Если клиент выбрал перевозчика заказ меняет статус на "in_progress"
    Если клиент одобрил предложение перевозчика
    То заказ отображается в статусе "in_progress"

  Сценарий: Оба участника сделки могут её завершить
    Если перевозчик с заказчиком договорились о выполнении работы
    И заказчик завершает заказ
    То заказ отображается в статусе "completed"

  Сценарий: Оба участника сделки могут её завершить
    Если перевозчик с заказчиком договорились о выполнении работы
    И перевозчик завершает заказ
    То заказ отображается в статусе "completed"
