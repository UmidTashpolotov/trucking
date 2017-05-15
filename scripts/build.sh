#!/bin/bash

set -e

bundle install
rake db:migrate RAILS_ENV=test
cucumber --tags ~@todo