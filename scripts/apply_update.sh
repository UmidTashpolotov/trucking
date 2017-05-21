
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
tar -xvf $package_name # Распаковка приложения
mkdir -p shared/sockets
mv config/database.yml.production config/database.yml
RAILS_ENV=production bundle install
RAILS_ENV=production rake db:migrate

# Запуск сервисов
cd ~
sudo ./services_start.sh

rm $package_name
rm -- "$0"
