### Run Jenkins
ansible-playbook ~/my/Exadel/internship/task8/ansible_playbook/install-docker.yml -u ubuntu -i /home/ivoitukh/my/Exadel/internship/task8/ansible_playbook/hosts --private-key=/home/ivoitukh/instructure/key/k8s.pem

> configure:
ansible-playbook ~/my/Exadel/internship/task8/ansible_playbook/install-docker.yml --tags "java" -u ubuntu -i /home/ivoitukh/my/Exadel/internship/task8/ansible_playbook/hosts --private-key=/home/ivoitukh/instructure/key/k8s.pem

