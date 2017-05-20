#!/bin/bash

set -e

if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

project_root=${HOME}/web_app
instance_name=${1}
package_name=${HOME}/${2}

# Остановка сервисов
service unicorn_trucking stop

cd ~
mkdir -p old_builds

cd web_app
tar -czf ${HOME}/old_builds/trucking_previous.tar.gz . # Создание бекапа

cd ~
tar -xvzf $package_name -C web_app # Распаковка приложения
cd web_app
mkdir -p shared/sockets
mv config/database.yml.production config/database.yml
RAILS_ENV=production bundle install
RAILS_ENV=production rake db:setup

# Установка зависимостей
# Запуск миграций и свойственных для приложения конфигураций

# Запуск сервисов
service unicorn_trucking start

# Зачистка, удаление этого скрипта и архива
