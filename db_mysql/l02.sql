/*
Студент: Папко Роман.
Geekbrains. Факультет python-разработки.
Четверть 1. Базы данных.
Домашнее задание №2
1. Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf, задав
   в нем логин и пароль, который указывался при установке.
2. Создайте базу данных example, разместите в ней таблицу users, состоящую
   из двух столбцов, числового id и строкового name.
3. Создайте дамп базы данных example из предыдущего задания, разверните
   содержимое дампа в новую базу данных sample.
4. (по желанию) Ознакомьтесь более подробно с документацией утилиты mysqldump.
   Создайте дамп единственной таблицы help_keyword базы данных mysql.
   Причем добейтесь того, чтобы дамп содержал только первые 100 строк таблицы.
*/

-- 1.
/*
$sudo apt install mysql
$sudo systemctl enable mysqld
$sudo systemctl start mysqld

$sudo mysql
mysql> CREATE USER 'toor'@'localhost' IDENTIFIED BY 'supersecret';
mysql> GRANT ALL PRIVILEGES ON * . * TO 'toor'@'localhost';
mysql> FLUSH PRIVILEGES;
mysql> exit
$cat > ~/.my.cnf
[client]
user=toor
password=supersecret
$chmod 600 ./.my.cnf
*/

-- 2.
-- $mysql -hlocalhost
CREATE DATABASE IF NOT EXISTS example;
USE example
CREATE TABLE IF NOT EXISTS example.users (
  `id` INT UNSIGNED,
  `name` CHAR(25) COMMENT 'User name.' DEFAULT 'username'
  ) COMMENT='List of users';

--3.
/*
$mysqldump -hlocalhost example > ~/example.sql
*/

--4.
/*
$mysqldump -hlocalhost -w"true limit 100" mysql help_keyword > ~/mysql.help_keyword_100rows.sql
*/
