
### Build redmine
- docker run -d --name redmine-mysql -e MYSQL_USER=redmine -e MYSQL_PASSWORD=secret -e MYSQL_DATABASE=redmineDB -e MYSQL_RANDOM_ROOT_PASSWORD=1 mysql:5.7

- docker build -t redmineweb:v1 --build-arg GITlink=https://github.com/edavis10/redmine.git --build-arg redmineDB=redmineDB --build-arg redmineUSER=redmine --build-arg redminePASS=secret --build-arg dbhost=redmine-mysql --build-arg r_env=production .

- docker run -d -p 3000:3000 --name redminesrv -e r_env=production redmineweb:v1

build-arg:
GITlink - <your git link>
redmineDB - <name databases>
redmineUSER - <redmine user>
redminePASS - <redmine pass>
dbhost - <url DB server>
r_env - <production>
