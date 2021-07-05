### Task 6: Databases
1. SQL / NoSQL Differences
- В отличие от SQL, в NoSQL вся информация хранится без четко установленной структуры и явных связей между всеми данными. Здесь хранятся не какие-то структурированные и четкие таблицы, а любые сведения, которые могут быть представлены в виде текстового документа, аудиофайла или публикации в интернете.
2. Run container with phpmyadmin and MySQL I used docker-compose (Everything in the compose folder).
- Ansible script  for install docker-compose and run containers <installCompose.yml>
- Command is <ansible-playbook /home/my/Exadel/internship/task6/installCompose.yml -u ubuntu -i /home/my/Exadel/internship/task6/hosts --private-key=/home/instructure/key/key-pair.pem>
3. Create tables and records <insertdata.sql>
- importantly!!! I used the field type to display the Cyrillic alphabet "utf8_general_ci"
- Import data via scripts OR Second way phpmyadmin-import-CSV(file)
4. Simple script for JOIN tables <selectjoin.sql>
5. Dump and Restore
> Export with PHPMyadmin
- Open phpMyAdmin.
- Select your database. Click the database name in the list on the left.
- Click the Export link. A new page appears to view the dump of database.
- In the Export area, click the Select All link to choose the tables in your database.
- In the SQL options area, click the appropriate options.
- Click the Save as file option and the corresponding compression option and then click the Go button. A dialog box should appear prompting you to save the file locally.
> Import using PHPMyAdmin
- Open phpMyAdmin.
- In the phpMyAdmin setup page, click Add to add your Azure Database for MySQL server. Provide the connection details and login information.
- Create an appropriately named database and select it on the left of the screen. To rewrite the existing database, click the database name, select all the check boxes beside the table names, and select Drop to delete the existing tables.
- Click the SQL link to show the page where you can type in SQL commands, or upload your SQL file.
- Use the browse button to find the database file.
- Click the Go button to export the backup, execute the SQL commands, and re-create your database.
6. Ansible role for install mySQL <playbook.yaml AND ./mysql>
- init ansible roles <ansible-galaxy init mysql>

7. Репликация - это механизм синхронизации содержимого нескольких копий объекта (например, содержимого базы данных). Репликация — это процесс, под которым понимается копирование данных из одного источника на другой (или на множество других) и наоборот. При репликации изменения, сделанные в одной копии объекта, могут быть распространены в другие копии.
Репликация делается автоматически, вам не надо делать вручную эскпорт, потом импорт.
<https://dev.mysql.com/doc/refman/5.6/en/replication.html>


