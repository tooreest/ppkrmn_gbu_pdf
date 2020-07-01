/*
 1.1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы
     данных. Переместите запись id=1 из таблицы shop.users в таблицу sample.users.
     Используйте транзакции.
 */
DROP DATABASE IF EXISTS `shop`;
CREATE DATABASE `shop`;

CREATE TABLE `shop`.`users` (
   `id` bigint unsigned NOT NULL AUTO_INCREMENT
  ,`name` varchar(255) DEFAULT NULL COMMENT 'Имя покупателя'
  ,`birthday_at` date DEFAULT NULL COMMENT 'Дата рождения'
  ,`created_at` datetime DEFAULT CURRENT_TIMESTAMP
  ,`updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  ,PRIMARY KEY (`id`)
  ,UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Покупатели'
;

INSERT INTO `shop`.`users`
(`id`, `name`, `birthday_at`, `created_at`, `updated_at`)
VALUES
 (1, 'Геннадий', '1990-10-05', '2020-06-20 21:28:27.0', '2020-06-20 21:28:27.0')
,(2, 'Наталья', '1984-11-12', '2020-06-20 21:28:27.0', '2020-06-20 21:28:27.0')
,(3, 'Александр', '1985-05-20', '2020-06-20 21:28:27.0', '2020-06-20 21:28:27.0')
,(4, 'Сергей', '1988-02-14', '2020-06-20 21:28:27.0', '2020-06-20 21:28:27.0')
,(5, 'Иван', '1998-01-12', '2020-06-20 21:28:27.0', '2020-06-20 21:28:27.0')
,(6, 'Мария', '1992-08-29', '2020-06-20 21:28:27.0', '2020-06-20 21:28:27.0')
;


DROP DATABASE IF EXISTS `sample`;
CREATE DATABASE `sample`;

CREATE TABLE `sample`.`users` (
   `id` bigint unsigned NOT NULL AUTO_INCREMENT
  ,`name` varchar(255) DEFAULT NULL COMMENT 'Имя пользователя'
  ,`birthday_at` date DEFAULT NULL COMMENT 'Дата рождения'
  ,`created_at` datetime DEFAULT CURRENT_TIMESTAMP
  ,`updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  ,PRIMARY KEY (`id`)
  ,UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Пользователи'
;

START TRANSACTION;
SET @moveid = 1;
INSERT INTO `sample`.`users`
  SELECT * FROM `shop`.`users`
  WHERE shop.users.id = @moveid
;  
DELETE FROM `shop`.`users` WHERE `shop`.`users`.`id` = @moveid LIMIT 1;
COMMIT;
