#!/bin/bash

set -e

package_name=${HOME}/${1}

# Остановка сервисов
sudo ./services_stop.sh

cd ~
mkdir -p old_build
mkdir -p web_app

tar -czvf ${HOME}/old_build/old_build.tar.gz ${HOME}/web_app/

cd web_app
tar -xvf ${HOME}/$package_name # Распаковка приложения
mkdir -p shared/sockets
mv config/database.yml.production config/database.yml
RAILS_ENV=production bundle install
RAILS_ENV=production rake db:setup
# sudo chmod -R 777 /home/trucking/web_app/

# Установка зависимостей
# Запуск миграций и свойственных для приложения конфигураций

# Запуск сервисов
sudo ./services_start.sh

# Зачистка, удаление этого скрипта и архива
