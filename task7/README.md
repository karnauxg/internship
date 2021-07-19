## Task 7: Logging&Monitoring. Big Brother.
### Zabbix-server in Docker (Min memory: 2Gb. Min CPU: 2. Min HDD: 15Gb. OS: CentOS 7x64)
- docs <https://www.zabbix.com/documentation/current/manual/installation/containers>
- install Docker and Docker-compose <task7/zabbixDocker/installDocker.sh>
- instal step-by-step scripts from <task7/zabbixDocker/1..5Dockerfile>

> Zabbix-agent
In order to run the Zabbix control panel, you will need a linux server with a recommend 2 CPU cores and 2GB of memory for a medium sized monitoring instance. The server will need a database software such as MySQL and Apache with PHP 5.4 or greater. 
- Step 1: Connect to SSH on the Monitoring Server <ssh root@ip-address>
- Step 2: Download the Zabbix Installation Files <wget https://repo.zabbix.com/zabbix/5.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_5.4-1+ubuntu$(lsb_release -rs)_all.deb>, <sudo dpkg -i zabbix-release_5.4-1+ubuntu$(lsb_release -rs)_all.deb>, <sudo apt-get update>
- Step 3: Install Zabbix server, frontend, and agent <sudo apt-get -y install zabbix-agent>
- sudo systemctl restart zabbix-agent 
- sudo systemctl enable zabbix-agent
- sudo systemctl start zabbix-agent
- sudo systemctl status zabbix-agent
- sudo nano /etc/zabbix/zabbix_agentd.conf
- cat /var/log/zabbix/zabbix_agentd.log

- https://bestmonitoringtools.com/how-to-install-zabbix-server-on-ubuntu/#Step_8_Optimizing_MySQL_MariaDB_database_optional
- install agent https://tecadmin.net/how-to-install-zabbix-agent-on-ubuntu-20-04/
- https://computingforgeeks.com/install-and-configure-zabbix-agent-on-ubuntu/
#### ANSIBLE zabbix <https://github.com/ansible-collections/community.zabbix>

### Grafana (Min memory: 255MB. Min CPU: 1)
- wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
- sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
- sudo apt update
- sudo apt install grafana
- sudo systemctl enable grafana-server
- sudo systemctl start grafana-server
- sudo systemctl status grafana-server
- open brauser <ip:3000> admin:admin
- for restore pass <grafana-cli admin reset-admin-password --homepath "/usr/share/grafana" новый_пароль>
- doc <https://selectel.ru/blog/install-and-setup-grafana/>
#### Ansible Grafana <https://github.com/cloudalchemy/ansible-grafana>

### ELK (Min memory: 8Gb. Min CPU: 2)
- sudo apt update
- sudo apt install openjdk-11-jdk
- wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
- sudo nano /etc/apt/sources.list.d/elastic.list   insert text "deb https://artifacts.elastic.co/packages/6.x/apt stable main"
- sudo apt install elasticsearch kibana
- sudo nano /etc/kibana/kibana.yml  insert text "server.host: "localhost""
- sudo systemctl restart kibana
- sudo systemctl start elasticsearch
- sudo apt install nginx
- echo "admin:`openssl passwd -apr1 YourPasswd`" | sudo tee -a /etc/nginx/htpasswd.kibana
- sudo rm -f /etc/nginx/sites-enabled/default
- sudo nano /etc/nginx/sites-available/kibana  insert text 
"server {
listen 80 default_server;
server_name kibana;
auth_basic "Restricted Access";
auth_basic_user_file /etc/nginx/htpasswd.kibana;
location / {
proxy_pass http://localhost:5601;
proxy_http_version 1.1;
proxy_set_header Upgrade $http_upgrade;
proxy_set_header Connection 'upgrade';
proxy_set_header Host $host;
proxy_cache_bypass $http_upgrade;
}
}"
- ln -s /etc/nginx/sites-available/kibana /etc/nginx/sites-enabled/kibana
- sudo nginx -t
- systemctl restart nginx
- systemctl enable nginx
- sudo ufw allow 'Nginx Full'
- sudo apt install ufw
- sudo ufw status verbose
- sudo ufw enable
- sudo ufw status
#### Ansible ELK <https://abeerm171.medium.com/automate-elk-installation-and-configuration-with-ansible-3e2cb785aef8>

