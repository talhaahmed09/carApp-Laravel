-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 17, 2023 at 05:21 PM
-- Server version: 8.0.31
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taswog_car`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint UNSIGNED NOT NULL,
  `salution` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `homepage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `street_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mailbox` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `allowed_notifications`
--

CREATE TABLE `allowed_notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `notifications` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `allowed_notifications`
--

INSERT INTO `allowed_notifications` (`id`, `notifications`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 'list-user,view-user,create-user,edit-user,delete-user,list-company,view-company,create-company,edit-company,delete-company,list-company-profile,view-company-profile,create-company-profile,edit-company-profile,delete-company-profile,list-vehicle,view-vehicle,create-vehicle,edit-vehicle,delete-vehicle,list-address,view-address,create-address,edit-address,delete-address,list-file,view-file,create-file,edit-file,delete-file,list-setting,view-setting,create-setting,edit-setting,delete-setting,list-question,view-question,create-question,edit-question,delete-question,list-question-type,view-question-type,create-question-type,edit-question-type,delete-question-type,assign-prtmission', NULL, '2022-10-31 13:00:19', '2022-10-31 13:00:19'),
(2, 'list-company,delete-company', '11', '2022-11-06 05:01:50', '2022-11-06 05:15:56'),
(5, 'list-company', '12', '2022-11-06 05:18:56', '2022-11-06 05:37:59'),
(6, 'list-company,delete-company', '13', '2022-11-06 05:38:09', '2022-11-06 05:38:18');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `director` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `register` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `person` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `homepage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `street_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mailbox` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `director`, `register`, `person`, `tax_number`, `email`, `phone`, `homepage`, `mobile`, `fax`, `country`, `city`, `street_no`, `mailbox`, `created_at`, `updated_at`) VALUES
(11, 'Wisozk, Stracke and Wolff', 'Keeley Dickens', '49679', 'Ross Jacobs', '367_87', 'nelle.kutch@example.org', '+13806780862', NULL, '857.346.7647', '041_57', 'Cocos (Keeling) Islands', 'South Tyrafurt', '720_79', '394_25', '2022-09-25 03:23:47', '2022-09-25 03:23:47'),
(13, 'Moen-Lowe', 'Alice Parisian', '86946', 'Yessenia Cassin', '150_07', 'pedro93@example.com', '+19374877683', NULL, '574.397.5042', '956_61', 'Angola', 'East Korbin', '192_70', '885_10', '2022-09-25 03:23:47', '2022-09-25 03:23:47'),
(44, 'Autoveritas GmbH', 'Bianca Schäftner', 'HRB 188120 B', 'Sebastian Heldt', 'DE319379842', 'berlin@autoveritas.de', '+49 030 5490581-0', 'https://autoveritas.de', '0', '+49 030 5490581-95', 'Deutschland', '10553 Berlin', 'Huttenstraße 27', '0', '2022-11-14 09:01:00', '2022-11-15 09:19:45'),
(45, 'Methologik Pvt Ltd', 'Founder', '123456789', 'Syed Saad Imam', '123456789', 'saad@methologik.com', '03350138248', 'http://fast.com', '03350138248', '0', 'Pakistan', 'KHI', '72100', '0', '2022-11-19 09:03:07', '2022-11-19 09:03:07'),
(46, 'Facebook', 'Managing Director', 'Commerical Register', 'Contact person', 'Tax number', 'email@email.com', 'Telephone', 'Homepage', 'Mobile', 'Fax', 'Country', 'ZIP / City', 'Street Number', 'Mailbox', '2022-11-23 08:42:17', '2022-11-23 08:42:17'),
(47, 'Google', 'Managing Director', 'Commerical Register', 'Contact person', 'Tax number', 'E-mail', 'Homepage', 'Homepage', 'Mobile', 'Mobile', 'Country', 'ZIP / City', 'Street Number', 'Mailbox', '2022-11-23 08:43:32', '2022-11-23 08:43:32'),
(48, 'methologik', 'ali', '4534534', '3453453', '423423', 'ali@gmail.com', 'ertr', 'http://carapp.methologik.com/dashboard', 'reter', 'rtert', 'rterter', 'terte', 'rterte', 'rtert', '2022-12-07 09:35:52', '2022-12-07 09:35:52'),
(49, 'New Test', 'ASD', 'ASD', 'Hello', '123', 'asd@gmail.com', '03333333', NULL, '03333333', 'asd', 'asd', 'Asd', 'ASD', 'ASD', '2023-01-16 08:59:50', '2023-01-16 08:59:50');

-- --------------------------------------------------------

--
-- Table structure for table `company_profiles`
--

CREATE TABLE `company_profiles` (
  `id` bigint UNSIGNED NOT NULL,
  `cp_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp_letterhead` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_letterfoot` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_sender_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp_sender_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp_contact_details` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_signature` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_rubber_stamp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_stmp_server` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_stmp_port` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_signature_imprint` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` bigint UNSIGNED NOT NULL,
  `gd_license_plate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gd_vehicle_manufacturer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gd_vehicle_mode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gd_owner_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gd_owner_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gd_owner_country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gd_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gd_contact_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gd_order_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gd_inspection_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gd_expert_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gd_clerk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gd_order_placement` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gd_vat_rate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gd_address_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gd_address_country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gd_street_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gd_mailbox` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inv_participation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `inv_contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `inv_designation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vi_ort_firma` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vi_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vi_from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vi_to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vi_expert` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vi_participator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `d_documents` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `p_photos` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint UNSIGNED NOT NULL,
  `ques_ans` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `gd_license_plate`, `gd_vehicle_manufacturer`, `gd_vehicle_mode`, `gd_owner_name`, `gd_owner_city`, `gd_owner_country`, `gd_email`, `gd_contact_no`, `gd_order_date`, `gd_inspection_date`, `gd_expert_name`, `gd_clerk`, `gd_order_placement`, `gd_vat_rate`, `gd_address_city`, `gd_address_country`, `gd_street_no`, `gd_mailbox`, `inv_participation`, `inv_contact`, `inv_designation`, `vi_ort_firma`, `vi_address`, `vi_from`, `vi_to`, `vi_expert`, `vi_participator`, `d_documents`, `p_photos`, `company_id`, `ques_ans`, `created_at`, `updated_at`) VALUES
