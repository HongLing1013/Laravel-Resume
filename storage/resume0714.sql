-- -------------------------------------------------------------
-- TablePlus 5.3.8(500)
--
-- https://tableplus.com/
--
-- Database: resume
-- Generation Time: 2023-07-14 13:27:47.2560
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=406 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`),
  UNIQUE KEY `admin_permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`),
  UNIQUE KEY `admin_roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `indextext` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `portfolio_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `portfolios` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pcid` bigint(20) unsigned NOT NULL,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `href` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `portfolios_pcid_foreign` (`pcid`),
  CONSTRAINT `portfolios_pcid_foreign` FOREIGN KEY (`pcid`) REFERENCES `portfolio_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `resume_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `services` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `socials` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `href` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`) VALUES
(1, 0, 8, '首頁', 'fa-bar-chart', '/', NULL, NULL, '2023-07-12 04:51:14'),
(2, 0, 9, '管理', 'fa-tasks', NULL, NULL, NULL, '2023-07-12 04:51:14'),
(3, 2, 10, '使用者', 'fa-users', 'auth/users', NULL, NULL, '2023-07-12 04:51:14'),
(4, 2, 11, '角色', 'fa-user', 'auth/roles', NULL, NULL, '2023-07-12 04:51:14'),
(5, 2, 12, '權限', 'fa-ban', 'auth/permissions', NULL, NULL, '2023-07-12 04:51:14'),
(6, 2, 13, '選單', 'fa-bars', 'auth/menu', NULL, NULL, '2023-07-12 04:51:14'),
(7, 2, 14, '紀錄', 'fa-history', 'auth/logs', NULL, NULL, '2023-07-12 04:51:14'),
(8, 11, 2, '主選單', 'fa-bars', 'auth/frontend-menu', '*', '2023-06-19 05:31:18', '2023-07-06 08:28:13'),
(9, 11, 3, '首頁文案', 'fa-code', 'auth/admin-text', '*', '2023-06-27 05:07:39', '2023-07-06 08:28:13'),
(10, 11, 4, '首頁社群', 'fa-angellist', 'auth/social', '*', '2023-06-30 10:10:11', '2023-07-06 08:28:13'),
(11, 0, 1, '前台', 'fa-asterisk', NULL, '*', '2023-06-30 10:35:41', '2023-07-06 08:28:31'),
(12, 11, 5, '作品分類', 'fa-bars', 'auth/portfolio-category', '*', '2023-07-06 08:28:03', '2023-07-06 08:28:13'),
(13, 11, 6, '作品列表', 'fa-diamond', 'auth/portfolio', '*', '2023-07-07 04:23:47', '2023-07-07 04:23:53'),
(14, 11, 7, '服務列表', 'fa-connectdevelop', 'auth/service', '*', '2023-07-12 04:50:15', '2023-07-12 04:51:14');

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'GET', '::1', '[]', '2023-05-25 05:40:40', '2023-05-25 05:40:40'),
(2, 1, 'admin', 'GET', '::1', '[]', '2023-06-19 05:21:21', '2023-06-19 05:21:21'),
(3, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-19 05:21:25', '2023-06-19 05:21:25'),
(4, 1, 'admin/auth/roles', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-19 05:21:38', '2023-06-19 05:21:38'),
(5, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-19 05:21:39', '2023-06-19 05:21:39'),
(6, 1, 'admin/auth/menu/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-19 05:24:32', '2023-06-19 05:24:32'),
(7, 1, 'admin/auth/menu/1', 'PUT', '::1', '{\"parent_id\":\"0\",\"title\":\"\\u9996\\u9801\",\"icon\":\"fa-bar-chart\",\"uri\":\"\\/\",\"roles\":[null],\"permission\":null,\"_token\":\"hxWx6ZorB5HFZultXlBNTMO1WX40qmJyzSoF36Q6\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/menu\"}', '2023-06-19 05:24:38', '2023-06-19 05:24:38'),
(8, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2023-06-19 05:24:38', '2023-06-19 05:24:38'),
(9, 1, 'admin/auth/menu/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-19 05:24:41', '2023-06-19 05:24:41'),
(10, 1, 'admin/auth/menu/2', 'PUT', '::1', '{\"parent_id\":\"0\",\"title\":\"\\u7ba1\\u7406\",\"icon\":\"fa-tasks\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"hxWx6ZorB5HFZultXlBNTMO1WX40qmJyzSoF36Q6\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/menu\"}', '2023-06-19 05:24:45', '2023-06-19 05:24:45'),
(11, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2023-06-19 05:24:46', '2023-06-19 05:24:46'),
(12, 1, 'admin/auth/menu/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-19 05:24:49', '2023-06-19 05:24:49'),
(13, 1, 'admin/auth/menu/3', 'PUT', '::1', '{\"parent_id\":\"2\",\"title\":\"\\u4f7f\\u7528\\u8005\",\"icon\":\"fa-users\",\"uri\":\"auth\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"hxWx6ZorB5HFZultXlBNTMO1WX40qmJyzSoF36Q6\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/menu\"}', '2023-06-19 05:24:53', '2023-06-19 05:24:53'),
(14, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2023-06-19 05:24:54', '2023-06-19 05:24:54'),
(15, 1, 'admin/auth/menu/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-19 05:24:56', '2023-06-19 05:24:56'),
(16, 1, 'admin/auth/menu/4', 'PUT', '::1', '{\"parent_id\":\"2\",\"title\":\"\\u89d2\\u8272\",\"icon\":\"fa-user\",\"uri\":\"auth\\/roles\",\"roles\":[null],\"permission\":null,\"_token\":\"hxWx6ZorB5HFZultXlBNTMO1WX40qmJyzSoF36Q6\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/menu\"}', '2023-06-19 05:25:28', '2023-06-19 05:25:28'),
(17, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2023-06-19 05:25:28', '2023-06-19 05:25:28'),
(18, 1, 'admin/auth/menu/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-19 05:25:31', '2023-06-19 05:25:31'),
(19, 1, 'admin/auth/menu/5', 'PUT', '::1', '{\"parent_id\":\"2\",\"title\":\"\\u6b0a\\u9650\",\"icon\":\"fa-ban\",\"uri\":\"auth\\/permissions\",\"roles\":[null],\"permission\":null,\"_token\":\"hxWx6ZorB5HFZultXlBNTMO1WX40qmJyzSoF36Q6\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/menu\"}', '2023-06-19 05:25:47', '2023-06-19 05:25:47'),
(20, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2023-06-19 05:25:48', '2023-06-19 05:25:48'),
(21, 1, 'admin/auth/menu/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-19 05:25:52', '2023-06-19 05:25:52'),
(22, 1, 'admin/auth/menu/6', 'PUT', '::1', '{\"parent_id\":\"2\",\"title\":\"\\u9078\\u55ae\",\"icon\":\"fa-bars\",\"uri\":\"auth\\/menu\",\"roles\":[null],\"permission\":null,\"_token\":\"hxWx6ZorB5HFZultXlBNTMO1WX40qmJyzSoF36Q6\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/menu\"}', '2023-06-19 05:25:56', '2023-06-19 05:25:56'),
(23, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2023-06-19 05:25:57', '2023-06-19 05:25:57'),
(24, 1, 'admin/auth/menu/7/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-19 05:26:02', '2023-06-19 05:26:02'),
(25, 1, 'admin/auth/menu/7', 'PUT', '::1', '{\"parent_id\":\"2\",\"title\":\"\\u7d00\\u9304\",\"icon\":\"fa-history\",\"uri\":\"auth\\/logs\",\"roles\":[null],\"permission\":null,\"_token\":\"hxWx6ZorB5HFZultXlBNTMO1WX40qmJyzSoF36Q6\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/menu\"}', '2023-06-19 05:26:08', '2023-06-19 05:26:08'),
(26, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2023-06-19 05:26:08', '2023-06-19 05:26:08'),
(27, 1, 'admin/auth/menu/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-19 05:28:23', '2023-06-19 05:28:23'),
(28, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-19 05:28:28', '2023-06-19 05:28:28'),
(29, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"\\u524d\\u53f0\\u9078\\u55ae\",\"icon\":\"fa-bars\",\"uri\":\"auth\\/users\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"hxWx6ZorB5HFZultXlBNTMO1WX40qmJyzSoF36Q6\"}', '2023-06-19 05:31:18', '2023-06-19 05:31:18'),
(30, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2023-06-19 05:31:19', '2023-06-19 05:31:19'),
(31, 1, 'admin/auth/menu/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-19 05:31:26', '2023-06-19 05:31:26'),
(32, 1, 'admin/auth/menu/8', 'PUT', '::1', '{\"parent_id\":\"0\",\"title\":\"\\u524d\\u53f0\\u9078\\u55ae\",\"icon\":\"fa-bars\",\"uri\":\"auth\\/frontend-menu\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"hxWx6ZorB5HFZultXlBNTMO1WX40qmJyzSoF36Q6\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/menu\"}', '2023-06-19 05:31:42', '2023-06-19 05:31:42'),
(33, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2023-06-19 05:31:42', '2023-06-19 05:31:42'),
(34, 1, 'admin/auth/menu/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-19 05:31:47', '2023-06-19 05:31:47'),
(35, 1, 'admin/auth/menu/8/edit', 'GET', '::1', '[]', '2023-06-19 05:31:58', '2023-06-19 05:31:58'),
(36, 1, 'admin', 'GET', '::1', '[]', '2023-06-20 04:50:05', '2023-06-20 04:50:05'),
(37, 1, 'admin/auth/frontend-menu', 'GET', '::1', '[]', '2023-06-20 05:01:40', '2023-06-20 05:01:40'),
(38, 1, 'admin/auth/frontend-menu/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-20 05:04:07', '2023-06-20 05:04:07'),
(39, 1, 'admin/auth/frontend-menu', 'POST', '::1', '{\"title\":\"home\",\"content\":null,\"_token\":\"KkRP7pF4tn1JnH4VzKDoNO3aa66LxdnVbn9GPGOO\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/frontend-menu\"}', '2023-06-20 05:05:00', '2023-06-20 05:05:00'),
(40, 1, 'admin/auth/frontend-menu/create', 'GET', '::1', '[]', '2023-06-20 05:05:01', '2023-06-20 05:05:01'),
(41, 1, 'admin/auth/frontend-menu/create', 'GET', '::1', '[]', '2023-06-20 05:09:53', '2023-06-20 05:09:53'),
(42, 1, 'admin/auth/frontend-menu', 'POST', '::1', '{\"title\":\"home\",\"content\":null,\"_token\":\"KkRP7pF4tn1JnH4VzKDoNO3aa66LxdnVbn9GPGOO\"}', '2023-06-20 05:10:00', '2023-06-20 05:10:00'),
(43, 1, 'admin/auth/frontend-menu', 'GET', '::1', '[]', '2023-06-20 05:10:00', '2023-06-20 05:10:00'),
(44, 1, 'admin/auth/frontend-menu/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-20 05:10:18', '2023-06-20 05:10:18'),
(45, 1, 'admin/auth/frontend-menu', 'POST', '::1', '{\"title\":\"about\",\"content\":\"Learn more about me\",\"_token\":\"KkRP7pF4tn1JnH4VzKDoNO3aa66LxdnVbn9GPGOO\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/frontend-menu\"}', '2023-06-20 05:10:30', '2023-06-20 05:10:30'),
(46, 1, 'admin/auth/frontend-menu', 'GET', '::1', '[]', '2023-06-20 05:10:30', '2023-06-20 05:10:30'),
(47, 1, 'admin/auth/frontend-menu/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-20 05:10:42', '2023-06-20 05:10:42'),
(48, 1, 'admin/auth/frontend-menu', 'POST', '::1', '{\"title\":\"resume\",\"content\":\"Check My Resume\",\"_token\":\"KkRP7pF4tn1JnH4VzKDoNO3aa66LxdnVbn9GPGOO\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/frontend-menu\"}', '2023-06-20 05:10:53', '2023-06-20 05:10:53'),
(49, 1, 'admin/auth/frontend-menu', 'GET', '::1', '[]', '2023-06-20 05:10:53', '2023-06-20 05:10:53'),
(50, 1, 'admin/auth/frontend-menu/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-20 05:11:05', '2023-06-20 05:11:05'),
(51, 1, 'admin/auth/frontend-menu', 'POST', '::1', '{\"title\":\"services\",\"content\":\"My Services\",\"_token\":\"KkRP7pF4tn1JnH4VzKDoNO3aa66LxdnVbn9GPGOO\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/frontend-menu\"}', '2023-06-20 05:11:14', '2023-06-20 05:11:14'),
(52, 1, 'admin/auth/frontend-menu', 'GET', '::1', '[]', '2023-06-20 05:11:15', '2023-06-20 05:11:15'),
(53, 1, 'admin/auth/frontend-menu/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-20 05:11:25', '2023-06-20 05:11:25'),
(54, 1, 'admin/auth/frontend-menu', 'POST', '::1', '{\"title\":\"portfolio\",\"content\":\"My Works\",\"_token\":\"KkRP7pF4tn1JnH4VzKDoNO3aa66LxdnVbn9GPGOO\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/frontend-menu\"}', '2023-06-20 05:11:35', '2023-06-20 05:11:35'),
(55, 1, 'admin/auth/frontend-menu', 'GET', '::1', '[]', '2023-06-20 05:11:35', '2023-06-20 05:11:35'),
(56, 1, 'admin/auth/frontend-menu/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-20 05:12:04', '2023-06-20 05:12:04'),
(57, 1, 'admin/auth/frontend-menu', 'POST', '::1', '{\"title\":\"contact\",\"content\":\"Contact Me\",\"_token\":\"KkRP7pF4tn1JnH4VzKDoNO3aa66LxdnVbn9GPGOO\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/frontend-menu\"}', '2023-06-20 05:12:12', '2023-06-20 05:12:12'),
(58, 1, 'admin/auth/frontend-menu', 'GET', '::1', '[]', '2023-06-20 05:12:12', '2023-06-20 05:12:12'),
(59, 1, 'admin/auth/frontend-menu', 'GET', '::1', '[]', '2023-06-21 05:03:47', '2023-06-21 05:03:47'),
(60, 1, 'admin', 'GET', '::1', '[]', '2023-06-26 04:58:03', '2023-06-26 04:58:03'),
(61, 1, 'admin', 'GET', '::1', '[]', '2023-06-27 05:06:03', '2023-06-27 05:06:03'),
(62, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-27 05:06:07', '2023-06-27 05:06:07'),
(63, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"\\u524d\\u53f0\\u9996\\u9801\\u6587\\u6848\",\"icon\":\"fa-code\",\"uri\":\"auth\\/admin-text\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"OZoaMDYEzEM9PkX6mMCDLxFT3ALO0dNu5UhA4nmN\"}', '2023-06-27 05:07:39', '2023-06-27 05:07:39'),
(64, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2023-06-27 05:07:39', '2023-06-27 05:07:39'),
(65, 1, 'admin', 'GET', '::1', '[]', '2023-06-28 05:10:23', '2023-06-28 05:10:23'),
(66, 1, 'admin', 'GET', '::1', '[]', '2023-06-28 05:11:36', '2023-06-28 05:11:36'),
(67, 1, 'admin/auth/admin-text', 'GET', '::1', '[]', '2023-06-28 05:15:14', '2023-06-28 05:15:14'),
(68, 1, 'admin/auth/frontend-menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-28 05:16:10', '2023-06-28 05:16:10'),
(69, 1, 'admin/auth/frontend-menu', 'GET', '::1', '[]', '2023-06-28 05:17:25', '2023-06-28 05:17:25'),
(70, 1, 'admin/auth/frontend-menu', 'GET', '::1', '[]', '2023-06-28 05:18:30', '2023-06-28 05:18:30'),
(71, 1, 'admin/auth/frontend-menu', 'GET', '::1', '[]', '2023-06-28 05:19:54', '2023-06-28 05:19:54'),
(72, 1, 'admin/auth/frontend-menu', 'GET', '::1', '[]', '2023-06-28 05:30:32', '2023-06-28 05:30:32'),
(73, 1, 'admin/auth/frontend-menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-28 05:30:34', '2023-06-28 05:30:34'),
(74, 1, 'admin/auth/admin-text', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-28 05:30:35', '2023-06-28 05:30:35'),
(75, 1, 'admin/auth/frontend-menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-28 05:30:37', '2023-06-28 05:30:37'),
(76, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-28 05:30:38', '2023-06-28 05:30:38'),
(77, 1, 'admin/auth/frontend-menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-28 05:30:40', '2023-06-28 05:30:40'),
(78, 1, 'admin/auth/frontend-menu', 'GET', '::1', '[]', '2023-06-28 05:30:54', '2023-06-28 05:30:54'),
(79, 1, 'admin/auth/frontend-menu', 'GET', '::1', '[]', '2023-06-28 05:30:57', '2023-06-28 05:30:57'),
(80, 1, 'admin/auth/frontend-menu', 'GET', '::1', '[]', '2023-06-29 04:56:02', '2023-06-29 04:56:02'),
(81, 1, 'admin/auth/frontend-menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-29 04:56:13', '2023-06-29 04:56:13'),
(82, 1, 'admin/auth/frontend-menu', 'GET', '::1', '[]', '2023-06-29 05:00:43', '2023-06-29 05:00:43'),
(83, 1, 'admin/auth/frontend-menu', 'GET', '::1', '[]', '2023-06-29 05:02:02', '2023-06-29 05:02:02'),
(84, 1, 'admin/auth/frontend-menu', 'GET', '::1', '[]', '2023-06-29 05:02:05', '2023-06-29 05:02:05'),
(85, 1, 'admin/auth/frontend-menu', 'GET', '::1', '[]', '2023-06-29 05:02:07', '2023-06-29 05:02:07'),
(86, 1, 'admin/auth/frontend-menu', 'GET', '::1', '[]', '2023-06-29 05:05:44', '2023-06-29 05:05:44'),
(87, 1, 'admin/auth/frontend-menu', 'GET', '::1', '[]', '2023-06-29 05:08:22', '2023-06-29 05:08:22'),
(88, 1, 'admin/auth/frontend-menu', 'GET', '::1', '[]', '2023-06-29 05:08:40', '2023-06-29 05:08:40'),
(89, 1, 'admin/auth/frontend-menu', 'GET', '::1', '[]', '2023-06-29 05:10:07', '2023-06-29 05:10:07'),
(90, 1, 'admin/auth/frontend-menu', 'GET', '::1', '[]', '2023-06-29 05:10:18', '2023-06-29 05:10:18'),
(91, 1, 'admin/auth/frontend-menu', 'GET', '::1', '[]', '2023-06-29 05:12:31', '2023-06-29 05:12:31'),
(92, 1, 'admin/auth/frontend-menu', 'GET', '::1', '{\"_columns_\":\"content,created_at,id,title,updated_at\",\"_pjax\":\"#pjax-container\"}', '2023-06-29 05:12:36', '2023-06-29 05:12:36'),
(93, 1, 'admin/auth/frontend-menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-29 05:12:42', '2023-06-29 05:12:42'),
(94, 1, 'admin/auth/frontend-menu/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-29 05:12:44', '2023-06-29 05:12:44'),
(95, 1, 'admin/auth/frontend-menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-29 05:12:46', '2023-06-29 05:12:46'),
(96, 1, 'admin/auth/frontend-menu', 'GET', '::1', '[]', '2023-06-29 05:16:38', '2023-06-29 05:16:38'),
(97, 1, 'admin/auth/frontend-menu', 'GET', '::1', '[]', '2023-06-29 05:18:25', '2023-06-29 05:18:25'),
(98, 1, 'admin/auth/frontend-menu', 'GET', '::1', '[]', '2023-06-29 05:19:04', '2023-06-29 05:19:04'),
(99, 1, 'admin/auth/frontend-menu', 'GET', '::1', '[]', '2023-06-29 05:19:28', '2023-06-29 05:19:28'),
(100, 1, 'admin/auth/frontend-menu', 'GET', '::1', '[]', '2023-06-29 05:19:47', '2023-06-29 05:19:47'),
(101, 1, 'admin/auth/frontend-menu/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-29 05:20:37', '2023-06-29 05:20:37'),
(102, 1, 'admin/auth/frontend-menu', 'POST', '::1', '{\"title\":\"\\u3105\",\"content\":\"\\u3105\",\"_token\":\"OUqI2dsbM8l5eDdG5isPWHTw9CrklsBD9DDbM3uG\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/frontend-menu\"}', '2023-06-29 05:20:41', '2023-06-29 05:20:41'),
(103, 1, 'admin/auth/frontend-menu', 'GET', '::1', '[]', '2023-06-29 05:20:41', '2023-06-29 05:20:41'),
(104, 1, 'admin/auth/frontend-menu/7/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-29 05:20:44', '2023-06-29 05:20:44'),
(105, 1, 'admin/auth/frontend-menu/7', 'PUT', '::1', '{\"title\":\"\\u3105\\u3109\",\"content\":\"\\u3109\\u3105\",\"_token\":\"OUqI2dsbM8l5eDdG5isPWHTw9CrklsBD9DDbM3uG\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/frontend-menu\"}', '2023-06-29 05:20:48', '2023-06-29 05:20:48'),
(106, 1, 'admin/auth/frontend-menu', 'GET', '::1', '[]', '2023-06-29 05:20:48', '2023-06-29 05:20:48'),
(107, 1, 'admin/auth/frontend-menu/7', 'DELETE', '::1', '{\"_method\":\"delete\",\"_token\":\"OUqI2dsbM8l5eDdG5isPWHTw9CrklsBD9DDbM3uG\"}', '2023-06-29 05:20:52', '2023-06-29 05:20:52'),
(108, 1, 'admin/auth/frontend-menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-29 05:20:52', '2023-06-29 05:20:52'),
(109, 1, 'admin/auth/frontend-menu/1', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-29 05:21:21', '2023-06-29 05:21:21'),
(110, 1, 'admin/auth/frontend-menu/1', 'GET', '::1', '[]', '2023-06-29 05:22:53', '2023-06-29 05:22:53'),
(111, 1, 'admin/auth/frontend-menu/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-29 05:23:31', '2023-06-29 05:23:31'),
(112, 1, 'admin/auth/frontend-menu/1/edit', 'GET', '::1', '[]', '2023-06-29 05:28:11', '2023-06-29 05:28:11'),
(113, 1, 'admin/auth/frontend-menu/1/edit', 'GET', '::1', '[]', '2023-06-29 05:28:14', '2023-06-29 05:28:14'),
(114, 1, 'admin/auth/frontend-menu/1/edit', 'GET', '::1', '[]', '2023-06-29 05:29:32', '2023-06-29 05:29:32'),
(115, 1, 'admin/auth/frontend-menu/1/edit', 'GET', '::1', '[]', '2023-06-29 05:29:33', '2023-06-29 05:29:33'),
(116, 1, 'admin/auth/frontend-menu/1/edit', 'GET', '::1', '[]', '2023-06-29 05:29:36', '2023-06-29 05:29:36'),
(117, 1, 'admin/auth/frontend-menu/1/edit', 'GET', '::1', '[]', '2023-06-29 05:30:02', '2023-06-29 05:30:02'),
(118, 1, 'admin/auth/frontend-menu/1/edit', 'GET', '::1', '[]', '2023-06-29 05:30:47', '2023-06-29 05:30:47'),
(119, 1, 'admin/auth/frontend-menu/1/edit', 'GET', '::1', '[]', '2023-06-29 05:33:57', '2023-06-29 05:33:57'),
(120, 1, 'admin/auth/frontend-menu/1/edit', 'GET', '::1', '[]', '2023-06-29 05:34:42', '2023-06-29 05:34:42'),
(121, 1, 'admin/auth/frontend-menu/1/edit', 'GET', '::1', '[]', '2023-06-29 05:34:58', '2023-06-29 05:34:58'),
(122, 1, 'admin/auth/frontend-menu/1/edit', 'GET', '::1', '[]', '2023-06-29 05:35:10', '2023-06-29 05:35:10'),
(123, 1, 'admin/auth/frontend-menu/1/edit', 'GET', '::1', '[]', '2023-06-29 05:35:28', '2023-06-29 05:35:28'),
(124, 1, 'admin/auth/admin-text', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-29 05:37:52', '2023-06-29 05:37:52'),
(125, 1, 'admin/auth/admin-text', 'GET', '::1', '[]', '2023-06-30 04:45:11', '2023-06-30 04:45:11'),
(126, 1, 'admin/auth/frontend-menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 04:45:16', '2023-06-30 04:45:16'),
(127, 1, 'admin/auth/admin-text', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 04:45:23', '2023-06-30 04:45:23'),
(128, 1, 'admin/auth/admin-text', 'GET', '::1', '[]', '2023-06-30 04:46:54', '2023-06-30 04:46:54'),
(129, 1, 'admin/auth/admin-text', 'GET', '::1', '[]', '2023-06-30 04:46:59', '2023-06-30 04:46:59'),
(130, 1, 'admin/auth/admin-text', 'GET', '::1', '[]', '2023-06-30 04:47:12', '2023-06-30 04:47:12'),
(131, 1, 'admin/auth/admin-text', 'GET', '::1', '[]', '2023-06-30 04:48:04', '2023-06-30 04:48:04'),
(132, 1, 'admin/auth/admin-text', 'GET', '::1', '[]', '2023-06-30 04:48:15', '2023-06-30 04:48:15'),
(133, 1, 'admin/auth/admin-text', 'GET', '::1', '[]', '2023-06-30 04:48:57', '2023-06-30 04:48:57'),
(134, 1, 'admin/auth/admin-text', 'GET', '::1', '[]', '2023-06-30 04:49:55', '2023-06-30 04:49:55'),
(135, 1, 'admin/auth/admin-text', 'GET', '::1', '[]', '2023-06-30 04:50:54', '2023-06-30 04:50:54'),
(136, 1, 'admin/auth/admin-text', 'GET', '::1', '[]', '2023-06-30 04:51:20', '2023-06-30 04:51:20'),
(137, 1, 'admin/auth/admin-text', 'GET', '::1', '[]', '2023-06-30 04:51:39', '2023-06-30 04:51:39'),
(138, 1, 'admin/auth/admin-text', 'GET', '::1', '[]', '2023-06-30 04:52:30', '2023-06-30 04:52:30'),
(139, 1, 'admin/auth/frontend-menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 04:52:39', '2023-06-30 04:52:39'),
(140, 1, 'admin/auth/admin-text', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 04:53:19', '2023-06-30 04:53:19'),
(141, 1, 'admin/auth/admin-text', 'GET', '::1', '[]', '2023-06-30 04:55:18', '2023-06-30 04:55:18'),
(142, 1, 'admin/auth/admin-text/1', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 04:55:24', '2023-06-30 04:55:24'),
(143, 1, 'admin/auth/admin-text/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 04:55:29', '2023-06-30 04:55:29'),
(144, 1, 'admin/auth/admin-text', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 04:55:40', '2023-06-30 04:55:40'),
(145, 1, 'admin/auth/admin-text/1', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 04:55:42', '2023-06-30 04:55:42'),
(146, 1, 'admin/auth/admin-text/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 04:55:45', '2023-06-30 04:55:45'),
(147, 1, 'admin/auth/admin-text/1/edit', 'GET', '::1', '[]', '2023-06-30 04:56:15', '2023-06-30 04:56:15'),
(148, 1, 'admin/auth/admin-text/1', 'PUT', '::1', '{\"title\":\"Emily Jonesa\",\"content\":\"I\'m a passionate <span>graphic designer<\\/span> from New York\",\"_token\":\"ETviOXyuLXgoVq8uVPR5owmD0bqVtj2Zw90IB02o\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/admin-text\"}', '2023-06-30 04:56:51', '2023-06-30 04:56:51'),
(149, 1, 'admin/auth/admin-text', 'GET', '::1', '[]', '2023-06-30 04:56:51', '2023-06-30 04:56:51'),
(150, 1, 'admin/auth/admin-text/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 04:57:08', '2023-06-30 04:57:08'),
(151, 1, 'admin/auth/admin-text/1', 'PUT', '::1', '{\"title\":\"Emily Jones\",\"content\":\"I\'m a passionate <span>graphic designer<\\/span> from New York\",\"_token\":\"ETviOXyuLXgoVq8uVPR5owmD0bqVtj2Zw90IB02o\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/admin-text\"}', '2023-06-30 04:57:10', '2023-06-30 04:57:10'),
(152, 1, 'admin/auth/admin-text', 'GET', '::1', '[]', '2023-06-30 04:57:10', '2023-06-30 04:57:10'),
(153, 1, 'admin/auth/admin-text', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 05:05:56', '2023-06-30 05:05:56'),
(154, 1, 'admin/auth/admin-text', 'GET', '::1', '[]', '2023-06-30 05:06:06', '2023-06-30 05:06:06'),
(155, 1, 'admin/auth/admin-text', 'GET', '::1', '[]', '2023-06-30 05:06:13', '2023-06-30 05:06:13'),
(156, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 05:06:26', '2023-06-30 05:06:26'),
(157, 1, 'admin/auth/frontend-menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 05:06:27', '2023-06-30 05:06:27'),
(158, 1, 'admin/auth/admin-text', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 05:06:32', '2023-06-30 05:06:32'),
(159, 1, 'admin/auth/admin-text', 'GET', '::1', '[]', '2023-06-30 05:09:05', '2023-06-30 05:09:05'),
(160, 1, 'admin/auth/admin-text', 'GET', '::1', '[]', '2023-06-30 05:09:10', '2023-06-30 05:09:10'),
(161, 1, 'admin/auth/admin-text', 'GET', '::1', '[]', '2023-06-30 05:09:12', '2023-06-30 05:09:12'),
(162, 1, 'admin', 'GET', '::1', '[]', '2023-06-30 10:08:39', '2023-06-30 10:08:39'),
(163, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:08:43', '2023-06-30 10:08:43'),
(164, 1, 'admin/auth/menu/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:08:45', '2023-06-30 10:08:45'),
(165, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:08:51', '2023-06-30 10:08:51'),
(166, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"\\u793e\\u7fa4\\u9023\\u7d50\",\"icon\":\"fa-angellist\",\"uri\":\"auth\\/social\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"RXvWdJJfbw0yUsl7VcQ7lo0z55MPLBPhHU9J6BmK\"}', '2023-06-30 10:10:11', '2023-06-30 10:10:11'),
(167, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2023-06-30 10:10:12', '2023-06-30 10:10:12'),
(168, 1, 'admin/auth/menu/10/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:10:53', '2023-06-30 10:10:53'),
(169, 1, 'admin/auth/frontend-menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:11:55', '2023-06-30 10:11:55'),
(170, 1, 'admin/auth/frontend-menu', 'GET', '::1', '[]', '2023-06-30 10:11:56', '2023-06-30 10:11:56'),
(171, 1, 'admin/auth/social', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:11:58', '2023-06-30 10:11:58'),
(172, 1, 'admin/auth/social/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:13:00', '2023-06-30 10:13:00'),
(173, 1, 'admin/auth/social/1', 'PUT', '::1', '{\"href\":null,\"name\":\"twitter\",\"icon\":\"bi bi-twitter\\u3105\",\"_token\":\"RXvWdJJfbw0yUsl7VcQ7lo0z55MPLBPhHU9J6BmK\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/social\"}', '2023-06-30 10:13:03', '2023-06-30 10:13:03'),
(174, 1, 'admin/auth/social', 'GET', '::1', '[]', '2023-06-30 10:13:04', '2023-06-30 10:13:04'),
(175, 1, 'admin/auth/social/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:13:06', '2023-06-30 10:13:06'),
(176, 1, 'admin/auth/social/1', 'PUT', '::1', '{\"href\":null,\"name\":\"twitter\",\"icon\":\"bi bi-twitter\",\"_token\":\"RXvWdJJfbw0yUsl7VcQ7lo0z55MPLBPhHU9J6BmK\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/social\"}', '2023-06-30 10:13:08', '2023-06-30 10:13:08'),
(177, 1, 'admin/auth/social', 'GET', '::1', '[]', '2023-06-30 10:13:09', '2023-06-30 10:13:09'),
(178, 1, 'admin/auth/social/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:13:10', '2023-06-30 10:13:10'),
(179, 1, 'admin/auth/social/2', 'PUT', '::1', '{\"href\":null,\"name\":\"facebook\",\"icon\":\"bi bi-facebook\",\"_token\":\"RXvWdJJfbw0yUsl7VcQ7lo0z55MPLBPhHU9J6BmK\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/social\"}', '2023-06-30 10:13:12', '2023-06-30 10:13:12'),
(180, 1, 'admin/auth/social', 'GET', '::1', '[]', '2023-06-30 10:13:13', '2023-06-30 10:13:13'),
(181, 1, 'admin/auth/social/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:13:14', '2023-06-30 10:13:14'),
(182, 1, 'admin/auth/social/2', 'PUT', '::1', '{\"href\":null,\"name\":\"facebook1\",\"icon\":\"bi bi-facebook\",\"_token\":\"RXvWdJJfbw0yUsl7VcQ7lo0z55MPLBPhHU9J6BmK\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/social\"}', '2023-06-30 10:13:22', '2023-06-30 10:13:22'),
(183, 1, 'admin/auth/social', 'GET', '::1', '[]', '2023-06-30 10:13:23', '2023-06-30 10:13:23'),
(184, 1, 'admin/auth/social/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:13:24', '2023-06-30 10:13:24'),
(185, 1, 'admin/auth/social/2', 'PUT', '::1', '{\"href\":null,\"name\":\"facebook\",\"icon\":\"bi bi-facebook\",\"_token\":\"RXvWdJJfbw0yUsl7VcQ7lo0z55MPLBPhHU9J6BmK\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/social\"}', '2023-06-30 10:13:27', '2023-06-30 10:13:27'),
(186, 1, 'admin/auth/social', 'GET', '::1', '[]', '2023-06-30 10:13:27', '2023-06-30 10:13:27'),
(187, 1, 'admin/auth/social/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:13:28', '2023-06-30 10:13:28'),
(188, 1, 'admin/auth/social/3', 'PUT', '::1', '{\"href\":null,\"name\":\"instagram1\",\"icon\":\"bi bi-instagram\",\"_token\":\"RXvWdJJfbw0yUsl7VcQ7lo0z55MPLBPhHU9J6BmK\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/social\"}', '2023-06-30 10:13:30', '2023-06-30 10:13:30'),
(189, 1, 'admin/auth/social', 'GET', '::1', '[]', '2023-06-30 10:13:31', '2023-06-30 10:13:31'),
(190, 1, 'admin/auth/social/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:13:32', '2023-06-30 10:13:32'),
(191, 1, 'admin/auth/social/3', 'PUT', '::1', '{\"href\":null,\"name\":\"instagram\",\"icon\":\"bi bi-instagram\",\"_token\":\"RXvWdJJfbw0yUsl7VcQ7lo0z55MPLBPhHU9J6BmK\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/social\"}', '2023-06-30 10:13:34', '2023-06-30 10:13:34'),
(192, 1, 'admin/auth/social', 'GET', '::1', '[]', '2023-06-30 10:13:34', '2023-06-30 10:13:34'),
(193, 1, 'admin/auth/social/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:13:38', '2023-06-30 10:13:38'),
(194, 1, 'admin/auth/social/4', 'PUT', '::1', '{\"href\":null,\"name\":\"linkedin1\",\"icon\":\"bi bi-linkedin\",\"_token\":\"RXvWdJJfbw0yUsl7VcQ7lo0z55MPLBPhHU9J6BmK\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/social\"}', '2023-06-30 10:13:40', '2023-06-30 10:13:40'),
(195, 1, 'admin/auth/social', 'GET', '::1', '[]', '2023-06-30 10:13:40', '2023-06-30 10:13:40'),
(196, 1, 'admin/auth/social/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:13:42', '2023-06-30 10:13:42'),
(197, 1, 'admin/auth/social/4', 'PUT', '::1', '{\"href\":null,\"name\":\"linkedin\",\"icon\":\"bi bi-linkedin\",\"_token\":\"RXvWdJJfbw0yUsl7VcQ7lo0z55MPLBPhHU9J6BmK\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/social\"}', '2023-06-30 10:13:44', '2023-06-30 10:13:44'),
(198, 1, 'admin/auth/social', 'GET', '::1', '[]', '2023-06-30 10:13:44', '2023-06-30 10:13:44'),
(199, 1, 'admin/auth/social', 'GET', '::1', '[]', '2023-06-30 10:14:59', '2023-06-30 10:14:59'),
(200, 1, 'admin/auth/social', 'GET', '::1', '[]', '2023-06-30 10:16:14', '2023-06-30 10:16:14'),
(201, 1, 'admin/auth/social', 'GET', '::1', '[]', '2023-06-30 10:16:55', '2023-06-30 10:16:55'),
(202, 1, 'admin/auth/social', 'GET', '::1', '[]', '2023-06-30 10:17:21', '2023-06-30 10:17:21'),
(203, 1, 'admin/auth/social', 'GET', '::1', '[]', '2023-06-30 10:17:29', '2023-06-30 10:17:29'),
(204, 1, 'admin/auth/social', 'GET', '::1', '[]', '2023-06-30 10:17:54', '2023-06-30 10:17:54'),
(205, 1, 'admin/auth/social', 'GET', '::1', '[]', '2023-06-30 10:19:15', '2023-06-30 10:19:15'),
(206, 1, 'admin/auth/social/1', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:19:26', '2023-06-30 10:19:26'),
(207, 1, 'admin/auth/social/1', 'GET', '::1', '[]', '2023-06-30 10:26:02', '2023-06-30 10:26:02'),
(208, 1, 'admin/auth/social/1', 'GET', '::1', '[]', '2023-06-30 10:27:35', '2023-06-30 10:27:35'),
(209, 1, 'admin/auth/social/1', 'GET', '::1', '[]', '2023-06-30 10:27:47', '2023-06-30 10:27:47'),
(210, 1, 'admin/auth/social/1', 'GET', '::1', '[]', '2023-06-30 10:27:48', '2023-06-30 10:27:48'),
(211, 1, 'admin/auth/social/1', 'GET', '::1', '[]', '2023-06-30 10:27:50', '2023-06-30 10:27:50'),
(212, 1, 'admin/auth/social/1', 'GET', '::1', '[]', '2023-06-30 10:28:04', '2023-06-30 10:28:04'),
(213, 1, 'admin/auth/social/1', 'GET', '::1', '[]', '2023-06-30 10:28:07', '2023-06-30 10:28:07'),
(214, 1, 'admin/auth/social/1', 'GET', '::1', '[]', '2023-06-30 10:28:24', '2023-06-30 10:28:24'),
(215, 1, 'admin/auth/social/bi%20bi-twitter', 'GET', '::1', '[]', '2023-06-30 10:28:25', '2023-06-30 10:28:25'),
(216, 1, 'admin/auth/social/bi%20bi-twitter', 'GET', '::1', '[]', '2023-06-30 10:28:30', '2023-06-30 10:28:30'),
(217, 1, 'admin/auth/social/1', 'GET', '::1', '[]', '2023-06-30 10:28:57', '2023-06-30 10:28:57'),
(218, 1, 'admin/auth/social/1', 'GET', '::1', '[]', '2023-06-30 10:29:34', '2023-06-30 10:29:34'),
(219, 1, 'admin/auth/social/bi%20bi-twitter', 'GET', '::1', '[]', '2023-06-30 10:29:35', '2023-06-30 10:29:35'),
(220, 1, 'admin/auth/social/1', 'GET', '::1', '[]', '2023-06-30 10:29:59', '2023-06-30 10:29:59'),
(221, 1, 'admin/auth/social/1', 'GET', '::1', '[]', '2023-06-30 10:30:30', '2023-06-30 10:30:30'),
(222, 1, 'admin/auth/social/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:30:44', '2023-06-30 10:30:44'),
(223, 1, 'admin/auth/admin-text', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:32:43', '2023-06-30 10:32:43'),
(224, 1, 'admin/auth/admin-text/1', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:32:45', '2023-06-30 10:32:45'),
(225, 1, 'admin/auth/admin-text/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:32:47', '2023-06-30 10:32:47'),
(226, 1, 'admin/auth/frontend-menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:32:57', '2023-06-30 10:32:57'),
(227, 1, 'admin/auth/frontend-menu/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:32:58', '2023-06-30 10:32:58'),
(228, 1, 'admin/auth/admin-text', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:33:03', '2023-06-30 10:33:03'),
(229, 1, 'admin/auth/social', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:33:07', '2023-06-30 10:33:07'),
(230, 1, 'admin/auth/social/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:33:08', '2023-06-30 10:33:08'),
(231, 1, 'admin/auth/social', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:33:13', '2023-06-30 10:33:13'),
(232, 1, 'admin/auth/social/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:33:15', '2023-06-30 10:33:15'),
(233, 1, 'admin/auth/social/1/edit', 'GET', '::1', '[]', '2023-06-30 10:33:38', '2023-06-30 10:33:38'),
(234, 1, 'admin/auth/social/1/edit', 'GET', '::1', '[]', '2023-06-30 10:34:17', '2023-06-30 10:34:17'),
(235, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:34:56', '2023-06-30 10:34:56'),
(236, 1, 'admin/auth/menu/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:35:09', '2023-06-30 10:35:09'),
(237, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:35:13', '2023-06-30 10:35:13'),
(238, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"\\u524d\\u53f0\\u9996\\u9801\",\"icon\":\"fa-indent\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"RXvWdJJfbw0yUsl7VcQ7lo0z55MPLBPhHU9J6BmK\"}', '2023-06-30 10:35:41', '2023-06-30 10:35:41'),
(239, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2023-06-30 10:35:41', '2023-06-30 10:35:41'),
(240, 1, 'admin/auth/menu/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:36:09', '2023-06-30 10:36:09'),
(241, 1, 'admin/auth/menu/11', 'PUT', '::1', '{\"parent_id\":\"0\",\"title\":\"\\u524d\\u53f0\\u9996\\u9801\",\"icon\":\"fa-indent\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"RXvWdJJfbw0yUsl7VcQ7lo0z55MPLBPhHU9J6BmK\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/menu\"}', '2023-06-30 10:36:16', '2023-06-30 10:36:16'),
(242, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2023-06-30 10:36:16', '2023-06-30 10:36:16'),
(243, 1, 'admin/auth/menu/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:36:27', '2023-06-30 10:36:27'),
(244, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:36:30', '2023-06-30 10:36:30'),
(245, 1, 'admin/auth/menu/9/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:36:36', '2023-06-30 10:36:36'),
(246, 1, 'admin/auth/menu/9', 'PUT', '::1', '{\"parent_id\":\"11\",\"title\":\"\\u524d\\u53f0\\u9996\\u9801\\u6587\\u6848\",\"icon\":\"fa-code\",\"uri\":\"auth\\/admin-text\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"RXvWdJJfbw0yUsl7VcQ7lo0z55MPLBPhHU9J6BmK\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/menu\"}', '2023-06-30 10:36:46', '2023-06-30 10:36:46'),
(247, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2023-06-30 10:36:46', '2023-06-30 10:36:46'),
(248, 1, 'admin/auth/menu/10/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-30 10:36:57', '2023-06-30 10:36:57'),
(249, 1, 'admin/auth/menu/10', 'PUT', '::1', '{\"parent_id\":\"11\",\"title\":\"\\u793e\\u7fa4\\u9023\\u7d50\",\"icon\":\"fa-angellist\",\"uri\":\"auth\\/social\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"RXvWdJJfbw0yUsl7VcQ7lo0z55MPLBPhHU9J6BmK\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/menu\"}', '2023-06-30 10:37:01', '2023-06-30 10:37:01'),
(250, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2023-06-30 10:37:02', '2023-06-30 10:37:02'),
(251, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2023-06-30 10:37:25', '2023-06-30 10:37:25'),
(252, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2023-07-03 04:56:43', '2023-07-03 04:56:43'),
(253, 1, 'admin/auth/social', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-03 04:58:33', '2023-07-03 04:58:33'),
(254, 1, 'admin', 'GET', '::1', '[]', '2023-07-05 04:51:09', '2023-07-05 04:51:09'),
(255, 1, 'admin/auth/admin-text', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-05 04:51:12', '2023-07-05 04:51:12'),
(256, 1, 'admin', 'GET', '::1', '[]', '2023-07-06 08:22:28', '2023-07-06 08:22:28'),
(257, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-06 08:22:57', '2023-07-06 08:22:57'),
(258, 1, 'admin/auth/menu/9/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-06 08:23:38', '2023-07-06 08:23:38'),
(259, 1, 'admin/auth/menu/9', 'PUT', '::1', '{\"parent_id\":\"11\",\"title\":\"\\u9996\\u9801\\u6587\\u6848\",\"icon\":\"fa-code\",\"uri\":\"auth\\/admin-text\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"HYuIYkJACGQMRnZUsuTucDvDmd181obXo7Y4tnoM\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/menu\"}', '2023-07-06 08:23:41', '2023-07-06 08:23:41'),
(260, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2023-07-06 08:23:41', '2023-07-06 08:23:41'),
(261, 1, 'admin/auth/menu/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-06 08:23:44', '2023-07-06 08:23:44'),
(262, 1, 'admin/auth/menu/11', 'PUT', '::1', '{\"parent_id\":\"0\",\"title\":\"\\u524d\\u53f0\",\"icon\":\"fa-indent\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"HYuIYkJACGQMRnZUsuTucDvDmd181obXo7Y4tnoM\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/menu\"}', '2023-07-06 08:23:47', '2023-07-06 08:23:47'),
(263, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2023-07-06 08:23:48', '2023-07-06 08:23:48'),
(264, 1, 'admin/auth/menu/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-06 08:23:51', '2023-07-06 08:23:51'),
(265, 1, 'admin/auth/menu/8', 'PUT', '::1', '{\"parent_id\":\"0\",\"title\":\"\\u4e3b\\u9078\\u55ae\",\"icon\":\"fa-bars\",\"uri\":\"auth\\/frontend-menu\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"HYuIYkJACGQMRnZUsuTucDvDmd181obXo7Y4tnoM\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/menu\"}', '2023-07-06 08:23:58', '2023-07-06 08:23:58'),
(266, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2023-07-06 08:23:58', '2023-07-06 08:23:58'),
(267, 1, 'admin/auth/menu/10/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-06 08:24:12', '2023-07-06 08:24:12'),
(268, 1, 'admin/auth/menu/10', 'PUT', '::1', '{\"parent_id\":\"11\",\"title\":\"\\u9996\\u9801\\u793e\\u7fa4\",\"icon\":\"fa-angellist\",\"uri\":\"auth\\/social\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"HYuIYkJACGQMRnZUsuTucDvDmd181obXo7Y4tnoM\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/menu\"}', '2023-07-06 08:24:18', '2023-07-06 08:24:18'),
(269, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2023-07-06 08:24:18', '2023-07-06 08:24:18'),
(270, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"11\",\"title\":\"\\u4f5c\\u54c1\\u5206\\u985e\",\"icon\":\"fa-bars\",\"uri\":\"auth\\/portfolio-category\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"HYuIYkJACGQMRnZUsuTucDvDmd181obXo7Y4tnoM\"}', '2023-07-06 08:28:03', '2023-07-06 08:28:03'),
(271, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2023-07-06 08:28:03', '2023-07-06 08:28:03'),
(272, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"HYuIYkJACGQMRnZUsuTucDvDmd181obXo7Y4tnoM\",\"_order\":\"[{\\\"id\\\":11,\\\"children\\\":[{\\\"id\\\":8},{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":12}]},{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2023-07-06 08:28:13', '2023-07-06 08:28:13'),
(273, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-06 08:28:13', '2023-07-06 08:28:13'),
(274, 1, 'admin/auth/menu/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-06 08:28:19', '2023-07-06 08:28:19'),
(275, 1, 'admin/auth/menu/11', 'PUT', '::1', '{\"parent_id\":\"0\",\"title\":\"\\u524d\\u53f0\",\"icon\":\"fa-asterisk\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"HYuIYkJACGQMRnZUsuTucDvDmd181obXo7Y4tnoM\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/resume.localhost\\/admin\\/auth\\/menu\"}', '2023-07-06 08:28:30', '2023-07-06 08:28:30'),
(276, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2023-07-06 08:28:31', '2023-07-06 08:28:31'),
(277, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2023-07-06 08:28:34', '2023-07-06 08:28:34'),
(278, 1, 'admin/auth/portfolio-category', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-06 08:28:41', '2023-07-06 08:28:41'),
(279, 1, 'admin/auth/portfolio-category', 'GET', '::1', '[]', '2023-07-06 08:33:58', '2023-07-06 08:33:58'),
(280, 1, 'admin/auth/portfolio-category', 'GET', '::1', '[]', '2023-07-06 08:34:34', '2023-07-06 08:34:34'),
(281, 1, 'admin/auth/portfolio-category', 'GET', '::1', '[]', '2023-07-06 08:34:36', '2023-07-06 08:34:36'),
(282, 1, 'admin/auth/portfolio-category', 'GET', '::1', '[]', '2023-07-06 08:34:41', '2023-07-06 08:34:41'),
(283, 1, 'admin/auth/portfolio-category', 'GET', '::1', '[]', '2023-07-07 03:49:00', '2023-07-07 03:49:00'),
(284, 1, 'admin/auth/portfolio-category', 'GET', '::1', '[]', '2023-07-07 03:49:15', '2023-07-07 03:49:15'),
(285, 1, 'admin/auth/portfolio-category', 'GET', '::1', '[]', '2023-07-07 03:49:53', '2023-07-07 03:49:53'),
(286, 1, 'admin/auth/portfolio-category', 'GET', '::1', '[]', '2023-07-07 03:50:54', '2023-07-07 03:50:54'),
(287, 1, 'admin/auth/portfolio-category/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-07 03:51:29', '2023-07-07 03:51:29'),
(288, 1, 'admin/auth/portfolio-category', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-07 04:04:45', '2023-07-07 04:04:45'),
(289, 1, 'admin/auth/portfolio-category/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-07 04:04:46', '2023-07-07 04:04:46'),
(290, 1, 'admin/auth/portfolio-category', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-07 04:04:58', '2023-07-07 04:04:58'),
(291, 1, 'admin/auth/portfolio-category', 'GET', '::1', '[]', '2023-07-07 04:07:16', '2023-07-07 04:07:16'),
(292, 1, 'admin/auth/portfolio-category/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-07 04:07:20', '2023-07-07 04:07:20'),
(293, 1, 'admin/auth/portfolio-category/1/edit', 'GET', '::1', '[]', '2023-07-07 04:09:10', '2023-07-07 04:09:10'),
(294, 1, 'admin/auth/portfolio-category/1/edit', 'GET', '::1', '[]', '2023-07-07 04:10:16', '2023-07-07 04:10:16'),
(295, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-07 04:23:02', '2023-07-07 04:23:02'),
(296, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"11\",\"title\":\"\\u4f5c\\u54c1\\u5217\\u8868\",\"icon\":\"fa-diamond\",\"uri\":\"auth\\/portfolio\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"x9XlFUgb5EBy66Z7jcCDvTxhklA19cTyPGSHXpYM\"}', '2023-07-07 04:23:47', '2023-07-07 04:23:47'),
(297, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2023-07-07 04:23:47', '2023-07-07 04:23:47'),
(298, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"x9XlFUgb5EBy66Z7jcCDvTxhklA19cTyPGSHXpYM\",\"_order\":\"[{\\\"id\\\":11,\\\"children\\\":[{\\\"id\\\":8},{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":12},{\\\"id\\\":13}]},{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2023-07-07 04:23:53', '2023-07-07 04:23:53'),
(299, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-07 04:23:53', '2023-07-07 04:23:53'),
(300, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2023-07-07 04:23:57', '2023-07-07 04:23:57'),
(301, 1, 'admin/auth/portfolio', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-07 04:23:59', '2023-07-07 04:23:59'),
(302, 1, 'admin/auth/portfolio', 'GET', '::1', '[]', '2023-07-07 04:24:51', '2023-07-07 04:24:51'),
(303, 1, 'admin/auth/portfolio', 'GET', '::1', '[]', '2023-07-07 04:25:22', '2023-07-07 04:25:22'),
(304, 1, 'admin/auth/portfolio', 'GET', '::1', '[]', '2023-07-07 04:25:40', '2023-07-07 04:25:40'),
(305, 1, 'admin/auth/portfolio', 'GET', '::1', '[]', '2023-07-07 04:26:15', '2023-07-07 04:26:15'),
(306, 1, 'admin/auth/portfolio', 'GET', '::1', '[]', '2023-07-07 04:27:25', '2023-07-07 04:27:25'),
(307, 1, 'admin/auth/portfolio', 'GET', '::1', '[]', '2023-07-07 04:31:21', '2023-07-07 04:31:21'),
(308, 1, 'admin/auth/portfolio', 'GET', '::1', '[]', '2023-07-07 04:31:26', '2023-07-07 04:31:26'),
(309, 1, 'admin/auth/portfolio', 'GET', '::1', '[]', '2023-07-07 04:39:48', '2023-07-07 04:39:48'),
(310, 1, 'admin/auth/portfolio', 'GET', '::1', '[]', '2023-07-07 04:40:49', '2023-07-07 04:40:49'),
(311, 1, 'admin/auth/portfolio', 'GET', '::1', '[]', '2023-07-07 04:40:52', '2023-07-07 04:40:52'),
(312, 1, 'admin/auth/portfolio', 'GET', '::1', '[]', '2023-07-07 04:41:04', '2023-07-07 04:41:04'),
(313, 1, 'admin/auth/portfolio', 'GET', '::1', '[]', '2023-07-07 04:41:07', '2023-07-07 04:41:07'),
(314, 1, 'admin/auth/portfolio', 'GET', '::1', '[]', '2023-07-07 04:41:41', '2023-07-07 04:41:41'),
(315, 1, 'admin/auth/portfolio', 'GET', '::1', '[]', '2023-07-07 05:02:17', '2023-07-07 05:02:17'),
(316, 1, 'admin/auth/portfolio', 'GET', '::1', '[]', '2023-07-07 05:02:33', '2023-07-07 05:02:33'),
(317, 1, 'admin/auth/portfolio', 'GET', '::1', '[]', '2023-07-07 05:03:31', '2023-07-07 05:03:31'),
(318, 1, 'admin/auth/portfolio', 'GET', '::1', '[]', '2023-07-07 05:07:11', '2023-07-07 05:07:11'),
(319, 1, 'admin/auth/portfolio', 'GET', '::1', '[]', '2023-07-07 05:07:18', '2023-07-07 05:07:18'),
(320, 1, 'admin/auth/portfolio', 'GET', '::1', '{\"id\":null,\"pcid\":\"2\",\"created_at\":{\"start\":null,\"end\":null},\"updated_at\":{\"start\":null,\"end\":null},\"_pjax\":\"#pjax-container\"}', '2023-07-07 05:07:23', '2023-07-07 05:07:23'),
(321, 1, 'admin/auth/portfolio', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"id\":null,\"pcid\":\"1\",\"created_at\":{\"start\":null,\"end\":null},\"updated_at\":{\"start\":null,\"end\":null}}', '2023-07-07 05:07:26', '2023-07-07 05:07:26'),
(322, 1, 'admin/auth/portfolio', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"id\":null,\"pcid\":\"3\",\"created_at\":{\"start\":null,\"end\":null},\"updated_at\":{\"start\":null,\"end\":null}}', '2023-07-07 05:07:29', '2023-07-07 05:07:29'),
(323, 1, 'admin/auth/portfolio', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-07 05:07:30', '2023-07-07 05:07:30'),
(324, 1, 'admin/auth/portfolio', 'GET', '::1', '[]', '2023-07-07 05:08:06', '2023-07-07 05:08:06'),
(325, 1, 'admin/auth/portfolio', 'GET', '::1', '[]', '2023-07-07 05:08:25', '2023-07-07 05:08:25'),
(326, 1, 'admin/auth/portfolio', 'GET', '::1', '[]', '2023-07-07 05:15:24', '2023-07-07 05:15:24'),
(327, 1, 'admin/auth/portfolio', 'GET', '::1', '[]', '2023-07-07 05:15:29', '2023-07-07 05:15:29'),
(328, 1, 'admin/auth/portfolio', 'GET', '::1', '[]', '2023-07-07 05:15:31', '2023-07-07 05:15:31'),
(329, 1, 'admin/auth/portfolio', 'GET', '::1', '{\"_sort\":{\"column\":\"portfolio_category.name\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2023-07-07 05:15:43', '2023-07-07 05:15:43'),
(330, 1, 'admin/auth/portfolio', 'GET', '::1', '{\"_sort\":{\"column\":\"portfolio_category.name\",\"type\":\"desc\"}}', '2023-07-07 05:15:47', '2023-07-07 05:15:47'),
(331, 1, 'admin/auth/portfolio/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-07 05:16:09', '2023-07-07 05:16:09'),
(332, 1, 'admin/auth/portfolio/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-07 05:16:10', '2023-07-07 05:16:10'),
(333, 1, 'admin/auth/portfolio', 'GET', '::1', '{\"_sort\":{\"column\":\"portfolio_category.name\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2023-07-07 05:16:19', '2023-07-07 05:16:19'),
(334, 1, 'admin/auth/portfolio/2', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-07 05:16:50', '2023-07-07 05:16:50'),
(335, 1, 'admin/auth/portfolio/2', 'GET', '::1', '[]', '2023-07-07 05:16:52', '2023-07-07 05:16:52'),
(336, 1, 'admin/auth/portfolio/2', 'GET', '::1', '[]', '2023-07-07 05:20:23', '2023-07-07 05:20:23'),
(337, 1, 'admin/auth/portfolio/2', 'GET', '::1', '[]', '2023-07-07 05:22:24', '2023-07-07 05:22:24'),
(338, 1, 'admin/auth/portfolio/2', 'GET', '::1', '[]', '2023-07-07 05:23:58', '2023-07-07 05:23:58'),
(339, 1, 'admin/auth/portfolio/2', 'GET', '::1', '[]', '2023-07-07 05:24:03', '2023-07-07 05:24:03'),
(340, 1, 'admin/auth/portfolio/2', 'GET', '::1', '[]', '2023-07-07 05:25:59', '2023-07-07 05:25:59'),
(341, 1, 'admin/auth/portfolio/2', 'GET', '::1', '[]', '2023-07-07 05:26:01', '2023-07-07 05:26:01'),
(342, 1, 'admin/auth/portfolio/2', 'GET', '::1', '[]', '2023-07-07 05:26:04', '2023-07-07 05:26:04'),
(343, 1, 'admin/auth/portfolio/2', 'GET', '::1', '[]', '2023-07-07 05:28:24', '2023-07-07 05:28:24'),
(344, 1, 'admin/auth/portfolio/2', 'GET', '::1', '[]', '2023-07-07 05:28:25', '2023-07-07 05:28:25'),
(345, 1, 'admin/auth/portfolio/2', 'GET', '::1', '[]', '2023-07-07 05:28:31', '2023-07-07 05:28:31'),
(346, 1, 'admin/auth/portfolio/2', 'GET', '::1', '[]', '2023-07-07 05:28:33', '2023-07-07 05:28:33'),
(347, 1, 'admin/auth/portfolio/2', 'GET', '::1', '[]', '2023-07-07 05:28:37', '2023-07-07 05:28:37'),
(348, 1, 'admin/auth/portfolio/2', 'GET', '::1', '[]', '2023-07-07 05:28:39', '2023-07-07 05:28:39'),
(349, 1, 'admin/auth/portfolio/2', 'GET', '::1', '[]', '2023-07-07 05:28:50', '2023-07-07 05:28:50'),
(350, 1, 'admin/auth/portfolio/2', 'GET', '::1', '[]', '2023-07-07 05:29:08', '2023-07-07 05:29:08'),
(351, 1, 'admin/auth/portfolio/2', 'GET', '::1', '[]', '2023-07-07 05:30:25', '2023-07-07 05:30:25'),
(352, 1, 'admin/auth/portfolio/2', 'GET', '::1', '[]', '2023-07-07 05:30:27', '2023-07-07 05:30:27'),
(353, 1, 'admin/auth/portfolio/2', 'GET', '::1', '[]', '2023-07-07 05:31:50', '2023-07-07 05:31:50'),
(354, 1, 'admin/auth/portfolio/2', 'GET', '::1', '[]', '2023-07-07 05:43:39', '2023-07-07 05:43:39'),
(355, 1, 'admin/auth/portfolio/2', 'GET', '::1', '[]', '2023-07-07 08:13:03', '2023-07-07 08:13:03'),
(356, 1, 'admin/auth/portfolio/2', 'GET', '::1', '[]', '2023-07-07 08:13:08', '2023-07-07 08:13:08'),
(357, 1, 'admin/auth/portfolio/2', 'GET', '::1', '[]', '2023-07-07 08:14:09', '2023-07-07 08:14:09'),
(358, 1, 'admin/auth/portfolio/2', 'GET', '::1', '[]', '2023-07-07 08:14:13', '2023-07-07 08:14:13'),
(359, 1, 'admin/auth/portfolio/2', 'GET', '::1', '[]', '2023-07-07 08:14:33', '2023-07-07 08:14:33'),
(360, 1, 'admin/auth/portfolio/2', 'GET', '::1', '[]', '2023-07-07 08:17:37', '2023-07-07 08:17:37'),
(361, 1, 'admin', 'GET', '::1', '[]', '2023-07-07 08:17:59', '2023-07-07 08:17:59'),
(362, 1, 'admin/auth/portfolio', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-07 08:18:40', '2023-07-07 08:18:40'),
(363, 1, 'admin/auth/portfolio/1', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-07 08:18:44', '2023-07-07 08:18:44'),
(364, 1, 'admin/auth/portfolio/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-07 08:20:11', '2023-07-07 08:20:11'),
(365, 1, 'admin/auth/portfolio/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-07 08:20:11', '2023-07-07 08:20:11'),
(366, 1, 'admin/auth/portfolio/1/edit', 'GET', '::1', '[]', '2023-07-07 08:22:53', '2023-07-07 08:22:53'),
(367, 1, 'admin', 'GET', '::1', '[]', '2023-07-07 08:23:11', '2023-07-07 08:23:11'),
(368, 1, 'admin', 'GET', '::1', '[]', '2023-07-07 08:23:14', '2023-07-07 08:23:14'),
(369, 1, 'admin/auth/portfolio', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-07 08:23:18', '2023-07-07 08:23:18'),
(370, 1, 'admin/auth/portfolio/1', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-07 08:23:24', '2023-07-07 08:23:24'),
(371, 1, 'admin/auth/portfolio/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-07 08:23:30', '2023-07-07 08:23:30'),
(372, 1, 'admin/auth/portfolio', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-09 05:40:05', '2023-07-09 05:40:05'),
(373, 1, 'admin', 'GET', '::1', '[]', '2023-07-09 05:44:27', '2023-07-09 05:44:27'),
(374, 1, 'admin/auth/portfolio', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-09 05:44:34', '2023-07-09 05:44:34'),
(375, 1, 'admin/auth/portfolio/1', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-09 05:44:38', '2023-07-09 05:44:38'),
(376, 1, 'admin/auth/portfolio', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-09 05:44:42', '2023-07-09 05:44:42'),
(377, 1, 'admin/auth/portfolio', 'GET', '::1', '[]', '2023-07-09 05:46:16', '2023-07-09 05:46:16'),
(378, 1, 'admin/auth/portfolio', 'GET', '::1', '[]', '2023-07-09 05:46:19', '2023-07-09 05:46:19'),
(379, 1, 'admin/auth/portfolio', 'GET', '::1', '[]', '2023-07-09 05:46:51', '2023-07-09 05:46:51'),
(380, 1, 'admin/auth/portfolio', 'GET', '::1', '[]', '2023-07-09 05:47:24', '2023-07-09 05:47:24'),
(381, 1, 'admin/auth/portfolio', 'GET', '::1', '[]', '2023-07-09 05:47:41', '2023-07-09 05:47:41'),
(382, 1, 'admin/auth/portfolio', 'GET', '::1', '[]', '2023-07-09 05:47:48', '2023-07-09 05:47:48'),
(383, 1, 'admin/auth/portfolio', 'GET', '::1', '[]', '2023-07-09 05:48:28', '2023-07-09 05:48:28'),
(384, 1, 'admin', 'GET', '::1', '[]', '2023-07-11 05:10:32', '2023-07-11 05:10:32'),
(385, 1, 'admin/auth/frontend-menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-11 05:10:37', '2023-07-11 05:10:37'),
(386, 1, 'admin', 'GET', '::1', '[]', '2023-07-12 04:47:55', '2023-07-12 04:47:55'),
(387, 1, 'admin/auth/portfolio', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-12 04:48:25', '2023-07-12 04:48:25'),
(388, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-12 04:48:40', '2023-07-12 04:48:40'),
(389, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"11\",\"title\":\"\\u670d\\u52d9\\u5217\\u8868\",\"icon\":\"fa-connectdevelop\",\"uri\":\"auth\\/service\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"eS6788NUaXjh4Q21pCjMliRSQXZsTjnX4xkGqPdh\"}', '2023-07-12 04:50:14', '2023-07-12 04:50:14'),
(390, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2023-07-12 04:50:15', '2023-07-12 04:50:15'),
(391, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2023-07-12 04:50:58', '2023-07-12 04:50:58'),
(392, 1, 'admin/auth/portfolio', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-12 04:51:00', '2023-07-12 04:51:00'),
(393, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-12 04:51:05', '2023-07-12 04:51:05'),
(394, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"eS6788NUaXjh4Q21pCjMliRSQXZsTjnX4xkGqPdh\",\"_order\":\"[{\\\"id\\\":11,\\\"children\\\":[{\\\"id\\\":8},{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":12},{\\\"id\\\":13},{\\\"id\\\":14}]},{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2023-07-12 04:51:14', '2023-07-12 04:51:14'),
(395, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-12 04:51:14', '2023-07-12 04:51:14'),
(396, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2023-07-12 04:51:17', '2023-07-12 04:51:17'),
(397, 1, 'admin/auth/service', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-12 04:51:19', '2023-07-12 04:51:19'),
(398, 1, 'admin/auth/service', 'GET', '::1', '[]', '2023-07-12 04:51:58', '2023-07-12 04:51:58'),
(399, 1, 'admin/auth/service', 'GET', '::1', '[]', '2023-07-12 04:52:00', '2023-07-12 04:52:00'),
(400, 1, 'admin/auth/service', 'GET', '::1', '[]', '2023-07-12 04:52:38', '2023-07-12 04:52:38'),
(401, 1, 'admin/auth/service/11', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-12 04:53:55', '2023-07-12 04:53:55'),
(402, 1, 'admin/auth/service/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-12 04:53:59', '2023-07-12 04:53:59'),
(403, 1, 'admin/auth/service/11/edit', 'GET', '::1', '[]', '2023-07-12 04:54:15', '2023-07-12 04:54:15'),
(404, 1, 'admin/auth/service/11', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-12 04:58:12', '2023-07-12 04:58:12'),
(405, 1, 'admin/auth/service/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-12 04:58:13', '2023-07-12 04:58:13');

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
(1, 'All permission', '*', '', '*', NULL, NULL),
(2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
(3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL),
(4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL),
(5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL),
(1, 8, NULL, NULL),
(1, 9, NULL, NULL),
(1, 10, NULL, NULL),
(1, 11, NULL, NULL),
(1, 12, NULL, NULL),
(1, 13, NULL, NULL),
(1, 14, NULL, NULL);

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'administrator', '2023-05-25 05:39:58', '2023-05-25 05:39:58');

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$B5fbzHgiiR1k9MIRo9sdquipRF4fIz8GizXaM76CIiM.pexjd1to6', 'Administrator', NULL, 'vejfN3AIRXkLzGSbpZQIhWgUjFC6YNZ8PeJAaTzYyIkqWpdkz82s1GJ793fe', '2023-05-25 05:39:58', '2023-05-25 05:39:58');

INSERT INTO `indextext` (`id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1, 'Emily Jones', 'I\'m a passionate <span>graphic designer</span> from New York', NULL, NULL);

