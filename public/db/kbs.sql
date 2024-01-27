/*
SQLyog Community v13.1.1 (64 bit)
MySQL - 10.4.28-MariaDB : Database - kb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`kb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `kb`;

/*Table structure for table `activity_log` */

DROP TABLE IF EXISTS `activity_log`;

CREATE TABLE `activity_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_type` varchar(255) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `subject_id` bigint(20) unsigned DEFAULT NULL,
  `causer_type` varchar(255) DEFAULT NULL,
  `causer_id` bigint(20) unsigned DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `batch_uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `activity_log` */

insert  into `activity_log`(`id`,`log_name`,`description`,`subject_type`,`event`,`subject_id`,`causer_type`,`causer_id`,`properties`,`batch_uuid`,`created_at`,`updated_at`) values 
(1,'default','updated','App\\Models\\Article','updated',18,'App\\Models\\User',10,'{\"attributes\":{\"topic\":\"gVino\",\"description\":\"There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain\",\"section_id\":8},\"old\":{\"topic\":\"Vino\",\"description\":\"There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain\",\"section_id\":8}}',NULL,'2023-12-09 16:41:03','2023-12-09 16:41:03'),
(2,'default','updated','App\\Models\\Article','updated',18,'App\\Models\\User',10,'{\"attributes\":{\"topic\":\"lorem\",\"description\":\"There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain\",\"section_id\":8},\"old\":{\"topic\":\"gVino\",\"description\":\"There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain\",\"section_id\":8}}',NULL,'2023-12-09 16:43:36','2023-12-09 16:43:36'),
(3,'default','created','App\\Models\\Article','created',19,'App\\Models\\User',10,'{\"attributes\":{\"topic\":\"Method Statement for Rust Removal\",\"description\":\"Rust removal is the process of eliminating rust, a type of corrosion that occurs when iron or steel reacts with oxygen and moisture in the air. Rust can compromise the structural integrity of metal objects if left unchecked.\",\"section_id\":9}}',NULL,'2023-12-11 11:11:29','2023-12-11 11:11:29'),
(4,'default','updated','App\\Models\\Article','updated',15,'App\\Models\\User',10,'{\"attributes\":{\"topic\":\"demo 1\",\"description\":\"The purpose of lorem ipsum is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn\'t distract from the layout. A practice not without controversy, laying out pages with meaningless filler text can be very useful when the focus is meant to be on design, not content.\",\"section_id\":9},\"old\":{\"topic\":\"demo\",\"description\":\"The purpose of lorem ipsum is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn\'t distract from the layout. A practice not without controversy, laying out pages with meaningless filler text can be very useful when the focus is meant to be on design, not content.\",\"section_id\":9}}',NULL,'2023-12-11 12:38:06','2023-12-11 12:38:06'),
(5,'default','created','App\\Models\\EmployeeInductionDetail','created',1,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":4,\"quiz_id\":null,\"answer\":null,\"check\":null}}',NULL,'2023-12-26 12:23:22','2023-12-26 12:23:22'),
(6,'default','created','App\\Models\\EmployeeInductionDetail','created',2,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":null,\"check\":null}}',NULL,'2023-12-26 12:26:06','2023-12-26 12:26:06'),
(7,'default','created','App\\Models\\EmployeeInductionDetail','created',3,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":null,\"check\":null}}',NULL,'2023-12-26 12:27:18','2023-12-26 12:27:18'),
(8,'default','created','App\\Models\\EmployeeInductionDetail','created',4,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":null,\"check\":null}}',NULL,'2023-12-26 12:28:35','2023-12-26 12:28:35'),
(9,'default','created','App\\Models\\EmployeeInductionDetail','created',5,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":null,\"check\":null}}',NULL,'2023-12-26 12:29:02','2023-12-26 12:29:02'),
(10,'default','created','App\\Models\\EmployeeInductionDetail','created',6,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":null,\"check\":null}}',NULL,'2023-12-26 12:29:37','2023-12-26 12:29:37'),
(11,'default','created','App\\Models\\EmployeeInductionDetail','created',7,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":null,\"check\":null}}',NULL,'2023-12-26 12:32:44','2023-12-26 12:32:44'),
(12,'default','created','App\\Models\\EmployeeInductionDetail','created',8,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":null,\"check\":null}}',NULL,'2023-12-26 12:33:12','2023-12-26 12:33:12'),
(13,'default','created','App\\Models\\EmployeeInductionDetail','created',9,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":null,\"check\":null}}',NULL,'2023-12-26 12:33:33','2023-12-26 12:33:33'),
(14,'default','created','App\\Models\\EmployeeInductionDetail','created',10,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":null,\"check\":null}}',NULL,'2023-12-26 12:35:02','2023-12-26 12:35:02'),
(15,'default','created','App\\Models\\EmployeeInductionDetail','created',11,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":null,\"check\":null}}',NULL,'2023-12-26 12:38:25','2023-12-26 12:38:25'),
(16,'default','created','App\\Models\\EmployeeInductionDetail','created',12,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":null,\"check\":null}}',NULL,'2023-12-26 12:42:22','2023-12-26 12:42:22'),
(17,'default','created','App\\Models\\EmployeeInductionDetail','created',13,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":null,\"check\":null}}',NULL,'2023-12-26 12:43:00','2023-12-26 12:43:00'),
(18,'default','created','App\\Models\\EmployeeInductionDetail','created',14,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":null,\"check\":null}}',NULL,'2023-12-26 12:43:51','2023-12-26 12:43:51'),
(19,'default','created','App\\Models\\EmployeeInductionDetail','created',15,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":null,\"check\":null}}',NULL,'2023-12-26 12:44:09','2023-12-26 12:44:09'),
(20,'default','created','App\\Models\\EmployeeInductionDetail','created',16,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":null,\"check\":null}}',NULL,'2023-12-26 12:47:10','2023-12-26 12:47:10'),
(21,'default','created','App\\Models\\EmployeeInductionDetail','created',17,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":5,\"quiz_id\":null,\"answer\":null,\"check\":null}}',NULL,'2023-12-26 12:52:30','2023-12-26 12:52:30'),
(22,'default','created','App\\Models\\EmployeeInductionDetail','created',18,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":null,\"check\":null}}',NULL,'2023-12-26 12:52:58','2023-12-26 12:52:58'),
(23,'default','created','App\\Models\\EmployeeInductionDetail','created',19,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":\"tyre\",\"check\":null}}',NULL,'2023-12-26 12:54:18','2023-12-26 12:54:18'),
(24,'default','created','App\\Models\\EmployeeInductionDetail','created',1,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":\"dill\",\"check\":null}}',NULL,'2023-12-30 11:38:39','2023-12-30 11:38:39'),
(25,'default','created','App\\Models\\EmployeeInductionDetail','created',2,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":\"basil\",\"check\":null}}',NULL,'2023-12-30 11:38:50','2023-12-30 11:38:50'),
(26,'default','created','App\\Models\\EmployeeInductionDetail','created',3,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":\"dill\",\"check\":null}}',NULL,'2023-12-30 11:40:00','2023-12-30 11:40:00'),
(27,'default','created','App\\Models\\EmployeeInductionDetail','created',4,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":\"engine\",\"check\":null}}',NULL,'2023-12-30 11:41:56','2023-12-30 11:41:56'),
(28,'default','created','App\\Models\\EmployeeInductionDetail','created',5,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":\"car\",\"check\":null}}',NULL,'2023-12-30 11:43:09','2023-12-30 11:43:09'),
(29,'default','created','App\\Models\\EmployeeInductionDetail','created',6,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":\"car\",\"check\":null}}',NULL,'2023-12-30 11:48:14','2023-12-30 11:48:14'),
(30,'default','created','App\\Models\\EmployeeInductionDetail','created',7,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":\"car\",\"check\":null}}',NULL,'2023-12-30 12:14:08','2023-12-30 12:14:08'),
(31,'default','created','App\\Models\\EmployeeInductionDetail','created',8,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":\"parsley\",\"check\":null}}',NULL,'2023-12-30 12:14:16','2023-12-30 12:14:16'),
(32,'default','created','App\\Models\\EmployeeInductionDetail','created',9,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":\"tyre\",\"check\":null}}',NULL,'2023-12-30 12:15:36','2023-12-30 12:15:36'),
(33,'default','created','App\\Models\\EmployeeInductionDetail','created',10,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":\"tyre\",\"check\":null}}',NULL,'2023-12-30 12:15:40','2023-12-30 12:15:40'),
(34,'default','created','App\\Models\\EmployeeInductionDetail','created',11,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":\"engine\",\"check\":null}}',NULL,'2023-12-30 12:46:56','2023-12-30 12:46:56'),
(35,'default','created','App\\Models\\EmployeeInductionDetail','created',12,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":\"steering wheel\",\"check\":null}}',NULL,'2023-12-30 12:47:39','2023-12-30 12:47:39'),
(36,'default','created','App\\Models\\EmployeeInductionDetail','created',13,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":\"mayonnaise\",\"check\":null}}',NULL,'2023-12-30 12:51:46','2023-12-30 12:51:46'),
(37,'default','created','App\\Models\\EmployeeInductionDetail','created',14,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":\"engine\",\"check\":null}}',NULL,'2023-12-30 13:53:23','2023-12-30 13:53:23'),
(38,'default','created','App\\Models\\EmployeeInductionDetail','created',15,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":\"car\",\"check\":null}}',NULL,'2023-12-30 13:53:26','2023-12-30 13:53:26'),
(39,'default','created','App\\Models\\EmployeeInductionDetail','created',16,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":\"car\",\"check\":null}}',NULL,'2023-12-30 13:53:26','2023-12-30 13:53:26'),
(40,'default','created','App\\Models\\EmployeeInductionDetail','created',17,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":\"car\",\"check\":null}}',NULL,'2023-12-30 13:53:26','2023-12-30 13:53:26'),
(41,'default','created','App\\Models\\EmployeeInductionDetail','created',18,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":\"parsley\",\"check\":null}}',NULL,'2023-12-30 13:53:30','2023-12-30 13:53:30'),
(42,'default','created','App\\Models\\EmployeeInductionDetail','created',19,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":\"parsley\",\"check\":null}}',NULL,'2023-12-30 14:25:11','2023-12-30 14:25:11'),
(43,'default','created','App\\Models\\EmployeeInductionDetail','created',20,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":6,\"quiz_id\":null,\"answer\":\"parsley\",\"check\":null}}',NULL,'2023-12-30 14:29:04','2023-12-30 14:29:04'),
(44,'default','created','App\\Models\\EmployeeInductionDetail','created',21,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":2,\"quiz_id\":null,\"answer\":\"All the options are correct\",\"check\":null}}',NULL,'2024-01-02 10:17:01','2024-01-02 10:17:01'),
(45,'default','created','App\\Models\\EmployeeInductionDetail','created',22,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":2,\"quiz_id\":null,\"answer\":\"All the options are correct\",\"check\":null}}',NULL,'2024-01-02 10:17:05','2024-01-02 10:17:05'),
(46,'default','created','App\\Models\\EmployeeInductionDetail','created',23,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":2,\"quiz_id\":null,\"answer\":\"A relational database management system\",\"check\":null}}',NULL,'2024-01-02 10:32:05','2024-01-02 10:32:05'),
(47,'default','created','App\\Models\\EmployeeInductionDetail','created',24,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":2,\"quiz_id\":null,\"answer\":\"SELECT\",\"check\":null}}',NULL,'2024-01-02 10:32:09','2024-01-02 10:32:09'),
(48,'default','created','App\\Models\\EmployeeInductionDetail','created',25,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":2,\"quiz_id\":null,\"answer\":\"A relational database management system\",\"check\":null}}',NULL,'2024-01-02 10:32:58','2024-01-02 10:32:58'),
(49,'default','created','App\\Models\\EmployeeInductionDetail','created',26,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":2,\"quiz_id\":null,\"answer\":\"SELECT\",\"check\":null}}',NULL,'2024-01-02 10:33:04','2024-01-02 10:33:04'),
(50,'default','created','App\\Models\\EmployeeInductionDetail','created',27,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":2,\"quiz_id\":null,\"answer\":\"A relational database management system\",\"check\":null}}',NULL,'2024-01-02 10:33:52','2024-01-02 10:33:52'),
(51,'default','created','App\\Models\\EmployeeInductionDetail','created',28,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":2,\"quiz_id\":null,\"answer\":\"OPEN\",\"check\":null}}',NULL,'2024-01-02 10:33:56','2024-01-02 10:33:56'),
(52,'default','created','App\\Models\\EmployeeInductionDetail','created',29,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":3,\"quiz_id\":null,\"answer\":\"Trial Balance\",\"check\":null}}',NULL,'2024-01-02 10:34:07','2024-01-02 10:34:07'),
(53,'default','created','App\\Models\\EmployeeInductionDetail','created',30,'App\\Models\\User',19,'{\"attributes\":{\"induction_id\":3,\"quiz_id\":null,\"answer\":\"For external negotiation\",\"check\":null}}',NULL,'2024-01-02 10:34:11','2024-01-02 10:34:11');

/*Table structure for table `articles` */

DROP TABLE IF EXISTS `articles`;

CREATE TABLE `articles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `topic` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `section_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `articles` */

insert  into `articles`(`id`,`topic`,`description`,`section_id`,`created_by`,`updated_by`,`created_at`,`updated_at`) values 
(1,'Lorem Ipsum','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',3,1,1,'2023-11-27 07:49:44','2023-11-27 07:49:44'),
(2,'Lorem Ipsum','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',8,1,1,'2023-11-27 08:07:23','2023-11-27 08:07:23'),
(3,'What is Lorem Ipsum?','It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',8,1,1,'2023-11-27 08:09:59','2023-11-27 08:09:59'),
(4,'lorem','It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',2,1,1,'2023-11-27 08:12:42','2023-11-27 08:12:42'),
(6,'lorem','\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...\"',4,1,1,'2023-11-27 08:18:03','2023-11-27 08:18:03'),
(7,'lorem','\"There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...\"',9,1,1,'2023-11-27 08:19:29','2023-11-27 08:19:29'),
(8,'demo','article',9,1,1,'2023-11-27 08:22:13','2023-11-27 08:22:13'),
(9,'demo','The placeholder text, beginning with the line “Lorem ipsum dolor sit amet, consectetur adipiscing elit”, looks like Latin because in its youth, centuries ago, it was Latin',9,1,1,'2023-11-27 08:22:46','2023-12-02 07:22:06'),
(10,'demo','The placeholder text, beginning with the line “Lorem ipsum dolor sit amet, consectetur adipiscing elit”, looks like Latin because in its youth, centuries ago, it was Latin',9,1,1,'2023-11-27 08:23:45','2023-12-02 07:21:56'),
(11,'demo','The placeholder text, beginning with the line “Lorem ipsum dolor sit amet, consectetur adipiscing elit”, looks like Latin because in its youth, centuries ago, it was Latin',9,1,1,'2023-11-27 08:23:46','2023-12-02 07:21:44'),
(12,'demo','Until recently, the prevailing view assumed lorem ipsum was born as a nonsense text. “It\'s not Latin, though it looks like it, and it actually says nothing,” Before & After magazine answered a curious reader, “Its ‘words’ loosely approximate the frequency with which letters occur in English, which is why at a glance it looks pretty real.',9,1,1,'2023-11-27 08:24:49','2023-12-02 07:21:22'),
(13,'demo','Until recently, the prevailing view assumed lorem ipsum was born as a nonsense text. “It\'s not Latin, though it looks like it, and it actually says nothing,” Before & After magazine answered a curious reader, “Its ‘words’ loosely approximate the frequency with which letters occur in English, which is why at a glance it looks pretty real.',9,1,1,'2023-11-27 08:25:12','2023-12-02 07:21:09'),
(14,'demo','The passage experienced a surge in popularity during the 1960s when Letraset used it on their dry-transfer sheets, and again during the 90s as desktop publishers bundled the text with their software. Today it\'s seen all around the web; on templates, websites, and stock designs. Use our generator to get your own, or read on for the authoritative history of lorem ipsum.',9,1,1,'2023-11-27 08:26:23','2023-12-02 07:20:49'),
(15,'demo 1','The purpose of lorem ipsum is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn\'t distract from the layout. A practice not without controversy, laying out pages with meaningless filler text can be very useful when the focus is meant to be on design, not content.',9,1,10,'2023-11-27 08:26:55','2023-12-11 12:38:06'),
(16,'act','The purpose of lorem ipsum is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn\'t distract from the layout. A practice not without controversy, laying out pages with meaningless filler text can be very useful when the focus is meant to be on design, not content.',4,1,1,'2023-11-27 08:35:23','2023-12-02 07:18:18'),
(17,'act','Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.',4,1,1,'2023-11-27 08:45:12','2023-12-02 07:17:52'),
(18,'lorem','There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain',8,1,10,'2023-11-27 08:49:42','2023-12-09 16:43:36'),
(19,'Method Statement for Rust Removal','Rust removal is the process of eliminating rust, a type of corrosion that occurs when iron or steel reacts with oxygen and moisture in the air. Rust can compromise the structural integrity of metal objects if left unchecked.',9,10,10,'2023-12-11 11:11:29','2023-12-11 11:11:29');

/*Table structure for table `departments` */

DROP TABLE IF EXISTS `departments`;

CREATE TABLE `departments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `department_name` varchar(30) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `departments` */

