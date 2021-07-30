## Task 8: Create cluster
doc - https://www.digitalocean.com/community/tutorials/how-to-create-a-kubernetes-cluster-using-kubeadm-on-ubuntu-18-04-ru

1. hosts - hosts our cluster 
2. initial.yml  -  rules for connect to hosts (create user,right,ssh-key)
3. kube-dependencies.yml  - k8s cluster's dependencies (docker, kebeadm, kebectl, kebelet)
4. master.yml - Configure master node
5. workers.yml - Configure worker nodes
-  ansible-playbook /home/ivoitukh/my/Exadel/internship/task8/cluster/kube-dependencies.yml -u ubuntu -i /home/ivoitukh/my/Exadel/internship/task8/cluster/hosts --private-key=/home/ivoitukh/instructure/key/k8s.pem
- ansible-playbook /home/ivoitukh/my/Exadel/internship/task8/cluster/kube-dependencies.yml --tags "service" -u ubuntu -i /home/ivoitukh/my/Exadel/internship/task8/cluster/hosts --private-key=/home/ivoitukh/instructure/key/k8s.pem


### deploy dashboard 
https://github.com/kubernetes/dashboard
To get assecc from outside (NodePort) - https://github.com/kubernetes/dashboard/blob/master/docs/user/accessing-dashboard/README.md

1. kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.3.1/aio/deploy/recommended.yaml
- kubectl get pods -A
- kubectl -n kubernetes-dashboard get secret
- kubectl -n kube-system describe secrets namespace-controller-token-r6nnh


### Deploy Redmin
1. kubectl create namespace redmine
2. kubectl create deployment redmine-mysql --image=mysql:5.7

kubectl api-resources --namespaced=true / false
kubectl get pods --all-namespaces
kubectl -n kubernetes-dashboard edit service kubernetes-dashboard   (edit online resource)