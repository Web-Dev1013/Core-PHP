/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.4.17-MariaDB : Database - leadqloc_work2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`leadqloc_work2` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `leadqloc_work2`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `visited_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

LOCK TABLES `admin` WRITE;

insert  into `admin`(`id`,`username`,`password`,`visited_time`) values 
(1,'admin','admin','2021-02-22 02:04:00');

UNLOCK TABLES;

/*Table structure for table `banners` */

DROP TABLE IF EXISTS `banners`;

CREATE TABLE `banners` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `banners_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `banners` */

LOCK TABLES `banners` WRITE;

insert  into `banners`(`id`,`title`,`slug`,`photo`,`description`,`status`,`created_at`,`updated_at`) values 
(1,'GRAND THEFT AUTO','lorem-ipsum-is','/storage/photos/1/Banner/banner-01.jpg','<h2><span style=\"font-weight: bold; color: rgb(255, 255, 255); background-color: rgb(255, 156, 0);\">VER PRECIO AMAZON</span></h2>','active','2020-08-14 04:47:38','2021-01-17 03:32:41'),
(2,'SPIDERMAN','lorem-ipsum','/storage/photos/1/Banner/banner-07.jpg','<h2><span style=\"color: rgb(255, 255, 255); background-color: rgb(255, 156, 0);\">VER PRECIO AMAZON</span></h2>','active','2020-08-14 04:50:23','2021-01-17 03:30:21'),
(4,'CRASH BANDICOOT 4','banner','/storage/photos/1/Banner/banner-06.jpg','<h2><span style=\"font-size: 2rem; font-weight: bold; color: rgb(255, 255, 255); background-color: rgb(255, 156, 0);\">VER PRECIO AMAZON</span><br></h2><h2><span style=\"color: rgb(156, 0, 255);\"></span></h2>','active','2020-08-17 23:46:59','2021-01-17 03:40:43');

UNLOCK TABLES;

/*Table structure for table `basecategories` */

DROP TABLE IF EXISTS `basecategories`;

CREATE TABLE `basecategories` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `category_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template_id` int(50) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `flag_id` int(2) NOT NULL COMMENT 'A flag is 1=parent, 2 = other, 0 = rows in between 1 and 2',
  `is_hidden` int(1) DEFAULT NULL,
  `is_result` int(1) DEFAULT NULL,
  `percentage` decimal(48,10) NOT NULL,
  `icon_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `help` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sign` int(1) DEFAULT NULL,
  `value_load` decimal(48,4) NOT NULL,
  `deactivated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `basecategories` */

LOCK TABLES `basecategories` WRITE;

insert  into `basecategories`(`id`,`created_at`,`updated_at`,`category_code`,`template_id`,`parent_id`,`order`,`flag_id`,`is_hidden`,`is_result`,`percentage`,`icon_url`,`name`,`help`,`sign`,`value_load`,`deactivated_at`) values 
(1,NULL,NULL,'HE1000',1,0,0,1,NULL,1,1.0000000000,'holiday.png','Holiday Expenditure','Holiday Expenditure',1,9888.0000,NULL),
(2,NULL,NULL,'HE1000.100',1,1,0,0,NULL,NULL,0.2530446549,'flights.png','Flights','Flights',1,2500.0800,NULL),
(3,NULL,NULL,'HE1000.200',1,1,1,0,NULL,NULL,0.2828146143,'hotels.png','Hotels','Hotels',1,2794.2100,NULL),
(4,NULL,NULL,'HE1000.300',1,1,2,0,NULL,NULL,0.1562110961,'sightseeing.png','Sightseeing','Sightseeing',1,1543.3700,NULL),
(5,NULL,NULL,'HE1000.400',1,1,3,0,NULL,NULL,0.1366711773,'meals.png','Meals','Meals',1,1350.3100,NULL),
(6,NULL,NULL,'HE1000.500',1,1,5,0,NULL,NULL,0.0143572395,'gifts.png','Gifts','Gifts',1,141.8500,NULL),
(7,NULL,NULL,'HE1000.600',1,1,4,0,NULL,NULL,0.0825439783,'transportation.png','Transportation','Transportation',1,815.5300,NULL),
(8,NULL,NULL,'HE1000.999',1,1,7,2,NULL,NULL,0.0743572395,'entertainment.png','Other','Entertainment & Other',1,734.6500,NULL),
(9,NULL,NULL,'LT2000',2,0,0,1,NULL,1,1.0000000000,'leisure.png','Leisure Time','Leisure Time',1,270.0000,NULL),
(10,NULL,NULL,'LT2000.100',2,9,1,0,NULL,NULL,0.0653044655,'reading.png','Reading','Reading',1,17.6300,NULL),
(11,NULL,NULL,'LT2000.200',2,9,2,0,NULL,NULL,0.3428146143,'watching.png','TV, YouTube, NetFlix, etc','TV',1,92.5600,NULL),
(12,NULL,NULL,'LT2000.300',2,9,3,0,NULL,NULL,0.0562110961,'nap.png','Nap','Nap',1,15.1800,NULL),
(13,NULL,NULL,'LT2000.400',2,9,4,0,NULL,NULL,0.2366711773,'media.png','Social Media','Social Media',1,63.9000,NULL),
(14,NULL,NULL,'LT2000.500',2,9,5,0,NULL,NULL,0.1543572395,'games.png','Games','Games',1,41.6800,NULL),
(15,NULL,NULL,'LT2000.600',2,9,6,0,NULL,NULL,0.0225439783,'meditation.png','Meditation & Relaxing','Meditation & Relaxing',1,6.0900,NULL),
(16,NULL,NULL,'LT2000.999',2,9,7,2,NULL,NULL,0.1220974290,'other.png','Other','Other',1,32.9700,NULL),
(17,NULL,NULL,'FES1000',3,0,0,1,NULL,1,1.0000000000,'RB','RB','ADBTEL',1,35.0000,NULL),
(18,NULL,NULL,'FES1001',4,0,1,1,NULL,1,1.0000000000,'SW','SW','AFDAT',2,3.6500,NULL),
(19,NULL,NULL,'FES1002',5,0,2,1,NULL,1,1.0000000000,'SMB','SMB','ALETMB',2,4.6500,NULL),
(20,NULL,NULL,'FES1003',6,0,3,1,NULL,1,1.0000000000,'RFMB','RFMB','ALERFMB',2,2.6500,NULL),
(21,NULL,NULL,'FES1004',7,0,4,1,NULL,1,1.0000000000,'LWED','LWED','AFDDT',1,3.6500,NULL),
(22,NULL,NULL,'LIY18',8,0,0,3,NULL,NULL,1.0000000000,'EA','EA','EA',2,0.0000,NULL),
(23,NULL,NULL,'LIY18.010',8,22,1,3,NULL,1,0.0000000000,'AL','AL','AL',2,0.0000,NULL);

UNLOCK TABLES;

/*Table structure for table `basetemplates` */

DROP TABLE IF EXISTS `basetemplates`;

CREATE TABLE `basetemplates` (
  `id` int(50) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `mastercategories_category_code` varchar(765) DEFAULT NULL,
  `template_name` varchar(765) DEFAULT NULL,
  `template_description` varchar(765) DEFAULT NULL,
  `deactivated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `basetemplates` */

LOCK TABLES `basetemplates` WRITE;

