### Task 4: Ansible
1. Configuration Management Systems - это способности определять инфраструктуру как код.
* использовать систему контроля версий для отслеживания любых изменений инфраструктуры
* повторно использовать скрипты конфигурирования для нескольких серверных сред,(разработки, тестирования, производства)
* упрощать процесс дублирования серверов для ускорения восстановления в случае сбоя системы
2. Преимущества и недостатки Ansible.
* Приемущества - Легкость в изучении (выполняется по шагах что помагает в траблшутинге), Написан на Python, Не нужно ставить клиента (работает по SSH), YAML плейбуки, Комьюнити Ansible Galaxy (паблик портал наработок)
* Недостатки - Проблемы с интерфейсом (UI), Нет работы с состоянием машин/процессов, Слабая поддержка совместимости с Windows, Поддержка крупного бизнеса, Новизна продукта
3. Jinja2 templating — это шаблонизатор для языка программирования Python. Он подобен шаблонизатору Django, но предоставляет Python-подобные выражения, обеспечивая исполнение шаблонов в песочнице. Это текстовый шаблонизатор, поэтому он может быть использован для создания любого вида разметки, а также исходного кода. Лицензирован под BSD лицензией. Шаблонизатор Jinja позволяет настраивать теги, фильтры, тесты и глобальные переменные. Также, в отличие от шаблонизатора Django, Jinja позволяет конструктору шаблонов вызывать функции с аргументами на объектах.
4. Configure file hosts <hosts>
* Check file inventory <ansible-inventory -i ./hosts --list -y>
5. Ping pong <ansible -i ~/my/Exadel/internship/task4/hosts all -m ping -u ubuntu --private-key=./key/key-pair.pem>
* You can define group from hosts param(-l) <ansible all -a "docker --version" -u ubuntu -i /home/yourUser/my/Exadel/internship/task4/hosts -l public --private-key=key/key-pair.pem> for run any command>
6. Install Docker.
* Create files <ansible-playbook ~/my/Exadel/internship/task4/installDocker.yml -u ubuntu -i /home/ivoitukh/my/Exadel/internship/task4/hosts --private-key=key/iv-key-pair.pem>
7. dynamic inventory: docs - https://aws.amazon.com/blogs/apn/getting-started-with-ansible-and-dynamic-amazon-ec2-inventory-management
8. LAMP/LEMP in docker
> <ansible-playbook ~/my/Exadel/internship/task4/installLEMPV1.yml -u ubuntu -i /home/my/Exadel/internship/task4/hosts --private-key=/home/instructure/key/key-pair.pem>