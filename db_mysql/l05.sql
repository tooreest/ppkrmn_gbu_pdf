/*
Студент: Папко Роман.
Geekbrains. Факультет python-разработки.
Четверть 1. Базы данных.
Домашнее задание №5

1. Пусть в таблице users поля created_at и updated_at оказались незаполненными.
   Заполните их текущими датой и временем.
2. Таблица users была неудачно спроектирована. Записи created_at и updated_at
   были заданы типом VARCHAR и в них долгое время помещались значения в формате
   "20.10.2017 8:10". Необходимо преобразовать поля к типу DATETIME, сохранив
   введеные ранее значения.
3. В таблице складских запасов storehouses_products в поле value могут
   встречаться самые разные цифры: 0, если товар закончился и выше нуля,
   если на складе имеются запасы. Необходимо отсортировать записи таким
   образом, чтобы они выводились в порядке увеличения значения value.
   Однако, нулевые запасы должны выводиться в конце, после всех записей.
4. (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся
   в августе и мае. Месяцы заданы в виде списка английских названий
   ('may', 'august')
5. (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса.
   SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в
   порядке, заданном в списке IN.
6. Подсчитайте средний возраст пользователей в таблице users
7. Подсчитайте количество дней рождения, которые приходятся на каждый из дней
   недели. Следует учесть, что необходимы дни недели текущего года,
   а не года рождения.
8. (по желанию) Подсчитайте произведение чисел в столбце таблицы

*/

-- Создаю базу для обучения
DROP DATABASE IF EXISTS `lbase`;
CREATE DATABASE `lbase`;
USE `lbase`;

-- Создаю таблицы со столбцами нужными для выполнения практического задания.

-- Столбцы created_at и updated_at делаю типа VARCHAR для третьего задания.
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`(
    `id` SERIAL,
    `firstname` VARCHAR(100),
    `lastname` VARCHAR(100),
    `birthday` DATE,
    `created_at` VARCHAR(20),
    `updated_at` VARCHAR(20)
);

-- Создаю таблицу для 
DROP TABLE IF EXISTS `storehouses_products`;
CREATE TABLE `storehouses_products`(
    `id` SERIAL,
    `product_name` VARCHAR(100),
    `value` INT UNSIGNED
);


-- Заполняю таблицу для выполнения первого задания 
INSERT INTO `users`
  (`firstname`,`lastname`,`birthday`)
  VALUES
    ('Антон','Антонов','2001-12-25'),
    ('Борис','Борисов','1953-11-05'),  
    ('Владимир','Владимиров','1980-10-16'),
    ('Семен','Семенов','1999-05-05'),
    ('Роман','Романов','1976-01-05'),
    ('Михаил','Михайлов','1958-09-28'),
    ('Петр','Петров','1970-03-11'),
    ('Степан','Степанов','1993-04--16'),
    ('Иван','Иванов','2005-01-21'),
    ('Семен','Семенов','2003-03-03')
;

INSERT INTO `storehouses_products`
  (`product_name`,`value`)
  VALUES
    ('Процессор','12'),
    ('Видеокарта','10'),  
    ('Оперативная память','250'),
    ('Материнская плата','0'),
    ('Корпус','10'),
    ('Блок питания','0'),
    ('HDD диск','100'),
    ('SDD диск','5'),
    ('Монитор','6'),
    ('Клавиатура','0')
;


-- 1. Заполнить поля created_at и updated_at текущими датой и временем
--  Специально заполняю в формате нужном для выполнения задания №2
UPDATE `users`
SET `created_at` = DATE_FORMAT(NOW(), '%d.%m.%Y %H:%i'),
    `updated_at` = DATE_FORMAT(NOW(), '%d.%m.%Y %H:%i')
;

-- 2. Необходимо преобразовать поля в таблице users, столбцы created_at и
--    updated_at к типу DATETIME, сохранив введеные ранее значения.

UPDATE `users`
SET `created_at` = STR_TO_DATE( `created_at`, '%d.%m.%Y %H:%i'),
    `updated_at` = STR_TO_DATE( `updated_at`, '%d.%m.%Y %H:%i')
;
ALTER TABLE `users` 
CHANGE COLUMN `created_at` `created_at` DATETIME,
CHANGE COLUMN `updated_at` `updated_at` DATETIME;

-- 3. Отсортировать записи в таблице storehouses_products таким образом,
--    чтобы они выводились в порядке увеличения значения value.
--    Однако, нулевые запасы должны выводиться в конце, после всех записей.
SELECT * 
FROM `storehouses_products`
ORDER BY IF (`value` = 0,1,0), `value`;

-- 6. Подсчитайте средний возраст пользователей в таблице users
SELECT 
sum(IF (DATE_FORMAT(NOW(), '%m%d') >= DATE_FORMAT(`birthday`, '%m%d'),DATE_FORMAT(NOW(), '%Y') - DATE_FORMAT(`birthday`, '%Y'),DATE_FORMAT(NOW(), '%Y') - DATE_FORMAT(`birthday`, '%Y')-1))/COUNT(`birthday`) AS avarage_age
FROM users;


-- 7. Подсчитайте количество дней рождения, которые приходятся на каждый из дней
--    недели. Следует учесть, что необходимы дни недели текущего года,
--    а не года рождения.
SELECT
DATE_FORMAT(CONCAT(DATE_FORMAT(NOW(), "%Y-"), DATE_FORMAT(`birthday`, '%m-%d')), '%w') AS day_of_week, COUNT(*)
FROM `users`
GROUP BY day_of_week
ORDER BY day_of_week;

