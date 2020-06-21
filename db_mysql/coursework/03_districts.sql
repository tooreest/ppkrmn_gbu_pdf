USE `smsc_energo`;

DROP TABLE IF EXISTS `districts`;
CREATE TABLE `districts`
  (
    `id` SERIAL PRIMARY KEY
  , `region` BIGINT UNSIGNED NOT NULL
  , `en_name` VARCHAR(50)
  , `ru_name` VARCHAR(50)

  , FOREIGN KEY (`region`) REFERENCES `regions`(`id`)
  )
;

INSERT INTO `districts`
  (`id`,`region`,`en_name`,`ru_name`)
VALUES
    ('9','50','Solnechnogorsky district','Солнечногорский район')
  , ('5','50','Sergiev-posadsky district','Сергиев-Посадский район')
;
