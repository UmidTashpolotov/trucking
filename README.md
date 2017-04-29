# Setup

* Версия ruby: 2.3.4

* Приложение использует PostgreSQL необходимо установить его перед использованием:
```
#!bash

apt-get update
apt-get install postgresql postgresql-contrib libpq-dev

```
* Ставим гемы
```
#!bash

bundle
```

* Обновляем конфигурацию БД

```
#!bash

cp config/database.yml.sample config/database.yml && nano config/database.yml
```

* Создаем базы для разработки и тестирования
```
#!bash

rake db:create && rake db:test:prepare
```
* Запускаем тесты
```
#!bash

cucumber
```
* Запускаемся
```
#!bash

rails s
```