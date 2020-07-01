/*
1.2. Создайте представление, которое выводит название name товарной позиции из
     таблицы products и соответствующее название каталога name из таблицы catalogs.
*/
CREATE OR REPLACE VIEW `shop`.`cat` AS 
  SELECT `p`.`name` AS `Product`,`c`.`name` AS `Catalog`
  FROM 
  `shop`.`products` AS `p`
  JOIN
  `shop`.`catalogs` AS `c`
  WHERE `p`.`catalog_id` = `c`.`id`
;

SELECT * FROM `shop`.`cat`
;