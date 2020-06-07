/*
Студент: Папко Роман.
Geekbrains. Факультет python-разработки.
Четверть 1. Базы данных.
Домашнее задание №3
1. Написать крипт, добавляющий в БД vk, которую создали на занятии,
   3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей)
*/

-- Create database
DROP DATABASE if exists `vk`;
CREATE DATABASE `vk`;
-- USE vk;

-- Create table with usernames and contacts
DROP TABLE  IF EXISTS `vk`.`users`;
CREATE TABLE `vk`.`users`(
    `id` SERIAL,  -- or BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
    `firstname` VARCHAR(100),
    `lastname` VARCHAR(100),
    `email` VARCHAR(100) UNIQUE, -- only one user for one e-mail
    `password_hash` VARCHAR(100) COMMENT 'Passwords is encrypted',
    `phone` BIGINT UNSIGNED,
    
    INDEX users_first_last_names_idx (`firstname`, `lastname`)
) COMMENT 'Basic users info';

-- create table with user info
DROP TABLE IF EXISTS `vk`.`profiles`;
CREATE TABLE `vk`.`profiles`(
    `user_id` BIGINT UNSIGNED NOT NULL UNIQUE,
    `gender` CHAR(1),
    `birthday` DATE,
    `hometown` VARCHAR(100),
    `created_at` DATETIME DEFAULT NOW()
);

ALTER TABLE `vk`.`profiles` ADD CONSTRAINT `fk_user_id`
    FOREIGN KEY (`user_id`) REFERENCES `vk`.`users`(`id`)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;

-- create table for user messages
DROP TABLE IF EXISTS `vk`.`messages`;
CREATE TABLE `vk`.`messages`(
    `id` SERIAL,
    `from_user_id` BIGINT UNSIGNED NOT NULL,
    `to_user_id` BIGINT UNSIGNED NOT NULL,
    `body` TEXT,
    `created_at` DATETIME DEFAULT NOW(),
    
    FOREIGN KEY (`from_user_id`) REFERENCES `vk`.`users`(`id`),
    FOREIGN KEY (`to_user_id`) REFERENCES `vk`.`users`(`id`)
);

-- create table for user friend requests
DROP TABLE IF EXISTS `vk`.`friend_requests`;
CREATE TABLE `vk`.`friend_requests`(
--    `id` SERIAL,
    `from_user_id` BIGINT UNSIGNED NOT NULL,
    `to_user_id` BIGINT UNSIGNED NOT NULL,
    `status` ENUM('requested', 'approved', 'unfriended', 'declined'),
    `updated_at` DATETIME ON UPDATE CURRENT_TIMESTAMP(),
    
    PRIMARY KEY (`from_user_id`, `to_user_id`),
    FOREIGN KEY (`from_user_id`) REFERENCES vk.users(`id`),
    FOREIGN KEY (`to_user_id`) REFERENCES vk.users(`id`),
    CHECK (`from_user_id` <> `to_user_id`)
);

-- create table for communities
DROP TABLE IF EXISTS `vk`.`communities`;
CREATE TABLE `vk`.`communities`(
    `id` SERIAL,
    `name` VARCHAR(200),
    `admin_user_id` BIGINT UNSIGNED NOT NULL,
    
    INDEX communities_name_idx(`name`),
    FOREIGN KEY (`admin_user_id`) REFERENCES vk.users(`id`)
);

-- create table 
DROP TABLE IF EXISTS `vk`.`users_communities`;
CREATE TABLE `vk`.`users_communities`(
    `user_id` BIGINT UNSIGNED NOT NULL,
    `community_id` BIGINT UNSIGNED NOT NULL,
    
    PRIMARY KEY (`user_id`, `community_id`),
    FOREIGN KEY (`user_id`) REFERENCES `vk`.`users`(`id`),
    FOREIGN KEY (`community_id`) REFERENCES `vk`.`communities`(`id`)
);

-- create table of media types
DROP TABLE IF EXISTS `vk`.`media_types`;
CREATE TABLE `vk`.`media_types`(
    `id` SERIAL,
    `name` VARCHAR(255)
);

-- create table for media content
DROP TABLE IF EXISTS `vk`.`media`;
CREATE TABLE `vk`.`media`(
    `id` SERIAL,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `media_type_id` BIGINT UNSIGNED NOT NULL,
    `filename` VARCHAR(255),
    `size` BIGINT,
    `metadata` JSON,
    `created_at` DATETIME DEFAULT NOW(),
    `updated_at` DATETIME ON UPDATE CURRENT_TIMESTAMP(),
    
    FOREIGN KEY (`user_id`) REFERENCES `vk`.`users`(`id`),
    FOREIGN KEY (`media_type_id`) REFERENCES `vk`.`media_types`(`id`)
);

-- create table for likes for content
DROP TABLE IF EXISTS `vk`.`likes`;
CREATE TABLE `vk`.`likes`(
    `id` SERIAL,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `media_id` BIGINT UNSIGNED NOT NULL,
    `created_at` DATETIME DEFAULT NOW(),

    FOREIGN KEY (`user_id`) REFERENCES `vk`.`users`(`id`),
    FOREIGN KEY (`media_id`) REFERENCES `vk`.`media`(`id`)
);

-- create table for photo album
DROP TABLE IF EXISTS `vk`.`photo_albums`;
CREATE TABLE `vk`.`photo_albums`(
    `id` SERIAL,
    `name` VARCHAR(255) default null,
    `user_id` BIGINT UNSIGNED default NULL,

    FOREIGN KEY (`user_id`) REFERENCES `vk`.`users`(`id`),
    primary key (`id`)
);

DROP TABLE IF EXISTS `vk`.`photos`;
CREATE TABLE `vk`.`photos`(
    `id` SERIAL,
    `album_id` BIGINT UNSIGNED NOT NULL,
    `media_id` BIGINT UNSIGNED NOT NULL,

    FOREIGN KEY (`album_id`) REFERENCES `vk`.`photo_albums`(`id`),
    FOREIGN KEY (`media_id`) REFERENCES `vk`.`media`(`id`)
);

/* For home work*/
DROP TABLE IF EXISTS `vk`.`articles`; -- Пользовательские статьи
CREATE TABLE `vk`.`articles`(
    `id` SERIAL,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `name` VARCHAR(255),
    `article` TEXT,
    `created_at` DATETIME DEFAULT NOW(),
    `updated_at` DATETIME ON UPDATE CURRENT_TIMESTAMP(),
    
    INDEX article_name_idx(`name`),
    FOREIGN KEY (`user_id`) REFERENCES `vk`.`users`(`id`)
);

DROP TABLE IF EXISTS `vk`.`comments`; -- Комментарии
CREATE TABLE `vk`.`comments`(
    `id` SERIAL,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `text` VARCHAR(500),
    `created_at` DATETIME DEFAULT NOW(),
    `updated_at` DATETIME ON UPDATE CURRENT_TIMESTAMP(),
    
    FOREIGN KEY (`user_id`) REFERENCES `vk`.`users`(`id`)
);

DROP TABLE IF EXISTS `vk`.`articles_comments`;
CREATE TABLE `vk`.`articles_comments`(
    `id` SERIAL,
    `article_id` BIGINT UNSIGNED NOT NULL,
    `comment_id` BIGINT UNSIGNED NOT NULL,
    
    FOREIGN KEY (`article_id`) REFERENCES `vk`.`articles`(`id`),
    FOREIGN KEY (`comment_id`) REFERENCES `vk`.`comments`(`id`)
);

