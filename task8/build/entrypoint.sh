#!/bin/bash

r_env=$1

redmineDB=$2
redmineUSER=$3
redminePASS=$4
dbhost=$5

echo "********* $redmineDB **********"
echo "********* $dbhost **********"

cd /var/redmine

cat >./config/database.yml <<EOL
production:
  adapter: mysql2
  database: $redmineDB
  host: $dbhost
  username: $redmineUSER
  password: $redminePASS
  # Use "utf8" instead of "utfmb4" for MySQL prior to 5.7.7
  encoding: utf8
EOL

echo "********* $r_env **********"
sudo bundle exec rails server -u webrick -e $r_env