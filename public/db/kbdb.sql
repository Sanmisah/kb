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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(15,'demo','The purpose of lorem ipsum is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn\'t distract from the layout. A practice not without controversy, laying out pages with meaningless filler text can be very useful when the focus is meant to be on design, not content.',9,1,1,'2023-11-27 08:26:55','2023-12-02 07:20:17'),
(16,'act','The purpose of lorem ipsum is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn\'t distract from the layout. A practice not without controversy, laying out pages with meaningless filler text can be very useful when the focus is meant to be on design, not content.',4,1,1,'2023-11-27 08:35:23','2023-12-02 07:18:18'),
(17,'act','Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.',4,1,1,'2023-11-27 08:45:12','2023-12-02 07:17:52'),
(18,'lorem','There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain',8,1,1,'2023-11-27 08:49:42','2023-11-27 12:03:00');

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
(19,'Pratiksha','Amol','Shinde','8981234567','pratiksha@kb.com','thane',NULL,6,1,'2022-02-09','India','MH','Mumbai',421204,'1994-01-05',1,1,'2023-11-21 07:54:26','2023-11-21 07:54:26'),
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `media` */

insert  into `media`(`id`,`model_type`,`model_id`,`uuid`,`collection_name`,`name`,`file_name`,`mime_type`,`disk`,`conversions_disk`,`size`,`manipulations`,`custom_properties`,`generated_conversions`,`responsive_images`,`order_column`,`created_at`,`updated_at`) values 
(1,'App\\Models\\Notice',6,'cfc957a2-1529-4254-ad22-f7d39c3f8bba','attachment','dummy','dummy.pdf','application/pdf','media','media',13264,'[]','[]','[]','[]',1,'2023-11-27 04:51:51','2023-11-27 04:51:51'),
(2,'App\\Models\\Notice',7,'ba18f996-2e67-45fc-aa98-6c140171ad12','attachment','sample','sample.pdf','application/pdf','media','media',3028,'[]','[]','[]','[]',1,'2023-11-27 05:25:58','2023-11-27 05:25:58'),
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
(28,'App\\Models\\Article',16,'51d5f04e-4cea-4bba-91a9-84e8e3d27262','video_attachment','SampleVideo_1280x720_5mb','SampleVideo_1280x720_5mb.mp4','video/mp4','media','media',5253880,'[]','[]','[]','[]',4,'2023-12-04 11:57:18','2023-12-04 11:57:18');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(21,'2023_11_27_055125_create_table_articles',13);

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
(1,'N00001','2023-11-18','whenHas',1,3,NULL,'demo',1,1,'2023-11-18 10:30:26','2023-11-27 05:04:24'),
(2,'N00002','2023-11-18','Axios',8,7,NULL,NULL,1,1,'2023-11-18 12:29:20','2023-11-18 18:23:23'),
(3,'N00003','2023-11-20','you need to decode it before use',1,1,NULL,'you need to decode it before use',1,1,'2023-11-20 05:32:33','2023-11-24 08:33:13'),
(4,'N00004','2023-11-20','If you had complex data that you manually converted to JSON, you need to decode it before use',8,7,NULL,'So, we can access the Phone model from our User model. Next, let\'s define a relationship on the Phone model that will let us access the user that owns the phone',1,1,'2023-11-20 05:34:43','2023-11-27 05:08:54'),
(5,'N00005','2023-11-21','file',1,1,NULL,'file',1,1,'2023-11-20 05:45:57','2023-11-24 12:34:41'),
(6,'N00006','2023-11-27','Defining The Inverse Of The Relationship',8,8,NULL,'Additionally, Eloquent assumes that the foreign key should have a value matching the primary key column of the parent.',1,1,'2023-11-27 04:51:49','2023-11-27 04:51:49'),
(7,'N00007','2023-11-01','CModel API Documentation',10,7,NULL,'validators property read-only. public array getValidators(string $attribute=NULL) ... For example, \'department_name\' or \'DepartmentName\' becomes \'Department Name\'',1,1,'2023-11-27 05:25:57','2023-11-27 05:25:57');

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
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(115,'employees.status','web','2023-12-07 13:17:17','2023-12-07 13:17:17');

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
(1,6),
(2,3),
(2,5),
(2,6),
(5,3),
(5,5),
(5,6),
(6,3),
(6,5),
(6,6),
(7,3),
(7,5),
(7,6),
(29,3),
(29,5),
(29,6),
(30,3),
(30,5),
(30,6),
(31,3),
(31,5),
(31,6),
(32,3),
(32,5),
(32,6),
(33,3),
(33,5),
(33,6),
(34,3),
(34,5),
(34,6),
(35,3),
(35,5),
(35,6),
(36,3),
(36,5),
(36,6),
(37,3),
(37,5),
(37,6),
(38,3),
(38,5),
(38,6),
(39,3),
(39,5),
(39,6),
(40,3),
(40,5),
(40,6),
(41,3),
(41,5),
(41,6),
(42,3),
(42,5),
(42,6),
(43,3),
(43,5),
(43,6),
(44,3),
(44,5),
(44,6),
(45,3),
(45,4),
(45,5),
(45,6),
(46,3),
(46,5),
(46,6),
(47,3),
(47,4),
(47,5),
(47,6),
(48,3),
(48,4),
(48,5),
(48,6),
(49,3),
(49,5),
(49,6),
(50,3),
(50,4),
(50,5),
(50,6),
(51,3),
(51,4),
(51,5),
(51,6),
(52,3),
(52,4),
(52,5),
(52,6),
(53,3),
(53,4),
(53,5),
(53,6),
(54,3),
(54,4),
(54,5),
(54,6),
(55,3),
(55,4),
(55,5),
(55,6),
(56,3),
(56,4),
(56,5),
(56,6),
(57,3),
(57,4),
(57,5),
(57,6),
(58,3),
(58,4),
(58,5),
(58,6),
(59,3),
(59,4),
(59,5),
(59,6),
(60,3),
(60,4),
(60,5),
(60,6),
(61,3),
(61,4),
(61,5),
(61,6),
(62,3),
(62,6),
(63,3),
(63,6),
(64,3),
(64,6),
(65,3),
(65,6),
(66,3),
(66,6),
(67,3),
(67,6),
(68,3),
(68,6),
(69,3),
(69,6),
(70,3),
(70,6),
(71,3),
(71,6),
(72,3),
(72,6),
(73,3),
(73,6),
(74,3),
(74,6),
(75,3),
(75,6),
(76,3),
(76,6),
(77,3),
(77,6),
(78,3),
(78,6),
(79,3),
(79,6),
(80,3),
(80,6),
(81,3),
(81,6),
(82,3),
(82,6),
(83,3),
(83,6),
(84,3),
(84,6),
(85,3),
(85,6),
(86,3),
(86,6),
(87,3),
(87,6),
(88,3),
(88,6),
(89,3),
(89,6),
(90,3),
(90,6),
(91,3),
(91,6),
(92,3),
(92,6),
(93,3),
(93,6),
(94,3),
(94,6),
(95,3),
(95,6),
(96,3),
(96,6),
(97,3),
(97,6),
(98,3),
(98,6),
(99,3),
(99,6),
(100,3),
(100,6),
(101,3),
(101,6),
(102,3),
(102,6),
(103,3),
(103,6),
(104,3),
(104,6),
(105,3),
(105,6),
(106,3),
(107,3),
(108,3),
(109,3),
(110,3),
(111,3),
(112,3),
(113,3),
(114,3),
(115,3);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values 
(3,'Admin','web','2023-11-06 08:22:37','2023-11-08 05:41:47'),
(4,'User','web','2023-11-06 11:39:29','2023-11-06 11:39:29'),
(5,'Root','web','2023-11-08 05:48:07','2023-11-08 05:48:07'),
(6,'Employee','web','2023-11-21 07:04:04','2023-11-21 07:04:04');

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
(12,'Shilpa','arpita.l@sanmishatech.com',NULL,'$2y$10$SAfgqNRx0j07186OOBQeJu9wxv.pM4Ks209ZyFMsjtlHwUbVKEIlG','bBxMGQvhbNYmiv6CJlx5rJv8pdSmcUmxhmixWE5WhEgC1DhbGNpYAGcOpwEY',0,'2023-11-18 05:09:35','2023-11-18 05:49:26'),
(18,'kishan','kishan@kb.com',NULL,'$2y$10$OiSjutQmMxdvCeO7jDgEde4nlRRNMqQeEGQC7vBV5g9pW4yEXsRaS',NULL,1,'2023-11-21 06:54:41','2023-11-21 06:54:41'),
(19,'Pratiksha','pratiksha@kb.com',NULL,'$2y$10$6CZJrnlGbj86tUemwI7/eO44LYuOuYp4zHeFMYXZ6c4jC8mlwlEgq',NULL,1,'2023-11-21 07:54:26','2023-11-21 07:54:26'),
(20,'Bhagyashree','akshata@kb.com',NULL,'$2y$10$FkHYfyJIh2JbwbWR3h80neyt7OQQzcRk0r1X8W4MGMDc.ysS7rL1u',NULL,1,'2023-11-21 08:26:05','2023-11-21 12:09:25'),
(21,'Vanshika','vanshika@kb.com',NULL,'$2y$10$N.uTV278vVcNRkHJVW0.8OioXOHYiCEjKzCMA5.pe119Dobf4TFvu',NULL,1,'2023-11-21 13:14:26','2023-11-21 13:14:26'),
(22,'Rina','rina@kb.com',NULL,'$2y$10$33.VfoaLN.hyrDCGmq3GfO/jLm94zhXN9/Y9UA8f310uNe91AD1P2',NULL,1,'2023-11-27 05:48:33','2023-11-27 05:49:59');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
