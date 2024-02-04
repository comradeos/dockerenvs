dotnet  -- .NET, платформа для разработки приложений от Microsoft  
python  -- Python, высокоуровневый язык программирования  
golang  -- Go, статически типизированный компилируемый язык программирования от Google  
php  -- PHP, скриптовый язык программирования, особенно эффективный для веб-разработки  
java  -- Java, объектно-ориентированный язык программирования  
nodejs  -- Node.js, платформа для выполнения JavaScript на сервере  
    
mysql  -- MySQL, система управления реляционными базами данных  
postgresql  -- PostgreSQL, объектно-реляционная система управления базами данных  
mongodb  -- MongoDB, NoSQL система управления базами данных  
    
rabbitmq  -- RabbitMQ, брокер сообщений для работы с протоколом AMQP  
  
<!---------------------------------------------------->

### MySQL CLI
  
mysql -u root -p  -- Вход в MySQL CLI как пользователь root  
  
SHOW DATABASES;  -- Показывает все базы данных  
  
CREATE DATABASE abc_db;  -- Создает новую базу данных с именем abc_db  
  
CREATE TABLE abc_db.table_1 (  -- Создает новую таблицу в базе данных abc_db  
    id INT NOT NULL AUTO_INCREMENT,  -- Поле id, автоинкрементное  
    name VARCHAR(100) NOT NULL,  -- Поле name, строковое  
    PRIMARY KEY (id)  -- id устанавливается как первичный ключ  
);  
  
USE abc_db;  -- Выбирает базу данных abc_db для дальнейшей работы  
  
SHOW TABLES;  -- Показывает все таблицы в выбранной базе данных  
  
INSERT INTO abc_db.table_1 (name) VALUES ('Example Name');  -- Вставляет новую запись в таблицу  
  
cd /var/lib/mysql  -- Переход в директорию /var/lib/mysql  
mkdir _backups  -- Создает новую директорию для резервных копий  
cd _backups/  -- Переход в директорию _backups/  
  
mysqldump -u root -p abc_db > backup2024020301.sql  -- Создает резервную копию базы данных abc_db  
  
mysql -u root -p abc_db < backup2024020301.sql  -- Восстанавливает базу данных abc_db из резервной копии  
  
split -b 1024 файл префикс  -- Разбивает файл резервной копии на части по 1 КБ  
cat префикс* > файл  -- Собирает файл резервной копии обратно из частей  
  
split -b 1024 backup2024020301.sql backup2024020301.sql_  -- Разбивает файл резервной копии на части по 1 КБ  
cat backup2024020301.sql_* > backup2024020301.sql  -- Собирает файл резервной копии обратно из частей  


### Postgres CLI

SELECT datname FROM pg_database; -- Показывает все базы данных  


### Mongodb CLI

mongosh -- Вход  

show dbs -- Показывает все базы данных  

use admin  

db.createUser(  
  {  
    user: "root",  
    pwd: "root",  
    roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]  
  }  
)  