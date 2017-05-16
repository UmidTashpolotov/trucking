#!/bin/bash

set -e

directory=pwd

mkdir -p ${directory}/artifacts

build_number=${1}

RAILS_ENV=production rake assets:precompile

echo ${build_number} > VERSION

tar -czf ${HOME}/artifacts/trucking_${build_number}.tar.gz \
--exclude=README.md \
--exclude=LICENSE \
--exclude=features \
--exclude=cucumber* \
--exclude=test \
--exclude=emul \
--exclude=.idea \
--exclude-vcs \
--exclude=*.log \
--exclude=shared/log/* \
--exclude=shared/pids/* \
--exclude=shared/sockets/* \
.