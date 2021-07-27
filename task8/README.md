## Task 8: Finaly Project
### 1. CI (build code, docker build, test buils, pushToHub)
- docker run -d --name redmine-mysql -e MYSQL_USER=redmine -e MYSQL_PASSWORD=secret -e MYSQL_DATABASE=redmineDB -e MYSQL_RANDOM_ROOT_PASSWORD=1 mysql:5.7

- docker build -t redmineweb:v1 --build-arg GITlink=https://github.com/redmine/redmine.git --build-arg redmineDB=redmineDB --build-arg redmineUSER=redmine --build-arg redminePASS=secret --build-arg dbhost=redmine-mysql --build-arg r_env=production .


# docker run -d -p 3000:3000 --name redminesrv --link redmine-mysql redmineweb:v1

docker run -d -p 3000:3000 --name redminesrv -e GITlink=https://github.com/redmine/redmine.git -e redmineDB=redmineDB -e redmineUSER=redmine -e redminePASS=secret -e dbhost=redmine-mysql -e r_env=production --link redmine-mysql 


