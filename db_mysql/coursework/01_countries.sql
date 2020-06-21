USE `smsc_energo`;

DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries`
  (
    `id` SERIAL PRIMARY KEY
  , `en_name` VARCHAR(50)
  , `ru_name` VARCHAR(50)
  )
;

INSERT INTO `countries`
  (`id`,`en_name`,`ru_name`)
VALUES
    ('7','Russia','Россия')
  , ('375','Belarus','Белорусь')
  , ('380','Ukraine','Украина')
;
