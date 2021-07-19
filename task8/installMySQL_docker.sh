#!/bin/bash

echo '-----Install MySQL-server-----'
apt-get update 
apt-get install -y mysql-server
# systemctl restart mysql
systemctl start mysql
echo "***status***"
systemctl status mysql
echo '-----Configure redmine and DB -----'
# createDB() {
#   echo -e 'HELL   -    \e[32m\e[m';
# }

# redmineDB=redmine
# redmineUSER=redmine
# redminePASS=redmine
redmineDB=$1
redmineUSER=$2
redminePASS=$3

readonly MYSQL=`which mysql`
echo "----------------"
echo "which mysql"
echo "$MYSQL"

# Construct the MySQL query
readonly Q1="CREATE DATABASE $redmineDB CHARACTER SET utf8mb4;"
readonly Q2="CREATE USER '$redmineUSER'@'localhost' IDENTIFIED WITH mysql_native_password BY '$redminePASS';"
readonly Q3="GRANT ALL PRIVILEGES ON $redmineUSER.* TO '$redmineUSER'@'localhost';"
readonly SQL="${Q1}${Q2}${Q3}"

# Do some parameter checking and bail if bad
# if [ $# -ne $EXPECTED_ARGS ]
# then
#   echo "Usage: $0 dbname dbuser dbpass"
#   exit $E_BADARGS
# fi
echo "*****************"
echo "$SQL"
echo "*****************"
# Run the actual command
# $MYSQL -e "$SQL"
$MYSQL -p$3 -u$2 -e "$SQL"

# Let the user know the database was created
# createDB "Database $redmineDB and user $redmineUSER created with a password $redminePASS"
