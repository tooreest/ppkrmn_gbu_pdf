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
USE `vk`;

-- Create table with usernames and contacts
DROP TABLE  IF EXISTS `users`;
CREATE TABLE `users`(
    `id` SERIAL,  -- or BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
    `firstname` VARCHAR(100),
    `lastname` VARCHAR(100),
    `email` VARCHAR(100) UNIQUE, -- only one user for one e-mail
    `password_hash` VARCHAR(100) COMMENT 'Passwords is encrypted',
    `phone` BIGINT UNSIGNED,
    
    INDEX users_first_last_names_idx (`firstname`, `lastname`)
) COMMENT 'Basic users info';

-- create table with user info
DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles`(
    `user_id` BIGINT UNSIGNED NOT NULL UNIQUE,
    `gender` CHAR(1),
    `birthday` DATE,
    `hometown` VARCHAR(100),
    `created_at` DATETIME DEFAULT NOW()
);

ALTER TABLE `profiles` ADD CONSTRAINT `fk_user_id`
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;

-- create table for user messages
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages`(
    `id` SERIAL,
    `from_user_id` BIGINT UNSIGNED NOT NULL,
    `to_user_id` BIGINT UNSIGNED NOT NULL,
    `body` TEXT,
    `created_at` DATETIME DEFAULT NOW(),
    
    FOREIGN KEY (`from_user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`to_user_id`) REFERENCES `users`(`id`)
);

-- create table for user friend requests
DROP TABLE IF EXISTS `friend_requests`;
CREATE TABLE `friend_requests`(
--    `id` SERIAL,
    `from_user_id` BIGINT UNSIGNED NOT NULL,
    `to_user_id` BIGINT UNSIGNED NOT NULL,
    `status` ENUM('requested', 'approved', 'unfriended', 'declined'),
    `updated_at` DATETIME ON UPDATE CURRENT_TIMESTAMP(),
    
    PRIMARY KEY (`from_user_id`, `to_user_id`),
    FOREIGN KEY (`from_user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`to_user_id`) REFERENCES `users`(`id`),
    CHECK (`from_user_id` <> `to_user_id`)
);

-- create table for communities
DROP TABLE IF EXISTS `communities`;
CREATE TABLE `communities`(
    `id` SERIAL,
    `name` VARCHAR(200),
    `admin_user_id` BIGINT UNSIGNED NOT NULL,
    
    INDEX communities_name_idx(`name`),
    FOREIGN KEY (`admin_user_id`) REFERENCES `users`(`id`)
);

-- create table 
DROP TABLE IF EXISTS `users_communities`;
CREATE TABLE `users_communities`(
    `user_id` BIGINT UNSIGNED NOT NULL,
    `community_id` BIGINT UNSIGNED NOT NULL,
    
    PRIMARY KEY (`user_id`, `community_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`community_id`) REFERENCES `communities`(`id`)
);

-- create table of media types
DROP TABLE IF EXISTS `media_types`;
CREATE TABLE `media_types`(
    `id` SERIAL,
    `name` VARCHAR(255)
);

-- create table for media content
DROP TABLE IF EXISTS `media`;
CREATE TABLE `media`(
    `id` SERIAL,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `media_type_id` BIGINT UNSIGNED NOT NULL,
    `filename` VARCHAR(255),
    `size` BIGINT,
    `metadata` JSON,
    `created_at` DATETIME DEFAULT NOW(),
    `updated_at` DATETIME ON UPDATE CURRENT_TIMESTAMP(),
    
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`media_type_id`) REFERENCES `media_types`(`id`)
);

-- create table for likes for content
DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes`(
    `id` SERIAL,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `media_id` BIGINT UNSIGNED NOT NULL,
    `created_at` DATETIME DEFAULT NOW(),

    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`media_id`) REFERENCES `media`(`id`)
);

-- create table for photo album
DROP TABLE IF EXISTS `photo_albums`;
CREATE TABLE `photo_albums`(
    `id` SERIAL,
    `name` VARCHAR(255) default null,
    `user_id` BIGINT UNSIGNED default NULL,

    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
    primary key (`id`)
);

DROP TABLE IF EXISTS `photos`;
CREATE TABLE `photos`(
    `id` SERIAL,
    `album_id` BIGINT UNSIGNED NOT NULL,
    `media_id` BIGINT UNSIGNED NOT NULL,

    FOREIGN KEY (`album_id`) REFERENCES `photo_albums`(`id`),
    FOREIGN KEY (`media_id`) REFERENCES `media`(`id`)
);

DROP TABLE IF EXISTS `articles`; -- Пользовательские статьи
CREATE TABLE `articles`(
    `id` SERIAL,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `name` VARCHAR(255),
    `article` TEXT,
    `created_at` DATETIME DEFAULT NOW(),
    `updated_at` DATETIME ON UPDATE CURRENT_TIMESTAMP(),
    
    INDEX article_name_idx(`name`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`)
);

DROP TABLE IF EXISTS `comments`; -- Комментарии
CREATE TABLE `comments`(
    `id` SERIAL,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `text` VARCHAR(500),
    `created_at` DATETIME DEFAULT NOW(),
    `updated_at` DATETIME ON UPDATE CURRENT_TIMESTAMP(),
    
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`)
);

DROP TABLE IF EXISTS `articles_comments`;
CREATE TABLE `articles_comments`(
    `id` SERIAL,
    `article_id` BIGINT UNSIGNED NOT NULL,
    `comment_id` BIGINT UNSIGNED NOT NULL,
    
    FOREIGN KEY (`article_id`) REFERENCES `articles`(`id`),
    FOREIGN KEY (`comment_id`) REFERENCES `comments`(`id`)
);
