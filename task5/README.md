### Task 5: Jenkins
1. Imperative Pipeline vs Declarative Pipeline.
* Императивный стиль - Это такой стиль программирования, при котором вы описываете, как добиться желаемого результата.
* Декларативный стиль - Это такой стиль, в котором вы описываете, какой именно результат вам нужен.
2. Install Jenkins in Docker 
- Create images use Dockerfile <docker build -t jenkins:v1 .>
- Run container with host's volume <docker run -d -p 8080:8080 -p 50000:50000 -v /home/ubuntu/task5/jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock --name jenkins jenkins:v1>
- add SSH privite key like jenkins credentions
- add two nodes. One node is - ES2(t2.micro), second is - EC2(t3.midium). Second node have role like jenkins-server, where open started jenkins and role like node inside jenkins
3. Ansible-playbook for install Jenkins - <ansibleInstallJenkinsV1.yml>
4. Local docker registry describe here - <https://www.dmosk.ru/miniinstruktions.php?mini=docker-local-repo>
- mkdir /dockerrepo
- docker run -d -p 5000:5000 --restart=always --name registry -v /dockerrepo:/var/lib/registry registry:2
- docker pull nginx:latest
- docker tag nginx:latest localhost:5000/nginx:latest
- docker push localhost:5000/nginx:latest
- ls /dockerrepo/docker/registry/v2/repositories
- docker pull localhost:5000/nginx:latest
5. Jenkinsfile for pull image from localRepo and run it. File situated in GitHub <Jenkinsfile>
6. Webhook GitHub and Jenkins