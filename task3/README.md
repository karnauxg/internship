### Task 3: Docker/Docker-Compose
1. Extra. Bash script for installing Docker - *installDocker.sh*
2. Main docker command - *DockerCommands.txt*
* 2.1 Dockerfile with edited html page and paste some text. 
> docker run -d -p 8080:80 --name my-nginx nginx
>> docker exec -it my-nginx bash
>>> echo "ivoyt Sandbox 2021" >/usr/share/nginx/html/index.html 
>>>> curl localhost:8080
3. Create your Dockerfile from clear basic images. Print environment variable with the value on a web page in run time - *Dockerfile*
> docker build -t mywebapp:v1 .  OR   docker build -t name:tag --build-arg HTTP_PROXY=http://10.20.30.2:1234  OR  docker build -t mybuildimage --target build-env .
>> docker run -e DEVOPS='YourName'  -d -p 8080:80 --name mywebapp mywebapp:v1 
>>> OR docker run -d --rm -p 8080:80 --name mywebapp mywebapp:v1 
4. Push my image to DockerHub
> docker login
>> docker tag <existing-image> <hub-user>/<repo-name>[:<tag>]
>>> docker push <hub-user>/<repo-name>:<tag>
5. Create docker-compose file with a separate configure file <docker-compose.yml>. Configure file - <envConfig>
> <docker-compose up --scale webpages=5 -d>  OR <docker-compose up -d>
