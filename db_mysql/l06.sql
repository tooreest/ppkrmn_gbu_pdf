/*
Студент: Папко Роман.
Geekbrains. Факультет python-разработки.
Четверть 1. Базы данных.
Домашнее задание №6

1. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите
   человека, который больше всех общался с выбранным пользователем.
2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.
3. Определить кто больше поставил лайков (всего): мужчины или женщины
*/
-- 1. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите
--    человека, который больше всех общался с выбранным пользователем.
USE `vk`;
SET @user_id = 17;
SELECT * FROM `users`;
SELECT * 

                                                                                                                                                                                                                                                                                                                                                                      ,609 aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaR `from_user_id` = @user_id;

7  
SELECT `users`.`id`,`messages`.`to_user_id`
FROM `users`,`messages`
WHERE `messages`.`to_user_id` = @user_id
;



-- 2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.
SELECT COUNT(*) AS 'Лайки пользаков моложе 10 лет'
FROM `likes` 
WHERE `user_id` IN
(
SELECT `user_id`
FROM `profiles`
WHERE TIMESTAMPDIFF(YEAR, `birthday`, NOW()) <= 10
)
;

-- 3. Определить кто больше поставил лайков (всего): мужчины или женщины
SELECT
CASE
  WHEN `profiles`.`gender` = '1' THEN 'Муж.'
  WHEN `profiles`.`gender` = '2' THEN 'Жен.'
END AS 'Пол'
  ,COUNT(*) AS 'l'
FROM `profiles`,`likes`
WHERE `profiles`.`user_id` = `likes`.`user_id`
GROUP BY `пол`
ORDER BY 2 DESC
LIMIT 1
;