insert  into `departments`(`id`,`department_name`,`created_at`,`updated_at`,`created_by`,`updated_by`) values 
(1,'Finance','2023-10-31 12:34:04','2023-10-31 12:42:19',1,1),
(4,'IT','2023-10-31 13:09:48','2023-10-31 13:09:48',1,1),
(6,'Account','2023-11-17 07:12:53','2023-11-17 07:28:08',1,1),
(8,'Marketing','2023-11-17 10:51:46','2023-11-21 13:08:49',1,1),
(9,'Engineering','2023-11-21 13:09:01','2023-11-21 13:09:01',1,1),
(10,'Production','2023-11-21 13:09:42','2023-11-21 13:09:42',1,1);

/*Table structure for table `designations` */

DROP TABLE IF EXISTS `designations`;

CREATE TABLE `designations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `designation_name` varchar(30) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `designations` */

insert  into `designations`(`id`,`designation_name`,`created_at`,`updated_at`,`created_by`,`updated_by`) values 
(1,'Manager','2023-10-31 12:57:05','2023-10-31 12:57:05',1,1),
(3,'Team Lead','2023-10-31 13:09:09','2023-10-31 13:09:09',1,1),
(4,'Designer','2023-11-17 07:47:17','2023-11-17 07:47:17',1,1),
(5,'Developer','2023-11-17 07:47:28','2023-11-17 07:47:37',1,1),
(7,'Senior Manager','2023-11-17 10:51:35','2023-11-21 13:04:53',1,1),
(8,'Sales manager','2023-11-21 13:06:45','2023-11-21 13:06:45',1,1),
(10,'Finance Manager','2023-11-21 13:07:29','2023-11-21 13:07:29',1,1);

/*Table structure for table `employee_induction_details` */

DROP TABLE IF EXISTS `employee_induction_details`;

CREATE TABLE `employee_induction_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `induction_id` bigint(20) unsigned DEFAULT NULL,
  `quiz_id` bigint(20) unsigned DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `check` enum('0','1') DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `employee_induction_details` */