INSERT INTO `menus` (`id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1, 'home', NULL, '2023-06-20 05:10:00', '2023-06-20 05:10:00'),
(2, 'about', 'Learn more about me', '2023-06-20 05:10:30', '2023-06-20 05:10:30'),
(3, 'resume', 'Check My Resume', '2023-06-20 05:10:53', '2023-06-20 05:10:53'),
(4, 'services', 'My Services', '2023-06-20 05:11:14', '2023-06-20 05:11:14'),
(5, 'portfolio', 'My Works', '2023-06-20 05:11:35', '2023-06-20 05:11:35'),
(6, 'contact', 'Contact Me', '2023-06-20 05:12:12', '2023-06-20 05:12:12');

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2016_01_04_173148_create_admin_tables', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(8, '2023_06_19_050549_create_menus_table', 2),
(12, '2023_06_27_045637_create_index_table', 3),
(13, '2023_06_27_045637_create_indextext_table', 4),
(14, '2023_06_30_095346_create_socials_table', 4),
(15, '2023_07_03_061002_create_portfolio_categories_table', 4),
(16, '2023_07_03_061303_create_portfolios_table', 4),
(18, '2023_07_10_002236_create_services_table', 5),
(20, '2023_07_13_045917_create_resume_categories_table', 6),
(21, '2023_07_13_050725_create_resumes_table', 7),
(23, '2023_07_14_052200_create_resume_category_table', 8);

INSERT INTO `portfolio_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'app', NULL, NULL),
(2, 'card', NULL, NULL),
(3, 'web', NULL, NULL);

