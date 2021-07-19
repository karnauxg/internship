### Run Jenkins
1. Create images use Dockerfile <docker build -t jenkins:v1 .>
2. Run container with host's volume <docker run -d -p 8080:8080 -p 50000:50000 -v /home/ubuntu/task8/jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock --name jenkins jenkins:v1>
- add SSH privite key like jenkins credentions

### Local docker registry
- mkdir /dockerrepo
- docker run -d -p 5000:5000 --restart=always --name registry -v /dockerrepo:/var/lib/registry registry:2
- docker pull nginx:latest
- docker tag nginx:latest localhost:5000/nginx:latest
- docker push localhost:5000/nginx:latest
- ls /dockerrepo/docker/registry/v2/repositories
- docker pull localhost:5000/nginx:latest

3. Add slave as Docker Container
- main options are <AgentAsDockerContainer.jpg>

4. Add slave as SSH Docker Container
- run container <docker run -d --rm --name=agent1 -p 22:22 -e "JENKINS_AGENT_SSH_PUBKEY=[your-public-key]" jenkins/ssh-agent:alpine>
- you need indentify IP address's containers, I use command <docker exec -it <your ID runing containers> sh> AND  <hostname -i>