insert  into `employee_induction_details`(`id`,`induction_id`,`quiz_id`,`answer`,`check`,`created_by`,`updated_by`,`created_at`,`updated_at`) values 
(1,6,NULL,'dill',NULL,19,19,'2023-12-30 11:38:39','2023-12-30 11:38:39'),
(2,6,NULL,'basil',NULL,19,19,'2023-12-30 11:38:50','2023-12-30 11:38:50'),
(3,6,NULL,'dill',NULL,19,19,'2023-12-30 11:40:00','2023-12-30 11:40:00'),
(4,6,NULL,'engine',NULL,19,19,'2023-12-30 11:41:56','2023-12-30 11:41:56'),
(5,6,NULL,'car',NULL,19,19,'2023-12-30 11:43:09','2023-12-30 11:43:09'),
(6,6,NULL,'car',NULL,19,19,'2023-12-30 11:48:14','2023-12-30 11:48:14'),
(7,6,NULL,'car',NULL,19,19,'2023-12-30 12:14:08','2023-12-30 12:14:08'),
(8,6,NULL,'parsley',NULL,19,19,'2023-12-30 12:14:16','2023-12-30 12:14:16'),
(9,6,NULL,'tyre',NULL,19,19,'2023-12-30 12:15:36','2023-12-30 12:15:36'),
(10,6,NULL,'tyre',NULL,19,19,'2023-12-30 12:15:40','2023-12-30 12:15:40'),
(11,6,NULL,'engine',NULL,19,19,'2023-12-30 12:46:56','2023-12-30 12:46:56'),
(12,6,NULL,'steering wheel',NULL,19,19,'2023-12-30 12:47:39','2023-12-30 12:47:39'),
(13,6,NULL,'mayonnaise',NULL,19,19,'2023-12-30 12:51:46','2023-12-30 12:51:46'),
(14,6,NULL,'engine',NULL,19,19,'2023-12-30 13:53:22','2023-12-30 13:53:22'),
(15,6,NULL,'car',NULL,19,19,'2023-12-30 13:53:26','2023-12-30 13:53:26'),
(16,6,NULL,'car',NULL,19,19,'2023-12-30 13:53:26','2023-12-30 13:53:26'),
(17,6,NULL,'car',NULL,19,19,'2023-12-30 13:53:26','2023-12-30 13:53:26'),
(18,6,NULL,'parsley',NULL,19,19,'2023-12-30 13:53:30','2023-12-30 13:53:30'),
(19,6,NULL,'parsley',NULL,19,19,'2023-12-30 14:25:11','2023-12-30 14:25:11'),
(20,6,NULL,'parsley',NULL,19,19,'2023-12-30 14:29:04','2023-12-30 14:29:04'),
(21,2,NULL,'All the options are correct',NULL,19,19,'2024-01-02 10:17:01','2024-01-02 10:17:01'),
(22,2,NULL,'All the options are correct',NULL,19,19,'2024-01-02 10:17:05','2024-01-02 10:17:05'),
(23,2,NULL,'A relational database management system',NULL,19,19,'2024-01-02 10:32:05','2024-01-02 10:32:05'),
(24,2,NULL,'SELECT',NULL,19,19,'2024-01-02 10:32:09','2024-01-02 10:32:09'),
(25,2,NULL,'A relational database management system',NULL,19,19,'2024-01-02 10:32:58','2024-01-02 10:32:58'),
(26,2,NULL,'SELECT',NULL,19,19,'2024-01-02 10:33:04','2024-01-02 10:33:04'),
(27,2,NULL,'A relational database management system',NULL,19,19,'2024-01-02 10:33:52','2024-01-02 10:33:52'),
(28,2,NULL,'OPEN',NULL,19,19,'2024-01-02 10:33:56','2024-01-02 10:33:56'),
(29,3,NULL,'Trial Balance',NULL,19,19,'2024-01-02 10:34:07','2024-01-02 10:34:07'),
(30,3,NULL,'For external negotiation',NULL,19,19,'2024-01-02 10:34:11','2024-01-02 10:34:11');

/*Table structure for table `employees` */

DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `contact_no` varchar(12) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address_line_1` varchar(255) DEFAULT NULL,
  `address_line_2` varchar(255) DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `designation_id` bigint(20) unsigned DEFAULT NULL,
  `date_of_joining` date DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `pincode` int(10) unsigned DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `employees` */

insert  into `employees`(`id`,`first_name`,`middle_name`,`last_name`,`contact_no`,`email`,`address_line_1`,`address_line_2`,`department_id`,`designation_id`,`date_of_joining`,`country`,`state`,`city`,`pincode`,`dob`,`created_by`,`updated_by`,`created_at`,`updated_at`) values 
(19,'Pratiksha','Amol','Shinde','8981234567','pratiksha@kb.com','thane',NULL,4,1,'2022-02-09','India','MH','Mumbai',421204,'1994-01-05',1,10,'2023-11-21 07:54:26','2023-12-09 18:06:04'),
(20,'Bhagyashree','Raj','Chavan','9088890888','akshata@kbs.com','khidkaleshwar temple','khidkali',8,7,'2021-01-19','India','MP','Indore',422004,'1991-10-15',1,1,'2023-11-21 08:26:05','2023-11-21 13:00:27'),
(21,'Vanshika','Pramod','Deshmukh','9790567345','vanshika@kb.com','Mahadev temple','MIDC',1,10,'2023-01-25','india','MH','Jalgaon',422001,'2000-01-13',1,1,'2023-11-21 13:14:26','2023-11-21 13:14:26'),
(22,'Rina','Rajiv','Patil','987865346','rina@kb.com','MIDC','Ambad',8,3,'2019-01-23','India','MH','Nashik',400001,'2000-01-05',1,1,'2023-11-27 05:48:34','2023-11-27 05:49:59');

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `inductions` */

DROP TABLE IF EXISTS `inductions`;

CREATE TABLE `inductions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `induction_name` varchar(30) DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `inductions` */

insert  into `inductions`(`id`,`induction_name`,`department_id`,`created_by`,`updated_by`,`created_at`,`updated_at`) values 
(2,'Computer',4,1,10,'2023-12-08 11:29:50','2023-12-12 10:52:08'),
(3,'Accounts',6,10,10,'2023-12-12 10:51:58','2023-12-12 10:51:58'),
(4,'Business',8,10,10,'2023-12-12 10:52:38','2023-12-12 10:52:38'),
(5,'Mechanical',9,10,10,'2023-12-12 10:53:09','2023-12-12 10:53:09'),
(6,'HR',10,10,10,'2023-12-12 10:54:09','2023-12-12 10:54:09');

/*Table structure for table `media` */

DROP TABLE IF EXISTS `media`;

CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `collection_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `disk` varchar(255) NOT NULL,
  `conversions_disk` varchar(255) DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_uuid_unique` (`uuid`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  KEY `media_order_column_index` (`order_column`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `media` */

insert  into `media`(`id`,`model_type`,`model_id`,`uuid`,`collection_name`,`name`,`file_name`,`mime_type`,`disk`,`conversions_disk`,`size`,`manipulations`,`custom_properties`,`generated_conversions`,`responsive_images`,`order_column`,`created_at`,`updated_at`) values 
(1,'App\\Models\\Notice',6,'cfc957a2-1529-4254-ad22-f7d39c3f8bba','attachment','dummy','dummy.pdf','application/pdf','media','media',13264,'[]','[]','[]','[]',1,'2023-11-27 04:51:51','2023-11-27 04:51:51'),
(3,'App\\Models\\Article',4,'6385800e-ea13-481f-adde-eb996669654c','file_attachment_1','dummy','dummy.pdf','application/pdf','media','media',13264,'[]','[]','[]','[]',1,'2023-11-27 08:12:43','2023-11-27 08:12:43'),
(4,'App\\Models\\Article',4,'e228ea2b-deba-49bd-9970-45a0151f595a','file_attachment_2','download (1)','download-(1).jpeg','image/jpeg','media','media',4223,'[]','[]','[]','[]',2,'2023-11-27 08:12:44','2023-11-27 08:12:44'),
(5,'App\\Models\\Article',4,'9c4a95b9-4ed2-4bfb-86e2-88094897da12','file_attachment_3','sample','sample.pdf','application/pdf','media','media',3028,'[]','[]','[]','[]',3,'2023-11-27 08:12:44','2023-11-27 08:12:44'),
(9,'App\\Models\\Article',15,'023e5568-c513-4f61-b155-4fa3573b8693','file_attachment_1','dummy','dummy.pdf','application/pdf','media','media',13264,'[]','[]','[]','[]',1,'2023-11-27 08:26:55','2023-11-27 08:26:55'),
(10,'App\\Models\\Article',15,'0a557913-66ff-4b88-96c2-62bdcecc55e6','file_attachment_2','download (1)','download-(1).jpeg','image/jpeg','media','media',4223,'[]','[]','[]','[]',2,'2023-11-27 08:26:55','2023-11-27 08:26:55'),
(11,'App\\Models\\Article',15,'3a0ef0a1-4ae0-4f3d-a061-435d20c62b1d','file_attachment_3','download','download.jpeg','image/jpeg','media','media',9043,'[]','[]','[]','[]',3,'2023-11-27 08:26:55','2023-11-27 08:26:55'),
(12,'App\\Models\\Article',16,'edc4fd05-690f-484e-a414-8739374c349a','file_attachment_1','download (1)','download-(1).jpeg','image/jpeg','media','media',4223,'[]','[]','[]','[]',1,'2023-11-27 08:35:24','2023-11-27 08:35:24'),
(13,'App\\Models\\Article',16,'8c40bb44-0288-40a0-a4c3-86c7a3a2c77f','file_attachment_2','download','download.jpeg','image/jpeg','media','media',9043,'[]','[]','[]','[]',2,'2023-11-27 08:35:24','2023-11-27 08:35:24'),
(14,'App\\Models\\Article',16,'8577761b-5ff0-4d95-b793-7f2a740b3dc6','file_attachment_3','download (2)','download-(2).jpeg','image/jpeg','media','media',5257,'[]','[]','[]','[]',3,'2023-11-27 08:35:24','2023-11-27 08:35:24'),
(15,'App\\Models\\Article',17,'818a09d6-145f-4e1a-a6de-36bea77710f1','file_attachment_1','download (2)','download-(2).jpeg','image/jpeg','media','media',5257,'[]','[]','[]','[]',1,'2023-11-27 08:45:12','2023-11-27 08:45:12'),
(16,'App\\Models\\Article',17,'53ba4a95-64a3-4840-9eba-01d453991124','file_attachment_2','dummy','dummy.pdf','application/pdf','media','media',13264,'[]','[]','[]','[]',2,'2023-11-27 08:45:12','2023-11-27 08:45:12'),
(17,'App\\Models\\Article',17,'cdb13a0f-ba68-4946-8a58-db5d4480fde1','file_attachment_3','sample','sample.pdf','application/pdf','media','media',3028,'[]','[]','[]','[]',3,'2023-11-27 08:45:12','2023-11-27 08:45:12'),
(18,'App\\Models\\Article',18,'94c1fc2d-fcbd-4fa8-9d3d-36b6577101d9','file_attachment_1','dummy','dummy.pdf','application/pdf','media','media',13264,'[]','[]','[]','[]',1,'2023-11-27 08:49:42','2023-11-27 08:49:42'),
(19,'App\\Models\\Article',18,'6f14b8c8-a89f-4d51-b4db-aae5b7f38d25','file_attachment_2','dummy','dummy.pdf','application/pdf','media','media',13264,'[]','[]','[]','[]',2,'2023-11-27 08:49:42','2023-11-27 08:49:42'),
(20,'App\\Models\\Article',18,'c40b6b76-6e7a-4b01-8f26-0a0de0288fb3','file_attachment_3','dummy','dummy.pdf','application/pdf','media','media',13264,'[]','[]','[]','[]',3,'2023-11-27 08:49:42','2023-11-27 08:49:42'),
(21,'App\\Models\\Article',1,'85fd4a13-181a-42b4-ad4d-7bb66c89224b','file_attachment_1','website-template-preview-92455','website-template-preview-92455.jpg','image/jpeg','media','media',75062,'[]','[]','[]','[]',1,'2023-12-04 10:30:28','2023-12-04 10:30:28'),
(22,'App\\Models\\Article',1,'74021e72-b609-44aa-9d6f-ecdfa9a77676','file_attachment_2','website-template-preview-92455','website-template-preview-92455.jpg','image/jpeg','media','media',75062,'[]','[]','[]','[]',2,'2023-12-04 10:30:28','2023-12-04 10:30:28'),
(23,'App\\Models\\Article',1,'e4bf7e9a-ce87-421d-916e-c2ca17eeb034','file_attachment_3','website-template-preview-92455','website-template-preview-92455.jpg','image/jpeg','media','media',75062,'[]','[]','[]','[]',3,'2023-12-04 10:30:28','2023-12-04 10:30:28'),
(24,'App\\Models\\Article',1,'2119a620-b00b-493b-9c94-1300df732cb9','video_attachment','big_buck_bunny_720p_1mb','big_buck_bunny_720p_1mb.mp4','video/mp4','media','media',1055736,'[]','[]','[]','[]',4,'2023-12-04 10:50:12','2023-12-04 10:50:12'),
(25,'App\\Models\\Article',2,'12e87723-c1e7-4a86-93b2-d49b102ccb0a','video_attachment','honey_bee_busy_insect_flower_bee_659','honey_bee_busy_insect_flower_bee_659.mp4','video/mp4','media','media',3232945,'[]','[]','[]','[]',1,'2023-12-04 10:54:37','2023-12-04 10:54:37'),
(26,'App\\Models\\Article',18,'f2ae637a-3958-4db0-8a99-e087a6696f78','video_attachment','SampleVideo_1280x720_5mb','SampleVideo_1280x720_5mb.mp4','video/mp4','media','media',5253880,'[]','[]','[]','[]',4,'2023-12-04 10:57:37','2023-12-04 10:57:37'),
(27,'App\\Models\\Article',17,'aa31a18e-4892-4933-be29-381f1e7c853f','video_attachment','SampleVideo_1280x720_5mb','SampleVideo_1280x720_5mb.mp4','video/mp4','media','media',5253880,'[]','[]','[]','[]',4,'2023-12-04 11:36:23','2023-12-04 11:36:23'),
(28,'App\\Models\\Article',16,'51d5f04e-4cea-4bba-91a9-84e8e3d27262','video_attachment','SampleVideo_1280x720_5mb','SampleVideo_1280x720_5mb.mp4','video/mp4','media','media',5253880,'[]','[]','[]','[]',4,'2023-12-04 11:57:18','2023-12-04 11:57:18'),
(32,'App\\Models\\Notice',7,'4bed88da-9210-41fa-a51b-140b1e58e53b','attachment','Sample','Sample.pdf','application/pdf','media','media',707054,'[]','[]','[]','[]',1,'2023-12-11 11:48:12','2023-12-11 11:48:12'),
(33,'App\\Models\\Notice',5,'04e30ff2-1cd6-49cb-a067-e2e7046fb094','attachment','test','test.pdf','application/pdf','media','media',3981,'[]','[]','[]','[]',1,'2023-12-11 11:48:34','2023-12-11 11:48:34'),
(34,'App\\Models\\Notice',4,'7e228f91-8ceb-46ae-969f-c9c1ecccbc3a','attachment','Sample PDF Generator','Sample-PDF-Generator.pdf','application/pdf','media','media',5260,'[]','[]','[]','[]',1,'2023-12-11 11:48:53','2023-12-11 11:48:53'),
(35,'App\\Models\\Notice',3,'781819e7-2964-4df8-8d99-4811fdabfb74','attachment','Sample','Sample.pdf','application/pdf','media','media',707054,'[]','[]','[]','[]',1,'2023-12-11 11:49:03','2023-12-11 11:49:03'),
(36,'App\\Models\\Notice',1,'36425036-9e25-43e9-85cd-0e9edfc87206','attachment','test','test.pdf','application/pdf','media','media',3981,'[]','[]','[]','[]',1,'2023-12-11 11:49:42','2023-12-11 11:49:42'),
(38,'App\\Models\\Article',3,'37368066-2a55-4017-ba46-9363d514acc1','video_attachment','Sample1','Sample1.mp4','video/mp4','media','media',12096481,'[]','[]','[]','[]',1,'2023-12-11 12:30:29','2023-12-11 12:30:29'),
(39,'App\\Models\\Article',15,'9dd0e2c0-12e4-46fa-aafe-0856452fac5c','video_attachment','sample','sample.mp4','video/mp4','media','media',8123998,'[]','[]','[]','[]',4,'2023-12-11 12:38:06','2023-12-11 12:38:06'),
(40,'App\\Models\\Article',19,'0972c5d6-a9fe-4d43-ad1c-a22edc59400b','video_attachment','sample','sample.mp4','video/mp4','media','media',8123998,'[]','[]','[]','[]',4,'2023-12-11 12:40:40','2023-12-11 12:40:40'),
(41,'App\\Models\\Article',19,'a6a0649f-a4f2-452d-ac5b-5737c04137de','file_attachment_1','Sample','Sample.pdf','application/pdf','media','media',707054,'[]','[]','[]','[]',5,'2023-12-11 12:41:54','2023-12-11 12:41:54');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_reset_tokens_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
(5,'2023_10_26_050228_create_table_posts',2),
(6,'2023_10_27_054158_create_table_services',2),
(7,'2023_10_27_111617_create_table_clients',3),
(8,'2023_10_26_054340_create_table_family_details',4),
(9,'2023_10_26_054402_create_table_service_details',4),
(10,'2023_10_31_112243_create_permission_tables',5),
(11,'2023_10_31_114609_create_departments_table',6),
(12,'2023_10_31_114614_create_designations_table',6),
(13,'2023_10_31_123246_alter_table_departments',6),
(14,'2023_10_31_123319_alter_table_designations',6),
(15,'2023_11_18_060309_create_table_notices',7),
(16,'2023_11_18_081846_create_media_table',8),
(17,'2023_11_20_095653_create_sections_table',9),
(18,'2023_11_20_112539_create_employees_table',10),
(19,'2023_11_21_070515_alter_table_employees',11),
(20,'2023_11_25_120746_add_department_id_sections',12),
(21,'2023_11_27_055125_create_table_articles',13),
(22,'2023_12_08_111312_create_inductions_table',14),
(23,'2023_12_08_130310_create_quiz_table',15),
(24,'2023_08_25_064711_create_activity_log_table',16),
(25,'2023_12_12_154001_create_quiz_details_table',17),
(26,'2023_12_25_165414_create_employee_induction_details_table',18);

/*Table structure for table `model_has_permissions` */

DROP TABLE IF EXISTS `model_has_permissions`;

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `model_has_permissions` */

/*Table structure for table `model_has_roles` */

DROP TABLE IF EXISTS `model_has_roles`;

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `model_has_roles` */

insert  into `model_has_roles`(`role_id`,`model_type`,`model_id`) values 
(3,'App\\Models\\User',1),
(3,'App\\Models\\User',17),
(3,'App\\Models\\User',18),
(4,'App\\Models\\User',4),
(4,'App\\Models\\User',11),
(4,'App\\Models\\User',12),
(5,'App\\Models\\User',10),
(6,'App\\Models\\User',19),
(6,'App\\Models\\User',20),
(6,'App\\Models\\User',21),
(6,'App\\Models\\User',22);

/*Table structure for table `notices` */

DROP TABLE IF EXISTS `notices`;

CREATE TABLE `notices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sr_no` varchar(20) DEFAULT NULL,
  `notice_date` date DEFAULT NULL,
  `notice` varchar(255) DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `designation_id` bigint(20) unsigned DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `notices` */

insert  into `notices`(`id`,`sr_no`,`notice_date`,`notice`,`department_id`,`designation_id`,`attachment`,`description`,`created_by`,`updated_by`,`created_at`,`updated_at`) values 
(1,'N00001','2023-11-18','whenHas',1,3,NULL,'demo',1,10,'2023-11-18 10:30:26','2023-12-11 11:49:42'),
(2,'N00002','2023-11-18','Axios',8,7,NULL,NULL,1,1,'2023-11-18 12:29:20','2023-11-18 18:23:23'),
(3,'N00003','2023-11-20','you need to decode it before use',1,1,NULL,'you need to decode it before use',1,10,'2023-11-20 05:32:33','2023-12-11 11:49:03'),
(4,'N00004','2023-11-20','If you had complex data that you manually converted to JSON, you need to decode it before use',8,7,NULL,'So, we can access the Phone model from our User model. Next, let\'s define a relationship on the Phone model that will let us access the user that owns the phone',1,10,'2023-11-20 05:34:43','2023-12-11 11:48:52'),
(5,'N00005','2023-11-21','file',1,1,NULL,'file',1,10,'2023-11-20 05:45:57','2023-12-11 11:48:33'),
(6,'N00006','2023-11-27','Defining The Inverse Of The Relationship',8,8,NULL,'Additionally, Eloquent assumes that the foreign key should have a value matching the primary key column of the parent.',1,1,'2023-11-27 04:51:49','2023-11-27 04:51:49'),
(7,'N00007','2023-11-01','CModel API Documentation',10,7,NULL,'validators property read-only. public array getValidators(string $attribute=NULL) ... For example, \'department_name\' or \'DepartmentName\' becomes \'Department Name\'',1,10,'2023-11-27 05:25:57','2023-12-11 11:48:12');

/*Table structure for table `password_reset_tokens` */

DROP TABLE IF EXISTS `password_reset_tokens`;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_reset_tokens` */

insert  into `password_reset_tokens`(`email`,`token`,`created_at`) values 
('arpita.lad2004@gmail.com','$2y$10$3ry63XV/gyddp7ijMnRAu.AjE27utdLmfc4iMkboGaxshMawLpn0i','2023-11-18 04:55:04');

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permissions` */

insert  into `permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values 
(1,'sanctum.csrf-cookie','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(2,'dashboard','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(5,'profile.edit','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(6,'profile.update','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(7,'profile.destroy','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(29,'roles.index','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(30,'roles.create','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(31,'roles.store','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(32,'roles.show','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(33,'roles.edit','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(34,'roles.update','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(35,'roles.destroy','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(36,'users.index','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(37,'users.create','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(38,'users.store','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(39,'users.show','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(40,'users.edit','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(41,'users.update','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(42,'users.destroy','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(43,'permissions.index','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(44,'permissions.create','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(45,'permissions.store','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(46,'permissions.show','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(47,'permissions.edit','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(48,'permissions.update','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(49,'permissions.destroy','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(50,'register','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(51,'login','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(52,'password.request','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(53,'password.email','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(54,'password.reset','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(55,'password.store','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(56,'verification.notice','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(57,'verification.verify','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(58,'verification.send','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(59,'password.confirm','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(60,'password.update','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(61,'logout','web','2023-11-06 07:24:06','2023-11-06 07:24:06'),
(62,'designations.index','web','2023-11-17 10:15:47','2023-11-17 10:15:47'),
(63,'designations.create','web','2023-11-17 10:15:47','2023-11-17 10:15:47'),
(64,'designations.store','web','2023-11-17 10:15:47','2023-11-17 10:15:47'),
(65,'designations.show','web','2023-11-17 10:15:47','2023-11-17 10:15:47'),
(66,'designations.edit','web','2023-11-17 10:15:47','2023-11-17 10:15:47'),
(67,'designations.update','web','2023-11-17 10:15:47','2023-11-17 10:15:47'),
(68,'designations.destroy','web','2023-11-17 10:15:47','2023-11-17 10:15:47'),
(69,'departments.index','web','2023-11-17 10:15:47','2023-11-17 10:15:47'),
(70,'departments.create','web','2023-11-17 10:15:47','2023-11-17 10:15:47'),
(71,'departments.store','web','2023-11-17 10:15:47','2023-11-17 10:15:47'),
(72,'departments.show','web','2023-11-17 10:15:47','2023-11-17 10:15:47'),
(73,'departments.edit','web','2023-11-17 10:15:47','2023-11-17 10:15:47'),
(74,'departments.update','web','2023-11-17 10:15:47','2023-11-17 10:15:47'),
(75,'departments.destroy','web','2023-11-17 10:15:47','2023-11-17 10:15:47'),
(76,'notices.index','web','2023-11-18 06:36:50','2023-11-18 06:36:50'),
(77,'notices.create','web','2023-11-18 06:36:50','2023-11-18 06:36:50'),
(78,'notices.store','web','2023-11-18 06:36:50','2023-11-18 06:36:50'),
(79,'notices.show','web','2023-11-18 06:36:50','2023-11-18 06:36:50'),
(80,'notices.edit','web','2023-11-18 06:36:50','2023-11-18 06:36:50'),
(81,'notices.update','web','2023-11-18 06:36:50','2023-11-18 06:36:50'),
(82,'notices.destroy','web','2023-11-18 06:36:50','2023-11-18 06:36:50'),
(83,'sections.index','web','2023-11-20 10:14:21','2023-11-20 10:14:21'),
(84,'sections.create','web','2023-11-20 10:14:22','2023-11-20 10:14:22'),
(85,'sections.store','web','2023-11-20 10:14:22','2023-11-20 10:14:22'),
(86,'sections.show','web','2023-11-20 10:14:22','2023-11-20 10:14:22'),
(87,'sections.edit','web','2023-11-20 10:14:22','2023-11-20 10:14:22'),
(88,'sections.update','web','2023-11-20 10:14:22','2023-11-20 10:14:22'),
(89,'sections.destroy','web','2023-11-20 10:14:22','2023-11-20 10:14:22'),
(90,'employees.index','web','2023-11-20 12:02:15','2023-11-20 12:02:15'),
(91,'employees.create','web','2023-11-20 12:02:15','2023-11-20 12:02:15'),
(92,'employees.store','web','2023-11-20 12:02:16','2023-11-20 12:02:16'),
(93,'employees.show','web','2023-11-20 12:02:16','2023-11-20 12:02:16'),
(94,'employees.edit','web','2023-11-20 12:02:16','2023-11-20 12:02:16'),
(95,'employees.update','web','2023-11-20 12:02:16','2023-11-20 12:02:16'),
(96,'employees.destroy','web','2023-11-20 12:02:16','2023-11-20 12:02:16'),
(97,'notices.export','web','2023-11-27 06:13:22','2023-11-27 06:13:22'),
(98,'articles.index','web','2023-11-27 06:13:22','2023-11-27 06:13:22'),
(99,'articles.create','web','2023-11-27 06:13:22','2023-11-27 06:13:22'),
(100,'articles.store','web','2023-11-27 06:13:22','2023-11-27 06:13:22'),
(101,'articles.show','web','2023-11-27 06:13:22','2023-11-27 06:13:22'),
(102,'articles.edit','web','2023-11-27 06:13:22','2023-11-27 06:13:22'),
(103,'articles.update','web','2023-11-27 06:13:22','2023-11-27 06:13:22'),
(104,'articles.destroy','web','2023-11-27 06:13:22','2023-11-27 06:13:22'),
(105,'employee_dashboard','web','2023-11-30 10:41:49','2023-11-30 10:41:49'),
(106,'employee_dashboard.index','web','2023-12-07 13:17:16','2023-12-07 13:17:16'),
(107,'employee_dashboard.create','web','2023-12-07 13:17:16','2023-12-07 13:17:16'),
(108,'employee_dashboard.store','web','2023-12-07 13:17:16','2023-12-07 13:17:16'),
(109,'employee_dashboard.show','web','2023-12-07 13:17:16','2023-12-07 13:17:16'),
(110,'employee_dashboard.edit','web','2023-12-07 13:17:16','2023-12-07 13:17:16'),
(111,'employee_dashboard.update','web','2023-12-07 13:17:16','2023-12-07 13:17:16'),
(112,'employee_dashboard.destroy','web','2023-12-07 13:17:17','2023-12-07 13:17:17'),
(113,'article','web','2023-12-07 13:17:17','2023-12-07 13:17:17'),
(114,'article-detail','web','2023-12-07 13:17:17','2023-12-07 13:17:17'),
(115,'employees.status','web','2023-12-07 13:17:17','2023-12-07 13:17:17'),
(116,'inductions.index','web','2023-12-08 11:10:30','2023-12-08 11:10:30'),
(117,'inductions.create','web','2023-12-08 11:10:30','2023-12-08 11:10:30'),
(118,'inductions.store','web','2023-12-08 11:10:30','2023-12-08 11:10:30'),
(119,'inductions.show','web','2023-12-08 11:10:30','2023-12-08 11:10:30'),
(120,'inductions.edit','web','2023-12-08 11:10:30','2023-12-08 11:10:30'),
(121,'inductions.update','web','2023-12-08 11:10:30','2023-12-08 11:10:30'),
(122,'inductions.destroy','web','2023-12-08 11:10:30','2023-12-08 11:10:30'),
(123,'quiz.index','web','2023-12-09 04:26:40','2023-12-09 04:26:40'),
(124,'quiz.create','web','2023-12-09 04:26:40','2023-12-09 04:26:40'),
(125,'quiz.store','web','2023-12-09 04:26:40','2023-12-09 04:26:40'),
(126,'quiz.show','web','2023-12-09 04:26:40','2023-12-09 04:26:40'),
(127,'quiz.edit','web','2023-12-09 04:26:40','2023-12-09 04:26:40'),
(128,'quiz.update','web','2023-12-09 04:26:40','2023-12-09 04:26:40'),
(129,'quiz.destroy','web','2023-12-09 04:26:40','2023-12-09 04:26:40'),
(130,'employees.log','web','2023-12-09 12:39:05','2023-12-09 12:39:05'),
(131,'contacts','web','2023-12-09 17:57:27','2023-12-09 17:57:27'),
(132,'view','web','2023-12-11 16:53:35','2023-12-11 16:53:35'),
(133,'induction','web','2023-12-11 16:53:35','2023-12-11 16:53:35'),
(134,'quiz','web','2023-12-27 16:11:14','2023-12-27 16:11:14'),
(135,'store','web','2023-12-27 16:11:14','2023-12-27 16:11:14');

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

/*Table structure for table `quiz_details` */

DROP TABLE IF EXISTS `quiz_details`;

CREATE TABLE `quiz_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `quiz_id` bigint(20) unsigned DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `isCorrect` enum('0','1') DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `quiz_details` */

insert  into `quiz_details`(`id`,`quiz_id`,`answer`,`isCorrect`,`created_by`,`updated_by`,`created_at`,`updated_at`) values 
(1,2,'A relational database management system',NULL,10,10,'2023-12-13 18:13:13','2023-12-13 18:13:13'),
(2,2,'Cross-platform, open-source and free',NULL,10,10,'2023-12-13 18:13:13','2023-12-13 18:13:13'),
(3,2,'All the options are correct','1',10,10,'2023-12-13 18:13:13','2023-12-13 18:13:13'),
(4,2,'Developed, distributed, and supported by Oracle Corporation',NULL,10,10,'2023-12-13 18:13:13','2023-12-13 18:13:13'),
(5,3,'EXTRACT',NULL,10,10,'2023-12-13 18:15:22','2023-12-13 18:15:22'),
(6,3,'SELECT','1',10,10,'2023-12-13 18:15:22','2023-12-13 18:15:22'),
(7,3,'GET',NULL,10,10,'2023-12-13 18:15:22','2023-12-13 18:15:22'),
(8,3,'OPEN',NULL,10,10,'2023-12-13 18:15:22','2023-12-13 18:15:22'),
(9,4,'The Income Statement',NULL,10,10,'2023-12-13 18:19:02','2023-12-13 18:19:02'),
(10,4,'Statement of Cash Flow',NULL,10,10,'2023-12-13 18:19:02','2023-12-13 18:19:02'),
(11,4,'Trial Balance','1',10,10,'2023-12-13 18:19:02','2023-12-13 18:19:02'),
(12,4,'The Balance Sheet',NULL,10,10,'2023-12-13 18:19:02','2023-12-13 18:19:02'),
(13,5,'For internal analysis',NULL,10,10,'2023-12-13 18:20:04','2023-12-13 18:20:04'),
(14,5,'For external negotiation',NULL,10,10,'2023-12-13 18:20:04','2023-12-13 18:20:04'),
(15,5,'For compliance',NULL,10,10,'2023-12-13 18:20:04','2023-12-13 18:20:04'),
(16,5,'All of the above','1',10,10,'2023-12-13 18:20:04','2023-12-13 18:20:04'),
(17,6,'Maharashtra','1',10,10,'2023-12-13 18:21:50','2023-12-13 18:21:50'),
(18,6,'Punjab',NULL,10,10,'2023-12-13 18:21:50','2023-12-13 18:21:50'),
(19,6,'Gujrat',NULL,10,10,'2023-12-13 18:21:50','2023-12-13 18:21:50'),
(20,6,'Karnataka',NULL,10,10,'2023-12-13 18:21:50','2023-12-13 18:21:50'),
(21,7,'tulip',NULL,10,10,'2023-12-13 18:23:07','2023-12-13 18:23:07'),
(22,7,'rose',NULL,10,10,'2023-12-13 18:23:07','2023-12-13 18:23:07'),
(23,7,'bud','1',10,10,'2023-12-13 18:23:07','2023-12-13 18:23:07'),
(24,7,'dailsy',NULL,10,10,'2023-12-13 18:23:07','2023-12-13 18:23:07'),
(25,8,'Malleability',NULL,10,10,'2023-12-13 18:25:00','2023-12-13 18:25:00'),
(26,8,'Stiffness',NULL,10,10,'2023-12-13 18:25:00','2023-12-13 18:25:00'),
(27,8,'Hardness',NULL,10,10,'2023-12-13 18:25:00','2023-12-13 18:25:00'),
(28,8,'Strength','1',10,10,'2023-12-13 18:25:00','2023-12-13 18:25:00'),
(29,9,'Rockwell C hardness test',NULL,10,10,'2023-12-13 18:26:17','2023-12-13 18:26:17'),
(30,9,'Brinell Hardness test','1',10,10,'2023-12-13 18:26:17','2023-12-13 18:26:17'),
(31,9,'Rockwell B hardness test',NULL,10,10,'2023-12-13 18:26:17','2023-12-13 18:26:17'),
(32,9,'Vickers hardness test',NULL,10,10,'2023-12-13 18:26:17','2023-12-13 18:26:17'),
(33,10,'parsley',NULL,10,10,'2023-12-13 18:34:19','2023-12-13 18:34:19'),
(34,10,'basil',NULL,10,10,'2023-12-13 18:34:19','2023-12-13 18:34:19'),
(35,10,'dill','1',10,10,'2023-12-13 18:34:19','2023-12-13 18:34:19'),
(36,10,'mayonnaise',NULL,10,10,'2023-12-13 18:34:19','2023-12-13 18:34:19'),
(37,11,'tyre',NULL,10,10,'2023-12-13 18:35:32','2023-12-13 18:35:32'),
(38,11,'steering wheel',NULL,10,10,'2023-12-13 18:35:32','2023-12-13 18:35:32'),
(39,11,'engine',NULL,10,10,'2023-12-13 18:35:32','2023-12-13 18:35:32'),
(40,11,'car','1',10,10,'2023-12-13 18:35:32','2023-12-13 18:35:32'),
(41,12,'true','0',10,10,'2023-12-14 11:12:39','2023-12-14 11:12:39'),
(42,12,'false','1',10,10,'2023-12-14 11:12:39','2023-12-14 11:12:39');

/*Table structure for table `quizzes` */

DROP TABLE IF EXISTS `quizzes`;

CREATE TABLE `quizzes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(255) DEFAULT NULL,
  `induction_id` int(11) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `quizzes` */

insert  into `quizzes`(`id`,`question`,`induction_id`,`type`,`created_by`,`updated_by`,`created_at`,`updated_at`) values 
(2,'what is mysql?',2,'Single Choice',10,10,'2023-12-13 18:13:13','2023-12-13 18:13:13'),
(3,'Which MySQL statement is used to select data from a database?',2,'Single Choice',10,10,'2023-12-13 18:15:22','2023-12-13 18:15:22'),
(4,'Which of the following is not a core financial statement?',3,'Single Choice',10,10,'2023-12-13 18:19:02','2023-12-13 18:19:02'),
(5,'How are a company’s financial statements used?',3,'Single Choice',10,10,'2023-12-13 18:20:04','2023-12-13 18:20:04'),
(6,'Tata Motors opened its fourth Registered Vehicle Scrapping Facility (RVSF) in which Indian state, emphasizing environmental sustainability?',4,'Single Choice',10,10,'2023-12-13 18:21:50','2023-12-13 18:21:50'),
(7,'Which word does NOT belong with the others?',4,'Single Choice',10,10,'2023-12-13 18:23:07','2023-12-13 18:23:07'),
(8,'What we call the resistance of a material against any external force.',5,'Single Choice',10,10,'2023-12-13 18:25:00','2023-12-13 18:25:00'),
(9,'Which hardness test uses the steel ball as indenter?',5,'Single Choice',10,10,'2023-12-13 18:26:17','2023-12-13 18:26:17'),
(10,'Three of the words will be in the same classification, the remaining one will not be. Your answer will be the one word that does NOT belong in the same classification as the others.',6,'Single Choice',10,10,'2023-12-13 18:34:19','2023-12-13 18:34:19'),
(11,'Which word does NOT belong with the others?',6,'Single Choice',10,10,'2023-12-13 18:35:32','2023-12-13 18:35:32'),
(12,'testing',4,'Single Choice',10,10,'2023-12-14 11:12:39','2023-12-14 11:14:06');

/*Table structure for table `role_has_permissions` */

DROP TABLE IF EXISTS `role_has_permissions`;

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `role_has_permissions` */

insert  into `role_has_permissions`(`permission_id`,`role_id`) values 
(1,3),
(1,5),
(2,3),
(2,5),
(5,3),
(5,5),
(6,3),
(6,5),
(7,3),
(7,5),
(29,3),
(29,5),
(30,3),
(30,5),
(31,3),
(31,5),
(32,3),
(32,5),
(33,3),
(33,5),
(34,3),
(34,5),
(35,3),
(35,5),
(36,3),
(36,5),
(37,3),
(37,5),
(38,3),
(38,5),
(39,3),
(39,5),
(40,3),
(40,5),
(41,3),
(41,5),
(42,3),
(42,5),
(43,3),
(43,5),
(43,9),
(44,3),
(44,5),
(44,9),
(45,3),
(45,4),
(45,5),
(45,9),
(46,3),
(46,5),
(46,9),
(47,3),
(47,4),
(47,5),
(47,9),
(48,3),
(48,4),
(48,5),
(48,9),
(49,3),
(49,5),
(49,9),
(50,3),
(50,4),
(50,5),
(51,3),
(51,4),
(51,5),
(52,3),
(52,4),
(52,5),
(53,3),
(53,4),
(53,5),
(54,3),
(54,4),
(54,5),
(55,3),
(55,4),
(55,5),
(56,3),
(56,4),
(56,5),
(57,3),
(57,4),
(57,5),
(58,3),
(58,4),
(58,5),
(59,3),
(59,4),
(59,5),
(60,3),
(60,4),
(60,5),
(61,3),
(61,4),
(61,5),
(62,3),
(62,5),
(63,3),
(63,5),
(64,3),
(64,5),
(65,3),
(65,5),
(66,3),
(66,5),
(67,3),
(67,5),
(68,3),
(68,5),
(69,3),
(69,5),
(70,3),
(70,5),
(71,3),
(71,5),
(72,3),
(72,5),
(73,3),
(73,5),
(74,3),
(74,5),
(75,3),
(75,5),
(76,3),
(76,5),
(77,3),
(77,5),
(78,3),
(78,5),
(79,3),
(79,5),
(80,3),
(80,5),
(81,3),
(81,5),
(82,3),
(82,5),
(83,3),
(83,5),
(84,3),
(84,5),
(85,3),
(85,5),
(86,3),
(86,5),
(87,3),
(87,5),
(88,3),
(88,5),
(89,3),
(89,5),
(90,3),
(90,5),
(91,3),
(91,5),
(92,3),
(92,5),
(93,3),
(93,5),
(94,3),
(94,5),
(95,3),
(95,5),
(96,3),
(96,5),
(97,3),
(97,5),
(98,3),
(98,5),
(99,3),
(99,5),
(100,3),
(100,5),
(101,3),
(101,5),
(102,3),
(102,5),
(103,3),
(103,5),
(104,3),
(104,5),
(105,3),
(105,5),
(105,6),
(106,3),
(106,5),
(106,6),
(107,3),
(107,5),
(107,6),
(108,3),
(108,5),
(108,6),
(109,3),
(109,5),
(109,6),
(110,3),
(110,5),
(110,6),
(111,3),
(111,5),
(111,6),
(112,3),
(112,5),
(112,6),
(113,3),
(113,5),
(113,6),
(114,3),
(114,5),
(114,6),
(115,3),
(115,5),
(116,3),
(116,5),
(117,3),
(117,5),
(118,3),
(118,5),
(119,3),
(119,5),
(120,3),
(120,5),
(121,3),
(121,5),
(122,3),
(122,5),
(123,3),
(123,5),
(124,3),
(124,5),
(125,3),
(125,5),
(126,3),
(126,5),
(127,3),
(127,5),
(128,3),
(128,5),
(129,3),
(129,5),
(130,3),
(130,5),
(131,3),
(131,5),
(131,6),
(133,6);

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values 
(3,'Admin','web','2023-11-06 08:22:37','2023-11-08 05:41:47'),
(4,'User','web','2023-11-06 11:39:29','2023-11-06 11:39:29'),
(5,'Root','web','2023-11-08 05:48:07','2023-11-08 05:48:07'),
(6,'Employee','web','2023-11-21 07:04:04','2023-11-21 07:04:04'),
(9,'test','web','2023-12-27 18:06:28','2023-12-27 18:06:28');

/*Table structure for table `sections` */

DROP TABLE IF EXISTS `sections`;

CREATE TABLE `sections` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `section_name` varchar(30) DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sections` */

insert  into `sections`(`id`,`section_name`,`department_id`,`created_by`,`updated_by`,`created_at`,`updated_at`) values 
(2,'Section 2',1,1,1,'2023-11-20 10:22:19','2023-11-21 13:11:19'),
(3,'Section',1,1,1,'2023-11-20 10:26:39','2023-11-24 08:36:17'),
(4,'Act',1,1,1,'2023-11-21 13:11:30','2023-11-21 13:11:30'),
(8,'section1',1,1,1,'2023-11-25 12:50:20','2023-11-25 12:50:20'),
(9,'demo',4,1,1,'2023-11-27 04:39:13','2023-11-27 04:49:39');

/*Table structure for table `user_logins` */

DROP TABLE IF EXISTS `user_logins`;

CREATE TABLE `user_logins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `platform` varchar(255) DEFAULT NULL,
  `logged_in` varchar(255) DEFAULT NULL,
  `logged_out` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `user_logins` */

insert  into `user_logins`(`id`,`user_id`,`ip_address`,`user_agent`,`session_id`,`browser`,`platform`,`logged_in`,`logged_out`,`updated_at`,`created_at`) values 
(1,19,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/114.0','KQDshc9bUHmBF8oTktlU5Sj3YmYJC2ZlmCIy5ahj',NULL,NULL,'2023-12-09 12:15:38','2023-12-09 12:17:26','2023-12-09 12:17:26','2023-12-09 12:15:38'),
(2,19,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/114.0','aWxKKaVjMEvH8XhzLG35ej0uu6ltnzJhwKcrhEFi',NULL,NULL,'2023-12-09 12:18:38','2023-12-09 12:31:06','2023-12-09 12:31:06','2023-12-09 12:18:38'),
(3,19,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36','9N5W531gtrjhJpIEkLAWiizLsK3SzCgboBkrddnC',NULL,NULL,'2023-12-09 12:31:35','2023-12-09 12:31:39','2023-12-09 12:31:39','2023-12-09 12:31:35'),
(4,10,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36','Rc6PgHMcgHhHldPjSBPs2ZUlXVsaAzQ9HOddwl6e',NULL,NULL,'2023-12-09 12:31:41',NULL,'2023-12-09 12:31:41','2023-12-09 12:31:41'),
(5,20,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/114.0','vkuaQjcywgWCCdIXmVbJMmc0goF13pG9dICMEmRU',NULL,NULL,'2023-12-09 12:32:48','2023-12-09 12:32:55','2023-12-09 12:32:55','2023-12-09 12:32:48'),
(7,19,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/114.0','nYEY2hiHb5ubt63NJ96vUeV7kgHTyEQhSxud7RzV',NULL,'Linux ','2023-12-09 13:09:55','2023-12-09 13:10:51','2023-12-09 13:10:51','2023-12-09 13:09:55'),
(8,19,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/114.0','mDKYZaF1PY0xnuWjHy1P4DzRnNLnOUU7Me5FSc6I','Firefox 114.0','Linux ','2023-12-09 13:11:23','2023-12-09 13:11:33','2023-12-09 13:11:33','2023-12-09 13:11:23'),
(9,19,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/114.0','2os4bRqQdSwqNyiFTMlscdLO4qLaKDjKv3jAYJRe','Firefox 114.0','Linux ','2023-12-09 13:13:14',NULL,'2023-12-09 13:13:14','2023-12-09 13:13:14'),
(10,10,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36','hFxhbSXwCgKzV5nHSRiNGQyOoqxf2kPptFNciTlS','Chrome 116.0.0.0','Linux ','2023-12-11 10:53:45',NULL,'2023-12-11 10:53:45','2023-12-11 10:53:45'),
(11,19,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/114.0','Hi7XIlQeS3SsfWjB4j9PgeuS5c2rLcfuj3KyAzjg','Firefox 114.0','Linux ','2023-12-11 10:54:02',NULL,'2023-12-11 10:54:02','2023-12-11 10:54:02'),
(12,19,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36','CIVZPryeeuKsqCTx53lxzeCAzDZFQzZxza0NB5AZ','Chrome 119.0.0.0','Windows 10.0','2023-12-11 13:13:49','2023-12-11 13:15:53','2023-12-11 13:15:53','2023-12-11 13:13:50'),
(13,22,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36','gjj78s2BTJC7iwF4IitZuYncEhonnxRBlyH4VE2C','Chrome 119.0.0.0','Windows 10.0','2023-12-11 13:21:45','2023-12-11 13:26:06','2023-12-11 13:26:06','2023-12-11 13:21:49'),
(14,19,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36','eylc4QWdVdK3N36ICTccBEGl6EybsZIgxfwSuOHT','Chrome 119.0.0.0','Windows 10.0','2023-12-11 13:26:46','2023-12-11 13:27:29','2023-12-11 13:27:29','2023-12-11 13:26:46'),
(15,21,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36','pQ1ID4hBXdbTmaA9PEjWAeUQeowOkKVQEUcO0HNk','Chrome 119.0.0.0','Windows 10.0','2023-12-11 13:27:39',NULL,'2023-12-11 13:27:39','2023-12-11 13:27:39'),
(16,10,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36','AkTCqllzqwX7sC60GggwVP329jFz7GSFSlq9SjQn','Chrome 119.0.0.0','Windows 10.0','2023-12-11 16:13:40',NULL,'2023-12-11 16:13:40','2023-12-11 16:13:40'),
(17,22,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0','aj3E9CxuBZcrWrGgw0AGw5KGPLSvs6o5KfbROpHs','Edge 120.0.0.0','Windows 10.0','2023-12-11 16:17:23',NULL,'2023-12-11 16:17:23','2023-12-11 16:17:23'),
(18,22,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0','tZa6grCggy1gPO6GtP7TCO9a1WZFMvgDb9u6ytEa','Edge 120.0.0.0','Windows 10.0','2023-12-12 10:01:38',NULL,'2023-12-12 10:01:38','2023-12-12 10:01:38'),
(19,19,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36','wscyAghifdbo0xRKO6xBhdIcC7Bo2Eg98Q0pipw9','Chrome 120.0.0.0','Windows 10.0','2023-12-12 10:13:21','2023-12-12 10:15:19','2023-12-12 10:15:19','2023-12-12 10:13:21'),
(20,10,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36','e7evpBLtkMkgMokTlWCMloPBM9eolwhOve58LKGm','Chrome 120.0.0.0','Windows 10.0','2023-12-12 10:31:55','2023-12-12 10:55:19','2023-12-12 10:55:19','2023-12-12 10:31:56'),
(21,19,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36','KGVHiCbpjn9gyHv7PARP7wKsA4JtsieU0YZjZDoZ','Chrome 120.0.0.0','Windows 10.0','2023-12-12 10:55:36','2023-12-12 10:56:10','2023-12-12 10:56:10','2023-12-12 10:55:36'),
(22,10,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36','WX8auSkTzOFfiSYtceEyznlbVctAn8qpRWdO6Co3','Chrome 120.0.0.0','Windows 10.0','2023-12-12 10:56:49',NULL,'2023-12-12 10:56:49','2023-12-12 10:56:49'),
(23,10,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36','3vSbqzvXu4E7J8BTD3GYsBKs5wA7KgzuNmuiNwr4','Chrome 120.0.0.0','Windows 10.0','2023-12-12 15:16:02',NULL,'2023-12-12 15:16:06','2023-12-12 15:16:06'),
(24,19,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0','aqW8O2j1hxfMxnNQuSGMFRGdT2GNf98573uhacjz','Edge 120.0.0.0','Windows 10.0','2023-12-12 15:29:53',NULL,'2023-12-12 15:29:53','2023-12-12 15:29:53'),
(25,19,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0','TVG5MxNBCOmc4RqETcp19IUL1c307LrHnCbsH7nz','Edge 120.0.0.0','Windows 10.0','2023-12-13 10:04:16','2023-12-13 16:32:08','2023-12-13 16:32:08','2023-12-13 10:04:17'),
(26,10,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36','6elX9aenDFQiXOcR6H1r46KjwlEraiKBKpqe8x2G','Chrome 120.0.0.0','Windows 10.0','2023-12-13 11:03:51','2023-12-13 13:47:22','2023-12-13 13:47:22','2023-12-13 11:03:51'),
(27,19,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36','kRhMNEvp6COiYwzdfxt7pkXOs2FhYYFecbXYwOPP','Chrome 120.0.0.0','Windows 10.0','2023-12-13 13:47:36','2023-12-13 17:00:14','2023-12-13 17:00:14','2023-12-13 13:47:36'),
(28,10,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0','Uchfv3geQz9qqy2jyrEO6oGyqlfmfzzSFbYjFmSO','Edge 120.0.0.0','Windows 10.0','2023-12-13 16:32:19',NULL,'2023-12-13 16:32:19','2023-12-13 16:32:19'),
(29,10,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36','u8CzfyuP6HneXsR7j1mPplwjkZ6PXNEkVKOC89t2','Chrome 120.0.0.0','Windows 10.0','2023-12-13 17:00:44',NULL,'2023-12-13 17:00:44','2023-12-13 17:00:44'),
(30,10,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0','C5Wm2qUhlHdzdrJHKDqMn32Tt3PIo9F7AbqH22ak','Edge 120.0.0.0','Windows 10.0','2023-12-14 10:03:51','2023-12-14 11:59:10','2023-12-14 11:59:10','2023-12-14 10:03:51'),
(31,19,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0','HynZwKr5bD9Tutdnt7fI2I7lRCPEN6tUtSJqXrMj','Edge 120.0.0.0','Windows 10.0','2023-12-14 11:59:23',NULL,'2023-12-14 11:59:23','2023-12-14 11:59:23'),
(32,19,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36','FhVJHBPyRM21UZaBkNAPK2yGtSdnEZRapiVAGtqU','Chrome 120.0.0.0','Windows 10.0','2023-12-14 12:00:02',NULL,'2023-12-14 12:00:02','2023-12-14 12:00:02'),
(33,19,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0','qTEH6TOB72Mp4VlHy29XgU270tzydxD5I4lmZZ7F','Edge 120.0.0.0','Windows 10.0','2023-12-14 16:04:04','2023-12-14 17:47:06','2023-12-14 17:47:06','2023-12-14 16:04:04'),
(34,10,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0','4SEqRIpTm24HMBoWKuXYXkx8NAn6nQ6ZWFvaxQI5','Edge 120.0.0.0','Windows 10.0','2023-12-14 18:09:13',NULL,'2023-12-14 18:09:13','2023-12-14 18:09:13'),
(35,19,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0','ndMezZGaNajR62Xue5dSJsqwx37OB14tyquaJK0Y','Edge 120.0.0.0','Windows 10.0','2023-12-15 10:01:21',NULL,'2023-12-15 10:01:21','2023-12-15 10:01:21'),
(36,19,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36','7Ik4IU4PQs4nlmTD4HITUKFopXJMM0rZgdpLOEj8','Chrome 120.0.0.0','Windows 10.0','2023-12-15 10:03:49',NULL,'2023-12-15 10:03:49','2023-12-15 10:03:49'),
(37,10,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0','xlvFRQM38UlMUJVrrJwjyloiV56hIPHMN02rhjZ6','Edge 120.0.0.0','Windows 10.0','2023-12-16 11:04:42','2023-12-16 11:22:11','2023-12-16 11:22:11','2023-12-16 11:04:42'),
(38,19,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0','Lbs1ETOk6md8JTXXaBxyQ8lFYRiLa1YwcZoBeYll','Edge 120.0.0.0','Windows 10.0','2023-12-16 11:22:53',NULL,'2023-12-16 11:22:53','2023-12-16 11:22:53'),
(39,19,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0','M22Xg92ptbHLM3hFpM3gc5K7cuUBfRbKBCyjxLBf','Edge 120.0.0.0','Windows 10.0','2023-12-16 14:19:24',NULL,'2023-12-16 14:19:24','2023-12-16 14:19:24'),
(40,19,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36','qUH1O0KqxrBL4Bou6muyXCk86ZnBHanRAe9dkyEG','Chrome 120.0.0.0','Windows 10.0','2023-12-16 15:46:00',NULL,'2023-12-16 15:46:00','2023-12-16 15:46:00'),
(41,19,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36','L1tJOlHmoH2jehDRPGYpjDruKrKk1a0xVp1pYfPA','Chrome 120.0.0.0','Windows 10.0','2023-12-18 10:58:22','2023-12-18 18:25:04','2023-12-18 18:25:04','2023-12-18 10:58:22'),
(42,10,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36','af0ehLEZT8GeoUM4Byw6TRTKOX1668QlqGydB8Ky','Chrome 120.0.0.0','Windows 10.0','2023-12-18 18:25:20',NULL,'2023-12-18 18:25:20','2023-12-18 18:25:20'),
(43,10,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36','TMdQkimZCzjf3brjpSxvMzpImQfuaDI5laISHriy','Chrome 116.0.0.0','Linux ','2023-12-19 10:51:42',NULL,'2023-12-19 10:51:42','2023-12-19 10:51:42'),
(44,10,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36','EzAyS0IdK0vRa5FllE17KiuX8iQxDwof1k3hwFAr','Chrome 116.0.0.0','Linux ','2023-12-19 11:11:43','2023-12-19 11:11:56','2023-12-19 11:11:56','2023-12-19 11:11:43'),
(45,19,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36','12pMzL2xS19kKz614BnMGlQUwICGQWwjxXWPSF8c','Chrome 116.0.0.0','Linux ','2023-12-19 11:12:00',NULL,'2023-12-19 11:12:00','2023-12-19 11:12:00'),
(46,19,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36','JQiPg0sp8ow3UTyXY8av2Dw2rL90OsnAEQVJanRr','Chrome 116.0.0.0','Linux ','2023-12-19 11:32:26','2023-12-19 11:33:37','2023-12-19 11:33:37','2023-12-19 11:32:26'),
(47,10,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36','wrlV2X191hy8aw7VSjwWxSIQtQ376G0307CH471f','Chrome 116.0.0.0','Linux ','2023-12-19 11:33:41',NULL,'2023-12-19 11:33:41','2023-12-19 11:33:41'),
(48,19,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36','FqwGWCV6iKThdjF9GmH1zReClPtf9d3PFy8DUcrB','Chrome 116.0.0.0','Linux ','2023-12-19 16:05:32',NULL,'2023-12-19 16:05:32','2023-12-19 16:05:32'),
(49,19,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36','XeTvIBGgSwGSBOBT3SAsoLbM9k9MDBWo1wQsgSVZ','Chrome 116.0.0.0','Linux ','2023-12-20 10:10:51',NULL,'2023-12-20 10:10:51','2023-12-20 10:10:51'),
(50,10,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36','AeqoDiKNcM9xY5UIM9KECcQXDpp8enEq9Mvfrlrz','Chrome 116.0.0.0','Linux ','2023-12-22 17:33:04','2023-12-22 17:33:22','2023-12-22 17:33:22','2023-12-22 17:33:04'),
(51,19,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36','aWxoMyrBIwUjfQxcDaxsuOSeiyIs4AOQUQrG1oht','Chrome 116.0.0.0','Linux ','2023-12-22 17:33:27',NULL,'2023-12-22 17:33:27','2023-12-22 17:33:27'),
(52,19,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36','GsWM1qAwSKmYfLuRnVhrrjFQHnPff2AvtsII8HEU','Chrome 116.0.0.0','Linux ','2023-12-25 09:59:08',NULL,'2023-12-25 09:59:08','2023-12-25 09:59:08'),
(53,19,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36','mOicTMXsWF7gbztVo83XOJQbE3IYscdEVPKi5jUm','Chrome 116.0.0.0','Linux ','2023-12-26 10:18:42',NULL,'2023-12-26 10:18:42','2023-12-26 10:18:42'),
(54,10,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36','hByzyMBAW6fbkcNbgX6qU290oHab5eOfNXgTRMK3','Chrome 116.0.0.0','Linux ','2023-12-27 09:56:28',NULL,'2023-12-27 09:56:28','2023-12-27 09:56:28'),
(55,10,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36','ROXCJ40GvCQiZUaLa5uXxReCWKnatXT83YyfrCJo','Chrome 116.0.0.0','Linux ','2023-12-27 10:19:48',NULL,'2023-12-27 10:19:48','2023-12-27 10:19:48'),
(56,20,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36','avp67WtV7OblCJNcef7SlTmJ0Hp8KvPXaLSILBTz','Chrome 116.0.0.0','Linux ','2023-12-27 10:53:56',NULL,'2023-12-27 10:53:56','2023-12-27 10:53:56'),
(57,10,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36','A04DEsBc0x7wIhsu9UZohVSX4Zmca7dq3xZg9twY','Chrome 116.0.0.0','Linux ','2023-12-30 09:56:51','2023-12-30 09:57:33','2023-12-30 09:57:33','2023-12-30 09:56:51'),
(58,10,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36','QEGmFNa1vynWy4IDXvXzkMNBFGLBxngT3neyiQfv','Chrome 116.0.0.0','Linux ','2023-12-30 09:57:41','2023-12-30 10:02:47','2023-12-30 10:02:47','2023-12-30 09:57:41'),
(59,10,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36','GBrHXog9h9Jl7vyE8ePFW7qPSvU6M2R9D019Ldww','Chrome 116.0.0.0','Linux ','2023-12-30 10:03:22','2023-12-30 11:18:22','2023-12-30 11:18:22','2023-12-30 10:03:22'),
(60,19,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36','jaq3PVU2QSosCKDw7niNIqKesQcxhqjxozigFnvG','Chrome 116.0.0.0','Linux ','2023-12-30 11:20:50','2023-12-30 13:28:03','2023-12-30 13:28:03','2023-12-30 11:20:50'),
(61,19,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36','56WebagFV6OzusHAUv6l9GL1yM57pNqhDLrPj6Xt','Chrome 116.0.0.0','Linux ','2023-12-30 13:28:08',NULL,'2023-12-30 13:28:08','2023-12-30 13:28:08'),
(62,19,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36','MToij7meMvjdb5vZHa8yWM7WeFs6y5QKnY3WY5Yu','Chrome 116.0.0.0','Linux ','2024-01-02 10:09:47','2024-01-02 10:13:43','2024-01-02 10:13:43','2024-01-02 10:09:47'),
(63,10,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36','GNRLXg5TSUuEX6bFrNgMJkA4MWvYBWJlO7Wf2Z2o','Chrome 116.0.0.0','Linux ','2024-01-02 10:13:49','2024-01-02 10:16:35','2024-01-02 10:16:35','2024-01-02 10:13:49'),
(64,19,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36','AYBR1HDWxTPkNt8VFLswr2eSIP9tb6y5hheOXqbw','Chrome 116.0.0.0','Linux ','2024-01-02 10:16:45',NULL,'2024-01-02 10:16:45','2024-01-02 10:16:45');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`active`,`created_at`,`updated_at`) values 
(1,'admin','admin@kb.com',NULL,'$2y$10$RJnJxRZ4YVLeEBrKFvMd0uMvHwRykNnt0t7mMGOoHI0IeR0TbTEjW',NULL,1,'2023-10-27 05:40:47','2023-11-17 11:01:28'),
(4,'User','user@kb.com',NULL,'$2y$10$rd7L5YR5hhqy.OKpsSC9Ye0CvPRierv9k1xILElZoAE7cgdTbO2h6',NULL,1,'2023-11-06 10:05:36','2023-11-17 10:18:12'),
(10,'Root','root@kb.com',NULL,'$2y$10$b3lMQX8NwMAfhCLip8r2TOPInw0Iz7eiSCnRt3CWPblFVByQVkr7u',NULL,1,'2023-11-07 05:04:40','2023-11-17 10:18:28'),
(19,'Pratiksha','pratiksha@kb.com',NULL,'$2y$10$6CZJrnlGbj86tUemwI7/eO44LYuOuYp4zHeFMYXZ6c4jC8mlwlEgq',NULL,1,'2023-11-21 07:54:26','2023-12-09 18:06:04'),
(20,'Bhagyashree','akshata@kb.com',NULL,'$2y$10$6CZJrnlGbj86tUemwI7/eO44LYuOuYp4zHeFMYXZ6c4jC8mlwlEgq',NULL,1,'2023-11-21 08:26:05','2023-11-21 12:09:25'),
(21,'Vanshika','vanshika@kb.com',NULL,'$2y$10$6CZJrnlGbj86tUemwI7/eO44LYuOuYp4zHeFMYXZ6c4jC8mlwlEgq',NULL,1,'2023-11-21 13:14:26','2023-11-21 13:14:26'),
(22,'Rina','rina@kb.com',NULL,'$2y$10$6CZJrnlGbj86tUemwI7/eO44LYuOuYp4zHeFMYXZ6c4jC8mlwlEgq',NULL,1,'2023-11-27 05:48:33','2023-12-11 13:10:15');

/*Table structure for table `views` */

DROP TABLE IF EXISTS `views`;

CREATE TABLE `views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `timing` float DEFAULT NULL,
  `current_time` float DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `views` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
