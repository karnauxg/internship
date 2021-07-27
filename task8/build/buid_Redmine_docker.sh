#!/bin/bash

GITlink=$1
redmineDB=$2
redmineUSER=$3
redminePASS=$4
dbhost=$5
r_env=$6

# echo "**** CHECK ****"
# echo "GITlink=$GITlink"
# echo "redmineDB=$redmineDB"
# echo "redmineUSER=$redmineUSER"
# echo "redminePASS=$redminePASS"
# echo "dbhost=$dbhost"
# echo "r_env=$r_env"

echo '-----Git Clone-----'
git clone "$GITlink"

chmod 1777 /var/redmine

echo '-----Configure Redmine-----'
cat >/var/redmine/config/database.yml <<EOL
production:
  adapter: mysql2
  database: $redmineDB
  host: $dbhost
  username: $redmineUSER
  password: $redminePASS
  # Use "utf8" instead of "utfmb4" for MySQL prior to 5.7.7
  encoding: utf8
EOL

cd /var/redmine
sudo apt-get install -y --no-install-recommends freetds-dev gcc libmariadbclient-dev libpq-dev libsqlite3-dev make patch

gem install bundler
# bundle install --without development test
bundle config --local without "development test"

bundle update
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata
bundle exec rake generate_secret_token
RAILS_ENV=$r_env bundle exec rake db:migrate
# RAILS_ENV=production bundle exec rake redmine:load_default_data

