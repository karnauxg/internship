## Deploy via Helm
1. helm (delete/install) mysql-redmine charts/mysql/ -n redmine
2. helm install phpmyadmin charts/phpmyadmin/ -n redmine #(--dry-run --debug)



## Deploy via kubectl
1. kubectl apply -f yml/phpmyadmin/deployment.yml -n redmine
> kubectl apply -f yml/phpmyadmin/service.yml -n redmine






2. kubectl create -f ./secret.yaml -n redmine
3. helm dependency list charts/phpmyadmin


### Deploy Redmin
1. kubectl create namespace redmine
2. kubectl create deployment redmine-mysql --image=mysql:5.7

kubectl api-resources --namespaced=true / false
kubectl get pods --all-namespaces
kubectl -n kubernetes-dashboard edit service kubernetes-dashboard   (edit online resource)

sudo nano deployment.yml
    kubectl apply -f deployment.yml -n redmine
sudo nano service.yml
    kubectl apply -f service.yml -n redmine