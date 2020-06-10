/*
Студент: Папко Роман.
Geekbrains. Факультет python-разработки.
Четверть 1. Базы данных.
Домашнее задание №4
1. Заполнить все таблицы БД vk данными (по 10-100 записей в каждой таблице)
2. Написать скрипт, возвращающий список имен (только firstname)
   пользователей без повторений в алфавитном порядке
3. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных
   (поле is_active = false). Предварительно добавить такое поле в таблицу profiles
   со значением по умолчанию = true (или 1)
4. Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)
5. Написать название темы курсового проекта (в комментарии)
*/

-- 1. Выполнено на сайте http://filldb.info + внесены изменения для вставки строк подпопадющих под условия заданий.
USE `vk`;
-- Generation time: Wed, 10 Jun 2020 20:31:03 +0000
-- Host: mysql.hostinger.ro
-- DB name: u574849695_21
/*!40030 SET NAMES UTF8 */;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `article` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `article_name_idx` (`name`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `articles` VALUES ('1','1','illo','yooe','1981-04-26 16:11:26','2011-04-30 20:35:45'),
('2','2','velit','rfbo','1987-08-31 01:33:36','1985-11-17 23:48:41'),
('3','3','et','opgg','1979-02-05 10:55:27','1994-06-18 11:33:05'),
('4','4','magni','qokg','2002-09-15 14:56:09','2010-03-21 15:51:17'),
('5','5','voluptas','ulux','1973-12-17 06:47:45','1975-03-03 23:58:32'),
('6','6','hic','ufpt','2012-06-18 01:56:24','1997-08-11 15:28:21'),
('7','7','facilis','rqmy','1990-04-27 02:18:55','2011-11-29 19:52:04'),
('8','8','cum','wesb','2006-12-31 06:16:58','1976-12-01 00:36:25'),
('9','9','labore','blby','1992-01-22 19:28:14','1976-06-27 23:35:23'),
('10','10','ut','vcbh','1987-03-02 13:47:09','1999-07-02 09:21:03'),
('11','11','officia','nwmy','1993-12-17 20:12:15','1986-09-04 19:45:03'),
('12','12','ut','cukk','2015-07-06 17:48:13','2000-04-13 00:30:04'),
('13','13','atque','wpid','2008-11-06 02:48:07','1996-09-29 18:35:27'),
('14','14','saepe','szbz','1983-03-15 14:19:44','1986-02-14 03:44:08'),
('15','15','hic','xvhm','1988-07-19 16:41:36','2011-10-05 19:55:13'),
('16','16','quo','gmpt','1976-05-02 03:35:07','2001-07-13 07:29:28'),
('17','17','sit','srgc','1997-09-08 18:02:15','1997-02-21 20:24:14'),
('18','18','qui','glfh','1972-08-27 23:13:33','1992-08-23 03:19:19'),
('19','19','qui','xesp','1976-12-18 00:02:11','1972-11-16 08:46:21'),
('20','20','ab','gsds','2015-01-08 09:49:47','1981-12-25 16:15:16'),
('21','21','itaque','jgwt','1989-06-28 07:03:30','1973-11-15 09:27:25'),
('22','22','ad','gzie','2012-04-20 20:45:32','2010-07-14 22:27:34'),
('23','23','est','ddsy','1976-09-12 08:34:00','2008-03-26 15:38:50'),
('24','24','deleniti','tnml','1997-09-20 00:29:05','1996-12-11 15:36:36'),
('25','25','dicta','rpew','2003-02-13 21:17:15','2004-11-03 23:53:20'),
('26','26','saepe','ukvj','1987-10-19 19:23:43','1991-03-04 09:16:31'),
('27','27','autem','hlkq','1977-03-15 00:12:00','1998-12-13 17:54:25'); 


DROP TABLE IF EXISTS `articles_comments`;
CREATE TABLE `articles_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) unsigned NOT NULL,
  `comment_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `article_id` (`article_id`),
  KEY `comment_id` (`comment_id`),
  CONSTRAINT `articles_comments_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `articles_comments_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `articles_comments` VALUES ('1','1','1'),
('2','2','2'),
('3','3','3'),
('4','4','4'),
('5','5','5'),
('6','6','6'),
('7','7','7'),
('8','8','8'),
('9','9','9'),
('10','10','10'),
('11','11','11'),
('12','12','12'),
('13','13','13'),
('14','14','14'),
('15','15','15'),
('16','16','16'),
('17','17','17'),
('18','18','18'),
('19','19','19'),
('20','20','20'),
('21','21','21'),
('22','22','22'),
('23','23','23'),
('24','24','24'),
('25','25','25'); 


DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `text` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `comments` VALUES ('1','1','Accusantium temporibus eveniet quaerat velit ex. Saepe explicabo porro nobis saepe harum commodi. Odit aspernatur sequi et veritatis.','1975-04-18 22:15:14','2010-06-20 01:14:28'),
('2','2','Vel nisi fuga quidem maxime voluptatem sed dolor et. Non ut id qui eaque enim debitis. Suscipit et aut fugit sunt quos. Ea explicabo perspiciatis autem dicta dolores nostrum dolores.','1975-11-24 19:41:16','1976-08-25 07:24:31'),
('3','3','Praesentium ut repellat soluta aliquam consequatur natus repudiandae et. Doloribus voluptatem eum iusto possimus. Ut porro error dolor quas ut iure sed.','1974-02-26 04:20:24','2008-12-18 15:17:44'),
('4','4','Ut aut nemo atque. Omnis nostrum voluptas quibusdam.\nSoluta vero expedita quia qui vel aut autem. Et repudiandae quam eligendi sunt alias tempore eum. Et quae repellendus sapiente explicabo optio.','1972-02-22 04:44:41','2012-04-18 17:28:36'),
('5','5','Atque architecto repellat consequatur incidunt dolore dolore. Et recusandae est voluptas blanditiis. Architecto voluptatum eveniet totam.','1985-03-03 09:56:42','2018-03-26 14:50:56'),
('6','6','Repellendus consequatur rerum et velit optio. Veritatis facere et ad delectus voluptas nostrum aut minus.','1972-10-01 16:50:57','2015-11-16 11:33:00'),
('7','7','Dolore et repellendus quo quia illum. Fuga et omnis consequatur molestias sint et qui. Iusto aspernatur ad expedita ipsam quia blanditiis. Recusandae et ut consequatur illo veritatis saepe dolor.','1971-10-27 02:41:56','1981-01-12 17:53:58'),
('8','8','Hic repellendus quidem possimus facilis enim. Ut veritatis tenetur esse accusamus. Itaque facilis rerum voluptatibus quidem laudantium est consequuntur. Et minus placeat fugit consequatur.','1974-10-05 12:41:11','1983-06-17 08:40:31'),
('9','9','Tempore sit consequuntur ipsum sit. Vel cum quis eius ut magni voluptas. Expedita asperiores quia natus dolore et voluptatem. Ipsa qui veritatis est qui eius.','2013-10-15 18:01:07','2013-08-26 18:38:24'),
('10','10','Earum ratione dignissimos quis laudantium sint aspernatur cupiditate. Exercitationem voluptatem harum enim voluptates id quia. Esse optio facere nostrum sapiente voluptatem praesentium soluta.','1991-05-12 04:51:28','1977-01-22 21:25:27'),
('11','11','Ipsum debitis nesciunt modi. Laborum facilis veniam accusantium suscipit. Animi optio voluptas hic itaque voluptatem alias facilis. Maiores numquam itaque quibusdam similique.','2015-06-08 07:05:20','1973-10-24 18:14:39'),
('12','12','Amet asperiores qui rerum dicta distinctio similique. Quos ab soluta consequatur. Odit nostrum laudantium non cupiditate dolorem.','1971-10-13 08:51:52','1972-01-05 09:10:48'),
('13','13','Provident ut minus quia repellat. Sapiente amet inventore itaque perspiciatis aut molestiae sapiente. Doloribus suscipit voluptate velit reprehenderit itaque dolor cum.','2004-10-17 00:49:39','1993-09-15 20:23:15'),
('14','14','Qui ea illum ea. Deserunt quas consequatur atque praesentium qui illum qui. Aut et nemo id molestiae dolor omnis necessitatibus aliquid. Aut itaque minima est ipsa quo non atque rerum.','2000-11-09 15:31:04','2002-01-01 11:43:55'),
('15','15','Quis quae dolorem consequatur in nemo voluptas. Occaecati exercitationem porro tempora porro. Amet laudantium perspiciatis et et.','2017-08-11 11:04:08','1989-04-10 09:06:46'),
('16','16','Vitae amet eligendi atque distinctio. Eum ut ipsum et voluptatem et enim. Quidem et numquam atque voluptate provident.','1994-03-25 05:12:34','1979-03-10 19:14:57'),
('17','17','Odit aut ipsa iusto pariatur rerum ipsa aut saepe. Qui in nam aspernatur quibusdam. Iure nemo porro aut.\nDolore aut rerum beatae. Accusantium blanditiis repudiandae quibusdam qui.','1981-05-01 08:52:21','1995-06-18 18:41:11'),
('18','18','Omnis ad autem excepturi aperiam corporis. Excepturi aspernatur autem labore porro. Error provident atque voluptatem culpa. Mollitia vero dolorem est minima ducimus quibusdam.','2012-05-08 19:35:41','2004-06-27 03:23:53'),
('19','19','Quia autem assumenda error neque. Cupiditate doloremque et sint. Corporis et et explicabo et deleniti. Id nemo aut iure soluta ipsa aut maxime.','2009-05-23 05:58:05','1988-06-07 06:23:20'),
('20','20','Omnis consequatur deleniti quibusdam error quia. Quo asperiores non suscipit. A tenetur reprehenderit voluptas saepe soluta dolorum sequi.','2005-01-27 12:22:49','1999-12-29 06:47:13'),
('21','21','Numquam dicta quidem architecto dignissimos officiis. Recusandae debitis ratione possimus sint et minima cum. Impedit quaerat eveniet placeat.','1985-04-25 07:45:35','1989-07-19 06:04:49'),
('22','22','Dignissimos velit maiores aspernatur deserunt nihil facere magni. Optio et voluptatem non at. Fugiat quis eos rerum doloribus vero assumenda voluptatem fuga. Quisquam laborum et voluptas.','1971-10-08 19:23:38','1976-02-15 05:18:55'),
('23','23','Eos eveniet in tempore. Facilis blanditiis cupiditate dolorem ut. Est velit voluptates qui necessitatibus.','1980-06-12 19:36:23','1996-05-02 18:09:51'),
('24','24','Voluptas iste delectus dolores perspiciatis. Velit ratione et veritatis architecto. Doloribus ut numquam ut error non. Laudantium voluptate ad possimus et. Qui est quia non consectetur.','1993-10-02 02:48:52','1972-05-28 09:41:13'),
('25','25','Ipsam dolores est quae repellat officiis porro laudantium. Dignissimos molestias ducimus enim voluptate est. Et veritatis et amet unde odio quis. Doloremque sapiente officiis eum qui veniam.','2006-03-10 03:40:28','2013-11-05 19:43:55'),
('26','26','Quisquam tempora animi in deserunt assumenda eaque. Quasi dolorum qui et minima.','2012-02-18 04:45:06','1986-09-10 13:12:23'),
('27','27','Odio autem illo est est et eveniet voluptas. Ut laudantium voluptatem tempore cum. Officia similique inventore molestias velit omnis rem neque inventore.','2002-12-18 15:54:39','2013-03-10 04:28:56'),
('28','28','Rerum mollitia qui maiores quaerat maxime debitis nihil. In cupiditate necessitatibus consectetur rerum eligendi. Ab id quis veniam magnam occaecati eum vel.','2012-09-18 23:10:44','1994-12-22 05:30:55'),
('29','29','Ipsa aliquid exercitationem eos amet. Libero dolorum eius unde unde. Sapiente eos est delectus laborum numquam ea.','2006-04-05 15:34:54','1984-08-23 09:57:10'),
('30','30','Ullam ut vel omnis cum harum. Dolore enim aut aut vitae. Voluptatem doloribus distinctio quo natus quis.','2014-07-12 16:35:33','2002-05-15 02:39:03'),
('31','31','Totam tempore enim et itaque. Qui voluptatibus esse aliquid. Non veniam eum eius quisquam aspernatur architecto. Temporibus accusantium voluptatum voluptas.','1976-05-02 20:16:14','1997-01-22 22:48:35'),
('32','32','Incidunt laudantium beatae vel officiis sint ut in ullam. Dignissimos et nisi maiores. Quo sed rem ut qui.','1988-12-11 02:13:50','2015-09-24 08:21:09'),
('33','33','Nesciunt excepturi sequi veniam iusto molestiae voluptas. Reiciendis et quia unde dolor accusamus rerum. Et vel et voluptatem corrupti repellat minima aut.','2018-07-04 08:04:05','1977-02-18 14:09:31'),
('34','34','Neque voluptatem id doloremque minima sunt nulla laboriosam. Iste fuga esse voluptatem. Ut inventore rerum provident eveniet dolore unde. In in qui ex magnam sit vel. Aut et vitae fugiat consequatur.','1993-07-08 10:55:06','2000-02-01 08:40:57'),
('35','35','Id aut repellat qui accusamus quis quae. Rerum iste unde possimus soluta. Tempore architecto nostrum esse illum. Magnam modi accusantium atque magnam.','2015-07-25 16:50:02','1976-07-06 11:46:42'),
('36','36','At aspernatur officiis quaerat ratione neque ipsam non. Numquam sed alias exercitationem nemo dignissimos consequatur. Sunt labore iusto quasi facilis est minus.','1974-10-31 10:19:12','2011-02-11 01:16:50'),
('37','37','Dolorem quod possimus quisquam aut suscipit illum. Earum qui distinctio sit.\nUt accusantium reprehenderit quaerat. Facere et quibusdam sequi. Veniam et molestiae ipsam incidunt doloribus.','2004-09-09 06:34:13','2009-02-11 07:40:39'),
('38','38','Sint odit tempora dolor. Accusamus autem iste aut est omnis. Eaque praesentium quis enim nisi laborum. Minima adipisci quia consequatur est nam enim est. Amet enim commodi quis neque.','2019-10-20 00:20:03','1982-04-10 23:12:47'),
('39','39','Vel doloribus omnis occaecati placeat quia. Molestiae adipisci ea aut non. Ratione similique modi blanditiis similique omnis est voluptatem quidem. Et fuga quae saepe ullam.','1995-02-19 11:02:57','2018-10-23 09:23:03'),
('40','40','Exercitationem quas fugiat voluptate. Aliquam mollitia quos velit sed unde.','1996-12-06 08:01:08','2018-05-23 22:02:50'),
('41','41','Sed nihil dolores reprehenderit est occaecati consequuntur dolorem. Et rerum deserunt at omnis odio quo et. Quae culpa in ea sint iusto voluptatem laborum.','2001-03-31 21:47:21','1995-04-29 22:38:41'),
('42','42','Enim cupiditate dolores ratione eos quas voluptatem. Aut similique dolorem autem sit odit qui non. Ut qui iusto ut cupiditate autem voluptas quis.','1992-10-23 03:35:38','2011-07-12 00:20:35'),
('43','43','A pariatur enim et temporibus tenetur voluptas id. Voluptatum velit et dignissimos a quidem ullam molestiae qui. Id amet quibusdam quia aut consequatur et.','2009-01-25 05:11:39','1982-05-07 04:51:13'),
('44','44','Explicabo aut quis modi earum quia modi totam. Eos laudantium suscipit et qui repudiandae veritatis. Ducimus necessitatibus pariatur quae quia.','2020-05-28 23:28:25','2002-10-26 21:56:16'),
('45','45','Voluptate sit dolor recusandae assumenda corporis. Dicta ex ipsam nam quo a earum. Atque officiis quo enim placeat magni.','1983-05-15 09:40:20','1971-07-11 21:09:14'),
('46','46','Ut eos sit ut tempora quod nihil aperiam. Expedita inventore et libero. Autem et iusto minima praesentium voluptas. Velit delectus magni et itaque eos.','2015-09-12 09:27:57','1971-06-12 18:29:40'),
('47','47','Tempore fugiat eveniet beatae. Eius at dolorem hic ipsa porro consequuntur culpa. Recusandae cum omnis quae voluptatem.','1975-12-05 20:55:58','1992-05-12 02:57:45'),
('48','48','Debitis vel eum aut dicta aliquid ut dolore deleniti. Quidem vel culpa nesciunt molestiae. Assumenda quae non delectus tempora sed est.','2009-01-27 09:51:23','2014-11-23 14:02:49'),
('49','49','Consequuntur illum quibusdam et impedit. Perspiciatis sit voluptas qui nobis. Aut voluptatem dolor voluptas aut et natus. Cupiditate repellat voluptatum non in alias.','1987-01-06 01:39:34','1980-09-20 05:17:23'),
('50','50','Ipsum dolorem et reprehenderit laudantium. Ipsa sint assumenda sequi vitae sunt explicabo. Voluptates beatae ab atque et dolor eos.','1988-11-22 09:07:45','2006-03-26 14:55:09'),
('51','1','Consequuntur distinctio quam perspiciatis quos et eligendi. Ipsa ut tenetur ipsam accusantium. Sint saepe rem nam animi enim sed mollitia. Inventore porro cum aut et.','1982-11-11 13:20:20','1978-01-15 20:20:41'),
('52','2','Ullam nesciunt ipsa voluptatem voluptatem. Placeat quos suscipit est in ut omnis voluptas. Quibusdam laudantium eum corrupti.','1984-08-17 02:14:30','2015-11-14 03:00:47'),
('53','3','Sed quo minus blanditiis dicta recusandae. Tenetur perspiciatis repellendus iusto ab eligendi. Vero doloremque eius quasi.','1995-06-14 16:11:20','1983-05-25 05:17:57'),
('54','4','Ea non nemo ad culpa. Eaque sed quod rerum ut. Dicta quos cum consectetur quia aperiam cum quam. Voluptatem voluptate non nihil non.','1986-10-01 08:31:24','2007-06-09 02:06:59'),
('55','5','Et nobis eveniet veritatis aut consequuntur ut. Libero neque ut et aliquam. Aut eos perspiciatis veritatis vitae deserunt unde quae.','2004-06-20 14:49:09','1980-05-31 22:45:16'),
('56','6','Et voluptate velit ea in voluptatem quia mollitia alias. Aliquid quis consequuntur eos ut quod sint.','2011-02-20 08:00:36','2009-05-05 03:41:28'),
('57','7','Repudiandae rerum voluptate facilis non autem hic illum. Nulla beatae repellat quia provident ea tenetur illum. Quis dolorem sed ipsam et officiis libero illum. Aliquid sed aut quia blanditiis.','2018-11-17 15:20:31','1993-12-13 05:01:49'),
('58','8','Et aliquid qui qui et. Et ipsa distinctio facilis consequatur. Illo nulla quidem dolores et occaecati autem.','1979-09-15 01:52:34','1980-08-15 14:21:36'),
('59','9','Et consequatur est ducimus qui deserunt soluta aut. Voluptatem eum et laborum vel sint nemo id. Dolor dignissimos dolores et enim voluptatem qui blanditiis consequuntur.','2020-01-25 09:38:43','1992-08-12 04:33:27'),
('60','10','Velit qui ut deserunt laudantium eum. Cupiditate quam quia qui omnis explicabo qui est.','2016-05-01 20:53:15','1977-02-07 14:39:14'),
('61','11','Consequatur perspiciatis minima pariatur similique. Veritatis error impedit est ea. Quisquam sed et quasi optio.','1994-12-25 14:09:19','2018-10-06 17:05:19'),
('62','12','Totam illo exercitationem autem autem qui. Voluptatem ad exercitationem molestiae laborum consequatur molestiae assumenda. Molestiae dolorum id officia nisi sit.','1979-06-13 14:14:37','1977-08-16 01:05:27'),
('63','13','Voluptas sit deleniti eum natus et. Dolores at et qui fuga aut omnis odio. Aut praesentium ut ipsam facilis autem facilis fuga. Exercitationem dolorum sit laborum saepe aut.','1989-08-10 21:35:31','1996-10-05 05:20:20'),
('64','14','Qui laudantium aperiam facilis nihil ut omnis est. Harum qui nesciunt distinctio qui. Quos esse cum maiores accusantium. Vel consequuntur velit ex veniam explicabo.','1986-08-08 21:26:39','1989-06-20 18:09:47'); 


DROP TABLE IF EXISTS `communities`;
CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_user_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `communities_name_idx` (`name`),
  KEY `admin_user_id` (`admin_user_id`),
  CONSTRAINT `communities_ibfk_1` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `communities` VALUES ('1','quia','42'),
('2','aut','30'),
('3','atque','9'),
('4','praesentium','41'),
('5','dolore','43'),
('6','praesentium','29'),
('7','consectetur','14'),
('8','cupiditate','25'),
('9','fuga','15'),
('10','fugit','14'),
('11','tempore','20'),
('12','velit','48'),
('13','qui','20'),
('14','sit','11'),
('15','eos','48'); 


DROP TABLE IF EXISTS `friend_requests`;
CREATE TABLE `friend_requests` (
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `status` enum('requested','approved','unfriended','declined') COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`from_user_id`,`to_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`from_user_id` <> `to_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `friend_requests` VALUES ('2','27','requested','1988-12-11 16:18:45'),
('4','31','declined','1988-07-21 15:03:33'),
('5','38','requested','2013-09-17 23:08:42'),
('8','50','unfriended','1981-05-04 19:18:35'),
('9','33','requested','1988-08-17 20:45:18'),
('13','45','declined','1995-09-29 10:06:35'),
('20','46','unfriended','1976-06-18 21:36:23'),
('22','35','declined','1970-12-19 22:02:34'),
('23','37','declined','1975-09-07 13:27:05'),
('24','26','declined','1983-07-29 09:41:44'); 


DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `likes` VALUES ('1','1','1','1999-12-31 19:31:05'),
('2','2','2','2003-09-19 19:10:23'),
('3','3','3','2010-07-29 03:45:34'),
('4','4','4','2014-10-10 02:08:42'),
('5','5','5','1981-09-15 23:11:26'),
('6','6','6','1972-07-05 02:31:22'),
('7','7','7','2001-09-17 03:55:23'),
('8','8','8','1995-11-21 11:16:04'),
('9','9','9','1970-07-03 05:31:18'),
('10','10','10','1977-10-16 09:08:05'),
('11','11','11','1988-07-14 19:28:44'),
('12','12','12','1984-05-13 17:30:33'),
('13','13','13','2010-11-18 18:07:30'),
('14','14','14','1995-04-10 23:35:11'),
('15','15','15','2016-04-04 10:08:29'),
('16','16','16','2002-05-01 22:46:39'),
('17','17','17','2003-11-01 09:00:21'),
('18','18','18','2009-05-05 15:31:17'),
('19','19','19','2003-12-12 03:35:12'),
('20','20','20','1985-05-06 04:50:43'),
('21','21','21','1991-07-18 06:13:28'),
('22','22','22','1971-06-07 23:53:31'),
('23','23','23','2012-03-31 17:55:39'),
('24','24','24','1983-06-07 21:37:50'),
('25','25','25','2007-04-19 19:17:30'),
('26','26','26','1984-05-08 00:25:30'),
('27','27','27','2013-02-11 10:03:29'),
('28','28','28','1994-05-10 11:55:16'),
('29','29','29','1993-10-24 05:03:52'),
('30','30','30','1993-02-04 17:27:14'),
('31','31','31','1970-04-29 12:01:55'),
('32','32','32','1990-08-24 01:15:36'),
('33','33','33','1994-01-11 20:19:55'),
('34','34','34','2019-10-01 19:48:15'),
('35','35','35','1985-03-19 01:24:56'),
('36','36','36','1972-02-09 02:49:45'),
('37','37','37','2003-02-28 18:07:25'),
('38','38','38','2014-04-07 11:45:31'),
('39','39','39','2017-05-28 08:38:45'),
('40','40','40','1981-02-16 14:27:51'),
('41','41','41','2008-09-24 07:15:19'),
('42','42','42','2016-06-06 13:03:47'),
('43','43','43','1995-03-13 01:44:12'),
('44','44','44','1970-06-09 21:35:25'),
('45','45','45','1971-10-08 18:59:23'),
('46','46','46','2020-06-03 16:43:44'),
('47','47','47','2004-07-31 20:27:37'),
('48','48','48','1977-05-14 07:16:24'),
('49','49','49','2018-03-13 12:43:23'),
('50','50','50','1998-01-26 10:10:44'); 


DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_type_id` bigint(20) unsigned NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `media` VALUES ('1','1','1','error','2958964',NULL,'1992-03-23 08:22:52','2017-01-26 10:21:22'),
('2','2','2','corrupti','1864452',NULL,'1972-02-01 12:49:29','2014-02-25 06:26:23'),
('3','3','3','atque','17',NULL,'2000-07-10 06:41:59','1974-04-03 13:53:47'),
('4','4','4','ea','0',NULL,'1970-12-19 14:48:19','2013-03-31 00:50:50'),
('5','5','1','voluptate','41',NULL,'1974-11-14 04:21:40','1974-07-28 06:40:35'),
('6','6','2','est','0',NULL,'1970-03-28 01:38:31','1989-06-09 01:58:43'),
('7','7','3','inventore','0',NULL,'1984-10-26 06:28:54','1998-06-17 12:14:10'),
('8','8','4','et','1245',NULL,'2016-12-19 17:56:36','2012-11-14 09:20:39'),
('9','9','1','laudantium','1563',NULL,'2008-12-03 14:26:24','2005-09-02 04:13:28'),
('10','10','2','nulla','3658',NULL,'1979-06-22 06:05:47','1973-08-01 10:36:00'),
('11','11','3','ad','624815428',NULL,'1976-02-06 01:39:38','1979-02-14 18:23:52'),
('12','12','4','laborum','37140',NULL,'1980-05-30 10:05:08','2014-12-18 05:23:16'),
('13','13','1','iste','0',NULL,'1987-03-19 14:20:53','2020-02-07 19:23:52'),
('14','14','2','sit','55430',NULL,'2011-06-26 19:09:19','1986-05-29 06:17:25'),
('15','15','3','dolorum','0',NULL,'1971-05-31 05:53:50','2012-03-09 19:50:00'),
('16','16','4','deserunt','264936',NULL,'1983-11-12 09:51:19','2001-05-01 03:19:53'),
('17','17','1','quas','81',NULL,'1990-01-27 20:30:29','2007-02-12 15:04:44'),
('18','18','2','quia','33825',NULL,'2016-07-27 21:03:12','1985-10-28 10:34:25'),
('19','19','3','est','0',NULL,'2003-06-30 14:22:25','2013-05-05 08:36:51'),
('20','20','4','eum','509587',NULL,'1993-03-25 17:09:22','1986-02-22 09:44:54'),
('21','21','1','amet','0',NULL,'1970-02-22 16:52:52','2012-04-17 16:16:14'),
('22','22','2','labore','78329',NULL,'1977-09-20 02:20:16','2019-12-16 12:15:59'),
('23','23','3','deserunt','48300556',NULL,'1993-12-08 09:19:31','1988-12-01 15:16:48'),
('24','24','4','placeat','862586',NULL,'2007-05-18 15:33:37','2012-03-20 05:23:00'),
('25','25','1','impedit','0',NULL,'1989-04-19 22:17:21','1972-01-15 13:37:03'),
('26','26','2','ex','5724921',NULL,'2019-03-19 16:02:03','2014-09-23 02:19:16'),
('27','27','3','doloribus','60',NULL,'2002-04-30 14:58:37','2008-01-22 15:10:36'),
('28','28','4','cumque','88515595',NULL,'1978-07-27 06:23:34','1994-09-09 19:43:05'),
('29','29','1','ipsam','0',NULL,'1970-04-21 18:35:44','2017-09-10 05:38:04'),
('30','30','2','libero','349828',NULL,'1990-04-25 20:51:10','1983-07-21 05:47:44'),
('31','31','3','beatae','90',NULL,'2008-12-07 14:58:09','1980-12-27 11:57:01'),
('32','32','4','et','336',NULL,'1987-09-16 07:42:52','2015-12-13 15:09:53'),
('33','33','1','omnis','588605451',NULL,'2019-04-18 19:42:52','2011-02-19 04:08:35'),
('34','34','2','ducimus','17',NULL,'1979-10-02 17:25:15','2001-01-20 22:47:35'),
('35','35','3','modi','345',NULL,'1974-10-18 20:32:20','1970-06-20 12:31:52'),
('36','36','4','molestias','6',NULL,'1995-12-22 07:30:12','2017-04-28 02:18:38'),
('37','37','1','minima','9',NULL,'2013-11-17 02:35:28','2005-01-16 00:56:41'),
('38','38','2','sit','67',NULL,'1992-09-11 01:26:16','1982-12-17 01:17:56'),
('39','39','3','maxime','0',NULL,'1979-05-20 22:01:41','1980-12-20 06:46:37'),
('40','40','4','repudiandae','0',NULL,'2014-06-12 08:36:05','1975-09-01 09:21:19'),
('41','41','1','fuga','7887087',NULL,'1991-11-12 14:39:08','2016-04-26 07:10:55'),
('42','42','2','impedit','455011181',NULL,'1990-10-31 20:28:28','1984-08-24 17:18:10'),
('43','43','3','adipisci','0',NULL,'2019-11-03 05:50:04','1972-05-16 22:20:17'),
('44','44','4','enim','488176132',NULL,'1970-06-07 04:01:53','2011-03-31 03:34:26'),
('45','45','1','eos','0',NULL,'1975-08-29 13:44:13','2012-06-14 21:44:01'),
('46','46','2','laudantium','512374',NULL,'1999-04-02 22:26:42','2019-05-04 20:54:16'),
('47','47','3','quae','10719',NULL,'2019-05-15 12:35:14','1985-06-03 09:35:53'),
('48','48','4','dolore','7149946',NULL,'2013-11-14 13:52:54','2000-10-14 06:39:12'),
('49','49','1','consequatur','266428696',NULL,'2013-01-26 18:51:55','1985-10-21 01:50:37'),
('50','50','2','velit','9',NULL,'2013-01-10 22:00:29','1998-10-07 01:13:26'); 


DROP TABLE IF EXISTS `media_types`;
CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `media_types` VALUES ('1','aut'),
('2','minima'),
('3','porro'),
('4','eos'); 


DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `messages` VALUES ('1','17','26','Iusto facere minus ea temporibus. Dolores corrupti tempore dolor sapiente. At quia quo nemo eum quia molestiae et.','2008-05-04 11:38:30'),
('2','27','11','Aut occaecati deserunt aut. Ab et repellendus nisi. Suscipit doloremque dolorum veritatis. Voluptas voluptatem est accusamus illo itaque beatae. Quos placeat deserunt qui adipisci occaecati dolor.','1978-03-22 17:49:14'),
('3','2','32','Ab eaque dolorum molestiae dicta quos. Fugit accusantium dignissimos et assumenda hic ipsam. Similique alias impedit fuga vel praesentium ut accusantium.','1993-09-14 02:14:07'),
('4','46','48','Perspiciatis quia qui impedit praesentium voluptatem consequatur quia vel. Quo qui ea autem nostrum.','2012-05-25 04:03:39'),
('5','47','33','Enim eos asperiores vero sit. Id quasi qui sequi quia est aut maxime. Ipsa odio hic modi quisquam quod voluptatem. Dolor aut est necessitatibus quasi est ea.','2089-10-02 05:07:30'),
('6','39','26','Eum voluptatum ratione nisi doloribus itaque quis. Omnis consequuntur fuga molestiae architecto. Temporibus debitis corporis in ut.','1995-06-27 22:43:46'),
('7','28','17','Placeat dolorem nostrum debitis consequatur dolorem animi. Ut voluptatem in pariatur labore consequuntur. Non recusandae dolorem sed at tempore praesentium earum. Porro autem nihil officia veritatis est. Voluptas odit sint sed nulla.','2013-08-01 05:27:03'),
('8','19','24','Velit placeat voluptatem minus eos quidem omnis. Animi qui impedit placeat enim. Dignissimos sapiente possimus qui consequatur et dignissimos. Delectus architecto eius reiciendis dolores est aliquid deleniti.','1992-04-25 17:27:27'),
('9','41','44','Quaerat reprehenderit rerum soluta ex non ipsum. Nulla odit perferendis et id molestias voluptatem laboriosam ab. Quos quam autem corrupti accusantium omnis qui. Error ut totam et possimus ea commodi aut nam.','2011-09-22 11:39:56'),
('10','38','10','In dolorum sint eos consectetur quisquam suscipit dicta et. Quia eveniet qui temporibus beatae dicta fugit. Voluptatem tempora consequatur excepturi beatae rerum. Tenetur voluptatem corrupti animi expedita nesciunt.','1984-05-12 22:52:08'),
('11','40','30','Aperiam hic exercitationem minus error est. Odit ducimus sit dicta voluptatem voluptates. Nesciunt vel cum minima consectetur corrupti voluptatibus culpa ad. Quibusdam voluptatum molestiae vero nihil eaque.','1987-06-03 19:13:18'),
('12','15','26','Consectetur debitis deleniti libero tenetur ea molestiae illo voluptates. Libero omnis repudiandae officiis nemo et sed et.','1972-07-13 12:20:32'),
('13','8','22','A incidunt vel inventore est est vel veniam. Doloribus exercitationem doloremque tempora molestias. Eius ad iusto eos consequatur. Itaque et voluptas inventore tempore animi fuga.','2011-08-14 04:54:46'),
('14','46','35','Aut blanditiis magni vel ea nihil aut est. Magni neque porro ipsam incidunt aut quisquam odio est. Est natus voluptate accusantium in alias occaecati nobis. Excepturi architecto adipisci labore. Sunt pariatur voluptates vel nam qui voluptatum rerum.','2005-01-15 15:06:41'),
('15','17','47','Dicta harum vitae itaque quia. Quidem qui sed consequatur eos qui in. Ipsa omnis earum mollitia mollitia. Qui exercitationem consequuntur voluptate atque officiis minima.','1981-06-19 23:15:23'),
('16','42','40','Est fugit nesciunt laboriosam. Iure officia a tempore molestiae aut. Consequatur possimus voluptates alias. Magnam et qui quod voluptatibus qui accusantium quis sapiente. Sed et dolorem quia et omnis.','2193-06-28 14:23:11'),
('17','28','49','Architecto ut et vel delectus. Qui sit qui neque excepturi saepe ullam. Fuga voluptates sunt cumque eveniet a.','1984-11-20 19:47:28'),
('18','39','31','Veniam aliquam eos corporis voluptate facilis et suscipit. Reiciendis quae animi mollitia et culpa consequatur. Aut blanditiis est rerum reprehenderit veritatis qui.','2094-07-16 04:45:44'),
('19','32','50','Officia quidem optio asperiores. Et accusamus laboriosam blanditiis ut aliquid laborum maxime. Pariatur reiciendis et sed ab. Aut iusto consequatur doloribus et velit.','1981-02-03 14:27:16'),
('20','16','32','Molestiae quod molestias mollitia consequatur suscipit. Rerum voluptatem saepe repellendus sed enim exercitationem quis. Natus iure et id sit ut qui dolores. Repellendus incidunt accusantium nulla aut accusantium mollitia harum.','1976-10-15 15:31:56'),
('21','45','22','Nesciunt vel excepturi adipisci qui et fugiat possimus. Rerum blanditiis nihil ducimus assumenda saepe et. Qui ab aperiam placeat eveniet. Assumenda voluptatem rerum excepturi deserunt.','1995-01-10 04:49:32'),
('22','23','28','Quas adipisci dolores et pariatur est amet. Repellendus possimus placeat velit ipsa. Eaque voluptatem ut cupiditate reiciendis. Enim fugit aspernatur earum adipisci eius.','1997-02-22 18:29:00'),
('23','5','14','Voluptas quia neque nisi. Laudantium sit dolor eum modi assumenda eum ab. Incidunt cupiditate quibusdam repellat quasi.','1991-03-08 18:38:03'),
('24','41','49','Possimus sed voluptas qui et. Qui eos vel fugiat voluptas. Odit illo in quasi esse dicta perferendis aut. Molestias similique quod vel tempore rerum asperiores.','2191-11-15 04:35:25'),
('25','20','19','Quas nisi reiciendis voluptate. Autem consequatur iste velit ad. Fuga doloribus totam aliquid odit odio vitae. Sapiente est in quia ex omnis.','1990-07-31 06:52:02'),
('26','17','1','Eveniet illum necessitatibus tenetur id sit doloremque minus. Molestiae nostrum voluptatibus iure eum id. Architecto natus nihil cumque molestiae temporibus quibusdam. Distinctio debitis eveniet incidunt aperiam.','2012-07-03 05:40:57'),
('27','8','4','Harum beatae ut necessitatibus. Saepe nostrum assumenda debitis quas quam dolor. Aperiam libero sunt nulla quo veritatis repellat.','2011-07-22 22:07:08'),
('28','28','3','Quidem porro assumenda ea repudiandae. Non repellat incidunt culpa sed laudantium quod ea. Porro qui tempore architecto impedit aut doloremque voluptatem consectetur. Voluptas praesentium accusantium aliquid repellat officiis.','2000-10-27 12:29:52'),
('29','11','39','Soluta eos nemo ut quia quos ducimus impedit. Occaecati cumque eveniet occaecati quaerat sed iusto. Quasi exercitationem in voluptatem incidunt.','2013-07-30 18:04:20'),
('30','48','50','Nam cum cum minima et quasi. In corporis natus enim unde aut eum rerum cumque. Iste itaque possimus recusandae voluptas ipsum rem maiores. Voluptas neque veritatis qui deserunt eum.','1995-06-20 03:17:50'),
('31','30','43','Atque officia saepe beatae soluta nihil dolores. Dolore officia voluptas aut. Voluptas aliquid unde et reiciendis quo tempora.','2012-04-26 21:12:33'),
('32','38','46','Error itaque cupiditate enim neque consequatur similique. Dignissimos odit iusto provident. Odit rem impedit libero rerum ipsa debitis consectetur.','2097-04-20 11:28:49'),
('33','7','27','Et dolores quas error quisquam possimus. Eum eaque qui maxime quia. Omnis maxime velit facere praesentium aliquam animi dignissimos. Ex consequatur laboriosam error rerum possimus nihil. Voluptatem voluptatem iusto omnis cumque explicabo iure.','2006-10-14 06:25:39'),
('34','36','46','Molestiae hic magnam sed eaque sed. Vitae soluta perferendis repudiandae quisquam ut alias.','2011-11-08 03:51:58'),
('35','48','9','Laudantium mollitia repellendus nesciunt aperiam consectetur. Est omnis consequatur iusto nemo consequuntur. Et aut occaecati aut. Voluptatem doloremque ut et incidunt et dolor aut consequatur.','1977-01-22 21:41:18'),
('36','11','48','Distinctio sed est fugiat debitis recusandae libero. At ad sint fugiat et quia. Cum est reprehenderit atque unde.','2003-04-16 18:08:21'),
('37','50','1','Ullam eum animi laudantium iure molestiae. Alias velit sunt sunt eius magni quia. Cumque reprehenderit ea in accusamus optio.','1980-09-21 15:32:05'),
('38','22','48','Molestias consequatur quae a voluptatum et excepturi maiores. Dolores repellendus doloribus quo dolorem aut sunt sequi. Accusamus omnis dolor necessitatibus qui eaque fugiat. Quod dolorem minus libero ut.','2018-01-06 14:11:20'),
('39','11','38','Molestias incidunt doloribus qui aliquid ut quisquam. Id delectus ut tempore maxime debitis nemo. Et accusantium ut tenetur.','2030-06-09 00:22:05'),
('40','33','5','Reiciendis perferendis ipsum aliquid placeat. Pariatur facilis voluptas praesentium deleniti explicabo voluptate aut. Est blanditiis veritatis ex expedita eius ut. Molestiae nobis quia illum maxime.','1978-06-21 02:14:43'),
('41','26','24','Vel et quia ad sit. Consectetur quam quidem nisi explicabo qui porro. Et corporis qui voluptas.','1996-12-09 05:49:25'),
('42','36','48','Blanditiis eum et quam quaerat et. Quibusdam facere et error molestias at. Illo doloremque ut ut aut.','2013-09-01 23:38:17'),
('43','16','50','Ab dolorum quo nostrum qui consequatur accusantium. Animi assumenda qui illo. Voluptas ducimus deserunt ipsa dignissimos modi.','1983-11-06 13:36:50'),
('44','29','17','Omnis adipisci fugit aut quisquam autem. Accusamus et harum aperiam nemo rerum aperiam. Perferendis modi aut ipsam aut consequatur aut sed. Necessitatibus dicta at eos voluptates omnis sint.','2008-12-18 11:34:46'); 


DROP TABLE IF EXISTS `photo_albums`;
CREATE TABLE `photo_albums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `photo_albums` VALUES ('1','voluptatem','1'),
('2','numquam','2'),
('3','facilis','3'),
('4','et','4'),
('5','molestias','5'),
('6','aut','6'),
('7','earum','7'),
('8','esse','8'),
('9','qui','9'),
('10','ipsam','10'),
('11','cumque','11'),
('12','possimus','12'),
('13','est','13'); 


DROP TABLE IF EXISTS `photos`;
CREATE TABLE `photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `album_id` (`album_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`),
  CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `photos` VALUES ('1','2','1'),
('2','11','2'),
('3','13','3'),
('4','5','4'),
('5','10','5'),
('6','12','6'),
('7','5','7'),
('8','1','8'),
('9','8','9'),
('10','12','10'),
('11','8','11'),
('12','5','12'),
('13','2','13'),
('14','1','14'),
('15','9','15'),
('16','6','16'),
('17','12','17'),
('18','6','18'),
('19','8','19'),
('20','12','20'),
('21','1','21'),
('22','1','22'),
('23','9','23'),
('24','3','24'),
('25','10','25'); 


DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `gender` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `hometown` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `profiles` VALUES ('1','1','1983-07-05','Kulasburgh','2007-06-02 22:36:37'),
('2','1','2019-01-28','East Amoston','1993-07-09 03:32:18'),
('3','1','2000-02-29','Hermanport','1994-08-14 00:10:43'),
('4','1','1997-06-26','South Ernestina','1972-03-05 01:24:36'),
('5','1','1974-08-24','Anabelside','1990-01-10 02:06:32'),
('6','1','1986-02-04','Gleasonside','1972-12-11 01:06:50'),
('7','2','1988-01-19','East Karianne','1991-06-08 01:57:59'),
('8','1','2017-01-03','Eloyport','1984-03-06 00:32:30'),
('9','2','2018-10-24','East Diana','1989-05-19 03:06:02'),
('10','2','1992-11-16','East Rodger','2014-03-09 12:52:40'),
('11','1','1997-07-15','Cummingsshire','1983-11-06 04:40:30'),
('12','1','2007-06-03','Port Lorenz','2017-04-22 12:45:42'),
('13','1','2006-06-15','West Stephanberg','1992-05-17 20:47:35'),
('14','2','1997-10-24','Phoebefort','1985-08-08 12:17:14'),
('15','2','1972-10-16','North Conner','2007-03-01 11:44:34'),
('16','1','1993-05-16','Willmsmouth','1989-04-26 14:31:43'),
('17','2','1986-07-29','Zulaufside','1970-10-16 09:46:37'),
('18','2','1987-01-19','Casimerfort','2013-03-07 05:24:03'),
('19','1','1971-12-02','Annahaven','1971-03-31 11:39:08'),
('20','1','1975-05-30','West Isai','2000-07-30 12:59:54'),
('21','1','2004-02-19','Lake Brennonburgh','1992-09-14 17:02:33'),
('22','1','2016-03-01','Morissetteton','1993-05-02 03:14:18'),
('23','1','1999-03-02','East Edenshire','2014-06-01 10:38:33'),
('24','1','1972-10-04','East Adolf','2014-08-28 18:44:22'),
('25','2','1977-06-05','Karliside','2005-11-17 08:57:32'),
('26','1','1977-05-09','West Georgettefurt','1984-10-25 01:29:57'),
('27','2','1990-06-06','New Florencio','1990-06-09 05:28:45'),
('28','1','2006-09-19','Darrinfurt','1998-10-17 11:08:51'),
('29','1','2005-06-14','Walkermouth','1991-12-16 10:32:37'),
('30','2','2010-03-01','North Luna','2018-11-20 03:01:16'),
('31','2','1999-02-20','Romagueraburgh','1977-03-07 08:42:35'),
('32','2','2007-08-24','North Burnicestad','1982-03-13 14:20:50'),
('33','1','1983-01-06','Bergeside','1976-01-02 05:00:17'),
('34','2','1992-08-24','East Michaela','2002-04-13 13:21:40'),
('35','2','2008-01-23','Vancefort','1983-12-21 14:25:38'),
('36','2','2002-02-02','North Garnetfort','2013-06-10 01:30:22'),
('37','2','2007-07-13','Schambergerstad','1986-03-14 21:56:58'),
('38','1','1970-11-19','Jordanside','2001-05-21 01:27:16'),
('39','1','1997-01-22','Lake Marleeview','1980-05-25 21:56:17'),
('40','1','2005-03-01','Lake Alfonzoland','2006-02-28 11:35:16'),
('41','2','1972-07-15','Port Sierra','2012-07-23 04:28:01'),
('42','2','2010-09-15','West Gerda','1979-09-17 15:34:42'),
('43','2','2016-07-10','Auerstad','1985-05-06 14:38:29'),
('44','2','2006-08-08','New Ciceroburgh','2013-01-24 13:24:26'),
('45','1','2004-06-28','Hermannmouth','1997-11-04 11:29:18'),
('46','1','1985-06-19','Bernierborough','1979-02-01 15:06:30'),
('47','1','1975-09-14','Jakobtown','1981-01-28 10:43:53'),
('48','2','2019-06-29','Gradyton','1987-05-21 10:54:52'),
('49','2','1987-05-11','South Jenaville','1974-06-01 01:59:22'),
('50','2','1997-09-26','Daxton','1996-08-02 07:10:58'); 


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_hash` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Passwords is encrypted',
  `phone` bigint(20) unsigned DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `users_first_last_names_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Basic users info';

INSERT INTO `users` VALUES ('1','Adrain','Feil','monroe.casper@example.org','60a1a237332e95d0f908d36ffe8dee01e67f4d44','79380393941'),
('2','Alexandre','Walsh','veda.hyatt@example.net','f6e22da235b554e717d79c7f94649db9084aa368','79109923804'),
('3','Judy','Rodriguez','stokes.koby@example.org','d9f0b67f44a3b5dd1c626ba7fac2c2dc2288d648','79072681384'),
('4','Orie','Cronin','doyle34@example.org','8ee17c04fb6e9248448fe4b74b7e24a130d3fb67','79614185902'),
('5','Otha','Kris','block.una@example.net','8852726b8d839294e8ac8f0922a7022536be2c51','79584676780'),
('6','Graciela','Will','johns.mercedes@example.org','553c6af21308e67fd2c2ea86bc01fd1054442ebf','79737423470'),
('7','Yvonne','Mitchell','qjacobs@example.net','d9e10d983660a59dadef7598c579ca0c3ecf7ac3','79600980273'),
('8','Haylie','Heidenreich','yrohan@example.net','9035254543ff1084472da8886cad648c78db0e41','79655337217'),
('9','Jacky','Koelpin','adeckow@example.com','54f9524841734f08302d9df08a649d01dc26e7fb','79739063832'),
('10','Lucio','Spencer','ldeckow@example.org','1ff64acc47b59e6ccca08bddf0ddad3f56d2a8e4','79170931569'),
('11','Newton','Roob','stella.hills@example.com','eab498fad785956c67c031b9b282a1b39fc68e3c','79888010793'),
('12','Bonita','Bergstrom','vinnie59@example.com','3fee2da1ba239aaa5741b12cf50de45c85db7ce3','79463165933'),
('13','Marian','McGlynn','abins@example.org','e73060d1653f51a94e8e6554393b12103e488e03','79541576151'),
('14','Kennedy','Dare','wuckert.cale@example.net','122c0c8c7a9e3a82c4a8cee57031104745537ed5','79279014522'),
('15','Elisa','Mohr','maxwell.walter@example.org','a380b51b8562ed0c1ed3985ee90e9830e2e50493','79508280123'),
('16','Deon','Witting','cortney.lemke@example.com','c87d7859c92ab7c892b39bcad7be1c510a02f481','79724559956'),
('17','Gisselle','Sporer','emile77@example.com','e0566c3d4e20ba771950c02ca843b45b3c1510b1','79712117897'),
('18','Sonny','Murray','crawford14@example.org','a08e12679bbea539f62b6303813803f053f2c60f','79260867445'),
('19','Adella','Watsica','myah.lemke@example.net','6ecb63bb8d50a06c9fa0c4607800e5caf839e0c8','79555934442'),
('20','Dorris','West','nicola55@example.org','2987983b79fbddb71871e49d5f80cba5a6ee475b','79944163820'),
('21','Simone','Braun','abbott.baby@example.org','e2c4eb99439098f6119edba261ccf78a6c459e15','79469454014'),
('22','Stephany','Fahey','crist.marcia@example.org','5586694950fc26777e10fec4ca509b10483dfd1e','79852376481'),
('23','Mellie','Zulauf','ogerhold@example.com','67ff17d6921725148d0122cb76ceb87da225b47c','79569350282'),
('24','Roselyn','Reichert','wehner.frankie@example.com','8184ec06b634cbc32647b59b665712daa95de7cd','79203595438'),
('25','Sonny','Turcotte','tatyana30@example.org','40fa75d7bfd1417d58a34bbaceed427a47c22493','79450062707'),
('26','Bradford','Bednar','joe95@example.org','7f77d4162c42e643680d20b6f719ec2b79c97555','79551489422'),
('27','Nickolas','Kub','harold36@example.net','c0e5df10afec931a8daaaddf618bc7e821402bb4','79501189527'),
('28','Amya','Nader','littel.freeman@example.net','a0d7f6e4309725933e771f5da6579df356d1fd81','79154800246'),
('29','Mariela','Dietrich','ziemann.dedrick@example.com','df7e377edc9bc89e41f27f22db862a77031a6034','79865794883'),
('30','Christiana','Zieme','chester33@example.org','317de29f4fdeb35b5a39b04b6dc7068909178164','79016567806'),
('31','Ansel','Nicolas','geoffrey.koss@example.org','844e6db54e114bc9b1d31062cee6c8ac5efd6fbd','79055081649'),
('32','Sonny','Volkman','waters.gunnar@example.org','4777cb60e20a760e2fae266b889395c35af6e3b2','79178369478'),
('33','Antonina','Ryan','uhowell@example.com','e2f78bba6942bb9cfc61085b691927ea9baa2116','79010521000'),
('34','Greyson','Boehm','ewest@example.com','1a696643dbb85ad87d7f6984c62e0bcc24d5bf69','79180140580'),
('35','Adolph','Veum','maximo50@example.net','07503a0370bbc8e6bce9cd357047077d9088f3fb','79161428328'),
('36','Felicita','Collier','nyasia.dubuque@example.org','0f742b6a3931fcac77122aeb751ef89080d7e619','79805830633'),
('37','Camilla','Smitham','bbode@example.com','1347fe0ab595d34a41580a5201ba9ac1d07aa6b4','79119514217'),
('38','Magnolia','Kirlin','ladarius.koepp@example.org','9d3b5dfc6102ceeaf0af7d685932fba347faf9bf','79089480420'),
('39','Ervin','Smith','martine.prosacco@example.com','54171794f41f070e465439f25b4059284e9c69a4','79092793792'),
('40','Sonny','Turcotte','keenan.beier@example.org','cdcdc31ffd9424ede19de2b0a8b617c1eda64d47','79448888504'),
('41','Alexis','Douglas','paul43@example.org','80b896a79b8ec143a1b2b8e29b31aef8e83dc682','79110878952'),
('42','Esperanza','Nolan','russel68@example.org','54a558903f25f42e834128e6758ee4008561f95c','79419651668'),
('43','Eduardo','Carter','nedra.durgan@example.com','8dc7033322004bd2ac844416b87affc55dc9514d','79372622065'),
('44','Clemmie','Bosco','mortimer96@example.org','7c9adef1859f882388e74b86f5478aa63be45af6','79243106035'),
('45','Benton','Nicolas','emard.shad@example.net','8e86f137ded5a641a65f77f3438ee14ca9120e0f','79212962613'),
('46','Sonny','Hilpert','willms.crawford@example.com','0ccb1bedb1758d7d382382d7e0db3bb3ed358a98','79622661085'),
('47','Jasen','McDermott','frieda.raynor@example.com','cdff20333ba8aeb0059772378b221d669937de29','79674468728'),
('48','Minerva','Beier','josiane03@example.org','46ceab5112637cb2b89e9d31ac52b7021299ca86','79734829557'),
('49','Paris','Bernhard','wade.bashirian@example.org','09b7eef79e0564aa8908431a0da491213a4ad5e1','79123552141'),
('50','Irma','Connelly','greenfelder.gladyce@example.com','f9f22997fd271354793407372dc2e1510d729024','79464130809'); 


DROP TABLE IF EXISTS `users_communities`;
CREATE TABLE `users_communities` (
  `user_id` bigint(20) unsigned NOT NULL,
  `community_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `users_communities` VALUES ('1','1'),
('2','2'),
('3','3'),
('4','4'),
('5','5'),
('6','6'),
('7','7'),
('8','8'),
('9','9'),
('10','10'),
('11','11'),
('12','12'),
('13','13'),
('14','14'),
('15','15'),
('16','1'),
('17','2'),
('18','3'),
('19','4'),
('20','5'),
('21','6'),
('22','7'),
('23','8'),
('24','9'),
('25','10'),
('26','11'),
('27','12'),
('28','13'),
('29','14'),
('30','15'),
('31','1'),
('32','2'),
('33','3'); 




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


-- 2. Написать скрипт, возвращающий список имен (только firstname)
--    пользователей без повторений в алфавитном порядке
USE vk;
SELECT DISTINCT firstname FROM users ORDER BY 1;

-- 3. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных
--    (поле is_active = false). Предварительно добавить такое поле в таблицу profiles
--    со значением по умолчанию = true (или 1)

USE `vk`;
ALTER TABLE `profiles` 
ADD COLUMN `is_active` enum('0', '1')
DEFAULT '1';

UPDATE `profiles`
SET `is_active` = '0'
WHERE DATEDIFF(CURDATE(), `birthday`) < 365 * 18 + 5;

-- 4. Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)
USE `vk`;
DELETE FROM `messages`
WHERE `created_at` > CURDATE();