insert  into `basetemplates`(`id`,`created_at`,`updated_at`,`mastercategories_category_code`,`template_name`,`template_description`,`deactivated_at`) values 
(1,NULL,NULL,'HE1000','HE1000 - Holiday Expenditure',NULL,NULL),
(2,NULL,NULL,'LT2000','LT2000 - Leisure Time',NULL,NULL),
(3,NULL,NULL,'FES1000','ABC',NULL,NULL),
(4,NULL,NULL,'LIY18','Blah Blah',NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `brands` */

DROP TABLE IF EXISTS `brands`;

CREATE TABLE `brands` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brands_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

/*Data for the table `brands` */

LOCK TABLES `brands` WRITE;

insert  into `brands`(`id`,`title`,`slug`,`status`,`created_at`,`updated_at`) values 
(9,'Biolage','biolage','active','2021-02-15 05:21:56','2021-02-16 02:16:03'),
(10,'AG Hair','hair-care','active','2021-02-16 02:11:07','2021-02-16 02:11:43'),
(11,'Lessmon','lessmon','active','2021-02-16 02:12:58','2021-02-16 02:12:58'),
(12,'American Crew','american-crew','active','2021-02-16 02:13:28','2021-02-16 02:13:28'),
(13,'Arganicare','arganicare','active','2021-02-16 02:14:22','2021-02-16 02:14:22'),
(14,'Aussie','aussie','active','2021-02-16 02:14:44','2021-02-16 02:14:44'),
(17,'Avalon Organics','avalon-organics','active','2021-02-16 02:17:55','2021-02-16 02:17:55'),
(18,'Aveeno','aveeno-baby','active','2021-02-16 02:21:44','2021-02-17 01:05:50'),
(19,'BioSilk','biosilk','active','2021-02-16 02:22:58','2021-02-16 02:22:58'),
(20,'Paisle','paisle','active','2021-02-16 02:23:21','2021-02-16 02:23:21'),
(21,'Biotin','biotin','active','2021-02-16 02:23:39','2021-02-16 02:23:39'),
(22,'Botanic Hearth','botanic-hearth','active','2021-02-16 02:24:07','2021-02-16 02:24:07'),
(23,'Celestial Silk','celestial-silk','active','2021-02-16 02:24:41','2021-02-16 02:24:41'),
(24,'Honeydew','honeydew','active','2021-02-16 02:25:22','2021-02-16 02:25:22'),
(25,'Head & Shoulders','head-shoulders','active','2021-02-16 02:25:58','2021-02-16 02:25:58'),
(26,'Bebeepoo','bebeepoo','active','2021-02-16 02:26:25','2021-02-16 02:26:25'),
(27,'Color Edge Hair care','color-edge-hair-care','active','2021-02-16 02:27:35','2021-02-16 02:27:35'),
(28,'ColorProof Evolved Color Care','colorproof-evolved-color-care','active','2021-02-16 02:28:03','2021-02-16 02:28:03'),
(29,'Cutify','cutify','active','2021-02-16 02:28:21','2021-02-16 02:28:21'),
(30,'Rogaine','rogaine','active','2021-02-16 02:28:41','2021-02-16 02:28:41'),
(31,'Enjoy','enjoy','active','2021-02-16 02:28:58','2021-02-16 02:28:58'),
(32,'Dove','dove','active','2021-02-16 02:29:11','2021-02-16 02:29:11'),
(33,'Fanola','fanola','active','2021-02-16 02:29:24','2021-02-16 02:29:24'),
(34,'Fiora Naturals','fiora-naturals','active','2021-02-16 02:29:50','2021-02-16 02:29:50'),
(35,'FREATECH','freatech','active','2021-02-16 02:30:28','2021-02-16 02:30:28'),
(36,'Freetress','freetress','active','2021-02-16 02:30:56','2021-02-16 02:30:56'),
(37,'Garnier','garnier','active','2021-02-16 02:31:16','2021-02-16 02:31:16'),
(38,'Tallsocne','tallsocne','active','2021-02-16 02:31:58','2021-02-16 02:31:58'),
(39,'Savion','savion','active','2021-02-16 02:32:36','2021-02-16 02:32:36'),
(40,'Zjchao','zjchao','active','2021-02-16 02:33:00','2021-02-16 02:33:00'),
(41,'Herbal Essences','herbal-essences','active','2021-02-16 02:33:29','2021-02-16 02:33:29'),
(42,'Jamaican Mango & Lime','jamaican-mango-lime','active','2021-02-16 02:34:07','2021-02-16 02:34:07'),
(43,'John Frieda','john-frieda','active','2021-02-16 02:34:58','2021-02-16 02:34:58'),
(44,'Just 1','just-1','active','2021-02-16 02:35:20','2021-02-16 02:35:20'),
(45,'Just for Men','just-for-men','active','2021-02-16 02:35:37','2021-02-16 02:35:37'),
(46,'Lariolla','lariolla','active','2021-02-16 02:36:02','2021-02-16 02:36:02'),
(47,'L\'ANGE HAIR','lange-hair','active','2021-02-16 02:36:18','2021-02-16 02:36:18'),
(48,'Lanvier','lanvier','active','2021-02-16 02:36:59','2021-02-16 02:36:59'),
(49,'Loma Hair Care','loma-hair-care','active','2021-02-16 02:37:22','2021-02-16 02:37:22'),
(50,'L\'Oréal Paris','loreal-paris','active','2021-02-16 02:37:37','2021-02-16 02:37:37'),
(51,'Adore','adore','active','2021-02-16 20:33:05','2021-02-16 20:33:05'),
(52,'Dazzfond','dazzfond','active','2021-02-16 21:24:00','2021-02-16 21:24:00'),
(53,'Willbond','willbond','active','2021-02-16 21:24:49','2021-02-16 21:24:49'),
(54,'Alazco','alazco','active','2021-02-16 21:25:12','2021-02-16 21:25:12'),
(55,'Underwater Audio','underwater-audio','active','2021-02-17 00:02:41','2021-02-17 00:02:41'),
(56,'Ethereal Nature','ethereal-nature','active','2021-02-17 04:10:04','2021-02-17 04:10:04'),
(57,'Celestial Silk','celestial-silk-2102163755-656','active','2021-02-17 04:37:55','2021-02-17 04:37:55'),
(58,'HONEYDEW','honeydew-2102165159-672','active','2021-02-17 04:51:59','2021-02-17 04:51:59');

UNLOCK TABLES;

/*Table structure for table `carts` */

DROP TABLE IF EXISTS `carts`;

CREATE TABLE `carts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_product_id_foreign` (`product_id`),
  KEY `carts_user_id_foreign` (`user_id`),
  KEY `carts_order_id_foreign` (`order_id`),
  CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `carts` */

LOCK TABLES `carts` WRITE;

UNLOCK TABLES;

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `added_by` bigint(20) unsigned DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  KEY `categories_added_by_foreign` (`added_by`),
  CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `categories` */

LOCK TABLES `categories` WRITE;

insert  into `categories`(`id`,`title`,`slug`,`summary`,`photo`,`is_parent`,`parent_id`,`added_by`,`status`,`created_at`,`updated_at`) values 
(24,'Cuidado del cabello','cuidado-del-cabello',NULL,'/storage/photos/31/categorias/categoria-cuidado-del-cabello.jpg',1,NULL,NULL,'active','2021-02-15 05:19:15','2021-02-16 03:06:24'),
(25,'Accesorios','accesorios-para-el-cabello',NULL,'/storage/photos/31/categorias/sub-categoria-accesorios.jpg',1,NULL,NULL,'active','2021-02-15 05:36:37','2021-02-16 03:05:27'),
(26,'Aparatos y Utensilios','aparatos-y-utensilios',NULL,'/storage/photos/31/categorias/sub-categoria-aparatos y utensilios.jpg',0,24,NULL,'active','2021-02-16 02:59:59','2021-02-16 03:07:05'),
(27,'Champú','champu',NULL,'/storage/photos/31/categorias/sub-categoria-champu.jpg',0,24,NULL,'active','2021-02-16 03:08:26','2021-02-16 03:08:26'),
(28,'Productos para peinar','productos-para-peinar',NULL,'/storage/photos/31/categorias/sub-categoria-pruducto para peinar.jpg',0,24,NULL,'active','2021-02-16 03:10:29','2021-02-16 03:21:53'),
(29,'Coloración','coloracion',NULL,'/storage/photos/31/categorias/sub-categoria-coloracion.png',0,24,NULL,'active','2021-02-16 03:13:17','2021-02-16 03:22:08'),
(30,'Mascarillas y Tratamientos','mascarillas-y-tratamientos',NULL,'/storage/photos/31/categorias/sub-categoria-mascarillas y tratamientos.jpg',0,24,NULL,'active','2021-02-16 03:15:16','2021-02-16 03:22:19'),
(31,'Aceites','aceites',NULL,'/storage/photos/31/categorias/sub-categoria-aceistes.jpg',0,24,NULL,'active','2021-02-16 03:18:08','2021-02-16 03:21:39'),
(32,'Acondicionadores','acondicionadores',NULL,'/storage/photos/31/color-vibrancy/Color-Vibrancy-3.jpg',0,24,NULL,'active','2021-02-16 03:26:10','2021-02-16 03:26:10'),
(33,'Champú & acondicionador','champu-acondicionador',NULL,'/storage/photos/31/productos 1/total-miracle-1.jpg',0,24,NULL,'active','2021-02-17 00:41:32','2021-02-17 00:41:32');

UNLOCK TABLES;

/*Table structure for table `company` */

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `id` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `fiscal_eoy_month_end` int(2) DEFAULT NULL,
  `sector_id` int(11) DEFAULT NULL,
  `ticker` varchar(255) DEFAULT NULL,
  `reporting_currency_id` int(11) DEFAULT NULL,
  `tax_id` varchar(255) DEFAULT NULL,
  `company_number` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `address_street_1` varchar(255) DEFAULT NULL,
  `address_street_2` varchar(255) DEFAULT NULL,
  `address_city` varchar(255) DEFAULT NULL,
  `address_state` varchar(255) DEFAULT NULL,
  `address_postalzip` varchar(255) DEFAULT NULL,
  `address_country_id` int(11) DEFAULT NULL,
  `activated_at` int(11) DEFAULT NULL,
  `deactivated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `company` */

LOCK TABLES `company` WRITE;

insert  into `company`(`id`,`created_at`,`name`,`fiscal_eoy_month_end`,`sector_id`,`ticker`,`reporting_currency_id`,`tax_id`,`company_number`,`website`,`address_street_1`,`address_street_2`,`address_city`,`address_state`,`address_postalzip`,`address_country_id`,`activated_at`,`deactivated_at`) values 
(1,1543474040,'ABC Fintech',6,33,'ABC',4,'23-345-678-321','','https://www.abcfin.com','123 ABC Fintech Street','Suite 345','Melbourne','Victoria','3000',12,1552026683,NULL),
(2,1613180509,'Test',6,34,'Test',77,'','','','','','',NULL,'1000',12,NULL,NULL),
(3,1613424137,'rosya',10,36,'rosya',77,'12345678','12345678','https://rosya.com','123456 Rosya','1234567 Rosya','2345678 Rosya',NULL,'2000',157,NULL,NULL),
(4,1613660513,'Feb 18-1',2,33,'aaa',76,'111','111','111','111','111','111',NULL,'111',14,NULL,NULL),
(5,1613900331,'Feb 18-2',2,33,'aaa',76,'111','','111','111','111','111',NULL,'111',14,NULL,NULL),
(6,1613901143,'Feb18-2',4,31,'',6,'','','','','','',NULL,'2000',1,NULL,NULL),
(7,1613901248,'Feb 18-2',3,37,'',18,'','','','','','',NULL,'2000',1,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `counter` */

DROP TABLE IF EXISTS `counter`;

CREATE TABLE `counter` (
  `id` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `surveycode_id` int(50) DEFAULT NULL,
  `pressed_submitted_counter` int(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `counter` */

LOCK TABLES `counter` WRITE;

insert  into `counter`(`id`,`surveycode_id`,`pressed_submitted_counter`) values 
(1,1,6);

UNLOCK TABLES;

/*Table structure for table `country` */

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(2) NOT NULL,
  `currency_id` tinyint(3) NOT NULL,
  `timezone_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8;

/*Data for the table `country` */

LOCK TABLES `country` WRITE;

insert  into `country`(`id`,`name`,`code`,`currency_id`,`timezone_id`) values 
(1,'Afghanistan','AF',77,422),
(2,'Albania','AL',1,319),
(3,'Algeria','DZ',83,319),
(4,'American Samoa','AS',77,407),
(5,'Andorra','AD',26,319),
(6,'Angola','AO',77,319),
(7,'Anguilla','AI',77,131),
(8,'Antigua and Barbuda','AG',77,131),
(9,'Argentina','AR',3,148),
(10,'Armenia','AM',84,382),
(11,'Aruba','AW',77,131),
(12,'Australia','AU',4,414),
(13,'Austria','AT',26,319),
(14,'Azerbaijan','AZ',77,28),
(15,'Bahrain','BH',85,28),
(16,'Bangladesh','BD',6,230),
(17,'Barbados','BB',77,131),
(18,'Belarus','BY',7,342),
(19,'Belgium','BE',26,319),
(20,'Belize','BZ',8,102),
(21,'Benin','BJ',86,319),
(22,'Bermuda','BM',77,131),
(23,'Bolivia','BO',9,131),
(24,'Bosnia and Herzegovina','BA',10,319),
(25,'Botswana','BW',11,342),
(26,'Brazil','BR',13,148),
(27,'British Virgin Islan','VG',77,131),
(28,'Brunei Darussalam','BN',14,422),
(29,'Bulgaria','BG',12,342),
(30,'Burkina Faso','BF',86,22),
(31,'Burma','MM',87,375),
(32,'Burundi','BI',88,342),
(33,'Cambodia','KH',15,263),
(34,'Cameroon','CM',89,319),
(35,'Canada','CA',16,197),
(36,'Cape Verde','CV',90,179),
(37,'Cayman Islands','KY',77,157),
(38,'Central African Repu','CF',89,319),
(39,'Chile','CL',17,131),
(40,'China','CN',18,422),
(41,'Christmas Island','CX',4,263),
(42,'Colombia','CO',19,157),
(43,'Congo, Democratic Re','CD',91,342),
(44,'Congo, Republic of t','CG',89,319),
(45,'Cook Islands','CK',48,398),
(46,'Costa Rica','CR',20,102),
(47,'Cote d\'Ivoire','CI',86,22),
(48,'Croatia','HR',21,319),
(49,'Cuba','CU',77,157),
(50,'Cyprus','CY',77,342),
(51,'Czech Republic','CZ',22,319),
(52,'Denmark','DK',23,319),
(53,'Dominica','DM',77,422),
(54,'Dominican Republic','DO',24,131),
(55,'Ecuador','EC',77,157),
(56,'Egypt','EG',25,319),
(57,'El Salvador','SV',77,102),
(58,'Eritrea','ER',92,28),
(59,'Estonia','EE',77,342),
(60,'Ethiopia','ET',93,28),
(61,'Fiji','FJ',77,254),
(62,'Finland','FI',26,342),
(63,'France','FR',26,319),
(64,'French Guiana','GF',26,148),
(65,'French Polynesia','PF',77,254),
(66,'Gabon','GA',89,319),
(67,'Georgia','GE',94,382),
(68,'Germany','DE',26,319),
(69,'Ghana','GH',77,22),
(70,'Gibraltar','GI',77,319),
(71,'Greece','GR',26,342),
(72,'Greenland','GL',23,148),
(73,'Grenada','GD',77,131),
(74,'Guadeloupe','GP',26,131),
(75,'Guam','GU',77,414),
(76,'Guatemala','GT',27,102),
(77,'Guernsey','GG',76,22),
(78,'Guinea','GN',95,22),
(79,'Guyana','GY',77,148),
(80,'Haiti','HT',77,157),
(81,'Holy See (Vatican Ci','VA',26,319),
(82,'Honduras','HN',28,102),
(83,'Hong Kong (SAR)','HK',29,422),
(84,'Hungary','HU',30,319),
(85,'Iceland','IS',31,22),
(86,'India','IN',32,248),
(87,'Indonesia','ID',33,422),
(88,'Iran','IR',34,422),
(89,'Iraq','IQ',96,28),
(90,'Ireland','IE',26,22),
(91,'Israel','IL',35,342),
(92,'Italy','IT',26,319),
(93,'Jamaica','JM',36,157),
(94,'Japan','JP',37,281),
(95,'Jersey','JE',76,22),
(96,'Jordan','JO',97,342),
(97,'Kazakhstan','KZ',38,230),
(98,'Kenya','KE',98,28),
(99,'Korea, North','KP',77,281),
(100,'Korea, South','KR',39,281),
(101,'Kuwait','KW',99,28),
(102,'Kyrgyzstan','KG',77,377),
(103,'Laos','LA',77,263),
(104,'Latvia','LV',77,342),
(105,'Lebanon','LB',40,342),
(106,'Lesotho','LS',77,342),
(107,'Liberia','LR',77,22),
(108,'Libya','LY',100,342),
(109,'Liechtenstein','LI',69,319),
(110,'Lithuania','LT',77,342),
(111,'Luxembourg','LU',26,319),
(112,'Macao','MO',101,422),
(113,'Macedonia, The Forme','MK',41,319),
(114,'Madagascar','MG',77,28),
(115,'Malawi','MW',77,342),
(116,'Malaysia','MY',42,422),
(117,'Maldives','MV',77,377),
(118,'Mali','ML',86,22),
(119,'Malta','MT',26,319),
(120,'Man, Isle of','IM',76,22),
(121,'Marshall Islands','MH',77,254),
(122,'Martinique','MQ',26,22),
(123,'Mauritania','MR',77,22),
(124,'Mauritius','MU',43,382),
(125,'Mexico','MX',44,134),
(126,'Micronesia, Federate','FM',77,254),
(127,'Moldova','MD',102,342),
(128,'Monaco','MC',26,319),
(129,'Mongolia','MN',77,422),
(130,'Morocco','MA',103,22),
(131,'Mozambique','MZ',77,342),
(132,'Namibia','NA',46,319),
(133,'Nepal','NP',47,422),
(134,'Netherlands','NL',26,319),
(135,'Netherlands Antilles','AN',77,131),
(136,'New Caledonia','NC',77,307),
(137,'New Zealand','NZ',48,254),
(138,'Nicaragua','NI',49,102),
(139,'Niger','NE',86,319),
(140,'Nigeria','NG',50,319),
(141,'Norfolk Island','NF',4,422),
(142,'Northern Mariana Isl','MP',77,414),
(143,'Norway','NO',51,319),
(144,'Oman','OM',52,382),
(145,'Pakistan','PK',53,377),
(146,'Palau','PW',77,281),
(147,'Panama','PA',54,157),
(148,'Papua New Guinea','PG',77,414),
(149,'Paraguay','PY',55,131),
(150,'Peru','PE',56,157),
(151,'Philippines','PH',57,422),
(152,'Poland','PL',58,319),
(153,'Portugal','PT',26,22),
(154,'Puerto Rico','PR',77,131),
(155,'Qatar','QA',59,28),
(156,'Romania','RO',77,342),
(157,'Russia','RU',61,28),
(158,'Rwanda','RW',104,342),
(159,'Saint Kitts and Nevi','KN',77,131),
(160,'Saint Lucia','LC',77,131),
(161,'Samoa','WS',77,407),
(162,'San Marino','SM',26,319),
(163,'Saudi Arabia','SA',62,28),
(164,'Senegal','SN',86,22),
(165,'Seychelles','SC',77,382),
(166,'Sierra Leone','SL',77,22),
(167,'Singapore','SG',64,422),
(168,'Slovakia','SK',26,319),
(169,'Slovenia','SI',26,319),
(170,'Solomon Islands','SB',77,307),
(171,'Somalia','SO',65,28),
(172,'South Africa','ZA',66,342),
(173,'Spain','ES',26,319),
(174,'Sri Lanka','LK',67,422),
(175,'Sudan','SD',77,342),
(176,'Suriname','SR',77,148),
(177,'Swaziland','SZ',77,342),
(178,'Sweden','SE',68,319),
(179,'Switzerland','CH',69,319),
(180,'Syria','SY',70,342),
(181,'Taiwan','TW',71,422),
(182,'Tajikistan','TJ',77,377),
(183,'Tanzania','TZ',105,28),
(184,'Thailand','TH',72,263),
(185,'The Bahamas','BS',77,157),
(186,'The Gambia','GM',77,22),
(187,'Togo','TG',86,422),
(188,'Tonga','TO',106,419),
(189,'Trinidad and Tobago','TT',73,131),
(190,'Tunisia','TN',107,319),
(191,'Turkey','TR',77,342),
(192,'Turkmenistan','TM',77,377),
(193,'Turks and Caicos Isl','TC',77,157),
(194,'Uganda','UG',108,28),
(195,'Ukraine','UA',75,342),
(196,'United Arab Emirates','AE',109,382),
(197,'United Kingdom','UK',76,22),
(198,'United States','US',77,398),
(199,'Uruguay','UY',78,148),
(200,'Uzbekistan','UZ',79,377),
(201,'Vanuatu','VU',77,307),
(202,'Venezuela','VE',77,131),
(203,'Vietnam','VN',81,263),
(204,'Virgin Islands','VI',77,131),
(205,'Wallis and Futuna','WF',77,254),
(206,'Yemen','YE',82,28),
(207,'Yugoslavia','YU',77,319),
(208,'Zambia','ZM',77,342),
(209,'Zimbabwe','ZW',77,342);

UNLOCK TABLES;

/*Table structure for table `coupons` */

DROP TABLE IF EXISTS `coupons`;

CREATE TABLE `coupons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupons_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `coupons` */

LOCK TABLES `coupons` WRITE;

insert  into `coupons`(`id`,`code`,`type`,`value`,`status`,`created_at`,`updated_at`) values 
(1,'abc123','fixed',300.00,'active',NULL,NULL),
(2,'111111','percent',10.00,'active',NULL,NULL),
(5,'abcd','fixed',250.00,'active','2020-08-17 23:54:58','2020-08-17 23:54:58');

UNLOCK TABLES;

/*Table structure for table `currency` */

DROP TABLE IF EXISTS `currency`;

CREATE TABLE `currency` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(3) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `prefix` varchar(11) DEFAULT NULL,
  `suffix` varchar(255) DEFAULT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `decimal` char(255) DEFAULT NULL,
  `group` char(255) DEFAULT NULL,
  `digits` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

/*Data for the table `currency` */

LOCK TABLES `currency` WRITE;

insert  into `currency`(`id`,`code`,`name`,`prefix`,`suffix`,`symbol`,`decimal`,`group`,`digits`) values 
(1,'ALL','Albanian Lek',NULL,' Lekë','Lekë',',',' ',0),
(2,'AFN','Afghan Afghani',NULL,NULL,'؋','.',',',0),
(3,'ARS','Argentine Peso','$ ',NULL,'$',',','.',2),
(4,'AUD','Australian Dollar','$',NULL,'$','.',',',2),
(5,'AZN','Azerbaijani Manat','₼ ',NULL,'₼',',','.',2),
(6,'BDT','Bangladeshi Taka',NULL,'৳','৳','.',',',2),
(7,'BYR','Belarusian Ruble',NULL,' р.','р.',',',' ',0),
(8,'BZD','Belize Dollar','$',NULL,'$','.',',',2),
(9,'BOB','Bolivian Boliviano',NULL,' Bs','Bs',',','.',2),
(10,'BAM','Bosnia-Herzegovina Convertible Mark',NULL,' KM','KM',',','.',2),
(11,'BWP','Botswanan Pula','P',NULL,'P','.',',',2),
(12,'BGN','Bulgarian Lev',NULL,' лв.','лв.',',',' ',2),
(13,'BRL','Brazilian Real','R$',NULL,'R$',',','.',2),
(14,'BND','Brunei Dollar','$ ',NULL,'$',',','.',2),
(15,'KHR','Cambodian Riel','៛',NULL,'៛',',','.',2),
(16,'CAD','Canadian Dollar','$',NULL,'$','.',',',2),
(17,'CLP','Chilean Peso','$',NULL,'$',',','.',0),
(18,'CNY','Chinese Yuan','￥',NULL,'￥','.',',',2),
(19,'COP','Colombian Peso','$ ',NULL,'$',',','.',0),
(20,'CRC','Costa Rican Colón',NULL,' ₡','₡',',',' ',0),
(21,'HRK','Croatian Kuna',NULL,' kn','kn',',','.',2),
(22,'CZK','Czech Republic Koruna',NULL,' Kč','Kč',',',' ',2),
(23,'DKK','Danish Krone',NULL,' kr','kr',',','.',2),
(24,'DOP','Dominican Peso',NULL,' $','$',',','.',2),
(25,'EGP','Egyptian Pound','£ ',NULL,'£','.',',',2),
(26,'EUR','Euro',NULL,' €','€',',','.',2),
(27,'GTQ','Guatemalan Quetzal',NULL,' Q','Q',',','.',2),
(28,'HNL','Honduran Lempira',NULL,' L','L',',','.',2),
(29,'HKD','Hong Kong Dollar','HK$',NULL,'HK$','.',',',2),
(30,'HUF','Hungarian Forint',NULL,' Ft','Ft',',',' ',0),
(31,'ISK','Icelandic Króna',NULL,' kr','kr',',','.',0),
(32,'INR','Indian Rupee','₹ ',NULL,'₹','.',',',2),
(33,'IDR','Indonesian Rupiah','Rp',NULL,'Rp',',','.',0),
(34,'IRR','Iranian Rial',NULL,NULL,'ریال','.',',',0),
(35,'ILS','Israeli New Sheqel',NULL,' ₪','₪','.',',',2),
(36,'JMD','Jamaican Dollar','$',NULL,'$','.',',',2),
(37,'JPY','Japanese Yen','¥',NULL,'¥','.',',',0),
(38,'KZT','Kazakhstani Tenge',NULL,' ₸','₸',',',' ',2),
(39,'KRW','South Korean Won','₩',NULL,'₩','.',',',0),
(40,'LBP','Lebanese Pound','L£ ',NULL,'L£',',','.',0),
(41,'MKD','Macedonian Denar','den ',NULL,'den',',','.',2),
(42,'MYR','Malaysian Ringgit','RM',NULL,'RM','.',',',2),
(43,'MUR','Mauritian Rupee','Rs',NULL,'Rs','.',',',0),
(44,'MXN','Mexican Peso',NULL,' $','$',',','.',2),
(45,'MZN','Mozambican Metical','MTn',NULL,'MTn',',','.',2),
(46,'NAD','Namibian Dollar','$',NULL,'$','.',',',2),
(47,'NPR','Nepalese Rupee','Rs ',NULL,'Rs','.',',',2),
(48,'NZD','New Zealand Dollar','$',NULL,'$','.',',',2),
(49,'NIO','Nicaraguan Córdoba',NULL,' C$','C$',',','.',2),
(50,'NGN','Nigerian Naira','₦',NULL,'₦','.',',',2),
(51,'NOK','Norwegian Krone','kr ',NULL,'kr',',',' ',2),
(52,'OMR','Omani Rial','ر.ع.‏ ',NULL,'ر.ع.‏','.',',',3),
(53,'PKR','Pakistani Rupee','ر ',NULL,'ر','.',',',0),
(54,'PAB','Panamanian Balboa',NULL,' B/.','B/.',',','.',2),
(55,'PYG','Paraguayan Guarani','₲ ',NULL,'₲',',','.',0),
(56,'PEN','Peruvian Nuevo Sol',NULL,' S/.','S/.',',','.',2),
(57,'PHP','Philippine Peso','₱',NULL,'₱','.',',',2),
(58,'PLN','Polish Zloty',NULL,' zł','zł',',',' ',2),
(59,'QAR','Qatari Rial','ر.ق.‏ ',NULL,'ر.ق.‏','.',',',2),
(60,'RON','Romanian Leu',NULL,' RON','RON',',','.',2),
(61,'RUB','Russian Ruble',NULL,' ₽','₽',',',' ',2),
(62,'SAR','Saudi Riyal','ر.س.‏ ',NULL,'ر.س.‏','.',',',2),
(63,'RSD','Serbian Dinar',NULL,' дин.','дин.',',','.',0),
(64,'SGD','Singapore Dollar','$',NULL,'$','.',',',2),
(65,'SOS','Somali Shilling','S',NULL,'S','.',',',0),
(66,'ZAR','South African Rand','R',NULL,'R','.',',',2),
(67,'LKR','Sri Lankan Rupee','Rs',NULL,'Rs','.',',',2),
(68,'SEK','Swedish Krona',NULL,' kr','kr',',',' ',2),
(69,'CHF','Swiss Franc','CHF ',NULL,'CHF','.','\'',2),
(70,'SYP','Syrian Pound','£ ',NULL,'£','.',',',0),
(71,'TWD','New Taiwan Dollar','$',NULL,'$','.',',',2),
(72,'THB','Thai Baht','฿',NULL,'฿','.',',',2),
(73,'TTD','Trinidad and Tobago Dollar','$',NULL,'$','.',',',2),
(74,'TRY','Turkish Lira',NULL,' ₺','₺',',','.',2),
(75,'UAH','Ukrainian Hryvnia',NULL,' ₴','₴',',',' ',2),
(76,'GBP','British Pound Sterling','£',NULL,'£','.',',',2),
(77,'USD','US Dollar','$',NULL,'$','.',',',2),
(78,'UYU','Uruguayan Peso','$ ',NULL,'$',',','.',2),
(79,'UZS','Uzbekistan Som',NULL,' сўм','сўм',',',' ',0),
(80,'VEF','Venezuelan Bolívar','Bs',NULL,'Bs',',','.',2),
(81,'VND','Vietnamese Dong',NULL,' ₫','₫',',','.',0),
(82,'YER','Yemeni Rial','ر.ي.‏ ',NULL,'ر.ي.‏','.',',',0),
(83,'DZD','Algerian Dinar','DA ',NULL,'DA',',','.',2),
(84,'AMD','Armenian Dram','֏ ',NULL,'֏',',','.',0),
(85,'BHD','Bahraini Dinar','د.ب.‏ ',NULL,'د.ب.‏','.',',',3),
(86,'XOF','CFA Franc BCEAO',NULL,' CFA','CFA',',',' ',0),
(87,'MMK','Myanma Kyat','K ',NULL,'K','.',',',0),
(88,'BIF','Burundian Franc',NULL,' FBu','FBu',',',' ',0),
(89,'XAF','CFA Franc BEAC',NULL,' FCFA','FCFA',',',' ',0),
(90,'CVE','Cape Verdean Escudo','​',NULL,'​',',','.',2),
(91,'CDF','Congolese Franc',NULL,' FC','FC',',',' ',2),
(92,'ERN','Eritrean Nakfa','Nfk',NULL,'Nfk','.',',',2),
(93,'ETB','Ethiopian Birr','Br',NULL,'Br','.',',',2),
(94,'GEL','Georgian Lari',NULL,' ₾','₾',',',' ',2),
(95,'GNF','Guinean Franc',NULL,' FG','FG',',',' ',0),
(96,'IQD','Iraqi Dinar','د.ع.‏ ',NULL,'د.ع.‏','.',',',0),
(97,'JOD','Jordanian Dinar','د.أ.‏ ',NULL,'د.أ.‏','.',',',3),
(98,'KES','Kenyan Shilling','Ksh',NULL,'Ksh','.',',',2),
(99,'KWD','Kuwaiti Dinar','د.ك.‏ ',NULL,'د.ك.‏','.',',',3),
(100,'LYD','Libyan Dinar','د.ل.‏ ',NULL,'د.ل.‏',',','.',3),
(101,'MOP','Macanese Pataca','MOP$',NULL,'MOP$','.',',',2),
(102,'MDL','Moldovan Leu',NULL,' L','L',',','.',2),
(103,'MAD','Moroccan Dirham','د.م.‏ ',NULL,'د.م.‏','.',',',2),
(104,'RWF','Rwandan Franc','RF',NULL,'RF',',','.',0),
(105,'TZS','Tanzanian Shilling','TSh',NULL,'TSh','.',',',0),
(106,'TOP','Tongan Paʻanga','T$ ',NULL,'T$','.',',',2),
(107,'TND','Tunisian Dinar','DT ',NULL,'DT',',','.',3),
(108,'UGX','Ugandan Shilling','USh',NULL,'USh','.',',',0),
(109,'AED','United Arab Emirates Dirham','د.إ.‏ ',NULL,'د.إ.‏','.',',',2);

UNLOCK TABLES;

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `failed_jobs` */

LOCK TABLES `failed_jobs` WRITE;

UNLOCK TABLES;

/*Table structure for table `forgot_password` */

DROP TABLE IF EXISTS `forgot_password`;

CREATE TABLE `forgot_password` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `recover_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `forgot_password` */

LOCK TABLES `forgot_password` WRITE;

UNLOCK TABLES;

/*Table structure for table `forgotpassword` */

DROP TABLE IF EXISTS `forgotpassword`;

CREATE TABLE `forgotpassword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `recover_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `forgotpassword` */

LOCK TABLES `forgotpassword` WRITE;

UNLOCK TABLES;

/*Table structure for table `format` */

DROP TABLE IF EXISTS `format`;

CREATE TABLE `format` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `mask` text DEFAULT NULL,
  `pattern` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `format` */

LOCK TABLES `format` WRITE;

insert  into `format`(`id`,`name`,`mask`,`pattern`) values 
(1,'Currency 0D','{\"alias\": \"currency\",\"digits\": \"0\"}','{prefix}#{group}##0{decimal}{suffix}'),
(2,'Currency 1D','{\"alias\": \"currency\",\"digits\": \"1\"}','{prefix}#{group}##0{decimal}0{suffix}'),
(3,'Currency 2D','{\"alias\": \"currency\",\"digits\": \"2\"}','{prefix}#{group}##0{decimal}#0{suffix}'),
(4,'Integer','{\"alias\": \"numeric\", \"groupSeparator\": \",\", \"digits\": \"0\", \"autoGroup\": true}','#{group}##0{decimal}'),
(5,'Ratio 1D','{\"alias\": \"numeric\", \"groupSeparator\": \",\", \"digits\": \"1\", \"autoGroup\": true}','#{group}##0{decimal}0'),
(6,'Ratio 2D','{\"alias\": \"numeric\", \"groupSeparator\": \",\", \"digits\": \"2\", \"autoGroup\": true}','#{group}##0{decimal}#0'),
(7,'Percent 0D','{\"alias\": \"numeric\", \"groupSeparator\": \",\", \"digits\": \"0\", \"autoGroup\": true, \"suffix\": \" %\"}','#{group}##0{decimal}%'),
(8,'Percent 1D','{\"alias\": \"numeric\", \"groupSeparator\": \",\", \"digits\": \"1\", \"autoGroup\": true, \"suffix\": \" %\"}','#{group}##0{decimal}0%'),
(9,'Percent 2D','{\"alias\": \"numeric\", \"groupSeparator\": \",\", \"digits\": \"2\", \"autoGroup\": true, \"suffix\": \" %\"}','#{group}##0{decimal}#0%'),
(10,'Date','{\"alias\":\"datetime\", \"rightAlign\": true, \"inputFormat\": \"dd/mm/yyyy\"}','#/##/#0.');

UNLOCK TABLES;

/*Table structure for table `level1customcategories` */

DROP TABLE IF EXISTS `level1customcategories`;

CREATE TABLE `level1customcategories` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `created_at` int(11) DEFAULT NULL,
  `survey_login_id` int(50) DEFAULT NULL,
  `survey_code_id` int(50) DEFAULT NULL,
  `base_template_id` int(50) DEFAULT NULL,
  `parent_id` int(50) DEFAULT NULL,
  `order` int(50) DEFAULT NULL,
  `category_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `flag_id` int(2) NOT NULL COMMENT 'A flag is 1=parent, 2 = other, 0 = rows in between 1 and 2',
  `is_result` int(1) DEFAULT NULL,
  `is_hidden` int(1) DEFAULT NULL,
  `percentage` decimal(48,10) NOT NULL,
  `icon_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `help` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sign` int(1) DEFAULT NULL,
  `value_load` decimal(48,2) NOT NULL,
  `deactivated_at` int(11) DEFAULT NULL,
  `activated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `level1customcategories` */

LOCK TABLES `level1customcategories` WRITE;

insert  into `level1customcategories`(`id`,`created_at`,`survey_login_id`,`survey_code_id`,`base_template_id`,`parent_id`,`order`,`category_code`,`flag_id`,`is_result`,`is_hidden`,`percentage`,`icon_url`,`name`,`help`,`sign`,`value_load`,`deactivated_at`,`activated_at`) values 
(1,NULL,1,1,1,0,0,'HE1000',1,1,NULL,1.0000000000,'holiday.png','Holiday Expenditure','Holiday Expenditure',1,9888.00,NULL,NULL),
(2,NULL,1,1,1,1,1,'HE1000.100',0,NULL,NULL,0.2500000000,'flights.png','Flights','Flights',1,2500.08,NULL,NULL),
(3,NULL,1,1,1,1,2,'HE1000.200',0,NULL,NULL,0.2800000000,'hotels.png','Hotels','Hotels',1,2794.21,NULL,NULL),
(4,NULL,1,1,1,1,3,'HE1000.300',0,NULL,NULL,0.1600000000,'sightseeing.png','Sightseeing','Sightseeing',1,1543.37,NULL,NULL),
(5,NULL,1,1,1,1,4,'HE1000.400',0,NULL,NULL,0.1400000000,'meals.png','Meals','Meals',1,1350.31,NULL,NULL),
(6,NULL,1,1,1,1,5,'HE1000.500',0,NULL,NULL,0.0100000000,'gifts.png','Gifts','Gifts',1,141.85,NULL,NULL),
(7,NULL,1,1,1,1,6,'HE1000.600',0,NULL,NULL,0.0800000000,'transportation.png','Transportation','Transportation',1,815.53,NULL,NULL),
(8,NULL,1,1,1,1,7,'HE1000.999',2,NULL,NULL,0.0700000000,'entertainment.png','Other','Entertainment & Other',1,734.65,NULL,NULL),
(9,NULL,1,1,2,0,0,'LT2000',1,1,NULL,1.0000000000,'leisure.png','Leisure Time','Leisure Time',1,270.00,NULL,NULL),
(10,NULL,1,1,2,9,1,'LT2000.100',0,NULL,NULL,0.0700000000,'reading.png','Reading','Reading',1,18.90,NULL,NULL),
(11,NULL,1,1,2,9,2,'LT2000.200',0,NULL,NULL,0.3400000000,'watching.png','TV, YouTube, NetFlix, etc','TV',1,91.80,NULL,NULL),
(12,NULL,1,1,2,9,3,'LT2000.300',0,NULL,NULL,0.0600000000,'nap.png','Nap','Nap',1,16.20,NULL,NULL),
(13,NULL,1,1,2,9,4,'LT2000.400',0,NULL,NULL,0.2400000000,'media.png','Social Media','Social Media',1,64.80,NULL,NULL),
(14,NULL,1,1,2,9,5,'LT2000.500',0,NULL,NULL,0.1500000000,'games.png','Games','Games',1,40.50,NULL,NULL),
(15,NULL,1,1,2,9,6,'LT2000.600',0,NULL,NULL,0.0200000000,'meditation.png','Meditation & Relaxing','Meditation & Relaxing',1,5.40,NULL,NULL),
(16,1613372840,1,1,2,9,9,'LT2000.999',2,NULL,NULL,0.1200000000,'other.png','Other','Other',1,32.40,NULL,NULL),
(17,NULL,1,1,3,0,1,'FES1000',1,1,NULL,1.0000000000,'RB','RB','ADBTEL',1,35.00,NULL,NULL),
(18,NULL,1,1,3,0,2,'FES1001',1,1,NULL,1.0000000000,'SW','SW','AFDAT',2,3.65,NULL,NULL),
(19,NULL,1,1,3,0,3,'FES1002',1,1,NULL,1.0000000000,'SMB','SMB','ALETMB',2,4.65,NULL,NULL),
(20,NULL,1,1,3,0,4,'FES1003',1,1,NULL,1.0000000000,'RFMB','RFMB','ALERFMB',2,2.65,NULL,NULL),
(21,NULL,1,1,3,0,5,'FES1004',1,1,NULL,1.0000000000,'LWED','LWED','AFDDT',1,3.65,NULL,NULL),
(22,NULL,1,1,3,0,0,'LIY18',3,NULL,NULL,1.0000000000,'EA','EA','EA',2,0.00,NULL,NULL),
(23,NULL,1,1,3,22,1,'LIY18.010',3,1,NULL,0.0000000000,'AL','AL','AL',2,0.00,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `level1customtemplates` */

DROP TABLE IF EXISTS `level1customtemplates`;

CREATE TABLE `level1customtemplates` (
  `id` int(50) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `surveylogin_id` int(50) DEFAULT NULL,
  `survey_code_id` int(50) DEFAULT NULL,
  `mastercategories_category_code` varchar(765) DEFAULT NULL,
  `template_name` varchar(765) DEFAULT NULL,
  `template_description` varchar(765) DEFAULT NULL,
  `deactivated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `level1customtemplates` */

LOCK TABLES `level1customtemplates` WRITE;

insert  into `level1customtemplates`(`id`,`created_at`,`updated_at`,`surveylogin_id`,`survey_code_id`,`mastercategories_category_code`,`template_name`,`template_description`,`deactivated_at`) values 
(1,NULL,NULL,1,NULL,'HE1000','HE1000 - Holiday Expenditure',NULL,NULL),
(2,NULL,NULL,1,NULL,'LT2000','LT2000 - Leisure Time',NULL,NULL),
(3,NULL,NULL,1,NULL,'FES1000','ABC',NULL,NULL),
(4,NULL,NULL,1,NULL,'LIY18','NOT FINISHED',NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `level1feedback` */

DROP TABLE IF EXISTS `level1feedback`;

CREATE TABLE `level1feedback` (
  `id` int(50) NOT NULL,
  `created_at` int(11) NOT NULL,
  `survey_code_id` int(50) NOT NULL,
  `survey_login_id` int(50) DEFAULT NULL,
  `template_id` int(50) DEFAULT NULL,
  `level1customcategories_id` int(50) DEFAULT NULL,
  `feedback` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `level1feedback` */

LOCK TABLES `level1feedback` WRITE;

insert  into `level1feedback`(`id`,`created_at`,`survey_code_id`,`survey_login_id`,`template_id`,`level1customcategories_id`,`feedback`) values 
(0,1545137245,1,1,1,1,'the value is too high for holiday expenditure'),
(1,1545137290,1,1,1,1,'The amount for flights is too much');

UNLOCK TABLES;

/*Table structure for table `level1recommend` */

DROP TABLE IF EXISTS `level1recommend`;

CREATE TABLE `level1recommend` (
  `id` int(50) NOT NULL,
  `created_at` int(11) NOT NULL,
  `survey_code_id` int(50) NOT NULL,
  `survey_login_id` int(50) DEFAULT NULL,
  `template_id` int(50) DEFAULT NULL,
  `level1customcategories_id` int(50) DEFAULT NULL,
  `recommend` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `level1recommend` */

LOCK TABLES `level1recommend` WRITE;

insert  into `level1recommend`(`id`,`created_at`,`survey_code_id`,`survey_login_id`,`template_id`,`level1customcategories_id`,`recommend`) values 
(0,1545137245,1,1,1,1,'Massage'),
(1,1545137290,1,1,1,1,'Walks');

UNLOCK TABLES;

/*Table structure for table `level1recommendations` */

DROP TABLE IF EXISTS `level1recommendations`;

CREATE TABLE `level1recommendations` (
  `id` int(50) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `survey_code_id` int(50) DEFAULT NULL,
  `l1_categories_id` int(50) DEFAULT NULL,
  `l1_categories_group_id` int(50) DEFAULT NULL,
  `feedback` varchar(765) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `level1recommendations` */

LOCK TABLES `level1recommendations` WRITE;

insert  into `level1recommendations`(`id`,`created_at`,`survey_code_id`,`l1_categories_id`,`l1_categories_group_id`,`feedback`) values 
(1,NULL,NULL,NULL,0,'feedback1'),
(2,NULL,NULL,NULL,0,'feedback2'),
(3,NULL,NULL,NULL,0,'feedback1'),
(4,NULL,NULL,NULL,0,'feedback2'),
(5,NULL,NULL,NULL,0,'feedback1'),
(6,NULL,NULL,NULL,0,'feedback2'),
(7,NULL,NULL,NULL,0,'I spend all my money on sightseeing, please change the percentage'),
(8,NULL,NULL,NULL,0,'Meditation has a lowercase m, it looks unprofessional'),
(9,NULL,NULL,NULL,0,'Feedback Step 2'),
(10,NULL,NULL,NULL,0,''),
(11,NULL,NULL,NULL,0,'Feedback Step 2'),
(12,NULL,NULL,NULL,0,''),
(13,NULL,NULL,NULL,0,'12312312312'),
(14,NULL,NULL,NULL,0,'Feedback Step 3');

UNLOCK TABLES;

/*Table structure for table `level1results` */

DROP TABLE IF EXISTS `level1results`;

CREATE TABLE `level1results` (
  `id` int(50) NOT NULL,
  `created_at` int(11) NOT NULL,
  `survey_code_id` int(50) NOT NULL,
  `survey_login_id` int(50) DEFAULT NULL,
  `template_id` int(50) DEFAULT NULL,
  `level1customcategories_id` int(50) DEFAULT NULL,
  `is_result` int(1) DEFAULT NULL,
  `surveyed_value` decimal(48,21) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `level1results` */

LOCK TABLES `level1results` WRITE;

insert  into `level1results`(`id`,`created_at`,`survey_code_id`,`survey_login_id`,`template_id`,`level1customcategories_id`,`is_result`,`surveyed_value`) values 
(0,1545137245,1,1,1,1,1,9888.000000000000000000000),
(1,1545137290,1,1,1,1,1,9888.000000000000000000000);

UNLOCK TABLES;

/*Table structure for table `level1resultssummary` */

DROP TABLE IF EXISTS `level1resultssummary`;

CREATE TABLE `level1resultssummary` (
  `id` int(50) NOT NULL,
  `created_at` int(11) NOT NULL,
  `survey_code_id` int(50) NOT NULL,
  `survey_login_id` int(50) DEFAULT NULL,
  `template_id` int(50) DEFAULT NULL,
  `level1customcategories_id` int(50) DEFAULT NULL,
  `is_result` int(1) DEFAULT NULL,
  `surveyed_value_sum` decimal(48,21) DEFAULT NULL,
  `surveyed_value_number` decimal(48,21) DEFAULT NULL,
  `surveyed_value_average` decimal(48,21) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `level1resultssummary` */

LOCK TABLES `level1resultssummary` WRITE;

insert  into `level1resultssummary`(`id`,`created_at`,`survey_code_id`,`survey_login_id`,`template_id`,`level1customcategories_id`,`is_result`,`surveyed_value_sum`,`surveyed_value_number`,`surveyed_value_average`) values 
(0,1545137299,1,1,1,1,1,19776.000000000000000000000,2.000000000000000000000,9888.000000000000000000000);

UNLOCK TABLES;

/*Table structure for table `level1surveypages` */

DROP TABLE IF EXISTS `level1surveypages`;

CREATE TABLE `level1surveypages` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `created_at` int(11) NOT NULL,
  `survey_code_id` int(50) NOT NULL,
  `survey_page_header_user` varchar(255) DEFAULT NULL,
  `survey_page_tagline_user` varchar(255) DEFAULT NULL,
  `survey_page_name_admin` varchar(255) DEFAULT NULL,
  `survey_page_description_admin` varchar(255) DEFAULT NULL,
  `level1customcategories_template_id` int(50) DEFAULT NULL,
  `survey_page_currency` varchar(255) DEFAULT NULL,
  `survey_page_separator` varchar(255) DEFAULT NULL,
  `survey_page_decimals` int(1) DEFAULT NULL,
  `survey_page_unit` varchar(255) DEFAULT NULL,
  `page_display_order_user` int(11) DEFAULT NULL,
  `activated_at` int(11) DEFAULT NULL,
  `deactivated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `level1surveypages` */

LOCK TABLES `level1surveypages` WRITE;

insert  into `level1surveypages`(`id`,`created_at`,`survey_code_id`,`survey_page_header_user`,`survey_page_tagline_user`,`survey_page_name_admin`,`survey_page_description_admin`,`level1customcategories_template_id`,`survey_page_currency`,`survey_page_separator`,`survey_page_decimals`,`survey_page_unit`,`page_display_order_user`,`activated_at`,`deactivated_at`) values 
(1,1545137245,1,'Holiday Expenditure','How much in total do you spend on holidays each year?','HE1000 - Holiday Expenditure - Plain Text Description','This is HE1000 for custid=1, Ent-2020-Annual',1,'$','comma',2,'Artedgs XYZ Wedrs Lifabes',1,1545137245,NULL),
(2,1545137473,2,'Leisure Time','How much time do you spend?','LE1000 - Leisure Time',NULL,2,'$','dot',2,NULL,2,1545137394,NULL),
(19,1613893109,7,'asdfasdf','asdfasdf','','',1,' $ ','comma',2,'',19,NULL,NULL),
(20,1613937774,7,'Leisure Time - John','How do you spend in this weekend for rest? - John','Test - John','This is Test - John',2,' € ','comma',2,'Test',20,NULL,NULL),
(21,1613941887,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `level2customcategories` */

DROP TABLE IF EXISTS `level2customcategories`;

CREATE TABLE `level2customcategories` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `created_at` int(11) DEFAULT NULL,
  `survey_login_id` int(50) DEFAULT NULL,
  `survey_code_id` int(50) DEFAULT NULL,
  `base_template_id` int(50) DEFAULT NULL,
  `parent_id` int(50) DEFAULT NULL,
  `order` int(50) DEFAULT NULL,
  `category_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `flag_id` int(2) NOT NULL COMMENT 'A flag is 1=parent, 2 = other, 0 = rows in between 1 and 2',
  `is_result` int(1) DEFAULT NULL,
  `is_hidden` int(1) DEFAULT NULL,
  `percentage` decimal(48,10) NOT NULL,
  `icon_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `help` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sign` int(1) DEFAULT NULL,
  `value_load` decimal(48,2) NOT NULL,
  `deactivated_at` int(11) DEFAULT NULL,
  `activated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `level2customcategories` */

LOCK TABLES `level2customcategories` WRITE;

insert  into `level2customcategories`(`id`,`created_at`,`survey_login_id`,`survey_code_id`,`base_template_id`,`parent_id`,`order`,`category_code`,`flag_id`,`is_result`,`is_hidden`,`percentage`,`icon_url`,`name`,`help`,`sign`,`value_load`,`deactivated_at`,`activated_at`) values 
(1,NULL,1,1,1,0,0,'HE1000',1,1,NULL,1.0000000000,'holiday.png','Holiday Expenditure','Holiday Expenditure',1,9888.00,NULL,NULL),
(2,NULL,1,1,1,1,1,'HE1000.100',0,NULL,NULL,0.2530446549,'flights.png','Flights','Flights',1,2500.08,NULL,NULL),
(3,NULL,1,1,1,1,2,'HE1000.200',0,NULL,NULL,0.2828146143,'hotels.png','Hotels','Hotels',1,2794.21,NULL,NULL),
(4,NULL,1,1,1,1,3,'HE1000.300',0,NULL,NULL,0.1562110961,'sightseeing.png','Sightseeing','Sightseeing',1,1543.37,NULL,NULL),
(5,NULL,1,1,1,1,4,'HE1000.400',0,NULL,NULL,0.1366711773,'meals.png','Meals','Meals',1,1350.31,NULL,NULL),
(6,NULL,1,1,1,1,5,'HE1000.500',0,NULL,NULL,0.0143572395,'gifts.png','Gifts','Gifts',1,141.85,NULL,NULL),
(7,NULL,1,1,1,1,6,'HE1000.600',0,NULL,NULL,0.0825439783,'transportation.png','Transportation','Transportation',1,815.53,NULL,NULL),
(8,1613423580,1,1,1,1,9,'HE1000.999',2,NULL,NULL,0.0393572395,'entertainment.png','Other','Entertainment & Other',1,389.16,NULL,NULL),
(9,NULL,1,1,2,0,0,'LT2000',1,1,NULL,1.0000000000,'leisure.png','Leisure Time','Leisure Time',1,270.00,NULL,NULL),
(10,NULL,1,1,2,9,1,'LT2000.100',0,NULL,NULL,0.0653044655,'reading.png','Reading','Reading',1,17.63,NULL,NULL),
(11,NULL,1,1,2,9,2,'LT2000.200',0,NULL,NULL,0.3428146143,'watching.png','TV, YouTube, NetFlix, etc','TV',1,92.56,NULL,NULL),
(12,NULL,1,1,2,9,3,'LT2000.300',0,NULL,NULL,0.0562110961,'nap.png','Nap','Nap',1,15.18,NULL,NULL),
(13,NULL,1,1,2,9,4,'LT2000.400',0,NULL,NULL,0.2366711773,'media.png','Social Media','Social Media',1,63.90,NULL,NULL),
(14,NULL,1,1,2,9,5,'LT2000.500',0,NULL,NULL,0.1543572395,'games.png','Games','Games',1,41.68,NULL,NULL),
(15,NULL,1,1,2,9,6,'LT2000.600',0,NULL,NULL,0.0225439783,'meditation.png','Meditation & Relaxing','Meditation & Relaxing',1,6.09,NULL,NULL),
(16,1613871248,1,1,2,9,9,'LT2000.999',2,NULL,NULL,0.0850000000,'other.png','Other','Other',1,22.95,NULL,NULL),
(17,NULL,1,1,3,0,1,'FES1000',1,1,NULL,1.0000000000,'RB','RB','ADBTEL',1,35.00,NULL,NULL),
(18,NULL,1,1,3,0,2,'FES1001',1,1,NULL,1.0000000000,'SW','SW','AFDAT',2,3.65,NULL,NULL),
(19,NULL,1,1,3,0,3,'FES1002',1,1,NULL,1.0000000000,'SMB','SMB','ALETMB',2,4.65,NULL,NULL),
(20,NULL,1,1,3,0,4,'FES1003',1,1,NULL,1.0000000000,'RFMB','RFMB','ALERFMB',2,2.65,NULL,NULL),
(21,NULL,1,1,3,0,5,'FES1004',1,1,NULL,1.0000000000,'LWED','LWED','AFDDT',1,3.65,NULL,NULL),
(22,NULL,1,1,3,0,0,'LIY18',3,NULL,NULL,1.0000000000,'EA','EA','EA',2,0.00,NULL,NULL),
(23,NULL,1,1,3,22,1,'LIY18.010',3,1,NULL,0.0000000000,'AL','AL','AL',2,0.00,NULL,NULL),
(24,1613418058,1,1,2,9,7,'LT2000.700',0,NULL,NULL,0.0463000000,'avatar.png','Test',NULL,1,12.50,NULL,NULL),
(25,1613418345,1,1,2,1,7,'HE1000.700',0,NULL,NULL,0.0374500000,'facebook (1).png','Holiday_test',NULL,1,370.31,NULL,NULL),
(26,1613423580,1,1,2,1,7,'HE1000.800',0,NULL,NULL,0.0350000000,'instagram (1).png','Htest',NULL,1,346.08,NULL,NULL),
(27,1613871248,0,0,2,1,7,'LT2000.700',0,NULL,NULL,0.0350000000,'facebook.png','Add',NULL,1,9.45,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `level2feedback` */

DROP TABLE IF EXISTS `level2feedback`;

CREATE TABLE `level2feedback` (
  `id` int(50) NOT NULL,
  `created_at` int(11) NOT NULL,
  `survey_code_id` int(50) NOT NULL,
  `survey_login_id` int(50) DEFAULT NULL,
  `template_id` int(50) DEFAULT NULL,
  `level2customcategories_id` int(50) DEFAULT NULL,
  `feedback` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `level2feedback` */

LOCK TABLES `level2feedback` WRITE;

insert  into `level2feedback`(`id`,`created_at`,`survey_code_id`,`survey_login_id`,`template_id`,`level2customcategories_id`,`feedback`) values 
(0,1545137245,1,1,1,1,'the value is too high for holiday expenditure'),
(1,1545137290,1,1,1,1,'The amount for flights is too much');

UNLOCK TABLES;

/*Table structure for table `level2recommend` */

DROP TABLE IF EXISTS `level2recommend`;

CREATE TABLE `level2recommend` (
  `id` int(50) NOT NULL,
  `created_at` int(11) NOT NULL,
  `survey_code_id` int(50) NOT NULL,
  `survey_login_id` int(50) DEFAULT NULL,
  `template_id` int(50) DEFAULT NULL,
  `level2customcategories_id` int(50) DEFAULT NULL,
  `recommend` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `level2recommend` */

LOCK TABLES `level2recommend` WRITE;

insert  into `level2recommend`(`id`,`created_at`,`survey_code_id`,`survey_login_id`,`template_id`,`level2customcategories_id`,`recommend`) values 
(0,1545137245,1,1,1,1,'Massage'),
(1,1545137290,1,1,1,1,'Walks');

UNLOCK TABLES;

/*Table structure for table `level2recommendations` */

DROP TABLE IF EXISTS `level2recommendations`;

CREATE TABLE `level2recommendations` (
  `id` int(50) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `survey_code_id` int(50) DEFAULT NULL,
  `l1_categories_id` int(50) DEFAULT NULL,
  `l1_categories_group_id` int(50) DEFAULT NULL,
  `feedback` varchar(765) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `level2recommendations` */

LOCK TABLES `level2recommendations` WRITE;

insert  into `level2recommendations`(`id`,`created_at`,`survey_code_id`,`l1_categories_id`,`l1_categories_group_id`,`feedback`) values 
(1,NULL,NULL,NULL,0,'feedback1'),
(2,NULL,NULL,NULL,0,'feedback2'),
(3,NULL,NULL,NULL,0,'feedback1'),
(4,NULL,NULL,NULL,0,'feedback2'),
(5,NULL,NULL,NULL,0,'feedback1'),
(6,NULL,NULL,NULL,0,'feedback2'),
(7,NULL,NULL,NULL,0,'I spend all my money on sightseeing, please change the percentage'),
(8,NULL,NULL,NULL,0,'Meditation has a lowercase m, it looks unprofessional'),
(9,NULL,NULL,NULL,0,'Feedback Step 2'),
(10,NULL,NULL,NULL,0,''),
(11,NULL,NULL,NULL,0,'Feedback Step 2'),
(12,NULL,NULL,NULL,0,''),
(13,NULL,NULL,NULL,0,'12312312312'),
(14,NULL,NULL,NULL,0,'Feedback Step 3');

UNLOCK TABLES;

/*Table structure for table `level2results` */

DROP TABLE IF EXISTS `level2results`;

CREATE TABLE `level2results` (
  `id` int(50) NOT NULL,
  `created_at` int(11) NOT NULL,
  `survey_code_id` int(50) NOT NULL,
  `survey_login_id` int(50) DEFAULT NULL,
  `template_id` int(50) DEFAULT NULL,
  `level2customcategories_id` int(50) DEFAULT NULL,
  `is_result` int(1) DEFAULT NULL,
  `surveyed_value` decimal(48,21) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `level2results` */

LOCK TABLES `level2results` WRITE;

insert  into `level2results`(`id`,`created_at`,`survey_code_id`,`survey_login_id`,`template_id`,`level2customcategories_id`,`is_result`,`surveyed_value`) values 
(0,1545137245,1,1,1,1,1,9888.000000000000000000000),
(1,1545137290,1,1,1,1,1,9888.000000000000000000000);

UNLOCK TABLES;

/*Table structure for table `level2resultssummary` */

DROP TABLE IF EXISTS `level2resultssummary`;

CREATE TABLE `level2resultssummary` (
  `id` int(50) NOT NULL,
  `created_at` int(11) NOT NULL,
  `survey_code_id` int(50) NOT NULL,
  `survey_login_id` int(50) DEFAULT NULL,
  `template_id` int(50) DEFAULT NULL,
  `level2customcategories_id` int(50) DEFAULT NULL,
  `is_result` int(1) DEFAULT NULL,
  `surveyed_value_sum` decimal(48,21) DEFAULT NULL,
  `surveyed_value_number` decimal(48,21) DEFAULT NULL,
  `surveyed_value_average` decimal(48,21) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `level2resultssummary` */

LOCK TABLES `level2resultssummary` WRITE;

insert  into `level2resultssummary`(`id`,`created_at`,`survey_code_id`,`survey_login_id`,`template_id`,`level2customcategories_id`,`is_result`,`surveyed_value_sum`,`surveyed_value_number`,`surveyed_value_average`) values 
(0,1545137299,1,1,1,1,1,19776.000000000000000000000,2.000000000000000000000,9888.000000000000000000000);

UNLOCK TABLES;

/*Table structure for table `level2surveypages` */

DROP TABLE IF EXISTS `level2surveypages`;

CREATE TABLE `level2surveypages` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `created_at` int(11) NOT NULL,
  `survey_code_id` int(50) NOT NULL,
  `survey_page_header_user` varchar(255) DEFAULT NULL,
  `survey_page_tagline_user` varchar(255) DEFAULT NULL,
  `survey_page_name_admin` varchar(255) DEFAULT NULL,
  `survey_page_description_admin` varchar(255) DEFAULT NULL,
  `level2customcategories_template_id` int(50) DEFAULT NULL,
  `survey_page_currency` varchar(255) DEFAULT NULL,
  `survey_page_separator` varchar(255) DEFAULT NULL,
  `survey_page_decimals` int(1) DEFAULT NULL,
  `survey_page_unit` varchar(255) DEFAULT NULL,
  `page_display_order_user` int(11) DEFAULT NULL,
  `activated_at` int(11) DEFAULT NULL,
  `deactivated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `level2surveypages` */

LOCK TABLES `level2surveypages` WRITE;

insert  into `level2surveypages`(`id`,`created_at`,`survey_code_id`,`survey_page_header_user`,`survey_page_tagline_user`,`survey_page_name_admin`,`survey_page_description_admin`,`level2customcategories_template_id`,`survey_page_currency`,`survey_page_separator`,`survey_page_decimals`,`survey_page_unit`,`page_display_order_user`,`activated_at`,`deactivated_at`) values 
(1,1613914745,5,'Rosya','rosya','HE1000 - Holiday Expenditure - Plain Text Description','This is HE1000 for custid=1, Ent-2020-Annual',1,' $ ','comma',2,'Artedgs XYZ Wedrs Lifabes',NULL,NULL,NULL),
(2,1545137245,1,'Holiday Expenditure','How much in total do you spend on holidays each year?','HE1000 - Holiday Expenditure - Plain Text Description','This is HE1000 for custid=1, Ent-2020-Annual',1,' $ ','comma',2,'Artedgs XYZ Wedrs Lifabes',1,1545137245,NULL),
(3,1545136245,1,'Leisure Time','How long time do you send?','LT2000 - Leisure Time','This is LT2000 ',2,' $ ','dot',2,'Leisure',2,1538594324,NULL),
(5,1613805290,5,'Rosya_Holiday',NULL,'Rosya-20','This is Rosya Survey Pages',1,' € ','comma',1,'Rosya_holiday',NULL,NULL,NULL),
(6,1613807525,5,'Rosya Leisure',NULL,'','',2,' $ ','comma',2,'',NULL,NULL,NULL),
(7,1613807604,5,'Rosya_expenditure',NULL,'','',1,' $ ','comma',2,'',NULL,NULL,NULL),
(8,1613809118,5,NULL,NULL,'New','This Is NEW',1,' £ ','comma',2,'New',NULL,NULL,NULL),
(9,1613809241,5,NULL,NULL,'This is New','This is New',1,' € ','comma',2,'New',9,NULL,NULL),
(10,1613870425,5,NULL,NULL,'HE1000 - Holiday Expenditure - Plain Text Description','This is HE1000 for custid=1, Ent-2020-Annual',1,' £ ','comma',2,'Holiday Expenditure',10,NULL,NULL),
(11,1613894129,5,'Holiday Expenditure (Rosya)','How long time do you send this weekend for rest?','','',1,' $ ','comma',2,'',11,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `level3customcategories` */

DROP TABLE IF EXISTS `level3customcategories`;

CREATE TABLE `level3customcategories` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `created_at` int(11) DEFAULT NULL,
  `survey_login_id` int(50) DEFAULT NULL,
  `survey_code_id` int(50) DEFAULT NULL,
  `base_template_id` int(50) DEFAULT NULL,
  `parent_id` int(50) DEFAULT NULL,
  `order` int(50) DEFAULT NULL,
  `category_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `flag_id` int(2) NOT NULL COMMENT 'A flag is 1=parent, 2 = other, 0 = rows in between 1 and 2',
  `is_result` int(1) DEFAULT NULL,
  `is_hidden` int(1) DEFAULT NULL,
  `percentage` decimal(48,21) NOT NULL,
  `icon_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `help` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sign` int(1) DEFAULT NULL,
  `value_load` decimal(48,21) NOT NULL,
  `deactivated_at` int(11) DEFAULT NULL,
  `activated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `level3customcategories` */

LOCK TABLES `level3customcategories` WRITE;

insert  into `level3customcategories`(`id`,`created_at`,`survey_login_id`,`survey_code_id`,`base_template_id`,`parent_id`,`order`,`category_code`,`flag_id`,`is_result`,`is_hidden`,`percentage`,`icon_url`,`name`,`help`,`sign`,`value_load`,`deactivated_at`,`activated_at`) values 
(1,NULL,1,1,1,0,0,'HE1000',1,1,NULL,1.000000000000000000000,'holiday','Holiday Expenditure','Holiday Expenditure',1,9888.000000000000000000000,NULL,NULL),
(2,NULL,1,1,1,1,1,'HE1000.100',0,NULL,NULL,0.253044654939107000000,'flights','Flights','Flights',1,2500.080000000000000000000,NULL,NULL),
(3,NULL,1,1,1,1,2,'HE1000.200',0,NULL,NULL,0.282814614343708000000,'hotels','Hotels','Hotels',1,2794.210000000000000000000,NULL,NULL),
(4,NULL,1,1,1,1,3,'HE1000.300',0,NULL,NULL,0.156211096075778000000,'sightseeing','Sightseeing','Sightseeing',1,1543.370000000000000000000,NULL,NULL),
(5,NULL,1,1,1,1,4,'HE1000.400',0,NULL,NULL,0.136671177266576000000,'meals','Meals','Meals',1,1350.310000000000000000000,NULL,NULL),
(6,NULL,1,1,1,1,5,'HE1000.500',0,NULL,NULL,0.014357239512855200000,'gifts','Gifts','Gifts',1,141.850000000000000000000,NULL,NULL),
(7,NULL,1,1,1,1,6,'HE1000.600',0,NULL,NULL,0.082543978349120400000,'transportation','Transportation','Transportation',1,815.530000000000000000000,NULL,NULL),
(8,NULL,1,1,1,1,7,'HE1000.999',2,NULL,NULL,0.074357239512855400000,'entertainment','Other','Entertainment & Other',1,734.650000000000000000000,NULL,NULL),
(9,NULL,1,1,2,0,0,'LT2000',1,1,NULL,1.000000000000000000000,'leisure','Leisure Time','Leisure Time',1,270.000000000000000000000,NULL,NULL),
(10,NULL,1,1,2,9,1,'LT2000.100',0,NULL,NULL,0.065304465493910000000,'reading','Reading','Reading',1,17.630000000000000000000,NULL,NULL),
(11,NULL,1,1,2,9,2,'LT2000.200',0,NULL,NULL,0.342814614343708000000,'watching','TV, YouTube, NetFlix, etc','TV',1,92.560000000000000000000,NULL,NULL),
(12,NULL,1,1,2,9,3,'LT2000.300',0,NULL,NULL,0.056211096075778000000,'nap','Nap','Nap',1,15.180000000000000000000,NULL,NULL),
(13,NULL,1,1,2,9,4,'LT2000.400',0,NULL,NULL,0.236671177266576000000,'media','Social Media','Social Media',1,63.900000000000000000000,NULL,NULL),
(14,NULL,1,1,2,9,5,'LT2000.500',0,NULL,NULL,0.154357239512855000000,'games','Games','Games',1,41.680000000000000000000,NULL,NULL),
(15,NULL,1,1,2,9,6,'LT2000.600',0,NULL,NULL,0.022543978349120400000,'meditation','Meditation & Relaxing','Meditation & Relaxing',1,6.090000000000000000000,NULL,NULL),
(16,1613942022,1,1,2,9,9,'LT2000.999',2,NULL,NULL,0.099097428999999990000,'other','Other','Other',1,26.756305829999995000000,NULL,NULL),
(17,NULL,1,1,3,0,1,'FES1000',1,1,NULL,1.000000000000000000000,'RB','RB','ADBTEL',1,35.000000000000000000000,NULL,NULL),
(18,NULL,1,1,3,0,2,'FES1001',1,1,NULL,1.000000000000000000000,'SW','SW','AFDAT',2,3.650000000000000000000,NULL,NULL),
(19,NULL,1,1,3,0,3,'FES1002',1,1,NULL,1.000000000000000000000,'SMB','SMB','ALETMB',2,4.650000000000000000000,NULL,NULL),
(20,NULL,1,1,3,0,4,'FES1003',1,1,NULL,1.000000000000000000000,'RFMB','RFMB','ALERFMB',2,2.650000000000000000000,NULL,NULL),
(21,NULL,1,1,3,0,5,'FES1004',1,1,NULL,1.000000000000000000000,'LWED','LWED','AFDDT',1,3.650000000000000000000,NULL,NULL),
(22,NULL,1,1,3,0,0,'LIY18',3,NULL,NULL,1.000000000000000000000,'EA','EA','EA',2,0.000000000000000000000,NULL,NULL),
(23,NULL,1,1,3,22,1,'LIY18.010',3,1,NULL,0.000000000000000000000,'AL','AL','AL',2,0.000000000000000000000,NULL,NULL),
(24,1613942022,15,8,3,1,7,'LT2000.800',0,NULL,NULL,0.023000000000000000000,'avatar.png','Ilya_test',NULL,1,6.210000000000000000000,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `level3feedback` */

DROP TABLE IF EXISTS `level3feedback`;

CREATE TABLE `level3feedback` (
  `id` int(50) NOT NULL,
  `created_at` int(11) NOT NULL,
  `survey_code_id` int(50) NOT NULL,
  `survey_login_id` int(50) DEFAULT NULL,
  `template_id` int(50) DEFAULT NULL,
  `level3customcategories_id` int(50) DEFAULT NULL,
  `feedback` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `level3feedback` */

LOCK TABLES `level3feedback` WRITE;

insert  into `level3feedback`(`id`,`created_at`,`survey_code_id`,`survey_login_id`,`template_id`,`level3customcategories_id`,`feedback`) values 
(0,1545137245,1,1,1,1,'the value is too high for holiday expenditure'),
(1,1545137290,1,1,1,1,'The amount for flights is too much');

UNLOCK TABLES;

/*Table structure for table `level3recommend` */

DROP TABLE IF EXISTS `level3recommend`;

CREATE TABLE `level3recommend` (
  `id` int(50) NOT NULL,
  `created_at` int(11) NOT NULL,
  `survey_code_id` int(50) NOT NULL,
  `survey_login_id` int(50) DEFAULT NULL,
  `template_id` int(50) DEFAULT NULL,
  `level3customcategories_id` int(50) DEFAULT NULL,
  `recommend` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `level3recommend` */

LOCK TABLES `level3recommend` WRITE;

insert  into `level3recommend`(`id`,`created_at`,`survey_code_id`,`survey_login_id`,`template_id`,`level3customcategories_id`,`recommend`) values 
(0,1545137245,1,1,1,1,'Massage'),
(1,1545137290,1,1,1,1,'Walks');

UNLOCK TABLES;

/*Table structure for table `level3recommendations` */

DROP TABLE IF EXISTS `level3recommendations`;

CREATE TABLE `level3recommendations` (
  `id` int(50) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `survey_code_id` int(50) DEFAULT NULL,
  `l1_categories_id` int(50) DEFAULT NULL,
  `l1_categories_group_id` int(50) DEFAULT NULL,
  `feedback` varchar(765) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `level3recommendations` */

LOCK TABLES `level3recommendations` WRITE;

insert  into `level3recommendations`(`id`,`created_at`,`survey_code_id`,`l1_categories_id`,`l1_categories_group_id`,`feedback`) values 
(1,NULL,NULL,NULL,0,'feedback1'),
(2,NULL,NULL,NULL,0,'feedback2'),
(3,NULL,NULL,NULL,0,'feedback1'),
(4,NULL,NULL,NULL,0,'feedback2'),
(5,NULL,NULL,NULL,0,'feedback1'),
(6,NULL,NULL,NULL,0,'feedback2'),
(7,NULL,NULL,NULL,0,'I spend all my money on sightseeing, please change the percentage'),
(8,NULL,NULL,NULL,0,'Meditation has a lowercase m, it looks unprofessional'),
(9,NULL,NULL,NULL,0,'Feedback Step 2'),
(10,NULL,NULL,NULL,0,''),
(11,NULL,NULL,NULL,0,'Feedback Step 2'),
(12,NULL,NULL,NULL,0,''),
(13,NULL,NULL,NULL,0,'12312312312'),
(14,NULL,NULL,NULL,0,'Feedback Step 3');

UNLOCK TABLES;

/*Table structure for table `level3results` */

DROP TABLE IF EXISTS `level3results`;

CREATE TABLE `level3results` (
  `id` int(50) NOT NULL,
  `created_at` int(11) NOT NULL,
  `survey_code_id` int(50) NOT NULL,
  `survey_login_id` int(50) DEFAULT NULL,
  `template_id` int(50) DEFAULT NULL,
  `level3customcategories_id` int(50) DEFAULT NULL,
  `is_result` int(1) DEFAULT NULL,
  `surveyed_value` decimal(48,21) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `level3results` */

LOCK TABLES `level3results` WRITE;

insert  into `level3results`(`id`,`created_at`,`survey_code_id`,`survey_login_id`,`template_id`,`level3customcategories_id`,`is_result`,`surveyed_value`) values 
(0,1545137245,1,1,1,1,1,9888.000000000000000000000),
(1,1545137290,1,1,1,1,1,9888.000000000000000000000);

UNLOCK TABLES;

/*Table structure for table `level3resultssummary` */

DROP TABLE IF EXISTS `level3resultssummary`;

CREATE TABLE `level3resultssummary` (
  `id` int(50) NOT NULL,
  `created_at` int(11) NOT NULL,
  `survey_code_id` int(50) NOT NULL,
  `survey_login_id` int(50) DEFAULT NULL,
  `template_id` int(50) DEFAULT NULL,
  `level3customcategories_id` int(50) DEFAULT NULL,
  `is_result` int(1) DEFAULT NULL,
  `surveyed_value_sum` decimal(48,21) DEFAULT NULL,
  `surveyed_value_number` decimal(48,21) DEFAULT NULL,
  `surveyed_value_average` decimal(48,21) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `level3resultssummary` */

LOCK TABLES `level3resultssummary` WRITE;

insert  into `level3resultssummary`(`id`,`created_at`,`survey_code_id`,`survey_login_id`,`template_id`,`level3customcategories_id`,`is_result`,`surveyed_value_sum`,`surveyed_value_number`,`surveyed_value_average`) values 
(0,1545137299,1,1,1,1,1,19776.000000000000000000000,2.000000000000000000000,9888.000000000000000000000);

UNLOCK TABLES;

/*Table structure for table `level3surveypages` */

DROP TABLE IF EXISTS `level3surveypages`;

CREATE TABLE `level3surveypages` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `created_at` int(11) NOT NULL,
  `survey_code_id` int(50) NOT NULL,
  `survey_page_header_user` varchar(255) DEFAULT NULL,
  `survey_page_tagline_user` varchar(255) DEFAULT NULL,
  `survey_page_name_admin` varchar(255) DEFAULT NULL,
  `survey_page_description_admin` varchar(255) DEFAULT NULL,
  `level3customcategories_template_id` int(50) DEFAULT NULL,
  `survey_page_currency` varchar(255) DEFAULT NULL,
  `survey_page_separator` varchar(255) DEFAULT NULL,
  `survey_page_decimals` int(1) DEFAULT NULL,
  `survey_page_unit` varchar(255) DEFAULT NULL,
  `page_display_order_user` int(11) DEFAULT NULL,
  `activated_at` int(11) DEFAULT NULL,
  `deactivated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `level3surveypages` */

LOCK TABLES `level3surveypages` WRITE;

insert  into `level3surveypages`(`id`,`created_at`,`survey_code_id`,`survey_page_header_user`,`survey_page_tagline_user`,`survey_page_name_admin`,`survey_page_description_admin`,`level3customcategories_template_id`,`survey_page_currency`,`survey_page_separator`,`survey_page_decimals`,`survey_page_unit`,`page_display_order_user`,`activated_at`,`deactivated_at`) values 
(1,1613512273,3,NULL,NULL,'LE1000 - Leisure Time(Rosya)','This is build by Rosya',2,' £ ','comma',2,'Leisure Time',NULL,NULL,NULL),
(2,1545137245,1,'Holiday Expenditure','How much in total do you spend on holidays each year?','HE1000 - Holiday Expenditure - Plain Text Description','This is HE1000 for custid=1, Ent-2020-Annual',1,'$','comma',2,'Artedgs XYZ Wedrs Lifabes',1,1545137245,NULL),
(3,1613515417,3,NULL,NULL,'HE1000 - Holiday Expenditure - Plain Text Description','This is HE1000 for custid=1, Ent-2020-Annual',1,' $ ','comma',2,'Holiday Expenditure',NULL,NULL,NULL),
(4,1613941964,8,'Holiday - Ilya_test-1','How do you spend ? - ilya_test','This is Ilya_test_1','This is He100 for Ilya_test_1',2,' € ','comma',2,'',4,NULL,NULL),
(5,1614011396,8,'Holiday Expenditure - Rosay-2','How do you send this weekend? - rosya-2','He100 - Roysa-2','This is Rosya-2 Holiday Expenditure',1,' £ ','comma',2,'Rosya-2',5,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `level4customcategories` */

DROP TABLE IF EXISTS `level4customcategories`;

CREATE TABLE `level4customcategories` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `created_at` int(11) DEFAULT NULL,
  `survey_login_id` int(50) DEFAULT NULL,
  `survey_code_id` int(50) DEFAULT NULL,
  `base_template_id` int(50) DEFAULT NULL,
  `parent_id` int(50) DEFAULT NULL,
  `order` int(50) DEFAULT NULL,
  `category_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `flag_id` int(2) NOT NULL COMMENT 'A flag is 1=parent, 2 = other, 0 = rows in between 1 and 2',
  `is_result` int(1) DEFAULT NULL,
  `is_hidden` int(1) DEFAULT NULL,
  `percentage` decimal(48,21) NOT NULL,
  `icon_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `help` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sign` int(1) DEFAULT NULL,
  `value_load` decimal(48,21) NOT NULL,
  `deactivated_at` int(11) DEFAULT NULL,
  `activated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `level4customcategories` */

LOCK TABLES `level4customcategories` WRITE;

insert  into `level4customcategories`(`id`,`created_at`,`survey_login_id`,`survey_code_id`,`base_template_id`,`parent_id`,`order`,`category_code`,`flag_id`,`is_result`,`is_hidden`,`percentage`,`icon_url`,`name`,`help`,`sign`,`value_load`,`deactivated_at`,`activated_at`) values 
(1,NULL,1,1,1,0,0,'HE1000',1,1,NULL,1.000000000000000000000,'holiday','Holiday Expenditure','Holiday Expenditure',1,9888.000000000000000000000,NULL,NULL),
(2,NULL,1,1,1,1,1,'HE1000.100',0,NULL,NULL,0.253044654939107000000,'flights','Flights','Flights',1,2500.080000000000000000000,NULL,NULL),
(3,NULL,1,1,1,1,2,'HE1000.200',0,NULL,NULL,0.282814614343708000000,'hotels','Hotels','Hotels',1,2794.210000000000000000000,NULL,NULL),
(4,NULL,1,1,1,1,3,'HE1000.300',0,NULL,NULL,0.156211096075778000000,'sightseeing','Sightseeing','Sightseeing',1,1543.370000000000000000000,NULL,NULL),
(5,NULL,1,1,1,1,4,'HE1000.400',0,NULL,NULL,0.136671177266576000000,'meals','Meals','Meals',1,1350.310000000000000000000,NULL,NULL),
(6,NULL,1,1,1,1,5,'HE1000.500',0,NULL,NULL,0.014357239512855200000,'gifts','Gifts','Gifts',1,141.850000000000000000000,NULL,NULL),
(7,NULL,1,1,1,1,6,'HE1000.600',0,NULL,NULL,0.082543978349120400000,'transportation','Transportation','Transportation',1,815.530000000000000000000,NULL,NULL),
(8,NULL,1,1,1,1,7,'HE1000.999',2,NULL,NULL,0.074357239512855400000,'entertainment','Other','Entertainment & Other',1,734.650000000000000000000,NULL,NULL),
(9,NULL,1,1,2,0,0,'LT2000',1,1,NULL,1.000000000000000000000,'leisure','Leisure Time','Leisure Time',1,270.000000000000000000000,NULL,NULL),
(10,NULL,1,1,2,9,1,'LT2000.100',0,NULL,NULL,0.065304465493910000000,'reading','Reading','Reading',1,17.630000000000000000000,NULL,NULL),
(11,NULL,1,1,2,9,2,'LT2000.200',0,NULL,NULL,0.342814614343708000000,'watching','TV, YouTube, NetFlix, etc','TV',1,92.560000000000000000000,NULL,NULL),
(12,NULL,1,1,2,9,3,'LT2000.300',0,NULL,NULL,0.056211096075778000000,'nap','Nap','Nap',1,15.180000000000000000000,NULL,NULL),
(13,NULL,1,1,2,9,4,'LT2000.400',0,NULL,NULL,0.236671177266576000000,'media','Social Media','Social Media',1,63.900000000000000000000,NULL,NULL),
(14,NULL,1,1,2,9,5,'LT2000.500',0,NULL,NULL,0.154357239512855000000,'games','Games','Games',1,41.680000000000000000000,NULL,NULL),
(15,NULL,1,1,2,9,6,'LT2000.600',0,NULL,NULL,0.022543978349120400000,'meditation','Meditation & Relaxing','Meditation & Relaxing',1,6.090000000000000000000,NULL,NULL),
(16,NULL,1,1,2,9,7,'LT2000.999',2,NULL,NULL,0.122097428958053000000,'other','Other','Other',1,32.970000000000000000000,NULL,NULL),
(17,NULL,1,1,3,0,1,'FES1000',1,1,NULL,1.000000000000000000000,'RB','RB','ADBTEL',1,35.000000000000000000000,NULL,NULL),
(18,NULL,1,1,3,0,2,'FES1001',1,1,NULL,1.000000000000000000000,'SW','SW','AFDAT',2,3.650000000000000000000,NULL,NULL),
(19,NULL,1,1,3,0,3,'FES1002',1,1,NULL,1.000000000000000000000,'SMB','SMB','ALETMB',2,4.650000000000000000000,NULL,NULL),
(20,NULL,1,1,3,0,4,'FES1003',1,1,NULL,1.000000000000000000000,'RFMB','RFMB','ALERFMB',2,2.650000000000000000000,NULL,NULL),
(21,NULL,1,1,3,0,5,'FES1004',1,1,NULL,1.000000000000000000000,'LWED','LWED','AFDDT',1,3.650000000000000000000,NULL,NULL),
(22,NULL,1,1,3,0,0,'LIY18',3,NULL,NULL,1.000000000000000000000,'EA','EA','EA',2,0.000000000000000000000,NULL,NULL),
(23,NULL,1,1,3,22,1,'LIY18.010',3,1,NULL,0.000000000000000000000,'AL','AL','AL',2,0.000000000000000000000,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `level4feedback` */

DROP TABLE IF EXISTS `level4feedback`;

CREATE TABLE `level4feedback` (
  `id` int(50) NOT NULL,
  `created_at` int(11) NOT NULL,
  `survey_code_id` int(50) NOT NULL,
  `survey_login_id` int(50) DEFAULT NULL,
  `template_id` int(50) DEFAULT NULL,
  `level4customcategories_id` int(50) DEFAULT NULL,
  `feedback` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `level4feedback` */

LOCK TABLES `level4feedback` WRITE;

insert  into `level4feedback`(`id`,`created_at`,`survey_code_id`,`survey_login_id`,`template_id`,`level4customcategories_id`,`feedback`) values 
(0,1545137245,1,1,1,1,'the value is too high for holiday expenditure'),
(1,1545137290,1,1,1,1,'The amount for flights is too much');

UNLOCK TABLES;

/*Table structure for table `level4recommend` */

DROP TABLE IF EXISTS `level4recommend`;

CREATE TABLE `level4recommend` (
  `id` int(50) NOT NULL,
  `created_at` int(11) NOT NULL,
  `survey_code_id` int(50) NOT NULL,
  `survey_login_id` int(50) DEFAULT NULL,
  `template_id` int(50) DEFAULT NULL,
  `level4customcategories_id` int(50) DEFAULT NULL,
  `recommend` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `level4recommend` */

LOCK TABLES `level4recommend` WRITE;

insert  into `level4recommend`(`id`,`created_at`,`survey_code_id`,`survey_login_id`,`template_id`,`level4customcategories_id`,`recommend`) values 
(0,1545137245,1,1,1,1,'Massage'),
(1,1545137290,1,1,1,1,'Walks');

UNLOCK TABLES;

/*Table structure for table `level4recommendations` */

DROP TABLE IF EXISTS `level4recommendations`;

CREATE TABLE `level4recommendations` (
  `id` int(50) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `survey_code_id` int(50) DEFAULT NULL,
  `l1_categories_id` int(50) DEFAULT NULL,
  `l1_categories_group_id` int(50) DEFAULT NULL,
  `feedback` varchar(765) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `level4recommendations` */

LOCK TABLES `level4recommendations` WRITE;

insert  into `level4recommendations`(`id`,`created_at`,`survey_code_id`,`l1_categories_id`,`l1_categories_group_id`,`feedback`) values 
(1,NULL,NULL,NULL,0,'feedback1'),
(2,NULL,NULL,NULL,0,'feedback2'),
(3,NULL,NULL,NULL,0,'feedback1'),
(4,NULL,NULL,NULL,0,'feedback2'),
(5,NULL,NULL,NULL,0,'feedback1'),
(6,NULL,NULL,NULL,0,'feedback2'),
(7,NULL,NULL,NULL,0,'I spend all my money on sightseeing, please change the percentage'),
(8,NULL,NULL,NULL,0,'Meditation has a lowercase m, it looks unprofessional'),
(9,NULL,NULL,NULL,0,'Feedback Step 2'),
(10,NULL,NULL,NULL,0,''),
(11,NULL,NULL,NULL,0,'Feedback Step 2'),
(12,NULL,NULL,NULL,0,''),
(13,NULL,NULL,NULL,0,'12312312312'),
(14,NULL,NULL,NULL,0,'Feedback Step 3');

UNLOCK TABLES;

/*Table structure for table `level4results` */

DROP TABLE IF EXISTS `level4results`;

CREATE TABLE `level4results` (
  `id` int(50) NOT NULL,
  `created_at` int(11) NOT NULL,
  `survey_code_id` int(50) NOT NULL,
  `survey_login_id` int(50) DEFAULT NULL,
  `template_id` int(50) DEFAULT NULL,
  `level4customcategories_id` int(50) DEFAULT NULL,
  `is_result` int(1) DEFAULT NULL,
  `surveyed_value` decimal(48,21) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `level4results` */

LOCK TABLES `level4results` WRITE;

insert  into `level4results`(`id`,`created_at`,`survey_code_id`,`survey_login_id`,`template_id`,`level4customcategories_id`,`is_result`,`surveyed_value`) values 
(0,1545137245,1,1,1,1,1,9888.000000000000000000000),
(1,1545137290,1,1,1,1,1,9888.000000000000000000000);

UNLOCK TABLES;

/*Table structure for table `level4resultssummary` */

DROP TABLE IF EXISTS `level4resultssummary`;

CREATE TABLE `level4resultssummary` (
  `id` int(50) NOT NULL,
  `created_at` int(11) NOT NULL,
  `survey_code_id` int(50) NOT NULL,
  `survey_login_id` int(50) DEFAULT NULL,
  `template_id` int(50) DEFAULT NULL,
  `level4customcategories_id` int(50) DEFAULT NULL,
  `is_result` int(1) DEFAULT NULL,
  `surveyed_value_sum` decimal(48,21) DEFAULT NULL,
  `surveyed_value_number` decimal(48,21) DEFAULT NULL,
  `surveyed_value_average` decimal(48,21) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `level4resultssummary` */

LOCK TABLES `level4resultssummary` WRITE;

insert  into `level4resultssummary`(`id`,`created_at`,`survey_code_id`,`survey_login_id`,`template_id`,`level4customcategories_id`,`is_result`,`surveyed_value_sum`,`surveyed_value_number`,`surveyed_value_average`) values 
(0,1545137299,1,1,1,1,1,19776.000000000000000000000,2.000000000000000000000,9888.000000000000000000000);

UNLOCK TABLES;

/*Table structure for table `level4surveypages` */

DROP TABLE IF EXISTS `level4surveypages`;

CREATE TABLE `level4surveypages` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `created_at` int(11) NOT NULL,
  `survey_code_id` int(50) NOT NULL,
  `survey_page_header_user` varchar(255) DEFAULT NULL,
  `survey_page_tagline_user` varchar(255) DEFAULT NULL,
  `survey_page_name_admin` varchar(255) DEFAULT NULL,
  `survey_page_description_admin` varchar(255) DEFAULT NULL,
  `level4customcategories_template_id` int(50) DEFAULT NULL,
  `survey_page_currency` varchar(255) DEFAULT NULL,
  `survey_page_separator` varchar(255) DEFAULT NULL,
  `survey_page_decimals` int(1) DEFAULT NULL,
  `survey_page_unit` varchar(255) DEFAULT NULL,
  `page_display_order_user` int(11) DEFAULT NULL,
  `activated_at` int(11) DEFAULT NULL,
  `deactivated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `level4surveypages` */

LOCK TABLES `level4surveypages` WRITE;

insert  into `level4surveypages`(`id`,`created_at`,`survey_code_id`,`survey_page_header_user`,`survey_page_tagline_user`,`survey_page_name_admin`,`survey_page_description_admin`,`level4customcategories_template_id`,`survey_page_currency`,`survey_page_separator`,`survey_page_decimals`,`survey_page_unit`,`page_display_order_user`,`activated_at`,`deactivated_at`) values 
(1,1545137245,1,'Holiday Expenditure','How much in total do you spend on holidays each year?','HE1000 - Holiday Expenditure - Plain Text Description','This is HE1000 for custid=1, Ent-2020-Annual',1,'$','comma',2,'Artedgs XYZ Wedrs Lifabes',1,1545137245,NULL);

UNLOCK TABLES;

/*Table structure for table `level5customcategories` */

DROP TABLE IF EXISTS `level5customcategories`;

CREATE TABLE `level5customcategories` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `created_at` int(11) DEFAULT NULL,
  `survey_login_id` int(50) DEFAULT NULL,
  `survey_code_id` int(50) DEFAULT NULL,
  `base_template_id` int(50) DEFAULT NULL,
  `parent_id` int(50) DEFAULT NULL,
  `order` int(50) DEFAULT NULL,
  `category_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `flag_id` int(2) NOT NULL COMMENT 'A flag is 1=parent, 2 = other, 0 = rows in between 1 and 2',
  `is_result` int(1) DEFAULT NULL,
  `is_hidden` int(1) DEFAULT NULL,
  `percentage` decimal(48,21) NOT NULL,
  `icon_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `help` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sign` int(1) DEFAULT NULL,
  `value_load` decimal(48,21) NOT NULL,
  `deactivated_at` int(11) DEFAULT NULL,
  `activated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `level5customcategories` */

LOCK TABLES `level5customcategories` WRITE;

insert  into `level5customcategories`(`id`,`created_at`,`survey_login_id`,`survey_code_id`,`base_template_id`,`parent_id`,`order`,`category_code`,`flag_id`,`is_result`,`is_hidden`,`percentage`,`icon_url`,`name`,`help`,`sign`,`value_load`,`deactivated_at`,`activated_at`) values 
(1,NULL,1,1,1,0,0,'HE1000',1,1,NULL,1.000000000000000000000,'holiday','Holiday Expenditure','Holiday Expenditure',1,9888.000000000000000000000,NULL,NULL),
(2,NULL,1,1,1,1,1,'HE1000.100',0,NULL,NULL,0.253044654939107000000,'flights','Flights','Flights',1,2500.080000000000000000000,NULL,NULL),
(3,NULL,1,1,1,1,2,'HE1000.200',0,NULL,NULL,0.282814614343708000000,'hotels','Hotels','Hotels',1,2794.210000000000000000000,NULL,NULL),
(4,NULL,1,1,1,1,3,'HE1000.300',0,NULL,NULL,0.156211096075778000000,'sightseeing','Sightseeing','Sightseeing',1,1543.370000000000000000000,NULL,NULL),
(5,NULL,1,1,1,1,4,'HE1000.400',0,NULL,NULL,0.136671177266576000000,'meals','Meals','Meals',1,1350.310000000000000000000,NULL,NULL),
(6,NULL,1,1,1,1,5,'HE1000.500',0,NULL,NULL,0.014357239512855200000,'gifts','Gifts','Gifts',1,141.850000000000000000000,NULL,NULL),
(7,NULL,1,1,1,1,6,'HE1000.600',0,NULL,NULL,0.082543978349120400000,'transportation','Transportation','Transportation',1,815.530000000000000000000,NULL,NULL),
(8,NULL,1,1,1,1,7,'HE1000.999',2,NULL,NULL,0.074357239512855400000,'entertainment','Other','Entertainment & Other',1,734.650000000000000000000,NULL,NULL),
(9,NULL,1,1,2,0,0,'LT2000',1,1,NULL,1.000000000000000000000,'leisure','Leisure Time','Leisure Time',1,270.000000000000000000000,NULL,NULL),
(10,NULL,1,1,2,9,1,'LT2000.100',0,NULL,NULL,0.065304465493910000000,'reading','Reading','Reading',1,17.630000000000000000000,NULL,NULL),
(11,NULL,1,1,2,9,2,'LT2000.200',0,NULL,NULL,0.342814614343708000000,'watching','TV, YouTube, NetFlix, etc','TV',1,92.560000000000000000000,NULL,NULL),
(12,NULL,1,1,2,9,3,'LT2000.300',0,NULL,NULL,0.056211096075778000000,'nap','Nap','Nap',1,15.180000000000000000000,NULL,NULL),
(13,NULL,1,1,2,9,4,'LT2000.400',0,NULL,NULL,0.236671177266576000000,'media','Social Media','Social Media',1,63.900000000000000000000,NULL,NULL),
(14,NULL,1,1,2,9,5,'LT2000.500',0,NULL,NULL,0.154357239512855000000,'games','Games','Games',1,41.680000000000000000000,NULL,NULL),
(15,NULL,1,1,2,9,6,'LT2000.600',0,NULL,NULL,0.022543978349120400000,'meditation','Meditation & Relaxing','Meditation & Relaxing',1,6.090000000000000000000,NULL,NULL),
(16,NULL,1,1,2,9,7,'LT2000.999',2,NULL,NULL,0.122097428958053000000,'other','Other','Other',1,32.970000000000000000000,NULL,NULL),
(17,NULL,1,1,3,0,1,'FES1000',1,1,NULL,1.000000000000000000000,'RB','RB','ADBTEL',1,35.000000000000000000000,NULL,NULL),
(18,NULL,1,1,3,0,2,'FES1001',1,1,NULL,1.000000000000000000000,'SW','SW','AFDAT',2,3.650000000000000000000,NULL,NULL),
(19,NULL,1,1,3,0,3,'FES1002',1,1,NULL,1.000000000000000000000,'SMB','SMB','ALETMB',2,4.650000000000000000000,NULL,NULL),
(20,NULL,1,1,3,0,4,'FES1003',1,1,NULL,1.000000000000000000000,'RFMB','RFMB','ALERFMB',2,2.650000000000000000000,NULL,NULL),
(21,NULL,1,1,3,0,5,'FES1004',1,1,NULL,1.000000000000000000000,'LWED','LWED','AFDDT',1,3.650000000000000000000,NULL,NULL),
(22,NULL,1,1,3,0,0,'LIY18',3,NULL,NULL,1.000000000000000000000,'EA','EA','EA',2,0.000000000000000000000,NULL,NULL),
(23,NULL,1,1,3,22,1,'LIY18.010',3,1,NULL,0.000000000000000000000,'AL','AL','AL',2,0.000000000000000000000,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `level5feedback` */

DROP TABLE IF EXISTS `level5feedback`;

CREATE TABLE `level5feedback` (
  `id` int(50) NOT NULL,
  `created_at` int(11) NOT NULL,
  `survey_code_id` int(50) NOT NULL,
  `survey_login_id` int(50) DEFAULT NULL,
  `template_id` int(50) DEFAULT NULL,
  `level5customcategories_id` int(50) DEFAULT NULL,
  `feedback` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `level5feedback` */

LOCK TABLES `level5feedback` WRITE;

insert  into `level5feedback`(`id`,`created_at`,`survey_code_id`,`survey_login_id`,`template_id`,`level5customcategories_id`,`feedback`) values 
(0,1545137245,1,1,1,1,'the value is too high for holiday expenditure'),
(1,1545137290,1,1,1,1,'The amount for flights is too much');

UNLOCK TABLES;

/*Table structure for table `level5recommend` */

DROP TABLE IF EXISTS `level5recommend`;

CREATE TABLE `level5recommend` (
  `id` int(50) NOT NULL,
  `created_at` int(11) NOT NULL,
  `survey_code_id` int(50) NOT NULL,
  `survey_login_id` int(50) DEFAULT NULL,
  `template_id` int(50) DEFAULT NULL,
  `level5customcategories_id` int(50) DEFAULT NULL,
  `recommend` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `level5recommend` */

LOCK TABLES `level5recommend` WRITE;

insert  into `level5recommend`(`id`,`created_at`,`survey_code_id`,`survey_login_id`,`template_id`,`level5customcategories_id`,`recommend`) values 
(0,1545137245,1,1,1,1,'Massage'),
(1,1545137290,1,1,1,1,'Walks');

UNLOCK TABLES;

/*Table structure for table `level5results` */

DROP TABLE IF EXISTS `level5results`;

CREATE TABLE `level5results` (
  `id` int(50) NOT NULL,
  `created_at` int(11) NOT NULL,
  `survey_code_id` int(50) NOT NULL,
  `survey_login_id` int(50) DEFAULT NULL,
  `template_id` int(50) DEFAULT NULL,
  `level5customcategories_id` int(50) DEFAULT NULL,
  `is_result` int(1) DEFAULT NULL,
  `surveyed_value` decimal(48,21) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `level5results` */

LOCK TABLES `level5results` WRITE;

insert  into `level5results`(`id`,`created_at`,`survey_code_id`,`survey_login_id`,`template_id`,`level5customcategories_id`,`is_result`,`surveyed_value`) values 
(0,1545137245,1,1,1,1,1,9888.000000000000000000000),
(1,1545137290,1,1,1,1,1,9888.000000000000000000000);

UNLOCK TABLES;

/*Table structure for table `level5resultssummary` */

DROP TABLE IF EXISTS `level5resultssummary`;

CREATE TABLE `level5resultssummary` (
  `id` int(50) NOT NULL,
  `created_at` int(11) NOT NULL,
  `survey_code_id` int(50) NOT NULL,
  `survey_login_id` int(50) DEFAULT NULL,
  `template_id` int(50) DEFAULT NULL,
  `level5customcategories_id` int(50) DEFAULT NULL,
  `is_result` int(1) DEFAULT NULL,
  `surveyed_value_sum` decimal(48,21) DEFAULT NULL,
  `surveyed_value_number` decimal(48,21) DEFAULT NULL,
  `surveyed_value_average` decimal(48,21) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `level5resultssummary` */

LOCK TABLES `level5resultssummary` WRITE;

insert  into `level5resultssummary`(`id`,`created_at`,`survey_code_id`,`survey_login_id`,`template_id`,`level5customcategories_id`,`is_result`,`surveyed_value_sum`,`surveyed_value_number`,`surveyed_value_average`) values 
(0,1545137299,1,1,1,1,1,19776.000000000000000000000,2.000000000000000000000,9888.000000000000000000000);

UNLOCK TABLES;

/*Table structure for table `level5surveypages` */

DROP TABLE IF EXISTS `level5surveypages`;

CREATE TABLE `level5surveypages` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `created_at` int(11) NOT NULL,
  `survey_code_id` int(50) NOT NULL,
  `survey_page_header_user` varchar(255) DEFAULT NULL,
  `survey_page_tagline_user` varchar(255) DEFAULT NULL,
  `survey_page_name_admin` varchar(255) DEFAULT NULL,
  `survey_page_description_admin` varchar(255) DEFAULT NULL,
  `level5customcategories_template_id` int(50) DEFAULT NULL,
  `survey_page_currency` varchar(255) DEFAULT NULL,
  `survey_page_separator` varchar(255) DEFAULT NULL,
  `survey_page_decimals` int(1) DEFAULT NULL,
  `survey_page_unit` varchar(255) DEFAULT NULL,
  `page_display_order_user` int(11) DEFAULT NULL,
  `activated_at` int(11) DEFAULT NULL,
  `deactivated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `level5surveypages` */

LOCK TABLES `level5surveypages` WRITE;

insert  into `level5surveypages`(`id`,`created_at`,`survey_code_id`,`survey_page_header_user`,`survey_page_tagline_user`,`survey_page_name_admin`,`survey_page_description_admin`,`level5customcategories_template_id`,`survey_page_currency`,`survey_page_separator`,`survey_page_decimals`,`survey_page_unit`,`page_display_order_user`,`activated_at`,`deactivated_at`) values 
(1,1545137245,1,'Holiday Expenditure','How much in total do you spend on holidays each year?','HE1000 - Holiday Expenditure - Plain Text Description','This is HE1000 for custid=1, Ent-2020-Annual',1,'$','comma',2,'Artedgs XYZ Wedrs Lifabes',1,1545137245,NULL);

UNLOCK TABLES;

/*Table structure for table `messages` */

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `messages` */

LOCK TABLES `messages` WRITE;

insert  into `messages`(`id`,`name`,`subject`,`email`,`photo`,`phone`,`message`,`read_at`,`created_at`,`updated_at`) values 
(1,'Prajwal Rai','About price','prajwal.iar@gmail.com',NULL,'9807009999','Hello sir i am from kathmandu nepal.','2020-08-14 11:25:46','2020-08-14 11:00:01','2020-08-14 11:25:46'),
(2,'Prajwal Rai','About Price','prajwal.iar@gmail.com',NULL,'9800099000','Hello i am Prajwal Rai','2020-08-18 06:04:15','2020-08-15 10:52:39','2020-08-18 06:04:16'),
(3,'Prajwal Rai','lorem ipsum','prajwal.iar@gmail.com',NULL,'1200990009','hello sir sdfdfd dfdjf ;dfjd fd ldkfd',NULL,'2020-08-18 00:15:12','2020-08-18 00:15:12'),
(4,'Henrytairl','Making money in the net is easier now. Link - http://365sekretov.ru/redirect.php?action=url&goto=profit-strategy.life%2F%3Fu%3Dbdlkd0x%26o%3Dx7t8nng','johan@pure-communication.be',NULL,'89036821585','The best online investment tool is found. Learn more! \r\nLink - http://365sekretov.ru/redirect.php?action=url&goto=profit-strategy.life%2F%3Fu%3Dbdlkd0x%26o%3Dx7t8nng',NULL,'2020-12-19 01:30:23','2020-12-19 01:30:23');

UNLOCK TABLES;

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `migrations` */

LOCK TABLES `migrations` WRITE;

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2020_07_10_021010_create_brands_table',1),
(5,'2020_07_10_025334_create_banners_table',1),
(6,'2020_07_10_112147_create_categories_table',1),
(7,'2020_07_11_063857_create_products_table',1),
(8,'2020_07_12_073132_create_post_categories_table',1),
(9,'2020_07_12_073701_create_post_tags_table',1),
(10,'2020_07_12_083638_create_posts_table',1),
(11,'2020_07_13_151329_create_messages_table',1),
(12,'2020_07_14_023748_create_shippings_table',1),
(13,'2020_07_15_054356_create_orders_table',1),
(14,'2020_07_15_102626_create_carts_table',1),
(15,'2020_07_16_041623_create_notifications_table',1),
(16,'2020_07_16_053240_create_coupons_table',1),
(17,'2020_07_23_143757_create_wishlists_table',1),
(18,'2020_07_24_074930_create_product_reviews_table',1),
(19,'2020_07_24_131727_create_post_comments_table',1),
(20,'2020_08_01_143408_create_settings_table',1);

UNLOCK TABLES;

/*Table structure for table `notifications` */

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `notifications` */

LOCK TABLES `notifications` WRITE;

insert  into `notifications`(`id`,`type`,`notifiable_type`,`notifiable_id`,`data`,`read_at`,`created_at`,`updated_at`) values 
('1007401d-040e-407f-807b-0316c1788ebf','App\\Notifications\\StatusNotification','App\\User',36,'{\"title\":\"New Product Rating!\",\"actionURL\":\"https:\\/\\/videojuegostotal.com\\/productos\\/no-straight-roads\",\"fas\":\"fa-star\"}',NULL,'2021-02-03 10:25:18','2021-02-03 10:25:18'),
('2145a8e3-687d-444a-8873-b3b2fb77a342','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}',NULL,'2020-08-15 10:31:21','2020-08-15 10:31:21'),
('329a4014-473b-454a-acfb-e072382ed3e5','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/xbox-360-slim\",\"fas\":\"fa-star\"}',NULL,'2020-09-17 12:54:50','2020-09-17 12:54:50'),
('3af39f84-cab4-4152-9202-d448435c67de','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/4\",\"fas\":\"fa-file-alt\"}',NULL,'2020-08-15 10:54:52','2020-08-15 10:54:52'),
('498e5cf9-009e-4b8c-a5a6-a66c0cf8b116','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/blog-detail\\/david-post\",\"fas\":\"fas fa-comment\"}',NULL,'2020-09-17 12:24:26','2020-09-17 12:24:26'),
('4a0afdb0-71ad-4ce6-bc70-c92ef491a525','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s\",\"fas\":\"fas fa-comment\"}',NULL,'2020-08-18 00:13:51','2020-08-18 00:13:51'),
('4c93a5c5-952d-4b64-bd34-24ef84e0249a','App\\Notifications\\StatusNotification','App\\User',36,'{\"title\":\"New Product Rating!\",\"actionURL\":\"https:\\/\\/videojuegostotal.com\\/productos\\/titanfall-2\",\"fas\":\"fa-star\"}',NULL,'2021-02-03 10:15:41','2021-02-03 10:15:41'),
('540ca3e9-0ff9-4e2e-9db3-6b5abc823422','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}','2020-08-15 10:30:44','2020-08-14 10:12:28','2020-08-15 10:30:44'),
('5da09dd1-3ffc-43b0-aba2-a4260ba4cc76','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage\",\"fas\":\"fas fa-comment\"}',NULL,'2020-08-15 10:51:02','2020-08-15 10:51:02'),
('5e91e603-024e-45c5-b22f-36931fef0d90','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/white-sports-casual-t\",\"fas\":\"fa-star\"}',NULL,'2020-08-15 10:44:07','2020-08-15 10:44:07'),
('73a3b51a-416a-4e7d-8ca2-53b216d9ad8e','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}',NULL,'2020-08-14 10:11:03','2020-08-14 10:11:03'),
('8605db5d-1462-496e-8b5f-8b923d88912c','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/1\",\"fas\":\"fa-file-alt\"}',NULL,'2020-08-14 10:20:44','2020-08-14 10:20:44'),
('92eb6d0e-5a27-4e4f-9525-c10c0af00385','App\\Notifications\\StatusNotification','App\\User',36,'{\"title\":\"New Product Rating!\",\"actionURL\":\"https:\\/\\/videojuegostotal.com\\/productos\\/no-straight-roads\",\"fas\":\"fa-star\"}',NULL,'2021-02-03 10:25:08','2021-02-03 10:25:08'),
('9dc64c84-d784-47f8-abe3-5c964c0157e1','App\\Notifications\\StatusNotification','App\\User',36,'{\"title\":\"New Product Rating!\",\"actionURL\":\"https:\\/\\/videojuegostotal.com\\/productos\\/the-seven-deadly-sins-knights-of-britannia\",\"fas\":\"fa-star\"}',NULL,'2021-02-03 10:46:42','2021-02-03 10:46:42'),
('a6ec5643-748c-4128-92e2-9a9f293f53b5','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/5\",\"fas\":\"fa-file-alt\"}',NULL,'2020-08-18 00:17:03','2020-08-18 00:17:03'),
('b186a883-42f2-4a05-8fc5-f0d3e10309ff','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/2\",\"fas\":\"fa-file-alt\"}','2020-08-15 07:17:24','2020-08-15 01:14:55','2020-08-15 07:17:24'),
('b599f987-1284-42f8-a28d-ee70531a1143','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage\",\"fas\":\"fas fa-comment\"}',NULL,'2020-09-17 12:28:06','2020-09-17 12:28:06'),
('bf531b6b-b5ac-4292-81a0-f9f9733a48ea','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/ps3-slim\",\"fas\":\"fa-star\"}',NULL,'2020-09-17 13:09:50','2020-09-17 13:09:50'),
('cb7c002a-6bec-4a51-8c9e-f6733f94bb03','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/xbox-360-slim\",\"fas\":\"fa-star\"}',NULL,'2020-09-17 12:54:00','2020-09-17 12:54:00'),
('d17874de-3839-404f-b23b-f97ce9b0f383','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/melange-casual-black\",\"fas\":\"fa-star\"}',NULL,'2020-09-17 10:34:59','2020-09-17 10:34:59'),
('d2fd7c33-b0fe-47d6-8bc6-f377d404080d','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}',NULL,'2020-08-14 10:08:50','2020-08-14 10:08:50'),
('dff78b90-85c8-42ee-a5b1-de8ad0b21be4','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/3\",\"fas\":\"fa-file-alt\"}',NULL,'2020-08-15 09:40:54','2020-08-15 09:40:54'),
('e28b0a73-4819-4016-b915-0e525d4148f5','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/lorem-ipsum-is-simply\",\"fas\":\"fa-star\"}',NULL,'2020-08-18 00:08:16','2020-08-18 00:08:16'),
('effa7079-2cd9-484f-8355-f1d9ef181261','App\\Notifications\\StatusNotification','App\\User',36,'{\"title\":\"New Product Rating!\",\"actionURL\":\"https:\\/\\/videojuegostotal.com\\/productos\\/hunting-simulator\",\"fas\":\"fa-star\"}',NULL,'2021-02-03 10:49:05','2021-02-03 10:49:05'),
('ffffa177-c54e-4dfe-ba43-27c466ff1f4b','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s\",\"fas\":\"fas fa-comment\"}',NULL,'2020-08-18 00:13:29','2020-08-18 00:13:29');

UNLOCK TABLES;

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `sub_total` double(8,2) NOT NULL,
  `shipping_id` bigint(20) unsigned DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','paypal') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_order_number_unique` (`order_number`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_shipping_id_foreign` (`shipping_id`),
  CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

LOCK TABLES `orders` WRITE;

insert  into `orders`(`id`,`order_number`,`user_id`,`sub_total`,`shipping_id`,`coupon`,`total_amount`,`quantity`,`payment_method`,`payment_status`,`status`,`first_name`,`last_name`,`email`,`phone`,`country`,`post_code`,`address1`,`address2`,`created_at`,`updated_at`) values 
(1,'ORD-PMIQF5MYPK',NULL,14399.00,1,573.90,13925.10,6,'cod','unpaid','delivered','Prajwal','Rai','prajwal.iar@gmail.com','9800887778','NP','44600','Koteshwor','Kathmandu','2020-08-14 10:20:44','2020-08-14 12:37:37'),
(2,'ORD-YFF8BF0YBK',NULL,1939.03,1,NULL,2039.03,1,'cod','unpaid','delivered','Sandhya','Rai','user@gmail.com','90000000990','NP',NULL,'Lalitpur',NULL,'2020-08-15 01:14:49','2020-08-15 01:15:19'),
(3,'ORD-1CKWRWTTIK',NULL,200.00,1,NULL,300.00,1,'paypal','paid','process','Prajwal','Rai','prajwal.iar@gmail.com','9807009999','NP','44600','Kathmandu','Kadaghari','2020-08-15 09:40:49','2020-08-17 23:52:40'),
(4,'ORD-HVO0KX0YHW',NULL,23660.00,3,150.00,23910.00,6,'paypal','paid','new','Prajwal','Rai','prajwal.iar@gmail.com','9800098878','NP','44600','Pokhara',NULL,'2020-08-15 10:54:52','2020-08-15 10:54:52');

UNLOCK TABLES;

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `password_resets` */

LOCK TABLES `password_resets` WRITE;

insert  into `password_resets`(`email`,`token`,`created_at`) values 
('tamalestolimensesdeliciosos@gmail.com','$2y$10$NxehgggNHbHVNfUsWOyuA.OgR1KrMOttfE/4ch61AMetWIIxxFH6S','2021-01-23 02:08:57');

UNLOCK TABLES;

/*Table structure for table `period` */

DROP TABLE IF EXISTS `period`;

CREATE TABLE `period` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `key` varchar(3) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`,`key`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `period` */

LOCK TABLES `period` WRITE;

insert  into `period`(`id`,`name`,`key`,`type`) values 
(1,'Annual','a',1),
(2,'Half Year 1','h1',2),
(3,'Half Year 2','h2',2),
(4,'Quarter 1','q1',3),
(5,'Quarter 2','q2',3),
(6,'Quarter 3','q3',3),
(7,'Quarter 4','q4',3),
(8,'Month 1','m1',4),
(9,'Month 2','m2',4),
(10,'Month 3','m3',4),
(11,'Month 4','m4',4),
(12,'Month 5','m5',4),
(13,'Month 6','m6',4),
(14,'Month 7','m7',4),
(15,'Month 8','m8',4),
(16,'Month 9','m9',4),
(17,'Month 10','m10',4),
(18,'Month 11','m11',4),
(19,'Month 12','m12',4);

UNLOCK TABLES;

/*Table structure for table `post_categories` */

DROP TABLE IF EXISTS `post_categories`;

CREATE TABLE `post_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `post_categories` */

LOCK TABLES `post_categories` WRITE;

insert  into `post_categories`(`id`,`title`,`slug`,`status`,`created_at`,`updated_at`) values 
(5,'Champú','post-category','active','2020-08-15 09:59:04','2021-02-15 05:13:01'),
(6,'Cuidado del cabello','cuidado-del-cabello','active','2021-02-15 05:12:34','2021-02-15 05:12:34');

UNLOCK TABLES;

/*Table structure for table `post_comments` */

DROP TABLE IF EXISTS `post_comments`;

CREATE TABLE `post_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `post_id` bigint(20) unsigned DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `replied_comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_comments_user_id_foreign` (`user_id`),
  KEY `post_comments_post_id_foreign` (`post_id`),
  CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `post_comments` */

LOCK TABLES `post_comments` WRITE;

insert  into `post_comments`(`id`,`user_id`,`post_id`,`comment`,`status`,`replied_comment`,`parent_id`,`created_at`,`updated_at`) values 
(1,NULL,NULL,'Testing comment edited','active',NULL,NULL,'2020-08-14 10:08:42','2020-08-15 09:59:58'),
(2,NULL,NULL,'testing 2','active',NULL,1,'2020-08-14 10:11:03','2020-08-14 10:11:03'),
(3,NULL,NULL,'That\'s cool','active',NULL,2,'2020-08-14 10:12:27','2020-08-14 10:12:27'),
(4,NULL,NULL,'nice','active',NULL,NULL,'2020-08-15 10:31:19','2020-08-15 10:31:19'),
(5,NULL,NULL,'nice blog','active',NULL,NULL,'2020-08-15 10:51:01','2020-08-15 10:51:01'),
(6,NULL,NULL,'nice','active',NULL,NULL,'2020-08-18 00:13:29','2020-08-18 00:13:29'),
(7,NULL,NULL,'really','active',NULL,6,'2020-08-18 00:13:51','2020-08-18 00:13:51'),
(8,NULL,NULL,'me encanta este producto deivid','active',NULL,NULL,'2020-09-17 12:24:26','2020-09-17 12:50:39'),
(9,NULL,NULL,'ok','active',NULL,NULL,'2020-09-17 12:28:06','2020-09-17 12:28:06');

UNLOCK TABLES;

/*Table structure for table `post_tags` */

DROP TABLE IF EXISTS `post_tags`;

CREATE TABLE `post_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_tags_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `post_tags` */

LOCK TABLES `post_tags` WRITE;

insert  into `post_tags`(`id`,`title`,`slug`,`status`,`created_at`,`updated_at`) values 
(1,'Enjoy','enjoy','active','2020-08-14 04:53:52','2020-08-14 04:53:52'),
(2,'2020','2020','active','2020-08-14 04:54:09','2020-08-14 04:54:09'),
(3,'Visit nepal 2020','visit-nepal-2020','active','2020-08-14 04:54:33','2020-08-14 04:54:33'),
(4,'Tag','tag','active','2020-08-15 09:59:31','2020-08-15 09:59:31');

UNLOCK TABLES;

/*Table structure for table `posts` */

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quote` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_cat_id` bigint(20) unsigned DEFAULT NULL,
  `post_tag_id` bigint(20) unsigned DEFAULT NULL,
  `added_by` bigint(20) unsigned DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`),
  KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  KEY `posts_added_by_foreign` (`added_by`),
  CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `posts` */

LOCK TABLES `posts` WRITE;

insert  into `posts`(`id`,`title`,`slug`,`summary`,`description`,`quote`,`photo`,`tags`,`post_cat_id`,`post_tag_id`,`added_by`,`status`,`created_at`,`updated_at`) values 
(10,'Post Videojuegos 1','post-videojuegos-1','<p>Post Videojuegos 1<br></p>','<p>Post Videojuegos 1<br></p>','<p>Post Videojuegos 1<br></p>','/storage/photos/1/Blog/blog1.jpg','',5,NULL,NULL,'active','2021-01-26 13:27:10','2021-01-26 13:27:10'),
(11,'Post Videojuegos 2','post-videojuegos-2','<p>Post Videojuegos 2<br></p>','<p>Post Videojuegos 2<br></p>','<p>Post Videojuegos 2<br></p>','/storage/photos/1/Blog/blog2.jpg','',5,NULL,NULL,'active','2021-01-26 13:28:08','2021-01-26 13:28:08'),
(12,'Post Videojuegos 3','post-videojuegos-3','<p>Post Videojuegos 3<br></p>','<p>Post Videojuegos 3<br></p>','<p>Post Videojuegos 3<br></p>','/storage/photos/1/Blog/blog3.jpg','',5,NULL,NULL,'active','2021-01-26 13:28:50','2021-01-26 13:28:50');

UNLOCK TABLES;

/*Table structure for table `product_reviews` */

DROP TABLE IF EXISTS `product_reviews`;

CREATE TABLE `product_reviews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT 0,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_reviews_user_id_foreign` (`user_id`),
  KEY `product_reviews_product_id_foreign` (`product_id`),
  CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `product_reviews` */

LOCK TABLES `product_reviews` WRITE;

insert  into `product_reviews`(`id`,`user_id`,`product_id`,`rate`,`review`,`status`,`created_at`,`updated_at`) values 
(1,NULL,NULL,5,'nice product','active','2020-08-15 10:44:05','2020-08-15 10:44:05'),
(2,NULL,NULL,5,'nice','active','2020-08-18 00:08:14','2020-08-18 00:18:31'),
(3,NULL,NULL,5,'goolge product prueba david','active','2020-09-17 10:34:59','2020-09-17 10:34:59'),
(4,NULL,NULL,5,NULL,'active','2020-09-17 12:54:00','2020-09-17 12:54:00'),
(5,NULL,NULL,5,'me encanta hernandez','active','2020-09-17 12:54:50','2020-09-17 12:54:50'),
(6,NULL,NULL,5,'que bacano es el ps3 slim papi','active','2020-09-17 13:09:50','2020-09-17 13:09:50'),
(7,NULL,NULL,5,NULL,'active','2021-02-03 10:15:41','2021-02-03 10:15:41'),
(8,NULL,NULL,5,NULL,'active','2021-02-03 10:25:08','2021-02-03 10:25:08'),
(9,NULL,NULL,5,NULL,'active','2021-02-03 10:25:18','2021-02-03 10:25:18'),
(10,NULL,NULL,5,NULL,'active','2021-02-03 10:46:42','2021-02-03 10:46:42'),
(11,37,NULL,5,NULL,'active','2021-02-03 10:49:05','2021-02-03 10:49:05');

UNLOCK TABLES;

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 1,
  `size` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'M',
  `condition` enum('default','new','hot') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) unsigned DEFAULT NULL,
  `child_cat_id` bigint(20) unsigned DEFAULT NULL,
  `brand_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  KEY `products_brand_id_foreign` (`brand_id`),
  KEY `products_cat_id_foreign` (`cat_id`),
  KEY `products_child_cat_id_foreign` (`child_cat_id`),
  CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=598 DEFAULT CHARSET=utf8;

/*Data for the table `products` */

LOCK TABLES `products` WRITE;

insert  into `products`(`id`,`title`,`slug`,`summary`,`description`,`photo`,`stock`,`size`,`condition`,`status`,`price`,`discount`,`is_featured`,`cat_id`,`child_cat_id`,`brand_id`,`created_at`,`updated_at`) values 
(566,'Ultra Hydrasource champú','ultra-hydrasource-champu','<p>Con silicona y parabenos, que&nbsp; hidratan profundamente el cabello evitando roturas, para cabello muy seco<br></p>','<ul><li><li>Marca: BIOLAGE</li><li>Forma del artículo: Líquido</li><li>Género objetivo: Femenino</li><li>Rango de edad: Adulto</li><li>Tipo de cabello: Seco</li><li>El champú BIOLAGE Ultra Hydrasource ayuda a optimizar el equilibrio de humedad para un cabello de aspecto saludable. </li><li>Este champú limpia el cabello dejándolo extremadamente hidratado, suave y brillante.<br></li></li></ul>','/storage/photos/31/productos 5/hydrasource_01.jpg',10,'','new','active',0.00,0.00,1,24,27,9,'2021-02-16 21:43:21','2021-02-16 21:55:16'),
(567,'Corbatas de silicona para el cabello','corbatas-de-silicona-para-el-cabello','<p class=\"MsoNormal\"><span lang=\"ES-MX\">horquilla\r\nde donut, banda de goma elástica multifunción para mujeres y niñas (negro,\r\nmarrón)<o:p></o:p></span></p>','<ul><li>Color<span style=\"white-space:pre\">	</span>Negro, marrón</li><li>Marca<span style=\"white-space:pre\">	</span>Dazzfond</li><li>Material<span style=\"white-space:pre\">	</span>Silicona</li><li>Número de piezas<span style=\"white-space:pre\">	</span>2</li><li><li>Tamaño: diámetro: 2.6 in, altura: 0.8 in. liso, se siente ligero y seguro sin tirones en el cabello. No daña el cabello.</li><li>Anillo de pelo para mujer: fácil y cómodo de poner y quitar, simplemente gira, también un gran regalo.</li><li>Material suave: hecho de material de silicona de alta calidad, resistente al desgaste y duradero, tiene una larga vida útil.</li><li>Amplia aplicación: estos anillos de silicona para el pelo son adecuados para muchas ocasiones, fiestas informales, viajes en la oficina, etc, en cualquier lugar que desees.</li></li></ul>','/storage/photos/31/productos 5/2 paquetes de corbata silicona de cabello-1.jpg',10,'','new','active',0.00,0.00,1,25,NULL,NULL,'2021-02-16 21:50:20','2021-02-16 21:50:20'),
(568,'Diademas de diamantes','diademas-de-diamantes','<p class=\"MsoNormal\"><span lang=\"ES-MX\">diademas adornadas\r\ncon diamantes de cristal para el pelo. (lindos colores)<o:p></o:p></span></p>','<ul><li><li>Cantidad: 2 unidades</li><li>Brillantes diamantes de imitación: usa nuestras diademas acolchadas de terciopelo, el diamante refracta diferentes colores.&nbsp;</li><li>Diadema de terciopelo: hermosa diadema clásica de terciopelo que mide aproximadamente 5.8 x 5.6 (largo x ancho), y aprox. 1.5 de grosor, la diadema es retráctil, adecuada para la mayoría de las mujeres y niñas; envuelta en anillos elásticos, terciopelo suave, cómoda de llevar, no daña el cabello y no se desliza fácilmente.</li><li>Exquisita banda para el pelo: se puede llevar directamente en tu cabello recién alisado, te hace lucir simple pero elegante.</li><li>Uso en una variedad de ocasiones: nuestras diademas multicolor para mujer se aplican ampliamente en diferentes ocasiones, como fiestas, ceremonias, cumpleaños, banquetes y festivales, te mantienen hermosa, también es agradable para el uso diario para el trabajo, la escuela, vacaciones, compras, deportes, etc.</li></li></ul>','/storage/photos/31/productos 5/2 piezas de diadema de diamantes de imitacion-1.jpg,/storage/photos/31/productos 5/2 piezas de diadema de diamantes de imitacion-2.jpg,/storage/photos/31/productos 5/2 piezas de diadema de diamantes de imitacion-3.jpg,/storage/photos/31/productos 5/2 piezas de diadema de diamantes de imitacion-4.jpg,/storage/photos/31/productos 5/2 piezas de diadema de diamantes de imitacion-5.jpg,/storage/photos/31/productos 5/2 piezas de diadema de diamantes de imitacion-6.jpg',10,'','new','active',0.00,0.00,1,25,NULL,53,'2021-02-16 22:22:43','2021-02-16 22:31:50'),
(569,'Tinte semipermanente para cabello','tinte-semipermanente-para-cabello','<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt 18pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span lang=\"ES-MX\">Adore - Tinte semipermanente para\r\ncabello, 4 onzas líquidas (118 ml)<o:p></o:p></span></p>','<ul><li><li>Color: Variedad</li><li>Marca: Adore</li><li>Especiales: Natural</li><li><li>1 pieza: 4 onzas (118 ml).</li><li>Da al cabello una sensación hermosa y sensual.</li><li>No contiene alcohol, peróxido ni amoniaco.</li><li>Color de cabello semipermanente.</li></li></li></ul>','/storage/photos/31/productos 4/semi-permanente_3.jpg,/storage/photos/31/productos 4/semi-permanente_11.jpg,/storage/photos/31/productos 4/semi-permanente_10.jpg,/storage/photos/31/productos 4/semi-permanente_12.jpg,/storage/photos/31/productos 4/semi-permanente_5.jpg,/storage/photos/31/productos 4/semi-permanente_6.jpg,/storage/photos/31/productos 4/semi-permanente_7.jpg,/storage/photos/31/productos 4/semi-permanente_9.jpg',10,'','new','active',0.00,0.00,1,24,29,51,'2021-02-16 22:39:02','2021-02-16 22:51:02'),
(570,'Natural Balance Champú','natural-balance-champu','<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt 18pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span lang=\"ES-MX\">AG Hair Natural Balance Champú con Vinagre\r\nde sidra de manzana.<o:p></o:p></span></p>','<div><br></div><ul><li>Marca: AG Hair</li><li>Forma del artículo: Liquido</li><li>Género objetivo<span style=\"white-space:pre\">	</span>Unisex</li><li>Rango de edad: Adultos</li><li>Tipo de cabello: Normal</li><li>Fragancias naturales y aromaterapia.</li><li>sin sulfatos, Natural Balance de AG limpia suavemente el cabello y el cuero cabelludo.<br></li></ul>','/storage/photos/31/productos 3/champu-vinagre-de-sidra_1.jpg,/storage/photos/31/productos 3/champu-vinagre-de-sidra-2.jpg,/storage/photos/31/productos 3/champu-vinagre-de-sidra-3.jpg',10,'','new','active',0.00,0.00,1,24,27,10,'2021-02-16 23:00:20','2021-02-16 23:06:11'),
(571,'Acondicionador de argán y coco','acondicionador-de-argan-y-coco','<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt 18pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span lang=\"ES-MX\">Acondicionador de argán y coco AG\r\nHair&nbsp;<o:p></o:p></span><span style=\"font-size: 1rem;\">33.8 Onzas de líquido</span></p>','<div><br></div><ul><li>Marca: Cabello AG</li><li>Fragancia: Coco</li><li>Tipo de cabello: Cabello Rizado</li><li>Volumen líquido: 33.8 Onzas de líquido</li><li>transforma el cabello áspero en suave.</li><li>Hidrata cada mechón, cubriendo el cabello y dejándolo brillante y agradable al tacto.<br></li></ul>','/storage/photos/31/productos 4/argan-coconut_1.jpg,/storage/photos/31/productos 4/argan-coconut-2.jpg',10,'','new','active',0.00,0.00,1,24,32,10,'2021-02-16 23:14:48','2021-02-16 23:20:13'),
(572,'Cepillo plegable con espejo','cepillo-plegable-con-espejo','<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt 18pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span lang=\"ES-MX\">Cepillo plegable con\r\nespejo, tamaño compacto de bolsillo, para viaje, bolsa de gimnasio, etc.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt 18pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span lang=\"ES-MX\">&nbsp;</span></p>','<ul><li><li>Cepillo plegable con espejo, tamaño compacto de bolsillo 8.0&nbsp; cuando está abierto, 4.0&nbsp; cuando está plegado, 2.5 in espejo dentro del mango.</li><li>El cepillo de pelo de tamaño completo ahorra espacio se pliega hasta tamaño mini, ideal para bolso, maletín o bolsillo.</li><li>Ideal para viajes, escuela, piscina, cajón de escritorio, guantera de coche o bolso.</li><li>7 filas de cerdas de nailon flexible con puntas de bola de masaje para control de peinado.</li><li>Viene en 4 colores metálicos de azul, rosa, verde y dorado.</li></li></ul>','/storage/photos/31/productos 3/cepillo-plegable_1.jpg,/storage/photos/31/productos 3/cepillo-plegable-2.jpg,/storage/photos/31/productos 3/cepillo-plegable-3.jpg,/storage/photos/31/productos 3/cepillo-plegable-5.jpg,/storage/photos/31/productos 3/cepillo-plegable-6.jpg,/storage/photos/31/productos 3/cepillo-plegable-7.jpg',10,'','new','active',0.00,0.00,1,25,NULL,54,'2021-02-16 23:27:43','2021-02-16 23:59:22'),
(573,'Alfombrilla resistente al calor de silicona','alfombrilla-resistente-al-calor-de-silicona','<p>Alfombrilla resistente al calor ideal para rizadores, alisadores de pelo, planchas planas, de 9 x 6.5 pulgadas en silicona gris.<br></p>','<ul><li><li>Color<span style=\"white-space:pre\">	</span>Alfombra gris.</li><li>Marca<span style=\"white-space:pre\">	</span>Lessmon</li><li>Material<span style=\"white-space:pre\">	</span>Silicona</li><li><li>Envoltura y soporte: la alfombrilla de silicona Lessmon puede envolver la parte caliente de la plancha rizadora o simplemente poner las herramientas calentadas en la alfombrilla para evitar accidentes.</li><li>Respetuoso con el medio ambiente – Material de silicona seguro que hace que sea más duradero.</li><li>Resistente al calor: hasta 450 F, lo que significa que la alfombrilla estará bien cuando tus planchas estén trabajando desde tu cabello.</li><li>Protección profesional: perfecto para rizadores, planchas planas, secadores y otras herramientas calientes.</li><li>Simple y multi elección: diseño simple y elección multicolor hacen que sea posible decorar tu escritorio de maquillaje.</li></li></li></ul>','/storage/photos/31/productos 4/alfombrilla-silicona_1.jpg,/storage/photos/31/productos 4/alfombrilla-silicona-2.jpg,/storage/photos/31/productos 4/,/storage/photos/31/productos 4/alfombrilla-silicona-5.jpg,/storage/photos/31/productos 4/alfombrilla-silicona-6.jpg,/storage/photos/31/productos 4/alfombrilla-silicona-7.jpg,/storage/photos/31/productos 4/alfombrilla-silicona-8.jpg',10,'','new','active',0.00,0.00,1,25,NULL,11,'2021-02-16 23:38:38','2021-02-16 23:57:00'),
(574,'Champú diario','champu-diario','<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt 18pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span lang=\"ES-MX\">champú diario, para hombres, 33.8 fl\r\noz<o:p></o:p></span></p>','<ul><li><li><span style=\"font-size: 1rem;\">Marca:&nbsp;</span><span style=\"font-size: 1rem;\">AMERICAN CREW.</span><br></li><li>Forma del artículo: Líquido.</li><li>Género objetivo: Masculino.</li><li>Rango de edad: Adulto.</li><li>Tipo de cabello: Graso.</li><li>Con agentes limpiadores de origen natural, ayuda a eliminar el exceso de grasa del cabello.<br></li></li></ul>','/storage/photos/31/productos 4/american_crew_1.jpg,/storage/photos/31/productos 4/american_crew_2.jpg,/storage/photos/31/productos 4/american_crew_3.jpg',10,'','new','active',0.00,0.00,1,24,27,12,'2021-02-16 23:52:06','2021-02-16 23:52:06'),
(575,'AquaGuard','aquaguard','<p>Pre-Natación Defensa del Cabello (16.9 oz)<br></p>','<div><br></div><ul><li>Marca: Underwater Audio.</li><li>Fragancia: Cherry Almond.</li><li>Tipo de cabello: Todos.</li><li>Volumen líquido: 16.9 Onzas de líquido.</li><li>Detiene el daño del cloro antes de que comience.</li><li>Evita la coloración verde en el pelo, protege el color natural.</li><li>Suaviza y protege.</li><li>Mantiene la salud del cabello.</li><li>Cómo utilizar: utilizar AquaGuard es fácil. Simplemente humedece tu cabello antes de nadar y aplica una generosa cantidad de defensa del cabello antes de nadar, prestando especial atención a las puntas. Dejar de 3 a 5 minutos para que el producto se absorba completamente en el cabello.</li></ul>','/storage/photos/31/productos 1/pre-natacion-1.jpg,/storage/photos/31/productos 1/pre-natacion-2.jpg,/storage/photos/31/productos 1/pre-natacion-3.jpg',10,'','new','active',0.00,0.00,1,24,30,55,'2021-02-17 00:12:11','2021-02-17 00:12:11'),
(576,'Mascarilla restauradora','mascarilla-restauradora','<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt 18pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span lang=\"ES-MX\">Mascarilla restauradora para cabello seco y dañado, orgánico enriquecido con Aceite de Argán y manteca de\r\nkarité (16,9&nbsp;Fluido onza)<o:p></o:p></span></p>','<ul><li><li>Marca: Arganicare.</li><li>Volumen líquido: 16.9 Onzas de líquido.</li><li>Género objetivo: Unisex.</li><li>Dimensiones del artículo L/W/H: 3.25 x 3.25 x 3.25 pulgadas.</li><li><li>Exclusiva fórmula con aceite de argán y manteca de karité.</li><li>Con vitaminas esenciales y aceite de almendra que hidrata el cabello, proporcionan suavidad y brillo.</li><li>Contiene proteínas de seda y hace que su pelo sedoso y suave.</li><li>Su cabello adquirirá un brillo hermoso, será fácil de peinar y suave al tacto.</li><li>Para cabello seco y dañado.</li></li></li></ul>','/storage/photos/31/productos 4/arganicare-restoring-1.jpg',10,'','new','active',0.00,0.00,1,24,30,13,'2021-02-17 00:24:27','2021-02-17 00:24:27'),
(577,'Total Miracle','total-miracle','<p>Champú, Acondicionador y tratamiento profundo para el cabello, con una infusión de albaricoque y aceite de macadamia australiana, sin parabenos.<br></p>','<ul><li><li>Marca:Aussie</li><li>Fragancia: Floral</li><li>Tipo de cabello: Damaged</li><li>Volumen líquido: 8 Onzas de líquido</li><li>Dimensiones del artículo L/W/H: 7.25 x 4.25 x 9.31 pulgadas</li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"color: rgb(15, 17, 17);\">Recibirás una botella de champú de 262 onzas líquidas, una botella de acondicionador de 262 onzas líquidas y una botella de tratamiento de 8 onzas líquidas.</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"color: rgb(15, 17, 17);\">Perfecto para el cabello dañado.</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"color: rgb(15, 17, 17);\">Con albaricoque y aceite de macadamia australiana.</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"color: rgb(15, 17, 17);\">Libre de parabenos.</span></li></li></ul>','/storage/photos/31/productos 1/total-miracle-1.jpg,/storage/photos/31/productos 1/total-miracle-2.jpg,/storage/photos/31/productos 1/total-miracle-5.jpg',10,'','new','active',0.00,0.00,1,24,33,14,'2021-02-17 00:48:44','2021-02-17 00:48:44'),
(578,'Limón clarificarte champú','limon-clarificarte-champu','<div>Champu&nbsp;Limón clarificarte de avalon organics,&nbsp;Fabricado con estimulante árbol del té, menta, eucalipto y romero para dejar el cuero cabelludo y el pelo limpios y sanos.</div>','<ul><li><li><li><span style=\"font-size: 1rem;\">Marca:&nbsp;</span><span style=\"font-size: 1rem;\">Avalon Organics</span><br></li><li>Forma del artículo: Líquido</li><li>Género objetivo: Femenino</li><li>Fragancia: Limón</li></li><li>Paquete de 3, 14 onzas cada uno (42 onzas en total).</li><li>Sin colorantes artificiales, aromas sintéticos ni parabenos.</li></li></ul>','/storage/photos/31/productos 4/avalon-organics-1.jpg,/storage/photos/31/productos 4/avalon-organics-2.jpg,/storage/photos/31/productos 4/avalon-organics-3.jpg',10,'','new','active',0.00,0.00,1,24,27,17,'2021-02-17 01:04:26','2021-02-17 01:04:26'),
(579,'Set de cuidado diario hidratante para bebé','set-de-cuidado-diario-hidratante-para-bebe','<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt 18pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span lang=\"ES-MX\">Aveeno Baby - Set de cuidado diario\r\nhidratante con extracto de avena coloidal natural, 2\r\nartículos<o:p></o:p></span></p>','<ul><li><li>Aveeno Baby Set que contiene Wash &amp; Champú y loción hidratante, para la nutrición diaria de la piel y el cabello de tu bebé.</li><li>Práctico juego de productos de baño para bebé y cuidado de la piel, están especialmente diseñados para la delicada piel y el cabello del bebé.</li><li>El jabón y el champú para bebés contiene extracto de avena natural para limpiar suavemente. La fórmula es sin parabenos. Se puede utilizar en la piel y el cabello y se enjuaga</li><li>Con una fragancia suave y fresca.</li><li>La loción diaria contiene avena coloidal natural mezclada con emolientes naturales para calmar la delicada piel de tu bebé. La fórmula no grasa se absorbe rápidamente. Es hipoalergénico y sin fragancia.</li><li>Ambos productos para el cuidado de la piel del bebé son de la marca # 1 de confianza para pediatras para el uso de ingredientes naturales y una marca recomendada por pediatras durante más de 60 años.</li></li></ul>','/storage/photos/31/productos 4/aveno-baby-1.jpg,/storage/photos/31/productos 4/aveno-baby-3.jpg,/storage/photos/31/productos 4/aveno-baby-4.jpg',10,'','new','active',0.00,0.00,1,24,27,18,'2021-02-17 01:34:15','2021-02-17 01:34:15'),
(580,'Keratindose','keratindose','<p>Biolage Advanced Keratindose Pro-Keratinina Renovación Spray. Restaura el brillo y la manejabilidad del cabello, Sin parabenos, para el cabello sobre procesado y dañado, 6.8 fl oz<br></p>','<div><br></div><ul><li><span style=\"font-size: 1rem;\">Marca:&nbsp;</span><span style=\"font-size: 1rem;\">BIOLAGE</span><br></li><li>Forma del artículo: Spray</li><li>Tipo de cabello: Dañado</li><li>Volumen líquido: 200 Mililitros</li><li>Formulado con Pro-Keratin y Silk, el tratamiento en spray renovador de Biolage advanced para cabello dañado proporciona un refuerzo para el cabello sobre procesado, débil o frágil.<br></li></ul>','/storage/photos/31/productos 2/keratindose-1.jpg,/storage/photos/31/productos 2/keratindose-2.jpg,/storage/photos/31/productos 2/keratindose-4.jpg',10,'','new','active',0.00,0.00,1,24,30,9,'2021-02-17 01:48:17','2021-02-17 01:48:17'),
(581,'Mascarilla multiusos para el cabello','mascarilla-multiusos-para-el-cabello','<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt 18pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span lang=\"ES-MX\">Mascarilla multiusos para el cabello. Con Aloe, Vegano y sin parabenos, para cabello seco, 3.4 onzas líquidas.<o:p></o:p></span></p>','<div><br></div><ul><li>Marca: BIOLAGE</li><li>Volumen líquido: 100 Mililitros</li><li>Forma del artículo: Crema</li><li>Mascarilla capilar multiusos de tratamiento profundo que hidrata y nutre al cabello extremadamente seco.<br></li></ul>','/storage/photos/31/productos 2/hydrasuorce-vegano-1.jpg,/storage/photos/31/productos 2/hydrasuorce-vegano-2.jpg,/storage/photos/31/productos 2/hydrasuorce-vegano-4.jpg',10,'','new','active',0.00,0.00,1,24,30,9,'2021-02-17 01:59:30','2021-02-17 01:59:30'),
(582,'Scalpsync Champú anticaspa','scalpsync-champu-anticaspa','<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt 18pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span lang=\"ES-MX\">Biolage Scalpsync Champú anticaspa,\r\ncontrola la aparición de escamas y alivia la irritación del cuero cabelludo,\r\nsin parabenos, para controlar la caspa<o:p></o:p></span></p>','<ul><li><li>Marca: BIOLAGE</li><li>Forma del artículo: Líquido</li><li>Género objetivo: Unisex</li><li>Rango de edad: Adulto</li><li>Tipo de cabello: Todos</li></li></ul>','/storage/photos/31/productos 1/scalpsync-1.jpg,/storage/photos/31/productos 1/scalpsync-2.jpg,/storage/photos/31/productos 1/scalpsync-6.jpg',10,'','new','active',0.00,0.00,1,24,27,9,'2021-02-17 02:13:52','2021-02-17 02:13:52'),
(583,'Volume bloom Acondicionador','volume-bloom-acondicionador','<p>Para cabello voluminoso de larga duración. Sin parabenos, para cabello fino. 13.5 onzas líquidas.<br></p>','<ul><li><li>Marca: BIOLAGE</li><li>Fragancia: Floral&nbsp;</li><li>Volumen líquido: 400 Mililitros</li><li>La fórmula Volumebloom están inspiradas en las propiedades expansivas de la flor de algodón. El cabello se expande con un volumen elástico y duradero. El cabello fino puede carecer de volumen y ser difícil de peinar.<br></li></li></ul>','/storage/photos/31/productos 1/volumebloom-1.jpg,/storage/photos/31/productos 1/,volumebloom-2.jpg,/storage/photos/31/productos 1/volumebloom-7.jpg,/storage/photos/31/productos 1/volumebloom-8.jpg',10,'','new','active',0.00,0.00,1,24,32,9,'2021-02-17 02:32:03','2021-02-17 02:32:03'),
(584,'Silk Therapy','silk-therapy','<p>Champú limpiador. Tratamientos disponibles de la más alta calidad.<br></p>','<ul><li><li>Marca: BioSilk</li><li>Tipo de cabello: Graso, Seco, Normal</li><li>Volumen líquido: 355 Mililitros</li><li>Forma del artículo: Liquido</li></li></ul>','/storage/photos/31/productos 1/silk-therapy.jpg',9,'','new','active',0.00,0.00,1,24,27,NULL,'2021-02-17 02:42:13','2021-02-17 02:42:13'),
(585,'Aceite capilar premium','biotina-etereo-de-la-naturaleza','<p>Soluciones naturales para el cuidado del cabello.&nbsp;<span style=\"font-size: 1rem;\">Mezcla nutritiva y estimulante de aceites y nutrientes exóticos.&nbsp;</span><span style=\"font-size: 1rem;\">Ayuda a resolver una variedad de problemas diarios de tu cabello.</span></p>','<ul><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"color: rgb(15, 17, 17);\">Biotina: El aceite de biotina para el cabello es una fórmula única y avanzada que contiene una mezcla compleja probada para ayudar a que tu cabello parezca visiblemente más saludable. La biotina también estimula el cuero cabelludo para promover el crecimiento saludable del cabello.</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"\"><font color=\"#0f1111\">Castor:&nbsp;Hidrata profundamente el cabello seco y mejora la manejabilidad mientras domas el encrespamiento. Puede ayudar a aumentar el crecimiento del cabello.</font></span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"\"><font color=\"#0f1111\">Menta: Ayuda a combatir el cuero cabelludo escamoso mientras deja el cabello brillante y suave. Refresca y refresca el cuero cabelludo.</font></span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"\"><font color=\"#0f1111\">Pro-Crecimiento:&nbsp; Mezcla estimulante de raíz de ricino, aceites de almendras dulces y corteza de sauce.</font></span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"\"><font color=\"#0f1111\">Cuidado del cuero cabelludo: Una mezcla terapéutica refrescante de aceites de árbol de té, ricino y oliva.</font></span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"\"><font color=\"#0f1111\">Árbol de té: Un efecto calmante y refrescante refresca tu cabello y mejora la fuerza, suavidad e incluso promueve un crecimiento saludable del cabello.<br></font></span></li></ul>','/storage/photos/31/productos 1/premium_hair_oil_1.jpg,/storage/photos/31/productos 1/premium_hair_oil_2.jpg,/storage/photos/31/productos 1/premium_hair_oil_3.jpg,/storage/photos/31/productos 1/premium_hair_oil_4.jpg,/storage/photos/31/productos 1/premium_hair_oil_5.jpg,/storage/photos/31/productos 1/premium_hair_oil_6.jpg',10,'','new','active',0.00,0.00,1,24,31,56,'2021-02-17 03:19:50','2021-02-17 04:21:47'),
(586,'Set de champú y acondicionador de árbol de té','set-de-champu-y-acondicionador-de-arbol-de-te','<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt 18pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span lang=\"ES-MX\">Con aceite de árbol de té 100% puro,\r\npara cuero cabelludo seco, sin sulfatos, sin parabenos, 2 botellas de 16 fl oz cada una<o:p></o:p></span></p>','<ul><li><li>Marca: Botanic Hearth</li><li>Tipo de cabello: Todo tipo de cabellos, seco</li><li><li>Champú y acondicionador que revitalizan, calma y nutre profundamente tu cabello y cuero cabelludo.</li><li>Diseñado por expertos, el champú y acondicionador de pelo trabajan juntos para promover el cabello y cuero cabelludo limpio e hidratado.</li><li>Ideal para uso diario y para todo tipo de cabello, champú y acondicionador con protección de color.</li><li>Set libre de crueldad y no se ha probado en animales.</li></li></li></ul>','/storage/photos/31/productos 4/arbol-de-te-1.jpg,/storage/photos/31/productos 4/arbol-de-te-6.jpg,/storage/photos/31/productos 4/arbol-de-te-7.jpg,/storage/photos/31/productos 4/arbol-de-te-8.jpg,/storage/photos/31/productos 4/arbol-de-te-9.jpg',10,'','new','active',0.00,0.00,1,24,33,22,'2021-02-17 04:36:38','2021-02-17 04:36:38'),
(587,'Celestial Silk - Bandas de seda para el pelo','celestial-silk-bandas-de-seda-para-el-pelo','<p>Paquete de coleteros de seda que contienen 3 coleteros de seda de color topo oscuro.<br></p>','<ul><li><li>Los coleteros de seda de morera 100% pura mantienen el cabello saludable y manejable al reducir la fricción que conduce la, rotura y pérdida de cabello.</li><li>Ayuda a mantener el cabello sano reduciendo tirones. La seda suave ayuda a que el cabello se deslice sobre el soporte de coleta de seda, minimizando la rotura y reduciendo las arrugas del cabello.</li><li>Los lazos de seda para el cabello añaden un poco de lujo y glamour a las rutinas diarias de cuidado del cabello.</li></li></ul>','/storage/photos/31/productos 4/banda-de-seda-1.jpg,/storage/photos/31/productos 4/banda-de-seda-2.jpg',10,'','new','active',0.00,0.00,1,25,NULL,57,'2021-02-17 04:50:48','2021-02-17 04:50:48'),
(590,'Champú voluminizador','champu-voluminizador-2102160405-53','<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt 18pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span lang=\"ES-MX\">Para cabello graso, con vitaminas, aceite de limón y salvia, limpiador\r\nequilibrante con árbol de té anticaspa.&nbsp;<o:p></o:p></span></p>','<ul><li><li>Marca: HONEYDEW</li><li>Forma del artículo: Gel</li><li>Género objetivo: Unisex</li><li>Rango de edad: Adulto.</li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"color: rgb(15, 17, 17);\">Fórmula de champú a base de hierbas: no importa tu tipo de cabello, nuestro champú para mujeres y hombres está formulado para ayudar a que el cabello encuentre equilibrio</span>&nbsp;y <span style=\"color: rgb(0, 0, 0); font-family: Nunito, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">para un hermoso cabello lustroso y limpio<span>&nbsp;</span></span>desde la raíz hasta las puntas<font color=\"#0f1111\">.</font></li></li></ul>','/storage/photos/31/productos 2/limon-salvia-1.jpg,/storage/photos/31/productos 2/limon-salvia-6.jpg,/storage/photos/31/productos 2/limon-salvia-2.jpg',10,'','new','active',0.00,0.00,1,24,27,58,'2021-02-17 05:04:05','2021-02-17 05:04:05'),
(592,'Champú y acondicionador 2 en 1 Head & Shoulders','champu-y-acondicionador-2-en-1-head-shoulders','<p>Tratamiento anti caspa y cuidado del cuero cabelludo, Classic Clean, 32.1 fl oz, paquete doble<br></p>','<ul><li></li><li>Clínicamente probado. Protección de hasta 100% contra la caspa. (*Copos visibles, con uso regular)</li><li>Libre de parabenos: Head &amp; Shoulders Classic Clean 2 en 1 no contiene parabenos.</li><li>De los expertos en cuidado del cuero cabelludo; los creadores del champú para caspa # 1 de América* (*basado en ventas de volumen)</li><li>El alivio de múltiples síntomas ofrece una protección probada contra, picazón y sequedad (copos y picor asociados con la caspa).</li><li>Cómoda fórmula 2 en 1 que nutre el cabello y el cuero cabelludo mientras limpia e hidrata.</li><li>PH equilibrado: pH equilibrado para ser lo suficientemente suave para el uso diario.</li></ul>','/storage/photos/31/productos 3/classic-clean-set-1.jpg,/storage/photos/31/productos 3/classic-clean-set-4.jpg,/storage/photos/31/productos 3/classic-clean-set-6.jpg',10,'','new','active',0.00,0.00,1,24,33,NULL,'2021-02-17 05:28:59','2021-02-17 05:28:59'),
(593,'Bandas elásticas transparentes','bandas-elasticas-transparentes','<p>BEBEEPOO 2500 piezas Mini bandas de goma para el cabello con una caja, bandas elásticas suaves para el cabello de 2 mm de ancho y 30 mm.<br></p>','<ul><li><li>Rango de edad: Niño, bebé</li><li>Tipo de cabello: Rizado</li><li>Género objetivo: Unisex</li><li>Color: Claro</li><li>Marca: BEBEEPOO</li></li></ul>','/storage/photos/31/productos 3/clear-elastic-hair-bands-1.jpg,/storage/photos/31/productos 3/clear-elastic-hair-bands-3.jpg,/storage/photos/31/productos 3/clear-elastic-hair-bands-4.jpg,/storage/photos/31/productos 3/clear-elastic-hair-bands-7.jpg',10,'','new','active',0.00,0.00,1,25,NULL,26,'2021-02-17 05:39:49','2021-02-17 05:39:49'),
(594,'Crema para peinar Color Edge','crema-para-peinar-color-edge','Crema para peinar y desenredar 12. oz','<ul><li><li>hecha con aceite de almendra y zanahoria.</li><li>Color Edge Shine crema desenreda Cabello sin esfuerzo.</li><li>Añade brillo y suavidad para el cabello.</li><li>Producto versátil.</li></li></ul>','/storage/photos/31/productos 1/weightless-1.jpg,/storage/photos/31/productos 1/weightless-2.jpg',10,'','new','active',0.00,0.00,1,24,28,27,'2021-02-17 05:49:34','2021-02-17 05:49:34'),
(596,'Máscara ColorProof','mascara-colorproof','<p>Desengrasa, hidrata, repara y fortalece. Acondiciona y restaura dramáticamente la elasticidad. Con un solo uso, el cabello luce hasta 10 años más joven.<br></p>','<div><br></div><ul><li><span style=\"font-size: 1rem;\">Tipo de cabello</span><span style=\"font-size: 1rem; white-space: pre;\">	</span><span style=\"font-size: 1rem;\">Rizado</span><br></li><li>Volumen líquido<span style=\"white-space:pre\">	</span>16 Onzas de líquido</li><li>Después del champú, aplicar desde el cuero cabelludo hasta las puntas. Dejar actuar de 1 a 5 minutos. Enjuagar. Úselo tantas veces como desee.<br></li></ul>','/storage/photos/31/productos 3/colorprood-crazy-smooth-1.jpg,/storage/photos/31/productos 3/colorprood-crazy-smooth-2.jpg,/storage/photos/31/productos 3/colorprood-crazy-smooth-3.jpg,/storage/photos/31/productos 3/colorprood-crazy-smooth-6.jpg',10,'','new','active',0.00,0.00,1,24,30,28,'2021-02-17 06:05:53','2021-02-17 06:05:53'),
(597,'Dove Volume champú','dove-volume-champu','<p>Para adelgazar el cabello ritual engrosamiento champú de cabello con lavanda 12 oz<br></p>','<ul><li><li><span style=\"font-size: 1rem;\">Marca:&nbsp;</span><span style=\"font-size: 1rem;\">Dónde está</span><br></li><li>Forma del artículo: Líquido</li><li>Género objetivo: Unisex</li><li>Rango de edad: Adulto.</li><li>Tipo de cabello: Normal</li></li></ul>','/storage/photos/31/productos 1/nutricion-secrets-dove-1.jpg,/storage/photos/31/productos 1/nutricion-secrets-dove-2.jpg,/storage/photos/31/productos 1/,/storage/photos/31/productos 1/nutricion-secrets-dove-7.jpg',10,'','new','active',0.00,0.00,1,24,27,NULL,'2021-02-17 06:22:03','2021-02-17 06:22:03');

UNLOCK TABLES;

/*Table structure for table `purchases` */

DROP TABLE IF EXISTS `purchases`;

CREATE TABLE `purchases` (
  `id` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(50) NOT NULL,
  `surveyed_co_id` int(50) NOT NULL,
  `purchased_co_id` int(50) DEFAULT NULL,
  `survey_period_id` int(50) NOT NULL,
  `transaction_id` int(50) NOT NULL,
  `payment_success` int(1) NOT NULL,
  `created_at` int(11) NOT NULL,
  `deactivated_at` int(11) DEFAULT NULL,
  `activated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `purchases` */

LOCK TABLES `purchases` WRITE;

insert  into `purchases`(`id`,`user_id`,`surveyed_co_id`,`purchased_co_id`,`survey_period_id`,`transaction_id`,`payment_success`,`created_at`,`deactivated_at`,`activated_at`) values 
(1,1,1,1,1,1,1,1545137245,NULL,1545137245);

UNLOCK TABLES;

/*Table structure for table `recommend` */

DROP TABLE IF EXISTS `recommend`;

CREATE TABLE `recommend` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT current_timestamp(),
  `survey_code_id` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `survey_page_id` int(50) DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `recommend` */

LOCK TABLES `recommend` WRITE;

insert  into `recommend`(`id`,`created_at`,`survey_code_id`,`survey_page_id`,`category`) values 
(1,'2021-02-01 11:31:51','ABC20211',0,'ffff'),
(2,'2021-02-01 11:33:21','ABC20211',0,'fff'),
(3,'2021-02-01 11:33:48','ABC20211',0,'fff'),
(4,'2021-02-01 11:34:43','ABC20211',0,'ffff'),
(5,'2021-02-01 11:35:08','ABC20211',0,'fff'),
(6,'2021-02-01 11:35:56','ABC20211',1,'fffff'),
(7,'2021-02-01 11:36:47','ABC20212',1,'gggg'),
(8,'2021-02-01 11:37:37','ABC20211',1,'eeee'),
(9,'2021-02-01 11:37:53','ABC20211',1,'qqqq'),
(10,'2021-02-01 11:38:04','ABC20211',1,'qqqq'),
(11,'2021-02-01 11:40:27','ABC20211',1,'ffff'),
(12,'2021-02-01 11:42:27','ABC20211',1,'fffff'),
(13,'2021-02-01 12:10:40','ABC20212',1,'dfdfdfdf'),
(14,'2021-02-01 14:51:32','ABC20211',1,'Massages'),
(15,'2021-02-01 14:52:10','ABC20211',1,'Eating out'),
(16,'2021-02-02 16:10:09','ABC20211',1,'Step 2'),
(17,'2021-02-02 16:11:21','ABC20212',1,'Step 3 recommendation'),
(18,'2021-02-02 16:20:00','ABC20211',1,'Step 2 1'),
(19,'2021-02-02 16:20:18','ABC20212',1,'Step 3 - 2'),
(20,'2021-02-02 23:15:03','ABC20211',1,'12312312'),
(21,'2021-02-02 23:15:12','ABC20211',1,'234234322342234'),
(22,'2021-02-02 23:15:30','ABC20212',1,'Step 3');

UNLOCK TABLES;

/*Table structure for table `results` */

DROP TABLE IF EXISTS `results`;

CREATE TABLE `results` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `created_at` int(11) DEFAULT NULL,
  `survey_login_id` int(50) DEFAULT NULL,
  `survey_code_id` int(50) DEFAULT NULL,
  `category_id` int(50) DEFAULT NULL,
  `survey_value` decimal(48,21) DEFAULT NULL,
  `deactivated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `results` */

LOCK TABLES `results` WRITE;

insert  into `results`(`id`,`created_at`,`survey_login_id`,`survey_code_id`,`category_id`,`survey_value`,`deactivated_at`) values 
(1,1612774067,1,1,1,12345.000000000000000000000,NULL),
(2,1612774067,1,1,9,12345.000000000000000000000,NULL),
(3,1612774067,1,1,1,12345.000000000000000000000,NULL),
(4,1612774067,1,1,9,12345.000000000000000000000,NULL),
(5,1612774067,1,1,1,1000.000000000000000000000,NULL),
(6,1612774067,1,1,9,2000.000000000000000000000,NULL);

UNLOCK TABLES;

/*Table structure for table `sector` */

DROP TABLE IF EXISTS `sector`;

CREATE TABLE `sector` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

/*Data for the table `sector` */

LOCK TABLES `sector` WRITE;

insert  into `sector`(`id`,`name`,`parent_id`) values 
(1,'AGRICULTURE',NULL),
(2,'Farming',1),
(3,'Fishing',1),
(4,'AUTOMOTIVE',NULL),
(5,'Motor Vehicle Parts',4),
(6,'Motor Vehicles',4),
(7,'BASIC MATERIALS/RESOURCES',NULL),
(8,'Chemicals',7),
(9,'Forestry & Wood Products',7),
(10,'Mining & Metals',7),
(11,'Paper/Pulp',7),
(12,'BUSINESS/CONSUMER SERVICES',NULL),
(13,'Business Services',12),
(14,'Computer Services',12),
(15,'Consumer Services',12),
(16,'Diversified Holding Companies',12),
(17,'General Services',12),
(18,'Shell companies',12),
(19,'CONSUMER GOODS',NULL),
(20,'Clothing/Textiles',19),
(21,'Food/Beverages/Tobacco',19),
(22,'Furniture',19),
(23,'Home Electronics/Appliances',19),
(24,'Leisure/Travel Goods',19),
(25,'Luxury Goods',19),
(26,'Nondurable Household Products',19),
(27,'Personal Care Products/Appliances',19),
(28,'Watches/Clocks/Parts',19),
(29,'ENERGY',NULL),
(30,'Alternative Fuel',29),
(31,'Fossil Fuels',29),
(32,'FINANCIAL SERVICES',NULL),
(33,'Banking/Credit',32),
(34,'Insurance',32),
(35,'Investing/Securities',32),
(36,'HEALTH CARE/LIFE SCIENCES',NULL),
(37,'Biotechnology',36),
(38,'Healthcare Provision',36),
(39,'Medical Equipment/Supplies',36),
(40,'Pharmaceuticals',36),
(41,'INDUSTRIAL GOODS',NULL),
(42,'Aerospace/Defense',41),
(43,'Containers/Packaging',41),
(44,'Industrial Electronics',41),
(45,'Industrial Products',41),
(46,'Machinery',41),
(47,'Precision Products',41),
(48,'LEISURE/ARTS/HOSPITALITY',NULL),
(49,'Gambling Industries',48),
(50,'Hotels/Restaurants',48),
(51,'Recreational Services',48),
(52,'Tourism',48),
(53,'MEDIA/ENTERTAINMENT',NULL),
(54,'Broadcasting',53),
(55,'Motion Picture/Sound Recording',53),
(56,'Printing/Publishing',53),
(57,'REAL ESTATE/CONSTRUCTION',NULL),
(58,'Building Materials/Products',57),
(59,'Construction',57),
(60,'Real Estate',57),
(61,'Residential Building Construction',57),
(62,'RETAIL/WHOLESALE',NULL),
(63,'Retail',62),
(64,'Wholesalers',62),
(65,'TECHNOLOGY',NULL),
(66,'Computers/Consumer Electronics',65),
(67,'Internet/Online',65),
(68,'Networking',65),
(69,'Semiconductors',65),
(70,'Software',65),
(71,'TELECOMMUNICATION SERVICES',NULL),
(72,'Telephone Systems',71),
(73,'TRANSPORTATION/LOGISTICS',NULL),
(74,'Air Transport',73),
(75,'Road/Rail Transport',73),
(76,'Transportation Services',73),
(77,'Water Transport/Shipping',73),
(78,'UTILITIES',NULL),
(79,'Electric/Gas Utilities',78),
(80,'Multiutilities',78),
(81,'Water Utilities',78),
(84,'GOVERNMENT',NULL),
(85,'Local Councils',84),
(86,'Electricity Distribution',84);

UNLOCK TABLES;

/*Table structure for table `settings` */

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_des` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `settings` */

LOCK TABLES `settings` WRITE;

insert  into `settings`(`id`,`description`,`short_des`,`logo`,`photo`,`address`,`phone`,`email`,`created_at`,`updated_at`) values 
(1,'Somos un equipo de especialistas en marketing digital en Colombia, dedicados a investigar en internet los mejores videojuegos, consolas y accesorios para juegos, ya sea nuevos, usados y en lanzamiento; los cuales mostramos y presentamos a tu disposición diariamente desde nuestra página web, para que no tengas que desgastarte buscando juegos en la red y perder tiempo en ello, ya que nosotros lo hacemos por ti, y te dejamos el link para que lo puedas comprar de forma más ágil y rápida en las respectivas plataformas, tenemos en cuenta nuevos juegos, nuevos lanzamientos y las novedades en el mercado de juegos a tú alcance, gracias por confiar en nosotros y esperamos te diviertas mientras compras tus juegos de interés.','Gracias por confiar en nuestro equipo de especialistas.','/storage/photos/1/logo.png','/storage/photos/1/blog3.jpg','Colombia','312-5452727','contacto@videojuegostotal.com',NULL,'2020-08-14 04:49:09');

UNLOCK TABLES;

/*Table structure for table `shippings` */

DROP TABLE IF EXISTS `shippings`;

CREATE TABLE `shippings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `shippings` */

LOCK TABLES `shippings` WRITE;

insert  into `shippings`(`id`,`type`,`price`,`status`,`created_at`,`updated_at`) values 
(1,'Kahtmandu',100.00,'active','2020-08-14 07:22:17','2020-08-14 07:22:17'),
(2,'Out of valley',300.00,'active','2020-08-14 07:22:41','2020-08-14 07:22:41'),
(3,'Pokhara',400.00,'active','2020-08-15 09:54:04','2020-08-15 09:54:04'),
(4,'Dharan',400.00,'active','2020-08-17 23:50:48','2020-08-17 23:50:48');

UNLOCK TABLES;

/*Table structure for table `surveycode` */

DROP TABLE IF EXISTS `surveycode`;

CREATE TABLE `surveycode` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `created_at` int(11) NOT NULL,
  `survey_login_id` int(50) NOT NULL,
  `survey_code_name` varchar(255) NOT NULL,
  `survey_code_description` varchar(255) NOT NULL,
  `max_responses` int(11) DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `survey_code_string` varchar(255) NOT NULL,
  `survey_code_hash` varchar(255) NOT NULL,
  `survey_url` varchar(255) DEFAULT NULL,
  `activated_at` int(11) DEFAULT NULL,
  `deactivated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `surveycode` */

LOCK TABLES `surveycode` WRITE;

insert  into `surveycode`(`id`,`created_at`,`survey_login_id`,`survey_code_name`,`survey_code_description`,`max_responses`,`expire_date`,`survey_code_string`,`survey_code_hash`,`survey_url`,`activated_at`,`deactivated_at`) values 
(1,1545137245,1,'Trip Analysis','This is a survey to determine how much trips cost',NULL,'0000-00-00 00:00:00','346DGFGFfe!@','67e4f516b89e8d51be9015c04d4791f9','un=ff43c7e9d29b47ac6ea750622233a117&pw=21a8d8dd7624d741bd3f017b65973f5c&ac=67e4f516b89e8d51be9015c04d4791f9',1545137245,NULL),
(2,1613182217,2,'Test','This is Test',20,'2021-02-25 03:10:17','346DGFGFfe!@','c3bdcfecc56113eafb1c7f4150d576d0',NULL,NULL,NULL),
(3,1613424600,4,'Rosya_test','This is Rosya Test part.',30,'0000-00-00 00:00:00','346DGFGFfe!@','155b0643873eeb156fabd6198b4ac3a3',NULL,NULL,NULL),
(4,1613441292,4,'Test_2','This is TEST_2',0,'2003-08-12 00:00:00','346DGFGFfe!@','97e5ba471c0131ef4d2abc655c602ddf',NULL,NULL,NULL),
(5,1613753727,9,'rosya_sc_1','rosya_sc_description',20,'2021-02-23 05:55:27','346DGFGFfe!@','acc1e2c02b1d8c1d1878ff1d62f6888c',NULL,NULL,NULL),
(6,1613797256,10,'Extension','This is extension',20,'2021-02-25 06:00:56','envie.xc=eksiefow','d15ee74f26216de4c6e897c07167c79e',NULL,NULL,NULL),
(7,1613869654,14,'John Smith','This is John Smith Code',0,'0000-00-00 00:00:00','john smith','cc8ae25849cea712430d61d947f72ce0',NULL,NULL,NULL),
(8,1613941887,15,'Ilya_test_1','This is Ilya_test_1',15,'2021-02-25 10:11:27','Ilya_test','2002ccc9850c845e970a71a536124d09',NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `surveylogin` */

DROP TABLE IF EXISTS `surveylogin`;

CREATE TABLE `surveylogin` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `created_at` int(11) DEFAULT NULL,
  `activated_at` int(11) DEFAULT NULL,
  `deactivated_at` int(11) DEFAULT NULL,
  `user_id` int(50) NOT NULL,
  `surveyed_co_id` int(50) NOT NULL,
  `purchased_co_id` int(50) NOT NULL,
  `area` varchar(255) NOT NULL,
  `financial_year` int(4) NOT NULL,
  `fiscal_year_ends` int(2) NOT NULL,
  `month_start` varchar(50) DEFAULT NULL,
  `period_id` int(2) NOT NULL,
  `month_end` varchar(50) DEFAULT NULL,
  `level_id` int(2) NOT NULL,
  `username_string` varchar(255) NOT NULL,
  `username_hash` varchar(255) NOT NULL,
  `password_string` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `transaction_id` int(50) DEFAULT NULL,
  `payment_success` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `surveylogin` */

LOCK TABLES `surveylogin` WRITE;

insert  into `surveylogin`(`id`,`created_at`,`activated_at`,`deactivated_at`,`user_id`,`surveyed_co_id`,`purchased_co_id`,`area`,`financial_year`,`fiscal_year_ends`,`month_start`,`period_id`,`month_end`,`level_id`,`username_string`,`username_hash`,`password_string`,`password_hash`,`transaction_id`,`payment_success`) values 
(1,1613181006,NULL,NULL,2,2,2,'Admin',2021,0,'Jan 31 2021',3,'Mar 31 2021',2,'234234HFFHSK%%$1','f4501caa39ca6c5a0719568fb4fb95a6','qqqqHFFHSK546','7d121c75346bbb6bd4e9b3f5cd71f9e0',NULL,0),
(4,1613424417,NULL,NULL,3,3,3,'rosya',2021,0,'Feb 28 2021',2,'Apr 30 2021',1,'234234HFFHSK%%$1','a09d43be8f4c68bf2aa29e9488d611a9','qqqqHFFHSK546','9bfea62695f8fa2d77a7d58f7fcbc73b',NULL,0),
(9,1613698807,NULL,NULL,3,3,3,'rosya-2',2021,0,'Mar 1',3,'Aug 31',2,'234234HFFHSK%%$1','fbc9fa7b31b16ada91be35d97b160247','qqqqHFFHSK546','f633f990181fd9605f52e8a3f40318ea',NULL,0),
(10,1613699030,NULL,NULL,2,2,2,'Admin-2',2021,0,'Mar 1',3,'Aug 31',1,'234234HFFHSK%%$1','f4501caa39ca6c5a0719568fb4fb95a6','qqqqHFFHSK546','7d121c75346bbb6bd4e9b3f5cd71f9e0',NULL,0),
(11,1613701033,NULL,NULL,4,4,1,'Feb18-1',2021,0,'May 31',5,'Aug 31',2,'234234HFFHSK%%$1','63d4e1fc87fc80af33ead9abc802d7ac','qqqqHFFHSK546','401200b28911374a9dc14c782b26adae',NULL,0),
(14,1613869167,NULL,NULL,1,1,1,'John Smith',2021,0,'Sep 1',3,'Feb 28',1,'234234HFFHSK%%$1','94419b4e31d70e42115ed45464508294','qqqqHFFHSK546','881d34dd6bd47218d9ae870214c2bd1b',NULL,0),
(15,1613941265,NULL,NULL,8,3,1,'Ilya_test',2020,0,'Feb 1',4,'May 31',3,'234234HFFHSK%%$1','a17450a764559237adb9132d64acf470','qqqqHFFHSK546','a93231ab9a0dd8e77732c757da719bc5',NULL,0);

UNLOCK TABLES;

/*Table structure for table `surveypageorder` */

DROP TABLE IF EXISTS `surveypageorder`;

CREATE TABLE `surveypageorder` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `created_at` int(11) NOT NULL,
  `surveycode_id` int(50) NOT NULL,
  `surveypage_id` int(50) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `activated_at` int(11) DEFAULT NULL,
  `deactivated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `surveypageorder` */

LOCK TABLES `surveypageorder` WRITE;

insert  into `surveypageorder`(`id`,`created_at`,`surveycode_id`,`surveypage_id`,`order`,`activated_at`,`deactivated_at`) values 
(1,1613807604,5,7,7,NULL,NULL),
(2,1545137245,1,1,1,1545137245,NULL),
(3,1545137245,1,2,2,1545137245,NULL),
(4,1613809241,5,9,9,NULL,NULL),
(16,1613894129,5,11,11,NULL,NULL),
(17,1613937774,7,20,20,NULL,NULL),
(18,1613941964,8,4,1,NULL,NULL),
(19,1614011396,8,5,0,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `surveyperiod` */

DROP TABLE IF EXISTS `surveyperiod`;

CREATE TABLE `surveyperiod` (
  `id` int(50) NOT NULL,
  `user_id` int(50) NOT NULL,
  `surveyed_co_id` int(50) NOT NULL,
  `purchased_co_id` int(50) NOT NULL,
  `area` varchar(255) NOT NULL,
  `financial_year` int(4) NOT NULL,
  `fiscal_year_ends` int(2) NOT NULL,
  `month_start` varchar(50) DEFAULT NULL,
  `period_id` int(2) NOT NULL,
  `month_end` varchar(50) DEFAULT NULL,
  `level_id` int(2) NOT NULL,
  `username_string` varchar(255) NOT NULL,
  `username_hash` varchar(255) NOT NULL,
  `password_string` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `transaction_id` int(50) DEFAULT NULL,
  `payment_success` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `surveyperiod` */

LOCK TABLES `surveyperiod` WRITE;

insert  into `surveyperiod`(`id`,`user_id`,`surveyed_co_id`,`purchased_co_id`,`area`,`financial_year`,`fiscal_year_ends`,`month_start`,`period_id`,`month_end`,`level_id`,`username_string`,`username_hash`,`password_string`,`password_hash`,`transaction_id`,`payment_success`) values 
(1,1,1,1,'Enterprise',2020,6,'July 1 2019',1,'June 30 2020',1,'234234HFFHSK%%$1','ff43c7e9d29b47ac6ea750622233a117','qqqqHFFHSK546','21a8d8dd7624d741bd3f017b65973f5c',NULL,1),
(2,1,1,0,'Enterprise',2021,0,'July 1 2020',1,'June 30 2021',0,'','','','',0,0);

UNLOCK TABLES;

/*Table structure for table `timezone` */

DROP TABLE IF EXISTS `timezone`;

CREATE TABLE `timezone` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=423 DEFAULT CHARSET=utf8;

/*Data for the table `timezone` */

LOCK TABLES `timezone` WRITE;

insert  into `timezone`(`id`,`name`) values 
(1,'Africa/Abidjan'),
(2,'Africa/Accra'),
(3,'Africa/Addis_Ababa'),
(4,'Africa/Algiers'),
(5,'Africa/Asmara'),
(6,'Africa/Bamako'),
(7,'Africa/Bangui'),
(8,'Africa/Banjul'),
(9,'Africa/Bissau'),
(10,'Africa/Blantyre'),
(11,'Africa/Brazzaville'),
(12,'Africa/Bujumbura'),
(13,'Africa/Cairo'),
(14,'Africa/Casablanca'),
(15,'Africa/Ceuta'),
(16,'Africa/Conakry'),
(17,'Africa/Dakar'),
(18,'Africa/Dar_es_Salaam'),
(19,'Africa/Djibouti'),
(20,'Africa/Douala'),
(21,'Africa/El_Aaiun'),
(22,'Africa/Freetown'),
(23,'Africa/Gaborone'),
(24,'Africa/Harare'),
(25,'Africa/Johannesburg'),
(26,'Africa/Juba'),
(27,'Africa/Kampala'),
(28,'Africa/Khartoum'),
(29,'Africa/Kigali'),
(30,'Africa/Kinshasa'),
(31,'Africa/Lagos'),
(32,'Africa/Libreville'),
(33,'Africa/Lome'),
(34,'Africa/Luanda'),
(35,'Africa/Lubumbashi'),
(36,'Africa/Lusaka'),
(37,'Africa/Malabo'),
(38,'Africa/Maputo'),
(39,'Africa/Maseru'),
(40,'Africa/Mbabane'),
(41,'Africa/Mogadishu'),
(42,'Africa/Monrovia'),
(43,'Africa/Nairobi'),
(44,'Africa/Ndjamena'),
(45,'Africa/Niamey'),
(46,'Africa/Nouakchott'),
(47,'Africa/Ouagadougou'),
(48,'Africa/Porto-Novo'),
(49,'Africa/Sao_Tome'),
(50,'Africa/Tripoli'),
(51,'Africa/Tunis'),
(52,'Africa/Windhoek'),
(53,'America/Adak'),
(54,'America/Anchorage'),
(55,'America/Anguilla'),
(56,'America/Antigua'),
(57,'America/Araguaina'),
(58,'America/Argentina/Buenos_Aires'),
(59,'America/Argentina/Catamarca'),
(60,'America/Argentina/Cordoba'),
(61,'America/Argentina/Jujuy'),
(62,'America/Argentina/La_Rioja'),
(63,'America/Argentina/Mendoza'),
(64,'America/Argentina/Rio_Gallegos'),
(65,'America/Argentina/Salta'),
(66,'America/Argentina/San_Juan'),
(67,'America/Argentina/San_Luis'),
(68,'America/Argentina/Tucuman'),
(69,'America/Argentina/Ushuaia'),
(70,'America/Aruba'),
(71,'America/Asuncion'),
(72,'America/Atikokan'),
(73,'America/Bahia'),
(74,'America/Bahia_Banderas'),
(75,'America/Barbados'),
(76,'America/Belem'),
(77,'America/Belize'),
(78,'America/Blanc-Sablon'),
(79,'America/Boa_Vista'),
(80,'America/Bogota'),
(81,'America/Boise'),
(82,'America/Cambridge_Bay'),
(83,'America/Campo_Grande'),
(84,'America/Cancun'),
(85,'America/Caracas'),
(86,'America/Cayenne'),
(87,'America/Cayman'),
(88,'America/Chicago'),
(89,'America/Chihuahua'),
(90,'America/Costa_Rica'),
(91,'America/Creston'),
(92,'America/Cuiaba'),
(93,'America/Curacao'),
(94,'America/Danmarkshavn'),
(95,'America/Dawson'),
(96,'America/Dawson_Creek'),
(97,'America/Denver'),
(98,'America/Detroit'),
(99,'America/Dominica'),
(100,'America/Edmonton'),
(101,'America/Eirunepe'),
(102,'America/El_Salvador'),
(103,'America/Fort_Nelson'),
(104,'America/Fortaleza'),
(105,'America/Glace_Bay'),
(106,'America/Godthab'),
(107,'America/Goose_Bay'),
(108,'America/Grand_Turk'),
(109,'America/Grenada'),
(110,'America/Guadeloupe'),
(111,'America/Guatemala'),
(112,'America/Guayaquil'),
(113,'America/Guyana'),
(114,'America/Halifax'),
(115,'America/Havana'),
(116,'America/Hermosillo'),
(117,'America/Indiana/Indianapolis'),
(118,'America/Indiana/Knox'),
(119,'America/Indiana/Marengo'),
(120,'America/Indiana/Petersburg'),
(121,'America/Indiana/Tell_City'),
(122,'America/Indiana/Vevay'),
(123,'America/Indiana/Vincennes'),
(124,'America/Indiana/Winamac'),
(125,'America/Inuvik'),
(126,'America/Iqaluit'),
(127,'America/Jamaica'),
(128,'America/Juneau'),
(129,'America/Kentucky/Louisville'),
(130,'America/Kentucky/Monticello'),
(131,'America/Kralendijk'),
(132,'America/La_Paz'),
(133,'America/Lima'),
(134,'America/Los_Angeles'),
(135,'America/Lower_Princes'),
(136,'America/Maceio'),
(137,'America/Managua'),
(138,'America/Manaus'),
(139,'America/Marigot'),
(140,'America/Martinique'),
(141,'America/Matamoros'),
(142,'America/Mazatlan'),
(143,'America/Menominee'),
(144,'America/Merida'),
(145,'America/Metlakatla'),
(146,'America/Mexico_City'),
(147,'America/Miquelon'),
(148,'America/Moncton'),
(149,'America/Monterrey'),
(150,'America/Montevideo'),
(151,'America/Montserrat'),
(152,'America/Nassau'),
(153,'America/New_York'),
(154,'America/Nipigon'),
(155,'America/Nome'),
(156,'America/Noronha'),
(157,'America/North_Dakota/Beulah'),
(158,'America/North_Dakota/Center'),
(159,'America/North_Dakota/New_Salem'),
(160,'America/Ojinaga'),
(161,'America/Panama'),
(162,'America/Pangnirtung'),
(163,'America/Paramaribo'),
(164,'America/Phoenix'),
(165,'America/Port-au-Prince'),
(166,'America/Port_of_Spain'),
(167,'America/Porto_Velho'),
(168,'America/Puerto_Rico'),
(169,'America/Rainy_River'),
(170,'America/Rankin_Inlet'),
(171,'America/Recife'),
(172,'America/Regina'),
(173,'America/Resolute'),
(174,'America/Rio_Branco'),
(175,'America/Santarem'),
(176,'America/Santiago'),
(177,'America/Santo_Domingo'),
(178,'America/Sao_Paulo'),
(179,'America/Scoresbysund'),
(180,'America/Sitka'),
(181,'America/St_Barthelemy'),
(182,'America/St_Johns'),
(183,'America/St_Kitts'),
(184,'America/St_Lucia'),
(185,'America/St_Thomas'),
(186,'America/St_Vincent'),
(187,'America/Swift_Current'),
(188,'America/Tegucigalpa'),
(189,'America/Thule'),
(190,'America/Thunder_Bay'),
(191,'America/Tijuana'),
(192,'America/Toronto'),
(193,'America/Tortola'),
(194,'America/Vancouver'),
(195,'America/Whitehorse'),
(196,'America/Winnipeg'),
(197,'America/Yakutat'),
(198,'America/Yellowknife'),
(199,'Antarctica/Casey'),
(200,'Antarctica/Davis'),
(201,'Antarctica/DumontDUrville'),
(202,'Antarctica/Macquarie'),
(203,'Antarctica/Mawson'),
(204,'Antarctica/McMurdo'),
(205,'Antarctica/Palmer'),
(206,'Antarctica/Rothera'),
(207,'Antarctica/Syowa'),
(208,'Antarctica/Troll'),
(209,'Antarctica/Vostok'),
(210,'Arctic/Longyearbyen'),
(211,'Asia/Aden'),
(212,'Asia/Almaty'),
(213,'Asia/Amman'),
(214,'Asia/Anadyr'),
(215,'Asia/Aqtau'),
(216,'Asia/Aqtobe'),
(217,'Asia/Ashgabat'),
(218,'Asia/Baghdad'),
(219,'Asia/Bahrain'),
(220,'Asia/Baku'),
(221,'Asia/Bangkok'),
(222,'Asia/Barnaul'),
(223,'Asia/Beirut'),
(224,'Asia/Bishkek'),
(225,'Asia/Brunei'),
(226,'Asia/Chita'),
(227,'Asia/Choibalsan'),
(228,'Asia/Colombo'),
(229,'Asia/Damascus'),
(230,'Asia/Dhaka'),
(231,'Asia/Dili'),
(232,'Asia/Dubai'),
(233,'Asia/Dushanbe'),
(234,'Asia/Gaza'),
(235,'Asia/Hebron'),
(236,'Asia/Ho_Chi_Minh'),
(237,'Asia/Hong_Kong'),
(238,'Asia/Hovd'),
(239,'Asia/Irkutsk'),
(240,'Asia/Jakarta'),
(241,'Asia/Jayapura'),
(242,'Asia/Jerusalem'),
(243,'Asia/Kabul'),
(244,'Asia/Kamchatka'),
(245,'Asia/Karachi'),
(246,'Asia/Kathmandu'),
(247,'Asia/Khandyga'),
(248,'Asia/Kolkata'),
(249,'Asia/Krasnoyarsk'),
(250,'Asia/Kuala_Lumpur'),
(251,'Asia/Kuching'),
(252,'Asia/Kuwait'),
(253,'Asia/Macau'),
(254,'Asia/Magadan'),
(255,'Asia/Makassar'),
(256,'Asia/Manila'),
(257,'Asia/Muscat'),
(258,'Asia/Nicosia'),
(259,'Asia/Novokuznetsk'),
(260,'Asia/Novosibirsk'),
(261,'Asia/Omsk'),
(262,'Asia/Oral'),
(263,'Asia/Phnom_Penh'),
(264,'Asia/Pontianak'),
(265,'Asia/Pyongyang'),
(266,'Asia/Qatar'),
(267,'Asia/Qyzylorda'),
(268,'Asia/Rangoon'),
(269,'Asia/Riyadh'),
(270,'Asia/Sakhalin'),
(271,'Asia/Samarkand'),
(272,'Asia/Seoul'),
(273,'Asia/Shanghai'),
(274,'Asia/Singapore'),
(275,'Asia/Srednekolymsk'),
(276,'Asia/Taipei'),
(277,'Asia/Tashkent'),
(278,'Asia/Tbilisi'),
(279,'Asia/Tehran'),
(280,'Asia/Thimphu'),
(281,'Asia/Tokyo'),
(282,'Asia/Tomsk'),
(283,'Asia/Ulaanbaatar'),
(284,'Asia/Urumqi'),
(285,'Asia/Ust-Nera'),
(286,'Asia/Vientiane'),
(287,'Asia/Vladivostok'),
(288,'Asia/Yakutsk'),
(289,'Asia/Yekaterinburg'),
(290,'Asia/Yerevan'),
(291,'Atlantic/Azores'),
(292,'Atlantic/Bermuda'),
(293,'Atlantic/Canary'),
(294,'Atlantic/Cape_Verde'),
(295,'Atlantic/Faroe'),
(296,'Atlantic/Madeira'),
(297,'Atlantic/Reykjavik'),
(298,'Atlantic/South_Georgia'),
(299,'Atlantic/St_Helena'),
(300,'Atlantic/Stanley'),
(301,'Australia/Adelaide'),
(302,'Australia/Brisbane'),
(303,'Australia/Broken_Hill'),
(304,'Australia/Currie'),
(305,'Australia/Darwin'),
(306,'Australia/Eucla'),
(307,'Australia/Hobart'),
(308,'Australia/Lindeman'),
(309,'Australia/Lord_Howe'),
(310,'Australia/Melbourne'),
(311,'Australia/Perth'),
(312,'Australia/Sydney'),
(313,'Europe/Amsterdam'),
(314,'Europe/Andorra'),
(315,'Europe/Astrakhan'),
(316,'Europe/Athens'),
(317,'Europe/Belgrade'),
(318,'Europe/Berlin'),
(319,'Europe/Bratislava'),
(320,'Europe/Brussels'),
(321,'Europe/Bucharest'),
(322,'Europe/Budapest'),
(323,'Europe/Busingen'),
(324,'Europe/Chisinau'),
(325,'Europe/Copenhagen'),
(326,'Europe/Dublin'),
(327,'Europe/Gibraltar'),
(328,'Europe/Guernsey'),
(329,'Europe/Helsinki'),
(330,'Europe/Isle_of_Man'),
(331,'Europe/Istanbul'),
(332,'Europe/Jersey'),
(333,'Europe/Kaliningrad'),
(334,'Europe/Kiev'),
(335,'Europe/Kirov'),
(336,'Europe/Lisbon'),
(337,'Europe/Ljubljana'),
(338,'Europe/London'),
(339,'Europe/Luxembourg'),
(340,'Europe/Madrid'),
(341,'Europe/Malta'),
(342,'Europe/Mariehamn'),
(343,'Europe/Minsk'),
(344,'Europe/Monaco'),
(345,'Europe/Moscow'),
(346,'Europe/Oslo'),
(347,'Europe/Paris'),
(348,'Europe/Podgorica'),
(349,'Europe/Prague'),
(350,'Europe/Riga'),
(351,'Europe/Rome'),
(352,'Europe/Samara'),
(353,'Europe/San_Marino'),
(354,'Europe/Sarajevo'),
(355,'Europe/Simferopol'),
(356,'Europe/Skopje'),
(357,'Europe/Sofia'),
(358,'Europe/Stockholm'),
(359,'Europe/Tallinn'),
(360,'Europe/Tirane'),
(361,'Europe/Ulyanovsk'),
(362,'Europe/Uzhgorod'),
(363,'Europe/Vaduz'),
(364,'Europe/Vatican'),
(365,'Europe/Vienna'),
(366,'Europe/Vilnius'),
(367,'Europe/Volgograd'),
(368,'Europe/Warsaw'),
(369,'Europe/Zagreb'),
(370,'Europe/Zaporozhye'),
(371,'Europe/Zurich'),
(372,'Indian/Antananarivo'),
(373,'Indian/Chagos'),
(374,'Indian/Christmas'),
(375,'Indian/Cocos'),
(376,'Indian/Comoro'),
(377,'Indian/Kerguelen'),
(378,'Indian/Mahe'),
(379,'Indian/Maldives'),
(380,'Indian/Mauritius'),
(381,'Indian/Mayotte'),
(382,'Indian/Reunion'),
(383,'Pacific/Apia'),
(384,'Pacific/Auckland'),
(385,'Pacific/Bougainville'),
(386,'Pacific/Chatham'),
(387,'Pacific/Chuuk'),
(388,'Pacific/Easter'),
(389,'Pacific/Efate'),
(390,'Pacific/Enderbury'),
(391,'Pacific/Fakaofo'),
(392,'Pacific/Fiji'),
(393,'Pacific/Funafuti'),
(394,'Pacific/Galapagos'),
(395,'Pacific/Gambier'),
(396,'Pacific/Guadalcanal'),
(397,'Pacific/Guam'),
(398,'Pacific/Honolulu'),
(399,'Pacific/Johnston'),
(400,'Pacific/Kiritimati'),
(401,'Pacific/Kosrae'),
(402,'Pacific/Kwajalein'),
(403,'Pacific/Majuro'),
(404,'Pacific/Marquesas'),
(405,'Pacific/Midway'),
(406,'Pacific/Nauru'),
(407,'Pacific/Niue'),
(408,'Pacific/Norfolk'),
(409,'Pacific/Noumea'),
(410,'Pacific/Pago_Pago'),
(411,'Pacific/Palau'),
(412,'Pacific/Pitcairn'),
(413,'Pacific/Pohnpei'),
(414,'Pacific/Port_Moresby'),
(415,'Pacific/Rarotonga'),
(416,'Pacific/Saipan'),
(417,'Pacific/Tahiti'),
(418,'Pacific/Tarawa'),
(419,'Pacific/Tongatapu'),
(420,'Pacific/Wake'),
(421,'Pacific/Wallis'),
(422,'UTC');

UNLOCK TABLES;

/*Table structure for table `transaction` */

DROP TABLE IF EXISTS `transaction`;

CREATE TABLE `transaction` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `created_at` int(11) NOT NULL,
  `user_id` int(50) NOT NULL,
  `stripe_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stripe_charge_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stripe_refund_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `amount` double DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `before_tax` double DEFAULT NULL,
  `refunded_amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `transaction` */

LOCK TABLES `transaction` WRITE;

insert  into `transaction`(`id`,`created_at`,`user_id`,`stripe_id`,`stripe_charge_id`,`stripe_refund_id`,`currency_id`,`purchase_id`,`amount`,`tax`,`before_tax`,`refunded_amount`) values 
(1,0,1,'pm_1IHfXR2eZvKYlo2ClOey9jIq','ch_1IHfXm2eZvKYlo2CSib4Z9D3',NULL,14,1,1.1,0.1,1,NULL);

UNLOCK TABLES;

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `works_for_co_id` int(50) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `phone_country_id` int(11) NOT NULL DEFAULT 12,
  `created_at` int(11) NOT NULL,
  `deactivated_at` int(11) DEFAULT NULL,
  `activated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

LOCK TABLES `user` WRITE;

insert  into `user`(`id`,`email`,`password`,`first_name`,`last_name`,`job_title`,`works_for_co_id`,`phone_number`,`phone_country_id`,`created_at`,`deactivated_at`,`activated_at`) values 
(1,'JohnSmith@abcfin.com','$2y$10$leOKKNF9INfcVGI1N6DExuIK2uNsMmaVs2eDXLPS9l1Jf0QulYYk6','John','Smith','Manager',1,'+61123412341',12,1545137245,NULL,1545137245),
(2,'admin@admin.com','a4058e56be0a59f1a22d9f4d9e96073d','Rosya','ivan','admin',2,'123-456-7890',12,1613180882,NULL,0),
(3,'rosya@gmail.com','5e504a4e8f6e8c76f80accd103f0f408','rosya','ivanov','manager',3,'1234567',157,1613424264,NULL,0),
(4,'Feb18_update','9c58a66364ccada7c298b958ede744ec','user_111','','manager',4,'12312312312',12,1613665193,NULL,0),
(5,'rosya@gmail.com','a25728fa6a8a620c5dcb3d9b31646ba0','rosya','ivanov','manager',2,'1234567',157,1613788715,NULL,0),
(7,'JohnSmith@abcfin.com','e52ef0e92956209af502a5a1e4d8d12e','John','Smith','Manager',3,'+61123412341',12,1613913513,NULL,0),
(8,'Ilya_test@gmail.com','b8e29ccc1d093dc8bb009a2c2d4ac2e9','Ilya','Test','manager',3,'+61123412341',157,1613940617,NULL,0);

UNLOCK TABLES;

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

LOCK TABLES `users` WRITE;

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`photo`,`role`,`provider`,`provider_id`,`status`,`remember_token`,`created_at`,`updated_at`) values 
(37,'pepe','pepe@gmail.com',NULL,'$2y$10$Awp63JJBtaeGPs5wPeyrcerDboLGiLUrfKgNKWTHp89pK.GB5JPjm',NULL,'user',NULL,NULL,'active',NULL,'2021-02-03 10:48:06','2021-02-03 10:48:06'),
(38,'deivid','dhms777@gmail.com',NULL,'$2y$10$PJD1.h8k8xDiHSfpW4mifuvlIhhNEpCSxvXiTXsIXen3wSuEvo.Oa',NULL,'admin',NULL,NULL,'active',NULL,'2021-02-18 08:04:07','2021-02-18 08:04:07');

UNLOCK TABLES;

/*Table structure for table `wishlists` */

DROP TABLE IF EXISTS `wishlists`;

CREATE TABLE `wishlists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `cart_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlists_product_id_foreign` (`product_id`),
  KEY `wishlists_user_id_foreign` (`user_id`),
  KEY `wishlists_cart_id_foreign` (`cart_id`),
  CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `wishlists` */

LOCK TABLES `wishlists` WRITE;

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
