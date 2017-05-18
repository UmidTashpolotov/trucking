#!/bin/sh

set -e

if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

project_root=${HOME}/web_app
instance_name=${1}
package_name=${2}

service nginx stop             # Остановка сервисов
service unicorn_trucking stop

# Создание бекапа
# Распаковка приложения
# Установка зависимостей
# Запуск миграций и свойственных для приложения конфигураций
service unicorn_trucking start  # Запуск сервисов
service nginx start
# Зачистка, удаление этого скрипта и архива



