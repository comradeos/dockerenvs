-- Adminer 4.8.1 MySQL 8.0.29 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

CREATE DATABASE `my_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `my_db`;

DROP TABLE IF EXISTS `data_test`;
CREATE TABLE `data_test` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `data_test` (`id`, `value`) VALUES
(1,	'87044'),
(2,	'57822'),
(3,	'81227'),
(4,	'54905'),
(5,	'83332'),
(6,	'94421'),
(7,	'79687'),
(8,	'56479'),
(9,	'83880'),
(10,	'37458'),
(11,	'59252'),
(12,	'12633'),
(13,	'52895'),
(14,	'95300'),
(15,	'33672'),
(16,	'52048'),
(17,	'94246'),
(18,	'52831'),
(19,	'75195'),
(20,	'17457'),
(21,	'59165'),
(22,	'55277'),
(23,	'70811'),
(24,	'48613'),
(25,	'17700'),
(26,	'87851');

-- 2022-07-20 08:32:21
