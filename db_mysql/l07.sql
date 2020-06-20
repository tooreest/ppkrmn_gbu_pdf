/*
Студент: Папко Роман.
Geekbrains. Факультет python-разработки.
Четверть 1. Базы данных.
Домашнее задание №7
1. Составьте список пользователей users, которые осуществили хотя бы один
   заказ orders в интернет магазине.
2. Выведите список товаров products и разделов catalogs, который соответствует товару.
3. (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица
   городов cities (label, name). Поля from, to и label содержат английские
   названия городов, поле name — русское.
   Выведите список рейсов flights с русскими названиями городов.
*/

-- 1. Составьте список пользователей users, которые осуществили хотя бы один
--    заказ orders в интернет магазине.
-- БД интернет магазина из файлов, приложенных к ДЗ. (Исправлена)
USE shop;
/* Добавлял заказы, т.к. изначально их не было
INSERT INTO `orders` (`user_id`)
VALUES
  (1),
  (3),
  (5),
  (4),
  (3),
  (2),
  (2),
  (3)
;
*/
SELECT DISTINCT `name` AS 'Клиенты, сделавшие покупки'
FROM `users`
WHERE `id` IN (
  SELECT `user_id`
  FROM `orders`
)
;

-- 2. Выведите список товаров products и разделов catalogs, который соответствует товару.
-- `products`.`name` - `catalogs`.`name`
USE `shop`;
SELECT `name`
, (SELECT `name` FROM `catalogs` WHERE `catalog_id` = `catalogs`.`id`) AS 'catalog'
FROM `products`
;

-- 3. по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица
--    городов cities (label, name). Поля from, to и label содержат английские
--    названия городов, поле name — русское.
--    Выведите список рейсов flights с русскими названиями городов.

DROP DATABASE IF EXISTS `airlines`;
CREATE DATABASE `airlines`;
USE `airlines`;

DROP TABLE IF EXISTS `flights`;
CREATE TABLE `flights`(
  `id` SERIAL PRIMARY KEY,
  `from` VARCHAR(50),
  `to` VARCHAR(50)
) COMMENT = 'Рейсы'
;
INSERT INTO `flights` (
  `from`,`to`
)
VALUES
('moscow','omsk'),
('novgorod','kazan'),
('irkutsk','moscow'),
('omsk','irkutsk'),
('moscow','kazan')
;

DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities` (
  `label` VARCHAR(50),
  `name` VARCHAR(50)
)
;
INSERT INTO `cities`
VALUES
('moscow','москва'),
('novgorod','новгород'),
('irkutsk','иркутск'),
('omsk','омск'),
('kazan','казань')
;

SELECT `flights`.`id`
  ,(SELECT `name` FROM `cities` WHERE `flights`.`from` = `cities`.`label`) AS 'from (rus)'
  ,(SELECT `name` FROM `cities` WHERE `flights`.`to` = `cities`.`label`) AS 'to (rus)'
FROM `flights`
GROUP BY `flights`.`id`
;
