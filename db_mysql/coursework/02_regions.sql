USE `smsc_energo`;

DROP TABLE IF EXISTS `regions`;
CREATE TABLE `regions`
  (
    `id` SERIAL PRIMARY KEY
  , `country` BIGINT UNSIGNED NOT NULL
  , `en_name` VARCHAR(50)
  , `ru_name` VARCHAR(50)

  , FOREIGN KEY (`country`) REFERENCES `countries`(`id`)
  )
;

INSERT INTO `regions`
  (`id`,`country`,`en_name`,`ru_name`)
VALUES
    ('50','7','Moscow region','Московская область')
  , ('77','7','Moscow','Москва')
;