(1, 'gd_license_plate_000', 'gd_vehicle_manufacturer_000', 'gd_vehicle_mode_000', 'gd_owner_name_000', 'gd_owner_city_00', 'gd_owner_country_00', 'gd_email_000', 'gd_contact_no_00', 'gd_order_date_000', 'gd_inspection_date_000', 'gd_expert_name_00', 'gd_clerk_00', 'gd_order_placement_00', 'gd_vat_rate_00', 'gd_address_city_00', 'gd_address_country_000', 'gd_street_no_00', 'gd_mailbox_00', 'inv_participation_00', '09979788,09979783', 'inv_designation_00', 'vi_ort_firma_00', 'vi_address_00', 'vi_from_000', 'vi_to_000', 'vi_expert_000', 'vi_participator_00', '', '', 11, '{\"1\" : \"ans1\" , \"2\" : \" \" ,\"3\" : \"ans3\"}', '2022-11-06 07:21:31', '2022-11-06 07:21:31'),
(2, 'gd_license_plate_000', 'gd_vehicle_manufacturer_000', 'gd_vehicle_mode_000', 'gd_owner_name_000', 'gd_owner_city_00', 'gd_owner_country_00', 'gd_email_000', 'gd_contact_no_00', 'gd_order_date_000', 'gd_inspection_date_000', 'gd_expert_name_00', 'gd_clerk_00', 'gd_order_placement_00', 'gd_vat_rate_00', 'gd_address_city_00', 'gd_address_country_000', 'gd_street_no_00', 'gd_mailbox_00', 'inv_participation_00', '09979788,09979783', 'inv_designation_00', 'vi_ort_firma_00', 'vi_address_00', 'vi_from_000', 'vi_to_000', 'vi_expert_000', 'vi_participator_00', '', '', 11, '{\"1\" : \"ans1\" , \"2\" : \" \" ,\"3\" : \"ans3\"}', '2023-01-12 08:21:22', '2023-01-12 08:21:22');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_06_11_000000_create_companies_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(5, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(6, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(7, '2016_06_01_000004_create_oauth_clients_table', 1),
(8, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(9, '2019_08_19_000000_create_failed_jobs_table', 1),
(10, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(11, '2022_06_09_174506_create_permission_tables', 1),
(12, '2022_07_13_160624_create_vehicles_table', 1),
(13, '2022_08_02_165620_create_addresses_table', 1),
(14, '2022_08_08_143501_create_files_table', 1),
(15, '2022_08_11_175003_create_question_types_table', 1),
(16, '2022_09_25_075333_add_teams_fields', 1),
(17, '2022_09_25_091403_create_company_profiles_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 5),
(2, 'App\\Models\\User', 5),
(3, 'App\\Models\\User', 5),
(1, 'App\\Models\\User', 6),
(3, 'App\\Models\\User', 6),
(2, 'App\\Models\\User', 7),
(3, 'App\\Models\\User', 14),
(2, 'App\\Models\\User', 15),
(4, 'App\\Models\\User', 16);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0301d31f19d1f8737ad9c5b08bd853b9fab295b2f71a1c83f8f047a89e456730a0b838c4316bec92', 1, 1, 'authToken', '[]', 0, '2022-11-07 07:13:31', '2022-11-07 07:13:31', '2023-11-07 10:13:31'),
('03ce223156d5314a1e4c83333a58df2aa53848c83973ef53f54dd9b2158bb53b2f59eca2b9e492d5', 3, 1, 'authToken', '[]', 0, '2022-11-05 07:47:47', '2022-11-05 07:47:47', '2023-11-05 10:47:47'),
('061a36893685ec5f9af57b9c5fb6221acbad1e9506f3ddc186bf99fa670c81dbe0b6dc3118b465da', 12, 1, 'authToken', '[]', 0, '2022-11-20 05:17:40', '2022-11-20 05:17:40', '2023-11-20 08:17:40'),
('063007e8e0056518a72db48f0cd6039f25fc0b8a702e9e830154091e1f0e99a0bb3c83b61db696e5', 1, 1, 'authToken', '[]', 0, '2022-11-08 18:25:04', '2022-11-08 18:25:04', '2023-11-08 21:25:04'),
('07a83200c913314029637efa163dcd0a4d7b114bf31a962c1bef4129c5fb9189ce423947c2fe0230', 12, 1, 'authToken', '[]', 0, '2022-11-20 04:22:16', '2022-11-20 04:22:16', '2023-11-20 07:22:16'),
('08932cc65c4a726c83801fd28cfe1e02565ecc52ca1286aec96a2a65d1576a9d81e4e3b110185a53', 1, 1, 'authToken', '[]', 0, '2022-12-11 07:52:08', '2022-12-11 07:52:08', '2023-12-11 10:52:08'),
('0897eeb6becf2a7b75af930441ac531ec0e1e747b1f4de7e39af11de3989bf82dcf107ec3eea0d53', 1, 1, 'authToken', '[]', 0, '2022-11-19 08:30:07', '2022-11-19 08:30:07', '2023-11-19 11:30:07'),
('0ba672eef721bd243a6b306189985637b0763206914b49a0f6d42006cf845a3616b21892b48492f7', 12, 1, 'authToken', '[]', 0, '2022-11-20 08:24:00', '2022-11-20 08:24:00', '2023-11-20 11:24:00'),
('0c9665cd4ee696691b269d83df7cb15c591851ca47bbbc449c5b8df012a5b1ea84e73892a1febf05', 2, 1, 'authToken', '[]', 0, '2022-11-05 07:56:44', '2022-11-05 07:56:44', '2023-11-05 10:56:44'),
('0dab80616ecad5e75e406cf161ed6a5eb4257ca8b4f44579c6924dd15bf0a9fc354fcf2ffda68a5d', 1, 1, 'authToken', '[]', 0, '2022-11-08 18:57:34', '2022-11-08 18:57:34', '2023-11-08 21:57:34'),
('100e35cfc91114baad328ba24b4300be126bce0e9a49fad78a2c84eb52856dcb9336125d736479d4', 1, 1, 'authToken', '[]', 0, '2022-11-26 09:10:12', '2022-11-26 09:10:12', '2023-11-26 12:10:12'),
('10dad6f8644242d894b7bf2207cc424e7a7fc0784772276787dfbc118ef755e55afa1072cc354afe', 1, 1, 'authToken', '[]', 0, '2023-01-02 12:11:30', '2023-01-02 12:11:30', '2024-01-02 15:11:30'),
('114b27fb4b87b0db21c39f55f58c5b6e270ad940d9b611d462be974a1fa7a7f872fca52f78ae93b5', 1, 1, 'authToken', '[]', 0, '2022-11-19 08:58:34', '2022-11-19 08:58:34', '2023-11-19 11:58:34'),
('114b7be7909f70fb4eb21e6dde9c822ea91c144a5da7e06a208779daa7d2dbdd943c983cac22d5a4', 1, 1, 'authToken', '[]', 0, '2022-11-19 08:24:49', '2022-11-19 08:24:49', '2023-11-19 11:24:49'),
('11f1bbbff7b60f51d06353bcc971fb488d67fe5ea6c46cff121f3334254bfdcfecd555a23c2b92d5', 1, 1, 'authToken', '[]', 0, '2022-11-23 13:59:45', '2022-11-23 13:59:45', '2023-11-23 16:59:45'),
('13165e23c4559aa5dce34b05fdb5a30bc0501d7c68164729b0cad51fc30ff212c4a7d007a112c918', 1, 1, 'authToken', '[]', 0, '2022-10-31 10:30:30', '2022-10-31 10:30:30', '2023-10-31 15:30:30'),
('16aae98124b0624a82124f1531933e52b3a99ec79d11c51152b5206ab23d9a27179b8aa625188f4c', 1, 1, 'authToken', '[]', 0, '2022-12-07 09:07:33', '2022-12-07 09:07:33', '2023-12-07 12:07:33'),
('18ef30898937fdc4ad6b9e38db2f7fcc532ddded0c84f0169e76dadea379652336530590aae2fed4', 1, 1, 'authToken', '[]', 0, '2023-01-14 16:10:18', '2023-01-14 16:10:18', '2024-01-14 19:10:18'),
('1a694f01c5ba88447ff4e79b52b410e35b903a982822dfe4e42c5b79061b7f0dca440c3058ebef82', 10, 1, 'authToken', '[]', 0, '2022-11-19 12:40:34', '2022-11-19 12:40:34', '2023-11-19 15:40:34'),
('1efe5bf84d0727c7b7dd702891f356e7435947b5fcbe300ce7d7015976bc3095174191af2a1ecfce', 1, 1, 'authToken', '[]', 0, '2023-01-12 02:22:41', '2023-01-12 02:22:41', '2024-01-12 05:22:41'),
('2063e9da1df2f7fd80ade3a359300981695faeac73910d5852f0f0c15f44ce9c09ca51dcc54387f9', 1, 1, 'authToken', '[]', 0, '2022-12-08 10:44:04', '2022-12-08 10:44:04', '2023-12-08 13:44:04'),
('2177bcede622c12c3ffe99c806e2f4c6c11bbb06dc87b4bdb045b7017742b4459a6dc6b8a1fc0696', 1, 1, 'authToken', '[]', 0, '2022-09-25 03:24:25', '2022-09-25 03:24:25', '2023-09-25 08:24:25'),
('23097f0348b903a5e47203bb175ba5c3db3b7bf63143377153cdcc919a0f557733fdda0c2c9977cc', 1, 1, 'authToken', '[]', 0, '2022-12-14 10:01:14', '2022-12-14 10:01:14', '2023-12-14 13:01:14'),
('24207e38f2b6b1b679b9426f692cd666f60d12082996f82c2e56a4161fa3c5fdccb3684e485d1714', 1, 1, 'authToken', '[]', 0, '2022-11-17 09:38:36', '2022-11-17 09:38:36', '2023-11-17 12:38:36'),
('2423a41377779eded65c388cfdda67a6e35da7590e93b80f33ec20965e160bfa258a259d81fe17ff', 1, 1, 'authToken', '[]', 0, '2022-11-14 01:49:09', '2022-11-14 01:49:09', '2023-11-14 04:49:09'),
('270632f7444c6a049c6ddbe7590eb80b4ddd3561261715d7d90525b8c38fd6a5eeae7cfce3d8bee2', 1, 1, 'authToken', '[]', 0, '2022-11-17 14:19:17', '2022-11-17 14:19:17', '2023-11-17 17:19:17'),
('28a7303661a1db51239de675edab742eed9b6977f2ece3038326028f7c03d9d3920c92fcf221e391', 12, 1, 'authToken', '[]', 0, '2022-11-20 07:49:33', '2022-11-20 07:49:33', '2023-11-20 10:49:33'),
('2b6faa172dd166bfb7d78bd013a5f16b2500f4b2dd6986f70b2f0efb314eeaed2b5025716537bbeb', 1, 1, 'authToken', '[]', 0, '2022-11-08 16:57:29', '2022-11-08 16:57:29', '2023-11-08 19:57:29'),
('2bca1feccb7faad7353651ea5eb1a517bef6807c40e8cd44699e0cc7b7aa30ab6138b738042fa701', 2, 1, 'authToken', '[]', 0, '2022-12-07 09:12:29', '2022-12-07 09:12:29', '2023-12-07 12:12:29'),
('2bead6b5b91de93e742823b93fea3a160816c12694d752e6cd88262f7f1ae3adb67b396154738abc', 1, 1, 'authToken', '[]', 0, '2022-11-13 07:53:27', '2022-11-13 07:53:27', '2023-11-13 10:53:27'),
('2bf3b4b6719917bb966d1ad66cf094dbfe69fb6fcd42b6c0f709dd55b6043363475e1fd0b17f4686', 2, 1, 'authToken', '[]', 0, '2023-01-15 15:36:29', '2023-01-15 15:36:29', '2024-01-15 18:36:29'),
('2dc3c3c42ca2837bb4ebbbde0e606245e3f30480c55041ef3ca41550a41a36113717076cc0e12121', 1, 1, 'authToken', '[]', 0, '2022-11-16 04:01:02', '2022-11-16 04:01:02', '2023-11-16 07:01:02'),
('2e36bcea80fd89ce0f6ec2713ec539b03484184df5efc7bde8ed7ac3249910ace161f53871b5800d', 2, 1, 'authToken', '[]', 0, '2022-12-07 09:11:29', '2022-12-07 09:11:29', '2023-12-07 12:11:29'),
('2ed50440e089d2cc50d0a5430e25385b66b01f4937e0374336b3ce527bc36975578a1a8edd4ed2db', 1, 1, 'authToken', '[]', 0, '2022-11-19 11:37:41', '2022-11-19 11:37:41', '2023-11-19 14:37:41'),
('30b5d34af49f2be613309baca1a3a30aad22093ee5b7d23254b5a0d92a2560c7b9555ee086aa6e27', 1, 1, 'authToken', '[]', 0, '2022-11-05 08:48:24', '2022-11-05 08:48:24', '2023-11-05 11:48:24'),
('30ca2053e7097c61c954c73e5bd216c0dcf7d441bd705b9379048f529ea36e5452592f0e1b4e591a', 1, 1, 'authToken', '[]', 0, '2022-11-14 08:19:45', '2022-11-14 08:19:45', '2023-11-14 11:19:45'),
('30d847d800cafe2a349c50940e894035d4d9213c5188b84c1848e92f9bfa30bb7cdbc7c3838379a8', 13, 1, 'authToken', '[]', 0, '2022-11-20 10:23:45', '2022-11-20 10:23:45', '2023-11-20 13:23:45'),
('34f4e1b9d965343a38e63388af6db291700fcb1450071ded41acd522d97dbefc8930d99fc3aabfed', 1, 1, 'authToken', '[]', 0, '2022-11-21 08:45:31', '2022-11-21 08:45:31', '2023-11-21 11:45:31'),
('380fb81ad19bdf4bc40228e59a7894560413d2617ab03ed97b003296c999ab109a9d3cf94fc65482', 1, 1, 'authToken', '[]', 0, '2022-11-08 19:04:08', '2022-11-08 19:04:08', '2023-11-08 22:04:08'),
('3818fadd393f1b72add755fe02d77705b9d9b7d0f14ebfe7aa1f95c230c2f6b15ac6e467d4b59259', 1, 1, 'authToken', '[]', 0, '2022-11-23 14:49:58', '2022-11-23 14:49:58', '2023-11-23 17:49:58'),
('39e2eb528b194dbd3d207cba995f68964e9c575e63425dc5eba04bd488735c36aba07677a7a2bb33', 1, 1, 'authToken', '[]', 0, '2022-11-17 14:17:43', '2022-11-17 14:17:43', '2023-11-17 17:17:43'),
('3a038ca4f666f4c2c879e88404d6046f114ae04c0c78ecf2545c9c4ebede32b7e0736d3ec305c5bf', 1, 1, 'authToken', '[]', 0, '2022-11-05 07:56:15', '2022-11-05 07:56:15', '2023-11-05 10:56:15'),
('3a0fa5f18470fff2dfb3c840679cb9a3c216103f52893c1b6d48c64433a73ff6abc10c20ba485095', 1, 1, 'authToken', '[]', 0, '2022-11-23 15:16:04', '2022-11-23 15:16:04', '2023-11-23 18:16:04'),
('3c8f163c619999484b514ade9b17772058eb6b318e4e86cda8b70fa969db66bce23742a428665f57', 1, 1, 'authToken', '[]', 0, '2022-10-29 03:27:47', '2022-10-29 03:27:47', '2023-10-29 08:27:47'),
('3d669015261a231e6f07003eb831b1a7f1d39c93284c05bcfc8e2f580c031c40f5e8c970ba047ba8', 1, 1, 'authToken', '[]', 0, '2022-11-22 14:21:31', '2022-11-22 14:21:31', '2023-11-22 17:21:31'),
('3dfc98668f5add5eb823008cd67f2a8d0bf9992c23d2b714a2192749335a05eb2bd7312928ae10e5', 12, 1, 'authToken', '[]', 0, '2022-11-20 10:21:53', '2022-11-20 10:21:53', '2023-11-20 13:21:53'),
('3e22a32b4cee9b4688da6cde19b97c7fe8b7820cfa0f49bcbc1dd11f1c4fb2b5a5593b2a36927237', 3, 1, 'authToken', '[]', 0, '2022-11-05 07:50:02', '2022-11-05 07:50:02', '2023-11-05 10:50:02'),
('3fab542511afa0a1f474d2780b5df07a874ddc4d7df6dab78d76e54a463bb547752a2f7a95f480a9', 6, 1, 'authToken', '[]', 0, '2022-10-31 13:16:30', '2022-10-31 13:16:30', '2023-10-31 16:16:30'),
('40471df98db0809b956371befc41327de692fc3c93d98a06024f11b22dca92f1f85a78fb8e5833ac', 10, 1, 'authToken', '[]', 0, '2022-11-19 13:00:39', '2022-11-19 13:00:39', '2023-11-19 16:00:39'),
('41ab56abe801aaa5e4d990c4af89e43de61229e6393bfe2888d0a44eaeeb04c469e0fb672c8f544c', 1, 1, 'authToken', '[]', 0, '2022-11-19 08:30:56', '2022-11-19 08:30:56', '2023-11-19 11:30:56'),
('42c82c1809bdfcf600ff4f0a019ed8fc4177f19043113397d4c8057f6151d39d097083f9fd3057a2', 1, 1, 'authToken', '[]', 0, '2022-11-20 07:49:53', '2022-11-20 07:49:53', '2023-11-20 10:49:53'),
('472d60e9a2016c42fe4d840dae3c98503d9dedf6d46b05d1942e0947c6014b89bb67a5c358d3808b', 1, 1, 'authToken', '[]', 0, '2022-11-20 05:19:28', '2022-11-20 05:19:28', '2023-11-20 08:19:28'),
('4b1007d00d95f25bcec5b4e36afceaafed4623f2164720bfbf2832512798d8bbb6fc729dd99f3964', 10, 1, 'authToken', '[]', 0, '2022-11-19 14:25:01', '2022-11-19 14:25:01', '2023-11-19 17:25:01'),
('5058eac5148ea400d176e3ba7f78b2f74f884b9101f9b56a758c5b54933fb12d2ea87ac8ddf36586', 1, 1, 'authToken', '[]', 0, '2022-11-20 08:04:57', '2022-11-20 08:04:57', '2023-11-20 11:04:57'),
('5418ee64abb737c37ee0197a67965526b3b4acae0ce667c3bb5b420999109bea416a765d31e203dc', 1, 1, 'authToken', '[]', 0, '2022-11-23 08:34:45', '2022-11-23 08:34:45', '2023-11-23 11:34:45'),
('567909584236417f8bd49ebaa7867ea6a1d99038c80401655ed1c6ca42be3783bd555acaa0d8cdd6', 1, 1, 'authToken', '[]', 0, '2022-11-23 13:30:02', '2022-11-23 13:30:02', '2023-11-23 16:30:02'),
('57210cdd5e52f70ece65520737198712c22e80d0334ae49327e233aac1bc9795d4abb16e16041ff0', 1, 1, 'authToken', '[]', 0, '2022-11-23 15:03:56', '2022-11-23 15:03:56', '2023-11-23 18:03:56'),
('57255ae65f8f5e95e9689fd81cbce53ac97bb8c43dacef06a4e83fe18fa143005f4ce8c0930ba688', 15, 1, 'authToken', '[]', 0, '2022-11-23 08:53:38', '2022-11-23 08:53:38', '2023-11-23 11:53:38'),
('572b38dea784ca9fc817dd55c4c14d59c6e13565e99e5133ac74cdc23c93d47c10898497dfb24dc3', 1, 1, 'authToken', '[]', 0, '2022-11-09 11:55:43', '2022-11-09 11:55:43', '2023-11-09 14:55:43'),
('5d33e53f13e1e5eb20ecc8f019ae76851c71d13b5ef1ac59442a325bbbbfec27f58e4e54a087ec97', 1, 1, 'authToken', '[]', 0, '2022-11-20 08:47:55', '2022-11-20 08:47:55', '2023-11-20 11:47:55'),
('5e16886b090580d1d7a7f3c27f2ef8ef0eec58ae67641ec018a84f05256b3d0216193086c6e95797', 1, 1, 'authToken', '[]', 0, '2023-01-16 18:44:55', '2023-01-16 18:44:55', '2024-01-16 21:44:55'),
('5ede1a93f30b9e7a0064ad6693385b67e80e7793c8988bff9b4916e56b6a5177b509a18a80b93c8d', 1, 1, 'authToken', '[]', 0, '2022-11-08 16:38:17', '2022-11-08 16:38:17', '2023-11-08 19:38:17'),
('6012bba26e6c94c6a16b9717855b3449132daf2482b6c197cfb825d19d097d936863e4065e68bac1', 1, 1, 'authToken', '[]', 0, '2022-12-11 07:55:01', '2022-12-11 07:55:01', '2023-12-11 10:55:01'),
('63d2c728c749db20e769ebf0fd1d36fec32a500bd94662a73c144791d56220b46da62e1996bd10d6', 1, 1, 'authToken', '[]', 0, '2022-11-07 07:17:00', '2022-11-07 07:17:00', '2023-11-07 10:17:00'),
('671bbe035b815b810186f280728e9ff0051ebad5b47e1dba4296659221e451b394dd5f21f2303a38', 1, 1, 'authToken', '[]', 0, '2022-11-23 14:13:01', '2022-11-23 14:13:01', '2023-11-23 17:13:01'),
('678bebbe4fa85a775b0178980b2dc1b0846b1f970808cb5586f459ce041ecb008228063a3c78f15a', 10, 1, 'authToken', '[]', 0, '2022-11-19 12:23:00', '2022-11-19 12:23:00', '2023-11-19 15:23:00'),
('67f3651506fed6148ccbbabadf2c0df8e0e076e2d2a03fe24abfd83a39dac512c43f54974fcc0d37', 1, 1, 'authToken', '[]', 0, '2022-11-19 10:42:30', '2022-11-19 10:42:30', '2023-11-19 13:42:30'),
('67f6244094c60c509a49bf2ef5bb9ac7fedf21c067d884d5adc3089fd90fbd13803f5f5820e8310b', 1, 1, 'authToken', '[]', 0, '2022-11-08 18:25:18', '2022-11-08 18:25:18', '2023-11-08 21:25:18'),
('69e0a7e744f9adff61f007b6144182b203659f7a72a9a36aa2018df97920a865dd6147fed310a257', 1, 1, 'authToken', '[]', 0, '2022-11-20 08:08:18', '2022-11-20 08:08:18', '2023-11-20 11:08:18'),
('6aac9b4ac99efad59dfa4c44af4ffeae4e4a96aba0a47e442355a822fc8242039089796359a0b4ad', 1, 1, 'authToken', '[]', 0, '2022-11-28 13:41:36', '2022-11-28 13:41:36', '2023-11-28 16:41:36'),
('6b322fe78179545ec53ec2e9cc165a0a77d804e1adccb6217e106367ba7fcc5844c5bef4db00a083', 1, 1, 'authToken', '[]', 0, '2022-11-21 08:17:12', '2022-11-21 08:17:12', '2023-11-21 11:17:12'),
('6c96edd6bda469ad83cb95334df1522271a7fea8e74db1eb81d0681acd32bd1a12206c391c35530a', 1, 1, 'authToken', '[]', 0, '2022-11-08 17:07:33', '2022-11-08 17:07:33', '2023-11-08 20:07:33'),
('6de874c4f65ceafb6673965efc4fd4c4b4c4914f84ac2368367beda99d2cb3ade4710bc94a7a9963', 1, 1, 'authToken', '[]', 0, '2022-11-20 07:00:20', '2022-11-20 07:00:20', '2023-11-20 10:00:20'),
('6e9c27fe9faeac142fdc4fdbea99ad80b5f74e0bc6defe38ff1fd00b8ad6caa174280e6008be33d1', 1, 1, 'authToken', '[]', 0, '2022-11-14 09:31:33', '2022-11-14 09:31:33', '2023-11-14 12:31:33'),
('6ec3f049250124c4ecceca7e27846ac4bb43186d1d1d26dd189790b3fa65cfe4d6cc585de373eb79', 1, 1, 'authToken', '[]', 0, '2022-11-20 08:05:53', '2022-11-20 08:05:53', '2023-11-20 11:05:53'),
('6eee0efca49245c107dff7613114bcc9eaba303fa8ee8fbdcaa1b785b0ae724626e395356ddce667', 3, 1, 'authToken', '[]', 0, '2022-11-05 07:47:49', '2022-11-05 07:47:49', '2023-11-05 10:47:49'),
('6f16ee02578f0b185f88fa3cc8c050aa6e10bfbe391951be505b6d18518543966bb12f5307b3c48d', 1, 1, 'authToken', '[]', 0, '2022-11-26 06:51:19', '2022-11-26 06:51:19', '2023-11-26 09:51:19'),
('71099d2f9c164253689de7a3056d3e53a5f2e88c1186e78f35ce6a091732af4ea02e9fc03445499d', 1, 1, 'authToken', '[]', 0, '2022-11-20 08:49:31', '2022-11-20 08:49:31', '2023-11-20 11:49:31'),
('717df7a416ab2a51165700de6634ff6df642c08c8ad1a7e9420d748bdde906a06a61418b2683f85e', 11, 1, 'authToken', '[]', 0, '2022-11-19 14:57:03', '2022-11-19 14:57:03', '2023-11-19 17:57:03'),
('74773ab0f38b7483c4b4d3bc199693a99b2522cf19a9bdbca4c7db47d26c42b3c33315727270a467', 1, 1, 'authToken', '[]', 0, '2022-11-16 16:01:26', '2022-11-16 16:01:26', '2023-11-16 19:01:26'),
('793aaf551d3c681c38dd53a78f1db0a7f20372057cc6df486eefb2055cf28f5c0b571b7e5da0f895', 10, 1, 'authToken', '[]', 0, '2022-11-19 12:25:20', '2022-11-19 12:25:20', '2023-11-19 15:25:20'),
('798278ad8d099b91aef7cb610cbb754b971ee0a159a9ba0624713395c6aa9319c9b69054c99e4931', 1, 1, 'authToken', '[]', 0, '2022-11-17 14:18:08', '2022-11-17 14:18:08', '2023-11-17 17:18:08'),
('798b1670abb9033689b11b4aa14a13669c7808c701e810b88ede5744bbc58c6c0ba97b766d180b17', 1, 1, 'authToken', '[]', 0, '2022-11-24 11:35:52', '2022-11-24 11:35:52', '2023-11-24 14:35:52'),
('79d0debbc0aac313cc22e8293a7fb11ef8864633884d71993f4a64683de5011c26e88e3377968adf', 1, 1, 'authToken', '[]', 0, '2022-11-23 08:56:27', '2022-11-23 08:56:27', '2023-11-23 11:56:27'),
('7bc05a102b7867ff878e28892633b2ebe759c05ce4ce2f0acae057bea9e2bd26dde0944b5b97c8de', 1, 1, 'authToken', '[]', 0, '2022-11-23 08:21:06', '2022-11-23 08:21:06', '2023-11-23 11:21:06'),
('7d2cee57e76e8a292db7d729d3343729be35232b7751fb72630bebd93435e127f6fa9e4720a9d24e', 1, 1, 'authToken', '[]', 0, '2022-11-20 07:48:03', '2022-11-20 07:48:03', '2023-11-20 10:48:03'),
('7f71ce48a939f4ecd2657af85ded3c45906403f93ca35cfb541ed9c1ea1f124ccdba65313e0b3673', 1, 1, 'authToken', '[]', 0, '2022-11-09 06:59:47', '2022-11-09 06:59:47', '2023-11-09 09:59:47'),
('7f7698f1d4ab5dc39955a0b33232fc45a4d1c81d59af9568e46cfc19e7c06ca5c9d6443a53bb2d16', 1, 1, 'authToken', '[]', 0, '2022-11-15 09:18:51', '2022-11-15 09:18:51', '2023-11-15 12:18:51'),
('7f9924167922116ee9340cafa19c3085db4d1d7296233799eaf0b99fca3571d4d476521240e8a3d4', 12, 1, 'authToken', '[]', 0, '2022-11-20 07:50:12', '2022-11-20 07:50:12', '2023-11-20 10:50:12'),
('7fa9de62f6e4d4767ff7be0ff98495eeb7c0bdaa6ee4e35e187acf68e2a92b687a520161c4102094', 1, 1, 'authToken', '[]', 0, '2022-11-20 07:43:45', '2022-11-20 07:43:45', '2023-11-20 10:43:45'),
('81635df2e583bc125a89336f5beae661ed779085c910a14b817545dfefd7e972ef2c25941928b1a5', 1, 1, 'authToken', '[]', 0, '2022-12-08 08:13:45', '2022-12-08 08:13:45', '2023-12-08 11:13:45'),
('823ebcd8e4901b81982b396c516154999ca1f5b59bd2cf99e57ebe056543d3a6c3b1ffa7cdfb39d8', 1, 1, 'authToken', '[]', 0, '2022-12-07 09:19:12', '2022-12-07 09:19:12', '2023-12-07 12:19:12'),
('83d7193ef52d004139fc6956553c74394b28df3b59f06ef1402bbd05949800995d9c022382dcc1a9', 1, 1, 'authToken', '[]', 0, '2022-11-19 14:13:45', '2022-11-19 14:13:45', '2023-11-19 17:13:45'),
('8791df614c3442d9e849d58874e13d47c9c794c60c78c9250992aa66d67aed349048783a24c03f9d', 2, 1, 'authToken', '[]', 0, '2023-01-16 12:52:01', '2023-01-16 12:52:01', '2024-01-16 15:52:01'),
('8937a14fcc0e5deb137aec445476eebe95e640df0a0b1f85e0b854d33d26edb3efc5c78bf67f3ed5', 1, 1, 'authToken', '[]', 0, '2022-11-19 11:40:08', '2022-11-19 11:40:08', '2023-11-19 14:40:08'),
('894b8c764be775d89a9297ee327ce7ed47020748a5f1831b23c15152468998a78b26c8dc4ba066c8', 1, 1, 'authToken', '[]', 0, '2022-11-08 15:00:18', '2022-11-08 15:00:18', '2023-11-08 18:00:18'),
('898fc46bdd0cf93af53f29814cc3fc88a0309eb6377fb474ece9bba5efcf7ead2c7f90af668470ef', 1, 1, 'authToken', '[]', 0, '2022-12-10 12:51:28', '2022-12-10 12:51:28', '2023-12-10 15:51:28'),
('8bb012906f54acfdec1413e8e7f925662ef90a51043c99f52a5b1859c0cbdfc0b83e32532eb46d60', 1, 1, 'authToken', '[]', 0, '2022-11-12 08:58:12', '2022-11-12 08:58:12', '2023-11-12 11:58:12'),
('8c6bf950035d4aa70ceb614814015ab953ad48b8694bc49e31573c3b8140572116aa2cb9f086486a', 1, 1, 'authToken', '[]', 0, '2022-11-23 14:44:46', '2022-11-23 14:44:46', '2023-11-23 17:44:46'),
('8d0d924d886822014babff8d477a2499956c113fb1a252c97ddf5215052f5b9c880e62ff416dd5a7', 1, 1, 'authToken', '[]', 0, '2022-11-23 14:29:01', '2022-11-23 14:29:01', '2023-11-23 17:29:01'),
('8d1659cbfc3b10075e8c480d04d01ebfdba5ec28d5d2da014de6f45b31304a7037bbda469193c278', 1, 1, 'authToken', '[]', 0, '2022-11-20 05:31:08', '2022-11-20 05:31:08', '2023-11-20 08:31:08'),
('8e04c800f18a518bc1a4e349cfbcfb0a59e99f6f75ba2ccf085dda940949ac0b847417fdb513f367', 1, 1, 'authToken', '[]', 0, '2022-11-23 14:24:33', '2022-11-23 14:24:33', '2023-11-23 17:24:33'),
('8fc43f304b3dc538942d79f33bad17b9804e2a6f14be82c7af6aade49ad9f8e99d25e5f358bce22d', 1, 1, 'authToken', '[]', 0, '2022-11-20 08:21:42', '2022-11-20 08:21:42', '2023-11-20 11:21:42'),
('900ea2e8ffcc9e632a5f61d4c62220796e2bdb23c603ef5e031a6e5dbc231e8b7a6ffac79c840f36', 1, 1, 'authToken', '[]', 0, '2022-11-23 13:12:09', '2022-11-23 13:12:09', '2023-11-23 16:12:09'),
('927ce3e6bb916e5b3e6f0c2e887e14e62f10c00ff51d4bcd6924c0c0e485df2ae9805e876fc676ed', 1, 1, 'authToken', '[]', 0, '2022-11-17 14:19:52', '2022-11-17 14:19:52', '2023-11-17 17:19:52'),
('93fcdfe8330afd99dfd5a408eb79f9984144510ed5796aa9db483f5111c0198a333323725de0529a', 12, 1, 'authToken', '[]', 0, '2022-11-20 07:44:18', '2022-11-20 07:44:18', '2023-11-20 10:44:18'),
('94f1f5a2a407266fa6e476bc53fcfe137e113590dc438023a5f7a7438683a4472c38443e974fc565', 1, 1, 'authToken', '[]', 0, '2022-11-20 08:44:16', '2022-11-20 08:44:16', '2023-11-20 11:44:16'),
('96f64db9cb49a96734bfb4172298fbf8070dbe68b70efd2aec1fb0e87af787978c3aeb948a4244fd', 1, 1, 'authToken', '[]', 0, '2022-11-19 14:53:40', '2022-11-19 14:53:40', '2023-11-19 17:53:40'),
('9a385bb48c5d8c8fb0609154fbe824742f59f783fd717725afa59965df03fc35b574113233915c19', 3, 1, 'authToken', '[]', 0, '2022-11-05 07:50:07', '2022-11-05 07:50:07', '2023-11-05 10:50:07'),
('9b6197f150b3dacd07c869afbaf19ae39cd20d3f8e2ed3baaf97b453b5c1ca1cada9eb8d3f5ca5a5', 10, 1, 'authToken', '[]', 0, '2022-11-19 12:36:11', '2022-11-19 12:36:11', '2023-11-19 15:36:11'),
('9bac27e6dc71312a1308aaf0a78cda7bf7571502bad796573d5253d414c5d3f8e361dac4c5c83023', 12, 1, 'authToken', '[]', 0, '2022-11-20 07:30:39', '2022-11-20 07:30:39', '2023-11-20 10:30:39'),
('9c8e164d400507c076d356a14561224970ba2bd0b6e10bc863793aae1f0c8414359a720be2c61eb8', 1, 1, 'authToken', '[]', 0, '2022-11-11 10:48:23', '2022-11-11 10:48:23', '2023-11-11 13:48:23'),
('9d6444e7450e1b967f2ced99365b1aee18e72718959f77fbc4aa4a141e862191b04837ddf54e552d', 1, 1, 'authToken', '[]', 0, '2022-12-12 10:57:05', '2022-12-12 10:57:05', '2023-12-12 13:57:05'),
('9fe8e5195651e3b65dfdfa824feed2d6ab74771a091f79dc6bc97559797c69b370b05944abcb93d1', 12, 1, 'authToken', '[]', 0, '2022-11-20 08:39:33', '2022-11-20 08:39:33', '2023-11-20 11:39:33'),
('9fe986ca6322251e1ef86f5b5103bc03a20979f22fac52b1e0ddbf0c80ab754bca447c8705fe29d4', 1, 1, 'authToken', '[]', 0, '2022-11-20 07:41:45', '2022-11-20 07:41:45', '2023-11-20 10:41:45'),
('a082dc83703bff05719aacd59418c26e9d7f0e1ed4a5c50b0fe759b01b77d0e2bd630c7ec89f704e', 10, 1, 'authToken', '[]', 0, '2022-11-19 13:09:20', '2022-11-19 13:09:20', '2023-11-19 16:09:20'),
('a293068bc1deef6d4546f29d6915a3b2fe54b308f014a199e967bfbc687b08577561596887fbd86e', 12, 1, 'authToken', '[]', 0, '2022-11-20 07:46:16', '2022-11-20 07:46:16', '2023-11-20 10:46:16'),
('a3e728d35bfe5a03e714a1c5ba03d3732538dc14adbb8072216b68d700d001254217cbde5475af27', 1, 1, 'authToken', '[]', 0, '2022-11-20 05:16:06', '2022-11-20 05:16:06', '2023-11-20 08:16:06'),
('a3e8182a0b7b00539d8c5cecf21c513b0022dcb4635d8768e028ea52b01fc1baf7800d2487f1081c', 1, 1, 'authToken', '[]', 0, '2022-11-20 10:22:34', '2022-11-20 10:22:34', '2023-11-20 13:22:34'),
('a5cf4836b7c5965f1ab1859f5c40f8c952b80b43de5e0a420ab080db1c2fe347cb00bbeb08ee84e1', 1, 1, 'authToken', '[]', 0, '2022-11-20 08:38:45', '2022-11-20 08:38:45', '2023-11-20 11:38:45'),
('a694bdc189afffa89160a9bf7f569542ce56635c25d0865f5adefd904e038088615e98ae1c41d409', 1, 1, 'authToken', '[]', 0, '2022-12-09 17:30:31', '2022-12-09 17:30:31', '2023-12-09 20:30:31'),
('a9aad006a17c088a01952a202e1787df5fc0d06ca087d8366c2d6800bb2065055838d4d1aad89713', 1, 1, 'authToken', '[]', 0, '2022-12-05 13:17:40', '2022-12-05 13:17:40', '2023-12-05 16:17:40'),
('ab137ca1f8b86333e9748493e3304a4e38071058a55c619415921794368b3e6aaf6a9263f1f78023', 12, 1, 'authToken', '[]', 0, '2022-11-20 07:47:36', '2022-11-20 07:47:36', '2023-11-20 10:47:36'),
('ac1c2298c07eaff4e5ef0f21f8535e80788a024fd065c6a8fb9922bfe77dc020f8542af1b0627266', 1, 1, 'authToken', '[]', 0, '2022-12-15 08:29:38', '2022-12-15 08:29:38', '2023-12-15 11:29:38'),
('ac246c297f22c9862fab12bab6f43fd0b042b3c5fa61a44e598b2e38aac3fb8e6793012f7139fb12', 1, 1, 'authToken', '[]', 0, '2022-11-13 07:55:10', '2022-11-13 07:55:10', '2023-11-13 10:55:10'),
('acf7b38f900a7cc785f3b63046d2b3983694b95d0e0a6c7ce6cbfd6f53f6a0ec53d865cf8a8550a0', 12, 1, 'authToken', '[]', 0, '2022-11-20 08:10:50', '2022-11-20 08:10:50', '2023-11-20 11:10:50'),
('b083a6802e87dfadfa551c803f0b18441b42d305c00748a599c376d364ba6c2a5acb9352cab3d781', 1, 1, 'authToken', '[]', 0, '2022-11-22 09:44:55', '2022-11-22 09:44:55', '2023-11-22 12:44:55'),
('b28b7a222e3d5844914678a3c3f051d76c9ae8b4358fe7cecb6c8e106c3d46f285721eccf5b2a6f2', 12, 1, 'authToken', '[]', 0, '2022-11-20 08:21:22', '2022-11-20 08:21:22', '2023-11-20 11:21:22'),
('b3cbb9f747c4629778a695bc1eb3059ac3e3f385eb3961e1dc0817acbe5d1ef014176ed5ab4fada5', 10, 1, 'authToken', '[]', 0, '2022-11-19 12:30:07', '2022-11-19 12:30:07', '2023-11-19 15:30:07'),
('b4a99f2ea5b48d95e2f823cff741e6af2c9a5d3a161bbcca4fa75cbf49357c75fa7a600e0f24d8c1', 1, 1, 'authToken', '[]', 0, '2022-11-20 10:24:10', '2022-11-20 10:24:10', '2023-11-20 13:24:10'),
('b61045f28a3ce3134ba3a8e6d8baf23277e06b27953a735187ab8ec7bdf9006d161ebcdb73678ba1', 1, 1, 'authToken', '[]', 0, '2022-11-07 13:17:52', '2022-11-07 13:17:52', '2023-11-07 16:17:52'),
('b84126376f26cdcc8e000234270151c59f11d852420f1beac4a55d262676c9a91600e627060a6ccf', 12, 1, 'authToken', '[]', 0, '2022-11-20 07:33:38', '2022-11-20 07:33:38', '2023-11-20 10:33:38'),
('b8415b80148e4086ab521b2a03505f05a69a6cd90be3a2ce044a7140e6ae21ffb8c8dfcaa177105b', 1, 1, 'authToken', '[]', 0, '2022-11-16 13:52:52', '2022-11-16 13:52:52', '2023-11-16 16:52:52'),
('b8425ffb8039a13d1587a7a4d1ca04d6cb51e5a8e05297b3140e29787d39b32ca009ba8c016cbadf', 5, 1, 'authToken', '[]', 0, '2022-10-31 10:34:11', '2022-10-31 10:34:11', '2023-10-31 15:34:11'),
('b8dd247f4be9287da6b2752311cf44b855d18c1418815e610bd9e7ef50b86180d862726e16d1e6a8', 2, 1, 'authToken', '[]', 0, '2023-01-15 14:24:27', '2023-01-15 14:24:27', '2024-01-15 17:24:27'),
('bb902816767bae955cdb3b25952b8630330d6625bdca9e34252e7d2071acc8000d4e75bb0cabb080', 1, 1, 'authToken', '[]', 0, '2022-11-21 08:39:59', '2022-11-21 08:39:59', '2023-11-21 11:39:59'),
('bd64627e2f5d59cefcb0cb5edbad606746c721db63eade4141469a4f5d204dbb8c6d1bda056212ef', 1, 1, 'authToken', '[]', 0, '2022-11-15 09:18:36', '2022-11-15 09:18:36', '2023-11-15 12:18:36'),
('bdaa8b25ecab6b8d46d9754453539fd07fc0d1744f5ef116d60a0845e97ca5f5dfc845467d5eeeef', 1, 1, 'authToken', '[]', 0, '2022-11-17 14:17:09', '2022-11-17 14:17:09', '2023-11-17 17:17:09'),
('bdaec0658698716395a4ad0085f87b0ce79b62401ac580459ba3d88f7a6cb0737275ee9a93125ad8', 1, 1, 'authToken', '[]', 0, '2022-11-08 18:55:37', '2022-11-08 18:55:37', '2023-11-08 21:55:37'),
('c067d70541c7642deec4aabbae90c1f4da6fa843b3ba5c17d775fe9d16a0700764b303a61991cbb7', 1, 1, 'authToken', '[]', 0, '2022-11-19 12:55:19', '2022-11-19 12:55:19', '2023-11-19 15:55:19'),
('c0aeedf659abdd76eaa143ccf573c20945584ddcd0ce6eb3aa570df6df9f69155a5220a8349ddfa9', 10, 1, 'authToken', '[]', 0, '2022-11-19 12:29:04', '2022-11-19 12:29:04', '2023-11-19 15:29:04'),
('c4d69c230592e292c0760d9f0771bffb1a04024450c8abda5e2e62146ae0395f6d5774ac0511fbf4', 1, 1, 'authToken', '[]', 0, '2022-11-22 05:15:25', '2022-11-22 05:15:25', '2023-11-22 08:15:25'),
('c73c2eda8aed1d0f0cf2f36c8541083f80a697fed00092d03a0d24bc825b4f78cbb81c19f96cab91', 1, 1, 'authToken', '[]', 0, '2022-12-01 15:51:37', '2022-12-01 15:51:37', '2023-12-01 18:51:37'),
('c7e56e35d234bb9e0a514a36a59906f356011f0c92e7a8d1d99236ab96e5808664bfc54d1935c38c', 2, 1, 'authToken', '[]', 0, '2022-11-28 13:40:56', '2022-11-28 13:40:56', '2023-11-28 16:40:56'),
('ca1c9d52e58372faf94041edef428a77fa2e5497c23c4902f0684d167e2144b154abf0b47aae3ce8', 14, 1, 'authToken', '[]', 0, '2022-11-21 08:19:44', '2022-11-21 08:19:44', '2023-11-21 11:19:44'),
('cbac4d6c5217a5a3add74c0b8cfe184a3338b90b09828456cc4a170c10bc81d539a562fb5de9fdc1', 12, 1, 'authToken', '[]', 0, '2022-11-20 08:05:42', '2022-11-20 08:05:42', '2023-11-20 11:05:42'),
('cf384f7815b30b6234c86adff14202fa289aa35803753843d58b9891d5e962637fbb12ac073ab6d8', 12, 1, 'authToken', '[]', 0, '2022-11-20 08:44:49', '2022-11-20 08:44:49', '2023-11-20 11:44:49'),
('d03d05b5bd57f19f9a4f9609bd1f7e93f1b98266296460646460e9612f4f9414981d0eb8d54c76fd', 1, 1, 'authToken', '[]', 0, '2022-11-15 04:28:45', '2022-11-15 04:28:45', '2023-11-15 07:28:45'),
('d1d38d48c5375ca824b648936083f232215abd947c57a50490089c11deba4951a1a38f03fdbac2e9', 1, 1, 'authToken', '[]', 0, '2022-12-03 07:12:56', '2022-12-03 07:12:56', '2023-12-03 10:12:56'),
('d22855f781244f34545439937b8da2c9b53439554e985a9dfff854e4d3c9c972cb275ecde1ea8242', 1, 1, 'authToken', '[]', 0, '2022-12-15 06:20:59', '2022-12-15 06:20:59', '2023-12-15 09:20:59'),
('d22931087bb105226450e86a9ba6fe77729f5bdebf3efa2c59772305c9d36994a0634b506e463567', 1, 1, 'authToken', '[]', 0, '2022-11-08 16:58:49', '2022-11-08 16:58:49', '2023-11-08 19:58:49'),
('d2b94327015322d4a973ac6e6143cb4c6bcb48a0e8b26354e294f49481f9bf2b79e81c96b7fe7e11', 1, 1, 'authToken', '[]', 0, '2023-01-14 16:15:44', '2023-01-14 16:15:44', '2024-01-14 19:15:44'),
('d43cdb2626671f86541b33159913bf7fda740db98f2750dc53798b9d62cbaddc48ca2707f8c85c28', 1, 1, 'authToken', '[]', 0, '2022-11-15 14:37:01', '2022-11-15 14:37:01', '2023-11-15 17:37:01'),
('d48ed48965949abdf9aeb86ca4d18c9a6710dbbe026278a8f7dc6282a9fba9d55658e6276a1de62c', 1, 1, 'authToken', '[]', 0, '2022-12-10 12:52:19', '2022-12-10 12:52:19', '2023-12-10 15:52:19'),
('d4b4de95756f8e6a198391dd76eed7d7a6242344aa3c10e059c2b66c9d93f0c84a15f6e1a1ad1b8e', 1, 1, 'authToken', '[]', 0, '2022-12-03 04:16:31', '2022-12-03 04:16:31', '2023-12-03 07:16:31'),
('d65e9dfa8b56eff416b3ed92e9db610cc9e277659fd7c91c5671e6e6e0cfbaf571e501a194648663', 1, 1, 'authToken', '[]', 0, '2022-11-19 12:56:21', '2022-11-19 12:56:21', '2023-11-19 15:56:21'),
('d7413894e0e42de80dfe511a5f5152d74edbbda35e083fae17e7f8c256c3db6057ae52de73ddf3c2', 1, 1, 'authToken', '[]', 0, '2023-01-15 14:25:26', '2023-01-15 14:25:26', '2024-01-15 17:25:26'),
('d87881f859a33b67154d3f304b789f01a9e95c7d19e13b56cacc4d6a7d810f832430b23d0f73b523', 1, 1, 'authToken', '[]', 0, '2022-11-08 18:30:48', '2022-11-08 18:30:48', '2023-11-08 21:30:48'),
('dc73e11403a89710527f9624128f082eca2c540ea24280a04e407cb509066cc8cda54c1ce89a8987', 1, 1, 'authToken', '[]', 0, '2022-11-23 14:49:05', '2022-11-23 14:49:05', '2023-11-23 17:49:05'),
('dcf5b51ade7aba148b1763ef9458d4916785cb917549f16f15368ab1e53519cf9ded2c92ec955e4d', 3, 1, 'authToken', '[]', 0, '2022-11-05 07:48:50', '2022-11-05 07:48:50', '2023-11-05 10:48:50'),
('de7554bc2a7f611ae85f6e26ff80b8bb88fcc0435a0d1d23ab410e7a4544a35090ee7b67a8abe8e3', 10, 1, 'authToken', '[]', 0, '2022-11-19 14:17:47', '2022-11-19 14:17:47', '2023-11-19 17:17:47'),
('df5c9ece049ed2dd6a73402aa7a58d331da767aa6eef7cf45d95420df6d75b2d63b3aa72e48597a8', 1, 1, 'authToken', '[]', 0, '2022-11-13 07:53:45', '2022-11-13 07:53:45', '2023-11-13 10:53:45'),
('e2419bd4933de1f6e030430b541bb669bc281fcffbe4ddc50f4da24ccd7a49f51b81d5510a1e5c09', 1, 1, 'authToken', '[]', 0, '2022-11-17 14:25:54', '2022-11-17 14:25:54', '2023-11-17 17:25:54'),
('e3ba15f87353b2c62ca0bf62f06c058ef019961bd0b5efc779f4f5e79e54bcb3be6628951bd5ed9e', 1, 1, 'authToken', '[]', 0, '2022-11-23 14:32:56', '2022-11-23 14:32:56', '2023-11-23 17:32:56'),
('e554afd30323c980cefb363bc711cba94e432940e6944d348d6eb4a62301a82c7584116036394d46', 1, 1, 'authToken', '[]', 0, '2022-11-19 11:35:53', '2022-11-19 11:35:53', '2023-11-19 14:35:53'),
('e873e2ee4344a0a08b696e80f91e261f0fa126cfdd0937be137ec0c12e77c82470e5c74158960c46', 1, 1, 'authToken', '[]', 0, '2022-11-16 13:25:54', '2022-11-16 13:25:54', '2023-11-16 16:25:54'),
('e8df82edf114110180a1b635173f56708a4a082b410417feeabee38fa2c08a8a810fbe58be33e580', 1, 1, 'authToken', '[]', 0, '2022-11-19 17:56:53', '2022-11-19 17:56:53', '2023-11-19 20:56:53'),
('edbbdcef870d4c5aca65f2b7714682b915ef47c33f07bb9a5416118773cfc8cd8a06c0a962facc05', 12, 1, 'authToken', '[]', 0, '2022-11-20 04:27:32', '2022-11-20 04:27:32', '2023-11-20 07:27:32'),
('ef49f94a3f67333056bd5df21b225bb53b8b162874e14cee282e6c69f7bb415e07831665ec53a0df', 2, 1, 'authToken', '[]', 0, '2023-01-16 08:53:32', '2023-01-16 08:53:32', '2024-01-16 11:53:32'),
('efd33e20ffb8851c533b7e0fe84bb19f6d94c0c000d8e4bcf521d9c7136b14fccab47be3e8581718', 1, 1, 'authToken', '[]', 0, '2022-12-03 16:16:27', '2022-12-03 16:16:27', '2023-12-03 19:16:27'),
('f00099dc5c6c3b566bf4898186c6781df5a45626ed36ba3d9a986a113501e6f31ea385c929fd695d', 1, 1, 'authToken', '[]', 0, '2022-11-08 16:42:16', '2022-11-08 16:42:16', '2023-11-08 19:42:16'),
('f1f5d3481b4d3962b013d141ab8abcf4069872639015e98127b4a8130d980231c9b5c02ec15bce25', 1, 1, 'authToken', '[]', 0, '2022-12-13 16:12:36', '2022-12-13 16:12:36', '2023-12-13 19:12:36'),
('f3a4ffb29236e99d3300235fa145b588b4b96503e5c802e0dc62a46722a125b4e9123d2f14e829e8', 1, 1, 'authToken', '[]', 0, '2022-12-01 15:51:04', '2022-12-01 15:51:04', '2023-12-01 18:51:04'),
('f3d12d919e833874064190526ba836e08301605d0d70eac2c32ec52c4ef09af0857ee0f192f52fb6', 1, 1, 'authToken', '[]', 0, '2023-01-16 08:57:40', '2023-01-16 08:57:40', '2024-01-16 11:57:40'),
('f4f63c8342e0d3edcfc08dc8ba569f1e296c96dd8b134fb913af6436b58f56983b086c09aa425195', 1, 1, 'authToken', '[]', 0, '2022-11-20 04:26:55', '2022-11-20 04:26:55', '2023-11-20 07:26:55'),
('f703b81f41e4545d4bdd440a9b85b442cf086a9f2961441604088b0f97cfc124a9eee942b7a1bf90', 1, 1, 'authToken', '[]', 0, '2022-11-23 09:04:36', '2022-11-23 09:04:36', '2023-11-23 12:04:36'),
('f7151b6461f59a6996d6cebd43ae22e73c69d0a6a22531b1e3395e99ca5aebf4e80762245612b103', 1, 1, 'authToken', '[]', 0, '2022-11-20 08:32:42', '2022-11-20 08:32:42', '2023-11-20 11:32:42'),
('f88d2daf682df0661a50ed73efe402865ec6ff213b03a4e1e561b13f7fdba517596e94c468803b14', 1, 1, 'authToken', '[]', 0, '2022-11-23 07:50:09', '2022-11-23 07:50:09', '2023-11-23 10:50:09'),
('fd3a41fe2a2a61d7380c4c48a0f0fb79baab761e69e60469b433e329545c65ac4019a8b59523749b', 3, 1, 'authToken', '[]', 0, '2022-11-05 07:48:57', '2022-11-05 07:48:57', '2023-11-05 10:48:57'),
('fe5923c855cebdc613212422acb8a23687fcf1ca2de5ec5528fdb6d4b8c8c68b0a10054554b3d633', 1, 1, 'authToken', '[]', 0, '2022-11-16 14:04:46', '2022-11-16 14:04:46', '2023-11-16 17:04:46'),
('fee1bbd4f89e655a67aa1c7cbc682098d5a391092c69c2ec2635c62f803193669954fd390cbea260', 12, 1, 'authToken', '[]', 0, '2022-11-20 08:06:02', '2022-11-20 08:06:02', '2023-11-20 11:06:02'),
('ffaede2a6558fecc67b1d7908e6bde9efdb356594f85ec6520340c81ce5287829005ffe488b05dbf', 1, 1, 'authToken', '[]', 0, '2022-11-20 07:32:01', '2022-11-20 07:32:01', '2023-11-20 10:32:01');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', '0wuJUlw5qTLW08sAA8V5HEOreOkHQbcQyP0tEWok', NULL, 'http://localhost', 1, 0, 0, '2022-09-25 03:24:06', '2022-09-25 03:24:06'),
(2, NULL, 'Laravel Password Grant Client', '8oOcnD7ZjePBZ6wC0SaRgM6rjVRXaCzNT7fduBWk', 'users', 'http://localhost', 0, 1, 0, '2022-09-25 03:24:06', '2022-09-25 03:24:06');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-09-25 03:24:06', '2022-09-25 03:24:06');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'list-user', 'api', NULL, NULL),
(2, 'view-user', 'api', NULL, NULL),
(3, 'create-user', 'api', NULL, NULL),
(4, 'edit-user', 'api', NULL, NULL),
(5, 'delete-user', 'api', NULL, NULL),
(6, 'list-company', 'api', NULL, NULL),
(7, 'view-company', 'api', NULL, NULL),
(8, 'create-company', 'api', NULL, NULL),
(9, 'edit-company', 'api', NULL, NULL),
(10, 'delete-company', 'api', NULL, NULL),
(11, 'list-vehicle', 'api', NULL, NULL),
(12, 'view-vehicle', 'api', NULL, NULL),
(13, 'create-vehicle', 'api', NULL, NULL),
(14, 'edit-vehicle', 'api', NULL, NULL),
(15, 'delete-vehicle', 'api', NULL, NULL),
(16, 'list-address', 'api', NULL, NULL),
(17, 'view-address', 'api', NULL, NULL),
(18, 'create-address', 'api', NULL, NULL),
(19, 'edit-address', 'api', NULL, NULL),
(20, 'delete-address', 'api', NULL, NULL),
(21, 'list-file', 'api', NULL, NULL),
(22, 'view-file', 'api', NULL, NULL),
(23, 'create-file', 'api', NULL, NULL),
(24, 'edit-file', 'api', NULL, NULL),
(25, 'delete-file', 'api', NULL, NULL),
(26, 'list-setting', 'api', NULL, NULL),
(27, 'view-setting', 'api', NULL, NULL),
(28, 'create-setting', 'api', NULL, NULL),
(29, 'edit-setting', 'api', NULL, NULL),
(30, 'delete-setting', 'api', NULL, NULL),
(31, 'list-question', 'api', NULL, NULL),
(32, 'view-question', 'api', NULL, NULL),
(33, 'create-question', 'api', NULL, NULL),
(34, 'edit-question', 'api', NULL, NULL),
(35, 'delete-question', 'api', NULL, NULL),
(36, 'list-question-type', 'api', NULL, NULL),
(37, 'view-question-type', 'api', NULL, NULL),
(38, 'create-question-type', 'api', NULL, NULL),
(39, 'edit-question-type', 'api', NULL, NULL),
(40, 'delete-question-type', 'api', NULL, NULL),
(41, 'assign-prtmission', 'api', NULL, NULL),
(42, 'allow-notification', 'api', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `protocols`
--

CREATE TABLE `protocols` (
  `id` bigint UNSIGNED NOT NULL,
  `pr_file_id` bigint UNSIGNED NOT NULL,
  `pr_file_minor_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pr_date_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pr_editor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint UNSIGNED NOT NULL,
  `qt_id` bigint UNSIGNED NOT NULL,
  `question` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_types`
--

CREATE TABLE `question_types` (
  `id` bigint UNSIGNED NOT NULL,
  `qt_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qt_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qt_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'super-admin', 'api', '2022-09-25 03:23:46', '2022-09-25 03:23:46'),
(2, 'company-admin', 'api', '2022-09-25 03:23:46', '2022-09-25 03:23:46'),
(3, 'expert', 'api', '2022-09-25 03:23:46', '2022-09-25 03:23:46'),
(4, 'clerk', 'api', '2022-09-25 03:23:46', '2022-09-25 03:23:46');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(6, 3),
(10, 3),
(7, 4),
(11, 4),
(12, 4),
(13, 4),
(14, 4),
(15, 4),
(16, 4),
(17, 4),
(18, 4),
(19, 4),
(20, 4),
(21, 4),
(22, 4),
(23, 4),
(24, 4),
(25, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tiers`
--

CREATE TABLE `tiers` (
  `id` bigint UNSIGNED NOT NULL,
  `vehicle_id` bigint UNSIGNED NOT NULL,
  `tier_set_id` bigint UNSIGNED NOT NULL,
  `tier_comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tier_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tier_rims` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tier_tread_depth` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tier_manufacturer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tier_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tier_dimensions` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tiers`
--

INSERT INTO `tiers` (`id`, `vehicle_id`, `tier_set_id`, `tier_comment`, `tier_type`, `tier_rims`, `tier_tread_depth`, `tier_manufacturer`, `tier_model`, `tier_dimensions`, `created_at`, `updated_at`) VALUES
(28, 26, 1, 'tier_comment_000', 'tier_type_000', 'tier_rims_000', 'tier_tread_depth_000', 'tier_manufacturer_000', 'tier_model_000', 'tier_dimensions_000', '2023-01-12 08:21:22', '2023-01-12 08:21:22');

-- --------------------------------------------------------

--
-- Table structure for table `tier_layouts`
--

CREATE TABLE `tier_layouts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tier_layouts`
--

INSERT INTO `tier_layouts` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'layout_3', '2022-09-25 03:23:47', '2022-09-25 03:23:47'),
(2, 'layout_2', '2022-09-25 03:23:47', '2022-09-25 03:23:47'),
(3, 'layout_3', '2022-09-25 03:23:47', '2022-09-25 03:23:47'),
(4, 'layout_1', '2022-09-25 03:23:47', '2022-09-25 03:23:47'),
(5, 'layout_3', '2022-09-25 03:23:47', '2022-09-25 03:23:47'),
(6, 'layout_3', '2022-09-25 03:23:47', '2022-09-25 03:23:47'),
(7, 'layout_2', '2022-09-25 03:23:47', '2022-09-25 03:23:47'),
(8, 'layout_1', '2022-09-25 03:23:47', '2022-09-25 03:23:47'),
(9, 'layout_3', '2022-09-25 03:23:47', '2022-09-25 03:23:47'),
(10, 'layout_2', '2022-09-25 03:23:47', '2022-09-25 03:23:47'),
(11, 'layout_3', '2022-09-25 03:23:47', '2022-09-25 03:23:47'),
(12, 'layout_1', '2022-09-25 03:23:47', '2022-09-25 03:23:47');

-- --------------------------------------------------------

--
-- Table structure for table `tier_sets`
--

CREATE TABLE `tier_sets` (
  `id` bigint UNSIGNED NOT NULL,
  `tier_layout_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tier_sets`
--

INSERT INTO `tier_sets` (`id`, `tier_layout_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 4, 'set_6', '2022-09-25 03:23:47', '2022-09-25 03:23:47'),
(2, 5, 'set_5', '2022-09-25 03:23:47', '2022-09-25 03:23:47'),
(3, 6, 'set_6', '2022-09-25 03:23:47', '2022-09-25 03:23:47'),
(4, 7, 'set_1', '2022-09-25 03:23:47', '2022-09-25 03:23:47'),
(5, 8, 'set_6', '2022-09-25 03:23:47', '2022-09-25 03:23:47'),
(6, 9, 'set_6', '2022-09-25 03:23:47', '2022-09-25 03:23:47'),
(7, 10, 'set_1', '2022-09-25 03:23:47', '2022-09-25 03:23:47'),
(8, 11, 'set_6', '2022-09-25 03:23:47', '2022-09-25 03:23:47'),
(9, 12, 'set_2', '2022-09-25 03:23:47', '2022-09-25 03:23:47');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `salution` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `homepage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `street_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mailbox` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `salution`, `title`, `first_name`, `last_name`, `birthday`, `homepage`, `telephone`, `mobile`, `fax`, `country`, `city`, `street_no`, `email`, `email_verified_at`, `password`, `company_id`, `mailbox`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'Eulalia', 'Paucek', '2010-09-17', NULL, NULL, '+1-872-674-7481', NULL, 'Montenegro', 'East Elmoburgh', NULL, 'sebastian.effertz@example.org', '2022-08-14 02:14:04', '$2y$10$wwWt5uzicVHmx1ppAv0zk.9e5d/QyHA7ebRmMYgPG1VxdxQEHFLIu', '11', NULL, 'jECxDAJaKM', '2022-08-14 02:14:04', '2022-08-14 02:14:04'),
(2, NULL, NULL, 'Allan', 'Sporer', '2010-02-01', NULL, NULL, '(940) 813-1001', NULL, 'Saint Helena', 'Wilbertstad', NULL, 'durward85@example.net', '2022-08-14 02:14:04', '$2y$10$cVXnN.NAHVw9k7i0adh.HucGHf4FuP.191oPcIY16hN1s6T0jjSsq', '12', NULL, 'MZ28gu1rlY', '2022-08-14 02:14:04', '2022-08-14 02:14:04'),
(3, NULL, NULL, 'Vernice', 'VonRueden', '1974-12-15', NULL, NULL, '+1.534.632.6251', NULL, 'Vanuatu', 'New Darius', NULL, 'luettgen.tyrell@example.org', '2022-08-14 02:14:04', '$2y$10$HD8S3hepNV8TZND6X/n1SODFncfOaCGUsg6rxHS0qje7lFHu./nwe', '13', NULL, 'X9YFv2uhop', '2022-08-14 02:14:04', '2022-08-14 02:14:04'),
(4, NULL, NULL, 'Randal', 'Lang', '1994-07-22', NULL, NULL, '1-458-483-3672', NULL, 'Monaco', 'Lauryview', NULL, 'kamryn81@example.org', '2022-08-14 02:14:04', '$2y$10$ZqW1vpsQBRsyercN5CQvwe8jjcByeQbxPkkXonJ8Ne84VBPNG.hFm', '14', NULL, 'Wdd6HlrGyI', '2022-08-14 02:14:04', '2022-08-14 02:14:04'),
(5, NULL, 'retret', 'sdfdsfds', 'fsdf', '2022-11-30', 'http://carapp.methologik.com/dashboard', '+49 4444 4444444444', '+49 4444 44444444444', '4444444444444444', 'rwerwer', 'werwerewr', 'ewrwer', 'ali@gmail.com', NULL, '$2y$10$xspGytMPqBdwD.KE9P6Hke02fDWMh.JYw/7OZ9nDwg7AYQfA5mxAa', '48', 'werwer', NULL, '2022-12-07 09:38:46', '2022-12-07 09:38:46');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` bigint UNSIGNED NOT NULL,
  `license_plate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `chassis_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hsn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tsn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicle_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `manufacturer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `main_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `structure` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wheel_base` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `driven_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `drive_cabin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seats` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `empty_mass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `construction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suspension_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `axes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `equipment_line` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `axle_load` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `width` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `height` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `engine` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `power` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `engine_displacement` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fuel_gear` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emission_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fine_dust_stricker` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_dynamic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fr_option` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_registration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_admission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aprroved_in` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `construction_year` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `next_main_inspection` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `next_security_check` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_gas_test` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accident_prevention_regulation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gen_dynamic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_off` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ro_option` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `specified` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sp_option` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estimated` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `est_option` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mileage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mileage_comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mil_dynamic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `previous_owner_count` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_vehicle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `steering_wheel_position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `misc_dynamic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `equipements` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tier_layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_cost` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_event` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vl_position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vl_measurement` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vl_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tier_layout_id` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint UNSIGNED NOT NULL,
  `file_id` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `license_plate`, `chassis_no`, `hsn`, `tsn`, `vehicle_type`, `manufacturer`, `main_type`, `subtype`, `structure`, `wheel_base`, `driven_type`, `drive_cabin`, `seats`, `empty_mass`, `construction`, `suspension_type`, `axes`, `equipment_line`, `axle_load`, `long`, `width`, `height`, `engine`, `power`, `engine_displacement`, `fuel_gear`, `emission_class`, `fine_dust_stricker`, `id_dynamic`, `fr_option`, `first_registration`, `last_admission`, `aprroved_in`, `construction_year`, `next_main_inspection`, `next_security_check`, `last_gas_test`, `accident_prevention_regulation`, `gen_dynamic`, `read_off`, `ro_option`, `specified`, `sp_option`, `estimated`, `est_option`, `mileage`, `mileage_comment`, `mil_dynamic`, `color`, `previous_owner_count`, `data_source`, `import_vehicle`, `steering_wheel_position`, `misc_dynamic`, `equipements`, `tier_layout`, `event_date`, `event_cost`, `event_event`, `event_comment`, `vl_position`, `vl_measurement`, `vl_description`, `tier_layout_id`, `company_id`, `file_id`, `created_at`, `updated_at`) VALUES
(26, 'license_000', 'chassis_no_000', 'hsn_000', 'tsn_000', 'vehicle_type_000', 'manufacturer_000', 'main_type_000', 'subtype_000', 'structure_000', 'wheel_base_000', 'driven_type_000', 'drive_cabin_000', 'seats_000', 'empty_mass_000', 'construction_000', 'suspension_type_000', 'axes_000', 'equipment_line_000', 'axle_load_000', 'long_000', 'width_000', 'height_000', 'engine_000', 'power_000', 'engine_displacement_000', 'fuel_gear_000', 'emission_class_000', 'fine_dust_stricker_000', '{\'field name\': \'field value\', \'field name2\':\'field value2\'}', 'unknown', '2022-07-25 09:11:10', '2022-07-25 09:11:10', 'aprroved_in_000', 'construction_year_000', '2022-07-25 09:11:10', '2022-07-25 09:11:10', '2022-07-25 09:11:10', 'accident_prevention_regulation_000', '{\'field name\': \'field value\', \'field name2\':\'field value2\'}', '2022-07-25 09:11:10', 'ro_option_000', '2022-07-25 09:11:10', 'sp_option_000', '2022-07-25 09:11:10', 'est_option_000', 'mileage_000', 'mileage_comment_000', '{\'field name\': \'field value\', \'field name2\':\'field value2\'}', 'color_000', 'previous_owner_count_000', 'DAT', 'import_vehicle_000', 'steering_wheel_position_000', '{\'field name\': \'field value\', \'field name2\':\'field value2\'}', '{\'equipement_type\': \'option\'}', 'tier_layout_000', '2022-07-25 09:11:10,2022-06-25 09:11:10', 'event_cost_000', 'event_event_000', 'event_comment_000', 'vl_position_000', 'vl_measurement_000', 'vl_description_000', '1', 11, '2', '2023-01-12 08:21:22', '2023-01-12 08:21:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_company_id_foreign` (`company_id`);

--
-- Indexes for table `allowed_notifications`
--
ALTER TABLE `allowed_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `companies_email_unique` (`email`);

--
-- Indexes for table `company_profiles`
--
ALTER TABLE `company_profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `files_company_id_foreign` (`company_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `protocols`
--
ALTER TABLE `protocols`
  ADD PRIMARY KEY (`id`),
  ADD KEY `protocols_pr_file_id_foreign` (`pr_file_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questions_qt_id_foreign` (`qt_id`);

--
-- Indexes for table `question_types`
--
ALTER TABLE `question_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_types_company_id_foreign` (`company_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `tiers`
--
ALTER TABLE `tiers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tiers_vehicle_id_foreign` (`vehicle_id`),
  ADD KEY `tiers_tier_set_id_foreign` (`tier_set_id`);

--
-- Indexes for table `tier_layouts`
--
ALTER TABLE `tier_layouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tier_sets`
--
ALTER TABLE `tier_sets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tier_sets_tier_layout_id_foreign` (`tier_layout_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicles_company_id_foreign` (`company_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `allowed_notifications`
--
ALTER TABLE `allowed_notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `company_profiles`
--
ALTER TABLE `company_profiles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `protocols`
--
ALTER TABLE `protocols`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `question_types`
--
ALTER TABLE `question_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tiers`
--
ALTER TABLE `tiers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tier_layouts`
--
ALTER TABLE `tier_layouts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tier_sets`
--
ALTER TABLE `tier_sets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `protocols`
--
ALTER TABLE `protocols`
  ADD CONSTRAINT `protocols_pr_file_id_foreign` FOREIGN KEY (`pr_file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_qt_id_foreign` FOREIGN KEY (`qt_id`) REFERENCES `question_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `question_types`
--
ALTER TABLE `question_types`
  ADD CONSTRAINT `question_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tiers`
--
ALTER TABLE `tiers`
  ADD CONSTRAINT `tiers_tier_set_id_foreign` FOREIGN KEY (`tier_set_id`) REFERENCES `tier_sets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tiers_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tier_sets`
--
ALTER TABLE `tier_sets`
  ADD CONSTRAINT `tier_sets_tier_layout_id_foreign` FOREIGN KEY (`tier_layout_id`) REFERENCES `tier_layouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD CONSTRAINT `vehicles_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