INSERT INTO `portfolios` (`id`, `pcid`, `text`, `image`, `href`, `created_at`, `updated_at`) VALUES
(1, 1, 'App 1', '/assets/img/portfolio/portfolio-1.jpg', 'portfolio-details.html', NULL, NULL),
(2, 3, 'Web 3', '/assets/img/portfolio/portfolio-2.jpg', 'portfolio-details.html', NULL, NULL),
(3, 1, 'App 2', '/assets/img/portfolio/portfolio-3.jpg', 'portfolio-details.html', NULL, NULL),
(4, 2, 'Card 2', '/assets/img/portfolio/portfolio-4.jpg', 'portfolio-details.html', NULL, NULL),
(6, 3, 'Web 2', '/assets/img/portfolio/portfolio-5.jpg', 'portfolio-details.html', NULL, NULL),
(7, 1, 'App 3', '/assets/img/portfolio/portfolio-6.jpg', 'portfolio-details.html', NULL, NULL),
(8, 2, 'Card 1', '/assets/img/portfolio/portfolio-7.jpg', 'portfolio-details.html', NULL, NULL),
(9, 2, 'Card 3', '/assets/img/portfolio/portfolio-8.jpg', 'portfolio-details.html', NULL, NULL),
(10, 3, 'Web 3', '/assets/img/portfolio/portfolio-9.jpg', 'portfolio-details.html', NULL, NULL);

