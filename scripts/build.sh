#!/bin/bash

set -e

bundle install
rake db:test:prepare
rake db:migrate RAILS_ENV=test
cucumber --tags ~@todo