/*
3.1. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в
     зависимости от текущего времени суток. С 6:00 до 12:00 функция должна
     возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать
     фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 —
     "Доброй ночи".
*/
USE `shop`;
DROP FUNCTION IF EXISTS hello;

DELIMITER //
CREATE FUNCTION hello (t TIME)
RETURNS CHAR(50) DETERMINISTIC
BEGIN
  DECLARE t1, t2, t3, t4 TIME;
  SET t1 = '00:00';
  SET t2 = '06:00';
  SET t3 = '12:00';
  SET t4 = '18:00';
  IF (t >= t1 AND t < t2)
  THEN RETURN "Доброй ночи";
  ELSEIF (t >= t2 AND t < t3)
  THEN RETURN "Доброе утро";
  ELSEIF (t >= t3 AND t < t4)
  THEN RETURN "Добрый день";
  ELSE RETURN "Добрый вечер";
  END IF;
  -- RETURN t;
END//

DELIMITER ;

SELECT hello("21:00");