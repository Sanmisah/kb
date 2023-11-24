/*
SQLyog Community v13.1.1 (64 bit)
MySQL - 10.4.28-MariaDB : Database - kbs
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`kbs` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `kbs`;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `departments` */

insert  into `departments`(`id`,`department_name`,`created_at`,`updated_at`,`created_by`,`updated_by`) values 
(1,'Finance','2023-10-31 12:34:04','2023-10-31 12:42:19',1,1),
(4,'IT','2023-10-31 13:09:48','2023-10-31 13:09:48',1,1),
(6,'Account','2023-11-17 07:12:53','2023-11-17 07:28:08',1,1),
(7,'HR','2023-11-17 07:19:56','2023-11-17 07:19:56',1,1),
(8,'demo','2023-11-17 10:51:46','2023-11-17 10:51:46',1,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `designations` */

insert  into `designations`(`id`,`designation_name`,`created_at`,`updated_at`,`created_by`,`updated_by`) values 
(1,'Manager','2023-10-31 12:57:05','2023-10-31 12:57:05',1,1),
(3,'Team Lead','2023-10-31 13:09:09','2023-10-31 13:09:09',1,1),
(4,'Designer','2023-11-17 07:47:17','2023-11-17 07:47:17',1,1),
(5,'Developer','2023-11-17 07:47:28','2023-11-17 07:47:37',1,1),
(7,'demo','2023-11-17 10:51:35','2023-11-17 10:51:35',1,1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `media` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(16,'2023_11_18_081846_create_media_table',8);

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
(4,'App\\Models\\User',4),
(4,'App\\Models\\User',11),
(4,'App\\Models\\User',12),
(5,'App\\Models\\User',10);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `notices` */

insert  into `notices`(`id`,`sr_no`,`notice_date`,`notice`,`department_id`,`designation_id`,`attachment`,`description`,`created_by`,`updated_by`,`created_at`,`updated_at`) values 
(1,'N00001','2023-11-18','whenHas',1,3,NULL,NULL,1,1,'2023-11-18 10:30:26','2023-11-18 10:30:26'),
(2,'N00002','2023-11-18','Axios',8,7,NULL,NULL,1,1,'2023-11-18 12:29:20','2023-11-18 18:23:23');

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
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(82,'notices.destroy','web','2023-11-18 06:36:50','2023-11-18 06:36:50');

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
(44,3),
(44,5),
(45,3),
(45,4),
(45,5),
(46,3),
(46,5),
(47,3),
(47,4),
(47,5),
(48,3),
(48,4),
(48,5),
(49,3),
(49,5),
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
(63,3),
(64,3),
(65,3),
(66,3),
(67,3),
(68,3),
(69,3),
(70,3),
(71,3),
(72,3),
(73,3),
(74,3),
(75,3),
(76,3),
(77,3),
(78,3),
(79,3),
(80,3),
(81,3),
(82,3);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values 
(3,'Admin','web','2023-11-06 08:22:37','2023-11-08 05:41:47'),
(4,'User','web','2023-11-06 11:39:29','2023-11-06 11:39:29'),
(5,'Root','web','2023-11-08 05:48:07','2023-11-08 05:48:07');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`active`,`created_at`,`updated_at`) values 
(1,'admin','admin@kb.com',NULL,'$2y$10$RJnJxRZ4YVLeEBrKFvMd0uMvHwRykNnt0t7mMGOoHI0IeR0TbTEjW',NULL,1,'2023-10-27 05:40:47','2023-11-17 11:01:28'),
(4,'User','user@kb.com',NULL,'$2y$10$rd7L5YR5hhqy.OKpsSC9Ye0CvPRierv9k1xILElZoAE7cgdTbO2h6',NULL,1,'2023-11-06 10:05:36','2023-11-17 10:18:12'),
(10,'Root','root@care.com',NULL,'$2y$10$b3lMQX8NwMAfhCLip8r2TOPInw0Iz7eiSCnRt3CWPblFVByQVkr7u',NULL,1,'2023-11-07 05:04:40','2023-11-17 10:18:28'),
(11,'Arpita','arpita.lad2004@gmail.com',NULL,'$2y$10$UvECb/hkYnwFmPacGzdohet1b8EZuLkwTPxLZ7lV.t16/8NpZVUc2',NULL,0,'2023-11-18 04:54:17','2023-11-18 05:49:17'),
(12,'Shilpa','arpita.l@sanmishatech.com',NULL,'$2y$10$SAfgqNRx0j07186OOBQeJu9wxv.pM4Ks209ZyFMsjtlHwUbVKEIlG','bBxMGQvhbNYmiv6CJlx5rJv8pdSmcUmxhmixWE5WhEgC1DhbGNpYAGcOpwEY',0,'2023-11-18 05:09:35','2023-11-18 05:49:26');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
