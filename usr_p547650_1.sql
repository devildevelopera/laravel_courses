/*
SQLyog Community v12.3.2 (64 bit)
MySQL - 10.3.15-MariaDB : Database - buscsi_lms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`buscsi_lms` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `buscsi_lms`;

/*Table structure for table `admin_menu_items` */

DROP TABLE IF EXISTS `admin_menu_items`;

CREATE TABLE `admin_menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` int(10) unsigned NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 0,
  `class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu` int(10) unsigned NOT NULL,
  `depth` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_menu_items_menu_foreign` (`menu`),
  CONSTRAINT `admin_menu_items_menu_foreign` FOREIGN KEY (`menu`) REFERENCES `admin_menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `admin_menu_items` */

insert  into `admin_menu_items`(`id`,`label`,`link`,`parent`,`sort`,`class`,`menu`,`depth`,`created_at`,`updated_at`) values 
(2,'Courses','courses',2,0,NULL,1,0,'2020-02-27 05:33:53','2020-04-15 01:51:26'),
(3,'Bundles','bundles',3,1,NULL,1,0,'2020-02-27 05:33:53','2020-04-15 01:51:26'),
(7,'About us','https://buscsi.com/aboutus',7,2,NULL,1,0,'2020-04-17 09:26:37','2020-04-17 09:27:08');

/*Table structure for table `admin_menus` */

DROP TABLE IF EXISTS `admin_menus`;

CREATE TABLE `admin_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `admin_menus` */

insert  into `admin_menus`(`id`,`name`,`created_at`,`updated_at`) values 
(1,'nav-menu','2020-02-27 05:33:53','2020-02-27 05:33:53');

/*Table structure for table `blog_comments` */

DROP TABLE IF EXISTS `blog_comments`;

CREATE TABLE `blog_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `blog_comments` */

/*Table structure for table `blogs` */

DROP TABLE IF EXISTS `blogs`;

CREATE TABLE `blogs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `meta_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blogs_category_id_foreign` (`category_id`),
  CONSTRAINT `blogs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `blogs` */

/*Table structure for table `bundle_courses` */

DROP TABLE IF EXISTS `bundle_courses`;

CREATE TABLE `bundle_courses` (
  `bundle_id` int(10) unsigned NOT NULL,
  `course_id` int(10) unsigned NOT NULL,
  KEY `bundle_courses_bundle_id_foreign` (`bundle_id`),
  KEY `bundle_courses_course_id_foreign` (`course_id`),
  CONSTRAINT `bundle_courses_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bundle_courses_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `bundle_courses` */

/*Table structure for table `bundle_student` */

DROP TABLE IF EXISTS `bundle_student`;

CREATE TABLE `bundle_student` (
  `bundle_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `rating` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `bundle_student_bundle_id_foreign` (`bundle_id`),
  KEY `bundle_student_user_id_foreign` (`user_id`),
  CONSTRAINT `bundle_student_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bundle_student_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `bundle_student` */

/*Table structure for table `bundles` */

DROP TABLE IF EXISTS `bundles`;

CREATE TABLE `bundles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `course_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `featured` int(11) DEFAULT 0,
  `trending` int(11) DEFAULT 0,
  `popular` int(11) DEFAULT 0,
  `meta_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint(4) DEFAULT 0,
  `free` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bundles_user_id_foreign` (`user_id`),
  KEY `bundles_deleted_at_index` (`deleted_at`),
  CONSTRAINT `bundles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `bundles` */

/*Table structure for table `cache` */

DROP TABLE IF EXISTS `cache`;

CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  UNIQUE KEY `cache_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cache` */

/*Table structure for table `cart_storage` */

DROP TABLE IF EXISTS `cart_storage`;

CREATE TABLE `cart_storage` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cart_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_storage_id_index` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cart_storage` */

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0 - disabled, 1 - enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `categories` */

insert  into `categories`(`id`,`name`,`slug`,`icon`,`status`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'ادارة المشاريع','adar-almsharyaa','far fa-bookmark',1,'2020-04-14 09:41:23','2020-04-17 13:24:50',NULL),
(2,'القيادة','alkyad','far fa-bookmark',1,'2020-04-17 13:24:08','2020-04-17 13:24:08',NULL),
(3,'الحاسب','alhasb','far fa-bookmark',1,'2020-04-17 13:24:22','2020-04-17 13:24:22',NULL),
(4,'البرمجة','albrmj','far fa-bookmark',1,'2020-04-17 13:24:33','2020-04-17 13:24:33',NULL),
(5,'ريادة الأعمال','ryad-alaaamal','far fa-bookmark',1,'2020-04-17 13:25:24','2020-04-17 13:25:24',NULL),
(6,'الزراعة','alzraaa','far fa-bookmark',1,'2020-04-17 13:26:15','2020-04-17 13:26:15',NULL),
(7,'الفندقة و السياحة','alfndk-o-alsyah','far fa-bookmark',1,'2020-04-17 13:26:35','2020-04-17 13:26:35',NULL),
(8,'اللغة الإنجليزية','allgh-alenjlyzy','far fa-bookmark',1,'2020-04-17 13:27:10','2020-04-17 13:27:10',NULL),
(9,'الصيدلة','alsydl','fas fa-bookmark',1,'2020-04-19 05:36:54','2020-04-19 05:38:16','2020-04-19 05:38:16');

/*Table structure for table `certificates` */

DROP TABLE IF EXISTS `certificates`;

CREATE TABLE `certificates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `course_id` int(10) unsigned DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1-Generated 0-Not Generated',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `certificates_user_id_foreign` (`user_id`),
  KEY `certificates_course_id_foreign` (`course_id`),
  CONSTRAINT `certificates_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `certificates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `certificates` */

insert  into `certificates`(`id`,`name`,`user_id`,`course_id`,`url`,`status`,`created_at`,`updated_at`) values 
(1,'3',3,1,'Certificate-1-3.pdf',1,'2020-04-15 02:36:09','2020-04-15 02:36:09'),
(2,'6',6,1,'Certificate-1-6.pdf',1,'2020-04-15 15:02:21','2020-04-15 15:02:21'),
(3,'7',7,1,'Certificate-1-7.pdf',1,'2020-04-15 15:11:06','2020-04-15 15:11:06'),
(4,'6',6,2,'Certificate-2-6.pdf',1,'2020-04-15 16:02:16','2020-04-15 16:02:16'),
(5,'14',14,3,'Certificate-3-14.pdf',1,'2020-04-19 12:14:06','2020-04-19 12:14:06'),
(6,'14',14,1,'Certificate-1-14.pdf',1,'2020-04-19 12:20:31','2020-04-19 12:20:31'),
(7,'5',5,1,'Certificate-1-5.pdf',1,'2020-04-20 06:55:59','2020-04-20 06:55:59'),
(8,'17',17,3,'Certificate-3-17.pdf',1,'2020-04-20 14:07:58','2020-04-20 14:07:58'),
(9,'17',17,1,'Certificate-1-17.pdf',1,'2020-04-20 14:12:02','2020-04-20 14:12:02'),
(10,'19',19,1,'Certificate-1-19.pdf',1,'2020-04-20 14:26:17','2020-04-20 14:26:17'),
(11,'19',19,3,'Certificate-3-19.pdf',1,'2020-04-20 14:44:43','2020-04-20 14:44:43'),
(60,'46',46,1,'Certificate-1-46.pdf',1,'2020-04-22 19:19:07','2020-04-22 19:19:07'),
(61,'46',46,3,'Certificate-3-46.pdf',1,'2020-04-22 19:42:39','2020-04-22 19:42:39');

/*Table structure for table `chapter_students` */

DROP TABLE IF EXISTS `chapter_students`;

CREATE TABLE `chapter_students` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `course_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chapter_students_model_type_model_id_index` (`model_type`,`model_id`),
  KEY `chapter_students_user_id_foreign` (`user_id`),
  KEY `chapter_students_course_id_foreign` (`course_id`),
  CONSTRAINT `chapter_students_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chapter_students_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `chapter_students` */

insert  into `chapter_students`(`id`,`model_type`,`model_id`,`user_id`,`course_id`,`created_at`,`updated_at`) values 
(1,'App\\Models\\Test',1,3,1,'2020-04-15 02:35:53','2020-04-15 02:35:53'),
(2,'App\\Models\\Test',1,6,1,'2020-04-15 15:02:05','2020-04-15 15:02:05'),
(3,'App\\Models\\Test',1,7,1,'2020-04-15 15:11:03','2020-04-15 15:11:03'),
(4,'App\\Models\\Test',2,6,2,'2020-04-15 16:01:55','2020-04-15 16:01:55'),
(5,'App\\Models\\Lesson',2,6,2,'2020-04-15 16:02:13','2020-04-15 16:02:13'),
(6,'App\\Models\\Lesson',3,14,3,'2020-04-19 12:13:23','2020-04-19 12:13:23'),
(7,'App\\Models\\Test',1,14,1,'2020-04-19 12:20:28','2020-04-19 12:20:28'),
(8,'App\\Models\\Lesson',4,14,1,'2020-04-19 12:30:18','2020-04-19 12:30:18'),
(9,'App\\Models\\Test',1,5,1,'2020-04-20 06:42:15','2020-04-20 06:42:15'),
(10,'App\\Models\\Lesson',4,5,1,'2020-04-20 06:42:29','2020-04-20 06:42:29'),
(11,'App\\Models\\Lesson',3,17,3,'2020-04-20 14:07:55','2020-04-20 14:07:55'),
(12,'App\\Models\\Test',1,17,1,'2020-04-20 14:11:57','2020-04-20 14:11:57'),
(13,'App\\Models\\Lesson',4,17,1,'2020-04-20 14:11:59','2020-04-20 14:11:59'),
(14,'App\\Models\\Test',1,19,1,'2020-04-20 14:26:12','2020-04-20 14:26:12'),
(15,'App\\Models\\Lesson',4,19,1,'2020-04-20 14:26:14','2020-04-20 14:26:14'),
(16,'App\\Models\\Lesson',3,19,3,'2020-04-20 14:44:40','2020-04-20 14:44:40'),
(92,'App\\Models\\Test',1,46,1,'2020-04-22 19:19:02','2020-04-22 19:19:02'),
(93,'App\\Models\\Lesson',4,46,1,'2020-04-22 19:19:04','2020-04-22 19:19:04'),
(94,'App\\Models\\Lesson',3,46,3,'2020-04-22 19:42:37','2020-04-22 19:42:37');

/*Table structure for table `chatter_categories` */

DROP TABLE IF EXISTS `chatter_categories`;

CREATE TABLE `chatter_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `chatter_categories` */

/*Table structure for table `chatter_discussion` */

DROP TABLE IF EXISTS `chatter_discussion`;

CREATE TABLE `chatter_discussion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chatter_category_id` int(10) unsigned NOT NULL DEFAULT 1,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `sticky` tinyint(1) NOT NULL DEFAULT 0,
  `views` int(10) unsigned NOT NULL DEFAULT 0,
  `answered` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '#232629',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `last_reply_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `chatter_discussion_slug_unique` (`slug`),
  KEY `chatter_discussion_chatter_category_id_foreign` (`chatter_category_id`),
  KEY `chatter_discussion_user_id_foreign` (`user_id`),
  CONSTRAINT `chatter_discussion_chatter_category_id_foreign` FOREIGN KEY (`chatter_category_id`) REFERENCES `chatter_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chatter_discussion_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `chatter_discussion` */

/*Table structure for table `chatter_post` */

DROP TABLE IF EXISTS `chatter_post`;

CREATE TABLE `chatter_post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chatter_discussion_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `markdown` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chatter_post_chatter_discussion_id_foreign` (`chatter_discussion_id`),
  KEY `chatter_post_user_id_foreign` (`user_id`),
  CONSTRAINT `chatter_post_chatter_discussion_id_foreign` FOREIGN KEY (`chatter_discussion_id`) REFERENCES `chatter_discussion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chatter_post_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `chatter_post` */

/*Table structure for table `chatter_user_discussion` */

DROP TABLE IF EXISTS `chatter_user_discussion`;

CREATE TABLE `chatter_user_discussion` (
  `user_id` int(10) unsigned NOT NULL,
  `discussion_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`discussion_id`),
  KEY `chatter_user_discussion_user_id_index` (`user_id`),
  KEY `chatter_user_discussion_discussion_id_index` (`discussion_id`),
  CONSTRAINT `chatter_user_discussion_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `chatter_discussion` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chatter_user_discussion_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `chatter_user_discussion` */

/*Table structure for table `configs` */

DROP TABLE IF EXISTS `configs`;

CREATE TABLE `configs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `configs` */

insert  into `configs`(`id`,`key`,`value`,`created_at`,`updated_at`) values 
(1,'theme_layout','1','2020-02-27 05:33:52','2020-04-15 01:33:40'),
(2,'font_color','default','2020-02-27 05:33:52','2020-04-17 06:24:37'),
(3,'layout_type','wide-layout','2020-02-27 05:33:52','2020-04-14 07:44:12'),
(4,'layout_1','{\"search_section\":{\"title\":\"Search Section\",\"status\":0},\"popular_courses\":{\"title\":\"Popular Courses\",\"status\":1},\"reasons\":{\"title\":\"Reasons why choose Neon LMS\",\"status\":0},\"testimonial\":{\"title\":\"Testimonial\",\"status\":0},\"latest_news\":{\"title\":\"Latest News, Courses\",\"status\":0},\"sponsors\":{\"title\":\"Sponsors\",\"status\":0},\"featured_courses\":{\"title\":\"Featured Courses\",\"status\":0},\"teachers\":{\"title\":\"Teachers\",\"status\":0},\"faq\":{\"title\":\"Frequently Asked Questions\",\"status\":0},\"course_by_category\":{\"title\":\"Course By Category\",\"status\":1},\"contact_us\":{\"title\":\"Contact us / Get in Touch\",\"status\":0}}','2020-02-27 05:33:52','2020-04-17 14:52:41'),
(5,'layout_2','{\"sponsors\":{\"title\":\"Sponsors\",\"status\":1},\"popular_courses\":{\"title\":\"Popular Courses\",\"status\":1},\"search_section\":{\"title\":\"Search Section\",\"status\":1},\"latest_news\":{\"title\":\"Latest News, Courses\",\"status\":1},\"featured_courses\":{\"title\":\"Featured Courses\",\"status\":1},\"faq\":{\"title\":\"Frequently Asked Questions\",\"status\":1},\"course_by_category\":{\"title\":\"Course By Category\",\"status\":1},\"testimonial\":{\"title\":\"Testimonial\",\"status\":1},\"teachers\":{\"title\":\"Teachers\",\"status\":1},\"contact_us\":{\"title\":\"Contact us / Get in Touch\",\"status\":1}}','2020-02-27 05:33:52','2020-04-15 01:32:08'),
(6,'layout_3','{\"counters\":{\"title\":\"Counters\",\"status\":0},\"latest_news\":{\"title\":\"Latest News, Courses\",\"status\":0},\"popular_courses\":{\"title\":\"Popular Courses\",\"status\":1},\"reasons\":{\"title\":\"Reasons why choose Neon LMS\",\"status\":0},\"featured_courses\":{\"title\":\"Featured Courses\",\"status\":1},\"teachers\":{\"title\":\"Teachers\",\"status\":0},\"faq\":{\"title\":\"Frequently Asked Questions\",\"status\":0},\"testimonial\":{\"title\":\"Testimonial\",\"status\":0},\"sponsors\":{\"title\":\"Sponsors\",\"status\":0},\"course_by_category\":{\"title\":\"Course By Category\",\"status\":1},\"contact_us\":{\"title\":\"Contact us / Get in Touch\",\"status\":1}}','2020-02-27 05:33:52','2020-04-15 01:32:44'),
(7,'layout_4','{\"counters\":{\"title\":\"Counters\",\"status\":1},\"popular_courses\":{\"title\":\"Popular Courses\",\"status\":1},\"reasons\":{\"title\":\"Reasons why choose Neon LMS\",\"status\":1},\"featured_courses\":{\"title\":\"Featured Courses\",\"status\":1},\"course_by_category\":{\"title\":\"Course By Category\",\"status\":1},\"teachers\":{\"title\":\"Teachers\",\"status\":1},\"latest_news\":{\"title\":\"Latest News, Courses\",\"status\":1},\"search_section\":{\"title\":\"Search Section\",\"status\":1},\"faq\":{\"title\":\"Frequently Asked Questions\",\"status\":1},\"testimonial\":{\"title\":\"Testimonial\",\"status\":1},\"sponsors\":{\"title\":\"Sponsors\",\"status\":1},\"contact_form\":{\"title\":\"Contact Form\",\"status\":1},\"contact_us\":{\"title\":\"Contact us / Get in Touch\",\"status\":1}}','2020-02-27 05:33:52','2020-04-15 01:33:40'),
(8,'counter','1','2020-02-27 05:33:52','2020-02-27 05:33:52'),
(9,'total_students','1M+','2020-02-27 05:33:52','2020-02-27 05:33:52'),
(10,'total_courses','1K+','2020-02-27 05:33:52','2020-02-27 05:33:52'),
(11,'total_teachers','200+','2020-02-27 05:33:52','2020-02-27 05:33:52'),
(12,'logo_b_image','1587118099-logo-3.png','2020-02-27 05:33:52','2020-04-17 06:08:19'),
(13,'logo_w_image','1586876693-249-2-dark.png','2020-02-27 05:33:52','2020-04-14 11:04:53'),
(14,'logo_white_image','1586876693-249-2-white.png','2020-02-27 05:33:52','2020-04-14 11:04:53'),
(15,'logo_popup','1586927702-72.png','2020-02-27 05:33:52','2020-04-15 01:15:03'),
(16,'favicon_image','1586927702-32.png','2020-02-27 05:33:52','2020-04-15 01:15:03'),
(17,'contact_data','[{\"name\":\"short_text\",\"value\":\"جامعة الباحة\",\"status\":1},{\"name\":\"primary_address\",\"value\":\"العنوان الوطني 4781\",\"status\":1},{\"name\":\"secondary_address\",\"value\":\"العقيق 65799-7738 المملكة العربية السعودية\",\"status\":1},{\"name\":\"primary_phone\",\"value\":\"966-17-7257700\",\"status\":1},{\"name\":\"secondary_phone\",\"value\":\"(20) 3434 9999\",\"status\":0},{\"name\":\"primary_email\",\"value\":\"info@buscsi.com\",\"status\":1},{\"name\":\"secondary_email\",\"value\":\"mail@neonlms.info\",\"status\":0},{\"name\":\"location_on_map\",\"value\":\"<iframe src=\'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d101408.2330017279!2d-122.15130702796371!3d37.41330279145996!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x808fb7495bec0189%3A0x7c17d44a466baf9b!2sMountain+View%2C+CA%2C+USA!5e0!3m2!1sen!2sin!4v1553663251022\' width=\'800\' height=\'600\' frameborder=\'0\' style=\'border:0\' allowfullscreen></iframe>\",\"status\":0}]','2020-02-27 05:33:52','2020-04-17 13:36:04'),
(18,'footer_data','{\"short_description\":{\"text\":\"\\n\",\"status\":0},\"section1\":{\"type\":\"2\",\"status\":0},\"section2\":{\"type\":\"3\",\"status\":0},\"section3\":{\"type\":\"5\",\"links\":[{\"label\":\"جامعة الباحة\",\"link\":\"https://bu.edu.sa/ar/web/guest/home\"}],\"status\":1},\"social_links\":{\"status\":1,\"links\":[{\"icon\":\"fab fa-twitter\",\"link\":\"https://twitter.com/ScsiB\"}]},\"newsletter_form\":{\"status\":0},\"bottom_footer\":{\"status\":1},\"copyright_text\":{\"text\":\"جميع الحقوق محفوظة لـ معهد الدراسات و الخدمات الاستشارية بجامعة الباحة ©\",\"status\":1},\"bottom_footer_links\":{\"status\":1,\"links\":[{\"label\":\"Contact Us\",\"link\":\"https://buscsi.com/contact\"}]}}','2020-02-27 05:33:52','2020-04-19 11:35:32'),
(19,'app.locale','ar','2020-02-27 05:33:52','2020-04-14 15:58:52'),
(20,'app.display_type','rtl','2020-02-27 05:33:52','2020-04-18 08:22:49'),
(21,'app.currency','SR','2020-02-27 05:33:52','2020-04-14 09:53:34'),
(22,'lesson_timer','0','2020-02-27 05:33:52','2020-02-27 05:33:52'),
(23,'show_offers','0','2020-02-27 05:33:52','2020-04-15 01:35:01'),
(24,'access.captcha.registration','0','2020-02-27 05:33:52','2020-04-14 16:17:03'),
(25,'sitemap.chunk','500','2020-02-27 05:33:52','2020-02-27 05:33:52'),
(26,'one_signal','0','2020-02-27 05:33:53','2020-02-27 05:33:53'),
(27,'nav_menu','1','2020-02-27 05:33:53','2020-02-27 05:33:53'),
(28,'commission_rate','0','2020-02-27 05:33:53','2020-02-27 05:33:53'),
(29,'app.name','معهد الدراسات و الخدمات الإستشارية بجامعة الباحة','2020-04-14 07:44:12','2020-04-17 06:24:37'),
(30,'app.url','www.buscsi.com/','2020-04-14 07:44:12','2020-04-15 01:35:01'),
(31,'google_analytics_id','UA-163659667-1','2020-04-14 07:44:12','2020-04-14 16:12:24'),
(32,'no-captcha_sitekey','6LcYkOkUAAAAAIn9ZO1FwkhX3VuIfJm0xOG6L65I','2020-04-14 07:44:12','2020-04-15 01:15:02'),
(33,'no-captcha_secret','6LcYkOkUAAAAAMJABQl42Are-m9PbQRz5dB7_AJR','2020-04-14 07:44:12','2020-04-15 01:15:02'),
(34,'onesignal_data',NULL,'2020-04-14 07:44:12','2020-04-14 07:44:12'),
(35,'mail.from.name','buscsi.com','2020-04-14 07:44:12','2020-04-14 07:44:12'),
(36,'mail.from.address','no-reply@buscsi.com','2020-04-14 07:44:12','2020-04-20 13:58:30'),
(37,'mail.driver','smtp','2020-04-14 07:44:12','2020-04-20 13:58:30'),
(38,'mail.host','mail.buscsi.com','2020-04-14 07:44:12','2020-04-20 13:58:30'),
(39,'mail.port','465','2020-04-14 07:44:12','2020-04-20 13:45:01'),
(40,'mail.username','no-reply@buscsi.com','2020-04-14 07:44:12','2020-04-20 13:58:30'),
(41,'mail.password','+eRo,u.E.SEe','2020-04-14 07:44:12','2020-04-20 13:58:30'),
(42,'mail.encryption','ssl','2020-04-14 07:44:12','2020-04-20 13:45:01'),
(43,'services.stripe.key',NULL,'2020-04-14 07:44:12','2020-04-14 07:44:12'),
(44,'services.stripe.secret',NULL,'2020-04-14 07:44:12','2020-04-14 07:44:12'),
(45,'paypal.settings.mode','sandbox','2020-04-14 07:44:12','2020-04-14 07:44:12'),
(46,'paypal.client_id',NULL,'2020-04-14 07:44:12','2020-04-14 07:44:12'),
(47,'paypal.secret',NULL,'2020-04-14 07:44:12','2020-04-14 07:44:12'),
(48,'registration_fields','[]','2020-04-14 07:44:12','2020-04-14 07:44:12'),
(49,'myTable_length','10','2020-04-14 07:44:12','2020-04-14 07:44:12'),
(50,'access_registration','0','2020-04-14 07:44:12','2020-04-14 07:44:12'),
(51,'mailchimp_double_opt_in','0','2020-04-14 07:44:12','2020-04-14 07:44:12'),
(52,'access_users_change_email','0','2020-04-14 07:44:12','2020-04-14 07:44:12'),
(53,'access_users_confirm_email','0','2020-04-14 07:44:12','2020-04-14 07:44:12'),
(54,'access_captcha_registration','0','2020-04-14 07:44:12','2020-04-14 07:44:12'),
(55,'access_users_requires_approval','0','2020-04-14 07:44:12','2020-04-14 07:44:12'),
(56,'services.stripe.active','0','2020-04-14 07:44:12','2020-04-14 07:44:12'),
(57,'paypal.active','0','2020-04-14 07:44:12','2020-04-14 07:44:12'),
(58,'payment_offline_active','0','2020-04-14 07:44:12','2020-04-14 07:44:12'),
(59,'backup.status','0','2020-04-14 07:44:12','2020-04-14 07:44:12'),
(60,'retest','0','2020-04-14 07:44:12','2020-04-14 07:44:12'),
(61,'onesignal_status','0','2020-04-14 07:44:12','2020-04-14 07:44:12'),
(62,'section1','2','2020-04-15 01:42:31','2020-04-15 01:42:31'),
(63,'section2','3','2020-04-15 01:42:31','2020-04-15 01:42:31'),
(64,'section3','5','2020-04-15 01:42:31','2020-04-15 01:42:31'),
(65,'icon','fab fa-facebook-f','2020-04-15 01:42:31','2020-04-17 10:37:27'),
(66,'sendgrid_api_key',NULL,'2020-04-15 01:47:45','2020-04-15 01:47:45');

/*Table structure for table `contacts` */

DROP TABLE IF EXISTS `contacts`;

CREATE TABLE `contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` bigint(20) DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `contacts` */

insert  into `contacts`(`id`,`name`,`email`,`number`,`message`,`created_at`,`updated_at`) values 
(1,'Mohammed Alzahrani','imohduni@gmail.com',503333011,'vdfggsdfgwtfgwtgwefgwfgvrdfgwbsdf','2020-04-17 14:05:14','2020-04-17 14:05:14');

/*Table structure for table `coupons` */

DROP TABLE IF EXISTS `coupons`;

CREATE TABLE `coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - Discount, 2 - Flat Amount',
  `amount` double(8,2) NOT NULL COMMENT 'Percentage or Amount',
  `min_price` double(8,2) NOT NULL DEFAULT 0.00 COMMENT 'Minimum price to allow coupons',
  `expires_at` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `per_user_limit` int(11) NOT NULL DEFAULT 1 COMMENT '0 - Unlimited',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 - Disabled, 1 - Enabled, 2 - Expired',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `coupons` */

/*Table structure for table `course_student` */

DROP TABLE IF EXISTS `course_student`;

CREATE TABLE `course_student` (
  `course_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `rating` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `course_student_course_id_foreign` (`course_id`),
  KEY `course_student_user_id_foreign` (`user_id`),
  CONSTRAINT `course_student_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `course_student_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `course_student` */

insert  into `course_student`(`course_id`,`user_id`,`rating`,`created_at`,`updated_at`) values 
(1,3,0,'2020-04-15 02:35:41','2020-04-15 02:35:41'),
(1,6,0,'2020-04-15 15:02:02','2020-04-15 15:02:02'),
(1,7,0,'2020-04-15 15:11:00','2020-04-15 15:11:00'),
(2,6,0,'2020-04-15 15:56:11','2020-04-15 15:56:11'),
(3,14,0,'2020-04-19 12:10:54','2020-04-19 12:10:54'),
(1,14,0,'2020-04-19 12:20:25','2020-04-19 12:20:25'),
(4,5,0,'2020-04-20 06:32:31','2020-04-20 06:32:31'),
(1,5,0,'2020-04-20 06:42:11','2020-04-20 06:42:11'),
(3,15,0,'2020-04-20 08:10:29','2020-04-20 08:10:29'),
(3,17,0,'2020-04-20 14:07:52','2020-04-20 14:07:52'),
(4,17,0,'2020-04-20 14:11:38','2020-04-20 14:11:38'),
(1,17,0,'2020-04-20 14:11:54','2020-04-20 14:11:54'),
(1,19,0,'2020-04-20 14:26:09','2020-04-20 14:26:09'),
(3,19,0,'2020-04-20 14:44:37','2020-04-20 14:44:37'),
(1,3,0,'2020-04-15 02:35:41','2020-04-15 02:35:41'),
(1,6,0,'2020-04-15 15:02:02','2020-04-15 15:02:02'),
(1,7,0,'2020-04-15 15:11:00','2020-04-15 15:11:00'),
(2,6,0,'2020-04-15 15:56:11','2020-04-15 15:56:11'),
(3,14,0,'2020-04-19 12:10:54','2020-04-19 12:10:54'),
(1,14,0,'2020-04-19 12:20:25','2020-04-19 12:20:25'),
(4,5,0,'2020-04-20 06:32:31','2020-04-20 06:32:31'),
(1,5,0,'2020-04-20 06:42:11','2020-04-20 06:42:11'),
(3,15,0,'2020-04-20 08:10:29','2020-04-20 08:10:29'),
(3,17,0,'2020-04-20 14:07:52','2020-04-20 14:07:52'),
(4,17,0,'2020-04-20 14:11:38','2020-04-20 14:11:38'),
(1,17,0,'2020-04-20 14:11:54','2020-04-20 14:11:54'),
(1,19,0,'2020-04-20 14:26:09','2020-04-20 14:26:09'),
(3,19,0,'2020-04-20 14:44:37','2020-04-20 14:44:37'),
(1,46,0,'2020-04-22 19:19:00','2020-04-22 19:19:00'),
(3,46,0,'2020-04-22 19:42:35','2020-04-22 19:42:35');

/*Table structure for table `course_timeline` */

DROP TABLE IF EXISTS `course_timeline`;

CREATE TABLE `course_timeline` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` int(11) NOT NULL,
  `sequence` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_timeline_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `course_timeline` */

insert  into `course_timeline`(`id`,`model_type`,`model_id`,`course_id`,`sequence`,`created_at`,`updated_at`) values 
(1,'App\\Models\\Test',1,1,1,'2020-04-14 09:53:58','2020-04-14 09:53:58'),
(2,'App\\Models\\Test',2,2,1,'2020-04-15 15:58:40','2020-04-15 15:58:40'),
(3,'App\\Models\\Lesson',2,2,2,'2020-04-15 16:01:12','2020-04-15 16:01:12'),
(4,'App\\Models\\Lesson',3,3,1,'2020-04-19 06:00:43','2020-04-19 06:00:43'),
(5,'App\\Models\\Lesson',4,1,2,'2020-04-19 12:29:29','2020-04-19 12:29:29');

/*Table structure for table `course_user` */

DROP TABLE IF EXISTS `course_user`;

CREATE TABLE `course_user` (
  `course_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  KEY `fk_p_54418_54417_user_cou_596eece522b73` (`course_id`),
  KEY `fk_p_54417_54418_course_u_596eece522bee` (`user_id`),
  CONSTRAINT `fk_p_54417_54418_course_u_596eece522bee` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_p_54418_54417_user_cou_596eece522b73` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `course_user` */

insert  into `course_user`(`course_id`,`user_id`) values 
(2,2),
(3,13),
(4,13),
(2,2),
(3,13),
(4,13);

/*Table structure for table `courses` */

DROP TABLE IF EXISTS `courses`;

CREATE TABLE `courses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `course_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `featured` int(11) DEFAULT 0,
  `trending` int(11) DEFAULT 0,
  `popular` int(11) DEFAULT 0,
  `meta_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint(4) DEFAULT 0,
  `free` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_deleted_at_index` (`deleted_at`),
  KEY `courses_category_id_foreign` (`category_id`),
  CONSTRAINT `courses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `courses` */

insert  into `courses`(`id`,`category_id`,`title`,`slug`,`description`,`price`,`course_image`,`start_date`,`featured`,`trending`,`popular`,`meta_title`,`meta_description`,`meta_keywords`,`published`,`free`,`created_at`,`updated_at`,`deleted_at`) values 
(1,1,'مقدمة في ادارة المشاريع','mkdm-fy-adar-almsharyaa','مفهوم إدارة المشاريع حيث يعرف المشروع ويناقش بيئة إدارة المشاريع',NULL,'1586871864-55858d6e-cbcd-414f-adc3-f1ae193d2ad6.jpg','2020-04-14',1,0,1,NULL,NULL,NULL,1,1,'2020-04-14 09:44:24','2020-04-19 12:19:36',NULL),
(2,1,'fgwefgwe','efgwefg','efgwergwgwergwerg wergwergwergwerg',NULL,NULL,'2020-04-15',0,0,0,'gwefgg','wergwerg','rgwerg',0,1,'2020-04-15 15:54:39','2020-04-17 06:23:51','2020-04-17 06:23:51'),
(3,8,'أساسيات قواعد اللغة الإنجليزية','eng1found','مقدمة في اساسيات قواعد اللغة الإنجليزية',NULL,'1587290376-download.jpeg','2020-04-19',0,0,1,NULL,NULL,NULL,1,1,'2020-04-19 05:59:36','2020-04-19 06:01:14',NULL),
(4,3,'مقدمة في البرمجة بلغة C++','mkdm-albrmj-blgh-c',NULL,NULL,'1587360716-1200px-iso-c-logo.png','2020-05-01',1,0,1,NULL,NULL,NULL,1,1,'2020-04-20 01:22:20','2020-04-20 01:31:57',NULL);

/*Table structure for table `earnings` */

DROP TABLE IF EXISTS `earnings`;

CREATE TABLE `earnings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned DEFAULT NULL,
  `course_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `course_price` decimal(8,2) NOT NULL,
  `amount` decimal(5,2) NOT NULL,
  `rate` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `earnings_course_id_foreign` (`course_id`),
  KEY `earnings_user_id_foreign` (`user_id`),
  CONSTRAINT `earnings_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `earnings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `earnings` */

/*Table structure for table `faqs` */

DROP TABLE IF EXISTS `faqs`;

CREATE TABLE `faqs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0 - disbaled, 1 - enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `faqs_category_id_foreign` (`category_id`),
  CONSTRAINT `faqs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `faqs` */

/*Table structure for table `invoices` */

DROP TABLE IF EXISTS `invoices`;

CREATE TABLE `invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `invoices` */

/*Table structure for table `jobs` */

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jobs` */

/*Table structure for table `lessons` */

DROP TABLE IF EXISTS `lessons`;

CREATE TABLE `lessons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lesson_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(10) unsigned DEFAULT NULL,
  `free_lesson` tinyint(4) DEFAULT 1,
  `published` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `54419_596eedbb6686e` (`course_id`),
  KEY `lessons_deleted_at_index` (`deleted_at`),
  CONSTRAINT `54419_596eedbb6686e` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `lessons` */

insert  into `lessons`(`id`,`course_id`,`title`,`slug`,`lesson_image`,`short_text`,`full_text`,`position`,`free_lesson`,`published`,`created_at`,`updated_at`,`deleted_at`) values 
(1,1,'First','first',NULL,NULL,NULL,1,1,0,'2020-04-14 09:53:14','2020-04-14 09:53:14',NULL),
(2,2,'adfgwfgwr','fdfbfdgwfgw',NULL,'dfgwfggfwfgwerga','<p>fgwfdsfgdfgfgwegwetgwfdsfgvdfgwgavsdfwerffagwe</p>',1,1,1,'2020-04-15 16:01:12','2020-04-15 16:01:12',NULL),
(3,3,'Present Tenses BE','present-tenses-be',NULL,'Present Tenses BE',NULL,1,1,1,'2020-04-19 06:00:43','2020-04-19 06:00:43',NULL),
(4,1,'2','2',NULL,NULL,NULL,2,1,1,'2020-04-19 12:29:29','2020-04-19 12:29:29',NULL);

/*Table structure for table `locales` */

DROP TABLE IF EXISTS `locales`;

CREATE TABLE `locales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr' COMMENT 'ltr - Left to right, rtl - Right to Left',
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `locales` */

insert  into `locales`(`id`,`name`,`short_name`,`display_type`,`is_default`,`created_at`,`updated_at`) values 
(1,'English','en','ltr',0,'2020-02-27 05:33:48','2020-04-20 13:58:30'),
(4,'Arabic','ar','rtl',1,'2020-02-27 05:33:48','2020-04-14 15:58:52');

/*Table structure for table `ltm_translations` */

DROP TABLE IF EXISTS `ltm_translations`;

CREATE TABLE `ltm_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL DEFAULT 0,
  `locale` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `key` text COLLATE utf8mb4_bin NOT NULL,
  `value` text COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8701 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `ltm_translations` */

insert  into `ltm_translations`(`id`,`status`,`locale`,`group`,`key`,`value`,`created_at`,`updated_at`) values 
(1,0,'ar','custom-menu','nav-menu.about-us','من نحن','2020-02-27 05:33:53','2020-04-15 07:02:19'),
(2,0,'ar','custom-menu','nav-menu.blog','المدوّنة','2020-02-27 05:33:53','2020-04-15 07:02:19'),
(3,0,'ar','custom-menu','nav-menu.bundles','مسارات التدريب','2020-02-27 05:33:53','2020-04-15 07:02:19'),
(4,0,'ar','custom-menu','nav-menu.contact','تواصل معنا','2020-02-27 05:33:53','2020-04-15 07:02:19'),
(5,0,'ar','custom-menu','nav-menu.courses','الدورات الإلكترونية','2020-02-27 05:33:53','2020-04-15 07:02:19'),
(6,0,'ar','custom-menu','nav-menu.forums','المنتديات','2020-02-27 05:33:53','2020-04-15 07:02:19'),
(7,0,'en','custom-menu','nav-menu.blog','Blog','2020-02-27 05:33:53','2020-04-15 07:02:19'),
(8,0,'en','custom-menu','nav-menu.courses','Courses','2020-02-27 05:33:53','2020-04-15 07:02:19'),
(9,0,'en','custom-menu','nav-menu.bundles','Bundles','2020-02-27 05:33:53','2020-04-15 07:02:19'),
(10,0,'en','custom-menu','nav-menu.forums','Forums','2020-02-27 05:33:53','2020-04-15 07:02:19'),
(11,0,'en','custom-menu','nav-menu.contact','Contact','2020-02-27 05:33:53','2020-04-15 07:02:19'),
(12,1,'en','custom-menu','nav-menu.about-us','About us','2020-02-27 05:33:53','2020-04-17 09:27:08'),
(25,0,'ar','alerts','backend.general.backup_warning','يرجى ملء التفاصيل اللازمة للنسخ الاحتياطي','2020-02-27 05:33:53','2020-04-16 09:32:56'),
(26,0,'ar','alerts','backend.general.cancelled','تم الغاء التحديث','2020-02-27 05:33:53','2020-04-16 09:32:56'),
(27,0,'ar','alerts','backend.general.created','تم الإنشاء بنجاح.','2020-02-27 05:33:53','2020-04-16 09:32:56'),
(28,0,'ar','alerts','backend.general.deleted','حذف بنجاح.','2020-02-27 05:33:53','2020-04-16 09:32:56'),
(29,0,'ar','alerts','backend.general.error','هناك خطأ ما. حاول مرة أخري','2020-02-27 05:33:53','2020-04-16 09:32:56'),
(30,0,'ar','alerts','backend.general.restored','استعادة بنجاح.','2020-02-27 05:33:53','2020-04-16 09:32:56'),
(31,0,'ar','alerts','backend.general.unverified','لم يتم التحقق من ملفات التحديث.','2020-02-27 05:33:53','2020-04-16 09:32:56'),
(32,0,'ar','alerts','backend.general.updated','تم التحديث بنجاح.','2020-02-27 05:33:53','2020-04-16 09:32:56'),
(33,0,'ar','alerts','backend.general.delete_warning','لا يمكنك حذف المسار. الطلاب مسجلون بالفعل. إلغاء نشر الدورة التدريبية بدلاً من ذلك','2020-02-27 05:33:53','2020-04-16 09:32:56'),
(34,0,'ar','alerts','backend.general.delete_warning_bundle','لا يمكنك حذف حزمة. الطلاب مسجلون بالفعل. إلغاء نشر الحزمة بدلاً من ذلك','2020-02-27 05:33:53','2020-04-16 09:32:56'),
(35,0,'ar','alerts','backend.roles.created','تم إنشاء الدور بنجاح.','2020-02-27 05:33:53','2020-04-16 09:32:56'),
(36,0,'ar','alerts','backend.roles.deleted','تم حذف الدور بنجاح.','2020-02-27 05:33:53','2020-04-16 09:32:56'),
(37,0,'ar','alerts','backend.roles.updated','تم تحديث الدور بنجاح.','2020-02-27 05:33:53','2020-04-16 09:32:56'),
(38,0,'ar','alerts','backend.users.cant_resend_confirmation','تم تعيين التطبيق حاليًا للموافقة يدويًا على المستخدمين.','2020-02-27 05:33:53','2020-04-16 09:32:56'),
(39,0,'ar','alerts','backend.users.confirmation_email','تم إرسال رسالة تأكيد إلكترونية جديدة إلى العنوان في الملف.','2020-02-27 05:33:53','2020-04-16 09:32:56'),
(40,0,'ar','alerts','backend.users.confirmed','تم تأكيد المستخدم بنجاح.','2020-02-27 05:33:53','2020-04-16 09:32:56'),
(41,0,'ar','alerts','backend.users.created','تم إنشاء المستخدم بنجاح.','2020-02-27 05:33:53','2020-04-16 09:32:56'),
(42,0,'ar','alerts','backend.users.deleted','تم حذف المستخدم بنجاح.','2020-02-27 05:33:53','2020-04-16 09:32:56'),
(43,0,'ar','alerts','backend.users.deleted_permanently','تم حذف المستخدم بشكل دائم.','2020-02-27 05:33:53','2020-04-16 09:32:56'),
(44,0,'ar','alerts','backend.users.restored','تمت استعادة المستخدم بنجاح.','2020-02-27 05:33:53','2020-04-16 09:32:56'),
(45,0,'ar','alerts','backend.users.session_cleared','تم مسح جلسة المستخدم بنجاح.','2020-02-27 05:33:53','2020-04-16 09:32:56'),
(46,0,'ar','alerts','backend.users.social_deleted','تم حذف الحساب الاجتماعي بنجاح','2020-02-27 05:33:53','2020-04-16 09:32:56'),
(47,0,'ar','alerts','backend.users.unconfirmed','تم إلغاء تأكيد المستخدم بنجاح','2020-02-27 05:33:53','2020-04-16 09:32:56'),
(48,0,'ar','alerts','backend.users.updated','تم تحديث المستخدم بنجاح.','2020-02-27 05:33:53','2020-04-16 09:32:56'),
(49,0,'ar','alerts','backend.users.updated_password','تم تحديث كلمة المرور المستخدم بنجاح.','2020-02-27 05:33:53','2020-04-16 09:32:56'),
(50,0,'ar','alerts','frontend.contact.sent','تم إرسال المعلومات الخاصة بك بنجاح. سوف نرد مرة أخرى على البريد الإلكتروني المقدم بأسرع ما يمكن.','2020-02-27 05:33:53','2020-04-16 09:32:56'),
(51,0,'ar','alerts','frontend.course.completed','تهانينا! لقد أكملت الدورة بنجاح. بإمكانك الحصول على شهادة اتمام الدورة من لوحة القيادة','2020-02-27 05:33:53','2020-04-16 09:32:56'),
(52,0,'ar','auth','failed','خطأ في البريد الالكتروني أو كلمة المرور','2020-02-27 05:33:53','2020-04-16 09:33:27'),
(53,0,'ar','auth','general_error','ليس لديك حق الوصول للقيام بذلك.','2020-02-27 05:33:53','2020-04-16 09:33:27'),
(54,0,'ar','auth','password_rules','أقصر من اللازم (الحد الأدنى هو 8)\n ، ويجب أن تحتوي على حرف واحد كبير وحرف صغير ورقم واحد','2020-02-27 05:33:53','2020-04-16 09:33:27'),
(55,0,'ar','auth','password_used','لا يمكنك تعيين كلمة مرور استخدمتها من قبل.','2020-02-27 05:33:53','2020-04-16 09:33:27'),
(56,0,'ar','auth','socialite.unacceptable',': مزود ليس نوع تسجيل الدخول مقبول.','2020-02-27 05:33:53','2020-04-16 09:33:27'),
(57,0,'ar','auth','throttle','محاولات تسجيل الدخول كثيرة جدًا. يرجى المحاولة مرة أخرى بعد: ثوانٍ.','2020-02-27 05:33:53','2020-04-16 09:33:27'),
(58,0,'ar','auth','unknown','حدث خطأ غير معروف','2020-02-27 05:33:53','2020-04-16 09:33:27'),
(59,0,'ar','buttons','backend.access.users.activate','تفعيل','2020-02-27 05:33:53','2020-04-16 09:34:03'),
(60,0,'ar','buttons','backend.access.users.change_password','تغيير كلمة المرور','2020-02-27 05:33:53','2020-04-16 09:34:03'),
(61,0,'ar','buttons','backend.access.users.clear_session','الغاء الجلسة','2020-02-27 05:33:53','2020-04-16 09:34:03'),
(62,0,'ar','buttons','backend.access.users.confirm','تأكيد','2020-02-27 05:33:53','2020-04-16 09:34:03'),
(63,0,'ar','buttons','backend.access.users.deactivate','الغاء تفعيل المستخدم','2020-02-27 05:33:53','2020-04-16 09:34:03'),
(64,0,'ar','buttons','backend.access.users.delete_permanently','الحذف بشكل نهائي','2020-02-27 05:33:53','2020-04-16 09:34:03'),
(65,0,'ar','buttons','backend.access.users.login_as','تسجيل الدخول باسم: المستخدم','2020-02-27 05:33:53','2020-04-16 09:34:03'),
(66,0,'ar','buttons','backend.access.users.resend_email','أعد إرسال رسالة البريد الالكتروني الخاصة بالتأكيد','2020-02-27 05:33:53','2020-04-16 09:34:03'),
(67,0,'ar','buttons','backend.access.users.restore_user','استعادة المستخدم','2020-02-27 05:33:53','2020-04-16 09:34:03'),
(68,0,'ar','buttons','backend.access.users.unconfirm','الغاء التأكيد','2020-02-27 05:33:53','2020-04-16 09:34:03'),
(69,0,'ar','buttons','backend.access.users.unlink','فك ارتباط','2020-02-27 05:33:53','2020-04-16 09:34:03'),
(70,0,'ar','buttons','emails.auth.confirm_account','تأكيد الحساب','2020-02-27 05:33:53','2020-04-16 09:34:03'),
(71,0,'ar','buttons','emails.auth.reset_password','إعادة تعيين كلمة المرور','2020-02-27 05:33:53','2020-04-16 09:34:03'),
(72,0,'ar','buttons','general.cancel','إلغاء','2020-02-27 05:33:53','2020-04-16 09:34:03'),
(73,0,'ar','buttons','general.continue','استمر','2020-02-27 05:33:53','2020-04-16 09:34:03'),
(74,0,'ar','buttons','general.crud.create','أنشئ','2020-02-27 05:33:53','2020-04-16 09:34:03'),
(75,0,'ar','buttons','general.crud.delete','حذف','2020-02-27 05:33:53','2020-04-16 09:34:03'),
(76,0,'ar','buttons','general.crud.edit','تعديل','2020-02-27 05:33:53','2020-04-16 09:34:03'),
(77,0,'ar','buttons','general.crud.update','تحديث','2020-02-27 05:33:53','2020-04-16 09:34:03'),
(78,0,'ar','buttons','general.crud.view','اطلاع','2020-02-27 05:33:53','2020-04-16 09:34:03'),
(79,0,'ar','buttons','general.crud.generate','توفير','2020-02-27 05:33:53','2020-04-16 09:34:03'),
(80,0,'ar','buttons','general.save','حفظ','2020-02-27 05:33:53','2020-04-16 09:34:03'),
(81,0,'ar','buttons','general.view','اطلاع','2020-02-27 05:33:53','2020-04-16 09:34:03'),
(82,0,'ar','configmanager','title','ادارة التكوين','2020-02-27 05:33:53','2020-04-15 07:00:02'),
(83,0,'ar','configmanager','info_choose','اختر ملفًا لبدء التحرير','2020-02-27 05:33:53','2020-04-15 07:00:02'),
(84,0,'ar','configmanager','file','ملف','2020-02-27 05:33:53','2020-04-15 07:00:02'),
(85,0,'ar','configmanager','path','مسار','2020-02-27 05:33:53','2020-04-15 07:00:02'),
(86,0,'ar','configmanager','header.key','مفتاح','2020-02-27 05:33:54','2020-04-15 07:00:02'),
(87,0,'ar','configmanager','header.value','القيمة','2020-02-27 05:33:54','2020-04-15 07:00:02'),
(88,0,'ar','configmanager','header.actions','أجراءات','2020-02-27 05:33:54','2020-04-15 07:00:02'),
(89,0,'ar','configmanager','actions.edit','تصحيح','2020-02-27 05:33:54','2020-04-15 07:00:02'),
(90,0,'ar','configmanager','actions.confirm','حفظ مفتاح جديد','2020-02-27 05:33:54','2020-04-15 07:00:02'),
(91,0,'ar','configmanager','actions.save','حفظ!','2020-02-27 05:33:54','2020-04-15 07:00:02'),
(92,0,'ar','configmanager','actions.cancel','إلغاء','2020-02-27 05:33:54','2020-04-15 07:00:02'),
(93,0,'ar','configmanager','sure','هل أنت متأكد ؟','2020-02-27 05:33:54','2020-04-15 07:00:02'),
(94,0,'ar','datatable','colvis','اظهار القائمة','2020-02-27 05:33:54','2020-04-16 03:45:03'),
(95,0,'ar','datatable','csv','CSV','2020-02-27 05:33:54','2020-04-16 03:45:03'),
(96,0,'ar','datatable','pdf','PDF','2020-02-27 05:33:54','2020-04-16 03:45:03'),
(97,0,'ar','exceptions','backend.access.roles.already_exists','هذا الدور موجود بالفعل. يرجى اختيار اسم مختلف.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(98,0,'ar','exceptions','backend.access.roles.cant_delete_admin','لا يمكنك حذف دور المسؤول.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(99,0,'ar','exceptions','backend.access.roles.create_error','كانت هناك مشكلة في إنشاء هذا الدور. حاول مرة اخرى.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(100,0,'ar','exceptions','backend.access.roles.delete_error','حدثت مشكلة في حذف هذا الدور. حاول مرة اخرى.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(101,0,'ar','exceptions','backend.access.roles.has_users','لا يمكنك حذف دور مع المستخدمين المرتبطين.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(102,0,'ar','exceptions','backend.access.roles.needs_permission','يجب تحديد إذن واحد على الأقل لهذا الدور.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(103,0,'ar','exceptions','backend.access.roles.not_found','هذا الدور غير موجود.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(104,0,'ar','exceptions','backend.access.roles.update_error','حدثت مشكلة أثناء تحديث هذا الدور. حاول مرة اخرى.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(105,0,'ar','exceptions','backend.access.users.already_confirmed','تم تأكيد هذا المستخدم بالفعل.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(106,0,'ar','exceptions','backend.access.users.cant_confirm','حدثت مشكلة في تأكيد حساب المستخدم.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(107,0,'ar','exceptions','backend.access.users.cant_deactivate_self','لا يمكنك فعل ذلك بنفسك.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(108,0,'ar','exceptions','backend.access.users.cant_delete_admin','لا يمكنك حذف المسؤول.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(109,0,'ar','exceptions','backend.access.users.cant_delete_own_session','لا يمكنك حذف الجلسة الخاصة بك.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(110,0,'ar','exceptions','backend.access.users.cant_delete_self','لا يمكنك حذف نفسك.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(111,0,'ar','exceptions','backend.access.users.cant_restore','لا يتم حذف هذا المستخدم لذلك لا يمكن استعادته.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(112,0,'ar','exceptions','backend.access.users.cant_unconfirm_admin','لا يمكنك إلغاء تأكيد المسؤول الفائق.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(113,0,'ar','exceptions','backend.access.users.cant_unconfirm_self','لا يمكنك إلغاء تأكيد نفسك.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(114,0,'ar','exceptions','backend.access.users.create_error','حدثت مشكلة أثناء إنشاء هذا المستخدم. حاول مرة اخرى.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(115,0,'ar','exceptions','backend.access.users.delete_error','حدثت مشكلة في حذف هذا المستخدم. حاول مرة اخرى.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(116,0,'ar','exceptions','backend.access.users.delete_first','يجب حذف هذا المستخدم أولاً قبل إتلافه نهائيًا.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(117,0,'ar','exceptions','backend.access.users.email_error','البريد الإلكتروني مسجل سابقا','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(118,0,'ar','exceptions','backend.access.users.mark_error','حدثت مشكلة أثناء تحديث هذا المستخدم. حاول مرة اخرى.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(119,0,'ar','exceptions','backend.access.users.not_confirmed','لم يتم تأكيد هذا المستخدم.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(120,0,'ar','exceptions','backend.access.users.not_found','هذا المستخدم غير موجود.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(121,0,'ar','exceptions','backend.access.users.restore_error','حدثت مشكلة في استعادة هذا المستخدم. حاول مرة اخرى.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(122,0,'ar','exceptions','backend.access.users.role_needed','يجب عليك اختيار دور واحد على الأقل.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(123,0,'ar','exceptions','backend.access.users.role_needed_create','يجب عليك اختيار دور واحد على الأقل.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(124,0,'ar','exceptions','backend.access.users.session_wrong_driver','يجب ضبط برنامج تشغيل الجلسة على قاعدة البيانات لاستخدام هذه الميزة.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(125,0,'ar','exceptions','backend.access.users.social_delete_error','حدثت مشكلة أثناء إزالة الحساب الاجتماعي من المستخدم.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(126,0,'ar','exceptions','backend.access.users.update_error','حدثت مشكلة أثناء تحديث هذا المستخدم. حاول مرة اخرى.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(127,0,'ar','exceptions','backend.access.users.update_password_error','حدثت مشكلة أثناء تغيير كلمة مرور المستخدمين هذه. حاول مرة اخرى.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(128,0,'ar','exceptions','frontend.auth.confirmation.already_confirmed','تم تفعيل حسابك.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(129,0,'ar','exceptions','frontend.auth.confirmation.confirm','المرجو تفعيل الحساب','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(130,0,'ar','exceptions','frontend.auth.confirmation.created_confirm','تم إنشاء حسابك بنجاح. لقد أرسلنا لك بريد إلكتروني لتفعيل حسابك.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(131,0,'ar','exceptions','frontend.auth.confirmation.created_pending','تم إنشاء حسابك بنجاح وهو في انتظار الموافقة. سيتم إرسال بريد إلكتروني عند الموافقة على حسابك.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(132,0,'ar','exceptions','frontend.auth.confirmation.mismatch','رمز التأكيد الخاص بك غير متطابق.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(133,0,'ar','exceptions','frontend.auth.confirmation.not_found','رمز التأكيد هذا غير موجود.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(134,0,'ar','exceptions','frontend.auth.confirmation.pending','حسابك في انتظار الموافقة حاليًا.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(135,0,'ar','exceptions','frontend.auth.confirmation.resend','حسابك غير مؤكد يرجى الضغط على رابط التأكيد في بريدك الإلكتروني ، أو <a href=\":url\">click انقر هنا </a> لإعادة إرسال رسالة التأكيد الإلكترونية.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(136,0,'ar','exceptions','frontend.auth.confirmation.resent','تم إرسال رسالة تأكيد إلكترونية جديدة إلى العنوان في الملف.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(137,0,'ar','exceptions','frontend.auth.confirmation.success','تم تأكيد حسابك بنجاح!','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(138,0,'ar','exceptions','frontend.auth.deactivated','حسابك تم اقفاله.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(139,0,'ar','exceptions','frontend.auth.email_taken','سبق لكم التسجيل بهذا البريد الإلكتروني','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(140,0,'ar','exceptions','frontend.auth.password.change_mismatch','كلمة المرور القديمة غير متطابقة','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(141,0,'ar','exceptions','frontend.auth.password.reset_problem','حدثت مشكلة في إعادة تعيين كلمة المرور الخاصة بك. يرجى إعادة إرسال البريد الإلكتروني لإعادة تعيين كلمة المرور.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(142,0,'ar','exceptions','frontend.auth.registration_disabled','التسجيل مغلق حاليًا.','2020-02-27 05:33:54','2020-04-16 03:47:03'),
(143,0,'ar','http','404.back','العودة إلى الصفحة الرئيسية','2020-02-27 05:33:54','2020-04-15 07:08:27'),
(144,0,'ar','http','404.description','نعتذر الصفحة غير متاحة','2020-02-27 05:33:54','2020-04-15 07:08:27'),
(145,0,'ar','http','404.description2','نعتذر الصفحة غير متاحة','2020-02-27 05:33:54','2020-04-15 07:08:27'),
(146,0,'ar','http','404.title','الصفحة غير موجودة','2020-02-27 05:33:54','2020-04-15 07:08:27'),
(147,0,'ar','http','404.title2','404','2020-02-27 05:33:54','2020-04-15 07:08:27'),
(148,0,'ar','http','503.description','تم ارسال الملاحظة لإدارة الموقع','2020-02-27 05:33:54','2020-04-15 07:08:27'),
(149,0,'ar','http','503.title','تم ارسال الملاحظة لإدارة الموقع','2020-02-27 05:33:54','2020-04-15 07:08:27'),
(150,0,'ar','labels','backend.access.roles.create','خلق دور','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(151,0,'ar','labels','backend.access.roles.edit','تحرير الدور','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(152,0,'ar','labels','backend.access.roles.management','إدارة الدور','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(153,0,'ar','labels','backend.access.roles.table.number_of_users','عدد المستخدمين','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(154,0,'ar','labels','backend.access.roles.table.permissions','أذونات','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(155,0,'ar','labels','backend.access.roles.table.role','وظيفة','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(156,0,'ar','labels','backend.access.roles.table.sort','ترتيب','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(157,0,'ar','labels','backend.access.roles.table.total','مجموع الأدوار |','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(158,0,'ar','labels','backend.access.users.active','المستخدمين النشطين','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(159,0,'ar','labels','backend.access.users.all_permissions','جميع الأذونات','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(160,0,'ar','labels','backend.access.users.change_password','غير كلمة المرور','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(161,0,'ar','labels','backend.access.users.change_password_for','تغيير كلمة المرور لـ :user','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(162,0,'ar','labels','backend.access.users.create','إنشاء مستخدم','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(163,0,'ar','labels','backend.access.users.deactivated','المستخدمين المعطلين','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(164,0,'ar','labels','backend.access.users.deleted','حذف المستخدمين','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(165,0,'ar','labels','backend.access.users.edit','تحرير العضو','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(166,0,'ar','labels','backend.access.users.management','إدارةالمستخدم','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(167,0,'ar','labels','backend.access.users.no_permissions','لا أذونات','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(168,0,'ar','labels','backend.access.users.no_roles','لا أدوار لتعيين.','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(169,0,'ar','labels','backend.access.users.permissions','أذونات','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(170,0,'ar','labels','backend.access.users.table.abilities','قدرات','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(171,0,'ar','labels','backend.access.users.table.confirmed','تم تأكيد','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(172,0,'ar','labels','backend.access.users.table.created','تم الإنشاء','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(173,0,'ar','labels','backend.access.users.table.email','البريد الإلكتروني','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(174,0,'ar','labels','backend.access.users.table.first_name','الاسم الاول','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(175,0,'ar','labels','backend.access.users.table.id','هوية شخصية','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(176,0,'ar','labels','backend.access.users.table.last_name','اسم العائلة','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(177,0,'ar','labels','backend.access.users.table.last_updated','آخر تحديث','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(178,0,'ar','labels','backend.access.users.table.name','اسم','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(179,0,'ar','labels','backend.access.users.table.no_deactivated','لا المستخدمين المعطلين','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(180,0,'ar','labels','backend.access.users.table.no_deleted','لا يوجد مستخدمين محذوفين','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(181,0,'ar','labels','backend.access.users.table.other_permissions','أذونات أخرى','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(182,0,'ar','labels','backend.access.users.table.permissions','أذونات','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(183,0,'ar','labels','backend.access.users.table.roles','الأدوار','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(184,0,'ar','labels','backend.access.users.table.social','اجتماعي','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(185,0,'ar','labels','backend.access.users.table.status','الحالة','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(186,0,'ar','labels','backend.access.users.table.total','مجموع المستخدمين | مجموع المستخدمين','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(187,0,'ar','labels','backend.access.users.tabs.content.overview.avatar','الصورة الرمزية','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(188,0,'ar','labels','backend.access.users.tabs.content.overview.confirmed','تم تأكيد','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(189,0,'ar','labels','backend.access.users.tabs.content.overview.created_at','تم التسجيل في','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(190,0,'ar','labels','backend.access.users.tabs.content.overview.deleted_at','تم الحذف في','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(191,0,'ar','labels','backend.access.users.tabs.content.overview.email','البريد الإلكتروني','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(192,0,'ar','labels','backend.access.users.tabs.content.overview.first_name','الاسم الاول','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(193,0,'ar','labels','backend.access.users.tabs.content.overview.last_login_at','آخر تسجيل دخول في','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(194,0,'ar','labels','backend.access.users.tabs.content.overview.last_login_ip','آخر تسجيل دخول IP','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(195,0,'ar','labels','backend.access.users.tabs.content.overview.last_name','اسم العائلة','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(196,0,'ar','labels','backend.access.users.tabs.content.overview.last_updated','آخر تحديث','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(197,0,'ar','labels','backend.access.users.tabs.content.overview.name','اسم','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(198,0,'ar','labels','backend.access.users.tabs.content.overview.status','الحالة','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(199,0,'ar','labels','backend.access.users.tabs.content.overview.timezone','وحدة زمنية','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(200,0,'ar','labels','backend.access.users.tabs.titles.history','التاريخ','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(201,0,'ar','labels','backend.access.users.tabs.titles.overview','نظرة عامة','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(202,0,'ar','labels','backend.access.users.user_actions','إجراءات المستخدم','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(203,0,'ar','labels','backend.access.users.view','عرض المستخدم','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(204,0,'ar','labels','backend.access.users.select_role','اختر الدور','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(205,0,'ar','labels','backend.backup.api_key','مفتاح API','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(206,0,'ar','labels','backend.backup.api_secret','سر API','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(207,0,'ar','labels','backend.backup.app_key','مفتاح التطبيق','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(208,0,'ar','labels','backend.backup.app_secret','سر التطبيق','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(209,0,'ar','labels','backend.backup.app_token','رمز التطبيق','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(210,0,'ar','labels','backend.backup.aws','AWS S3','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(211,0,'ar','labels','backend.backup.backup_files','ملفات النسخ الاحتياطي','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(212,0,'ar','labels','backend.backup.backup_note','<b> ملاحظة </b>: لتشغيل هذه النسخة الاحتياطية بشكل صحيح ، يلزمك إضافة الكود التالي إلى  <b>CRON TAB:</b><br><code>* * * * * cd /path-to-your-project && php artisan schedule:run >> /dev/null 2>&1</code>','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(213,0,'ar','labels','backend.backup.backup_notice','يرجى الرجوع الوثائق قبل بدء النسخ الاحتياطي. لديها كل التفاصيل خطوة بخطوة لإنشاء نسخة احتياطية مع Dropbox.','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(214,0,'ar','labels','backend.backup.backup_schedule','جدول النسخ الاحتياطي','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(215,0,'ar','labels','backend.backup.backup_type','نوع النسخ الاحتياطي','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(216,0,'ar','labels','backend.backup.bucket_name','اسم الحافظة','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(217,0,'ar','labels','backend.backup.configuration','ترتيب','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(218,0,'ar','labels','backend.backup.daily','اليومي','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(219,0,'ar','labels','backend.backup.db','قاعدة البيانات','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(220,0,'ar','labels','backend.backup.db_app','ملفات قاعدة البيانات والتطبيق','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(221,0,'ar','labels','backend.backup.db_storage','ملفات قاعدة البيانات والتخزين','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(222,0,'ar','labels','backend.backup.dropbox','Dropbox','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(223,0,'ar','labels','backend.backup.dropbox_note','يرجى الخروج من وثائق <b> كيفية الحصول على مفاتيح تطبيق DropBox؟ </b>','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(224,0,'ar','labels','backend.backup.email','إشعار البريد الإلكتروني','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(225,0,'ar','labels','backend.backup.enable_disable','مفعل وغير مفعل','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(226,0,'ar','labels','backend.backup.generate_backup','توليد النسخ الاحتياطي','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(227,0,'ar','labels','backend.backup.monthly','شهريا','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(228,0,'ar','labels','backend.backup.region','منطقة','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(229,0,'ar','labels','backend.backup.title','دعم','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(230,0,'ar','labels','backend.backup.weekly','أسبوعي','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(231,0,'ar','labels','backend.blogs.create','انشاء مدونة','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(232,0,'ar','labels','backend.blogs.edit','تحرير المدونة','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(233,0,'ar','labels','backend.blogs.fields.category','الفئة','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(234,0,'ar','labels','backend.blogs.fields.clear','واضح','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(235,0,'ar','labels','backend.blogs.fields.comments','تعليقات','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(236,0,'ar','labels','backend.blogs.fields.content','يحتوى','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(237,0,'ar','labels','backend.blogs.fields.created','خلقت','2020-02-27 05:33:54','2020-04-19 12:52:12'),
(238,0,'ar','labels','backend.blogs.fields.created_at','تم إنشاؤها على','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(239,0,'ar','labels','backend.blogs.fields.featured_image','اضافة صورة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(240,0,'ar','labels','backend.blogs.fields.meta_description','الوصف الإضافي','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(241,0,'ar','labels','backend.blogs.fields.meta_keywords','كلمات دلالية','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(242,0,'ar','labels','backend.blogs.fields.meta_title','عنوان الوصف الإضافي','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(243,0,'ar','labels','backend.blogs.fields.publish','للنشر','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(244,0,'ar','labels','backend.blogs.fields.slug','العنوان الفرعي','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(245,0,'ar','labels','backend.blogs.fields.status','الحالة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(246,0,'ar','labels','backend.blogs.fields.tags','الكلمات','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(247,0,'ar','labels','backend.blogs.fields.tags_placeholder','إضافة العلامات هنا','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(248,0,'ar','labels','backend.blogs.fields.title','عنوان','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(249,0,'ar','labels','backend.blogs.fields.views','المشاهدات','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(250,0,'ar','labels','backend.blogs.max_file_size','(الحد الأقصى لحجم الملف 10 ميغابايت)','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(251,0,'ar','labels','backend.blogs.title','مدونة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(252,0,'ar','labels','backend.blogs.view','عرض المدونات','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(253,0,'ar','labels','backend.categories.create','إنشاء فئة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(254,0,'ar','labels','backend.categories.edit','تحرير الفئة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(255,0,'ar','labels','backend.categories.fields.courses','الدورات','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(256,0,'ar','labels','backend.categories.fields.icon','أيقونة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(257,0,'ar','labels','backend.categories.fields.icon_type.icon','اختر أيقونة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(258,0,'ar','labels','backend.categories.fields.icon_type.image','تحميل الصور','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(259,0,'ar','labels','backend.categories.fields.icon_type.select_any','اختر','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(260,0,'ar','labels','backend.categories.fields.icon_type.title','نوع الأيقونة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(261,0,'ar','labels','backend.categories.fields.image','صورة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(262,0,'ar','labels','backend.categories.fields.name','اسم','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(263,0,'ar','labels','backend.categories.fields.or','أو','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(264,0,'ar','labels','backend.categories.fields.select_icon','اختر أيقونة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(265,0,'ar','labels','backend.categories.fields.slug','عنوان فرعي','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(266,0,'ar','labels','backend.categories.fields.status','الحالة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(267,0,'ar','labels','backend.categories.fields.blog','مدونة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(268,0,'ar','labels','backend.categories.title','الاقسام','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(269,0,'ar','labels','backend.categories.view','عرض الفئات','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(270,0,'ar','labels','backend.categories.not_allowed','غير مسموح! الفئة تحتوي على البيانات.','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(271,0,'ar','labels','backend.courses.fields.slug','العنوان الإضافي','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(272,0,'ar','labels','backend.courses.fields.status','الحالة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(273,0,'ar','labels','backend.courses.fields.category','الفئة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(274,0,'ar','labels','backend.courses.fields.course','دورة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(275,0,'ar','labels','backend.courses.fields.course_image','صورة الدورة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(276,0,'ar','labels','backend.courses.fields.description','التوصيف','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(277,0,'ar','labels','backend.courses.fields.featured','متميز','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(278,0,'ar','labels','backend.courses.fields.lessons.add','أضف دروس','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(279,0,'ar','labels','backend.courses.fields.lessons.view','عرض الدروس','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(280,0,'ar','labels','backend.courses.fields.meta_description','التوصيف الإضافي','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(281,0,'ar','labels','backend.courses.fields.meta_keywords','كلمات دلالية','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(282,0,'ar','labels','backend.courses.fields.meta_title','عنوان التوصيف الإضافي','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(283,0,'ar','labels','backend.courses.fields.popular','متميزة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(284,0,'ar','labels','backend.courses.fields.price','السعر','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(285,0,'ar','labels','backend.courses.fields.published','للنشر','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(286,0,'ar','labels','backend.courses.fields.sidebar','أضف الشريط الجانبي','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(287,0,'ar','labels','backend.courses.fields.start_date','تاريخ البدء','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(288,0,'ar','labels','backend.courses.fields.teachers','المدربون','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(289,0,'ar','labels','backend.courses.fields.title','عنوان','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(290,0,'ar','labels','backend.courses.fields.trending','متداول','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(291,0,'ar','labels','backend.courses.fields.free','مجانا','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(292,0,'ar','labels','backend.courses.add_categories','إضافة فئات','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(293,0,'ar','labels','backend.courses.add_teachers','إضافة المدربين','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(294,0,'ar','labels','backend.courses.category','الفئة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(295,0,'ar','labels','backend.courses.course_timeline','الجدول الزمني للدورة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(296,0,'ar','labels','backend.courses.create','إنشاء دورة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(297,0,'ar','labels','backend.courses.edit','تحرير الدورة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(298,0,'ar','labels','backend.courses.lesson','درس','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(299,0,'ar','labels','backend.courses.listing_note','سيتم عرض و ترتيب الدروس المنشورة فقط.','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(300,0,'ar','labels','backend.courses.save_timeline','حفظ الجدول الزمني','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(301,0,'ar','labels','backend.courses.select_category','اختر الفئة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(302,0,'ar','labels','backend.courses.select_teachers','اختر المدربين','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(303,0,'ar','labels','backend.courses.slug_placeholder','ادخل العنوان الفرعي او سوف يتم انشاءه تلقائيا','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(304,0,'ar','labels','backend.courses.test','اختبار','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(305,0,'ar','labels','backend.courses.timeline_description','سحب وتغيير تسلسل الدروس / الاختبارات بالطبع','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(306,0,'ar','labels','backend.courses.title','الدورات','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(307,0,'ar','labels','backend.courses.view','عرض الدورات','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(308,0,'ar','labels','backend.lessons.fields.slug','العنوان الفرعي','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(309,0,'ar','labels','backend.lessons.fields.add_audio','إضافة الصوت','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(310,0,'ar','labels','backend.lessons.fields.add_pdf','إضافة PDF','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(311,0,'ar','labels','backend.lessons.fields.add_video','أضف فيديو','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(312,0,'ar','labels','backend.lessons.fields.course','دورة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(313,0,'ar','labels','backend.lessons.fields.downloadable_files','ملفات قابلة للتحميل','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(314,0,'ar','labels','backend.lessons.fields.free_lesson','الدرس المجاني','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(315,0,'ar','labels','backend.lessons.fields.full_text','نص كامل','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(316,0,'ar','labels','backend.lessons.fields.lesson_image','صورة الدرس','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(317,0,'ar','labels','backend.lessons.fields.media_audio','صوت الوسائط','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(318,0,'ar','labels','backend.lessons.fields.media_pdf','قوات الدفاع الشعبي وسائل الإعلام','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(319,0,'ar','labels','backend.lessons.fields.media_video','فيديو وسائط','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(320,0,'ar','labels','backend.lessons.fields.position','موضع','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(321,0,'ar','labels','backend.lessons.fields.published','نشرت','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(322,0,'ar','labels','backend.lessons.fields.short_text','نص قصير','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(323,0,'ar','labels','backend.lessons.fields.title','عنوان','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(324,0,'ar','labels','backend.lessons.fields.youtube_videos','يوتيوب فيديو','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(325,0,'ar','labels','backend.lessons.create','إنشاء الدرس','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(326,0,'ar','labels','backend.lessons.edit','تحرير الدرس','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(327,0,'ar','labels','backend.lessons.enter_video_embed_code','أدخل رمز تضمين الفيديو','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(328,0,'ar','labels','backend.lessons.enter_video_url','أدخل بيانات الفيديو','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(329,0,'ar','labels','backend.lessons.max_file_size','(حجم الملف الأقصى 5 ميجابايت)','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(330,0,'ar','labels','backend.lessons.remove','إزالة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(331,0,'ar','labels','backend.lessons.select_course','اختر الدورة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(332,0,'ar','labels','backend.lessons.short_description_placeholder','إدخال وصف قصير للدرس','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(333,0,'ar','labels','backend.lessons.slug_placeholder','ادخل العنوان الفرعي او سوف يتم انشاءه تلقائيا','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(334,0,'ar','labels','backend.lessons.title','الدروس','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(335,0,'ar','labels','backend.lessons.video_guide','<p class = \"mb-1\"> <b> Youtube: </b> اذهب إلى Youtube -> اذهب إلى الفيديو الذي تريد عرضه -> انقر على زر المشاركة أسفل الفيديو. انسخ تلك الروابط والصقها في مربع النص أعلاه </p>\n<p class = \"mb-1\"> <b> Vimeo: </b> اذهب إلى Vimeo -> اذهب إلى الفيديو الذي تريد عرضه -> انقر على زر المشاركة وانسخ عنوان url للفيديو هنا </p>\n<p class = \"mb-1\"> <b> تحميل: </b> تحميل ملف <b> mp4 </b> في إدخال الملف </p>\n<p class = \"mb-1\"> <b> تضمين: </b> نسخ / لصق رمز التضمين في مربع النص أعلاه </p>','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(336,0,'ar','labels','backend.lessons.view','عرض الدروس','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(337,0,'ar','labels','backend.lessons.vimeo_note','<b> تعليمات لإضافة رابط فيديو: </b> <br> انتقل إلى vimeo -> فيديو مفتوح -> انقر بزر الماوس الأيمن على الفيديو و <b> نسخ عنوان URL للفيديو </b> والصقه هنا. <br> لإضافة مقاطع فيديو متعددة ، قم بفصلها باستخدام علامة <b> و </b> (فاصلة).','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(338,0,'ar','labels','backend.lessons.yt_note','<b> تعليمات لإضافة رابط فيديو: </b> <br> انتقل إلى youtube -> open video -> انقر بزر الماوس الأيمن على الفيديو و <b> نسخ عنوان URL للفيديو </b> والصقه هنا. <br> لإضافة مقاطع فيديو متعددة ، قم بفصلها باستخدام علامة <b> و </b> (فاصلة).','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(339,0,'ar','labels','backend.pages.fields.slug','العنوان الفرعي','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(340,0,'ar','labels','backend.pages.fields.status','الحالة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(341,0,'ar','labels','backend.pages.fields.clear','واضح','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(342,0,'ar','labels','backend.pages.fields.content','يحتوى','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(343,0,'ar','labels','backend.pages.fields.created','خلقت','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(344,0,'ar','labels','backend.pages.fields.created_at','تم إنشاؤها على','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(345,0,'ar','labels','backend.pages.fields.drafted','صاغت','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(346,0,'ar','labels','backend.pages.fields.featured_image','صورة مميزة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(347,0,'ar','labels','backend.pages.fields.meta_description','ميتا الوصف','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(348,0,'ar','labels','backend.pages.fields.meta_keywords','كلمات دلالية','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(349,0,'ar','labels','backend.pages.fields.meta_title','عنوان الفوقية','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(350,0,'ar','labels','backend.pages.fields.published','نشرت','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(351,0,'ar','labels','backend.pages.fields.title','عنوان','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(352,0,'ar','labels','backend.pages.create','إنشاء صفحة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(353,0,'ar','labels','backend.pages.edit','تعديل الصفحة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(354,0,'ar','labels','backend.pages.max_file_size','(الحد الأقصى لحجم الملف 10 ميغابايت)','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(355,0,'ar','labels','backend.pages.title','صفحات','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(356,0,'ar','labels','backend.pages.view','عرض الصفحات','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(357,0,'ar','labels','backend.faqs.fields.status','الحالة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(358,0,'ar','labels','backend.faqs.fields.answer','إجابة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(359,0,'ar','labels','backend.faqs.fields.category','الفئة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(360,0,'ar','labels','backend.faqs.fields.question','سؤال','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(361,0,'ar','labels','backend.faqs.create','إنشاء التعليمات','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(362,0,'ar','labels','backend.faqs.edit','تحرير التعليمات','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(363,0,'ar','labels','backend.faqs.title','أسئلة وأجوبة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(364,0,'ar','labels','backend.faqs.view','عرض الأسئلة الشائعة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(365,0,'ar','labels','backend.hero_slider.fields.status','الحالة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(366,0,'ar','labels','backend.hero_slider.fields.bg_image','صورة BG','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(367,0,'ar','labels','backend.hero_slider.fields.buttons.add','إضافة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(368,0,'ar','labels','backend.hero_slider.fields.buttons.label','ضع الكلمة المناسبة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(369,0,'ar','labels','backend.hero_slider.fields.buttons.link','حلقة الوصل','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(370,0,'ar','labels','backend.hero_slider.fields.buttons.name','زر','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(371,0,'ar','labels','backend.hero_slider.fields.buttons.note','ملاحظة: يمكن إضافة 4 أزرار كحد أقصى. يرجى إضافة التصنيف والرابط للزر لإعادة توجيه الإجراء عند النقر فوق الزر.','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(372,0,'ar','labels','backend.hero_slider.fields.buttons.placeholder','إضافة عدد من الأزرار التي تريد إضافتها','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(373,0,'ar','labels','backend.hero_slider.fields.buttons.title','وصفت','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(374,0,'ar','labels','backend.hero_slider.fields.hero_text','نص البطل','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(375,0,'ar','labels','backend.hero_slider.fields.name','اسم','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(376,0,'ar','labels','backend.hero_slider.fields.overlay.note','إذا قمت بتشغيله. سيتم عرض تراكب أسود على صورتك. سيكون مفيدًا عندما لا تكون صورة BG أغمق أو لا تحتوي على تراكب','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(377,0,'ar','labels','backend.hero_slider.fields.overlay.title','غطاء','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(378,0,'ar','labels','backend.hero_slider.fields.sequence','تسلسل','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(379,0,'ar','labels','backend.hero_slider.fields.sub_text','النص الفرعي','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(380,0,'ar','labels','backend.hero_slider.fields.widget.countdown_timer','العد التنازلي','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(381,0,'ar','labels','backend.hero_slider.fields.widget.input_date_time','تاريخ الإدخال والوقت','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(382,0,'ar','labels','backend.hero_slider.fields.widget.search_bar','شريط البحث','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(383,0,'ar','labels','backend.hero_slider.fields.widget.select_widget','حدد القطعة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(384,0,'ar','labels','backend.hero_slider.fields.widget.title','القطعة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(385,0,'ar','labels','backend.hero_slider.create','إنشاء شريحة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(386,0,'ar','labels','backend.hero_slider.edit','تحرير الشرائح','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(387,0,'ar','labels','backend.hero_slider.manage_sequence','إدارة تسلسل الشرائح','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(388,0,'ar','labels','backend.hero_slider.note','ملاحظة: يرجى تحميل .jpg أو .png بدقة <b> 1920 × 900 </b> للحصول على أفضل نتيجة استخدم صور أغمق أو متراكبة للحصول على نتيجة أفضل.','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(389,0,'ar','labels','backend.hero_slider.off','إيقاف','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(390,0,'ar','labels','backend.hero_slider.on','على','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(391,0,'ar','labels','backend.hero_slider.save_sequence','حفظ التسلسل','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(392,0,'ar','labels','backend.hero_slider.sequence_note','سحب وتغيير تسلسل الشريحة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(393,0,'ar','labels','backend.hero_slider.title','بطل المتزلج','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(394,0,'ar','labels','backend.hero_slider.view','عرض الشرائح','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(395,0,'ar','labels','backend.reasons.fields.status','الحالة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(396,0,'ar','labels','backend.reasons.fields.content','يحتوى','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(397,0,'ar','labels','backend.reasons.fields.icon','أيقونة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(398,0,'ar','labels','backend.reasons.fields.title','عنوان','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(399,0,'ar','labels','backend.reasons.create','خلق السبب','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(400,0,'ar','labels','backend.reasons.edit','تحرير السبب','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(401,0,'ar','labels','backend.reasons.note','سيتم عرض الأسباب كمنزلق على الصفحة الرئيسية أدناه','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(402,0,'ar','labels','backend.reasons.title','أسباب','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(403,0,'ar','labels','backend.reasons.view','عرض الأسباب','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(404,0,'ar','labels','backend.sponsors.fields.status','الحالة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(405,0,'ar','labels','backend.sponsors.fields.link','حلقة الوصل','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(406,0,'ar','labels','backend.sponsors.fields.logo','شعار','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(407,0,'ar','labels','backend.sponsors.fields.name','اسم','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(408,0,'ar','labels','backend.sponsors.create','إنشاء الرعاة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(409,0,'ar','labels','backend.sponsors.edit','تحرير الرعاة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(410,0,'ar','labels','backend.sponsors.title','الرعاة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(411,0,'ar','labels','backend.sponsors.view','عرض الرعاة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(412,0,'ar','labels','backend.teachers.fields.status','الحالة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(413,0,'ar','labels','backend.teachers.fields.email','البريد الإلكتروني','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(414,0,'ar','labels','backend.teachers.fields.first_name','الاسم الأول','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(415,0,'ar','labels','backend.teachers.fields.image','صورة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(416,0,'ar','labels','backend.teachers.fields.last_name','الكنية','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(417,0,'ar','labels','backend.teachers.fields.password','كلمه المرور','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(418,0,'ar','labels','backend.teachers.create','اضافة مدرب','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(419,0,'ar','labels','backend.teachers.edit','تعديل المدرب','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(420,0,'ar','labels','backend.teachers.title','معلمون','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(421,0,'ar','labels','backend.teachers.view','عرض المدربين','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(422,0,'ar','labels','backend.testimonials.fields.status','الحالة','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(423,0,'ar','labels','backend.testimonials.fields.content','يحتوى','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(424,0,'ar','labels','backend.testimonials.fields.name','اسم','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(425,0,'ar','labels','backend.testimonials.fields.occupation','الاحتلال','2020-02-27 05:33:55','2020-04-19 12:52:12'),
(426,0,'ar','labels','backend.testimonials.create','إنشاء التزكية','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(427,0,'ar','labels','backend.testimonials.edit','تحرير التزكية','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(428,0,'ar','labels','backend.testimonials.title','الشهادات - التوصيات','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(429,0,'ar','labels','backend.testimonials.view','عرض الشهادات','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(430,0,'ar','labels','backend.contacts.fields.email','البريد الإلكتروني','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(431,0,'ar','labels','backend.contacts.fields.message','الرسالة','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(432,0,'ar','labels','backend.contacts.fields.name','اسم','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(433,0,'ar','labels','backend.contacts.fields.phone','رقم التواصل','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(434,0,'ar','labels','backend.contacts.fields.time','الوقت','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(435,0,'ar','labels','backend.contacts.title','العملاء','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(436,0,'ar','labels','backend.dashboard.amount','كمية','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(437,0,'ar','labels','backend.dashboard.buy_course_now','التسجيل بالدورة','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(438,0,'ar','labels','backend.dashboard.completed','منجز','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(439,0,'ar','labels','backend.dashboard.course','دورة','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(440,0,'ar','labels','backend.dashboard.courses','الدورات','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(441,0,'ar','labels','backend.dashboard.email','البريد الإلكتروني','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(442,0,'ar','labels','backend.dashboard.message','الرسالة','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(443,0,'ar','labels','backend.dashboard.message_by','رسالة بواسطة','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(444,0,'ar','labels','backend.dashboard.name','اسم','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(445,0,'ar','labels','backend.dashboard.no_data','لا يوجد بيانات','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(446,0,'ar','labels','backend.dashboard.ordered_by','مرتبة حسب','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(447,0,'ar','labels','backend.dashboard.recent_contact_requests','طلبات الاتصال الحديثة','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(448,0,'ar','labels','backend.dashboard.recent_contacts','الاتصالات الأخيرة','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(449,0,'ar','labels','backend.dashboard.recent_messages','الرسائل الحديثة','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(450,0,'ar','labels','backend.dashboard.recent_orders','الطلبيات الأخيرة','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(451,0,'ar','labels','backend.dashboard.recent_reviews','المراجعات الأخيرة','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(452,0,'ar','labels','backend.dashboard.review','إعادة النظر','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(453,0,'ar','labels','backend.dashboard.students','الطلاب','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(454,0,'ar','labels','backend.dashboard.students_enrolled','التحق الطلاب بـ <br> الدورات التدريبية الخاصة بك','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(455,0,'ar','labels','backend.dashboard.teachers','المدربون','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(456,0,'ar','labels','backend.dashboard.time','زمن','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(457,0,'ar','labels','backend.dashboard.title','لوحة الإعدادات','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(458,0,'ar','labels','backend.dashboard.trending','المتداول','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(459,0,'ar','labels','backend.dashboard.view','رأي','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(460,0,'ar','labels','backend.dashboard.view_all','عرض الكل','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(461,0,'ar','labels','backend.dashboard.your_courses','الدورات الخاصة بك','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(462,0,'ar','labels','backend.dashboard.my_course_bundles','المسارات المهنية المسجل بها','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(463,0,'ar','labels','backend.dashboard.my_courses','دوراتي','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(464,0,'ar','labels','backend.dashboard.course_and_bundles','الدورات و المسارات','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(465,0,'ar','labels','backend.dashboard.your_courses_and_bundles','الدورات الخاصة بك و المسارات','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(466,0,'ar','labels','backend.dashboard.pending','قيد الانتظار','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(467,0,'ar','labels','backend.dashboard.pending_orders','أوامر معلقة','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(468,0,'ar','labels','backend.dashboard.success','نجاح','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(469,0,'ar','labels','backend.dashboard.failed','فشل','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(470,0,'ar','labels','backend.general_settings.app_locale','لغة التطبيق','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(471,0,'ar','labels','backend.general_settings.app_name','اسم التطبيق','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(472,0,'ar','labels','backend.general_settings.app_timezone','التطبيق المنطقة الزمنية','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(473,0,'ar','labels','backend.general_settings.app_url','عنوان URL للتطبيق','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(474,0,'ar','labels','backend.general_settings.captcha','ما إذا كان التسجيل - تسجيل الدخول captcha أو إيقاف تشغيله','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(475,0,'ar','labels','backend.general_settings.captcha_note','كيفية الحصول على بيانات اعتماد Google reCaptcha؟','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(476,0,'ar','labels','backend.general_settings.captcha_site_key','مفتاح التحقق','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(477,0,'ar','labels','backend.general_settings.captcha_site_secret','كلمة التحقق السرية','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(478,0,'ar','labels','backend.general_settings.captcha_status','وضع كلمة التحقق','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(479,0,'ar','labels','backend.general_settings.change_email','تغيير الايميل','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(480,0,'ar','labels','backend.general_settings.confirm_email','تأكيد عنوان البريد الإلكتروني','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(481,0,'ar','labels','backend.general_settings.contact.location_on_map','الموقع على الخريطة','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(482,0,'ar','labels','backend.general_settings.contact.map_note','<ol class=\"map-guide\">\n<li>اذهب إلى <a class=\"text-bold\" target=\"_blank\" href=\"//maps.google.com\">خرائط جوجل</a> </li>\n<li>ابحث في المكان الذي تريد إضافته عن طريق إدخال العنوان / الموقع في مربع الإدخال الموجود في الركن الأيمن العلوي</li>\n<li>بمجرد الحصول على المكان الذي تريده. هذا يظهر التفاصيل في الشريط الجانبي الأيسر. انقر فوق <i class = \"fa fa-share-alt text-primary\"> زر </i></li>\n<li>ستظهر نافذة منبثقة تحتوي على علامتي تبويب <b> إرسال رابط </b> و <b> تضمين خريطة </b></li>\n<li>انقر فوق <b> تضمين خريطة </b> ستظهر لك اختيار \"مكان على الخريطة\"</li>\n<li>الآن انقر على القائمة المنسدلة من اليسار. بشكل افتراضي ، يتم تحديد <b> متوسط </b>. انقر عليها واختر <b> كبير </b></li>\n<li>الآن انقر على رابط <b class = \"text-primary\"> COPY HTML </b> منه و <b> لصق </b> هذا الرمز هنا في <b> الموقع على الخريطة </b>.</li>\n </ol>','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(483,0,'ar','labels','backend.general_settings.contact.primary_address','العنوان الرئيسي','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(484,0,'ar','labels','backend.general_settings.contact.primary_email','البريد الإلكتروني الرئيسي','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(485,0,'ar','labels','backend.general_settings.contact.primary_email_note','سيتم استخدام هذا البريد الإلكتروني لمطابقة رسائل البريد الإلكتروني \"اتصل بنا\"','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(486,0,'ar','labels','backend.general_settings.contact.primary_phone','الهاتف الرئيسي','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(487,0,'ar','labels','backend.general_settings.contact.secondary_address','العنوان الثانوي','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(488,0,'ar','labels','backend.general_settings.contact.secondary_email','البريد الإلكتروني الثانوي','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(489,0,'ar','labels','backend.general_settings.contact.secondary_phone','الهاتف الثانوي','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(490,0,'ar','labels','backend.general_settings.contact.short_text','نص قصير','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(491,0,'ar','labels','backend.general_settings.contact.show','تبين','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(492,0,'ar','labels','backend.general_settings.contact.title','اتصل','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(493,0,'ar','labels','backend.general_settings.counter','عداد','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(494,0,'ar','labels','backend.general_settings.counter_note','<b> ثابت </b> = إضافة بيانات لعداد يدويًا. الرجاء إدخال النص الدقيق الذي تريد عرضه في قسم عداد الواجهة الأمامية ، <br> <b> قاعدة البيانات / حقيقي </b> = سيستغرق الأمر بيانات حقيقية من قاعدة البيانات لجميع الحقول (الطلاب المسجلين ، إجمالي الدورات ، إجمالي المدربين)','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(495,0,'ar','labels','backend.general_settings.database','قاعدة البيانات / ريال','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(496,0,'ar','labels','backend.general_settings.email.mail_driver','سائق البريد','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(497,0,'ar','labels','backend.general_settings.email.mail_driver_note','يمكنك تحديد أي برنامج تشغيل تريده لإعداد Mail. <ب> السابقين. SMTP و Mailgun و Mandrill و SparkPost و Amazon SES إلخ. </b> <br> أضف <b> برنامج تشغيل فرديًا فقط </b>','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(498,0,'ar','labels','backend.general_settings.email.mail_encryption','تشفير البريد','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(499,0,'ar','labels','backend.general_settings.email.mail_encryption_note','استخدم <b> tls </b> إذا كان موقعك يستخدم بروتوكول <b> HTTP </b> و <b>ssl </b> إذا كان موقعك يستخدم بروتوكول <b> HTTPS </b>','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(500,0,'ar','labels','backend.general_settings.email.mail_from_address','البريد من العنوان','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(501,0,'ar','labels','backend.general_settings.email.mail_from_address_note','سيتم استخدام هذا البريد الإلكتروني لمراسلات \"نموذج الاتصال\".','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(502,0,'ar','labels','backend.general_settings.email.mail_from_name','البريد من الاسم','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(503,0,'ar','labels','backend.general_settings.email.mail_from_name_note','سيكون هذا اسم العرض للبريد الإلكتروني المرسل.','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(504,0,'ar','labels','backend.general_settings.email.mail_host','البريد المضيف','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(505,0,'ar','labels','backend.general_settings.email.mail_password','بريد كلمة المرور','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(506,0,'ar','labels','backend.general_settings.email.mail_password_note','أضف كلمة مرور البريد الإلكتروني التي تريد تكوينها لإرسال رسائل البريد الإلكتروني','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(507,0,'ar','labels','backend.general_settings.email.mail_port','ميناء البريد','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(508,0,'ar','labels','backend.general_settings.email.mail_username','البريد اسم المستخدم','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(509,0,'ar','labels','backend.general_settings.email.mail_username_note','أضف معرف بريدك الإلكتروني الذي تريد تكوينه لإرسال رسائل البريد الإلكتروني','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(510,0,'ar','labels','backend.general_settings.email.note','<b> ملاحظة مهمة </b>: إذا كنت تستخدم <b> GMAIL </b> لتكوين البريد ، فتأكد من إكمال العملية التالية قبل التحديث:\n  <UL>\n<li> انتقل إلى <a target=\"_blank\" href=\"https://myaccount.google.com/security\"> حسابي </a> من حسابك في Google الذي تريد تكوينه وتسجيل الدخول </li>\n<li> قم بالتمرير لأسفل إلى <b> وصول أقل أمانًا للتطبيق </b> وتعيينه <b>ON</b> </li>\n</UL>','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(511,0,'ar','labels','backend.general_settings.email.title','تكوين البريد','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(512,0,'ar','labels','backend.general_settings.enable_registration','تمكين التسجيل','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(513,0,'ar','labels','backend.general_settings.font_color','لون الخط','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(514,0,'ar','labels','backend.general_settings.footer.bottom_footer','أسفل تذييل','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(515,0,'ar','labels','backend.general_settings.footer.bottom_footer_note','ملاحظة: يتضمن النص حقوق الطبع والنشر وصلات تذييل','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(516,0,'ar','labels','backend.general_settings.footer.copyright_text','نص حقوق النشر','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(517,0,'ar','labels','backend.general_settings.footer.custom_links','روابط مخصصة','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(518,0,'ar','labels','backend.general_settings.footer.featured_courses','دورات مميزة','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(519,0,'ar','labels','backend.general_settings.footer.footer_links','روابط تذييل الصفحة','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(520,0,'ar','labels','backend.general_settings.footer.link','حلقة الوصل','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(521,0,'ar','labels','backend.general_settings.footer.link_label','تواصل معنا','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(522,0,'ar','labels','backend.general_settings.footer.link_url','URL','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(523,0,'ar','labels','backend.general_settings.footer.newsletter_form','نموذج النشرة الإخبارية','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(524,0,'ar','labels','backend.general_settings.footer.popular_categories','فئات شعبية','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(525,0,'ar','labels','backend.general_settings.footer.popular_courses','دورات شعبية','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(526,0,'ar','labels','backend.general_settings.footer.recent_news','أخبار حديثة','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(527,0,'ar','labels','backend.general_settings.footer.section_1','القسم 1','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(528,0,'ar','labels','backend.general_settings.footer.section_2','القسم 2','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(529,0,'ar','labels','backend.general_settings.footer.section_3','القسم 3','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(530,0,'ar','labels','backend.general_settings.footer.short_description','وصف قصير فارغ','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(531,0,'ar','labels','backend.general_settings.footer.social_links','روابط اجتماعية','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(532,0,'ar','labels','backend.general_settings.footer.social_links_note','أضف عنوان URL للرابط الاجتماعي وحدد أيقونة لتلك الوسائط من iconpicker. انقر فوق الزر <b> ADD + </b>. وسيتم إنشاء الرابط الاجتماعي الخاص بك. يمكنك أيضًا حذفها بالنقر فوق الزر <b> <i class = \"fa fa-times\"> </i> </b>','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(533,0,'ar','labels','backend.general_settings.footer.title','تذييل','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(534,0,'ar','labels','backend.general_settings.footer.trending_courses','تتجه الدورات','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(535,0,'ar','labels','backend.general_settings.general.title','الإعدادات العامة','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(536,0,'ar','labels','backend.general_settings.google_analytics','جوجل تحليلات مدونة','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(537,0,'ar','labels','backend.general_settings.google_analytics_id','معرف Google Analytics','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(538,0,'ar','labels','backend.general_settings.google_analytics_id_note','كيف تحصل على Google Analytics ID؟','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(539,0,'ar','labels','backend.general_settings.homepage','اختر الصفحة الرئيسية','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(540,0,'ar','labels','backend.general_settings.language_settings.default_language','اللغة الافتراضية','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(541,0,'ar','labels','backend.general_settings.language_settings.display_type','نوع العرض','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(542,0,'ar','labels','backend.general_settings.language_settings.left_to_right','من اليسار إلى اليمين','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(543,0,'ar','labels','backend.general_settings.language_settings.right_to_left','من اليمين الى اليسار','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(544,0,'ar','labels','backend.general_settings.language_settings.title','اعدادات اللغة','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(545,0,'ar','labels','backend.general_settings.layout.title','نسق','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(546,0,'ar','labels','backend.general_settings.layout_note','سيؤدي هذا إلى تغيير تخطيط سمة الواجهة الأمامية','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(547,0,'ar','labels','backend.general_settings.layout_type','نوع التخطيط','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(548,0,'ar','labels','backend.general_settings.logos.title','الشعارات','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(549,0,'ar','labels','backend.general_settings.mail_configuration_note','هل قمت بتكوين: ربط إعدادات البريد </a>؟ من الضروري الإعداد لإرسال / استقبال رسائل البريد الإلكتروني','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(550,0,'ar','labels','backend.general_settings.mail_driver','سائق البريد','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(551,0,'ar','labels','backend.general_settings.mail_from_address','البريد من العنوان','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(552,0,'ar','labels','backend.general_settings.mail_from_name','البريد من الاسم','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(553,0,'ar','labels','backend.general_settings.mail_host','مضيف البريد','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(554,0,'ar','labels','backend.general_settings.mail_password','بريد كلمة المرور','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(555,0,'ar','labels','backend.general_settings.mail_port','ميناء البريد','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(556,0,'ar','labels','backend.general_settings.mail_username','البريد اسم المستخدم','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(557,0,'ar','labels','backend.general_settings.management','الاعدادات العامة','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(558,0,'ar','labels','backend.general_settings.newsletter.api_key','مفتاح API','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(559,0,'ar','labels','backend.general_settings.newsletter.api_key_note','أنشئ <b> مفتاح API </b> من <a target=\"_blank\" href=\"https://mailchimp.com/\"> <b> حساب Mailchimp </b> </a> والصقه أعلاه مربع النوع.','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(560,0,'ar','labels','backend.general_settings.newsletter.api_key_note_sendgrid','قم بإنشاء <b> مفتاح API </b> من <a target=\"_blank\" href=\"https://sendgrid.com/\"> <b> حساب SendGrid </b> </a> والصقه في أعلاه مربع الكتابة.','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(561,0,'ar','labels','backend.general_settings.newsletter.api_key_question','كيفية توليد مفتاح API؟','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(562,0,'ar','labels','backend.general_settings.newsletter.create_new','إنشاء واختيار جديد','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(563,0,'ar','labels','backend.general_settings.newsletter.double_opt_in','التقيد المزدوج','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(564,0,'ar','labels','backend.general_settings.newsletter.double_opt_in_note','<b> On </b> = سيُطلب من المستخدم في البريد الاشتراك في الاشتراك. <b> متوقف </b> = سيتم اشتراك المستخدم مباشرةً في الرسائل الإخبارية','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(565,0,'ar','labels','backend.general_settings.newsletter.get_lists','الحصول على قوائم','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(566,0,'ar','labels','backend.general_settings.newsletter.list_id','معرف القائمة','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(567,0,'ar','labels','backend.general_settings.newsletter.list_id_note','ابحث عن <b> معرف القائمة </b> والصقه في المربع أعلاه','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(568,0,'ar','labels','backend.general_settings.newsletter.list_id_question','كيفية العثور على معرف قائمة من Mailchimp؟','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(569,0,'ar','labels','backend.general_settings.newsletter.list_id_question_sendgrid','إنشاء قائمة بريد إلكتروني جديدة لـ SendGrid هنا.','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(570,0,'ar','labels','backend.general_settings.newsletter.mail_provider','مزود خدمة البريد','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(571,0,'ar','labels','backend.general_settings.newsletter.mail_provider_note','<b> ملاحظة </b>: يمكنك تحديد أي مزود خدمة بريد لتلقي جميع رسائل البريد الإلكتروني المستخدمة في <b> الاشتراك في الرسالة الإخبارية </b>. <br> حدد وإعداد وفقًا للخطوات الموضحة. <b> إنه إلزامي </b> ، إذا كنت تريد استخدام نموذج <b> اشتراك النشرة الإخبارية </b>.','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(572,0,'ar','labels','backend.general_settings.newsletter.mailchimp','ميل تشيمب','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(573,0,'ar','labels','backend.general_settings.newsletter.manage_lists','إدارة قوائم SendGrid','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(574,0,'ar','labels','backend.general_settings.newsletter.select_list','اختر قائمة','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(575,0,'ar','labels','backend.general_settings.newsletter.sendgrid','SendGrid','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(576,0,'ar','labels','backend.general_settings.newsletter.sendgrid_lists','SendGrid قوائم البريد الإلكتروني','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(577,0,'ar','labels','backend.general_settings.newsletter.title','تكوين النشرة الإخبارية','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(578,0,'ar','labels','backend.general_settings.password_expires_days','كلمة المرور تنتهي أيام','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(579,0,'ar','labels','backend.general_settings.password_history','كلمة المرور التاريخ','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(580,0,'ar','labels','backend.general_settings.payment_settings.client_id','معرف العميل','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(581,0,'ar','labels','backend.general_settings.payment_settings.client_secret','سر','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(582,0,'ar','labels','backend.general_settings.payment_settings.how_to_paypal','كيفية الحصول على بيانات اعتماد API في PayPal؟','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(583,0,'ar','labels','backend.general_settings.payment_settings.how_to_stripe','كيفية الحصول على أوراق اعتماد API STRIPE؟','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(584,0,'ar','labels','backend.general_settings.payment_settings.key','مفتاح API','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(585,0,'ar','labels','backend.general_settings.payment_settings.live','حي','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(586,0,'ar','labels','backend.general_settings.payment_settings.mode','الوضع','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(587,0,'ar','labels','backend.general_settings.payment_settings.mode_note','<b> Sandbox </b> = سيتم استخدامه لاختبار المدفوعات باستخدام بيانات اعتماد اختبار PayPal. يمكن للحساب باستخدام USD فقط إجراء الدفعات مع PayPal في الوقت الحالي. سيتم إعادة توجيه هذه الخيارات لاختبار مدفوعات PayPal باستخدام بيانات اعتماد مستخدم Sandbox. سيتم استخدامه للمعاملات الوهمية فقط. <br>\n<b> Live </b> = سيتم استخدام بيانات اعتماد Live PayPal معك لإجراء معاملات فعلية مع المستخدمين العاديين باستخدام حساب PayPal.','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(588,0,'ar','labels','backend.general_settings.payment_settings.offline_mode','طريقة الدفع دون اتصال','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(589,0,'ar','labels','backend.general_settings.payment_settings.offline_mode_note','يحصل المستخدم على مساعدة للدفع في وضع عدم الاتصال بالإنترنت عبر المشرف','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(590,0,'ar','labels','backend.general_settings.payment_settings.paypal','طريقة الدفع باي بال','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(591,0,'ar','labels','backend.general_settings.payment_settings.paypal_note','يعيد توجيه إلى paypal للدفع','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(592,0,'ar','labels','backend.general_settings.payment_settings.sandbox','رمل','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(593,0,'ar','labels','backend.general_settings.payment_settings.secret','سر API','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(594,0,'ar','labels','backend.general_settings.payment_settings.stripe','طريقة الدفع الشريطية','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(595,0,'ar','labels','backend.general_settings.payment_settings.stripe_note','تمكن المدفوعات في الموقع مع بطاقات الخصم / الائتمان','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(596,0,'ar','labels','backend.general_settings.payment_settings.title','تكوين الدفع','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(597,0,'ar','labels','backend.general_settings.payment_settings.select_currency','اختر العملة','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(598,0,'ar','labels','backend.general_settings.payment_settings.bluesnap','Bluesnap طريقة الدفع','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(599,0,'ar','labels','backend.general_settings.payment_settings.bluesnap_note','نموذج بطاقة Bluesnap للدفع','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(600,0,'ar','labels','backend.general_settings.payment_settings.how_to_bluesnap','كيفية الحصول على بيانات اعتماد Bluesnap API؟','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(601,0,'ar','labels','backend.general_settings.requires_approval','يتطلب موافقة','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(602,0,'ar','labels','backend.general_settings.retest_note','تمكين / تعطيل إذا كان المستخدم سيكون قادرا على إعادة اختبار للامتحان نفسه','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(603,0,'ar','labels','backend.general_settings.sections_note','بمجرد النقر فوق \"تحديث\" ، سترى قائمة بالأقسام لتشغيل / إيقاف','2020-02-27 05:33:56','2020-04-19 12:52:12'),
(604,0,'ar','labels','backend.general_settings.static','ثابتة','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(605,0,'ar','labels','backend.general_settings.theme_layout','تخطيط الموضوع','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(606,0,'ar','labels','backend.general_settings.title','الإعدادات العامة','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(607,0,'ar','labels','backend.general_settings.total_courses','أدخل مجموع الدورات. على سبيل المثال: 1 كيلو ، 1000 إلخ','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(608,0,'ar','labels','backend.general_settings.total_students','أدخل مجموع الطلاب. على سبيل المثال: 1 كيلو ، مليون ، 1000 إلخ.','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(609,0,'ar','labels','backend.general_settings.total_teachers','أدخل مجموع المدربين. على سبيل المثال: 1 كيلو ، 1000 إلخ','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(610,0,'ar','labels','backend.general_settings.user_registration_settings.desc','سيتم عرض الحقول المحددة من الشريط الجانبي الأيمن في نموذج التسجيل','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(611,0,'ar','labels','backend.general_settings.user_registration_settings.fields.address','عنوان','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(612,0,'ar','labels','backend.general_settings.user_registration_settings.fields.city','مدينة','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(613,0,'ar','labels','backend.general_settings.user_registration_settings.fields.country','بلد','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(614,0,'ar','labels','backend.general_settings.user_registration_settings.fields.dob','تاريخ الولادة','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(615,0,'ar','labels','backend.general_settings.user_registration_settings.fields.email','البريد الإلكتروني','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(616,0,'ar','labels','backend.general_settings.user_registration_settings.fields.female','إناثا','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(617,0,'ar','labels','backend.general_settings.user_registration_settings.fields.first_name','الاسم الاول','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(618,0,'ar','labels','backend.general_settings.user_registration_settings.fields.gender','جنس','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(619,0,'ar','labels','backend.general_settings.user_registration_settings.fields.last_name','الكنية','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(620,0,'ar','labels','backend.general_settings.user_registration_settings.fields.male','الذكر','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(621,0,'ar','labels','backend.general_settings.user_registration_settings.fields.other','آخر','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(622,0,'ar','labels','backend.general_settings.user_registration_settings.fields.password','كلمه المرور','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(623,0,'ar','labels','backend.general_settings.user_registration_settings.fields.phone','الهاتف','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(624,0,'ar','labels','backend.general_settings.user_registration_settings.fields.pincode','الرقم السري','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(625,0,'ar','labels','backend.general_settings.user_registration_settings.fields.state','حالة','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(626,0,'ar','labels','backend.general_settings.user_registration_settings.title','إعدادات تسجيل المستخدم','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(627,0,'ar','labels','backend.general_settings.lesson_note','تمكين / تعطيل إذا كان المستخدم سيكون قادرا على تخطي قبل انتهاء الموقت.','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(628,0,'ar','labels','backend.general_settings.troubleshoot','استكشاف','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(629,0,'ar','labels','backend.general_settings.show_offers_note','تمكين / تعطيل إذا عرضت الكوبون رابط الصفحة ليتم عرضها في أسفل الصفحة','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(630,0,'ar','labels','backend.general_settings.how_to_onesignal','كيفية إنشاء التطبيق في OneSignal؟','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(631,0,'ar','labels','backend.general_settings.onesignal_note','تمكين / تعطيل تكوين OneSignal لموقع الويب.','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(632,0,'ar','labels','backend.general_settings.setup_onesignal','كيفية إعداد OneSignal؟','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(633,0,'ar','labels','backend.general_settings.api_clients.api_client_name','اسم عميل API','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(634,0,'ar','labels','backend.general_settings.api_clients.enable','ممكن','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(635,0,'ar','labels','backend.general_settings.api_clients.fields.action','عمل','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(636,0,'ar','labels','backend.general_settings.api_clients.fields.id','هوية شخصية','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(637,0,'ar','labels','backend.general_settings.api_clients.fields.name','اسم','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(638,0,'ar','labels','backend.general_settings.api_clients.fields.secret','سر','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(639,0,'ar','labels','backend.general_settings.api_clients.fields.status','الحالة','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(640,0,'ar','labels','backend.general_settings.api_clients.generate','توليد','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(641,0,'ar','labels','backend.general_settings.api_clients.live','حي','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(642,0,'ar','labels','backend.general_settings.api_clients.please_input_api_client_name','الرجاء إدخال اسم عميل API','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(643,0,'ar','labels','backend.general_settings.api_clients.revoke','إبطال','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(644,0,'ar','labels','backend.general_settings.api_clients.revoked','إلغاء - فسخ','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(645,0,'ar','labels','backend.general_settings.api_clients.something_went_wrong','هناك خطأ ما','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(646,0,'ar','labels','backend.general_settings.api_clients.title','عملاء API','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(647,0,'ar','labels','backend.general_settings.api_clients.developer_manual','دليل المطور','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(648,0,'ar','labels','backend.general_settings.api_clients.note','<span class = \"text-risk font-weight-bold\"> ملاحظة: </span> سيكون هذا القسم مفيدًا لهدف API. يمكنك إنشاء <b> معرف العميل </b> و <b> عميل السرية </b> لاستخدامه في تطبيق Android أو ساعي البريد لاختبار واجهة برمجة التطبيقات. <br> تحتاج إلى تخصيص المعلمات وعنوان URL وفقًا لمتطلباتك.','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(649,0,'ar','labels','backend.general_settings.teacher_commission_rate','معدل عمولة المدرب','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(650,0,'ar','labels','backend.general_settings.box','صندوق','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(651,0,'ar','labels','backend.general_settings.layout_label','نسق','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(652,0,'ar','labels','backend.general_settings.layout_type_note','سيؤدي هذا إلى تغيير نوع تخطيط الواجهة الأمامية','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(653,0,'ar','labels','backend.general_settings.list_update_note','بمجرد النقر فوق \"تحديث\" ، سترى قائمة بالأقسام لتشغيل / إيقاف.','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(654,0,'ar','labels','backend.general_settings.wide','واسع','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(655,0,'ar','labels','backend.invoices.fields.amount','كمية','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(656,0,'ar','labels','backend.invoices.fields.download','تحميل','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(657,0,'ar','labels','backend.invoices.fields.order_date','تاريخ الطلب','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(658,0,'ar','labels','backend.invoices.fields.view','عرض','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(659,0,'ar','labels','backend.invoices.title','الفواتير','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(660,0,'ar','labels','backend.logo.favicon','أضف فافيكون','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(661,0,'ar','labels','backend.logo.favicon_note','ملاحظة: قم بتحميل الشعار بدقة <b> 32 × 32 </b> بكسل وإضافات <b> .png </b> أو <b> .gif </b> أو <b> .ico </b>','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(662,0,'ar','labels','backend.logo.logo_b','الشعار 1','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(663,0,'ar','labels','backend.logo.logo_b_note','ملاحظة: تحميل الشعار مع <b> نص أسود وخلفية شفافة بتنسيق .png </b> و <b> 294 × 50 </b> (WxH) بكسل. <br> <b> الارتفاع </b> <b> العرض </b> وفقًا لـ <b> نسبة العرض إلى الارتفاع </b>.','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(664,0,'ar','labels','backend.logo.logo_popup','شعار للنوافذ المنبثقة','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(665,0,'ar','labels','backend.logo.logo_popup_note','ملاحظة: أضف دقة شعار مربعة أقل من <b> 72 × 72 </b> بكسل','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(666,0,'ar','labels','backend.logo.logo_w','الشعار 2','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(667,0,'ar','labels','backend.logo.logo_w_note','ملاحظة: تحميل الشعار مع <> نص أبيض وخلفية شفافة بتنس> و <b> 294 × 50 </b> (WxH) بكسل. <br> <b> الارتفاع </b> <b> العرض </b> وفقًا لـ <b> نسبة العرض إلى الارتفاع </b>.','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(668,0,'ar','labels','backend.logo.logo_white','الشعار 3','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(669,0,'ar','labels','backend.logo.logo_white_note','ملاحظة: قم بتحميل الشعار مع <b> بنص أبيض وخلفية شفافة فقط بتنسيق .png </b> و <b> 294 × 50 </b> (WxH>) بكسل. <br> <b> الارتفاع </b> ثابت ، <b> العرض </b> وفقًا لـ <b> نسبة العرض إلى الارتفاع </b>.','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(670,0,'ar','labels','backend.logo.title','تغيير الشعار','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(671,0,'ar','labels','backend.menu-manager.title','مدير القائمة','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(672,0,'ar','labels','backend.messages.compose','مؤلف موسيقى','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(673,0,'ar','labels','backend.messages.search_user','بحث المستخدم','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(674,0,'ar','labels','backend.messages.select_recipients','اختر المستلم','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(675,0,'ar','labels','backend.messages.start_conversation','بدء محادثة','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(676,0,'ar','labels','backend.messages.title','الرسائل','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(677,0,'ar','labels','backend.messages.type_a_message','اكتب رسالة','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(678,0,'ar','labels','backend.orders.complete','أكمل يدويا','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(679,0,'ar','labels','backend.orders.download_invoice','تحميل فاتورة','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(680,0,'ar','labels','backend.orders.fields.amount','كمية','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(681,0,'ar','labels','backend.orders.fields.date','تاريخ الطلب','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(682,0,'ar','labels','backend.orders.fields.items','العناصر','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(683,0,'ar','labels','backend.orders.fields.ordered_by','مرتبة حسب','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(684,0,'ar','labels','backend.orders.fields.payment_status.completed','منجز','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(685,0,'ar','labels','backend.orders.fields.payment_status.failed','فشل','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(686,0,'ar','labels','backend.orders.fields.payment_status.pending','قيد الانتظار','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(687,0,'ar','labels','backend.orders.fields.payment_status.title','دفع','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(688,0,'ar','labels','backend.orders.fields.payment_type.offline','غير متصل على الانترنت','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(689,0,'ar','labels','backend.orders.fields.payment_type.paypal','باي بال','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(690,0,'ar','labels','backend.orders.fields.payment_type.stripe','بطاقة الائتمان / الخصم (بوابة الدفع عبر الشريط)','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(691,0,'ar','labels','backend.orders.fields.payment_type.title','نوع الدفع','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(692,0,'ar','labels','backend.orders.fields.reference_no','رقم المرجع.','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(693,0,'ar','labels','backend.orders.fields.user_email','البريد الالكتروني للمستخدم','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(694,0,'ar','labels','backend.orders.offline_requests','طلبات غير متصل','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(695,0,'ar','labels','backend.orders.title','أوامر','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(696,0,'ar','labels','backend.orders.view_invoice','عرض الفاتورة','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(697,0,'ar','labels','backend.questions.create','إنشاء سؤال','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(698,0,'ar','labels','backend.questions.edit','تحرير السؤال','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(699,0,'ar','labels','backend.questions.fields.correct','صيح','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(700,0,'ar','labels','backend.questions.fields.course','دورة','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(701,0,'ar','labels','backend.questions.fields.lesson','درس','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(702,0,'ar','labels','backend.questions.fields.option_text','نص الخيار','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(703,0,'ar','labels','backend.questions.fields.question','سؤال','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(704,0,'ar','labels','backend.questions.fields.question_image','صورة السؤال','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(705,0,'ar','labels','backend.questions.fields.score','أحرز هدفا','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(706,0,'ar','labels','backend.questions.fields.tests','اختبارات','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(707,0,'ar','labels','backend.questions.fields.title','عنوان','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(708,0,'ar','labels','backend.questions.fields.option_explanation','شرح الخيار','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(709,0,'ar','labels','backend.questions.title','الأسئلة','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(710,0,'ar','labels','backend.questions.view','عرض الأسئلة','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(711,0,'ar','labels','backend.questions.test','اختبار','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(712,0,'ar','labels','backend.questions_options.create','إنشاء خيار','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(713,0,'ar','labels','backend.questions_options.edit','تحرير الخيار','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(714,0,'ar','labels','backend.questions_options.fields.correct','صيح','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(715,0,'ar','labels','backend.questions_options.fields.course','دورة','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(716,0,'ar','labels','backend.questions_options.fields.lesson','درس','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(717,0,'ar','labels','backend.questions_options.fields.option_text','نص الخيار','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(718,0,'ar','labels','backend.questions_options.fields.question','سؤال','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(719,0,'ar','labels','backend.questions_options.fields.question_option','خيار السؤال','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(720,0,'ar','labels','backend.questions_options.fields.score','أحرز هدفا','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(721,0,'ar','labels','backend.questions_options.fields.tests','اختبارات','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(722,0,'ar','labels','backend.questions_options.fields.title','عنوان','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(723,0,'ar','labels','backend.questions_options.title','خيار الأسئلة','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(724,0,'ar','labels','backend.questions_options.view','عرض خيارات السؤال','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(725,0,'ar','labels','backend.reviews.fields.content','يحتوى','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(726,0,'ar','labels','backend.reviews.fields.course','دورة','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(727,0,'ar','labels','backend.reviews.fields.time','زمن','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(728,0,'ar','labels','backend.reviews.fields.user','المستعمل','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(729,0,'ar','labels','backend.reviews.title','التعليقات','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(730,0,'ar','labels','backend.social_settings.fb_api_note','كيفية الحصول على مؤهلات اعتماد واجهة برمجة تطبيقات Facebook؟','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(731,0,'ar','labels','backend.social_settings.fb_note','تمكين / تعطيل تسجيل الدخول إلى موقع Facebook','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(732,0,'ar','labels','backend.social_settings.google_api_note','كيفية الحصول على بيانات اعتماد Google API؟','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(733,0,'ar','labels','backend.social_settings.google_note','تمكين / تعطيل تسجيل الدخول إلى Google لموقع الويب','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(734,0,'ar','labels','backend.social_settings.linkedin_api_note','كيفية الحصول على مؤهلات LinkedIn API؟','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(735,0,'ar','labels','backend.social_settings.linkedin_note','تمكين / تعطيل تسجيل الدخول إلى LinkedIn لموقع الويب','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(736,0,'ar','labels','backend.social_settings.management','الوضع الاجتماعي','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(737,0,'ar','labels','backend.social_settings.twitter_api_note','كيفية الحصول على بيانات اعتماد Twitter API؟','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(738,0,'ar','labels','backend.social_settings.twitter_note','تمكين / تعطيل تسجيل الدخول إلى Twitter لموقع الويب','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(739,0,'ar','labels','backend.tests.create','إنشاء اختبار','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(740,0,'ar','labels','backend.tests.edit','تحرير الاختبار','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(741,0,'ar','labels','backend.tests.fields.course','دورة','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(742,0,'ar','labels','backend.tests.fields.description','وصف','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(743,0,'ar','labels','backend.tests.fields.lesson','درس','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(744,0,'ar','labels','backend.tests.fields.published','نشرت','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(745,0,'ar','labels','backend.tests.fields.questions','الأسئلة','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(746,0,'ar','labels','backend.tests.fields.title','عنوان','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(747,0,'ar','labels','backend.tests.title','اختبارات','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(748,0,'ar','labels','backend.tests.view','عرض الاختبارات','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(749,0,'ar','labels','backend.translations.add_new_locale','إضافة لغة جديدة','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(750,0,'ar','labels','backend.translations.adding','مضيفا ...','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(751,0,'ar','labels','backend.translations.append_new_translations','إلحاق ترجمات جديدة','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(752,0,'ar','labels','backend.translations.changed','تغير','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(753,0,'ar','labels','backend.translations.choose_a_group','اختر مجموعة لعرض ترجمات المجموعة. إذا لم تكن هناك مجموعات مرئية ، فتأكد\n                                 لقد قمت بتشغيل عمليات الترحيل واستوردت الترجمات.','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(754,0,'ar','labels','backend.translations.current_supported_locales','اللغات المدعومة الحالية','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(755,0,'ar','labels','backend.translations.done_importing','تم الاستيراد والمعالجة <strong class = \"counter\"> N </strong>! إعادة تحميل هذه الصفحة إلى\n                             تحديث المجموعات!','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(756,0,'ar','labels','backend.translations.done_publishing_for_all_groups','تم نشر الترجمات لكل المجموعة!','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(757,0,'ar','labels','backend.translations.done_publishing_for_group','تم نشر الترجمات للمجموعة','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(758,0,'ar','labels','backend.translations.done_searching','تم البحث عن الترجمات ، التي عثر عليها <strong class = \"counter\"> N </strong>!','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(759,0,'ar','labels','backend.translations.enter_new_locale_key','أدخل مفتاح اللغة الجديد','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(760,0,'ar','labels','backend.translations.export_all_translations','تصدير جميع الترجمات','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(761,0,'ar','labels','backend.translations.import_groups','استيراد المجموعات','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(762,0,'ar','labels','backend.translations.import_groups_note','<p> سيؤدي هذا إلى الحصول على جميع ملفات الإعدادات المحلية من مجلد <code> lang </code> وإدراجها في قاعدة البيانات. <br> <b> إلحاق ترجمات جديدة: </b> سيُلحق فقط الملفات والبيانات الجديدة <b> & </b>\n                                             <b> استبدل الترجمات الحالية: </b> ستحل محل السجلات الحالية وفقًا للملفات </p>','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(763,0,'ar','labels','backend.translations.key','مفتاح','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(764,0,'ar','labels','backend.translations.publish_all','نشر الكل','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(765,0,'ar','labels','backend.translations.publish_all_warning','هل أنت متأكد أنك تريد نشر كل مجموعة الترجمات؟ سيؤدي هذا إلى الكتابة فوق ملفات اللغة الحالية.','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(766,0,'ar','labels','backend.translations.publish_translations','نشر الترجمات','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(767,0,'ar','labels','backend.translations.publishing','نشر..','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(768,0,'ar','labels','backend.translations.replace_existing_translations','استبدال الترجمات الحالية','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(769,0,'ar','labels','backend.translations.supported_locales','اللغات المدعومة','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(770,0,'ar','labels','backend.translations.title','مدير الترجمة','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(771,0,'ar','labels','backend.translations.total','مجموع','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(772,0,'ar','labels','backend.translations.translation_warning','هل أنت متأكد أنك تريد نشر مجموعة الترجمات: group؟ سيؤدي هذا إلى الكتابة فوق ملفات اللغة الحالية','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(773,0,'ar','labels','backend.translations.warning','تحذير ، الترجمات غير مرئية حتى يتم تصديرها مرة أخرى إلى ملف التطبيق / اللغة ، باستخدام\n                         <code> php translation translation: export </code> زر الأمر أو النشر.','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(774,0,'ar','labels','backend.update.current_version','النسخة الحالية','2020-02-27 05:33:57','2020-04-19 12:52:12'),
(775,0,'ar','labels','backend.update.file_replaced','سيتم تحديث / استبدال الملفات التالية','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(776,0,'ar','labels','backend.update.note_before_upload','<p> <b> يرجى أخذ BACKUP قبل التحديث. </b> قد يأتي ملف zip المحدث مع مجلدات جديدة وتحديثات للملفات. <b> سيتم استبدال ملفاتك الحالية بملف جديد </b>. لذا ، <b> إذا قمت بإجراء أي تغييرات في ملفات التطبيق الحالية ، فسيكون هذا المفقود </b>. </p>\n                         <p> إذا كنت تقوم بالتحميل مباشرة من مربع إدخال الملف أدناه ، فسيتم استبدال ملفاتك. نوصي بشدة بالقيام بذلك الاستبدال اليدوي للملفات واحدًا تلو الآخر أو تعديل التغييرات من خلال مقارنة الملف الذي تم تعديله الحالي والملفات الجديدة المحدثة. </p>\n                         <p> إذا كنت لا تزال تعاني من الارتباك. يرجى الاتصال بنا ، وسوف نوجهك لتحديث التطبيق الخاص بك </p>','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(777,0,'ar','labels','backend.update.note_before_upload_title','قراءة الملاحظات التالية قبل التحديث','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(778,0,'ar','labels','backend.update.title','تحديث الموضوع','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(779,0,'ar','labels','backend.update.upload','تحميل الإصدار الجديد <small> (update.zip) </small>','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(780,0,'ar','labels','backend.update.warning','<b> تحذير: نوصيك بشدة بتحديث المظهر حسب رقم الإصدار </b>. <br> <b> مثال: </b> update_v1.zip، update_v2.zip. من فضلك لا تقفز رقم الإصدار. إذا كان رقم الإصدار هو 1 وتريد تحديثه ، فقم بالتحديث إلى الإصدار 2. لا تقم بالتحديث مباشرة إلى الإصدار 3.','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(781,0,'ar','labels','backend.certificates.download','تحميل','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(782,0,'ar','labels','backend.certificates.fields.action','عمل','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(783,0,'ar','labels','backend.certificates.fields.course_name','اسم الدورة التدريبية','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(784,0,'ar','labels','backend.certificates.fields.progress','نسبة الإنجاز','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(785,0,'ar','labels','backend.certificates.title','الشهادات','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(786,0,'ar','labels','backend.certificates.view','عرض','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(787,0,'ar','labels','backend.bundles.fields.slug','العنوان الفرعي','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(788,0,'ar','labels','backend.bundles.fields.status','الحالة','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(789,0,'ar','labels','backend.bundles.fields.category','الفئة','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(790,0,'ar','labels','backend.bundles.fields.course','دورة','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(791,0,'ar','labels','backend.bundles.fields.course_image','صورة الدورة','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(792,0,'ar','labels','backend.bundles.fields.description','وصف','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(793,0,'ar','labels','backend.bundles.fields.featured','متميزة','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(794,0,'ar','labels','backend.bundles.fields.lessons.add','أضف دروس','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(795,0,'ar','labels','backend.bundles.fields.lessons.view','عرض الدروس','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(796,0,'ar','labels','backend.bundles.fields.meta_description','التوصيف الإضافي','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(797,0,'ar','labels','backend.bundles.fields.meta_keywords','كلمات دلالية','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(798,0,'ar','labels','backend.bundles.fields.meta_title','عنوان التوصيف الإضافي','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(799,0,'ar','labels','backend.bundles.fields.popular','متميزة','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(800,0,'ar','labels','backend.bundles.fields.price','السعر','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(801,0,'ar','labels','backend.bundles.fields.published','للنشر','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(802,0,'ar','labels','backend.bundles.fields.sidebar','أضف الشريط الجانبي','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(803,0,'ar','labels','backend.bundles.fields.start_date','تاريخ البدء','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(804,0,'ar','labels','backend.bundles.fields.teachers','المدربون','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(805,0,'ar','labels','backend.bundles.fields.title','عنوان','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(806,0,'ar','labels','backend.bundles.fields.trending','متداول','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(807,0,'ar','labels','backend.bundles.fields.courses','الدورات','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(808,0,'ar','labels','backend.bundles.fields.free','مجانًا','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(809,0,'ar','labels','backend.bundles.add_categories','إضافة فئات','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(810,0,'ar','labels','backend.bundles.add_teachers','إضافة المدربين','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(811,0,'ar','labels','backend.bundles.category','الفئة','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(812,0,'ar','labels','backend.bundles.course_timeline','الجدول الزمني للدورة','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(813,0,'ar','labels','backend.bundles.create','إنشاء مسار','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(814,0,'ar','labels','backend.bundles.edit','تحرير المسار','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(815,0,'ar','labels','backend.bundles.lesson','الدرس','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(816,0,'ar','labels','backend.bundles.listing_note','سيتم عرض و ترتيب الدروس المنشورة فقط.','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(817,0,'ar','labels','backend.bundles.save_timeline','حفظ الجدول الزمني','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(818,0,'ar','labels','backend.bundles.select_category','اختر الفئة','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(819,0,'ar','labels','backend.bundles.select_teachers','اختر المدربين','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(820,0,'ar','labels','backend.bundles.slug_placeholder','ادخل العنوان الفرعي أو سيتم إنشاؤه تلقائيا','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(821,0,'ar','labels','backend.bundles.test','اختبار','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(822,0,'ar','labels','backend.bundles.timeline_description','سحب وتغيير تسلسل الدروس / الاختبارات','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(823,0,'ar','labels','backend.bundles.title','مسارات التدريب','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(824,0,'ar','labels','backend.bundles.view','عرض مسارات التدريب','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(825,0,'ar','labels','backend.bundles.add_courses','إضافة الدورات','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(826,0,'ar','labels','backend.bundles.select_courses','اختر الدورات','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(827,0,'ar','labels','backend.reports.bundles','بال','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(828,0,'ar','labels','backend.reports.courses','الدورات','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(829,0,'ar','labels','backend.reports.fields.bundle','حزمة','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(830,0,'ar','labels','backend.reports.fields.completed','بالطبع الانتهاء','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(831,0,'ar','labels','backend.reports.fields.content','يحتوى','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(832,0,'ar','labels','backend.reports.fields.course','دورة','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(833,0,'ar','labels','backend.reports.fields.earnings','أرباح','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(834,0,'ar','labels','backend.reports.fields.name','اسم','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(835,0,'ar','labels','backend.reports.fields.orders','أوامر','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(836,0,'ar','labels','backend.reports.fields.students','الطلاب','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(837,0,'ar','labels','backend.reports.fields.time','زمن','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(838,0,'ar','labels','backend.reports.fields.user','المستعمل','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(839,0,'ar','labels','backend.reports.sales_report','تقرير المبيعات','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(840,0,'ar','labels','backend.reports.students_report','تقرير الطلاب','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(841,0,'ar','labels','backend.reports.title','تقارير','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(842,0,'ar','labels','backend.reports.total_earnings','الأرباح الكلية','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(843,0,'ar','labels','backend.reports.total_sales','إجمالي المبيعات','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(844,0,'ar','labels','backend.coupons.amount_note','إذا تم تحديد <b> معدل الخصم </b> ، فنسبة معدل الإدخال. إذا تم تحديد <b> معدل ثابت </b> ، فقم بإدخال مبلغ معين ليتم خصمه.','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(845,0,'ar','labels','backend.coupons.bundles','المسارات التدريبية','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(846,0,'ar','labels','backend.coupons.courses','الدورات','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(847,0,'ar','labels','backend.coupons.create','إنشاء القسيمة','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(848,0,'ar','labels','backend.coupons.description','وصف','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(849,0,'ar','labels','backend.coupons.discount_rate','معدل الخصم','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(850,0,'ar','labels','backend.coupons.edit','تحرير القسيمة','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(851,0,'ar','labels','backend.coupons.fields.amount','كمية','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(852,0,'ar','labels','backend.coupons.fields.code','الكود','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(853,0,'ar','labels','backend.coupons.fields.description','وصف','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(854,0,'ar','labels','backend.coupons.fields.expires_at','تنتهي في','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(855,0,'ar','labels','backend.coupons.fields.for','إلى عن على','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(856,0,'ar','labels','backend.coupons.fields.min_price','الحد الأدنى للطلب السعر','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(857,0,'ar','labels','backend.coupons.fields.name','اسم','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(858,0,'ar','labels','backend.coupons.fields.per_user_limit','لكل حد للمستخدم','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(859,0,'ar','labels','backend.coupons.fields.status','الحالة','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(860,0,'ar','labels','backend.coupons.fields.total','مجموع','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(861,0,'ar','labels','backend.coupons.fields.type','نوع','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(862,0,'ar','labels','backend.coupons.flat_rate','معدل','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(863,0,'ar','labels','backend.coupons.off','إيقاف','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(864,0,'ar','labels','backend.coupons.on','على','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(865,0,'ar','labels','backend.coupons.per_user_limit_note','حدد عدد المرات التي يستطيع فيها مستخدم واحد استخدام هذه القسيمة. افتراضيا استخدام مرة واحدة.','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(866,0,'ar','labels','backend.coupons.title','كوبونات','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(867,0,'ar','labels','backend.coupons.total_note','عدد القسائم التي ستصدر','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(868,0,'ar','labels','backend.coupons.type_note','<b> معدل الخصم (٪): </b> إذا حددت هذا ، فسيتم تطبيق السعر بنسبة٪ على إجمالي الشراء. السابق. السعر = 100 وسعر الخصم هو 10 ٪ ثم سيتم خصم 10 ٪ من 100. السابق. السعر = 100 والسعر الثابت 25 ، ثم يتم خصم 25 من 100.','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(869,0,'ar','labels','backend.coupons.unlimited','غير محدود','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(870,0,'ar','labels','backend.coupons.view','عرض كوبونات','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(871,0,'ar','labels','backend.sitemap.daily','اليومي','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(872,0,'ar','labels','backend.sitemap.generate','توفير','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(873,0,'ar','labels','backend.sitemap.generated','تم إنشاء ملف Sitemap بنجاح.','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(874,0,'ar','labels','backend.sitemap.monthly','شهريا','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(875,0,'ar','labels','backend.sitemap.records_note','عدد السجلات لكل ملف.','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(876,0,'ar','labels','backend.sitemap.records_per_file','السجلات لكل ملف','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(877,0,'ar','labels','backend.sitemap.sitemap_note','ستنشئ أداة خريطة الموقع هذه ملف Sitemap للدورة التدريبية المنشورة ، والحزم والمدونات.','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(878,0,'ar','labels','backend.sitemap.title','خريطة الموقع','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(879,0,'ar','labels','backend.sitemap.weekly','أسبوعي','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(880,0,'ar','labels','backend.tax.create','إنشاء ضريبة','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(881,0,'ar','labels','backend.tax.edit','تحرير الضريبة','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(882,0,'ar','labels','backend.tax.fields.name','اسم','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(883,0,'ar','labels','backend.tax.fields.rate','معدل','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(884,0,'ar','labels','backend.tax.fields.status','الحالة','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(885,0,'ar','labels','backend.tax.off','إيقاف','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(886,0,'ar','labels','backend.tax.on','على','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(887,0,'ar','labels','backend.tax.title','ضريبة','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(888,0,'ar','labels','backend.tax.view','عرض الضريبة','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(889,0,'ar','labels','backend.forum_category.create','إنشاء فئة المنتدى','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(890,0,'ar','labels','backend.forum_category.edit','تحرير فئة المنتدى','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(891,0,'ar','labels','backend.forum_category.fields.category','الفئة','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(892,0,'ar','labels','backend.forum_category.fields.color','اللون','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(893,0,'ar','labels','backend.forum_category.fields.order','طلب','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(894,0,'ar','labels','backend.forum_category.fields.parent_category','القسم الرئيسي','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(895,0,'ar','labels','backend.forum_category.fields.status','الحالة','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(896,0,'ar','labels','backend.forum_category.off','إيقاف','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(897,0,'ar','labels','backend.forum_category.on','على','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(898,0,'ar','labels','backend.forum_category.title','أقسام المنتدى','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(899,0,'ar','labels','backend.forum_category.view','مشاهدة قسم المنتدى','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(900,0,'ar','labels','backend.payments.title','المدفوعات','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(901,0,'ar','labels','backend.payments.total_earnings','الأرباح الكلية','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(902,0,'ar','labels','backend.payments.total_withdrawals','إجمالي السحوبات','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(903,0,'ar','labels','backend.payments.total_withdrawal_pending','إجمالي السحب معلق','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(904,0,'ar','labels','backend.payments.total_balance','الرصيد الكلي','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(905,0,'ar','labels','backend.payments.earnings','أرباح','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(906,0,'ar','labels','backend.payments.withdrawals','السحب','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(907,0,'ar','labels','backend.payments.add_withdrawal_request','إضافة طلب السحب','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(908,0,'ar','labels','backend.payments.approve','يوافق','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(909,0,'ar','labels','backend.payments.reject','رفض','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(910,0,'ar','labels','backend.payments.payment_type.bank','البنك','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(911,0,'ar','labels','backend.payments.payment_type.paypal','باي بال','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(912,0,'ar','labels','backend.payments.payment_type.offline','غير متصل على الانترنت','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(913,0,'ar','labels','backend.payments.status.pending','قيد الانتظار','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(914,0,'ar','labels','backend.payments.status.approved','وافق','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(915,0,'ar','labels','backend.payments.status.rejected','مرفوض','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(916,0,'ar','labels','backend.payments.fields.amount','كمية','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(917,0,'ar','labels','backend.payments.fields.payment_type','نوع الدفع','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(918,0,'ar','labels','backend.payments.fields.status','الحالة','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(919,0,'ar','labels','backend.payments.fields.remarks','ملاحظات','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(920,0,'ar','labels','backend.payments.fields.date','تاريخ','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(921,0,'ar','labels','backend.payments.fields.teacher_name','اسم المدرب','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(922,0,'ar','labels','lang.sp','الأسبانية','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(923,0,'ar','labels','lang.fr','الفرنسية','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(924,0,'ar','labels','lang.en','الإنجليزية','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(925,0,'ar','labels','lang.ar','عربى','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(926,0,'ar','labels','general.yes','نعم','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(927,0,'ar','labels','general.trash','حذف','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(928,0,'ar','labels','general.toolbar_btn_groups','شريط الأدوات مع مجموعات الأزرار','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(929,0,'ar','labels','general.toggle_navigation','تعديل التصفح','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(930,0,'ar','labels','general.sr_no','تسلسل','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(931,0,'ar','labels','general.show','تبين','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(932,0,'ar','labels','general.read_more','قراءة المزيد','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(933,0,'ar','labels','general.none','لا شيء','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(934,0,'ar','labels','general.no_data_available','لا تتوافر بيانات','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(935,0,'ar','labels','general.no','لا','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(936,0,'ar','labels','general.more','أكثر من','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(937,0,'ar','labels','general.actions','أفعال','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(938,0,'ar','labels','general.active','نشيط','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(939,0,'ar','labels','general.all','الكل','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(940,0,'ar','labels','general.back','الى الخلف','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(941,0,'ar','labels','general.buttons.cancel','إلغاء','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(942,0,'ar','labels','general.buttons.save','حفظ','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(943,0,'ar','labels','general.buttons.update','تحديث','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(944,0,'ar','labels','general.copyright','حقوق النشر','2020-02-27 05:33:58','2020-04-19 12:52:12'),
(945,0,'ar','labels','general.create_new','خلق جديد إبداع جديد','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(946,0,'ar','labels','general.custom','العادة','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(947,0,'ar','labels','general.delete','حذف','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(948,0,'ar','labels','general.delete_selected','احذف المختار','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(949,0,'ar','labels','general.edit','تصحيح','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(950,0,'ar','labels','general.hide','إخفاء','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(951,0,'ar','labels','general.inactive','غير نشط','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(952,0,'ar','labels','frontend.auth.login_box_title','تسجيل الدخول','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(953,0,'ar','labels','frontend.auth.login_button','تسجيل الدخول','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(954,0,'ar','labels','frontend.auth.login_with','تسجيل الدخول مع :social_media','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(955,0,'ar','labels','frontend.auth.register_box_title','تسجيل','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(956,0,'ar','labels','frontend.auth.register_button','تسجيل','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(957,0,'ar','labels','frontend.auth.remember_me','تذكرنى','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(958,0,'ar','labels','frontend.badges.trending','الشائع','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(959,0,'ar','labels','frontend.blog.add_comment','أضف تعليق','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(960,0,'ar','labels','frontend.blog.blog_categories','المدونة <span> الفئات. </span>','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(961,0,'ar','labels','frontend.blog.by','بواسطة','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(962,0,'ar','labels','frontend.blog.featured_course','ظهرت <span> الدورة التدريبية. </span>','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(963,0,'ar','labels','frontend.blog.login_to_post_comment','تسجيل الدخول لنشر تعليق','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(964,0,'ar','labels','frontend.blog.no_comments_yet','لا تعليقات حتى الآن ، كن أول من يعلق.','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(965,0,'ar','labels','frontend.blog.popular_tags','<span> العلامات الشائعة. </span>','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(966,0,'ar','labels','frontend.blog.post_comments','نشر <span> تعليقات. </span>','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(967,0,'ar','labels','frontend.blog.related_news','<span> ذات صلة </span> الأخبار','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(968,0,'ar','labels','frontend.blog.search_blog','بحث المدونة','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(969,0,'ar','labels','frontend.blog.share_this_news','شارك هذا الخبر','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(970,0,'ar','labels','frontend.blog.title','مدونة','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(971,0,'ar','labels','frontend.blog.write_a_comment','أكتب تعليقا','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(972,0,'ar','labels','frontend.cart.card_number','رقم البطاقة','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(973,0,'ar','labels','frontend.cart.card_number_placeholder','أدخل رقم بطاقتك','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(974,0,'ar','labels','frontend.cart.cart','عربة التسوق','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(975,0,'ar','labels','frontend.cart.checkout','الدفع','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(976,0,'ar','labels','frontend.cart.complete_your_purchases','أكمل <span> مشترياتك. </span>','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(977,0,'ar','labels','frontend.cart.confirmation_note','بتأكيد هذا الشراء ، أوافق على <b> شروط الاستخدام ، وسياسة رد الأموال </b> و <b> سياسة الخصوصية </b>','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(978,0,'ar','labels','frontend.cart.course_name','اسم الدورة التدريبية','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(979,0,'ar','labels','frontend.cart.course_type','تصنيف الدورة','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(980,0,'ar','labels','frontend.cart.cvv','CVV','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(981,0,'ar','labels','frontend.cart.empty_cart','عربة التسوق فارغة','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(982,0,'ar','labels','frontend.cart.expiration_date','تاريخ إنتهاء الصلاحية','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(983,0,'ar','labels','frontend.cart.go_back_to_cart','العودة إلى السلة','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(984,0,'ar','labels','frontend.cart.mm','MM','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(985,0,'ar','labels','frontend.cart.name_on_card','الاسم على البطاقة','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(986,0,'ar','labels','frontend.cart.name_on_card_placeholder','أدخل الاسم المكتوب على بطاقتك','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(987,0,'ar','labels','frontend.cart.no_payment_method','لا توجد طريقة دفع متاحة في هذه اللحظة','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(988,0,'ar','labels','frontend.cart.offline_payment','غير متصل الدفع','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(989,0,'ar','labels','frontend.cart.offline_payment_note','في طريقة الدفع هذه ، سيقوم المسؤولون التنفيذيون لدينا بالاتصال بك وإعطائك تعليمات بشأن الدفع وشراء الدورة التدريبية.','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(990,0,'ar','labels','frontend.cart.order_detail','ترتيب <span> التفاصيل. </span>','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(991,0,'ar','labels','frontend.cart.order_item','طلب <span> عنصر. </span>','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(992,0,'ar','labels','frontend.cart.order_payment','اطلب <span> الدفع. </span>','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(993,0,'ar','labels','frontend.cart.pay_now','ادفع الآن','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(994,0,'ar','labels','frontend.cart.pay_securely_paypal','ادفع بأمان باستخدام PayPal','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(995,0,'ar','labels','frontend.cart.payment_cards','بطاقة الائتمان أو الخصم','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(996,0,'ar','labels','frontend.cart.payment_status','حالة السداد','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(997,0,'ar','labels','frontend.cart.paypal','باي بال','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(998,0,'ar','labels','frontend.cart.request_assistance','طلب المساعدة','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(999,0,'ar','labels','frontend.cart.see_more_courses','رؤية المزيد من الدورات','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1000,0,'ar','labels','frontend.cart.starts','تبدأ من','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1001,0,'ar','labels','frontend.cart.stripe_error_message','يرجى تصحيح الأخطاء والمحاولة مرة أخرى.','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1002,0,'ar','labels','frontend.cart.success_message','نتمنى لك التوفيق','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1003,0,'ar','labels','frontend.cart.total','مجموع','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1004,0,'ar','labels','frontend.cart.your_payment_status','<span> حالة الدفع الخاصة بك. </span>','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1005,0,'ar','labels','frontend.cart.your_shopping_cart','سلة التسوق الخاصة بك','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1006,0,'ar','labels','frontend.cart.yy','YY','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1007,0,'ar','labels','frontend.cart.product_name','اسم المنتج','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1008,0,'ar','labels','frontend.cart.product_type','نوع المنتج','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1009,0,'ar','labels','frontend.cart.connection_timeout','انتهى وقت محاولة الاتصال','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1010,0,'ar','labels','frontend.cart.offline_request','تم استلام الطلب بنجاح! تحقق من بريدك الإلكتروني المسجل لمزيد من التفاصيل.','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1011,0,'ar','labels','frontend.cart.payment_done','تم الدفع بنجاح!','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1012,0,'ar','labels','frontend.cart.payment_failed','خطأ! عملية الدفع فشلت!','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1013,0,'ar','labels','frontend.cart.product_added','تم اضافة المنتج الى السلة بنجاح','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1014,0,'ar','labels','frontend.cart.try_again','خطأ! حاول مرة اخرى.','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1015,0,'ar','labels','frontend.cart.unknown_error','حدث خطأ غير معروف','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1016,0,'ar','labels','frontend.cart.purchase_successful','انت الان مشترك بهذه الدورة','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1017,0,'ar','labels','frontend.cart.amount','كمية','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1018,0,'ar','labels','frontend.cart.apply','تطبيق','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1019,0,'ar','labels','frontend.cart.empty_input','اكتب رمز القسيمة قبل التقديم','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1020,0,'ar','labels','frontend.cart.invalid_coupon','قسيمة غير صالحة!','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1021,0,'ar','labels','frontend.cart.item','بند','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1022,0,'ar','labels','frontend.cart.items','العناصر','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1023,0,'ar','labels','frontend.cart.offers','عروض','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1024,0,'ar','labels','frontend.cart.price','السعر','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1025,0,'ar','labels','frontend.cart.sub_total','المجموع الفرعي','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1026,0,'ar','labels','frontend.cart.total_payable','مجموع المستحق','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1027,0,'ar','labels','frontend.contact.box_title','اتصل بنا','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1028,0,'ar','labels','frontend.contact.button','إرسال المعلومات','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1029,0,'ar','labels','frontend.contact.keep_in_touch','نشكر لكم اهتمامكم ،، للتواصل نرجو تعبئة النموذج','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1030,0,'ar','labels','frontend.contact.message','الرسالة','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1031,0,'ar','labels','frontend.contact.phone_number','رقم التواصل','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1032,0,'ar','labels','frontend.contact.send_email','أرسل','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1033,0,'ar','labels','frontend.contact.send_message_now','إرسال رسالة الآن','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1034,0,'ar','labels','frontend.contact.send_us_a_message','تواصل معنا','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1035,0,'ar','labels','frontend.contact.title','اتصل','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1036,0,'ar','labels','frontend.contact.your_email','البريد الإلكتروني','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1037,0,'ar','labels','frontend.contact.your_name','الأسم','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1038,0,'ar','labels','frontend.course.add_review_now','إضافة مراجعة الآن','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1039,0,'ar','labels','frontend.course.add_reviews','أضف <span> مراجعات. </span>','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1040,0,'ar','labels','frontend.course.add_to_cart','أضف إلى السلة','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1041,0,'ar','labels','frontend.course.added_to_cart','يضاف إلى العربة','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1042,0,'ar','labels','frontend.course.author','مؤلف','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1043,0,'ar','labels','frontend.course.average_rating','متوسط التقييم','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1044,0,'ar','labels','frontend.course.buy_note','يجب عليك التسجيل اولا لبدء الدورة','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1045,0,'ar','labels','frontend.course.buy_now','سجل الأن','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1046,0,'ar','labels','frontend.course.by','بواسطة','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1047,0,'ar','labels','frontend.course.category','الفئة','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1048,0,'ar','labels','frontend.course.chapter_videos','الفصل فيديو','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1049,0,'ar','labels','frontend.course.chapters','عدد المواضيع','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1050,0,'ar','labels','frontend.course.completed','منجز','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1051,0,'ar','labels','frontend.course.continue_course','مواصلة الدورة','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1052,0,'ar','labels','frontend.course.course_detail','تفاصيل الدورة','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1053,0,'ar','labels','frontend.course.course_details','<span> معلومات الدورة. </span>','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1054,0,'ar','labels','frontend.course.course_name','اسم الدورة التدريبية','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1055,0,'ar','labels','frontend.course.course_reviews','تقييم الدورة التدريبية','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1056,0,'ar','labels','frontend.course.course_timeline','الجدول الزمني للدورة التدريبية','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1057,0,'ar','labels','frontend.course.course_type','تصنيف الدورة','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1058,0,'ar','labels','frontend.course.courses','الدورات','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1059,0,'ar','labels','frontend.course.details','التفاصيل','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1060,0,'ar','labels','frontend.course.download_files','تحميل ملفات','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1061,0,'ar','labels','frontend.course.enrolled','عدد المسجلين','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1062,0,'ar','labels','frontend.course.featured','متميز','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1063,0,'ar','labels','frontend.course.featured_course','<span> دورة مميزة </span>','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1064,0,'ar','labels','frontend.course.find_courses','البحث عن الدورات','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1065,0,'ar','labels','frontend.course.find_your_course','بحث عن الدورات التدريبية المتاحة','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1066,0,'ar','labels','frontend.course.full_text','نص كامل','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1067,0,'ar','labels','frontend.course.give_test_again','إعطاء اختبار مرة أخرى','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1068,0,'ar','labels','frontend.course.go','اذهب','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1069,0,'ar','labels','frontend.course.mb','MB','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1070,0,'ar','labels','frontend.course.message','رسالة','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1071,0,'ar','labels','frontend.course.next','التالى','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1072,0,'ar','labels','frontend.course.no_reviews_yet','لا توجد تعليقات حتى الآن.','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1073,0,'ar','labels','frontend.course.none','-','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1074,0,'ar','labels','frontend.course.popular','المتميزة','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1075,0,'ar','labels','frontend.course.prev','PREV','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1076,0,'ar','labels','frontend.course.price','السعر','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1077,0,'ar','labels','frontend.course.progress','تقدم','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1078,0,'ar','labels','frontend.course.ratings','تصنيفات','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1079,0,'ar','labels','frontend.course.recent_news','<span> الأخيرة </span> الأخبار.','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1080,0,'ar','labels','frontend.course.sort_by','<b> الترتيب </b> حسب','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1081,0,'ar','labels','frontend.course.stars','نجوم','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1082,0,'ar','labels','frontend.course.starts','تبدأ من','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1083,0,'ar','labels','frontend.course.students','الطلاب','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1084,0,'ar','labels','frontend.course.submit_results','إرسال النتائج','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1085,0,'ar','labels','frontend.course.test','اختبار','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1086,0,'ar','labels','frontend.course.title','دورة','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1087,0,'ar','labels','frontend.course.trending','الشائع','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1088,0,'ar','labels','frontend.course.view_all_news','عرض جميع الأخبار','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1089,0,'ar','labels','frontend.course.your_rating','تقييمك','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1090,0,'ar','labels','frontend.course.your_test_score','نقاط الاختبار الخاصة بك','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1091,0,'ar','labels','frontend.course.certified','أنت مسجل في هذه الدورة','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1092,0,'ar','labels','frontend.course.finish_course','الانتهاء من الدورة','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1093,0,'ar','labels','frontend.course.course','دورة','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1094,0,'ar','labels','frontend.course.bundle_detail','حزمة التفاصيل','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1095,0,'ar','labels','frontend.course.bundle_reviews','التقييمات','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1096,0,'ar','labels','frontend.course.bundles','المسارات التدريبية','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1097,0,'ar','labels','frontend.course.available_in_bundles','متاح أيضا في حزم','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1098,0,'ar','labels','frontend.course.complete_test','يرجى إكمال الاختبار','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1099,0,'ar','labels','frontend.course.looking_for','البحث عن؟','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1100,0,'ar','labels','frontend.course.get_now','سجل في الدورة','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1101,0,'ar','labels','frontend.course.explanation','تفسير','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1102,0,'ar','labels','frontend.course.not_attempted','لم تحاول','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1103,0,'ar','labels','frontend.course.find_your_bundle','<span> ابحث عن </span> الحزمة الخاصة بك','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1104,0,'ar','labels','frontend.course.select_category','اختر الفئة','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1105,0,'ar','labels','frontend.faq.contact_us','اتصل بنا','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1106,0,'ar','labels','frontend.faq.find','ابحث عن <span> أسئلتك وإجاباتك. </span>','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1107,0,'ar','labels','frontend.faq.make_question','كون سؤالا','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1108,0,'ar','labels','frontend.faq.title','بشكل متكرر <span> الأسئلة المتداولة </span>','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1109,0,'ar','labels','frontend.home.all_teachers','جميع المدربين','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1110,0,'ar','labels','frontend.home.learn_new_skills','تعلم مهارات جديدة','2020-02-27 05:33:59','2020-04-19 12:52:12'),
(1111,0,'ar','labels','frontend.home.online_available_courses','الدورات المتاحة على الانترنت','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1112,0,'ar','labels','frontend.home.our_professionals','المهنيين لدينا','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1113,0,'ar','labels','frontend.home.popular_teachers','<span> شائع </span> المعلمون','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1114,0,'ar','labels','frontend.home.search_course','بحث دورة','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1115,0,'ar','labels','frontend.home.search_course_placeholder','اكتب ماذا تريد أن تتعلم اليوم؟','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1116,0,'ar','labels','frontend.home.search_courses','<span> بحث </span> عن الدورات التدريبية.','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1117,0,'ar','labels','frontend.home.students_enrolled','الطلاب المسجلين','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1118,0,'ar','labels','frontend.home.teachers','معلمون','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1119,0,'ar','labels','frontend.home.title','الصفحة الرئيسية','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1120,0,'ar','labels','frontend.home.what_they_say_about_us','ماذا يقولون عنا','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1121,0,'ar','labels','frontend.home.no_data_available','لا يوجد بيانات','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1122,0,'ar','labels','frontend.layouts.partials.advantages','مزايا','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1123,0,'ar','labels','frontend.layouts.partials.browse_course_by_category','المسارات التدريبية','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1124,0,'ar','labels','frontend.layouts.partials.browse_featured_course','الدورات المتاحة','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1125,0,'ar','labels','frontend.layouts.partials.call_us_registration','اتصل بنا للحصول على تسجيل مجاني','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1126,0,'ar','labels','frontend.layouts.partials.contact_us','اتصل بنا','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1127,0,'ar','labels','frontend.layouts.partials.course_detail','تفاصيل الدورة','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1128,0,'ar','labels','frontend.layouts.partials.courses_categories','المسارات التدريبية','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1129,0,'ar','labels','frontend.layouts.partials.days','أيام','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1130,0,'ar','labels','frontend.layouts.partials.email_address','البريد الالكتروني','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1131,0,'ar','labels','frontend.layouts.partials.email_registration','مراسلتنا عبر البريد الإلكتروني للحصول على تسجيل مجاني','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1132,0,'ar','labels','frontend.layouts.partials.faq','التعليمات','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1133,0,'ar','labels','frontend.layouts.partials.faq_full','بشكل متكرر <span> الأسئلة المتداولة </span>','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1134,0,'ar','labels','frontend.layouts.partials.featured_course','<span> دورة مميزة </span>','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1135,0,'ar','labels','frontend.layouts.partials.get_in_touch','ابقى على تواصل','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1136,0,'ar','labels','frontend.layouts.partials.hours','ساعات','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1137,0,'ar','labels','frontend.layouts.partials.latest_news_blog','أحدث <span> مدونة الأخبار. </span>','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1138,0,'ar','labels','frontend.layouts.partials.learn_new_skills','تعلم مهارات جديدة','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1139,0,'ar','labels','frontend.layouts.partials.minutes','الدقائق','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1140,0,'ar','labels','frontend.layouts.partials.popular_courses','الدورات المتاحة','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1141,0,'ar','labels','frontend.layouts.partials.primary','ابتدائي','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1142,0,'ar','labels','frontend.layouts.partials.recent_news','<span> الأخيرة </span> الأخبار.','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1143,0,'ar','labels','frontend.layouts.partials.search_courses','البحث في الدورات','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1144,0,'ar','labels','frontend.layouts.partials.search_our_courses','بحث دوراتنا','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1145,0,'ar','labels','frontend.layouts.partials.search_placeholder','اكتب ماذا تريد أن تتعلم اليوم؟','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1146,0,'ar','labels','frontend.layouts.partials.second','ثانيا','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1147,0,'ar','labels','frontend.layouts.partials.seconds','ثواني','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1148,0,'ar','labels','frontend.layouts.partials.social_network','تواصل معنا','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1149,0,'ar','labels','frontend.layouts.partials.sponsors','الرعاة.','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1150,0,'ar','labels','frontend.layouts.partials.students','الطلاب','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1151,0,'ar','labels','frontend.layouts.partials.students_testimonial','الطلاب <span> شهادة. </span>','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1152,0,'ar','labels','frontend.layouts.partials.subscribe_newsletter','اشترك في النشرة الإخبارية','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1153,0,'ar','labels','frontend.layouts.partials.subscribe_now','إشترك الآن','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1154,0,'ar','labels','frontend.layouts.partials.trending_courses','الاتجاهات <span> الدورات التدريبية. </span>','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1155,0,'ar','labels','frontend.layouts.partials.view_all_news','عرض جميع الأخبار','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1156,0,'ar','labels','frontend.layouts.partials.view_all_popular_courses','عرض جميع الدورات الشعبية','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1157,0,'ar','labels','frontend.layouts.partials.view_all_trending_courses','عرض جميع الدورات التدريبية','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1158,0,'ar','labels','frontend.layouts.partials.why_choose','السبب في اختيار','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1159,0,'ar','labels','frontend.layouts.partials.certificate_verification','التحقق من الشهادة','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1160,0,'ar','labels','frontend.layouts.partials.more_faqs','المزيد من الأسئلة الشائعة','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1161,0,'ar','labels','frontend.layouts.partials.offers','عروض','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1162,0,'ar','labels','frontend.modal.already_user_note','لديك حساب ؟ دخول','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1163,0,'ar','labels','frontend.modal.login_now','دخول','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1164,0,'ar','labels','frontend.modal.login_register','<a href=\"#\" class=\"font-weight-bold go-login px-0\"> الدخول لحسابك</a> أو <a href=\"#\" class=\"font-weight-bold go-register px-0\" id=\"\">إنشاء حساب</a>','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1165,0,'ar','labels','frontend.modal.my_account','مرحبا بكم','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1166,0,'ar','labels','frontend.modal.new_user_note','ليس لديك حساب؟ حساب جديد','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1167,0,'ar','labels','frontend.modal.register_now','سجل الان','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1168,0,'ar','labels','frontend.modal.registration_message','تم التسجيل بنجاح الرجاء تسجيل الدخول','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1169,0,'ar','labels','frontend.passwords.expired_password_box_title','انتهت كلمة المرور الخاصة بك.','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1170,0,'ar','labels','frontend.passwords.forgot_password','لا تتذكر كلمة المرور؟','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1171,0,'ar','labels','frontend.passwords.reset_password_box_title','إعادة تعيين كلمة المرور','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1172,0,'ar','labels','frontend.passwords.reset_password_button','إعادة تعيين كلمة المرور','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1173,0,'ar','labels','frontend.passwords.send_password_reset_link_button','إرسال رابط إعادة تعيين كلمة المرور','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1174,0,'ar','labels','frontend.passwords.update_password_button','إرسال رابط إعادة تعيين كلمة المرور','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1175,0,'ar','labels','frontend.search_result.blog','مدونة','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1176,0,'ar','labels','frontend.search_result.course_detail','تفاصيل الدورة','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1177,0,'ar','labels','frontend.search_result.course_name','اسم الدورة التدريبية','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1178,0,'ar','labels','frontend.search_result.course_type','تصنيف الدورة','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1179,0,'ar','labels','frontend.search_result.featured','متميز','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1180,0,'ar','labels','frontend.search_result.none','-','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1181,0,'ar','labels','frontend.search_result.popular','جمع','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1182,0,'ar','labels','frontend.search_result.search_blog','بحث المدونة','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1183,0,'ar','labels','frontend.search_result.sort_by','<b> الترتيب </b> حسب','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1184,0,'ar','labels','frontend.search_result.starts','تبدأ من','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1185,0,'ar','labels','frontend.search_result.students','الطلاب','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1186,0,'ar','labels','frontend.search_result.trending','المتداول','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1187,0,'ar','labels','frontend.teacher.course_detail','التفاصيل','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1188,0,'ar','labels','frontend.teacher.courses_by_teacher','الدورات <span> حسب المدرب. </span>','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1189,0,'ar','labels','frontend.teacher.send_now','ارسل الان','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1190,0,'ar','labels','frontend.teacher.students','الطلاب','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1191,0,'ar','labels','frontend.teacher.title','المدربون','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1192,0,'ar','labels','frontend.user.passwords.change','غير كلمة المرور','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1193,0,'ar','labels','frontend.user.profile.avatar','الصورة الرمزية','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1194,0,'ar','labels','frontend.user.profile.created_at','أنشئت في','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1195,0,'ar','labels','frontend.user.profile.edit_information','تعديل المعلومات','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1196,0,'ar','labels','frontend.user.profile.email','البريد الإلكتروني','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1197,0,'ar','labels','frontend.user.profile.first_name','الاسم الاول','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1198,0,'ar','labels','frontend.user.profile.last_name','الكنية','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1199,0,'ar','labels','frontend.user.profile.last_updated','آخر تحديث','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1200,0,'ar','labels','frontend.user.profile.name','اسم','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1201,0,'ar','labels','frontend.user.profile.update_information','تحديث المعلومات','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1202,0,'ar','labels','frontend.certificate_verification.date_on_certificate','تاريخ الشهادة.مثال 2020-11-25','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1203,0,'ar','labels','frontend.certificate_verification.name_on_certificate','الأسم المكتوب في الشهادة','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1204,0,'ar','labels','frontend.certificate_verification.not_found','لم يتم العثور على شهادة للمعلومات المقدمة.','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1205,0,'ar','labels','frontend.certificate_verification.title','التحقق من الشهادة','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1206,0,'ar','labels','frontend.certificate_verification.verify_now','تحقق الآن','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1207,0,'ar','labels','frontend.footer.featured_courses','دورات مميزة','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1208,0,'ar','labels','frontend.footer.popular_categories','فئات شعبية','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1209,0,'ar','labels','frontend.footer.popular_courses','دورات شعبية','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1210,0,'ar','labels','frontend.footer.trending_courses','تتجه الدورات','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1211,0,'ar','labels','frontend.footer.useful_links','روابط سريعة','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1212,0,'ar','labels','frontend.offers.minimum_order_amount','الحد الأدنى للطلب','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1213,0,'ar','labels','frontend.offers.no_offers','لا عروض','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1214,0,'ar','labels','frontend.offers.per_user','لكل مستخدم','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1215,0,'ar','labels','frontend.offers.title','عروض','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1216,0,'ar','labels','frontend.offers.unlimited','غير محدود','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1217,0,'ar','labels','frontend.offers.usage','استعمال','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1218,0,'ar','labels','frontend.offers.validity','صلاحية','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1219,0,'ar','labels','teacher.teacher_register','انضم كمحاضر','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1220,0,'ar','labels','teacher.teacher_register_box_title','تسجيل','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1221,0,'ar','labels','teacher.facebook_link','فيسبوك لينك','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1222,0,'ar','labels','teacher.twitter_link','رابط تويتر','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1223,0,'ar','labels','teacher.linkedin_link','لينكدين لينك','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1224,0,'ar','labels','teacher.payment_details','بيانات الدفع','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1225,0,'ar','labels','teacher.bank','بنك','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1226,0,'ar','labels','teacher.paypal','باي بال','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1227,0,'ar','labels','teacher.paypal_email','بريد باي بال','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1228,0,'ar','labels','teacher.bank_details.name','اسم البنك','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1229,0,'ar','labels','teacher.bank_details.ifsc_code','كود IFSC','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1230,0,'ar','labels','teacher.bank_details.account','رقم حساب','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1231,0,'ar','labels','teacher.bank_details.holder_name','أسم الحساب','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1232,0,'ar','labels','teacher.bank_details.account_number','رقم حساب','2020-02-27 05:34:00','2020-04-19 12:52:12'),
(1233,0,'ar','menus','backend.access.roles.all','كل الأدوار','2020-02-27 05:34:00','2020-04-17 10:54:03'),
(1234,0,'ar','menus','backend.access.roles.create','خلق دور','2020-02-27 05:34:00','2020-04-17 10:54:03'),
(1235,0,'ar','menus','backend.access.roles.edit','تحرير الدور','2020-02-27 05:34:00','2020-04-17 10:54:03'),
(1236,0,'ar','menus','backend.access.roles.main','الأدوار','2020-02-27 05:34:00','2020-04-17 10:54:03'),
(1237,0,'ar','menus','backend.access.roles.management','إدارة الدور','2020-02-27 05:34:00','2020-04-17 10:54:03'),
(1238,0,'ar','menus','backend.access.title','ادارة المستخدمين','2020-02-27 05:34:00','2020-04-17 10:54:03'),
(1239,0,'ar','menus','backend.access.users.all','جميع المستخدمين','2020-02-27 05:34:00','2020-04-17 10:54:03'),
(1240,0,'ar','menus','backend.access.users.change-password','غير كلمة المرور','2020-02-27 05:34:00','2020-04-17 10:54:03'),
(1241,0,'ar','menus','backend.access.users.create','إنشاء مستخدم','2020-02-27 05:34:00','2020-04-17 10:54:03'),
(1242,0,'ar','menus','backend.access.users.deactivated','المستخدمين المعطلين','2020-02-27 05:34:00','2020-04-17 10:54:03'),
(1243,0,'ar','menus','backend.access.users.deleted','حذف المستخدمين','2020-02-27 05:34:00','2020-04-17 10:54:03'),
(1244,0,'ar','menus','backend.access.users.edit','تحرير العضو','2020-02-27 05:34:00','2020-04-17 10:54:03'),
(1245,0,'ar','menus','backend.access.users.main','المستخدمين','2020-02-27 05:34:00','2020-04-17 10:54:03'),
(1246,0,'ar','menus','backend.access.users.view','عرض المستخدم','2020-02-27 05:34:00','2020-04-17 10:54:03'),
(1247,0,'ar','menus','backend.log-viewer.dashboard','تدقيق لوحة الاعدادات','2020-02-27 05:34:00','2020-04-17 10:54:03'),
(1248,0,'ar','menus','backend.log-viewer.logs','سجلات','2020-02-27 05:34:00','2020-04-17 10:54:03'),
(1249,0,'ar','menus','backend.log-viewer.main','السجل','2020-02-27 05:34:00','2020-04-17 10:54:03'),
(1250,0,'ar','menus','backend.sidebar.account.title','الحساب','2020-02-27 05:34:00','2020-04-17 10:54:03'),
(1251,0,'ar','menus','backend.sidebar.backup.title','الحفظ الاحتياطي','2020-02-27 05:34:00','2020-04-17 10:54:03'),
(1252,0,'ar','menus','backend.sidebar.blogs.title','مدونة','2020-02-27 05:34:00','2020-04-17 10:54:03'),
(1253,0,'ar','menus','backend.sidebar.categories.title','الاقسام','2020-02-27 05:34:00','2020-04-17 10:54:03'),
(1254,0,'ar','menus','backend.sidebar.change-password.title','غير كلمة المرور','2020-02-27 05:34:00','2020-04-17 10:54:03'),
(1255,0,'ar','menus','backend.sidebar.contact.title','اتصل','2020-02-27 05:34:00','2020-04-17 10:54:03'),
(1256,0,'ar','menus','backend.sidebar.contacts.title','يؤدي','2020-02-27 05:34:00','2020-04-17 10:54:03'),
(1257,0,'ar','menus','backend.sidebar.courses.manage','إدارة الدورات','2020-02-27 05:34:00','2020-04-17 10:54:03'),
(1258,0,'ar','menus','backend.sidebar.courses.management','إدارة الدورات','2020-02-27 05:34:00','2020-04-17 10:54:03'),
(1259,0,'ar','menus','backend.sidebar.courses.title','الدورات','2020-02-27 05:34:00','2020-04-17 10:54:03'),
(1260,0,'ar','menus','backend.sidebar.dashboard','لوحة الإعدادات','2020-02-27 05:34:00','2020-04-17 10:54:03'),
(1261,0,'ar','menus','backend.sidebar.debug-site.title','تصحيح الموقع','2020-02-27 05:34:00','2020-04-17 10:54:03'),
(1262,0,'ar','menus','backend.sidebar.faqs.title','أسئلة وأجوبة','2020-02-27 05:34:00','2020-04-17 10:54:03'),
(1263,0,'ar','menus','backend.sidebar.footer.title','تذييل','2020-02-27 05:34:00','2020-04-17 10:54:03'),
(1264,0,'ar','menus','backend.sidebar.general','اعدادات عامة','2020-02-27 05:34:00','2020-04-17 10:54:03'),
(1265,0,'ar','menus','backend.sidebar.hero-slider.title','عنوان السلايدر','2020-02-27 05:34:00','2020-04-17 10:54:03'),
(1266,0,'ar','menus','backend.sidebar.history','التاريخ','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1267,0,'ar','menus','backend.sidebar.invoices.title','الفواتير','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1268,0,'ar','menus','backend.sidebar.lessons.title','الدروس','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1269,0,'ar','menus','backend.sidebar.menu-manager.title','ادارة القوائم','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1270,0,'ar','menus','backend.sidebar.messages.title','رسائل','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1271,0,'ar','menus','backend.sidebar.newsletter-configuration.title','تكوين النشرة الإخبارية','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1272,0,'ar','menus','backend.sidebar.orders.title','الطلبات','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1273,0,'ar','menus','backend.sidebar.pages.title','مدير الصفحات','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1274,0,'ar','menus','backend.sidebar.questions-options.title','خيارات الأسئلة','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1275,0,'ar','menus','backend.sidebar.questions.title','الأسئلة','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1276,0,'ar','menus','backend.sidebar.reasons.title','أسباب','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1277,0,'ar','menus','backend.sidebar.reviews.title','التعليقات','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1278,0,'ar','menus','backend.sidebar.settings.general','اعدادات عامة','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1279,0,'ar','menus','backend.sidebar.settings.social-login','تسجيل الدخول الاجتماعي','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1280,0,'ar','menus','backend.sidebar.settings.title','الإعدادات','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1281,0,'ar','menus','backend.sidebar.site-management.title','إدارة الموقع','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1282,0,'ar','menus','backend.sidebar.sponsors.title','الرعاة','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1283,0,'ar','menus','backend.sidebar.system','النظام','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1284,0,'ar','menus','backend.sidebar.teachers.title','المدربون','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1285,0,'ar','menus','backend.sidebar.testimonials.title','الشهادات - التوصيات','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1286,0,'ar','menus','backend.sidebar.tests.title','اختبارات','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1287,0,'ar','menus','backend.sidebar.translations.title','ادارة الترجمة','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1288,0,'ar','menus','backend.sidebar.update.title','تحديث','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1289,0,'ar','menus','backend.sidebar.certificates.title','شهادات','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1290,0,'ar','menus','backend.sidebar.bundles.title','المجموعات','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1291,0,'ar','menus','backend.sidebar.reports.sales','مبيعات','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1292,0,'ar','menus','backend.sidebar.reports.students','الطلاب','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1293,0,'ar','menus','backend.sidebar.reports.title','تقارير','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1294,0,'ar','menus','backend.sidebar.coupons.title','كوبونات','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1295,0,'ar','menus','backend.sidebar.sitemap.title','خريطة الموقع','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1296,0,'ar','menus','backend.sidebar.tax.title','ضريبة','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1297,0,'ar','menus','backend.sidebar.forums-category.title','فئات المنتديات','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1298,0,'ar','menus','backend.sidebar.payments.title','المدفوعات','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1299,0,'ar','menus','backend.sidebar.payments_requests.title','طلب الدفع','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1300,1,'ar','menus','language-picker.langs.ar','العربية','2020-02-27 05:34:01','2020-04-19 11:27:23'),
(1301,0,'ar','menus','language-picker.langs.en','الإنجليزية','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1302,0,'ar','menus','language-picker.langs.fr','الفرنسية','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1303,0,'ar','menus','language-picker.langs.es','الأسبانية','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1304,0,'ar','menus','language-picker.langs.zh','صينى','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1305,0,'ar','menus','language-picker.langs.zh-TW','تقاليد صينية','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1306,0,'ar','menus','language-picker.langs.da','دانماركي','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1307,0,'ar','menus','language-picker.langs.de','ألمانية','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1308,0,'ar','menus','language-picker.langs.el','الإغريقي','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1309,0,'ar','menus','language-picker.langs.fa','اللغة الفارسية','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1310,0,'ar','menus','language-picker.langs.he','اللغة العبرية','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1311,0,'ar','menus','language-picker.langs.id','الأندونيسية','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1312,0,'ar','menus','language-picker.langs.it','الإيطالي','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1313,0,'ar','menus','language-picker.langs.ja','اليابانية','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1314,0,'ar','menus','language-picker.langs.nl','هولندي','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1315,0,'ar','menus','language-picker.langs.no','النرويجية','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1316,0,'ar','menus','language-picker.langs.pt_BR','البرتغالية (البرازيل).','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1317,0,'ar','menus','language-picker.langs.ru','الروسية','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1318,0,'ar','menus','language-picker.langs.sv','اللغة السويدية','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1319,0,'ar','menus','language-picker.langs.th','التايلاندية','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1320,0,'ar','menus','language-picker.langs.tr','اللغة التركية','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1321,0,'ar','menus','language-picker.langs.af','الأفريكانية','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1322,0,'ar','menus','language-picker.langs.ak','اكان','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1323,0,'ar','menus','language-picker.langs.sq_AL','ألباني (ألبانيا)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1324,0,'ar','menus','language-picker.langs.sq','الألبانية','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1325,0,'ar','menus','language-picker.langs.am_ET','الأمهرية (إثيوبيا)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1326,0,'ar','menus','language-picker.langs.am','الأمهرية','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1327,0,'ar','menus','language-picker.langs.ar_DZ','العربية (الجزائر)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1328,0,'ar','menus','language-picker.langs.ar_BH','العربية (البحرين)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1329,0,'ar','menus','language-picker.langs.ar_EG','العربية (مصر)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1330,0,'ar','menus','language-picker.langs.ar_IQ','العربية (العراق)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1331,0,'ar','menus','language-picker.langs.ar_JO','العربية (الأردن)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1332,0,'ar','menus','language-picker.langs.ar_KW','العربية (الكويت)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1333,0,'ar','menus','language-picker.langs.ar_LB','العربية (لبنان)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1334,0,'ar','menus','language-picker.langs.ar_LY','العربية (ليبيا)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1335,0,'ar','menus','language-picker.langs.ar_MA','العربية (المغرب)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1336,0,'ar','menus','language-picker.langs.ar_OM','العربية (عمان)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1337,0,'ar','menus','language-picker.langs.ar_QA','العربية (قطر)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1338,0,'ar','menus','language-picker.langs.ar_SA','العربية (العربية السعودية)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1339,0,'ar','menus','language-picker.langs.ar_SD','العربية (السودان)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1340,0,'ar','menus','language-picker.langs.ar_SY','العربية (سوريا)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1341,0,'ar','menus','language-picker.langs.ar_TN','العربية (تونس)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1342,0,'ar','menus','language-picker.langs.ar_AE','العربية (الإمارات العربية)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1343,0,'ar','menus','language-picker.langs.ar_YE','العربية (اليمن)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1344,0,'ar','menus','language-picker.langs.hy_AM','أرميني (أرمينيا)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1345,0,'ar','menus','language-picker.langs.hy','الأرميني','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1346,0,'ar','menus','language-picker.langs.as_IN','الأسامية (الهند)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1347,0,'ar','menus','language-picker.langs.as','الأسامية','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1348,0,'ar','menus','language-picker.langs.asa_TZ','أسو (تنزانيا)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1349,0,'ar','menus','language-picker.langs.asa','جامعة ولاية أريزونا','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1350,0,'ar','menus','language-picker.langs.az_Cyrl','الأذربيجاني (السيريلية)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1351,0,'ar','menus','language-picker.langs.az_Cyrl_AZ','أذربيجان (السيريلية ، أذربيجان)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1352,0,'ar','menus','language-picker.langs.az_Latn','أذربيجان (لاتينية)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1353,0,'ar','menus','language-picker.langs.az_Latn_AZ','أذربيجان (اللاتينية ، أذربيجان)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1354,0,'ar','menus','language-picker.langs.az','أذربيجان','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1355,0,'ar','menus','language-picker.langs.bm_ML','بامبارا (مالي)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1356,0,'ar','menus','language-picker.langs.bm','البامبارا','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1357,0,'ar','menus','language-picker.langs.eu_ES','الباسك (اسبانيا)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1358,0,'ar','menus','language-picker.langs.eu','الباسكي','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1359,0,'ar','menus','language-picker.langs.be_BY','البيلوروسية (بيلاروسيا)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1360,0,'ar','menus','language-picker.langs.be','البيلاروسية','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1361,0,'ar','menus','language-picker.langs.bem_ZM','بيمبا (زامبيا)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1362,0,'ar','menus','language-picker.langs.bem','بمبا','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1363,0,'ar','menus','language-picker.langs.bez_TZ','بينا (تنزانيا)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1364,0,'ar','menus','language-picker.langs.bez','بينا','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1365,0,'ar','menus','language-picker.langs.bn_BD','البنغالية (بنغلاديش)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1366,0,'ar','menus','language-picker.langs.bn_IN','البنغالية (الهند)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1367,0,'ar','menus','language-picker.langs.bn','بنغالي','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1368,0,'ar','menus','language-picker.langs.bs_BA','البوسنية (البوسنة والهرسك)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1369,0,'ar','menus','language-picker.langs.bs','البوسنية','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1370,0,'ar','menus','language-picker.langs.bg_BG','البلغارية (بلغاريا)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1371,0,'ar','menus','language-picker.langs.bg','البلغارية','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1372,0,'ar','menus','language-picker.langs.my_MM','البورمية (ميانمار [بورما])','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1373,0,'ar','menus','language-picker.langs.my','البورمية','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1374,0,'ar','menus','language-picker.langs.yue_Hant_HK','الكانتونية (التقليدية ، هونج كونج SAR الصين)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1375,0,'ar','menus','language-picker.langs.ca_ES','الكاتالانية (اسبانيا)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1376,0,'ar','menus','language-picker.langs.ca','الكاتالونية','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1377,0,'ar','menus','language-picker.langs.tzm_Latn','الأمازيغية الوسطى المغرب (لاتيني)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1378,0,'ar','menus','language-picker.langs.tzm_Latn_MA','الأمازيغية الوسطى المغرب (اللاتينية ، المغرب)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1379,0,'ar','menus','language-picker.langs.tzm','وسط المغرب الأمازيغية','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1380,0,'ar','menus','language-picker.langs.chr_US','شيروكي (الولايات المتحدة)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1381,0,'ar','menus','language-picker.langs.chr','شيروكي','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1382,0,'ar','menus','language-picker.langs.cgg_UG','شيغا (أوغندا)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1383,0,'ar','menus','language-picker.langs.cgg','Chiga','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1384,0,'ar','menus','language-picker.langs.zh_Hans','الصينية (هان المبسطة)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1385,0,'ar','menus','language-picker.langs.zh_Hans_CN','الصينية (هان المبسطة ، الصين)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1386,0,'ar','menus','language-picker.langs.zh_Hans_HK','الصينية (هان المبسطة ، هونغ كونغ ، الصين)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1387,0,'ar','menus','language-picker.langs.zh_Hans_MO','الصينية (هان المبسطة ، ماكاو SAR الصين)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1388,0,'ar','menus','language-picker.langs.zh_Hans_SG','الصينية (هان المبسطة ، سنغافورة)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1389,0,'ar','menus','language-picker.langs.zh_Hant','الصينية (هان التقليدية)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1390,0,'ar','menus','language-picker.langs.zh_Hant_HK','الصينية (هان التقليدية ، هونج كونج SAR الصين)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1391,0,'ar','menus','language-picker.langs.zh_Hant_MO','الصينية (هان التقليدية ، ماكاو SAR الصين)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1392,0,'ar','menus','language-picker.langs.zh_Hant_TW','الصينية (هان التقليدية ، تايوان)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1393,0,'ar','menus','language-picker.langs.kw_GB','كورنيش (المملكة المتحدة)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1394,0,'ar','menus','language-picker.langs.kw','كورنيش','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1395,0,'ar','menus','language-picker.langs.hr_HR','الكرواتية (كرواتيا)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1396,0,'ar','menus','language-picker.langs.hr','الكرواتية','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1397,0,'ar','menus','language-picker.langs.cs_CZ','التشيكية (الجمهورية التشيكية)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1398,0,'ar','menus','language-picker.langs.cs','تشيكي','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1399,0,'ar','menus','language-picker.langs.da_DK','الدانمركية (الدنمارك)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1400,0,'ar','menus','language-picker.langs.nl_BE','الهولندية (بلجيكا)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1401,0,'ar','menus','language-picker.langs.nl_NL','الهولندية (هولندا)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1402,0,'ar','menus','language-picker.langs.ebu_KE','امبو (كينيا)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1403,0,'ar','menus','language-picker.langs.ebu','إمبو','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1404,0,'ar','menus','language-picker.langs.en_AS','الإنجليزية (ساموا الأمريكية)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1405,0,'ar','menus','language-picker.langs.en_AU','الإنجليزية (أستراليا)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1406,0,'ar','menus','language-picker.langs.en_BE','الإنجليزية (بلجيكا)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1407,0,'ar','menus','language-picker.langs.en_BZ','الإنجليزية (بليز)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1408,0,'ar','menus','language-picker.langs.en_BW','الإنجليزية (بوتسوانا)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1409,0,'ar','menus','language-picker.langs.en_CA','الإنجليزية (كندا)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1410,0,'ar','menus','language-picker.langs.en_GU','الإنجليزية (غوام)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1411,0,'ar','menus','language-picker.langs.en_HK','الإنجليزية (هونج كونج SAR الصين)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1412,0,'ar','menus','language-picker.langs.en_IN','الإنجليزية (الهند)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1413,0,'ar','menus','language-picker.langs.en_IE','الإنجليزية (أيرلندا)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1414,0,'ar','menus','language-picker.langs.en_IL','الإنجليزية (إسرائيل)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1415,0,'ar','menus','language-picker.langs.en_JM','الإنجليزية (جامايكا)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1416,0,'ar','menus','language-picker.langs.en_MT','الإنجليزية (مالطا)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1417,0,'ar','menus','language-picker.langs.en_MH','الإنجليزية (جزر مارشال)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1418,0,'ar','menus','language-picker.langs.en_MU','الإنجليزية (موريشيوس)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1419,0,'ar','menus','language-picker.langs.en_NA','الإنجليزية (ناميبيا)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1420,0,'ar','menus','language-picker.langs.en_NZ','الإنجليزية (نيوزيلندا)','2020-02-27 05:34:01','2020-04-17 10:54:03'),
(1421,0,'ar','menus','language-picker.langs.en_MP','الإنجليزية (جزر ماريانا الشمالية)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1422,0,'ar','menus','language-picker.langs.en_PK','الإنجليزية (باكستان)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1423,0,'ar','menus','language-picker.langs.en_PH','الإنجليزية (الفلبين)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1424,0,'ar','menus','language-picker.langs.en_SG','الإنجليزية (سنغافورة)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1425,0,'ar','menus','language-picker.langs.en_ZA','الإنجليزية (جنوب إفريقيا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1426,0,'ar','menus','language-picker.langs.en_TT','الإنجليزية (ترينيداد وتوباغو)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1427,0,'ar','menus','language-picker.langs.en_UM','الإنجليزية (الجزر الصغيرة البعيدة للولايات المتحدة)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1428,0,'ar','menus','language-picker.langs.en_VI','الإنجليزية (جزر فيرجن الأمريكية)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1429,0,'ar','menus','language-picker.langs.en_GB','الإنجليزية (المملكة المتحدة)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1430,0,'ar','menus','language-picker.langs.en_US','انجليزية الولايات المتحدة)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1431,0,'ar','menus','language-picker.langs.en_ZW','الإنجليزية (زيمبابوي)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1432,0,'ar','menus','language-picker.langs.eo','الاسبرانتو','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1433,0,'ar','menus','language-picker.langs.et_EE','الإستونية (إستونيا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1434,0,'ar','menus','language-picker.langs.et','الإستونية','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1435,0,'ar','menus','language-picker.langs.ee_GH','إوي (غانا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1436,0,'ar','menus','language-picker.langs.ee_TG','إوي (توغو)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1437,0,'ar','menus','language-picker.langs.ee','نعجة','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1438,0,'ar','menus','language-picker.langs.fo_FO','جزر فارو (جزر فارو)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1439,0,'ar','menus','language-picker.langs.fo','جزر فارو','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1440,0,'ar','menus','language-picker.langs.fil_PH','فلبيني (الفلبين)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1441,0,'ar','menus','language-picker.langs.fil','الفلبينية','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1442,0,'ar','menus','language-picker.langs.fi_FI','الفنلندية (فنلندا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1443,0,'ar','menus','language-picker.langs.fi','اللغة الفنلندية','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1444,0,'ar','menus','language-picker.langs.fr_BE','الفرنسية (بلجيكا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1445,0,'ar','menus','language-picker.langs.fr_BJ','الفرنسية (بنين)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1446,0,'ar','menus','language-picker.langs.fr_BF','الفرنسية (بوركينا فاسو)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1447,0,'ar','menus','language-picker.langs.fr_BI','الفرنسية (بوروندي)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1448,0,'ar','menus','language-picker.langs.fr_CM','الفرنسية (الكاميرون)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1449,0,'ar','menus','language-picker.langs.fr_CA','الفرنسية (كندا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1450,0,'ar','menus','language-picker.langs.fr_CF','الفرنسية (جمهورية إفريقيا الوسطى)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1451,0,'ar','menus','language-picker.langs.fr_TD','الفرنسية (تشاد)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1452,0,'ar','menus','language-picker.langs.fr_KM','الفرنسية (جزر القمر)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1453,0,'ar','menus','language-picker.langs.fr_CG','الفرنسية (الكونغو - برازافيل)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1454,0,'ar','menus','language-picker.langs.fr_CD','الفرنسية (الكونغو - كينشاسا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1455,0,'ar','menus','language-picker.langs.fr_CI','الفرنسية (كوت ديفوار)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1456,0,'ar','menus','language-picker.langs.fr_DJ','الفرنسية (جيبوتي)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1457,0,'ar','menus','language-picker.langs.fr_GQ','الفرنسية (غينيا الاستوائية)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1458,0,'ar','menus','language-picker.langs.fr_FR','فرنسا الفرنسية)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1459,0,'ar','menus','language-picker.langs.fr_GA','الفرنسية (الغابون)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1460,0,'ar','menus','language-picker.langs.fr_GP','الفرنسية (جوادلوب)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1461,0,'ar','menus','language-picker.langs.fr_GN','الفرنسية (غينيا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1462,0,'ar','menus','language-picker.langs.fr_LU','الفرنسية (لوكسمبورغ)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1463,0,'ar','menus','language-picker.langs.fr_MG','الفرنسية (مدغشقر)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1464,0,'ar','menus','language-picker.langs.fr_ML','الفرنسية (مالي)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1465,0,'ar','menus','language-picker.langs.fr_MQ','الفرنسية (المارتينيك)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1466,0,'ar','menus','language-picker.langs.fr_MC','الفرنسية (موناكو)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1467,0,'ar','menus','language-picker.langs.fr_NE','الفرنسية (النيجر)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1468,0,'ar','menus','language-picker.langs.fr_RW','الفرنسية (رواندا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1469,0,'ar','menus','language-picker.langs.fr_RE','الفرنسية (ريونيون)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1470,0,'ar','menus','language-picker.langs.fr_BL','الفرنسية (سانت بارتيليمي)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1471,0,'ar','menus','language-picker.langs.fr_MF','الفرنسية (سانت مارتن)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1472,0,'ar','menus','language-picker.langs.fr_SN','الفرنسية (السنغال)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1473,0,'ar','menus','language-picker.langs.fr_CH','الفرنسية (سويسرا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1474,0,'ar','menus','language-picker.langs.fr_TG','الفرنسية (توغو)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1475,0,'ar','menus','language-picker.langs.ff_SN','فولاه (السنغال)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1476,0,'ar','menus','language-picker.langs.ff','الفلة','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1477,0,'ar','menus','language-picker.langs.gl_ES','غاليسيان (اسبانيا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1478,0,'ar','menus','language-picker.langs.gl','الجاليكية','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1479,0,'ar','menus','language-picker.langs.lg_UG','جاندا (أوغندا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1480,0,'ar','menus','language-picker.langs.lg','غاندا','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1481,0,'ar','menus','language-picker.langs.ka_GE','الجورجية (جورجيا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1482,0,'ar','menus','language-picker.langs.ka','الجورجية','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1483,0,'ar','menus','language-picker.langs.de_AT','الألمانية (النمسا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1484,0,'ar','menus','language-picker.langs.de_BE','الألمانية (بلجيكا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1485,0,'ar','menus','language-picker.langs.de_DE','الألمانية ألمانيا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1486,0,'ar','menus','language-picker.langs.de_LI','الألمانية (ليختنشتاين)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1487,0,'ar','menus','language-picker.langs.de_LU','الألمانية (لوكسمبورغ)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1488,0,'ar','menus','language-picker.langs.de_CH','الألمانية (سويسرا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1489,0,'ar','menus','language-picker.langs.el_CY','اليونانية (قبرص)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1490,0,'ar','menus','language-picker.langs.el_GR','اليونانية (اليونان)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1491,0,'ar','menus','language-picker.langs.gu_IN','غوجاراتي (الهند)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1492,0,'ar','menus','language-picker.langs.gu','الغوجاراتية','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1493,0,'ar','menus','language-picker.langs.guz_KE','جوسي (كينيا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1494,0,'ar','menus','language-picker.langs.guz','Gusii','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1495,0,'ar','menus','language-picker.langs.ha_Latn','الهوسا (اللاتينية)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1496,0,'ar','menus','language-picker.langs.ha_Latn_GH','الهوسا (اللاتينية ، غانا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1497,0,'ar','menus','language-picker.langs.ha_Latn_NE','الهوسا (اللاتينية ، النيجر)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1498,0,'ar','menus','language-picker.langs.ha_Latn_NG','الهوسا (اللاتينية ، نيجيريا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1499,0,'ar','menus','language-picker.langs.ha','الهوسا','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1500,0,'ar','menus','language-picker.langs.haw_US','هاواي (الولايات المتحدة)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1501,0,'ar','menus','language-picker.langs.haw','هاواي','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1502,0,'ar','menus','language-picker.langs.he_IL','العبرية (إسرائيل)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1503,0,'ar','menus','language-picker.langs.hi_IN','الهندية (الهند)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1504,0,'ar','menus','language-picker.langs.hi','الهندية','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1505,0,'ar','menus','language-picker.langs.hu_HU','الهنغارية (المجر)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1506,0,'ar','menus','language-picker.langs.hu','الهنغارية','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1507,0,'ar','menus','language-picker.langs.is_IS','الآيسلندية (أيسلندا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1508,0,'ar','menus','language-picker.langs.is','أيسلندي','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1509,0,'ar','menus','language-picker.langs.ig_NG','ايجبو (نيجيريا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1510,0,'ar','menus','language-picker.langs.ig','الإيبو','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1511,0,'ar','menus','language-picker.langs.id_ID','الاندونيسية (اندونيسيا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1512,0,'ar','menus','language-picker.langs.ga_IE','الأيرلندية (أيرلندا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1513,0,'ar','menus','language-picker.langs.ga','الأيرلندية','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1514,0,'ar','menus','language-picker.langs.it_IT','الإيطالية (إيطاليا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1515,0,'ar','menus','language-picker.langs.it_CH','الإيطالية (سويسرا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1516,0,'ar','menus','language-picker.langs.ja_JP','اليابانية (اليابان)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1517,0,'ar','menus','language-picker.langs.kea_CV','كابوفيرديانو (الرأس الأخضر)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1518,0,'ar','menus','language-picker.langs.kea','Kabuverdianu','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1519,0,'ar','menus','language-picker.langs.kab_DZ','القبائل (الجزائر)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1520,0,'ar','menus','language-picker.langs.kab','القبائل','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1521,0,'ar','menus','language-picker.langs.kl_GL','كالايسوت (جرينلاند)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1522,0,'ar','menus','language-picker.langs.kl','الكالاليست','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1523,0,'ar','menus','language-picker.langs.kln_KE','كالينجين (كينيا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1524,0,'ar','menus','language-picker.langs.kln','كالينجين','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1525,0,'ar','menus','language-picker.langs.kam_KE','كامبا (كينيا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1526,0,'ar','menus','language-picker.langs.kam','كامبا','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1527,0,'ar','menus','language-picker.langs.kn_IN','كانادا (الهند)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1528,0,'ar','menus','language-picker.langs.kn','الكانادا','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1529,0,'ar','menus','language-picker.langs.kk_Cyrl','الكازاخستانية (السيريلية)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1530,0,'ar','menus','language-picker.langs.kk_Cyrl_KZ','الكازاخستانية (السيريلية ، كازاخستان)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1531,0,'ar','menus','language-picker.langs.kk','الكازاخية','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1532,0,'ar','menus','language-picker.langs.km_KH','الخمير (كمبوديا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1533,0,'ar','menus','language-picker.langs.km','الخمير','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1534,0,'ar','menus','language-picker.langs.ki_KE','كيكويو (كينيا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1535,0,'ar','menus','language-picker.langs.ki','الكيكويو','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1536,0,'ar','menus','language-picker.langs.rw_RW','كينيارواندا (رواندا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1537,0,'ar','menus','language-picker.langs.rw','الكينيارواندية','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1538,0,'ar','menus','language-picker.langs.kok_IN','كونكاني (الهند)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1539,0,'ar','menus','language-picker.langs.kok','الكونكانية','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1540,0,'ar','menus','language-picker.langs.ko_KR','الكورية (كوريا الجنوبية)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1541,0,'ar','menus','language-picker.langs.ko','الكورية','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1542,0,'ar','menus','language-picker.langs.khq_ML','كويرا تشيني (مالي)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1543,0,'ar','menus','language-picker.langs.khq','كويرا تشيني','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1544,0,'ar','menus','language-picker.langs.ses_ML','كويرابورو سيني (مالي)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1545,0,'ar','menus','language-picker.langs.ses','كويرابورو سيني','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1546,0,'ar','menus','language-picker.langs.lag_TZ','لانجي (تنزانيا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1547,0,'ar','menus','language-picker.langs.lag','Langi','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1548,0,'ar','menus','language-picker.langs.lv_LV','لاتفيا (لاتفيا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1549,0,'ar','menus','language-picker.langs.lv','اللاتفية','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1550,0,'ar','menus','language-picker.langs.lt_LT','الليتوانية (ليتوانيا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1551,0,'ar','menus','language-picker.langs.lt','اللتوانية','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1552,0,'ar','menus','language-picker.langs.luo_KE','لوه (كينيا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1553,0,'ar','menus','language-picker.langs.luo','لوه','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1554,0,'ar','menus','language-picker.langs.luy_KE','لوييا (كينيا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1555,0,'ar','menus','language-picker.langs.luy','Luyia','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1556,0,'ar','menus','language-picker.langs.mk_MK','المقدونية (مقدونيا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1557,0,'ar','menus','language-picker.langs.mk','المقدونية','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1558,0,'ar','menus','language-picker.langs.jmc_TZ','ماتشامي (تنزانيا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1559,0,'ar','menus','language-picker.langs.jmc','Machame','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1560,0,'ar','menus','language-picker.langs.kde_TZ','ماكوندي (تنزانيا)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1561,0,'ar','menus','language-picker.langs.kde','ماكوندي','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1562,0,'ar','menus','language-picker.langs.mg_MG','مدغشقر (مدغشقر)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1563,0,'ar','menus','language-picker.langs.mg','مدغشقر','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1564,0,'ar','menus','language-picker.langs.ms_BN','الملايو (بروناي)','2020-02-27 05:34:02','2020-04-17 10:54:03'),
(1565,0,'ar','menus','language-picker.langs.ms_MY','الملايو (ماليزيا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1566,0,'ar','menus','language-picker.langs.ms','لغة الملايو','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1567,0,'ar','menus','language-picker.langs.ml_IN','مليالم (الهند)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1568,0,'ar','menus','language-picker.langs.ml','المالايالامية','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1569,0,'ar','menus','language-picker.langs.mt_MT','المالطية (مالطا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1570,0,'ar','menus','language-picker.langs.mt','المالطية','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1571,0,'ar','menus','language-picker.langs.gv_GB','مانكس (المملكة المتحدة)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1572,0,'ar','menus','language-picker.langs.gv','مانكس','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1573,0,'ar','menus','language-picker.langs.mr_IN','ماراثي (الهند)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1574,0,'ar','menus','language-picker.langs.mr','المهاراتية','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1575,0,'ar','menus','language-picker.langs.mas_KE','ماساي (كينيا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1576,0,'ar','menus','language-picker.langs.mas_TZ','ماساي (تنزانيا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1577,0,'ar','menus','language-picker.langs.mas','الماساي','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1578,0,'ar','menus','language-picker.langs.mer_KE','ميرو (كينيا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1579,0,'ar','menus','language-picker.langs.mer','ميرو','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1580,0,'ar','menus','language-picker.langs.mfe_MU','موريسين (موريشيوس)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1581,0,'ar','menus','language-picker.langs.mfe','Morisyen','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1582,0,'ar','menus','language-picker.langs.naq_NA','ناما (ناميبيا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1583,0,'ar','menus','language-picker.langs.naq','ناما','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1584,0,'ar','menus','language-picker.langs.ne_IN','النيبالية (الهند)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1585,0,'ar','menus','language-picker.langs.ne_NP','النيبالية (نيبال)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1586,0,'ar','menus','language-picker.langs.ne','النيبالية','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1587,0,'ar','menus','language-picker.langs.nd_ZW','نديبيلي الشمالية (زيمبابوي)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1588,0,'ar','menus','language-picker.langs.nd','شمال نديبيلي','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1589,0,'ar','menus','language-picker.langs.nb_NO','النرويجية بوكمال (النرويج)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1590,0,'ar','menus','language-picker.langs.nb','النرويجية Bokmål','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1591,0,'ar','menus','language-picker.langs.nn_NO','نينورسك النرويجي (النرويج)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1592,0,'ar','menus','language-picker.langs.nn','نينورسك النرويجي','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1593,0,'ar','menus','language-picker.langs.nyn_UG','نيانكول (أوغندا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1594,0,'ar','menus','language-picker.langs.nyn','النيانكول','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1595,0,'ar','menus','language-picker.langs.or_IN','الأوريا (الهند)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1596,0,'ar','menus','language-picker.langs.or','الأوريا','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1597,0,'ar','menus','language-picker.langs.om_ET','أورومو (إثيوبيا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1598,0,'ar','menus','language-picker.langs.om_KE','أورومو (كينيا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1599,0,'ar','menus','language-picker.langs.om','أورومو','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1600,0,'ar','menus','language-picker.langs.ps_AF','الباشتو (أفغانستان)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1601,0,'ar','menus','language-picker.langs.ps','الباشتو','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1602,0,'ar','menus','language-picker.langs.fa_AF','الفارسية (أفغانستان)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1603,0,'ar','menus','language-picker.langs.fa_IR','الفارسية (إيران)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1604,0,'ar','menus','language-picker.langs.pl_PL','البولندية (بولندا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1605,0,'ar','menus','language-picker.langs.pl','البولندي','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1606,0,'ar','menus','language-picker.langs.pt_GW','البرتغالية (غينيا بيساو)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1607,0,'ar','menus','language-picker.langs.pt_MZ','البرتغالية (موزمبيق)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1608,0,'ar','menus','language-picker.langs.pt_PT','البرتغالية (البرتغال)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1609,0,'ar','menus','language-picker.langs.pt','البرتغالية','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1610,0,'ar','menus','language-picker.langs.pa_Arab','البنجابية (العربية)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1611,0,'ar','menus','language-picker.langs.pa_Arab_PK','البنجابية (العربية ، باكستان)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1612,0,'ar','menus','language-picker.langs.pa_Guru','البنجابية (غرموخي)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1613,0,'ar','menus','language-picker.langs.pa_Guru_IN','البنجابية (غرموخي ، الهند)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1614,0,'ar','menus','language-picker.langs.pa','البنجابية','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1615,0,'ar','menus','language-picker.langs.ro_MD','الرومانية (مولدوفا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1616,0,'ar','menus','language-picker.langs.ro_RO','الرومانية (رومانيا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1617,0,'ar','menus','language-picker.langs.ro','روماني','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1618,0,'ar','menus','language-picker.langs.rm_CH','رومانش (سويسرا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1619,0,'ar','menus','language-picker.langs.rm','الرومانش','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1620,0,'ar','menus','language-picker.langs.rof_TZ','رومبو (تنزانيا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1621,0,'ar','menus','language-picker.langs.rof','رومبو','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1622,0,'ar','menus','language-picker.langs.ru_MD','الروسية (مولدوفا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1623,0,'ar','menus','language-picker.langs.ru_RU','الروسية (روسيا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1624,0,'ar','menus','language-picker.langs.ru_UA','الروسية (أوكرانيا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1625,0,'ar','menus','language-picker.langs.rwk_TZ','روا (تنزانيا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1626,0,'ar','menus','language-picker.langs.rwk','RWA','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1627,0,'ar','menus','language-picker.langs.saq_KE','سامبورو (كينيا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1628,0,'ar','menus','language-picker.langs.saq','سامبورو','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1629,0,'ar','menus','language-picker.langs.sg_CF','سانجو (جمهورية إفريقيا الوسطى)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1630,0,'ar','menus','language-picker.langs.sg','سانغو','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1631,0,'ar','menus','language-picker.langs.seh_MZ','سينا (موزمبيق)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1632,0,'ar','menus','language-picker.langs.seh','سينا','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1633,0,'ar','menus','language-picker.langs.sr_Cyrl','الصربية (السيريلية)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1634,0,'ar','menus','language-picker.langs.sr_Cyrl_BA','الصربية (السيريلية ، البوسنة والهرسك)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1635,0,'ar','menus','language-picker.langs.sr_Cyrl_ME','الصربية (السيريلية ، الجبل الأسود)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1636,0,'ar','menus','language-picker.langs.sr_Cyrl_RS','الصربية (السيريلية ، صربيا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1637,0,'ar','menus','language-picker.langs.sr_Latn','الصربية (اللاتينية)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1638,0,'ar','menus','language-picker.langs.sr_Latn_BA','الصربية (اللاتينية والبوسنة والهرسك)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1639,0,'ar','menus','language-picker.langs.sr_Latn_ME','الصربية (اللاتينية ، الجبل الأسود)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1640,0,'ar','menus','language-picker.langs.sr_Latn_RS','الصربية (اللاتينية ، صربيا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1641,0,'ar','menus','language-picker.langs.sr','صربي','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1642,0,'ar','menus','language-picker.langs.sn_ZW','شونا (زيمبابوي)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1643,0,'ar','menus','language-picker.langs.sn','شونا','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1644,0,'ar','menus','language-picker.langs.ii_CN','سيتشوان يي (الصين)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1645,0,'ar','menus','language-picker.langs.ii','سيتشوان يي','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1646,0,'ar','menus','language-picker.langs.si_LK','سينهالا (سريلانكا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1647,0,'ar','menus','language-picker.langs.si','السنهالية','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1648,0,'ar','menus','language-picker.langs.sk_SK','السلوفاكية (سلوفاكيا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1649,0,'ar','menus','language-picker.langs.sk','السلوفاكية','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1650,0,'ar','menus','language-picker.langs.sl_SI','السلوفينية (سلوفينيا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1651,0,'ar','menus','language-picker.langs.sl','سلوفيني','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1652,0,'ar','menus','language-picker.langs.xog_UG','سوجا (أوغندا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1653,0,'ar','menus','language-picker.langs.xog','سوجا','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1654,0,'ar','menus','language-picker.langs.so_DJ','صومالي (جيبوتي)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1655,0,'ar','menus','language-picker.langs.so_ET','صومالي (إثيوبيا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1656,0,'ar','menus','language-picker.langs.so_KE','صومالي (كينيا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1657,0,'ar','menus','language-picker.langs.so_SO','صومالي (الصومال)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1658,0,'ar','menus','language-picker.langs.so','الصومالية','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1659,0,'ar','menus','language-picker.langs.es_AR','الإسبانية (الأرجنتين)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1660,0,'ar','menus','language-picker.langs.es_BO','الإسبانية (بوليفيا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1661,0,'ar','menus','language-picker.langs.es_CL','الإسبانية (تشيلي)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1662,0,'ar','menus','language-picker.langs.es_CO','الإسبانية (كولومبيا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1663,0,'ar','menus','language-picker.langs.es_CR','الإسبانية (كوستاريكا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1664,0,'ar','menus','language-picker.langs.es_DO','الإسبانية (جمهورية الدومينيكان)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1665,0,'ar','menus','language-picker.langs.es_EC','الإسبانية (الإكوادور)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1666,0,'ar','menus','language-picker.langs.es_SV','الأسبانية (السلفادور)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1667,0,'ar','menus','language-picker.langs.es_GQ','الإسبانية (غينيا الاستوائية)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1668,0,'ar','menus','language-picker.langs.es_GT','الإسبانية (غواتيمالا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1669,0,'ar','menus','language-picker.langs.es_HN','الإسبانية (هندوراس)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1670,0,'ar','menus','language-picker.langs.es_419','الإسبانية (أمريكا اللاتينية)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1671,0,'ar','menus','language-picker.langs.es_MX','الإسبانية (المكسيك)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1672,0,'ar','menus','language-picker.langs.es_NI','الإسبانية (نيكاراغوا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1673,0,'ar','menus','language-picker.langs.es_PA','الإسبانية (بنما)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1674,0,'ar','menus','language-picker.langs.es_PY','الإسبانية (باراجواي)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1675,0,'ar','menus','language-picker.langs.es_PE','الإسبانية (بيرو)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1676,0,'ar','menus','language-picker.langs.es_PR','الإسبانية (بورتوريكو)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1677,0,'ar','menus','language-picker.langs.es_ES','الإسبانية (إسبانيا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1678,0,'ar','menus','language-picker.langs.es_US','الإسبانية (الولايات المتحدة)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1679,0,'ar','menus','language-picker.langs.es_UY','الإسبانية (أوروغواي)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1680,0,'ar','menus','language-picker.langs.es_VE','الإسبانية (فنزويلا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1681,0,'ar','menus','language-picker.langs.sw_KE','السواحيلية (كينيا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1682,0,'ar','menus','language-picker.langs.sw_TZ','السواحيلية (تنزانيا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1683,0,'ar','menus','language-picker.langs.sw','السواحلية','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1684,0,'ar','menus','language-picker.langs.sv_FI','السويدية (فنلندا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1685,0,'ar','menus','language-picker.langs.sv_SE','السويدية (السويد)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1686,0,'ar','menus','language-picker.langs.gsw_CH','الألمانية السويسرية (سويسرا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1687,0,'ar','menus','language-picker.langs.gsw','الألمانية السويسرية','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1688,0,'ar','menus','language-picker.langs.shi_Latn','تشلحيت (لاتينية)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1689,0,'ar','menus','language-picker.langs.shi_Latn_MA','تشلحيت (اللاتينية ، المغرب)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1690,0,'ar','menus','language-picker.langs.shi_Tfng','تشلحيت (تيفيناغ)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1691,0,'ar','menus','language-picker.langs.shi_Tfng_MA','تشلحيت (تيفيناغ ، المغرب)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1692,0,'ar','menus','language-picker.langs.shi','تشلحيت','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1693,0,'ar','menus','language-picker.langs.dav_KE','تايتا (كينيا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1694,0,'ar','menus','language-picker.langs.dav','تايتا','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1695,0,'ar','menus','language-picker.langs.ta_IN','التاميل (الهند)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1696,0,'ar','menus','language-picker.langs.ta_LK','تاميل (سريلانكا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1697,0,'ar','menus','language-picker.langs.ta','التاميل','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1698,0,'ar','menus','language-picker.langs.te_IN','التيلجو (الهند)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1699,0,'ar','menus','language-picker.langs.te','التيلجو','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1700,0,'ar','menus','language-picker.langs.teo_KE','تيسو (كينيا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1701,0,'ar','menus','language-picker.langs.teo_UG','تيسو (أوغندا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1702,0,'ar','menus','language-picker.langs.teo','تيسو','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1703,0,'ar','menus','language-picker.langs.th_TH','التايلاندية (تايلاند)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1704,0,'ar','menus','language-picker.langs.bo_CN','التبتية (الصين)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1705,0,'ar','menus','language-picker.langs.bo_IN','التبتية (الهند)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1706,0,'ar','menus','language-picker.langs.bo','التبت','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1707,0,'ar','menus','language-picker.langs.ti_ER','تيغرينيا (إريتريا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1708,0,'ar','menus','language-picker.langs.ti_ET','تيغرينيا (إثيوبيا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1709,0,'ar','menus','language-picker.langs.ti','التيغرينية','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1710,0,'ar','menus','language-picker.langs.to_TO','تونغا (تونغا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1711,0,'ar','menus','language-picker.langs.to','تونغا','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1712,0,'ar','menus','language-picker.langs.tr_TR','التركية (تركيا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1713,0,'ar','menus','language-picker.langs.uk_UA','الأوكرانية (أوكرانيا)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1714,0,'ar','menus','language-picker.langs.uk','الأوكراني','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1715,0,'ar','menus','language-picker.langs.ur_IN','الأردية (الهند)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1716,0,'ar','menus','language-picker.langs.ur_PK','الأردية (باكستان)','2020-02-27 05:34:03','2020-04-17 10:54:03'),
(1717,0,'ar','menus','language-picker.langs.ur','الأردية','2020-02-27 05:34:04','2020-04-17 10:54:03'),
(1718,0,'ar','menus','language-picker.langs.uz_Arab','الأوزبكية (العربية)','2020-02-27 05:34:04','2020-04-17 10:54:03'),
(1719,0,'ar','menus','language-picker.langs.uz_Arab_AF','الأوزبكية (العربية ، أفغانستان)','2020-02-27 05:34:04','2020-04-17 10:54:03'),
(1720,0,'ar','menus','language-picker.langs.uz_Cyrl','الأوزبكية (السيريلية)','2020-02-27 05:34:04','2020-04-17 10:54:03'),
(1721,0,'ar','menus','language-picker.langs.uz_Cyrl_UZ','الأوزبكية (السيريلية ، أوزبكستان)','2020-02-27 05:34:04','2020-04-17 10:54:03'),
(1722,0,'ar','menus','language-picker.langs.uz_Latn','الأوزبكية (اللاتينية)','2020-02-27 05:34:04','2020-04-17 10:54:03'),
(1723,0,'ar','menus','language-picker.langs.uz_Latn_UZ','الأوزبكية (اللاتينية ، أوزبكستان)','2020-02-27 05:34:04','2020-04-17 10:54:03'),
(1724,0,'ar','menus','language-picker.langs.uz','الأوزبكي','2020-02-27 05:34:04','2020-04-17 10:54:03'),
(1725,0,'ar','menus','language-picker.langs.vi_VN','الفيتنامية (فيتنام)','2020-02-27 05:34:04','2020-04-17 10:54:03'),
(1726,0,'ar','menus','language-picker.langs.vi','الفيتنامية','2020-02-27 05:34:04','2020-04-17 10:54:03'),
(1727,0,'ar','menus','language-picker.langs.vun_TZ','فونجو (تنزانيا)','2020-02-27 05:34:04','2020-04-17 10:54:03'),
(1728,0,'ar','menus','language-picker.langs.vun','Vunjo','2020-02-27 05:34:04','2020-04-17 10:54:03'),
(1729,0,'ar','menus','language-picker.langs.cy_GB','الويلزية (المملكة المتحدة)','2020-02-27 05:34:04','2020-04-17 10:54:03'),
(1730,0,'ar','menus','language-picker.langs.cy','تهرب من دفع الرهان','2020-02-27 05:34:04','2020-04-17 10:54:03'),
(1731,0,'ar','menus','language-picker.langs.yo_NG','يوروبا (نيجيريا)','2020-02-27 05:34:04','2020-04-17 10:54:03'),
(1732,0,'ar','menus','language-picker.langs.yo','اليوروبا','2020-02-27 05:34:04','2020-04-17 10:54:03'),
(1733,0,'ar','menus','language-picker.langs.zu_ZA','الزولو (جنوب إفريقيا)','2020-02-27 05:34:04','2020-04-17 10:54:03'),
(1734,0,'ar','menus','language-picker.langs.zu','الزولو','2020-02-27 05:34:04','2020-04-17 10:54:03'),
(1735,0,'ar','menus','language-picker.language','اللغة','2020-02-27 05:34:04','2020-04-17 10:54:03'),
(1736,0,'ar','navs','frontend.contact','تواصل معنا','2020-02-27 05:34:04','2020-04-16 04:53:54'),
(1737,0,'ar','navs','frontend.courses','الدورات','2020-02-27 05:34:04','2020-04-16 04:53:54'),
(1738,0,'ar','navs','frontend.dashboard','لوحة الاعدادات','2020-02-27 05:34:04','2020-04-16 04:53:54'),
(1739,0,'ar','navs','frontend.forums','المنتديات','2020-02-27 05:34:04','2020-04-16 04:53:54'),
(1740,0,'ar','navs','frontend.login','تسجيل الدخول','2020-02-27 05:34:04','2020-04-16 04:53:54'),
(1741,0,'ar','navs','frontend.macros','وحدات الماكرو','2020-02-27 05:34:04','2020-04-16 04:53:54'),
(1742,0,'ar','navs','frontend.register','إنشاء حساب','2020-02-27 05:34:04','2020-04-16 04:53:54'),
(1743,0,'ar','navs','frontend.user.account','حسابي','2020-02-27 05:34:04','2020-04-16 04:53:54'),
(1744,0,'ar','navs','frontend.user.administration','الادارة','2020-02-27 05:34:04','2020-04-16 04:53:54'),
(1745,0,'ar','navs','frontend.user.change_password','غير كلمة المرور','2020-02-27 05:34:04','2020-04-16 04:53:54'),
(1746,0,'ar','navs','frontend.user.my_information','معلوماتي','2020-02-27 05:34:04','2020-04-16 04:53:54'),
(1747,0,'ar','navs','frontend.user.profile','الملف الشخصي','2020-02-27 05:34:04','2020-04-16 04:53:54'),
(1748,0,'ar','navs','frontend.user.edit_account','تعديل الحساب','2020-02-27 05:34:04','2020-04-16 04:53:54'),
(1749,0,'ar','navs','general.home','الصفحة الرئيسية','2020-02-27 05:34:04','2020-04-16 04:53:54'),
(1750,0,'ar','navs','general.login','تسجيل الدخول','2020-02-27 05:34:04','2020-04-16 04:53:54'),
(1751,0,'ar','navs','general.logout','الخروج','2020-02-27 05:34:04','2020-04-16 04:53:54'),
(1752,0,'ar','navs','general.account','الحساب','2020-02-27 05:34:04','2020-04-16 04:53:54'),
(1753,0,'ar','navs','general.messages','الرسائل','2020-02-27 05:34:04','2020-04-16 04:53:54'),
(1754,0,'ar','navs','general.no_messages','لا توجد رسائل','2020-02-27 05:34:04','2020-04-16 04:53:54'),
(1755,0,'ar','navs','general.profile','الملف الشخصي','2020-02-27 05:34:04','2020-04-16 04:53:54'),
(1756,0,'ar','pagination','next','التالي','2020-02-27 05:34:04','2020-04-19 12:51:04'),
(1757,0,'ar','pagination','previous','السابق','2020-02-27 05:34:04','2020-04-19 12:51:04'),
(1758,1,'ar','passwords','password','يجب أن تتكون كلمات المرور من ستة أحرف على الأقل وأن يتطابق التأكيد','2020-02-27 05:34:04','2020-04-16 04:19:12'),
(1759,1,'ar','passwords','reset','تم إعادة تعيين كلمة المرور الخاصة بك!','2020-02-27 05:34:04','2020-02-27 05:34:04'),
(1760,1,'ar','passwords','sent','لقد أرسلنا رابط إعادة تعيين كلمة المرور عبر البريد الإلكتروني!','2020-02-27 05:34:04','2020-02-27 05:34:04'),
(1761,1,'ar','passwords','token','الرمز المميز لإعادة تعيين كلمة المرور غير صحيح.','2020-02-27 05:34:04','2020-04-16 04:18:36'),
(1762,1,'ar','passwords','user','عنوان البريد الإلكتروني غير مسجل','2020-02-27 05:34:04','2020-04-16 04:18:19'),
(1763,0,'ar','roles','administrator','مدير','2020-02-27 05:34:04','2020-04-19 11:26:08'),
(1764,0,'ar','roles','user','مستخدم','2020-02-27 05:34:04','2020-04-19 11:26:08'),
(1765,0,'ar','strings','backend.access.users.delete_user_confirm','هل تريد بالتأكيد حذف هذا المستخدم نهائيًا؟ في أي مكان في التطبيق يشير إلى معرف المستخدم هذا ، من المحتمل أن يكون الخطأ المضي قدما على مسؤوليتك الخاصة. هذا لا يمكن التراجع عنها.','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1766,0,'ar','strings','backend.access.users.if_confirmed_off','(إذا تم تأكيد إيقاف التشغيل)','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1767,0,'ar','strings','backend.access.users.no_deactivated','لا يوجد مستخدمين غير نشطين.','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1768,0,'ar','strings','backend.access.users.no_deleted','لا يوجد مستخدمين محذوفين.','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1769,0,'ar','strings','backend.access.users.restore_user_confirm','استعادة هذا المستخدم إلى حالته الأصلية؟','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1770,0,'ar','strings','backend.dashboard.my_courses','دوراتي','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1771,0,'ar','strings','backend.dashboard.title','لوحة القيادة','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1772,0,'ar','strings','backend.dashboard.welcome','أهلا بك','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1773,0,'ar','strings','backend.general.actions','أجراءات','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1774,0,'ar','strings','backend.general.all','الكل','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1775,0,'ar','strings','backend.general.all_rights_reserved','كل الحقوق محفوظة.','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1776,0,'ar','strings','backend.general.app_add','إضافة','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1777,0,'ar','strings','backend.general.app_add_new','اضف جديد','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1778,0,'ar','strings','backend.general.app_are_you_sure','هل أنت متأكد ؟','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1779,0,'ar','strings','backend.general.app_back_to_list','الرجوع للقائمة','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1780,0,'ar','strings','backend.general.app_create','إنشاء','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1781,0,'ar','strings','backend.general.app_dashboard','لوحة الإعدادات','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1782,0,'ar','strings','backend.general.app_delete','حذف','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1783,0,'ar','strings','backend.general.app_edit','تصحيح','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1784,0,'ar','strings','backend.general.app_list','قائمة','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1785,0,'ar','strings','backend.general.app_logout','الخروج','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1786,0,'ar','strings','backend.general.app_no_entries_in_table','لا توجد إدخالات في الجدول','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1787,0,'ar','strings','backend.general.app_permadel','حذف بشكل دائم','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1788,0,'ar','strings','backend.general.app_restore','استعادة','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1789,0,'ar','strings','backend.general.app_save','حفظ','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1790,0,'ar','strings','backend.general.app_update','تحديث','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1791,0,'ar','strings','backend.general.app_view','اطلاع','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1792,0,'ar','strings','backend.general.are_you_sure','هل انت متأكد من أنك تريد أن تفعل هذا؟','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1793,0,'ar','strings','backend.general.boilerplate_link','استوديو JThemes','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1794,0,'ar','strings','backend.general.continue','استمر','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1795,0,'ar','strings','backend.general.custom_controller_index','مؤشر تحكم مخصص.','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1796,0,'ar','strings','backend.general.member_since','عضو منذ','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1797,0,'ar','strings','backend.general.minutes','الدقائق','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1798,0,'ar','strings','backend.general.search_placeholder','بحث...','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1799,0,'ar','strings','backend.general.see_all.messages','رؤية كل الرسائل','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1800,0,'ar','strings','backend.general.see_all.notifications','عرض الكل','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1801,0,'ar','strings','backend.general.see_all.tasks','عرض جميع المهام','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1802,0,'ar','strings','backend.general.status.offline','غير متصل على الانترنت','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1803,0,'ar','strings','backend.general.status.online','عبر الانترنت','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1804,0,'ar','strings','backend.general.timeout','تم تسجيل خروجك تلقائيًا','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1805,0,'ar','strings','backend.general.trashed','سلة المهملات','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1806,0,'ar','strings','backend.general.you_have.messages','{0} ليس لديك رسائل | {1} لديك رسالة واحدة | [2 ، Inf] لديك: رسائل عدد','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1807,0,'ar','strings','backend.general.you_have.notifications','{0} ليس لديك اشعارات | {1} لديك إشعار واحد | [2 ، Inf] لديك: اشعارات الأرقام','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1808,0,'ar','strings','backend.general.you_have.tasks','{0} ليس لديك مهام | {1} لديك مهمة واحدة | [2 ، Inf] لديك: رقم المهام','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1809,0,'ar','strings','backend.menu_manager.Category','الفئة','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1810,0,'ar','strings','backend.menu_manager.add_to_menu','أضف إلى القائمة','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1811,0,'ar','strings','backend.menu_manager.assigned_menu','القائمة المخصصة','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1812,0,'ar','strings','backend.menu_manager.auto_add_pages','إضافة صفحات بشكل تلقائي','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1813,0,'ar','strings','backend.menu_manager.auto_add_pages_desc','أضف صفحات المستوى الأعلى الجديدة تلقائيًا إلى هذه القائمة','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1814,0,'ar','strings','backend.menu_manager.cancel','إلغاء','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1815,0,'ar','strings','backend.menu_manager.categories','الاقسام','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1816,0,'ar','strings','backend.menu_manager.choose','أختر','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1817,0,'ar','strings','backend.menu_manager.class','فئة CSS (اختياري)','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1818,0,'ar','strings','backend.menu_manager.create_menu','إنشاء القائمة','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1819,0,'ar','strings','backend.menu_manager.create_new','إنشاء قائمة جديدة','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1820,0,'ar','strings','backend.menu_manager.currently','تم التعيين حاليًا على','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1821,0,'ar','strings','backend.menu_manager.custom_link','رابط مخصص','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1822,0,'ar','strings','backend.menu_manager.delete','حذف','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1823,0,'ar','strings','backend.menu_manager.delete_menu','حذف القائمة','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1824,0,'ar','strings','backend.menu_manager.display','عرض','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1825,0,'ar','strings','backend.menu_manager.drag_instruction_1','ضع كل عنصر بالترتيب الذي تفضله. انقر على السهم على يمين العنصر لعرض المزيد من خيارات التكوين.','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1826,0,'ar','strings','backend.menu_manager.drag_instruction_2','الرجاء إدخال الاسم وحدد زر \"إنشاء قائمة\"','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1827,0,'ar','strings','backend.menu_manager.edit','تصحيح','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1828,0,'ar','strings','backend.menu_manager.edit_menus','تحرير القوائم','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1829,0,'ar','strings','backend.menu_manager.footer_menu','القائمة تذييل','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1830,0,'ar','strings','backend.menu_manager.label','ضع الكلمة المناسبة','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1831,0,'ar','strings','backend.menu_manager.link','حلقة الوصل','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1832,0,'ar','strings','backend.menu_manager.locations','مواقع','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1833,0,'ar','strings','backend.menu_manager.menu_creation','إنشاء القائمة','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1834,0,'ar','strings','backend.menu_manager.menu_settings','إعدادات القائمة','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1835,0,'ar','strings','backend.menu_manager.menu_structure','هيكل القائمة','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1836,0,'ar','strings','backend.menu_manager.move','نقل','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1837,0,'ar','strings','backend.menu_manager.move_down','تحرك لأسفل','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1838,0,'ar','strings','backend.menu_manager.move_left','تحرك يسارا','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1839,0,'ar','strings','backend.menu_manager.move_right','تحرك يمينا','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1840,0,'ar','strings','backend.menu_manager.move_up','تحرك','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1841,0,'ar','strings','backend.menu_manager.name','اسم','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1842,0,'ar','strings','backend.menu_manager.or','أو','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1843,0,'ar','strings','backend.menu_manager.page','صفحة','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1844,0,'ar','strings','backend.menu_manager.pages','صفحات','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1845,0,'ar','strings','backend.menu_manager.post','بريد','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1846,0,'ar','strings','backend.menu_manager.posts','المشاركات','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1847,0,'ar','strings','backend.menu_manager.save_changes','حفظ التغييرات','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1848,0,'ar','strings','backend.menu_manager.save_menu','حفظ القائمة','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1849,0,'ar','strings','backend.menu_manager.screen_reader_text','اضغط على رجوع أو أدخل للتوسيع','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1850,0,'ar','strings','backend.menu_manager.select_all','اختر الكل','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1851,0,'ar','strings','backend.menu_manager.select_to_edit','حدد القائمة التي تريد تحريرها','2020-02-27 05:34:04','2020-04-16 04:24:06'),
(1852,0,'ar','strings','backend.menu_manager.sub_menu','القائمة الفرعية','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1853,0,'ar','strings','backend.menu_manager.theme_location','موضوع الموقع','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1854,0,'ar','strings','backend.menu_manager.title','ادارة القائمة','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1855,0,'ar','strings','backend.menu_manager.top','أعلى','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1856,0,'ar','strings','backend.menu_manager.top_menu','القائمة العلوية','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1857,0,'ar','strings','backend.menu_manager.update_item','تحديث البند','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1858,0,'ar','strings','backend.menu_manager.url','URL','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1859,0,'ar','strings','backend.menu_manager.welcome','مرحبا','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1860,0,'ar','strings','backend.search.empty','يرجى إدخال مصطلح البحث.','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1861,0,'ar','strings','backend.search.incomplete','يجب عليك كتابة منطق البحث الخاص بك لهذا النظام.','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1862,0,'ar','strings','backend.search.results','نتائج البحث عن: الاستعلام','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1863,0,'ar','strings','backend.search.title','نتائج البحث','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1864,0,'ar','strings','backend.welcome','مرحبًا بك في لوحة المعلومات','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1865,0,'ar','strings','emails.auth.account_confirmed','تم تأكيد حسابك.','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1866,0,'ar','strings','emails.auth.click_to_confirm','انقر هنا لتأكيد حسابك:','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1867,0,'ar','strings','emails.auth.error','يصيح!','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1868,0,'ar','strings','emails.auth.greeting','مرحبا!','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1869,0,'ar','strings','emails.auth.password_cause_of_email','أنت تتلقى هذا البريد الإلكتروني لأننا تلقينا طلب إعادة تعيين كلمة المرور لحسابك.','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1870,0,'ar','strings','emails.auth.password_if_not_requested','إذا لم تطلب إعادة تعيين كلمة المرور ، فلا يلزم اتخاذ أي إجراء آخر.','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1871,0,'ar','strings','emails.auth.password_reset_subject','إعادة تعيين كلمة المرور','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1872,0,'ar','strings','emails.auth.regards','مع تحياتي،','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1873,0,'ar','strings','emails.auth.reset_password','انقر هنا لإعادة تعيين كلمة المرور الخاصة بك','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1874,0,'ar','strings','emails.auth.thank_you_for_using_app','شكرا لك لاستخدام التطبيق لدينا!','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1875,0,'ar','strings','emails.auth.trouble_clicking_button','إذا كنت تواجه مشكلة في الضغط فوق الزر \": action_text\" ، فانسخ والصق عنوان URL أدناه في متصفح الويب الخاص بك:','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1876,0,'ar','strings','emails.contact.email_body_title','لديك طلب نموذج اتصال جديد: فيما يلي التفاصيل:','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1877,0,'ar','strings','emails.contact.subject','جديد: app_name تقديم نموذج الاتصال!','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1878,0,'ar','strings','emails.offline_order.subject','بخصوص طلبك الأخير على: app_name','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1879,0,'ar','strings','frontend.general.joined','انضم','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1880,0,'ar','strings','frontend.test','اختبار','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1881,0,'ar','strings','frontend.tests.based_on.permission','بناء على إذن -','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1882,0,'ar','strings','frontend.tests.based_on.role','الدور القائم -','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1883,0,'ar','strings','frontend.tests.js_injected_from_controller','جافا سكريبت حقن من وحدة تحكم','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1884,0,'ar','strings','frontend.tests.using_access_helper.array_permissions','استخدام مساعد الوصول مع مجموعة من أسماء الإذن أو المعرّف حيث يجب على المستخدم امتلاك كل شيء.','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1885,0,'ar','strings','frontend.tests.using_access_helper.array_permissions_not','استخدام مساعد الوصول مع مجموعة من أسماء التصاريح أو المعرفات حيث لا يتعين على المستخدم امتلاك كل شيء.','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1886,0,'ar','strings','frontend.tests.using_access_helper.array_roles','استخدام مساعد الوصول مع مجموعة من أسماء الأدوار أو معرفات حيث يتعين على المستخدم امتلاك كل شيء.','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1887,0,'ar','strings','frontend.tests.using_access_helper.array_roles_not','استخدام مساعد الوصول مع مجموعة من أسماء الأدوار أو معرفات حيث لا يتعين على المستخدم امتلاك الكل.','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1888,0,'ar','strings','frontend.tests.using_access_helper.permission_id','باستخدام مساعد الوصول مع معرف إذن','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1889,0,'ar','strings','frontend.tests.using_access_helper.permission_name','باستخدام مساعد الوصول مع اسم إذن','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1890,0,'ar','strings','frontend.tests.using_access_helper.role_id','باستخدام مساعد الوصول مع معرف الدور','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1891,0,'ar','strings','frontend.tests.using_access_helper.role_name','باستخدام مساعد الوصول مع اسم الدور','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1892,0,'ar','strings','frontend.tests.you_can_see_because_permission','يمكنك رؤية هذا لأنك تملك إذن \": إذن\"!','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1893,0,'ar','strings','frontend.tests.you_can_see_because','يمكنك أن ترى هذا لأن لديك دور \": دور\"','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1894,0,'ar','strings','frontend.tests.view_console_it_works','عرض وحدة التحكم ، سترى \"إنه يعمل!\" الذي يأتي من فهرس FrontendController @','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1895,0,'ar','strings','frontend.tests.using_blade_extensions','باستخدام ملحقات النصل','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1896,0,'ar','strings','frontend.welcome_to','مرحبا بكم في','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1897,0,'ar','strings','frontend.user.profile_updated','تم تحديث الملف الشخصي بنجاح.','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1898,0,'ar','strings','frontend.user.password_updated','تم تحديث كلمة المرور بنجاح.','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1899,0,'ar','strings','frontend.user.change_email_notice','إذا قمت بتغيير بريدك الإلكتروني ، فسوف يتم تسجيل خروجك حتى تؤكد عنوان بريدك الإلكتروني الجديد.','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1900,0,'ar','strings','frontend.user.email_changed_notice','يجب تأكيد عنوان بريدك الإلكتروني الجديد قبل أن تتمكن من تسجيل الدخول مرة أخرى.','2020-02-27 05:34:05','2020-04-16 04:24:06'),
(1901,0,'ar','validation','accepted','يجب قبول السمة:','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1902,0,'ar','validation','active_url','السمة: ليست عنوان URL صالحًا.','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1903,0,'ar','validation','after','يجب أن تكون السمة: تاريخ بعد: تاريخ.','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1904,0,'ar','validation','after_or_equal','يجب أن تكون السمة: تاريخ بعد أو يساوي: تاريخ.','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1905,0,'ar','validation','alpha','قد تحتوي السمة على أحرف فقط.','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1906,0,'ar','validation','alpha_dash',': قد تحتوي السمة على أحرف وأرقام وشرطات وشرطات سفلية فقط.','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1907,0,'ar','validation','alpha_num','قد تحتوي السمة على أحرف وأرقام فقط.','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1908,0,'ar','validation','array','يجب أن تكون السمة صفيف.','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1909,0,'ar','validation','attributes.backend.access.permissions.associated_roles','الأدوار المرتبطة','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1910,0,'ar','validation','attributes.backend.access.permissions.dependencies','تبعيات','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1911,0,'ar','validation','attributes.backend.access.permissions.display_name','اسم العرض','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1912,0,'ar','validation','attributes.backend.access.permissions.first_name','الاسم الاول','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1913,0,'ar','validation','attributes.backend.access.permissions.group','مجموعة','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1914,0,'ar','validation','attributes.backend.access.permissions.group_sort','ترتيب المجموعة','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1915,0,'ar','validation','attributes.backend.access.permissions.groups.name','أسم المجموعة','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1916,0,'ar','validation','attributes.backend.access.permissions.last_name','اسم العائلة','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1917,0,'ar','validation','attributes.backend.access.permissions.name','الاسم','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1918,0,'ar','validation','attributes.backend.access.permissions.system','النظام','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1919,0,'ar','validation','attributes.backend.access.roles.associated_permissions','أذونات المرتبطة','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1920,0,'ar','validation','attributes.backend.access.roles.name','اسم','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1921,0,'ar','validation','attributes.backend.access.roles.sort','فرز','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1922,0,'ar','validation','attributes.backend.access.users.active','نشيط','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1923,0,'ar','validation','attributes.backend.access.users.associated_roles','الأدوار المرتبطة','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1924,0,'ar','validation','attributes.backend.access.users.confirmed','تم التأكيد','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1925,0,'ar','validation','attributes.backend.access.users.email','البريد الالكتروني','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1926,0,'ar','validation','attributes.backend.access.users.first_name','الاسم الاول','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1927,0,'ar','validation','attributes.backend.access.users.language','لغة','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1928,0,'ar','validation','attributes.backend.access.users.last_name','اسم العائلة','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1929,0,'ar','validation','attributes.backend.access.users.name','الاسم','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1930,0,'ar','validation','attributes.backend.access.users.other_permissions','أذونات أخرى','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1931,0,'ar','validation','attributes.backend.access.users.password','كلمة المرور','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1932,0,'ar','validation','attributes.backend.access.users.password_confirmation','تأكيد كلمة المرور','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1933,0,'ar','validation','attributes.backend.access.users.send_confirmation_email','إرسال تأكيد البريد الإلكتروني','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1934,0,'ar','validation','attributes.backend.access.users.timezone','وحدة زمنية','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1935,0,'ar','validation','attributes.backend.settings.general_settings.app_locale','لغة التطبيق','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1936,0,'ar','validation','attributes.backend.settings.general_settings.app_name','اسم التطبيق','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1937,0,'ar','validation','attributes.backend.settings.general_settings.app_timezone','التطبيق المنطقة الزمنية','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1938,0,'ar','validation','attributes.backend.settings.general_settings.app_url','عنوان URL للتطبيق','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1939,0,'ar','validation','attributes.backend.settings.general_settings.captcha_site_key','مفتاح التحقق','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1940,0,'ar','validation','attributes.backend.settings.general_settings.captcha_site_secret','كلمة التحقق السرية','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1941,0,'ar','validation','attributes.backend.settings.general_settings.captcha_status','وضع كلمة التحقق','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1942,0,'ar','validation','attributes.backend.settings.general_settings.change_email','تغيير الايميل','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1943,0,'ar','validation','attributes.backend.settings.general_settings.confirm_email','تأكيد عنوان البريد الإلكتروني','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1944,0,'ar','validation','attributes.backend.settings.general_settings.enable_registration','تمكين التسجيل','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1945,0,'ar','validation','attributes.backend.settings.general_settings.font_color','لون الخط','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1946,0,'ar','validation','attributes.backend.settings.general_settings.google_analytics','جوجل تحليلات مدونة','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1947,0,'ar','validation','attributes.backend.settings.general_settings.homepage','اختر الصفحة الرئيسية','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1948,0,'ar','validation','attributes.backend.settings.general_settings.layout_type','نوع التخطيط','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1949,0,'ar','validation','attributes.backend.settings.general_settings.mail_driver','سائق البريد','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1950,0,'ar','validation','attributes.backend.settings.general_settings.mail_from_address','البريد من العنوان','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1951,0,'ar','validation','attributes.backend.settings.general_settings.mail_from_name','البريد من الاسم','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1952,0,'ar','validation','attributes.backend.settings.general_settings.mail_host','مضيف البريد','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1953,0,'ar','validation','attributes.backend.settings.general_settings.mail_password','بريد كلمة المرور','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1954,0,'ar','validation','attributes.backend.settings.general_settings.mail_port','ميناء البريد','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1955,0,'ar','validation','attributes.backend.settings.general_settings.mail_username','البريد اسم المستخدم','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1956,0,'ar','validation','attributes.backend.settings.general_settings.password_expires_days','كلمة المرور تنتهي أيام','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1957,0,'ar','validation','attributes.backend.settings.general_settings.password_history','تاريخ كلمة المرور','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1958,0,'ar','validation','attributes.backend.settings.general_settings.requires_approval','يتطلب موافقة','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1959,0,'ar','validation','attributes.backend.settings.general_settings.retest_status','إعادة الاختبار','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1960,0,'ar','validation','attributes.backend.settings.general_settings.theme_layout','تخطيط الموضوع','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1961,0,'ar','validation','attributes.backend.settings.general_settings.lesson_timer','الدرس الموقت','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1962,0,'ar','validation','attributes.backend.settings.general_settings.one_signal_push_notification','إعداد OneSignal','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1963,0,'ar','validation','attributes.backend.settings.general_settings.onesignal_code','الصق شفرة البرنامج النصي OneSignal هنا','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1964,0,'ar','validation','attributes.backend.settings.general_settings.show_offers','عرض صفحة العروض','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1965,0,'ar','validation','attributes.backend.settings.social_settings.bitbucket.client_id','معرف العميل','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1966,0,'ar','validation','attributes.backend.settings.social_settings.bitbucket.client_secret','سر العميل','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1967,0,'ar','validation','attributes.backend.settings.social_settings.bitbucket.redirect','إعادة توجيه URL','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1968,0,'ar','validation','attributes.backend.settings.social_settings.bitbucket.label','Bitbucket حالة تسجيل الدخول','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1969,0,'ar','validation','attributes.backend.settings.social_settings.facebook.client_id','معرف العميل','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1970,0,'ar','validation','attributes.backend.settings.social_settings.facebook.client_secret','سر العميل','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1971,0,'ar','validation','attributes.backend.settings.social_settings.facebook.redirect','إعادة توجيه URL','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1972,0,'ar','validation','attributes.backend.settings.social_settings.facebook.label','فيسبوك حالة تسجيل الدخول','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1973,0,'ar','validation','attributes.backend.settings.social_settings.github.client_id','معرف العميل','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1974,0,'ar','validation','attributes.backend.settings.social_settings.github.client_secret','سر العميل','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1975,0,'ar','validation','attributes.backend.settings.social_settings.github.redirect','إعادة توجيه URL','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1976,0,'ar','validation','attributes.backend.settings.social_settings.github.label','جيثب حالة تسجيل الدخول','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1977,0,'ar','validation','attributes.backend.settings.social_settings.google.client_id','معرف العميل','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1978,0,'ar','validation','attributes.backend.settings.social_settings.google.client_secret','سر العميل','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1979,0,'ar','validation','attributes.backend.settings.social_settings.google.label','حالة تسجيل الدخول إلى Google','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1980,0,'ar','validation','attributes.backend.settings.social_settings.google.redirect','إعادة توجيه URL','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1981,0,'ar','validation','attributes.backend.settings.social_settings.linkedin.client_id','معرف العميل','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1982,0,'ar','validation','attributes.backend.settings.social_settings.linkedin.client_secret','سر العميل','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1983,0,'ar','validation','attributes.backend.settings.social_settings.linkedin.label','LinkedIn حالة تسجيل الدخول','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1984,0,'ar','validation','attributes.backend.settings.social_settings.linkedin.redirect','إعادة توجيه URL','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1985,0,'ar','validation','attributes.backend.settings.social_settings.twitter.client_id','معرف العميل','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1986,0,'ar','validation','attributes.backend.settings.social_settings.twitter.client_secret','سر العميل','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1987,0,'ar','validation','attributes.backend.settings.social_settings.twitter.label','حالة تسجيل الدخول إلى تويتر','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1988,0,'ar','validation','attributes.backend.settings.social_settings.twitter.redirect','إعادة توجيه URL','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1989,0,'ar','validation','attributes.frontend.avatar','الصورة الرمزية الموقع','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1990,0,'ar','validation','attributes.frontend.captcha','كلمة التحقق المطلوبة','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1991,0,'ar','validation','attributes.frontend.email','البريد الالكتروني','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1992,0,'ar','validation','attributes.frontend.first_name','الاسم الاول','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1993,0,'ar','validation','attributes.frontend.gravatar','تلقائي','2020-02-27 05:34:05','2020-04-16 09:36:35'),
(1994,0,'ar','validation','attributes.frontend.language','لغة','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(1995,0,'ar','validation','attributes.frontend.last_name','اسم العائلة','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(1996,0,'ar','validation','attributes.frontend.message','رسالة','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(1997,0,'ar','validation','attributes.frontend.name','الاسم الكامل','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(1998,0,'ar','validation','attributes.frontend.new_password','كلمة المرور الجديدة','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(1999,0,'ar','validation','attributes.frontend.new_password_confirmation','تأكيد كلمة المرور الجديدة','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2000,0,'ar','validation','attributes.frontend.old_password','كلمة المرور القديمة','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2001,0,'ar','validation','attributes.frontend.password','كلمه المرور','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2002,0,'ar','validation','attributes.frontend.password_confirmation','تأكيد كلمة المرور','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2003,0,'ar','validation','attributes.frontend.phone','الهاتف','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2004,0,'ar','validation','attributes.frontend.timezone','المنطقة الزمنية','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2005,0,'ar','validation','attributes.frontend.upload','رفع','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2006,0,'ar','validation','attributes.frontend.female','إناثا','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2007,0,'ar','validation','attributes.frontend.male','ذكر','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2008,0,'ar','validation','attributes.frontend.other','آخر','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2009,0,'ar','validation','before','يجب أن تكون السمة: تاريخ قبل: تاريخ.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2010,0,'ar','validation','before_or_equal','يجب أن تكون السمة: تاريخ قبل أو تساوي: تاريخ.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2011,0,'ar','validation','between.array','يجب أن تحتوي السمة: على: العناصر min و: max.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2012,0,'ar','validation','between.file','يجب أن تكون السمة: بين: min و: max كيلو بايت.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2013,0,'ar','validation','between.numeric','يجب أن تكون السمة بين: min و: max.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2014,0,'ar','validation','between.string','يجب أن تكون السمة: بين: min و: الحد الأقصى لعدد الأحرف.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2015,0,'ar','validation','boolean','يجب أن يكون حقل السمة صواب أو خطأ.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2016,0,'ar','validation','confirmed','تأكيد السمة غير متطابق.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2017,0,'ar','validation','custom.attribute-name.rule-name','رسالة مخصصة','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2018,0,'ar','validation','date','السمة: ليست تاريخًا صالحًا.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2019,0,'ar','validation','date_format','السمة: لا تتطابق مع التنسيق: التنسيق.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2020,0,'ar','validation','different',': السمة و: يجب أن تكون مختلفة.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2021,0,'ar','validation','digits','يجب أن تكون السمة: digits digits.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2022,0,'ar','validation','digits_between','يجب أن تكون السمة بين: min و: أقصى عدد.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2023,0,'ar','validation','dimensions','تحتوي السمة: على أبعاد صور غير صالحة.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2024,0,'ar','validation','distinct','يحتوي حقل السمة على قيمة مكررة.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2025,0,'ar','validation','email','يجب ان تكون صيغة البريد الالكتروني صحيحة','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2026,0,'ar','validation','exists','السمة المحددة: غير صالحة.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2027,0,'ar','validation','file','يجب أن تكون الصيغة ملف.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2028,0,'ar','validation','filled','يجب أن يحتوي الحقل على قيمة.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2029,0,'ar','validation','gt.array','يجب أن تحتوي السمة: على أكثر من: عناصر القيمة.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2030,0,'ar','validation','gt.file','يجب أن تكون القيمة: أكبر من: قيمة كيلو بايت.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2031,0,'ar','validation','gt.numeric','يجب أن تكون السمة: أكبر من: قيمة.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2032,0,'ar','validation','gt.string','يجب أن تكون السمة: أكبر من: أحرف القيمة.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2033,0,'ar','validation','gte.array','يجب أن تحتوي السمة: على عناصر قيمة أو أكثر.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2034,0,'ar','validation','gte.file','يجب أن تكون القيمة: أكبر من أو تساوي: قيمة الكيلوبايت.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2035,0,'ar','validation','gte.numeric','يجب أن تكون السمة: أكبر من أو تساوي: value.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2036,0,'ar','validation','gte.string','يجب أن تكون السمة: أكبر من أو تساوي: أحرف القيمة.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2037,0,'ar','validation','image','يجب أن تكون السمة صورة.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2038,0,'ar','validation','in','السمة المحددة: غير صالحة.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2039,0,'ar','validation','in_array',': حقل السمة غير موجود في: الآخر.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2040,0,'ar','validation','integer','يجب أن تكون السمة عددًا صحيحًا.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2041,0,'ar','validation','ip','يجب أن تكون السمة: عنوان IP صالحًا.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2042,0,'ar','validation','ipv4','يجب أن تكون السمة: عنوان IPv4 صالحًا.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2043,0,'ar','validation','ipv6','يجب أن تكون السمة: عنوان IPv6 صالحًا.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2044,0,'ar','validation','json','يجب أن تكون السمة: سلسلة JSON صالحة.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2045,0,'ar','validation','lt.array','يجب أن تحتوي السمة: على أقل من: عناصر القيمة.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2046,0,'ar','validation','lt.file','يجب أن تكون السمة: أقل من: قيمة كيلو بايت.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2047,0,'ar','validation','lt.numeric','يجب أن تكون السمة: أقل من: قيمة.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2048,0,'ar','validation','lt.string','يجب أن تكون السمة: أقل من: قيمة الأحرف.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2049,0,'ar','validation','lte.array','يجب ألا تحتوي السمة: على أكثر من: عناصر القيمة.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2050,0,'ar','validation','lte.file','يجب أن تكون السمة: أقل من أو تساوي: قيمة الكيلوبايت.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2051,0,'ar','validation','lte.numeric','يجب أن تكون السمة: أقل من أو تساوي: value.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2052,0,'ar','validation','lte.string','يجب أن تكون السمة: أقل من أو تساوي: أحرف القيمة.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2053,0,'ar','validation','max.array','قد لا تحتوي السمة: أكثر من: العناصر القصوى.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2054,0,'ar','validation','max.file','قد لا تكون السمة: أكبر من: كحد أقصى','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2055,0,'ar','validation','max.numeric','قد لا تكون السمة: أكبر من:','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2056,0,'ar','validation','max.string','قد لا تكون السمة: أكبر من: الحد الأقصى لعدد الأحرف.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2057,0,'ar','validation','mimes','يجب أن تكون السمة: ملف نوع:attribute قيم.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2058,0,'ar','validation','mimetypes','يجب أن تكون السمة: ملف نوع:attribute قيم.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2059,0,'ar','validation','min.array','يجب أن تحتوي السمة: على الأقل: عناصر دقيقة.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2060,0,'ar','validation','min.file','يجب أن تكون السمة: الأقل كيلوبايت.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2061,0,'ar','validation','min.numeric','يجب أن تكون السمة: min على الأقل.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2062,0,'ar','validation','min.string','يجب أن تكون السمة: الأقل من الأحرف.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2063,0,'ar','validation','not_in','السمة المحددة: غير صالحة.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2064,0,'ar','validation','not_regex','تنسيق السمة: غير صالح.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2065,0,'ar','validation','numeric','يجب أن تكون السمة رقمًا.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2066,0,'ar','validation','present','يجب أن يكون حقل السمة موجودًا.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2067,0,'ar','validation','regex','تنسيق السمة: غير صالح.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2068,0,'ar','validation','required','فارغ، يرجى ملء الحقل','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2069,0,'ar','validation','required_if','حقل السمة: مطلوب عند: الآخر هو: قيمة.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2070,0,'ar','validation','required_unless','حقل السمة: مطلوب ما لم: الآخر موجود في: القيم.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2071,0,'ar','validation','required_with','حقل السمة: مطلوب عند: القيم موجودة.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2072,0,'ar','validation','required_with_all','حقل السمة: مطلوب عند: القيم موجودة.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2073,0,'ar','validation','required_without','حقل السمة: مطلوب عندما تكون القيم غير موجودة.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2074,0,'ar','validation','required_without_all','حقل السمة: مطلوب عند عدم وجود: من القيم.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2075,0,'ar','validation','same','لا تتوافق مع التأكيد','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2076,0,'ar','validation','size.array','يجب أن تحتوي السمة: عناصر الحجم.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2077,0,'ar','validation','size.file','يجب أن تكون السمة: size كيلوبايت.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2078,0,'ar','validation','size.numeric','يجب أن تكون السمة: size.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2079,0,'ar','validation','size.string','يجب أن تكون السمة: size size.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2080,0,'ar','validation','string','يجب أن تكون السمة سلسلة.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2081,0,'ar','validation','timezone','يجب أن تكون السمة منطقة صالحة.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2082,0,'ar','validation','unique','السمة: تم اتخاذها بالفعل.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2083,0,'ar','validation','uploaded','فشلت السمة: في التحميل.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2084,0,'ar','validation','url','تنسيق السمة: غير صالح.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2085,0,'ar','validation','uuid','يجب أن تكون السمة UUID صالحة.','2020-02-27 05:34:06','2020-04-16 09:36:35'),
(2086,0,'en','alerts','backend.general.created','Created successfully.','2020-02-27 05:34:06','2020-04-16 09:32:56'),
(2087,0,'en','alerts','backend.general.error','Something went wrong. Try Again','2020-02-27 05:34:06','2020-04-16 09:32:56'),
(2088,0,'en','alerts','backend.general.updated','Updated successfully.','2020-02-27 05:34:06','2020-04-16 09:32:56'),
(2089,0,'en','alerts','backend.general.deleted','Deleted successfully.','2020-02-27 05:34:06','2020-04-16 09:32:56'),
(2090,0,'en','alerts','backend.general.restored','Restored successfully.','2020-02-27 05:34:06','2020-04-16 09:32:56'),
(2091,0,'en','alerts','backend.general.cancelled','Update Cancelled.','2020-02-27 05:34:06','2020-04-16 09:32:56'),
(2092,0,'en','alerts','backend.general.unverified','Unverified Update files.','2020-02-27 05:34:06','2020-04-16 09:32:56'),
(2093,0,'en','alerts','backend.general.backup_warning','Please fill necessary details for backup','2020-02-27 05:34:06','2020-04-16 09:32:56'),
(2094,0,'en','alerts','backend.general.delete_warning','You can not delete course. Students are already enrolled. Unpublish the course instead','2020-02-27 05:34:06','2020-04-16 09:32:56'),
(2095,0,'en','alerts','backend.general.delete_warning_bundle','You can not delete Bundle. Students are already enrolled. Unpublish the Bundle instead','2020-02-27 05:34:06','2020-04-16 09:32:56'),
(2096,0,'en','alerts','backend.roles.created','The role was successfully created.','2020-02-27 05:34:06','2020-04-16 09:32:56'),
(2097,0,'en','alerts','backend.roles.updated','The role was successfully updated.','2020-02-27 05:34:06','2020-04-16 09:32:56'),
(2098,0,'en','alerts','backend.roles.deleted','The role was successfully deleted.','2020-02-27 05:34:06','2020-04-16 09:32:56'),
(2099,0,'en','alerts','backend.users.cant_resend_confirmation','The application is currently set to manually approve users.','2020-02-27 05:34:06','2020-04-16 09:32:56'),
(2100,0,'en','alerts','backend.users.confirmation_email','A new confirmation e-mail has been sent to the address on file.','2020-02-27 05:34:06','2020-04-16 09:32:56'),
(2101,0,'en','alerts','backend.users.confirmed','The user was successfully confirmed.','2020-02-27 05:34:06','2020-04-16 09:32:56'),
(2102,0,'en','alerts','backend.users.unconfirmed','The user was successfully un-confirmed','2020-02-27 05:34:06','2020-04-16 09:32:56'),
(2103,0,'en','alerts','backend.users.created','The user was successfully created.','2020-02-27 05:34:06','2020-04-16 09:32:56'),
(2104,0,'en','alerts','backend.users.updated','The user was successfully updated.','2020-02-27 05:34:06','2020-04-16 09:32:56'),
(2105,0,'en','alerts','backend.users.deleted','The user was successfully deleted.','2020-02-27 05:34:06','2020-04-16 09:32:56'),
(2106,0,'en','alerts','backend.users.updated_password','The user\'s password was successfully updated.','2020-02-27 05:34:06','2020-04-16 09:32:56'),
(2107,0,'en','alerts','backend.users.session_cleared','The user\'s session was successfully cleared.','2020-02-27 05:34:06','2020-04-16 09:32:56'),
(2108,0,'en','alerts','backend.users.social_deleted','Social Account Successfully Removed','2020-02-27 05:34:06','2020-04-16 09:32:56'),
(2109,0,'en','alerts','backend.users.deleted_permanently','The user was deleted permanently.','2020-02-27 05:34:06','2020-04-16 09:32:56'),
(2110,0,'en','alerts','backend.users.restored','The user was successfully restored.','2020-02-27 05:34:06','2020-04-16 09:32:56'),
(2111,0,'en','alerts','frontend.contact.sent','Your information was successfully sent. We will respond back to the e-mail provided as soon as we can.','2020-02-27 05:34:06','2020-04-16 09:32:56'),
(2112,0,'en','alerts','frontend.course.completed','Congratulations! You\'ve successfully completed course. Checkout your certificate in dashboard','2020-02-27 05:34:06','2020-04-16 09:32:56'),
(2113,0,'en','auth','general_error','You do not have access to do that.','2020-02-27 05:34:06','2020-04-16 09:33:27'),
(2114,0,'en','auth','socialite.unacceptable',':provider is not an acceptable login type.','2020-02-27 05:34:06','2020-04-16 09:33:27'),
(2115,0,'en','auth','password_rules','Your password must be more than 8 characters long, should contain at least 1 uppercase, 1 lowercase and 1 number.','2020-02-27 05:34:06','2020-04-16 09:33:27'),
(2116,0,'en','auth','password_used','You can not set a password that you have previously used.','2020-02-27 05:34:06','2020-04-16 09:33:27'),
(2117,0,'en','auth','failed','These credentials do not match our records.','2020-02-27 05:34:06','2020-04-16 09:33:27'),
(2118,0,'en','auth','throttle','Too many login attempts. Please try again in :seconds seconds.','2020-02-27 05:34:06','2020-04-16 09:33:27'),
(2119,0,'en','auth','unknown','An unknown error occurred','2020-02-27 05:34:06','2020-04-16 09:33:27'),
(2120,0,'en','buttons','general.crud.edit','Edit','2020-02-27 05:34:06','2020-04-16 09:34:03'),
(2121,0,'en','buttons','general.crud.delete','Delete','2020-02-27 05:34:07','2020-04-16 09:34:03'),
(2122,0,'en','buttons','general.crud.view','View','2020-02-27 05:34:07','2020-04-16 09:34:03'),
(2123,0,'en','buttons','general.crud.create','Create','2020-02-27 05:34:07','2020-04-16 09:34:03'),
(2124,0,'en','buttons','general.crud.update','Update','2020-02-27 05:34:07','2020-04-16 09:34:03'),
(2125,0,'en','buttons','general.crud.generate','Generate','2020-02-27 05:34:07','2020-04-16 09:34:03'),
(2126,0,'en','buttons','general.cancel','Cancel','2020-02-27 05:34:07','2020-04-16 09:34:03'),
(2127,0,'en','buttons','general.continue','Continue','2020-02-27 05:34:07','2020-04-16 09:34:03'),
(2128,0,'en','buttons','general.save','Save','2020-02-27 05:34:07','2020-04-16 09:34:03'),
(2129,0,'en','buttons','general.view','View','2020-02-27 05:34:07','2020-04-16 09:34:03'),
(2130,0,'en','buttons','backend.access.users.unconfirm','Un-confirm','2020-02-27 05:34:07','2020-04-16 09:34:03'),
(2131,0,'en','buttons','backend.access.users.confirm','Confirm','2020-02-27 05:34:07','2020-04-16 09:34:03'),
(2132,0,'en','buttons','backend.access.users.unlink','Unlink','2020-02-27 05:34:07','2020-04-16 09:34:03'),
(2133,0,'en','buttons','backend.access.users.login_as','Login As :user','2020-02-27 05:34:07','2020-04-16 09:34:03'),
(2134,0,'en','buttons','backend.access.users.clear_session','Clear Session','2020-02-27 05:34:07','2020-04-16 09:34:03'),
(2135,0,'en','buttons','backend.access.users.change_password','Change Password','2020-02-27 05:34:07','2020-04-16 09:34:03'),
(2136,0,'en','buttons','backend.access.users.activate','Activate','2020-02-27 05:34:07','2020-04-16 09:34:03'),
(2137,0,'en','buttons','backend.access.users.deactivate','Deactivate','2020-02-27 05:34:07','2020-04-16 09:34:03'),
(2138,0,'en','buttons','backend.access.users.resend_email','Resend Confirmation E-mail','2020-02-27 05:34:07','2020-04-16 09:34:03'),
(2139,0,'en','buttons','backend.access.users.delete_permanently','Delete Permanently','2020-02-27 05:34:07','2020-04-16 09:34:03'),
(2140,0,'en','buttons','backend.access.users.restore_user','Restore User','2020-02-27 05:34:07','2020-04-16 09:34:03'),
(2141,0,'en','buttons','emails.auth.confirm_account','Confirm Account','2020-02-27 05:34:07','2020-04-16 09:34:03'),
(2142,0,'en','buttons','emails.auth.reset_password','Reset Password','2020-02-27 05:34:07','2020-04-16 09:34:03'),
(2143,0,'en','configmanager','title','Config Manager','2020-02-27 05:34:07','2020-04-15 07:00:02'),
(2144,0,'en','configmanager','info_choose','Choose a file to start editing','2020-02-27 05:34:07','2020-04-15 07:00:02'),
(2145,0,'en','configmanager','file','File','2020-02-27 05:34:07','2020-04-15 07:00:02'),
(2146,0,'en','configmanager','path','Path','2020-02-27 05:34:07','2020-04-15 07:00:02'),
(2147,0,'en','configmanager','header.key','Key','2020-02-27 05:34:07','2020-04-15 07:00:02'),
(2148,0,'en','configmanager','header.value','Value','2020-02-27 05:34:07','2020-04-15 07:00:02'),
(2149,0,'en','configmanager','header.actions','Actions','2020-02-27 05:34:07','2020-04-15 07:00:02'),
(2150,0,'en','configmanager','actions.edit','Edit','2020-02-27 05:34:07','2020-04-15 07:00:02'),
(2151,0,'en','configmanager','actions.confirm','Save new key','2020-02-27 05:34:07','2020-04-15 07:00:02'),
(2152,0,'en','configmanager','actions.save','Save!','2020-02-27 05:34:07','2020-04-15 07:00:02'),
(2153,0,'en','configmanager','actions.cancel','Cancel','2020-02-27 05:34:07','2020-04-15 07:00:02'),
(2154,0,'en','configmanager','sure','Are you sure?','2020-02-27 05:34:07','2020-04-15 07:00:02'),
(2155,0,'en','datatable','colvis','Column Visibility','2020-02-27 05:34:07','2020-04-16 03:45:03'),
(2156,0,'en','datatable','csv','CSV','2020-02-27 05:34:07','2020-04-16 03:45:03'),
(2157,0,'en','datatable','pdf','PDF','2020-02-27 05:34:07','2020-04-16 03:45:03'),
(2158,0,'en','exceptions','backend.access.roles.cant_delete_admin','You can not delete the Administrator role.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2159,0,'en','exceptions','backend.access.roles.needs_permission','You must select at least one permission for this role.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2160,0,'en','exceptions','backend.access.roles.create_error','There was a problem creating this role. Please try again.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2161,0,'en','exceptions','backend.access.roles.update_error','There was a problem updating this role. Please try again.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2162,0,'en','exceptions','backend.access.roles.already_exists','That role already exists. Please choose a different name.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2163,0,'en','exceptions','backend.access.roles.delete_error','There was a problem deleting this role. Please try again.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2164,0,'en','exceptions','backend.access.roles.has_users','You can not delete a role with associated users.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2165,0,'en','exceptions','backend.access.roles.not_found','That role does not exist.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2166,0,'en','exceptions','backend.access.users.already_confirmed','This user is already confirmed.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2167,0,'en','exceptions','backend.access.users.cant_delete_own_session','You can not delete your own session.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2168,0,'en','exceptions','backend.access.users.session_wrong_driver','Your session driver must be set to database to use this feature.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2169,0,'en','exceptions','backend.access.users.social_delete_error','There was a problem removing the social account from the user.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2170,0,'en','exceptions','backend.access.users.role_needed_create','You must choose at lease one role.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2171,0,'en','exceptions','backend.access.users.create_error','There was a problem creating this user. Please try again.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2172,0,'en','exceptions','backend.access.users.update_error','There was a problem updating this user. Please try again.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2173,0,'en','exceptions','backend.access.users.update_password_error','There was a problem changing this users password. Please try again.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2174,0,'en','exceptions','backend.access.users.cant_deactivate_self','You can not do that to yourself.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2175,0,'en','exceptions','backend.access.users.mark_error','There was a problem updating this user. Please try again.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2176,0,'en','exceptions','backend.access.users.cant_confirm','There was a problem confirming the user account.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2177,0,'en','exceptions','backend.access.users.not_confirmed','This user is not confirmed.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2178,0,'en','exceptions','backend.access.users.cant_unconfirm_admin','You can not un-confirm the super administrator.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2179,0,'en','exceptions','backend.access.users.cant_unconfirm_self','You can not un-confirm yourself.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2180,0,'en','exceptions','backend.access.users.delete_first','This user must be deleted first before it can be destroyed permanently.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2181,0,'en','exceptions','backend.access.users.delete_error','There was a problem deleting this user. Please try again.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2182,0,'en','exceptions','backend.access.users.cant_restore','This user is not deleted so it can not be restored.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2183,0,'en','exceptions','backend.access.users.restore_error','There was a problem restoring this user. Please try again.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2184,0,'en','exceptions','backend.access.users.email_error','That email address belongs to a different user.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2185,0,'en','exceptions','backend.access.users.not_found','That user does not exist.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2186,0,'en','exceptions','backend.access.users.cant_delete_admin','You can not delete the super administrator.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2187,0,'en','exceptions','backend.access.users.cant_delete_self','You can not delete yourself.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2188,0,'en','exceptions','backend.access.users.role_needed','You must choose at least one role.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2189,0,'en','exceptions','frontend.auth.confirmation.success','Your account has been successfully confirmed!','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2190,0,'en','exceptions','frontend.auth.confirmation.already_confirmed','Your account is already confirmed.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2191,0,'en','exceptions','frontend.auth.confirmation.resent','A new confirmation e-mail has been sent to the address on file.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2192,0,'en','exceptions','frontend.auth.confirmation.pending','Your account is currently pending approval.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2193,0,'en','exceptions','frontend.auth.confirmation.resend','Your account is not confirmed. Please click the confirmation link in your e-mail, or <a href=\":url\">click here</a> to resend the confirmation e-mail.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2194,0,'en','exceptions','frontend.auth.confirmation.confirm','Confirm your account!','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2195,0,'en','exceptions','frontend.auth.confirmation.mismatch','Your confirmation code does not match.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2196,0,'en','exceptions','frontend.auth.confirmation.created_pending','Your account was successfully created and is pending approval. An e-mail will be sent when your account is approved.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2197,0,'en','exceptions','frontend.auth.confirmation.created_confirm','Your account was successfully created. We have sent you an e-mail to confirm your account.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2198,0,'en','exceptions','frontend.auth.confirmation.not_found','That confirmation code does not exist.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2199,0,'en','exceptions','frontend.auth.deactivated','Your account has been deactivated.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2200,0,'en','exceptions','frontend.auth.password.reset_problem','There was a problem resetting your password. Please resend the password reset email.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2201,0,'en','exceptions','frontend.auth.password.change_mismatch','That is not your old password.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2202,0,'en','exceptions','frontend.auth.email_taken','That e-mail address is already taken.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2203,0,'en','exceptions','frontend.auth.registration_disabled','Registration is currently closed.','2020-02-27 05:34:07','2020-04-16 03:47:03'),
(2204,0,'en','http','404.description2',' It looks like nothing was found at this location.','2020-02-27 05:34:07','2020-04-15 07:08:27'),
(2205,0,'en','http','404.title','Page Not Found','2020-02-27 05:34:07','2020-04-15 07:08:27'),
(2206,0,'en','http','404.title2','404','2020-02-27 05:34:07','2020-04-15 07:08:27'),
(2207,0,'en','http','404.back','Back To HomePage','2020-02-27 05:34:07','2020-04-15 07:08:27'),
(2208,0,'en','http','404.description','THIS IS SOMEWHAT EMBARRASSING, ISN’T IT?','2020-02-27 05:34:07','2020-04-15 07:08:27'),
(2209,0,'en','http','503.title','Be right back.','2020-02-27 05:34:07','2020-04-15 07:08:27'),
(2210,0,'en','http','503.description','Be right back.','2020-02-27 05:34:07','2020-04-15 07:08:27'),
(2211,0,'en','labels','backend.courses.title','Courses','2020-02-27 05:34:07','2020-04-19 12:52:12'),
(2212,0,'en','labels','backend.courses.fields.published','Published','2020-02-27 05:34:07','2020-04-19 12:52:12'),
(2213,0,'en','labels','backend.courses.fields.featured','Featured','2020-02-27 05:34:07','2020-04-19 12:52:12'),
(2214,0,'en','labels','backend.courses.fields.free','Free','2020-02-27 05:34:07','2020-04-19 12:52:12'),
(2215,0,'en','labels','backend.courses.fields.trending','Trending','2020-02-27 05:34:07','2020-04-19 12:52:12'),
(2216,0,'en','labels','backend.courses.fields.popular','Popular','2020-02-27 05:34:07','2020-04-19 12:52:12'),
(2217,0,'en','labels','backend.courses.fields.teachers','Teachers','2020-02-27 05:34:07','2020-04-19 12:52:12'),
(2218,0,'en','labels','backend.courses.fields.category','Category','2020-02-27 05:34:07','2020-04-19 12:52:12'),
(2219,0,'en','labels','backend.courses.fields.title','Title','2020-02-27 05:34:07','2020-04-19 12:52:12'),
(2220,0,'en','labels','backend.courses.fields.slug','Slug','2020-02-27 05:34:07','2020-04-19 12:52:12'),
(2221,0,'en','labels','backend.courses.fields.description','Description','2020-02-27 05:34:07','2020-04-19 12:52:12'),
(2222,0,'en','labels','backend.courses.fields.price','Price','2020-02-27 05:34:07','2020-04-19 12:52:12'),
(2223,0,'en','labels','backend.courses.fields.course_image','Course Image','2020-02-27 05:34:07','2020-04-19 12:52:12'),
(2224,0,'en','labels','backend.courses.fields.start_date','Start Date','2020-02-27 05:34:07','2020-04-19 12:52:12'),
(2225,0,'en','labels','backend.courses.fields.meta_title','Meta Title','2020-02-27 05:34:07','2020-04-19 12:52:12'),
(2226,0,'en','labels','backend.courses.fields.meta_description','Meta Description','2020-02-27 05:34:07','2020-04-19 12:52:12'),
(2227,0,'en','labels','backend.courses.fields.meta_keywords','Meta Keywords','2020-02-27 05:34:07','2020-04-19 12:52:12'),
(2228,0,'en','labels','backend.courses.fields.sidebar','Add Sidebar','2020-02-27 05:34:07','2020-04-19 12:52:12'),
(2229,0,'en','labels','backend.courses.fields.lessons.add','Add Lessons','2020-02-27 05:34:07','2020-04-19 12:52:12'),
(2230,0,'en','labels','backend.courses.fields.lessons.view','View Lessons','2020-02-27 05:34:07','2020-04-19 12:52:12'),
(2231,0,'en','labels','backend.courses.fields.course','Course','2020-02-27 05:34:07','2020-04-19 12:52:12'),
(2232,0,'en','labels','backend.courses.fields.status','Status','2020-02-27 05:34:07','2020-04-19 12:52:12'),
(2233,0,'en','labels','backend.courses.add_teachers','Add Teachers','2020-02-27 05:34:07','2020-04-19 12:52:12'),
(2234,0,'en','labels','backend.courses.add_categories','Add Categories','2020-02-27 05:34:07','2020-04-19 12:52:12'),
(2235,0,'en','labels','backend.courses.slug_placeholder','Input slug or it will be generated automatically','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2236,0,'en','labels','backend.courses.select_category','Select Category','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2237,0,'en','labels','backend.courses.select_teachers','Select Teachers','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2238,0,'en','labels','backend.courses.test','Test','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2239,0,'en','labels','backend.courses.lesson','Lesson','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2240,0,'en','labels','backend.courses.create','Create Course','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2241,0,'en','labels','backend.courses.edit','Edit Course','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2242,0,'en','labels','backend.courses.view','View Courses','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2243,0,'en','labels','backend.courses.category','Category','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2244,0,'en','labels','backend.courses.save_timeline','Save timeline','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2245,0,'en','labels','backend.courses.course_timeline','Course timeline','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2246,0,'en','labels','backend.courses.timeline_description','Drag and change sequence of Lessons/Tests for course','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2247,0,'en','labels','backend.courses.listing_note','Only Published Lessons and Tests will be Displayed and Sorted.','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2248,0,'en','labels','backend.tests.title','Tests','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2249,0,'en','labels','backend.tests.fields.course','Course','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2250,0,'en','labels','backend.tests.fields.lesson','Lesson','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2251,0,'en','labels','backend.tests.fields.title','Title','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2252,0,'en','labels','backend.tests.fields.description','Description','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2253,0,'en','labels','backend.tests.fields.published','Published','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2254,0,'en','labels','backend.tests.fields.questions','Questions','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2255,0,'en','labels','backend.tests.create','Create Test','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2256,0,'en','labels','backend.tests.edit','Edit Test','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2257,0,'en','labels','backend.tests.view','View Tests','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2258,0,'en','labels','backend.orders.fields.payment_status.pending','Pending','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2259,0,'en','labels','backend.orders.fields.payment_status.completed','Completed','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2260,0,'en','labels','backend.orders.fields.payment_status.failed','Failed','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2261,0,'en','labels','backend.orders.fields.payment_status.title','Payment','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2262,0,'en','labels','backend.orders.fields.payment_type.stripe','Credit / Debit Card (Stripe Payment Gateway)','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2263,0,'en','labels','backend.orders.fields.payment_type.paypal','Paypal','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2264,0,'en','labels','backend.orders.fields.payment_type.offline','Offline','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2265,0,'en','labels','backend.orders.fields.payment_type.title','Payment Type','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2266,0,'en','labels','backend.orders.fields.reference_no','Reference No.','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2267,0,'en','labels','backend.orders.fields.ordered_by','Ordered By','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2268,0,'en','labels','backend.orders.fields.items','Items','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2269,0,'en','labels','backend.orders.fields.amount','Amount','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2270,0,'en','labels','backend.orders.fields.user_email','User Email','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2271,0,'en','labels','backend.orders.fields.date','Order date','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2272,0,'en','labels','backend.orders.complete','Complete Manually','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2273,0,'en','labels','backend.orders.offline_requests','Offline Requests','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2274,0,'en','labels','backend.orders.view_invoice','View Invoice','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2275,0,'en','labels','backend.orders.download_invoice','Download Invoice','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2276,0,'en','labels','backend.orders.title','Orders','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2277,0,'en','labels','backend.pages.fields.published','Published','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2278,0,'en','labels','backend.pages.fields.drafted','Drafted','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2279,0,'en','labels','backend.pages.fields.title','Title','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2280,0,'en','labels','backend.pages.fields.slug','Slug','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2281,0,'en','labels','backend.pages.fields.featured_image','Featured image','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2282,0,'en','labels','backend.pages.fields.content','Content','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2283,0,'en','labels','backend.pages.fields.meta_title','Meta Title','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2284,0,'en','labels','backend.pages.fields.meta_description','Meta Description','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2285,0,'en','labels','backend.pages.fields.meta_keywords','Meta Keywords','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2286,0,'en','labels','backend.pages.fields.clear','Clear','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2287,0,'en','labels','backend.pages.fields.status','Status','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2288,0,'en','labels','backend.pages.fields.created','Created','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2289,0,'en','labels','backend.pages.fields.created_at','Created On','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2290,0,'en','labels','backend.pages.max_file_size','(max file size 10MB)','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2291,0,'en','labels','backend.pages.title','Pages','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2292,0,'en','labels','backend.pages.create','Create Page','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2293,0,'en','labels','backend.pages.edit','Edit Page','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2294,0,'en','labels','backend.pages.view','View Pages','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2295,0,'en','labels','backend.access.users.user_actions','User Actions','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2296,0,'en','labels','backend.access.users.management','User Management','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2297,0,'en','labels','backend.access.users.change_password','Change Password','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2298,0,'en','labels','backend.access.users.change_password_for','Change Password for :user','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2299,0,'en','labels','backend.access.users.create','Create User','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2300,0,'en','labels','backend.access.users.table.abilities','Abilities','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2301,0,'en','labels','backend.access.users.table.total','user total|users total','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2302,0,'en','labels','backend.access.users.table.confirmed','Confirmed','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2303,0,'en','labels','backend.access.users.table.created','Created','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2304,0,'en','labels','backend.access.users.table.email','E-mail','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2305,0,'en','labels','backend.access.users.table.id','ID','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2306,0,'en','labels','backend.access.users.table.last_updated','Last Updated','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2307,0,'en','labels','backend.access.users.table.name','Name','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2308,0,'en','labels','backend.access.users.table.first_name','First Name','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2309,0,'en','labels','backend.access.users.table.last_name','Last Name','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2310,0,'en','labels','backend.access.users.table.no_deactivated','No Deactivated Users','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2311,0,'en','labels','backend.access.users.table.no_deleted','No Deleted Users','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2312,0,'en','labels','backend.access.users.table.other_permissions','Other Permissions','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2313,0,'en','labels','backend.access.users.table.permissions','Permissions','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2314,0,'en','labels','backend.access.users.table.roles','Roles','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2315,0,'en','labels','backend.access.users.table.social','Social','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2316,0,'en','labels','backend.access.users.table.status','Status','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2317,0,'en','labels','backend.access.users.all_permissions','All Permissions','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2318,0,'en','labels','backend.access.users.deactivated','Deactivated Users','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2319,0,'en','labels','backend.access.users.deleted','Deleted Users','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2320,0,'en','labels','backend.access.users.edit','Edit User','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2321,0,'en','labels','backend.access.users.active','Active Users','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2322,0,'en','labels','backend.access.users.view','View User','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2323,0,'en','labels','backend.access.users.tabs.titles.overview','Overview','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2324,0,'en','labels','backend.access.users.tabs.titles.history','History','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2325,0,'en','labels','backend.access.users.tabs.content.overview.avatar','Avatar','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2326,0,'en','labels','backend.access.users.tabs.content.overview.confirmed','Confirmed','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2327,0,'en','labels','backend.access.users.tabs.content.overview.created_at','Created At','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2328,0,'en','labels','backend.access.users.tabs.content.overview.deleted_at','Deleted At','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2329,0,'en','labels','backend.access.users.tabs.content.overview.email','E-mail','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2330,0,'en','labels','backend.access.users.tabs.content.overview.last_login_at','Last Login At','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2331,0,'en','labels','backend.access.users.tabs.content.overview.last_login_ip','Last Login IP','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2332,0,'en','labels','backend.access.users.tabs.content.overview.last_updated','Last Updated','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2333,0,'en','labels','backend.access.users.tabs.content.overview.name','Name','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2334,0,'en','labels','backend.access.users.tabs.content.overview.first_name','First Name','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2335,0,'en','labels','backend.access.users.tabs.content.overview.last_name','Last Name','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2336,0,'en','labels','backend.access.users.tabs.content.overview.status','Status','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2337,0,'en','labels','backend.access.users.tabs.content.overview.timezone','Timezone','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2338,0,'en','labels','backend.access.users.no_permissions','No Permissions','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2339,0,'en','labels','backend.access.users.no_roles','No Roles to set.','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2340,0,'en','labels','backend.access.users.permissions','Permissions','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2341,0,'en','labels','backend.access.users.select_role','Select Role','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2342,0,'en','labels','backend.access.roles.management','Role Management','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2343,0,'en','labels','backend.access.roles.create','Create Role','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2344,0,'en','labels','backend.access.roles.edit','Edit Role','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2345,0,'en','labels','backend.access.roles.table.total','role total|roles total','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2346,0,'en','labels','backend.access.roles.table.number_of_users','Number of Users','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2347,0,'en','labels','backend.access.roles.table.permissions','Permissions','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2348,0,'en','labels','backend.access.roles.table.role','Role','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2349,0,'en','labels','backend.access.roles.table.sort','Sort','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2350,0,'en','labels','backend.blogs.fields.title','Title','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2351,0,'en','labels','backend.blogs.fields.category','Category','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2352,0,'en','labels','backend.blogs.fields.slug','Slug','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2353,0,'en','labels','backend.blogs.fields.featured_image','Featured image','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2354,0,'en','labels','backend.blogs.fields.content','Content','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2355,0,'en','labels','backend.blogs.fields.tags_placeholder','Add tags here','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2356,0,'en','labels','backend.blogs.fields.meta_title','Meta Title','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2357,0,'en','labels','backend.blogs.fields.meta_description','Meta Description','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2358,0,'en','labels','backend.blogs.fields.meta_keywords','Meta Keywords','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2359,0,'en','labels','backend.blogs.fields.publish','Publish','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2360,0,'en','labels','backend.blogs.fields.clear','Clear','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2361,0,'en','labels','backend.blogs.fields.status','Status','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2362,0,'en','labels','backend.blogs.fields.views','Views','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2363,0,'en','labels','backend.blogs.fields.created','Created','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2364,0,'en','labels','backend.blogs.fields.comments','Comments','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2365,0,'en','labels','backend.blogs.fields.tags','Tags','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2366,0,'en','labels','backend.blogs.fields.created_at','Created On','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2367,0,'en','labels','backend.blogs.max_file_size','(max file size 10MB)','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2368,0,'en','labels','backend.blogs.title','Blog','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2369,0,'en','labels','backend.blogs.create','Create Blog','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2370,0,'en','labels','backend.blogs.edit','Edit Blog','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2371,0,'en','labels','backend.blogs.view','View Blogs','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2372,0,'en','labels','backend.lessons.slug_placeholder','Input slug or it will be generated automatically','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2373,0,'en','labels','backend.lessons.fields.course','Course','2020-02-27 05:34:08','2020-04-19 12:52:12'),
(2374,0,'en','labels','backend.lessons.fields.title','Title','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2375,0,'en','labels','backend.lessons.fields.slug','Slug','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2376,0,'en','labels','backend.lessons.fields.lesson_image','Lesson Image','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2377,0,'en','labels','backend.lessons.fields.short_text','Short Text','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2378,0,'en','labels','backend.lessons.fields.full_text','Full Text','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2379,0,'en','labels','backend.lessons.fields.downloadable_files','Downloadable Files','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2380,0,'en','labels','backend.lessons.fields.free_lesson','Free Lesson','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2381,0,'en','labels','backend.lessons.fields.published','Published','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2382,0,'en','labels','backend.lessons.fields.position','Position','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2383,0,'en','labels','backend.lessons.fields.youtube_videos','YouTube Videos','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2384,0,'en','labels','backend.lessons.fields.add_pdf','Add PDF','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2385,0,'en','labels','backend.lessons.fields.add_video','Add Video','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2386,0,'en','labels','backend.lessons.fields.media_video','Media Video','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2387,0,'en','labels','backend.lessons.fields.media_audio','Media Audio','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2388,0,'en','labels','backend.lessons.fields.media_pdf','Media PDF','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2389,0,'en','labels','backend.lessons.fields.add_audio','Add Audio','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2390,0,'en','labels','backend.lessons.max_file_size','(max file size 5MB)','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2391,0,'en','labels','backend.lessons.short_description_placeholder','Input short description of lesson','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2392,0,'en','labels','backend.lessons.select_course','Select Course','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2393,0,'en','labels','backend.lessons.yt_note','<b>Instructions to add Video link: </b><br> Go to youtube -> open video -> right click on video and <b>Copy Video URL</b> and paste here.<br> If you want to add multiple videos, then separate them with <b>,</b> (Comma) Sign.','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2394,0,'en','labels','backend.lessons.vimeo_note','<b>Instructions to add Video link: </b><br> Go to vimeo -> open video -> right click on video and <b>Copy Video URL</b> and paste here.<br> If you want to add multiple videos, then separate them with <b>,</b> (Comma) Sign.','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2395,0,'en','labels','backend.lessons.title','Lessons','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2396,0,'en','labels','backend.lessons.enter_video_url','Enter video data','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2397,0,'en','labels','backend.lessons.enter_video_embed_code','Enter video embed code','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2398,0,'en','labels','backend.lessons.create','Create Lesson','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2399,0,'en','labels','backend.lessons.edit','Edit Lesson','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2400,0,'en','labels','backend.lessons.view','View Lessons','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2401,0,'en','labels','backend.lessons.video_guide','<p class=\"mb-1\"><b>Youtube :</b> Go to Youtube -> Go to video you want to display -> click on share button below video. Copy that links and paste in above text box </p>\n<p class=\"mb-1\"><b>Vimeo :</b> Go to Vimeo -> Go to video you want to display -> click on share button and copy paste video url here </p>\n<p class=\"mb-1\"><b>Upload :</b> Upload <b>mp4</b> file in file input</p>\n<p class=\"mb-1\"><b>Embed :</b> Copy / Paste embed code in above text box</p>','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2402,0,'en','labels','backend.lessons.remove','Remove','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2403,0,'en','labels','backend.categories.fields.name','Name','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2404,0,'en','labels','backend.categories.fields.select_icon','Select Icon','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2405,0,'en','labels','backend.categories.fields.image','Image','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2406,0,'en','labels','backend.categories.fields.icon','Icon','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2407,0,'en','labels','backend.categories.fields.icon_type.title','Icon type','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2408,0,'en','labels','backend.categories.fields.icon_type.select_any','Select Any','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2409,0,'en','labels','backend.categories.fields.icon_type.image','Upload image','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2410,0,'en','labels','backend.categories.fields.icon_type.icon','Select Icon','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2411,0,'en','labels','backend.categories.fields.or','Or','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2412,0,'en','labels','backend.categories.fields.slug','Slug','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2413,0,'en','labels','backend.categories.fields.courses','Courses','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2414,0,'en','labels','backend.categories.fields.status','Status','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2415,0,'en','labels','backend.categories.fields.blog','Blog','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2416,0,'en','labels','backend.categories.title','Categories','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2417,0,'en','labels','backend.categories.create','Create Category','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2418,0,'en','labels','backend.categories.edit','Edit Category','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2419,0,'en','labels','backend.categories.view','View Categories','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2420,0,'en','labels','backend.categories.not_allowed','Not allowed! Category contains data.','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2421,0,'en','labels','backend.faqs.fields.question','Question','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2422,0,'en','labels','backend.faqs.fields.answer','Answer','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2423,0,'en','labels','backend.faqs.fields.category','Category','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2424,0,'en','labels','backend.faqs.fields.status','Status','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2425,0,'en','labels','backend.faqs.title','FAQs','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2426,0,'en','labels','backend.faqs.create','Create FAQ','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2427,0,'en','labels','backend.faqs.edit','Edit FAQ','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2428,0,'en','labels','backend.faqs.view','View FAQs','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2429,0,'en','labels','backend.invoices.fields.view','View','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2430,0,'en','labels','backend.invoices.fields.download','Download','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2431,0,'en','labels','backend.invoices.fields.order_date','Order Date','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2432,0,'en','labels','backend.invoices.fields.amount','Amount','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2433,0,'en','labels','backend.invoices.title','Invoices','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2434,0,'en','labels','backend.menu-manager.title','Menu Manager','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2435,0,'en','labels','backend.messages.compose','Compose','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2436,0,'en','labels','backend.messages.search_user','Search User','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2437,0,'en','labels','backend.messages.select_recipients','Select Recipients','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2438,0,'en','labels','backend.messages.start_conversation','Start a conversation','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2439,0,'en','labels','backend.messages.type_a_message','Type a message','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2440,0,'en','labels','backend.messages.title','Messages','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2441,0,'en','labels','backend.questions.fields.question','Question','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2442,0,'en','labels','backend.questions.fields.question_image','Question Image','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2443,0,'en','labels','backend.questions.fields.score','Score','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2444,0,'en','labels','backend.questions.fields.tests','Tests','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2445,0,'en','labels','backend.questions.fields.option_text','Option Text','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2446,0,'en','labels','backend.questions.fields.correct','Correct','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2447,0,'en','labels','backend.questions.fields.course','Course','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2448,0,'en','labels','backend.questions.fields.lesson','Lesson','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2449,0,'en','labels','backend.questions.fields.title','Title','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2450,0,'en','labels','backend.questions.fields.option_explanation','Option Explanation','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2451,0,'en','labels','backend.questions.title','Questions','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2452,0,'en','labels','backend.questions.create','Create Question','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2453,0,'en','labels','backend.questions.edit','Edit Question','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2454,0,'en','labels','backend.questions.view','View Questions','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2455,0,'en','labels','backend.questions.test','Test','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2456,0,'en','labels','backend.reasons.fields.title','Title','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2457,0,'en','labels','backend.reasons.fields.icon','Icon','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2458,0,'en','labels','backend.reasons.fields.content','Content','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2459,0,'en','labels','backend.reasons.fields.status','Status','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2460,0,'en','labels','backend.reasons.title','Reasons','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2461,0,'en','labels','backend.reasons.create','Create Reason','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2462,0,'en','labels','backend.reasons.edit','Edit Reason','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2463,0,'en','labels','backend.reasons.view','View Reasons','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2464,0,'en','labels','backend.reasons.note','Reasons will be displayed as a slider on homepage as below','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2465,0,'en','labels','backend.general_settings.title','General','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2466,0,'en','labels','backend.general_settings.contact.short_text','Short Text','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2467,0,'en','labels','backend.general_settings.contact.show','Show','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2468,0,'en','labels','backend.general_settings.contact.primary_address','Primary Address','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2469,0,'en','labels','backend.general_settings.contact.secondary_address','Secondary Address','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2470,0,'en','labels','backend.general_settings.contact.primary_phone','Primary Phone','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2471,0,'en','labels','backend.general_settings.contact.secondary_phone','Secondary Phone','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2472,0,'en','labels','backend.general_settings.contact.primary_email','Primary Email','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2473,0,'en','labels','backend.general_settings.contact.secondary_email','Secondary Email','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2474,0,'en','labels','backend.general_settings.contact.location_on_map','Location on Map','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2475,0,'en','labels','backend.general_settings.contact.map_note','<h3>How to embed Location for Map?</h3>\n                                <p>Do following simple steps and you are good to go:</p>\n                                <ol class=\"map-guide\">\n                                    <li>Go to <a class=\"text-bold\" target=\"_blank\" href=\"//maps.google.com\">Google Map</a> </li>\n                                    <li>Search the place you want to add by Entering address / location in input box located on upper-left corner</li>\n                                    <li>Once you get the place you want. It shows details in left sidebar. Click on <i class=\"fa fa-share-alt text-primary\"></i> button</li>\n                                    <li>A popup will appear which will have two tabs <b>Send a link</b> and <b>Embed a Map</b></li>\n                                    <li>Click on <b>Embed a map</b> It will show you chosen Place on Map</li>\n                                    <li>Now click on the dropdown from the left. By default <b>Medium</b> is selected. Click on it and Select <b>Large</b></li>\n                                    <li>Now Click on <b class=\"text-primary\">COPY HTML</b> link from it and <b>Paste</b> that code here in <b>Location on Map</b>.</li>\n                                </ol>','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2476,0,'en','labels','backend.general_settings.contact.title','Contact','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2477,0,'en','labels','backend.general_settings.contact.primary_email_note','This email will be used to correspond \"Contact Us\" emails','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2478,0,'en','labels','backend.general_settings.footer.short_description','Short Description','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2479,0,'en','labels','backend.general_settings.footer.popular_categories','Popular categories','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2480,0,'en','labels','backend.general_settings.footer.featured_courses','Featured courses','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2481,0,'en','labels','backend.general_settings.footer.trending_courses','Trending courses','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2482,0,'en','labels','backend.general_settings.footer.popular_courses','Popular courses','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2483,0,'en','labels','backend.general_settings.footer.custom_links','Custom Links','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2484,0,'en','labels','backend.general_settings.footer.social_links','Social Links','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2485,0,'en','labels','backend.general_settings.footer.link_url','URL','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2486,0,'en','labels','backend.general_settings.footer.social_links_note','Add social link URL and select Icon for that media from iconpicker. Click on <b>ADD +</b> button. And your social link will be created. You can also delete them by clicking on <b><i class=\"fa fa-times\"></i></b> button','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2487,0,'en','labels','backend.general_settings.footer.newsletter_form','Newsletter Form','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2488,0,'en','labels','backend.general_settings.footer.bottom_footer','Bottom Footer','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2489,0,'en','labels','backend.general_settings.footer.bottom_footer_note','Note : it includes Copyright text and Footer links','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2490,0,'en','labels','backend.general_settings.footer.copyright_text','Copyright Text','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2491,0,'en','labels','backend.general_settings.footer.footer_links','Footer Links','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2492,0,'en','labels','backend.general_settings.footer.link_label','Label','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2493,0,'en','labels','backend.general_settings.footer.link','Link','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2494,0,'en','labels','backend.general_settings.footer.title','Footer','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2495,0,'en','labels','backend.general_settings.footer.section_1','Section 1','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2496,0,'en','labels','backend.general_settings.footer.section_2','Section 2','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2497,0,'en','labels','backend.general_settings.footer.section_3','Section 3','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2498,0,'en','labels','backend.general_settings.footer.recent_news','Recent News','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2499,0,'en','labels','backend.general_settings.logos.title','Logos','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2500,0,'en','labels','backend.general_settings.layout.title','Layout','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2501,0,'en','labels','backend.general_settings.email.title','Mail Configuration','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2502,0,'en','labels','backend.general_settings.email.mail_from_name','Mail From Name','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2503,0,'en','labels','backend.general_settings.email.mail_from_name_note','This will be display name for your sent email.','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2504,0,'en','labels','backend.general_settings.email.mail_from_address','Mail From Address','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2505,0,'en','labels','backend.general_settings.email.mail_from_address_note','This email will be used for \"Contact Form\" correspondence.','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2506,0,'en','labels','backend.general_settings.email.mail_driver','Mail Driver','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2507,0,'en','labels','backend.general_settings.email.mail_driver_note','You can select any driver you want for your Mail setup. <b>Ex. SMTP, Mailgun, Mandrill, SparkPost, Amazon SES etc.</b><br> Add <b>single driver only</b>.','2020-02-27 05:34:09','2020-04-19 12:52:12'),
(2508,0,'en','labels','backend.general_settings.email.mail_host','Mail HOST','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2509,0,'en','labels','backend.general_settings.email.mail_port','Mail PORT','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2510,0,'en','labels','backend.general_settings.email.mail_username','Mail Username','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2511,0,'en','labels','backend.general_settings.email.mail_username_note','Add your email id you want to configure for sending emails','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2512,0,'en','labels','backend.general_settings.email.mail_password','Mail Password','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2513,0,'en','labels','backend.general_settings.email.mail_password_note','Add your email password you want to configure for sending emails','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2514,0,'en','labels','backend.general_settings.email.mail_encryption','Mail Encryption','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2515,0,'en','labels','backend.general_settings.email.mail_encryption_note','Use <b>tls</b> if your site uses <b>HTTP</b> protocol and <b>ssl</b> if you site uses <b>HTTPS</b> protocol','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2516,0,'en','labels','backend.general_settings.email.note','<b>Important Note</b> : IF you are using <b>GMAIL</b> for Mail configuration, make sure you have completed following process before updating:\n <ul>\n<li>Go to <a target=\"_blank\" href=\"https://myaccount.google.com/security\">My Account</a> from your Google Account you want to configure and Login</li>\n<li>Scroll down to <b>Less secure app access</b> and set it <b>ON</b></li>\n</ul>','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2517,0,'en','labels','backend.general_settings.payment_settings.title','Payment Configuration','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2518,0,'en','labels','backend.general_settings.payment_settings.select_currency','Select Currency','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2519,0,'en','labels','backend.general_settings.payment_settings.stripe','Stripe Payment Method','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2520,0,'en','labels','backend.general_settings.payment_settings.stripe_note','Enables payments in site with Debit / Credit Cards','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2521,0,'en','labels','backend.general_settings.payment_settings.paypal','Paypal Payment Method','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2522,0,'en','labels','backend.general_settings.payment_settings.paypal_note','Redirects to paypal for payment','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2523,0,'en','labels','backend.general_settings.payment_settings.offline_mode','Offline Payment Method','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2524,0,'en','labels','backend.general_settings.payment_settings.offline_mode_note','User gets assistance for offline payment via admin','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2525,0,'en','labels','backend.general_settings.payment_settings.key','API Key','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2526,0,'en','labels','backend.general_settings.payment_settings.secret','API Secret','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2527,0,'en','labels','backend.general_settings.payment_settings.client_id','Client ID','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2528,0,'en','labels','backend.general_settings.payment_settings.client_secret','Secret','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2529,0,'en','labels','backend.general_settings.payment_settings.mode','Mode','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2530,0,'en','labels','backend.general_settings.payment_settings.sandbox','Sandbox','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2531,0,'en','labels','backend.general_settings.payment_settings.live','Live','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2532,0,'en','labels','backend.general_settings.payment_settings.how_to_stripe','How to get STRIPE API Credentials?','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2533,0,'en','labels','backend.general_settings.payment_settings.how_to_paypal','How to get PayPal API Credentials?','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2534,0,'en','labels','backend.general_settings.payment_settings.mode_note','<b>Sandbox</b>= Will be used for testing payments with PayPal Test Credentials. Account with USD only can make payments with PayPal for now. This options will redirect to test PayPal payment with Sandbox User Credentials. It will be used for dummy transactions only.<br>\n<b>Live</b> = Will be used with you Live PayPal credentials to make actual transaction with normal users with PayPal account.','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2535,0,'en','labels','backend.general_settings.payment_settings.bluesnap','Bluesnap Payment Method','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2536,0,'en','labels','backend.general_settings.payment_settings.bluesnap_note','Bluesnap card form for payment','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2537,0,'en','labels','backend.general_settings.payment_settings.how_to_bluesnap','How to get Bluesnap API Credentials?','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2538,0,'en','labels','backend.general_settings.management','General Settings','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2539,0,'en','labels','backend.general_settings.app_name','App Name','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2540,0,'en','labels','backend.general_settings.app_url','App URL','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2541,0,'en','labels','backend.general_settings.teacher_commission_rate','Teacher Commission Rate','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2542,0,'en','labels','backend.general_settings.lesson_note','Enable / Disable if user will be able to skip before timer is over.','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2543,0,'en','labels','backend.general_settings.font_color','Font Color','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2544,0,'en','labels','backend.general_settings.static','Static','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2545,0,'en','labels','backend.general_settings.google_analytics_id','Google Analytics ID','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2546,0,'en','labels','backend.general_settings.google_analytics_id_note','How to get Google Analytics ID?','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2547,0,'en','labels','backend.general_settings.database','Database / Real','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2548,0,'en','labels','backend.general_settings.counter','Counter','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2549,0,'en','labels','backend.general_settings.counter_note','<b>Static</b> =  Manually add data for counter. Please enter exact text you want to display on frontend counter section,<br> <b>Database/Real</b> = It will take real data from database for all the fields (Students enrolled, Total Courses, Total Teachers)','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2550,0,'en','labels','backend.general_settings.total_students','Enter Total Students. Ex: 1K, 1Million, 1000 etc.','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2551,0,'en','labels','backend.general_settings.total_courses','Enter Total Courses. Ex: 1K, 1000 etc.','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2552,0,'en','labels','backend.general_settings.total_teachers','Enter Total Teachers. Ex: 1K, 1000 etc.','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2553,0,'en','labels','backend.general_settings.layout_type','Layout Type','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2554,0,'en','labels','backend.general_settings.theme_layout','Theme Layout','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2555,0,'en','labels','backend.general_settings.layout_note','This will change frontend theme layout','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2556,0,'en','labels','backend.general_settings.show_offers_note','Enable / Disable if Coupon offers page link to be displayed in bottom footer','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2557,0,'en','labels','backend.general_settings.newsletter.mail_provider','Mail Service Provider','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2558,0,'en','labels','backend.general_settings.newsletter.mailchimp','Mailchimp','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2559,0,'en','labels','backend.general_settings.newsletter.sendgrid','SendGrid','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2560,0,'en','labels','backend.general_settings.newsletter.mail_provider_note','<b>Note </b>: You can select any Mail service provider to receive all the emails which are being used to <b>subscribe newsletter</b>.<br> Select and setup according to steps given. <b>It is compulsory</b>, if you want to use <b>newsletter subscription</b> form.','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2561,0,'en','labels','backend.general_settings.newsletter.api_key','API Key','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2562,0,'en','labels','backend.general_settings.newsletter.api_key_note','Generate <b>API key</b> from your <a target=\"_blank\" href=\"https://mailchimp.com/\"><b> Mailchimp account</b></a> and paste that in above text box.','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2563,0,'en','labels','backend.general_settings.newsletter.api_key_question','How to generate API key?','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2564,0,'en','labels','backend.general_settings.newsletter.list_id','List ID','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2565,0,'en','labels','backend.general_settings.newsletter.list_id_note','Find and paste <b>List ID</b> in above box','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2566,0,'en','labels','backend.general_settings.newsletter.list_id_question','How to find List ID from Mailchimp?','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2567,0,'en','labels','backend.general_settings.newsletter.double_opt_in','Double Opt-in','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2568,0,'en','labels','backend.general_settings.newsletter.double_opt_in_note','<b>On</b> = User will be asked in mail to opt in for subscription. <b>Off</b> = User will be directly subscribed for newsletter ','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2569,0,'en','labels','backend.general_settings.newsletter.api_key_note_sendgrid','Generate <b>API key</b> from your <a target=\"_blank\" href=\"https://sendgrid.com/\"><b> SendGrid account</b></a> and paste that in above text box.','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2570,0,'en','labels','backend.general_settings.newsletter.get_lists','Get Lists','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2571,0,'en','labels','backend.general_settings.newsletter.sendgrid_lists','SendGrid Email Lists','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2572,0,'en','labels','backend.general_settings.newsletter.select_list','Select List','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2573,0,'en','labels','backend.general_settings.newsletter.manage_lists','Manage SendGrid Lists','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2574,0,'en','labels','backend.general_settings.newsletter.create_new','Create and Select New','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2575,0,'en','labels','backend.general_settings.newsletter.title','Newsletter Configuration','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2576,0,'en','labels','backend.general_settings.newsletter.list_id_question_sendgrid','Create new Email list for SendGrid Here.','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2577,0,'en','labels','backend.general_settings.mail_configuration_note','Have you configured :link Mail Settings</a>? It is compulsory to setup to send/receive emails','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2578,0,'en','labels','backend.general_settings.app_locale','App Locale','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2579,0,'en','labels','backend.general_settings.app_timezone','App Timezone','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2580,0,'en','labels','backend.general_settings.mail_driver','Mail Driver','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2581,0,'en','labels','backend.general_settings.mail_host','Mail Host','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2582,0,'en','labels','backend.general_settings.mail_port','Mail Port','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2583,0,'en','labels','backend.general_settings.mail_from_name','Mail From Name','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2584,0,'en','labels','backend.general_settings.mail_from_address','Mail From Address','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2585,0,'en','labels','backend.general_settings.mail_username','Mail Username','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2586,0,'en','labels','backend.general_settings.mail_password','Mail Password','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2587,0,'en','labels','backend.general_settings.enable_registration','Enable Registration','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2588,0,'en','labels','backend.general_settings.change_email','Change Email','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2589,0,'en','labels','backend.general_settings.password_history','Password History','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2590,0,'en','labels','backend.general_settings.password_expires_days','Password Expires Days','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2591,0,'en','labels','backend.general_settings.requires_approval','Requires Approval','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2592,0,'en','labels','backend.general_settings.confirm_email','Confirm Email','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2593,0,'en','labels','backend.general_settings.homepage','Select Homepage','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2594,0,'en','labels','backend.general_settings.captcha_status','Captcha Status','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2595,0,'en','labels','backend.general_settings.captcha_site_key','Captcha Key','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2596,0,'en','labels','backend.general_settings.captcha_site_secret','Captcha Secret','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2597,0,'en','labels','backend.general_settings.google_analytics','Google Analytics Code','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2598,0,'en','labels','backend.general_settings.sections_note','Once you click on update, you will see list of sections to on/off.','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2599,0,'en','labels','backend.general_settings.general.title','General','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2600,0,'en','labels','backend.general_settings.captcha','Whether the registration - login captcha is on or off','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2601,0,'en','labels','backend.general_settings.captcha_note','How to get Google reCaptcha credentials?','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2602,0,'en','labels','backend.general_settings.retest_note','Enable / Disable if user will be able to give retest for same exam','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2603,0,'en','labels','backend.general_settings.language_settings.title','Language Settings','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2604,0,'en','labels','backend.general_settings.language_settings.default_language','Default Language','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2605,0,'en','labels','backend.general_settings.language_settings.right_to_left','Right to Left','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2606,0,'en','labels','backend.general_settings.language_settings.left_to_right','Left to right','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2607,0,'en','labels','backend.general_settings.language_settings.display_type','Display Type','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2608,0,'en','labels','backend.general_settings.user_registration_settings.title','User Registration Settings','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2609,0,'en','labels','backend.general_settings.user_registration_settings.desc','Checked fields from the right sidebar will be displayed in registration form','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2610,0,'en','labels','backend.general_settings.user_registration_settings.fields.first_name','First Name','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2611,0,'en','labels','backend.general_settings.user_registration_settings.fields.last_name','Last Name','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2612,0,'en','labels','backend.general_settings.user_registration_settings.fields.email','Email','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2613,0,'en','labels','backend.general_settings.user_registration_settings.fields.password','Password','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2614,0,'en','labels','backend.general_settings.user_registration_settings.fields.phone','Phone','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2615,0,'en','labels','backend.general_settings.user_registration_settings.fields.dob','Date of Birth','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2616,0,'en','labels','backend.general_settings.user_registration_settings.fields.gender','Gender','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2617,0,'en','labels','backend.general_settings.user_registration_settings.fields.male','Male','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2618,0,'en','labels','backend.general_settings.user_registration_settings.fields.female','Female','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2619,0,'en','labels','backend.general_settings.user_registration_settings.fields.other','Other','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2620,0,'en','labels','backend.general_settings.user_registration_settings.fields.address','Address','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2621,0,'en','labels','backend.general_settings.user_registration_settings.fields.pincode','Pincode','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2622,0,'en','labels','backend.general_settings.user_registration_settings.fields.country','Country','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2623,0,'en','labels','backend.general_settings.user_registration_settings.fields.state','State','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2624,0,'en','labels','backend.general_settings.user_registration_settings.fields.city','City','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2625,0,'en','labels','backend.general_settings.troubleshoot','Troubleshoot','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2626,0,'en','labels','backend.general_settings.onesignal_note','Enable / Disble OneSignal configuration for Website.','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2627,0,'en','labels','backend.general_settings.how_to_onesignal','How to create app in OneSignal?','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2628,0,'en','labels','backend.general_settings.setup_onesignal','How to set up OneSignal?','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2629,0,'en','labels','backend.general_settings.api_clients.title','API Clients','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2630,0,'en','labels','backend.general_settings.api_clients.generate','Generate','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2631,0,'en','labels','backend.general_settings.api_clients.note','<span class=\"text-danger font-weight-bold\">Note :</span> This section will be helpful for API purpose. You can generate <b>Client ID</b> and <b>Client Secret</b> to use in your Android app or Postman to test the API.<br> You need to customise parameters and URL according to your requirement.','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2632,0,'en','labels','backend.general_settings.api_clients.developer_manual','Developer Manual','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2633,0,'en','labels','backend.general_settings.api_clients.fields.name','Name','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2634,0,'en','labels','backend.general_settings.api_clients.fields.id','ID','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2635,0,'en','labels','backend.general_settings.api_clients.fields.secret','Secret','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2636,0,'en','labels','backend.general_settings.api_clients.fields.status','Status','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2637,0,'en','labels','backend.general_settings.api_clients.fields.action','Action','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2638,0,'en','labels','backend.general_settings.api_clients.revoked','Revoked','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2639,0,'en','labels','backend.general_settings.api_clients.revoke','Revoke','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2640,0,'en','labels','backend.general_settings.api_clients.live','Live','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2641,0,'en','labels','backend.general_settings.api_clients.enable','Enable','2020-02-27 05:34:10','2020-04-19 12:52:12'),
(2642,0,'en','labels','backend.general_settings.api_clients.api_client_name','API Client Name','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2643,0,'en','labels','backend.general_settings.api_clients.something_went_wrong','Something Went Wrong','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2644,0,'en','labels','backend.general_settings.api_clients.please_input_api_client_name','Please input API client name','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2645,0,'en','labels','backend.general_settings.list_update_note','Once you click on update, you will see list of sections to on/off.','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2646,0,'en','labels','backend.general_settings.wide','Wide','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2647,0,'en','labels','backend.general_settings.box','Box','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2648,0,'en','labels','backend.general_settings.layout_type_note','This will change frontend theme layout type','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2649,0,'en','labels','backend.general_settings.layout_label','Layout','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2650,0,'en','labels','backend.logo.logo_b','Logo 1','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2651,0,'en','labels','backend.logo.logo_b_note','Note : Upload logo with <b>black text and transparent background in .png format</b> and <b>294x50</b>(WxH) pixels.<br> <b>Height</b> should be fixed, <b>width</b> according to your <b>aspect ratio</b>.','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2652,0,'en','labels','backend.logo.logo_w','Logo 2','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2653,0,'en','labels','backend.logo.logo_w_note','Note : Upload logo with <b>white text and transparent background in .png format</b> and <b>294x50</b> (WxH) pixels.<br> <b>Height</b> should be fixed, <b>width</b> according to your <b>aspect ratio</b>.','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2654,0,'en','labels','backend.logo.logo_white','Logo 3','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2655,0,'en','labels','backend.logo.logo_white_note','Note : Upload logo with <b>only in white text and transparent background in .png format</b> and <b>294x50</b>(WxH)  pixels.<br> <b>Height</b> should be fixed, <b>width</b> according to your <b>aspect ratio</b>.','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2656,0,'en','labels','backend.logo.logo_popup','Logo for Popups','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2657,0,'en','labels','backend.logo.logo_popup_note','Note : Add square logo minimum resolution <b>72x72</b> pixels','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2658,0,'en','labels','backend.logo.favicon','Add Favicon','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2659,0,'en','labels','backend.logo.favicon_note','Note : Upload logo with resolution <b>32x32</b> pixels and extension <b>.png</b> or <b>.gif</b> or <b>.ico</b>','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2660,0,'en','labels','backend.logo.title','Change Logo','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2661,0,'en','labels','backend.social_settings.management','Social Settings','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2662,0,'en','labels','backend.social_settings.fb_note','Enable / disable facebook login for website','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2663,0,'en','labels','backend.social_settings.fb_api_note','How to get Facebook API Credentials?','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2664,0,'en','labels','backend.social_settings.google_api_note','How to get Google API Credentials?','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2665,0,'en','labels','backend.social_settings.twitter_api_note','How to get Twitter API Credentials?','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2666,0,'en','labels','backend.social_settings.google_note','Enable / disable Google login for website','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2667,0,'en','labels','backend.social_settings.twitter_note','Enable / disable Twitter login for website','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2668,0,'en','labels','backend.social_settings.linkedin_api_note','How to get LinkedIn API Credentials?','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2669,0,'en','labels','backend.social_settings.linkedin_note','Enable / disable LinkedIn login for website','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2670,0,'en','labels','backend.hero_slider.fields.name','Name','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2671,0,'en','labels','backend.hero_slider.fields.bg_image','BG Image','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2672,0,'en','labels','backend.hero_slider.fields.overlay.title','Overlay','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2673,0,'en','labels','backend.hero_slider.fields.overlay.note','If you turn it on. A black overlay will be displayed on your image. It will be helpful when BG image is not darker or does not have Overlay','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2674,0,'en','labels','backend.hero_slider.fields.hero_text','Hero Text','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2675,0,'en','labels','backend.hero_slider.fields.sub_text','Sub Text','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2676,0,'en','labels','backend.hero_slider.fields.widget.title','Widget','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2677,0,'en','labels','backend.hero_slider.fields.widget.input_date_time','Input date and time','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2678,0,'en','labels','backend.hero_slider.fields.widget.select_widget','Select Widget','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2679,0,'en','labels','backend.hero_slider.fields.widget.search_bar','Search Bar','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2680,0,'en','labels','backend.hero_slider.fields.widget.countdown_timer','Countdown Timer','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2681,0,'en','labels','backend.hero_slider.fields.buttons.title','Buttons','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2682,0,'en','labels','backend.hero_slider.fields.buttons.add','Add','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2683,0,'en','labels','backend.hero_slider.fields.buttons.placeholder','Add number of buttons you want to add','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2684,0,'en','labels','backend.hero_slider.fields.buttons.note','Note: Maximum 4 buttons can be added. Please add label and link for the button for redirecting action when button is clicked.','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2685,0,'en','labels','backend.hero_slider.fields.buttons.name','Button','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2686,0,'en','labels','backend.hero_slider.fields.buttons.label','Label','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2687,0,'en','labels','backend.hero_slider.fields.buttons.link','Link','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2688,0,'en','labels','backend.hero_slider.fields.sequence','Sequence','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2689,0,'en','labels','backend.hero_slider.fields.status','Status','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2690,0,'en','labels','backend.hero_slider.note','Note: Please upload .jpg or .png in <b>1920x900</b> resolution for best result. Use darker or Overlayed images for better result.','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2691,0,'en','labels','backend.hero_slider.on','On','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2692,0,'en','labels','backend.hero_slider.off','Off','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2693,0,'en','labels','backend.hero_slider.title','Hero Slider','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2694,0,'en','labels','backend.hero_slider.create','Create Slide','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2695,0,'en','labels','backend.hero_slider.edit','Edit Slide','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2696,0,'en','labels','backend.hero_slider.view','View Slides','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2697,0,'en','labels','backend.hero_slider.manage_sequence','Manage Sequence of Slides','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2698,0,'en','labels','backend.hero_slider.sequence_note','Drag and change sequence of a Slide','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2699,0,'en','labels','backend.hero_slider.save_sequence','Save Sequence','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2700,0,'en','labels','backend.tax.title','Tax','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2701,0,'en','labels','backend.tax.create','Create Tax','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2702,0,'en','labels','backend.tax.edit','Edit Tax','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2703,0,'en','labels','backend.tax.view','View Tax','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2704,0,'en','labels','backend.tax.on','On','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2705,0,'en','labels','backend.tax.off','Off','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2706,0,'en','labels','backend.tax.fields.name','Name','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2707,0,'en','labels','backend.tax.fields.rate','Rate','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2708,0,'en','labels','backend.tax.fields.status','Status','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2709,0,'en','labels','backend.coupons.title','Coupons','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2710,0,'en','labels','backend.coupons.create','Create Coupon','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2711,0,'en','labels','backend.coupons.edit','Edit Coupon','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2712,0,'en','labels','backend.coupons.view','View Coupons','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2713,0,'en','labels','backend.coupons.courses','Courses','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2714,0,'en','labels','backend.coupons.bundles','Bundles','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2715,0,'en','labels','backend.coupons.on','On','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2716,0,'en','labels','backend.coupons.off','Off','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2717,0,'en','labels','backend.coupons.flat_rate','Flat Rate','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2718,0,'en','labels','backend.coupons.discount_rate','Discount Rate','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2719,0,'en','labels','backend.coupons.type_note','<b>Discount Rate (%) :</b> If you will select this, it will apply rate in % to total purchase. Ex. Price = $100 and Discount rate is 10% then 10% of 100$ will be deducted.<br><b>Flat Rate : </b>If you select this, particular amount will be deducted from total purchase. Ex. Price = 100$ and Flat rate is 25$ then 25$ will be deducted from 100$.','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2720,0,'en','labels','backend.coupons.amount_note','If <b>Discount Rate</b> selected, input rate of percentage. If <b>Flat Rate</b> selected, input particular amount to be deducted.','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2721,0,'en','labels','backend.coupons.per_user_limit_note','Specify how many times a single user can use this coupon. By default one time use.','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2722,0,'en','labels','backend.coupons.total_note','Number of coupons to be issued','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2723,0,'en','labels','backend.coupons.fields.name','Name','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2724,0,'en','labels','backend.coupons.fields.code','Code','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2725,0,'en','labels','backend.coupons.fields.type','Type','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2726,0,'en','labels','backend.coupons.fields.for','For','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2727,0,'en','labels','backend.coupons.fields.amount','Amount','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2728,0,'en','labels','backend.coupons.fields.expires_at','Expires At','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2729,0,'en','labels','backend.coupons.fields.per_user_limit','Per User Limit','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2730,0,'en','labels','backend.coupons.fields.total','Total','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2731,0,'en','labels','backend.coupons.fields.status','Status','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2732,0,'en','labels','backend.coupons.fields.min_price','Minimum Order Price','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2733,0,'en','labels','backend.coupons.fields.description','Description','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2734,0,'en','labels','backend.coupons.description','Description','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2735,0,'en','labels','backend.coupons.unlimited','Unlimited','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2736,0,'en','labels','backend.sponsors.title','Sponsors','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2737,0,'en','labels','backend.sponsors.fields.name','Name','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2738,0,'en','labels','backend.sponsors.fields.link','Link','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2739,0,'en','labels','backend.sponsors.fields.logo','Logo','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2740,0,'en','labels','backend.sponsors.fields.status','Status','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2741,0,'en','labels','backend.sponsors.create','Create Sponsors','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2742,0,'en','labels','backend.sponsors.edit','Edit Sponsors','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2743,0,'en','labels','backend.sponsors.view','View Sponsors','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2744,0,'en','labels','backend.teachers.fields.first_name','First Name','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2745,0,'en','labels','backend.teachers.fields.last_name','Last Name','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2746,0,'en','labels','backend.teachers.fields.email','Email Address','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2747,0,'en','labels','backend.teachers.fields.password','Password','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2748,0,'en','labels','backend.teachers.fields.image','Image','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2749,0,'en','labels','backend.teachers.fields.status','Status','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2750,0,'en','labels','backend.teachers.title','Teachers','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2751,0,'en','labels','backend.teachers.create','Create Teacher','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2752,0,'en','labels','backend.teachers.edit','Edit Teacher','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2753,0,'en','labels','backend.teachers.view','View Teachers','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2754,0,'en','labels','backend.testimonials.fields.name','Name','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2755,0,'en','labels','backend.testimonials.fields.occupation','Occupation','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2756,0,'en','labels','backend.testimonials.fields.content','Content','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2757,0,'en','labels','backend.testimonials.fields.status','Status','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2758,0,'en','labels','backend.testimonials.title','Testimonials','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2759,0,'en','labels','backend.testimonials.create','Create Testimonial','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2760,0,'en','labels','backend.testimonials.edit','Edit Testimonial','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2761,0,'en','labels','backend.testimonials.view','View Testimonials','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2762,0,'en','labels','backend.dashboard.title','Dashboard','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2763,0,'en','labels','backend.dashboard.students','Students','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2764,0,'en','labels','backend.dashboard.trending','Trending','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2765,0,'en','labels','backend.dashboard.teachers','Teachers','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2766,0,'en','labels','backend.dashboard.completed','Completed','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2767,0,'en','labels','backend.dashboard.no_data','No data available','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2768,0,'en','labels','backend.dashboard.buy_course_now','Buy course now','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2769,0,'en','labels','backend.dashboard.your_courses','Your Courses','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2770,0,'en','labels','backend.dashboard.students_enrolled','Students Enrolled To<br> Your Courses','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2771,0,'en','labels','backend.dashboard.recent_reviews','Recent Reviews','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2772,0,'en','labels','backend.dashboard.recent_orders','Recent Orders','2020-02-27 05:34:11','2020-04-19 12:52:12'),
(2773,0,'en','labels','backend.dashboard.recent_contacts','Recent Contacts','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2774,0,'en','labels','backend.dashboard.view_all','View All','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2775,0,'en','labels','backend.dashboard.course','Course','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2776,0,'en','labels','backend.dashboard.review','Review','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2777,0,'en','labels','backend.dashboard.time','Time','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2778,0,'en','labels','backend.dashboard.recent_messages','Recent Messages','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2779,0,'en','labels','backend.dashboard.message','Message','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2780,0,'en','labels','backend.dashboard.message_by','Message By','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2781,0,'en','labels','backend.dashboard.courses','Courses','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2782,0,'en','labels','backend.dashboard.ordered_by','Ordered By','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2783,0,'en','labels','backend.dashboard.view','View','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2784,0,'en','labels','backend.dashboard.amount','Amount','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2785,0,'en','labels','backend.dashboard.recent_contact_requests','Recent Contact Requests','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2786,0,'en','labels','backend.dashboard.name','Name','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2787,0,'en','labels','backend.dashboard.email','Email','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2788,0,'en','labels','backend.dashboard.my_course_bundles','My Course Bundles','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2789,0,'en','labels','backend.dashboard.my_courses','My Courses','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2790,0,'en','labels','backend.dashboard.your_courses_and_bundles','Your Courses and Bundles','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2791,0,'en','labels','backend.dashboard.course_and_bundles','Course and Bundles','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2792,0,'en','labels','backend.dashboard.pending_orders','Pending Orders','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2793,0,'en','labels','backend.dashboard.pending','Pending','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2794,0,'en','labels','backend.dashboard.success','Success','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2795,0,'en','labels','backend.dashboard.failed','Failed','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2796,0,'en','labels','backend.questions_options.title','Questions Option','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2797,0,'en','labels','backend.questions_options.create','Create Option','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2798,0,'en','labels','backend.questions_options.edit','Edit Option','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2799,0,'en','labels','backend.questions_options.view','View Question Options','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2800,0,'en','labels','backend.questions_options.fields.course','Course','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2801,0,'en','labels','backend.questions_options.fields.lesson','Lesson','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2802,0,'en','labels','backend.questions_options.fields.title','Title','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2803,0,'en','labels','backend.questions_options.fields.question','Question','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2804,0,'en','labels','backend.questions_options.fields.question_option','Question Option','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2805,0,'en','labels','backend.questions_options.fields.score','Score','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2806,0,'en','labels','backend.questions_options.fields.tests','Tests','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2807,0,'en','labels','backend.questions_options.fields.option_text','Option Text','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2808,0,'en','labels','backend.questions_options.fields.correct','Correct','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2809,0,'en','labels','backend.reviews.title','Reviews','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2810,0,'en','labels','backend.reviews.fields.course','Course','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2811,0,'en','labels','backend.reviews.fields.user','User','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2812,0,'en','labels','backend.reviews.fields.content','Content','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2813,0,'en','labels','backend.reviews.fields.time','Time','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2814,0,'en','labels','backend.contacts.title','Leads','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2815,0,'en','labels','backend.contacts.fields.name','Name','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2816,0,'en','labels','backend.contacts.fields.email','Email','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2817,0,'en','labels','backend.contacts.fields.phone','Phone','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2818,0,'en','labels','backend.contacts.fields.message','Message','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2819,0,'en','labels','backend.contacts.fields.time','Time','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2820,0,'en','labels','backend.translations.title','Translation Manager','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2821,0,'en','labels','backend.translations.warning','Warning, translations are not visible until they are exported back to the app/lang file, using\n                        <code>php artisan translation:export</code> command or publish button.','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2822,0,'en','labels','backend.translations.done_importing','Done importing, processed <strong class=\"counter\">N</strong> items! Reload this page to\n                            refresh the groups!','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2823,0,'en','labels','backend.translations.done_searching','Done searching for translations, found <strong class=\"counter\">N</strong> items!','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2824,0,'en','labels','backend.translations.done_publishing_for_group','Done publishing the translations for group','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2825,0,'en','labels','backend.translations.done_publishing_for_all_groups','Done publishing the translations for all group!','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2826,0,'en','labels','backend.translations.append_new_translations','Append new translations','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2827,0,'en','labels','backend.translations.replace_existing_translations','Replace existing translations','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2828,0,'en','labels','backend.translations.import_groups','Import Groups','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2829,0,'en','labels','backend.translations.import_groups_note','<p>This will get all locale files from <code>lang</code> folder and insert into database.<br> <b>Append new translations :</b> It will append only new files and data <b>&amp;</b>\n                                            <b>Replace existing translations:</b>It will replace existing records according to files</p>','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2830,0,'en','labels','backend.translations.choose_a_group','Choose a group to display the group translations. If no groups are visible, make sure\n                                you have run the migrations and imported the translations.','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2831,0,'en','labels','backend.translations.translation_warning','Are you sure you want to publish the translations group :group ? This will overwrite existing language files','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2832,0,'en','labels','backend.translations.publishing','Publishing..','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2833,0,'en','labels','backend.translations.publish_translations','Publish Translations','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2834,0,'en','labels','backend.translations.total','Total','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2835,0,'en','labels','backend.translations.changed','Changed','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2836,0,'en','labels','backend.translations.key','Key','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2837,0,'en','labels','backend.translations.supported_locales','Supported Locales','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2838,0,'en','labels','backend.translations.current_supported_locales','Current Supported Locales','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2839,0,'en','labels','backend.translations.enter_new_locale_key','Enter new locale key','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2840,0,'en','labels','backend.translations.add_new_locale','Add new locale','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2841,0,'en','labels','backend.translations.adding','Adding...','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2842,0,'en','labels','backend.translations.export_all_translations','Export all translations','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2843,0,'en','labels','backend.translations.publish_all','Publish all','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2844,0,'en','labels','backend.translations.publish_all_warning','Are you sure you want to publish all translations group? This will overwrite existing language files.','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2845,0,'en','labels','backend.update.title','Update Theme','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2846,0,'en','labels','backend.update.upload','Upload new version  <small>(update.zip)</small>','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2847,0,'en','labels','backend.update.current_version','Current Version','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2848,0,'en','labels','backend.update.note_before_upload_title','Read following notes before updating','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2849,0,'en','labels','backend.update.file_replaced','Following files will be updated / replaced','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2850,0,'en','labels','backend.update.warning','<b>WARNING : We strongly recommend you to update theme by version number</b>.<br> <b>Example :</b> update_v1.zip, update_v2.zip. Please do not jump version number. If your version number is 1 and you want to update it, then update to version 2. Do no directly update to version 3.','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2851,0,'en','labels','backend.update.note_before_upload','<p><b>Please take BACKUP before updating.</b> Updated zip file may come with new folders and file updates. <b>Your current files will be replaced with new one</b>. So, <b>if you have made any changes in current application files it will be LOST</b>.</p>\n                        <p>If you are directly uploading from below file input box, your files will be replaced. We strongly recommend you to do it manual replacement of files one by one or edit the changes by comparing your current edited file and new updated files.</p>\n                        <p>If you still have confusion. Please contact us, we will guide you to update your application</p>','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2852,0,'en','labels','backend.backup.title','Backup','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2853,0,'en','labels','backend.backup.email','Email Notification','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2854,0,'en','labels','backend.backup.app_token','App Token','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2855,0,'en','labels','backend.backup.app_secret','App Secret','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2856,0,'en','labels','backend.backup.api_key','API Key','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2857,0,'en','labels','backend.backup.app_key','App Key','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2858,0,'en','labels','backend.backup.api_secret','API Secret','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2859,0,'en','labels','backend.backup.enable_disable','Enable / Disable','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2860,0,'en','labels','backend.backup.backup_type','Backup Type','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2861,0,'en','labels','backend.backup.dropbox','Dropbox','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2862,0,'en','labels','backend.backup.backup_files','Backup Files','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2863,0,'en','labels','backend.backup.aws','AWS S3','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2864,0,'en','labels','backend.backup.db','Database','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2865,0,'en','labels','backend.backup.configuration','Configuration','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2866,0,'en','labels','backend.backup.generate_backup','Generate Backup','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2867,0,'en','labels','backend.backup.db_storage','Database and Storage files','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2868,0,'en','labels','backend.backup.db_app','Database and Application files','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2869,0,'en','labels','backend.backup.backup_schedule','Backup Schedule','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2870,0,'en','labels','backend.backup.daily','Daily','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2871,0,'en','labels','backend.backup.weekly','Weekly','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2872,0,'en','labels','backend.backup.monthly','Monthly','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2873,0,'en','labels','backend.backup.dropbox_note','Please checkout documentation for <b>How to obtain DropBox App Keys?</b>','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2874,0,'en','labels','backend.backup.region','Region','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2875,0,'en','labels','backend.backup.bucket_name','Bucket Name','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2876,0,'en','labels','backend.backup.backup_notice','Please refer documentation before beginning backup. It has every details step by step for creating backup with Dropbox.','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2877,0,'en','labels','backend.backup.backup_note','<b>Note </b>: To run this backup properly you need to add following code to your <b>CRON TAB:</b><br><code>* * * * * cd /path-to-your-project && php artisan schedule:run >> /dev/null 2>&1</code>','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2878,0,'en','labels','backend.certificates.title','Certificates','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2879,0,'en','labels','backend.certificates.fields.course_name','Course Name','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2880,0,'en','labels','backend.certificates.fields.progress','Progress','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2881,0,'en','labels','backend.certificates.fields.action','Action','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2882,0,'en','labels','backend.certificates.view','View','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2883,0,'en','labels','backend.certificates.download','Download','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2884,0,'en','labels','backend.bundles.title','Bundles','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2885,0,'en','labels','backend.bundles.fields.published','Published','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2886,0,'en','labels','backend.bundles.fields.featured','Featured','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2887,0,'en','labels','backend.bundles.fields.trending','Trending','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2888,0,'en','labels','backend.bundles.fields.free','Free','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2889,0,'en','labels','backend.bundles.fields.popular','Popular','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2890,0,'en','labels','backend.bundles.fields.teachers','Teachers','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2891,0,'en','labels','backend.bundles.fields.category','Category','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2892,0,'en','labels','backend.bundles.fields.title','Title','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2893,0,'en','labels','backend.bundles.fields.slug','Slug','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2894,0,'en','labels','backend.bundles.fields.description','Description','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2895,0,'en','labels','backend.bundles.fields.price','Price','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2896,0,'en','labels','backend.bundles.fields.course_image','Course Image','2020-02-27 05:34:12','2020-04-19 12:52:12'),
(2897,0,'en','labels','backend.bundles.fields.start_date','Start Date','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2898,0,'en','labels','backend.bundles.fields.meta_title','Meta Title','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2899,0,'en','labels','backend.bundles.fields.meta_description','Meta Description','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2900,0,'en','labels','backend.bundles.fields.meta_keywords','Meta Keywords','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2901,0,'en','labels','backend.bundles.fields.sidebar','Add Sidebar','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2902,0,'en','labels','backend.bundles.fields.lessons.add','Add Lessons','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2903,0,'en','labels','backend.bundles.fields.lessons.view','View Lessons','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2904,0,'en','labels','backend.bundles.fields.course','Course','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2905,0,'en','labels','backend.bundles.fields.courses','Courses','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2906,0,'en','labels','backend.bundles.fields.status','Status','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2907,0,'en','labels','backend.bundles.add_courses','Add Courses','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2908,0,'en','labels','backend.bundles.add_teachers','Add Teachers','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2909,0,'en','labels','backend.bundles.add_categories','Add Categories','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2910,0,'en','labels','backend.bundles.slug_placeholder','Input slug or it will be generated automatically','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2911,0,'en','labels','backend.bundles.select_category','Select Category','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2912,0,'en','labels','backend.bundles.select_courses','Select Courses','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2913,0,'en','labels','backend.bundles.select_teachers','Select Teachers','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2914,0,'en','labels','backend.bundles.test','Test','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2915,0,'en','labels','backend.bundles.lesson','Lesson','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2916,0,'en','labels','backend.bundles.create','Create Bundle','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2917,0,'en','labels','backend.bundles.edit','Edit Bundle','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2918,0,'en','labels','backend.bundles.view','View Bundles','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2919,0,'en','labels','backend.bundles.category','Category','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2920,0,'en','labels','backend.bundles.save_timeline','Save timeline','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2921,0,'en','labels','backend.bundles.course_timeline','Course timeline','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2922,0,'en','labels','backend.bundles.timeline_description','Drag and change sequence of Lessons/Tests for course','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2923,0,'en','labels','backend.bundles.listing_note','Only Published Lessons and Tests will be Displayed and Sorted.','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2924,0,'en','labels','backend.reports.title','Reports','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2925,0,'en','labels','backend.reports.sales_report','Sales Report','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2926,0,'en','labels','backend.reports.students_report','Students Report','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2927,0,'en','labels','backend.reports.bundles','Bundles','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2928,0,'en','labels','backend.reports.courses','Courses','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2929,0,'en','labels','backend.reports.total_earnings','Total Earnings','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2930,0,'en','labels','backend.reports.total_sales','Total Sales','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2931,0,'en','labels','backend.reports.fields.name','Name','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2932,0,'en','labels','backend.reports.fields.orders','Orders','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2933,0,'en','labels','backend.reports.fields.earnings','Earnings','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2934,0,'en','labels','backend.reports.fields.course','Course','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2935,0,'en','labels','backend.reports.fields.user','User','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2936,0,'en','labels','backend.reports.fields.content','Content','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2937,0,'en','labels','backend.reports.fields.time','Time','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2938,0,'en','labels','backend.reports.fields.students','Students','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2939,0,'en','labels','backend.reports.fields.bundle','Bundle','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2940,0,'en','labels','backend.reports.fields.completed','Completed Course','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2941,0,'en','labels','backend.sitemap.title','Sitemap','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2942,0,'en','labels','backend.sitemap.records_per_file','Records Per File','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2943,0,'en','labels','backend.sitemap.records_note','Number of records per file.','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2944,0,'en','labels','backend.sitemap.generated','Sitemap generated successfully.','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2945,0,'en','labels','backend.sitemap.generate','Generate','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2946,0,'en','labels','backend.sitemap.daily','Daily','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2947,0,'en','labels','backend.sitemap.weekly','Weekly','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2948,0,'en','labels','backend.sitemap.monthly','Monthly','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2949,0,'en','labels','backend.sitemap.sitemap_note','This sitemap tool will generate sitemap for published Course, Bundles and Blog.','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2950,0,'en','labels','backend.forum_category.title','Forum Categories','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2951,0,'en','labels','backend.forum_category.create','Create Forum Category','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2952,0,'en','labels','backend.forum_category.edit','Edit Forum Category','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2953,0,'en','labels','backend.forum_category.view','View Forum Category','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2954,0,'en','labels','backend.forum_category.on','On','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2955,0,'en','labels','backend.forum_category.off','Off','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2956,0,'en','labels','backend.forum_category.fields.parent_category','Parent Category','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2957,0,'en','labels','backend.forum_category.fields.category','Category','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2958,0,'en','labels','backend.forum_category.fields.order','Order','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2959,0,'en','labels','backend.forum_category.fields.color','Color','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2960,0,'en','labels','backend.forum_category.fields.status','Status','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2961,0,'en','labels','backend.payments.title','Payments','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2962,0,'en','labels','backend.payments.total_earnings','Total Earnings','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2963,0,'en','labels','backend.payments.total_withdrawals','Total Withdrawals','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2964,0,'en','labels','backend.payments.total_withdrawal_pending','Total Withdrawal Pending','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2965,0,'en','labels','backend.payments.total_balance','Total Balance','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2966,0,'en','labels','backend.payments.earnings','Earnings','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2967,0,'en','labels','backend.payments.withdrawals','Withdrawals','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2968,0,'en','labels','backend.payments.add_withdrawal_request','Add Withdrawal Request','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2969,0,'en','labels','backend.payments.approve','Approve','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2970,0,'en','labels','backend.payments.reject','Reject','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2971,0,'en','labels','backend.payments.payment_type.bank','Bank','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2972,0,'en','labels','backend.payments.payment_type.paypal','Paypal','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2973,0,'en','labels','backend.payments.payment_type.offline','Offline','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2974,0,'en','labels','backend.payments.status.pending','Pending','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2975,0,'en','labels','backend.payments.status.approved','Approved','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2976,0,'en','labels','backend.payments.status.rejected','Rejected','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2977,0,'en','labels','backend.payments.fields.amount','Amount','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2978,0,'en','labels','backend.payments.fields.payment_type','Payment Type','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2979,0,'en','labels','backend.payments.fields.status','Status','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2980,0,'en','labels','backend.payments.fields.remarks','Remarks','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2981,0,'en','labels','backend.payments.fields.date','Date','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2982,0,'en','labels','backend.payments.fields.teacher_name','Teacher Name','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2983,0,'en','labels','general.active','Active','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2984,0,'en','labels','general.inactive','Inactive','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2985,0,'en','labels','general.yes','Yes','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2986,0,'en','labels','general.no','No','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2987,0,'en','labels','general.none','None','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2988,0,'en','labels','general.back','Back','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2989,0,'en','labels','general.more','More','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2990,0,'en','labels','general.buttons.update','Update','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2991,0,'en','labels','general.buttons.cancel','Cancel','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2992,0,'en','labels','general.buttons.save','Save','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2993,0,'en','labels','general.toolbar_btn_groups','Toolbar with button groups','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2994,0,'en','labels','general.create_new','Create New','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2995,0,'en','labels','general.all','All','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2996,0,'en','labels','general.trash','Trash','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2997,0,'en','labels','general.delete','Delete','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2998,0,'en','labels','general.no_data_available','No data available','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(2999,0,'en','labels','general.edit','Edit','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(3000,0,'en','labels','general.copyright','Copyright','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(3001,0,'en','labels','general.delete_selected','Delete Selected','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(3002,0,'en','labels','general.custom','Custom','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(3003,0,'en','labels','general.actions','Actions','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(3004,0,'en','labels','general.hide','Hide','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(3005,0,'en','labels','general.show','Show','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(3006,0,'en','labels','general.toggle_navigation','Toggle Navigation','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(3007,0,'en','labels','general.sr_no','Sr No.','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(3008,0,'en','labels','general.read_more','Read More','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(3009,0,'en','labels','frontend.auth.login_button','Login','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(3010,0,'en','labels','frontend.auth.login_box_title','Login','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(3011,0,'en','labels','frontend.auth.remember_me','Remember Me','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(3012,0,'en','labels','frontend.auth.register_box_title','Register','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(3013,0,'en','labels','frontend.auth.register_button','Register','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(3014,0,'en','labels','frontend.auth.login_with','Login with :social_media','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(3015,0,'en','labels','frontend.passwords.reset_password_box_title','Reset Password','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(3016,0,'en','labels','frontend.passwords.send_password_reset_link_button','Send Password Reset Link','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(3017,0,'en','labels','frontend.passwords.expired_password_box_title','Your password has expired.','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(3018,0,'en','labels','frontend.passwords.update_password_button','Update Password','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(3019,0,'en','labels','frontend.passwords.reset_password_button','Reset Password','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(3020,0,'en','labels','frontend.passwords.forgot_password','Forgot Your Password?','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(3021,0,'en','labels','frontend.blog.share_this_news','Share this news','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(3022,0,'en','labels','frontend.blog.related_news','<span>Related</span> News','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(3023,0,'en','labels','frontend.blog.post_comments','Post <span>Comments.</span>','2020-02-27 05:34:13','2020-04-19 12:52:12'),
(3024,0,'en','labels','frontend.blog.write_a_comment','Write a Comment','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3025,0,'en','labels','frontend.blog.add_comment','Add Comment','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3026,0,'en','labels','frontend.blog.by','By','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3027,0,'en','labels','frontend.blog.title','Blog','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3028,0,'en','labels','frontend.blog.search_blog','Search Blog','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3029,0,'en','labels','frontend.blog.blog_categories','Blog <span>Categories.</span>','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3030,0,'en','labels','frontend.blog.popular_tags','Popular <span>Tags.</span>','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3031,0,'en','labels','frontend.blog.featured_course','Featured <span>Course.</span>','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3032,0,'en','labels','frontend.blog.login_to_post_comment','Login to Post a Comment','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3033,0,'en','labels','frontend.blog.no_comments_yet','No comments yet, Be the first to comment.','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3034,0,'en','labels','frontend.cart.payment_status','Payment Status','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3035,0,'en','labels','frontend.cart.payment_cards','Credit or Debit Card','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3036,0,'en','labels','frontend.cart.name_on_card_placeholder','Enter the name written on your card','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3037,0,'en','labels','frontend.cart.no_payment_method','No payment method available at this moment','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3038,0,'en','labels','frontend.cart.card_number_placeholder','Enter your card number','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3039,0,'en','labels','frontend.cart.cvv','CVV','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3040,0,'en','labels','frontend.cart.mm','MM','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3041,0,'en','labels','frontend.cart.yy','YY','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3042,0,'en','labels','frontend.cart.pay_now','Pay Now','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3043,0,'en','labels','frontend.cart.stripe_error_message','Please correct the errors and try again.','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3044,0,'en','labels','frontend.cart.paypal','PayPal','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3045,0,'en','labels','frontend.cart.pay_securely_paypal','Pay securely with PayPal','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3046,0,'en','labels','frontend.cart.offline_payment','Offline Payment','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3047,0,'en','labels','frontend.cart.offline_payment_note','In this payment method our executives will contact you and give you instructions regarding payment and course purchase.','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3048,0,'en','labels','frontend.cart.request_assistance','Request Assistance','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3049,0,'en','labels','frontend.cart.cart','Cart','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3050,0,'en','labels','frontend.cart.checkout','Checkout','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3051,0,'en','labels','frontend.cart.your_shopping_cart','Your Shopping Cart','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3052,0,'en','labels','frontend.cart.complete_your_purchases','Complete<span> Your Purchases.</span>','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3053,0,'en','labels','frontend.cart.order_item','Order <span>Item.</span>','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3054,0,'en','labels','frontend.cart.course_name','Course Name','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3055,0,'en','labels','frontend.cart.course_type','Course Type','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3056,0,'en','labels','frontend.cart.starts','Starts','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3057,0,'en','labels','frontend.cart.empty_cart','Your cart is empty','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3058,0,'en','labels','frontend.cart.order_payment','Order <span>Payment.</span>','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3059,0,'en','labels','frontend.cart.name_on_card','Name on Card','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3060,0,'en','labels','frontend.cart.card_number','Card Number','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3061,0,'en','labels','frontend.cart.expiration_date','Expiration Date','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3062,0,'en','labels','frontend.cart.confirmation_note','By confirming this purchase, I agree to the <b>Term of Use, Refund Policy</b> and <b>Privacy Policy</b>','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3063,0,'en','labels','frontend.cart.order_detail','Order <span>Detail.</span>','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3064,0,'en','labels','frontend.cart.total','Total','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3065,0,'en','labels','frontend.cart.your_payment_status','Your <span>Payment Status.</span>','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3066,0,'en','labels','frontend.cart.success_message','Congratulations. Enjoy your course','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3067,0,'en','labels','frontend.cart.see_more_courses','See More Courses','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3068,0,'en','labels','frontend.cart.go_back_to_cart','Go back to Cart','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3069,0,'en','labels','frontend.cart.product_name','Product Name','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3070,0,'en','labels','frontend.cart.product_type','Product Type','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3071,0,'en','labels','frontend.cart.product_added','Product added to cart successfully','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3072,0,'en','labels','frontend.cart.try_again','Error! Please Try again.','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3073,0,'en','labels','frontend.cart.payment_done','Payment done successfully !','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3074,0,'en','labels','frontend.cart.payment_failed','Error! Payment Failed!','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3075,0,'en','labels','frontend.cart.offline_request','Request received successfully! check your registered email for further details.','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3076,0,'en','labels','frontend.cart.purchase_successful','Congratulations! You\'ve purchased this course.','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3077,0,'en','labels','frontend.cart.unknown_error','Unknown error occurred','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3078,0,'en','labels','frontend.cart.connection_timeout','Connection Timeout','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3079,0,'en','labels','frontend.cart.sub_total','Sub Total','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3080,0,'en','labels','frontend.cart.apply','Apply','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3081,0,'en','labels','frontend.cart.items','items','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3082,0,'en','labels','frontend.cart.item','item','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3083,0,'en','labels','frontend.cart.offers','Offers','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3084,0,'en','labels','frontend.cart.empty_input','Write coupon code before applying','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3085,0,'en','labels','frontend.cart.invalid_coupon','Invalid Coupon!','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3086,0,'en','labels','frontend.cart.amount','Amount','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3087,0,'en','labels','frontend.cart.total_payable','Total Payable','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3088,0,'en','labels','frontend.cart.price','Price','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3089,0,'en','labels','frontend.contact.title','Contact','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3090,0,'en','labels','frontend.contact.your_name','Your Name','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3091,0,'en','labels','frontend.contact.your_email','Your Email','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3092,0,'en','labels','frontend.contact.phone_number','Phone Number','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3093,0,'en','labels','frontend.contact.message','Message','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3094,0,'en','labels','frontend.contact.box_title','Contact Us','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3095,0,'en','labels','frontend.contact.button','Send Information','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3096,0,'en','labels','frontend.contact.send_us_a_message','Send Us A<span> Message.</span>','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3097,0,'en','labels','frontend.contact.keep_in_touch','Keep<span> In Touch.</span>','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3098,0,'en','labels','frontend.contact.send_email','Send Email','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3099,0,'en','labels','frontend.contact.send_message_now','Send Message Now','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3100,0,'en','labels','frontend.badges.trending','Trending','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3101,0,'en','labels','frontend.course.ratings','Ratings','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3102,0,'en','labels','frontend.course.stars','Stars','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3103,0,'en','labels','frontend.course.by','By','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3104,0,'en','labels','frontend.course.no_reviews_yet','No reviews yet.','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3105,0,'en','labels','frontend.course.add_to_cart','Add To Cart','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3106,0,'en','labels','frontend.course.buy_note','Only Students Can Buy Course','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3107,0,'en','labels','frontend.course.continue_course','Continue Course','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3108,0,'en','labels','frontend.course.enrolled','Enrolled','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3109,0,'en','labels','frontend.course.chapters','Chapters','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3110,0,'en','labels','frontend.course.category','Category','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3111,0,'en','labels','frontend.course.author','Author','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3112,0,'en','labels','frontend.course.courses','Courses','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3113,0,'en','labels','frontend.course.students','Students','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3114,0,'en','labels','frontend.course.give_test_again','Give Test Again','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3115,0,'en','labels','frontend.course.submit_results','Submit Results','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3116,0,'en','labels','frontend.course.chapter_videos','Chapter Videos','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3117,0,'en','labels','frontend.course.download_files','Download Files','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3118,0,'en','labels','frontend.course.mb','MB','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3119,0,'en','labels','frontend.course.prev','PREV','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3120,0,'en','labels','frontend.course.test','Test','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3121,0,'en','labels','frontend.course.completed','Completed','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3122,0,'en','labels','frontend.course.title','Course','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3123,0,'en','labels','frontend.course.course_details','<span>Course Details.</span>','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3124,0,'en','labels','frontend.course.course_detail','Course Details','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3125,0,'en','labels','frontend.course.course_timeline','Course <b>Timeline:</b>','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3126,0,'en','labels','frontend.course.go','Go','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3127,0,'en','labels','frontend.course.course_reviews','Course <span>Reviews:</span>','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3128,0,'en','labels','frontend.course.average_rating','Average Rating','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3129,0,'en','labels','frontend.course.details','Details','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3130,0,'en','labels','frontend.course.add_reviews','Add <span>Reviews.</span>','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3131,0,'en','labels','frontend.course.your_rating','Your Rating','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3132,0,'en','labels','frontend.course.message','Message','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3133,0,'en','labels','frontend.course.add_review_now','Add Review Now','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3134,0,'en','labels','frontend.course.price','Price','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3135,0,'en','labels','frontend.course.added_to_cart','Added To Cart','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3136,0,'en','labels','frontend.course.buy_now','Buy Now','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3137,0,'en','labels','frontend.course.get_now','Get Now','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3138,0,'en','labels','frontend.course.recent_news','<span>Recent  </span>News.','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3139,0,'en','labels','frontend.course.view_all_news','View All News','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3140,0,'en','labels','frontend.course.featured_course','<span>Featured</span> Course.','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3141,0,'en','labels','frontend.course.sort_by','<b>Sort</b> By','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3142,0,'en','labels','frontend.course.popular','Popular','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3143,0,'en','labels','frontend.course.none','None','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3144,0,'en','labels','frontend.course.trending','Trending','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3145,0,'en','labels','frontend.course.featured','Featured','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3146,0,'en','labels','frontend.course.course_name','Course Name','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3147,0,'en','labels','frontend.course.course_type','Course Type','2020-02-27 05:34:14','2020-04-19 12:52:12'),
(3148,0,'en','labels','frontend.course.starts','Starts','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3149,0,'en','labels','frontend.course.full_text','FULL TEXT','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3150,0,'en','labels','frontend.course.find_courses','FIND COURSES','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3151,0,'en','labels','frontend.course.your_test_score','Your Test Score','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3152,0,'en','labels','frontend.course.find_your_course','<span>Find </span>Your Course.','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3153,0,'en','labels','frontend.course.next','NEXT','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3154,0,'en','labels','frontend.course.progress','Progress','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3155,0,'en','labels','frontend.course.finish_course','Finish Course','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3156,0,'en','labels','frontend.course.certified','You\'re Certified for this course','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3157,0,'en','labels','frontend.course.course','Course','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3158,0,'en','labels','frontend.course.bundles','Bundles','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3159,0,'en','labels','frontend.course.bundle_detail','Bundle Details','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3160,0,'en','labels','frontend.course.bundle_reviews','Bundle <span>Reviews:</span>','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3161,0,'en','labels','frontend.course.available_in_bundles','Also available in Bundles','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3162,0,'en','labels','frontend.course.complete_test','Please Complete Test','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3163,0,'en','labels','frontend.course.looking_for','Looking For?','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3164,0,'en','labels','frontend.course.not_attempted','Not Attempted','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3165,0,'en','labels','frontend.course.explanation','Explanation','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3166,0,'en','labels','frontend.course.find_your_bundle','<span>Find</span> your Bundle','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3167,0,'en','labels','frontend.course.select_category','Select Category','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3168,0,'en','labels','frontend.home.title','Home','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3169,0,'en','labels','frontend.home.search_course_placeholder','Type what do you want to learn today?','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3170,0,'en','labels','frontend.home.popular_teachers','<span>Popular</span> Teachers','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3171,0,'en','labels','frontend.home.learn_new_skills','Learn new skills','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3172,0,'en','labels','frontend.home.search_course','Search Course','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3173,0,'en','labels','frontend.home.search_courses','<span>Search</span> Courses.','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3174,0,'en','labels','frontend.home.students_enrolled','Students Enrolled','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3175,0,'en','labels','frontend.home.online_available_courses','Online Available Courses','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3176,0,'en','labels','frontend.home.teachers','Teachers','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3177,0,'en','labels','frontend.home.our_professionals','Our Professionals','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3178,0,'en','labels','frontend.home.all_teachers','All Teachers','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3179,0,'en','labels','frontend.home.what_they_say_about_us','What they say about us','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3180,0,'en','labels','frontend.home.no_data_available','No data available','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3181,0,'en','labels','frontend.layouts.partials.advantages','Advantages','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3182,0,'en','labels','frontend.layouts.partials.email_address','Email Address','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3183,0,'en','labels','frontend.layouts.partials.email_registration','Email Us For Free Registration','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3184,0,'en','labels','frontend.layouts.partials.call_us_registration','Call Us For Free Registration','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3185,0,'en','labels','frontend.layouts.partials.students','Students','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3186,0,'en','labels','frontend.layouts.partials.faq','FAQ','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3187,0,'en','labels','frontend.layouts.partials.more_faqs','More Faqs','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3188,0,'en','labels','frontend.layouts.partials.search_placeholder','Type what do you want to learn today?','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3189,0,'en','labels','frontend.layouts.partials.search_our_courses','SEARCH OUR COURSES','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3190,0,'en','labels','frontend.layouts.partials.browse_featured_course','Browse Our<span> Featured Course.</span>','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3191,0,'en','labels','frontend.layouts.partials.course_detail','Course detail','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3192,0,'en','labels','frontend.layouts.partials.contact_us','Contact Us','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3193,0,'en','labels','frontend.layouts.partials.get_in_touch','Get In Touch','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3194,0,'en','labels','frontend.layouts.partials.primary','Primary','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3195,0,'en','labels','frontend.layouts.partials.second','Second','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3196,0,'en','labels','frontend.layouts.partials.courses_categories','Courses Categories','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3197,0,'en','labels','frontend.layouts.partials.browse_course_by_category','Browse Courses<span> By Category.</span>','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3198,0,'en','labels','frontend.layouts.partials.faq_full','Frequently<span> Asked Questions</span>','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3199,0,'en','labels','frontend.layouts.partials.social_network','Social Network','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3200,0,'en','labels','frontend.layouts.partials.subscribe_newsletter','Subscribe Newsletter','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3201,0,'en','labels','frontend.layouts.partials.subscribe_now','Subscribe Now','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3202,0,'en','labels','frontend.layouts.partials.latest_news_blog','Latest <span>News Blog.</span>','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3203,0,'en','labels','frontend.layouts.partials.trending_courses','Trending <span>Courses.</span>','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3204,0,'en','labels','frontend.layouts.partials.popular_courses','Popular <span>Courses.</span>','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3205,0,'en','labels','frontend.layouts.partials.view_all_news','View All News','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3206,0,'en','labels','frontend.layouts.partials.view_all_trending_courses','View All Trending Courses','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3207,0,'en','labels','frontend.layouts.partials.view_all_popular_courses','View All Popular Courses','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3208,0,'en','labels','frontend.layouts.partials.learn_new_skills','Learn new skills','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3209,0,'en','labels','frontend.layouts.partials.recent_news','<span>Recent  </span>News.','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3210,0,'en','labels','frontend.layouts.partials.featured_course','<span>Featured  </span>Course.','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3211,0,'en','labels','frontend.layouts.partials.days','Days','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3212,0,'en','labels','frontend.layouts.partials.hours','Hours','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3213,0,'en','labels','frontend.layouts.partials.minutes','Minutes','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3214,0,'en','labels','frontend.layouts.partials.seconds','Seconds','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3215,0,'en','labels','frontend.layouts.partials.search_courses','Search Courses','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3216,0,'en','labels','frontend.layouts.partials.sponsors','Sponsors.','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3217,0,'en','labels','frontend.layouts.partials.students_testimonial','Students <span>Testimonial.</span>','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3218,0,'en','labels','frontend.layouts.partials.why_choose','Reason Why Choose','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3219,0,'en','labels','frontend.layouts.partials.certificate_verification','Certificate Verification','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3220,0,'en','labels','frontend.layouts.partials.offers','Offers','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3221,0,'en','labels','frontend.modal.new_user_note','New User? Register Here','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3222,0,'en','labels','frontend.modal.registration_message','Registration Successful. Please LogIn','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3223,0,'en','labels','frontend.modal.my_account','My Account','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3224,0,'en','labels','frontend.modal.login_register','<a href=\"#\" class=\"font-weight-bold go-login px-0\">LOGIN</a> to our website, or <a href=\"#\" class=\"font-weight-bold go-register px-0\" id=\"\">REGISTER</a>','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3225,0,'en','labels','frontend.modal.already_user_note','Already a user? Login Here','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3226,0,'en','labels','frontend.modal.login_now','LogIn Now','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3227,0,'en','labels','frontend.modal.register_now','Register Now','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3228,0,'en','labels','frontend.search_result.students','Students','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3229,0,'en','labels','frontend.search_result.blog','Blog','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3230,0,'en','labels','frontend.search_result.search_blog','Search Blog','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3231,0,'en','labels','frontend.search_result.sort_by','<b>Sort</b> By','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3232,0,'en','labels','frontend.search_result.popular','Popular','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3233,0,'en','labels','frontend.search_result.none','None','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3234,0,'en','labels','frontend.search_result.trending','Trending','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3235,0,'en','labels','frontend.search_result.featured','Featured','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3236,0,'en','labels','frontend.search_result.course_name','Course Name','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3237,0,'en','labels','frontend.search_result.course_type','Course Type','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3238,0,'en','labels','frontend.search_result.starts','Starts','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3239,0,'en','labels','frontend.search_result.course_detail','Course Detail','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3240,0,'en','labels','frontend.teacher.send_now','Send Now','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3241,0,'en','labels','frontend.teacher.students','Students','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3242,0,'en','labels','frontend.teacher.title','Teachers','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3243,0,'en','labels','frontend.teacher.courses_by_teacher','Courses <span>By Teacher.</span>','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3244,0,'en','labels','frontend.teacher.course_detail','Course Detail','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3245,0,'en','labels','frontend.user.passwords.change','Change Password','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3246,0,'en','labels','frontend.user.profile.avatar','Avatar','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3247,0,'en','labels','frontend.user.profile.created_at','Created At','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3248,0,'en','labels','frontend.user.profile.edit_information','Edit Information','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3249,0,'en','labels','frontend.user.profile.email','E-mail','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3250,0,'en','labels','frontend.user.profile.last_updated','Last Updated','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3251,0,'en','labels','frontend.user.profile.name','Name','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3252,0,'en','labels','frontend.user.profile.first_name','First Name','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3253,0,'en','labels','frontend.user.profile.last_name','Last Name','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3254,0,'en','labels','frontend.user.profile.update_information','Update Information','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3255,0,'en','labels','frontend.faq.title','Frequently <span>Asked Questions</span>','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3256,0,'en','labels','frontend.faq.find','Find <span>Your Questions & Answers.</span>','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3257,0,'en','labels','frontend.faq.make_question','Make Question','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3258,0,'en','labels','frontend.faq.contact_us','Contact Us','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3259,0,'en','labels','frontend.certificate_verification.title','Certificate Verification','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3260,0,'en','labels','frontend.certificate_verification.name_on_certificate','Name on Certificate. Ex. John','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3261,0,'en','labels','frontend.certificate_verification.date_on_certificate','Date on Certificate. Ex. 2018-11-25','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3262,0,'en','labels','frontend.certificate_verification.verify_now','Verify Now','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3263,0,'en','labels','frontend.certificate_verification.not_found','No certificate found for given information.','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3264,0,'en','labels','frontend.footer.popular_courses','Popular courses','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3265,0,'en','labels','frontend.footer.popular_categories','Popular Categories','2020-02-27 05:34:15','2020-04-19 12:52:12'),
(3266,0,'en','labels','frontend.footer.featured_courses','Featured Courses','2020-02-27 05:34:16','2020-04-19 12:52:12'),
(3267,0,'en','labels','frontend.footer.trending_courses','Trending Courses','2020-02-27 05:34:16','2020-04-19 12:52:12'),
(3268,0,'en','labels','frontend.footer.useful_links','Useful Links','2020-02-27 05:34:16','2020-04-19 12:52:12'),
(3269,0,'en','labels','frontend.offers.title','Offers','2020-02-27 05:34:16','2020-04-19 12:52:12'),
(3270,0,'en','labels','frontend.offers.no_offers','No Offers','2020-02-27 05:34:16','2020-04-19 12:52:12'),
(3271,0,'en','labels','frontend.offers.unlimited','Unlimited','2020-02-27 05:34:16','2020-04-19 12:52:12'),
(3272,0,'en','labels','frontend.offers.validity','Validity','2020-02-27 05:34:16','2020-04-19 12:52:12'),
(3273,0,'en','labels','frontend.offers.minimum_order_amount','Minimum Order Amount','2020-02-27 05:34:16','2020-04-19 12:52:12'),
(3274,0,'en','labels','frontend.offers.usage','Usage','2020-02-27 05:34:16','2020-04-19 12:52:12'),
(3275,0,'en','labels','frontend.offers.per_user','Per User','2020-02-27 05:34:16','2020-04-19 12:52:12'),
(3276,0,'en','labels','lang.en','English','2020-02-27 05:34:16','2020-04-19 12:52:12'),
(3277,0,'en','labels','lang.sp','Spanish','2020-02-27 05:34:16','2020-04-19 12:52:12'),
(3278,0,'en','labels','lang.fr','French','2020-02-27 05:34:16','2020-04-19 12:52:12'),
(3279,0,'en','labels','lang.ar','Arabic','2020-02-27 05:34:16','2020-04-19 12:52:12'),
(3280,0,'en','labels','teacher.teacher_register','Teacher Register? New Here','2020-02-27 05:34:16','2020-04-19 12:52:12'),
(3281,0,'en','labels','teacher.teacher_register_box_title','Teacher Register','2020-02-27 05:34:16','2020-04-19 12:52:12'),
(3282,0,'en','labels','teacher.facebook_link','Facebook Link','2020-02-27 05:34:16','2020-04-19 12:52:12'),
(3283,0,'en','labels','teacher.twitter_link','Twitter Link','2020-02-27 05:34:16','2020-04-19 12:52:12'),
(3284,0,'en','labels','teacher.linkedin_link','Linkedin Link','2020-02-27 05:34:16','2020-04-19 12:52:12'),
(3285,0,'en','labels','teacher.payment_details','Payment Details','2020-02-27 05:34:16','2020-04-19 12:52:12'),
(3286,0,'en','labels','teacher.bank','Bank','2020-02-27 05:34:16','2020-04-19 12:52:12'),
(3287,0,'en','labels','teacher.paypal','Paypal','2020-02-27 05:34:16','2020-04-19 12:52:12'),
(3288,0,'en','labels','teacher.paypal_email','Paypal Email','2020-02-27 05:34:16','2020-04-19 12:52:12'),
(3289,0,'en','labels','teacher.bank_details.name','Bank Name','2020-02-27 05:34:16','2020-04-19 12:52:12'),
(3290,0,'en','labels','teacher.bank_details.ifsc_code','IFSC Code','2020-02-27 05:34:16','2020-04-19 12:52:12'),
(3291,0,'en','labels','teacher.bank_details.account','Account Number','2020-02-27 05:34:16','2020-04-19 12:52:12'),
(3292,0,'en','labels','teacher.bank_details.holder_name','Account Name','2020-02-27 05:34:16','2020-04-19 12:52:12'),
(3293,0,'en','labels','teacher.bank_details.account_number','Account Number','2020-02-27 05:34:16','2020-04-19 12:52:12'),
(3294,0,'en','menus','backend.sidebar.general','General','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3295,0,'en','menus','backend.sidebar.dashboard','Dashboard','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3296,0,'en','menus','backend.sidebar.courses.management','Courses Management','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3297,0,'en','menus','backend.sidebar.courses.title','Courses','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3298,0,'en','menus','backend.sidebar.courses.manage','Manage Courses','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3299,0,'en','menus','backend.sidebar.site-management.title','Site Management','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3300,0,'en','menus','backend.sidebar.menu-manager.title','Menu Manager','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3301,0,'en','menus','backend.sidebar.system','System','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3302,0,'en','menus','backend.sidebar.settings.title','Settings','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3303,0,'en','menus','backend.sidebar.settings.general','General','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3304,0,'en','menus','backend.sidebar.settings.social-login','Social Login','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3305,0,'en','menus','backend.sidebar.debug-site.title','Debug Site','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3306,0,'en','menus','backend.sidebar.history','History','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3307,0,'en','menus','backend.sidebar.lessons.title','Lessons','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3308,0,'en','menus','backend.sidebar.questions.title','Questions','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3309,0,'en','menus','backend.sidebar.questions-options.title','Questions Options','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3310,0,'en','menus','backend.sidebar.tests.title','Tests','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3311,0,'en','menus','backend.sidebar.change-password.title','Change Password','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3312,0,'en','menus','backend.sidebar.account.title','Account','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3313,0,'en','menus','backend.sidebar.messages.title','Messages','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3314,0,'en','menus','backend.sidebar.orders.title','Orders','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3315,0,'en','menus','backend.sidebar.categories.title','Categories','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3316,0,'en','menus','backend.sidebar.teachers.title','Teachers','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3317,0,'en','menus','backend.sidebar.hero-slider.title','Hero Slider','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3318,0,'en','menus','backend.sidebar.sponsors.title','Sponsors','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3319,0,'en','menus','backend.sidebar.testimonials.title','Testimonials','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3320,0,'en','menus','backend.sidebar.blogs.title','Blog','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3321,0,'en','menus','backend.sidebar.faqs.title','FAQs','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3322,0,'en','menus','backend.sidebar.reasons.title','Reasons','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3323,0,'en','menus','backend.sidebar.contact.title','Contact','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3324,0,'en','menus','backend.sidebar.footer.title','Footer','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3325,0,'en','menus','backend.sidebar.newsletter-configuration.title','Newsletter Configuration','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3326,0,'en','menus','backend.sidebar.invoices.title','Invoices','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3327,0,'en','menus','backend.sidebar.certificates.title','Certificates','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3328,0,'en','menus','backend.sidebar.contacts.title','Leads','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3329,0,'en','menus','backend.sidebar.pages.title','Pages Manager','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3330,0,'en','menus','backend.sidebar.reviews.title','Reviews','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3331,0,'en','menus','backend.sidebar.translations.title','Translation Manager','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3332,0,'en','menus','backend.sidebar.update.title','Update','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3333,0,'en','menus','backend.sidebar.backup.title','Backup','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3334,0,'en','menus','backend.sidebar.bundles.title','Bundles','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3335,0,'en','menus','backend.sidebar.reports.title','Reports','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3336,0,'en','menus','backend.sidebar.reports.students','Students','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3337,0,'en','menus','backend.sidebar.reports.sales','Sales','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3338,0,'en','menus','backend.sidebar.coupons.title','Coupons','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3339,0,'en','menus','backend.sidebar.tax.title','Tax','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3340,0,'en','menus','backend.sidebar.sitemap.title','Sitemap','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3341,0,'en','menus','backend.sidebar.forums-category.title','Forums Categories','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3342,0,'en','menus','backend.sidebar.payments.title','Payments','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3343,0,'en','menus','backend.sidebar.payments_requests.title','Payment Requests','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3344,0,'en','menus','backend.access.title','Access','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3345,0,'en','menus','backend.access.roles.management','Role Management','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3346,0,'en','menus','backend.access.roles.create','Create Role','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3347,0,'en','menus','backend.access.roles.edit','Edit Role','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3348,0,'en','menus','backend.access.roles.all','All Roles','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3349,0,'en','menus','backend.access.roles.main','Roles','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3350,0,'en','menus','backend.access.users.deactivated','Deactivated Users','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3351,0,'en','menus','backend.access.users.deleted','Deleted Users','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3352,0,'en','menus','backend.access.users.view','View User','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3353,0,'en','menus','backend.access.users.edit','Edit User','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3354,0,'en','menus','backend.access.users.change-password','Change Password','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3355,0,'en','menus','backend.access.users.all','All Users','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3356,0,'en','menus','backend.access.users.create','Create User','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3357,0,'en','menus','backend.access.users.main','Users','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3358,0,'en','menus','backend.log-viewer.dashboard','Debug dashboard','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3359,0,'en','menus','backend.log-viewer.logs','Logs','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3360,0,'en','menus','backend.log-viewer.main','Log Viewer','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3361,0,'en','menus','language-picker.language','Language','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3362,0,'en','menus','language-picker.langs.ar','Arabic','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3363,0,'en','menus','language-picker.langs.zh','Chinese','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3364,0,'en','menus','language-picker.langs.zh-TW','Chinese Traditional','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3365,0,'en','menus','language-picker.langs.da','Danish','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3366,0,'en','menus','language-picker.langs.de','German','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3367,0,'en','menus','language-picker.langs.el','Greek','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3368,0,'en','menus','language-picker.langs.en','English','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3369,0,'en','menus','language-picker.langs.es','Spanish','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3370,0,'en','menus','language-picker.langs.fa','Persian','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3371,0,'en','menus','language-picker.langs.fr','French','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3372,0,'en','menus','language-picker.langs.he','Hebrew','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3373,0,'en','menus','language-picker.langs.id','Indonesian','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3374,0,'en','menus','language-picker.langs.it','Italian','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3375,0,'en','menus','language-picker.langs.ja','Japanese','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3376,0,'en','menus','language-picker.langs.nl','Dutch','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3377,0,'en','menus','language-picker.langs.no','Norwegian','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3378,0,'en','menus','language-picker.langs.pt_BR','Portuguese (Brazil)','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3379,0,'en','menus','language-picker.langs.ru','Russian','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3380,0,'en','menus','language-picker.langs.sv','Swedish','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3381,0,'en','menus','language-picker.langs.th','Thai','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3382,0,'en','menus','language-picker.langs.tr','Turkish','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3383,0,'en','menus','language-picker.langs.af','Afrikaans','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3384,0,'en','menus','language-picker.langs.ak','Akan','2020-02-27 05:34:16','2020-04-17 10:54:03'),
(3385,0,'en','menus','language-picker.langs.sq_AL','Albanian (Albania)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3386,0,'en','menus','language-picker.langs.sq','Albanian','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3387,0,'en','menus','language-picker.langs.am_ET','Amharic (Ethiopia)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3388,0,'en','menus','language-picker.langs.am','Amharic','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3389,0,'en','menus','language-picker.langs.ar_DZ','Arabic (Algeria)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3390,0,'en','menus','language-picker.langs.ar_BH','Arabic (Bahrain)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3391,0,'en','menus','language-picker.langs.ar_EG','Arabic (Egypt)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3392,0,'en','menus','language-picker.langs.ar_IQ','Arabic (Iraq)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3393,0,'en','menus','language-picker.langs.ar_JO','Arabic (Jordan)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3394,0,'en','menus','language-picker.langs.ar_KW','Arabic (Kuwait)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3395,0,'en','menus','language-picker.langs.ar_LB','Arabic (Lebanon)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3396,0,'en','menus','language-picker.langs.ar_LY','Arabic (Libya)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3397,0,'en','menus','language-picker.langs.ar_MA','Arabic (Morocco)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3398,0,'en','menus','language-picker.langs.ar_OM','Arabic (Oman)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3399,0,'en','menus','language-picker.langs.ar_QA','Arabic (Qatar)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3400,0,'en','menus','language-picker.langs.ar_SA','Arabic (Saudi Arabia)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3401,0,'en','menus','language-picker.langs.ar_SD','Arabic (Sudan)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3402,0,'en','menus','language-picker.langs.ar_SY','Arabic (Syria)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3403,0,'en','menus','language-picker.langs.ar_TN','Arabic (Tunisia)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3404,0,'en','menus','language-picker.langs.ar_AE','Arabic (United Arab Emirates)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3405,0,'en','menus','language-picker.langs.ar_YE','Arabic (Yemen)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3406,0,'en','menus','language-picker.langs.hy_AM','Armenian (Armenia)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3407,0,'en','menus','language-picker.langs.hy','Armenian','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3408,0,'en','menus','language-picker.langs.as_IN','Assamese (India)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3409,0,'en','menus','language-picker.langs.as','Assamese','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3410,0,'en','menus','language-picker.langs.asa_TZ','Asu (Tanzania)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3411,0,'en','menus','language-picker.langs.asa','Asu','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3412,0,'en','menus','language-picker.langs.az_Cyrl','Azerbaijani (Cyrillic)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3413,0,'en','menus','language-picker.langs.az_Cyrl_AZ','Azerbaijani (Cyrillic, Azerbaijan)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3414,0,'en','menus','language-picker.langs.az_Latn','Azerbaijani (Latin)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3415,0,'en','menus','language-picker.langs.az_Latn_AZ','Azerbaijani (Latin, Azerbaijan)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3416,0,'en','menus','language-picker.langs.az','Azerbaijani','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3417,0,'en','menus','language-picker.langs.bm_ML','Bambara (Mali)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3418,0,'en','menus','language-picker.langs.bm','Bambara','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3419,0,'en','menus','language-picker.langs.eu_ES','Basque (Spain)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3420,0,'en','menus','language-picker.langs.eu','Basque','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3421,0,'en','menus','language-picker.langs.be_BY','Belarusian (Belarus)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3422,0,'en','menus','language-picker.langs.be','Belarusian','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3423,0,'en','menus','language-picker.langs.bem_ZM','Bemba (Zambia)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3424,0,'en','menus','language-picker.langs.bem','Bemba','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3425,0,'en','menus','language-picker.langs.bez_TZ','Bena (Tanzania)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3426,0,'en','menus','language-picker.langs.bez','Bena','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3427,0,'en','menus','language-picker.langs.bn_BD','Bengali (Bangladesh)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3428,0,'en','menus','language-picker.langs.bn_IN','Bengali (India)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3429,0,'en','menus','language-picker.langs.bn','Bengali','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3430,0,'en','menus','language-picker.langs.bs_BA','Bosnian (Bosnia and Herzegovina)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3431,0,'en','menus','language-picker.langs.bs','Bosnian','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3432,0,'en','menus','language-picker.langs.bg_BG','Bulgarian (Bulgaria)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3433,0,'en','menus','language-picker.langs.bg','Bulgarian','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3434,0,'en','menus','language-picker.langs.my_MM','Burmese (Myanmar [Burma])','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3435,0,'en','menus','language-picker.langs.my','Burmese','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3436,0,'en','menus','language-picker.langs.yue_Hant_HK','Cantonese (Traditional, Hong Kong SAR China)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3437,0,'en','menus','language-picker.langs.ca_ES','Catalan (Spain)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3438,0,'en','menus','language-picker.langs.ca','Catalan','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3439,0,'en','menus','language-picker.langs.tzm_Latn','Central Morocco Tamazight (Latin)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3440,0,'en','menus','language-picker.langs.tzm_Latn_MA','Central Morocco Tamazight (Latin, Morocco)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3441,0,'en','menus','language-picker.langs.tzm','Central Morocco Tamazight','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3442,0,'en','menus','language-picker.langs.chr_US','Cherokee (United States)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3443,0,'en','menus','language-picker.langs.chr','Cherokee','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3444,0,'en','menus','language-picker.langs.cgg_UG','Chiga (Uganda)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3445,0,'en','menus','language-picker.langs.cgg','Chiga','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3446,0,'en','menus','language-picker.langs.zh_Hans','Chinese (Simplified Han)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3447,0,'en','menus','language-picker.langs.zh_Hans_CN','Chinese (Simplified Han, China)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3448,0,'en','menus','language-picker.langs.zh_Hans_HK','Chinese (Simplified Han, Hong Kong SAR China)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3449,0,'en','menus','language-picker.langs.zh_Hans_MO','Chinese (Simplified Han, Macau SAR China)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3450,0,'en','menus','language-picker.langs.zh_Hans_SG','Chinese (Simplified Han, Singapore)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3451,0,'en','menus','language-picker.langs.zh_Hant','Chinese (Traditional Han)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3452,0,'en','menus','language-picker.langs.zh_Hant_HK','Chinese (Traditional Han, Hong Kong SAR China)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3453,0,'en','menus','language-picker.langs.zh_Hant_MO','Chinese (Traditional Han, Macau SAR China)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3454,0,'en','menus','language-picker.langs.zh_Hant_TW','Chinese (Traditional Han, Taiwan)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3455,0,'en','menus','language-picker.langs.kw_GB','Cornish (United Kingdom)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3456,0,'en','menus','language-picker.langs.kw','Cornish','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3457,0,'en','menus','language-picker.langs.hr_HR','Croatian (Croatia)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3458,0,'en','menus','language-picker.langs.hr','Croatian','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3459,0,'en','menus','language-picker.langs.cs_CZ','Czech (Czech Republic)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3460,0,'en','menus','language-picker.langs.cs','Czech','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3461,0,'en','menus','language-picker.langs.da_DK','Danish (Denmark)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3462,0,'en','menus','language-picker.langs.nl_BE','Dutch (Belgium)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3463,0,'en','menus','language-picker.langs.nl_NL','Dutch (Netherlands)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3464,0,'en','menus','language-picker.langs.ebu_KE','Embu (Kenya)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3465,0,'en','menus','language-picker.langs.ebu','Embu','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3466,0,'en','menus','language-picker.langs.en_AS','English (American Samoa)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3467,0,'en','menus','language-picker.langs.en_AU','English (Australia)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3468,0,'en','menus','language-picker.langs.en_BE','English (Belgium)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3469,0,'en','menus','language-picker.langs.en_BZ','English (Belize)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3470,0,'en','menus','language-picker.langs.en_BW','English (Botswana)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3471,0,'en','menus','language-picker.langs.en_CA','English (Canada)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3472,0,'en','menus','language-picker.langs.en_GU','English (Guam)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3473,0,'en','menus','language-picker.langs.en_HK','English (Hong Kong SAR China)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3474,0,'en','menus','language-picker.langs.en_IN','English (India)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3475,0,'en','menus','language-picker.langs.en_IE','English (Ireland)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3476,0,'en','menus','language-picker.langs.en_IL','English (Israel)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3477,0,'en','menus','language-picker.langs.en_JM','English (Jamaica)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3478,0,'en','menus','language-picker.langs.en_MT','English (Malta)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3479,0,'en','menus','language-picker.langs.en_MH','English (Marshall Islands)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3480,0,'en','menus','language-picker.langs.en_MU','English (Mauritius)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3481,0,'en','menus','language-picker.langs.en_NA','English (Namibia)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3482,0,'en','menus','language-picker.langs.en_NZ','English (New Zealand)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3483,0,'en','menus','language-picker.langs.en_MP','English (Northern Mariana Islands)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3484,0,'en','menus','language-picker.langs.en_PK','English (Pakistan)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3485,0,'en','menus','language-picker.langs.en_PH','English (Philippines)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3486,0,'en','menus','language-picker.langs.en_SG','English (Singapore)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3487,0,'en','menus','language-picker.langs.en_ZA','English (South Africa)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3488,0,'en','menus','language-picker.langs.en_TT','English (Trinidad and Tobago)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3489,0,'en','menus','language-picker.langs.en_UM','English (U.S. Minor Outlying Islands)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3490,0,'en','menus','language-picker.langs.en_VI','English (U.S. Virgin Islands)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3491,0,'en','menus','language-picker.langs.en_GB','English (United Kingdom)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3492,0,'en','menus','language-picker.langs.en_US','English (United States)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3493,0,'en','menus','language-picker.langs.en_ZW','English (Zimbabwe)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3494,0,'en','menus','language-picker.langs.eo','Esperanto','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3495,0,'en','menus','language-picker.langs.et_EE','Estonian (Estonia)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3496,0,'en','menus','language-picker.langs.et','Estonian','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3497,0,'en','menus','language-picker.langs.ee_GH','Ewe (Ghana)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3498,0,'en','menus','language-picker.langs.ee_TG','Ewe (Togo)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3499,0,'en','menus','language-picker.langs.ee','Ewe','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3500,0,'en','menus','language-picker.langs.fo_FO','Faroese (Faroe Islands)','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3501,0,'en','menus','language-picker.langs.fo','Faroese','2020-02-27 05:34:17','2020-04-17 10:54:03'),
(3502,0,'en','menus','language-picker.langs.fil_PH','Filipino (Philippines)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3503,0,'en','menus','language-picker.langs.fil','Filipino','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3504,0,'en','menus','language-picker.langs.fi_FI','Finnish (Finland)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3505,0,'en','menus','language-picker.langs.fi','Finnish','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3506,0,'en','menus','language-picker.langs.fr_BE','French (Belgium)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3507,0,'en','menus','language-picker.langs.fr_BJ','French (Benin)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3508,0,'en','menus','language-picker.langs.fr_BF','French (Burkina Faso)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3509,0,'en','menus','language-picker.langs.fr_BI','French (Burundi)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3510,0,'en','menus','language-picker.langs.fr_CM','French (Cameroon)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3511,0,'en','menus','language-picker.langs.fr_CA','French (Canada)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3512,0,'en','menus','language-picker.langs.fr_CF','French (Central African Republic)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3513,0,'en','menus','language-picker.langs.fr_TD','French (Chad)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3514,0,'en','menus','language-picker.langs.fr_KM','French (Comoros)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3515,0,'en','menus','language-picker.langs.fr_CG','French (Congo - Brazzaville)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3516,0,'en','menus','language-picker.langs.fr_CD','French (Congo - Kinshasa)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3517,0,'en','menus','language-picker.langs.fr_CI','French (Côte d’Ivoire)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3518,0,'en','menus','language-picker.langs.fr_DJ','French (Djibouti)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3519,0,'en','menus','language-picker.langs.fr_GQ','French (Equatorial Guinea)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3520,0,'en','menus','language-picker.langs.fr_FR','French (France)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3521,0,'en','menus','language-picker.langs.fr_GA','French (Gabon)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3522,0,'en','menus','language-picker.langs.fr_GP','French (Guadeloupe)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3523,0,'en','menus','language-picker.langs.fr_GN','French (Guinea)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3524,0,'en','menus','language-picker.langs.fr_LU','French (Luxembourg)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3525,0,'en','menus','language-picker.langs.fr_MG','French (Madagascar)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3526,0,'en','menus','language-picker.langs.fr_ML','French (Mali)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3527,0,'en','menus','language-picker.langs.fr_MQ','French (Martinique)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3528,0,'en','menus','language-picker.langs.fr_MC','French (Monaco)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3529,0,'en','menus','language-picker.langs.fr_NE','French (Niger)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3530,0,'en','menus','language-picker.langs.fr_RW','French (Rwanda)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3531,0,'en','menus','language-picker.langs.fr_RE','French (Réunion)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3532,0,'en','menus','language-picker.langs.fr_BL','French (Saint Barthélemy)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3533,0,'en','menus','language-picker.langs.fr_MF','French (Saint Martin)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3534,0,'en','menus','language-picker.langs.fr_SN','French (Senegal)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3535,0,'en','menus','language-picker.langs.fr_CH','French (Switzerland)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3536,0,'en','menus','language-picker.langs.fr_TG','French (Togo)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3537,0,'en','menus','language-picker.langs.ff_SN','Fulah (Senegal)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3538,0,'en','menus','language-picker.langs.ff','Fulah','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3539,0,'en','menus','language-picker.langs.gl_ES','Galician (Spain)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3540,0,'en','menus','language-picker.langs.gl','Galician','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3541,0,'en','menus','language-picker.langs.lg_UG','Ganda (Uganda)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3542,0,'en','menus','language-picker.langs.lg','Ganda','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3543,0,'en','menus','language-picker.langs.ka_GE','Georgian (Georgia)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3544,0,'en','menus','language-picker.langs.ka','Georgian','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3545,0,'en','menus','language-picker.langs.de_AT','German (Austria)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3546,0,'en','menus','language-picker.langs.de_BE','German (Belgium)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3547,0,'en','menus','language-picker.langs.de_DE','German (Germany)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3548,0,'en','menus','language-picker.langs.de_LI','German (Liechtenstein)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3549,0,'en','menus','language-picker.langs.de_LU','German (Luxembourg)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3550,0,'en','menus','language-picker.langs.de_CH','German (Switzerland)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3551,0,'en','menus','language-picker.langs.el_CY','Greek (Cyprus)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3552,0,'en','menus','language-picker.langs.el_GR','Greek (Greece)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3553,0,'en','menus','language-picker.langs.gu_IN','Gujarati (India)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3554,0,'en','menus','language-picker.langs.gu','Gujarati','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3555,0,'en','menus','language-picker.langs.guz_KE','Gusii (Kenya)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3556,0,'en','menus','language-picker.langs.guz','Gusii','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3557,0,'en','menus','language-picker.langs.ha_Latn','Hausa (Latin)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3558,0,'en','menus','language-picker.langs.ha_Latn_GH','Hausa (Latin, Ghana)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3559,0,'en','menus','language-picker.langs.ha_Latn_NE','Hausa (Latin, Niger)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3560,0,'en','menus','language-picker.langs.ha_Latn_NG','Hausa (Latin, Nigeria)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3561,0,'en','menus','language-picker.langs.ha','Hausa','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3562,0,'en','menus','language-picker.langs.haw_US','Hawaiian (United States)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3563,0,'en','menus','language-picker.langs.haw','Hawaiian','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3564,0,'en','menus','language-picker.langs.he_IL','Hebrew (Israel)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3565,0,'en','menus','language-picker.langs.hi_IN','Hindi (India)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3566,0,'en','menus','language-picker.langs.hi','Hindi','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3567,0,'en','menus','language-picker.langs.hu_HU','Hungarian (Hungary)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3568,0,'en','menus','language-picker.langs.hu','Hungarian','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3569,0,'en','menus','language-picker.langs.is_IS','Icelandic (Iceland)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3570,0,'en','menus','language-picker.langs.is','Icelandic','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3571,0,'en','menus','language-picker.langs.ig_NG','Igbo (Nigeria)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3572,0,'en','menus','language-picker.langs.ig','Igbo','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3573,0,'en','menus','language-picker.langs.id_ID','Indonesian (Indonesia)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3574,0,'en','menus','language-picker.langs.ga_IE','Irish (Ireland)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3575,0,'en','menus','language-picker.langs.ga','Irish','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3576,0,'en','menus','language-picker.langs.it_IT','Italian (Italy)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3577,0,'en','menus','language-picker.langs.it_CH','Italian (Switzerland)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3578,0,'en','menus','language-picker.langs.ja_JP','Japanese (Japan)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3579,0,'en','menus','language-picker.langs.kea_CV','Kabuverdianu (Cape Verde)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3580,0,'en','menus','language-picker.langs.kea','Kabuverdianu','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3581,0,'en','menus','language-picker.langs.kab_DZ','Kabyle (Algeria)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3582,0,'en','menus','language-picker.langs.kab','Kabyle','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3583,0,'en','menus','language-picker.langs.kl_GL','Kalaallisut (Greenland)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3584,0,'en','menus','language-picker.langs.kl','Kalaallisut','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3585,0,'en','menus','language-picker.langs.kln_KE','Kalenjin (Kenya)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3586,0,'en','menus','language-picker.langs.kln','Kalenjin','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3587,0,'en','menus','language-picker.langs.kam_KE','Kamba (Kenya)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3588,0,'en','menus','language-picker.langs.kam','Kamba','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3589,0,'en','menus','language-picker.langs.kn_IN','Kannada (India)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3590,0,'en','menus','language-picker.langs.kn','Kannada','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3591,0,'en','menus','language-picker.langs.kk_Cyrl','Kazakh (Cyrillic)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3592,0,'en','menus','language-picker.langs.kk_Cyrl_KZ','Kazakh (Cyrillic, Kazakhstan)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3593,0,'en','menus','language-picker.langs.kk','Kazakh','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3594,0,'en','menus','language-picker.langs.km_KH','Khmer (Cambodia)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3595,0,'en','menus','language-picker.langs.km','Khmer','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3596,0,'en','menus','language-picker.langs.ki_KE','Kikuyu (Kenya)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3597,0,'en','menus','language-picker.langs.ki','Kikuyu','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3598,0,'en','menus','language-picker.langs.rw_RW','Kinyarwanda (Rwanda)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3599,0,'en','menus','language-picker.langs.rw','Kinyarwanda','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3600,0,'en','menus','language-picker.langs.kok_IN','Konkani (India)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3601,0,'en','menus','language-picker.langs.kok','Konkani','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3602,0,'en','menus','language-picker.langs.ko_KR','Korean (South Korea)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3603,0,'en','menus','language-picker.langs.ko','Korean','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3604,0,'en','menus','language-picker.langs.khq_ML','Koyra Chiini (Mali)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3605,0,'en','menus','language-picker.langs.khq','Koyra Chiini','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3606,0,'en','menus','language-picker.langs.ses_ML','Koyraboro Senni (Mali)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3607,0,'en','menus','language-picker.langs.ses','Koyraboro Senni','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3608,0,'en','menus','language-picker.langs.lag_TZ','Langi (Tanzania)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3609,0,'en','menus','language-picker.langs.lag','Langi','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3610,0,'en','menus','language-picker.langs.lv_LV','Latvian (Latvia)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3611,0,'en','menus','language-picker.langs.lv','Latvian','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3612,0,'en','menus','language-picker.langs.lt_LT','Lithuanian (Lithuania)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3613,0,'en','menus','language-picker.langs.lt','Lithuanian','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3614,0,'en','menus','language-picker.langs.luo_KE','Luo (Kenya)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3615,0,'en','menus','language-picker.langs.luo','Luo','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3616,0,'en','menus','language-picker.langs.luy_KE','Luyia (Kenya)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3617,0,'en','menus','language-picker.langs.luy','Luyia','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3618,0,'en','menus','language-picker.langs.mk_MK','Macedonian (Macedonia)','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3619,0,'en','menus','language-picker.langs.mk','Macedonian','2020-02-27 05:34:18','2020-04-17 10:54:03'),
(3620,0,'en','menus','language-picker.langs.jmc_TZ','Machame (Tanzania)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3621,0,'en','menus','language-picker.langs.jmc','Machame','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3622,0,'en','menus','language-picker.langs.kde_TZ','Makonde (Tanzania)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3623,0,'en','menus','language-picker.langs.kde','Makonde','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3624,0,'en','menus','language-picker.langs.mg_MG','Malagasy (Madagascar)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3625,0,'en','menus','language-picker.langs.mg','Malagasy','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3626,0,'en','menus','language-picker.langs.ms_BN','Malay (Brunei)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3627,0,'en','menus','language-picker.langs.ms_MY','Malay (Malaysia)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3628,0,'en','menus','language-picker.langs.ms','Malay','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3629,0,'en','menus','language-picker.langs.ml_IN','Malayalam (India)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3630,0,'en','menus','language-picker.langs.ml','Malayalam','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3631,0,'en','menus','language-picker.langs.mt_MT','Maltese (Malta)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3632,0,'en','menus','language-picker.langs.mt','Maltese','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3633,0,'en','menus','language-picker.langs.gv_GB','Manx (United Kingdom)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3634,0,'en','menus','language-picker.langs.gv','Manx','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3635,0,'en','menus','language-picker.langs.mr_IN','Marathi (India)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3636,0,'en','menus','language-picker.langs.mr','Marathi','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3637,0,'en','menus','language-picker.langs.mas_KE','Masai (Kenya)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3638,0,'en','menus','language-picker.langs.mas_TZ','Masai (Tanzania)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3639,0,'en','menus','language-picker.langs.mas','Masai','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3640,0,'en','menus','language-picker.langs.mer_KE','Meru (Kenya)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3641,0,'en','menus','language-picker.langs.mer','Meru','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3642,0,'en','menus','language-picker.langs.mfe_MU','Morisyen (Mauritius)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3643,0,'en','menus','language-picker.langs.mfe','Morisyen','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3644,0,'en','menus','language-picker.langs.naq_NA','Nama (Namibia)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3645,0,'en','menus','language-picker.langs.naq','Nama','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3646,0,'en','menus','language-picker.langs.ne_IN','Nepali (India)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3647,0,'en','menus','language-picker.langs.ne_NP','Nepali (Nepal)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3648,0,'en','menus','language-picker.langs.ne','Nepali','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3649,0,'en','menus','language-picker.langs.nd_ZW','North Ndebele (Zimbabwe)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3650,0,'en','menus','language-picker.langs.nd','North Ndebele','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3651,0,'en','menus','language-picker.langs.nb_NO','Norwegian Bokmål (Norway)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3652,0,'en','menus','language-picker.langs.nb','Norwegian Bokmål','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3653,0,'en','menus','language-picker.langs.nn_NO','Norwegian Nynorsk (Norway)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3654,0,'en','menus','language-picker.langs.nn','Norwegian Nynorsk','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3655,0,'en','menus','language-picker.langs.nyn_UG','Nyankole (Uganda)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3656,0,'en','menus','language-picker.langs.nyn','Nyankole','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3657,0,'en','menus','language-picker.langs.or_IN','Oriya (India)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3658,0,'en','menus','language-picker.langs.or','Oriya','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3659,0,'en','menus','language-picker.langs.om_ET','Oromo (Ethiopia)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3660,0,'en','menus','language-picker.langs.om_KE','Oromo (Kenya)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3661,0,'en','menus','language-picker.langs.om','Oromo','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3662,0,'en','menus','language-picker.langs.ps_AF','Pashto (Afghanistan)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3663,0,'en','menus','language-picker.langs.ps','Pashto','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3664,0,'en','menus','language-picker.langs.fa_AF','Persian (Afghanistan)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3665,0,'en','menus','language-picker.langs.fa_IR','Persian (Iran)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3666,0,'en','menus','language-picker.langs.pl_PL','Polish (Poland)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3667,0,'en','menus','language-picker.langs.pl','Polish','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3668,0,'en','menus','language-picker.langs.pt_GW','Portuguese (Guinea-Bissau)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3669,0,'en','menus','language-picker.langs.pt_MZ','Portuguese (Mozambique)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3670,0,'en','menus','language-picker.langs.pt_PT','Portuguese (Portugal)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3671,0,'en','menus','language-picker.langs.pt','Portuguese','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3672,0,'en','menus','language-picker.langs.pa_Arab','Punjabi (Arabic)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3673,0,'en','menus','language-picker.langs.pa_Arab_PK','Punjabi (Arabic, Pakistan)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3674,0,'en','menus','language-picker.langs.pa_Guru','Punjabi (Gurmukhi)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3675,0,'en','menus','language-picker.langs.pa_Guru_IN','Punjabi (Gurmukhi, India)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3676,0,'en','menus','language-picker.langs.pa','Punjabi','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3677,0,'en','menus','language-picker.langs.ro_MD','Romanian (Moldova)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3678,0,'en','menus','language-picker.langs.ro_RO','Romanian (Romania)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3679,0,'en','menus','language-picker.langs.ro','Romanian','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3680,0,'en','menus','language-picker.langs.rm_CH','Romansh (Switzerland)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3681,0,'en','menus','language-picker.langs.rm','Romansh','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3682,0,'en','menus','language-picker.langs.rof_TZ','Rombo (Tanzania)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3683,0,'en','menus','language-picker.langs.rof','Rombo','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3684,0,'en','menus','language-picker.langs.ru_MD','Russian (Moldova)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3685,0,'en','menus','language-picker.langs.ru_RU','Russian (Russia)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3686,0,'en','menus','language-picker.langs.ru_UA','Russian (Ukraine)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3687,0,'en','menus','language-picker.langs.rwk_TZ','Rwa (Tanzania)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3688,0,'en','menus','language-picker.langs.rwk','Rwa','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3689,0,'en','menus','language-picker.langs.saq_KE','Samburu (Kenya)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3690,0,'en','menus','language-picker.langs.saq','Samburu','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3691,0,'en','menus','language-picker.langs.sg_CF','Sango (Central African Republic)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3692,0,'en','menus','language-picker.langs.sg','Sango','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3693,0,'en','menus','language-picker.langs.seh_MZ','Sena (Mozambique)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3694,0,'en','menus','language-picker.langs.seh','Sena','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3695,0,'en','menus','language-picker.langs.sr_Cyrl','Serbian (Cyrillic)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3696,0,'en','menus','language-picker.langs.sr_Cyrl_BA','Serbian (Cyrillic, Bosnia and Herzegovina)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3697,0,'en','menus','language-picker.langs.sr_Cyrl_ME','Serbian (Cyrillic, Montenegro)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3698,0,'en','menus','language-picker.langs.sr_Cyrl_RS','Serbian (Cyrillic, Serbia)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3699,0,'en','menus','language-picker.langs.sr_Latn','Serbian (Latin)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3700,0,'en','menus','language-picker.langs.sr_Latn_BA','Serbian (Latin, Bosnia and Herzegovina)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3701,0,'en','menus','language-picker.langs.sr_Latn_ME','Serbian (Latin, Montenegro)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3702,0,'en','menus','language-picker.langs.sr_Latn_RS','Serbian (Latin, Serbia)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3703,0,'en','menus','language-picker.langs.sr','Serbian','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3704,0,'en','menus','language-picker.langs.sn_ZW','Shona (Zimbabwe)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3705,0,'en','menus','language-picker.langs.sn','Shona','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3706,0,'en','menus','language-picker.langs.ii_CN','Sichuan Yi (China)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3707,0,'en','menus','language-picker.langs.ii','Sichuan Yi','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3708,0,'en','menus','language-picker.langs.si_LK','Sinhala (Sri Lanka)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3709,0,'en','menus','language-picker.langs.si','Sinhala','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3710,0,'en','menus','language-picker.langs.sk_SK','Slovak (Slovakia)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3711,0,'en','menus','language-picker.langs.sk','Slovak','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3712,0,'en','menus','language-picker.langs.sl_SI','Slovenian (Slovenia)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3713,0,'en','menus','language-picker.langs.sl','Slovenian','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3714,0,'en','menus','language-picker.langs.xog_UG','Soga (Uganda)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3715,0,'en','menus','language-picker.langs.xog','Soga','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3716,0,'en','menus','language-picker.langs.so_DJ','Somali (Djibouti)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3717,0,'en','menus','language-picker.langs.so_ET','Somali (Ethiopia)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3718,0,'en','menus','language-picker.langs.so_KE','Somali (Kenya)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3719,0,'en','menus','language-picker.langs.so_SO','Somali (Somalia)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3720,0,'en','menus','language-picker.langs.so','Somali','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3721,0,'en','menus','language-picker.langs.es_AR','Spanish (Argentina)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3722,0,'en','menus','language-picker.langs.es_BO','Spanish (Bolivia)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3723,0,'en','menus','language-picker.langs.es_CL','Spanish (Chile)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3724,0,'en','menus','language-picker.langs.es_CO','Spanish (Colombia)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3725,0,'en','menus','language-picker.langs.es_CR','Spanish (Costa Rica)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3726,0,'en','menus','language-picker.langs.es_DO','Spanish (Dominican Republic)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3727,0,'en','menus','language-picker.langs.es_EC','Spanish (Ecuador)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3728,0,'en','menus','language-picker.langs.es_SV','Spanish (El Salvador)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3729,0,'en','menus','language-picker.langs.es_GQ','Spanish (Equatorial Guinea)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3730,0,'en','menus','language-picker.langs.es_GT','Spanish (Guatemala)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3731,0,'en','menus','language-picker.langs.es_HN','Spanish (Honduras)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3732,0,'en','menus','language-picker.langs.es_419','Spanish (Latin America)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3733,0,'en','menus','language-picker.langs.es_MX','Spanish (Mexico)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3734,0,'en','menus','language-picker.langs.es_NI','Spanish (Nicaragua)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3735,0,'en','menus','language-picker.langs.es_PA','Spanish (Panama)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3736,0,'en','menus','language-picker.langs.es_PY','Spanish (Paraguay)','2020-02-27 05:34:19','2020-04-17 10:54:03'),
(3737,0,'en','menus','language-picker.langs.es_PE','Spanish (Peru)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3738,0,'en','menus','language-picker.langs.es_PR','Spanish (Puerto Rico)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3739,0,'en','menus','language-picker.langs.es_ES','Spanish (Spain)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3740,0,'en','menus','language-picker.langs.es_US','Spanish (United States)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3741,0,'en','menus','language-picker.langs.es_UY','Spanish (Uruguay)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3742,0,'en','menus','language-picker.langs.es_VE','Spanish (Venezuela)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3743,0,'en','menus','language-picker.langs.sw_KE','Swahili (Kenya)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3744,0,'en','menus','language-picker.langs.sw_TZ','Swahili (Tanzania)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3745,0,'en','menus','language-picker.langs.sw','Swahili','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3746,0,'en','menus','language-picker.langs.sv_FI','Swedish (Finland)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3747,0,'en','menus','language-picker.langs.sv_SE','Swedish (Sweden)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3748,0,'en','menus','language-picker.langs.gsw_CH','Swiss German (Switzerland)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3749,0,'en','menus','language-picker.langs.gsw','Swiss German','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3750,0,'en','menus','language-picker.langs.shi_Latn','Tachelhit (Latin)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3751,0,'en','menus','language-picker.langs.shi_Latn_MA','Tachelhit (Latin, Morocco)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3752,0,'en','menus','language-picker.langs.shi_Tfng','Tachelhit (Tifinagh)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3753,0,'en','menus','language-picker.langs.shi_Tfng_MA','Tachelhit (Tifinagh, Morocco)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3754,0,'en','menus','language-picker.langs.shi','Tachelhit','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3755,0,'en','menus','language-picker.langs.dav_KE','Taita (Kenya)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3756,0,'en','menus','language-picker.langs.dav','Taita','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3757,0,'en','menus','language-picker.langs.ta_IN','Tamil (India)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3758,0,'en','menus','language-picker.langs.ta_LK','Tamil (Sri Lanka)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3759,0,'en','menus','language-picker.langs.ta','Tamil','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3760,0,'en','menus','language-picker.langs.te_IN','Telugu (India)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3761,0,'en','menus','language-picker.langs.te','Telugu','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3762,0,'en','menus','language-picker.langs.teo_KE','Teso (Kenya)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3763,0,'en','menus','language-picker.langs.teo_UG','Teso (Uganda)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3764,0,'en','menus','language-picker.langs.teo','Teso','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3765,0,'en','menus','language-picker.langs.th_TH','Thai (Thailand)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3766,0,'en','menus','language-picker.langs.bo_CN','Tibetan (China)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3767,0,'en','menus','language-picker.langs.bo_IN','Tibetan (India)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3768,0,'en','menus','language-picker.langs.bo','Tibetan','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3769,0,'en','menus','language-picker.langs.ti_ER','Tigrinya (Eritrea)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3770,0,'en','menus','language-picker.langs.ti_ET','Tigrinya (Ethiopia)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3771,0,'en','menus','language-picker.langs.ti','Tigrinya','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3772,0,'en','menus','language-picker.langs.to_TO','Tonga (Tonga)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3773,0,'en','menus','language-picker.langs.to','Tonga','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3774,0,'en','menus','language-picker.langs.tr_TR','Turkish (Turkey)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3775,0,'en','menus','language-picker.langs.uk_UA','Ukrainian (Ukraine)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3776,0,'en','menus','language-picker.langs.uk','Ukrainian','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3777,0,'en','menus','language-picker.langs.ur_IN','Urdu (India)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3778,0,'en','menus','language-picker.langs.ur_PK','Urdu (Pakistan)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3779,0,'en','menus','language-picker.langs.ur','Urdu','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3780,0,'en','menus','language-picker.langs.uz_Arab','Uzbek (Arabic)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3781,0,'en','menus','language-picker.langs.uz_Arab_AF','Uzbek (Arabic, Afghanistan)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3782,0,'en','menus','language-picker.langs.uz_Cyrl','Uzbek (Cyrillic)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3783,0,'en','menus','language-picker.langs.uz_Cyrl_UZ','Uzbek (Cyrillic, Uzbekistan)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3784,0,'en','menus','language-picker.langs.uz_Latn','Uzbek (Latin)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3785,0,'en','menus','language-picker.langs.uz_Latn_UZ','Uzbek (Latin, Uzbekistan)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3786,0,'en','menus','language-picker.langs.uz','Uzbek','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3787,0,'en','menus','language-picker.langs.vi_VN','Vietnamese (Vietnam)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3788,0,'en','menus','language-picker.langs.vi','Vietnamese','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3789,0,'en','menus','language-picker.langs.vun_TZ','Vunjo (Tanzania)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3790,0,'en','menus','language-picker.langs.vun','Vunjo','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3791,0,'en','menus','language-picker.langs.cy_GB','Welsh (United Kingdom)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3792,0,'en','menus','language-picker.langs.cy','Welsh','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3793,0,'en','menus','language-picker.langs.yo_NG','Yoruba (Nigeria)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3794,0,'en','menus','language-picker.langs.yo','Yoruba','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3795,0,'en','menus','language-picker.langs.zu_ZA','Zulu (South Africa)','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3796,0,'en','menus','language-picker.langs.zu','Zulu','2020-02-27 05:34:20','2020-04-17 10:54:03'),
(3797,0,'en','navs','general.logout','Logout','2020-02-27 05:34:20','2020-04-16 04:53:54'),
(3798,0,'en','navs','general.home','Home','2020-02-27 05:34:20','2020-04-16 04:53:54'),
(3799,0,'en','navs','general.login','LogIn','2020-02-27 05:34:20','2020-04-16 04:53:54'),
(3800,0,'en','navs','general.messages','Messages','2020-02-27 05:34:20','2020-04-16 04:53:54'),
(3801,0,'en','navs','general.no_messages','No messages','2020-02-27 05:34:20','2020-04-16 04:53:54'),
(3802,0,'en','navs','general.account','Account','2020-02-27 05:34:20','2020-04-16 04:53:54'),
(3803,0,'en','navs','general.profile','Profile','2020-02-27 05:34:20','2020-04-16 04:53:54'),
(3804,0,'en','navs','frontend.contact','Contact','2020-02-27 05:34:20','2020-04-16 04:53:54'),
(3805,0,'en','navs','frontend.dashboard','Dashboard','2020-02-27 05:34:20','2020-04-16 04:53:54'),
(3806,0,'en','navs','frontend.login','Login','2020-02-27 05:34:20','2020-04-16 04:53:54'),
(3807,0,'en','navs','frontend.macros','Macros','2020-02-27 05:34:20','2020-04-16 04:53:54'),
(3808,0,'en','navs','frontend.register','Register','2020-02-27 05:34:20','2020-04-16 04:53:54'),
(3809,0,'en','navs','frontend.courses','Courses','2020-02-27 05:34:20','2020-04-16 04:53:54'),
(3810,0,'en','navs','frontend.forums','Forums','2020-02-27 05:34:20','2020-04-16 04:53:54'),
(3811,0,'en','navs','frontend.user.account','My Account','2020-02-27 05:34:20','2020-04-16 04:53:54'),
(3812,0,'en','navs','frontend.user.administration','Administration','2020-02-27 05:34:20','2020-04-16 04:53:54'),
(3813,0,'en','navs','frontend.user.change_password','Change Password','2020-02-27 05:34:20','2020-04-16 04:53:54'),
(3814,0,'en','navs','frontend.user.my_information','My Information','2020-02-27 05:34:20','2020-04-16 04:53:54'),
(3815,0,'en','navs','frontend.user.profile','Profile','2020-02-27 05:34:20','2020-04-16 04:53:54'),
(3816,0,'en','navs','frontend.user.edit_account','Edit Account','2020-02-27 05:34:20','2020-04-16 04:53:54'),
(3817,0,'en','pagination','previous','&laquo; Previous','2020-02-27 05:34:20','2020-04-19 12:51:04'),
(3818,0,'en','pagination','next','Next &raquo;','2020-02-27 05:34:20','2020-04-19 12:51:04'),
(3819,1,'en','passwords','password','Passwords must be at least six characters and match the confirmation.','2020-02-27 05:34:20','2020-02-27 05:34:20'),
(3820,1,'en','passwords','reset','Your password has been reset!','2020-02-27 05:34:20','2020-02-27 05:34:20'),
(3821,1,'en','passwords','sent','We have e-mailed your password reset link!','2020-02-27 05:34:20','2020-02-27 05:34:20'),
(3822,1,'en','passwords','token','This password reset token is invalid.','2020-02-27 05:34:20','2020-02-27 05:34:20'),
(3823,1,'en','passwords','user','We can\'t find a user with that e-mail address.','2020-02-27 05:34:20','2020-02-27 05:34:20'),
(3824,0,'en','roles','administrator','Administrator','2020-02-27 05:34:20','2020-04-19 11:26:08'),
(3825,0,'en','roles','user','User','2020-02-27 05:34:20','2020-04-19 11:26:08'),
(3826,0,'en','strings','frontend.user.email_changed_notice','You must confirm your new e-mail address before you can log in again.','2020-02-27 05:34:20','2020-04-16 04:24:06'),
(3827,0,'en','strings','frontend.user.profile_updated','Profile successfully updated.','2020-02-27 05:34:20','2020-04-16 04:24:06'),
(3828,0,'en','strings','frontend.user.password_updated','Password successfully updated.','2020-02-27 05:34:20','2020-04-16 04:24:06'),
(3829,0,'en','strings','frontend.user.change_email_notice','If you change your e-mail you will be logged out until you confirm your new e-mail address.','2020-02-27 05:34:20','2020-04-16 04:24:06'),
(3830,0,'en','strings','frontend.test','Test','2020-02-27 05:34:20','2020-04-16 04:24:06'),
(3831,0,'en','strings','frontend.tests.based_on.permission','Permission Based - ','2020-02-27 05:34:20','2020-04-16 04:24:06'),
(3832,0,'en','strings','frontend.tests.based_on.role','Role Based - ','2020-02-27 05:34:20','2020-04-16 04:24:06'),
(3833,0,'en','strings','frontend.tests.js_injected_from_controller','Javascript Injected from a Controller','2020-02-27 05:34:20','2020-04-16 04:24:06'),
(3834,0,'en','strings','frontend.tests.using_blade_extensions','Using Blade Extensions','2020-02-27 05:34:20','2020-04-16 04:24:06'),
(3835,0,'en','strings','frontend.tests.using_access_helper.array_permissions','Using Access Helper with Array of Permission Names or ID\'s where the user does have to possess all.','2020-02-27 05:34:20','2020-04-16 04:24:06'),
(3836,0,'en','strings','frontend.tests.using_access_helper.array_permissions_not','Using Access Helper with Array of Permission Names or ID\'s where the user does not have to possess all.','2020-02-27 05:34:20','2020-04-16 04:24:06'),
(3837,0,'en','strings','frontend.tests.using_access_helper.array_roles','Using Access Helper with Array of Role Names or ID\'s where the user does have to possess all.','2020-02-27 05:34:20','2020-04-16 04:24:06'),
(3838,0,'en','strings','frontend.tests.using_access_helper.array_roles_not','Using Access Helper with Array of Role Names or ID\'s where the user does not have to possess all.','2020-02-27 05:34:20','2020-04-16 04:24:06'),
(3839,0,'en','strings','frontend.tests.using_access_helper.permission_id','Using Access Helper with Permission ID','2020-02-27 05:34:20','2020-04-16 04:24:06'),
(3840,0,'en','strings','frontend.tests.using_access_helper.permission_name','Using Access Helper with Permission Name','2020-02-27 05:34:20','2020-04-16 04:24:06'),
(3841,0,'en','strings','frontend.tests.using_access_helper.role_id','Using Access Helper with Role ID','2020-02-27 05:34:20','2020-04-16 04:24:06'),
(3842,0,'en','strings','frontend.tests.using_access_helper.role_name','Using Access Helper with Role Name','2020-02-27 05:34:20','2020-04-16 04:24:06'),
(3843,0,'en','strings','frontend.tests.view_console_it_works','View console, you should see \'it works!\' which is coming from FrontendController@index','2020-02-27 05:34:20','2020-04-16 04:24:06'),
(3844,0,'en','strings','frontend.tests.you_can_see_because','You can see this because you have the role of \':role\'!','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3845,0,'en','strings','frontend.tests.you_can_see_because_permission','You can see this because you have the permission of \':permission\'!','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3846,0,'en','strings','frontend.general.joined','Joined','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3847,0,'en','strings','frontend.welcome_to','Welcome to :place','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3848,0,'en','strings','backend.menu_manager.page','Page','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3849,0,'en','strings','backend.menu_manager.link','Link','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3850,0,'en','strings','backend.menu_manager.title','Menu Manager','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3851,0,'en','strings','backend.menu_manager.edit_menus','Edit Menus','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3852,0,'en','strings','backend.menu_manager.locations','Locations','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3853,0,'en','strings','backend.menu_manager.select_to_edit','Select the menu you want to edit','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3854,0,'en','strings','backend.menu_manager.create_new','Create new menu','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3855,0,'en','strings','backend.menu_manager.or','Or','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3856,0,'en','strings','backend.menu_manager.choose','Choose','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3857,0,'en','strings','backend.menu_manager.welcome','Welcome','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3858,0,'en','strings','backend.menu_manager.url','URL','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3859,0,'en','strings','backend.menu_manager.label','Label','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3860,0,'en','strings','backend.menu_manager.add_to_menu','Add to Menu','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3861,0,'en','strings','backend.menu_manager.screen_reader_text','Press return or enter to expand','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3862,0,'en','strings','backend.menu_manager.categories','Categories','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3863,0,'en','strings','backend.menu_manager.Category','Category','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3864,0,'en','strings','backend.menu_manager.pages','Pages','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3865,0,'en','strings','backend.menu_manager.posts','Posts','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3866,0,'en','strings','backend.menu_manager.post','Post','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3867,0,'en','strings','backend.menu_manager.custom_link','Custom Link','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3868,0,'en','strings','backend.menu_manager.menu_structure','Menu Structure','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3869,0,'en','strings','backend.menu_manager.name','Name','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3870,0,'en','strings','backend.menu_manager.create_menu','Create Menu','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3871,0,'en','strings','backend.menu_manager.save_menu','Save Menu','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3872,0,'en','strings','backend.menu_manager.delete_menu','Delete Menu','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3873,0,'en','strings','backend.menu_manager.sub_menu','Sub-menu','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3874,0,'en','strings','backend.menu_manager.menu_creation','Menu Creation','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3875,0,'en','strings','backend.menu_manager.drag_instruction_1','Place each item in the order you prefer. Click on the arrow to the right of the item to display more configuration options.','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3876,0,'en','strings','backend.menu_manager.drag_instruction_2','Please enter the name and select \"Create menu\" button','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3877,0,'en','strings','backend.menu_manager.class','Class CSS (optional)','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3878,0,'en','strings','backend.menu_manager.move','Move','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3879,0,'en','strings','backend.menu_manager.move_up','Move up','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3880,0,'en','strings','backend.menu_manager.move_down','Move down','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3881,0,'en','strings','backend.menu_manager.move_right','Move right','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3882,0,'en','strings','backend.menu_manager.move_left','Move left','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3883,0,'en','strings','backend.menu_manager.top','Top','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3884,0,'en','strings','backend.menu_manager.delete','Delete','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3885,0,'en','strings','backend.menu_manager.cancel','Cancel','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3886,0,'en','strings','backend.menu_manager.update_item','Update Item','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3887,0,'en','strings','backend.menu_manager.menu_settings','Menu Settings','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3888,0,'en','strings','backend.menu_manager.auto_add_pages','Auto Add Pages','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3889,0,'en','strings','backend.menu_manager.auto_add_pages_desc','Automatically add new top-level pages to this menu','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3890,0,'en','strings','backend.menu_manager.display','Display','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3891,0,'en','strings','backend.menu_manager.top_menu','Top Menu','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3892,0,'en','strings','backend.menu_manager.footer_menu','Footer Menu','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3893,0,'en','strings','backend.menu_manager.currently','Currently set to','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3894,0,'en','strings','backend.menu_manager.theme_location','Theme Location','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3895,0,'en','strings','backend.menu_manager.save_changes','Save Changes','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3896,0,'en','strings','backend.menu_manager.assigned_menu','Assigned Menu','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3897,0,'en','strings','backend.menu_manager.edit','Edit','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3898,0,'en','strings','backend.menu_manager.select_all','Select All','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3899,0,'en','strings','backend.general.are_you_sure','Are you sure you want to do this?','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3900,0,'en','strings','backend.general.app_back_to_list','Back to list','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3901,0,'en','strings','backend.general.app_save','Save','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3902,0,'en','strings','backend.general.actions','Actions','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3903,0,'en','strings','backend.general.app_update','Update','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3904,0,'en','strings','backend.general.app_restore','Restore','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3905,0,'en','strings','backend.general.app_permadel','Permanently Delete','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3906,0,'en','strings','backend.general.all_rights_reserved','All Rights Reserved.','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3907,0,'en','strings','backend.general.app_add','Add','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3908,0,'en','strings','backend.general.app_create','Create','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3909,0,'en','strings','backend.general.app_edit','Edit','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3910,0,'en','strings','backend.general.app_view','View','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3911,0,'en','strings','backend.general.app_list','List','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3912,0,'en','strings','backend.general.app_no_entries_in_table','No entries in table','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3913,0,'en','strings','backend.general.custom_controller_index','Custom controller index.','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3914,0,'en','strings','backend.general.app_logout','Logout','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3915,0,'en','strings','backend.general.app_add_new','Add new','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3916,0,'en','strings','backend.general.app_are_you_sure','Are you sure?','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3917,0,'en','strings','backend.general.app_dashboard','Dashboard','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3918,0,'en','strings','backend.general.app_delete','Delete','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3919,0,'en','strings','backend.general.all','All','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3920,0,'en','strings','backend.general.trashed','Trashed','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3921,0,'en','strings','backend.general.boilerplate_link','JThemes Studio','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3922,0,'en','strings','backend.general.continue','Continue','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3923,0,'en','strings','backend.general.member_since','Member since','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3924,0,'en','strings','backend.general.minutes',' minutes','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3925,0,'en','strings','backend.general.search_placeholder','Search...','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3926,0,'en','strings','backend.general.timeout','You were automatically logged out for security reasons since you had no activity in ','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3927,0,'en','strings','backend.general.see_all.messages','See all messages','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3928,0,'en','strings','backend.general.see_all.notifications','View all','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3929,0,'en','strings','backend.general.see_all.tasks','View all tasks','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3930,0,'en','strings','backend.general.status.online','Online','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3931,0,'en','strings','backend.general.status.offline','Offline','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3932,0,'en','strings','backend.general.you_have.messages','{0} You don\'t have messages|{1} You have 1 message|[2,Inf] You have :number messages','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3933,0,'en','strings','backend.general.you_have.notifications','{0} You don\'t have notifications|{1} You have 1 notification|[2,Inf] You have :number notifications','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3934,0,'en','strings','backend.general.you_have.tasks','{0} You don\'t have tasks|{1} You have 1 task|[2,Inf] You have :number tasks','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3935,0,'en','strings','backend.access.users.if_confirmed_off','(If confirmed is off)','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3936,0,'en','strings','backend.access.users.delete_user_confirm','Are you sure you want to delete this user permanently? Anywhere in the application that references this user\'s id will most likely error. Proceed at your own risk. This can not be un-done.','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3937,0,'en','strings','backend.access.users.no_deactivated','There are no deactivated users.','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3938,0,'en','strings','backend.access.users.no_deleted','There are no deleted users.','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3939,0,'en','strings','backend.access.users.restore_user_confirm','Restore this user to its original state?','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3940,0,'en','strings','backend.dashboard.title','Dashboard','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3941,0,'en','strings','backend.dashboard.welcome','Welcome','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3942,0,'en','strings','backend.dashboard.my_courses','My Courses','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3943,0,'en','strings','backend.search.empty','Please enter a search term.','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3944,0,'en','strings','backend.search.incomplete','You must write your own search logic for this system.','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3945,0,'en','strings','backend.search.title','Search Results','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3946,0,'en','strings','backend.search.results','Search Results for :query','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3947,0,'en','strings','backend.welcome','Welcome to the Dashboard','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3948,0,'en','strings','emails.contact.subject','A new :app_name contact form submission!','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3949,0,'en','strings','emails.contact.email_body_title','You have a new contact form request: Below are the details:','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3950,0,'en','strings','emails.auth.account_confirmed','Your account has been confirmed.','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3951,0,'en','strings','emails.auth.thank_you_for_using_app','Thank you for using our application!','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3952,0,'en','strings','emails.auth.click_to_confirm','Click here to confirm your account:','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3953,0,'en','strings','emails.auth.password_reset_subject','Reset Password','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3954,0,'en','strings','emails.auth.password_cause_of_email','You are receiving this email because we received a password reset request for your account.','2020-02-27 05:34:21','2020-04-16 04:24:06'),
(3955,0,'en','strings','emails.auth.password_if_not_requested','If you did not request a password reset, no further action is required.','2020-02-27 05:34:22','2020-04-16 04:24:06'),
(3956,0,'en','strings','emails.auth.error','Whoops!','2020-02-27 05:34:22','2020-04-16 04:24:06'),
(3957,0,'en','strings','emails.auth.greeting','Hello!','2020-02-27 05:34:22','2020-04-16 04:24:06'),
(3958,0,'en','strings','emails.auth.regards','Regards,','2020-02-27 05:34:22','2020-04-16 04:24:06'),
(3959,0,'en','strings','emails.auth.trouble_clicking_button','If you’re having trouble clicking the \":action_text\" button, copy and paste the URL below into your web browser:','2020-02-27 05:34:22','2020-04-16 04:24:06'),
(3960,0,'en','strings','emails.auth.reset_password','Click here to reset your password','2020-02-27 05:34:22','2020-04-16 04:24:06'),
(3961,0,'en','strings','emails.offline_order.subject','Regarding your recent order on :app_name','2020-02-27 05:34:22','2020-04-16 04:24:06'),
(3962,0,'en','validation','required','The :attribute field is required.','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3963,0,'en','validation','attributes.frontend.old_password','Old Password','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3964,0,'en','validation','attributes.frontend.male','Male','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3965,0,'en','validation','attributes.frontend.female','Female','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3966,0,'en','validation','attributes.frontend.other','Other','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3967,0,'en','validation','attributes.frontend.password','Password','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3968,0,'en','validation','attributes.frontend.password_confirmation','Password Confirmation','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3969,0,'en','validation','attributes.frontend.avatar','Avatar Location','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3970,0,'en','validation','attributes.frontend.first_name','First Name','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3971,0,'en','validation','attributes.frontend.last_name','Last Name','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3972,0,'en','validation','attributes.frontend.email','E-mail Address','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3973,0,'en','validation','attributes.frontend.name','Full Name','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3974,0,'en','validation','attributes.frontend.phone','Phone','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3975,0,'en','validation','attributes.frontend.message','Message','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3976,0,'en','validation','attributes.frontend.new_password','New Password','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3977,0,'en','validation','attributes.frontend.new_password_confirmation','New Password Confirmation','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3978,0,'en','validation','attributes.frontend.timezone','Timezone','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3979,0,'en','validation','attributes.frontend.language','Language','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3980,0,'en','validation','attributes.frontend.gravatar','Gravatar','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3981,0,'en','validation','attributes.frontend.upload','Upload','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3982,0,'en','validation','attributes.frontend.captcha','Captcha required','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3983,0,'en','validation','attributes.backend.access.roles.name','Name','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3984,0,'en','validation','attributes.backend.access.roles.associated_permissions','Associated Permissions','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3985,0,'en','validation','attributes.backend.access.roles.sort','Sort','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3986,0,'en','validation','attributes.backend.access.users.password','Password','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3987,0,'en','validation','attributes.backend.access.users.password_confirmation','Password Confirmation','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3988,0,'en','validation','attributes.backend.access.users.first_name','First Name','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3989,0,'en','validation','attributes.backend.access.users.last_name','Last Name','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3990,0,'en','validation','attributes.backend.access.users.email','E-mail Address','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3991,0,'en','validation','attributes.backend.access.users.active','Active','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3992,0,'en','validation','attributes.backend.access.users.confirmed','Confirmed','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3993,0,'en','validation','attributes.backend.access.users.send_confirmation_email','Send Confirmation E-mail','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3994,0,'en','validation','attributes.backend.access.users.associated_roles','Associated Roles','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3995,0,'en','validation','attributes.backend.access.users.name','Name','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3996,0,'en','validation','attributes.backend.access.users.other_permissions','Other Permissions','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3997,0,'en','validation','attributes.backend.access.users.timezone','Timezone','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3998,0,'en','validation','attributes.backend.access.users.language','Language','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(3999,0,'en','validation','attributes.backend.access.permissions.associated_roles','Associated Roles','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4000,0,'en','validation','attributes.backend.access.permissions.dependencies','Dependencies','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4001,0,'en','validation','attributes.backend.access.permissions.display_name','Display Name','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4002,0,'en','validation','attributes.backend.access.permissions.group','Group','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4003,0,'en','validation','attributes.backend.access.permissions.group_sort','Group Sort','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4004,0,'en','validation','attributes.backend.access.permissions.groups.name','Group Name','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4005,0,'en','validation','attributes.backend.access.permissions.name','Name','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4006,0,'en','validation','attributes.backend.access.permissions.first_name','First Name','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4007,0,'en','validation','attributes.backend.access.permissions.last_name','Last Name','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4008,0,'en','validation','attributes.backend.access.permissions.system','System','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4009,0,'en','validation','attributes.backend.settings.social_settings.facebook.label','Facebook Login Status','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4010,0,'en','validation','attributes.backend.settings.social_settings.facebook.client_id','Client ID','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4011,0,'en','validation','attributes.backend.settings.social_settings.facebook.client_secret','Client Secret','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4012,0,'en','validation','attributes.backend.settings.social_settings.facebook.redirect','Redirect URL','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4013,0,'en','validation','attributes.backend.settings.social_settings.google.label','Google Login Status','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4014,0,'en','validation','attributes.backend.settings.social_settings.google.client_id','Client ID','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4015,0,'en','validation','attributes.backend.settings.social_settings.google.client_secret','Client Secret','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4016,0,'en','validation','attributes.backend.settings.social_settings.google.redirect','Redirect URL','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4017,0,'en','validation','attributes.backend.settings.social_settings.twitter.label','Twitter Login Status','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4018,0,'en','validation','attributes.backend.settings.social_settings.twitter.client_id','Client ID','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4019,0,'en','validation','attributes.backend.settings.social_settings.twitter.client_secret','Client Secret','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4020,0,'en','validation','attributes.backend.settings.social_settings.twitter.redirect','Redirect URL','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4021,0,'en','validation','attributes.backend.settings.social_settings.linkedin.label','LinkedIn Login Status','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4022,0,'en','validation','attributes.backend.settings.social_settings.linkedin.client_id','Client ID','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4023,0,'en','validation','attributes.backend.settings.social_settings.linkedin.client_secret','Client Secret','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4024,0,'en','validation','attributes.backend.settings.social_settings.linkedin.redirect','Redirect URL','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4025,0,'en','validation','attributes.backend.settings.social_settings.github.label','Github Login Status','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4026,0,'en','validation','attributes.backend.settings.social_settings.github.client_id','Client ID','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4027,0,'en','validation','attributes.backend.settings.social_settings.github.client_secret','Client Secret','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4028,0,'en','validation','attributes.backend.settings.social_settings.github.redirect','Redirect URL','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4029,0,'en','validation','attributes.backend.settings.social_settings.bitbucket.label','Bitbucket Login Status','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4030,0,'en','validation','attributes.backend.settings.social_settings.bitbucket.client_id','Client ID','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4031,0,'en','validation','attributes.backend.settings.social_settings.bitbucket.client_secret','Client Secret','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4032,0,'en','validation','attributes.backend.settings.social_settings.bitbucket.redirect','Redirect URL','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4033,0,'en','validation','attributes.backend.settings.general_settings.app_name','App Name','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4034,0,'en','validation','attributes.backend.settings.general_settings.app_url','App URL','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4035,0,'en','validation','attributes.backend.settings.general_settings.app_locale','App Locale','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4036,0,'en','validation','attributes.backend.settings.general_settings.app_timezone','App Timezone','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4037,0,'en','validation','attributes.backend.settings.general_settings.mail_driver','Mail Driver','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4038,0,'en','validation','attributes.backend.settings.general_settings.mail_host','Mail Host','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4039,0,'en','validation','attributes.backend.settings.general_settings.mail_port','Mail Port','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4040,0,'en','validation','attributes.backend.settings.general_settings.mail_from_name','Mail From Name','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4041,0,'en','validation','attributes.backend.settings.general_settings.lesson_timer','Lesson Timer','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4042,0,'en','validation','attributes.backend.settings.general_settings.mail_from_address','Mail From Address','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4043,0,'en','validation','attributes.backend.settings.general_settings.mail_username','Mail Username','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4044,0,'en','validation','attributes.backend.settings.general_settings.mail_password','Mail Password','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4045,0,'en','validation','attributes.backend.settings.general_settings.enable_registration','Enable Registration','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4046,0,'en','validation','attributes.backend.settings.general_settings.change_email','Change Email','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4047,0,'en','validation','attributes.backend.settings.general_settings.password_history','Password History','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4048,0,'en','validation','attributes.backend.settings.general_settings.password_expires_days','Password Expires Days','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4049,0,'en','validation','attributes.backend.settings.general_settings.requires_approval','Requires Approval','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4050,0,'en','validation','attributes.backend.settings.general_settings.confirm_email','Confirm Email','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4051,0,'en','validation','attributes.backend.settings.general_settings.homepage','Select Homepage','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4052,0,'en','validation','attributes.backend.settings.general_settings.captcha_status','Captcha Status','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4053,0,'en','validation','attributes.backend.settings.general_settings.captcha_site_key','Captcha Key','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4054,0,'en','validation','attributes.backend.settings.general_settings.captcha_site_secret','Captcha Secret','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4055,0,'en','validation','attributes.backend.settings.general_settings.google_analytics','Google Analytics Code','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4056,0,'en','validation','attributes.backend.settings.general_settings.theme_layout','Theme Layout','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4057,0,'en','validation','attributes.backend.settings.general_settings.font_color','Font Color','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4058,0,'en','validation','attributes.backend.settings.general_settings.layout_type','Layout Type','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4059,0,'en','validation','attributes.backend.settings.general_settings.retest_status','Re-Test','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4060,0,'en','validation','attributes.backend.settings.general_settings.show_offers','Show Offers Page','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4061,0,'en','validation','attributes.backend.settings.general_settings.one_signal_push_notification','OneSignal Setup','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4062,0,'en','validation','attributes.backend.settings.general_settings.onesignal_code','Paste OneSignal script code here','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4063,0,'en','validation','accepted','The :attribute must be accepted.','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4064,0,'en','validation','active_url','The :attribute is not a valid URL.','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4065,0,'en','validation','after','The :attribute must be a date after :date.','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4066,0,'en','validation','after_or_equal','The :attribute must be a date after or equal to :date.','2020-02-27 05:34:22','2020-04-16 09:36:35'),
(4067,0,'en','validation','alpha','The :attribute may only contain letters.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4068,0,'en','validation','alpha_dash','The :attribute may only contain letters, numbers, dashes and underscores.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4069,0,'en','validation','alpha_num','The :attribute may only contain letters and numbers.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4070,0,'en','validation','array','The :attribute must be an array.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4071,0,'en','validation','before','The :attribute must be a date before :date.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4072,0,'en','validation','before_or_equal','The :attribute must be a date before or equal to :date.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4073,0,'en','validation','between.numeric','The :attribute must be between :min and :max.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4074,0,'en','validation','between.file','The :attribute must be between :min and :max kilobytes.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4075,0,'en','validation','between.string','The :attribute must be between :min and :max characters.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4076,0,'en','validation','between.array','The :attribute must have between :min and :max items.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4077,0,'en','validation','boolean','The :attribute field must be true or false.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4078,0,'en','validation','confirmed','The :attribute confirmation does not match.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4079,0,'en','validation','date','The :attribute is not a valid date.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4080,0,'en','validation','date_format','The :attribute does not match the format :format.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4081,0,'en','validation','different','The :attribute and :other must be different.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4082,0,'en','validation','digits','The :attribute must be :digits digits.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4083,0,'en','validation','digits_between','The :attribute must be between :min and :max digits.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4084,0,'en','validation','dimensions','The :attribute has invalid image dimensions.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4085,0,'en','validation','distinct','The :attribute field has a duplicate value.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4086,0,'en','validation','email','The :attribute must be a valid email address.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4087,0,'en','validation','exists','The selected :attribute is invalid.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4088,0,'en','validation','file','The :attribute must be a file.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4089,0,'en','validation','filled','The :attribute field must have a value.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4090,0,'en','validation','gt.numeric','The :attribute must be greater than :value.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4091,0,'en','validation','gt.file','The :attribute must be greater than :value kilobytes.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4092,0,'en','validation','gt.string','The :attribute must be greater than :value characters.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4093,0,'en','validation','gt.array','The :attribute must have more than :value items.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4094,0,'en','validation','gte.numeric','The :attribute must be greater than or equal :value.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4095,0,'en','validation','gte.file','The :attribute must be greater than or equal :value kilobytes.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4096,0,'en','validation','gte.string','The :attribute must be greater than or equal :value characters.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4097,0,'en','validation','gte.array','The :attribute must have :value items or more.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4098,0,'en','validation','image','The :attribute must be an image.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4099,0,'en','validation','in','The selected :attribute is invalid.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4100,0,'en','validation','in_array','The :attribute field does not exist in :other.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4101,0,'en','validation','integer','The :attribute must be an integer.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4102,0,'en','validation','ip','The :attribute must be a valid IP address.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4103,0,'en','validation','ipv4','The :attribute must be a valid IPv4 address.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4104,0,'en','validation','ipv6','The :attribute must be a valid IPv6 address.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4105,0,'en','validation','json','The :attribute must be a valid JSON string.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4106,0,'en','validation','lt.numeric','The :attribute must be less than :value.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4107,0,'en','validation','lt.file','The :attribute must be less than :value kilobytes.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4108,0,'en','validation','lt.string','The :attribute must be less than :value characters.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4109,0,'en','validation','lt.array','The :attribute must have less than :value items.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4110,0,'en','validation','lte.numeric','The :attribute must be less than or equal :value.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4111,0,'en','validation','lte.file','The :attribute must be less than or equal :value kilobytes.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4112,0,'en','validation','lte.string','The :attribute must be less than or equal :value characters.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4113,0,'en','validation','lte.array','The :attribute must not have more than :value items.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4114,0,'en','validation','max.numeric','The :attribute may not be greater than :max.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4115,0,'en','validation','max.file','The :attribute may not be greater than :max kilobytes.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4116,0,'en','validation','max.string','The :attribute may not be greater than :max characters.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4117,0,'en','validation','max.array','The :attribute may not have more than :max items.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4118,0,'en','validation','mimes','The :attribute must be a file of type: :values.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4119,0,'en','validation','mimetypes','The :attribute must be a file of type: :values.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4120,0,'en','validation','min.numeric','The :attribute must be at least :min.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4121,0,'en','validation','min.file','The :attribute must be at least :min kilobytes.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4122,0,'en','validation','min.string','The :attribute must be at least :min characters.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4123,0,'en','validation','min.array','The :attribute must have at least :min items.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4124,0,'en','validation','not_in','The selected :attribute is invalid.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4125,0,'en','validation','not_regex','The :attribute format is invalid.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4126,0,'en','validation','numeric','The :attribute must be a number.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4127,0,'en','validation','present','The :attribute field must be present.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4128,0,'en','validation','regex','The :attribute format is invalid.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4129,0,'en','validation','required_if','The :attribute field is required when :other is :value.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4130,0,'en','validation','required_unless','The :attribute field is required unless :other is in :values.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4131,0,'en','validation','required_with','The :attribute field is required when :values is present.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4132,0,'en','validation','required_with_all','The :attribute field is required when :values are present.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4133,0,'en','validation','required_without','The :attribute field is required when :values is not present.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4134,0,'en','validation','required_without_all','The :attribute field is required when none of :values are present.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4135,0,'en','validation','same','The :attribute and :other must match.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4136,0,'en','validation','size.numeric','The :attribute must be :size.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4137,0,'en','validation','size.file','The :attribute must be :size kilobytes.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4138,0,'en','validation','size.string','The :attribute must be :size characters.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4139,0,'en','validation','size.array','The :attribute must contain :size items.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4140,0,'en','validation','string','The :attribute must be a string.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4141,0,'en','validation','timezone','The :attribute must be a valid zone.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4142,0,'en','validation','unique','The :attribute has already been taken.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4143,0,'en','validation','uploaded','The :attribute failed to upload.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4144,0,'en','validation','url','The :attribute format is invalid.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4145,0,'en','validation','uuid','The :attribute must be a valid UUID.','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(4146,0,'en','validation','custom.attribute-name.rule-name','custom-message','2020-02-27 05:34:23','2020-04-16 09:36:35'),
(8269,1,'ar','vendor/backup','exception_message','رسالة استثناء: :message','2020-02-27 05:35:19','2020-02-27 05:35:19'),
(8270,1,'ar','vendor/backup','exception_trace','تتبع الاستثناء: :trace','2020-02-27 05:35:19','2020-02-27 05:35:19'),
(8271,1,'ar','vendor/backup','exception_message_title','رسالة استثناء','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8272,1,'ar','vendor/backup','exception_trace_title','تتبع استثناء','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8273,1,'ar','vendor/backup','backup_failed_subject','فشل النسخ الاحتياطي من application_name:','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8274,1,'ar','vendor/backup','backup_failed_body','Important: حدث خطأ أثناء النسخ الاحتياطي :application_name','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8275,1,'ar','vendor/backup','backup_successful_subject','نسخة احتياطية جديدة ناجحة من :application_name','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8276,1,'ar','vendor/backup','backup_successful_subject_title','نسخة احتياطية جديدة ناجحة!','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8277,1,'ar','vendor/backup','backup_successful_body','خبر رائع ، تم إنشاء نسخة احتياطية جديدة من application_name: بنجاح على القرص المسمى disk_name:.','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8278,1,'ar','vendor/backup','cleanup_failed_subject','فشل تنظيف النسخ الاحتياطية لـ :application_name.','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8279,1,'ar','vendor/backup','cleanup_failed_body','حدث خطأ أثناء تنظيف النسخ الاحتياطية لـ :application_name','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8280,1,'ar','vendor/backup','cleanup_successful_subject','تنظيف: النسخ الاحتياطية :application_name ناجحة','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8281,1,'ar','vendor/backup','cleanup_successful_subject_title','تنظيف النسخ الاحتياطية الناجحة!','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8282,1,'ar','vendor/backup','cleanup_successful_body','تم تنظيف النسخ الاحتياطية لـ :application_name على القرص المسمى :disk_name.','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8283,1,'ar','vendor/backup','healthy_backup_found_subject','النسخ الاحتياطية لـ :application_name على القرص :disk_name سليمة','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8284,1,'ar','vendor/backup','healthy_backup_found_subject_title','النسخ الاحتياطية لـ :application_name صحية','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8285,1,'ar','vendor/backup','healthy_backup_found_body','تعتبر النسخ الاحتياطية لـ :application_name صحية. عمل جيد!','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8286,1,'ar','vendor/backup','unhealthy_backup_found_subject','هام: النسخ الاحتياطية لـ :application_name غير صحية','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8287,1,'ar','vendor/backup','unhealthy_backup_found_subject_title','Important: النسخ الاحتياطية لـ :application_name غير صحية. : problem','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8288,1,'ar','vendor/backup','unhealthy_backup_found_body','النسخ الاحتياطية لـ :application_name على القرص :disk_name غير صحية.','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8289,1,'ar','vendor/backup','unhealthy_backup_found_not_reachable','لا يمكن الوصول إلى وجهة النسخ الاحتياطي. :error','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8290,1,'ar','vendor/backup','unhealthy_backup_found_empty','لا توجد نسخ احتياطية لهذا التطبيق على الإطلاق.','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8291,1,'ar','vendor/backup','unhealthy_backup_found_old','أحدث نسخة احتياطية صنعت في :date تعتبر قديمة جدًا.','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8292,1,'ar','vendor/backup','unhealthy_backup_found_unknown','آسف ، لا يمكن تحديد السبب الدقيق.','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8293,1,'ar','vendor/backup','unhealthy_backup_found_full','النسخ الاحتياطية تستخدم الكثير من التخزين. الاستخدام الحالي هو :disk_usage وهو أعلى من الحد المسموح به وهو :disk_limit.','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8294,1,'en','vendor/backup','exception_message','Exception message: :message','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8295,1,'en','vendor/backup','exception_trace','Exception trace: :trace','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8296,1,'en','vendor/backup','exception_message_title','Exception message','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8297,1,'en','vendor/backup','exception_trace_title','Exception trace','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8298,1,'en','vendor/backup','backup_failed_subject','Failed backup of :application_name','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8299,1,'en','vendor/backup','backup_failed_body','Important: An error occurred while backing up :application_name','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8300,1,'en','vendor/backup','backup_successful_subject','Successful new backup of :application_name','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8301,1,'en','vendor/backup','backup_successful_subject_title','Successful new backup!','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8302,1,'en','vendor/backup','backup_successful_body','Great news, a new backup of :application_name was successfully created on the disk named :disk_name.','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8303,1,'en','vendor/backup','cleanup_failed_subject','Cleaning up the backups of :application_name failed.','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8304,1,'en','vendor/backup','cleanup_failed_body','An error occurred while cleaning up the backups of :application_name','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8305,1,'en','vendor/backup','cleanup_successful_subject','Clean up of :application_name backups successful','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8306,1,'en','vendor/backup','cleanup_successful_subject_title','Clean up of backups successful!','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8307,1,'en','vendor/backup','cleanup_successful_body','The clean up of the :application_name backups on the disk named :disk_name was successful.','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8308,1,'en','vendor/backup','healthy_backup_found_subject','The backups for :application_name on disk :disk_name are healthy','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8309,1,'en','vendor/backup','healthy_backup_found_subject_title','The backups for :application_name are healthy','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8310,1,'en','vendor/backup','healthy_backup_found_body','The backups for :application_name are considered healthy. Good job!','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8311,1,'en','vendor/backup','unhealthy_backup_found_subject','Important: The backups for :application_name are unhealthy','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8312,1,'en','vendor/backup','unhealthy_backup_found_subject_title','Important: The backups for :application_name are unhealthy. :problem','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8313,1,'en','vendor/backup','unhealthy_backup_found_body','The backups for :application_name on disk :disk_name are unhealthy.','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8314,1,'en','vendor/backup','unhealthy_backup_found_not_reachable','The backup destination cannot be reached. :error','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8315,1,'en','vendor/backup','unhealthy_backup_found_empty','There are no backups of this application at all.','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8316,1,'en','vendor/backup','unhealthy_backup_found_old','The latest backup made on :date is considered too old.','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8317,1,'en','vendor/backup','unhealthy_backup_found_unknown','Sorry, an exact reason cannot be determined.','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8318,1,'en','vendor/backup','unhealthy_backup_found_full','The backups are using too much storage. Current usage is :disk_usage which is higher than the allowed limit of :disk_limit.','2020-02-27 05:35:20','2020-02-27 05:35:20'),
(8369,1,'ar','vendor/chatter','success.title','أحسنت!','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8370,1,'ar','vendor/chatter','success.reason.submitted_to_post','تم تقديم الرد بنجاح للمناقشة. discussion','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8371,1,'ar','vendor/chatter','success.reason.updated_post','Discussion تم تحديث المناقشة بنجاح.','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8372,1,'ar','vendor/chatter','success.reason.destroy_post','تم حذف الرد والمناقشة بنجاح. discussion','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8373,1,'ar','vendor/chatter','success.reason.destroy_from_discussion','تم حذف الرد بنجاح من المناقشة. discussion','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8374,1,'ar','vendor/chatter','success.reason.created_discussion','تم إنشاء مناقشة جديدة بنجاح. discussion','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8375,1,'ar','vendor/chatter','info.title','انتباه!','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8376,1,'ar','vendor/chatter','warning.title','ووه أوه!','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8377,1,'ar','vendor/chatter','danger.title','يا سناب!','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8378,1,'ar','vendor/chatter','danger.reason.errors','يرجى تصحيح الأخطاء التالية:','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8379,1,'ar','vendor/chatter','danger.reason.prevent_spam','لمنع البريد العشوائي ، يرجى السماح على الأقل :minutes بين إرسال المحتوى.','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8380,1,'ar','vendor/chatter','danger.reason.trouble','عذرًا ، يبدو أنه كانت هناك مشكلة في إرسال ردك.','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8381,1,'ar','vendor/chatter','danger.reason.update_post','آه آه آه ... لا يمكن تحديث ردكم. تأكد من أنك لا تفعل أي شيء شادي.','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8382,1,'ar','vendor/chatter','danger.reason.destroy_post','آه آه آه ... لا يمكن حذف الرد. تأكد من أنك لا تفعل أي شيء شادي.','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8383,1,'ar','vendor/chatter','danger.reason.create_discussion','عفوًا :( يبدو أن هناك مشكلة في إنشاء مناقشتك. discussion. :(','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8384,1,'ar','vendor/chatter','danger.reason.title_required','يرجى كتابة العنوان','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8385,1,'ar','vendor/chatter','danger.reason.title_min','يجب أن يكون العنوان على الأقل: أحرف :min.','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8386,1,'ar','vendor/chatter','danger.reason.title_max','يجب ألا يزيد العنوان عن: أحرف :max.','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8387,1,'ar','vendor/chatter','danger.reason.content_required','يرجى كتابة بعض المحتوى','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8388,1,'ar','vendor/chatter','danger.reason.content_min','يجب أن يحتوي المحتوى على الأقل: أحرف :min','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8389,1,'ar','vendor/chatter','danger.reason.category_required','يرجى اختيار فئة','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8390,1,'ar','vendor/chatter','preheader','أردت فقط أن أخبرك أن شخصًا ما قد استجاب لنشر منتدى.','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8391,1,'ar','vendor/chatter','greeting','مرحبا،,','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8392,1,'ar','vendor/chatter','body','أردت فقط أن أخبركم بأن شخصًا ما قد استجاب لنشر منتدى في discussion','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8393,1,'ar','vendor/chatter','view_discussion','عرض المناقشة. discussion','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8394,1,'ar','vendor/chatter','farewell','أتمنى لك يوما عظيما!.','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8395,1,'ar','vendor/chatter','unsuscribe.message','إذا لم تعد ترغب في أن يتم إعلامك عندما يستجيب شخص ما لهذا المنشور ، فتأكد من إلغاء تحديد إعداد الإشعارات في أسفل الصفحة :)','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8396,1,'ar','vendor/chatter','unsuscribe.action','لا أحب هذه رسائل البريد الإلكتروني؟','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8397,1,'ar','vendor/chatter','unsuscribe.link','إلغاء الاشتراك في هذه المناقشة. discussion','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8398,1,'ar','vendor/chatter','titles.discussion','نقاش','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8399,1,'ar','vendor/chatter','titles.discussions','مناقشات','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8400,1,'ar','vendor/chatter','headline','مرحبا بكم في الثرثرة','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8401,1,'ar','vendor/chatter','description','حزمة منتدى بسيطة لتطبيق Laravel الخاص بك.','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8402,1,'ar','vendor/chatter','words.cancel','إلغاء','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8403,1,'ar','vendor/chatter','words.delete','حذف','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8404,1,'ar','vendor/chatter','words.edit','تصحيح','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8405,1,'ar','vendor/chatter','words.yes','نعم فعلا','2020-02-27 05:35:21','2020-02-27 05:35:21'),
(8406,1,'ar','vendor/chatter','words.no','لا','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8407,1,'ar','vendor/chatter','words.minutes','1 دقيقة | :count دقيقة','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8408,1,'ar','vendor/chatter','discussion.new','مناقشة جديدة discussion','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8409,1,'ar','vendor/chatter','discussion.all','كل مناقشة discussions','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8410,1,'ar','vendor/chatter','discussion.create','إنشاء مناقشة discussion','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8411,1,'ar','vendor/chatter','discussion.posted_by','منشور من طرف','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8412,1,'ar','vendor/chatter','discussion.head_details','نشر في الفئة','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8413,1,'ar','vendor/chatter','response.confirm','هل أنت متأكد أنك تريد حذف هذا الرد؟','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8414,1,'ar','vendor/chatter','response.yes_confirm','نعم احذفها','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8415,1,'ar','vendor/chatter','response.no_confirm','لا شكرا','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8416,1,'ar','vendor/chatter','response.submit','إرسال الرد','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8417,1,'ar','vendor/chatter','response.update','تحديث الرد','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8418,1,'ar','vendor/chatter','editor.title','عنوان المناقشةdiscussion','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8419,1,'ar','vendor/chatter','editor.select','اختر تصنيف','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8420,1,'ar','vendor/chatter','editor.tinymce_placeholder','اكتب محادثتك هنا ... discussion','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8421,1,'ar','vendor/chatter','editor.select_color_text','اختر لونًا لهذه المناقشة (اختياري) discussion','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8422,1,'ar','vendor/chatter','email.notify','أعلمني عندما يرد شخص ما discussion','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8423,1,'ar','vendor/chatter','auth','يرجى <a href=\"/:home/login\"> تسجيل الدخول </a>\n                أو <a href=\"/:home/register\"> التسجيل </a>\n                لترك الرد.','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8424,1,'en','vendor/chatter','success.title','Well done!','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8425,1,'en','vendor/chatter','success.reason.submitted_to_post','Response successfully submitted to discussion.','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8426,1,'en','vendor/chatter','success.reason.updated_post','Successfully updated the discussion.','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8427,1,'en','vendor/chatter','success.reason.destroy_post','Successfully deleted the response and discussion.','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8428,1,'en','vendor/chatter','success.reason.destroy_from_discussion','Successfully deleted the response from the discussion.','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8429,1,'en','vendor/chatter','success.reason.created_discussion','Successfully created a new discussion.','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8430,1,'en','vendor/chatter','info.title','Heads Up!','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8431,1,'en','vendor/chatter','warning.title','Wuh Oh!','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8432,1,'en','vendor/chatter','danger.title','Oh Snap!','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8433,1,'en','vendor/chatter','danger.reason.errors','Please fix the following errors:','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8434,1,'en','vendor/chatter','danger.reason.prevent_spam','In order to prevent spam, please allow at least :minutes in between submitting content.','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8435,1,'en','vendor/chatter','danger.reason.trouble','Sorry, there seems to have been a problem submitting your response.','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8436,1,'en','vendor/chatter','danger.reason.update_post','Nah ah ah... Could not update your response. Make sure you\'re not doing anything shady.','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8437,1,'en','vendor/chatter','danger.reason.destroy_post','Nah ah ah... Could not delete the response. Make sure you\'re not doing anything shady.','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8438,1,'en','vendor/chatter','danger.reason.create_discussion','Whoops :( There seems to be a problem creating your discussion.','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8439,1,'en','vendor/chatter','danger.reason.title_required','Please write a title','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8440,1,'en','vendor/chatter','danger.reason.title_min','The title has to have at least :min characters.','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8441,1,'en','vendor/chatter','danger.reason.title_max','The title has to have no more than :max characters.','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8442,1,'en','vendor/chatter','danger.reason.content_required','Please write some content','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8443,1,'en','vendor/chatter','danger.reason.content_min','The content has to have at least :min characters','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8444,1,'en','vendor/chatter','danger.reason.category_required','Please choose a category','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8445,1,'en','vendor/chatter','preheader','Just wanted to let you know that someone has responded to a forum post.','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8446,1,'en','vendor/chatter','greeting','Hi there,','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8447,1,'en','vendor/chatter','body','Just wanted to let you know that someone has responded to a forum post at','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8448,1,'en','vendor/chatter','view_discussion','View the discussion.','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8449,1,'en','vendor/chatter','farewell','Have a great day!','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8450,1,'en','vendor/chatter','unsuscribe.message','If you no longer wish to be notified when someone responds to this form post be sure to uncheck the notification setting at the bottom of the page :)','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8451,1,'en','vendor/chatter','unsuscribe.action','Don\'t like these emails?','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8452,1,'en','vendor/chatter','unsuscribe.link','Unsubscribe to this discussion.','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8453,1,'en','vendor/chatter','titles.discussion','Discussion','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8454,1,'en','vendor/chatter','titles.discussions','Discussions','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8455,1,'en','vendor/chatter','headline','Welcome to Chatter','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8456,1,'en','vendor/chatter','description','A simple forum package for your Laravel app.','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8457,1,'en','vendor/chatter','words.cancel','Cancel','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8458,1,'en','vendor/chatter','words.delete','Delete','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8459,1,'en','vendor/chatter','words.edit','Edit','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8460,1,'en','vendor/chatter','words.yes','Yes','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8461,1,'en','vendor/chatter','words.no','No','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8462,1,'en','vendor/chatter','words.minutes','1 minute| :count minutes','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8463,1,'en','vendor/chatter','discussion.new','New Discussion','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8464,1,'en','vendor/chatter','discussion.all','All Discussion','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8465,1,'en','vendor/chatter','discussion.create','Create Discussion','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8466,1,'en','vendor/chatter','discussion.posted_by','Posted by','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8467,1,'en','vendor/chatter','discussion.head_details','Posted in Category','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8468,1,'en','vendor/chatter','response.confirm','Are you sure you want to delete this response?','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8469,1,'en','vendor/chatter','response.yes_confirm','Yes Delete It','2020-02-27 05:35:22','2020-02-27 05:35:22'),
(8470,1,'en','vendor/chatter','response.no_confirm','No Thanks','2020-02-27 05:35:23','2020-02-27 05:35:23'),
(8471,1,'en','vendor/chatter','response.submit','Submit response','2020-02-27 05:35:23','2020-02-27 05:35:23'),
(8472,1,'en','vendor/chatter','response.update','Update Response','2020-02-27 05:35:23','2020-02-27 05:35:23'),
(8473,1,'en','vendor/chatter','editor.title','Title of Discussion','2020-02-27 05:35:23','2020-02-27 05:35:23'),
(8474,1,'en','vendor/chatter','editor.select','Select a Category','2020-02-27 05:35:23','2020-02-27 05:35:23'),
(8475,1,'en','vendor/chatter','editor.tinymce_placeholder','Type Your Discussion Here...','2020-02-27 05:35:23','2020-02-27 05:35:23'),
(8476,1,'en','vendor/chatter','editor.select_color_text','Select a Color for this Discussion (optional)','2020-02-27 05:35:23','2020-02-27 05:35:23'),
(8477,1,'en','vendor/chatter','email.notify','Notify me when someone replies','2020-02-27 05:35:23','2020-02-27 05:35:23'),
(8478,1,'en','vendor/chatter','auth','Please <a href=\"/:home/login\">login</a>\n                or <a href=\"/:home/register\">register</a>\n                to leave a response.','2020-02-27 05:35:23','2020-02-27 05:35:23'),
(8589,1,'ar','vendor/cookieConsent','message','هذا الموقع يستخدم ملفات تعريف الارتباط لتحسين تجربة الاستخدام','2020-02-27 05:35:25','2020-04-16 04:35:59'),
(8590,1,'ar','vendor/cookieConsent','agree','السماح لملفات الإرتباط','2020-02-27 05:35:25','2020-04-16 04:31:04'),
(8591,1,'en','vendor/cookieConsent','message','Your experience on this site will be improved by allowing cookies.','2020-02-27 05:35:25','2020-02-27 05:35:25'),
(8592,1,'en','vendor/cookieConsent','agree','Allow cookies','2020-02-27 05:35:25','2020-02-27 05:35:25'),
(8597,0,'ar','vendor/log-viewer','all','الكل','2020-02-27 05:35:25','2020-02-27 05:35:25'),
(8598,1,'ar','vendor/log-viewer','date','التاريخ','2020-02-27 05:35:25','2020-04-16 04:36:54'),
(8599,1,'ar','vendor/log-viewer','emergency','حالة طوارئ','2020-02-27 05:35:25','2020-02-27 05:35:25'),
(8600,1,'ar','vendor/log-viewer','alert','تحذير','2020-02-27 05:35:25','2020-04-16 04:36:35'),
(8601,1,'ar','vendor/log-viewer','critical','مهم','2020-02-27 05:35:25','2020-04-16 04:36:46'),
(8602,1,'ar','vendor/log-viewer','error','خطأ','2020-02-27 05:35:25','2020-02-27 05:35:25'),
(8603,1,'ar','vendor/log-viewer','warning','تحذير','2020-02-27 05:35:25','2020-02-27 05:35:25'),
(8604,1,'ar','vendor/log-viewer','notice','تنويه','2020-02-27 05:35:25','2020-02-27 05:35:25'),
(8605,1,'ar','vendor/log-viewer','info','معلومات','2020-02-27 05:35:25','2020-02-27 05:35:25'),
(8606,1,'ar','vendor/log-viewer','debug','التصحيح','2020-02-27 05:35:25','2020-02-27 05:35:25'),
(8607,0,'en','vendor/log-viewer','all','All','2020-02-27 05:35:25','2020-02-27 05:35:25'),
(8608,1,'en','vendor/log-viewer','date','Date','2020-02-27 05:35:25','2020-02-27 05:35:25'),
(8609,1,'en','vendor/log-viewer','emergency','Emergency','2020-02-27 05:35:25','2020-02-27 05:35:25'),
(8610,1,'en','vendor/log-viewer','alert','Alert','2020-02-27 05:35:25','2020-02-27 05:35:25'),
(8611,1,'en','vendor/log-viewer','critical','Critical','2020-02-27 05:35:25','2020-02-27 05:35:25'),
(8612,1,'en','vendor/log-viewer','error','Error','2020-02-27 05:35:25','2020-02-27 05:35:25'),
(8613,1,'en','vendor/log-viewer','warning','Warning','2020-02-27 05:35:25','2020-02-27 05:35:25'),
(8614,1,'en','vendor/log-viewer','notice','Notice','2020-02-27 05:35:25','2020-02-27 05:35:25'),
(8615,1,'en','vendor/log-viewer','info','Info','2020-02-27 05:35:25','2020-02-27 05:35:25'),
(8616,1,'en','vendor/log-viewer','debug','Debug','2020-02-27 05:35:26','2020-02-27 05:35:26'),
(8637,1,'ar','vendor/read-time','reads_left_to_right','1','2020-02-27 05:35:26','2020-02-27 05:35:26'),
(8638,1,'ar','vendor/read-time','min','دقيقة','2020-02-27 05:35:26','2020-02-27 05:35:26'),
(8639,1,'ar','vendor/read-time','minute','اللحظة','2020-02-27 05:35:26','2020-02-27 05:35:26'),
(8640,1,'ar','vendor/read-time','sec','ثانية','2020-02-27 05:35:26','2020-02-27 05:35:26'),
(8641,1,'ar','vendor/read-time','second','ثانيا','2020-02-27 05:35:26','2020-02-27 05:35:26'),
(8642,1,'ar','vendor/read-time','read','اقرأ','2020-02-27 05:35:26','2020-02-27 05:35:26'),
(8643,1,'en','vendor/read-time','reads_left_to_right','1','2020-02-27 05:35:26','2020-02-27 05:35:26'),
(8644,1,'en','vendor/read-time','min','min','2020-02-27 05:35:26','2020-02-27 05:35:26'),
(8645,1,'en','vendor/read-time','minute','minute','2020-02-27 05:35:26','2020-02-27 05:35:26'),
(8646,1,'en','vendor/read-time','sec','sec','2020-02-27 05:35:26','2020-02-27 05:35:26'),
(8647,1,'en','vendor/read-time','second','second','2020-02-27 05:35:26','2020-02-27 05:35:26'),
(8648,1,'en','vendor/read-time','read','read','2020-02-27 05:35:26','2020-02-27 05:35:26'),
(8661,1,'en','vendor/self-diagnosis','app_key_is_set.message','The application key is not set. Call \"php artisan key:generate\" to create and set one.','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8662,1,'en','vendor/self-diagnosis','app_key_is_set.name','App key is set','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8663,1,'en','vendor/self-diagnosis','composer_with_dev_dependencies_is_up_to_date.message','Your composer dependencies are not up to date. Call \"composer install\" to update them. :more','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8664,1,'en','vendor/self-diagnosis','composer_with_dev_dependencies_is_up_to_date.name','Composer dependencies (including dev) are up to date','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8665,1,'en','vendor/self-diagnosis','composer_without_dev_dependencies_is_up_to_date.message','Your composer dependencies are not up to date. Call \"composer install\" to update them. :more','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8666,1,'en','vendor/self-diagnosis','composer_without_dev_dependencies_is_up_to_date.name','Composer dependencies (without dev) are up to date','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8667,1,'en','vendor/self-diagnosis','configuration_is_cached.message','Your configuration should be cached in production for better performance. Call \"php artisan config:cache\" to create the configuration cache.','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8668,1,'en','vendor/self-diagnosis','configuration_is_cached.name','Configuration is cached','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8669,1,'en','vendor/self-diagnosis','configuration_is_not_cached.message','Your configuration files should not be cached during development. Call \"php artisan config:clear\" to clear the configuration cache.','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8670,1,'en','vendor/self-diagnosis','configuration_is_not_cached.name','Configuration is not cached','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8671,1,'en','vendor/self-diagnosis','correct_php_version_is_installed.message','You do not have the required PHP version installed.\nRequired: :required\nUsed: :used','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8672,1,'en','vendor/self-diagnosis','correct_php_version_is_installed.name','The correct PHP version is installed','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8673,1,'en','vendor/self-diagnosis','database_can_be_accessed.message','The database can not be accessed: :error','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8674,1,'en','vendor/self-diagnosis','database_can_be_accessed.name','The database can be accessed','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8675,1,'en','vendor/self-diagnosis','debug_mode_is_not_enabled.message','You should not use debug mode in production. Set \"APP_DEBUG\" in the .env file to \"false\".','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8676,1,'en','vendor/self-diagnosis','debug_mode_is_not_enabled.name','Debug mode is not enabled','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8677,1,'en','vendor/self-diagnosis','directories_have_correct_permissions.message','The following directories are not writable:\n:directories','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8678,1,'en','vendor/self-diagnosis','directories_have_correct_permissions.name','All directories have the correct permissions','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8679,1,'en','vendor/self-diagnosis','env_file_exists.message','The .env file does not exist. Please copy your .env.example file as .env and adjust accordingly.','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8680,1,'en','vendor/self-diagnosis','env_file_exists.name','The environment file exists','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8681,1,'en','vendor/self-diagnosis','example_environment_variables_are_set.message','These environment variables are missing in your .env file, but are defined in your .env.example:\n:variables','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8682,1,'en','vendor/self-diagnosis','example_environment_variables_are_set.name','The example environment variables are set','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8683,1,'en','vendor/self-diagnosis','migrations_are_up_to_date.message.need_to_migrate','You need to update your database. Call \"php artisan migrate\" to run migrations.','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8684,1,'en','vendor/self-diagnosis','migrations_are_up_to_date.message.unable_to_check','Unable to check for migrations: :reason','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8685,1,'en','vendor/self-diagnosis','migrations_are_up_to_date.name','The migrations are up to date','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8686,1,'en','vendor/self-diagnosis','php_extensions_are_disabled.message','The following extensions are still enabled:\n:extensions','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8687,1,'en','vendor/self-diagnosis','php_extensions_are_disabled.name','Unwanted PHP extensions are disabled','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8688,1,'en','vendor/self-diagnosis','php_extensions_are_installed.message','The following extensions are missing:\n:extensions','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8689,1,'en','vendor/self-diagnosis','php_extensions_are_installed.name','The required PHP extensions are installed','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8690,1,'en','vendor/self-diagnosis','routes_are_cached.message','Your routes should be cached in production for better performance. Call \"php artisan route:cache\" to create the route cache.','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8691,1,'en','vendor/self-diagnosis','routes_are_cached.name','Routes are cached','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8692,1,'en','vendor/self-diagnosis','routes_are_not_cached.message','Your routes should not be cached during development. Call \"php artisan route:clear\" to clear the route cache.','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8693,1,'en','vendor/self-diagnosis','routes_are_not_cached.name','Routes are not cached','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8694,1,'en','vendor/self-diagnosis','storage_directory_is_linked.message','The storage directory is not linked. Use \"php artisan storage:link\" to create a symbolic link.','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8695,1,'en','vendor/self-diagnosis','storage_directory_is_linked.name','The storage directory is linked','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8696,1,'en','vendor/self-diagnosis','self_diagnosis.common_checks','Common Checks','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8697,1,'en','vendor/self-diagnosis','self_diagnosis.environment_specific_checks','Environment Specific Checks (:environment)','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8698,1,'en','vendor/self-diagnosis','self_diagnosis.failed_checks','The following checks failed:','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8699,1,'en','vendor/self-diagnosis','self_diagnosis.running_check','<fg=yellow>Running check :current/:max:</fg=yellow> :name...  ','2020-02-27 05:35:27','2020-02-27 05:35:27'),
(8700,1,'en','vendor/self-diagnosis','self_diagnosis.success','Good job, looks like you are all set up!','2020-02-27 05:35:27','2020-02-27 05:35:27');

/*Table structure for table `media` */

DROP TABLE IF EXISTS `media`;

CREATE TABLE `media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `media` */

insert  into `media`(`id`,`model_type`,`model_id`,`name`,`url`,`type`,`file_name`,`size`,`created_at`,`updated_at`) values 
(1,'App\\Models\\Lesson',1,'1586872394-268929.pdf','http://buscsi.com/storage/uploads/1586872394-268929.pdf','lesson_pdf','1586872394-268929.pdf',1910,'2020-04-14 09:53:14','2020-04-14 09:53:14'),
(2,'App\\Models\\Lesson',3,'1587290443-basics-of-english-grammar-1441.pdf','https://buscsi.com/storage/uploads/1587290443-basics-of-english-grammar-1441.pdf','lesson_pdf','1587290443-basics-of-english-grammar-1441.pdf',1752,'2020-04-19 06:00:43','2020-04-19 06:00:43'),
(3,'App\\Models\\Lesson',4,'1587313769-aaa.pdf','https://buscsi.com/storage/uploads/1587313769-aaa.pdf','lesson_pdf','1587313769-aaa.pdf',573,'2020-04-19 12:29:29','2020-04-19 12:29:29');

/*Table structure for table `message_thread_participants` */

DROP TABLE IF EXISTS `message_thread_participants`;

CREATE TABLE `message_thread_participants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `thread_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `last_read` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `message_thread_participants_thread_id_user_id_unique` (`thread_id`,`user_id`),
  KEY `message_thread_participants_user_id_foreign` (`user_id`),
  CONSTRAINT `message_thread_participants_thread_id_foreign` FOREIGN KEY (`thread_id`) REFERENCES `message_threads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `message_thread_participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `message_thread_participants` */

insert  into `message_thread_participants`(`id`,`thread_id`,`user_id`,`last_read`,`deleted_at`) values 
(2,1,16,NULL,NULL);

/*Table structure for table `message_threads` */

DROP TABLE IF EXISTS `message_threads`;

CREATE TABLE `message_threads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `message_threads` */

insert  into `message_threads`(`id`) values 
(1);

/*Table structure for table `messages` */

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `thread_id` int(10) unsigned NOT NULL,
  `sender_id` int(10) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `messages_sender_id_foreign` (`sender_id`),
  KEY `messages_thread_id_foreign` (`thread_id`),
  CONSTRAINT `messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `messages_thread_id_foreign` FOREIGN KEY (`thread_id`) REFERENCES `message_threads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `messages` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=475 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(395,'2014_04_02_193005_create_translations_table',1),
(396,'2014_10_12_000000_create_users_table',1),
(397,'2014_10_12_100000_create_password_resets_table',1),
(398,'2016_06_01_000001_create_oauth_auth_codes_table',1),
(399,'2016_06_01_000002_create_oauth_access_tokens_table',1),
(400,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),
(401,'2016_06_01_000004_create_oauth_clients_table',1),
(402,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),
(403,'2016_07_27_052049_create_messages_table',1),
(404,'2016_07_29_171118_create_chatter_categories_table',1),
(405,'2016_07_29_171118_create_chatter_discussion_table',1),
(406,'2016_07_29_171118_create_chatter_post_table',1),
(407,'2016_07_29_171128_create_foreign_keys',1),
(408,'2016_07_31_215110_create_message_threads_table',1),
(409,'2016_07_31_215345_create_message_thread_participants',1),
(410,'2016_08_02_183143_add_slug_field_for_discussions',1),
(411,'2016_08_03_121747_add_color_row_to_chatter_discussions',1),
(412,'2017_01_16_121747_add_markdown_and_lock_to_chatter_posts',1),
(413,'2017_01_16_121747_create_chatter_user_discussion_pivot_table',1),
(414,'2017_05_28_062751_create_categories_table',1),
(415,'2017_07_19_082347_create_1500441827_courses_table',1),
(416,'2017_07_19_082723_create_1500442043_lessons_table',1),
(417,'2017_07_19_082929_create_1500442169_questions_table',1),
(418,'2017_07_19_083047_create_1500442247_questions_options_table',1),
(419,'2017_07_19_083236_create_1500442356_tests_table',1),
(420,'2017_07_19_120808_create_596eece522a6e_course_user_table',1),
(421,'2017_07_19_121657_create_596eeef709839_question_test_table',1),
(422,'2017_08_07_165345_add_chatter_soft_deletes',1),
(423,'2017_08_11_073824_create_menus_wp_table',1),
(424,'2017_08_11_074006_create_menu_items_wp_table',1),
(425,'2017_08_14_085956_create_course_students_table',1),
(426,'2017_08_17_051131_create_tests_results_table',1),
(427,'2017_08_17_051254_create_tests_results_answers_table',1),
(428,'2017_08_18_060324_add_rating_to_course_student_table',1),
(429,'2017_09_03_144628_create_permission_tables',1),
(430,'2017_09_11_174816_create_social_accounts_table',1),
(431,'2017_09_26_140332_create_cache_table',1),
(432,'2017_09_26_140528_create_sessions_table',1),
(433,'2017_09_26_140609_create_jobs_table',1),
(434,'2017_10_10_221227_add_chatter_last_reply_at_discussion',1),
(435,'2018_04_08_033256_create_password_histories_table',1),
(436,'2018_06_27_072626_create_blog_module',1),
(437,'2019_01_15_103052_create_media_table',1),
(438,'2019_01_16_105633_create_video_progresses_table',1),
(439,'2019_01_24_113831_create_invoices_table',1),
(440,'2019_01_24_115120_create_cart_storage_table',1),
(441,'2019_01_24_120730_create_orders_table',1),
(442,'2019_01_24_120745_create_order_items_table',1),
(443,'2019_01_29_052953_create_configs_table',1),
(444,'2019_02_06_115555_create_course_timeline_table',1),
(445,'2019_02_08_052619_create_sliders_table',1),
(446,'2019_02_12_051827_create_sponsors_table',1),
(447,'2019_02_12_101125_create_testimonials_table',1),
(448,'2019_02_13_111625_create_faqs_table',1),
(449,'2019_02_15_115610_create_reviews_table',1),
(450,'2019_02_19_061120_create_reasons_table',1),
(451,'2019_03_01_055054_create_chapter_students_table',1),
(452,'2019_03_06_093703_create_contacts_table',1),
(453,'2019_03_07_043443_create_pages_table',1),
(454,'2019_04_25_095421_create_locales_table',1),
(455,'2019_05_08_053815_create_certificates_table',1),
(456,'2019_05_30_044853_create_bundles_table',1),
(457,'2019_05_30_090702_create_bundle_courses_table',1),
(458,'2019_05_31_055427_create_bundle_student_table',1),
(459,'2019_05_31_120554_update_order_items_with_morph',1),
(460,'2019_06_03_074229_add_foreign_key_to_courses',1),
(461,'2019_06_03_074251_add_foreign_key_to_faqs',1),
(462,'2019_06_03_074323_add_foreign_key_to_blogs',1),
(463,'2019_06_07_073739_add_columns_in_users_table',1),
(464,'2019_07_22_105142_add_free_column_in_courses',1),
(465,'2019_07_22_105658_add_free_column_in_bundles',1),
(466,'2019_07_30_055917_create_coupons_table',1),
(467,'2019_07_30_061713_create_taxes_table',1),
(468,'2019_07_30_063204_add_coupon_tax_id_in_orders_table',1),
(469,'2019_08_19_054926_add_explanation_column_in_question_options',1),
(470,'2019_09_10_061608_add_remarks_in_orders_table',1),
(471,'2019_09_10_092512_create_teacher_profiles_table',1),
(472,'2019_09_12_054932_create_earnings_table',1),
(473,'2019_09_12_085707_create_withdraws_table',1),
(474,'2020_04_13_063958_add_description_column_in_teacher_profiles',2);

/*Table structure for table `model_has_permissions` */

DROP TABLE IF EXISTS `model_has_permissions`;

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `model_has_permissions` */

/*Table structure for table `model_has_roles` */

DROP TABLE IF EXISTS `model_has_roles`;

CREATE TABLE `model_has_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `model_has_roles` */

insert  into `model_has_roles`(`role_id`,`model_type`,`model_id`) values 
(1,'App\\Models\\Auth\\User',1),
(1,'App\\Models\\Auth\\User',8),
(1,'App\\Models\\Auth\\User',15),
(2,'App\\Models\\Auth\\User',2),
(2,'App\\Models\\Auth\\User',6),
(2,'App\\Models\\Auth\\User',9),
(2,'App\\Models\\Auth\\User',10),
(2,'App\\Models\\Auth\\User',11),
(2,'App\\Models\\Auth\\User',12),
(2,'App\\Models\\Auth\\User',13),
(2,'App\\Models\\Auth\\User',16),
(3,'App\\Models\\Auth\\User',4),
(3,'App\\Models\\Auth\\User',5),
(3,'App\\Models\\Auth\\User',7),
(3,'App\\Models\\Auth\\User',14),
(3,'App\\Models\\Auth\\User',17),
(3,'App\\Models\\Auth\\User',18),
(3,'App\\Models\\Auth\\User',19),
(3,'App\\Models\\Auth\\User',20),
(3,'App\\Models\\Auth\\User',21),
(3,'App\\Models\\Auth\\User',22),
(3,'App\\Models\\Auth\\User',23),
(3,'App\\Models\\Auth\\User',24),
(3,'App\\Models\\Auth\\User',25),
(3,'App\\Models\\Auth\\User',26),
(3,'App\\Models\\Auth\\User',27),
(3,'App\\Models\\Auth\\User',28),
(3,'App\\Models\\Auth\\User',29),
(3,'App\\Models\\Auth\\User',30),
(3,'App\\Models\\Auth\\User',31),
(3,'App\\Models\\Auth\\User',32),
(3,'App\\Models\\Auth\\User',33),
(3,'App\\Models\\Auth\\User',34),
(3,'App\\Models\\Auth\\User',35),
(3,'App\\Models\\Auth\\User',36),
(3,'App\\Models\\Auth\\User',37),
(3,'App\\Models\\Auth\\User',38),
(3,'App\\Models\\Auth\\User',39),
(3,'App\\Models\\Auth\\User',40),
(3,'App\\Models\\Auth\\User',41),
(3,'App\\Models\\Auth\\User',42),
(3,'App\\Models\\Auth\\User',43),
(3,'App\\Models\\Auth\\User',44),
(3,'App\\Models\\Auth\\User',45),
(3,'App\\Models\\Auth\\User',46),
(4,'App\\Models\\Auth\\User',3);

/*Table structure for table `oauth_access_tokens` */

DROP TABLE IF EXISTS `oauth_access_tokens`;

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_access_tokens` */

/*Table structure for table `oauth_auth_codes` */

DROP TABLE IF EXISTS `oauth_auth_codes`;

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_auth_codes` */

/*Table structure for table `oauth_clients` */

DROP TABLE IF EXISTS `oauth_clients`;

CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_clients` */

/*Table structure for table `oauth_personal_access_clients` */

DROP TABLE IF EXISTS `oauth_personal_access_clients`;

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_personal_access_clients` */

/*Table structure for table `oauth_refresh_tokens` */

DROP TABLE IF EXISTS `oauth_refresh_tokens`;

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_refresh_tokens` */

/*Table structure for table `order_items` */

DROP TABLE IF EXISTS `order_items`;

CREATE TABLE `order_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `item_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `order_items` */

insert  into `order_items`(`id`,`order_id`,`item_type`,`item_id`,`price`,`created_at`,`updated_at`) values 
(1,1,'App\\Models\\Course',1,0.00,'2020-04-15 02:35:41','2020-04-15 02:35:41'),
(3,3,'App\\Models\\Course',1,0.00,'2020-04-15 15:11:00','2020-04-15 15:11:00'),
(5,5,'App\\Models\\Course',3,0.00,'2020-04-19 12:10:54','2020-04-19 12:10:54'),
(6,6,'App\\Models\\Course',1,0.00,'2020-04-19 12:20:25','2020-04-19 12:20:25'),
(7,7,'App\\Models\\Course',4,0.00,'2020-04-20 06:32:31','2020-04-20 06:32:31'),
(8,8,'App\\Models\\Course',1,0.00,'2020-04-20 06:42:11','2020-04-20 06:42:11'),
(9,9,'App\\Models\\Course',3,0.00,'2020-04-20 08:10:29','2020-04-20 08:10:29'),
(10,10,'App\\Models\\Course',3,0.00,'2020-04-20 14:07:52','2020-04-20 14:07:52'),
(11,11,'App\\Models\\Course',4,0.00,'2020-04-20 14:11:38','2020-04-20 14:11:38'),
(12,12,'App\\Models\\Course',1,0.00,'2020-04-20 14:11:54','2020-04-20 14:11:54'),
(13,13,'App\\Models\\Course',1,0.00,'2020-04-20 14:26:09','2020-04-20 14:26:09'),
(14,14,'App\\Models\\Course',3,0.00,'2020-04-20 14:44:37','2020-04-20 14:44:37'),
(15,15,'App\\Models\\Course',1,0.00,'2020-04-21 13:49:34','2020-04-21 13:49:34'),
(16,16,'App\\Models\\Course',3,0.00,'2020-04-21 15:35:57','2020-04-21 15:35:57'),
(17,17,'App\\Models\\Course',4,0.00,'2020-04-21 16:00:12','2020-04-21 16:00:12'),
(18,18,'App\\Models\\Course',1,0.00,'2020-04-21 16:26:32','2020-04-21 16:26:32'),
(19,19,'App\\Models\\Course',3,0.00,'2020-04-21 16:37:08','2020-04-21 16:37:08'),
(20,20,'App\\Models\\Course',4,0.00,'2020-04-21 16:41:42','2020-04-21 16:41:42'),
(21,21,'App\\Models\\Course',1,0.00,'2020-04-21 16:49:54','2020-04-21 16:49:54'),
(22,22,'App\\Models\\Course',3,0.00,'2020-04-21 17:14:21','2020-04-21 17:14:21'),
(23,23,'App\\Models\\Course',1,0.00,'2020-04-21 17:16:14','2020-04-21 17:16:14'),
(24,24,'App\\Models\\Course',3,0.00,'2020-04-21 17:20:28','2020-04-21 17:20:28'),
(25,25,'App\\Models\\Course',1,0.00,'2020-04-21 17:36:57','2020-04-21 17:36:57'),
(26,26,'App\\Models\\Course',3,0.00,'2020-04-21 17:40:42','2020-04-21 17:40:42'),
(27,27,'App\\Models\\Course',1,0.00,'2020-04-21 17:59:58','2020-04-21 17:59:58'),
(28,28,'App\\Models\\Course',3,0.00,'2020-04-21 18:28:34','2020-04-21 18:28:34'),
(29,29,'App\\Models\\Course',1,0.00,'2020-04-21 18:35:47','2020-04-21 18:35:47'),
(30,30,'App\\Models\\Course',3,0.00,'2020-04-21 18:38:43','2020-04-21 18:38:43'),
(31,31,'App\\Models\\Course',1,0.00,'2020-04-21 18:41:36','2020-04-21 18:41:36'),
(32,32,'App\\Models\\Course',3,0.00,'2020-04-21 18:47:58','2020-04-21 18:47:58'),
(33,33,'App\\Models\\Course',1,0.00,'2020-04-21 18:59:29','2020-04-21 18:59:29'),
(34,34,'App\\Models\\Course',1,0.00,'2020-04-21 19:03:29','2020-04-21 19:03:29'),
(35,35,'App\\Models\\Course',1,0.00,'2020-04-21 19:05:40','2020-04-21 19:05:40'),
(36,36,'App\\Models\\Course',3,0.00,'2020-04-21 19:12:25','2020-04-21 19:12:25'),
(37,37,'App\\Models\\Course',1,0.00,'2020-04-21 19:14:37','2020-04-21 19:14:37'),
(38,38,'App\\Models\\Course',3,0.00,'2020-04-21 19:17:59','2020-04-21 19:17:59'),
(39,39,'App\\Models\\Course',1,0.00,'2020-04-21 19:21:36','2020-04-21 19:21:36'),
(40,40,'App\\Models\\Course',3,0.00,'2020-04-21 19:27:59','2020-04-21 19:27:59'),
(41,41,'App\\Models\\Course',1,0.00,'2020-04-21 19:33:28','2020-04-21 19:33:28'),
(42,42,'App\\Models\\Course',3,0.00,'2020-04-21 19:34:27','2020-04-21 19:34:27'),
(43,43,'App\\Models\\Course',1,0.00,'2020-04-21 19:58:38','2020-04-21 19:58:38'),
(44,44,'App\\Models\\Course',3,0.00,'2020-04-22 10:34:25','2020-04-22 10:34:25'),
(45,45,'App\\Models\\Course',1,0.00,'2020-04-22 10:48:18','2020-04-22 10:48:18'),
(46,46,'App\\Models\\Course',3,0.00,'2020-04-22 11:18:43','2020-04-22 11:18:43'),
(47,47,'App\\Models\\Course',1,0.00,'2020-04-22 11:19:39','2020-04-22 11:19:39'),
(48,48,'App\\Models\\Course',3,0.00,'2020-04-22 11:20:26','2020-04-22 11:20:26'),
(49,49,'App\\Models\\Course',1,0.00,'2020-04-22 11:22:43','2020-04-22 11:22:43'),
(50,50,'App\\Models\\Course',3,0.00,'2020-04-22 13:05:49','2020-04-22 13:05:49'),
(51,51,'App\\Models\\Course',1,0.00,'2020-04-22 13:07:48','2020-04-22 13:07:48'),
(52,52,'App\\Models\\Course',3,0.00,'2020-04-22 14:09:28','2020-04-22 14:09:28'),
(53,53,'App\\Models\\Course',1,0.00,'2020-04-22 14:13:00','2020-04-22 14:13:00'),
(54,54,'App\\Models\\Course',3,0.00,'2020-04-22 14:16:03','2020-04-22 14:16:03'),
(55,55,'App\\Models\\Course',1,0.00,'2020-04-22 14:17:41','2020-04-22 14:17:41'),
(56,56,'App\\Models\\Course',1,0.00,'2020-04-22 14:17:42','2020-04-22 14:17:42'),
(57,57,'App\\Models\\Course',1,0.00,'2020-04-22 14:17:42','2020-04-22 14:17:42'),
(58,58,'App\\Models\\Course',1,0.00,'2020-04-22 14:17:42','2020-04-22 14:17:42'),
(59,59,'App\\Models\\Course',1,0.00,'2020-04-22 14:17:43','2020-04-22 14:17:43'),
(60,60,'App\\Models\\Course',1,0.00,'2020-04-22 14:17:43','2020-04-22 14:17:43'),
(61,61,'App\\Models\\Course',3,0.00,'2020-04-22 14:18:39','2020-04-22 14:18:39'),
(62,62,'App\\Models\\Course',1,0.00,'2020-04-22 14:37:33','2020-04-22 14:37:33'),
(63,63,'App\\Models\\Course',3,0.00,'2020-04-22 14:42:05','2020-04-22 14:42:05'),
(64,64,'App\\Models\\Course',1,0.00,'2020-04-22 14:46:04','2020-04-22 14:46:04'),
(65,65,'App\\Models\\Course',3,0.00,'2020-04-22 14:54:29','2020-04-22 14:54:29'),
(66,66,'App\\Models\\Course',1,0.00,'2020-04-22 15:00:24','2020-04-22 15:00:24'),
(67,67,'App\\Models\\Course',3,0.00,'2020-04-22 17:20:02','2020-04-22 17:20:02'),
(68,68,'App\\Models\\Course',1,0.00,'2020-04-22 17:25:09','2020-04-22 17:25:09'),
(69,69,'App\\Models\\Course',3,0.00,'2020-04-22 17:30:22','2020-04-22 17:30:22'),
(70,70,'App\\Models\\Course',1,0.00,'2020-04-22 17:36:11','2020-04-22 17:36:11'),
(71,71,'App\\Models\\Course',1,0.00,'2020-04-22 19:19:00','2020-04-22 19:19:00'),
(72,72,'App\\Models\\Course',3,0.00,'2020-04-22 19:42:35','2020-04-22 19:42:35');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL,
  `payment_type` int(11) NOT NULL DEFAULT 0 COMMENT '1-stripe/card, 2 - Paypal, 3 - Offline',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0 - in progress, 1 - Completed',
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `coupon_id` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `orders` */

insert  into `orders`(`id`,`user_id`,`reference_no`,`amount`,`payment_type`,`status`,`transaction_id`,`remarks`,`created_at`,`updated_at`,`coupon_id`) values 
(1,3,'MFdKb1mP',0.00,0,1,NULL,NULL,'2020-04-15 02:35:41','2020-04-15 02:35:41',0),
(3,7,'ce6Zff7M',0.00,0,1,NULL,NULL,'2020-04-15 15:11:00','2020-04-15 15:11:00',0),
(5,14,'RbFrzLed',0.00,0,1,NULL,NULL,'2020-04-19 12:10:54','2020-04-19 12:10:54',0),
(6,14,'QIfhx4EM',0.00,0,1,NULL,NULL,'2020-04-19 12:20:25','2020-04-19 12:20:25',0),
(7,5,'1IKRMHbo',0.00,0,1,NULL,NULL,'2020-04-20 06:32:31','2020-04-20 06:32:31',0),
(8,5,'iJMxGQOD',0.00,0,1,NULL,NULL,'2020-04-20 06:42:11','2020-04-20 06:42:11',0),
(9,15,'uFAlJmvx',0.00,0,1,NULL,NULL,'2020-04-20 08:10:29','2020-04-20 08:10:29',0),
(10,17,'Jf1KdDNh',0.00,0,1,NULL,NULL,'2020-04-20 14:07:52','2020-04-20 14:07:52',0),
(11,17,'U224DvzG',0.00,0,1,NULL,NULL,'2020-04-20 14:11:38','2020-04-20 14:11:38',0),
(12,17,'8ukL18Dk',0.00,0,1,NULL,NULL,'2020-04-20 14:11:54','2020-04-20 14:11:54',0),
(13,19,'LMwK7Lo9',0.00,0,1,NULL,NULL,'2020-04-20 14:26:09','2020-04-20 14:26:09',0),
(14,19,'ytRnHI5R',0.00,0,1,NULL,NULL,'2020-04-20 14:44:37','2020-04-20 14:44:37',0),
(15,20,'q9KchoVX',0.00,0,1,NULL,NULL,'2020-04-21 13:49:34','2020-04-21 13:49:34',0),
(16,20,'xT00gyji',0.00,0,1,NULL,NULL,'2020-04-21 15:35:57','2020-04-21 15:35:57',0),
(17,20,'Rr0fGeZC',0.00,0,1,NULL,NULL,'2020-04-21 16:00:12','2020-04-21 16:00:12',0),
(18,21,'71YJQd4h',0.00,0,1,NULL,NULL,'2020-04-21 16:26:32','2020-04-21 16:26:32',0),
(19,21,'QpBDv1gX',0.00,0,1,NULL,NULL,'2020-04-21 16:37:08','2020-04-21 16:37:08',0),
(20,21,'jOrDhzyG',0.00,0,1,NULL,NULL,'2020-04-21 16:41:42','2020-04-21 16:41:42',0),
(21,22,'3Fn6Pm5Y',0.00,0,1,NULL,NULL,'2020-04-21 16:49:54','2020-04-21 16:49:54',0),
(22,22,'WqnqwYHX',0.00,0,1,NULL,NULL,'2020-04-21 17:14:21','2020-04-21 17:14:21',0),
(23,23,'NppGO3yc',0.00,0,1,NULL,NULL,'2020-04-21 17:16:14','2020-04-21 17:16:14',0),
(24,23,'bknqv4Bk',0.00,0,1,NULL,NULL,'2020-04-21 17:20:28','2020-04-21 17:20:28',0),
(25,24,'hJuLXDqD',0.00,0,1,NULL,NULL,'2020-04-21 17:36:57','2020-04-21 17:36:57',0),
(26,24,'CDjC8lK9',0.00,0,1,NULL,NULL,'2020-04-21 17:40:42','2020-04-21 17:40:42',0),
(27,25,'N3YKnz97',0.00,0,1,NULL,NULL,'2020-04-21 17:59:58','2020-04-21 17:59:58',0),
(28,25,'Wf3gwnbU',0.00,0,1,NULL,NULL,'2020-04-21 18:28:33','2020-04-21 18:28:33',0),
(29,26,'QbW6elro',0.00,0,1,NULL,NULL,'2020-04-21 18:35:47','2020-04-21 18:35:47',0),
(30,26,'DYNHmTVM',0.00,0,1,NULL,NULL,'2020-04-21 18:38:43','2020-04-21 18:38:43',0),
(31,27,'IQYgMJvz',0.00,0,1,NULL,NULL,'2020-04-21 18:41:36','2020-04-21 18:41:36',0),
(32,27,'5If4HNZA',0.00,0,1,NULL,NULL,'2020-04-21 18:47:57','2020-04-21 18:47:57',0),
(33,28,'Qk5733W8',0.00,0,1,NULL,NULL,'2020-04-21 18:59:29','2020-04-21 18:59:29',0),
(34,29,'hQsvxsHT',0.00,0,1,NULL,NULL,'2020-04-21 19:03:29','2020-04-21 19:03:29',0),
(35,30,'NIzsNqeY',0.00,0,1,NULL,NULL,'2020-04-21 19:05:40','2020-04-21 19:05:40',0),
(36,30,'cstvEAT9',0.00,0,1,NULL,NULL,'2020-04-21 19:12:25','2020-04-21 19:12:25',0),
(37,31,'ijWCWpmi',0.00,0,1,NULL,NULL,'2020-04-21 19:14:37','2020-04-21 19:14:37',0),
(38,31,'11tAYPan',0.00,0,1,NULL,NULL,'2020-04-21 19:17:59','2020-04-21 19:17:59',0),
(39,32,'eM6H5sDr',0.00,0,1,NULL,NULL,'2020-04-21 19:21:36','2020-04-21 19:21:36',0),
(40,32,'JjXcctTd',0.00,0,1,NULL,NULL,'2020-04-21 19:27:59','2020-04-21 19:27:59',0),
(41,33,'KweiL4WM',0.00,0,1,NULL,NULL,'2020-04-21 19:33:28','2020-04-21 19:33:28',0),
(42,33,'OZsCjoDE',0.00,0,1,NULL,NULL,'2020-04-21 19:34:27','2020-04-21 19:34:27',0),
(43,34,'ExQAVkie',0.00,0,1,NULL,NULL,'2020-04-21 19:58:38','2020-04-21 19:58:38',0),
(44,34,'ffA0tydz',0.00,0,1,NULL,NULL,'2020-04-22 10:34:25','2020-04-22 10:34:25',0),
(45,35,'GcrxY902',0.00,0,1,NULL,NULL,'2020-04-22 10:48:18','2020-04-22 10:48:18',0),
(46,35,'Tr0whcX8',0.00,0,1,NULL,NULL,'2020-04-22 11:18:43','2020-04-22 11:18:43',0),
(47,36,'xIdHvCrr',0.00,0,1,NULL,NULL,'2020-04-22 11:19:39','2020-04-22 11:19:39',0),
(48,36,'ZOlLhpjb',0.00,0,1,NULL,NULL,'2020-04-22 11:20:26','2020-04-22 11:20:26',0),
(49,37,'wmZs2ehE',0.00,0,1,NULL,NULL,'2020-04-22 11:22:43','2020-04-22 11:22:43',0),
(50,37,'CK6XR66y',0.00,0,1,NULL,NULL,'2020-04-22 13:05:49','2020-04-22 13:05:49',0),
(51,38,'pTMNKACA',0.00,0,1,NULL,NULL,'2020-04-22 13:07:48','2020-04-22 13:07:48',0),
(52,38,'0Kzg6q2Z',0.00,0,1,NULL,NULL,'2020-04-22 14:09:28','2020-04-22 14:09:28',0),
(53,39,'cnhnzRDF',0.00,0,1,NULL,NULL,'2020-04-22 14:13:00','2020-04-22 14:13:00',0),
(54,39,'lulJkhrY',0.00,0,1,NULL,NULL,'2020-04-22 14:16:03','2020-04-22 14:16:03',0),
(55,40,'hKXi22cg',0.00,0,1,NULL,NULL,'2020-04-22 14:17:41','2020-04-22 14:17:41',0),
(56,40,'xywm70kT',0.00,0,1,NULL,NULL,'2020-04-22 14:17:41','2020-04-22 14:17:41',0),
(57,40,'nHu61Zmf',0.00,0,1,NULL,NULL,'2020-04-22 14:17:42','2020-04-22 14:17:42',0),
(58,40,'SqlZvheE',0.00,0,1,NULL,NULL,'2020-04-22 14:17:42','2020-04-22 14:17:42',0),
(59,40,'PP5FBDWH',0.00,0,1,NULL,NULL,'2020-04-22 14:17:43','2020-04-22 14:17:43',0),
(60,40,'YbffKLg2',0.00,0,1,NULL,NULL,'2020-04-22 14:17:43','2020-04-22 14:17:43',0),
(61,40,'j42c6Uah',0.00,0,1,NULL,NULL,'2020-04-22 14:18:39','2020-04-22 14:18:39',0),
(62,41,'Ps3yWUfW',0.00,0,1,NULL,NULL,'2020-04-22 14:37:33','2020-04-22 14:37:33',0),
(63,41,'SyjVI3TW',0.00,0,1,NULL,NULL,'2020-04-22 14:42:05','2020-04-22 14:42:05',0),
(64,42,'tk6VudQb',0.00,0,1,NULL,NULL,'2020-04-22 14:46:04','2020-04-22 14:46:04',0),
(65,42,'CIQYrUdC',0.00,0,1,NULL,NULL,'2020-04-22 14:54:29','2020-04-22 14:54:29',0),
(66,43,'VyGxYeZh',0.00,0,1,NULL,NULL,'2020-04-22 15:00:24','2020-04-22 15:00:24',0),
(67,43,'ebkDjRIn',0.00,0,1,NULL,NULL,'2020-04-22 17:20:02','2020-04-22 17:20:02',0),
(68,44,'3XmdmozR',0.00,0,1,NULL,NULL,'2020-04-22 17:25:09','2020-04-22 17:25:09',0),
(69,44,'aO5hUeJQ',0.00,0,1,NULL,NULL,'2020-04-22 17:30:22','2020-04-22 17:30:22',0),
(70,45,'7Ly5HgOD',0.00,0,1,NULL,NULL,'2020-04-22 17:36:11','2020-04-22 17:36:11',0),
(71,46,'MJ2Y6hM9',0.00,0,1,NULL,NULL,'2020-04-22 19:19:00','2020-04-22 19:19:00',0),
(72,46,'4rCpUTdS',0.00,0,1,NULL,NULL,'2020-04-22 19:42:35','2020-04-22 19:42:35',0);

/*Table structure for table `pages` */

DROP TABLE IF EXISTS `pages`;

CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sidebar` int(11) NOT NULL DEFAULT 0,
  `meta_title` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`),
  KEY `pages_user_id_foreign` (`user_id`),
  CONSTRAINT `pages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `pages` */

insert  into `pages`(`id`,`user_id`,`title`,`slug`,`content`,`image`,`sidebar`,`meta_title`,`meta_keywords`,`meta_description`,`published`,`created_at`,`updated_at`,`deleted_at`) values 
(1,1,'About Us','about-us','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed et urna eu risus ultrices sagittis. In tortor turpis, lobortis a tincidunt non, congue a lorem. Quisque imperdiet congue blandit. Cras quis tortor quis nunc porttitor pulvinar id id lacus. Curabitur dapibus augue orci. Praesent varius, dolor ut ultricies faucibus, ante nunc fringilla nulla, vitae egestas lorem erat eu libero. Praesent cursus tortor non gravida elementum. Praesent et arcu molestie, faucibus ligula sed, euismod urna. Praesent vitae orci metus. Nulla varius diam nec iaculis pulvinar. Sed mi enim, cursus nec urna a, interdum lobortis nisi.<br><br>\n\nMauris posuere sem at arcu commodo lobortis. Suspendisse sollicitudin dapibus congue. Etiam sit amet lacinia eros. In dictum lacinia tortor, nec mattis eros vulputate vel. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec posuere odio eget risus aliquam, quis ornare urna bibendum. Integer iaculis massa magna, et vehicula dui placerat a. Vestibulum ultricies mauris nunc, ut facilisis orci lobortis nec. Fusce cursus eget quam in elementum. Donec ipsum dui, semper ut commodo in, congue in urna.<br><br>\nimperdiet congue blandit. Cras quis tortor quis nunc porttitor pulvinar id id lacus. Curabitur dapibus augue orci. Praesent varius, dolor ut ultricies faucibus, ante nunc fringilla nulla, vitae egestas lorem erat eu libero. Praesent cursus tortor non gravida elementum. Praesent et arcu molestie, faucibus ligula sed, euismod urna. Praesent vitae orci metus. Nulla varius diam nec iaculis pulvinar. Sed mi enim, cursus nec urna a, interdum lobortis nisi.',NULL,1,NULL,NULL,NULL,1,'2020-02-27 05:33:52','2020-04-15 01:46:30','2020-04-15 01:46:30'),
(2,1,'Privacy Policy','privacy-policy','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed et urna eu risus ultrices sagittis. In tortor turpis, lobortis a tincidunt non, congue a lorem. Quisque imperdiet congue blandit. Cras quis tortor quis nunc porttitor pulvinar id id lacus. Curabitur dapibus augue orci. Praesent varius, dolor ut ultricies faucibus, ante nunc fringilla nulla, vitae egestas lorem erat eu libero. Praesent cursus tortor non gravida elementum. Praesent et arcu molestie, faucibus ligula sed, euismod urna. Praesent vitae orci metus. Nulla varius diam nec iaculis pulvinar. Sed mi enim, cursus nec urna a, interdum lobortis nisi.<br><br>\n\nMauris posuere sem at arcu commodo lobortis. Suspendisse sollicitudin dapibus congue. Etiam sit amet lacinia eros. In dictum lacinia tortor, nec mattis eros vulputate vel. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec posuere odio eget risus aliquam, quis ornare urna bibendum. Integer iaculis massa magna, et vehicula dui placerat a. Vestibulum ultricies mauris nunc, ut facilisis orci lobortis nec. Fusce cursus eget quam in elementum. Donec ipsum dui, semper ut commodo in, congue in urna.<br><br>\nimperdiet congue blandit. Cras quis tortor quis nunc porttitor pulvinar id id lacus. Curabitur dapibus augue orci. Praesent varius, dolor ut ultricies faucibus, ante nunc fringilla nulla, vitae egestas lorem erat eu libero. Praesent cursus tortor non gravida elementum. Praesent et arcu molestie, faucibus ligula sed, euismod urna. Praesent vitae orci metus. Nulla varius diam nec iaculis pulvinar. Sed mi enim, cursus nec urna a, interdum lobortis nisi.',NULL,1,NULL,NULL,NULL,1,'2020-02-27 05:33:52','2020-04-15 01:46:37','2020-04-15 01:46:37'),
(3,1,'من نحن','aboutus','<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html><body><p><span dir=\"rtl\">&#1578;&#1571;&#1587;&#1587; &#1605;&#1593;&#1607;&#1583; &#1575;&#1604;&#1583;&#1585;&#1575;&#1587;&#1575;&#1578; &#1608;&#1575;&#1604;&#1582;&#1583;&#1605;&#1575;&#1578; &#1575;&#1604;&#1575;&#1587;&#1578;&#1588;&#1575;&#1585;&#1610;&#1577; &#1576;&#1580;&#1575;&#1605;&#1593;&#1577; &#1575;&#1604;&#1576;&#1575;&#1581;&#1577; &#1593;&#1575;&#1605; &#1634;&#1779;/&#1637;/&#1633;&#1636;&#1779;&#1779;&#1607;&#1600; &#1578;&#1601;&#1593;&#1610;&#1604;&#1575; &#1604;&#1583;&#1608;&#1585; &#1575;&#1604;&#1580;&#1575;&#1605;&#1593;&#1577; &#1575;&#1604;&#1585;&#1610;&#1575;&#1583;&#1610; &#1608;&#1575;&#1604;&#1575;&#1587;&#1578;&#1585;&#1575;&#1578;&#1610;&#1580;&#1610; &#1608;&#1575;&#1604;&#1605;&#1587;&#1575;&#1607;&#1605;&#1577; &#1576;&#1601;&#1593;&#1575;&#1604;&#1610;&#1577; &#1601;&#1610; &#1582;&#1583;&#1605;&#1577; &#1605;&#1580;&#1578;&#1605;&#1593; &#1605;&#1606;&#1591;&#1602;&#1577; &#1575;&#1604;&#1576;&#1575;&#1581;&#1577; &#1576;&#1589;&#1601;&#1577; &#1582;&#1575;&#1589;&#1577; &#1608;&#1575;&#1604;&#1605;&#1605;&#1604;&#1603;&#1577; &#1575;&#1604;&#1593;&#1585;&#1576;&#1610;&#1577; &#1575;&#1604;&#1587;&#1593;&#1608;&#1583;&#1610;&#1577; &#1576;&#1589;&#1601;&#1577; &#1593;&#1575;&#1605;&#1577;&#1548; &#1606;&#1592;&#1585;&#1575; &#1604;&#1605;&#1575; &#1578;&#1590;&#1605;&#1607; &#1575;&#1604;&#1580;&#1575;&#1605;&#1593;&#1577; &#1605;&#1606; &#1575;&#1604;&#1605;&#1578;&#1582;&#1589;&#1589;&#1610;&#1606; &#1601;&#1610; &#1605;&#1582;&#1578;&#1604;&#1601; &#1575;&#1604;&#1605;&#1580;&#1575;&#1604;&#1575;&#1578; &#1575;&#1604;&#1571;&#1603;&#1575;&#1583;&#1610;&#1605;&#1610;&#1577; &#1608;&#1575;&#1604;&#1576;&#1581;&#1579;&#1610;&#1577; &#1608;&#1575;&#1604;&#1573;&#1583;&#1575;&#1585;&#1610;&#1577;&#1548; &#1608;&#1603;&#1584;&#1604;&#1603; &#1578;&#1608;&#1601;&#1585; &#1575;&#1604;&#1573;&#1605;&#1603;&#1575;&#1606;&#1575;&#1578; &#1575;&#1604;&#1605;&#1603;&#1575;&#1606;&#1610;&#1577; &#1608;&#1575;&#1604;&#1578;&#1580;&#1607;&#1610;&#1586;&#1610;&#1577; &#1608;&#1575;&#1604;&#1605;&#1593;&#1605;&#1604;&#1610;&#1577; &#1608;&#1575;&#1604;&#1578;&#1610; &#1578;&#1605;&#1603;&#1606; &#1603;&#1575;&#1601;&#1577; &#1575;&#1604;&#1602;&#1591;&#1575;&#1593;&#1575;&#1578; &#1575;&#1604;&#1581;&#1603;&#1608;&#1605;&#1610;&#1577; &#1608;&#1575;&#1604;&#1582;&#1575;&#1589;&#1577; &#1604;&#1604;&#1575;&#1587;&#1578;&#1601;&#1575;&#1583;&#1577; &#1605;&#1606; &#1603;&#1604; &#1607;&#1584;&#1607; &#1575;&#1604;&#1605;&#1602;&#1608;&#1605;&#1575;&#1578; &#1604;&#1583;&#1593;&#1605; &#1575;&#1604;&#1578;&#1606;&#1605;&#1610;&#1577; &#1575;&#1604;&#1575;&#1580;&#1578;&#1605;&#1575;&#1593;&#1610;&#1577; &#1608;&#1575;&#1604;&#1575;&#1602;&#1578;&#1589;&#1575;&#1583;&#1610;&#1577; &#1608;&#1575;&#1604;&#1576;&#1610;&#1574;&#1610;&#1577; &#1608;&#1575;&#1604;&#1593;&#1604;&#1605;&#1610;&#1577; &#1605;&#1593;&#1578;&#1605;&#1583;&#1575; &#1593;&#1604;&#1609; &#1575;&#1604;&#1576;&#1581;&#1579; &#1575;&#1604;&#1593;&#1604;&#1605;&#1610; &#1575;&#1604;&#1578;&#1591;&#1576;&#1610;&#1602;&#1610; &#1608;&#1573;&#1580;&#1585;&#1575;&#1569; &#1575;&#1604;&#1583;&#1585;&#1575;&#1587;&#1575;&#1578; &#1608;&#1575;&#1604;&#1571;&#1576;&#1581;&#1575;&#1579; &#1608;&#1575;&#1604;&#1576;&#1585;&#1575;&#1605;&#1580; &#1608;&#1575;&#1604;&#1582;&#1591;&#1591; &#1608;&#1575;&#1604;&#1575;&#1587;&#1578;&#1585;&#1575;&#1578;&#1610;&#1580;&#1610;&#1575;&#1578;&#1548; &#1608;&#1578;&#1606;&#1592;&#1610;&#1605; &#1575;&#1604;&#1604;&#1602;&#1575;&#1569;&#1575;&#1578; &#1608;&#1575;&#1604;&#1605;&#1572;&#1578;&#1605;&#1585;&#1575;&#1578; &#1608;&#1575;&#1604;&#1606;&#1583;&#1608;&#1575;&#1578; &#1608;&#1581;&#1604;&#1602;&#1575;&#1578; &#1575;&#1604;&#1606;&#1602;&#1575;&#1588; &#1608;&#1608;&#1585;&#1588; &#1575;&#1604;&#1593;&#1605;&#1604; &#1575;&#1604;&#1605;&#1578;&#1582;&#1589;&#1589;&#1577; &#1601;&#1610; &#1603;&#1575;&#1601;&#1577; &#1575;&#1604;&#1605;&#1608;&#1575;&#1590;&#1610;&#1593; &#1575;&#1604;&#1578;&#1610; &#1578;&#1607;&#1605; &#1575;&#1604;&#1605;&#1580;&#1578;&#1605;&#1593;&#1548; &#1608;&#1576;&#1606;&#1575;&#1569; &#1588;&#1585;&#1575;&#1603;&#1575;&#1578; &#1575;&#1587;&#1578;&#1579;&#1605;&#1575;&#1585;&#1610;&#1577; &#1605;&#1593; &#1575;&#1604;&#1607;&#1610;&#1574;&#1575;&#1578; &#1608;&#1575;&#1604;&#1605;&#1572;&#1587;&#1587;&#1575;&#1578; &#1575;&#1604;&#1581;&#1603;&#1608;&#1605;&#1610;&#1577; &#1608;&#1575;&#1604;&#1571;&#1607;&#1604;&#1610;&#1577; &#1608;&#1594;&#1610;&#1585;&#1607;&#1575;.</span></p>\r\n\r\n<h3><span dir=\"rtl\"><strong>&#1575;&#1604;&#1585;&#1572;&#1610;&#1577;</strong></span></h3>\r\n\r\n<p><span dir=\"rtl\">&#1571;&#1606; &#1610;&#1603;&#1608;&#1606; &#1575;&#1604;&#1605;&#1593;&#1607;&#1583; &#1576;&#1610;&#1578; &#1582;&#1576;&#1585;&#1577; &#1601;&#1610; &#1578;&#1602;&#1583;&#1610;&#1605; &#1575;&#1604;&#1582;&#1583;&#1605;&#1575;&#1578; &#1575;&#1604;&#1575;&#1587;&#1578;&#1588;&#1575;&#1585;&#1610;&#1577; &#1608;&#1575;&#1604;&#1576;&#1581;&#1579;&#1610;&#1577; &#1608;&#1575;&#1604;&#1573;&#1588;&#1585;&#1575;&#1601; &#1575;&#1604;&#1593;&#1604;&#1605;&#1610; &#1604;&#1604;&#1602;&#1591;&#1575;&#1593;&#1610;&#1606; &#1575;&#1604;&#1593;&#1575;&#1605; &#1608;&#1575;&#1604;&#1582;&#1575;&#1589; &#1608;&#1575;&#1604;&#1573;&#1587;&#1607;&#1575;&#1605; &#1601;&#1610; &#1608;&#1590;&#1593; &#1575;&#1604;&#1581;&#1604;&#1608;&#1604; &#1604;&#1604;&#1605;&#1588;&#1603;&#1604;&#1575;&#1578; &#1575;&#1604;&#1578;&#1610; &#1578;&#1608;&#1575;&#1580;&#1607; &#1603;&#1575;&#1601;&#1577; &#1575;&#1604;&#1605;&#1607;&#1578;&#1605;&#1610;&#1606; &#1576;&#1605;&#1607;&#1606;&#1610;&#1577; &#1593;&#1575;&#1604;&#1610;&#1577; &#1608;&#1605;&#1578;&#1605;&#1610;&#1586;&#1577;.</span></p>\r\n\r\n<h3><span dir=\"rtl\"><strong>&#1575;&#1604;&#1585;&#1587;&#1575;&#1604;&#1577;</strong></span></h3>\r\n\r\n<p><span dir=\"rtl\">&#1578;&#1581;&#1602;&#1610;&#1602; &#1575;&#1604;&#1575;&#1603;&#1578;&#1601;&#1575;&#1569; &#1575;&#1604;&#1584;&#1575;&#1578;&#1610; &#1601;&#1610; &#1575;&#1604;&#1578;&#1591;&#1608;&#1610;&#1585; &#1608;&#1601;&#1610; &#1575;&#1604;&#1571;&#1583;&#1575;&#1569; &#1575;&#1604;&#1573;&#1583;&#1575;&#1585;&#1610; &#1608;&#1575;&#1604;&#1571;&#1603;&#1575;&#1583;&#1610;&#1605;&#1610; &#1608;&#1575;&#1604;&#1576;&#1581;&#1579;&#1610; &#1608;&#1575;&#1604;&#1605;&#1607;&#1606;&#1610; &#1608;&#1575;&#1604;&#1578;&#1583;&#1585;&#1610;&#1576;&#1610;&#1548; &#1608;&#1575;&#1604;&#1582;&#1585;&#1608;&#1580; &#1605;&#1606; &#1606;&#1591;&#1575;&#1602; &#1575;&#1604;&#1605;&#1581;&#1604;&#1610;&#1577; &#1573;&#1604;&#1609; &#1575;&#1604;&#1593;&#1575;&#1604;&#1605;&#1610;&#1577; &#1608;&#1605;&#1581;&#1575;&#1603;&#1575;&#1577; &#1571;&#1593;&#1585;&#1602; &#1605;&#1593;&#1575;&#1607;&#1583; &#1575;&#1604;&#1583;&#1585;&#1575;&#1587;&#1575;&#1578; &#1608;&#1575;&#1604;&#1575;&#1587;&#1578;&#1588;&#1575;&#1585;&#1575;&#1578; &#1575;&#1604;&#1593;&#1575;&#1604;&#1605;&#1610;&#1577;&#1548; &#1608;&#1586;&#1610;&#1575;&#1583;&#1577; &#1605;&#1608;&#1575;&#1585;&#1583; &#1575;&#1604;&#1580;&#1575;&#1605;&#1593;&#1577; &#1575;&#1604;&#1605;&#1575;&#1604;&#1610;&#1577;</span></p>\r\n\r\n<h3><span dir=\"rtl\"><strong>&#1575;&#1604;&#1571;&#1607;&#1583;&#1575;&#1601;</strong><strong>&nbsp;</strong></span></h3>\r\n\r\n<p><span dir=\"rtl\">&#1610;&#1607;&#1583;&#1601; &#1605;&#1593;&#1607;&#1583; &#1575;&#1604;&#1583;&#1585;&#1575;&#1587;&#1575;&#1578; &#1608;&#1575;&#1604;&#1582;&#1583;&#1605;&#1575;&#1578; &#1575;&#1604;&#1575;&#1587;&#1578;&#1588;&#1575;&#1585;&#1610;&#1577; &#1576;&#1580;&#1575;&#1605;&#1593;&#1577; &#1575;&#1604;&#1576;&#1575;&#1581;&#1577; &#1573;&#1604;&#1609; &#1575;&#1604;&#1578;&#1575;&#1604;&#1610;:</span></p>\r\n\r\n<ol>\r\n	<li><span dir=\"rtl\"><strong>&#1578;&#1608;&#1579;&#1610;&#1602;</strong><strong> </strong><strong>&#1589;&#1604;&#1577;</strong><strong> </strong><strong>&#1575;&#1604;&#1580;&#1575;&#1605;&#1593;&#1577;</strong><strong> </strong><strong>&#1605;&#1593;</strong><strong> </strong><strong>&#1575;&#1604;&#1602;&#1591;&#1575;&#1593;&#1575;&#1578;</strong><strong> </strong><strong>&#1575;&#1604;&#1581;&#1603;&#1608;&#1605;&#1610;&#1577;</strong><strong> </strong><strong>&#1608;&#1575;&#1604;&#1582;&#1575;&#1589;&#1577;</strong><strong> </strong><strong>&#1608;&#1578;&#1602;&#1583;&#1610;&#1605;</strong><strong> </strong><strong>&#1582;&#1583;&#1605;&#1575;&#1578;</strong><strong> </strong><strong>&#1575;&#1604;&#1580;&#1575;&#1605;&#1593;&#1577;</strong><strong> </strong><strong>&#1575;&#1604;&#1576;&#1581;&#1579;&#1610;&#1577;</strong><strong> </strong><strong>&#1608;&#1575;&#1604;&#1575;&#1587;&#1578;&#1588;&#1575;&#1585;&#1610;&#1577;</strong><strong> </strong><strong>&#1608;&#1575;&#1604;&#1593;&#1604;&#1605;&#1610;&#1577;</strong><strong> </strong><strong>&#1576;&#1605;&#1575;</strong><strong> </strong><strong>&#1610;&#1604;&#1576;&#1610;</strong><strong> </strong><strong>&#1575;&#1581;&#1578;&#1610;&#1575;&#1580;&#1575;&#1578;&#1607;&#1575;</strong><strong> </strong><strong>&#1608;&#1605;&#1578;&#1591;&#1604;&#1576;&#1575;&#1578;&#1607;&#1575;</strong><strong>.</strong></span></li>\r\n	<li><span dir=\"rtl\"><strong>&#1575;&#1587;&#1578;&#1579;&#1605;&#1575;&#1585;</strong><strong> </strong><strong>&#1573;&#1605;&#1603;&#1575;&#1606;&#1610;&#1575;&#1578;</strong><strong> </strong><strong>&#1575;&#1604;&#1580;&#1575;&#1605;&#1593;&#1577;</strong><strong> </strong><strong>&#1608;&#1578;&#1587;&#1608;&#1610;&#1602;</strong><strong> </strong><strong>&#1602;&#1583;&#1585;&#1575;&#1578;&#1607;&#1575;</strong><strong> </strong><strong>&#1575;&#1604;&#1576;&#1581;&#1579;&#1610;&#1577;</strong><strong> </strong><strong>&#1608;&#1575;&#1604;&#1593;&#1604;&#1605;&#1610;&#1577;</strong><strong> </strong><strong>&#1608;&#1575;&#1604;&#1575;&#1587;&#1578;&#1588;&#1575;&#1585;&#1610;&#1577;</strong><strong> </strong><strong>&#1604;&#1604;&#1605;&#1580;&#1578;&#1605;&#1593;</strong><strong>.</strong></span></li>\r\n	<li><span dir=\"rtl\"><strong>&#1573;&#1576;&#1585;&#1575;&#1605;</strong><strong> </strong><strong>&#1575;&#1604;&#1575;&#1578;&#1601;&#1575;&#1602;&#1610;&#1575;&#1578;</strong><strong> </strong><strong>&#1608;&#1578;&#1593;&#1586;&#1610;&#1586;</strong><strong> </strong><strong>&#1575;&#1604;&#1578;&#1593;&#1575;&#1608;&#1606;</strong><strong> </strong><strong>&#1601;&#1610;</strong><strong> </strong><strong>&#1605;&#1580;&#1575;&#1604;</strong><strong> </strong><strong>&#1575;&#1604;&#1576;&#1581;&#1608;&#1579;</strong><strong> </strong><strong>&#1608;&#1575;&#1604;&#1583;&#1585;&#1575;&#1587;&#1575;&#1578;</strong><strong> </strong><strong>&#1575;&#1604;&#1575;&#1587;&#1578;&#1588;&#1575;&#1585;&#1610;&#1577;</strong><strong> </strong><strong>&#1608;&#1575;&#1604;&#1582;&#1583;&#1605;&#1575;&#1578;</strong><strong> </strong><strong>&#1575;&#1604;&#1593;&#1604;&#1605;&#1610;&#1577;</strong><strong> </strong><strong>&#1608;&#1575;&#1604;&#1601;&#1606;&#1610;&#1577;</strong><strong> </strong><strong>&#1608;&#1575;&#1604;&#1605;&#1607;&#1606;&#1610;&#1577;</strong><strong> </strong><strong>&#1608;&#1575;&#1604;&#1573;&#1583;&#1575;&#1585;&#1610;&#1577;</strong><strong> </strong><strong>&#1576;&#1610;&#1606;</strong><strong> </strong><strong>&#1575;&#1604;&#1580;&#1575;&#1605;&#1593;&#1577;</strong><strong> </strong><strong>&#1608;&#1575;&#1604;&#1602;&#1591;&#1575;&#1593;&#1575;&#1578;</strong><strong> </strong><strong>&#1575;&#1604;&#1582;&#1575;&#1585;&#1580;&#1610;&#1577;</strong><strong>.</strong></span></li>\r\n	<li><span dir=\"rtl\"><strong>&#1605;&#1587;&#1575;&#1593;&#1583;&#1577;</strong><strong> </strong><strong>&#1575;&#1604;&#1602;&#1591;&#1575;&#1593;&#1575;&#1578;</strong><strong> </strong><strong>&#1575;&#1604;&#1582;&#1575;&#1585;&#1580;&#1610;&#1577;</strong><strong> </strong><strong>&#1605;&#1606;</strong><strong> </strong><strong>&#1571;&#1580;&#1604;</strong><strong> </strong><strong>&#1578;&#1591;&#1608;&#1610;&#1585;</strong><strong> </strong><strong>&#1571;&#1583;&#1575;&#1574;&#1607;&#1575;</strong><strong> </strong><strong>&#1593;&#1606;</strong><strong> </strong><strong>&#1591;&#1585;&#1610;&#1602;</strong><strong> </strong><strong>&#1575;&#1604;&#1571;&#1576;&#1581;&#1575;&#1579;</strong><strong> </strong><strong>&#1608;&#1575;&#1604;&#1583;&#1585;&#1575;&#1587;&#1575;&#1578;</strong><strong> </strong><strong>&#1608;&#1575;&#1604;&#1575;&#1587;&#1578;&#1588;&#1575;&#1585;&#1575;&#1578;</strong><strong> </strong><strong>&#1608;&#1575;&#1604;&#1582;&#1583;&#1605;&#1575;&#1578;</strong><strong>.</strong></span></li>\r\n	<li><span dir=\"rtl\"><strong>&#1578;&#1602;&#1583;&#1610;&#1605;</strong><strong> </strong><strong>&#1582;&#1583;&#1605;&#1575;&#1578;&#1607;</strong><strong> </strong><strong>&#1601;&#1610;</strong><strong> </strong><strong>&#1605;&#1580;&#1575;&#1604;&#1607;</strong><strong> </strong><strong>&#1576;&#1593;&#1608;&#1590;</strong><strong> </strong><strong>&#1605;&#1575;&#1604;&#1610;</strong><strong> </strong><strong>&#1604;&#1608;&#1581;&#1583;&#1575;&#1578;</strong><strong> </strong><strong>&#1575;&#1604;&#1580;&#1575;&#1605;&#1593;&#1577;</strong><strong> </strong><strong>&#1575;&#1604;&#1605;&#1582;&#1578;&#1604;&#1601;&#1577;</strong><strong>.</strong></span></li>\r\n	<li><span dir=\"rtl\"><strong>&#1578;&#1608;&#1601;&#1610;&#1585;</strong><strong> </strong><strong>&#1583;&#1593;&#1605;</strong><strong> </strong><strong>&#1573;&#1590;&#1575;&#1601;&#1610;</strong><strong> </strong><strong>&#1604;&#1605;&#1608;&#1575;&#1585;&#1583;</strong><strong> </strong><strong>&#1575;&#1604;&#1580;&#1575;&#1605;&#1593;&#1577;</strong><strong> </strong><strong>&#1575;&#1604;&#1605;&#1575;&#1583;&#1610;&#1577;</strong><strong> </strong><strong>&#1605;&#1602;&#1575;&#1576;&#1604;</strong><strong> </strong><strong>&#1605;&#1575;</strong><strong> </strong><strong>&#1578;&#1602;&#1583;&#1605;&#1607;</strong><strong> </strong><strong>&#1605;&#1606;</strong><strong> </strong><strong>&#1582;&#1583;&#1605;&#1575;&#1578;</strong><strong> </strong><strong>&#1604;&#1604;&#1580;&#1607;&#1575;&#1578;</strong><strong> </strong><strong>&#1575;&#1604;&#1571;&#1582;&#1585;&#1609;</strong><strong>.</strong></span></li>\r\n	<li><span dir=\"rtl\"><strong>&#1578;&#1593;&#1586;&#1610;&#1586;</strong><strong> </strong><strong>&#1583;&#1608;&#1585;</strong><strong> </strong><strong>&#1575;&#1604;&#1580;&#1575;&#1605;&#1593;&#1577;</strong><strong> </strong><strong>&#1601;&#1610;</strong><strong> </strong><strong>&#1582;&#1583;&#1605;&#1577;</strong><strong> </strong><strong>&#1575;&#1604;&#1605;&#1580;&#1578;&#1605;&#1593;&#1548;</strong><strong> </strong><strong>&#1608;&#1581;&#1604;</strong><strong> </strong><strong>&#1602;&#1590;&#1575;&#1610;&#1575;&#1607;</strong><strong> </strong><strong>&#1605;&#1606;</strong><strong> </strong><strong>&#1582;&#1604;&#1575;&#1604;</strong><strong>: </strong><strong>&#1575;&#1604;&#1583;&#1585;&#1575;&#1587;&#1575;&#1578;</strong><strong> </strong><strong>&#1575;&#1604;&#1593;&#1604;&#1605;&#1610;&#1577;</strong><strong> </strong><strong>&#1575;&#1604;&#1578;&#1593;&#1575;&#1602;&#1583;&#1610;&#1577;&#1548;</strong><strong> </strong><strong>&#1608;&#1575;&#1604;&#1575;&#1587;&#1578;&#1588;&#1575;&#1585;&#1575;&#1578;&#1548;</strong><strong> </strong><strong>&#1608;&#1575;&#1604;&#1583;&#1608;&#1585;&#1575;&#1578;&#1548;</strong><strong> </strong><strong>&#1608;&#1575;&#1604;&#1578;&#1583;&#1585;&#1610;&#1576;&#1548;</strong><strong> </strong><strong>&#1608;&#1575;&#1604;&#1603;&#1585;&#1575;&#1587;&#1610;</strong><strong> </strong><strong>&#1575;&#1604;&#1593;&#1604;&#1605;&#1610;&#1577;&#1548;</strong><strong> </strong><strong>&#1608;&#1605;&#1585;&#1575;&#1603;&#1586;</strong><strong> </strong><strong>&#1575;&#1604;&#1578;&#1605;&#1610;&#1586;</strong><strong> </strong><strong>&#1575;&#1604;&#1576;&#1581;&#1579;&#1610;</strong><strong> </strong><strong>&#1608;&#1594;&#1610;&#1585;&#1607;&#1575;</strong><strong> </strong><strong>&#1605;&#1606;</strong><strong> </strong><strong>&#1575;&#1604;&#1582;&#1583;&#1605;&#1575;&#1578;</strong><strong> </strong><strong>&#1575;&#1604;&#1606;&#1592;&#1585;&#1610;&#1577;</strong><strong> </strong><strong>&#1608;&#1575;&#1604;&#1578;&#1591;&#1576;&#1610;&#1602;&#1610;&#1577;</strong><strong> </strong><strong>&#1575;&#1604;&#1605;&#1582;&#1578;&#1604;&#1601;&#1577;</strong><strong>.</strong></span></li>\r\n</ol>\r\n\r\n<p>&nbsp;</p></body></html>\n',NULL,0,NULL,NULL,NULL,1,'2020-04-17 09:24:48','2020-04-17 09:25:58',NULL);

/*Table structure for table `password_histories` */

DROP TABLE IF EXISTS `password_histories`;

CREATE TABLE `password_histories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `password_histories_user_id_foreign` (`user_id`),
  CONSTRAINT `password_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_histories` */

insert  into `password_histories`(`id`,`user_id`,`password`,`created_at`,`updated_at`) values 
(1,1,'$2y$10$tVFGVDCk/mYckp5/W.IQbeIxdpKaDv8Qs.G/jfBuqp9jV56aiTEge','2020-02-27 05:33:48','2020-02-27 05:33:48'),
(2,2,'$2y$10$QlvnKE3ZbIKZOjX0ZR1hI.s/3x69pwHXsE0xHqwIrsCaff6AW.EDW','2020-02-27 05:33:48','2020-02-27 05:33:48'),
(3,3,'$2y$10$RwVnbGlDuFI4g7YSGmJ0uOJ.Cno/PGc/aPHgS33o/3L2zY6u6KG9u','2020-02-27 05:33:48','2020-02-27 05:33:48'),
(4,4,'$2y$10$CoqmvD2BheDW4LoKbXjQ/Ohb8N/Lob3udDHJM5agINSPLPETDlvw2','2020-02-27 05:33:48','2020-02-27 05:33:48'),
(5,5,'$2y$10$v6piQpviEIjaFZmcCLNQRebqGOWhb0aBiHM372uLbBQlLfQwehXMe','2020-04-14 07:45:01','2020-04-14 07:45:01'),
(6,1,'$2y$10$bz/ueYZ22g5ln3VSklo/CuUSdOILxJvlrW84RkiIJGW5h7ZPqUE8K','2020-04-14 15:16:28','2020-04-14 15:16:28'),
(7,6,'$2y$10$ghGrcUgRoXE3KLfzSBD9cOWuKRI4NUKDpfldZmnpCqfVdDFqVPHry','2020-04-15 06:11:14','2020-04-15 06:11:14'),
(8,7,'$2y$10$pnxkRI3yN84bU1EsRVHXHu6iQY3VfwA3P5pKY5ujPPDXoymDxDYQ.','2020-04-15 15:08:42','2020-04-15 15:08:42'),
(9,8,'$2y$10$7qAjGK2XFB.Dqbgl6Zc7vuJ51z.dkgS.VOiOFxnZ7iSOEyX4DEw5i','2020-04-16 01:19:28','2020-04-16 01:19:28'),
(10,9,'$2y$10$gGPesJ3tzbUvGECzJyTvZerE.BVM/NBZ9VReRvd97fUAoX5zc8uhW','2020-04-16 07:25:22','2020-04-16 07:25:22'),
(11,10,'$2y$10$DGYyCaVisr8aRbvLwZKUtO.965ufCMpkMXWUmFEBe3ze2GRgEQvem','2020-04-18 08:30:25','2020-04-18 08:30:25'),
(12,11,'$2y$10$NVE05.QoeYq2060JwVEULOEZA2oDkciXGK3iP9FFS38pOJAVrxthG','2020-04-18 11:02:01','2020-04-18 11:02:01'),
(13,12,'$2y$10$ZrR4.nwwP0g1VdrJuIqN7.d72HghajE8swb/mdlCbnaH3NE9x5U.u','2020-04-18 17:01:09','2020-04-18 17:01:09'),
(14,13,'$2y$10$4H0Wk0/Zsnuju8h7Yk6TxOgiWnqyDX7wZyFIS01lHHRZ656NriP.q','2020-04-19 05:24:05','2020-04-19 05:24:05'),
(15,14,'$2y$10$8pemULqBHMvQDSolePMaK.plrAvv5OaRhjgxNHD5ZHXufFDZIDRZO','2020-04-19 12:07:33','2020-04-19 12:07:33'),
(16,15,'$2y$10$IEdNzbmp.vm1SggGvmY4LuS68mWz1XuuAscYOQRtEyNPUev9NTil6','2020-04-20 08:09:31','2020-04-20 08:09:31'),
(17,16,'$2y$10$2iM6MHHxz5OYwRq3ZTiINO.yM5sKF7vL/EhK3S.10ux5yQRvbgqv6','2020-04-20 08:18:43','2020-04-20 08:18:43'),
(18,17,'$2y$10$/s3ZZvIC9tVoKoEPeyFKKeoPeXzxABKiFXa95FbsAUTfPgwcwf5NG','2020-04-20 13:42:13','2020-04-20 13:42:13'),
(19,18,'$2y$10$T8xtAhYtPomJ92gH.Yyt0O/U3mSu0iIPhFQmaUCLfoepj7yfP0Rnu','2020-04-20 14:23:43','2020-04-20 14:23:43'),
(20,19,'$2y$10$.gygDDWWUt/7LdtScQ2c8ePPvzUzFsA.pIyqz8GQTlDPAAVwcmGhO','2020-04-20 14:24:59','2020-04-20 14:24:59'),
(47,46,'$2y$10$FZCGjLlKPd2UXg.s8Ujfqek0XSNFYKZXPVF35TeJb.KDyLg0Y88zq','2020-04-22 19:18:49','2020-04-22 19:18:49');

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

insert  into `password_resets`(`email`,`token`,`created_at`) values 
('abdessamadelhamdany@gmail.com','$2y$10$BQrcCHQwIV5Zhs4ENUxp2uj4MWPRi5c9zonmj1Fikbm/0cf5LKgB2','2020-04-15 08:46:32'),
('imohduni@gmail.com','$2y$10$vSjX6uENR8m..xVEVWjA1.26W0cdklman2baQ2wxwNYzZDCYhV79a','2020-04-16 05:26:50'),
('mya700@gmail.com','$2y$10$s3p.KdhqFWL1L3qgxik2T.rzqH3IoaXqaUL873vX8ATAGuhfMVDXi','2020-04-20 13:45:42'),
('edinburghdev@gmail.com','$2y$10$oInwtrXtBfpYFaKJsad7KOUcwD9xeqpTN8fbkSEsKxjiFzD0vz/qq','2020-04-20 13:59:29'),
('abdessamadelhamdany@gmail.com','$2y$10$BQrcCHQwIV5Zhs4ENUxp2uj4MWPRi5c9zonmj1Fikbm/0cf5LKgB2','2020-04-15 08:46:32'),
('imohduni@gmail.com','$2y$10$vSjX6uENR8m..xVEVWjA1.26W0cdklman2baQ2wxwNYzZDCYhV79a','2020-04-16 05:26:50'),
('mya700@gmail.com','$2y$10$s3p.KdhqFWL1L3qgxik2T.rzqH3IoaXqaUL873vX8ATAGuhfMVDXi','2020-04-20 13:45:42'),
('edinburghdev@gmail.com','$2y$10$oInwtrXtBfpYFaKJsad7KOUcwD9xeqpTN8fbkSEsKxjiFzD0vz/qq','2020-04-20 13:59:29'),
('smartwebcoding12345@gmail.com','$2y$10$Bv.gIER30XWjKqML2d7knONmnU8Qfw2pYYHIe.AvQ4zr.GiU0lAm.','2020-04-21 13:18:35');

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permissions` */

insert  into `permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values 
(1,'user_management_access','web','2020-02-27 05:33:48','2020-02-27 05:33:48'),
(2,'user_management_create','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(3,'user_management_edit','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(4,'user_management_view','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(5,'user_management_delete','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(6,'permission_access','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(7,'permission_create','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(8,'permission_edit','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(9,'permission_view','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(10,'permission_delete','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(11,'role_access','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(12,'role_create','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(13,'role_edit','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(14,'role_view','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(15,'role_delete','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(16,'user_access','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(17,'user_create','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(18,'user_edit','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(19,'user_view','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(20,'user_delete','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(21,'course_access','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(22,'course_create','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(23,'course_edit','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(24,'course_view','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(25,'course_delete','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(26,'lesson_access','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(27,'lesson_create','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(28,'lesson_edit','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(29,'lesson_view','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(30,'lesson_delete','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(31,'question_access','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(32,'question_create','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(33,'question_edit','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(34,'question_view','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(35,'question_delete','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(36,'questions_option_access','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(37,'questions_option_create','web','2020-02-27 05:33:49','2020-02-27 05:33:49'),
(38,'questions_option_edit','web','2020-02-27 05:33:50','2020-02-27 05:33:50'),
(39,'questions_option_view','web','2020-02-27 05:33:50','2020-02-27 05:33:50'),
(40,'questions_option_delete','web','2020-02-27 05:33:50','2020-02-27 05:33:50'),
(41,'test_access','web','2020-02-27 05:33:50','2020-02-27 05:33:50'),
(42,'test_create','web','2020-02-27 05:33:50','2020-02-27 05:33:50'),
(43,'test_edit','web','2020-02-27 05:33:50','2020-02-27 05:33:50'),
(44,'test_view','web','2020-02-27 05:33:50','2020-02-27 05:33:50'),
(45,'test_delete','web','2020-02-27 05:33:50','2020-02-27 05:33:50'),
(46,'order_access','web','2020-02-27 05:33:50','2020-02-27 05:33:50'),
(47,'view backend','web','2020-02-27 05:33:50','2020-02-27 05:33:50'),
(48,'category_access','web','2020-02-27 05:33:50','2020-02-27 05:33:50'),
(49,'category_create','web','2020-02-27 05:33:50','2020-02-27 05:33:50'),
(50,'category_edit','web','2020-02-27 05:33:50','2020-02-27 05:33:50'),
(51,'category_view','web','2020-02-27 05:33:50','2020-02-27 05:33:50'),
(52,'category_delete','web','2020-02-27 05:33:50','2020-02-27 05:33:50'),
(53,'blog_access','web','2020-02-27 05:33:50','2020-02-27 05:33:50'),
(54,'blog_create','web','2020-02-27 05:33:50','2020-02-27 05:33:50'),
(55,'blog_edit','web','2020-02-27 05:33:50','2020-02-27 05:33:50'),
(56,'blog_view','web','2020-02-27 05:33:50','2020-02-27 05:33:50'),
(57,'blog_delete','web','2020-02-27 05:33:50','2020-02-27 05:33:50'),
(58,'reason_access','web','2020-02-27 05:33:50','2020-02-27 05:33:50'),
(59,'reason_create','web','2020-02-27 05:33:50','2020-02-27 05:33:50'),
(60,'reason_edit','web','2020-02-27 05:33:50','2020-02-27 05:33:50'),
(61,'reason_view','web','2020-02-27 05:33:50','2020-02-27 05:33:50'),
(62,'reason_delete','web','2020-02-27 05:33:50','2020-02-27 05:33:50'),
(63,'page_access','web','2020-02-27 05:33:51','2020-02-27 05:33:51'),
(64,'page_create','web','2020-02-27 05:33:51','2020-02-27 05:33:51'),
(65,'page_edit','web','2020-02-27 05:33:51','2020-02-27 05:33:51'),
(66,'page_view','web','2020-02-27 05:33:51','2020-02-27 05:33:51'),
(67,'page_delete','web','2020-02-27 05:33:51','2020-02-27 05:33:51'),
(68,'bundle_access','web','2020-02-27 05:33:51','2020-02-27 05:33:51'),
(69,'bundle_create','web','2020-02-27 05:33:51','2020-02-27 05:33:51'),
(70,'bundle_edit','web','2020-02-27 05:33:51','2020-02-27 05:33:51'),
(71,'bundle_view','web','2020-02-27 05:33:51','2020-02-27 05:33:51'),
(72,'bundle_delete','web','2020-02-27 05:33:51','2020-02-27 05:33:51');

/*Table structure for table `question_test` */

DROP TABLE IF EXISTS `question_test`;

CREATE TABLE `question_test` (
  `question_id` int(10) unsigned DEFAULT NULL,
  `test_id` int(10) unsigned DEFAULT NULL,
  KEY `fk_p_54420_54422_test_que_596eeef70992f` (`question_id`),
  KEY `fk_p_54422_54420_question_596eeef7099af` (`test_id`),
  CONSTRAINT `fk_p_54420_54422_test_que_596eeef70992f` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_p_54422_54420_question_596eeef7099af` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `question_test` */

insert  into `question_test`(`question_id`,`test_id`) values 
(1,2),
(1,2);

/*Table structure for table `questions` */

DROP TABLE IF EXISTS `questions`;

CREATE TABLE `questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questions_user_id_foreign` (`user_id`),
  KEY `questions_deleted_at_index` (`deleted_at`),
  CONSTRAINT `questions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `questions` */

insert  into `questions`(`id`,`question`,`question_image`,`score`,`user_id`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'rwfgqrewgfqrewfgqrfg',NULL,11111,1,'2020-04-15 15:59:21','2020-04-15 15:59:21',NULL);

/*Table structure for table `questions_options` */

DROP TABLE IF EXISTS `questions_options`;

CREATE TABLE `questions_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(10) unsigned DEFAULT NULL,
  `option_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `explanation` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correct` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `54421_596eee8745a1e` (`question_id`),
  KEY `questions_options_deleted_at_index` (`deleted_at`),
  CONSTRAINT `54421_596eee8745a1e` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `questions_options` */

insert  into `questions_options`(`id`,`question_id`,`option_text`,`explanation`,`correct`,`created_at`,`updated_at`,`deleted_at`) values 
(1,1,'rwfqerw','wrtqewtq',1,'2020-04-15 15:59:21','2020-04-15 15:59:21',NULL),
(2,1,'werteqrw','qwert',0,'2020-04-15 15:59:21','2020-04-15 15:59:21',NULL),
(3,1,'qwert','qwert',0,'2020-04-15 15:59:21','2020-04-15 15:59:21',NULL),
(4,1,'qwrtqr','qwertqwe',0,'2020-04-15 15:59:21','2020-04-15 15:59:21',NULL);

/*Table structure for table `reasons` */

DROP TABLE IF EXISTS `reasons`;

CREATE TABLE `reasons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0 - disabled, 1 - enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `reasons` */

insert  into `reasons`(`id`,`title`,`content`,`icon`,`status`,`created_at`,`updated_at`) values 
(1,'دورات مقدمة من اكاديمين','يشرف على اعداد و تنفيذ الدورات اكاديميون من جامعة الباحة','far fa-bookmark',1,'2020-04-14 15:54:17','2020-04-14 15:54:17');

/*Table structure for table `reviews` */

DROP TABLE IF EXISTS `reviews`;

CREATE TABLE `reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `reviewable_id` int(11) NOT NULL,
  `reviewable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_user_id_foreign` (`user_id`),
  CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `reviews` */

/*Table structure for table `role_has_permissions` */

DROP TABLE IF EXISTS `role_has_permissions`;

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `role_has_permissions` */

insert  into `role_has_permissions`(`permission_id`,`role_id`) values 
(1,1),
(1,2),
(2,1),
(3,1),
(4,1),
(5,1),
(6,1),
(7,1),
(8,1),
(9,1),
(10,1),
(11,1),
(12,1),
(13,1),
(14,1),
(15,1),
(16,1),
(17,1),
(18,1),
(19,1),
(20,1),
(21,1),
(21,2),
(22,1),
(22,2),
(23,1),
(23,2),
(24,1),
(24,2),
(25,1),
(25,2),
(26,1),
(26,2),
(27,1),
(27,2),
(28,1),
(28,2),
(29,1),
(29,2),
(30,1),
(30,2),
(31,1),
(31,2),
(32,1),
(32,2),
(33,1),
(33,2),
(34,1),
(34,2),
(35,1),
(35,2),
(36,1),
(36,2),
(37,1),
(37,2),
(38,1),
(38,2),
(39,1),
(39,2),
(40,1),
(40,2),
(41,1),
(41,2),
(42,1),
(42,2),
(43,1),
(43,2),
(44,1),
(44,2),
(45,1),
(45,2),
(46,1),
(47,1),
(47,2),
(47,3),
(48,1),
(48,2),
(49,1),
(50,1),
(51,1),
(51,2),
(52,1),
(53,1),
(54,1),
(55,1),
(56,1),
(57,1),
(58,1),
(59,1),
(60,1),
(61,1),
(62,1),
(63,1),
(64,1),
(65,1),
(66,1),
(67,1),
(68,1),
(69,1),
(70,1),
(71,1),
(72,1);

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values 
(1,'administrator','web','2020-02-27 05:33:48','2020-02-27 05:33:48'),
(2,'teacher','web','2020-02-27 05:33:48','2020-02-27 05:33:48'),
(3,'student','web','2020-02-27 05:33:48','2020-02-27 05:33:48'),
(4,'user','web','2020-02-27 05:33:48','2020-02-27 05:33:48');

/*Table structure for table `sessions` */

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sessions` */

/*Table structure for table `sliders` */

DROP TABLE IF EXISTS `sliders`;

CREATE TABLE `sliders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bg_image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `overlay` int(11) DEFAULT 0,
  `sequence` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1 - enabled, 0 - disabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sliders` */

insert  into `sliders`(`id`,`name`,`content`,`bg_image`,`overlay`,`sequence`,`status`,`created_at`,`updated_at`) values 
(1,'Slide 1','{\"hero_text\":\"منصة التدريب الإلكتروني\",\"sub_text\":\"معهد الدراسات و الخدمات الاستشارية بجامعة الباحة\"}','1587020447-002.jpg',1,1,1,'2020-02-27 05:33:53','2020-04-20 04:19:30'),
(5,'2','{\"hero_text\":\"Online Training Platform\",\"sub_text\":\"Studies and Consulting Services Institute \"}','1587210108-002.jpg',1,2,1,'2020-04-18 07:41:48','2020-04-20 04:49:08');

/*Table structure for table `social_accounts` */

DROP TABLE IF EXISTS `social_accounts`;

CREATE TABLE `social_accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `provider` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `social_accounts_user_id_foreign` (`user_id`),
  CONSTRAINT `social_accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `social_accounts` */

/*Table structure for table `sponsors` */

DROP TABLE IF EXISTS `sponsors`;

CREATE TABLE `sponsors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0 - disabled, 1 - enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sponsors` */

insert  into `sponsors`(`id`,`name`,`logo`,`link`,`status`,`created_at`,`updated_at`) values 
(1,'دعم للإستشارات و الحلول التقنية',NULL,NULL,1,'2020-04-17 14:47:48','2020-04-17 14:47:48'),
(2,'بيت الخبرة للاستشارات القضائية و القانونية',NULL,NULL,1,'2020-04-17 14:48:37','2020-04-17 14:48:37'),
(3,'بيت الخبرة للاستشارات النفسية و تعديل السلوك',NULL,NULL,1,'2020-04-17 14:50:06','2020-04-17 14:50:06'),
(4,'بيت الخبرة للاستشارات و الدراسات البيئية و الزراعية',NULL,NULL,1,'2020-04-17 14:51:10','2020-04-17 14:51:10');

/*Table structure for table `taggables` */

DROP TABLE IF EXISTS `taggables`;

CREATE TABLE `taggables` (
  `tag_id` int(11) NOT NULL,
  `taggable_id` int(11) NOT NULL,
  `taggable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `taggables` */

/*Table structure for table `tags` */

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tags` */

/*Table structure for table `taxes` */

DROP TABLE IF EXISTS `taxes`;

CREATE TABLE `taxes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(8,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `taxes` */

/*Table structure for table `teacher_profiles` */

DROP TABLE IF EXISTS `teacher_profiles`;

CREATE TABLE `teacher_profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `facebook_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'paypal,bank',
  `payment_details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_profiles_user_id_foreign` (`user_id`),
  CONSTRAINT `teacher_profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `teacher_profiles` */

insert  into `teacher_profiles`(`id`,`user_id`,`facebook_link`,`twitter_link`,`linkedin_link`,`payment_method`,`payment_details`,`description`,`created_at`,`updated_at`,`deleted_at`) values 
(1,2,'https://goodwin.info/accusamus-ducimus-aliquam-in-vitae-dolorem-vitae.html','https://www.connelly.com/est-ullam-accusamus-voluptatem-rerum-reprehenderit-velit','http://grant.com/voluptate-vel-quia-impedit-eos-aut-odit-placeat','paypal','{\"bank_name\":\"\",\"ifsc_code\":\"\",\"account_number\":\"\",\"account_name\":\"\",\"paypal_email\":\"adminteacher@demo.com\"}',NULL,'2020-02-27 05:33:53','2020-02-27 05:33:53',NULL),
(2,12,NULL,NULL,NULL,NULL,NULL,NULL,'2020-04-18 17:01:09','2020-04-18 17:01:09',NULL),
(3,13,NULL,NULL,NULL,NULL,NULL,NULL,'2020-04-19 05:24:05','2020-04-19 05:24:05',NULL);

/*Table structure for table `testimonials` */

DROP TABLE IF EXISTS `testimonials`;

CREATE TABLE `testimonials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `occupation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0 - disabled, 1 - enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `testimonials` */

/*Table structure for table `tests` */

DROP TABLE IF EXISTS `tests`;

CREATE TABLE `tests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` int(10) unsigned DEFAULT NULL,
  `lesson_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint(4) DEFAULT 0,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `54422_596eeef514d00` (`course_id`),
  KEY `54422_596eeef53411a` (`lesson_id`),
  KEY `tests_deleted_at_index` (`deleted_at`),
  CONSTRAINT `54422_596eeef514d00` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `54422_596eeef53411a` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tests` */

insert  into `tests`(`id`,`course_id`,`lesson_id`,`title`,`description`,`published`,`slug`,`created_at`,`updated_at`,`deleted_at`) values 
(1,1,NULL,'1','1',1,'1','2020-04-14 09:53:58','2020-04-14 09:53:58',NULL),
(2,2,NULL,'dfqrfqrf','fqrwfqrfgqref',1,'dfqrfqrf','2020-04-15 15:58:40','2020-04-15 15:58:40',NULL);

/*Table structure for table `tests_results` */

DROP TABLE IF EXISTS `tests_results`;

CREATE TABLE `tests_results` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `test_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `test_result` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tests_results_test_id_foreign` (`test_id`),
  KEY `tests_results_user_id_foreign` (`user_id`),
  CONSTRAINT `tests_results_test_id_foreign` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tests_results_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tests_results` */

insert  into `tests_results`(`id`,`test_id`,`user_id`,`test_result`,`created_at`,`updated_at`) values 
(1,2,6,0,'2020-04-15 16:02:02','2020-04-15 16:02:02');

/*Table structure for table `tests_results_answers` */

DROP TABLE IF EXISTS `tests_results_answers`;

CREATE TABLE `tests_results_answers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tests_result_id` int(10) unsigned DEFAULT NULL,
  `question_id` int(10) unsigned DEFAULT NULL,
  `option_id` int(10) unsigned DEFAULT NULL,
  `correct` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tests_results_answers_tests_result_id_foreign` (`tests_result_id`),
  KEY `tests_results_answers_question_id_foreign` (`question_id`),
  KEY `tests_results_answers_option_id_foreign` (`option_id`),
  CONSTRAINT `tests_results_answers_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `questions_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tests_results_answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tests_results_answers_tests_result_id_foreign` FOREIGN KEY (`tests_result_id`) REFERENCES `tests_results` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tests_results_answers` */

insert  into `tests_results_answers`(`id`,`tests_result_id`,`question_id`,`option_id`,`correct`,`created_at`,`updated_at`) values 
(1,1,1,2,0,'2020-04-15 16:02:02','2020-04-15 16:02:02');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pincode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'gravatar',
  `avatar_location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_changed_at` timestamp NULL DEFAULT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `confirmation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `last_login_ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`uuid`,`first_name`,`last_name`,`email`,`dob`,`phone`,`gender`,`address`,`city`,`pincode`,`state`,`country`,`avatar_type`,`avatar_location`,`password`,`password_changed_at`,`active`,`confirmation_code`,`confirmed`,`timezone`,`last_login_at`,`last_login_ip`,`remember_token`,`created_at`,`updated_at`,`deleted_at`,`email_verified_at`) values 
(1,'d3b4a875-0b36-4d39-9a11-44eff35b6f9d','Admin','Admin','admin@lms.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'gravatar',NULL,'$2y$10$bz/ueYZ22g5ln3VSklo/CuUSdOILxJvlrW84RkiIJGW5h7ZPqUE8K',NULL,1,'bc4fa0189cd985f1e888b59d15c5ff7c',1,NULL,NULL,NULL,'6r7gbBDBkuOuJ4SOfGUv4ctq4nll6EaUJn5dgtd2O4EYi48eRSFi7XoZrKUh','2020-02-27 05:33:48','2020-04-15 01:48:25',NULL,NULL),
(2,'46921f8c-3f0d-46a3-90ef-4a2623a5d428','Teacher','User','teacher@lms.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'gravatar',NULL,'$2y$10$QlvnKE3ZbIKZOjX0ZR1hI.s/3x69pwHXsE0xHqwIrsCaff6AW.EDW',NULL,1,'9763fa89a131f628aad16c587fbd86ab',1,NULL,NULL,NULL,'6qQn4kG05R2O3vy484torJa7OV9acfyWRzS01qUqnLOEk12eQBKbUnM9uD5R','2020-02-27 05:33:48','2020-04-16 07:27:23','2020-04-16 07:27:23',NULL),
(3,'58e056e1-6cf1-45d4-bcb6-13103e4ce063','Student','User','student@lms.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'gravatar',NULL,'$2y$10$RwVnbGlDuFI4g7YSGmJ0uOJ.Cno/PGc/aPHgS33o/3L2zY6u6KG9u',NULL,1,'2ecf6e49c3671648ce9aee30ca0638c8',1,NULL,NULL,NULL,'nh9cKEJurdE03zhiNpe7GUiG6frEKhUZs4eqqJgtn6QhUCRbc4FC4as0SD9H','2020-02-27 05:33:48','2020-04-20 16:24:52',NULL,NULL),
(4,'ed3ebf72-8b39-4735-98ca-084bea966ca3','Normal','User','user@lms.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'gravatar',NULL,'$2y$10$CoqmvD2BheDW4LoKbXjQ/Ohb8N/Lob3udDHJM5agINSPLPETDlvw2',NULL,1,'c4b102d5b563b7ae245d27e0053bdbcb',1,NULL,NULL,NULL,NULL,'2020-02-27 05:33:48','2020-02-27 05:33:48',NULL,NULL),
(5,'cfe83685-b89b-46a1-ab8a-f3d2ddcb0951','Abdessamad','El Hamdany','abdessamadelhamdany@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'gravatar',NULL,'$2y$10$v6piQpviEIjaFZmcCLNQRebqGOWhb0aBiHM372uLbBQlLfQwehXMe',NULL,1,NULL,1,NULL,NULL,NULL,'377H7aYzWr6VYjeH1GmOUUdZZXxlIxy7Gdxa1VuKiv5nbihxjmVc3kLPvtE2','2020-04-14 07:45:01','2020-04-14 07:45:01',NULL,NULL),
(6,'17a80d88-3e11-4b6f-a636-48f009aabc86','محمد','الزهراني','imohduni@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'gravatar',NULL,'$2y$10$ghGrcUgRoXE3KLfzSBD9cOWuKRI4NUKDpfldZmnpCqfVdDFqVPHry',NULL,1,NULL,1,NULL,NULL,NULL,'oBWO1NvAJBUSqagrrQa1YeaDGetKUsxreFXTB706Qwk3DQ8R1gtrDRJBMSIW','2020-04-15 06:11:14','2020-04-16 07:27:15','2020-04-16 07:27:15',NULL),
(7,'f8ba6ced-d9c1-46b6-b666-1fbe305b7514','محمد يحىى','مرضي','mya700@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'gravatar',NULL,'$2y$10$pnxkRI3yN84bU1EsRVHXHu6iQY3VfwA3P5pKY5ujPPDXoymDxDYQ.',NULL,0,NULL,1,NULL,NULL,NULL,'YbwR9MI2WgA8pTOsywcw2sxK6Bchefn65TZO0cg1Q51zj1uXSWPZkakoljCq','2020-04-15 15:08:42','2020-04-19 12:09:27',NULL,NULL),
(8,'0d2a1d04-7cb3-485f-b521-2c1238b697a1','Jamal','Alghamdi','jkhaled@bu.edu.sa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'gravatar',NULL,'$2y$10$7qAjGK2XFB.Dqbgl6Zc7vuJ51z.dkgS.VOiOFxnZ7iSOEyX4DEw5i',NULL,1,NULL,1,NULL,NULL,NULL,NULL,'2020-04-16 01:19:28','2020-04-16 01:19:28',NULL,NULL),
(9,'706f5ad0-c516-4b3a-9404-776a67579935','Mohammed','Alzahrani','msawileh@bu.edu.sa',NULL,NULL,'male',NULL,NULL,NULL,NULL,NULL,'gravatar',NULL,'$2y$10$gGPesJ3tzbUvGECzJyTvZerE.BVM/NBZ9VReRvd97fUAoX5zc8uhW',NULL,0,NULL,1,NULL,NULL,NULL,NULL,'2020-04-16 07:25:22','2020-04-16 07:27:01','2020-04-16 07:27:01',NULL),
(10,'69c82055-bb2d-475e-931a-15f83c7b1bba','Mohammed','Alzahrani','sss@efff.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'gravatar',NULL,'$2y$10$DGYyCaVisr8aRbvLwZKUtO.965ufCMpkMXWUmFEBe3ze2GRgEQvem',NULL,0,NULL,1,NULL,NULL,NULL,NULL,'2020-04-18 08:30:25','2020-04-20 10:15:16','2020-04-20 10:15:16',NULL),
(11,'ddd3ea9c-0d32-485c-8981-1aa1eefabad4','Nesreen','Alahmadi','aaaa@lms.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'gravatar',NULL,'$2y$10$NVE05.QoeYq2060JwVEULOEZA2oDkciXGK3iP9FFS38pOJAVrxthG',NULL,0,NULL,1,NULL,NULL,NULL,NULL,'2020-04-18 11:02:01','2020-04-20 10:15:11','2020-04-20 10:15:11',NULL),
(12,'a3582814-2235-493b-bdd9-1c501dda0273','محمد','يحيى','aaaaaaa66666666@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'gravatar',NULL,'$2y$10$ZrR4.nwwP0g1VdrJuIqN7.d72HghajE8swb/mdlCbnaH3NE9x5U.u',NULL,0,NULL,1,NULL,NULL,NULL,NULL,'2020-04-18 17:01:09','2020-04-20 10:15:21','2020-04-20 10:15:21',NULL),
(13,'4ac06453-55b1-483a-a689-e8e48391c074','teacher','teacher','teacher2@lms.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'gravatar',NULL,'$2y$10$4H0Wk0/Zsnuju8h7Yk6TxOgiWnqyDX7wZyFIS01lHHRZ656NriP.q',NULL,1,NULL,1,NULL,NULL,NULL,'EMPlpkpi5tImO6xQrVQJP1Q2qo7aIMcNAVspnbLJpukUodFOAKvAjF1rcX61','2020-04-19 05:24:05','2020-04-20 10:15:28','2020-04-20 10:15:28',NULL),
(14,'9d657ca1-b959-4bf2-adec-c3982e5060e9','Mohammed','Alzahrani','student2@lms.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'gravatar',NULL,'$2y$10$8pemULqBHMvQDSolePMaK.plrAvv5OaRhjgxNHD5ZHXufFDZIDRZO',NULL,1,NULL,1,NULL,NULL,NULL,'xdwrNoMYeoiDuk5T4afE0Dp9RtqHHC95DYiKeIYOENAOuD65AjsLyleu2iny','2020-04-19 12:07:33','2020-04-19 12:07:33',NULL,NULL),
(15,'eff8efb8-51ce-4a17-bbf8-610615efd70a','محمد','الزهراني','ksa592999@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'gravatar',NULL,'$2y$10$IEdNzbmp.vm1SggGvmY4LuS68mWz1XuuAscYOQRtEyNPUev9NTil6',NULL,1,NULL,1,NULL,NULL,NULL,'1S9kTYvsGuhHBpA86ZittueZUakVTeoay6VhTNMbtAPeQbZj1SdLYikmLp9T','2020-04-20 08:09:31','2020-04-20 08:09:31',NULL,NULL),
(16,'b6cce1ef-f479-41cb-8b69-2e412ae5ecb8','د. فهد','رافع','frafi@bu.edu.sa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'gravatar',NULL,'$2y$10$2iM6MHHxz5OYwRq3ZTiINO.yM5sKF7vL/EhK3S.10ux5yQRvbgqv6',NULL,1,NULL,1,NULL,NULL,NULL,NULL,'2020-04-20 08:18:43','2020-04-20 08:18:43',NULL,NULL),
(17,'696a7eac-4825-4e13-aa1d-6bf5ed803e4b','Mohammed','Alzahrani','edinburghdev@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'gravatar',NULL,'$2y$10$/s3ZZvIC9tVoKoEPeyFKKeoPeXzxABKiFXa95FbsAUTfPgwcwf5NG',NULL,1,NULL,1,NULL,NULL,NULL,'VGYow2qRtIsKK3dUAwCIRrlzs0kKtHfEd8HerCNhlp9sWEBZZPoHfZVhNaBx','2020-04-20 13:42:13','2020-04-20 13:42:13',NULL,NULL),
(18,'61612a9e-1d1e-4c85-9329-43d606ff5ecd','Mohammed','yahya','123@test.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'gravatar',NULL,'$2y$10$T8xtAhYtPomJ92gH.Yyt0O/U3mSu0iIPhFQmaUCLfoepj7yfP0Rnu',NULL,1,NULL,1,NULL,NULL,NULL,NULL,'2020-04-20 14:23:43','2020-04-20 14:23:43',NULL,NULL),
(19,'69277dbe-c4b9-48da-97f7-03440c82a01a','Mohammed','yyy','test1@test.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'gravatar',NULL,'$2y$10$.gygDDWWUt/7LdtScQ2c8ePPvzUzFsA.pIyqz8GQTlDPAAVwcmGhO',NULL,1,NULL,1,NULL,NULL,NULL,'qAjOv97TYmkvTp7zhSpXhMR0HwXfyu0smepoQX7X9piUoMRYosxRrOtFY7oK','2020-04-20 14:24:59','2020-04-20 14:24:59',NULL,NULL),
(46,'3c60da4b-7daf-49fa-95e8-cfdd2bbf7601','محمد','الصالحي','lovelycoding519@outlook.coom',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'gravatar',NULL,'$2y$10$FZCGjLlKPd2UXg.s8Ujfqek0XSNFYKZXPVF35TeJb.KDyLg0Y88zq',NULL,1,NULL,1,NULL,NULL,NULL,NULL,'2020-04-22 19:18:49','2020-04-22 19:18:49',NULL,NULL);

/*Table structure for table `video_progresses` */

DROP TABLE IF EXISTS `video_progresses`;

CREATE TABLE `video_progresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `media_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `duration` double(8,2) NOT NULL,
  `progress` double(8,2) NOT NULL,
  `complete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0.Pending 1.Complete',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `video_progresses_media_id_foreign` (`media_id`),
  KEY `video_progresses_user_id_foreign` (`user_id`),
  CONSTRAINT `video_progresses_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE,
  CONSTRAINT `video_progresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `video_progresses` */

/*Table structure for table `withdraws` */

DROP TABLE IF EXISTS `withdraws`;

CREATE TABLE `withdraws` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `payment_type` tinyint(4) DEFAULT NULL COMMENT '0=Bank, 1=Paypal,2=offline',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=pending,1=accepted,2=rejected',
  `remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `withdraws_user_id_foreign` (`user_id`),
  CONSTRAINT `withdraws_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `withdraws` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
