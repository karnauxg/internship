# internship

### Task 1: Git/GitHub
1. Created public repo
2. Configured git config
3. Pushed some files

### Task 2: AWS/Cloude
1. Cloud Services and Bare Metal.
* The main difference is that a bare metal server will use it’s own storage devices, with all the resources available for it. The cloud server uses shared storage. Cloud Services needs always online.
2. Region, Zone
* AWS has the concept of a Region, which is a physical location around the world where we cluster data centers. Each AWS Region consists of multiple, isolated, and physically separate AZs within a geographic area. An Availability Zone (AZ) is one or more discrete data centers with redundant power, networking, and connectivity in an AWS Region.
3. SSH connect to EC2.
* EC2 created in the same VPC with public subnet. SSH connect to EC2 instances via public IP address. SG also need allow ssh port - 22
4. SSH connect between EC2.
* SSH connect between EC2 needs ssh-keygen in one of them and copy public key to other one.
5. EC2 with nginx ( Configuration via AWS interface )
* Edit file /usr/share/nginx/html/index.html
* sudo systemctl start nginx
* check status used command - "$ systemctl status nginx "
* AWS SG open trafic for 80 port
* Check conect to my nginx-server from other EC2 use command - "$ curl <your_url> "
6. EXTRA task.
* Were created: 2 VPC, 2 SG, 2 Public Subnets, 2 EC2, 2 RT, 2 IGW, 1 pireeng conaction
* You can easily share the date and ping each other between in different the VPC
* Bach script install nginx and start service. Script can execute for EC2 like: instance settings-edit user data OR use command: ssh root@publicIP bash < installNginx.sh
