## Task 8: Finaly Project
### 1. CI (build code, docker build, test buils, pushToHub)
- docker build -t redminebuild --build-arg GITlink=https://github.com/redmine/redmine.git --build-arg redmineDB=redmine --build-arg redmineUSER=redmine --build-arg redminePASS=redmine .