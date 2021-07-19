#!/bin/bash

# GITlink=https://github.com/redmine/redmine.git
GITlink=$1

echo '-----Git Clone-----'
git clone "$GITlink"

echo '-----Configure Redmine-----'
cat >~/redmine/config/database.yml <<EOL
production:
  adapter: mysql2
  database: redmine
  host: localhost
  username: redmine
  password: "redmine"
  # Use "utf8" instead of "utfmb4" for MySQL prior to 5.7.7
  encoding: utf8
EOL

echo "********* $PWD **********"
cd ~/redmine
echo '-----Create MySQL metadata-----'
echo "********* $PWD **********"
sudo apt-get install -y --no-install-recommends freetds-dev gcc libmariadbclient-dev libpq-dev libsqlite3-dev make patch
echo "********* $PWD **********"
bundle install --without development test
echo "********* $PWD **********"
bundle exec rake generate_secret_token
echo "********* $PWD **********"
RAILS_ENV=production bundle exec rake db:migrate
echo "********* $PWD **********"
bundle exec rake db:migrate RAILS_ENV="production"
echo "********* $PWD **********"
bundle exec rails server -u webrick -e production