#!/bin/bash

set -e

mkdir -p /var/lib/jenkins/artifacts

build_number=${1}

RAILS_ENV=production rake assets:precompile

echo ${build_number} > VERSION

tar -czf ${HOME}/artifacts/trucking_${build_number}.tar.gz \
--exclude=README.md \
--exclude=LICENSE \
--exclude=features \
--exclude=cucumber* \
--exclude=test \
--exclude=./tmp \
--exclude=config/database.yml \
--exclude=emul \
--exclude=.idea \
--exclude-vcs \
--exclude=*.log \
--exclude=public/uploads/* \
--exclude=shared/log/* \
--exclude=shared/pids/* \
--exclude=shared/sockets/* \
.