INSERT INTO `resume_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Sumary', NULL, NULL),
(2, 'Education', NULL, NULL),
(3, 'Professional Experience', NULL, NULL);

INSERT INTO `services` (`id`, `icon`, `title`, `content`, `created_at`, `updated_at`) VALUES
(11, 'bx bxl-dribbble', 'Lorem Ipsum', 'Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi', NULL, NULL),
(12, 'bx bx-file', 'Sed ut perspiciatis', 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore', NULL, NULL),
(13, 'bx bx-tachometer', 'Magni Dolores', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia', NULL, NULL),
(14, 'bx bx-world', 'Nemo Enim', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis', NULL, NULL),
(15, 'bx bx-slideshow', 'Dele cardo', 'Quis consequatur saepe eligendi voluptatem consequatur dolor consequuntur', NULL, NULL),
(16, 'bx bx-arch', 'Divera don', 'Modi nostrum vel laborum. Porro fugit error sit minus sapiente sit aspernatur', NULL, NULL);

INSERT INTO `socials` (`id`, `href`, `name`, `icon`, `created_at`, `updated_at`) VALUES
(1, '#', 'twitter', 'bi bi-twitter', NULL, NULL),
(2, '#', 'facebook', 'bi bi-facebook', NULL, NULL),
(3, '#', 'instagram', 'bi bi-instagram', NULL, NULL),
(4, '#', 'linkedin', 'bi bi-linkedin', NULL, NULL);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;