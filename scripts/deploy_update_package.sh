#!/bin/bash

set -e

# sh 0 $script 1 $ssh_remote_host 2 $keys_folder 3 $ssh_key 4 demo 5 $PACKAGE_BUILD_NUMBER

host=${1}
keys_folder=${2}
ssh_key=${3}
instance_name=${4}
build_number=${5}
package_name=trucking_${build_number}.tar.gz
package_name_path=${HOME}/artifacts/${package_name}

chmod 700 ${keys_folder}
chmod 600 ${ssh_key}

scp -i ${ssh_key} -p scripts/apply_update.sh ${host}:~
scp -i ${ssh_key} ${package_name_path} ${host}:~

ssh -i ${ssh_key} ${host} << EOL
chmod +x apply_update.sh
sudo ./apply_update.sh ${instance_name} ${package_name}
EOL