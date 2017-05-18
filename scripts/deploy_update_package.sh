#!/usr/bin/env bash

set -e

host={1}
id_rsa_key_path=${2}
instance_name=${3}
build_number=${4}

package_name=trucking_${build_number}.tar.gz
package_name_path=${HOME}/artifacts/${package_name}

chmod 700 keys
chmod 600 ${id_rsa_key_path}

scp -i ${id_rsa_key_path} ${package_name_path} ${host}:~