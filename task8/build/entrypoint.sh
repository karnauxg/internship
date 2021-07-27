#!/bin/bash

r_env=$1

cd /var/redmine

echo "********* $r_env **********"
sudo bundle exec rails server -u webrick -e $r_env