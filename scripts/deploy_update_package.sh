#!/bin/bash

set -e

host=${1}
keys_folder={2}
ssh_key={3}

instance_name={4}
build_number={5}

package_name=trucking_${build_number}.tar.gz
package_path=/var/lib/jenkins/artifacts/${package_name}

script_name=apply_update.sh
script_path=/var/lib/jenkins/workspace/trucking/scripts/${script_name}

echo "chmod keys"
chmod 700 ${keys_folder}
chmod 600 ${ssh_key}

echo "copy script"
scp -i ${ssh_key} -p ${script_path} ${host}:~
echo "copy package"
scp -i ${ssh_key} ${package_path} ${host}:~
echo "copy complete"

ssh -i ${ssh_key} ${host} << EOL
chmod +x apply_update.sh
sudo ./apply_update.sh ${instance_name} ${package_name}
EOL