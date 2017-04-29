# language: ru

Функционал: Клиент создаёт и удаляет заказ
  Как клиент
  Я хочу иметь возможность создать и удалить заказ

  Сценарий: Клиент создаёт заказ
    Допустим я захожу на сайт как клиент с email "customer0@mail.com" password "qweqwe"
    Если я перейду на страницу создания заказа
    И заполню форму данными
      | from   | to | what   | cost    | desc    |
      | Бишкек | Ош | cocain | 100 000 | стелсом |
    И нажму на кнопку создать заказ
    То меня перенаправит на страницу моих заказов и я увижу там мой заказ
      | from   | to | what   | cost    | desc    |
      | Бишкек | Ош | cocain | 100 000 | стелсом |

  Сценарий: Клиент удаляет созданный заказ
    Допустим я нахожусь на странице просмотра заказа как клиент email "customer0@mail.com" password "qweqwe"
    Если у заказа статус open
    То я увижу кнопку удалить заказ
    Если я нажму кнопку удалить заказ
    То статус заказа перейдёт в closed