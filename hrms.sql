-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2024 at 07:34 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hrms`
--

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `machine_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `qty` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `project` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `machine_type`, `name`, `manufacturer`, `model`, `qty`, `date`, `status`, `image`, `project`, `created_at`, `updated_at`) VALUES
(10, NULL, 'BOBCAT', 'S 510', 'S 510', '1', '2022-01-01', 'Working', NULL, NULL, '2022-10-10 15:29:45', '2022-10-10 15:29:45'),
(11, NULL, 'yetsada', 'jkkjh', 'jh', 'kjh', '2022-10-14', 'Working', NULL, NULL, '2022-10-10 17:54:17', '2022-10-10 17:54:17'),
(12, NULL, 'jhgjhgjhg', 'vhbjhgfh', 'gchjh', 'hbjgjhg', '2022-10-06', 'Working', NULL, NULL, '2022-10-10 17:59:01', '2022-10-10 17:59:01'),
(21, NULL, 'AIR BLAST ABSC-2452', 'AIR BLAST ABSC-2452', 'AIR BLAST ABSC-2452', '1', '2022-10-01', 'Working', NULL, 26, '2022-10-14 14:00:58', '2022-10-14 19:07:53'),
(22, NULL, 'test', 'test', 'alto', '1', '2022-10-04', 'Repair', NULL, 27, '2022-10-14 14:10:31', '2022-10-14 19:08:04');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel_cache_spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:14:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:5:\"Users\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:5;i:1;i:7;i:2;i:11;i:3;i:13;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:5:\"Roles\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:11:\"Departments\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:5;i:1;i:6;i:2;i:7;i:3;i:11;i:4;i:13;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:9:\"Locations\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:5;i:1;i:6;i:2;i:7;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:8:\"Employee\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:10:\"Deductions\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:12:\"Designations\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:7:\"Payroll\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:13:\"Leave Tracker\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:7:\"Clients\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:8:\"Projects\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:6:\"Assets\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:15:\"Track Employees\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:4:\"News\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:5;}}}s:5:\"roles\";a:5:{i:0;a:3:{s:1:\"a\";i:5;s:1:\"b\";s:5:\"Admin\";s:1:\"c\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:7;s:1:\"b\";s:8:\"SubAdmin\";s:1:\"c\";s:3:\"web\";}i:2;a:3:{s:1:\"a\";i:11;s:1:\"b\";s:11:\"Super Admin\";s:1:\"c\";s:3:\"web\";}i:3;a:3:{s:1:\"a\";i:13;s:1:\"b\";s:7:\"Creator\";s:1:\"c\";s:3:\"web\";}i:4;a:3:{s:1:\"a\";i:6;s:1:\"b\";s:8:\"Employee\";s:1:\"c\";s:3:\"web\";}}}', 1717488943);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `name`, `email`, `phone`, `address`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Client1', 'client1@gmail.com', '8943437612', 'Client1', NULL, '2022-11-15 06:08:13', '2022-11-15 06:08:13'),
(2, 'Client2', 'client2@gmail.com', '8943437612', 'Client2', NULL, '2022-11-15 06:09:28', '2022-11-15 06:09:28'),
(3, 'Client3', 'client3@gmail.com', '8943437612', 'Client3', NULL, '2022-11-15 06:10:27', '2022-11-15 06:10:27'),
(4, 'Client4', 'client4@gmail.com', '8943437612', 'Client4', NULL, '2022-11-15 06:11:08', '2022-11-15 06:11:08');

-- --------------------------------------------------------

--
-- Table structure for table `deductions`
--

CREATE TABLE `deductions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `ded_code` varchar(255) NOT NULL,
  `ded_no` varchar(255) NOT NULL,
  `ded_amount` decimal(10,2) NOT NULL,
  `month` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Purchase', NULL, NULL, NULL, NULL),
(2, 'Finance', NULL, NULL, NULL, NULL),
(3, 'Transport', NULL, NULL, NULL, NULL),
(4, 'Project', NULL, NULL, NULL, NULL),
(5, 'Centering', NULL, NULL, NULL, NULL),
(6, 'Vehicle', NULL, NULL, NULL, NULL),
(7, 'Mess', NULL, NULL, NULL, NULL),
(8, 'Industrial', NULL, NULL, NULL, NULL),
(9, 'Quarry', NULL, NULL, NULL, NULL),
(10, 'TK Bricks', NULL, NULL, NULL, NULL),
(11, 'Madar', NULL, NULL, NULL, NULL),
(12, 'Fresh Day', NULL, NULL, NULL, NULL),
(13, 'Manager', NULL, NULL, NULL, NULL),
(14, 'Operations', NULL, NULL, NULL, NULL),
(16, 'Fresh Day Fruit Nursery', NULL, NULL, NULL, NULL),
(17, 'Fresh Day Farm', NULL, NULL, NULL, NULL),
(19, 'PROFIX', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Head of Department', 'Head of Department', NULL, '2022-08-22 05:35:08', '2022-08-22 05:35:08'),
(2, 'Executive', 'Executive', NULL, '2022-08-22 05:35:25', '2022-08-22 05:35:25'),
(3, 'Officer', 'worker', NULL, '2022-08-24 04:48:19', '2022-08-24 04:48:19'),
(4, 'Associate', 'employee', NULL, '2022-08-24 04:48:41', '2022-08-24 05:00:48'),
(5, 'Public Relation officer', 'EMPLOYEE', NULL, '2022-08-24 04:49:25', '2022-08-24 04:49:25');

-- --------------------------------------------------------

--
-- Table structure for table `employee_projects`
--

CREATE TABLE `employee_projects` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `month` varchar(100) NOT NULL,
  `payment` varchar(100) DEFAULT NULL,
  `mode` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_projects`
--

INSERT INTO `employee_projects` (`id`, `user_id`, `project_id`, `month`, `payment`, `mode`, `role`, `created_at`, `updated_at`) VALUES
(3, 28, 170, 'June', '22000', 'Monthly', NULL, '2024-06-24 06:45:21', '2024-06-24 06:45:21'),
(4, 482, 170, 'June', '2000', 'Monthly', NULL, '2024-06-24 06:45:21', '2024-06-24 06:45:21'),
(5, 185, 173, 'June', '5000', 'Monthly', NULL, '2024-08-01 07:23:42', '2024-06-24 07:23:42'),
(6, 28, 173, 'August', '300', 'Hourly', NULL, '2024-08-01 04:55:01', '2024-08-01 04:55:01'),
(7, 184, 179, 'August', '200', 'Hourly', 'junior', '2024-08-03 06:28:05', '2024-08-03 06:28:05'),
(8, 185, 179, 'August', '300', 'Monthly', 'junior', '2024-08-03 06:28:05', '2024-08-03 06:28:05');

-- --------------------------------------------------------

--
-- Table structure for table `employee_timesheet`
--

CREATE TABLE `employee_timesheet` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `days_worked` varchar(100) DEFAULT NULL,
  `month` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_timesheet`
--

INSERT INTO `employee_timesheet` (`id`, `user_id`, `days_worked`, `month`, `created_at`, `updated_at`) VALUES
(6, 28, '27', 'May', '2024-06-15 01:30:53', '2024-06-15 01:30:53'),
(7, 482, '20', 'May', '2024-06-15 01:30:53', '2024-06-15 01:30:53'),
(8, 28, '23', 'April', '2024-06-15 01:33:38', '2024-06-15 01:33:38');

-- --------------------------------------------------------

--
-- Table structure for table `employee_timesheet_hourly`
--

CREATE TABLE `employee_timesheet_hourly` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` varchar(100) NOT NULL,
  `year` varchar(100) NOT NULL,
  `month` varchar(100) NOT NULL,
  `week` varchar(100) NOT NULL,
  `code` varchar(100) NOT NULL,
  `compcd` varchar(100) NOT NULL,
  `ptype` varchar(100) NOT NULL,
  `clientcd` varchar(100) NOT NULL,
  `branch` varchar(100) NOT NULL,
  `posicode` varchar(100) DEFAULT NULL,
  `cont_no` varchar(100) DEFAULT NULL,
  `sub_no` varchar(100) DEFAULT NULL,
  `ot1_hrs` varchar(100) DEFAULT NULL,
  `ot1_amt` varchar(100) DEFAULT NULL,
  `ot2_hrs` varchar(100) DEFAULT NULL,
  `ot2_amt` varchar(100) DEFAULT NULL,
  `ot3_hrs` varchar(100) DEFAULT NULL,
  `ot3_amt` varchar(100) DEFAULT NULL,
  `ot4_hrs` varchar(100) DEFAULT NULL,
  `ot4_amt` varchar(100) DEFAULT NULL,
  `ot5_hrs` varchar(100) DEFAULT NULL,
  `ot5_amt` varchar(100) DEFAULT NULL,
  `ot6_hrs` varchar(100) DEFAULT NULL,
  `ot6_amt` varchar(100) DEFAULT NULL,
  `ot7_hrs` varchar(100) DEFAULT NULL,
  `ot7_amt` varchar(100) DEFAULT NULL,
  `ot8_hrs` varchar(100) DEFAULT NULL,
  `ot8_amt` varchar(100) DEFAULT NULL,
  `ot9_hrs` varchar(100) DEFAULT NULL,
  `ot9_amt` varchar(100) DEFAULT NULL,
  `ot10_hrs` varchar(100) DEFAULT NULL,
  `ot10_amt` varchar(100) DEFAULT NULL,
  `ot11_hrs` varchar(100) DEFAULT NULL,
  `ot11_amt` varchar(100) DEFAULT NULL,
  `ot12_hrs` varchar(100) DEFAULT NULL,
  `ot12_amt` varchar(100) DEFAULT NULL,
  `ot13_hrs` varchar(100) DEFAULT NULL,
  `ot13_amt` varchar(100) DEFAULT NULL,
  `day8` varchar(100) DEFAULT NULL,
  `day8_rate` varchar(100) DEFAULT NULL,
  `day8_pay` varchar(100) DEFAULT NULL,
  `day12` varchar(100) DEFAULT NULL,
  `day12_rate` varchar(100) DEFAULT NULL,
  `day12_pay` varchar(100) DEFAULT NULL,
  `nd_days` varchar(100) DEFAULT NULL,
  `nd_amt` varchar(100) DEFAULT NULL,
  `undertime` varchar(100) DEFAULT NULL,
  `under_amt` varchar(100) DEFAULT NULL,
  `ecola` varchar(100) DEFAULT NULL,
  `incentive` varchar(100) DEFAULT NULL,
  `gross_pay` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_timesheet_hourly`
--

INSERT INTO `employee_timesheet_hourly` (`id`, `user_id`, `date`, `year`, `month`, `week`, `code`, `compcd`, `ptype`, `clientcd`, `branch`, `posicode`, `cont_no`, `sub_no`, `ot1_hrs`, `ot1_amt`, `ot2_hrs`, `ot2_amt`, `ot3_hrs`, `ot3_amt`, `ot4_hrs`, `ot4_amt`, `ot5_hrs`, `ot5_amt`, `ot6_hrs`, `ot6_amt`, `ot7_hrs`, `ot7_amt`, `ot8_hrs`, `ot8_amt`, `ot9_hrs`, `ot9_amt`, `ot10_hrs`, `ot10_amt`, `ot11_hrs`, `ot11_amt`, `ot12_hrs`, `ot12_amt`, `ot13_hrs`, `ot13_amt`, `day8`, `day8_rate`, `day8_pay`, `day12`, `day12_rate`, `day12_pay`, `nd_days`, `nd_amt`, `undertime`, `under_amt`, `ecola`, `incentive`, `gross_pay`, `created_at`, `updated_at`) VALUES
(1, 28, '01-06-2021', '2021', '08', 'A', 'REY001', '', 'DM', 'CHIRON', 'HO', 'GUARD', '', '', '0', '0', '0', '0', '0', '0', '12', NULL, '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '8', '67.12', NULL, '4', '503.75', NULL, '1', NULL, '0', '0', '0', '0', NULL, '2024-07-10 06:35:46', '2024-07-10 06:35:46'),
(2, 28, '02-06-2021', '2021', '08', 'A', 'REY001', '', 'DM', 'CHIRON', 'HO', 'GUARD', '', '', '0', '0', '0', '0', '0', NULL, '0', NULL, '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '8', '67.12', NULL, '4', '503.75', NULL, '0', NULL, '0', '0', '0', '0', NULL, '2024-07-10 06:35:46', '2024-07-10 06:35:46'),
(3, 28, '03-06-2021', '2021', '08', 'A', 'REY001', '', 'DM', 'CHIRON', 'HO', 'GUARD', '', '', '0', '0', '0', '0', '0', NULL, '0', NULL, '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '8', '67.12', NULL, '4', '503.75', NULL, '0', NULL, '0', '0', '0', '0', NULL, '2024-07-10 06:35:46', '2024-07-10 06:35:46'),
(4, 28, '04-06-2021', '2021', '08', 'A', 'REY001', '', 'DM', 'CHIRON', 'HO', 'GUARD', '', '', '0', '0', '0', '0', '0', NULL, '0', NULL, '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '8', '67.12', NULL, '4', '503.75', NULL, '0', NULL, '0', '0', '0', '0', NULL, '2024-07-10 06:35:46', '2024-07-10 06:35:46'),
(5, 28, '05-06-2021', '2021', '08', 'A', 'REY001', '', 'DM', 'CHIRON', 'HO', 'GUARD', '', '', '0', '0', '0', '0', '0', NULL, '0', NULL, '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '8', '67.12', NULL, '4', '503.75', NULL, '0', NULL, '0', '0', '0', '0', NULL, '2024-07-10 06:35:46', '2024-07-10 06:35:46'),
(6, 28, '06-06-2021', '2021', '08', 'A', 'REY001', '', 'DM', 'CHIRON', 'HO', 'GUARD', '', '', '0', '0', '0', '0', '0', NULL, '0', NULL, '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '8', '67.12', NULL, '4', '503.75', NULL, '0', NULL, '0', '0', '0', '0', NULL, '2024-07-10 06:35:46', '2024-07-10 06:35:46'),
(7, 28, '07-06-2021', '2021', '08', 'A', 'REY001', '', 'DM', 'CHIRON', 'HO', 'GUARD', '', '', '0', '0', '0', '0', '0', NULL, '0', NULL, '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '8', '67.12', NULL, '4', '503.75', NULL, '0', NULL, '0', '0', '0', '0', NULL, '2024-07-10 06:35:46', '2024-07-10 06:35:46'),
(8, 28, '08-06-2021', '2021', '08', 'A', 'REY001', '', 'DM', 'CHIRON', 'HO', 'GUARD', '', '', '0', '0', '0', '0', '0', NULL, '0', NULL, '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '8', '67.12', NULL, '4', '503.75', NULL, '0', NULL, '0', '0', '0', '0', NULL, '2024-07-10 06:35:46', '2024-07-10 06:35:46'),
(9, 28, '09-06-2021', '2021', '08', 'A', 'REY001', '', 'DM', 'CHIRON', 'HO', 'GUARD', '', '', '0', '0', '0', '0', '0', NULL, '0', NULL, '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '8', '67.12', NULL, '4', '503.75', NULL, '0', NULL, '0', '0', '0', '0', NULL, '2024-07-10 06:35:46', '2024-07-10 06:35:46'),
(10, 28, '10-06-2021', '2021', '08', 'A', 'REY001', '', 'DM', 'CHIRON', 'HO', 'GUARD', '', '', '0', '0', '0', '0', '0', NULL, '0', NULL, '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '8', '67.12', NULL, '4', '503.75', NULL, '0', NULL, '0', '0', '0', '0', NULL, '2024-07-10 06:35:46', '2024-07-10 06:35:46'),
(11, 28, '11-06-2021', '2021', '08', 'A', 'REY001', '', 'DM', 'CHIRON', 'HO', 'GUARD', '', '', '0', '0', '0', '0', '0', NULL, '0', NULL, '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '8', '67.12', NULL, '4', '503.75', NULL, '0', NULL, '0', '0', '0', '0', NULL, '2024-07-10 06:35:46', '2024-07-10 06:35:46'),
(12, 28, '12-06-2021', '2021', '08', 'A', 'REY001', '', 'DM', 'CHIRON', 'HO', 'GUARD', '', '', '0', '0', '0', '0', '0', NULL, '0', NULL, '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '8', '67.12', NULL, '4', '503.75', NULL, '0', NULL, '0', '0', '0', '0', NULL, '2024-07-10 06:35:46', '2024-07-10 06:35:46'),
(13, 40, '13-06-2021', '2021', '08', 'A', 'REY001', '', 'DM', 'CHIRON', 'HO', 'GUARD', '', '', '0', '0', '0', '0', '0', NULL, '0', NULL, '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '8', '67.12', NULL, '4', '503.75', NULL, '0', NULL, '0', '0', '0', '0', NULL, '2024-07-10 06:35:46', '2024-07-10 06:35:46'),
(14, 40, '01-06-2021', '2021', '08', 'A', 'REY001', '', 'DM', 'CHIRON', 'HO', 'GUARD', '', '', '0', '0', '0', '0', '0', NULL, '0', NULL, '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '8', '67.12', NULL, '4', '503.75', NULL, '0', NULL, '0', '0', '0', '0', NULL, '2024-07-10 06:35:46', '2024-07-10 06:35:46');

-- --------------------------------------------------------

--
-- Table structure for table `expiry_notifications`
--

CREATE TABLE `expiry_notifications` (
  `id` int(200) NOT NULL,
  `user_id` int(200) NOT NULL,
  `type` varchar(200) NOT NULL,
  `expiry_date` varchar(200) NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `number` varchar(500) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `expiry_notifications`
--

INSERT INTO `expiry_notifications` (`id`, `user_id`, `type`, `expiry_date`, `image`, `number`, `created_at`, `updated_at`) VALUES
(6, 206, 'Licence', '2022-06-14T18:30:00.000Z', 'kozhikode10.jpg', 'SN53245', '2022-06-14 07:37:04', '2022-06-15 12:29:40'),
(7, 2, 'Passport', '2022-06-14T18:30:00.000Z', 'kozhikode1.jpg', 'SN53245', '2022-06-14 09:05:47', '2022-06-29 11:16:52'),
(8, 206, 'Licence', '2030-06-15T12:22:02.000Z', 'kozhikode1.jpg', '324534312', '2022-06-14 09:05:56', '2022-06-15 12:28:04'),
(10, 31, 'Eqama', '2025-08-20T11:59:47.000Z', NULL, '2283934517', '2022-06-15 12:20:19', '2022-06-16 22:32:55'),
(11, 206, 'Insurance', '2022-06-16T12:24:35.101Z', NULL, '1234321', '2022-06-15 12:24:43', '2022-06-15 12:24:43');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `user_id` varchar(1000) NOT NULL,
  `date` varchar(1000) NOT NULL,
  `subject` varchar(1000) NOT NULL,
  `message` varchar(5000) NOT NULL,
  `status` varchar(1000) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `user_id`, `date`, `subject`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, '2', '18/12/2019', 'Issue', 'Please fix', 'Rejected', '2022-08-26 10:51:58', '2022-08-26 10:51:58'),
(2, '5', '18/12/2019', 'Suggestion', 'would be better,would be better,would be better,would be better\r\n', 'Accepted', '2022-08-26 10:51:58', '2022-08-26 10:51:58'),
(3, '2', '20/12/2019', 'Issue', 'gggg', 'Pending', '2022-08-26 10:51:58', '2022-08-26 10:51:58'),
(4, '5', '21/12/2019', 'Issue', 'this issue', 'Accepted', '2022-08-26 10:51:58', '2022-08-26 10:51:58'),
(5, '2', '12/02/2020', 'Suggestion', 'Editing of submitted labour request is different. Need some more modification', 'Accepted', '2022-08-26 10:51:58', '2022-08-26 10:51:58'),
(6, '5', '20/02/2020', 'Issue', 'Image uploading  time errors will be be shown...!\n', 'Accepted', '2022-08-26 10:51:58', '2022-08-26 10:51:58'),
(7, '2', '14/03/2020', 'Suggestion', 'Add gst number in contact info \n', 'Pending', '2022-08-26 10:51:58', '2022-08-26 10:51:58'),
(8, '5', '16/03/2020', 'Suggestion', 'While submitting the daily labourer status, it would be better if we can add different types of works at a time (like in labour request option)', 'Pending', '2022-08-26 10:51:58', '2022-08-26 10:51:58'),
(9, '2', '09/12/2021', 'Issue', 'For testing app adox', 'Pending', '2022-08-26 10:51:58', '2022-08-26 10:51:58'),
(10, '5', '09/12/2021', 'Suggestion', 'Forvtesting app sggestions', 'Pending', '2022-08-26 10:51:58', '2022-08-26 10:51:58'),
(11, '2', '09/12/2021', 'Issue', 'For testing issues in app', 'Pending', '2022-08-26 10:51:58', '2022-08-26 10:51:58'),
(12, '5', '09/12/2021', 'Issue', 'For testing app', 'Pending', '2022-08-26 10:51:58', '2022-08-26 10:51:58'),
(13, '1', '2022-08-26', 'Issue', 'Tt', 'Pending', '2022-08-26 10:52:02', '2022-08-26 10:52:02'),
(14, '1', '2022-08-26', 'Issue', 'Tt', 'Pending', '2022-08-26 10:52:39', '2022-08-26 10:52:39'),
(15, '2', '2022-08-26', 'Issue', 'Tt', 'Pending', '2022-08-26 10:56:21', '2022-08-26 10:56:21'),
(16, '2', '2022-08-26', 'Suggestion', 'Tt', 'Pending', '2022-08-26 10:57:39', '2022-08-26 10:57:39');

-- --------------------------------------------------------

--
-- Table structure for table `firebases`
--

CREATE TABLE `firebases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `firebases`
--

INSERT INTO `firebases` (`id`, `user_id`, `token`, `created_at`, `updated_at`) VALUES
(1, 3, 'e9X7pj9gQaqt_ZXOjWhFi-:APA91bFLl__Loh38TakGVeqJRMhmfZGDfqxySuH2hrcXhXULLF56nA1E6iUW6Aqh1LY-yW9pPOULyUwpLUBTgU3mieHO94yGNf19eg5PUPByj3k7-z_DY8d2sH_kWPyPm2iDdXTaeRvc', '2022-04-08 07:32:58', '2022-05-13 10:45:26'),
(2, 2, 'fGrXkO9CQWyBK3p1UZ2vfV:APA91bGu7glSjYsKG9Rl0GxTSK5fYINe_wbf-ThJQ-Or91XIRfwNvCuXRdgvewKVYo3zWx8uZgyRcP0dYS7j860JAfKKv1WpP74FbpcdPkAOcnE2H43MvU_44u-AMXhtITWL0KM0XM0z', '2022-04-29 10:45:06', '2022-08-13 17:17:17'),
(3, 6, 'e9X7pj9gQaqt_ZXOjWhFi-:APA91bFLl__Loh38TakGVeqJRMhmfZGDfqxySuH2hrcXhXULLF56nA1E6iUW6Aqh1LY-yW9pPOULyUwpLUBTgU3mieHO94yGNf19eg5PUPByj3k7-z_DY8d2sH_kWPyPm2iDdXTaeRvc', '2022-05-13 09:19:18', '2022-05-13 10:52:44'),
(4, 9, 'e9X7pj9gQaqt_ZXOjWhFi-:APA91bFLl__Loh38TakGVeqJRMhmfZGDfqxySuH2hrcXhXULLF56nA1E6iUW6Aqh1LY-yW9pPOULyUwpLUBTgU3mieHO94yGNf19eg5PUPByj3k7-z_DY8d2sH_kWPyPm2iDdXTaeRvc', '2022-05-13 10:54:33', '2022-05-16 11:04:18'),
(5, 5, 'fy8jdz9hLkerkVhAHlGwll:APA91bGnFATIu_kM7euMaRe1Tq_aHXXE2eCvt2bRohrQ0TsPG7f_1PbywOCZ8iZjQCVxN2a1N0vN5b8RPTxChPvpTyMskO1uBunV3iL0nOehc4ORNMfQFuxdA4YDVjTQu-PpA58K5C6U', '2022-05-13 11:31:05', '2022-06-08 10:47:05'),
(6, 18, '123', '2022-05-23 07:42:58', '2022-05-23 07:42:58'),
(7, 20, '123', '2022-05-23 07:51:27', '2022-05-23 07:51:27'),
(8, 21, 'eJlFhV5VRUmaTmCva3ngO_:APA91bErl2LD9PD137HJgpqIf67_ZJOUBZUuB2mhPytlR7sEw4j_DeHZKZ5v26Oss1SBfb6uz46gCm95r02DxPUAdyiJd-l3TN1vSkBsy3GYmaHwMEzAlWi1UUjBnzck7gdAtW8uegsI', '2022-05-23 07:53:10', '2022-05-25 05:13:54'),
(9, 22, 'fr5brFAgSteU3ggDDUUpuG:APA91bFesYsVoFtNOAwr_PQEHxSi1VGxcxCvP_WqRuvv3s0rhdn_P2zLk6FlEHKQD3LUKeBPbca-bwablHMNeLKsdUqi3USE8ZP9UHB9QaH8XqrtkuwDtPkqGODvwpe_kauVyxgmEJ83', '2022-05-23 09:00:04', '2022-05-23 09:06:57'),
(10, 17, 'c7UCNIkxQfOljwK3CCwgN5:APA91bGp3wIgDWT7E3Prm7SqfcUNz4cgLGuAlFqiswzVKP_6qW81am10uED8od1T0j8EnOSKizNMeBwtzmQS-Q5d6zm9WaU3Eg0vVpvi0q4RAb0WVHi_4lbu3tGyApvspD108-hYtOVi', '2022-05-23 09:06:39', '2022-05-28 12:39:42'),
(11, 26, '123', '2022-05-23 15:09:39', '2022-05-23 15:09:39'),
(12, 28, 'ihhjhjiuui', '2022-05-24 09:32:45', '2022-11-14 07:05:11'),
(13, 29, 'fieeexwNS2KNwnevIrfBp8:APA91bG89hYz42NgEygMoPnvBdThCRh4VxRug3p9E0_TN_Q92L8JWjMV243vUjA8_-y0ftQCu85vfG0G4ovW_8UaPzpaot9JPq3MWTxHpBvaLzY8RZmubY_JpVWREpckiweMVdwlKTz6', '2022-05-24 10:04:47', '2022-05-24 10:04:47'),
(14, 16, 'dPcYvnZxf0fvnbO0RCOINA:APA91bExTNSd3shDHeNDlqDX5CJTAsV4S1XJtb7EvKRXJFR1tuOfyslStAu2FYnKjo1L1Ng_YGPb5bcvkp7Ju19Z8gey7FdwWZrlJ1Qr6qK8BF_RE26xD9bgpEzVbPK4ulu5X_ZcQuOn', '2022-05-24 11:50:28', '2022-08-13 07:29:28'),
(15, 30, 'fm66WbF0QHibbpDvvqwSm1:APA91bFDtiQYgq1lhT1gov3BjaXpdzVNbU-M9lij9q8O2fjUY_oVCKJ4gpd37_4md91oCoi0TLBQZni3f-LzUEgMpPBPSBNjRSP6f8MLeGGc1Xmu-XDivdgFuHvZ9SNLf9qy5rpCNcLl', '2022-05-24 18:54:44', '2022-05-24 18:54:44'),
(16, 32, 'fFTNcM8BTau1n35DaHrZ70:APA91bHJKW8-h6ioHQn1FBwzJtAz81kNY5esVCH3NcvsMq_lgU_-xub-TB7sJYbGZPnextneKD5Q6u079xgMoBdjKdQGYf5P5XxXsS-8GfVDiarp4V_KxFezIEPX0lVQ98_9NGKEzd48', '2022-05-30 05:38:51', '2022-05-30 05:38:51'),
(17, 33, 'test', '2022-05-30 11:10:50', '2022-08-27 05:08:12'),
(18, 1, 'ihhjhjiuui', '2022-06-23 04:46:37', '2022-11-14 07:07:07'),
(19, 480, '', '2022-08-31 04:46:08', '2023-01-03 10:13:12'),
(20, 40, 'fsByw5Ui3kkgm4jMl4RAb6:APA91bHpm0l2I66KY1F9HN0flnR4HYkvZ-ZF4yrCBL-IbB1XUIXw3DZkfLsSJyzi67WnZQRor_7R900i2Gg-wZYkg6XD5DxGlloEZV_oM5kipDncwJvofx4byDrxW7TEC1RLCXS1FZJ_', '2022-09-01 09:10:08', '2022-09-11 10:37:25'),
(21, 392, 'fceEqBJKSNOCHLfno2bQpo:APA91bFCTKNpOOdUP7-zxKAx02ROvZQ77NGOAVlavbn_S_1xpYoIp8IOR4sY2SkB1PlrLvKJDT3Qo9MbTjOtHqz3mtL_gele2xTbj3n7XrC_iZcy4nIM8kIvdUZqqO8qRQa05XqfEEZU', '2022-09-01 10:24:52', '2022-11-03 07:10:28'),
(22, 483, 'fceEqBJKSNOCHLfno2bQpo:APA91bFCTKNpOOdUP7-zxKAx02ROvZQ77NGOAVlavbn_S_1xpYoIp8IOR4sY2SkB1PlrLvKJDT3Qo9MbTjOtHqz3mtL_gele2xTbj3n7XrC_iZcy4nIM8kIvdUZqqO8qRQa05XqfEEZU', '2022-11-08 05:06:06', '2022-11-08 05:13:52');

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `holidays`
--

INSERT INTO `holidays` (`id`, `name`, `date`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Independence Day', '2022/08/15 - 2022/08/15', 'Independence Day', NULL, '2022-08-25 05:37:44', '2022-08-25 05:37:44'),
(2, 'Christmas', '2024/12/24 - 2024/12/25', 'Christimas holidays', NULL, '2024-05-07 23:53:03', '2024-05-07 23:53:03');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` text DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `reject_reason` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leaves`
--

INSERT INTO `leaves` (`id`, `user_id`, `type`, `count`, `details`, `reason`, `status`, `reject_reason`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 392, 'hour', 2, '{\"start\":\"2022-10-28T10:46:56.129Z\",\"end\":\"2022-10-28T12:46:56.129Z\",\"date\":\"2022-10-28T10:46:56.129Z\"}', 'Mmmm', 'Pending', NULL, NULL, '2022-10-28 10:53:10', '2022-10-28 10:53:10'),
(2, 392, 'days', 2, '{\"start\":\"2022-10-28T10:46:56.129Z\",\"end\":\"2022-10-29T10:46:56.129Z\",\"date\":\"2022-10-28T10:46:56.129Z\"}', 'Dygcyc', 'Pending', NULL, NULL, '2022-10-28 10:53:34', '2022-10-28 10:53:34'),
(3, 28, 'days', 2, '{\"start_date\":\"10\\/22\\/2022\",\"end_date\":\"11\\/22\\/2022\"}', 'Fever', 'Approved', '', NULL, '2022-10-29 12:10:31', '2022-11-05 04:40:19'),
(4, 392, 'days', 1, '{\"start\":null,\"end\":null,\"date\":\"2022-11-06T08:52:27.260Z\"}', 'App testing', 'Pending', NULL, NULL, '2022-11-05 08:53:35', '2022-11-05 08:53:35'),
(5, 392, 'days', 1, '{\"start\":null,\"end\":null,\"date\":\"2022-11-05T08:52:27.260Z\"}', 'Ttt', 'Pending', NULL, NULL, '2022-11-05 08:55:42', '2022-11-05 08:55:42'),
(6, 480, 'days', 1, '{\"start\":null,\"end\":null,\"date\":\"2022-11-05T11:27:18.278Z\"}', 'Hhhh', 'Pending', NULL, NULL, '2022-11-05 11:28:36', '2022-11-05 11:28:36'),
(7, 28, 'days', 2, '{\"start\":\"2022-11-11T05:10:20.992Z\",\"end\":\"2022-11-12T05:10:20.992Z\",\"date\":null}', 'Testing', 'Pending', NULL, NULL, '2022-11-08 05:11:54', '2022-11-08 05:11:54'),
(8, 483, 'days', 1, '{\"start\":null,\"end\":null,\"date\":\"2022-11-09T05:10:20.992Z\"}', 'App testing', 'Pending', NULL, NULL, '2022-11-08 05:18:21', '2022-11-08 05:18:21'),
(9, 483, 'days', 2, '{\"start\":\"2022-11-16T08:49:18.938Z\",\"end\":\"2022-11-17T08:49:18.938Z\",\"date\":null}', 'Testing apps', 'Approved', '', NULL, '2022-11-16 08:50:04', '2024-05-07 23:53:19'),
(10, 483, 'hour', 2, '{\"start\":\"2022-11-16T08:49:18.938Z\",\"end\":\"2022-11-16T10:49:18.938Z\",\"date\":\"2022-11-16T08:49:18.938Z\"}', 'App testing...', 'Approved', '', NULL, '2022-11-16 08:53:27', '2024-05-07 23:53:17');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `location_code` varchar(255) NOT NULL,
  `location_name` varchar(255) NOT NULL,
  `region` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `image` text DEFAULT NULL,
  `lat` varchar(255) NOT NULL,
  `lng` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `location_code`, `location_name`, `region`, `phone`, `image`, `lat`, `lng`, `address`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '1', 'Riyadh', 'Central', '054 876 3928', NULL, '24.6996524', '46.7083063', 'Prince Sultan Bin Abdulaziz Rd, As Sulimaniyah', NULL, '2022-02-17 06:00:21', '2022-05-07 09:02:15'),
(2, '2', 'Hail', 'West', '9999999', NULL, '27.5230355', '41.701604', '9282 Al Amir Fahd Ibn Saad, Labdah, 2777, Hail', NULL, '2022-05-07 09:03:26', '2022-05-07 09:04:42'),
(3, '3', 'Dammam', 'East', '9999', NULL, '26.2825173', '50.2161502', 'Prince Ahmed St, Madinat Al Umal, Al Khobar 34441', NULL, '2022-05-07 09:06:50', '2022-05-30 12:09:56'),
(4, '3', 'Madina', 'West', '9999', NULL, '24.4482424', '39.6148942', 'Imam Ahmad ibn Hanbal, Al Jumuah, Medina', NULL, '2022-05-07 09:09:07', '2022-05-07 09:09:07'),
(5, '4', 'Qassim', 'West', '99999', NULL, '26.1201804', '43.9732915', 'Uthman Ibn Affan Rd, Mishrif, Unayzah', NULL, '2022-05-07 09:10:23', '2022-05-07 09:10:23'),
(6, '6', 'hafar Al batin', 'West', '9999', NULL, '28.420526', '45.9661991', 'King Khalid Ibn Abdul Aziz, الخالدية،, Hafar Al Batin', NULL, '2022-05-07 09:12:21', '2022-05-07 09:12:21'),
(7, 'Murabbah test', 'Murabbah Test', 'Central', '999', NULL, '24.665529', '46.704369', 'murabbah', NULL, '2022-05-13 07:58:50', '2022-05-13 07:58:50'),
(8, '123', 'Chennnamangallur Test', 'North', '8943437610', NULL, '11.2950', '75.9808', 'test', NULL, '2022-05-13 09:16:27', '2022-05-13 09:16:27'),
(9, 'ADOX12', 'Adox testing', 'Central', '1212121212', NULL, '11.316013618939357', '75.99808939265975', 'Adox solutions', NULL, '2022-05-16 09:36:57', '2022-05-16 10:30:04'),
(10, '12', 'riyadh2', 'Central', '999', NULL, '24.6556965', '46.7175636', 'test', NULL, '2022-05-20 15:02:52', '2022-05-28 12:39:58'),
(11, '12', 'riyadh2', 'Central', '999', NULL, '24.679016', '46.729912', 'test', NULL, '2022-05-20 15:02:53', '2022-05-20 15:02:53'),
(12, 'Riyadh3', 'Riyadh3', 'Central', '9999', NULL, '24.6790148', '46.7299325', 'test', NULL, '2022-05-28 12:41:53', '2022-05-29 07:52:45'),
(13, 'Dmm - Test', 'Dammam', 'Choose a region', '0565981553', NULL, '26.2825082', '50.2142913', 'Artland', NULL, '2022-05-30 05:53:30', '2022-05-30 05:53:30'),
(14, 'Testing2', 'Testing2', 'Central', 'Testing2', NULL, '24.752005', '46.630798', 'Testing2', NULL, '2022-06-08 11:00:27', '2022-06-08 11:00:27');

-- --------------------------------------------------------

--
-- Table structure for table `machine_types`
--

CREATE TABLE `machine_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `machine_types`
--

INSERT INTO `machine_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(27, 'Machinery', '2022-10-10 07:01:37', '2022-10-10 07:01:37'),
(28, 'Tools', '2022-10-10 07:02:21', '2022-10-10 07:02:21');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2022_01_21_095931_create_departments_table', 1),
(4, '2021_10_01_115908_create_stations_table', 2),
(5, '2021_10_01_115908_create_locations_table', 3),
(6, '2022_01_21_095931_create_designations_table', 4),
(7, '0001_01_01_000001_create_cache_table', 5),
(8, '0001_01_01_000002_create_jobs_table', 5),
(9, '2024_07_05_045114_drop_deductions_table', 6),
(10, '2024_07_05_050245_create_deductions_table', 6),
(11, '2024_08_16_082056_create_payroll_components_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(5, 'App\\Models\\User', 25),
(5, 'App\\Models\\User', 36),
(5, 'App\\Models\\User', 480),
(5, 'App\\Models\\User', 495),
(5, 'App\\Models\\User', 496),
(5, 'App\\Models\\User', 497),
(6, 'App\\Models\\User', 2),
(6, 'App\\Models\\User', 4),
(6, 'App\\Models\\User', 5),
(6, 'App\\Models\\User', 6),
(6, 'App\\Models\\User', 7),
(6, 'App\\Models\\User', 8),
(6, 'App\\Models\\User', 9),
(6, 'App\\Models\\User', 10),
(6, 'App\\Models\\User', 11),
(6, 'App\\Models\\User', 12),
(6, 'App\\Models\\User', 13),
(6, 'App\\Models\\User', 14),
(6, 'App\\Models\\User', 15),
(6, 'App\\Models\\User', 16),
(6, 'App\\Models\\User', 17),
(6, 'App\\Models\\User', 18),
(6, 'App\\Models\\User', 19),
(6, 'App\\Models\\User', 20),
(6, 'App\\Models\\User', 21),
(6, 'App\\Models\\User', 22),
(6, 'App\\Models\\User', 23),
(6, 'App\\Models\\User', 24),
(6, 'App\\Models\\User', 26),
(6, 'App\\Models\\User', 27),
(6, 'App\\Models\\User', 28),
(6, 'App\\Models\\User', 29),
(6, 'App\\Models\\User', 30),
(6, 'App\\Models\\User', 31),
(6, 'App\\Models\\User', 32),
(6, 'App\\Models\\User', 33),
(6, 'App\\Models\\User', 34),
(7, 'App\\Models\\User', 492),
(7, 'App\\Models\\User', 493),
(11, 'App\\Models\\User', 484),
(11, 'App\\Models\\User', 490),
(13, 'App\\Models\\User', 486),
(13, 'App\\Models\\User', 491),
(13, 'App\\Models\\User', 494);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `heading` text NOT NULL,
  `content` text NOT NULL,
  `type` varchar(250) DEFAULT NULL,
  `photo` varchar(250) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `heading`, `content`, `type`, `photo`, `status`, `created_at`, `updated_at`) VALUES
(1, 'New Launch', 'Anarc HRMS version 2 launching soon', 'news', NULL, 0, '2022-10-05 14:31:57', '2022-10-05 14:31:57');

-- --------------------------------------------------------

--
-- Table structure for table `payment_status`
--

CREATE TABLE `payment_status` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0-Not paid\r\n1-paid',
  `month` varchar(100) DEFAULT NULL,
  `amount` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_status`
--

INSERT INTO `payment_status` (`id`, `user_id`, `status`, `month`, `amount`, `created_at`, `updated_at`) VALUES
(6, 41, 1, 'June', NULL, '2024-07-06 00:42:00', '2024-07-06 00:42:00'),
(7, 28, 1, 'June', NULL, '2024-07-06 00:46:11', '2024-07-06 00:46:11'),
(8, 40, 1, 'June', NULL, '2024-07-16 02:54:35', '2024-07-16 02:54:35'),
(13, 28, 1, 'July', '6612.384', '2024-08-09 20:52:58', '2024-08-09 20:52:58');

-- --------------------------------------------------------

--
-- Table structure for table `payroll_components`
--

CREATE TABLE `payroll_components` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(300) NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payroll_components`
--

INSERT INTO `payroll_components` (`id`, `name`, `type`, `value`, `created_at`, `updated_at`) VALUES
(2, 'Holidays', 'Pay', 0.30, '2024-08-16 19:47:30', '2024-08-16 19:48:38');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Users', 'web', '2022-01-07 12:11:08', '2022-01-07 12:11:08'),
(2, 'Roles', 'web', '2022-01-07 12:11:08', '2022-01-07 12:11:08'),
(3, 'Departments', 'web', '2022-01-07 12:11:08', '2022-01-07 12:11:08'),
(4, 'Locations', 'web', '2022-01-07 12:11:08', '2022-01-07 12:11:08'),
(5, 'Employee', 'web', NULL, NULL),
(6, 'Deductions', 'web', NULL, NULL),
(7, 'Designations', 'web', NULL, NULL),
(8, 'Payroll', 'web', NULL, NULL),
(9, 'Leave Tracker', 'web', NULL, NULL),
(10, 'Clients', 'web', NULL, NULL),
(11, 'Projects', 'web', NULL, NULL),
(12, 'Assets', 'web', NULL, NULL),
(13, 'Track Employees', 'web', NULL, NULL),
(14, 'News', 'web', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 'auth_token', '367d9621ddcce63223e843280c4e0a9cfa17749c02b733e153f67853172d69c3', '[\"*\"]', NULL, '2022-03-04 17:36:51', '2022-03-04 17:36:51'),
(2, 'App\\Models\\User', 2, 'auth_token', '51541b6327e1c31adbfa963e5ac14cf743d6279e7431cfaccee45574543e3c08', '[\"*\"]', NULL, '2022-03-04 17:36:51', '2022-03-04 17:36:51'),
(3, 'App\\Models\\User', 2, 'auth_token', 'd4fecdf6e7932e365404f0c4c639381ef18776072d82f333ab632d2cf4da5651', '[\"*\"]', NULL, '2022-03-04 17:37:32', '2022-03-04 17:37:32'),
(4, 'App\\Models\\User', 2, 'auth_token', '75a54bf8c26b62163d3437f69ab674ae8c86347db96d7ee38e096d96bfb77032', '[\"*\"]', NULL, '2022-03-04 17:37:32', '2022-03-04 17:37:32'),
(5, 'App\\Models\\User', 2, 'auth_token', '28fb0554cdf99d19ef93cf4dbaa229b11f93b76de62b2c88018b89ff2dc09502', '[\"*\"]', NULL, '2022-03-07 11:43:35', '2022-03-07 11:43:35'),
(6, 'App\\Models\\User', 2, 'auth_token', '4ed9641ec6682d843761b1ed5333d1089cdcacfc99e226f5475dad0206d8239f', '[\"*\"]', NULL, '2022-03-07 11:43:35', '2022-03-07 11:43:35'),
(7, 'App\\Models\\User', 2, 'auth_token', 'd5eca741c119f7a68204773e83a190ae90985ca142b216b86f83e96b6f9088f4', '[\"*\"]', NULL, '2022-03-07 12:09:13', '2022-03-07 12:09:13'),
(8, 'App\\Models\\User', 2, 'auth_token', '049cf19ef0565f94319185165e255fc0bd8ba64c0f322dcb00e6cf698589b329', '[\"*\"]', NULL, '2022-03-07 12:09:13', '2022-03-07 12:09:13'),
(9, 'App\\Models\\User', 2, 'auth_token', 'bea1e98a473cc6c6da8993186a34014537aca1d6130593632c25cf3dd0c1854b', '[\"*\"]', NULL, '2022-03-07 12:26:31', '2022-03-07 12:26:31'),
(10, 'App\\Models\\User', 2, 'auth_token', 'b213a30083506df45524c23676ac2c83611d0403b655e3b7fef3e20f37f15b80', '[\"*\"]', NULL, '2022-03-07 12:26:31', '2022-03-07 12:26:31'),
(11, 'App\\Models\\User', 2, 'auth_token', '02f68f39b53f154cb58c4d10657e6885e97a367a5dc7ac79e9ae682d55ebe07f', '[\"*\"]', NULL, '2022-03-07 15:49:22', '2022-03-07 15:49:22'),
(12, 'App\\Models\\User', 2, 'auth_token', '824c29e7cd89b4f4d17f691561b95af2a872ba4dfeed0ea9fde080e73606b27e', '[\"*\"]', NULL, '2022-03-07 15:49:22', '2022-03-07 15:49:22'),
(13, 'App\\Models\\User', 2, 'auth_token', 'd775cf62be06ac0aaf42ae382f4939bbbfb31719496fcb4bec7ef8f2132a53a7', '[\"*\"]', NULL, '2022-03-08 16:01:47', '2022-03-08 16:01:47'),
(14, 'App\\Models\\User', 2, 'auth_token', '04f7ce5c66288992ddf82ad6750a13dd62d533155d1a536e0a7c30d4ab9333d4', '[\"*\"]', NULL, '2022-03-08 16:01:47', '2022-03-08 16:01:47'),
(15, 'App\\Models\\User', 2, 'auth_token', '939c7743925ce83d74cab81c2d07e9967f9b297b3a58ca309650277022b1f99f', '[\"*\"]', NULL, '2022-03-08 16:28:17', '2022-03-08 16:28:17'),
(16, 'App\\Models\\User', 2, 'auth_token', '63d1edae32bc771dad0fab51ccd492b00e4465866edd0551de14193be00eb6f2', '[\"*\"]', NULL, '2022-03-08 16:28:17', '2022-03-08 16:28:17'),
(17, 'App\\Models\\User', 2, 'auth_token', 'b1a11b627f26fbdf26fd29477946604462273caa8356226fd05fdab8609bfca1', '[\"*\"]', NULL, '2022-03-08 17:50:36', '2022-03-08 17:50:36'),
(18, 'App\\Models\\User', 2, 'auth_token', '368b170591cc0d598670486b2a2d0a2b66af8ddb82a56d89b422db8e185cbbde', '[\"*\"]', '2022-03-10 16:16:53', '2022-03-08 17:50:36', '2022-03-10 16:16:53'),
(19, 'App\\Models\\User', 2, 'auth_token', '524fc6c2b19ffc22d1515d929309b124444f227ac42030aea040a432248f5392', '[\"*\"]', NULL, '2022-03-10 11:54:18', '2022-03-10 11:54:18'),
(20, 'App\\Models\\User', 2, 'auth_token', 'c39c36943f433ad63b78985b525b4675ad9c6b4bf36cd168b13192e3fa333460', '[\"*\"]', '2022-03-10 11:57:05', '2022-03-10 11:54:18', '2022-03-10 11:57:05'),
(21, 'App\\Models\\User', 3, 'auth_token', '3a1c29558a4a0a983ac12966e35477911f94d63daee165fa2b41ddd511ee59bc', '[\"*\"]', NULL, '2022-03-10 11:58:13', '2022-03-10 11:58:13'),
(22, 'App\\Models\\User', 3, 'auth_token', 'd49b7662e5fc667b9809ddc7f85de93059de3366341e5593a7382d7018e921ff', '[\"*\"]', '2022-03-22 10:41:06', '2022-03-10 11:58:13', '2022-03-22 10:41:06'),
(23, 'App\\Models\\User', 2, 'auth_token', '6789a5ab24e465435db6bf9be781833d965e47fef6e85944eb5d26a344a181c2', '[\"*\"]', NULL, '2022-03-11 11:34:12', '2022-03-11 11:34:12'),
(24, 'App\\Models\\User', 2, 'auth_token', 'eed19253d47da71866a2da7e6e6cb5ae0d86664eb39dadb4e802ef2b946c91e7', '[\"*\"]', NULL, '2022-03-11 11:34:12', '2022-03-11 11:34:12'),
(25, 'App\\Models\\User', 2, 'auth_token', '5e456fd2a2b7ae6ad95617bba18d0e1078a1f79f697593e5898e583af88e5148', '[\"*\"]', NULL, '2022-03-11 11:41:56', '2022-03-11 11:41:56'),
(26, 'App\\Models\\User', 2, 'auth_token', '0621e335c0f12b4e1aeee8df34821736dc1d324948227d420b6e1d018676c33a', '[\"*\"]', '2022-04-02 11:13:51', '2022-03-11 11:41:56', '2022-04-02 11:13:51'),
(27, 'App\\Models\\User', 2, 'auth_token', 'c989752acde5d68dc40819b5c58d8fc0d1c420e6d04519396d2ca237197fb13d', '[\"*\"]', NULL, '2022-03-15 16:06:02', '2022-03-15 16:06:02'),
(28, 'App\\Models\\User', 2, 'auth_token', '078220aae042588e7c1e82e753f6dea77165fa6072172a141572d67340af8691', '[\"*\"]', '2022-03-16 15:09:34', '2022-03-15 16:06:03', '2022-03-16 15:09:34'),
(29, 'App\\Models\\User', 2, 'auth_token', 'e5d67629ca55a464c2fd6f8f8f92113d5e19b0c2cf029496bbe248b01acb7462', '[\"*\"]', NULL, '2022-03-16 15:23:50', '2022-03-16 15:23:50'),
(30, 'App\\Models\\User', 2, 'auth_token', '1ece448a16301518e667afcd5e6348ac45b12def2cad874c237c5538c3506fae', '[\"*\"]', '2022-03-17 10:36:54', '2022-03-16 15:23:50', '2022-03-17 10:36:54'),
(31, 'App\\Models\\User', 2, 'auth_token', '919c081544aba08b6469b6a47892482ea0b4bb6254a2eeda59e6717b7415ba50', '[\"*\"]', NULL, '2022-03-17 11:11:19', '2022-03-17 11:11:19'),
(32, 'App\\Models\\User', 2, 'auth_token', '777585d558e3dc314a4826f560476e6cfcd885d8db0714eee6c0a1a81bcd0bb0', '[\"*\"]', '2022-03-17 15:31:33', '2022-03-17 11:11:19', '2022-03-17 15:31:33'),
(33, 'App\\Models\\User', 2, 'auth_token', 'aa7338106dc40728195250acc07327fa48cd7f16d29c8b58762bbc05e535601a', '[\"*\"]', NULL, '2022-03-17 11:57:32', '2022-03-17 11:57:32'),
(34, 'App\\Models\\User', 2, 'auth_token', '00927e6dbed090dc9d0e94006ba55a79bb1113a0969871d05fbcd215bd7fa890', '[\"*\"]', '2022-03-17 13:46:00', '2022-03-17 11:57:32', '2022-03-17 13:46:00'),
(35, 'App\\Models\\User', 2, 'auth_token', 'd88571a3952d6e8661c494d5cd4682de629f6ca62f0767d62f04bdff7134dced', '[\"*\"]', NULL, '2022-03-17 14:04:50', '2022-03-17 14:04:50'),
(36, 'App\\Models\\User', 2, 'auth_token', '3fa5afc6ddcf1892b8fcbcaa2b15e52d7ef105eeefb6e861e4d7e73a6a9c16d9', '[\"*\"]', '2022-03-17 16:48:38', '2022-03-17 14:04:50', '2022-03-17 16:48:38'),
(37, 'App\\Models\\User', 2, 'auth_token', '83de3ff6a1e3cf612dfd07525c30f29d7b361e08b59efe5054e2835cc533b659', '[\"*\"]', NULL, '2022-03-17 16:06:49', '2022-03-17 16:06:49'),
(38, 'App\\Models\\User', 2, 'auth_token', '56f82104758657d7ccf8e1736d32b484fe0cee46f5457bb9a2923e7927c38982', '[\"*\"]', '2022-03-18 09:00:43', '2022-03-17 16:06:49', '2022-03-18 09:00:43'),
(39, 'App\\Models\\User', 2, 'auth_token', '92ef466f891c3124aa8c496c06dee6fde4ed5da657dee9c135f630e23a9ec00a', '[\"*\"]', NULL, '2022-03-17 16:07:02', '2022-03-17 16:07:02'),
(40, 'App\\Models\\User', 2, 'auth_token', '92fc5b005a442aab18bc0f4d5765e835b50d2ca3340bc007a31e783ec6fad187', '[\"*\"]', '2022-03-18 09:00:53', '2022-03-17 16:07:02', '2022-03-18 09:00:53'),
(41, 'App\\Models\\User', 2, 'auth_token', 'e9151d1a8509d4164a0f6d17184a8c2c5bcf681b87efa388aa53128e59453b61', '[\"*\"]', NULL, '2022-03-18 10:55:10', '2022-03-18 10:55:10'),
(42, 'App\\Models\\User', 2, 'auth_token', '7f0f28c272b3add56832ff046ed8ba82bb9f1d22b07113520fe4fc91bbcac358', '[\"*\"]', '2022-03-21 13:42:43', '2022-03-18 10:55:10', '2022-03-21 13:42:43'),
(43, 'App\\Models\\User', 2, 'auth_token', '67d174245345573b419a448de6405712311708ac2f862dadeecb8e8fa01a2d47', '[\"*\"]', NULL, '2022-03-18 12:01:47', '2022-03-18 12:01:47'),
(44, 'App\\Models\\User', 2, 'auth_token', '240116d3549b64a2528afd0c9fad4443999451afb680d628b889a31d3477ec0a', '[\"*\"]', '2022-03-18 12:02:10', '2022-03-18 12:01:47', '2022-03-18 12:02:10'),
(45, 'App\\Models\\User', 2, 'auth_token', '960d5390a7fbf7c134417034917a476648d7e95369274d00b4ee05ac164e8de9', '[\"*\"]', NULL, '2022-03-18 12:07:35', '2022-03-18 12:07:35'),
(46, 'App\\Models\\User', 2, 'auth_token', '2008856edb21fa45edbd4f985c3147fc61d0e9740cd7cfcb310c854f71b35bf0', '[\"*\"]', '2022-03-18 12:07:51', '2022-03-18 12:07:35', '2022-03-18 12:07:51'),
(47, 'App\\Models\\User', 2, 'auth_token', 'e96dbbf1785c0b44fbbaafc50fe87f1cc7e9cc349b6155cf200408416d413dae', '[\"*\"]', NULL, '2022-03-18 13:39:33', '2022-03-18 13:39:33'),
(48, 'App\\Models\\User', 2, 'auth_token', 'a0d2372fe6fe2585d0e0093d43b32695f2ca02a4d2860a5e2888bdcd6c43d444', '[\"*\"]', '2022-03-18 13:39:51', '2022-03-18 13:39:33', '2022-03-18 13:39:51'),
(49, 'App\\Models\\User', 2, 'auth_token', 'a9a6c4cef5e44c4a6e24ceb27a09805a2565a26f3ed774fbc19f2ee10cdec3d5', '[\"*\"]', NULL, '2022-03-18 17:12:08', '2022-03-18 17:12:08'),
(50, 'App\\Models\\User', 2, 'auth_token', '45659917cf3095aa65be03991e10965a142ecbb5be5df170e68de83309c06e1c', '[\"*\"]', '2022-03-19 09:55:34', '2022-03-18 17:12:08', '2022-03-19 09:55:34'),
(51, 'App\\Models\\User', 2, 'auth_token', '5c870f8886cb2678e351ce1e9e73424e4c4c91304a33a933d95c01d4954f775b', '[\"*\"]', NULL, '2022-03-19 10:28:19', '2022-03-19 10:28:19'),
(52, 'App\\Models\\User', 2, 'auth_token', 'f26fb822f5ef1054792d49013f886ee9ef9f8636ec3efff6483ae88df13423e0', '[\"*\"]', '2022-03-21 13:33:11', '2022-03-19 10:28:19', '2022-03-21 13:33:11'),
(53, 'App\\Models\\User', 2, 'auth_token', '55e12f71cb95af1725e351f810e3e037821a42c4f6ceacdaa55b16113832b630', '[\"*\"]', NULL, '2022-03-21 11:12:17', '2022-03-21 11:12:17'),
(54, 'App\\Models\\User', 2, 'auth_token', 'ba9763152b69e20762be9c47b9dcb4d4b02f8d951df9eed6440db3d585087d1e', '[\"*\"]', '2022-03-21 12:03:15', '2022-03-21 11:12:17', '2022-03-21 12:03:15'),
(55, 'App\\Models\\User', 2, 'auth_token', '6bca07f42b8810f5935d7ed0e35def38995a9b1413546a5cb60b2c037cc9489b', '[\"*\"]', NULL, '2022-03-21 14:13:22', '2022-03-21 14:13:22'),
(56, 'App\\Models\\User', 2, 'auth_token', 'b91cc98a73463ba88e549de11b6757487952e21d5055b01047523bb41505530a', '[\"*\"]', '2022-03-21 14:19:55', '2022-03-21 14:13:22', '2022-03-21 14:19:55'),
(57, 'App\\Models\\User', 2, 'auth_token', 'd8deb991907ccef71a06bf0cc068a0a3c195d9881b43608abffe539d6dbbed5a', '[\"*\"]', NULL, '2022-03-21 14:37:18', '2022-03-21 14:37:18'),
(58, 'App\\Models\\User', 2, 'auth_token', '1556551b5ab47076bc3664fa4e3258235c2d63997739016312125f02b0ec3769', '[\"*\"]', '2022-03-21 15:04:20', '2022-03-21 14:37:18', '2022-03-21 15:04:20'),
(59, 'App\\Models\\User', 2, 'auth_token', '0fa2d272a41ebc5d739dd7b7ca1bfb05f5caaa1af6810a1aa5d01bd3259b16c4', '[\"*\"]', NULL, '2022-03-21 14:39:50', '2022-03-21 14:39:50'),
(60, 'App\\Models\\User', 2, 'auth_token', '8a88b718ed2d20bfb3985fd95eb1d0ddbbeee2fe349f2d167ecccb0b8d9b68c6', '[\"*\"]', '2022-03-25 16:11:32', '2022-03-21 14:39:50', '2022-03-25 16:11:32'),
(61, 'App\\Models\\User', 2, 'auth_token', 'bf491673f10daf03b2e7d64630edf129ba56519acea5b2c68927460e6aa797f2', '[\"*\"]', NULL, '2022-03-21 21:21:37', '2022-03-21 21:21:37'),
(62, 'App\\Models\\User', 2, 'auth_token', 'c67ab2602c48806bb519b153e7fd5650a9d3db87d30b5caa8001e57edb9b9b08', '[\"*\"]', '2022-03-21 21:36:58', '2022-03-21 21:21:37', '2022-03-21 21:36:58'),
(63, 'App\\Models\\User', 2, 'auth_token', 'a0983e2041c9043578bd235f59c34c992f4f03089257db476a9b22ecd32045ab', '[\"*\"]', NULL, '2022-03-23 09:17:07', '2022-03-23 09:17:07'),
(64, 'App\\Models\\User', 2, 'auth_token', 'e07a9d3d73a19d327d3389d07be2c551cf2793bcc7247eee17521bd5e328da72', '[\"*\"]', '2022-03-23 15:58:35', '2022-03-23 09:17:07', '2022-03-23 15:58:35'),
(65, 'App\\Models\\User', 2, 'auth_token', 'e1d1c8d7984955e4e528236467d9f21a948f9aecc98aeb15dd67e78f90d1d201', '[\"*\"]', NULL, '2022-03-23 15:54:09', '2022-03-23 15:54:09'),
(66, 'App\\Models\\User', 2, 'auth_token', 'db5bb7047e5560dc8b6113635ae21c8b3582b8528cb119bbbb8ef7836c620a59', '[\"*\"]', NULL, '2022-03-23 15:54:09', '2022-03-23 15:54:09'),
(67, 'App\\Models\\User', 2, 'auth_token', 'c09166fadf610f9579575d4ea8b8dc24e600f44ec9525f837ee53a3ef6bf0a03', '[\"*\"]', NULL, '2022-03-23 15:58:50', '2022-03-23 15:58:50'),
(68, 'App\\Models\\User', 2, 'auth_token', 'cabf0826b9075c9421a6d3c9ce09b31942f2c22e5a237fc9aacb2f057c4ee40e', '[\"*\"]', '2022-03-24 16:27:46', '2022-03-23 15:58:50', '2022-03-24 16:27:46'),
(69, 'App\\Models\\User', 2, 'auth_token', '3bb2f67cd0c26d909a41ed0fdbb8c32837663f12ab931491eb48c4cceb4ded3a', '[\"*\"]', NULL, '2022-03-23 16:41:25', '2022-03-23 16:41:25'),
(70, 'App\\Models\\User', 2, 'auth_token', '4faa966a74b91fb1cd9b003fd9998ea207a08866d5a20bef5759e2bd7a06fdbf', '[\"*\"]', '2022-03-23 17:14:27', '2022-03-23 16:41:25', '2022-03-23 17:14:27'),
(71, 'App\\Models\\User', 2, 'auth_token', 'fa5c5a7b1f6911549ec579214ea6baebd86e5ba66a5be291067c40f4a89acbcc', '[\"*\"]', NULL, '2022-03-23 20:37:09', '2022-03-23 20:37:09'),
(72, 'App\\Models\\User', 2, 'auth_token', '66a241b0913fada6b640efd83fa2b91ab0ccdfae85c44d500a1c8b326b70cf3d', '[\"*\"]', '2022-03-23 20:39:56', '2022-03-23 20:37:09', '2022-03-23 20:39:56'),
(73, 'App\\Models\\User', 2, 'auth_token', '09abb2aeb40d0706d2df34c1fe3651cba6d0cd80bce888d79a1e680fde57f024', '[\"*\"]', NULL, '2022-03-23 20:40:38', '2022-03-23 20:40:38'),
(74, 'App\\Models\\User', 2, 'auth_token', '7f57ad53ba6c2be70ab98fc6eb206f59b57d4da245e082a8a38cc1133aaf4cd4', '[\"*\"]', '2022-03-23 21:24:50', '2022-03-23 20:40:38', '2022-03-23 21:24:50'),
(75, 'App\\Models\\User', 2, 'auth_token', 'a363a29b0d70dd59e8eeb81e1ae0810f2ee46ef040f1a99555f6fc012ccfea52', '[\"*\"]', NULL, '2022-03-23 21:25:08', '2022-03-23 21:25:08'),
(76, 'App\\Models\\User', 2, 'auth_token', '5d5c822753422d8a65ded1710a2d06cb9a312af86466772c8177761c5a7d3027', '[\"*\"]', '2022-03-23 21:28:37', '2022-03-23 21:25:09', '2022-03-23 21:28:37'),
(77, 'App\\Models\\User', 2, 'auth_token', 'e994615362ed190c5177951eb145e5cd88ce60c5aae2353c90124bb34a39e450', '[\"*\"]', NULL, '2022-03-23 21:49:46', '2022-03-23 21:49:46'),
(78, 'App\\Models\\User', 2, 'auth_token', '903f21eb09fdcb324cbd0c2e591ebafd8aba3296f4b783f72f479b528bd28f97', '[\"*\"]', '2022-03-23 21:51:47', '2022-03-23 21:49:46', '2022-03-23 21:51:47'),
(79, 'App\\Models\\User', 2, 'auth_token', 'c951061a4419ceda2fefeecccbb0c19ec6fe9284e0f1235796b72ab1eb16612d', '[\"*\"]', NULL, '2022-03-23 22:50:34', '2022-03-23 22:50:34'),
(80, 'App\\Models\\User', 2, 'auth_token', 'c672fae5661b9f3bf99c7b45ef0db1a8ba791b7a466345550159f80dbf32d74d', '[\"*\"]', '2022-03-24 14:00:20', '2022-03-23 22:50:34', '2022-03-24 14:00:20'),
(81, 'App\\Models\\User', 2, 'auth_token', 'e3f72466e600b1a8fdb8c37f4ad2b09c3b317762f6adc3e525eaa3e3fca45a02', '[\"*\"]', NULL, '2022-03-23 23:09:23', '2022-03-23 23:09:23'),
(82, 'App\\Models\\User', 2, 'auth_token', 'c4db0aa1baf232e838312cbb73444513438b0be0ace91de00a920b723f3df70d', '[\"*\"]', '2022-03-23 23:25:35', '2022-03-23 23:09:23', '2022-03-23 23:25:35'),
(83, 'App\\Models\\User', 2, 'auth_token', '5a0afdbdc8c79e57e4dcb6d1f762aa13166c485047b6e9a68e26e23e40717964', '[\"*\"]', NULL, '2022-03-24 09:15:10', '2022-03-24 09:15:10'),
(84, 'App\\Models\\User', 2, 'auth_token', 'e475dc5d1d7aa9935c7c1191671e19d6e9b6e02221b161186185f90c9f3bce07', '[\"*\"]', '2022-03-29 13:03:40', '2022-03-24 09:15:10', '2022-03-29 13:03:40'),
(85, 'App\\Models\\User', 2, 'auth_token', 'e2fe9160e7c24f295cde4b82fc50daad76fc80f35475d4175043bc93e1953e22', '[\"*\"]', NULL, '2022-03-24 14:11:52', '2022-03-24 14:11:52'),
(86, 'App\\Models\\User', 2, 'auth_token', '01f8606f3e42863e1284699d2907bfd1d267cf7cf2fb303bca5e4bacd46228ca', '[\"*\"]', '2022-03-26 15:36:14', '2022-03-24 14:11:52', '2022-03-26 15:36:14'),
(87, 'App\\Models\\User', 2, 'auth_token', '691fee39b0ca36ccd394abc27f199e5085c8acad8be202dff25461d8e1aa26a0', '[\"*\"]', NULL, '2022-03-24 16:30:51', '2022-03-24 16:30:51'),
(88, 'App\\Models\\User', 2, 'auth_token', '9c80af1b8573c538735cf013878d652733ea4d193a447abd597d708314a20aeb', '[\"*\"]', '2022-06-14 05:13:41', '2022-03-24 16:30:51', '2022-06-14 05:13:41'),
(89, 'App\\Models\\User', 2, 'auth_token', 'ecf7d2f151af9a9a33e578a202bcd08cdd806b99475ba4a0c81169e9b628216b', '[\"*\"]', NULL, '2022-03-25 16:12:25', '2022-03-25 16:12:25'),
(90, 'App\\Models\\User', 2, 'auth_token', '3acfa9b7cd9e3b7007f26bdd6dbe3f7645c46d253f104aca6493ba25c6aa7a0b', '[\"*\"]', '2022-03-28 09:15:02', '2022-03-25 16:12:25', '2022-03-28 09:15:02'),
(91, 'App\\Models\\User', 2, 'auth_token', '89e8014e32d3892a45a746e5f00f4046b94843a761c7f7aac8fae478f5458459', '[\"*\"]', NULL, '2022-03-26 15:36:25', '2022-03-26 15:36:25'),
(92, 'App\\Models\\User', 2, 'auth_token', '4c10fd1af3b00dc66c8bdccaba5a0047064feb5e4405a106e2c45244d73d4508', '[\"*\"]', '2022-04-01 22:37:02', '2022-03-26 15:36:25', '2022-04-01 22:37:02'),
(93, 'App\\Models\\User', 2, 'auth_token', '5f5f4bd687da32ae5dea4eb3157cab4f1c6995d98083c71812f50ba171ff62a1', '[\"*\"]', NULL, '2022-03-30 09:47:08', '2022-03-30 09:47:08'),
(94, 'App\\Models\\User', 2, 'auth_token', 'ecf48e5d073cc81defb4f35e6debde79543639e3095103c30dd49b343c74f760', '[\"*\"]', NULL, '2022-03-30 09:47:08', '2022-03-30 09:47:08'),
(95, 'App\\Models\\User', 3, 'auth_token', '203f5cab2c40e13ef9ab37991fdfcf631f8cbe9064a3f5a410f6c7e2e3b02f0c', '[\"*\"]', NULL, '2022-03-31 10:27:57', '2022-03-31 10:27:57'),
(96, 'App\\Models\\User', 3, 'auth_token', 'd6f1655c47cfa6c7aa1c4b7b92eb59e22fb90f5993c80df82e7385b01e8d74ed', '[\"*\"]', '2022-04-06 12:30:31', '2022-03-31 10:27:57', '2022-04-06 12:30:31'),
(97, 'App\\Models\\User', 2, 'auth_token', '052107e11233ba7abb6121fd7c98537e7384f782d5ae0be39ac5c3963e53c989', '[\"*\"]', NULL, '2022-03-31 11:12:13', '2022-03-31 11:12:13'),
(98, 'App\\Models\\User', 2, 'auth_token', '487122bd3d84216a3a3970a0dfb8a59d74854c4054932f3d9b614b47049323a3', '[\"*\"]', '2022-03-31 11:15:18', '2022-03-31 11:12:13', '2022-03-31 11:15:18'),
(99, 'App\\Models\\User', 2, 'auth_token', 'e581349aab92c514eace89c5e9800cb43a5ea2bebfd0aa451ee03d157cec1414', '[\"*\"]', NULL, '2022-03-31 11:12:18', '2022-03-31 11:12:18'),
(100, 'App\\Models\\User', 2, 'auth_token', '56da382b994d331aacef37ab43c2ce1a336d68447c8b173c60da6f5d3b6c6c64', '[\"*\"]', '2022-04-02 21:33:17', '2022-03-31 11:12:18', '2022-04-02 21:33:17'),
(101, 'App\\Models\\User', 2, 'auth_token', 'f2b5409f21c34c6960ee749d72da71e413b5955b5556fd9b889d4e53614b0d87', '[\"*\"]', NULL, '2022-04-01 09:40:47', '2022-04-01 09:40:47'),
(102, 'App\\Models\\User', 2, 'auth_token', '00fe51e42bf777786d95dabde3111eb23a15aa86cf56418521807ff0b65fbcc7', '[\"*\"]', '2022-04-01 11:10:06', '2022-04-01 09:40:47', '2022-04-01 11:10:06'),
(103, 'App\\Models\\User', 3, 'auth_token', '59a93ed87581a697ad46e09c9aefc38b3c1f4edae279d1419588aefdb43857a6', '[\"*\"]', NULL, '2022-04-01 10:40:05', '2022-04-01 10:40:05'),
(104, 'App\\Models\\User', 3, 'auth_token', 'f176891b1897a2548f4f34a4f36601511dea368928dcd40ad1c70c91dbf424a6', '[\"*\"]', '2022-04-01 10:42:18', '2022-04-01 10:40:05', '2022-04-01 10:42:18'),
(105, 'App\\Models\\User', 3, 'auth_token', '7c35d8d0420be23771aff5947d87600872c2fcda84a63d93b526afcd31588d65', '[\"*\"]', NULL, '2022-04-01 10:49:45', '2022-04-01 10:49:45'),
(106, 'App\\Models\\User', 3, 'auth_token', '444654ecc4185cf2ffbb4491838225d39ea4847b0afc4437c00e3b7809bfed1c', '[\"*\"]', '2022-04-01 10:57:28', '2022-04-01 10:49:45', '2022-04-01 10:57:28'),
(107, 'App\\Models\\User', 3, 'auth_token', 'ff4506383d81978eb91057e0843edaa58abb6366edc4c5a6f287904375d6649c', '[\"*\"]', NULL, '2022-04-01 10:52:09', '2022-04-01 10:52:09'),
(108, 'App\\Models\\User', 3, 'auth_token', '964504a830d99d78993c0f69ec19a43aed2a3e8aeac5a3968e33680c3abcbae4', '[\"*\"]', NULL, '2022-04-01 10:52:09', '2022-04-01 10:52:09'),
(109, 'App\\Models\\User', 2, 'auth_token', '30f015fad3e886b0d7249e80a47e6dfd8bcfb320e3cb946750bd2e7e135b3f4b', '[\"*\"]', NULL, '2022-04-01 11:10:34', '2022-04-01 11:10:34'),
(110, 'App\\Models\\User', 2, 'auth_token', 'c996177f617ce1575ddbd102246d9d1bc8a78b6e74cdec9714a7d15298435914', '[\"*\"]', '2022-04-01 11:48:47', '2022-04-01 11:10:34', '2022-04-01 11:48:47'),
(111, 'App\\Models\\User', 2, 'auth_token', '0910ea2b1227995955660ea00ebde93149e9eda1844e5a5c25411a187cbfc794', '[\"*\"]', NULL, '2022-04-06 06:44:32', '2022-04-06 06:44:32'),
(112, 'App\\Models\\User', 2, 'auth_token', '235bf4445e18c63c7719811be345979db9f4efe91bb154defc59a0e40efc19cb', '[\"*\"]', NULL, '2022-04-06 06:44:32', '2022-04-06 06:44:32'),
(113, 'App\\Models\\User', 2, 'auth_token', '450ae4a7257fdea125663366870eacc284a65a6dd8d76a3664e5a3e3ec290673', '[\"*\"]', NULL, '2022-04-06 07:43:26', '2022-04-06 07:43:26'),
(114, 'App\\Models\\User', 2, 'auth_token', '5fce2bbe9ad7dbde32e2f4965006ecb405b86882a173cf7fe831b047406dd78a', '[\"*\"]', NULL, '2022-04-06 07:43:26', '2022-04-06 07:43:26'),
(115, 'App\\Models\\User', 2, 'auth_token', '94b5720213a9de3a10fe942874e2c7d3af61fee80b126d801d77c1f3395c3e73', '[\"*\"]', NULL, '2022-04-06 07:44:02', '2022-04-06 07:44:02'),
(116, 'App\\Models\\User', 2, 'auth_token', '297092b313ef2650607008199ab78643dce81c7ecbfd5b80c3a6f8cfe4365915', '[\"*\"]', '2022-04-06 10:18:41', '2022-04-06 07:44:02', '2022-04-06 10:18:41'),
(117, 'App\\Models\\User', 2, 'auth_token', '10a88556fa9d2b29fe574cbb9dd95eb604a888fe458e68c1396e3024b8fd3edc', '[\"*\"]', NULL, '2022-04-06 10:30:26', '2022-04-06 10:30:26'),
(118, 'App\\Models\\User', 2, 'auth_token', '7b71f13c5f9ca33f09085b02ebd7af99ae296b64d3c7cb9f355a00386c921274', '[\"*\"]', '2022-04-08 04:52:15', '2022-04-06 10:30:26', '2022-04-08 04:52:15'),
(119, 'App\\Models\\User', 2, 'auth_token', '70e82f58eea7bded4c1a65bcef9a4a52369186f47cc946ff23624102a02a38ce', '[\"*\"]', NULL, '2022-04-07 03:56:30', '2022-04-07 03:56:30'),
(120, 'App\\Models\\User', 2, 'auth_token', 'bd0de89a8b05462e73c4fc21ec84d5bd73c09c6f964b42a704b21a82e1309839', '[\"*\"]', '2022-05-02 06:22:41', '2022-04-07 03:56:30', '2022-05-02 06:22:41'),
(121, 'App\\Models\\User', 3, 'auth_token', '01e26223a1c40e4cb19a41040507510a7df03c18b424aeb5b2ab4a9fb4200ef2', '[\"*\"]', NULL, '2022-04-07 06:53:37', '2022-04-07 06:53:37'),
(122, 'App\\Models\\User', 3, 'auth_token', 'cf1d891cf3f4dbc47476802fab4e5289cfc73946c1f21f239046958489e71b29', '[\"*\"]', '2022-05-16 09:18:17', '2022-04-07 06:53:37', '2022-05-16 09:18:17'),
(123, 'App\\Models\\User', 3, 'auth_token', 'b739baafb9b7212e50f4dbbb3c598851d405673b0ef360de8c5350a8c2a1b519', '[\"*\"]', NULL, '2022-04-08 07:31:44', '2022-04-08 07:31:44'),
(124, 'App\\Models\\User', 3, 'auth_token', '58f045443f2f592714e9a2a88340916f0bd7f76b24fd62bab4f7e19f5f712e60', '[\"*\"]', NULL, '2022-04-08 07:31:44', '2022-04-08 07:31:44'),
(125, 'App\\Models\\User', 3, 'auth_token', '6f4c54894b70b009c097bf78eb3c610cbd805bba04e79f25028b386823dae272', '[\"*\"]', NULL, '2022-04-08 07:32:07', '2022-04-08 07:32:07'),
(126, 'App\\Models\\User', 3, 'auth_token', '51c5439c411290640086a6596a6a46dfb619709236979b7ed40104ec4def172d', '[\"*\"]', NULL, '2022-04-08 07:32:07', '2022-04-08 07:32:07'),
(127, 'App\\Models\\User', 3, 'auth_token', '3ffb8b7de75c9822f65ec3d7950fc16952e9b3e606705084b5a38e859d6c5447', '[\"*\"]', NULL, '2022-04-08 07:32:58', '2022-04-08 07:32:58'),
(128, 'App\\Models\\User', 3, 'auth_token', '59dd71cc664b84e13c344fd4f713eb8b0c321f68726e11c8b4dd9ad1e8e908d9', '[\"*\"]', NULL, '2022-04-08 07:32:58', '2022-04-08 07:32:58'),
(129, 'App\\Models\\User', 3, 'auth_token', '1caacf573198bb0fd7261e1ec7815bf496dcad51d487f8737c2afcb56b5c8baf', '[\"*\"]', NULL, '2022-04-08 07:33:09', '2022-04-08 07:33:09'),
(130, 'App\\Models\\User', 3, 'auth_token', '5474f565b04d54bbb3dc0bc4de7b5556b6318a00352a065d27dd8da78941199a', '[\"*\"]', NULL, '2022-04-08 07:33:09', '2022-04-08 07:33:09'),
(131, 'App\\Models\\User', 3, 'auth_token', '1d118e12274cce7ceaf312fb1519209c92d8608c3381074a7e48d7a4782130c9', '[\"*\"]', NULL, '2022-04-08 07:34:41', '2022-04-08 07:34:41'),
(132, 'App\\Models\\User', 3, 'auth_token', '7bee48a029fb237d2f64faae9deb26bf4ef20289784b1fa76095ba296d6cdacb', '[\"*\"]', NULL, '2022-04-08 07:34:41', '2022-04-08 07:34:41'),
(133, 'App\\Models\\User', 3, 'auth_token', 'fd8f1c510e7f3d3cd760fdfc35161f09492a9d550407030ed216cbe4ecbeb529', '[\"*\"]', NULL, '2022-04-08 07:34:59', '2022-04-08 07:34:59'),
(134, 'App\\Models\\User', 3, 'auth_token', '763583faecb94408a88313f2259593f430dfe0c07bc326da6424dda7e343026d', '[\"*\"]', NULL, '2022-04-08 07:34:59', '2022-04-08 07:34:59'),
(135, 'App\\Models\\User', 3, 'auth_token', '9e6c762ce6fcf526f61b4e83cf413dc487ac93c66c0c2905913a555f8f0f6459', '[\"*\"]', NULL, '2022-04-08 07:35:32', '2022-04-08 07:35:32'),
(136, 'App\\Models\\User', 3, 'auth_token', '1ad5386b47e479a6e695cac34a678675e18c0026601699f3b89a3607d9100ca1', '[\"*\"]', NULL, '2022-04-08 07:35:32', '2022-04-08 07:35:32'),
(137, 'App\\Models\\User', 2, 'auth_token', '60ee56e23c0d4a4d48bfea1d0c0fc5ea638417e3d6e6ae2c68a32903180cd4b0', '[\"*\"]', NULL, '2022-04-12 04:00:52', '2022-04-12 04:00:52'),
(138, 'App\\Models\\User', 2, 'auth_token', 'fd868b66b764ad9f50d7f52e99b0b1d0dbe90b61802205a5f74bf384e9d9fc4b', '[\"*\"]', NULL, '2022-04-12 04:00:52', '2022-04-12 04:00:52'),
(139, 'App\\Models\\User', 2, 'auth_token', '6d2facfd770c295fcfbbe943423976338ec4ae2aa52dd0396baa439faca1fff3', '[\"*\"]', NULL, '2022-04-12 04:00:56', '2022-04-12 04:00:56'),
(140, 'App\\Models\\User', 2, 'auth_token', '6bda99c677256ade5dd0f342d83e999ddca8975c65e03f2b0a94e7c3225a8c67', '[\"*\"]', NULL, '2022-04-12 04:00:56', '2022-04-12 04:00:56'),
(141, 'App\\Models\\User', 2, 'auth_token', '9a9683a3b48f3c85ece268b9fce267c7f07b87fb3e6dc19d12ef17f0f29ce037', '[\"*\"]', NULL, '2022-04-12 04:05:37', '2022-04-12 04:05:37'),
(142, 'App\\Models\\User', 2, 'auth_token', '667f6ad5dacf204da2edf5c9b323f66b42a897c1887b627f985ee1d461de191a', '[\"*\"]', NULL, '2022-04-12 04:05:37', '2022-04-12 04:05:37'),
(143, 'App\\Models\\User', 2, 'auth_token', '1e48adf3c63d83a4019ee3c255857ab2bb097e210d9b55f4326ec57d6d0e4654', '[\"*\"]', NULL, '2022-04-12 04:06:02', '2022-04-12 04:06:02'),
(144, 'App\\Models\\User', 2, 'auth_token', '31d4d47de3c26721fbd7869e779b7de4b77a124dfa7a8984057acb84ae8d0cf7', '[\"*\"]', NULL, '2022-04-12 04:06:02', '2022-04-12 04:06:02'),
(145, 'App\\Models\\User', 2, 'auth_token', 'f048aa3edc4fa2e008dc83475dd0a86b90785abde7a587fe82de35bca5d2dbb8', '[\"*\"]', NULL, '2022-04-12 04:06:23', '2022-04-12 04:06:23'),
(146, 'App\\Models\\User', 2, 'auth_token', 'e8f67ec66b47a0c87f42649abb593f02fafd3edf6fbe4b7752103327523324fd', '[\"*\"]', NULL, '2022-04-12 04:06:23', '2022-04-12 04:06:23'),
(147, 'App\\Models\\User', 2, 'auth_token', '5fec56ff002908ad8c3ca0bf17a1f6edc22edb6ce6cbb90faae6637e3201697b', '[\"*\"]', NULL, '2022-04-12 04:07:14', '2022-04-12 04:07:14'),
(148, 'App\\Models\\User', 2, 'auth_token', '563a1307acbe010816d06662c1c1c597d5279cc2d58ef915419d359c6384dfbf', '[\"*\"]', NULL, '2022-04-12 04:07:14', '2022-04-12 04:07:14'),
(149, 'App\\Models\\User', 2, 'auth_token', 'f7956cb44412a0446610a1b17c49aba1bece6bc3978fdb0d4034437ad0b5a884', '[\"*\"]', NULL, '2022-04-12 04:12:35', '2022-04-12 04:12:35'),
(150, 'App\\Models\\User', 2, 'auth_token', '8b76472184af89d750a0cae27543c169496c1f9f8e19030e7e49e2691d6e4f6d', '[\"*\"]', NULL, '2022-04-12 04:12:35', '2022-04-12 04:12:35'),
(151, 'App\\Models\\User', 2, 'auth_token', '9b6a0b14ab0a1973419205a2c140cad67f41f740680f00897bc900657ac8f1ad', '[\"*\"]', NULL, '2022-04-12 04:13:55', '2022-04-12 04:13:55'),
(152, 'App\\Models\\User', 2, 'auth_token', 'b1fab7e363cd8eff8f0d40ed9655083cdbacea54b82c37ef70f9379b81c7b568', '[\"*\"]', NULL, '2022-04-12 04:13:55', '2022-04-12 04:13:55'),
(153, 'App\\Models\\User', 2, 'auth_token', '525a0da6161c6a282c2125f103b42dbeadf53994a8cb7b9b2d1f97b2c7f79d65', '[\"*\"]', NULL, '2022-04-12 11:06:50', '2022-04-12 11:06:50'),
(154, 'App\\Models\\User', 2, 'auth_token', 'bbac8ea2b8c495a2015d6d595402c9d9b2218a6b872c4ba9d06d1bb349768df1', '[\"*\"]', '2022-04-12 11:17:26', '2022-04-12 11:06:50', '2022-04-12 11:17:26'),
(155, 'App\\Models\\User', 2, 'auth_token', 'd7f37274bea8998dd421260464e659cbab85c0fb068a8d00a6c0e8e6a79f34bf', '[\"*\"]', NULL, '2022-04-12 19:21:17', '2022-04-12 19:21:17'),
(156, 'App\\Models\\User', 2, 'auth_token', 'dc50ff3152266cd6587848a88d3d009292f15ea8cee61bad67b873520aa20825', '[\"*\"]', '2022-04-29 10:00:14', '2022-04-12 19:21:17', '2022-04-29 10:00:14'),
(157, 'App\\Models\\User', 2, 'auth_token', 'e8ddd6e80d41768c471d62c1fd3484aad450dd561806c7d2d795ef63fa2cd34b', '[\"*\"]', NULL, '2022-04-13 06:25:44', '2022-04-13 06:25:44'),
(158, 'App\\Models\\User', 2, 'auth_token', '08e3f57f3883f9d34e0475000a4e0d5ceabcfbf6eeaea4e1db5173bdcc3e8b76', '[\"*\"]', '2022-04-13 09:04:16', '2022-04-13 06:25:44', '2022-04-13 09:04:16'),
(159, 'App\\Models\\User', 2, 'auth_token', 'ab29dc826c52c9fa9880724e4e2f9eb7a00fdd90dd165bba0133eefbe41ab25f', '[\"*\"]', NULL, '2022-04-13 10:46:59', '2022-04-13 10:46:59'),
(160, 'App\\Models\\User', 2, 'auth_token', '7f657fdad55a11ce63d1bca0359611760fb32188157bb0e5cfcdaa0f2185b289', '[\"*\"]', '2022-04-20 05:00:17', '2022-04-13 10:46:59', '2022-04-20 05:00:17'),
(161, 'App\\Models\\User', 2, 'auth_token', 'b10b3aa460a15273c45b34bb6f402717c55d20853bd32fc2f2d57acf7d97eafa', '[\"*\"]', NULL, '2022-04-15 14:32:19', '2022-04-15 14:32:19'),
(162, 'App\\Models\\User', 2, 'auth_token', '7d9555f1eea819af437f4bc65d481310889ae84aaf4e8dcf4c4aac62de0757da', '[\"*\"]', NULL, '2022-04-15 14:32:19', '2022-04-15 14:32:19'),
(163, 'App\\Models\\User', 3, 'auth_token', 'ff2ac61e135845ea5e3433d716af8d1695b5809c969353419b36dd39c504c13c', '[\"*\"]', NULL, '2022-04-15 16:30:13', '2022-04-15 16:30:13'),
(164, 'App\\Models\\User', 3, 'auth_token', '3ac5da19474177789b3ddfec9b252858eb0facd2f4e8c7b36c7895ad9d94be17', '[\"*\"]', NULL, '2022-04-15 16:30:13', '2022-04-15 16:30:13'),
(165, 'App\\Models\\User', 3, 'auth_token', '77e8f321fded284cdf2658e74e99a263d897e886e5c12a33c2ee83ec3e50a594', '[\"*\"]', NULL, '2022-04-15 16:30:42', '2022-04-15 16:30:42'),
(166, 'App\\Models\\User', 3, 'auth_token', '7f833b31b5b2a33edf4107d7f04b55d6ac1820388b9808d7d8e78de2ee80a07f', '[\"*\"]', '2022-05-13 07:01:31', '2022-04-15 16:30:42', '2022-05-13 07:01:31'),
(167, 'App\\Models\\User', 2, 'auth_token', 'e1b6180079022a98ea82a96acfdc4bf01b639457d5213a0142328843d9551806', '[\"*\"]', NULL, '2022-04-22 07:17:21', '2022-04-22 07:17:21'),
(168, 'App\\Models\\User', 2, 'auth_token', '6cbc31a582ee0d8597b81bfee1ea94523aa9eecb45c21967e49dcd0e3971dc12', '[\"*\"]', '2022-04-22 07:22:04', '2022-04-22 07:17:21', '2022-04-22 07:22:04'),
(169, 'App\\Models\\User', 2, 'auth_token', '99e48716d401412c8f014dc8c68acd2b2abca619a4120e4d423d3feea5ad700b', '[\"*\"]', NULL, '2022-04-27 10:37:00', '2022-04-27 10:37:00'),
(170, 'App\\Models\\User', 2, 'auth_token', '49bc438225a98b5c2c368ff255f7d95dd48593e863d1be5ea8c050a69d5f243a', '[\"*\"]', '2022-04-27 11:21:45', '2022-04-27 10:37:00', '2022-04-27 11:21:45'),
(171, 'App\\Models\\User', 2, 'auth_token', '523bf7a217b0facbe83f0b60a42c6ab33632d4997cd2df53d0dba7fd040f5428', '[\"*\"]', NULL, '2022-04-27 11:57:38', '2022-04-27 11:57:38'),
(172, 'App\\Models\\User', 2, 'auth_token', 'ca4541d990fa81f0a7181512df6e9ddac16bc251ee047c0fba1cf8481019f6b6', '[\"*\"]', '2022-04-28 07:29:24', '2022-04-27 11:57:38', '2022-04-28 07:29:24'),
(173, 'App\\Models\\User', 2, 'auth_token', '12f367e9aed1316ce8733e55c6575c51f770ca7bf2f19bc27d9aabb4db5b6a09', '[\"*\"]', NULL, '2022-04-28 08:47:51', '2022-04-28 08:47:51'),
(174, 'App\\Models\\User', 2, 'auth_token', 'f81367a4cc45308ba8341211e40825bb9ba4b59d66e92e5fb79486d3a4435492', '[\"*\"]', '2022-04-29 04:12:46', '2022-04-28 08:47:51', '2022-04-29 04:12:46'),
(175, 'App\\Models\\User', 3, 'auth_token', '8cc8e46cdac897a3fe1f560820269a11a74a7f902b48227bc074c34cf3fd79c9', '[\"*\"]', NULL, '2022-04-28 10:18:00', '2022-04-28 10:18:00'),
(176, 'App\\Models\\User', 3, 'auth_token', '4288fcd52778a5ae4a36194faf1c519f0acead6a27e7de2077c9906e928153d8', '[\"*\"]', '2022-05-09 12:21:48', '2022-04-28 10:18:00', '2022-05-09 12:21:48'),
(177, 'App\\Models\\User', 2, 'auth_token', '996d04f924d2126126446b29c72dbbad2f72e79c2a114fc04375907b104f3be3', '[\"*\"]', NULL, '2022-04-28 12:24:19', '2022-04-28 12:24:19'),
(178, 'App\\Models\\User', 2, 'auth_token', 'd6222ca8cb42c02495efb0c17e1dc304db97b19c952174c6e11d8bbdb44ddf92', '[\"*\"]', '2022-04-28 12:29:02', '2022-04-28 12:24:19', '2022-04-28 12:29:02'),
(179, 'App\\Models\\User', 2, 'auth_token', '5bac310b605cb275589dd456d9f1765492f145dc490cfb77eeabbe15c1a7c9f1', '[\"*\"]', NULL, '2022-04-29 04:35:17', '2022-04-29 04:35:17'),
(180, 'App\\Models\\User', 2, 'auth_token', 'ecc778e4968dd0d567482d8f15d668ba0a22e3aad56a0cda6f710d2298890136', '[\"*\"]', '2022-04-29 06:30:55', '2022-04-29 04:35:17', '2022-04-29 06:30:55'),
(181, 'App\\Models\\User', 2, 'auth_token', '8e02240a4f00589d1cbd9c90035b04f1ca849cc4d59924ecc587870101818b1f', '[\"*\"]', NULL, '2022-04-29 08:53:15', '2022-04-29 08:53:15'),
(182, 'App\\Models\\User', 2, 'auth_token', 'a4b3eb98b6e91757f234ea8261d8747874723d38c602b99fff14b4569c01ffac', '[\"*\"]', '2022-04-29 10:41:26', '2022-04-29 08:53:15', '2022-04-29 10:41:26'),
(183, 'App\\Models\\User', 2, 'auth_token', '18417224bbff406ad2e7a1c189d1f20edcf0f9e1c5c558824aa839544c43aeb3', '[\"*\"]', NULL, '2022-04-29 10:45:06', '2022-04-29 10:45:06'),
(184, 'App\\Models\\User', 2, 'auth_token', 'f0811fb467fd3dfedf2f0e3d6ebe6ee9eb44b34667924416b217f8cb81d82e0c', '[\"*\"]', '2022-05-09 03:56:01', '2022-04-29 10:45:06', '2022-05-09 03:56:01'),
(185, 'App\\Models\\User', 2, 'auth_token', 'b588d427cc38e3610487d76b7a65901833f297acb4c8629dc11b26ff5e63d723', '[\"*\"]', NULL, '2022-04-29 13:26:19', '2022-04-29 13:26:19'),
(186, 'App\\Models\\User', 2, 'auth_token', '0cc3870feb730f6f61ffa2ef1a917150352b715584a8c10f3785d2cd2a8a1087', '[\"*\"]', '2022-05-07 07:49:30', '2022-04-29 13:26:19', '2022-05-07 07:49:30'),
(187, 'App\\Models\\User', 2, 'auth_token', '06fd91767160de661d02e229dc0d5c4d1b9864a31271443c3380f055258730d2', '[\"*\"]', NULL, '2022-05-02 06:23:04', '2022-05-02 06:23:04'),
(188, 'App\\Models\\User', 2, 'auth_token', '74b3aaca371981c8cb0712fe6731e92e3f00175497460dacb2aa9eaa4282e238', '[\"*\"]', '2022-05-02 11:26:09', '2022-05-02 06:23:04', '2022-05-02 11:26:09'),
(189, 'App\\Models\\User', 2, 'auth_token', '66b9251312631143a9e9e6d6c6f73afb8b477017786a6536946fc1a1115303a1', '[\"*\"]', NULL, '2022-05-02 08:37:38', '2022-05-02 08:37:38'),
(190, 'App\\Models\\User', 2, 'auth_token', 'f4099631ad187cb285ace505d1e178713fc48d2c211988b7511f0383909389db', '[\"*\"]', NULL, '2022-05-02 08:37:38', '2022-05-02 08:37:38'),
(191, 'App\\Models\\User', 2, 'auth_token', '6aec1ad9287c03bb89e6fc36b28d47c3235ee3f84ed78cb8462878e475d67748', '[\"*\"]', NULL, '2022-05-02 11:56:03', '2022-05-02 11:56:03'),
(192, 'App\\Models\\User', 2, 'auth_token', '6cfdbf2d8084ead5ba557a4e910f31441672f7656700e6ccce6de2a8216c56cb', '[\"*\"]', '2022-05-02 11:56:29', '2022-05-02 11:56:03', '2022-05-02 11:56:29'),
(193, 'App\\Models\\User', 2, 'auth_token', '58caca6c00e965bcfe5fffb002f773f83008905ff6f5b0267e3158e447b57daa', '[\"*\"]', NULL, '2022-05-05 06:55:57', '2022-05-05 06:55:57'),
(194, 'App\\Models\\User', 2, 'auth_token', '48ea65a08badfb0cac5b6b6ec8c17f1b0858ad0d2a191cec4257c9fdfb56480f', '[\"*\"]', '2022-05-05 06:58:34', '2022-05-05 06:55:57', '2022-05-05 06:58:34'),
(195, 'App\\Models\\User', 2, 'auth_token', '079f29ab30628f6426dfcb8f2aa0cf91455737b440db8e2556c9e67b5b1f1df5', '[\"*\"]', NULL, '2022-05-05 12:10:02', '2022-05-05 12:10:02'),
(196, 'App\\Models\\User', 2, 'auth_token', 'e97960595013a01a77f0c4460f8c89b5b614ec95685359d6e73fd2d2d52587c2', '[\"*\"]', '2022-05-05 12:10:13', '2022-05-05 12:10:02', '2022-05-05 12:10:13'),
(197, 'App\\Models\\User', 2, 'auth_token', '4d42dbe4525e5f4f3e5a0b0e1f44de67e05293d2c2970857a8425736b226e951', '[\"*\"]', NULL, '2022-05-06 04:30:40', '2022-05-06 04:30:40'),
(198, 'App\\Models\\User', 2, 'auth_token', '348eebad5af38cf969b0e3cc8e2de365a6ce8539cf206771ee2bbb4731820b4f', '[\"*\"]', '2022-05-07 12:30:30', '2022-05-06 04:30:40', '2022-05-07 12:30:30'),
(199, 'App\\Models\\User', 2, 'auth_token', 'b73f1cf7267730a62bec7b863cc829d10a011053592c6902ff4d3bd032e0724b', '[\"*\"]', NULL, '2022-05-06 06:20:56', '2022-05-06 06:20:56'),
(200, 'App\\Models\\User', 2, 'auth_token', 'a73d00c24fea4b29d05cb259bd4830c08d651278191e07ce6186fc85c47243c4', '[\"*\"]', NULL, '2022-05-06 06:20:56', '2022-05-06 06:20:56'),
(201, 'App\\Models\\User', 2, 'auth_token', '369882465e76d63bb1a6a1700f8e889ea8c93607e37d9ae5e8a4902da0abe388', '[\"*\"]', NULL, '2022-05-06 06:22:22', '2022-05-06 06:22:22'),
(202, 'App\\Models\\User', 2, 'auth_token', '14e14faff7cd75ada8ffdeb0f6c300738462f5253c7ad6fcc5e8594aed50a623', '[\"*\"]', NULL, '2022-05-06 06:22:22', '2022-05-06 06:22:22'),
(203, 'App\\Models\\User', 2, 'auth_token', '3af87fa0861c6152c7a1550ff34a996ee78652b5ad027d862d61a22199236762', '[\"*\"]', NULL, '2022-05-07 04:10:21', '2022-05-07 04:10:21'),
(204, 'App\\Models\\User', 2, 'auth_token', 'f8629a9c7c8bbf61a2094ae2c3ca938b5e626aef08194922eb5e3922f7b1a348', '[\"*\"]', '2022-05-07 04:11:20', '2022-05-07 04:10:21', '2022-05-07 04:11:20'),
(205, 'App\\Models\\User', 2, 'auth_token', '6e3a41e832e9f28eb8a611a914cd53efc4bd20c7702bd6a757959c7274ab4ecd', '[\"*\"]', NULL, '2022-05-07 04:11:47', '2022-05-07 04:11:47'),
(206, 'App\\Models\\User', 2, 'auth_token', 'a37e86895f417883312d77f8087bba879a10d372bcca65d51e9cd4c149fd8372', '[\"*\"]', '2022-05-07 04:12:37', '2022-05-07 04:11:47', '2022-05-07 04:12:37'),
(207, 'App\\Models\\User', 2, 'auth_token', 'db339eb04ee4061ec907d82dbbf4310f0515419dbeb87acd852cc9db76aa9b41', '[\"*\"]', NULL, '2022-05-07 04:13:17', '2022-05-07 04:13:17'),
(208, 'App\\Models\\User', 2, 'auth_token', '147d940f7c2748d921c0cd41855ca1495ffc06aea773a81b586131dca826c1db', '[\"*\"]', '2022-05-07 04:14:11', '2022-05-07 04:13:17', '2022-05-07 04:14:11'),
(209, 'App\\Models\\User', 2, 'auth_token', '99b22cb311a010825b733b6e825a4ad76b70115473180fba18bc087f227475c8', '[\"*\"]', NULL, '2022-05-07 11:35:52', '2022-05-07 11:35:52'),
(210, 'App\\Models\\User', 2, 'auth_token', '3241cdd0a43a837a26f02cd072ac7a5b663af7518e94ec1ab28f15f3de046759', '[\"*\"]', '2022-05-07 11:36:22', '2022-05-07 11:35:52', '2022-05-07 11:36:22'),
(211, 'App\\Models\\User', 2, 'auth_token', '3d311083ef70249930c5c0ba704e8349caa692844c93957a1212381215dd1f7e', '[\"*\"]', NULL, '2022-05-07 12:53:09', '2022-05-07 12:53:09'),
(212, 'App\\Models\\User', 2, 'auth_token', '202f1f0df32b7048f047186de647807c079a9417a48608c1ee44a9d813767871', '[\"*\"]', '2022-05-07 12:54:41', '2022-05-07 12:53:09', '2022-05-07 12:54:41'),
(213, 'App\\Models\\User', 2, 'auth_token', '8ca893c69de6d9ce8e106b12f1d94ad656f159a52afe495c90956b635a36d306', '[\"*\"]', NULL, '2022-05-09 04:16:31', '2022-05-09 04:16:31'),
(214, 'App\\Models\\User', 2, 'auth_token', '7cea695a53648fb73553f3e8b0f89a0925e9f31a2d0291ced8a004f3ecef9739', '[\"*\"]', '2022-05-11 12:32:26', '2022-05-09 04:16:31', '2022-05-11 12:32:26'),
(215, 'App\\Models\\User', 2, 'auth_token', '7360ff0706d9e20d649aecdb7b36c003e2f117e9cb54499415913937904a78e1', '[\"*\"]', NULL, '2022-05-09 04:30:27', '2022-05-09 04:30:27'),
(216, 'App\\Models\\User', 2, 'auth_token', '84fe19ee0ad19470ef90bed7f8c22c9495d7444ab04aab76d1388ce7b42331c3', '[\"*\"]', '2022-05-09 04:36:19', '2022-05-09 04:30:27', '2022-05-09 04:36:19'),
(217, 'App\\Models\\User', 2, 'auth_token', '6709e7a97b1e7eaedd1af40cb571f51b74e09ae6c65a246cfb0759ac63d3102f', '[\"*\"]', NULL, '2022-05-09 05:52:50', '2022-05-09 05:52:50'),
(218, 'App\\Models\\User', 2, 'auth_token', '45294d6d09ffeddf8fe47b7b4b049f51a2676f91996a8f8a37d0e43a1743da54', '[\"*\"]', '2022-05-09 05:53:04', '2022-05-09 05:52:50', '2022-05-09 05:53:04'),
(219, 'App\\Models\\User', 2, 'auth_token', 'e2ab53bf0458a739ea18a8a7743df8dd5fd37287df10f73c50ce38153885c324', '[\"*\"]', NULL, '2022-05-09 06:08:30', '2022-05-09 06:08:30'),
(220, 'App\\Models\\User', 2, 'auth_token', 'a5c13687cba0fb41fd18b24d1851d32cbfa1261d942e08759751a62fe2824136', '[\"*\"]', '2022-05-09 06:08:34', '2022-05-09 06:08:30', '2022-05-09 06:08:34'),
(221, 'App\\Models\\User', 2, 'auth_token', '0b89d7e7636a2a8ae5c2e3b4ce4190764d1b2ff108a81ed50c0323e636c16047', '[\"*\"]', NULL, '2022-05-09 11:32:35', '2022-05-09 11:32:35'),
(222, 'App\\Models\\User', 2, 'auth_token', '20e2ae628de2acd1ccc1786b85803d37f951b778683b95bb127339e845b23cff', '[\"*\"]', '2022-05-09 11:32:44', '2022-05-09 11:32:35', '2022-05-09 11:32:44'),
(223, 'App\\Models\\User', 2, 'auth_token', '2db0f0cb035afd57f888198c948cb5c76eac42c15b84fc401c5f6afd76a4983a', '[\"*\"]', NULL, '2022-05-10 03:58:40', '2022-05-10 03:58:40'),
(224, 'App\\Models\\User', 2, 'auth_token', 'afbf9816dca28549d79213eb56853743762dfdae2ecd4f8d42607b79bc0c71d5', '[\"*\"]', '2022-05-10 05:04:09', '2022-05-10 03:58:40', '2022-05-10 05:04:09'),
(225, 'App\\Models\\User', 2, 'auth_token', '7d39ad1442b5375a29fdf9dc8a190e5f0f9a537aa0144ed85959c74e6aeb5f39', '[\"*\"]', NULL, '2022-05-11 11:02:02', '2022-05-11 11:02:02'),
(226, 'App\\Models\\User', 2, 'auth_token', '9640f30e0888e92dcac7b860e24fe251b03f5d8f536d7077590e1bf8eeb90dbf', '[\"*\"]', '2022-05-13 10:22:41', '2022-05-11 11:02:02', '2022-05-13 10:22:41'),
(227, 'App\\Models\\User', 2, 'auth_token', '5545230a3fcc45ad05a5977d180d30ca901f586ab627142306a321d05390c124', '[\"*\"]', NULL, '2022-05-12 10:18:29', '2022-05-12 10:18:29'),
(228, 'App\\Models\\User', 2, 'auth_token', '9077879f2373a6ce0d721cd65ad4d76ad5cd92e12e6ed32e4841426ad1898794', '[\"*\"]', '2022-05-12 10:18:32', '2022-05-12 10:18:29', '2022-05-12 10:18:32'),
(229, 'App\\Models\\User', 2, 'auth_token', '89375a6f0451f68237204e3d99df699b877c05e701dee82780203213a2f874a1', '[\"*\"]', NULL, '2022-05-12 10:26:12', '2022-05-12 10:26:12'),
(230, 'App\\Models\\User', 2, 'auth_token', '112e5f1fb90c8a02c5fe6c3c0365decae5c58d39a8ff16a167a974768b76199f', '[\"*\"]', '2022-05-13 05:35:19', '2022-05-12 10:26:12', '2022-05-13 05:35:19'),
(231, 'App\\Models\\User', 2, 'auth_token', '2784b745e139ddc94cc0ba8689fd3afcd54f3195d6940c718bda304038c285f2', '[\"*\"]', NULL, '2022-05-12 14:36:16', '2022-05-12 14:36:16'),
(232, 'App\\Models\\User', 2, 'auth_token', 'b9a3b1ccb4fe56913e0eba6340a1f3fbfda74fbda021b32654d38fbda53356fa', '[\"*\"]', '2022-05-12 14:38:38', '2022-05-12 14:36:16', '2022-05-12 14:38:38'),
(233, 'App\\Models\\User', 2, 'auth_token', '6b308e64c761c086022adf5127e8cc9f9b756715ea4eac777e7552551add8d7e', '[\"*\"]', NULL, '2022-05-12 14:45:44', '2022-05-12 14:45:44'),
(234, 'App\\Models\\User', 2, 'auth_token', 'c9b2e79fbe57b0fa10e4952d9f427c528fe6992e1f7aacb88a39ec2e3306e93f', '[\"*\"]', '2022-05-22 09:22:38', '2022-05-12 14:45:44', '2022-05-22 09:22:38'),
(235, 'App\\Models\\User', 2, 'auth_token', 'a5d6b6799dac8c6ec28b23cd69fe24e199053defc937873eb1cd3df97c977d02', '[\"*\"]', NULL, '2022-05-12 19:25:01', '2022-05-12 19:25:01'),
(236, 'App\\Models\\User', 2, 'auth_token', '7a9df31fb771afc7ffc7d81dc14eaaac4cc02b218bec0a6627314018dc6df877', '[\"*\"]', '2022-05-13 08:00:18', '2022-05-12 19:25:01', '2022-05-13 08:00:18'),
(237, 'App\\Models\\User', 2, 'auth_token', '19b518d58320289cd0eaaede507eee56e3880d0565f2d027ceb953a03cbbaec3', '[\"*\"]', NULL, '2022-05-13 06:10:03', '2022-05-13 06:10:03'),
(238, 'App\\Models\\User', 2, 'auth_token', '099b9ffa4e2a69678e2bbad477b8a0fdbbc547fea81c793ccacc592a197454f4', '[\"*\"]', NULL, '2022-05-13 06:10:03', '2022-05-13 06:10:03'),
(239, 'App\\Models\\User', 2, 'auth_token', '903340845ca343f0a61c511a91fa8ebcd9fcaf143f1b990c5cf02ec58cbc2ae0', '[\"*\"]', NULL, '2022-05-13 06:10:05', '2022-05-13 06:10:05'),
(240, 'App\\Models\\User', 2, 'auth_token', '2c0aadee5dbb39a8f9b576b3e22077e4104bc93ad70b2fed23fbd7596005dda0', '[\"*\"]', NULL, '2022-05-13 06:10:05', '2022-05-13 06:10:05'),
(241, 'App\\Models\\User', 2, 'auth_token', 'ef811978f05cd43477340ff031018e82a69c1d8985a20c793270370ca489f31c', '[\"*\"]', NULL, '2022-05-13 06:10:34', '2022-05-13 06:10:34'),
(242, 'App\\Models\\User', 2, 'auth_token', 'de35d83465dc067f9b41bef377dae1cd5e55d78453b318514691dedb8209d406', '[\"*\"]', '2022-05-16 10:07:50', '2022-05-13 06:10:34', '2022-05-16 10:07:50'),
(243, 'App\\Models\\User', 3, 'auth_token', '37771b22c16a62cbc2f17abc3ce5ea48f2813a635ad2dfaeeba80c9e08814a2f', '[\"*\"]', NULL, '2022-05-13 09:18:51', '2022-05-13 09:18:51'),
(244, 'App\\Models\\User', 3, 'auth_token', '1e52855663dafd753d3082b968d4e5985b398275e5ff51a67dc1eac6801075d5', '[\"*\"]', NULL, '2022-05-13 09:18:51', '2022-05-13 09:18:51'),
(245, 'App\\Models\\User', 6, 'auth_token', '24458fdad93796adc2997f27b8320fd5854e4dbf93d9d50f6ec5ada0bd01174b', '[\"*\"]', NULL, '2022-05-13 09:19:18', '2022-05-13 09:19:18'),
(246, 'App\\Models\\User', 6, 'auth_token', '0fdbdc853e05a4e73d70a82329344d7847231419e438bc059529516841ef21ec', '[\"*\"]', NULL, '2022-05-13 09:19:18', '2022-05-13 09:19:18'),
(247, 'App\\Models\\User', 3, 'auth_token', '3eabe13e6e4d169390708b4c8fd739455d76bf4563df7f5e764de2304a2a85db', '[\"*\"]', NULL, '2022-05-13 10:19:32', '2022-05-13 10:19:32'),
(248, 'App\\Models\\User', 3, 'auth_token', '806ce5eeff1c623a5e8b799041638a16ffb30d73079f0c5662d67907eb1bdb81', '[\"*\"]', NULL, '2022-05-13 10:19:32', '2022-05-13 10:19:32'),
(249, 'App\\Models\\User', 6, 'auth_token', '7b4bc0a0a1504317496e3fc79eefe37a4f6e82b83aab6ddbbf1f6821365e14d1', '[\"*\"]', NULL, '2022-05-13 10:23:09', '2022-05-13 10:23:09'),
(250, 'App\\Models\\User', 6, 'auth_token', 'f4a25edc6b5180aa41c6b85e5cca6740d68f9f5dd4ae30e0cbbde6bc672de6dd', '[\"*\"]', '2022-05-13 10:23:26', '2022-05-13 10:23:09', '2022-05-13 10:23:26'),
(251, 'App\\Models\\User', 3, 'auth_token', 'cbd782f460c501232f22517ec915a4ffa473520da2b27e2646f4df0bfc747503', '[\"*\"]', NULL, '2022-05-13 10:24:16', '2022-05-13 10:24:16'),
(252, 'App\\Models\\User', 3, 'auth_token', '30efb5d68f4a4116927396bf005b5e73d81ffd19361a7c07afdd266b5d1cefa4', '[\"*\"]', '2022-05-13 10:24:18', '2022-05-13 10:24:16', '2022-05-13 10:24:18'),
(253, 'App\\Models\\User', 6, 'auth_token', '71ba89f7d287eea0c951c39b861bf03799e7d53c36b5563998c369497cf692c9', '[\"*\"]', NULL, '2022-05-13 10:29:14', '2022-05-13 10:29:14'),
(254, 'App\\Models\\User', 6, 'auth_token', 'c71ddd262fc5de7794baa49ff12a4856ecca7ca44c3533a04955626951b619cb', '[\"*\"]', '2022-05-13 10:29:44', '2022-05-13 10:29:14', '2022-05-13 10:29:44'),
(255, 'App\\Models\\User', 3, 'auth_token', '6567cb3dde9b53df9e92361634e66e9ece59cdd771dfd17503c30f31d1025019', '[\"*\"]', NULL, '2022-05-13 10:30:25', '2022-05-13 10:30:25'),
(256, 'App\\Models\\User', 3, 'auth_token', '4d6a64944b026a00ce2c6170d1962d296d9785d9313b65bc1ea77c2523c25007', '[\"*\"]', '2022-05-13 11:21:57', '2022-05-13 10:30:25', '2022-05-13 11:21:57'),
(257, 'App\\Models\\User', 3, 'auth_token', '5c8a72668f9a1723bcdececc63626d084e43d5ed2398ecd220bc1f3bb8b678be', '[\"*\"]', NULL, '2022-05-13 10:45:26', '2022-05-13 10:45:26'),
(258, 'App\\Models\\User', 3, 'auth_token', '7e26f0abb07dc3233e1ad7da40b0576be88b38d5ab3274ec494178c66f009053', '[\"*\"]', NULL, '2022-05-13 10:45:26', '2022-05-13 10:45:26'),
(259, 'App\\Models\\User', 6, 'auth_token', '4d55024b29dc5ef6ae55645745815c3add1fb3d2d0c706c8e72e3eedbdc6b91d', '[\"*\"]', NULL, '2022-05-13 10:52:44', '2022-05-13 10:52:44'),
(260, 'App\\Models\\User', 6, 'auth_token', '595e77db5bd19dceced19a7728eca57e4e386813d06a7d7d8f7a764be4b9ae55', '[\"*\"]', NULL, '2022-05-13 10:52:44', '2022-05-13 10:52:44'),
(261, 'App\\Models\\User', 9, 'auth_token', 'f229ab550d06f26e423162615c8f2947e76aadb5fd202322d35025cb349a0a6d', '[\"*\"]', NULL, '2022-05-13 10:54:33', '2022-05-13 10:54:33'),
(262, 'App\\Models\\User', 9, 'auth_token', 'c43a580375075e304548efa2602e4d73670da980ca55f83362bc38e595ed4307', '[\"*\"]', NULL, '2022-05-13 10:54:33', '2022-05-13 10:54:33'),
(263, 'App\\Models\\User', 9, 'auth_token', 'ba61508a47fd097b08b45705ac31f37112f10f218f9de0ec131c1891192819d8', '[\"*\"]', NULL, '2022-05-13 10:58:16', '2022-05-13 10:58:16'),
(264, 'App\\Models\\User', 9, 'auth_token', '7d8c94a8985b9c3d88392eba4bff1d79656bbf639a44ac0d0aaef48e00ffc99e', '[\"*\"]', NULL, '2022-05-13 10:58:16', '2022-05-13 10:58:16'),
(265, 'App\\Models\\User', 9, 'auth_token', 'a9d8c512271be34418a7a43ccc739c1522db3b94457107241f45b44fcd0e856f', '[\"*\"]', NULL, '2022-05-13 10:58:33', '2022-05-13 10:58:33'),
(266, 'App\\Models\\User', 9, 'auth_token', 'd7225b217e9bd14c4d3c77fa3d642ffc8049c1ecf4233129530e233f8e9d7e2f', '[\"*\"]', NULL, '2022-05-13 10:58:33', '2022-05-13 10:58:33'),
(267, 'App\\Models\\User', 9, 'auth_token', 'd6b9cc8c7e729d0e43515f301b494b560c856eed90a7c2ef9077b53574821252', '[\"*\"]', NULL, '2022-05-13 11:30:28', '2022-05-13 11:30:28'),
(268, 'App\\Models\\User', 9, 'auth_token', '681cb9a8f602eb34d09936fd9dc4bb5e2e32f63e288b06d7ef225fc7ba01c475', '[\"*\"]', NULL, '2022-05-13 11:30:28', '2022-05-13 11:30:28'),
(269, 'App\\Models\\User', 5, 'auth_token', 'e1ec35f1578929090a76df826c79e50fcf37592d77a66f3a92be74b4a9e51417', '[\"*\"]', NULL, '2022-05-13 11:31:05', '2022-05-13 11:31:05'),
(270, 'App\\Models\\User', 5, 'auth_token', '2b0f888a4a71a1cb081a3188672bfe27eaccc59fd67c4d618e098525ca72a9f1', '[\"*\"]', '2022-05-16 08:49:51', '2022-05-13 11:31:05', '2022-05-16 08:49:51'),
(271, 'App\\Models\\User', 5, 'auth_token', '23b96025293d984b56ff505e227657f1dd715847999cd6f36f127abc27d1cba3', '[\"*\"]', NULL, '2022-05-13 11:32:14', '2022-05-13 11:32:14'),
(272, 'App\\Models\\User', 5, 'auth_token', 'd15dc55a9f55bdbfb98226db41eb542bd047758bc9086ef01e29cf43d2f16c19', '[\"*\"]', '2022-05-16 15:26:36', '2022-05-13 11:32:14', '2022-05-16 15:26:36'),
(273, 'App\\Models\\User', 2, 'auth_token', '2fb467d34e32e6f43e4bf8f8c0c5537109f18a4851ffa9a94b2de4c4ffdeff61', '[\"*\"]', NULL, '2022-05-13 11:47:09', '2022-05-13 11:47:09'),
(274, 'App\\Models\\User', 2, 'auth_token', 'f778feb273bec5c6d3e6bb760516f4eecba381180e8383e2e9af4159a3d4e192', '[\"*\"]', '2022-05-23 06:04:19', '2022-05-13 11:47:09', '2022-05-23 06:04:19'),
(275, 'App\\Models\\User', 2, 'auth_token', '356e2aea6317de1fe8e4ae049fd3b14a03c861847069b723dbcaba355f80cae2', '[\"*\"]', NULL, '2022-05-16 10:07:49', '2022-05-16 10:07:49'),
(276, 'App\\Models\\User', 2, 'auth_token', '9d3742d32ae537e6bf8dc943b7419602774c862a9732c9d7ae335a20c86b54c3', '[\"*\"]', NULL, '2022-05-16 10:07:49', '2022-05-16 10:07:49'),
(277, 'App\\Models\\User', 9, 'auth_token', '198c089445cc84be3dd36655da16598faaca3e5d19860128b5dd428eea837217', '[\"*\"]', NULL, '2022-05-16 10:45:51', '2022-05-16 10:45:51');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(278, 'App\\Models\\User', 9, 'auth_token', '15487d3711c41b8791813609308b3dc09ea3d1d8a44d55c95db2c06375ff3418', '[\"*\"]', '2022-05-16 10:45:55', '2022-05-16 10:45:51', '2022-05-16 10:45:55'),
(279, 'App\\Models\\User', 9, 'auth_token', 'fb55dc9e64573aa3f83600e9b92af3438e5a2a3275523ef77544e95c1ba2ab4c', '[\"*\"]', NULL, '2022-05-16 10:46:29', '2022-05-16 10:46:29'),
(280, 'App\\Models\\User', 9, 'auth_token', 'de5d7d7850bd0f7da53157ecccff8b7572b2e6a1a4d553dbbd7ceff72f34f7e9', '[\"*\"]', '2022-05-16 10:46:57', '2022-05-16 10:46:29', '2022-05-16 10:46:57'),
(281, 'App\\Models\\User', 9, 'auth_token', 'f9b507dc7c1659fc47b89aba7dcd1587a5efa73ef76ebeb4a49b67444e9b54fd', '[\"*\"]', NULL, '2022-05-16 10:49:41', '2022-05-16 10:49:41'),
(282, 'App\\Models\\User', 9, 'auth_token', '47a62bf59bdd69a19c9fb51b85b6be63b94f7ede4b9a805e5be8b33da8cee2d1', '[\"*\"]', '2022-05-24 12:41:41', '2022-05-16 10:49:41', '2022-05-24 12:41:41'),
(283, 'App\\Models\\User', 9, 'auth_token', '2e2992380fa34c8d643e4e6ae5af199d2e7b9e033283f8b8fdb20e2088fad6f0', '[\"*\"]', NULL, '2022-05-16 11:04:18', '2022-05-16 11:04:18'),
(284, 'App\\Models\\User', 9, 'auth_token', '2ea772c80e84e09bdedfd1d239c9bd3d4cd9fdb16f61a86cfd1008350b599dfe', '[\"*\"]', '2022-05-16 12:28:04', '2022-05-16 11:04:18', '2022-05-16 12:28:04'),
(285, 'App\\Models\\User', 2, 'auth_token', 'bb6230d2061d859454a8bca05e0443dde2dc0b43d81da404f54a6744bd77d7e0', '[\"*\"]', NULL, '2022-05-17 07:36:16', '2022-05-17 07:36:16'),
(286, 'App\\Models\\User', 2, 'auth_token', 'cfe4d07b8eb04f02b4654591538fcaf4081d053d5050282770b2df2a330aee36', '[\"*\"]', NULL, '2022-05-17 07:36:16', '2022-05-17 07:36:16'),
(287, 'App\\Models\\User', 2, 'auth_token', '03aebc2ac50ac7498cdd6aed8cf575cb16bda885993447f85b19812ee8ba2d51', '[\"*\"]', NULL, '2022-05-17 07:36:37', '2022-05-17 07:36:37'),
(288, 'App\\Models\\User', 2, 'auth_token', '219833e9eca2b9319443383f33d44e686fca5d42f1258faf57a1177cc5cddb56', '[\"*\"]', NULL, '2022-05-17 07:36:37', '2022-05-17 07:36:37'),
(289, 'App\\Models\\User', 2, 'auth_token', 'c03f4321f866c9b7b71b7e742769c0f810637c3dd73acd8e7dc692d0a6384a76', '[\"*\"]', NULL, '2022-05-20 15:05:26', '2022-05-20 15:05:26'),
(290, 'App\\Models\\User', 2, 'auth_token', '54090751d0c727138c855108b6caad47c7fc97c7045c6c7c1e1a0f3dca2768b8', '[\"*\"]', '2022-05-28 12:39:15', '2022-05-20 15:05:26', '2022-05-28 12:39:15'),
(291, 'App\\Models\\User', 2, 'auth_token', 'b43d7fc94e97d3bdbc149da57c515fadc1464f3246dc038600235dc74b53e4a2', '[\"*\"]', NULL, '2022-05-21 08:42:53', '2022-05-21 08:42:53'),
(292, 'App\\Models\\User', 2, 'auth_token', '219c51745e7237248bb9329f2ff7d3008b13ebf1b525c16d7b1cb8bd475b8085', '[\"*\"]', NULL, '2022-05-21 08:42:53', '2022-05-21 08:42:53'),
(293, 'App\\Models\\User', 2, 'auth_token', 'dd7c47e15d01ccf9cc46b70269512dc6cafdafebe7d3667bc523ae0ffc371085', '[\"*\"]', NULL, '2022-05-21 08:43:15', '2022-05-21 08:43:15'),
(294, 'App\\Models\\User', 2, 'auth_token', '229cb91fd11da9e387aebdb35bdd7ec3bec285edbb0edd6e062b0bff25c19a91', '[\"*\"]', NULL, '2022-05-21 08:43:16', '2022-05-21 08:43:16'),
(295, 'App\\Models\\User', 2, 'auth_token', 'e1989d3c90f3abe1d094aea7dff9e646d2f579733da84aa5a8695d03c695e3e2', '[\"*\"]', NULL, '2022-05-22 09:25:46', '2022-05-22 09:25:46'),
(296, 'App\\Models\\User', 2, 'auth_token', '3314be167018dd5ffa26ae05923bdfc40cbf545b2550faa3b73e54edd3cbabde', '[\"*\"]', '2022-05-22 09:57:30', '2022-05-22 09:25:46', '2022-05-22 09:57:30'),
(297, 'App\\Models\\User', 2, 'auth_token', 'afdaa948c39a01c1167140adeb31f29cc093e632493a0da185a4799f4cbbc5a3', '[\"*\"]', NULL, '2022-05-22 09:57:41', '2022-05-22 09:57:41'),
(298, 'App\\Models\\User', 2, 'auth_token', 'fe1a28edd2711a0f45fb2716e6160f89733c01c176eaf33c18461937db776dd1', '[\"*\"]', '2022-05-22 09:57:42', '2022-05-22 09:57:41', '2022-05-22 09:57:42'),
(299, 'App\\Models\\User', 2, 'auth_token', '4e9bf22d4650ed5db6229a67fcc9b2fe6d4f8085a1d671b2f503c420aff64be0', '[\"*\"]', NULL, '2022-05-22 09:58:23', '2022-05-22 09:58:23'),
(300, 'App\\Models\\User', 2, 'auth_token', '4f62506ae5fede635da5e4c62904b808528f21fd6ab2dade53903310e0f7c842', '[\"*\"]', '2022-05-23 11:32:41', '2022-05-22 09:58:23', '2022-05-23 11:32:41'),
(301, 'App\\Models\\User', 2, 'auth_token', '1709132a43adcc8c52fc6baf57dafef2b6a94bcce5e530666520f7335fec156f', '[\"*\"]', NULL, '2022-05-23 06:05:44', '2022-05-23 06:05:44'),
(302, 'App\\Models\\User', 2, 'auth_token', '79e4e51800dde79eafbc6e254f8fc4faa3ff91392588b3ec907968ede82ac687', '[\"*\"]', '2022-05-23 09:06:44', '2022-05-23 06:05:44', '2022-05-23 09:06:44'),
(303, 'App\\Models\\User', 2, 'auth_token', 'e04c42373ebafc38cdf6b66860ce98e5f8f04bd9207b238de3ca7f1e8d948247', '[\"*\"]', NULL, '2022-05-23 07:35:18', '2022-05-23 07:35:18'),
(304, 'App\\Models\\User', 2, 'auth_token', '09cc247b60ffd552c06060e067a33b6ed1e0c06ccc1a9c1340a9badb0abf3d67', '[\"*\"]', '2022-05-24 04:15:51', '2022-05-23 07:35:18', '2022-05-24 04:15:51'),
(305, 'App\\Models\\User', 18, 'auth_token', '4e4ab50f85ba54ac31e17b7c0445d9d3327c764ff22eb909fac95cb8c1b83b73', '[\"*\"]', NULL, '2022-05-23 07:42:12', '2022-05-23 07:42:12'),
(306, 'App\\Models\\User', 18, 'auth_token', 'f90c4760b1f76f52a889aa8de187bf2772c109d5467ab1780f386aefdd155712', '[\"*\"]', NULL, '2022-05-23 07:42:12', '2022-05-23 07:42:12'),
(307, 'App\\Models\\User', 18, 'auth_token', '3d8b9afde6ab2864ba9b3ebfe2da51835578edc8ee589f531d630dd5f88c2811', '[\"*\"]', NULL, '2022-05-23 07:42:31', '2022-05-23 07:42:31'),
(308, 'App\\Models\\User', 18, 'auth_token', '51ad0a9e2d3df6181390222699a263aa2547d3906a9c57ca7998029dfe687d33', '[\"*\"]', NULL, '2022-05-23 07:42:31', '2022-05-23 07:42:31'),
(309, 'App\\Models\\User', 18, 'auth_token', '2c9fe2dd339aa921a3bc1433de4c603fd925550f5b001076f8ea88019658a006', '[\"*\"]', NULL, '2022-05-23 07:42:58', '2022-05-23 07:42:58'),
(310, 'App\\Models\\User', 18, 'auth_token', 'bfe927076aad29cf6fcf49334bf442a1b6ca6d23191f4bc9046fd569a74b12eb', '[\"*\"]', NULL, '2022-05-23 07:42:58', '2022-05-23 07:42:58'),
(311, 'App\\Models\\User', 20, 'auth_token', '9c0548734cc13a192e9d8338c31fd94e86a02c91ab1b7f7196f7924a43990c11', '[\"*\"]', NULL, '2022-05-23 07:51:27', '2022-05-23 07:51:27'),
(312, 'App\\Models\\User', 20, 'auth_token', 'a5176dab2107802ebfa4d584b9e6bdcf4110ed31eab6bbb18da3255e356e8f9c', '[\"*\"]', NULL, '2022-05-23 07:51:27', '2022-05-23 07:51:27'),
(313, 'App\\Models\\User', 21, 'auth_token', '78c58b50cc47dda25426829a783b0ceb6fc51d63e4a4f8d889381828df8b3efd', '[\"*\"]', NULL, '2022-05-23 07:53:10', '2022-05-23 07:53:10'),
(314, 'App\\Models\\User', 21, 'auth_token', 'a240f40ff7fdf3ec9deba7ef8907b576e269d2ea71a8b2ccd3e3a4cc7c1016ef', '[\"*\"]', NULL, '2022-05-23 07:53:10', '2022-05-23 07:53:10'),
(315, 'App\\Models\\User', 22, 'auth_token', '16eea3f231947d905a856383764ac1a62d62eda3fc7b8b4750feec24e0d44d80', '[\"*\"]', NULL, '2022-05-23 09:00:04', '2022-05-23 09:00:04'),
(316, 'App\\Models\\User', 22, 'auth_token', 'c4016a5bf438f2ddde08343fca2916145e4f992d41332f7a90684641beb99202', '[\"*\"]', '2022-05-23 09:04:28', '2022-05-23 09:00:04', '2022-05-23 09:04:28'),
(317, 'App\\Models\\User', 17, 'auth_token', 'cbdef1c1ad7116360c88589d21ab044fd9c2e21438b098f648e4f5dcf45df86f', '[\"*\"]', NULL, '2022-05-23 09:06:39', '2022-05-23 09:06:39'),
(318, 'App\\Models\\User', 17, 'auth_token', '2bfb7abb7c965fdf8bf0c6fb30f3198f8f21e806f40c9b767ab74603842ce340', '[\"*\"]', '2022-05-23 09:09:49', '2022-05-23 09:06:39', '2022-05-23 09:09:49'),
(319, 'App\\Models\\User', 22, 'auth_token', 'c5d706af73b074527831ea3b12931dfce04636a31c6664b7436cf3cded8668ec', '[\"*\"]', NULL, '2022-05-23 09:06:57', '2022-05-23 09:06:57'),
(320, 'App\\Models\\User', 22, 'auth_token', 'dc35136b5c370b9e802c41be293eb3e47c9b26f1508cfd8c37e3ab153abd17f5', '[\"*\"]', '2022-05-23 12:24:00', '2022-05-23 09:06:57', '2022-05-23 12:24:00'),
(321, 'App\\Models\\User', 2, 'auth_token', 'c6aab39f4ca3b08862d584920f637ed7d3f6e1f3ba4981c6f6ee7f8c136bf82f', '[\"*\"]', NULL, '2022-05-23 09:10:10', '2022-05-23 09:10:10'),
(322, 'App\\Models\\User', 2, 'auth_token', '5e54f460fa5a61ec79fafd7054c29daf8a32d022209d9696740a779173b24e12', '[\"*\"]', '2022-05-23 09:23:42', '2022-05-23 09:10:10', '2022-05-23 09:23:42'),
(323, 'App\\Models\\User', 2, 'auth_token', '1ec3c9c6d97ac33e463a959da20e03037362462c7a774c456ddd7c228e281ce9', '[\"*\"]', NULL, '2022-05-23 09:18:40', '2022-05-23 09:18:40'),
(324, 'App\\Models\\User', 2, 'auth_token', '5f674ac234b8c0b058ad3f69c2e27926e7002b0db6f19bdf514069ef010e349a', '[\"*\"]', '2022-05-23 11:11:52', '2022-05-23 09:18:40', '2022-05-23 11:11:52'),
(325, 'App\\Models\\User', 17, 'auth_token', '1f467d92c8beea5c9839fa3ecb01308e5f8d39379a1ba95f5397e82580befafd', '[\"*\"]', NULL, '2022-05-23 09:24:06', '2022-05-23 09:24:06'),
(326, 'App\\Models\\User', 17, 'auth_token', '22c5a135e4d102c5011006843a6eb0779893ef6a26dcf7bed920cd84e49386c9', '[\"*\"]', '2022-05-23 16:55:46', '2022-05-23 09:24:06', '2022-05-23 16:55:46'),
(327, 'App\\Models\\User', 2, 'auth_token', '80c155e07ad33075c19d53c767c19524f441de1d67419542b829271cfe05508e', '[\"*\"]', NULL, '2022-05-23 11:13:18', '2022-05-23 11:13:18'),
(328, 'App\\Models\\User', 2, 'auth_token', 'd3e66b4a83ce9617d50b3803b75976a69f286c845ea0afc505a71244016fae4a', '[\"*\"]', NULL, '2022-05-23 11:13:18', '2022-05-23 11:13:18'),
(329, 'App\\Models\\User', 21, 'auth_token', '72ce06a573a4a21377a5bca49b78dd948dc515a95ec8f54253ab157433433d25', '[\"*\"]', NULL, '2022-05-23 11:13:31', '2022-05-23 11:13:31'),
(330, 'App\\Models\\User', 21, 'auth_token', '65c47111446d3cafaa5d097a64ddec9410b10da4b532f26f06e7236d10475ff2', '[\"*\"]', '2022-05-23 11:14:17', '2022-05-23 11:13:31', '2022-05-23 11:14:17'),
(331, 'App\\Models\\User', 2, 'auth_token', '681b177a74641efbaf9e8f5c8f0882faf72ab67ab59c65e0671bfa3e134369b4', '[\"*\"]', NULL, '2022-05-23 11:33:01', '2022-05-23 11:33:01'),
(332, 'App\\Models\\User', 2, 'auth_token', 'd5b3f16faf4d565c9587c562fd3b75df53ea0ef6e3eecac5f286d02217a120ec', '[\"*\"]', '2022-06-14 18:22:53', '2022-05-23 11:33:01', '2022-06-14 18:22:53'),
(333, 'App\\Models\\User', 2, 'auth_token', '71463eb93a670cecabe11a37d44b057912522eb5d4f1e83ad0d4b017329ded51', '[\"*\"]', NULL, '2022-05-23 12:24:51', '2022-05-23 12:24:51'),
(334, 'App\\Models\\User', 2, 'auth_token', '898377ff199a3fd29c187fe1e2e9842931bfdb241c90bb72c584e75d134f02bd', '[\"*\"]', '2022-05-25 08:32:51', '2022-05-23 12:24:51', '2022-05-25 08:32:51'),
(335, 'App\\Models\\User', 26, 'auth_token', '1e30d46587a81f33b81e9bd2784edb9319bc2a9732b23d2db6ab6e2a3a1dd66d', '[\"*\"]', NULL, '2022-05-23 15:09:39', '2022-05-23 15:09:39'),
(336, 'App\\Models\\User', 26, 'auth_token', '9a15962d914bf39c70eeb6c7095f964a35d81313f7fcc3a9df7481dd1f553a11', '[\"*\"]', NULL, '2022-05-23 15:09:39', '2022-05-23 15:09:39'),
(337, 'App\\Models\\User', 26, 'auth_token', '3ac353d6bd959f684a3d422be1ef16fb3bfdcdfa643405e488b835e84c737d6c', '[\"*\"]', NULL, '2022-05-23 15:10:11', '2022-05-23 15:10:11'),
(338, 'App\\Models\\User', 26, 'auth_token', '5f6d9453c40cfdbc5b8560f11013448f6bed08f200987f4379f3a9134c159d51', '[\"*\"]', NULL, '2022-05-23 15:10:11', '2022-05-23 15:10:11'),
(339, 'App\\Models\\User', 26, 'auth_token', '168d5e51ad89ca92efc2d9893491116146f9ae8712837d61685bce9181074087', '[\"*\"]', NULL, '2022-05-23 15:10:45', '2022-05-23 15:10:45'),
(340, 'App\\Models\\User', 26, 'auth_token', 'fbc08691685be8272d1c44a5f4596acc1e0bc607af3b33cd999bfec8dc8a6a3b', '[\"*\"]', NULL, '2022-05-23 15:10:45', '2022-05-23 15:10:45'),
(341, 'App\\Models\\User', 26, 'auth_token', '45ab5f460df5741c967f3b868cb5be41a25e350e664828b21a56dab5c0b887ca', '[\"*\"]', NULL, '2022-05-23 15:10:57', '2022-05-23 15:10:57'),
(342, 'App\\Models\\User', 26, 'auth_token', '31a54b1cbeb4f567a10a2ce631644b2c084c1f8e31cda7d620025baa77d17ee4', '[\"*\"]', NULL, '2022-05-23 15:10:57', '2022-05-23 15:10:57'),
(343, 'App\\Models\\User', 26, 'auth_token', '25c7333ac11bd93b2d86fc4e28dfe6c460614cdc37e0d2772a44d4e02da16d8e', '[\"*\"]', NULL, '2022-05-23 15:10:59', '2022-05-23 15:10:59'),
(344, 'App\\Models\\User', 26, 'auth_token', '7b13ecdba25945eec10ea7f7e4f338e33938b6bfd20adfab50668fbddee9c4e4', '[\"*\"]', NULL, '2022-05-23 15:10:59', '2022-05-23 15:10:59'),
(345, 'App\\Models\\User', 26, 'auth_token', '00a13119c4f83823c337bd0bfb0a4758d1b9386378aaac2078e06b3e52055761', '[\"*\"]', NULL, '2022-05-23 15:14:10', '2022-05-23 15:14:10'),
(346, 'App\\Models\\User', 26, 'auth_token', 'e314a16ada46c2fe18f9e68dc15d3d72155425c1a872f9af176ac7d36368a5fb', '[\"*\"]', NULL, '2022-05-23 15:14:10', '2022-05-23 15:14:10'),
(347, 'App\\Models\\User', 26, 'auth_token', 'ee7447f9fe6dc074febddde5518db9632929506c8ab0396fb0f3c606f6b5f9f5', '[\"*\"]', NULL, '2022-05-23 15:14:20', '2022-05-23 15:14:20'),
(348, 'App\\Models\\User', 26, 'auth_token', 'a27d29ffc62707ccf9319db00a4845ed56d8aee4f9c7cb5952d7fc3c43c33f41', '[\"*\"]', NULL, '2022-05-23 15:14:20', '2022-05-23 15:14:20'),
(349, 'App\\Models\\User', 26, 'auth_token', '8ac23ca9a4863c88377406c8fc055258e9170e57a65f4b5af5e6b9582fb281b1', '[\"*\"]', NULL, '2022-05-23 15:16:04', '2022-05-23 15:16:04'),
(350, 'App\\Models\\User', 26, 'auth_token', '583f794d03ebf40424c99bb17826a297add0590ff230b6e451bd9733ffb22b38', '[\"*\"]', NULL, '2022-05-23 15:16:04', '2022-05-23 15:16:04'),
(351, 'App\\Models\\User', 26, 'auth_token', '5e234eb2b5c1a4c46e6869b2a48ff5a72e359172373da9a53c7330f4d03732da', '[\"*\"]', NULL, '2022-05-23 15:17:08', '2022-05-23 15:17:08'),
(352, 'App\\Models\\User', 26, 'auth_token', 'd4d438fc58b090523eddde677e22e2dff10f184e9011dc003d358e68b3589ec7', '[\"*\"]', NULL, '2022-05-23 15:17:08', '2022-05-23 15:17:08'),
(353, 'App\\Models\\User', 26, 'auth_token', '4849c46e225566371aac66f4571ffc52366cc38639d5b551d18129b095cc2e20', '[\"*\"]', NULL, '2022-05-23 15:17:22', '2022-05-23 15:17:22'),
(354, 'App\\Models\\User', 26, 'auth_token', 'b8373012a0e2e561ddaa9d37380a4cd4c3c7d7a1749741c37e3bc192147ddcca', '[\"*\"]', NULL, '2022-05-23 15:17:22', '2022-05-23 15:17:22'),
(355, 'App\\Models\\User', 26, 'auth_token', 'fea0c7bd90c6d7b9cdc009ed855b6407953c61e18f6853619e4c3e3617f3703b', '[\"*\"]', NULL, '2022-05-23 15:17:25', '2022-05-23 15:17:25'),
(356, 'App\\Models\\User', 26, 'auth_token', '9f9b8518f9f66d160e38d88c2c75ea5ef3f73021cfb96953b62799e2c6b2c525', '[\"*\"]', NULL, '2022-05-23 15:17:25', '2022-05-23 15:17:25'),
(357, 'App\\Models\\User', 26, 'auth_token', '912952ab91420431d3f390073c2b113d615b30ffc274f12975cdd6f56416b0db', '[\"*\"]', NULL, '2022-05-23 15:26:49', '2022-05-23 15:26:49'),
(358, 'App\\Models\\User', 26, 'auth_token', '10072690dd3c02e9983c276bfde0dfed70b9f8eb082f3949355d879332471df0', '[\"*\"]', NULL, '2022-05-23 15:26:49', '2022-05-23 15:26:49'),
(359, 'App\\Models\\User', 26, 'auth_token', '777405e4139c1003491ab7031cb5f75e8b8dfe09c9acc0d4d4e7bcb4b3cbb51b', '[\"*\"]', NULL, '2022-05-23 15:27:25', '2022-05-23 15:27:25'),
(360, 'App\\Models\\User', 26, 'auth_token', '35eb0cf3a1f215bc36f5f802e259388c2d124ccb14c88f9e4468ed5ed92b4951', '[\"*\"]', NULL, '2022-05-23 15:27:25', '2022-05-23 15:27:25'),
(361, 'App\\Models\\User', 26, 'auth_token', '265ef12ac1966fcfe3e573d0fe0f0731d05445ec4b49bd42ced7c319063c5dee', '[\"*\"]', NULL, '2022-05-23 15:28:09', '2022-05-23 15:28:09'),
(362, 'App\\Models\\User', 26, 'auth_token', 'ee112a600ba9a8b78a80723404947f9c8669ac54dfb8d65613fc7cf8a8e69a26', '[\"*\"]', NULL, '2022-05-23 15:28:09', '2022-05-23 15:28:09'),
(363, 'App\\Models\\User', 26, 'auth_token', '27345d70682738db09d47ef654d1bc3a65c1676dc19ae6874404e374a7940ee8', '[\"*\"]', NULL, '2022-05-23 15:28:36', '2022-05-23 15:28:36'),
(364, 'App\\Models\\User', 26, 'auth_token', '6f1e61fcc419da99861d9b7865f4e448b7a7b739521e5d587c51b2fc541f73e3', '[\"*\"]', NULL, '2022-05-23 15:28:36', '2022-05-23 15:28:36'),
(365, 'App\\Models\\User', 26, 'auth_token', '0d5c704826106c99cb78165758e0b4e23bb128888a8ec4e7096f6ff2e9aa942a', '[\"*\"]', NULL, '2022-05-23 15:28:57', '2022-05-23 15:28:57'),
(366, 'App\\Models\\User', 26, 'auth_token', '3681a54e2d12fd3d83fb5650f1039e3ded7aa320d3ea4f66080b61eed88011af', '[\"*\"]', NULL, '2022-05-23 15:28:57', '2022-05-23 15:28:57'),
(367, 'App\\Models\\User', 26, 'auth_token', 'ea355969d3b98cce4ee71a6154dfaf59362ae005748dfaab6e13c8594903e5bf', '[\"*\"]', NULL, '2022-05-23 15:31:28', '2022-05-23 15:31:28'),
(368, 'App\\Models\\User', 26, 'auth_token', 'fdc936c433b910f45aadea8f6e3c7c1e9d28bd698b917a7073ee1175bbc899df', '[\"*\"]', NULL, '2022-05-23 15:31:28', '2022-05-23 15:31:28'),
(369, 'App\\Models\\User', 2, 'auth_token', '1c8b9f08cc8cf809eac7b960d104c2f382dcb89b8ddab812191164c63f8abd70', '[\"*\"]', NULL, '2022-05-24 04:45:17', '2022-05-24 04:45:17'),
(370, 'App\\Models\\User', 2, 'auth_token', '4df1fea46635e2583aa6d8b8aca7737b77370c09f4e425f33ba4835be255a391', '[\"*\"]', '2022-06-01 06:10:55', '2022-05-24 04:45:17', '2022-06-01 06:10:55'),
(371, 'App\\Models\\User', 28, 'auth_token', '490da594544cc8b3efb4fcd64ed816ace5244ca8fc1bb3f937ac3b8af33f9c31', '[\"*\"]', NULL, '2022-05-24 09:32:45', '2022-05-24 09:32:45'),
(372, 'App\\Models\\User', 28, 'auth_token', '3654e7d6d5bb8c688e12ebf05c4518fb7a551a74daf8b78c38a9ecb41f9a5d6e', '[\"*\"]', '2022-05-24 10:07:47', '2022-05-24 09:32:45', '2022-05-24 10:07:47'),
(373, 'App\\Models\\User', 29, 'auth_token', 'e17b92f45078fb19bfae373d0783620907a6f8d729576ce2d0aff56800be689d', '[\"*\"]', NULL, '2022-05-24 10:04:47', '2022-05-24 10:04:47'),
(374, 'App\\Models\\User', 29, 'auth_token', 'a933d9feb4438f9e61438077909291df21096165740cf8e6ccbd463d2e810351', '[\"*\"]', '2022-06-16 19:47:20', '2022-05-24 10:04:47', '2022-06-16 19:47:20'),
(375, 'App\\Models\\User', 26, 'auth_token', 'ded37645a459fe943fada6c026b5d1a8e2b04ad99318fe1827d4bcb30fb895c1', '[\"*\"]', NULL, '2022-05-24 10:32:36', '2022-05-24 10:32:36'),
(376, 'App\\Models\\User', 26, 'auth_token', '15d20ccf36a6583863c2a2943e1da0901846af365c3103cee530f559498785e8', '[\"*\"]', '2022-05-25 06:14:52', '2022-05-24 10:32:36', '2022-05-25 06:14:52'),
(377, 'App\\Models\\User', 16, 'auth_token', '8ed2498f15af71f51f293df9171ee80a57ded09af8a5227eacac200b8703c8e6', '[\"*\"]', NULL, '2022-05-24 11:50:28', '2022-05-24 11:50:28'),
(378, 'App\\Models\\User', 16, 'auth_token', '4bb0e708ceac4ace42e92ec934e14c550b6c2f53a1cb7d17eb99f784d5e94b48', '[\"*\"]', '2022-05-24 13:27:39', '2022-05-24 11:50:28', '2022-05-24 13:27:39'),
(379, 'App\\Models\\User', 16, 'auth_token', '0ae28a561db47c332fa3277b39ec1b348465f36fef1cbffef75cb46928470543', '[\"*\"]', NULL, '2022-05-24 13:30:25', '2022-05-24 13:30:25'),
(380, 'App\\Models\\User', 16, 'auth_token', '272342278cfad98fcd2de43eaf6ed3ff8122a69f0cec35ba53cf5d3ee4bc6723', '[\"*\"]', '2022-05-28 12:54:46', '2022-05-24 13:30:25', '2022-05-28 12:54:46'),
(381, 'App\\Models\\User', 30, 'auth_token', '8dfb12e5b3ffb082e1654479a7dd49dc660d0398ca9d5c8bdefaa6cf95099dd8', '[\"*\"]', NULL, '2022-05-24 18:54:44', '2022-05-24 18:54:44'),
(382, 'App\\Models\\User', 30, 'auth_token', '111202480b751c1f8095f5e734439de3cb74b825c12900f922873ef1aef23520', '[\"*\"]', '2022-05-24 19:34:08', '2022-05-24 18:54:44', '2022-05-24 19:34:08'),
(383, 'App\\Models\\User', 21, 'auth_token', '727cae003e77836968f51ac9045140263309598f19ebb1ca2ce04336adadcdf5', '[\"*\"]', NULL, '2022-05-25 05:13:54', '2022-05-25 05:13:54'),
(384, 'App\\Models\\User', 21, 'auth_token', '103b86dd97c0bc00b714d51b89b91d82419cc2fc4329de7450dcb4bf830dac77', '[\"*\"]', '2022-05-25 06:09:53', '2022-05-25 05:13:54', '2022-05-25 06:09:53'),
(385, 'App\\Models\\User', 30, 'auth_token', '1d99321efe91158fd71e704827e88657ff3e58f939d420d467a2a52d5e68ea3e', '[\"*\"]', NULL, '2022-05-25 07:02:27', '2022-05-25 07:02:27'),
(386, 'App\\Models\\User', 30, 'auth_token', '5365696e57e0121d69c3036f26ee56c5d292563df0fe5263a36e7e6eb38678ba', '[\"*\"]', '2022-05-25 10:48:31', '2022-05-25 07:02:27', '2022-05-25 10:48:31'),
(387, 'App\\Models\\User', 2, 'auth_token', '522737bd40a777799eaf15faeb4a9e94a59afc5e79b32a41a4c892c8eaa3677c', '[\"*\"]', NULL, '2022-05-25 08:33:39', '2022-05-25 08:33:39'),
(388, 'App\\Models\\User', 2, 'auth_token', '8395ea8f27a6856e460f471cf6bcc75f60d41ea4969abebd00233f38889d427a', '[\"*\"]', '2022-06-01 06:41:42', '2022-05-25 08:33:39', '2022-06-01 06:41:42'),
(389, 'App\\Models\\User', 26, 'auth_token', '2e6848a9540003bc6af114fe48147f50ecf1f7046879d700a829fadce3d1b0a5', '[\"*\"]', NULL, '2022-05-27 05:05:22', '2022-05-27 05:05:22'),
(390, 'App\\Models\\User', 26, 'auth_token', '515851f878978ce21865dc14d7bf881616e87fc0d2a9a91af4409b11922793f9', '[\"*\"]', NULL, '2022-05-27 05:05:22', '2022-05-27 05:05:22'),
(391, 'App\\Models\\User', 17, 'auth_token', '236046b903597047224cbfa61b110c94929e9f1f0a0d6b5d8bb9ff9d3003de02', '[\"*\"]', NULL, '2022-05-28 12:39:42', '2022-05-28 12:39:42'),
(392, 'App\\Models\\User', 17, 'auth_token', '473c0d1a1c395bdf44b6dccae809f4c57714ba4e395717617d38ac0c7612d28a', '[\"*\"]', '2022-05-29 07:49:08', '2022-05-28 12:39:42', '2022-05-29 07:49:08'),
(393, 'App\\Models\\User', 30, 'auth_token', 'cc2308a46b4947ef3b9e54afbf0ce7c7ba5b4e2007ed0856c2d7b991308a5b51', '[\"*\"]', NULL, '2022-05-28 17:09:43', '2022-05-28 17:09:43'),
(394, 'App\\Models\\User', 30, 'auth_token', '2006fec2e6ebf71ca249473431ed7d1e32f1efbc1914809f37d9ed3c4a127448', '[\"*\"]', '2022-05-28 17:10:04', '2022-05-28 17:09:43', '2022-05-28 17:10:04'),
(395, 'App\\Models\\User', 17, 'auth_token', '39c6f5210020b5949c26954e2ea3a5a401aa6554673dbf19186fe7711d03b0ad', '[\"*\"]', NULL, '2022-05-29 07:54:52', '2022-05-29 07:54:52'),
(396, 'App\\Models\\User', 17, 'auth_token', '2f3c09d441d32e6f72eeae7e47d0d4fb0e7a9b70d29f071af2555612b4e9f935', '[\"*\"]', '2022-05-30 12:23:03', '2022-05-29 07:54:52', '2022-05-30 12:23:03'),
(397, 'App\\Models\\User', 32, 'auth_token', 'f60e55c445ead4480afdb491928ce13d50e79a2c906e14509ee9470d6275e908', '[\"*\"]', NULL, '2022-05-30 05:38:51', '2022-05-30 05:38:51'),
(398, 'App\\Models\\User', 32, 'auth_token', 'a8c56c002a608000b60ff9f4953a963d140316373604551deed81f87995cc60d', '[\"*\"]', '2022-05-30 17:10:16', '2022-05-30 05:38:51', '2022-05-30 17:10:16'),
(399, 'App\\Models\\User', 33, 'auth_token', '39f694f0f8ccc0455fb32bba6a83900204ad7b3ef6135b270ab4ff8e4f70c4ab', '[\"*\"]', NULL, '2022-05-30 11:10:50', '2022-05-30 11:10:50'),
(400, 'App\\Models\\User', 33, 'auth_token', '1d96fc31374a760b23a60132a1dd9626f21598e08ecfe8751837368e391b3454', '[\"*\"]', '2022-06-02 22:48:47', '2022-05-30 11:10:50', '2022-06-02 22:48:47'),
(401, 'App\\Models\\User', 2, 'auth_token', '7ddf7481eb24d0b34721086d7a2cd0dd60f28fc97f54aa2d3ae79bf68d38f825', '[\"*\"]', NULL, '2022-06-01 06:26:19', '2022-06-01 06:26:19'),
(402, 'App\\Models\\User', 2, 'auth_token', '3b920be7de5ff33ad2b77216fe6995ceedf8edc9892fb5de335a3657084ae26d', '[\"*\"]', '2022-06-01 06:28:44', '2022-06-01 06:26:19', '2022-06-01 06:28:44'),
(403, 'App\\Models\\User', 2, 'auth_token', 'cda25f263833bea160076a8f651b5bb674fe66baa14750bd7e777decccf29edc', '[\"*\"]', NULL, '2022-06-07 12:00:31', '2022-06-07 12:00:31'),
(404, 'App\\Models\\User', 2, 'auth_token', '5feaee13df5fe4ff96405cb850dd23160006bb9e093916182531e08e65fd49fa', '[\"*\"]', '2022-06-08 05:20:24', '2022-06-07 12:00:31', '2022-06-08 05:20:24'),
(405, 'App\\Models\\User', 2, 'auth_token', 'f99f2563d0a04517b1803177dc3a872e1d9926941e362216b8e62f896bab7140', '[\"*\"]', NULL, '2022-06-08 06:05:26', '2022-06-08 06:05:26'),
(406, 'App\\Models\\User', 2, 'auth_token', 'a45f7341b73217d0410b6457016fbbb1802c7a502e8074bc68a944a830151fb9', '[\"*\"]', '2022-06-08 06:43:10', '2022-06-08 06:05:26', '2022-06-08 06:43:10'),
(407, 'App\\Models\\User', 2, 'auth_token', 'fcd807ea8d353cfd65942d3c56081315f5723bd024664d60429d7baae678e0f3', '[\"*\"]', NULL, '2022-06-08 06:53:58', '2022-06-08 06:53:58'),
(408, 'App\\Models\\User', 2, 'auth_token', '1433636bc096df68cd394b9529aba4b8311089a40af6fb302ae7a5e54039bae9', '[\"*\"]', '2022-06-08 06:54:39', '2022-06-08 06:53:58', '2022-06-08 06:54:39'),
(409, 'App\\Models\\User', 2, 'auth_token', 'bb04515aced7319d190a8e9dbc58e0495ddaf20eb0bd555de38243bcce1a9cd6', '[\"*\"]', NULL, '2022-06-08 07:31:42', '2022-06-08 07:31:42'),
(410, 'App\\Models\\User', 2, 'auth_token', 'c7d32b7381cf2162f65a5fb625006eb0d05676280335c81c71c9c70b59ab09b2', '[\"*\"]', '2022-06-15 07:00:13', '2022-06-08 07:31:42', '2022-06-15 07:00:13'),
(411, 'App\\Models\\User', 5, 'auth_token', 'c0bf29dec9b4ec7015556527561841d8b632128651ffe56bdcea05fd1562971b', '[\"*\"]', NULL, '2022-06-08 10:47:05', '2022-06-08 10:47:05'),
(412, 'App\\Models\\User', 5, 'auth_token', 'b9cdd26520ac5732ac2e97f8934fcba35856702e6d3e9ee4130aa9759f326119', '[\"*\"]', '2022-06-14 16:48:51', '2022-06-08 10:47:05', '2022-06-14 16:48:51'),
(413, 'App\\Models\\User', 2, 'auth_token', 'ec75bfdcf25c69c33bcb2afcd65416db5feb2d0eafd5141599f679b79b26c513', '[\"*\"]', NULL, '2022-06-08 19:24:07', '2022-06-08 19:24:07'),
(414, 'App\\Models\\User', 2, 'auth_token', '450afec68e602c2817d1febaf64424a14b5e9a69e099cc09462d193454192a69', '[\"*\"]', '2022-06-08 19:24:11', '2022-06-08 19:24:07', '2022-06-08 19:24:11'),
(415, 'App\\Models\\User', 2, 'auth_token', 'eaa2a301f5af62c0f2622b97808bc2f4d405b3b7b3c83174b8183f50d8fe92f2', '[\"*\"]', NULL, '2022-06-15 08:35:13', '2022-06-15 08:35:13'),
(416, 'App\\Models\\User', 2, 'auth_token', '43e298b26d60728d129548f7ad565711377ee8f8a34918b6cb1fb8e6fd8f7296', '[\"*\"]', '2022-06-16 10:54:32', '2022-06-15 08:35:13', '2022-06-16 10:54:32'),
(417, 'App\\Models\\User', 1, 'auth_token', '96ee02919b92c95d087d27942044e2f4cb02b29adac83f9d6bf2efb46dff4d3e', '[\"*\"]', NULL, '2022-06-23 04:46:37', '2022-06-23 04:46:37'),
(418, 'App\\Models\\User', 1, 'auth_token', '4fb1d57d7cfb4e4a29e1caaaf029c5e0b514bfe74bb1a583d7b5cb3c80139969', '[\"*\"]', '2022-06-23 06:10:51', '2022-06-23 04:46:37', '2022-06-23 06:10:51'),
(419, 'App\\Models\\User', 26, 'auth_token', 'd31c28a8705f34b4e3e3943cbcb9d66bd84cf89061e4f9c00c8a8bcd4ed33cdc', '[\"*\"]', NULL, '2022-06-23 06:37:54', '2022-06-23 06:37:54'),
(420, 'App\\Models\\User', 26, 'auth_token', 'b4bca36d32b30330ca5f568a32f4cc191d1f0939b789daa034dd787e83db5ef3', '[\"*\"]', '2022-06-29 07:46:44', '2022-06-23 06:37:54', '2022-06-29 07:46:44'),
(421, 'App\\Models\\User', 1, 'auth_token', 'e1f2bd212ad70fbc6e69aa76c363429398c844c0d88606cc8c5feb79087af14e', '[\"*\"]', NULL, '2022-06-23 06:59:53', '2022-06-23 06:59:53'),
(422, 'App\\Models\\User', 1, 'auth_token', '332521590f4b8228c37fe7287871107488c405f11473967a40a5698b7b6e5bb6', '[\"*\"]', '2022-06-23 07:02:17', '2022-06-23 06:59:53', '2022-06-23 07:02:17'),
(423, 'App\\Models\\User', 1, 'auth_token', '597b9889ecccba8cd916e859facbe5f6925113bace267d701eeb4281c2d1f26c', '[\"*\"]', NULL, '2022-06-23 11:05:37', '2022-06-23 11:05:37'),
(424, 'App\\Models\\User', 1, 'auth_token', '808f7dbfb56501fb37db4240d85b4ba19d4fb1e182241f1fa3d02695d6dcc23a', '[\"*\"]', '2022-06-23 11:20:51', '2022-06-23 11:05:37', '2022-06-23 11:20:51'),
(425, 'App\\Models\\User', 1, 'auth_token', '79a2c194de4c7858481471d18092f1b122a176878fe446dae1daf41ebfad6019', '[\"*\"]', NULL, '2022-06-23 11:54:40', '2022-06-23 11:54:40'),
(426, 'App\\Models\\User', 1, 'auth_token', '9d10c7d651bffb1a1152aa6f3a36aebb13b6a65a69d1300c067ead6f372e444b', '[\"*\"]', '2022-06-23 11:54:44', '2022-06-23 11:54:40', '2022-06-23 11:54:44'),
(427, 'App\\Models\\User', 2, 'auth_token', '790a3bbc501e59d71cab71a894304fe0e84b1de7451ed89c1fb4d1b9d5609306', '[\"*\"]', NULL, '2022-06-23 11:55:27', '2022-06-23 11:55:27'),
(428, 'App\\Models\\User', 2, 'auth_token', '34492537cba98ca2917835dd7a2856a5ec4b8f7e1ec747a5d72f1c0fda91cd66', '[\"*\"]', '2022-06-23 12:06:51', '2022-06-23 11:55:27', '2022-06-23 12:06:51'),
(429, 'App\\Models\\User', 2, 'auth_token', 'd1812eebf4a0a3edd53c6f5fb4ed8a4e7accd3585ac32c1cb0203a61279f1703', '[\"*\"]', NULL, '2022-06-23 12:11:04', '2022-06-23 12:11:04'),
(430, 'App\\Models\\User', 2, 'auth_token', '77ff37f2410cd373df2503e60057835897167458fd3f70a7e9dfed91d927b207', '[\"*\"]', '2022-06-23 12:12:34', '2022-06-23 12:11:04', '2022-06-23 12:12:34'),
(431, 'App\\Models\\User', 2, 'auth_token', 'e92027ce3210037d6fbc26aa07f99c506c66bca9bae6294430d80591179a333b', '[\"*\"]', NULL, '2022-06-24 06:52:42', '2022-06-24 06:52:42'),
(432, 'App\\Models\\User', 2, 'auth_token', '7f987dfbe949bdb16190a392b3349206cae81eac08020298aecb41959e696849', '[\"*\"]', '2022-06-25 04:08:33', '2022-06-24 06:52:42', '2022-06-25 04:08:33'),
(433, 'App\\Models\\User', 2, 'auth_token', '5f3a309e2bee003318fb6edb4fc4a623d724bfb25fbb372635df63f8e1653828', '[\"*\"]', NULL, '2022-06-24 09:01:02', '2022-06-24 09:01:02'),
(434, 'App\\Models\\User', 2, 'auth_token', '250390ae123ce89bf7fd9c1a90b515e10dae753b732902a87ec8c0d87852f81b', '[\"*\"]', '2022-06-24 09:52:48', '2022-06-24 09:01:02', '2022-06-24 09:52:48'),
(435, 'App\\Models\\User', 2, 'auth_token', 'b479494d67ab17cd372f98d3ede3c502738acdac0c2df83d39b36f0587e1e3e8', '[\"*\"]', NULL, '2022-06-29 04:13:37', '2022-06-29 04:13:37'),
(436, 'App\\Models\\User', 2, 'auth_token', 'f7a87d0e5a45979e1cb7f30b7d781e1c3f8ea47de6cfd90e32668d3796016f5b', '[\"*\"]', '2022-06-29 04:13:41', '2022-06-29 04:13:37', '2022-06-29 04:13:41'),
(437, 'App\\Models\\User', 2, 'auth_token', '095076be773a2c305adc92c7e5814ee911f6491681f87dbcbb3698ad014eff4a', '[\"*\"]', NULL, '2022-06-29 06:50:24', '2022-06-29 06:50:24'),
(438, 'App\\Models\\User', 2, 'auth_token', '8f0ea4df7e96a64a9f9c49fdb090c1b28a342f9a1e9f7959beb4b4fdb068d4b3', '[\"*\"]', '2022-06-29 07:04:12', '2022-06-29 06:50:24', '2022-06-29 07:04:12'),
(439, 'App\\Models\\User', 2, 'auth_token', 'be8b8c9b2a9d475cf813e9de025810d70bcf3f6657b95a46ccac3c7d789cd4ea', '[\"*\"]', NULL, '2022-06-29 07:21:53', '2022-06-29 07:21:53'),
(440, 'App\\Models\\User', 2, 'auth_token', 'b6cdc86927134e3b08a0c3ca310fead1b69a8e905c2256144a221722c9eb16dc', '[\"*\"]', '2022-06-29 07:23:45', '2022-06-29 07:21:53', '2022-06-29 07:23:45'),
(441, 'App\\Models\\User', 2, 'auth_token', 'd029a794a81ae8f218f968038f4945926cfe7e7dd4e3e54b4366bda8c77e7932', '[\"*\"]', NULL, '2022-06-29 09:14:29', '2022-06-29 09:14:29'),
(442, 'App\\Models\\User', 2, 'auth_token', '59338b77bddf1a793dbb220b429a273c257f5212683a7842b557679831250d13', '[\"*\"]', '2022-06-29 09:14:33', '2022-06-29 09:14:29', '2022-06-29 09:14:33'),
(443, 'App\\Models\\User', 2, 'auth_token', '0ff2badb56457e6141aa0db712543970d6295be298fabf0e04a81139e123765e', '[\"*\"]', NULL, '2022-06-29 09:49:19', '2022-06-29 09:49:19'),
(444, 'App\\Models\\User', 2, 'auth_token', 'fd4f91a8b555927c5f651e49b9c829294b6a0fde0a207273abb84aaaef28aa88', '[\"*\"]', '2022-06-29 09:49:23', '2022-06-29 09:49:19', '2022-06-29 09:49:23'),
(445, 'App\\Models\\User', 2, 'auth_token', '27ff3785bcfbbe7120da93c106a7110d935e1075909691499ff3471893aecad7', '[\"*\"]', NULL, '2022-06-29 10:36:53', '2022-06-29 10:36:53'),
(446, 'App\\Models\\User', 2, 'auth_token', 'da05c829267ca3e23bb1c31281cf0b2278cc38ce6b6d50572bac0aeb231724b7', '[\"*\"]', '2022-06-29 11:16:52', '2022-06-29 10:36:53', '2022-06-29 11:16:52'),
(447, 'App\\Models\\User', 2, 'auth_token', 'f7943cc8d83c1d89a9a7647f51bebf1aba9ac2b4b43c1c3304fcb1d6e455e18c', '[\"*\"]', NULL, '2022-06-30 04:36:53', '2022-06-30 04:36:53'),
(448, 'App\\Models\\User', 2, 'auth_token', 'b3200451bfcba378824718197c2c16c16a35fb11d66a4b5f14c4178ab94ea52f', '[\"*\"]', '2022-06-30 05:19:29', '2022-06-30 04:36:53', '2022-06-30 05:19:29'),
(449, 'App\\Models\\User', 2, 'auth_token', '46ae5653e5b41a532924153d06dc08d5ae796b03a4d653fa6676d239d0bdcab4', '[\"*\"]', NULL, '2022-07-26 07:26:34', '2022-07-26 07:26:34'),
(450, 'App\\Models\\User', 2, 'auth_token', '1475d453ec12bef91f981a6bafb6b398044a20c1aa4b14eee185948db409fc52', '[\"*\"]', '2022-07-26 08:51:09', '2022-07-26 07:26:34', '2022-07-26 08:51:09'),
(451, 'App\\Models\\User', 2, 'auth_token', '15026d7b654376e57f1509f0c2bd2ec757d2398dc2d73cc386ac0576fb891cd6', '[\"*\"]', NULL, '2022-07-26 09:16:45', '2022-07-26 09:16:45'),
(452, 'App\\Models\\User', 2, 'auth_token', '49fbe11ff4bb69ebe6ec0b500708bc2f8f81f86975b11e92f0ed59d98c58e236', '[\"*\"]', '2022-07-27 04:00:43', '2022-07-26 09:16:45', '2022-07-27 04:00:43'),
(453, 'App\\Models\\User', 2, 'auth_token', 'e29e7fa06026bf938e560dca0d48a4b3a425af74b59781189ae807f956e69b08', '[\"*\"]', NULL, '2022-07-27 04:16:58', '2022-07-27 04:16:58'),
(454, 'App\\Models\\User', 2, 'auth_token', '9df989f2f141ae2cd206d14d0ff6b8ad5f265dae1c8c8529a9f6437f3a0682c9', '[\"*\"]', '2022-07-27 04:33:33', '2022-07-27 04:16:58', '2022-07-27 04:33:33'),
(455, 'App\\Models\\User', 2, 'auth_token', '649b892bc2138fabf7b74c3aef442da5a6c962314ba55a7c283d50e0a806f845', '[\"*\"]', NULL, '2022-07-27 05:00:01', '2022-07-27 05:00:01'),
(456, 'App\\Models\\User', 2, 'auth_token', '21709df627a64967ea2c254bc5b30c2ea4246a9fc686615a5974038657f1cb1c', '[\"*\"]', '2022-07-27 05:00:05', '2022-07-27 05:00:01', '2022-07-27 05:00:05'),
(457, 'App\\Models\\User', 2, 'auth_token', '9af9fb411b5fc1d39cf6ee158d951ad09c1f0c42cce8bb7453a5e6498852d82a', '[\"*\"]', NULL, '2022-07-27 05:14:59', '2022-07-27 05:14:59'),
(458, 'App\\Models\\User', 2, 'auth_token', '842ebbd22ac99d69d8046c78d08cc92b5f39a13da065ce6512fccf844cd586d9', '[\"*\"]', '2022-07-27 09:30:59', '2022-07-27 05:14:59', '2022-07-27 09:30:59'),
(459, 'App\\Models\\User', 2, 'auth_token', 'a9d5d3673222836ef026698c753b05153f9a99872ac74f1713f084fbfb2bc262', '[\"*\"]', NULL, '2022-08-06 09:12:10', '2022-08-06 09:12:10'),
(460, 'App\\Models\\User', 2, 'auth_token', '9f9d0ccf4bed9c41a83522da6ed05bd8f59a0608fa864d5dff7962534ea61930', '[\"*\"]', '2022-08-06 09:25:33', '2022-08-06 09:12:10', '2022-08-06 09:25:33'),
(461, 'App\\Models\\User', 2, 'auth_token', '3467335588a028e73988f8dd95c0d2e9a9b2431afab05f470ca5cb8a533af12e', '[\"*\"]', NULL, '2022-08-09 07:30:41', '2022-08-09 07:30:41'),
(462, 'App\\Models\\User', 2, 'auth_token', 'c28e5ef4e5e7ba2acf97b39ef7523618439d0d95baae7cc2c9e61db588cc7639', '[\"*\"]', '2022-08-10 05:12:54', '2022-08-09 07:30:41', '2022-08-10 05:12:54'),
(463, 'App\\Models\\User', 2, 'auth_token', '0b84fb01f31790d4eb7a7d62ebc37315774f653137ec6bfcb806e39fd85c8e2c', '[\"*\"]', NULL, '2022-08-10 05:33:03', '2022-08-10 05:33:03'),
(464, 'App\\Models\\User', 2, 'auth_token', '1b44213c3430a843ed0810777d72510a4a56b19728de8a72f64a8c958b3b5858', '[\"*\"]', '2022-08-10 05:33:24', '2022-08-10 05:33:03', '2022-08-10 05:33:24'),
(465, 'App\\Models\\User', 2, 'auth_token', 'a08495e1afed0c2c281a29aa35defd57fbad4aa7589a6c528e9fbf51a6d2b23c', '[\"*\"]', NULL, '2022-08-10 09:11:47', '2022-08-10 09:11:47'),
(466, 'App\\Models\\User', 2, 'auth_token', '374896bcebec5cb1fe446ae5152d6707e75505e3191e68b14f0cca12f6b411d7', '[\"*\"]', '2022-08-10 09:12:17', '2022-08-10 09:11:47', '2022-08-10 09:12:17'),
(467, 'App\\Models\\User', 2, 'auth_token', '0aee3fc56253cdb745808a590bc050f8a8aef97f535d1dbe104dad7141fb8b8c', '[\"*\"]', NULL, '2022-08-11 06:40:42', '2022-08-11 06:40:42'),
(468, 'App\\Models\\User', 2, 'auth_token', '6e06ac99ca622735d4595ccddfb74db73ee58b414e7d79c25f3d5c604b3dc46b', '[\"*\"]', '2022-08-11 09:24:52', '2022-08-11 06:40:42', '2022-08-11 09:24:52'),
(469, 'App\\Models\\User', 2, 'auth_token', '70a7e126790d94f675232e312446a7ef97ca7ae325b94107194ce38b5fd13b9e', '[\"*\"]', NULL, '2022-08-11 08:59:14', '2022-08-11 08:59:14'),
(470, 'App\\Models\\User', 2, 'auth_token', 'dbbfebd683d8b9c7c720ec630421973950090e2922c676f79e776c93bbe2c005', '[\"*\"]', '2022-08-11 09:04:36', '2022-08-11 08:59:14', '2022-08-11 09:04:36'),
(471, 'App\\Models\\User', 2, 'auth_token', '4119c386e641e63cba744831375a8f3d6d32af43282e4ff2090ab3bbb4f248eb', '[\"*\"]', NULL, '2022-08-11 09:29:32', '2022-08-11 09:29:32'),
(472, 'App\\Models\\User', 2, 'auth_token', 'a8c3235c5debbece6fa08aad3f64d369c4e45bb6313329635a5a683c1de2eff2', '[\"*\"]', '2022-08-11 09:30:05', '2022-08-11 09:29:32', '2022-08-11 09:30:05'),
(473, 'App\\Models\\User', 2, 'auth_token', '314a7c681c6371ee27d7b648fb48d1ffa0bd5592483367593acbfc179bd273d0', '[\"*\"]', NULL, '2022-08-11 09:30:10', '2022-08-11 09:30:10'),
(474, 'App\\Models\\User', 2, 'auth_token', '9f9d9e06d11c1b696360fefcea65e92b3cc598b95331fa5a77e71beb28261907', '[\"*\"]', '2022-08-12 03:55:04', '2022-08-11 09:30:10', '2022-08-12 03:55:04'),
(475, 'App\\Models\\User', 2, 'auth_token', '711c4db90d02329ec58f949310f6a049e7d84f4c02ce9d47e9743838485cae77', '[\"*\"]', NULL, '2022-08-11 09:44:51', '2022-08-11 09:44:51'),
(476, 'App\\Models\\User', 2, 'auth_token', 'e65d2bb09dc486fc85b01e52aadb32abdf097c1398c8dafd9ffab93022c2cb8d', '[\"*\"]', '2022-08-11 09:52:30', '2022-08-11 09:44:51', '2022-08-11 09:52:30'),
(477, 'App\\Models\\User', 2, 'auth_token', '2eb613ade7ac74965b275901601801d4d3ff34b0da7c2f51c5f5db2963494304', '[\"*\"]', NULL, '2022-08-12 09:12:43', '2022-08-12 09:12:43'),
(478, 'App\\Models\\User', 2, 'auth_token', 'f0e5b8acfeb4f482c0d57e13267a8e1e6a4e1373576dadf9bbe0b0145d81f1d5', '[\"*\"]', '2022-08-16 03:44:07', '2022-08-12 09:12:43', '2022-08-16 03:44:07'),
(479, 'App\\Models\\User', 2, 'auth_token', '6b3c575621d95743b6d3082d00dcc54225c56cfe2432acca1d12290e35667764', '[\"*\"]', NULL, '2022-08-12 11:29:56', '2022-08-12 11:29:56'),
(480, 'App\\Models\\User', 2, 'auth_token', '05a5b736d1792c998c5ebf768cd32ba937d8e5cc78223edca43d5311e5a0cf2b', '[\"*\"]', '2022-08-12 11:30:00', '2022-08-12 11:29:56', '2022-08-12 11:30:00'),
(481, 'App\\Models\\User', 16, 'auth_token', 'be128491ef576e1eede52960e28d59f5f8ac2f5bbe70e57c8c3d4627d874c26f', '[\"*\"]', NULL, '2022-08-13 07:29:28', '2022-08-13 07:29:28'),
(482, 'App\\Models\\User', 16, 'auth_token', '0b0bc5a539f1762d2926be09a9bb6b144ccf6590111488e3d3266538a80a445c', '[\"*\"]', '2022-08-15 14:57:13', '2022-08-13 07:29:28', '2022-08-15 14:57:13'),
(483, 'App\\Models\\User', 2, 'auth_token', '4548cd3260cbd9c3ceebdec02ce0efec5d7cf35352a43ea0fc90ab79fab625ac', '[\"*\"]', NULL, '2022-08-13 17:17:17', '2022-08-13 17:17:17'),
(484, 'App\\Models\\User', 2, 'auth_token', '73441bec59d7f8e9359a761056deb7efcdebc136c73f65ea8169715f9fadc684', '[\"*\"]', '2022-08-13 17:17:48', '2022-08-13 17:17:17', '2022-08-13 17:17:48'),
(485, 'App\\Models\\User', 33, 'auth_token', 'd64b53992ddeaba6314a1d6225e10a4d4cbf18ed9594ae7aa3a2769d83421340', '[\"*\"]', NULL, '2022-08-27 04:03:37', '2022-08-27 04:03:37'),
(486, 'App\\Models\\User', 33, 'auth_token', 'd6d78f845c43773cf0b83caeeb45fd53e67ed019b974b521ee7d2fa592a1c0a1', '[\"*\"]', NULL, '2022-08-27 04:21:30', '2022-08-27 04:21:30'),
(487, 'App\\Models\\User', 33, 'auth_token', 'f03e60f8ee693e0cf382d073edc0c25dac2c3bf0f07c85196b11711d842f85a2', '[\"*\"]', NULL, '2022-08-27 04:22:33', '2022-08-27 04:22:33'),
(488, 'App\\Models\\User', 33, 'auth_token', '943dac9c47115cd933c5c0b6d571f71c6e9fa46a610d8aea7e6cde5d261d6112', '[\"*\"]', NULL, '2022-08-27 05:06:28', '2022-08-27 05:06:28'),
(489, 'App\\Models\\User', 33, 'auth_token', 'bcb5d4c91aea56fcb658660d0ad0be3c5933e7e3d7c4d6c7a1f69763312a75b6', '[\"*\"]', NULL, '2022-08-27 05:06:28', '2022-08-27 05:06:28'),
(490, 'App\\Models\\User', 33, 'auth_token', '825a6a40b57da3be6e26151268cc60ecd464c8c418a091ee18166e02c12ece7a', '[\"*\"]', NULL, '2022-08-27 05:08:12', '2022-08-27 05:08:12'),
(491, 'App\\Models\\User', 33, 'auth_token', '78ffcb1ada1dc551648faaa3b3ffeff673d2ededf5050ac3de2286c2c0443a8b', '[\"*\"]', NULL, '2022-08-27 05:08:12', '2022-08-27 05:08:12'),
(492, 'App\\Models\\User', 33, 'auth_token', '16f78f78fd6d0e53fb9ecd6262b3bcf1649edbb5af331924b47101eb6678f5ca', '[\"*\"]', NULL, '2022-08-27 05:48:56', '2022-08-27 05:48:56'),
(493, 'App\\Models\\User', 33, 'auth_token', '93331cce6b732f16188cf99ff6a649ece0ac70b1803a3746947db390991fed4e', '[\"*\"]', NULL, '2022-08-27 05:48:56', '2022-08-27 05:48:56'),
(494, 'App\\Models\\User', 480, 'auth_token', 'b8cf0a2b000df36ecec29c8e3c4d6fdce2aa4434e52f84fa86f2c11c7c27fed7', '[\"*\"]', NULL, '2022-08-31 04:46:08', '2022-08-31 04:46:08'),
(495, 'App\\Models\\User', 480, 'auth_token', '5cf62120f47435010ecb019f78ddc7bd700fc94b639917e1446dbf12c3d0b652', '[\"*\"]', '2022-08-31 04:48:44', '2022-08-31 04:46:08', '2022-08-31 04:48:44'),
(496, 'App\\Models\\User', 40, 'auth_token', '7913a5c33670958ea2a9430db2c3433f0f4782128962f64fa064ebf78cdebff3', '[\"*\"]', NULL, '2022-09-01 09:10:08', '2022-09-01 09:10:08'),
(497, 'App\\Models\\User', 40, 'auth_token', '9ea1935e35fab35bc87eda3d8d64393edb629ff28e72cd46f87126973289aa63', '[\"*\"]', NULL, '2022-09-01 09:10:08', '2022-09-01 09:10:08'),
(498, 'App\\Models\\User', 40, 'auth_token', 'e7ab21bab7cf4c7859b1d0ad26b5dcd03b1fe53346b17c20a37792e62509b70a', '[\"*\"]', NULL, '2022-09-01 09:32:42', '2022-09-01 09:32:42'),
(499, 'App\\Models\\User', 40, 'auth_token', '62362ba8cbd535839de12a0921508dff7c659f6a887ea9d85ef3d714d39dee01', '[\"*\"]', NULL, '2022-09-01 09:32:42', '2022-09-01 09:32:42'),
(500, 'App\\Models\\User', 392, 'auth_token', '7cb92371e6c75516055df6ed8d49e650cd6e121848178ef809b72de05c0fc26c', '[\"*\"]', NULL, '2022-09-01 10:24:52', '2022-09-01 10:24:52'),
(501, 'App\\Models\\User', 392, 'auth_token', '130d63cf890adc82f3b4b4f60a118a7f2861259ea48e3e250ef367c8ed50b572', '[\"*\"]', '2022-09-02 04:42:40', '2022-09-01 10:24:52', '2022-09-02 04:42:40'),
(502, 'App\\Models\\User', 40, 'auth_token', '3b896563548fed15ab0e33db3146f8003754cc788d9fae9f80618647b8cb6436', '[\"*\"]', NULL, '2022-09-11 10:37:24', '2022-09-11 10:37:24'),
(503, 'App\\Models\\User', 40, 'auth_token', '50ef6793bf8b59d007b37bd567104996aa5a447b19b68a9e4a8a6297c90efd65', '[\"*\"]', '2022-09-11 10:37:48', '2022-09-11 10:37:25', '2022-09-11 10:37:48'),
(504, 'App\\Models\\User', 392, 'auth_token', 'ceb76ddd18960ee7c78a04f0c36dc504da2884018a21450c678fa6a207f59a9e', '[\"*\"]', NULL, '2022-09-11 10:44:18', '2022-09-11 10:44:18'),
(505, 'App\\Models\\User', 392, 'auth_token', '69648782180617ec19ab62ad427aa0951f621d3023ab92cab4bc22770ca53447', '[\"*\"]', '2022-09-12 05:35:39', '2022-09-11 10:44:18', '2022-09-12 05:35:39'),
(506, 'App\\Models\\User', 480, 'auth_token', 'a9dc953be2e8b9bf978bbbf93f6093c5f7b3b0167410bbc5d2e4e98706236be3', '[\"*\"]', NULL, '2022-09-17 07:34:06', '2022-09-17 07:34:06'),
(507, 'App\\Models\\User', 480, 'auth_token', '86a16f25016243ca9dca3ceee6a9ca2cdbcc3556b9d43212ee30dc2998a40b94', '[\"*\"]', '2022-09-17 07:34:37', '2022-09-17 07:34:06', '2022-09-17 07:34:37'),
(508, 'App\\Models\\User', 480, 'auth_token', 'e543adc1735c3c873e92df0589bdea8536cdc46f5bf4efaae114b1092aed1eb7', '[\"*\"]', NULL, '2022-09-17 07:40:02', '2022-09-17 07:40:02'),
(509, 'App\\Models\\User', 480, 'auth_token', '0e53326d1b8de6ae9e360782eb23691a8ff816d9bb7f6e4c24434cfec2d2f86d', '[\"*\"]', '2022-09-17 09:52:42', '2022-09-17 07:40:02', '2022-09-17 09:52:42'),
(510, 'App\\Models\\User', 480, 'auth_token', '20e23196eab7db8fe7434c6e37217f084433a9e4952a44876d3e8bbed938a2a6', '[\"*\"]', NULL, '2022-09-17 09:01:38', '2022-09-17 09:01:38'),
(511, 'App\\Models\\User', 480, 'auth_token', 'ce59acb56133f395d6e94ddc88fc7017133e52ea16e2dcaa90882926461d3918', '[\"*\"]', '2022-09-17 09:42:32', '2022-09-17 09:01:38', '2022-09-17 09:42:32'),
(512, 'App\\Models\\User', 480, 'auth_token', 'fbdde11d5fef312bd7c2ff08ce5aa4554ed91e0cd60a5ffe58a110895c84fd5b', '[\"*\"]', NULL, '2022-09-22 04:18:22', '2022-09-22 04:18:22'),
(513, 'App\\Models\\User', 480, 'auth_token', 'a33f7b18c52c9af1df3cc5c81321d600b57ca98a43b57211a9b0e343722d1ca2', '[\"*\"]', '2022-09-22 06:23:03', '2022-09-22 04:18:22', '2022-09-22 06:23:03'),
(514, 'App\\Models\\User', 480, 'auth_token', '164cb23415195eea8e06d54e086313dbe3b7a44195e9464a6b6dacc0a4c9448e', '[\"*\"]', NULL, '2022-09-22 06:23:11', '2022-09-22 06:23:11'),
(515, 'App\\Models\\User', 480, 'auth_token', 'ef4f027df0b6d91841b3b52464cc9f2f072d381ff34bc9a77d8181e1e18a02c5', '[\"*\"]', '2022-09-22 07:35:35', '2022-09-22 06:23:11', '2022-09-22 07:35:35'),
(516, 'App\\Models\\User', 480, 'auth_token', '75e952fc92bf5b714bcc5613fdb8ac5151d8a2545f15aa1e0dfe429cd8b54dba', '[\"*\"]', NULL, '2022-09-22 06:41:50', '2022-09-22 06:41:50'),
(517, 'App\\Models\\User', 480, 'auth_token', '99c7de027fcc4c795b4276dde85a5805fdc8dad19988853278ed7f422890e5aa', '[\"*\"]', '2022-09-22 07:37:30', '2022-09-22 06:41:50', '2022-09-22 07:37:30'),
(518, 'App\\Models\\User', 392, 'auth_token', '12ad2c6ae3d5311d24e1662d7b58a53cc5aa124e7e6875fb6848ffdd09676d26', '[\"*\"]', NULL, '2022-09-22 07:38:10', '2022-09-22 07:38:10'),
(519, 'App\\Models\\User', 392, 'auth_token', '509647b9d87a1d4003663908f02fcdfff5636d12f4b5a8f553ded7692b8fa835', '[\"*\"]', '2022-09-24 04:42:11', '2022-09-22 07:38:10', '2022-09-24 04:42:11'),
(520, 'App\\Models\\User', 392, 'auth_token', '2221783ac9af459682c5f923cc3be4a25b6020a1171c95ab35f2ed773b8b376d', '[\"*\"]', NULL, '2022-09-22 07:44:40', '2022-09-22 07:44:40'),
(521, 'App\\Models\\User', 392, 'auth_token', '7290fcddc9bc42110ec099b4bd6193a6db7f5e4968fc47981f49df094d54e965', '[\"*\"]', '2022-09-24 04:31:43', '2022-09-22 07:44:40', '2022-09-24 04:31:43'),
(522, 'App\\Models\\User', 480, 'auth_token', '065372a21c33f3453b9a6f59c2de0e9c4f5f471cf849a8a685a495ca3324cc30', '[\"*\"]', NULL, '2022-09-22 09:08:32', '2022-09-22 09:08:32'),
(523, 'App\\Models\\User', 480, 'auth_token', 'bfaad7172ab76ad8ffd8727daf10b76d192a5a4c8a8aa1e9a7b8bd7232c84d45', '[\"*\"]', '2022-09-28 11:22:22', '2022-09-22 09:08:32', '2022-09-28 11:22:22'),
(524, 'App\\Models\\User', 392, 'auth_token', '3de6351f6f0b2fd484ebc674ddba5bc841db0f5f9806d664b540c8ef7f70c821', '[\"*\"]', NULL, '2022-09-24 04:44:50', '2022-09-24 04:44:50'),
(525, 'App\\Models\\User', 392, 'auth_token', 'cb890ee557f60ef37b663d9f0e8e800ec98f8c06ae3294098624df19c7fb8864', '[\"*\"]', '2022-09-27 04:53:43', '2022-09-24 04:44:50', '2022-09-27 04:53:43'),
(526, 'App\\Models\\User', 480, 'auth_token', '152b2d37c9612f8ec7e12908d93be767b247e6115cc2c4e0ea273ddb44e207c4', '[\"*\"]', NULL, '2022-09-24 06:36:00', '2022-09-24 06:36:00'),
(527, 'App\\Models\\User', 480, 'auth_token', '82ca4d32eda6123dc737b456418975d0034ec4a6adc67b5f0060b16c2022d980', '[\"*\"]', '2022-09-24 08:54:04', '2022-09-24 06:36:00', '2022-09-24 08:54:04'),
(528, 'App\\Models\\User', 392, 'auth_token', '9782c32ffc6a076472b0ff1b06d87e20d2b695a2b0f2a362346b515f731b09f7', '[\"*\"]', NULL, '2022-09-24 08:54:41', '2022-09-24 08:54:41'),
(529, 'App\\Models\\User', 392, 'auth_token', '1fffc2cd74ddc799d29e7029e76c8b023eae9bb1dba0745741816d14d17a96b5', '[\"*\"]', '2022-09-24 09:03:45', '2022-09-24 08:54:41', '2022-09-24 09:03:45'),
(530, 'App\\Models\\User', 480, 'auth_token', '363b48d635f6055ad7bb75297f5640eec9dd463af102f9453ab6f54a14c76ca2', '[\"*\"]', NULL, '2022-09-24 09:04:14', '2022-09-24 09:04:14'),
(531, 'App\\Models\\User', 480, 'auth_token', '51e9f0a125f635aa10e9268d53a8b10bef18a65d07a644614e3725b28381f17e', '[\"*\"]', '2022-09-24 10:11:55', '2022-09-24 09:04:14', '2022-09-24 10:11:55'),
(532, 'App\\Models\\User', 392, 'auth_token', '33aa900fe7600b0d49930c84fa62d5d630c5709e5988bf23245bcb0071065480', '[\"*\"]', NULL, '2022-09-24 10:12:05', '2022-09-24 10:12:05'),
(533, 'App\\Models\\User', 392, 'auth_token', '95c789562164aeafb46dbceabcfc29ac80a38c23eb7f2e1570e55760176552d0', '[\"*\"]', '2022-09-27 06:38:04', '2022-09-24 10:12:05', '2022-09-27 06:38:04'),
(534, 'App\\Models\\User', 480, 'auth_token', '7541b5cc149af62a99d2e5a3f23155a01beb03d723c2c6845c89f62bc585fb01', '[\"*\"]', NULL, '2022-09-27 06:38:48', '2022-09-27 06:38:48'),
(535, 'App\\Models\\User', 480, 'auth_token', 'b7a8e9c219eb8aebb89c3fcbccbd777ff80608cebb1a92ebeb7f1cc80e011d55', '[\"*\"]', '2022-09-27 07:00:41', '2022-09-27 06:38:48', '2022-09-27 07:00:41'),
(536, 'App\\Models\\User', 392, 'auth_token', 'f4560f91889b16c104f482bcd2a9daee43fc001a03ad83b88b4e22e55f804e3f', '[\"*\"]', NULL, '2022-09-27 07:01:19', '2022-09-27 07:01:19'),
(537, 'App\\Models\\User', 392, 'auth_token', '650507394d74fd88dcf085b80ddd5bf94b0e023ec23297a2140f3f86fb219b1e', '[\"*\"]', '2022-09-27 09:33:09', '2022-09-27 07:01:19', '2022-09-27 09:33:09'),
(538, 'App\\Models\\User', 392, 'auth_token', '6864843a54469d9ef332b81122b1746192648da397005ea310f2c76004e3f4b0', '[\"*\"]', NULL, '2022-09-27 09:47:01', '2022-09-27 09:47:01'),
(539, 'App\\Models\\User', 392, 'auth_token', '31363fa90e5632c5e89b23073023c4598a9342f333fd6409ea765b38cffc4ba7', '[\"*\"]', '2022-09-27 09:52:28', '2022-09-27 09:47:01', '2022-09-27 09:52:28'),
(540, 'App\\Models\\User', 392, 'auth_token', 'fab1b5becba22bcaa2463a9ac9a301e32922786cf45516f9edd61290d180d023', '[\"*\"]', NULL, '2022-09-27 10:17:38', '2022-09-27 10:17:38'),
(541, 'App\\Models\\User', 392, 'auth_token', 'e6df29e9467658a653d572680fee0eceb229d2ed86b93e1aca3c19b5ae859f65', '[\"*\"]', '2022-09-27 11:32:46', '2022-09-27 10:17:38', '2022-09-27 11:32:46'),
(542, 'App\\Models\\User', 480, 'auth_token', '1314fe0867507e5ecaad9066ad3c90e81d926d8f9304756df04cf9b4b56953cb', '[\"*\"]', NULL, '2022-09-27 11:32:56', '2022-09-27 11:32:56'),
(543, 'App\\Models\\User', 480, 'auth_token', 'a55eed9d2199fbc5efd09d0dc377d631683aa8131607cd77a6b361faf3b92bf1', '[\"*\"]', '2022-09-28 05:02:12', '2022-09-27 11:32:56', '2022-09-28 05:02:12'),
(544, 'App\\Models\\User', 392, 'auth_token', '6fd18bb7bcf6cb3fbf2056aa0e4351efd4ffb3daa1e406afcb618a785cad6c54', '[\"*\"]', NULL, '2022-09-28 05:02:59', '2022-09-28 05:02:59'),
(545, 'App\\Models\\User', 392, 'auth_token', '0dfefc5be5cce48528225c83ff45102e3d31484cae20f26cdb1c8134f0f0dc25', '[\"*\"]', '2022-09-28 09:09:23', '2022-09-28 05:02:59', '2022-09-28 09:09:23'),
(546, 'App\\Models\\User', 392, 'auth_token', '661f052087e92e4481c23b1198992ed84ae0e22cadaceae2edd9f6d5bb15ddb4', '[\"*\"]', NULL, '2022-09-28 06:02:52', '2022-09-28 06:02:52'),
(547, 'App\\Models\\User', 392, 'auth_token', '742bfbb1cef6711c38aaba3998a187060e5a1120f4c2b03f9aa1d243ceac0bbb', '[\"*\"]', '2022-10-03 04:00:48', '2022-09-28 06:02:52', '2022-10-03 04:00:48'),
(548, 'App\\Models\\User', 480, 'auth_token', '958d3afb9437d3ca307df6da834c78aebea52b4c032a8492a11c1f9e944111aa', '[\"*\"]', NULL, '2022-09-28 09:09:32', '2022-09-28 09:09:32'),
(549, 'App\\Models\\User', 480, 'auth_token', 'b8174e838dbe98fa5ea2011072d69b288a164eb26a7b5b447fe2a866811e6bfd', '[\"*\"]', '2022-09-29 04:19:26', '2022-09-28 09:09:32', '2022-09-29 04:19:26'),
(550, 'App\\Models\\User', 392, 'auth_token', '4f3520874d408c5cea0d6c6013e2e744cbd5b6ee0cbaed987afff6567e38c551', '[\"*\"]', NULL, '2022-09-29 05:06:07', '2022-09-29 05:06:07'),
(551, 'App\\Models\\User', 392, 'auth_token', '8212e600443fd4d26d3a8df9bd5f3ce8e0a793bc26152e0121ed403a59f4b1c5', '[\"*\"]', '2022-09-29 05:14:05', '2022-09-29 05:06:07', '2022-09-29 05:14:05'),
(552, 'App\\Models\\User', 392, 'auth_token', 'd575ad85fbb8ab62c527965cbda436dc3c45d012de3d7c9143474239b1f51c5d', '[\"*\"]', NULL, '2022-10-01 07:29:48', '2022-10-01 07:29:48');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(553, 'App\\Models\\User', 392, 'auth_token', '0bd969b8f7faf158761b448c613cf7eada2d911bf12a90ba234cc95e33a82e5f', '[\"*\"]', '2022-10-01 07:30:25', '2022-10-01 07:29:48', '2022-10-01 07:30:25'),
(554, 'App\\Models\\User', 392, 'auth_token', '097ba18eedadc0c61eefa7a499ea6273a452a685e6e4161278025094eeede653', '[\"*\"]', NULL, '2022-10-02 04:49:50', '2022-10-02 04:49:50'),
(555, 'App\\Models\\User', 392, 'auth_token', 'c8eaa7d64dc381e0c8ec83b049221a3e2cdf799363788091ba489a0b99ae21d1', '[\"*\"]', '2022-10-05 13:01:33', '2022-10-02 04:49:50', '2022-10-05 13:01:33'),
(556, 'App\\Models\\User', 392, 'auth_token', '3b94a0bd86ddf4e0dee3efd2b687fe9f75a44b270c5245bb74eea08728f0a273', '[\"*\"]', NULL, '2022-10-08 04:51:36', '2022-10-08 04:51:36'),
(557, 'App\\Models\\User', 392, 'auth_token', 'f29c1746633be4af65b6d666c9a545e4cb7339f8ddb72b0d87a1092fdf449d53', '[\"*\"]', '2022-10-11 05:08:32', '2022-10-08 04:51:36', '2022-10-11 05:08:32'),
(558, 'App\\Models\\User', 392, 'auth_token', '7fff8ed81f1ad88b25ec6aae9b1a6a04fb3d7836b69df1512a5ee98ac351f7b2', '[\"*\"]', NULL, '2022-10-21 13:01:01', '2022-10-21 13:01:01'),
(559, 'App\\Models\\User', 392, 'auth_token', 'f87d1e91e6c5aa0e7132d957f87cf6a90d4a4589bc1fd7ede060f435ffaf4ebc', '[\"*\"]', '2022-12-22 04:58:38', '2022-10-21 13:01:01', '2022-12-22 04:58:38'),
(560, 'App\\Models\\User', 28, 'auth_token', '03fd93872691bde2dc4c2520fd42fc9d26484b377419ac0000c5eb8deb267a94', '[\"*\"]', NULL, '2022-10-26 09:44:04', '2022-10-26 09:44:04'),
(561, 'App\\Models\\User', 28, 'auth_token', 'fbd0533f26833db7c3dc79f156f28b55601652fc7a3fe113b03948bcb0928621', '[\"*\"]', NULL, '2022-10-26 09:45:43', '2022-10-26 09:45:43'),
(562, 'App\\Models\\User', 28, 'auth_token', '92ccd00624397ac8210e6f36b161ee2b977afb67a2408a307fabfbb94c97eb29', '[\"*\"]', '2022-10-29 12:10:31', '2022-10-26 09:45:43', '2022-10-29 12:10:31'),
(563, 'App\\Models\\User', 480, 'auth_token', '8350f00d769c792e18a3fef7e75b24c3bcef66a46ca2c15c8fcddc62ee605201', '[\"*\"]', NULL, '2022-10-28 09:25:12', '2022-10-28 09:25:12'),
(564, 'App\\Models\\User', 480, 'auth_token', 'af794d47a582dbffdad6a9cfbdc493860220fa0ab21b256d140439c1b4443b27', '[\"*\"]', '2022-10-28 09:25:17', '2022-10-28 09:25:12', '2022-10-28 09:25:17'),
(565, 'App\\Models\\User', 392, 'auth_token', 'a9afc70c9176dbe5108428377e5206d06153603fa2294e5709bbda5ed2968ffb', '[\"*\"]', NULL, '2022-10-28 09:25:33', '2022-10-28 09:25:33'),
(566, 'App\\Models\\User', 392, 'auth_token', '14b77b2fab2125d6ada103f1808f0d226a4406a80b26d2741c329c222e8e2e5e', '[\"*\"]', '2022-10-28 09:37:59', '2022-10-28 09:25:33', '2022-10-28 09:37:59'),
(567, 'App\\Models\\User', 480, 'auth_token', '544593c1fe7e371849d928bc9112cbd700494c38ce11f2e0fb21004161780730', '[\"*\"]', NULL, '2022-10-28 09:38:11', '2022-10-28 09:38:11'),
(568, 'App\\Models\\User', 480, 'auth_token', 'c3a81c71b52014cf1eb29b77dc8ce5d90c1dae2f3079ca324663a13e5f006757', '[\"*\"]', '2022-10-28 09:38:31', '2022-10-28 09:38:11', '2022-10-28 09:38:31'),
(569, 'App\\Models\\User', 392, 'auth_token', '7a720421f6b7da9e275a7d9c67f756bebd2d9c83f118c2b5cf69d9d9cf96b4bd', '[\"*\"]', NULL, '2022-10-28 09:38:39', '2022-10-28 09:38:39'),
(570, 'App\\Models\\User', 392, 'auth_token', '4103fccecc9729aa313ddf814224ec4aacca5942c3f6520afb6e60395f1b357b', '[\"*\"]', '2022-10-29 16:17:25', '2022-10-28 09:38:39', '2022-10-29 16:17:25'),
(571, 'App\\Models\\User', 392, 'auth_token', 'cf3cbae2d62e727e3bbebf067bc41f47a05d676ed6f3ea368784fe0f2e1b44b4', '[\"*\"]', NULL, '2022-11-03 07:10:28', '2022-11-03 07:10:28'),
(572, 'App\\Models\\User', 392, 'auth_token', 'd47033cb630705afc5c5e3306c72031e652e815c6410b77a645c5fba731c3268', '[\"*\"]', '2022-11-03 07:16:41', '2022-11-03 07:10:28', '2022-11-03 07:16:41'),
(573, 'App\\Models\\User', 480, 'auth_token', '5fbeec460ad7345d1dc6d1f1caa1e18a24c10eeb51db5c570995a7e9e6bca449', '[\"*\"]', NULL, '2022-11-03 07:16:49', '2022-11-03 07:16:49'),
(574, 'App\\Models\\User', 480, 'auth_token', '7d4291a4bb34af62d0df07416fdf15f71b4c6fe6eca80a0418f138a51375d252', '[\"*\"]', '2022-11-03 07:25:48', '2022-11-03 07:16:49', '2022-11-03 07:25:48'),
(575, 'App\\Models\\User', 392, 'auth_token', 'ddf657278a8a0bb4c3e8ed6ae6e7158f3849e0826090ce15154b912f5e8d0336', '[\"*\"]', NULL, '2022-11-03 07:26:04', '2022-11-03 07:26:04'),
(576, 'App\\Models\\User', 392, 'auth_token', '50bf9692da5df84ac821590c92e96ec0e4b725986a7c160c85a262c39dec7de6', '[\"*\"]', '2022-11-05 09:06:23', '2022-11-03 07:26:04', '2022-11-05 09:06:23'),
(577, 'App\\Models\\User', 480, 'auth_token', '5143ffbd81a0846d9adef227ae37c1dc2927568a4a0f6b8e6057a58acb51c9d0', '[\"*\"]', NULL, '2022-11-05 09:06:40', '2022-11-05 09:06:40'),
(578, 'App\\Models\\User', 480, 'auth_token', 'd52066e1cf2b25fb304b1d457d30f7388e69790288d79a0e02648aa5156042c5', '[\"*\"]', '2022-11-05 09:07:19', '2022-11-05 09:06:40', '2022-11-05 09:07:19'),
(579, 'App\\Models\\User', 392, 'auth_token', 'e8822dbb7e4661a27e37ecb0f32922a0ccdd60038568cb4db7b2710dfe71af7a', '[\"*\"]', NULL, '2022-11-05 09:07:27', '2022-11-05 09:07:27'),
(580, 'App\\Models\\User', 392, 'auth_token', 'e7529e0c5f9db61af71cac0657b3a65abbf3b9710c23090caf25ad23a93b1e10', '[\"*\"]', '2022-11-05 09:07:29', '2022-11-05 09:07:27', '2022-11-05 09:07:29'),
(581, 'App\\Models\\User', 480, 'auth_token', '09b881a6ea62f65790eaec9e21e78e614dd558b4e3781d18ef0c68f1fb51c2b5', '[\"*\"]', NULL, '2022-11-05 09:07:41', '2022-11-05 09:07:41'),
(582, 'App\\Models\\User', 480, 'auth_token', '9f5d3835c6c26508d3aca90191a86434d79af81fd29aa1c49d37e1c408216bb3', '[\"*\"]', '2022-11-05 09:16:52', '2022-11-05 09:07:41', '2022-11-05 09:16:52'),
(583, 'App\\Models\\User', 392, 'auth_token', 'f1279faf132b2ac0e164005584da57a94739469105b59db5282605244fb8eb94', '[\"*\"]', NULL, '2022-11-05 09:16:57', '2022-11-05 09:16:57'),
(584, 'App\\Models\\User', 392, 'auth_token', 'ce3089f5dab8a3247ee06c1a416c8cc0901c2dc088564fc3c154f935c7724698', '[\"*\"]', '2022-11-05 09:25:20', '2022-11-05 09:16:57', '2022-11-05 09:25:20'),
(585, 'App\\Models\\User', 480, 'auth_token', '4b718cec2e12719bd34772b648b4be2753f0d6663d1d08747cd3252e1ae1eba0', '[\"*\"]', NULL, '2022-11-05 09:27:33', '2022-11-05 09:27:33'),
(586, 'App\\Models\\User', 480, 'auth_token', 'f9dd4cb208ea17ecd873d2209310657cfc67162d854441969ade58800031e9f0', '[\"*\"]', '2022-11-05 09:28:29', '2022-11-05 09:27:33', '2022-11-05 09:28:29'),
(587, 'App\\Models\\User', 392, 'auth_token', 'f531f4a913ca7f4ad1348b390dbe9167490869c043722e29ae43b41281ceae8d', '[\"*\"]', NULL, '2022-11-05 09:30:46', '2022-11-05 09:30:46'),
(588, 'App\\Models\\User', 392, 'auth_token', '745096d2719126c89c0bed3d178d5793194b42e1fa26d7656b06b514c755897b', '[\"*\"]', '2022-11-05 11:16:06', '2022-11-05 09:30:46', '2022-11-05 11:16:06'),
(589, 'App\\Models\\User', 480, 'auth_token', 'bfff2fc20261cbee1e87f70cd45b2ba5ae8745cec74dfd79f8d1a8d434bbd8e2', '[\"*\"]', NULL, '2022-11-05 11:25:46', '2022-11-05 11:25:46'),
(590, 'App\\Models\\User', 480, 'auth_token', '12ab5f50a5d5c4c1dbe3f596fe7e991052c8fb88d04ee178d892f5c93b950831', '[\"*\"]', '2022-11-08 04:13:13', '2022-11-05 11:25:46', '2022-11-08 04:13:13'),
(591, 'App\\Models\\User', 392, 'auth_token', 'b5fac55bfbd358bdedecc0daabc014bbe9864395684c8334191010f483d6c4cb', '[\"*\"]', NULL, '2022-11-08 04:13:22', '2022-11-08 04:13:22'),
(592, 'App\\Models\\User', 392, 'auth_token', 'da7147f611b77f907e2a934a45c7e86831d5756e741cdab1f9ab5d54751c6100', '[\"*\"]', '2022-11-08 04:15:03', '2022-11-08 04:13:23', '2022-11-08 04:15:03'),
(593, 'App\\Models\\User', 480, 'auth_token', 'cda6df9202e7155cefb5317678baa88812d8d64fce92e3f450ee0891b90c62aa', '[\"*\"]', NULL, '2022-11-08 04:15:09', '2022-11-08 04:15:09'),
(594, 'App\\Models\\User', 480, 'auth_token', '09c51122300e04f3e7d014395c3fab496d1bc2772997e65a4d6584d782fd8792', '[\"*\"]', '2022-11-08 04:17:48', '2022-11-08 04:15:09', '2022-11-08 04:17:48'),
(595, 'App\\Models\\User', 392, 'auth_token', '3f4ebec5bfd513d654b82c671e3c18f8c404fb157706bcbc0f689e3032500a89', '[\"*\"]', NULL, '2022-11-08 04:18:02', '2022-11-08 04:18:02'),
(596, 'App\\Models\\User', 392, 'auth_token', 'c31e5fb3e98edb5ff5989919c2e8c57be675db848fcd44633a50d969fe762544', '[\"*\"]', '2022-11-08 04:18:16', '2022-11-08 04:18:02', '2022-11-08 04:18:16'),
(597, 'App\\Models\\User', 480, 'auth_token', '1a807bb06d29c9f306c1225921317e372398ee7a326e87ddc5a9adf173c12c02', '[\"*\"]', NULL, '2022-11-08 04:22:52', '2022-11-08 04:22:52'),
(598, 'App\\Models\\User', 480, 'auth_token', '150ecd512a70819ac3bbd8ba2f7f7d95536fdc23689033ac98047c8fcb53e710', '[\"*\"]', '2022-11-08 04:34:04', '2022-11-08 04:22:52', '2022-11-08 04:34:04'),
(599, 'App\\Models\\User', 392, 'auth_token', 'ce49df39537ee45539b034884e8418d7c076c18241ef494503f59f9eef032555', '[\"*\"]', NULL, '2022-11-08 04:34:26', '2022-11-08 04:34:26'),
(600, 'App\\Models\\User', 392, 'auth_token', 'b3bc25d2db0fb7e9ac63a9cba65a81236b084fa8eaf7a1e2bef4dc943e1a09a4', '[\"*\"]', '2022-11-08 04:53:00', '2022-11-08 04:34:26', '2022-11-08 04:53:00'),
(601, 'App\\Models\\User', 392, 'auth_token', 'c17839a6ae58c170174cbba435abdb2c5bfa35adb678f14f58d8947b7021d826', '[\"*\"]', NULL, '2022-11-08 04:57:10', '2022-11-08 04:57:10'),
(602, 'App\\Models\\User', 392, 'auth_token', '3d98bcdf411530b5e06ab109a734d8b4e1b88d96b4e4840345b38d1617e0a3da', '[\"*\"]', '2022-11-08 05:10:33', '2022-11-08 04:57:10', '2022-11-08 05:10:33'),
(603, 'App\\Models\\User', 28, 'auth_token', 'e8727f25caac48d742f9a2dca1adbbaea13501f832fdb52938bfa1fb7c913481', '[\"*\"]', NULL, '2022-11-08 05:03:44', '2022-11-08 05:03:44'),
(604, 'App\\Models\\User', 28, 'auth_token', 'd1185b533fad9ebcc1cb5218874e382b6287ff4f6e5d9ac8962fc47569c9d067', '[\"*\"]', NULL, '2022-11-08 05:03:44', '2022-11-08 05:03:44'),
(605, 'App\\Models\\User', 483, 'auth_token', '0fb714bc943f1b5ef217b833d42a0ff393760a415e8fc6065c74f320a9d3ca0b', '[\"*\"]', NULL, '2022-11-08 05:05:06', '2022-11-08 05:05:06'),
(606, 'App\\Models\\User', 483, 'auth_token', '8620dffe19743801fefa3b25b1e6cf72e559f50d65f7c499d4aa04815849cce3', '[\"*\"]', NULL, '2022-11-08 05:05:06', '2022-11-08 05:05:06'),
(607, 'App\\Models\\User', 483, 'auth_token', '861a61d61e0e89901b20799f099bda1430a60daa05b800b29b64a47674482d75', '[\"*\"]', NULL, '2022-11-08 05:05:26', '2022-11-08 05:05:26'),
(608, 'App\\Models\\User', 483, 'auth_token', 'ceb6f928656eeb9c28d5abeb7d173630f851fa466a5ffa16ebe159ff96c23ac3', '[\"*\"]', NULL, '2022-11-08 05:05:26', '2022-11-08 05:05:26'),
(609, 'App\\Models\\User', 483, 'auth_token', '4841281acce6d3e6080cdac7d83a42ddcd63c3296215b596a9a234f41b78c9e8', '[\"*\"]', NULL, '2022-11-08 05:06:06', '2022-11-08 05:06:06'),
(610, 'App\\Models\\User', 483, 'auth_token', 'b29051d3e5148fbdf289467b8071a2604e6026b32d49a91f73c6794d9c4745b8', '[\"*\"]', NULL, '2022-11-08 05:06:06', '2022-11-08 05:06:06'),
(611, 'App\\Models\\User', 28, 'auth_token', '058a84bc6bb68dea6e2fff5429920269f8b1868fa9ce8d8077aefe14194751fe', '[\"*\"]', NULL, '2022-11-08 05:06:46', '2022-11-08 05:06:46'),
(612, 'App\\Models\\User', 28, 'auth_token', '860163029334f43d7956a1af08374fb86361ab089ba7fff9dac1412a373620c7', '[\"*\"]', NULL, '2022-11-08 05:06:46', '2022-11-08 05:06:46'),
(613, 'App\\Models\\User', 28, 'auth_token', 'cb73139942fb97196cf75ce31dc4db9eaa3ed3cfd973e535cb7f6e12d9b42c9f', '[\"*\"]', NULL, '2022-11-08 05:10:49', '2022-11-08 05:10:49'),
(614, 'App\\Models\\User', 28, 'auth_token', 'f067d2d9dc91cb1e1e8e7c6f5a36dd41bb71243cb92a398ab37be79396800b03', '[\"*\"]', '2022-11-08 05:13:10', '2022-11-08 05:10:49', '2022-11-08 05:13:10'),
(615, 'App\\Models\\User', 483, 'auth_token', '4a0b9da710508ef121542c52666168ee563c1661d987140dc4a796596d78dbec', '[\"*\"]', NULL, '2022-11-08 05:13:52', '2022-11-08 05:13:52'),
(616, 'App\\Models\\User', 483, 'auth_token', 'f4e69e0b8f91a74b11baa6d5067062cdf6d06c348bacc73074846d29062c5fca', '[\"*\"]', '2022-11-08 05:18:40', '2022-11-08 05:13:52', '2022-11-08 05:18:40'),
(617, 'App\\Models\\User', 480, 'auth_token', '4e23fc0367b95321d85be7409f31cd82d62b239f05cc7a6cb5412348afeb5345', '[\"*\"]', NULL, '2022-11-08 05:18:52', '2022-11-08 05:18:52'),
(618, 'App\\Models\\User', 480, 'auth_token', '250ffce2fb51f7d99773bd1197b38826350433c1006cdd5784deb211ef6b2d3c', '[\"*\"]', '2022-11-09 03:58:52', '2022-11-08 05:18:52', '2022-11-09 03:58:52'),
(619, 'App\\Models\\User', 28, 'auth_token', 'f34fc3f07be987908193c28099af3032974a50756ca83245cc5c34d757c368d1', '[\"*\"]', NULL, '2022-11-08 06:38:06', '2022-11-08 06:38:06'),
(620, 'App\\Models\\User', 28, 'auth_token', 'f783e181e44680f11535f9cd164145bb840313ffad8a6ee99d0547be50b1eb07', '[\"*\"]', '2022-11-14 10:24:56', '2022-11-08 06:38:06', '2022-11-14 10:24:56'),
(621, 'App\\Models\\User', 28, 'auth_token', 'b18a0b54713c2a16b3adf90da1db293b716fc8da1b7e3fdb57304cf936db289b', '[\"*\"]', NULL, '2022-11-09 03:59:13', '2022-11-09 03:59:13'),
(622, 'App\\Models\\User', 28, 'auth_token', '1b45d9c7c7cc0e5564125bc41639345ed058dd5b8d83579ecbb41fc721f53e90', '[\"*\"]', '2022-11-09 05:18:58', '2022-11-09 03:59:13', '2022-11-09 05:18:58'),
(623, 'App\\Models\\User', 480, 'auth_token', '718b84c7aee3021ba5c1e1a840801a1a9fc1e0c0ed5488de39c39cc5b68d8ec8', '[\"*\"]', NULL, '2022-11-09 05:19:09', '2022-11-09 05:19:09'),
(624, 'App\\Models\\User', 480, 'auth_token', '3e932fbb1f08c4c2262f4579f3c2d0ba3c6194d61215f4a9769a0c5d1fa35f53', '[\"*\"]', '2022-11-14 09:42:34', '2022-11-09 05:19:09', '2022-11-14 09:42:34'),
(625, 'App\\Models\\User', 28, 'auth_token', '6a69dd029b6d2c77fc8d0235263b206ac0cabd95aa4c9370942732514cc7e0a5', '[\"*\"]', NULL, '2022-11-14 07:05:11', '2022-11-14 07:05:11'),
(626, 'App\\Models\\User', 28, 'auth_token', '10b84b2c727171f59a9d2fb321fd504070d2a4aa56995e43a975dc9089309309', '[\"*\"]', NULL, '2022-11-14 07:05:11', '2022-11-14 07:05:11'),
(627, 'App\\Models\\User', 1, 'auth_token', '25568170962095d14b8c736d797da6653b3121eb0838c64a50daf9b88ce40deb', '[\"*\"]', NULL, '2022-11-14 07:07:07', '2022-11-14 07:07:07'),
(628, 'App\\Models\\User', 1, 'auth_token', '6517022215f63ffad9a48605c967afd46f0903522ae82e04b6437c7a56578e3d', '[\"*\"]', NULL, '2022-11-14 07:07:07', '2022-11-14 07:07:07'),
(629, 'App\\Models\\User', 392, 'auth_token', '0c2c5c0a072dbd412344f5cba2414a66b1b60d9df4564394198438541e76548a', '[\"*\"]', NULL, '2022-11-14 09:42:48', '2022-11-14 09:42:48'),
(630, 'App\\Models\\User', 392, 'auth_token', 'f46517c175e2b10267b600e2df643648d45cb6066efe1cb31c6dc2f1c6fdf64e', '[\"*\"]', '2022-11-14 09:42:58', '2022-11-14 09:42:48', '2022-11-14 09:42:58'),
(631, 'App\\Models\\User', 483, 'auth_token', '8d0eed273a0c7f5f14a632be28f4719c80491a00b5cdc9f5f8b073022f5826eb', '[\"*\"]', NULL, '2022-11-14 09:43:09', '2022-11-14 09:43:09'),
(632, 'App\\Models\\User', 483, 'auth_token', '0726d8b40f4311beada2e09a40d2e89d727182768d3960a04cd8cd2e0b202d87', '[\"*\"]', '2022-11-14 09:45:00', '2022-11-14 09:43:09', '2022-11-14 09:45:00'),
(633, 'App\\Models\\User', 480, 'auth_token', '3f7b4fafe71946db2732c56d26630f10066d31a7e5ecf2e7c6322e1cd7528d15', '[\"*\"]', NULL, '2022-11-14 09:45:11', '2022-11-14 09:45:11'),
(634, 'App\\Models\\User', 480, 'auth_token', '20ce52a1560fa8bb1cb49f7b3dae9ba5a563517ff03ade6b20b88c16abd76420', '[\"*\"]', '2022-11-16 08:49:26', '2022-11-14 09:45:11', '2022-11-16 08:49:26'),
(635, 'App\\Models\\User', 483, 'auth_token', '22f4f589cb0d31967055ae95eeaf905938af91c01343bf6ba2b65529c3f6b34d', '[\"*\"]', NULL, '2022-11-16 08:49:34', '2022-11-16 08:49:34'),
(636, 'App\\Models\\User', 483, 'auth_token', '34f6ca8b7974d625339aa4ecabcc52a2b0620e88eb2287a8c6974428440eb873', '[\"*\"]', '2022-11-17 11:38:33', '2022-11-16 08:49:34', '2022-11-17 11:38:33'),
(637, 'App\\Models\\User', 392, 'auth_token', '51beadbfe8d38d51627edf48a7f0133338f8b51c9f587e3cfccb9d72369829b3', '[\"*\"]', NULL, '2022-11-17 11:43:18', '2022-11-17 11:43:18'),
(638, 'App\\Models\\User', 392, 'auth_token', 'e3e68386f41e03df895c0f2f5d596352254245e60f3ae39528be370775c27ef6', '[\"*\"]', '2022-11-21 06:19:57', '2022-11-17 11:43:18', '2022-11-21 06:19:57'),
(639, 'App\\Models\\User', 483, 'auth_token', '2b654327b2604123d6a1f6054f8d102732b00b954f735e1e26ac30cca2fb0c50', '[\"*\"]', NULL, '2022-11-21 06:20:11', '2022-11-21 06:20:11'),
(640, 'App\\Models\\User', 483, 'auth_token', '11467c8b7cb25b2b1c52c4d56b930d02703478841ad35a9876dc7ef44d542459', '[\"*\"]', '2022-11-21 06:20:15', '2022-11-21 06:20:11', '2022-11-21 06:20:15'),
(641, 'App\\Models\\User', 392, 'auth_token', '86b4c1932a6c54b6bbc1f33b12e4bedd7d26c5726561055f6256f0ce3fd94bb9', '[\"*\"]', NULL, '2022-11-21 06:20:25', '2022-11-21 06:20:25'),
(642, 'App\\Models\\User', 392, 'auth_token', '3e6f34492da5c1e7688a5d5f5ad3f07f043b7ef005775244e0987f2609713489', '[\"*\"]', '2022-11-21 06:20:28', '2022-11-21 06:20:25', '2022-11-21 06:20:28'),
(643, 'App\\Models\\User', 480, 'auth_token', 'ef04f95d98591c33fc3c0bfd3e423a07066eb15c298bb0d88e0f907d9c8c9377', '[\"*\"]', NULL, '2022-11-21 06:20:39', '2022-11-21 06:20:39'),
(644, 'App\\Models\\User', 480, 'auth_token', '9702a871325a3e5a325a4fa5e89019ed15dc6547d2f4134d755f13d71e325bc8', '[\"*\"]', '2022-11-21 06:52:23', '2022-11-21 06:20:39', '2022-11-21 06:52:23'),
(645, 'App\\Models\\User', 483, 'auth_token', '61ca3fe7b4fe28ac7ce82e99f08d3d5f82c4aa9702d925a45e4037668808aa96', '[\"*\"]', NULL, '2022-11-21 06:59:13', '2022-11-21 06:59:13'),
(646, 'App\\Models\\User', 483, 'auth_token', '398d2e3b5eb9950bf69a711e93ef06cbb2bd7dd9e9cdb0906def7871a92bd5b6', '[\"*\"]', '2022-11-21 06:59:23', '2022-11-21 06:59:13', '2022-11-21 06:59:23'),
(647, 'App\\Models\\User', 480, 'auth_token', 'a0637e973c60c04813cb6cb82b6e626654fc2566e6fa1b7c801173cea41d11a4', '[\"*\"]', NULL, '2023-01-03 10:13:12', '2023-01-03 10:13:12'),
(648, 'App\\Models\\User', 480, 'auth_token', '7ddc14f26b02dfe094fbd8f13fd64ea324d64bfb0346904b47fb68938c2e1b6d', '[\"*\"]', NULL, '2023-01-03 10:13:12', '2023-01-03 10:13:12');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `project` varchar(255) DEFAULT NULL,
  `project_type` varchar(255) DEFAULT NULL,
  `project_name` varchar(255) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `project_phase` varchar(255) DEFAULT NULL,
  `project_amount` varchar(255) DEFAULT NULL,
  `start_date` varchar(255) DEFAULT NULL,
  `end_date` varchar(255) DEFAULT NULL,
  `project_location` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `t_stamp` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `project`, `project_type`, `project_name`, `client`, `project_phase`, `project_amount`, `start_date`, `end_date`, `project_location`, `description`, `status`, `t_stamp`, `deleted_at`, `created_at`, `updated_at`) VALUES
(139, 'Civil', 'Public Project', 'COVID CENTER AT KOZHIKODE SOUTH', '', 'Construction,', '', '', '', 'KOZHIKODE SOUTH', 'COVID CENTER NEAR KUTHIRAVATTAM, KOZHIKODE', 'Ongoing', '2022-06-14 05:40:36', NULL, NULL, NULL),
(140, 'Civil', 'Public Project', 'COVID CENTER AT KOZHIKODE NORTH', '', 'Construction,', '', '', '', 'MEDICAL COLLAGE,KOZHIKODE ', 'COVID ISSALATION WARD', 'Ongoing', '2022-06-14 05:49:48', NULL, NULL, NULL),
(141, 'Civil', 'Public Project', 'COVID CENTER AT KUTTYADY', '', 'Construction,', '', '', '', 'KUNNUMMAL, KUTTYADI', '', 'Ongoing', '2022-06-14 05:53:11', NULL, NULL, NULL),
(170, 'Civil', 'Residential Project', 'Project 1', '2', NULL, '220000', '2024/08/24', '2024/09/24', 'Mampatta, Mukkam', 'Testing', 'Ongoing', NULL, NULL, '2024-06-24 06:45:21', '2024-06-24 06:45:21'),
(171, 'Civil', 'Residential Project', 'Testing', '3', NULL, '2500', '2024/08/24', '2024/08/24', 'Mampatta, Mukkam', 'test', 'Ongoing', NULL, NULL, '2024-06-24 07:22:37', '2024-06-24 07:22:37'),
(172, 'Civil', 'Residential Project', 'Testing', '3', NULL, '2500', '2024/08/24', '2024/010/24', 'Mampatta, Mukkam', 'test', 'Ongoing', NULL, NULL, '2024-06-24 07:22:52', '2024-06-24 07:22:52'),
(173, 'Civil', 'Residential Project', 'Testing', '3', NULL, '2500', '2024/08/24', '2024/09/24', 'Mampatta, Mukkam', 'test', 'Ongoing', NULL, NULL, '2024-06-24 07:23:42', '2024-06-24 07:23:42');

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

CREATE TABLE `rates` (
  `id` int(11) NOT NULL,
  `client_code` varchar(100) DEFAULT NULL,
  `branch` varchar(100) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `rate8` varchar(100) NOT NULL,
  `rate12` varchar(100) NOT NULL,
  `cola` varchar(100) NOT NULL,
  `nd` varchar(100) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rates`
--

INSERT INTO `rates` (`id`, `client_code`, `branch`, `position`, `rate8`, `rate12`, `cola`, `nd`, `created_at`, `updated_at`) VALUES
(2, 'ALBEE', 'HO', 'GUARD', '67.12', '805.44', '0', '30', '2024-07-23 01:39:32.000000', '2024-07-23 01:39:32.000000');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `sss` varchar(100) DEFAULT NULL,
  `philhealth` varchar(100) DEFAULT NULL,
  `hdmf` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `sss`, `philhealth`, `hdmf`, `created_at`, `updated_at`) VALUES
(5, 'Admin', 'web', NULL, NULL, NULL, '2022-02-18 00:00:40', '2022-02-18 00:00:40'),
(6, 'Employee', 'web', NULL, NULL, NULL, '2022-02-18 00:03:33', '2022-02-18 00:03:33'),
(7, 'SubAdmin', 'web', NULL, NULL, NULL, '2022-02-18 00:03:50', '2024-05-07 00:11:01'),
(11, 'Super Admin', 'web', NULL, NULL, NULL, '2024-05-30 23:49:10', '2024-05-30 23:49:10'),
(14, 'GUARD', 'web', '0.25', '0.15', '0.35', '2024-07-23 06:31:09', '2024-07-23 06:31:09');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 5),
(1, 7),
(1, 11),
(2, 5),
(3, 5),
(3, 6),
(3, 7),
(3, 11),
(4, 5),
(4, 6),
(4, 7),
(5, 5),
(6, 5),
(7, 5),
(8, 5),
(9, 5),
(10, 5),
(11, 5),
(12, 5),
(13, 5),
(14, 5);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('fdvKoOZsV7cplf8Rd8XMmjKSKvQUzwxKHGLXvxLv', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid3duVWNYTjRmQ3U2YlZKYXIzMlg4RW9WTXR6aUZHdDBQZzFhWXNKYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3QvSFJNUy9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1717248660),
('z8gtVtnS8LUgeAk65vzmBVfHb1ekNBYPN7XbGJ1y', NULL, '188.50.175.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.34', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNlNFUGtnVXlTdGcxTFRwVlc1dzNuejZCMllydmNjUEN2UjFqNmlGdiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9jYXRlcmluZy5hZG94YXBwLmNvbS9sb2dpbiI7fX0=', 1638012527);

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `user_id`, `status`, `date`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 2, 'Out', '2022-08-11', NULL, '2022-03-10 11:58:39', '2022-08-11 09:30:40'),
(3, 2, 'In', '2022-04-15', NULL, '2022-03-16 10:16:45', '2022-04-15 19:11:51'),
(4, 3, 'Out', '2022-05-13', NULL, '2022-05-13 06:45:52', '2022-05-13 10:31:46'),
(5, 5, 'Out', '2022-06-08', NULL, '2022-05-13 12:29:11', '2022-06-08 16:49:55'),
(6, 9, 'Out', '2022-05-16', NULL, '2022-05-16 11:06:31', '2022-05-16 11:07:23'),
(7, 22, 'Out', '2022-05-23', NULL, '2022-05-23 09:00:18', '2022-05-23 09:09:17'),
(8, 17, 'Out', '2022-05-30', NULL, '2022-05-23 09:06:46', '2022-05-30 11:20:44'),
(9, 28, 'Out', '2022-11-09', NULL, '2022-05-24 09:35:01', '2022-11-09 04:21:05'),
(10, 29, 'Out', '2022-05-24', NULL, '2022-05-24 10:06:59', '2022-05-24 12:23:02'),
(11, 16, 'Out', '2022-08-15', NULL, '2022-05-24 13:33:32', '2022-08-15 14:57:06'),
(12, 30, 'Out', '2022-05-24', NULL, '2022-05-24 18:55:29', '2022-05-24 18:57:43'),
(13, 32, 'Out', '2022-05-30', NULL, '2022-05-30 05:40:29', '2022-05-30 08:14:50'),
(14, 33, 'In', '2022-05-30', NULL, '2022-05-30 12:22:28', '2022-05-30 12:22:28'),
(15, 26, 'in', '25-06-2022', NULL, '2022-06-23 11:13:56', '2022-06-23 11:13:56'),
(16, 392, 'In', '2022-11-21', NULL, '2022-09-22 10:08:24', '2022-11-21 06:19:45'),
(17, 480, 'Out', '2022-11-14', NULL, '2022-09-22 10:10:25', '2022-11-14 09:40:42'),
(18, 483, 'In', '2022-11-21', NULL, '2022-11-08 05:18:34', '2022-11-21 06:20:15');

-- --------------------------------------------------------

--
-- Table structure for table `sticky_notes`
--

CREATE TABLE `sticky_notes` (
  `id` bigint(50) NOT NULL,
  `user_id` int(200) NOT NULL,
  `sticky_notes` varchar(200) NOT NULL,
  `date` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sticky_notes`
--

INSERT INTO `sticky_notes` (`id`, `user_id`, `sticky_notes`, `date`, `created_at`, `updated_at`) VALUES
(1, 2, '[{\"notes\":\"Testing note 1\"},{\"notes\":\"Need to work on project tesla and need to ga through project second one\"},{\"notes\":\"Deliver product at station 8\"},{\"notes\":\"Deliver product at station 10\"}]', '30-03-2022', '2022-03-30 07:53:36', '2022-03-30 12:53:36'),
(2, 2, '[{\"notes\":\"Deliver product at station 10\"},{\"notes\":\"list of data to be done Deliver product at station 2\"}]', '31-03-2022', '2022-03-30 07:55:38', '2022-03-30 12:55:38'),
(5, 2, '[{\"notes\":\"Testing date adding notes\",\"date\":\"01-03-2022\"}]', '01-03-2022', '2022-03-30 14:54:25', '2022-03-30 14:54:25'),
(6, 2, '[{\"notes\":\"Testing Server\",\"date\":\"29-04-2022\"}]', '29-04-2022', '2022-04-02 11:27:24', '2022-04-02 11:27:24'),
(7, 2, '[{\"notes\":\"Testing server adding sticky notes and server issue checking\",\"date\":\"03-04-2022\"}]', '03-04-2022', '2022-04-02 11:27:54', '2022-04-02 11:27:54'),
(8, 2, '[{\"notes\":\"Testing sticky note adding after changing URL\",\"date\":\"07-04-2022\"}]', '07-04-2022', '2022-04-07 04:53:22', '2022-04-07 04:53:22'),
(9, 2, '[{\"notes\":\"Testing Sticky notes\",\"date\":\"27-04-2022\"}]', '27-04-2022', '2022-04-27 10:37:46', '2022-04-27 10:37:46'),
(10, 2, '[{\"notes\":null,\"date\":\"12-05-2022\"}]', '12-05-2022', '2022-05-12 14:52:17', '2022-05-12 14:52:17'),
(11, 2, '[{\"notes\":\"Hiii\",\"date\":\"23-06-2022\"}]', '23-06-2022', '2022-06-23 12:11:32', '2022-06-23 12:11:32');

-- --------------------------------------------------------

--
-- Table structure for table `timesheets`
--

CREATE TABLE `timesheets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` varchar(255) NOT NULL,
  `log` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `time` varchar(200) DEFAULT NULL,
  `latitude` varchar(200) DEFAULT NULL,
  `longitude` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `timesheets`
--

INSERT INTO `timesheets` (`id`, `user_id`, `date`, `log`, `created_at`, `updated_at`, `time`, `latitude`, `longitude`) VALUES
(1, 480, '2022-11-14', '[{\"status\":\"In\",\"time\":\"2022-11-14T09:33:31.161Z\",\"latitude\":11.3160602000000007905100574134849011898040771484375,\"longitude\":75.9980666999999954214217723347246646881103515625},{\"status\":\"Out\",\"time\":\"2022-11-14T09:40:40.238Z\",\"latitude\":11.3160605000000007436256055370904505252838134765625,\"longitude\":75.99806680000000369545887224376201629638671875}]', '2022-11-14 09:33:33', '2022-11-14 09:40:42', '2022-11-14T09:40:40.238Z', '11.3160605', '75.9980668'),
(3, 483, '2022-11-14', '[{\"status\":\"In\",\"time\":\"2022-11-14T09:43:11.694Z\",\"latitude\":11.3160605000000007436256055370904505252838134765625,\"longitude\":75.99806680000000369545887224376201629638671875},{\"status\":\"Out\",\"time\":\"2022-11-14T09:44:55.696Z\",\"latitude\":11.3160605000000007436256055370904505252838134765625,\"longitude\":75.99806680000000369545887224376201629638671875}]', '2022-11-14 09:43:13', '2022-11-14 09:44:58', '2022-11-14T09:44:55.696Z', '11.3160605', '75.9980668'),
(4, 392, '2022-11-21', '[{\"status\":\"In\",\"time\":\"2022-11-21T06:19:42.681Z\",\"latitude\":11.3160620000000005092033461551181972026824951171875,\"longitude\":75.99806680000000369545887224376201629638671875}]', '2022-11-21 06:19:45', '2022-11-21 06:19:45', '2022-11-21T06:19:42.681Z', '11.316062', '75.9980668'),
(5, 483, '2022-11-21', '[{\"status\":\"In\",\"time\":\"2022-11-21T06:20:12.237Z\",\"latitude\":11.3160620000000005092033461551181972026824951171875,\"longitude\":75.99806680000000369545887224376201629638671875}]', '2022-11-21 06:20:15', '2022-11-21 06:20:15', '2022-11-21T06:20:12.237Z', '11.316062', '75.9980668');

-- --------------------------------------------------------

--
-- Table structure for table `track_employees`
--

CREATE TABLE `track_employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `location` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `track_employees`
--

INSERT INTO `track_employees` (`id`, `user_id`, `location`, `date`, `created_at`, `updated_at`) VALUES
(1, 2, '{\"time\":\"2022-05-11T12:09:09.071Z\",\"latitude\":11.316813333333334,\"longitude\":75.99809166666667}', '11-05-2022', '2022-05-11 12:09:09', '2022-05-11 12:09:09'),
(2, 2, '{\"time\":\"2022-05-11T12:09:09.085Z\",\"latitude\":11.316813333333334,\"longitude\":75.99809166666667}', '11-05-2022', '2022-05-11 12:09:09', '2022-05-11 12:09:09'),
(3, 2, '{\"time\":\"2022-05-11T12:09:09.119Z\",\"latitude\":26.2971283,\"longitude\":50.2052779}', '11-05-2022', '2022-05-11 12:09:09', '2022-05-11 12:09:09'),
(4, 2, '{\"time\":\"2022-05-12T14:37:59.413Z\",\"latitude\":24.699538333333333,\"longitude\":46.70830833333333}', '12-05-2022', '2022-05-12 14:38:00', '2022-05-12 14:38:00'),
(5, 2, '{\"time\":\"2022-05-12T14:38:36.663Z\",\"latitude\":24.699493333333333,\"longitude\":46.708336666666675}', '12-05-2022', '2022-05-12 14:38:38', '2022-05-12 14:38:38'),
(6, 2, '{\"time\":\"2022-05-12T14:48:11.370Z\",\"latitude\":24.699540000000002,\"longitude\":46.70805833333334}', '12-05-2022', '2022-05-12 14:48:13', '2022-05-12 14:48:13'),
(7, 2, '{\"time\":\"2022-05-12T14:51:06.038Z\",\"latitude\":24.6995373,\"longitude\":46.7083389}', '12-05-2022', '2022-05-12 14:51:07', '2022-05-12 14:51:07'),
(8, 2, '{\"time\":\"2022-05-12T19:26:25.221Z\",\"latitude\":24.665633061760797,\"longitude\":46.70442003761688}', '12-05-2022', '2022-05-12 19:26:25', '2022-05-12 19:26:25'),
(9, 2, '{\"time\":\"2022-05-12T19:26:25.215Z\",\"latitude\":24.665633061760797,\"longitude\":46.70442003761688}', '12-05-2022', '2022-05-12 19:26:25', '2022-05-12 19:26:25'),
(10, 2, '{\"time\":\"2022-05-12T19:26:26.170Z\",\"latitude\":24.665636302823376,\"longitude\":46.70439134879743}', '12-05-2022', '2022-05-12 19:26:25', '2022-05-12 19:26:25'),
(11, 2, '{\"time\":\"2022-05-12T19:27:30.956Z\",\"latitude\":24.665687034832704,\"longitude\":46.704456342303146}', '12-05-2022', '2022-05-12 19:27:30', '2022-05-12 19:27:30'),
(12, 2, '{\"time\":\"2022-05-12T19:27:30.964Z\",\"latitude\":24.665687034832704,\"longitude\":46.704456342303146}', '12-05-2022', '2022-05-12 19:27:30', '2022-05-12 19:27:30'),
(14, 5, '{\"time\":\"2022-05-13T12:29:24.710Z\",\"latitude\":24.665591057020475,\"longitude\":46.70446804189374}', '13-05-2022', '2022-05-13 12:29:24', '2022-05-13 12:29:24'),
(15, 5, '{\"time\":\"2022-05-13T12:29:24.701Z\",\"latitude\":24.665591057020475,\"longitude\":46.70446804189374}', '13-05-2022', '2022-05-13 12:29:24', '2022-05-13 12:29:24'),
(16, 5, '{\"time\":\"2022-05-13T12:29:25.545Z\",\"latitude\":24.665874140624968,\"longitude\":46.70423594408786}', '13-05-2022', '2022-05-13 12:29:25', '2022-05-13 12:29:25'),
(17, 5, '{\"time\":\"2022-05-13T12:29:35.953Z\",\"latitude\":24.665507654086475,\"longitude\":46.70435050076943}', '13-05-2022', '2022-05-13 12:29:37', '2022-05-13 12:29:37'),
(18, 5, '{\"time\":\"2022-05-13T12:29:45.954Z\",\"latitude\":24.665554877910534,\"longitude\":46.70436444336528}', '13-05-2022', '2022-05-13 12:29:46', '2022-05-13 12:29:46'),
(19, 5, '{\"time\":\"2022-05-13T12:29:56.005Z\",\"latitude\":24.665554877910534,\"longitude\":46.70436444336528}', '13-05-2022', '2022-05-13 12:29:56', '2022-05-13 12:29:56'),
(20, 5, '{\"time\":\"2022-05-13T12:30:05.955Z\",\"latitude\":24.665554877910534,\"longitude\":46.70436444336528}', '13-05-2022', '2022-05-13 12:30:06', '2022-05-13 12:30:06'),
(21, 5, '{\"time\":\"2022-05-13T12:30:15.896Z\",\"latitude\":24.665560287696024,\"longitude\":46.704376983627505}', '13-05-2022', '2022-05-13 12:30:16', '2022-05-13 12:30:16'),
(22, 5, '{\"time\":\"2022-05-13T12:30:25.843Z\",\"latitude\":24.665574184922576,\"longitude\":46.7043727671721}', '13-05-2022', '2022-05-13 12:30:26', '2022-05-13 12:30:26'),
(23, 5, '{\"time\":\"2022-05-13T12:30:35.859Z\",\"latitude\":24.665586730000655,\"longitude\":46.704372590739325}', '13-05-2022', '2022-05-13 12:30:35', '2022-05-13 12:30:35'),
(24, 5, '{\"time\":\"2022-05-13T12:30:45.842Z\",\"latitude\":24.66557293527504,\"longitude\":46.70433848691236}', '13-05-2022', '2022-05-13 12:30:46', '2022-05-13 12:30:46'),
(25, 5, '{\"time\":\"2022-05-13T12:30:55.849Z\",\"latitude\":24.665571560716074,\"longitude\":46.7043364288239}', '13-05-2022', '2022-05-13 12:30:56', '2022-05-13 12:30:56'),
(26, 5, '{\"time\":\"2022-05-13T12:31:05.934Z\",\"latitude\":24.665569532085602,\"longitude\":46.7043304012992}', '13-05-2022', '2022-05-13 12:31:06', '2022-05-13 12:31:06'),
(27, 5, '{\"time\":\"2022-05-13T12:31:15.921Z\",\"latitude\":24.66556347109958,\"longitude\":46.70434014157962}', '13-05-2022', '2022-05-13 12:31:16', '2022-05-13 12:31:16'),
(28, 5, '{\"time\":\"2022-05-13T12:31:26.005Z\",\"latitude\":24.665563605587266,\"longitude\":46.7043412906162}', '13-05-2022', '2022-05-13 12:31:26', '2022-05-13 12:31:26'),
(29, 5, '{\"time\":\"2022-05-13T12:31:35.994Z\",\"latitude\":24.665564856081655,\"longitude\":46.70433920727837}', '13-05-2022', '2022-05-13 12:31:36', '2022-05-13 12:31:36'),
(30, 5, '{\"time\":\"2022-05-13T12:31:45.976Z\",\"latitude\":24.665563569278337,\"longitude\":46.704316201601905}', '13-05-2022', '2022-05-13 12:31:46', '2022-05-13 12:31:46'),
(31, 5, '{\"time\":\"2022-05-13T12:31:55.994Z\",\"latitude\":24.665544286105188,\"longitude\":46.70431530675425}', '13-05-2022', '2022-05-13 12:31:57', '2022-05-13 12:31:57'),
(32, 5, '{\"time\":\"2022-05-13T12:32:05.996Z\",\"latitude\":24.66554774853823,\"longitude\":46.704316818102946}', '13-05-2022', '2022-05-13 12:32:07', '2022-05-13 12:32:07'),
(33, 5, '{\"time\":\"2022-05-13T12:32:15.995Z\",\"latitude\":24.66555966515594,\"longitude\":46.70432889351953}', '13-05-2022', '2022-05-13 12:32:16', '2022-05-13 12:32:16'),
(34, 5, '{\"time\":\"2022-05-13T12:32:25.966Z\",\"latitude\":24.665577629587414,\"longitude\":46.70434105033115}', '13-05-2022', '2022-05-13 12:32:28', '2022-05-13 12:32:28'),
(35, 5, '{\"time\":\"2022-05-13T12:32:35.994Z\",\"latitude\":24.665583399762358,\"longitude\":46.704335961649306}', '13-05-2022', '2022-05-13 12:32:37', '2022-05-13 12:32:37'),
(36, 5, '{\"time\":\"2022-05-13T12:32:45.911Z\",\"latitude\":24.665559811735346,\"longitude\":46.70434005361649}', '13-05-2022', '2022-05-13 12:32:45', '2022-05-13 12:32:45'),
(37, 5, '{\"time\":\"2022-05-13T12:32:55.926Z\",\"latitude\":24.665566738827977,\"longitude\":46.704348765232076}', '13-05-2022', '2022-05-13 12:32:56', '2022-05-13 12:32:56'),
(38, 5, '{\"time\":\"2022-05-13T12:33:05.977Z\",\"latitude\":24.66558454770669,\"longitude\":46.70436032484226}', '13-05-2022', '2022-05-13 12:33:06', '2022-05-13 12:33:06'),
(39, 5, '{\"time\":\"2022-05-13T12:33:16.000Z\",\"latitude\":24.665595117459212,\"longitude\":46.70436291139973}', '13-05-2022', '2022-05-13 12:33:19', '2022-05-13 12:33:19'),
(40, 5, '{\"time\":\"2022-05-13T12:33:25.919Z\",\"latitude\":24.665597766351386,\"longitude\":46.70436089577549}', '13-05-2022', '2022-05-13 12:33:26', '2022-05-13 12:33:26'),
(41, 5, '{\"time\":\"2022-05-13T12:33:35.955Z\",\"latitude\":24.665598032968596,\"longitude\":46.704367075692964}', '13-05-2022', '2022-05-13 12:33:36', '2022-05-13 12:33:36'),
(42, 5, '{\"time\":\"2022-05-13T12:33:45.876Z\",\"latitude\":24.665560839439536,\"longitude\":46.70436231634702}', '13-05-2022', '2022-05-13 12:33:45', '2022-05-13 12:33:45'),
(43, 5, '{\"time\":\"2022-05-13T12:33:55.895Z\",\"latitude\":24.66555947743437,\"longitude\":46.70436309690201}', '13-05-2022', '2022-05-13 12:33:56', '2022-05-13 12:33:56'),
(44, 5, '{\"time\":\"2022-05-13T12:34:05.922Z\",\"latitude\":24.6655668227109,\"longitude\":46.70436361263042}', '13-05-2022', '2022-05-13 12:34:07', '2022-05-13 12:34:07'),
(45, 5, '{\"time\":\"2022-05-13T12:34:15.872Z\",\"latitude\":24.665567559363968,\"longitude\":46.70436239203682}', '13-05-2022', '2022-05-13 12:34:16', '2022-05-13 12:34:16'),
(46, 5, '{\"time\":\"2022-05-13T12:34:25.924Z\",\"latitude\":24.665520927005584,\"longitude\":46.70434256296944}', '13-05-2022', '2022-05-13 12:34:28', '2022-05-13 12:34:28'),
(47, 5, '{\"time\":\"2022-05-13T12:34:35.999Z\",\"latitude\":24.665511620394312,\"longitude\":46.70433143492047}', '13-05-2022', '2022-05-13 12:34:37', '2022-05-13 12:34:37'),
(48, 5, '{\"time\":\"2022-05-13T12:34:45.900Z\",\"latitude\":24.66551545803291,\"longitude\":46.70433648296845}', '13-05-2022', '2022-05-13 12:34:45', '2022-05-13 12:34:45'),
(49, 5, '{\"time\":\"2022-05-13T12:34:55.983Z\",\"latitude\":24.66551588290154,\"longitude\":46.70433898718039}', '13-05-2022', '2022-05-13 12:34:58', '2022-05-13 12:34:58'),
(50, 5, '{\"time\":\"2022-05-13T12:35:05.912Z\",\"latitude\":24.66550525701615,\"longitude\":46.704327968711645}', '13-05-2022', '2022-05-13 12:35:06', '2022-05-13 12:35:06'),
(51, 5, '{\"time\":\"2022-05-13T12:35:15.977Z\",\"latitude\":24.665503251188497,\"longitude\":46.704329616808906}', '13-05-2022', '2022-05-13 12:35:16', '2022-05-13 12:35:16'),
(52, 5, '{\"time\":\"2022-05-13T12:35:25.893Z\",\"latitude\":24.665516012827712,\"longitude\":46.70433339744012}', '13-05-2022', '2022-05-13 12:35:26', '2022-05-13 12:35:26'),
(53, 5, '{\"time\":\"2022-05-13T12:35:35.886Z\",\"latitude\":24.66551730872541,\"longitude\":46.70433483874861}', '13-05-2022', '2022-05-13 12:35:37', '2022-05-13 12:35:37'),
(54, 5, '{\"time\":\"2022-05-13T12:35:45.983Z\",\"latitude\":24.665499719215983,\"longitude\":46.70437558749749}', '13-05-2022', '2022-05-13 12:35:46', '2022-05-13 12:35:46'),
(55, 5, '{\"time\":\"2022-05-13T12:35:55.959Z\",\"latitude\":24.665425995897397,\"longitude\":46.70439650506675}', '13-05-2022', '2022-05-13 12:35:57', '2022-05-13 12:35:57'),
(56, 5, '{\"time\":\"2022-05-13T12:36:05.911Z\",\"latitude\":24.66538240628168,\"longitude\":46.70441200877323}', '13-05-2022', '2022-05-13 12:36:05', '2022-05-13 12:36:05'),
(57, 5, '{\"time\":\"2022-05-13T12:36:15.885Z\",\"latitude\":24.665392519907392,\"longitude\":46.704445854167474}', '13-05-2022', '2022-05-13 12:36:16', '2022-05-13 12:36:16'),
(58, 5, '{\"time\":\"2022-05-13T12:36:25.913Z\",\"latitude\":24.66537575456346,\"longitude\":46.704405145190194}', '13-05-2022', '2022-05-13 12:36:26', '2022-05-13 12:36:26'),
(59, 5, '{\"time\":\"2022-05-13T12:36:35.954Z\",\"latitude\":24.665451701304676,\"longitude\":46.704436807589865}', '13-05-2022', '2022-05-13 12:36:36', '2022-05-13 12:36:36'),
(60, 5, '{\"time\":\"2022-05-13T12:36:45.951Z\",\"latitude\":24.665480192622038,\"longitude\":46.70444477639911}', '13-05-2022', '2022-05-13 12:36:47', '2022-05-13 12:36:47'),
(61, 5, '{\"time\":\"2022-05-13T12:36:55.983Z\",\"latitude\":24.665497726063503,\"longitude\":46.70441493094458}', '13-05-2022', '2022-05-13 12:36:56', '2022-05-13 12:36:56'),
(62, 5, '{\"time\":\"2022-05-13T12:37:05.968Z\",\"latitude\":24.665526572331814,\"longitude\":46.70441129478322}', '13-05-2022', '2022-05-13 12:37:09', '2022-05-13 12:37:09'),
(63, 5, '{\"time\":\"2022-05-13T12:37:15.920Z\",\"latitude\":24.665527917058807,\"longitude\":46.704401772541935}', '13-05-2022', '2022-05-13 12:37:16', '2022-05-13 12:37:16'),
(64, 5, '{\"time\":\"2022-05-13T12:37:25.920Z\",\"latitude\":24.665519575788675,\"longitude\":46.70439275458284}', '13-05-2022', '2022-05-13 12:37:26', '2022-05-13 12:37:26'),
(65, 5, '{\"time\":\"2022-05-13T12:37:36.019Z\",\"latitude\":24.6655213647469,\"longitude\":46.70437320587375}', '13-05-2022', '2022-05-13 12:37:37', '2022-05-13 12:37:37'),
(66, 5, '{\"time\":\"2022-05-13T12:37:45.970Z\",\"latitude\":24.66548475372362,\"longitude\":46.70435320040657}', '13-05-2022', '2022-05-13 12:37:48', '2022-05-13 12:37:48'),
(67, 5, '{\"time\":\"2022-05-13T12:37:55.905Z\",\"latitude\":24.66549400916939,\"longitude\":46.704370153927734}', '13-05-2022', '2022-05-13 12:37:56', '2022-05-13 12:37:56'),
(68, 5, '{\"time\":\"2022-05-13T12:38:05.949Z\",\"latitude\":24.66549527429497,\"longitude\":46.704371229472}', '13-05-2022', '2022-05-13 12:38:08', '2022-05-13 12:38:08'),
(69, 5, '{\"time\":\"2022-05-13T12:38:15.968Z\",\"latitude\":24.665494019507154,\"longitude\":46.7043761515145}', '13-05-2022', '2022-05-13 12:38:16', '2022-05-13 12:38:16'),
(70, 5, '{\"time\":\"2022-05-13T12:38:25.855Z\",\"latitude\":24.665494457747645,\"longitude\":46.704380623084774}', '13-05-2022', '2022-05-13 12:38:25', '2022-05-13 12:38:25'),
(71, 5, '{\"time\":\"2022-05-13T12:38:35.924Z\",\"latitude\":24.665472023236923,\"longitude\":46.70441074847182}', '13-05-2022', '2022-05-13 12:38:36', '2022-05-13 12:38:36'),
(72, 5, '{\"time\":\"2022-05-13T12:38:45.889Z\",\"latitude\":24.665492030997928,\"longitude\":46.70442104697994}', '13-05-2022', '2022-05-13 12:38:47', '2022-05-13 12:38:47'),
(73, 5, '{\"time\":\"2022-05-13T12:38:55.933Z\",\"latitude\":24.6654975743332,\"longitude\":46.704407725830215}', '13-05-2022', '2022-05-13 12:38:56', '2022-05-13 12:38:56'),
(74, 5, '{\"time\":\"2022-05-13T12:39:05.882Z\",\"latitude\":24.665524150085975,\"longitude\":46.704371630461814}', '13-05-2022', '2022-05-13 12:39:05', '2022-05-13 12:39:05'),
(75, 5, '{\"time\":\"2022-05-13T12:39:15.859Z\",\"latitude\":24.665541309851474,\"longitude\":46.70438588536369}', '13-05-2022', '2022-05-13 12:39:16', '2022-05-13 12:39:16'),
(76, 5, '{\"time\":\"2022-05-13T12:39:25.927Z\",\"latitude\":24.665540795864647,\"longitude\":46.70439379023446}', '13-05-2022', '2022-05-13 12:39:25', '2022-05-13 12:39:25'),
(77, 5, '{\"time\":\"2022-05-13T12:39:35.955Z\",\"latitude\":24.665510002384746,\"longitude\":46.704366048960885}', '13-05-2022', '2022-05-13 12:39:37', '2022-05-13 12:39:37'),
(78, 5, '{\"time\":\"2022-05-13T12:39:45.910Z\",\"latitude\":24.665474688380097,\"longitude\":46.70438103853695}', '13-05-2022', '2022-05-13 12:39:46', '2022-05-13 12:39:46'),
(79, 5, '{\"time\":\"2022-05-13T12:39:55.928Z\",\"latitude\":24.66547946423053,\"longitude\":46.70440780201732}', '13-05-2022', '2022-05-13 12:39:56', '2022-05-13 12:39:56'),
(80, 5, '{\"time\":\"2022-05-13T12:40:05.912Z\",\"latitude\":24.66550535379307,\"longitude\":46.704366768963176}', '13-05-2022', '2022-05-13 12:40:06', '2022-05-13 12:40:06'),
(81, 5, '{\"time\":\"2022-05-13T12:40:15.992Z\",\"latitude\":24.66554309873198,\"longitude\":46.70440674195905}', '13-05-2022', '2022-05-13 12:40:16', '2022-05-13 12:40:16'),
(82, 5, '{\"time\":\"2022-05-13T12:40:25.963Z\",\"latitude\":24.66554403859578,\"longitude\":46.70439186610602}', '13-05-2022', '2022-05-13 12:40:26', '2022-05-13 12:40:26'),
(83, 5, '{\"time\":\"2022-05-13T12:40:35.887Z\",\"latitude\":24.66554370064947,\"longitude\":46.70436879540072}', '13-05-2022', '2022-05-13 12:40:37', '2022-05-13 12:40:37'),
(84, 5, '{\"time\":\"2022-05-13T12:40:45.868Z\",\"latitude\":24.665550847433035,\"longitude\":46.70435021597837}', '13-05-2022', '2022-05-13 12:40:46', '2022-05-13 12:40:46'),
(85, 5, '{\"time\":\"2022-05-13T12:40:55.943Z\",\"latitude\":24.665565164488363,\"longitude\":46.70433059195518}', '13-05-2022', '2022-05-13 12:40:56', '2022-05-13 12:40:56'),
(86, 5, '{\"time\":\"2022-05-13T12:41:05.981Z\",\"latitude\":24.665585633831647,\"longitude\":46.70438666780681}', '13-05-2022', '2022-05-13 12:41:06', '2022-05-13 12:41:06'),
(87, 5, '{\"time\":\"2022-05-13T12:41:16.028Z\",\"latitude\":24.665585672896874,\"longitude\":46.704406541887366}', '13-05-2022', '2022-05-13 12:41:16', '2022-05-13 12:41:16'),
(88, 5, '{\"time\":\"2022-05-13T12:41:25.969Z\",\"latitude\":24.66558239998632,\"longitude\":46.70440048222911}', '13-05-2022', '2022-05-13 12:41:28', '2022-05-13 12:41:28'),
(89, 5, '{\"time\":\"2022-05-13T12:41:36.000Z\",\"latitude\":24.66557916004211,\"longitude\":46.70440025428987}', '13-05-2022', '2022-05-13 12:41:36', '2022-05-13 12:41:36'),
(90, 5, '{\"time\":\"2022-05-13T12:41:45.953Z\",\"latitude\":24.665561447220437,\"longitude\":46.70439856517388}', '13-05-2022', '2022-05-13 12:41:46', '2022-05-13 12:41:46'),
(91, 5, '{\"time\":\"2022-05-13T12:41:55.951Z\",\"latitude\":24.665553617270064,\"longitude\":46.704392580671964}', '13-05-2022', '2022-05-13 12:41:57', '2022-05-13 12:41:57'),
(92, 5, '{\"time\":\"2022-05-13T12:42:06.000Z\",\"latitude\":24.665543411404215,\"longitude\":46.70438111640334}', '13-05-2022', '2022-05-13 12:42:06', '2022-05-13 12:42:06'),
(93, 5, '{\"time\":\"2022-05-13T12:42:15.884Z\",\"latitude\":24.665506777091256,\"longitude\":46.70437360947972}', '13-05-2022', '2022-05-13 12:42:16', '2022-05-13 12:42:16'),
(94, 5, '{\"time\":\"2022-05-13T12:42:25.965Z\",\"latitude\":24.66550709164607,\"longitude\":46.70437795843836}', '13-05-2022', '2022-05-13 12:42:26', '2022-05-13 12:42:26'),
(95, 5, '{\"time\":\"2022-05-13T12:42:35.929Z\",\"latitude\":24.6655064960312,\"longitude\":46.704380337218275}', '13-05-2022', '2022-05-13 12:42:36', '2022-05-13 12:42:36'),
(96, 5, '{\"time\":\"2022-05-13T12:42:45.960Z\",\"latitude\":24.66551042031707,\"longitude\":46.70438606297888}', '13-05-2022', '2022-05-13 12:42:47', '2022-05-13 12:42:47'),
(97, 5, '{\"time\":\"2022-05-13T12:42:55.869Z\",\"latitude\":24.665510128365824,\"longitude\":46.70439593822255}', '13-05-2022', '2022-05-13 12:42:55', '2022-05-13 12:42:55'),
(98, 5, '{\"time\":\"2022-05-13T12:43:05.993Z\",\"latitude\":24.665515333827834,\"longitude\":46.70440339341384}', '13-05-2022', '2022-05-13 12:43:06', '2022-05-13 12:43:06'),
(99, 5, '{\"time\":\"2022-05-13T12:43:15.985Z\",\"latitude\":24.665515611490385,\"longitude\":46.70440240424088}', '13-05-2022', '2022-05-13 12:43:17', '2022-05-13 12:43:17'),
(100, 5, '{\"time\":\"2022-05-13T12:43:25.994Z\",\"latitude\":24.665528309351824,\"longitude\":46.70440800535724}', '13-05-2022', '2022-05-13 12:43:26', '2022-05-13 12:43:26'),
(101, 5, '{\"time\":\"2022-05-13T12:43:35.956Z\",\"latitude\":24.665513912477824,\"longitude\":46.70441556982787}', '13-05-2022', '2022-05-13 12:43:36', '2022-05-13 12:43:36'),
(102, 5, '{\"time\":\"2022-05-13T12:43:45.996Z\",\"latitude\":24.665521070511964,\"longitude\":46.70442845872347}', '13-05-2022', '2022-05-13 12:43:47', '2022-05-13 12:43:47'),
(103, 5, '{\"time\":\"2022-05-13T12:43:55.919Z\",\"latitude\":24.665502559283254,\"longitude\":46.704427333254166}', '13-05-2022', '2022-05-13 12:43:58', '2022-05-13 12:43:58'),
(104, 5, '{\"time\":\"2022-05-13T12:44:05.967Z\",\"latitude\":24.665504636492678,\"longitude\":46.70442099396746}', '13-05-2022', '2022-05-13 12:44:06', '2022-05-13 12:44:06'),
(105, 5, '{\"time\":\"2022-05-13T12:44:15.990Z\",\"latitude\":24.665519774900034,\"longitude\":46.70441273367038}', '13-05-2022', '2022-05-13 12:44:16', '2022-05-13 12:44:16'),
(106, 5, '{\"time\":\"2022-05-13T12:44:25.936Z\",\"latitude\":24.665542735874496,\"longitude\":46.70440219343139}', '13-05-2022', '2022-05-13 12:44:26', '2022-05-13 12:44:26'),
(107, 5, '{\"time\":\"2022-05-13T12:44:35.984Z\",\"latitude\":24.665555020221273,\"longitude\":46.704403517675416}', '13-05-2022', '2022-05-13 12:44:36', '2022-05-13 12:44:36'),
(108, 5, '{\"time\":\"2022-05-13T12:44:46.006Z\",\"latitude\":24.66556166728698,\"longitude\":46.70441409787741}', '13-05-2022', '2022-05-13 12:44:46', '2022-05-13 12:44:46'),
(109, 5, '{\"time\":\"2022-05-13T12:44:55.959Z\",\"latitude\":24.66556304075162,\"longitude\":46.704409896527416}', '13-05-2022', '2022-05-13 12:44:56', '2022-05-13 12:44:56'),
(110, 5, '{\"time\":\"2022-05-13T12:45:05.990Z\",\"latitude\":24.665569585052324,\"longitude\":46.70440830617751}', '13-05-2022', '2022-05-13 12:45:07', '2022-05-13 12:45:07'),
(111, 5, '{\"time\":\"2022-05-13T12:45:15.979Z\",\"latitude\":24.665577742097035,\"longitude\":46.70441071369906}', '13-05-2022', '2022-05-13 12:45:16', '2022-05-13 12:45:16'),
(112, 5, '{\"time\":\"2022-05-13T12:45:25.920Z\",\"latitude\":24.665583127274385,\"longitude\":46.70441132714114}', '13-05-2022', '2022-05-13 12:45:26', '2022-05-13 12:45:26'),
(113, 5, '{\"time\":\"2022-05-13T12:45:35.945Z\",\"latitude\":24.665588830013366,\"longitude\":46.70440565511784}', '13-05-2022', '2022-05-13 12:45:36', '2022-05-13 12:45:36'),
(114, 5, '{\"time\":\"2022-05-13T12:45:45.961Z\",\"latitude\":24.665587099056406,\"longitude\":46.704414338137454}', '13-05-2022', '2022-05-13 12:45:47', '2022-05-13 12:45:47'),
(115, 5, '{\"time\":\"2022-05-13T12:45:55.960Z\",\"latitude\":24.66558184318306,\"longitude\":46.704426396475704}', '13-05-2022', '2022-05-13 12:45:57', '2022-05-13 12:45:57'),
(116, 5, '{\"time\":\"2022-05-13T12:46:05.935Z\",\"latitude\":24.665560940255737,\"longitude\":46.704422787344036}', '13-05-2022', '2022-05-13 12:46:06', '2022-05-13 12:46:06'),
(117, 5, '{\"time\":\"2022-05-13T12:46:19.963Z\",\"latitude\":24.665534917406916,\"longitude\":46.70438814666147}', '13-05-2022', '2022-05-13 12:46:21', '2022-05-13 12:46:21'),
(118, 5, '{\"time\":\"2022-05-13T12:46:30.887Z\",\"latitude\":24.665505284177478,\"longitude\":46.704374040436534}', '13-05-2022', '2022-05-13 12:46:30', '2022-05-13 12:46:30'),
(119, 5, '{\"time\":\"2022-05-13T12:46:40.938Z\",\"latitude\":24.665485536986477,\"longitude\":46.704395345660274}', '13-05-2022', '2022-05-13 12:46:42', '2022-05-13 12:46:42'),
(120, 5, '{\"time\":\"2022-05-13T12:46:50.995Z\",\"latitude\":24.665472756016808,\"longitude\":46.704419571866936}', '13-05-2022', '2022-05-13 12:46:51', '2022-05-13 12:46:51'),
(121, 5, '{\"time\":\"2022-05-13T12:47:00.997Z\",\"latitude\":24.665473634812574,\"longitude\":46.70440637554239}', '13-05-2022', '2022-05-13 12:47:01', '2022-05-13 12:47:01'),
(122, 5, '{\"time\":\"2022-05-13T12:47:10.967Z\",\"latitude\":24.665478345436142,\"longitude\":46.70435650360012}', '13-05-2022', '2022-05-13 12:47:11', '2022-05-13 12:47:11'),
(123, 5, '{\"time\":\"2022-05-13T12:47:20.967Z\",\"latitude\":24.665474571491362,\"longitude\":46.70442430992697}', '13-05-2022', '2022-05-13 12:47:21', '2022-05-13 12:47:21'),
(124, 5, '{\"time\":\"2022-05-13T12:47:30.982Z\",\"latitude\":24.665484654948497,\"longitude\":46.70444958734832}', '13-05-2022', '2022-05-13 12:47:32', '2022-05-13 12:47:32'),
(125, 5, '{\"time\":\"2022-05-13T12:47:40.976Z\",\"latitude\":24.665551920429586,\"longitude\":46.70442537916699}', '13-05-2022', '2022-05-13 12:47:42', '2022-05-13 12:47:42'),
(126, 5, '{\"time\":\"2022-05-13T12:47:50.949Z\",\"latitude\":24.665630778673766,\"longitude\":46.70439717311166}', '13-05-2022', '2022-05-13 12:47:51', '2022-05-13 12:47:51'),
(127, 5, '{\"time\":\"2022-05-13T12:48:01.048Z\",\"latitude\":24.665591083464314,\"longitude\":46.70438897087499}', '13-05-2022', '2022-05-13 12:48:02', '2022-05-13 12:48:02'),
(128, 5, '{\"time\":\"2022-05-13T12:48:11.017Z\",\"latitude\":24.665560774375315,\"longitude\":46.704410756459154}', '13-05-2022', '2022-05-13 12:48:12', '2022-05-13 12:48:12'),
(129, 5, '{\"time\":\"2022-05-13T12:48:21.014Z\",\"latitude\":24.665517770874686,\"longitude\":46.70445685599178}', '13-05-2022', '2022-05-13 12:48:22', '2022-05-13 12:48:22'),
(130, 5, '{\"time\":\"2022-05-13T12:48:31.021Z\",\"latitude\":24.665488102529373,\"longitude\":46.70443542512482}', '13-05-2022', '2022-05-13 12:48:32', '2022-05-13 12:48:32'),
(131, 5, '{\"time\":\"2022-05-13T12:48:41.006Z\",\"latitude\":24.66547038044595,\"longitude\":46.70444804563}', '13-05-2022', '2022-05-13 12:48:42', '2022-05-13 12:48:42'),
(132, 5, '{\"time\":\"2022-05-13T12:48:51.010Z\",\"latitude\":24.66545401452959,\"longitude\":46.70443896262698}', '13-05-2022', '2022-05-13 12:48:52', '2022-05-13 12:48:52'),
(133, 5, '{\"time\":\"2022-05-13T12:49:00.959Z\",\"latitude\":24.66543636218267,\"longitude\":46.704455974891445}', '13-05-2022', '2022-05-13 12:49:01', '2022-05-13 12:49:01'),
(134, 5, '{\"time\":\"2022-05-13T12:49:11.012Z\",\"latitude\":24.665397159309766,\"longitude\":46.70443136290638}', '13-05-2022', '2022-05-13 12:49:11', '2022-05-13 12:49:11'),
(135, 5, '{\"time\":\"2022-05-13T12:49:21.006Z\",\"latitude\":24.665399662850167,\"longitude\":46.7044548615933}', '13-05-2022', '2022-05-13 12:49:29', '2022-05-13 12:49:29'),
(136, 5, '{\"time\":\"2022-05-13T12:49:30.950Z\",\"latitude\":24.66540887444748,\"longitude\":46.70446679816328}', '13-05-2022', '2022-05-13 12:49:38', '2022-05-13 12:49:38'),
(137, 5, '{\"time\":\"2022-05-13T12:49:41.011Z\",\"latitude\":24.665424827797818,\"longitude\":46.704491645139136}', '13-05-2022', '2022-05-13 12:49:40', '2022-05-13 12:49:40'),
(138, 5, '{\"time\":\"2022-05-13T12:49:51.009Z\",\"latitude\":24.66543795034236,\"longitude\":46.704489165437444}', '13-05-2022', '2022-05-13 12:49:51', '2022-05-13 12:49:51'),
(139, 5, '{\"time\":\"2022-05-13T12:50:00.957Z\",\"latitude\":24.665436496251566,\"longitude\":46.7045046439711}', '13-05-2022', '2022-05-13 12:50:01', '2022-05-13 12:50:01'),
(140, 5, '{\"time\":\"2022-05-13T12:50:10.950Z\",\"latitude\":24.665433928830755,\"longitude\":46.70452787847611}', '13-05-2022', '2022-05-13 12:50:13', '2022-05-13 12:50:13'),
(141, 5, '{\"time\":\"2022-05-13T12:50:21.008Z\",\"latitude\":24.66543352602161,\"longitude\":46.70448185215241}', '13-05-2022', '2022-05-13 12:50:22', '2022-05-13 12:50:22'),
(142, 5, '{\"time\":\"2022-05-13T12:50:30.999Z\",\"latitude\":24.66552740587731,\"longitude\":46.70448598981485}', '13-05-2022', '2022-05-13 12:50:31', '2022-05-13 12:50:31'),
(143, 5, '{\"time\":\"2022-05-13T12:50:41.019Z\",\"latitude\":24.665526539729715,\"longitude\":46.7044760311324}', '13-05-2022', '2022-05-13 12:50:41', '2022-05-13 12:50:41'),
(144, 5, '{\"time\":\"2022-05-13T12:50:50.969Z\",\"latitude\":24.66555550654325,\"longitude\":46.70445673988017}', '13-05-2022', '2022-05-13 12:50:51', '2022-05-13 12:50:51'),
(145, 5, '{\"time\":\"2022-05-13T12:51:01.002Z\",\"latitude\":24.665590572591398,\"longitude\":46.70447798082313}', '13-05-2022', '2022-05-13 12:51:02', '2022-05-13 12:51:02'),
(146, 5, '{\"time\":\"2022-05-13T12:51:10.992Z\",\"latitude\":24.66559864060749,\"longitude\":46.704458640366326}', '13-05-2022', '2022-05-13 12:51:11', '2022-05-13 12:51:11'),
(147, 5, '{\"time\":\"2022-05-13T12:51:20.999Z\",\"latitude\":24.665595781131184,\"longitude\":46.70447014474737}', '13-05-2022', '2022-05-13 12:51:21', '2022-05-13 12:51:21'),
(148, 5, '{\"time\":\"2022-05-13T12:51:31.009Z\",\"latitude\":24.665599272815786,\"longitude\":46.70446623327467}', '13-05-2022', '2022-05-13 12:51:31', '2022-05-13 12:51:31'),
(149, 5, '{\"time\":\"2022-05-13T12:51:40.980Z\",\"latitude\":24.665605133688878,\"longitude\":46.704465811324994}', '13-05-2022', '2022-05-13 12:51:41', '2022-05-13 12:51:41'),
(150, 5, '{\"time\":\"2022-05-13T12:51:50.976Z\",\"latitude\":24.665609045759492,\"longitude\":46.70446495241725}', '13-05-2022', '2022-05-13 12:51:51', '2022-05-13 12:51:51'),
(151, 5, '{\"time\":\"2022-05-13T12:52:00.962Z\",\"latitude\":24.665601330894052,\"longitude\":46.70446340989126}', '13-05-2022', '2022-05-13 12:52:01', '2022-05-13 12:52:01'),
(152, 5, '{\"time\":\"2022-05-13T12:52:11.021Z\",\"latitude\":24.66559434631118,\"longitude\":46.70447151868914}', '13-05-2022', '2022-05-13 12:52:12', '2022-05-13 12:52:12'),
(153, 5, '{\"time\":\"2022-05-13T12:52:21.030Z\",\"latitude\":24.66560542286985,\"longitude\":46.70447304399901}', '13-05-2022', '2022-05-13 12:52:21', '2022-05-13 12:52:21'),
(154, 5, '{\"time\":\"2022-05-13T12:52:31.020Z\",\"latitude\":24.66563357047325,\"longitude\":46.704456531088084}', '13-05-2022', '2022-05-13 12:52:31', '2022-05-13 12:52:31'),
(155, 5, '{\"time\":\"2022-05-13T12:52:40.971Z\",\"latitude\":24.665620532565264,\"longitude\":46.704409040416586}', '13-05-2022', '2022-05-13 12:52:41', '2022-05-13 12:52:41'),
(156, 5, '{\"time\":\"2022-05-13T12:52:50.990Z\",\"latitude\":24.66559068912563,\"longitude\":46.70439450537473}', '13-05-2022', '2022-05-13 12:52:55', '2022-05-13 12:52:55'),
(157, 5, '{\"time\":\"2022-05-13T12:53:01.015Z\",\"latitude\":24.665605589099407,\"longitude\":46.704412480439245}', '13-05-2022', '2022-05-13 12:53:01', '2022-05-13 12:53:01'),
(158, 5, '{\"time\":\"2022-05-13T12:53:10.968Z\",\"latitude\":24.665610677929354,\"longitude\":46.70441484115406}', '13-05-2022', '2022-05-13 12:53:11', '2022-05-13 12:53:11'),
(159, 5, '{\"time\":\"2022-05-13T12:53:21.003Z\",\"latitude\":24.665603013258313,\"longitude\":46.7044123764763}', '13-05-2022', '2022-05-13 12:53:21', '2022-05-13 12:53:21'),
(160, 5, '{\"time\":\"2022-05-13T12:53:30.970Z\",\"latitude\":24.66559586711893,\"longitude\":46.704392747954266}', '13-05-2022', '2022-05-13 12:53:32', '2022-05-13 12:53:32'),
(161, 5, '{\"time\":\"2022-05-13T12:53:40.997Z\",\"latitude\":24.665615179809002,\"longitude\":46.704381093375915}', '13-05-2022', '2022-05-13 12:53:42', '2022-05-13 12:53:42'),
(162, 5, '{\"time\":\"2022-05-13T12:53:50.979Z\",\"latitude\":24.665608517972224,\"longitude\":46.70441736360285}', '13-05-2022', '2022-05-13 12:53:51', '2022-05-13 12:53:51'),
(163, 5, '{\"time\":\"2022-05-13T12:54:00.960Z\",\"latitude\":24.66560865452616,\"longitude\":46.7044015243251}', '13-05-2022', '2022-05-13 12:54:01', '2022-05-13 12:54:01'),
(164, 5, '{\"time\":\"2022-05-13T12:54:10.965Z\",\"latitude\":24.665628111709772,\"longitude\":46.7044006163227}', '13-05-2022', '2022-05-13 12:54:11', '2022-05-13 12:54:11'),
(165, 5, '{\"time\":\"2022-05-13T12:54:20.949Z\",\"latitude\":24.665656991603083,\"longitude\":46.704428060329185}', '13-05-2022', '2022-05-13 12:54:21', '2022-05-13 12:54:21'),
(166, 5, '{\"time\":\"2022-05-13T12:54:31.006Z\",\"latitude\":24.665651502573045,\"longitude\":46.70442036448608}', '13-05-2022', '2022-05-13 12:54:31', '2022-05-13 12:54:31'),
(167, 5, '{\"time\":\"2022-05-13T12:54:40.960Z\",\"latitude\":24.66563523794899,\"longitude\":46.70444330919044}', '13-05-2022', '2022-05-13 12:54:41', '2022-05-13 12:54:41'),
(168, 5, '{\"time\":\"2022-05-13T12:54:51.012Z\",\"latitude\":24.66562191673453,\"longitude\":46.70441411772485}', '13-05-2022', '2022-05-13 12:54:51', '2022-05-13 12:54:51'),
(169, 5, '{\"time\":\"2022-05-13T12:55:01.000Z\",\"latitude\":24.665621106750482,\"longitude\":46.704405691962506}', '13-05-2022', '2022-05-13 12:55:02', '2022-05-13 12:55:02'),
(170, 5, '{\"time\":\"2022-05-13T12:55:11.006Z\",\"latitude\":24.665618593675262,\"longitude\":46.70440230559132}', '13-05-2022', '2022-05-13 12:55:11', '2022-05-13 12:55:11'),
(171, 5, '{\"time\":\"2022-05-13T12:55:20.988Z\",\"latitude\":24.665603046687856,\"longitude\":46.704446507928076}', '13-05-2022', '2022-05-13 12:55:21', '2022-05-13 12:55:21'),
(172, 5, '{\"time\":\"2022-05-13T12:55:31.022Z\",\"latitude\":24.665531443369456,\"longitude\":46.704465303277104}', '13-05-2022', '2022-05-13 12:55:31', '2022-05-13 12:55:31'),
(173, 5, '{\"time\":\"2022-05-13T12:55:41.028Z\",\"latitude\":24.665499287266538,\"longitude\":46.7044707021454}', '13-05-2022', '2022-05-13 12:55:41', '2022-05-13 12:55:41'),
(174, 5, '{\"time\":\"2022-05-13T12:55:50.976Z\",\"latitude\":24.66550289712077,\"longitude\":46.704483277328244}', '13-05-2022', '2022-05-13 12:55:51', '2022-05-13 12:55:51'),
(175, 5, '{\"time\":\"2022-05-13T12:56:01.005Z\",\"latitude\":24.66550920235572,\"longitude\":46.7044866705753}', '13-05-2022', '2022-05-13 12:56:02', '2022-05-13 12:56:02'),
(176, 5, '{\"time\":\"2022-05-13T12:56:11.014Z\",\"latitude\":24.665514855885853,\"longitude\":46.704488054986136}', '13-05-2022', '2022-05-13 12:56:11', '2022-05-13 12:56:11'),
(177, 5, '{\"time\":\"2022-05-13T12:56:20.957Z\",\"latitude\":24.665522734074052,\"longitude\":46.70446843354867}', '13-05-2022', '2022-05-13 12:56:22', '2022-05-13 12:56:22'),
(178, 5, '{\"time\":\"2022-05-13T12:56:30.977Z\",\"latitude\":24.665538498324867,\"longitude\":46.70443382491585}', '13-05-2022', '2022-05-13 12:56:31', '2022-05-13 12:56:31'),
(179, 5, '{\"time\":\"2022-05-13T12:56:40.865Z\",\"latitude\":24.665579776666746,\"longitude\":46.70443995037218}', '13-05-2022', '2022-05-13 12:56:40', '2022-05-13 12:56:40'),
(180, 5, '{\"time\":\"2022-05-13T12:56:50.959Z\",\"latitude\":24.665589678796934,\"longitude\":46.70442161398864}', '13-05-2022', '2022-05-13 12:56:51', '2022-05-13 12:56:51'),
(181, 5, '{\"time\":\"2022-05-13T12:57:00.936Z\",\"latitude\":24.66559109830981,\"longitude\":46.704441667239465}', '13-05-2022', '2022-05-13 12:57:01', '2022-05-13 12:57:01'),
(182, 5, '{\"time\":\"2022-05-13T12:57:10.974Z\",\"latitude\":24.66560068569884,\"longitude\":46.70443346624839}', '13-05-2022', '2022-05-13 12:57:11', '2022-05-13 12:57:11'),
(183, 5, '{\"time\":\"2022-05-13T12:57:21.004Z\",\"latitude\":24.66560636798836,\"longitude\":46.70442623485051}', '13-05-2022', '2022-05-13 12:57:21', '2022-05-13 12:57:21'),
(184, 5, '{\"time\":\"2022-05-13T12:57:30.940Z\",\"latitude\":24.665615615330587,\"longitude\":46.70440861750483}', '13-05-2022', '2022-05-13 12:57:31', '2022-05-13 12:57:31'),
(185, 5, '{\"time\":\"2022-05-13T12:57:40.982Z\",\"latitude\":24.66562111108761,\"longitude\":46.70442254804416}', '13-05-2022', '2022-05-13 12:57:42', '2022-05-13 12:57:42'),
(186, 5, '{\"time\":\"2022-05-13T12:57:50.901Z\",\"latitude\":24.66560256285311,\"longitude\":46.704437456632476}', '13-05-2022', '2022-05-13 12:57:51', '2022-05-13 12:57:51'),
(187, 5, '{\"time\":\"2022-05-13T12:58:00.993Z\",\"latitude\":24.66557704330913,\"longitude\":46.704461165332845}', '13-05-2022', '2022-05-13 12:58:02', '2022-05-13 12:58:02'),
(188, 5, '{\"time\":\"2022-05-13T12:58:10.989Z\",\"latitude\":24.665605440888232,\"longitude\":46.70443120058604}', '13-05-2022', '2022-05-13 12:58:11', '2022-05-13 12:58:11'),
(189, 5, '{\"time\":\"2022-05-13T12:58:20.988Z\",\"latitude\":24.66561533032771,\"longitude\":46.70443523228308}', '13-05-2022', '2022-05-13 12:58:21', '2022-05-13 12:58:21'),
(190, 5, '{\"time\":\"2022-05-13T12:58:31.017Z\",\"latitude\":24.665617163310362,\"longitude\":46.704441233738955}', '13-05-2022', '2022-05-13 12:58:31', '2022-05-13 12:58:31'),
(191, 5, '{\"time\":\"2022-05-13T12:58:40.946Z\",\"latitude\":24.66562817459311,\"longitude\":46.704433179028705}', '13-05-2022', '2022-05-13 12:58:41', '2022-05-13 12:58:41'),
(192, 5, '{\"time\":\"2022-05-13T12:58:50.992Z\",\"latitude\":24.66559397662112,\"longitude\":46.704425303140106}', '13-05-2022', '2022-05-13 12:58:51', '2022-05-13 12:58:51'),
(193, 5, '{\"time\":\"2022-05-13T12:59:01.013Z\",\"latitude\":24.665559443282653,\"longitude\":46.704424700901335}', '13-05-2022', '2022-05-13 12:59:01', '2022-05-13 12:59:01'),
(194, 5, '{\"time\":\"2022-05-13T12:59:10.978Z\",\"latitude\":24.66557425799299,\"longitude\":46.704425342478395}', '13-05-2022', '2022-05-13 12:59:11', '2022-05-13 12:59:11'),
(195, 5, '{\"time\":\"2022-05-13T12:59:20.968Z\",\"latitude\":24.66557899899559,\"longitude\":46.704398868384956}', '13-05-2022', '2022-05-13 12:59:21', '2022-05-13 12:59:21'),
(196, 5, '{\"time\":\"2022-05-13T12:59:30.985Z\",\"latitude\":24.665592440892656,\"longitude\":46.704392283393176}', '13-05-2022', '2022-05-13 12:59:31', '2022-05-13 12:59:31'),
(197, 5, '{\"time\":\"2022-05-13T12:59:40.974Z\",\"latitude\":24.665613639838256,\"longitude\":46.70438201273436}', '13-05-2022', '2022-05-13 12:59:41', '2022-05-13 12:59:41'),
(198, 5, '{\"time\":\"2022-05-13T12:59:50.994Z\",\"latitude\":24.66561639318131,\"longitude\":46.704368529011035}', '13-05-2022', '2022-05-13 12:59:51', '2022-05-13 12:59:51'),
(199, 5, '{\"time\":\"2022-05-13T13:00:00.991Z\",\"latitude\":24.66561475636092,\"longitude\":46.704368916055024}', '13-05-2022', '2022-05-13 13:00:01', '2022-05-13 13:00:01'),
(200, 5, '{\"time\":\"2022-05-13T13:00:10.961Z\",\"latitude\":24.665637102990527,\"longitude\":46.704372246180974}', '13-05-2022', '2022-05-13 13:00:11', '2022-05-13 13:00:11'),
(201, 5, '{\"time\":\"2022-05-13T13:00:20.924Z\",\"latitude\":24.665627806627548,\"longitude\":46.70439918554675}', '13-05-2022', '2022-05-13 13:00:21', '2022-05-13 13:00:21'),
(202, 5, '{\"time\":\"2022-05-13T13:00:30.968Z\",\"latitude\":24.665627543660907,\"longitude\":46.704398462799375}', '13-05-2022', '2022-05-13 13:00:32', '2022-05-13 13:00:32'),
(203, 5, '{\"time\":\"2022-05-13T13:00:40.972Z\",\"latitude\":24.665612183789886,\"longitude\":46.70441611027933}', '13-05-2022', '2022-05-13 13:00:41', '2022-05-13 13:00:41'),
(204, 5, '{\"time\":\"2022-05-13T13:00:50.926Z\",\"latitude\":24.6656334662443,\"longitude\":46.70440687546823}', '13-05-2022', '2022-05-13 13:00:51', '2022-05-13 13:00:51'),
(205, 5, '{\"time\":\"2022-05-13T13:01:00.953Z\",\"latitude\":24.665636214592013,\"longitude\":46.704414739396}', '13-05-2022', '2022-05-13 13:01:01', '2022-05-13 13:01:01'),
(206, 5, '{\"time\":\"2022-05-13T13:01:10.961Z\",\"latitude\":24.665654133982567,\"longitude\":46.70443880359752}', '13-05-2022', '2022-05-13 13:01:11', '2022-05-13 13:01:11'),
(207, 5, '{\"time\":\"2022-05-13T13:01:21.006Z\",\"latitude\":24.665648919540747,\"longitude\":46.70444293837092}', '13-05-2022', '2022-05-13 13:01:22', '2022-05-13 13:01:22'),
(208, 5, '{\"time\":\"2022-05-13T13:01:31.024Z\",\"latitude\":24.665650340660584,\"longitude\":46.704471195354515}', '13-05-2022', '2022-05-13 13:01:31', '2022-05-13 13:01:31'),
(209, 5, '{\"time\":\"2022-05-13T13:01:41.021Z\",\"latitude\":24.665641513097295,\"longitude\":46.70444057439558}', '13-05-2022', '2022-05-13 13:01:42', '2022-05-13 13:01:42'),
(210, 5, '{\"time\":\"2022-05-13T13:01:50.987Z\",\"latitude\":24.665621224518855,\"longitude\":46.704447252644144}', '13-05-2022', '2022-05-13 13:01:51', '2022-05-13 13:01:51'),
(211, 5, '{\"time\":\"2022-05-13T13:02:00.974Z\",\"latitude\":24.665586322522007,\"longitude\":46.70441878040014}', '13-05-2022', '2022-05-13 13:02:01', '2022-05-13 13:02:01'),
(212, 5, '{\"time\":\"2022-05-13T13:02:10.951Z\",\"latitude\":24.66557202275212,\"longitude\":46.7044311910258}', '13-05-2022', '2022-05-13 13:02:11', '2022-05-13 13:02:11'),
(213, 5, '{\"time\":\"2022-05-13T13:02:21.030Z\",\"latitude\":24.6656059099374,\"longitude\":46.70442089731041}', '13-05-2022', '2022-05-13 13:02:21', '2022-05-13 13:02:21'),
(214, 5, '{\"time\":\"2022-05-13T13:02:31.005Z\",\"latitude\":24.665584278612748,\"longitude\":46.704440891534624}', '13-05-2022', '2022-05-13 13:02:31', '2022-05-13 13:02:31'),
(215, 5, '{\"time\":\"2022-05-13T13:02:40.969Z\",\"latitude\":24.665557725626623,\"longitude\":46.704455131735266}', '13-05-2022', '2022-05-13 13:02:41', '2022-05-13 13:02:41'),
(216, 5, '{\"time\":\"2022-05-13T13:02:50.990Z\",\"latitude\":24.665566803876043,\"longitude\":46.70444643554547}', '13-05-2022', '2022-05-13 13:02:51', '2022-05-13 13:02:51'),
(217, 5, '{\"time\":\"2022-05-13T13:03:00.960Z\",\"latitude\":24.665554072132572,\"longitude\":46.704440882012165}', '13-05-2022', '2022-05-13 13:03:02', '2022-05-13 13:03:02'),
(218, 5, '{\"time\":\"2022-05-13T13:03:11.039Z\",\"latitude\":24.66555061124946,\"longitude\":46.70443343413538}', '13-05-2022', '2022-05-13 13:03:11', '2022-05-13 13:03:11'),
(219, 5, '{\"time\":\"2022-05-13T13:03:21.013Z\",\"latitude\":24.665553222873704,\"longitude\":46.70443369901409}', '13-05-2022', '2022-05-13 13:03:21', '2022-05-13 13:03:21'),
(220, 5, '{\"time\":\"2022-05-13T13:03:30.964Z\",\"latitude\":24.665557981390325,\"longitude\":46.70441286200483}', '13-05-2022', '2022-05-13 13:03:32', '2022-05-13 13:03:32'),
(221, 5, '{\"time\":\"2022-05-13T13:03:40.991Z\",\"latitude\":24.665541650178138,\"longitude\":46.70441261846854}', '13-05-2022', '2022-05-13 13:03:41', '2022-05-13 13:03:41'),
(222, 5, '{\"time\":\"2022-05-13T13:03:51.013Z\",\"latitude\":24.665558196727947,\"longitude\":46.704415533363736}', '13-05-2022', '2022-05-13 13:03:51', '2022-05-13 13:03:51'),
(223, 5, '{\"time\":\"2022-05-13T13:04:00.999Z\",\"latitude\":24.665576016608426,\"longitude\":46.7044227374003}', '13-05-2022', '2022-05-13 13:04:01', '2022-05-13 13:04:01'),
(224, 5, '{\"time\":\"2022-05-13T13:04:11.000Z\",\"latitude\":24.66559143942085,\"longitude\":46.70441899184283}', '13-05-2022', '2022-05-13 13:04:11', '2022-05-13 13:04:11'),
(225, 5, '{\"time\":\"2022-05-13T13:04:21.877Z\",\"latitude\":24.665591805436698,\"longitude\":46.70442308596172}', '13-05-2022', '2022-05-13 13:04:21', '2022-05-13 13:04:21'),
(226, 5, '{\"time\":\"2022-05-13T13:04:31.986Z\",\"latitude\":24.66559378438587,\"longitude\":46.7044276448109}', '13-05-2022', '2022-05-13 13:04:33', '2022-05-13 13:04:33'),
(227, 5, '{\"time\":\"2022-05-13T13:04:41.921Z\",\"latitude\":24.665601342131804,\"longitude\":46.704425852925056}', '13-05-2022', '2022-05-13 13:04:41', '2022-05-13 13:04:41'),
(228, 5, '{\"time\":\"2022-05-13T13:04:52.043Z\",\"latitude\":24.665595108361572,\"longitude\":46.704418901196824}', '13-05-2022', '2022-05-13 13:04:53', '2022-05-13 13:04:53'),
(229, 5, '{\"time\":\"2022-05-13T13:05:01.990Z\",\"latitude\":24.66560097586961,\"longitude\":46.704421849573485}', '13-05-2022', '2022-05-13 13:05:02', '2022-05-13 13:05:02'),
(230, 5, '{\"time\":\"2022-05-13T13:05:11.974Z\",\"latitude\":24.665594022645536,\"longitude\":46.70442595352994}', '13-05-2022', '2022-05-13 13:05:12', '2022-05-13 13:05:12'),
(231, 5, '{\"time\":\"2022-05-13T13:05:21.966Z\",\"latitude\":24.66560719818389,\"longitude\":46.70441426198295}', '13-05-2022', '2022-05-13 13:05:22', '2022-05-13 13:05:22'),
(232, 5, '{\"time\":\"2022-05-13T13:05:32.026Z\",\"latitude\":24.66562842993461,\"longitude\":46.70439984865537}', '13-05-2022', '2022-05-13 13:05:33', '2022-05-13 13:05:33'),
(233, 5, '{\"time\":\"2022-05-13T13:05:42.025Z\",\"latitude\":24.665630404425062,\"longitude\":46.704397877634406}', '13-05-2022', '2022-05-13 13:05:42', '2022-05-13 13:05:42'),
(234, 5, '{\"time\":\"2022-05-13T13:05:52.010Z\",\"latitude\":24.66563286599037,\"longitude\":46.70440255656793}', '13-05-2022', '2022-05-13 13:05:52', '2022-05-13 13:05:52'),
(235, 5, '{\"time\":\"2022-05-13T13:06:01.997Z\",\"latitude\":24.665634904165877,\"longitude\":46.704402964893355}', '13-05-2022', '2022-05-13 13:06:02', '2022-05-13 13:06:02'),
(236, 5, '{\"time\":\"2022-05-13T13:06:11.984Z\",\"latitude\":24.6656383280988,\"longitude\":46.70439529481666}', '13-05-2022', '2022-05-13 13:06:12', '2022-05-13 13:06:12'),
(237, 5, '{\"time\":\"2022-05-13T13:06:21.977Z\",\"latitude\":24.665638576720692,\"longitude\":46.70440397959155}', '13-05-2022', '2022-05-13 13:06:22', '2022-05-13 13:06:22'),
(238, 5, '{\"time\":\"2022-05-13T13:06:31.989Z\",\"latitude\":24.665629843105588,\"longitude\":46.704406839639155}', '13-05-2022', '2022-05-13 13:06:32', '2022-05-13 13:06:32'),
(239, 5, '{\"time\":\"2022-05-13T13:06:42.014Z\",\"latitude\":24.665632162091736,\"longitude\":46.70440695868476}', '13-05-2022', '2022-05-13 13:06:42', '2022-05-13 13:06:42'),
(240, 5, '{\"time\":\"2022-05-13T13:06:51.867Z\",\"latitude\":24.665635054855127,\"longitude\":46.70440886650045}', '13-05-2022', '2022-05-13 13:06:51', '2022-05-13 13:06:51'),
(241, 5, '{\"time\":\"2022-05-13T13:07:01.990Z\",\"latitude\":24.665638921276855,\"longitude\":46.704410561440284}', '13-05-2022', '2022-05-13 13:07:02', '2022-05-13 13:07:02'),
(242, 5, '{\"time\":\"2022-05-13T13:07:11.938Z\",\"latitude\":24.66563376872012,\"longitude\":46.70441175140013}', '13-05-2022', '2022-05-13 13:07:12', '2022-05-13 13:07:12'),
(243, 5, '{\"time\":\"2022-05-13T13:07:21.972Z\",\"latitude\":24.665636612659203,\"longitude\":46.704410211591146}', '13-05-2022', '2022-05-13 13:07:22', '2022-05-13 13:07:22'),
(244, 5, '{\"time\":\"2022-05-13T13:07:31.974Z\",\"latitude\":24.66563801837006,\"longitude\":46.70442074003859}', '13-05-2022', '2022-05-13 13:07:32', '2022-05-13 13:07:32'),
(245, 5, '{\"time\":\"2022-05-13T13:07:41.957Z\",\"latitude\":24.665639563850956,\"longitude\":46.7044317729811}', '13-05-2022', '2022-05-13 13:07:42', '2022-05-13 13:07:42'),
(246, 5, '{\"time\":\"2022-05-13T13:07:51.974Z\",\"latitude\":24.66563619249589,\"longitude\":46.704436791236596}', '13-05-2022', '2022-05-13 13:07:52', '2022-05-13 13:07:52'),
(247, 5, '{\"time\":\"2022-05-13T13:08:02.010Z\",\"latitude\":24.66560486998875,\"longitude\":46.70445125821863}', '13-05-2022', '2022-05-13 13:08:02', '2022-05-13 13:08:02'),
(248, 5, '{\"time\":\"2022-05-13T13:08:11.952Z\",\"latitude\":24.665593064889794,\"longitude\":46.70442550118026}', '13-05-2022', '2022-05-13 13:08:12', '2022-05-13 13:08:12'),
(249, 5, '{\"time\":\"2022-05-13T13:08:21.974Z\",\"latitude\":24.665604897944615,\"longitude\":46.70441822870606}', '13-05-2022', '2022-05-13 13:08:22', '2022-05-13 13:08:22'),
(250, 5, '{\"time\":\"2022-05-13T13:08:31.990Z\",\"latitude\":24.6656096075185,\"longitude\":46.70442044861558}', '13-05-2022', '2022-05-13 13:08:32', '2022-05-13 13:08:32'),
(251, 5, '{\"time\":\"2022-05-13T13:08:41.971Z\",\"latitude\":24.665622526800544,\"longitude\":46.70440986685778}', '13-05-2022', '2022-05-13 13:08:42', '2022-05-13 13:08:42'),
(252, 5, '{\"time\":\"2022-05-13T13:08:51.979Z\",\"latitude\":24.665634504186915,\"longitude\":46.704411081628294}', '13-05-2022', '2022-05-13 13:08:53', '2022-05-13 13:08:53'),
(253, 5, '{\"time\":\"2022-05-13T13:09:01.913Z\",\"latitude\":24.6656369101495,\"longitude\":46.70441579868888}', '13-05-2022', '2022-05-13 13:09:04', '2022-05-13 13:09:04'),
(254, 5, '{\"time\":\"2022-05-13T13:09:12.000Z\",\"latitude\":24.665645766660507,\"longitude\":46.70441726174644}', '13-05-2022', '2022-05-13 13:09:12', '2022-05-13 13:09:12'),
(255, 5, '{\"time\":\"2022-05-13T13:09:21.977Z\",\"latitude\":24.66565697886357,\"longitude\":46.70441758140222}', '13-05-2022', '2022-05-13 13:09:22', '2022-05-13 13:09:22'),
(256, 5, '{\"time\":\"2022-05-13T13:09:31.933Z\",\"latitude\":24.665661918555912,\"longitude\":46.70442293324458}', '13-05-2022', '2022-05-13 13:09:32', '2022-05-13 13:09:32'),
(257, 5, '{\"time\":\"2022-05-13T13:09:41.984Z\",\"latitude\":24.665662785440375,\"longitude\":46.70443110236172}', '13-05-2022', '2022-05-13 13:09:42', '2022-05-13 13:09:42'),
(258, 5, '{\"time\":\"2022-05-13T13:09:51.959Z\",\"latitude\":24.665645542238398,\"longitude\":46.70441920801292}', '13-05-2022', '2022-05-13 13:09:52', '2022-05-13 13:09:52'),
(259, 5, '{\"time\":\"2022-05-13T13:10:01.977Z\",\"latitude\":24.66565241985234,\"longitude\":46.70440308326537}', '13-05-2022', '2022-05-13 13:10:02', '2022-05-13 13:10:02'),
(260, 5, '{\"time\":\"2022-05-13T13:10:12.051Z\",\"latitude\":24.665665953970457,\"longitude\":46.70441515359765}', '13-05-2022', '2022-05-13 13:10:12', '2022-05-13 13:10:12'),
(261, 5, '{\"time\":\"2022-05-13T13:10:21.994Z\",\"latitude\":24.665642917577884,\"longitude\":46.7044363921252}', '13-05-2022', '2022-05-13 13:10:22', '2022-05-13 13:10:22'),
(262, 5, '{\"time\":\"2022-05-13T13:10:31.991Z\",\"latitude\":24.66563237687151,\"longitude\":46.704450025711466}', '13-05-2022', '2022-05-13 13:10:32', '2022-05-13 13:10:32'),
(263, 5, '{\"time\":\"2022-05-13T13:10:42.020Z\",\"latitude\":24.665608441932584,\"longitude\":46.7044631796513}', '13-05-2022', '2022-05-13 13:10:42', '2022-05-13 13:10:42'),
(264, 5, '{\"time\":\"2022-05-13T13:10:51.986Z\",\"latitude\":24.665618394086064,\"longitude\":46.704463210855735}', '13-05-2022', '2022-05-13 13:10:53', '2022-05-13 13:10:53'),
(265, 5, '{\"time\":\"2022-05-13T13:11:01.968Z\",\"latitude\":24.665639863249137,\"longitude\":46.70444153277602}', '13-05-2022', '2022-05-13 13:11:02', '2022-05-13 13:11:02'),
(266, 5, '{\"time\":\"2022-05-13T13:11:11.972Z\",\"latitude\":24.665645138926994,\"longitude\":46.70444126853305}', '13-05-2022', '2022-05-13 13:11:12', '2022-05-13 13:11:12'),
(267, 5, '{\"time\":\"2022-05-13T13:11:21.955Z\",\"latitude\":24.665639057746443,\"longitude\":46.70443877541125}', '13-05-2022', '2022-05-13 13:11:22', '2022-05-13 13:11:22'),
(268, 5, '{\"time\":\"2022-05-13T13:11:31.877Z\",\"latitude\":24.665642342963533,\"longitude\":46.704444346016224}', '13-05-2022', '2022-05-13 13:11:32', '2022-05-13 13:11:32'),
(269, 5, '{\"time\":\"2022-05-13T13:11:42.008Z\",\"latitude\":24.66565351915182,\"longitude\":46.70443282163688}', '13-05-2022', '2022-05-13 13:11:42', '2022-05-13 13:11:42'),
(270, 5, '{\"time\":\"2022-05-13T13:11:51.975Z\",\"latitude\":24.665655186496284,\"longitude\":46.70442742812264}', '13-05-2022', '2022-05-13 13:11:52', '2022-05-13 13:11:52'),
(271, 5, '{\"time\":\"2022-05-13T13:12:01.971Z\",\"latitude\":24.665657862332154,\"longitude\":46.70442806155689}', '13-05-2022', '2022-05-13 13:12:02', '2022-05-13 13:12:02'),
(272, 5, '{\"time\":\"2022-05-13T13:12:11.993Z\",\"latitude\":24.66566137471632,\"longitude\":46.70443150407397}', '13-05-2022', '2022-05-13 13:12:12', '2022-05-13 13:12:12'),
(273, 5, '{\"time\":\"2022-05-13T13:12:21.859Z\",\"latitude\":24.665661730310013,\"longitude\":46.70443901596557}', '13-05-2022', '2022-05-13 13:12:22', '2022-05-13 13:12:22'),
(274, 5, '{\"time\":\"2022-05-13T13:12:31.991Z\",\"latitude\":24.665651997015683,\"longitude\":46.7044372112826}', '13-05-2022', '2022-05-13 13:12:32', '2022-05-13 13:12:32'),
(275, 5, '{\"time\":\"2022-05-13T13:12:41.968Z\",\"latitude\":24.665640325787734,\"longitude\":46.704435210110276}', '13-05-2022', '2022-05-13 13:12:42', '2022-05-13 13:12:42'),
(276, 5, '{\"time\":\"2022-05-13T13:12:51.935Z\",\"latitude\":24.665628590855242,\"longitude\":46.70441049434742}', '13-05-2022', '2022-05-13 13:12:52', '2022-05-13 13:12:52'),
(277, 5, '{\"time\":\"2022-05-13T13:13:02.054Z\",\"latitude\":24.665611547423886,\"longitude\":46.704425721326196}', '13-05-2022', '2022-05-13 13:13:02', '2022-05-13 13:13:02'),
(278, 5, '{\"time\":\"2022-05-13T13:13:12.023Z\",\"latitude\":24.66560416056853,\"longitude\":46.704431608452644}', '13-05-2022', '2022-05-13 13:13:12', '2022-05-13 13:13:12'),
(279, 5, '{\"time\":\"2022-05-13T13:13:22.019Z\",\"latitude\":24.66561522867021,\"longitude\":46.70441071176279}', '13-05-2022', '2022-05-13 13:13:22', '2022-05-13 13:13:22'),
(280, 5, '{\"time\":\"2022-05-13T13:13:31.988Z\",\"latitude\":24.66564072853268,\"longitude\":46.70443203038595}', '13-05-2022', '2022-05-13 13:13:32', '2022-05-13 13:13:32'),
(281, 5, '{\"time\":\"2022-05-13T13:13:41.982Z\",\"latitude\":24.665633776706887,\"longitude\":46.70443284018027}', '13-05-2022', '2022-05-13 13:13:42', '2022-05-13 13:13:42'),
(282, 5, '{\"time\":\"2022-05-13T13:13:52.015Z\",\"latitude\":24.665585887818672,\"longitude\":46.70442125956011}', '13-05-2022', '2022-05-13 13:13:53', '2022-05-13 13:13:53'),
(283, 5, '{\"time\":\"2022-05-13T13:14:02.005Z\",\"latitude\":24.665588741306962,\"longitude\":46.70442551735925}', '13-05-2022', '2022-05-13 13:14:02', '2022-05-13 13:14:02'),
(284, 5, '{\"time\":\"2022-05-13T13:14:12.034Z\",\"latitude\":24.665533890981788,\"longitude\":46.70443535621609}', '13-05-2022', '2022-05-13 13:14:12', '2022-05-13 13:14:12'),
(285, 5, '{\"time\":\"2022-05-13T13:14:22.032Z\",\"latitude\":24.665541232501372,\"longitude\":46.70442951640369}', '13-05-2022', '2022-05-13 13:14:22', '2022-05-13 13:14:22'),
(286, 5, '{\"time\":\"2022-05-13T13:14:31.992Z\",\"latitude\":24.665552404175248,\"longitude\":46.704405603965334}', '13-05-2022', '2022-05-13 13:14:32', '2022-05-13 13:14:32'),
(287, 5, '{\"time\":\"2022-05-13T13:14:42.012Z\",\"latitude\":24.665550795916364,\"longitude\":46.704423676201294}', '13-05-2022', '2022-05-13 13:14:42', '2022-05-13 13:14:42');
INSERT INTO `track_employees` (`id`, `user_id`, `location`, `date`, `created_at`, `updated_at`) VALUES
(288, 5, '{\"time\":\"2022-05-13T13:14:52.002Z\",\"latitude\":24.665535753341914,\"longitude\":46.70442857639242}', '13-05-2022', '2022-05-13 13:14:52', '2022-05-13 13:14:52'),
(289, 5, '{\"time\":\"2022-05-13T13:15:02.057Z\",\"latitude\":24.665505015824802,\"longitude\":46.70443206609577}', '13-05-2022', '2022-05-13 13:15:02', '2022-05-13 13:15:02'),
(290, 5, '{\"time\":\"2022-05-13T13:15:11.917Z\",\"latitude\":24.665509621246517,\"longitude\":46.70442568265936}', '13-05-2022', '2022-05-13 13:15:11', '2022-05-13 13:15:11'),
(291, 5, '{\"time\":\"2022-05-13T13:15:22.020Z\",\"latitude\":24.665509688536755,\"longitude\":46.70442411195981}', '13-05-2022', '2022-05-13 13:15:22', '2022-05-13 13:15:22'),
(292, 5, '{\"time\":\"2022-05-13T13:15:32.030Z\",\"latitude\":24.665510020060978,\"longitude\":46.704421716094025}', '13-05-2022', '2022-05-13 13:15:32', '2022-05-13 13:15:32'),
(293, 5, '{\"time\":\"2022-05-13T13:15:41.989Z\",\"latitude\":24.665521439701354,\"longitude\":46.70441511839745}', '13-05-2022', '2022-05-13 13:15:42', '2022-05-13 13:15:42'),
(294, 5, '{\"time\":\"2022-05-13T13:15:52.041Z\",\"latitude\":24.665544672161847,\"longitude\":46.70441362485002}', '13-05-2022', '2022-05-13 13:15:52', '2022-05-13 13:15:52'),
(295, 5, '{\"time\":\"2022-05-13T13:16:01.999Z\",\"latitude\":24.665549826483886,\"longitude\":46.70442535033005}', '13-05-2022', '2022-05-13 13:16:04', '2022-05-13 13:16:04'),
(296, 5, '{\"time\":\"2022-05-13T13:16:11.970Z\",\"latitude\":24.665540375889872,\"longitude\":46.704429574499706}', '13-05-2022', '2022-05-13 13:16:12', '2022-05-13 13:16:12'),
(297, 5, '{\"time\":\"2022-05-13T13:16:22.001Z\",\"latitude\":24.665524765301107,\"longitude\":46.70443351311868}', '13-05-2022', '2022-05-13 13:16:23', '2022-05-13 13:16:23'),
(298, 5, '{\"time\":\"2022-05-13T13:16:31.968Z\",\"latitude\":24.66551299504739,\"longitude\":46.704417458975485}', '13-05-2022', '2022-05-13 13:16:34', '2022-05-13 13:16:34'),
(299, 5, '{\"time\":\"2022-05-13T13:16:42.017Z\",\"latitude\":24.665467621729842,\"longitude\":46.704434009494626}', '13-05-2022', '2022-05-13 13:16:44', '2022-05-13 13:16:44'),
(300, 5, '{\"time\":\"2022-05-13T13:16:52.009Z\",\"latitude\":24.66548058419621,\"longitude\":46.704400768906126}', '13-05-2022', '2022-05-13 13:16:52', '2022-05-13 13:16:52'),
(301, 5, '{\"time\":\"2022-05-13T13:17:01.925Z\",\"latitude\":24.665492865490197,\"longitude\":46.70440710661603}', '13-05-2022', '2022-05-13 13:17:02', '2022-05-13 13:17:02'),
(302, 5, '{\"time\":\"2022-05-13T13:17:11.968Z\",\"latitude\":24.665482973370455,\"longitude\":46.704481636796835}', '13-05-2022', '2022-05-13 13:17:12', '2022-05-13 13:17:12'),
(303, 5, '{\"time\":\"2022-05-13T13:17:21.988Z\",\"latitude\":24.66552094442005,\"longitude\":46.70444839061538}', '13-05-2022', '2022-05-13 13:17:22', '2022-05-13 13:17:22'),
(304, 5, '{\"time\":\"2022-05-13T13:17:31.975Z\",\"latitude\":24.665554971499102,\"longitude\":46.70444692650881}', '13-05-2022', '2022-05-13 13:17:33', '2022-05-13 13:17:33'),
(305, 5, '{\"time\":\"2022-05-13T13:17:41.946Z\",\"latitude\":24.665533088318565,\"longitude\":46.704422348621016}', '13-05-2022', '2022-05-13 13:17:42', '2022-05-13 13:17:42'),
(306, 5, '{\"time\":\"2022-05-13T13:17:52.033Z\",\"latitude\":24.665501476983316,\"longitude\":46.70443773679854}', '13-05-2022', '2022-05-13 13:17:52', '2022-05-13 13:17:52'),
(307, 5, '{\"time\":\"2022-05-13T13:18:02.018Z\",\"latitude\":24.665538739505855,\"longitude\":46.704443885470454}', '13-05-2022', '2022-05-13 13:18:03', '2022-05-13 13:18:03'),
(308, 5, '{\"time\":\"2022-05-13T13:18:12.048Z\",\"latitude\":24.66558517978462,\"longitude\":46.70442844690444}', '13-05-2022', '2022-05-13 13:18:12', '2022-05-13 13:18:12'),
(309, 5, '{\"time\":\"2022-05-13T13:18:21.974Z\",\"latitude\":24.665587623300045,\"longitude\":46.7044168146927}', '13-05-2022', '2022-05-13 13:18:22', '2022-05-13 13:18:22'),
(310, 5, '{\"time\":\"2022-05-13T13:18:31.980Z\",\"latitude\":24.665586361331005,\"longitude\":46.704411504192834}', '13-05-2022', '2022-05-13 13:18:32', '2022-05-13 13:18:32'),
(311, 5, '{\"time\":\"2022-05-13T13:18:41.922Z\",\"latitude\":24.665556773975272,\"longitude\":46.704423671051046}', '13-05-2022', '2022-05-13 13:18:42', '2022-05-13 13:18:42'),
(312, 5, '{\"time\":\"2022-05-13T13:18:51.952Z\",\"latitude\":24.66556002823652,\"longitude\":46.70442584049874}', '13-05-2022', '2022-05-13 13:18:52', '2022-05-13 13:18:52'),
(313, 5, '{\"time\":\"2022-05-13T13:19:01.997Z\",\"latitude\":24.665554034539618,\"longitude\":46.70441838825635}', '13-05-2022', '2022-05-13 13:19:02', '2022-05-13 13:19:02'),
(314, 5, '{\"time\":\"2022-05-13T13:19:12.039Z\",\"latitude\":24.665557784691035,\"longitude\":46.704409724691345}', '13-05-2022', '2022-05-13 13:19:12', '2022-05-13 13:19:12'),
(315, 5, '{\"time\":\"2022-05-13T13:19:21.973Z\",\"latitude\":24.665559307960077,\"longitude\":46.704407218787075}', '13-05-2022', '2022-05-13 13:19:22', '2022-05-13 13:19:22'),
(316, 5, '{\"time\":\"2022-05-13T13:19:31.982Z\",\"latitude\":24.665558511803457,\"longitude\":46.7044163113986}', '13-05-2022', '2022-05-13 13:19:33', '2022-05-13 13:19:33'),
(317, 5, '{\"time\":\"2022-05-13T13:19:42.011Z\",\"latitude\":24.66554687892319,\"longitude\":46.70441636536208}', '13-05-2022', '2022-05-13 13:19:42', '2022-05-13 13:19:42'),
(318, 5, '{\"time\":\"2022-05-13T13:19:51.969Z\",\"latitude\":24.6655396702423,\"longitude\":46.70441240852396}', '13-05-2022', '2022-05-13 13:19:52', '2022-05-13 13:19:52'),
(319, 5, '{\"time\":\"2022-05-13T13:20:01.960Z\",\"latitude\":24.66553439082469,\"longitude\":46.704398809113236}', '13-05-2022', '2022-05-13 13:20:02', '2022-05-13 13:20:02'),
(320, 5, '{\"time\":\"2022-05-13T13:20:12.010Z\",\"latitude\":24.66552537908681,\"longitude\":46.70438354920376}', '13-05-2022', '2022-05-13 13:20:12', '2022-05-13 13:20:12'),
(321, 5, '{\"time\":\"2022-05-13T13:20:22.001Z\",\"latitude\":24.665507087768315,\"longitude\":46.704391587603745}', '13-05-2022', '2022-05-13 13:20:22', '2022-05-13 13:20:22'),
(322, 5, '{\"time\":\"2022-05-13T13:20:31.953Z\",\"latitude\":24.665490178084923,\"longitude\":46.704395818380796}', '13-05-2022', '2022-05-13 13:20:32', '2022-05-13 13:20:32'),
(323, 5, '{\"time\":\"2022-05-13T13:20:41.973Z\",\"latitude\":24.665484309798636,\"longitude\":46.70441180110636}', '13-05-2022', '2022-05-13 13:20:42', '2022-05-13 13:20:42'),
(324, 5, '{\"time\":\"2022-05-13T13:20:52.019Z\",\"latitude\":24.66548116325025,\"longitude\":46.70444875834206}', '13-05-2022', '2022-05-13 13:20:52', '2022-05-13 13:20:52'),
(325, 5, '{\"time\":\"2022-05-13T13:21:01.943Z\",\"latitude\":24.66547314972245,\"longitude\":46.7044739394375}', '13-05-2022', '2022-05-13 13:21:03', '2022-05-13 13:21:03'),
(326, 5, '{\"time\":\"2022-05-13T13:21:12.023Z\",\"latitude\":24.665458632377028,\"longitude\":46.70443911289313}', '13-05-2022', '2022-05-13 13:21:12', '2022-05-13 13:21:12'),
(327, 5, '{\"time\":\"2022-05-13T13:21:21.988Z\",\"latitude\":24.66548038159474,\"longitude\":46.70444388821065}', '13-05-2022', '2022-05-13 13:21:22', '2022-05-13 13:21:22'),
(328, 5, '{\"time\":\"2022-05-13T13:21:31.992Z\",\"latitude\":24.665490530523996,\"longitude\":46.70444642116632}', '13-05-2022', '2022-05-13 13:21:33', '2022-05-13 13:21:33'),
(329, 5, '{\"time\":\"2022-05-13T13:21:41.989Z\",\"latitude\":24.665505886328265,\"longitude\":46.70445528004478}', '13-05-2022', '2022-05-13 13:21:42', '2022-05-13 13:21:42'),
(330, 5, '{\"time\":\"2022-05-13T13:21:52.023Z\",\"latitude\":24.665506720858364,\"longitude\":46.704457271254704}', '13-05-2022', '2022-05-13 13:21:52', '2022-05-13 13:21:52'),
(331, 5, '{\"time\":\"2022-05-13T13:22:01.985Z\",\"latitude\":24.665503962163655,\"longitude\":46.704454106482245}', '13-05-2022', '2022-05-13 13:22:02', '2022-05-13 13:22:02'),
(332, 5, '{\"time\":\"2022-05-13T13:22:11.984Z\",\"latitude\":24.66548423318634,\"longitude\":46.704437074870064}', '13-05-2022', '2022-05-13 13:22:12', '2022-05-13 13:22:12'),
(333, 5, '{\"time\":\"2022-05-13T13:22:21.972Z\",\"latitude\":24.66549811242096,\"longitude\":46.70442741049222}', '13-05-2022', '2022-05-13 13:22:22', '2022-05-13 13:22:22'),
(334, 5, '{\"time\":\"2022-05-13T13:22:31.984Z\",\"latitude\":24.665505286697154,\"longitude\":46.7044286065844}', '13-05-2022', '2022-05-13 13:22:32', '2022-05-13 13:22:32'),
(335, 5, '{\"time\":\"2022-05-13T13:22:41.977Z\",\"latitude\":24.66551925684581,\"longitude\":46.70442834283526}', '13-05-2022', '2022-05-13 13:22:42', '2022-05-13 13:22:42'),
(336, 5, '{\"time\":\"2022-05-13T13:22:51.954Z\",\"latitude\":24.665538520789212,\"longitude\":46.70444331206658}', '13-05-2022', '2022-05-13 13:22:52', '2022-05-13 13:22:52'),
(337, 5, '{\"time\":\"2022-05-13T13:23:01.994Z\",\"latitude\":24.665551907118168,\"longitude\":46.7044281403755}', '13-05-2022', '2022-05-13 13:23:02', '2022-05-13 13:23:02'),
(338, 5, '{\"time\":\"2022-05-13T13:23:11.967Z\",\"latitude\":24.66556809276486,\"longitude\":46.70443772007023}', '13-05-2022', '2022-05-13 13:23:13', '2022-05-13 13:23:13'),
(339, 5, '{\"time\":\"2022-05-13T13:23:22.027Z\",\"latitude\":24.66557312963417,\"longitude\":46.704429353061634}', '13-05-2022', '2022-05-13 13:23:23', '2022-05-13 13:23:23'),
(340, 5, '{\"time\":\"2022-05-13T13:23:32.002Z\",\"latitude\":24.66557315596656,\"longitude\":46.70442318820457}', '13-05-2022', '2022-05-13 13:23:32', '2022-05-13 13:23:32'),
(341, 5, '{\"time\":\"2022-05-13T13:23:42.016Z\",\"latitude\":24.66557940402683,\"longitude\":46.70442001718275}', '13-05-2022', '2022-05-13 13:23:42', '2022-05-13 13:23:42'),
(342, 5, '{\"time\":\"2022-05-13T13:23:51.996Z\",\"latitude\":24.6655929518209,\"longitude\":46.70441882977744}', '13-05-2022', '2022-05-13 13:23:52', '2022-05-13 13:23:52'),
(343, 5, '{\"time\":\"2022-05-13T13:24:02.002Z\",\"latitude\":24.66559638570276,\"longitude\":46.704406064854965}', '13-05-2022', '2022-05-13 13:24:02', '2022-05-13 13:24:02'),
(344, 5, '{\"time\":\"2022-05-13T13:24:11.979Z\",\"latitude\":24.665595533340227,\"longitude\":46.704400744203596}', '13-05-2022', '2022-05-13 13:24:12', '2022-05-13 13:24:12'),
(345, 5, '{\"time\":\"2022-05-13T13:24:22.008Z\",\"latitude\":24.665588251581475,\"longitude\":46.70440497096396}', '13-05-2022', '2022-05-13 13:24:22', '2022-05-13 13:24:22'),
(346, 5, '{\"time\":\"2022-05-13T13:24:32.003Z\",\"latitude\":24.66557909867711,\"longitude\":46.704410363424785}', '13-05-2022', '2022-05-13 13:24:32', '2022-05-13 13:24:32'),
(347, 5, '{\"time\":\"2022-05-13T13:24:41.955Z\",\"latitude\":24.665583109127223,\"longitude\":46.704402888376976}', '13-05-2022', '2022-05-13 13:24:42', '2022-05-13 13:24:42'),
(348, 5, '{\"time\":\"2022-05-13T13:24:51.988Z\",\"latitude\":24.66559166523704,\"longitude\":46.70439522114127}', '13-05-2022', '2022-05-13 13:24:52', '2022-05-13 13:24:52'),
(349, 5, '{\"time\":\"2022-05-13T13:25:01.967Z\",\"latitude\":24.665598938424367,\"longitude\":46.70440199323697}', '13-05-2022', '2022-05-13 13:25:02', '2022-05-13 13:25:02'),
(350, 5, '{\"time\":\"2022-05-13T13:25:11.987Z\",\"latitude\":24.66560145640917,\"longitude\":46.70439782229317}', '13-05-2022', '2022-05-13 13:25:12', '2022-05-13 13:25:12'),
(351, 5, '{\"time\":\"2022-05-13T13:25:21.943Z\",\"latitude\":24.66560551027514,\"longitude\":46.70441425637687}', '13-05-2022', '2022-05-13 13:25:22', '2022-05-13 13:25:22'),
(352, 5, '{\"time\":\"2022-05-13T13:25:32.003Z\",\"latitude\":24.665562315860402,\"longitude\":46.70444700282951}', '13-05-2022', '2022-05-13 13:25:33', '2022-05-13 13:25:33'),
(353, 5, '{\"time\":\"2022-05-13T13:25:42.001Z\",\"latitude\":24.665562451888096,\"longitude\":46.704456391357375}', '13-05-2022', '2022-05-13 13:25:43', '2022-05-13 13:25:43'),
(354, 5, '{\"time\":\"2022-05-13T13:25:51.972Z\",\"latitude\":24.66556042190131,\"longitude\":46.70445590580564}', '13-05-2022', '2022-05-13 13:25:53', '2022-05-13 13:25:53'),
(355, 5, '{\"time\":\"2022-05-13T13:26:01.993Z\",\"latitude\":24.66555704840421,\"longitude\":46.70445624785747}', '13-05-2022', '2022-05-13 13:26:02', '2022-05-13 13:26:02'),
(356, 5, '{\"time\":\"2022-05-13T13:26:12.015Z\",\"latitude\":24.665548332707644,\"longitude\":46.704458838389606}', '13-05-2022', '2022-05-13 13:26:13', '2022-05-13 13:26:13'),
(357, 5, '{\"time\":\"2022-05-13T13:26:21.992Z\",\"latitude\":24.66556089591711,\"longitude\":46.704416574727574}', '13-05-2022', '2022-05-13 13:26:23', '2022-05-13 13:26:23'),
(358, 5, '{\"time\":\"2022-05-13T13:26:31.999Z\",\"latitude\":24.665569166999127,\"longitude\":46.70444428871754}', '13-05-2022', '2022-05-13 13:26:32', '2022-05-13 13:26:32'),
(359, 5, '{\"time\":\"2022-05-13T13:26:41.982Z\",\"latitude\":24.665569548189524,\"longitude\":46.70444883850957}', '13-05-2022', '2022-05-13 13:26:42', '2022-05-13 13:26:42'),
(360, 5, '{\"time\":\"2022-05-13T13:26:51.978Z\",\"latitude\":24.665562301957085,\"longitude\":46.70444208567813}', '13-05-2022', '2022-05-13 13:26:52', '2022-05-13 13:26:52'),
(361, 5, '{\"time\":\"2022-05-13T13:27:02.002Z\",\"latitude\":24.665573142021692,\"longitude\":46.704429618870364}', '13-05-2022', '2022-05-13 13:27:02', '2022-05-13 13:27:02'),
(362, 5, '{\"time\":\"2022-05-13T13:27:11.927Z\",\"latitude\":24.66558849069753,\"longitude\":46.70446206984222}', '13-05-2022', '2022-05-13 13:27:12', '2022-05-13 13:27:12'),
(363, 5, '{\"time\":\"2022-05-13T13:27:21.978Z\",\"latitude\":24.66555234371606,\"longitude\":46.70447455889846}', '13-05-2022', '2022-05-13 13:27:22', '2022-05-13 13:27:22'),
(364, 5, '{\"time\":\"2022-05-13T13:27:31.981Z\",\"latitude\":24.665544655784082,\"longitude\":46.704477035585846}', '13-05-2022', '2022-05-13 13:27:33', '2022-05-13 13:27:33'),
(365, 5, '{\"time\":\"2022-05-13T13:27:41.976Z\",\"latitude\":24.66553988562006,\"longitude\":46.704478694209406}', '13-05-2022', '2022-05-13 13:27:42', '2022-05-13 13:27:42'),
(366, 5, '{\"time\":\"2022-05-13T13:27:51.983Z\",\"latitude\":24.665516662040552,\"longitude\":46.70446985545335}', '13-05-2022', '2022-05-13 13:27:53', '2022-05-13 13:27:53'),
(367, 5, '{\"time\":\"2022-05-13T13:28:01.993Z\",\"latitude\":24.665505448358207,\"longitude\":46.704467197799225}', '13-05-2022', '2022-05-13 13:28:02', '2022-05-13 13:28:02'),
(368, 5, '{\"time\":\"2022-05-13T13:28:11.977Z\",\"latitude\":24.665479345161707,\"longitude\":46.7044439466905}', '13-05-2022', '2022-05-13 13:28:12', '2022-05-13 13:28:12'),
(369, 5, '{\"time\":\"2022-05-13T13:28:22.209Z\",\"latitude\":24.665481379867987,\"longitude\":46.70444262372965}', '13-05-2022', '2022-05-13 13:28:23', '2022-05-13 13:28:23'),
(370, 5, '{\"time\":\"2022-05-13T13:28:31.995Z\",\"latitude\":24.66548383640692,\"longitude\":46.704439041004015}', '13-05-2022', '2022-05-13 13:28:32', '2022-05-13 13:28:32'),
(371, 5, '{\"time\":\"2022-05-13T13:28:42.000Z\",\"latitude\":24.66548957166739,\"longitude\":46.70443995699078}', '13-05-2022', '2022-05-13 13:28:42', '2022-05-13 13:28:42'),
(372, 5, '{\"time\":\"2022-05-13T13:28:51.957Z\",\"latitude\":24.66549211695038,\"longitude\":46.704437646534295}', '13-05-2022', '2022-05-13 13:28:52', '2022-05-13 13:28:52'),
(373, 5, '{\"time\":\"2022-05-13T13:29:01.959Z\",\"latitude\":24.665494835459054,\"longitude\":46.704435090874675}', '13-05-2022', '2022-05-13 13:29:03', '2022-05-13 13:29:03'),
(374, 5, '{\"time\":\"2022-05-13T13:29:11.948Z\",\"latitude\":24.66548431211061,\"longitude\":46.7044161056683}', '13-05-2022', '2022-05-13 13:29:12', '2022-05-13 13:29:12'),
(375, 5, '{\"time\":\"2022-05-13T13:29:22.003Z\",\"latitude\":24.665491560524288,\"longitude\":46.704431989595456}', '13-05-2022', '2022-05-13 13:29:22', '2022-05-13 13:29:22'),
(376, 5, '{\"time\":\"2022-05-13T13:29:31.925Z\",\"latitude\":24.66548851601285,\"longitude\":46.70443023868983}', '13-05-2022', '2022-05-13 13:29:32', '2022-05-13 13:29:32'),
(377, 5, '{\"time\":\"2022-05-13T13:29:42.006Z\",\"latitude\":24.665483844613632,\"longitude\":46.704418519962964}', '13-05-2022', '2022-05-13 13:29:42', '2022-05-13 13:29:42'),
(378, 5, '{\"time\":\"2022-05-13T13:29:51.964Z\",\"latitude\":24.6655005034117,\"longitude\":46.70441825739121}', '13-05-2022', '2022-05-13 13:29:52', '2022-05-13 13:29:52'),
(379, 5, '{\"time\":\"2022-05-13T13:30:02.017Z\",\"latitude\":24.665501010675364,\"longitude\":46.704375471063784}', '13-05-2022', '2022-05-13 13:30:02', '2022-05-13 13:30:02'),
(380, 5, '{\"time\":\"2022-05-13T13:30:12.057Z\",\"latitude\":24.66553310978064,\"longitude\":46.70438054422191}', '13-05-2022', '2022-05-13 13:30:12', '2022-05-13 13:30:12'),
(381, 5, '{\"time\":\"2022-05-13T13:30:22.021Z\",\"latitude\":24.665575737284932,\"longitude\":46.704385394662246}', '13-05-2022', '2022-05-13 13:30:23', '2022-05-13 13:30:23'),
(382, 5, '{\"time\":\"2022-05-13T13:30:31.996Z\",\"latitude\":24.66557548044698,\"longitude\":46.704398487816896}', '13-05-2022', '2022-05-13 13:30:32', '2022-05-13 13:30:32'),
(383, 5, '{\"time\":\"2022-05-13T13:30:41.984Z\",\"latitude\":24.665577121968614,\"longitude\":46.704403532132936}', '13-05-2022', '2022-05-13 13:30:42', '2022-05-13 13:30:42'),
(384, 5, '{\"time\":\"2022-05-13T13:30:51.972Z\",\"latitude\":24.665579822691836,\"longitude\":46.70440354719867}', '13-05-2022', '2022-05-13 13:30:52', '2022-05-13 13:30:52'),
(385, 5, '{\"time\":\"2022-05-13T13:31:01.934Z\",\"latitude\":24.665588593049847,\"longitude\":46.704392988912936}', '13-05-2022', '2022-05-13 13:31:02', '2022-05-13 13:31:02'),
(386, 5, '{\"time\":\"2022-05-13T13:31:11.979Z\",\"latitude\":24.665592888346666,\"longitude\":46.70439535167569}', '13-05-2022', '2022-05-13 13:31:13', '2022-05-13 13:31:13'),
(387, 5, '{\"time\":\"2022-05-13T13:31:21.986Z\",\"latitude\":24.6655853745961,\"longitude\":46.70438650454736}', '13-05-2022', '2022-05-13 13:31:22', '2022-05-13 13:31:22'),
(388, 5, '{\"time\":\"2022-05-13T13:31:31.957Z\",\"latitude\":24.665581592374874,\"longitude\":46.7043975248018}', '13-05-2022', '2022-05-13 13:31:32', '2022-05-13 13:31:32'),
(389, 5, '{\"time\":\"2022-05-13T13:31:41.974Z\",\"latitude\":24.665567746092705,\"longitude\":46.704382552265464}', '13-05-2022', '2022-05-13 13:31:43', '2022-05-13 13:31:43'),
(390, 5, '{\"time\":\"2022-05-13T13:31:51.985Z\",\"latitude\":24.665593604179065,\"longitude\":46.70440301523016}', '13-05-2022', '2022-05-13 13:31:52', '2022-05-13 13:31:52'),
(391, 5, '{\"time\":\"2022-05-13T13:32:01.937Z\",\"latitude\":24.665602995767497,\"longitude\":46.70438179493772}', '13-05-2022', '2022-05-13 13:32:02', '2022-05-13 13:32:02'),
(392, 5, '{\"time\":\"2022-05-13T13:32:11.972Z\",\"latitude\":24.665628542455636,\"longitude\":46.70437402360513}', '13-05-2022', '2022-05-13 13:32:12', '2022-05-13 13:32:12'),
(393, 5, '{\"time\":\"2022-05-13T13:32:21.965Z\",\"latitude\":24.66561842403449,\"longitude\":46.70434982137523}', '13-05-2022', '2022-05-13 13:32:23', '2022-05-13 13:32:23'),
(394, 5, '{\"time\":\"2022-05-13T13:32:31.983Z\",\"latitude\":24.665605034428925,\"longitude\":46.70435971406073}', '13-05-2022', '2022-05-13 13:32:32', '2022-05-13 13:32:32'),
(395, 5, '{\"time\":\"2022-05-13T13:32:41.967Z\",\"latitude\":24.66555180385884,\"longitude\":46.70437182822958}', '13-05-2022', '2022-05-13 13:32:41', '2022-05-13 13:32:41'),
(396, 5, '{\"time\":\"2022-05-13T13:32:51.989Z\",\"latitude\":24.66552986038096,\"longitude\":46.704376948669164}', '13-05-2022', '2022-05-13 13:32:52', '2022-05-13 13:32:52'),
(397, 5, '{\"time\":\"2022-05-13T13:33:01.989Z\",\"latitude\":24.66549021823186,\"longitude\":46.704374137390005}', '13-05-2022', '2022-05-13 13:33:02', '2022-05-13 13:33:02'),
(398, 5, '{\"time\":\"2022-05-13T13:33:12.018Z\",\"latitude\":24.665449119874896,\"longitude\":46.704383617683035}', '13-05-2022', '2022-05-13 13:33:12', '2022-05-13 13:33:12'),
(399, 5, '{\"time\":\"2022-05-13T13:33:21.986Z\",\"latitude\":24.665448788983188,\"longitude\":46.70443877793031}', '13-05-2022', '2022-05-13 13:33:23', '2022-05-13 13:33:23'),
(400, 5, '{\"time\":\"2022-05-13T13:33:31.949Z\",\"latitude\":24.665415014814023,\"longitude\":46.70443442772177}', '13-05-2022', '2022-05-13 13:33:32', '2022-05-13 13:33:32'),
(401, 5, '{\"time\":\"2022-05-13T13:33:41.969Z\",\"latitude\":24.66542659248574,\"longitude\":46.70442842352155}', '13-05-2022', '2022-05-13 13:33:42', '2022-05-13 13:33:42'),
(402, 5, '{\"time\":\"2022-05-13T13:33:51.900Z\",\"latitude\":24.665442479021042,\"longitude\":46.70442483675665}', '13-05-2022', '2022-05-13 13:33:51', '2022-05-13 13:33:51'),
(403, 5, '{\"time\":\"2022-05-13T13:34:01.925Z\",\"latitude\":24.6654622547316,\"longitude\":46.70440188678146}', '13-05-2022', '2022-05-13 13:34:03', '2022-05-13 13:34:03'),
(404, 5, '{\"time\":\"2022-05-13T13:34:11.949Z\",\"latitude\":24.665536091781814,\"longitude\":46.704380992325376}', '13-05-2022', '2022-05-13 13:34:12', '2022-05-13 13:34:12'),
(405, 5, '{\"time\":\"2022-05-13T13:34:21.946Z\",\"latitude\":24.665540616424263,\"longitude\":46.70438115008141}', '13-05-2022', '2022-05-13 13:34:23', '2022-05-13 13:34:23'),
(406, 5, '{\"time\":\"2022-05-13T13:34:31.887Z\",\"latitude\":24.66553315968866,\"longitude\":46.70435998459976}', '13-05-2022', '2022-05-13 13:34:32', '2022-05-13 13:34:32'),
(407, 5, '{\"time\":\"2022-05-13T13:34:41.888Z\",\"latitude\":24.665549066516398,\"longitude\":46.70433643946719}', '13-05-2022', '2022-05-13 13:34:42', '2022-05-13 13:34:42'),
(408, 5, '{\"time\":\"2022-05-13T13:34:51.924Z\",\"latitude\":24.665524516337467,\"longitude\":46.704419703091155}', '13-05-2022', '2022-05-13 13:34:51', '2022-05-13 13:34:51'),
(409, 5, '{\"time\":\"2022-05-13T13:35:01.915Z\",\"latitude\":24.665537757559584,\"longitude\":46.7044315563314}', '13-05-2022', '2022-05-13 13:35:01', '2022-05-13 13:35:01'),
(410, 5, '{\"time\":\"2022-05-13T13:35:11.980Z\",\"latitude\":24.66553428010334,\"longitude\":46.70444567234991}', '13-05-2022', '2022-05-13 13:35:12', '2022-05-13 13:35:12'),
(411, 5, '{\"time\":\"2022-05-13T13:35:21.972Z\",\"latitude\":24.665536071639288,\"longitude\":46.70445167685877}', '13-05-2022', '2022-05-13 13:35:24', '2022-05-13 13:35:24'),
(412, 5, '{\"time\":\"2022-05-13T13:35:31.947Z\",\"latitude\":24.665543878076356,\"longitude\":46.70443644173561}', '13-05-2022', '2022-05-13 13:35:32', '2022-05-13 13:35:32'),
(413, 5, '{\"time\":\"2022-05-13T13:35:41.984Z\",\"latitude\":24.665552430407082,\"longitude\":46.70442062223493}', '13-05-2022', '2022-05-13 13:35:43', '2022-05-13 13:35:43'),
(414, 5, '{\"time\":\"2022-05-13T13:35:51.954Z\",\"latitude\":24.665561999441444,\"longitude\":46.70442040733775}', '13-05-2022', '2022-05-13 13:35:52', '2022-05-13 13:35:52'),
(415, 5, '{\"time\":\"2022-05-13T13:36:01.966Z\",\"latitude\":24.665573647021493,\"longitude\":46.70442392781166}', '13-05-2022', '2022-05-13 13:36:02', '2022-05-13 13:36:02'),
(416, 5, '{\"time\":\"2022-05-13T13:36:11.850Z\",\"latitude\":24.665573965389633,\"longitude\":46.70442013109274}', '13-05-2022', '2022-05-13 13:36:11', '2022-05-13 13:36:11'),
(417, 5, '{\"time\":\"2022-05-13T13:36:21.944Z\",\"latitude\":24.665571676370405,\"longitude\":46.70442043550654}', '13-05-2022', '2022-05-13 13:36:23', '2022-05-13 13:36:23'),
(418, 5, '{\"time\":\"2022-05-13T13:36:31.943Z\",\"latitude\":24.665577866497877,\"longitude\":46.70442507249957}', '13-05-2022', '2022-05-13 13:36:32', '2022-05-13 13:36:32'),
(419, 5, '{\"time\":\"2022-05-13T13:36:41.966Z\",\"latitude\":24.665570473187525,\"longitude\":46.70442567591859}', '13-05-2022', '2022-05-13 13:36:44', '2022-05-13 13:36:44'),
(420, 5, '{\"time\":\"2022-05-13T13:36:52.002Z\",\"latitude\":24.665565453872897,\"longitude\":46.70443256207951}', '13-05-2022', '2022-05-13 13:36:52', '2022-05-13 13:36:52'),
(421, 5, '{\"time\":\"2022-05-13T13:37:01.980Z\",\"latitude\":24.66556525102599,\"longitude\":46.704430934613484}', '13-05-2022', '2022-05-13 13:37:02', '2022-05-13 13:37:02'),
(422, 5, '{\"time\":\"2022-05-13T13:37:12.029Z\",\"latitude\":24.66556592864133,\"longitude\":46.704429360338814}', '13-05-2022', '2022-05-13 13:37:13', '2022-05-13 13:37:13'),
(423, 5, '{\"time\":\"2022-05-13T13:37:21.929Z\",\"latitude\":24.665551993344543,\"longitude\":46.70442851206777}', '13-05-2022', '2022-05-13 13:37:22', '2022-05-13 13:37:22'),
(424, 5, '{\"time\":\"2022-05-13T13:37:31.960Z\",\"latitude\":24.665549503688926,\"longitude\":46.704426644153926}', '13-05-2022', '2022-05-13 13:37:33', '2022-05-13 13:37:33'),
(425, 5, '{\"time\":\"2022-05-13T13:37:41.992Z\",\"latitude\":24.66552708261877,\"longitude\":46.704438243890124}', '13-05-2022', '2022-05-13 13:37:42', '2022-05-13 13:37:42'),
(426, 5, '{\"time\":\"2022-05-13T13:37:51.994Z\",\"latitude\":24.66552227830489,\"longitude\":46.70443700712448}', '13-05-2022', '2022-05-13 13:37:54', '2022-05-13 13:37:54'),
(427, 5, '{\"time\":\"2022-05-13T13:38:02.048Z\",\"latitude\":24.665525157619403,\"longitude\":46.70443614843103}', '13-05-2022', '2022-05-13 13:38:02', '2022-05-13 13:38:02'),
(428, 5, '{\"time\":\"2022-05-13T13:38:12.022Z\",\"latitude\":24.66552700552095,\"longitude\":46.70443482840691}', '13-05-2022', '2022-05-13 13:38:12', '2022-05-13 13:38:12'),
(429, 5, '{\"time\":\"2022-05-13T13:38:21.967Z\",\"latitude\":24.665525111266284,\"longitude\":46.70442287139078}', '13-05-2022', '2022-05-13 13:38:21', '2022-05-13 13:38:21'),
(430, 5, '{\"time\":\"2022-05-13T13:38:31.970Z\",\"latitude\":24.665528246567796,\"longitude\":46.704420095523965}', '13-05-2022', '2022-05-13 13:38:33', '2022-05-13 13:38:33'),
(431, 5, '{\"time\":\"2022-05-13T13:38:41.993Z\",\"latitude\":24.66553566039714,\"longitude\":46.704422694291374}', '13-05-2022', '2022-05-13 13:38:42', '2022-05-13 13:38:42'),
(432, 5, '{\"time\":\"2022-05-13T13:38:51.992Z\",\"latitude\":24.665542460081046,\"longitude\":46.70442800400321}', '13-05-2022', '2022-05-13 13:38:52', '2022-05-13 13:38:52'),
(433, 5, '{\"time\":\"2022-05-13T13:39:01.980Z\",\"latitude\":24.665538683837287,\"longitude\":46.70442240147626}', '13-05-2022', '2022-05-13 13:39:02', '2022-05-13 13:39:02'),
(434, 5, '{\"time\":\"2022-05-13T13:39:11.973Z\",\"latitude\":24.665540537689076,\"longitude\":46.70441698742748}', '13-05-2022', '2022-05-13 13:39:13', '2022-05-13 13:39:13'),
(435, 5, '{\"time\":\"2022-05-13T13:39:22.009Z\",\"latitude\":24.66554441250729,\"longitude\":46.704414115193124}', '13-05-2022', '2022-05-13 13:39:22', '2022-05-13 13:39:22'),
(436, 5, '{\"time\":\"2022-05-13T13:39:31.962Z\",\"latitude\":24.665556991161022,\"longitude\":46.70440514182133}', '13-05-2022', '2022-05-13 13:39:33', '2022-05-13 13:39:33'),
(437, 5, '{\"time\":\"2022-05-13T13:39:41.974Z\",\"latitude\":24.665559427026377,\"longitude\":46.70440231199358}', '13-05-2022', '2022-05-13 13:39:42', '2022-05-13 13:39:42'),
(438, 5, '{\"time\":\"2022-05-13T13:39:51.954Z\",\"latitude\":24.66556722743722,\"longitude\":46.70439521138649}', '13-05-2022', '2022-05-13 13:39:54', '2022-05-13 13:39:54'),
(439, 5, '{\"time\":\"2022-05-13T13:40:01.967Z\",\"latitude\":24.665562153017657,\"longitude\":46.70438933114811}', '13-05-2022', '2022-05-13 13:40:03', '2022-05-13 13:40:03'),
(440, 5, '{\"time\":\"2022-05-13T13:40:11.967Z\",\"latitude\":24.665561944033662,\"longitude\":46.70439169760697}', '13-05-2022', '2022-05-13 13:40:12', '2022-05-13 13:40:12'),
(441, 5, '{\"time\":\"2022-05-13T13:40:21.991Z\",\"latitude\":24.665562336385477,\"longitude\":46.70439710108729}', '13-05-2022', '2022-05-13 13:40:23', '2022-05-13 13:40:23'),
(442, 5, '{\"time\":\"2022-05-13T13:40:31.988Z\",\"latitude\":24.665556739463952,\"longitude\":46.70440314334601}', '13-05-2022', '2022-05-13 13:40:33', '2022-05-13 13:40:33'),
(443, 5, '{\"time\":\"2022-05-13T13:40:41.957Z\",\"latitude\":24.665550487189556,\"longitude\":46.704405418760786}', '13-05-2022', '2022-05-13 13:40:43', '2022-05-13 13:40:43'),
(444, 5, '{\"time\":\"2022-05-13T13:40:51.987Z\",\"latitude\":24.665548136160456,\"longitude\":46.70440169398262}', '13-05-2022', '2022-05-13 13:40:52', '2022-05-13 13:40:52'),
(445, 5, '{\"time\":\"2022-05-13T13:41:01.973Z\",\"latitude\":24.66555283877932,\"longitude\":46.704395274474514}', '13-05-2022', '2022-05-13 13:41:02', '2022-05-13 13:41:02'),
(446, 5, '{\"time\":\"2022-05-13T13:41:11.960Z\",\"latitude\":24.665560900671363,\"longitude\":46.70439424877465}', '13-05-2022', '2022-05-13 13:41:12', '2022-05-13 13:41:12'),
(447, 5, '{\"time\":\"2022-05-13T13:41:21.982Z\",\"latitude\":24.665555217996516,\"longitude\":46.70439888857038}', '13-05-2022', '2022-05-13 13:41:22', '2022-05-13 13:41:22'),
(448, 5, '{\"time\":\"2022-05-13T13:41:32.005Z\",\"latitude\":24.66556089973379,\"longitude\":46.70439863729027}', '13-05-2022', '2022-05-13 13:41:32', '2022-05-13 13:41:32'),
(449, 5, '{\"time\":\"2022-05-13T13:41:41.969Z\",\"latitude\":24.665566679147823,\"longitude\":46.704410897550524}', '13-05-2022', '2022-05-13 13:41:42', '2022-05-13 13:41:42'),
(450, 5, '{\"time\":\"2022-05-13T13:41:51.848Z\",\"latitude\":24.665570098496733,\"longitude\":46.704422143052525}', '13-05-2022', '2022-05-13 13:41:51', '2022-05-13 13:41:51'),
(451, 5, '{\"time\":\"2022-05-13T13:42:01.897Z\",\"latitude\":24.665567086370633,\"longitude\":46.704414992904965}', '13-05-2022', '2022-05-13 13:42:04', '2022-05-13 13:42:04'),
(452, 5, '{\"time\":\"2022-05-13T13:42:11.841Z\",\"latitude\":24.665571939106872,\"longitude\":46.70440892008737}', '13-05-2022', '2022-05-13 13:42:12', '2022-05-13 13:42:12'),
(453, 5, '{\"time\":\"2022-05-13T13:42:21.938Z\",\"latitude\":24.665568272136838,\"longitude\":46.70440415451536}', '13-05-2022', '2022-05-13 13:42:24', '2022-05-13 13:42:24'),
(454, 5, '{\"time\":\"2022-05-13T13:42:31.953Z\",\"latitude\":24.665569455264567,\"longitude\":46.70439028809385}', '13-05-2022', '2022-05-13 13:42:34', '2022-05-13 13:42:34'),
(455, 5, '{\"time\":\"2022-05-13T13:42:41.998Z\",\"latitude\":24.665538912588588,\"longitude\":46.70437454020118}', '13-05-2022', '2022-05-13 13:42:42', '2022-05-13 13:42:42'),
(456, 5, '{\"time\":\"2022-05-13T13:43:31.972Z\",\"latitude\":24.665563730856984,\"longitude\":46.70439475775237}', '13-05-2022', '2022-05-13 13:43:40', '2022-05-13 13:43:40'),
(457, 5, '{\"time\":\"2022-05-13T13:43:01.971Z\",\"latitude\":24.665540065768457,\"longitude\":46.70436741477627}', '13-05-2022', '2022-05-13 13:43:40', '2022-05-13 13:43:40'),
(458, 5, '{\"time\":\"2022-05-13T13:44:21.989Z\",\"latitude\":24.66558158953056,\"longitude\":46.70439693211617}', '13-05-2022', '2022-05-13 13:46:02', '2022-05-13 13:46:02'),
(459, 2, '{\"time\":\"2022-05-13T17:22:31.882Z\",\"latitude\":24.699541666666665,\"longitude\":46.708256666666664}', '13-05-2022', '2022-05-13 17:22:32', '2022-05-13 17:22:32'),
(460, 2, '{\"time\":\"2022-05-13T17:22:33.037Z\",\"latitude\":24.699856666666665,\"longitude\":46.708164999999994}', '13-05-2022', '2022-05-13 17:22:33', '2022-05-13 17:22:33'),
(461, 2, '{\"time\":\"2022-05-13T17:22:43.556Z\",\"latitude\":24.699768333333335,\"longitude\":46.70826999999999}', '13-05-2022', '2022-05-13 17:22:45', '2022-05-13 17:22:45'),
(462, 2, '{\"time\":\"2022-05-13T17:22:54.430Z\",\"latitude\":24.699994999999998,\"longitude\":46.708864999999996}', '13-05-2022', '2022-05-13 17:22:56', '2022-05-13 17:22:56'),
(463, 2, '{\"time\":\"2022-05-13T17:22:55.608Z\",\"latitude\":24.700541666666663,\"longitude\":46.70906166666667}', '13-05-2022', '2022-05-13 17:22:56', '2022-05-13 17:22:56'),
(464, 2, '{\"time\":\"2022-05-13T17:23:01.430Z\",\"latitude\":24.700751666666665,\"longitude\":46.70952333333333}', '13-05-2022', '2022-05-13 17:23:03', '2022-05-13 17:23:03'),
(465, 2, '{\"time\":\"2022-05-13T17:23:07.420Z\",\"latitude\":24.700813333333333,\"longitude\":46.70995333333334}', '13-05-2022', '2022-05-13 17:23:08', '2022-05-13 17:23:08'),
(466, 2, '{\"time\":\"2022-05-13T17:23:17.430Z\",\"latitude\":24.70154166666667,\"longitude\":46.711263333333335}', '13-05-2022', '2022-05-13 17:23:19', '2022-05-13 17:23:19'),
(467, 2, '{\"time\":\"2022-05-13T17:23:20.936Z\",\"latitude\":24.70192666666667,\"longitude\":46.71140333333333}', '13-05-2022', '2022-05-13 17:23:21', '2022-05-13 17:23:21'),
(468, 2, '{\"time\":\"2022-05-13T17:23:36.416Z\",\"latitude\":24.702728333333333,\"longitude\":46.713555}', '13-05-2022', '2022-05-13 17:23:38', '2022-05-13 17:23:38'),
(469, 2, '{\"time\":\"2022-05-13T17:23:52.441Z\",\"latitude\":24.703850000000003,\"longitude\":46.71544333333333}', '13-05-2022', '2022-05-13 17:23:54', '2022-05-13 17:23:54'),
(470, 2, '{\"time\":\"2022-05-13T17:25:33.436Z\",\"latitude\":24.702838333333336,\"longitude\":46.71342166666667}', '13-05-2022', '2022-05-13 17:25:35', '2022-05-13 17:25:35'),
(471, 2, '{\"time\":\"2022-05-13T17:25:49.425Z\",\"latitude\":24.701773333333335,\"longitude\":46.71150166666666}', '13-05-2022', '2022-05-13 17:25:51', '2022-05-13 17:25:51'),
(472, 2, '{\"time\":\"2022-05-13T17:26:05.421Z\",\"latitude\":24.70065833333333,\"longitude\":46.70952333333333}', '13-05-2022', '2022-05-13 17:26:07', '2022-05-13 17:26:07'),
(473, 2, '{\"time\":\"2022-05-13T17:26:19.430Z\",\"latitude\":24.699555,\"longitude\":46.707634999999996}', '13-05-2022', '2022-05-13 17:26:21', '2022-05-13 17:26:21'),
(474, 2, '{\"time\":\"2022-05-13T17:26:34.435Z\",\"latitude\":24.698393333333335,\"longitude\":46.70566166666667}', '13-05-2022', '2022-05-13 17:26:36', '2022-05-13 17:26:36'),
(475, 2, '{\"time\":\"2022-05-13T17:27:24.435Z\",\"latitude\":24.700260000000004,\"longitude\":46.70478}', '13-05-2022', '2022-05-13 17:27:26', '2022-05-13 17:27:26'),
(476, 2, '{\"time\":\"2022-05-13T17:27:25.605Z\",\"latitude\":24.700515000000003,\"longitude\":46.704735}', '13-05-2022', '2022-05-13 17:27:26', '2022-05-13 17:27:26'),
(477, 2, '{\"time\":\"2022-05-13T17:27:28.268Z\",\"latitude\":24.700586666666663,\"longitude\":46.704998333333336}', '13-05-2022', '2022-05-13 17:27:29', '2022-05-13 17:27:29'),
(478, 2, '{\"time\":\"2022-05-13T17:27:46.443Z\",\"latitude\":24.702566666666666,\"longitude\":46.70566166666667}', '13-05-2022', '2022-05-13 17:27:48', '2022-05-13 17:27:48'),
(479, 2, '{\"time\":\"2022-05-13T17:27:48.603Z\",\"latitude\":24.702555,\"longitude\":46.70584999999999}', '13-05-2022', '2022-05-13 17:27:49', '2022-05-13 17:27:49'),
(480, 2, '{\"time\":\"2022-05-13T17:27:51.268Z\",\"latitude\":24.702636666666663,\"longitude\":46.70591833333333}', '13-05-2022', '2022-05-13 17:27:52', '2022-05-13 17:27:52'),
(481, 2, '{\"time\":\"2022-05-13T17:28:01.485Z\",\"latitude\":24.703885,\"longitude\":46.70623333333333}', '13-05-2022', '2022-05-13 17:28:03', '2022-05-13 17:28:03'),
(482, 2, '{\"time\":\"2022-05-13T17:28:04.160Z\",\"latitude\":24.704091666666667,\"longitude\":46.70625166666667}', '13-05-2022', '2022-05-13 17:28:05', '2022-05-13 17:28:05'),
(483, 2, '{\"time\":\"2022-05-13T17:28:06.327Z\",\"latitude\":24.704248333333332,\"longitude\":46.70623833333334}', '13-05-2022', '2022-05-13 17:28:07', '2022-05-13 17:28:07'),
(484, 2, '{\"time\":\"2022-05-13T17:28:16.431Z\",\"latitude\":24.704473333333333,\"longitude\":46.70642833333333}', '13-05-2022', '2022-05-13 17:28:17', '2022-05-13 17:28:17'),
(485, 2, '{\"time\":\"2022-05-13T17:28:26.419Z\",\"latitude\":24.70451333333333,\"longitude\":46.706464999999994}', '13-05-2022', '2022-05-13 17:28:28', '2022-05-13 17:28:28'),
(486, 2, '{\"time\":\"2022-05-13T17:28:36.439Z\",\"latitude\":24.704520000000002,\"longitude\":46.70648500000001}', '13-05-2022', '2022-05-13 17:28:38', '2022-05-13 17:28:38'),
(487, 2, '{\"time\":\"2022-05-13T17:28:46.431Z\",\"latitude\":24.704526666666666,\"longitude\":46.706496666666666}', '13-05-2022', '2022-05-13 17:28:48', '2022-05-13 17:28:48'),
(488, 2, '{\"time\":\"2022-05-13T17:28:56.422Z\",\"latitude\":24.704554999999996,\"longitude\":46.70648833333333}', '13-05-2022', '2022-05-13 17:28:58', '2022-05-13 17:28:58'),
(489, 2, '{\"time\":\"2022-05-13T17:29:06.441Z\",\"latitude\":24.705004999999996,\"longitude\":46.70661499999999}', '13-05-2022', '2022-05-13 17:29:08', '2022-05-13 17:29:08'),
(490, 2, '{\"time\":\"2022-05-13T17:29:08.116Z\",\"latitude\":24.70500666666667,\"longitude\":46.706613333333344}', '13-05-2022', '2022-05-13 17:29:09', '2022-05-13 17:29:09'),
(491, 2, '{\"time\":\"2022-05-13T17:29:10.316Z\",\"latitude\":24.705016666666666,\"longitude\":46.70660666666666}', '13-05-2022', '2022-05-13 17:29:11', '2022-05-13 17:29:11'),
(492, 2, '{\"time\":\"2022-05-13T17:29:20.443Z\",\"latitude\":24.704880000000003,\"longitude\":46.70637833333333}', '13-05-2022', '2022-05-13 17:29:22', '2022-05-13 17:29:22'),
(493, 2, '{\"time\":\"2022-05-13T17:29:23.133Z\",\"latitude\":24.704610000000002,\"longitude\":46.70621166666667}', '13-05-2022', '2022-05-13 17:29:24', '2022-05-13 17:29:24'),
(494, 2, '{\"time\":\"2022-05-13T17:29:25.297Z\",\"latitude\":24.704583333333336,\"longitude\":46.70621500000001}', '13-05-2022', '2022-05-13 17:29:26', '2022-05-13 17:29:26'),
(495, 2, '{\"time\":\"2022-05-13T17:29:35.441Z\",\"latitude\":24.703283333333335,\"longitude\":46.705754999999996}', '13-05-2022', '2022-05-13 17:29:37', '2022-05-13 17:29:37'),
(496, 2, '{\"time\":\"2022-05-13T17:29:37.113Z\",\"latitude\":24.703035,\"longitude\":46.70578166666666}', '13-05-2022', '2022-05-13 17:29:37', '2022-05-13 17:29:37'),
(497, 2, '{\"time\":\"2022-05-13T17:29:47.432Z\",\"latitude\":24.70191833333333,\"longitude\":46.70521166666667}', '13-05-2022', '2022-05-13 17:29:49', '2022-05-13 17:29:49'),
(498, 2, '{\"time\":\"2022-05-13T17:29:49.090Z\",\"latitude\":24.701788333333337,\"longitude\":46.705144999999995}', '13-05-2022', '2022-05-13 17:29:49', '2022-05-13 17:29:49'),
(499, 2, '{\"time\":\"2022-05-13T17:30:08.447Z\",\"latitude\":24.69985166666667,\"longitude\":46.704385}', '13-05-2022', '2022-05-13 17:30:10', '2022-05-13 17:30:10'),
(500, 2, '{\"time\":\"2022-05-13T17:30:10.115Z\",\"latitude\":24.69973,\"longitude\":46.70443}', '13-05-2022', '2022-05-13 17:30:11', '2022-05-13 17:30:11'),
(501, 2, '{\"time\":\"2022-05-13T17:30:20.416Z\",\"latitude\":24.698840000000004,\"longitude\":46.70399666666667}', '13-05-2022', '2022-05-13 17:30:22', '2022-05-13 17:30:22'),
(502, 2, '{\"time\":\"2022-05-13T17:31:09.434Z\",\"latitude\":24.697963333333337,\"longitude\":46.70361333333334}', '13-05-2022', '2022-05-13 17:31:11', '2022-05-13 17:31:11'),
(503, 2, '{\"time\":\"2022-05-13T17:31:11.926Z\",\"latitude\":24.697758333333333,\"longitude\":46.70353166666667}', '13-05-2022', '2022-05-13 17:31:12', '2022-05-13 17:31:12'),
(504, 2, '{\"time\":\"2022-05-13T17:31:22.429Z\",\"latitude\":24.69704,\"longitude\":46.70323333333334}', '13-05-2022', '2022-05-13 17:31:24', '2022-05-13 17:31:24'),
(505, 2, '{\"time\":\"2022-05-13T17:31:24.453Z\",\"latitude\":24.696988333333334,\"longitude\":46.70320333333334}', '13-05-2022', '2022-05-13 17:31:25', '2022-05-13 17:31:25'),
(506, 2, '{\"time\":\"2022-05-13T17:31:26.601Z\",\"latitude\":24.696689999999997,\"longitude\":46.70318166666666}', '13-05-2022', '2022-05-13 17:31:27', '2022-05-13 17:31:27'),
(507, 2, '{\"time\":\"2022-05-13T17:31:37.439Z\",\"latitude\":24.695986666666666,\"longitude\":46.70289833333333}', '13-05-2022', '2022-05-13 17:31:39', '2022-05-13 17:31:39'),
(508, 2, '{\"time\":\"2022-05-13T17:31:39.147Z\",\"latitude\":24.695875,\"longitude\":46.70276166666666}', '13-05-2022', '2022-05-13 17:31:40', '2022-05-13 17:31:40'),
(509, 2, '{\"time\":\"2022-05-13T17:31:49.442Z\",\"latitude\":24.69520166666667,\"longitude\":46.70255999999999}', '13-05-2022', '2022-05-13 17:31:51', '2022-05-13 17:31:51'),
(510, 2, '{\"time\":\"2022-05-13T17:31:51.891Z\",\"latitude\":24.69507833333333,\"longitude\":46.70252166666668}', '13-05-2022', '2022-05-13 17:31:52', '2022-05-13 17:31:52'),
(511, 2, '{\"time\":\"2022-05-13T17:32:02.428Z\",\"latitude\":24.694171666666662,\"longitude\":46.70213666666667}', '13-05-2022', '2022-05-13 17:32:04', '2022-05-13 17:32:04'),
(512, 2, '{\"time\":\"2022-05-13T17:32:22.379Z\",\"latitude\":24.693323333333336,\"longitude\":46.70171333333333}', '13-05-2022', '2022-05-13 17:32:24', '2022-05-13 17:32:24'),
(513, 2, '{\"time\":\"2022-05-13T17:32:24.515Z\",\"latitude\":24.693114999999995,\"longitude\":46.70159666666667}', '13-05-2022', '2022-05-13 17:32:25', '2022-05-13 17:32:25'),
(514, 2, '{\"time\":\"2022-05-13T17:32:26.657Z\",\"latitude\":24.693001666666667,\"longitude\":46.70168166666667}', '13-05-2022', '2022-05-13 17:32:27', '2022-05-13 17:32:27'),
(515, 2, '{\"time\":\"2022-05-13T17:32:37.415Z\",\"latitude\":24.692378333333334,\"longitude\":46.701396666666675}', '13-05-2022', '2022-05-13 17:32:39', '2022-05-13 17:32:39'),
(516, 2, '{\"time\":\"2022-05-13T17:32:40.412Z\",\"latitude\":24.69222166666667,\"longitude\":46.701298333333334}', '13-05-2022', '2022-05-13 17:32:41', '2022-05-13 17:32:41'),
(517, 2, '{\"time\":\"2022-05-13T17:32:43.523Z\",\"latitude\":24.692183333333332,\"longitude\":46.701294999999995}', '13-05-2022', '2022-05-13 17:32:44', '2022-05-13 17:32:44'),
(518, 2, '{\"time\":\"2022-05-13T17:32:54.377Z\",\"latitude\":24.69118,\"longitude\":46.700921666666666}', '13-05-2022', '2022-05-13 17:32:56', '2022-05-13 17:32:56'),
(519, 2, '{\"time\":\"2022-05-13T17:32:57.068Z\",\"latitude\":24.69089333333333,\"longitude\":46.70077}', '13-05-2022', '2022-05-13 17:32:57', '2022-05-13 17:32:57'),
(520, 2, '{\"time\":\"2022-05-13T17:32:59.199Z\",\"latitude\":24.690795,\"longitude\":46.700745000000005}', '13-05-2022', '2022-05-13 17:33:00', '2022-05-13 17:33:00'),
(521, 2, '{\"time\":\"2022-05-13T17:33:09.422Z\",\"latitude\":24.689833333333333,\"longitude\":46.70043166666666}', '13-05-2022', '2022-05-13 17:33:11', '2022-05-13 17:33:11'),
(522, 2, '{\"time\":\"2022-05-13T17:33:11.594Z\",\"latitude\":24.689506666666663,\"longitude\":46.70021166666667}', '13-05-2022', '2022-05-13 17:33:12', '2022-05-13 17:33:12'),
(523, 2, '{\"time\":\"2022-05-13T17:33:12.751Z\",\"latitude\":24.68950166666667,\"longitude\":46.70022666666667}', '13-05-2022', '2022-05-13 17:33:13', '2022-05-13 17:33:13'),
(524, 2, '{\"time\":\"2022-05-13T17:33:23.447Z\",\"latitude\":24.68874166666667,\"longitude\":46.69989999999999}', '13-05-2022', '2022-05-13 17:33:25', '2022-05-13 17:33:25'),
(525, 2, '{\"time\":\"2022-05-13T17:33:25.735Z\",\"latitude\":24.68823166666667,\"longitude\":46.70007166666666}', '13-05-2022', '2022-05-13 17:33:26', '2022-05-13 17:33:26'),
(526, 2, '{\"time\":\"2022-05-13T17:33:27.853Z\",\"latitude\":24.688049999999997,\"longitude\":46.69990333333333}', '13-05-2022', '2022-05-13 17:33:28', '2022-05-13 17:33:28'),
(527, 2, '{\"time\":\"2022-05-13T17:33:38.443Z\",\"latitude\":24.68705333333333,\"longitude\":46.69930333333333}', '13-05-2022', '2022-05-13 17:33:40', '2022-05-13 17:33:40'),
(528, 2, '{\"time\":\"2022-05-13T17:33:40.573Z\",\"latitude\":24.686815000000003,\"longitude\":46.699155000000005}', '13-05-2022', '2022-05-13 17:33:41', '2022-05-13 17:33:41'),
(529, 2, '{\"time\":\"2022-05-13T17:33:58.461Z\",\"latitude\":24.684759999999997,\"longitude\":46.6989}', '13-05-2022', '2022-05-13 17:34:00', '2022-05-13 17:34:00'),
(530, 2, '{\"time\":\"2022-05-13T17:34:00.651Z\",\"latitude\":24.68451,\"longitude\":46.69911833333334}', '13-05-2022', '2022-05-13 17:34:01', '2022-05-13 17:34:01'),
(531, 2, '{\"time\":\"2022-05-13T17:34:02.829Z\",\"latitude\":24.68447833333333,\"longitude\":46.699153333333335}', '13-05-2022', '2022-05-13 17:34:03', '2022-05-13 17:34:03'),
(532, 2, '{\"time\":\"2022-05-13T17:34:13.405Z\",\"latitude\":24.684058333333336,\"longitude\":46.69926}', '13-05-2022', '2022-05-13 17:34:15', '2022-05-13 17:34:15'),
(533, 2, '{\"time\":\"2022-05-13T17:38:07.618Z\",\"latitude\":24.683528333333335,\"longitude\":46.70237333333333}', '13-05-2022', '2022-05-13 17:38:08', '2022-05-13 17:38:08'),
(534, 2, '{\"time\":\"2022-05-13T17:38:08.266Z\",\"latitude\":24.68353666666667,\"longitude\":46.702376666666666}', '13-05-2022', '2022-05-13 17:38:09', '2022-05-13 17:38:09'),
(535, 2, '{\"time\":\"2022-05-13T17:38:18.405Z\",\"latitude\":24.683243333333333,\"longitude\":46.70263333333334}', '13-05-2022', '2022-05-13 17:38:19', '2022-05-13 17:38:19'),
(536, 2, '{\"time\":\"2022-05-13T17:38:20.057Z\",\"latitude\":24.683238333333332,\"longitude\":46.70264}', '13-05-2022', '2022-05-13 17:38:20', '2022-05-13 17:38:20'),
(537, 2, '{\"time\":\"2022-05-13T17:38:21.702Z\",\"latitude\":24.683235,\"longitude\":46.70264333333333}', '13-05-2022', '2022-05-13 17:38:22', '2022-05-13 17:38:22'),
(538, 2, '{\"time\":\"2022-05-13T17:38:32.415Z\",\"latitude\":24.682528333333334,\"longitude\":46.70301833333333}', '13-05-2022', '2022-05-13 17:38:34', '2022-05-13 17:38:34'),
(539, 2, '{\"time\":\"2022-05-13T17:38:33.072Z\",\"latitude\":24.682316666666665,\"longitude\":46.70305833333334}', '13-05-2022', '2022-05-13 17:38:34', '2022-05-13 17:38:34'),
(540, 2, '{\"time\":\"2022-05-13T17:38:33.714Z\",\"latitude\":24.682316666666665,\"longitude\":46.70305166666667}', '13-05-2022', '2022-05-13 17:38:34', '2022-05-13 17:38:34'),
(541, 2, '{\"time\":\"2022-05-13T17:38:44.406Z\",\"latitude\":24.681718333333333,\"longitude\":46.703388333333336}', '13-05-2022', '2022-05-13 17:38:46', '2022-05-13 17:38:46'),
(542, 2, '{\"time\":\"2022-05-13T17:38:45.075Z\",\"latitude\":24.681715,\"longitude\":46.70367666666666}', '13-05-2022', '2022-05-13 17:38:46', '2022-05-13 17:38:46'),
(543, 2, '{\"time\":\"2022-05-13T17:38:46.720Z\",\"latitude\":24.68156333333333,\"longitude\":46.70346500000001}', '13-05-2022', '2022-05-13 17:38:47', '2022-05-13 17:38:47'),
(544, 2, '{\"time\":\"2022-05-13T17:38:57.388Z\",\"latitude\":24.681358333333332,\"longitude\":46.70363999999999}', '13-05-2022', '2022-05-13 17:38:59', '2022-05-13 17:38:59'),
(545, 2, '{\"time\":\"2022-05-13T17:39:07.395Z\",\"latitude\":24.681466666666665,\"longitude\":46.70382333333334}', '13-05-2022', '2022-05-13 17:39:09', '2022-05-13 17:39:09'),
(546, 2, '{\"time\":\"2022-05-13T17:39:17.427Z\",\"latitude\":24.681466666666665,\"longitude\":46.704213333333335}', '13-05-2022', '2022-05-13 17:39:19', '2022-05-13 17:39:19'),
(547, 2, '{\"time\":\"2022-05-13T17:39:20.087Z\",\"latitude\":24.681463333333333,\"longitude\":46.70421833333333}', '13-05-2022', '2022-05-13 17:39:21', '2022-05-13 17:39:21'),
(548, 2, '{\"time\":\"2022-05-13T17:39:22.723Z\",\"latitude\":24.68146166666667,\"longitude\":46.70422166666667}', '13-05-2022', '2022-05-13 17:39:23', '2022-05-13 17:39:23'),
(549, 2, '{\"time\":\"2022-05-13T17:39:33.433Z\",\"latitude\":24.681138333333333,\"longitude\":46.704571666666666}', '13-05-2022', '2022-05-13 17:39:35', '2022-05-13 17:39:35'),
(550, 2, '{\"time\":\"2022-05-13T17:39:39.429Z\",\"latitude\":24.681154999999997,\"longitude\":46.704631666666664}', '13-05-2022', '2022-05-13 17:39:41', '2022-05-13 17:39:41'),
(551, 2, '{\"time\":\"2022-05-13T17:39:42.573Z\",\"latitude\":24.681148333333333,\"longitude\":46.70463500000001}', '13-05-2022', '2022-05-13 17:39:43', '2022-05-13 17:39:43'),
(552, 2, '{\"time\":\"2022-05-13T17:39:53.447Z\",\"latitude\":24.681118333333334,\"longitude\":46.704721666666664}', '13-05-2022', '2022-05-13 17:39:55', '2022-05-13 17:39:55'),
(553, 2, '{\"time\":\"2022-05-13T17:40:03.417Z\",\"latitude\":24.68113333333333,\"longitude\":46.704763333333325}', '13-05-2022', '2022-05-13 17:40:15', '2022-05-13 17:40:15'),
(554, 2, '{\"time\":\"2022-05-13T17:40:13.406Z\",\"latitude\":24.681121666666666,\"longitude\":46.704771666666666}', '13-05-2022', '2022-05-13 17:40:15', '2022-05-13 17:40:15'),
(555, 2, '{\"time\":\"2022-05-13T17:40:23.417Z\",\"latitude\":24.681121666666666,\"longitude\":46.70478333333334}', '13-05-2022', '2022-05-13 17:40:24', '2022-05-13 17:40:24'),
(556, 2, '{\"time\":\"2022-05-13T17:40:33.420Z\",\"latitude\":24.681121666666666,\"longitude\":46.70478333333334}', '13-05-2022', '2022-05-13 17:40:35', '2022-05-13 17:40:35'),
(557, 2, '{\"time\":\"2022-05-13T17:40:43.406Z\",\"latitude\":24.681121666666666,\"longitude\":46.70478333333334}', '13-05-2022', '2022-05-13 17:40:45', '2022-05-13 17:40:45'),
(558, 2, '{\"time\":\"2022-05-13T17:40:53.411Z\",\"latitude\":24.68117666666667,\"longitude\":46.70482333333333}', '13-05-2022', '2022-05-13 17:40:55', '2022-05-13 17:40:55'),
(559, 2, '{\"time\":\"2022-05-13T17:41:03.426Z\",\"latitude\":24.681205,\"longitude\":46.704943333333325}', '13-05-2022', '2022-05-13 17:41:05', '2022-05-13 17:41:05'),
(560, 2, '{\"time\":\"2022-05-13T17:41:13.427Z\",\"latitude\":24.681201666666666,\"longitude\":46.70491333333333}', '13-05-2022', '2022-05-13 17:41:15', '2022-05-13 17:41:15'),
(561, 2, '{\"time\":\"2022-05-13T17:41:23.409Z\",\"latitude\":24.68119166666667,\"longitude\":46.704908333333336}', '13-05-2022', '2022-05-13 17:41:25', '2022-05-13 17:41:25'),
(562, 2, '{\"time\":\"2022-05-13T17:41:33.416Z\",\"latitude\":24.681214999999998,\"longitude\":46.70492333333333}', '13-05-2022', '2022-05-13 17:41:35', '2022-05-13 17:41:35'),
(563, 2, '{\"time\":\"2022-05-13T17:41:43.388Z\",\"latitude\":24.681214999999998,\"longitude\":46.70492333333333}', '13-05-2022', '2022-05-13 17:41:45', '2022-05-13 17:41:45'),
(564, 2, '{\"time\":\"2022-05-13T17:41:53.395Z\",\"latitude\":24.681235,\"longitude\":46.704910000000005}', '13-05-2022', '2022-05-13 17:41:55', '2022-05-13 17:41:55'),
(565, 2, '{\"time\":\"2022-05-13T17:42:03.396Z\",\"latitude\":24.681273333333333,\"longitude\":46.70497}', '13-05-2022', '2022-05-13 17:42:05', '2022-05-13 17:42:05'),
(566, 2, '{\"time\":\"2022-05-13T17:42:13.404Z\",\"latitude\":24.681363333333334,\"longitude\":46.70516166666666}', '13-05-2022', '2022-05-13 17:42:15', '2022-05-13 17:42:15'),
(567, 2, '{\"time\":\"2022-05-13T17:42:23.400Z\",\"latitude\":24.681348333333336,\"longitude\":46.705193333333334}', '13-05-2022', '2022-05-13 17:42:24', '2022-05-13 17:42:24'),
(568, 2, '{\"time\":\"2022-05-13T17:42:33.394Z\",\"latitude\":24.68136,\"longitude\":46.7052}', '13-05-2022', '2022-05-13 17:42:35', '2022-05-13 17:42:35'),
(569, 2, '{\"time\":\"2022-05-13T17:42:43.403Z\",\"latitude\":24.681364999999996,\"longitude\":46.705191666666664}', '13-05-2022', '2022-05-13 17:42:45', '2022-05-13 17:42:45'),
(570, 2, '{\"time\":\"2022-05-13T17:42:53.391Z\",\"latitude\":24.681364999999996,\"longitude\":46.705191666666664}', '13-05-2022', '2022-05-13 17:42:55', '2022-05-13 17:42:55'),
(571, 2, '{\"time\":\"2022-05-13T17:43:03.397Z\",\"latitude\":24.681355,\"longitude\":46.705236666666664}', '13-05-2022', '2022-05-13 17:43:05', '2022-05-13 17:43:05'),
(572, 2, '{\"time\":\"2022-05-13T17:43:13.402Z\",\"latitude\":24.68138333333333,\"longitude\":46.70532333333334}', '13-05-2022', '2022-05-13 17:43:15', '2022-05-13 17:43:15'),
(573, 2, '{\"time\":\"2022-05-13T17:43:23.431Z\",\"latitude\":24.681123333333336,\"longitude\":46.70544333333334}', '13-05-2022', '2022-05-13 17:43:25', '2022-05-13 17:43:25');
INSERT INTO `track_employees` (`id`, `user_id`, `location`, `date`, `created_at`, `updated_at`) VALUES
(574, 2, '{\"time\":\"2022-05-13T17:43:24.923Z\",\"latitude\":24.681121666666666,\"longitude\":46.70544333333334}', '13-05-2022', '2022-05-13 17:43:25', '2022-05-13 17:43:25'),
(575, 2, '{\"time\":\"2022-05-13T17:43:27.802Z\",\"latitude\":24.681111666666666,\"longitude\":46.705450000000006}', '13-05-2022', '2022-05-13 17:43:28', '2022-05-13 17:43:28'),
(576, 2, '{\"time\":\"2022-05-13T17:43:38.446Z\",\"latitude\":24.680815,\"longitude\":46.705621666666666}', '13-05-2022', '2022-05-13 17:43:40', '2022-05-13 17:43:40'),
(577, 2, '{\"time\":\"2022-05-13T17:43:41.444Z\",\"latitude\":24.680805000000003,\"longitude\":46.70562833333334}', '13-05-2022', '2022-05-13 17:43:42', '2022-05-13 17:43:42'),
(578, 2, '{\"time\":\"2022-05-13T17:43:44.416Z\",\"latitude\":24.680794999999996,\"longitude\":46.70563666666667}', '13-05-2022', '2022-05-13 17:43:45', '2022-05-13 17:43:45'),
(579, 2, '{\"time\":\"2022-05-13T17:43:54.410Z\",\"latitude\":24.68051666666667,\"longitude\":46.70581333333333}', '13-05-2022', '2022-05-13 17:43:56', '2022-05-13 17:43:56'),
(580, 2, '{\"time\":\"2022-05-13T17:44:04.514Z\",\"latitude\":24.680456666666668,\"longitude\":46.70583333333334}', '13-05-2022', '2022-05-13 17:44:06', '2022-05-13 17:44:06'),
(581, 2, '{\"time\":\"2022-05-13T17:44:14.432Z\",\"latitude\":24.680421666666668,\"longitude\":46.70584999999999}', '13-05-2022', '2022-05-13 17:44:16', '2022-05-13 17:44:16'),
(582, 2, '{\"time\":\"2022-05-13T17:44:24.427Z\",\"latitude\":24.680401666666665,\"longitude\":46.70586166666667}', '13-05-2022', '2022-05-13 17:44:26', '2022-05-13 17:44:26'),
(583, 2, '{\"time\":\"2022-05-13T17:44:34.429Z\",\"latitude\":24.680401666666665,\"longitude\":46.70586166666667}', '13-05-2022', '2022-05-13 17:44:36', '2022-05-13 17:44:36'),
(584, 2, '{\"time\":\"2022-05-13T17:44:44.436Z\",\"latitude\":24.680401666666665,\"longitude\":46.70586166666667}', '13-05-2022', '2022-05-13 17:44:46', '2022-05-13 17:44:46'),
(585, 2, '{\"time\":\"2022-05-13T17:44:54.435Z\",\"latitude\":24.680265000000002,\"longitude\":46.70592166666667}', '13-05-2022', '2022-05-13 17:44:56', '2022-05-13 17:44:56'),
(586, 2, '{\"time\":\"2022-05-13T17:45:04.428Z\",\"latitude\":24.68014833333333,\"longitude\":46.70590166666666}', '13-05-2022', '2022-05-13 17:45:06', '2022-05-13 17:45:06'),
(587, 2, '{\"time\":\"2022-05-13T17:45:14.510Z\",\"latitude\":24.680031666666665,\"longitude\":46.705915000000005}', '13-05-2022', '2022-05-13 17:45:16', '2022-05-13 17:45:16'),
(588, 2, '{\"time\":\"2022-05-13T17:45:24.433Z\",\"latitude\":24.680016666666667,\"longitude\":46.70590166666666}', '13-05-2022', '2022-05-13 17:45:26', '2022-05-13 17:45:26'),
(589, 2, '{\"time\":\"2022-05-13T17:45:34.427Z\",\"latitude\":24.680016666666667,\"longitude\":46.70590166666666}', '13-05-2022', '2022-05-13 17:45:36', '2022-05-13 17:45:36'),
(590, 2, '{\"time\":\"2022-05-13T17:45:44.433Z\",\"latitude\":24.680016666666667,\"longitude\":46.70590166666666}', '13-05-2022', '2022-05-13 17:45:46', '2022-05-13 17:45:46'),
(591, 2, '{\"time\":\"2022-05-13T17:45:54.432Z\",\"latitude\":24.679973333333336,\"longitude\":46.70593833333334}', '13-05-2022', '2022-05-13 17:45:56', '2022-05-13 17:45:56'),
(592, 2, '{\"time\":\"2022-05-13T17:46:04.431Z\",\"latitude\":24.679815,\"longitude\":46.70598499999999}', '13-05-2022', '2022-05-13 17:46:06', '2022-05-13 17:46:06'),
(593, 2, '{\"time\":\"2022-05-13T17:46:14.425Z\",\"latitude\":24.679803333333332,\"longitude\":46.70599666666667}', '13-05-2022', '2022-05-13 17:46:16', '2022-05-13 17:46:16'),
(594, 2, '{\"time\":\"2022-05-13T17:46:24.433Z\",\"latitude\":24.679813333333332,\"longitude\":46.70605166666666}', '13-05-2022', '2022-05-13 17:46:26', '2022-05-13 17:46:26'),
(595, 2, '{\"time\":\"2022-05-13T17:46:34.433Z\",\"latitude\":24.679808333333334,\"longitude\":46.70614166666666}', '13-05-2022', '2022-05-13 17:46:36', '2022-05-13 17:46:36'),
(596, 2, '{\"time\":\"2022-05-13T17:46:44.507Z\",\"latitude\":24.679688333333335,\"longitude\":46.70642833333333}', '13-05-2022', '2022-05-13 17:46:46', '2022-05-13 17:46:46'),
(597, 2, '{\"time\":\"2022-05-13T17:46:46.482Z\",\"latitude\":24.679688333333335,\"longitude\":46.70643166666667}', '13-05-2022', '2022-05-13 17:46:47', '2022-05-13 17:46:47'),
(598, 2, '{\"time\":\"2022-05-13T17:46:48.631Z\",\"latitude\":24.679688333333335,\"longitude\":46.70643166666667}', '13-05-2022', '2022-05-13 17:46:49', '2022-05-13 17:46:49'),
(599, 2, '{\"time\":\"2022-05-13T17:46:59.444Z\",\"latitude\":24.679224999999995,\"longitude\":46.70621666666666}', '13-05-2022', '2022-05-13 17:47:01', '2022-05-13 17:47:01'),
(600, 2, '{\"time\":\"2022-05-13T17:47:02.142Z\",\"latitude\":24.678938333333335,\"longitude\":46.70579833333333}', '13-05-2022', '2022-05-13 17:47:03', '2022-05-13 17:47:03'),
(601, 2, '{\"time\":\"2022-05-13T17:47:05.587Z\",\"latitude\":24.678626666666666,\"longitude\":46.70588833333333}', '13-05-2022', '2022-05-13 17:47:06', '2022-05-13 17:47:06'),
(602, 2, '{\"time\":\"2022-05-13T17:47:08.567Z\",\"latitude\":24.678350000000002,\"longitude\":46.70538166666667}', '13-05-2022', '2022-05-13 17:47:09', '2022-05-13 17:47:09'),
(603, 2, '{\"time\":\"2022-05-13T17:47:12.044Z\",\"latitude\":24.678028333333334,\"longitude\":46.70511166666667}', '13-05-2022', '2022-05-13 17:47:24', '2022-05-13 17:47:24'),
(604, 2, '{\"time\":\"2022-05-13T17:47:22.404Z\",\"latitude\":24.677010000000003,\"longitude\":46.70451}', '13-05-2022', '2022-05-13 17:47:24', '2022-05-13 17:47:24'),
(605, 2, '{\"time\":\"2022-05-13T17:47:24.587Z\",\"latitude\":24.676716666666668,\"longitude\":46.70460166666667}', '13-05-2022', '2022-05-13 17:47:25', '2022-05-13 17:47:25'),
(606, 2, '{\"time\":\"2022-05-13T17:47:26.247Z\",\"latitude\":24.67655166666667,\"longitude\":46.70423833333333}', '13-05-2022', '2022-05-13 17:47:27', '2022-05-13 17:47:27'),
(607, 2, '{\"time\":\"2022-05-13T17:47:27.893Z\",\"latitude\":24.676615,\"longitude\":46.704125000000005}', '13-05-2022', '2022-05-13 17:47:28', '2022-05-13 17:47:28'),
(608, 2, '{\"time\":\"2022-05-13T17:47:38.446Z\",\"latitude\":24.675805,\"longitude\":46.70364333333334}', '13-05-2022', '2022-05-13 17:47:40', '2022-05-13 17:47:40'),
(609, 2, '{\"time\":\"2022-05-13T17:47:41.115Z\",\"latitude\":24.675784999999998,\"longitude\":46.70362166666667}', '13-05-2022', '2022-05-13 17:47:42', '2022-05-13 17:47:42'),
(610, 2, '{\"time\":\"2022-05-13T17:47:51.421Z\",\"latitude\":24.675810000000002,\"longitude\":46.70365166666667}', '13-05-2022', '2022-05-13 17:47:53', '2022-05-13 17:47:53'),
(611, 2, '{\"time\":\"2022-05-13T17:48:01.427Z\",\"latitude\":24.67580666666667,\"longitude\":46.70368}', '13-05-2022', '2022-05-13 17:48:03', '2022-05-13 17:48:03'),
(612, 2, '{\"time\":\"2022-05-13T17:48:11.421Z\",\"latitude\":24.675805,\"longitude\":46.70366666666667}', '13-05-2022', '2022-05-13 17:48:13', '2022-05-13 17:48:13'),
(613, 2, '{\"time\":\"2022-05-13T17:48:21.431Z\",\"latitude\":24.67580666666667,\"longitude\":46.70365833333334}', '13-05-2022', '2022-05-13 17:48:23', '2022-05-13 17:48:23'),
(614, 2, '{\"time\":\"2022-05-13T17:48:31.424Z\",\"latitude\":24.67580666666667,\"longitude\":46.70365833333334}', '13-05-2022', '2022-05-13 17:48:33', '2022-05-13 17:48:33'),
(615, 2, '{\"time\":\"2022-05-13T17:48:41.450Z\",\"latitude\":24.675684999999998,\"longitude\":46.70357333333333}', '13-05-2022', '2022-05-13 17:48:43', '2022-05-13 17:48:43'),
(616, 2, '{\"time\":\"2022-05-13T17:48:45.144Z\",\"latitude\":24.675663333333333,\"longitude\":46.70357333333333}', '13-05-2022', '2022-05-13 17:48:46', '2022-05-13 17:48:46'),
(617, 2, '{\"time\":\"2022-05-13T17:48:48.323Z\",\"latitude\":24.675621666666665,\"longitude\":46.70360000000001}', '13-05-2022', '2022-05-13 17:48:49', '2022-05-13 17:48:49'),
(618, 2, '{\"time\":\"2022-05-13T17:48:58.432Z\",\"latitude\":24.674185000000005,\"longitude\":46.703894999999996}', '13-05-2022', '2022-05-13 17:49:00', '2022-05-13 17:49:00'),
(619, 2, '{\"time\":\"2022-05-13T17:49:00.596Z\",\"latitude\":24.673993333333335,\"longitude\":46.70410166666667}', '13-05-2022', '2022-05-13 17:49:01', '2022-05-13 17:49:01'),
(620, 2, '{\"time\":\"2022-05-13T17:49:03.272Z\",\"latitude\":24.673778333333335,\"longitude\":46.70418166666666}', '13-05-2022', '2022-05-13 17:49:04', '2022-05-13 17:49:04'),
(621, 2, '{\"time\":\"2022-05-13T17:49:13.446Z\",\"latitude\":24.67263833333333,\"longitude\":46.70476999999999}', '13-05-2022', '2022-05-13 17:49:15', '2022-05-13 17:49:15'),
(622, 2, '{\"time\":\"2022-05-13T17:49:16.943Z\",\"latitude\":24.67227666666667,\"longitude\":46.704988333333326}', '13-05-2022', '2022-05-13 17:49:17', '2022-05-13 17:49:17'),
(623, 2, '{\"time\":\"2022-05-13T17:49:19.608Z\",\"latitude\":24.672166666666666,\"longitude\":46.70514}', '13-05-2022', '2022-05-13 17:49:20', '2022-05-13 17:49:20'),
(624, 2, '{\"time\":\"2022-05-13T17:49:30.439Z\",\"latitude\":24.670659999999998,\"longitude\":46.70584166666666}', '13-05-2022', '2022-05-13 17:49:32', '2022-05-13 17:49:32'),
(625, 2, '{\"time\":\"2022-05-13T17:49:34.138Z\",\"latitude\":24.670616666666668,\"longitude\":46.70623833333334}', '13-05-2022', '2022-05-13 17:49:35', '2022-05-13 17:49:35'),
(626, 2, '{\"time\":\"2022-05-13T17:49:37.809Z\",\"latitude\":24.670389999999998,\"longitude\":46.70641333333333}', '13-05-2022', '2022-05-13 17:49:38', '2022-05-13 17:49:38'),
(627, 2, '{\"time\":\"2022-05-13T17:49:48.444Z\",\"latitude\":24.668521666666667,\"longitude\":46.70671166666666}', '13-05-2022', '2022-05-13 17:49:50', '2022-05-13 17:49:50'),
(628, 2, '{\"time\":\"2022-05-13T17:49:51.443Z\",\"latitude\":24.668336666666665,\"longitude\":46.70672166666667}', '13-05-2022', '2022-05-13 17:49:52', '2022-05-13 17:49:52'),
(629, 2, '{\"time\":\"2022-05-13T17:49:54.892Z\",\"latitude\":24.668043333333337,\"longitude\":46.70693166666667}', '13-05-2022', '2022-05-13 17:49:55', '2022-05-13 17:49:55'),
(630, 2, '{\"time\":\"2022-05-13T17:50:05.452Z\",\"latitude\":24.666625,\"longitude\":46.707408333333326}', '13-05-2022', '2022-05-13 17:50:07', '2022-05-13 17:50:07'),
(631, 2, '{\"time\":\"2022-05-13T17:50:09.447Z\",\"latitude\":24.666201666666666,\"longitude\":46.70764166666666}', '13-05-2022', '2022-05-13 17:50:10', '2022-05-13 17:50:10'),
(632, 2, '{\"time\":\"2022-05-13T17:50:12.092Z\",\"latitude\":24.665806666666672,\"longitude\":46.70762333333334}', '13-05-2022', '2022-05-13 17:50:13', '2022-05-13 17:50:13'),
(633, 2, '{\"time\":\"2022-05-13T17:50:22.432Z\",\"latitude\":24.665655,\"longitude\":46.707705000000004}', '13-05-2022', '2022-05-13 17:50:24', '2022-05-13 17:50:24'),
(634, 2, '{\"time\":\"2022-05-13T17:50:32.395Z\",\"latitude\":24.66556166666667,\"longitude\":46.70759666666666}', '13-05-2022', '2022-05-13 17:50:34', '2022-05-13 17:50:34'),
(635, 2, '{\"time\":\"2022-05-13T17:50:42.391Z\",\"latitude\":24.665121666666664,\"longitude\":46.70769}', '13-05-2022', '2022-05-13 17:50:44', '2022-05-13 17:50:44'),
(636, 2, '{\"time\":\"2022-05-13T17:50:45.064Z\",\"latitude\":24.665028333333332,\"longitude\":46.70784833333334}', '13-05-2022', '2022-05-13 17:50:45', '2022-05-13 17:50:45'),
(637, 2, '{\"time\":\"2022-05-13T17:50:46.693Z\",\"latitude\":24.664953333333333,\"longitude\":46.707881666666665}', '13-05-2022', '2022-05-13 17:50:47', '2022-05-13 17:50:47'),
(638, 2, '{\"time\":\"2022-05-13T17:50:57.408Z\",\"latitude\":24.664048333333334,\"longitude\":46.70819333333334}', '13-05-2022', '2022-05-13 17:50:59', '2022-05-13 17:50:59'),
(639, 2, '{\"time\":\"2022-05-13T17:50:59.061Z\",\"latitude\":24.66378166666667,\"longitude\":46.708245000000005}', '13-05-2022', '2022-05-13 17:50:59', '2022-05-13 17:50:59'),
(640, 2, '{\"time\":\"2022-05-13T17:51:09.395Z\",\"latitude\":24.662764999999997,\"longitude\":46.70872166666666}', '13-05-2022', '2022-05-13 17:51:11', '2022-05-13 17:51:11'),
(641, 2, '{\"time\":\"2022-05-13T17:51:11.066Z\",\"latitude\":24.662388333333336,\"longitude\":46.708661666666664}', '13-05-2022', '2022-05-13 17:51:11', '2022-05-13 17:51:11'),
(642, 2, '{\"time\":\"2022-05-13T17:51:12.204Z\",\"latitude\":24.662435,\"longitude\":46.708831666666676}', '13-05-2022', '2022-05-13 17:51:13', '2022-05-13 17:51:13'),
(643, 2, '{\"time\":\"2022-05-13T17:51:13.348Z\",\"latitude\":24.662283333333335,\"longitude\":46.708796666666665}', '13-05-2022', '2022-05-13 17:51:14', '2022-05-13 17:51:14'),
(644, 2, '{\"time\":\"2022-05-13T17:51:31.397Z\",\"latitude\":24.660308333333333,\"longitude\":46.709619999999994}', '13-05-2022', '2022-05-13 17:51:33', '2022-05-13 17:51:33'),
(645, 2, '{\"time\":\"2022-05-13T17:51:48.379Z\",\"latitude\":24.658316666666664,\"longitude\":46.71041333333333}', '13-05-2022', '2022-05-13 17:51:50', '2022-05-13 17:51:50'),
(646, 2, '{\"time\":\"2022-05-13T17:52:04.398Z\",\"latitude\":24.656364999999997,\"longitude\":46.711153333333336}', '13-05-2022', '2022-05-13 17:52:06', '2022-05-13 17:52:06'),
(647, 2, '{\"time\":\"2022-05-13T17:52:23.401Z\",\"latitude\":24.65442666666667,\"longitude\":46.71193}', '13-05-2022', '2022-05-13 17:52:25', '2022-05-13 17:52:25'),
(648, 2, '{\"time\":\"2022-05-13T17:52:25.059Z\",\"latitude\":24.653959999999998,\"longitude\":46.71148166666667}', '13-05-2022', '2022-05-13 17:52:25', '2022-05-13 17:52:25'),
(649, 2, '{\"time\":\"2022-05-13T17:52:27.701Z\",\"latitude\":24.654428333333332,\"longitude\":46.71203333333333}', '13-05-2022', '2022-05-13 17:52:28', '2022-05-13 17:52:28'),
(650, 2, '{\"time\":\"2022-05-13T17:52:38.402Z\",\"latitude\":24.654331666666668,\"longitude\":46.71198}', '13-05-2022', '2022-05-13 17:52:40', '2022-05-13 17:52:40'),
(651, 2, '{\"time\":\"2022-05-13T17:52:48.390Z\",\"latitude\":24.65429166666667,\"longitude\":46.71196333333334}', '13-05-2022', '2022-05-13 17:52:50', '2022-05-13 17:52:50'),
(652, 2, '{\"time\":\"2022-05-13T17:52:58.410Z\",\"latitude\":24.65425,\"longitude\":46.71197}', '13-05-2022', '2022-05-13 17:53:00', '2022-05-13 17:53:00'),
(653, 2, '{\"time\":\"2022-05-13T17:53:08.388Z\",\"latitude\":24.65418833333333,\"longitude\":46.71200333333333}', '13-05-2022', '2022-05-13 17:53:10', '2022-05-13 17:53:10'),
(654, 2, '{\"time\":\"2022-05-13T17:53:18.409Z\",\"latitude\":24.65417166666667,\"longitude\":46.711998333333334}', '13-05-2022', '2022-05-13 17:53:19', '2022-05-13 17:53:19'),
(655, 2, '{\"time\":\"2022-05-13T17:53:28.409Z\",\"latitude\":24.654183333333336,\"longitude\":46.711951666666664}', '13-05-2022', '2022-05-13 17:53:30', '2022-05-13 17:53:30'),
(656, 2, '{\"time\":\"2022-05-13T17:53:38.402Z\",\"latitude\":24.654181666666666,\"longitude\":46.712025}', '13-05-2022', '2022-05-13 17:53:40', '2022-05-13 17:53:40'),
(657, 2, '{\"time\":\"2022-05-13T17:53:48.433Z\",\"latitude\":24.653678333333332,\"longitude\":46.71216833333333}', '13-05-2022', '2022-05-13 17:53:50', '2022-05-13 17:53:50'),
(658, 2, '{\"time\":\"2022-05-13T17:53:49.871Z\",\"latitude\":24.653328333333334,\"longitude\":46.712133333333334}', '13-05-2022', '2022-05-13 17:53:50', '2022-05-13 17:53:50'),
(659, 2, '{\"time\":\"2022-05-13T17:53:52.760Z\",\"latitude\":24.653133333333336,\"longitude\":46.71206833333334}', '13-05-2022', '2022-05-13 17:53:53', '2022-05-13 17:53:53'),
(660, 2, '{\"time\":\"2022-05-13T17:53:57.731Z\",\"latitude\":24.653116666666666,\"longitude\":46.71261500000001}', '13-05-2022', '2022-05-13 17:53:58', '2022-05-13 17:53:58'),
(661, 2, '{\"time\":\"2022-05-13T17:54:08.435Z\",\"latitude\":24.65336,\"longitude\":46.71319833333334}', '13-05-2022', '2022-05-13 17:54:10', '2022-05-13 17:54:10'),
(662, 2, '{\"time\":\"2022-05-13T17:54:11.129Z\",\"latitude\":24.6534,\"longitude\":46.713280000000005}', '13-05-2022', '2022-05-13 17:54:12', '2022-05-13 17:54:12'),
(663, 2, '{\"time\":\"2022-05-13T17:54:13.839Z\",\"latitude\":24.65351333333333,\"longitude\":46.71415833333334}', '13-05-2022', '2022-05-13 17:54:14', '2022-05-13 17:54:14'),
(664, 2, '{\"time\":\"2022-05-13T17:54:15.794Z\",\"latitude\":24.65349,\"longitude\":46.71428833333333}', '13-05-2022', '2022-05-13 17:54:16', '2022-05-13 17:54:16'),
(665, 2, '{\"time\":\"2022-05-13T17:54:26.447Z\",\"latitude\":24.65384333333333,\"longitude\":46.71589166666666}', '13-05-2022', '2022-05-13 17:54:28', '2022-05-13 17:54:28'),
(666, 2, '{\"time\":\"2022-05-13T17:54:27.917Z\",\"latitude\":24.654163333333333,\"longitude\":46.71582166666667}', '13-05-2022', '2022-05-13 17:54:28', '2022-05-13 17:54:28'),
(667, 2, '{\"time\":\"2022-05-13T17:54:38.523Z\",\"latitude\":24.654988333333336,\"longitude\":46.71676333333333}', '13-05-2022', '2022-05-13 17:54:40', '2022-05-13 17:54:40'),
(668, 2, '{\"time\":\"2022-05-13T17:54:39.991Z\",\"latitude\":24.655160000000002,\"longitude\":46.71698500000001}', '13-05-2022', '2022-05-13 17:54:40', '2022-05-13 17:54:40'),
(669, 2, '{\"time\":\"2022-05-13T17:54:56.437Z\",\"latitude\":24.656515,\"longitude\":46.718700000000005}', '13-05-2022', '2022-05-13 17:54:58', '2022-05-13 17:54:58'),
(670, 2, '{\"time\":\"2022-05-13T17:55:11.430Z\",\"latitude\":24.657643333333333,\"longitude\":46.72073999999999}', '13-05-2022', '2022-05-13 17:55:13', '2022-05-13 17:55:13'),
(671, 2, '{\"time\":\"2022-05-13T17:55:25.514Z\",\"latitude\":24.658776666666668,\"longitude\":46.72273499999999}', '13-05-2022', '2022-05-13 17:55:27', '2022-05-13 17:55:27'),
(672, 2, '{\"time\":\"2022-05-13T17:55:40.431Z\",\"latitude\":24.659881666666667,\"longitude\":46.72466833333333}', '13-05-2022', '2022-05-13 17:55:42', '2022-05-13 17:55:42'),
(673, 2, '{\"time\":\"2022-05-13T17:56:11.442Z\",\"latitude\":24.660075,\"longitude\":46.72690333333333}', '13-05-2022', '2022-05-13 17:56:13', '2022-05-13 17:56:13'),
(674, 2, '{\"time\":\"2022-05-13T17:56:13.932Z\",\"latitude\":24.65994166666667,\"longitude\":46.727079999999994}', '13-05-2022', '2022-05-13 17:56:14', '2022-05-13 17:56:14'),
(675, 2, '{\"time\":\"2022-05-13T17:56:15.914Z\",\"latitude\":24.659633333333332,\"longitude\":46.72721}', '13-05-2022', '2022-05-13 17:56:16', '2022-05-13 17:56:16'),
(676, 2, '{\"time\":\"2022-05-13T17:56:18.313Z\",\"latitude\":24.659578333333336,\"longitude\":46.72738833333333}', '13-05-2022', '2022-05-13 17:56:19', '2022-05-13 17:56:19'),
(677, 2, '{\"time\":\"2022-05-13T17:56:20.004Z\",\"latitude\":24.65939166666667,\"longitude\":46.727508333333326}', '13-05-2022', '2022-05-13 17:56:20', '2022-05-13 17:56:20'),
(678, 2, '{\"time\":\"2022-05-13T17:56:22.706Z\",\"latitude\":24.65868833333333,\"longitude\":46.72712833333333}', '13-05-2022', '2022-05-13 17:56:23', '2022-05-13 17:56:23'),
(679, 2, '{\"time\":\"2022-05-13T17:56:24.879Z\",\"latitude\":24.658825,\"longitude\":46.72734666666667}', '13-05-2022', '2022-05-13 17:56:25', '2022-05-13 17:56:25'),
(680, 2, '{\"time\":\"2022-05-13T17:56:35.425Z\",\"latitude\":24.658121666666663,\"longitude\":46.727259999999994}', '13-05-2022', '2022-05-13 17:56:37', '2022-05-13 17:56:37'),
(681, 2, '{\"time\":\"2022-05-13T17:56:37.126Z\",\"latitude\":24.658039999999996,\"longitude\":46.72715333333334}', '13-05-2022', '2022-05-13 17:56:38', '2022-05-13 17:56:38'),
(682, 2, '{\"time\":\"2022-05-13T17:56:38.796Z\",\"latitude\":24.65798,\"longitude\":46.727160000000005}', '13-05-2022', '2022-05-13 17:56:39', '2022-05-13 17:56:39'),
(683, 2, '{\"time\":\"2022-05-13T17:56:49.435Z\",\"latitude\":24.656840000000003,\"longitude\":46.726955}', '13-05-2022', '2022-05-13 17:56:51', '2022-05-13 17:56:51'),
(684, 2, '{\"time\":\"2022-05-13T17:56:50.404Z\",\"latitude\":24.656760000000002,\"longitude\":46.72683666666667}', '13-05-2022', '2022-05-13 17:56:51', '2022-05-13 17:56:51'),
(685, 2, '{\"time\":\"2022-05-13T17:56:51.813Z\",\"latitude\":24.65661,\"longitude\":46.72701666666667}', '13-05-2022', '2022-05-13 17:56:52', '2022-05-13 17:56:52'),
(686, 2, '{\"time\":\"2022-05-13T17:56:53.186Z\",\"latitude\":24.656533333333332,\"longitude\":46.727001666666666}', '13-05-2022', '2022-05-13 17:56:54', '2022-05-13 17:56:54'),
(687, 2, '{\"time\":\"2022-05-13T17:57:03.521Z\",\"latitude\":24.655181666666667,\"longitude\":46.72654166666666}', '13-05-2022', '2022-05-13 17:57:05', '2022-05-13 17:57:05'),
(688, 2, '{\"time\":\"2022-05-13T17:57:05.537Z\",\"latitude\":24.655109999999997,\"longitude\":46.72647833333334}', '13-05-2022', '2022-05-13 17:57:06', '2022-05-13 17:57:06'),
(689, 2, '{\"time\":\"2022-05-13T17:57:08.010Z\",\"latitude\":24.654836666666665,\"longitude\":46.72645666666667}', '13-05-2022', '2022-05-13 17:57:08', '2022-05-13 17:57:08'),
(690, 2, '{\"time\":\"2022-05-13T17:57:09.986Z\",\"latitude\":24.654713333333333,\"longitude\":46.7265}', '13-05-2022', '2022-05-13 17:57:10', '2022-05-13 17:57:10'),
(691, 2, '{\"time\":\"2022-05-13T17:57:11.916Z\",\"latitude\":24.654485,\"longitude\":46.72638}', '13-05-2022', '2022-05-13 17:57:12', '2022-05-13 17:57:12'),
(692, 2, '{\"time\":\"2022-05-13T17:57:22.429Z\",\"latitude\":24.652966666666664,\"longitude\":46.72595166666667}', '13-05-2022', '2022-05-13 17:57:24', '2022-05-13 17:57:24'),
(693, 2, '{\"time\":\"2022-05-13T17:57:32.425Z\",\"latitude\":24.652021666666663,\"longitude\":46.72573333333333}', '13-05-2022', '2022-05-13 17:57:34', '2022-05-13 17:57:34'),
(694, 2, '{\"time\":\"2022-05-13T17:57:42.431Z\",\"latitude\":24.650906666666668,\"longitude\":46.725469999999994}', '13-05-2022', '2022-05-13 17:57:44', '2022-05-13 17:57:44'),
(695, 2, '{\"time\":\"2022-05-13T17:57:52.431Z\",\"latitude\":24.649921666666668,\"longitude\":46.72520833333333}', '13-05-2022', '2022-05-13 17:57:54', '2022-05-13 17:57:54'),
(696, 2, '{\"time\":\"2022-05-13T17:58:12.436Z\",\"latitude\":24.648963333333334,\"longitude\":46.72501666666667}', '13-05-2022', '2022-05-13 17:58:14', '2022-05-13 17:58:14'),
(697, 2, '{\"time\":\"2022-05-13T17:58:22.433Z\",\"latitude\":24.648048333333335,\"longitude\":46.7248}', '13-05-2022', '2022-05-13 17:58:24', '2022-05-13 17:58:24'),
(698, 2, '{\"time\":\"2022-05-13T17:58:40.426Z\",\"latitude\":24.647145000000002,\"longitude\":46.72455}', '13-05-2022', '2022-05-13 17:58:42', '2022-05-13 17:58:42'),
(699, 2, '{\"time\":\"2022-05-13T17:58:50.429Z\",\"latitude\":24.646203333333332,\"longitude\":46.724325}', '13-05-2022', '2022-05-13 17:58:52', '2022-05-13 17:58:52'),
(700, 2, '{\"time\":\"2022-05-13T17:59:01.421Z\",\"latitude\":24.645278333333334,\"longitude\":46.724286666666664}', '13-05-2022', '2022-05-13 17:59:03', '2022-05-13 17:59:03'),
(701, 2, '{\"time\":\"2022-05-13T17:59:11.421Z\",\"latitude\":24.644263333333335,\"longitude\":46.72454833333333}', '13-05-2022', '2022-05-13 17:59:13', '2022-05-13 17:59:13'),
(702, 2, '{\"time\":\"2022-05-13T17:59:21.430Z\",\"latitude\":24.643273333333333,\"longitude\":46.724804999999996}', '13-05-2022', '2022-05-13 17:59:23', '2022-05-13 17:59:23'),
(703, 2, '{\"time\":\"2022-05-13T17:59:43.428Z\",\"latitude\":24.642856666666663,\"longitude\":46.72571333333334}', '13-05-2022', '2022-05-13 17:59:45', '2022-05-13 17:59:45'),
(704, 2, '{\"time\":\"2022-05-13T17:59:56.430Z\",\"latitude\":24.64310833333333,\"longitude\":46.72667166666667}', '13-05-2022', '2022-05-13 17:59:58', '2022-05-13 17:59:58'),
(705, 2, '{\"time\":\"2022-05-13T17:59:57.583Z\",\"latitude\":24.64310833333333,\"longitude\":46.726711666666674}', '13-05-2022', '2022-05-13 17:59:59', '2022-05-13 17:59:59'),
(706, 2, '{\"time\":\"2022-05-13T18:00:07.920Z\",\"latitude\":24.64311,\"longitude\":46.72669333333333}', '13-05-2022', '2022-05-13 18:00:11', '2022-05-13 18:00:11'),
(707, 2, '{\"time\":\"2022-05-13T18:00:18.424Z\",\"latitude\":24.64315,\"longitude\":46.726608333333324}', '13-05-2022', '2022-05-13 18:00:20', '2022-05-13 18:00:20'),
(708, 2, '{\"time\":\"2022-05-13T18:00:28.391Z\",\"latitude\":24.643158333333336,\"longitude\":46.72660166666666}', '13-05-2022', '2022-05-13 18:00:29', '2022-05-13 18:00:29'),
(709, 2, '{\"time\":\"2022-05-13T18:00:38.366Z\",\"latitude\":24.64311,\"longitude\":46.72662333333333}', '13-05-2022', '2022-05-13 18:00:39', '2022-05-13 18:00:39'),
(710, 2, '{\"time\":\"2022-05-13T18:00:48.424Z\",\"latitude\":24.643106666666668,\"longitude\":46.726608333333324}', '13-05-2022', '2022-05-13 18:00:50', '2022-05-13 18:00:50'),
(711, 2, '{\"time\":\"2022-05-13T18:00:58.402Z\",\"latitude\":24.643141666666665,\"longitude\":46.726620000000004}', '13-05-2022', '2022-05-13 18:01:00', '2022-05-13 18:01:00'),
(712, 2, '{\"time\":\"2022-05-13T18:01:08.415Z\",\"latitude\":24.643143333333335,\"longitude\":46.72661166666667}', '13-05-2022', '2022-05-13 18:01:10', '2022-05-13 18:01:10'),
(713, 2, '{\"time\":\"2022-05-13T18:01:18.417Z\",\"latitude\":24.64311,\"longitude\":46.72661333333334}', '13-05-2022', '2022-05-13 18:01:20', '2022-05-13 18:01:20'),
(714, 2, '{\"time\":\"2022-05-13T18:01:28.407Z\",\"latitude\":24.643071666666668,\"longitude\":46.726659999999995}', '13-05-2022', '2022-05-13 18:01:30', '2022-05-13 18:01:30'),
(715, 2, '{\"time\":\"2022-05-13T18:01:38.404Z\",\"latitude\":24.643071666666668,\"longitude\":46.726659999999995}', '13-05-2022', '2022-05-13 18:01:40', '2022-05-13 18:01:40'),
(716, 2, '{\"time\":\"2022-05-13T18:01:48.399Z\",\"latitude\":24.643071666666668,\"longitude\":46.726659999999995}', '13-05-2022', '2022-05-13 18:01:50', '2022-05-13 18:01:50'),
(717, 2, '{\"time\":\"2022-05-13T18:01:58.404Z\",\"latitude\":24.643071666666668,\"longitude\":46.726659999999995}', '13-05-2022', '2022-05-13 18:02:00', '2022-05-13 18:02:00'),
(718, 2, '{\"time\":\"2022-05-13T18:02:08.370Z\",\"latitude\":24.643071666666668,\"longitude\":46.726659999999995}', '13-05-2022', '2022-05-13 18:02:09', '2022-05-13 18:02:09'),
(719, 2, '{\"time\":\"2022-05-13T18:02:18.401Z\",\"latitude\":24.643084999999996,\"longitude\":46.726663333333335}', '13-05-2022', '2022-05-13 18:02:19', '2022-05-13 18:02:19'),
(720, 2, '{\"time\":\"2022-05-13T18:02:28.406Z\",\"latitude\":24.643083333333333,\"longitude\":46.72663333333333}', '13-05-2022', '2022-05-13 18:02:30', '2022-05-13 18:02:30'),
(721, 2, '{\"time\":\"2022-05-13T18:02:38.419Z\",\"latitude\":24.643129999999996,\"longitude\":46.726565}', '13-05-2022', '2022-05-13 18:02:40', '2022-05-13 18:02:40'),
(722, 2, '{\"time\":\"2022-05-13T18:02:48.445Z\",\"latitude\":24.64312,\"longitude\":46.72658499999999}', '13-05-2022', '2022-05-13 18:02:50', '2022-05-13 18:02:50'),
(723, 2, '{\"time\":\"2022-05-13T18:02:58.443Z\",\"latitude\":24.643098333333334,\"longitude\":46.726605}', '13-05-2022', '2022-05-13 18:03:00', '2022-05-13 18:03:00'),
(724, 2, '{\"time\":\"2022-05-13T18:03:08.436Z\",\"latitude\":24.64309166666667,\"longitude\":46.72659999999999}', '13-05-2022', '2022-05-13 18:03:10', '2022-05-13 18:03:10'),
(725, 2, '{\"time\":\"2022-05-13T18:03:18.425Z\",\"latitude\":24.643038333333333,\"longitude\":46.72658666666666}', '13-05-2022', '2022-05-13 18:03:20', '2022-05-13 18:03:20'),
(726, 2, '{\"time\":\"2022-05-13T18:03:28.429Z\",\"latitude\":24.643041666666665,\"longitude\":46.72658333333334}', '13-05-2022', '2022-05-13 18:03:30', '2022-05-13 18:03:30'),
(727, 2, '{\"time\":\"2022-05-13T18:03:38.407Z\",\"latitude\":24.643051666666665,\"longitude\":46.72663333333333}', '13-05-2022', '2022-05-13 18:03:40', '2022-05-13 18:03:40'),
(728, 2, '{\"time\":\"2022-05-13T18:03:48.413Z\",\"latitude\":24.643061666666668,\"longitude\":46.726608333333324}', '13-05-2022', '2022-05-13 18:03:50', '2022-05-13 18:03:50'),
(729, 2, '{\"time\":\"2022-05-13T18:03:58.407Z\",\"latitude\":24.643069999999998,\"longitude\":46.726661666666665}', '13-05-2022', '2022-05-13 18:04:00', '2022-05-13 18:04:00'),
(730, 2, '{\"time\":\"2022-05-13T18:04:08.437Z\",\"latitude\":24.643073333333337,\"longitude\":46.726665000000004}', '13-05-2022', '2022-05-13 18:04:10', '2022-05-13 18:04:10'),
(731, 2, '{\"time\":\"2022-05-13T18:04:18.408Z\",\"latitude\":24.643054999999997,\"longitude\":46.72663166666666}', '13-05-2022', '2022-05-13 18:04:20', '2022-05-13 18:04:20'),
(732, 2, '{\"time\":\"2022-05-13T18:04:28.406Z\",\"latitude\":24.643105,\"longitude\":46.726596666666666}', '13-05-2022', '2022-05-13 18:04:30', '2022-05-13 18:04:30'),
(733, 2, '{\"time\":\"2022-05-13T18:04:38.387Z\",\"latitude\":24.643171666666664,\"longitude\":46.72655833333333}', '13-05-2022', '2022-05-13 18:04:41', '2022-05-13 18:04:41'),
(734, 2, '{\"time\":\"2022-05-13T18:04:48.402Z\",\"latitude\":24.64318166666667,\"longitude\":46.72659999999999}', '13-05-2022', '2022-05-13 18:04:50', '2022-05-13 18:04:50'),
(735, 2, '{\"time\":\"2022-05-13T18:04:58.399Z\",\"latitude\":24.64301833333333,\"longitude\":46.726659999999995}', '13-05-2022', '2022-05-13 18:05:00', '2022-05-13 18:05:00'),
(736, 2, '{\"time\":\"2022-05-13T18:05:08.397Z\",\"latitude\":24.643098333333334,\"longitude\":46.72662333333333}', '13-05-2022', '2022-05-13 18:05:10', '2022-05-13 18:05:10'),
(737, 2, '{\"time\":\"2022-05-13T18:05:18.402Z\",\"latitude\":24.643140000000002,\"longitude\":46.726641666666666}', '13-05-2022', '2022-05-13 18:05:20', '2022-05-13 18:05:20'),
(738, 2, '{\"time\":\"2022-05-13T18:05:28.411Z\",\"latitude\":24.643155,\"longitude\":46.726643333333335}', '13-05-2022', '2022-05-13 18:05:30', '2022-05-13 18:05:30'),
(739, 2, '{\"time\":\"2022-05-13T18:05:38.399Z\",\"latitude\":24.643151666666668,\"longitude\":46.72660166666666}', '13-05-2022', '2022-05-13 18:05:40', '2022-05-13 18:05:40'),
(740, 2, '{\"time\":\"2022-05-13T18:05:48.405Z\",\"latitude\":24.643106666666668,\"longitude\":46.72660166666666}', '13-05-2022', '2022-05-13 18:05:50', '2022-05-13 18:05:50'),
(741, 2, '{\"time\":\"2022-05-13T18:05:58.403Z\",\"latitude\":24.643111666666663,\"longitude\":46.72667166666667}', '13-05-2022', '2022-05-13 18:06:00', '2022-05-13 18:06:00'),
(742, 2, '{\"time\":\"2022-05-13T18:06:08.380Z\",\"latitude\":24.643088333333335,\"longitude\":46.726643333333335}', '13-05-2022', '2022-05-13 18:06:09', '2022-05-13 18:06:09'),
(743, 2, '{\"time\":\"2022-05-13T18:06:18.404Z\",\"latitude\":24.643058333333336,\"longitude\":46.72663333333333}', '13-05-2022', '2022-05-13 18:06:20', '2022-05-13 18:06:20'),
(744, 2, '{\"time\":\"2022-05-13T18:06:28.408Z\",\"latitude\":24.643058333333336,\"longitude\":46.72663333333333}', '13-05-2022', '2022-05-13 18:06:30', '2022-05-13 18:06:30'),
(745, 2, '{\"time\":\"2022-05-13T18:06:38.393Z\",\"latitude\":24.643084999999996,\"longitude\":46.726659999999995}', '13-05-2022', '2022-05-13 18:06:40', '2022-05-13 18:06:40'),
(746, 2, '{\"time\":\"2022-05-13T18:06:48.415Z\",\"latitude\":24.643096666666665,\"longitude\":46.726643333333335}', '13-05-2022', '2022-05-13 18:06:50', '2022-05-13 18:06:50'),
(747, 2, '{\"time\":\"2022-05-13T18:06:58.398Z\",\"latitude\":24.64306,\"longitude\":46.72665833333334}', '13-05-2022', '2022-05-13 18:07:00', '2022-05-13 18:07:00'),
(748, 2, '{\"time\":\"2022-05-13T18:07:08.430Z\",\"latitude\":24.64303166666667,\"longitude\":46.72663333333333}', '13-05-2022', '2022-05-13 18:07:10', '2022-05-13 18:07:10'),
(749, 2, '{\"time\":\"2022-05-13T18:07:18.400Z\",\"latitude\":24.643128333333333,\"longitude\":46.7267}', '13-05-2022', '2022-05-13 18:07:20', '2022-05-13 18:07:20'),
(750, 2, '{\"time\":\"2022-05-13T18:07:28.430Z\",\"latitude\":24.643213333333332,\"longitude\":46.726774999999996}', '13-05-2022', '2022-05-13 18:07:30', '2022-05-13 18:07:30'),
(751, 2, '{\"time\":\"2022-05-13T18:07:38.398Z\",\"latitude\":24.643138333333333,\"longitude\":46.726635}', '13-05-2022', '2022-05-13 18:07:40', '2022-05-13 18:07:40'),
(752, 2, '{\"time\":\"2022-05-13T18:07:48.432Z\",\"latitude\":24.643133333333335,\"longitude\":46.726661666666665}', '13-05-2022', '2022-05-13 18:07:50', '2022-05-13 18:07:50'),
(753, 2, '{\"time\":\"2022-05-13T18:07:58.430Z\",\"latitude\":24.643099999999997,\"longitude\":46.72668}', '13-05-2022', '2022-05-13 18:08:00', '2022-05-13 18:08:00'),
(754, 2, '{\"time\":\"2022-05-13T18:08:08.433Z\",\"latitude\":24.64304666666667,\"longitude\":46.726549999999996}', '13-05-2022', '2022-05-13 18:08:10', '2022-05-13 18:08:10'),
(755, 2, '{\"time\":\"2022-05-13T18:08:18.447Z\",\"latitude\":24.643024999999998,\"longitude\":46.72649500000001}', '13-05-2022', '2022-05-13 18:08:20', '2022-05-13 18:08:20'),
(756, 2, '{\"time\":\"2022-05-13T18:08:28.433Z\",\"latitude\":24.643021666666662,\"longitude\":46.726485000000004}', '13-05-2022', '2022-05-13 18:08:32', '2022-05-13 18:08:32'),
(757, 2, '{\"time\":\"2022-05-13T18:08:38.514Z\",\"latitude\":24.643021666666662,\"longitude\":46.726485000000004}', '13-05-2022', '2022-05-13 18:08:40', '2022-05-13 18:08:40'),
(758, 2, '{\"time\":\"2022-05-13T18:08:48.431Z\",\"latitude\":24.642983333333337,\"longitude\":46.726596666666666}', '13-05-2022', '2022-05-13 18:08:50', '2022-05-13 18:08:50'),
(759, 2, '{\"time\":\"2022-05-13T18:08:58.429Z\",\"latitude\":24.643013333333336,\"longitude\":46.72654333333333}', '13-05-2022', '2022-05-13 18:09:00', '2022-05-13 18:09:00'),
(760, 2, '{\"time\":\"2022-05-13T18:09:08.429Z\",\"latitude\":24.643011666666666,\"longitude\":46.72653166666667}', '13-05-2022', '2022-05-13 18:09:10', '2022-05-13 18:09:10'),
(761, 2, '{\"time\":\"2022-05-13T18:09:18.429Z\",\"latitude\":24.642991666666664,\"longitude\":46.72649}', '13-05-2022', '2022-05-13 18:09:20', '2022-05-13 18:09:20'),
(762, 2, '{\"time\":\"2022-05-13T18:09:28.427Z\",\"latitude\":24.642960000000002,\"longitude\":46.726528333333334}', '13-05-2022', '2022-05-13 18:09:30', '2022-05-13 18:09:30'),
(763, 2, '{\"time\":\"2022-05-13T18:09:38.429Z\",\"latitude\":24.642971666666668,\"longitude\":46.726485000000004}', '13-05-2022', '2022-05-13 18:09:40', '2022-05-13 18:09:40'),
(764, 2, '{\"time\":\"2022-05-13T18:09:48.430Z\",\"latitude\":24.642971666666668,\"longitude\":46.726485000000004}', '13-05-2022', '2022-05-13 18:09:50', '2022-05-13 18:09:50'),
(765, 2, '{\"time\":\"2022-05-13T18:09:58.428Z\",\"latitude\":24.642971666666668,\"longitude\":46.726485000000004}', '13-05-2022', '2022-05-13 18:10:00', '2022-05-13 18:10:00'),
(766, 2, '{\"time\":\"2022-05-13T18:10:08.431Z\",\"latitude\":24.642971666666668,\"longitude\":46.726485000000004}', '13-05-2022', '2022-05-13 18:10:10', '2022-05-13 18:10:10'),
(767, 2, '{\"time\":\"2022-05-13T18:10:18.430Z\",\"latitude\":24.642971666666668,\"longitude\":46.726485000000004}', '13-05-2022', '2022-05-13 18:10:23', '2022-05-13 18:10:23'),
(768, 2, '{\"time\":\"2022-05-13T18:10:28.430Z\",\"latitude\":24.642971666666668,\"longitude\":46.726485000000004}', '13-05-2022', '2022-05-13 18:10:33', '2022-05-13 18:10:33'),
(769, 2, '{\"time\":\"2022-05-13T18:10:38.424Z\",\"latitude\":24.643068333333336,\"longitude\":46.72652333333334}', '13-05-2022', '2022-05-13 18:10:40', '2022-05-13 18:10:40'),
(770, 2, '{\"time\":\"2022-05-13T18:10:48.431Z\",\"latitude\":24.643069999999998,\"longitude\":46.72652333333334}', '13-05-2022', '2022-05-13 18:10:51', '2022-05-13 18:10:51'),
(771, 2, '{\"time\":\"2022-05-13T18:10:58.433Z\",\"latitude\":24.643039999999996,\"longitude\":46.72660333333333}', '13-05-2022', '2022-05-13 18:11:00', '2022-05-13 18:11:00'),
(772, 2, '{\"time\":\"2022-05-13T18:11:08.432Z\",\"latitude\":24.643088333333335,\"longitude\":46.726575000000004}', '13-05-2022', '2022-05-13 18:11:10', '2022-05-13 18:11:10'),
(773, 2, '{\"time\":\"2022-05-13T18:11:18.418Z\",\"latitude\":24.643075,\"longitude\":46.726565}', '13-05-2022', '2022-05-13 18:11:20', '2022-05-13 18:11:20'),
(774, 2, '{\"time\":\"2022-05-13T18:11:28.426Z\",\"latitude\":24.643075,\"longitude\":46.726565}', '13-05-2022', '2022-05-13 18:11:30', '2022-05-13 18:11:30'),
(775, 2, '{\"time\":\"2022-05-13T18:11:38.430Z\",\"latitude\":24.643016666666668,\"longitude\":46.726573333333334}', '13-05-2022', '2022-05-13 18:11:40', '2022-05-13 18:11:40'),
(776, 2, '{\"time\":\"2022-05-13T18:11:48.430Z\",\"latitude\":24.643066666666662,\"longitude\":46.72657833333333}', '13-05-2022', '2022-05-13 18:11:50', '2022-05-13 18:11:50'),
(777, 2, '{\"time\":\"2022-05-13T18:11:58.430Z\",\"latitude\":24.64307833333333,\"longitude\":46.72660166666666}', '13-05-2022', '2022-05-13 18:12:00', '2022-05-13 18:12:00'),
(778, 2, '{\"time\":\"2022-05-13T18:12:08.431Z\",\"latitude\":24.64307833333333,\"longitude\":46.72660166666666}', '13-05-2022', '2022-05-13 18:12:10', '2022-05-13 18:12:10'),
(779, 2, '{\"time\":\"2022-05-13T18:12:18.429Z\",\"latitude\":24.643140000000002,\"longitude\":46.726545}', '13-05-2022', '2022-05-13 18:12:20', '2022-05-13 18:12:20'),
(780, 2, '{\"time\":\"2022-05-13T18:12:28.432Z\",\"latitude\":24.643089999999997,\"longitude\":46.72657833333333}', '13-05-2022', '2022-05-13 18:12:30', '2022-05-13 18:12:30'),
(781, 2, '{\"time\":\"2022-05-13T18:12:38.429Z\",\"latitude\":24.643089999999997,\"longitude\":46.72657833333333}', '13-05-2022', '2022-05-13 18:12:40', '2022-05-13 18:12:40'),
(782, 2, '{\"time\":\"2022-05-13T18:12:48.438Z\",\"latitude\":24.643089999999997,\"longitude\":46.72657833333333}', '13-05-2022', '2022-05-13 18:12:50', '2022-05-13 18:12:50'),
(783, 2, '{\"time\":\"2022-05-13T18:12:58.434Z\",\"latitude\":24.643089999999997,\"longitude\":46.72657833333333}', '13-05-2022', '2022-05-13 18:13:00', '2022-05-13 18:13:00'),
(784, 2, '{\"time\":\"2022-05-13T18:13:08.428Z\",\"latitude\":24.643089999999997,\"longitude\":46.72657833333333}', '13-05-2022', '2022-05-13 18:13:10', '2022-05-13 18:13:10'),
(785, 2, '{\"time\":\"2022-05-13T18:13:18.434Z\",\"latitude\":24.643089999999997,\"longitude\":46.72657833333333}', '13-05-2022', '2022-05-13 18:13:20', '2022-05-13 18:13:20'),
(786, 2, '{\"time\":\"2022-05-13T18:13:28.430Z\",\"latitude\":24.643089999999997,\"longitude\":46.72657833333333}', '13-05-2022', '2022-05-13 18:13:30', '2022-05-13 18:13:30'),
(787, 2, '{\"time\":\"2022-05-13T18:13:38.432Z\",\"latitude\":24.643089999999997,\"longitude\":46.72657833333333}', '13-05-2022', '2022-05-13 18:13:40', '2022-05-13 18:13:40'),
(788, 2, '{\"time\":\"2022-05-13T18:13:48.431Z\",\"latitude\":24.643089999999997,\"longitude\":46.72657833333333}', '13-05-2022', '2022-05-13 18:13:50', '2022-05-13 18:13:50'),
(789, 2, '{\"time\":\"2022-05-13T18:13:58.434Z\",\"latitude\":24.643089999999997,\"longitude\":46.72657833333333}', '13-05-2022', '2022-05-13 18:14:00', '2022-05-13 18:14:00'),
(790, 2, '{\"time\":\"2022-05-13T18:14:08.427Z\",\"latitude\":24.643089999999997,\"longitude\":46.72657833333333}', '13-05-2022', '2022-05-13 18:14:10', '2022-05-13 18:14:10'),
(791, 2, '{\"time\":\"2022-05-13T18:14:18.435Z\",\"latitude\":24.643009999999997,\"longitude\":46.726635}', '13-05-2022', '2022-05-13 18:14:20', '2022-05-13 18:14:20'),
(792, 2, '{\"time\":\"2022-05-13T18:14:28.430Z\",\"latitude\":24.643005000000002,\"longitude\":46.72663333333333}', '13-05-2022', '2022-05-13 18:14:30', '2022-05-13 18:14:30'),
(793, 2, '{\"time\":\"2022-05-13T18:14:38.433Z\",\"latitude\":24.643005000000002,\"longitude\":46.72663333333333}', '13-05-2022', '2022-05-13 18:14:40', '2022-05-13 18:14:40'),
(794, 2, '{\"time\":\"2022-05-13T18:14:48.432Z\",\"latitude\":24.643005000000002,\"longitude\":46.72663333333333}', '13-05-2022', '2022-05-13 18:14:50', '2022-05-13 18:14:50'),
(795, 2, '{\"time\":\"2022-05-13T18:14:58.431Z\",\"latitude\":24.643005000000002,\"longitude\":46.72663333333333}', '13-05-2022', '2022-05-13 18:15:00', '2022-05-13 18:15:00'),
(796, 2, '{\"time\":\"2022-05-13T18:15:08.509Z\",\"latitude\":24.643005000000002,\"longitude\":46.72663333333333}', '13-05-2022', '2022-05-13 18:15:10', '2022-05-13 18:15:10'),
(797, 2, '{\"time\":\"2022-05-13T18:15:18.432Z\",\"latitude\":24.64306,\"longitude\":46.72664499999999}', '13-05-2022', '2022-05-13 18:15:20', '2022-05-13 18:15:20'),
(798, 2, '{\"time\":\"2022-05-13T18:15:28.434Z\",\"latitude\":24.64306,\"longitude\":46.72664499999999}', '13-05-2022', '2022-05-13 18:15:30', '2022-05-13 18:15:30'),
(799, 2, '{\"time\":\"2022-05-13T18:15:38.508Z\",\"latitude\":24.643073333333337,\"longitude\":46.72662666666667}', '13-05-2022', '2022-05-13 18:15:40', '2022-05-13 18:15:40'),
(800, 2, '{\"time\":\"2022-05-13T18:15:48.430Z\",\"latitude\":24.643075,\"longitude\":46.726606666666676}', '13-05-2022', '2022-05-13 18:15:50', '2022-05-13 18:15:50'),
(801, 2, '{\"time\":\"2022-05-13T18:15:58.431Z\",\"latitude\":24.643075,\"longitude\":46.726606666666676}', '13-05-2022', '2022-05-13 18:16:00', '2022-05-13 18:16:00'),
(802, 2, '{\"time\":\"2022-05-13T18:16:08.429Z\",\"latitude\":24.643075,\"longitude\":46.726606666666676}', '13-05-2022', '2022-05-13 18:16:10', '2022-05-13 18:16:10'),
(803, 2, '{\"time\":\"2022-05-13T18:16:18.429Z\",\"latitude\":24.643075,\"longitude\":46.726606666666676}', '13-05-2022', '2022-05-13 18:16:20', '2022-05-13 18:16:20'),
(804, 2, '{\"time\":\"2022-05-13T18:16:28.429Z\",\"latitude\":24.643075,\"longitude\":46.726606666666676}', '13-05-2022', '2022-05-13 18:16:30', '2022-05-13 18:16:30'),
(805, 2, '{\"time\":\"2022-05-13T18:16:38.431Z\",\"latitude\":24.643075,\"longitude\":46.726606666666676}', '13-05-2022', '2022-05-13 18:16:40', '2022-05-13 18:16:40'),
(806, 2, '{\"time\":\"2022-05-13T18:16:48.384Z\",\"latitude\":24.643044999999997,\"longitude\":46.72662333333333}', '13-05-2022', '2022-05-13 18:16:50', '2022-05-13 18:16:50'),
(807, 2, '{\"time\":\"2022-05-13T18:16:58.516Z\",\"latitude\":24.643044999999997,\"longitude\":46.72662333333333}', '13-05-2022', '2022-05-13 18:17:00', '2022-05-13 18:17:00'),
(808, 2, '{\"time\":\"2022-05-13T18:17:08.436Z\",\"latitude\":24.643044999999997,\"longitude\":46.72662333333333}', '13-05-2022', '2022-05-13 18:17:10', '2022-05-13 18:17:10'),
(809, 2, '{\"time\":\"2022-05-13T18:17:18.436Z\",\"latitude\":24.643044999999997,\"longitude\":46.72662333333333}', '13-05-2022', '2022-05-13 18:17:20', '2022-05-13 18:17:20'),
(810, 2, '{\"time\":\"2022-05-13T18:17:28.511Z\",\"latitude\":24.643044999999997,\"longitude\":46.72662333333333}', '13-05-2022', '2022-05-13 18:17:30', '2022-05-13 18:17:30'),
(811, 2, '{\"time\":\"2022-05-13T18:17:38.428Z\",\"latitude\":24.643044999999997,\"longitude\":46.72662333333333}', '13-05-2022', '2022-05-13 18:17:40', '2022-05-13 18:17:40'),
(812, 2, '{\"time\":\"2022-05-13T18:17:48.430Z\",\"latitude\":24.643044999999997,\"longitude\":46.72662333333333}', '13-05-2022', '2022-05-13 18:17:50', '2022-05-13 18:17:50'),
(813, 2, '{\"time\":\"2022-05-13T18:17:58.509Z\",\"latitude\":24.643044999999997,\"longitude\":46.72662333333333}', '13-05-2022', '2022-05-13 18:18:00', '2022-05-13 18:18:00'),
(814, 2, '{\"time\":\"2022-05-13T18:18:08.431Z\",\"latitude\":24.643044999999997,\"longitude\":46.72662333333333}', '13-05-2022', '2022-05-13 18:18:10', '2022-05-13 18:18:10'),
(815, 2, '{\"time\":\"2022-05-13T18:18:18.430Z\",\"latitude\":24.643044999999997,\"longitude\":46.72662333333333}', '13-05-2022', '2022-05-13 18:18:20', '2022-05-13 18:18:20'),
(816, 2, '{\"time\":\"2022-05-13T18:18:28.505Z\",\"latitude\":24.643044999999997,\"longitude\":46.72662333333333}', '13-05-2022', '2022-05-13 18:18:30', '2022-05-13 18:18:30'),
(817, 2, '{\"time\":\"2022-05-13T18:18:38.429Z\",\"latitude\":24.643044999999997,\"longitude\":46.72662333333333}', '13-05-2022', '2022-05-13 18:18:40', '2022-05-13 18:18:40'),
(818, 2, '{\"time\":\"2022-05-13T18:18:48.435Z\",\"latitude\":24.642981666666667,\"longitude\":46.726663333333335}', '13-05-2022', '2022-05-13 18:18:50', '2022-05-13 18:18:50'),
(819, 2, '{\"time\":\"2022-05-13T18:18:58.509Z\",\"latitude\":24.642983333333337,\"longitude\":46.726659999999995}', '13-05-2022', '2022-05-13 18:19:00', '2022-05-13 18:19:00'),
(820, 2, '{\"time\":\"2022-05-13T18:19:08.433Z\",\"latitude\":24.642983333333337,\"longitude\":46.726659999999995}', '13-05-2022', '2022-05-13 18:19:10', '2022-05-13 18:19:10'),
(821, 2, '{\"time\":\"2022-05-13T18:19:18.435Z\",\"latitude\":24.642983333333337,\"longitude\":46.726659999999995}', '13-05-2022', '2022-05-13 18:19:20', '2022-05-13 18:19:20'),
(822, 2, '{\"time\":\"2022-05-13T18:19:28.510Z\",\"latitude\":24.642983333333337,\"longitude\":46.726659999999995}', '13-05-2022', '2022-05-13 18:19:30', '2022-05-13 18:19:30'),
(823, 2, '{\"time\":\"2022-05-13T18:19:38.428Z\",\"latitude\":24.64294333333333,\"longitude\":46.72663833333333}', '13-05-2022', '2022-05-13 18:19:40', '2022-05-13 18:19:40'),
(824, 2, '{\"time\":\"2022-05-13T18:19:48.428Z\",\"latitude\":24.64299,\"longitude\":46.726663333333335}', '13-05-2022', '2022-05-13 18:19:50', '2022-05-13 18:19:50'),
(825, 2, '{\"time\":\"2022-05-13T18:19:58.514Z\",\"latitude\":24.643041666666665,\"longitude\":46.726618333333334}', '13-05-2022', '2022-05-13 18:20:00', '2022-05-13 18:20:00'),
(826, 2, '{\"time\":\"2022-05-13T18:20:08.431Z\",\"latitude\":24.643041666666665,\"longitude\":46.726618333333334}', '13-05-2022', '2022-05-13 18:20:10', '2022-05-13 18:20:10'),
(827, 2, '{\"time\":\"2022-05-13T18:20:18.427Z\",\"latitude\":24.643041666666665,\"longitude\":46.726618333333334}', '13-05-2022', '2022-05-13 18:20:20', '2022-05-13 18:20:20'),
(828, 2, '{\"time\":\"2022-05-13T18:20:28.508Z\",\"latitude\":24.643015,\"longitude\":46.72662333333333}', '13-05-2022', '2022-05-13 18:20:30', '2022-05-13 18:20:30'),
(829, 2, '{\"time\":\"2022-05-13T18:20:38.432Z\",\"latitude\":24.643138333333333,\"longitude\":46.726866666666666}', '13-05-2022', '2022-05-13 18:20:40', '2022-05-13 18:20:40'),
(830, 2, '{\"time\":\"2022-05-13T18:20:48.425Z\",\"latitude\":24.643373333333336,\"longitude\":46.727394999999994}', '13-05-2022', '2022-05-13 18:20:50', '2022-05-13 18:20:50'),
(831, 2, '{\"time\":\"2022-05-13T18:20:56.445Z\",\"latitude\":24.643234999999997,\"longitude\":46.72748}', '13-05-2022', '2022-05-13 18:20:58', '2022-05-13 18:20:58'),
(832, 2, '{\"time\":\"2022-05-13T18:21:16.420Z\",\"latitude\":24.643426666666663,\"longitude\":46.72845833333334}', '13-05-2022', '2022-05-13 18:21:18', '2022-05-13 18:21:18'),
(833, 2, '{\"time\":\"2022-05-13T18:21:26.398Z\",\"latitude\":24.644043333333336,\"longitude\":46.73050166666667}', '13-05-2022', '2022-05-13 18:21:28', '2022-05-13 18:21:28'),
(834, 2, '{\"time\":\"2022-05-13T18:21:36.425Z\",\"latitude\":24.644145,\"longitude\":46.731453333333334}', '13-05-2022', '2022-05-13 18:21:38', '2022-05-13 18:21:38'),
(835, 2, '{\"time\":\"2022-05-13T18:21:46.440Z\",\"latitude\":24.644389999999998,\"longitude\":46.732728333333334}', '13-05-2022', '2022-05-13 18:21:48', '2022-05-13 18:21:48'),
(836, 2, '{\"time\":\"2022-05-13T18:21:53.443Z\",\"latitude\":24.645014999999997,\"longitude\":46.73353166666667}', '13-05-2022', '2022-05-13 18:21:55', '2022-05-13 18:21:55'),
(837, 2, '{\"time\":\"2022-05-13T18:22:02.376Z\",\"latitude\":24.645638333333334,\"longitude\":46.73377000000001}', '13-05-2022', '2022-05-13 18:22:03', '2022-05-13 18:22:03'),
(838, 2, '{\"time\":\"2022-05-13T18:22:12.443Z\",\"latitude\":24.64671333333333,\"longitude\":46.73334499999999}', '13-05-2022', '2022-05-13 18:22:14', '2022-05-13 18:22:14'),
(839, 2, '{\"time\":\"2022-05-13T18:22:22.447Z\",\"latitude\":24.647656666666663,\"longitude\":46.73374333333333}', '13-05-2022', '2022-05-13 18:22:24', '2022-05-13 18:22:24'),
(840, 2, '{\"time\":\"2022-05-13T18:22:29.428Z\",\"latitude\":24.64781833333333,\"longitude\":46.73372166666666}', '13-05-2022', '2022-05-13 18:22:31', '2022-05-13 18:22:31'),
(841, 2, '{\"time\":\"2022-05-13T18:22:42.426Z\",\"latitude\":24.649316666666664,\"longitude\":46.73404166666666}', '13-05-2022', '2022-05-13 18:22:44', '2022-05-13 18:22:44'),
(842, 2, '{\"time\":\"2022-05-13T18:22:52.440Z\",\"latitude\":24.650933333333334,\"longitude\":46.734366666666666}', '13-05-2022', '2022-05-13 18:22:54', '2022-05-13 18:22:54'),
(843, 2, '{\"time\":\"2022-05-13T18:22:59.440Z\",\"latitude\":24.652373333333337,\"longitude\":46.73482666666667}', '13-05-2022', '2022-05-13 18:23:01', '2022-05-13 18:23:01'),
(844, 2, '{\"time\":\"2022-05-13T18:23:06.425Z\",\"latitude\":24.653299999999998,\"longitude\":46.73461999999999}', '13-05-2022', '2022-05-13 18:23:08', '2022-05-13 18:23:08'),
(845, 2, '{\"time\":\"2022-05-13T18:23:16.437Z\",\"latitude\":24.654701666666664,\"longitude\":46.73514166666667}', '13-05-2022', '2022-05-13 18:23:18', '2022-05-13 18:23:18'),
(846, 2, '{\"time\":\"2022-05-13T18:23:25.441Z\",\"latitude\":24.65575666666667,\"longitude\":46.735150000000004}', '13-05-2022', '2022-05-13 18:23:27', '2022-05-13 18:23:27'),
(847, 2, '{\"time\":\"2022-05-13T18:23:38.422Z\",\"latitude\":24.65644166666667,\"longitude\":46.73542666666667}', '13-05-2022', '2022-05-13 18:23:40', '2022-05-13 18:23:40'),
(848, 2, '{\"time\":\"2022-05-13T18:23:48.428Z\",\"latitude\":24.65632833333333,\"longitude\":46.73552500000001}', '13-05-2022', '2022-05-13 18:23:50', '2022-05-13 18:23:50'),
(849, 2, '{\"time\":\"2022-05-13T18:23:58.426Z\",\"latitude\":24.656409999999997,\"longitude\":46.735429999999994}', '13-05-2022', '2022-05-13 18:24:00', '2022-05-13 18:24:00'),
(850, 2, '{\"time\":\"2022-05-13T18:24:08.427Z\",\"latitude\":24.65647666666667,\"longitude\":46.73538666666666}', '13-05-2022', '2022-05-13 18:24:10', '2022-05-13 18:24:10'),
(851, 2, '{\"time\":\"2022-05-13T18:24:18.430Z\",\"latitude\":24.656540000000003,\"longitude\":46.73536666666667}', '13-05-2022', '2022-05-13 18:24:20', '2022-05-13 18:24:20'),
(852, 2, '{\"time\":\"2022-05-13T18:24:28.427Z\",\"latitude\":24.656691666666667,\"longitude\":46.73542333333333}', '13-05-2022', '2022-05-13 18:24:30', '2022-05-13 18:24:30'),
(853, 2, '{\"time\":\"2022-05-13T18:24:38.422Z\",\"latitude\":24.657510000000002,\"longitude\":46.73544666666667}', '13-05-2022', '2022-05-13 18:24:40', '2022-05-13 18:24:40'),
(854, 2, '{\"time\":\"2022-05-13T18:24:58.425Z\",\"latitude\":24.65937,\"longitude\":46.73587166666666}', '13-05-2022', '2022-05-13 18:25:00', '2022-05-13 18:25:00'),
(855, 2, '{\"time\":\"2022-05-13T18:25:13.447Z\",\"latitude\":24.660264999999995,\"longitude\":46.73607333333333}', '13-05-2022', '2022-05-13 18:25:15', '2022-05-13 18:25:15'),
(856, 2, '{\"time\":\"2022-05-13T18:25:21.439Z\",\"latitude\":24.660441666666664,\"longitude\":46.73614166666666}', '13-05-2022', '2022-05-13 18:25:23', '2022-05-13 18:25:23'),
(857, 2, '{\"time\":\"2022-05-13T18:25:32.426Z\",\"latitude\":24.660511666666668,\"longitude\":46.736685}', '13-05-2022', '2022-05-13 18:25:34', '2022-05-13 18:25:34'),
(858, 2, '{\"time\":\"2022-05-13T18:25:42.436Z\",\"latitude\":24.66046833333333,\"longitude\":46.73759499999999}', '13-05-2022', '2022-05-13 18:25:44', '2022-05-13 18:25:44'),
(859, 2, '{\"time\":\"2022-05-13T18:25:52.433Z\",\"latitude\":24.660500000000003,\"longitude\":46.737746666666666}', '13-05-2022', '2022-05-13 18:25:54', '2022-05-13 18:25:54'),
(860, 2, '{\"time\":\"2022-05-13T18:26:03.428Z\",\"latitude\":24.66069166666667,\"longitude\":46.738375}', '13-05-2022', '2022-05-13 18:26:05', '2022-05-13 18:26:05'),
(861, 2, '{\"time\":\"2022-05-13T18:26:13.424Z\",\"latitude\":24.660656666666668,\"longitude\":46.739901666666675}', '13-05-2022', '2022-05-13 18:26:15', '2022-05-13 18:26:15');
INSERT INTO `track_employees` (`id`, `user_id`, `location`, `date`, `created_at`, `updated_at`) VALUES
(862, 2, '{\"time\":\"2022-05-13T18:26:23.521Z\",\"latitude\":24.660561666666663,\"longitude\":46.74167333333333}', '13-05-2022', '2022-05-13 18:26:25', '2022-05-13 18:26:25'),
(863, 2, '{\"time\":\"2022-05-13T18:26:31.489Z\",\"latitude\":24.66045,\"longitude\":46.74143333333333}', '13-05-2022', '2022-05-13 18:26:33', '2022-05-13 18:26:33'),
(864, 2, '{\"time\":\"2022-05-13T18:26:39.420Z\",\"latitude\":24.660638333333335,\"longitude\":46.74146333333333}', '13-05-2022', '2022-05-13 18:26:41', '2022-05-13 18:26:41'),
(865, 2, '{\"time\":\"2022-05-13T18:26:49.431Z\",\"latitude\":24.661391666666667,\"longitude\":46.74206666666667}', '13-05-2022', '2022-05-13 18:26:51', '2022-05-13 18:26:51'),
(866, 2, '{\"time\":\"2022-05-13T18:26:59.440Z\",\"latitude\":24.662029999999998,\"longitude\":46.742331666666665}', '13-05-2022', '2022-05-13 18:27:01', '2022-05-13 18:27:01'),
(867, 2, '{\"time\":\"2022-05-13T18:27:06.425Z\",\"latitude\":24.662436666666668,\"longitude\":46.742548333333325}', '13-05-2022', '2022-05-13 18:27:08', '2022-05-13 18:27:08'),
(868, 2, '{\"time\":\"2022-05-13T18:27:15.412Z\",\"latitude\":24.663293333333332,\"longitude\":46.74239166666666}', '13-05-2022', '2022-05-13 18:27:17', '2022-05-13 18:27:17'),
(869, 2, '{\"time\":\"2022-05-13T18:27:25.425Z\",\"latitude\":24.663756666666668,\"longitude\":46.741906666666665}', '13-05-2022', '2022-05-13 18:27:27', '2022-05-13 18:27:27'),
(870, 2, '{\"time\":\"2022-05-13T18:27:35.444Z\",\"latitude\":24.664285000000003,\"longitude\":46.74161833333333}', '13-05-2022', '2022-05-13 18:27:37', '2022-05-13 18:27:37'),
(871, 2, '{\"time\":\"2022-05-13T18:27:41.433Z\",\"latitude\":24.66429333333333,\"longitude\":46.74161000000001}', '13-05-2022', '2022-05-13 18:27:43', '2022-05-13 18:27:43'),
(872, 2, '{\"time\":\"2022-05-13T18:27:48.431Z\",\"latitude\":24.66443,\"longitude\":46.74157166666667}', '13-05-2022', '2022-05-13 18:27:50', '2022-05-13 18:27:50'),
(873, 2, '{\"time\":\"2022-05-13T18:27:58.435Z\",\"latitude\":24.66489166666667,\"longitude\":46.74113166666666}', '13-05-2022', '2022-05-13 18:28:00', '2022-05-13 18:28:00'),
(874, 2, '{\"time\":\"2022-05-13T18:28:06.443Z\",\"latitude\":24.665045000000003,\"longitude\":46.74109166666667}', '13-05-2022', '2022-05-13 18:28:08', '2022-05-13 18:28:08'),
(875, 2, '{\"time\":\"2022-05-13T18:28:15.418Z\",\"latitude\":24.665133333333333,\"longitude\":46.740993333333336}', '13-05-2022', '2022-05-13 18:28:17', '2022-05-13 18:28:17'),
(876, 2, '{\"time\":\"2022-05-13T18:28:25.428Z\",\"latitude\":24.665754999999997,\"longitude\":46.740685}', '13-05-2022', '2022-05-13 18:28:27', '2022-05-13 18:28:27'),
(877, 2, '{\"time\":\"2022-05-13T18:28:35.427Z\",\"latitude\":24.665901666666667,\"longitude\":46.74057833333333}', '13-05-2022', '2022-05-13 18:28:37', '2022-05-13 18:28:37'),
(878, 2, '{\"time\":\"2022-05-13T18:28:45.387Z\",\"latitude\":24.666026666666667,\"longitude\":46.74048833333333}', '13-05-2022', '2022-05-13 18:28:47', '2022-05-13 18:28:47'),
(879, 2, '{\"time\":\"2022-05-13T18:28:55.379Z\",\"latitude\":24.665979999999998,\"longitude\":46.74044833333334}', '13-05-2022', '2022-05-13 18:28:56', '2022-05-13 18:28:56'),
(880, 2, '{\"time\":\"2022-05-13T18:29:05.413Z\",\"latitude\":24.665960000000002,\"longitude\":46.74045833333333}', '13-05-2022', '2022-05-13 18:29:07', '2022-05-13 18:29:07'),
(881, 2, '{\"time\":\"2022-05-13T18:29:15.430Z\",\"latitude\":24.665971666666664,\"longitude\":46.74049166666667}', '13-05-2022', '2022-05-13 18:29:17', '2022-05-13 18:29:17'),
(882, 2, '{\"time\":\"2022-05-13T18:29:25.449Z\",\"latitude\":24.665985,\"longitude\":46.740515}', '13-05-2022', '2022-05-13 18:29:27', '2022-05-13 18:29:27'),
(883, 2, '{\"time\":\"2022-05-13T18:29:35.424Z\",\"latitude\":24.665993333333336,\"longitude\":46.74043666666667}', '13-05-2022', '2022-05-13 18:29:37', '2022-05-13 18:29:37'),
(884, 2, '{\"time\":\"2022-05-13T18:29:45.442Z\",\"latitude\":24.66596666666667,\"longitude\":46.740355}', '13-05-2022', '2022-05-13 18:29:47', '2022-05-13 18:29:47'),
(885, 2, '{\"time\":\"2022-05-13T18:29:55.423Z\",\"latitude\":24.665964999999996,\"longitude\":46.740345}', '13-05-2022', '2022-05-13 18:29:57', '2022-05-13 18:29:57'),
(886, 2, '{\"time\":\"2022-05-13T18:30:05.438Z\",\"latitude\":24.665993333333336,\"longitude\":46.74037}', '13-05-2022', '2022-05-13 18:30:07', '2022-05-13 18:30:07'),
(887, 2, '{\"time\":\"2022-05-13T18:30:15.433Z\",\"latitude\":24.66602833333333,\"longitude\":46.74037833333333}', '13-05-2022', '2022-05-13 18:30:17', '2022-05-13 18:30:17'),
(888, 2, '{\"time\":\"2022-05-13T18:30:25.447Z\",\"latitude\":24.66613333333333,\"longitude\":46.74041666666667}', '13-05-2022', '2022-05-13 18:30:27', '2022-05-13 18:30:27'),
(889, 2, '{\"time\":\"2022-05-13T18:30:35.435Z\",\"latitude\":24.666078333333335,\"longitude\":46.74040333333334}', '13-05-2022', '2022-05-13 18:30:37', '2022-05-13 18:30:37'),
(890, 2, '{\"time\":\"2022-05-13T18:30:45.444Z\",\"latitude\":24.666015,\"longitude\":46.740384999999996}', '13-05-2022', '2022-05-13 18:30:47', '2022-05-13 18:30:47'),
(891, 2, '{\"time\":\"2022-05-13T18:30:55.436Z\",\"latitude\":24.665991666666667,\"longitude\":46.74046499999999}', '13-05-2022', '2022-05-13 18:30:57', '2022-05-13 18:30:57'),
(892, 2, '{\"time\":\"2022-05-13T18:31:05.434Z\",\"latitude\":24.665991666666667,\"longitude\":46.74046499999999}', '13-05-2022', '2022-05-13 18:31:07', '2022-05-13 18:31:07'),
(893, 2, '{\"time\":\"2022-05-13T18:31:15.430Z\",\"latitude\":24.665991666666667,\"longitude\":46.74046499999999}', '13-05-2022', '2022-05-13 18:31:17', '2022-05-13 18:31:17'),
(894, 2, '{\"time\":\"2022-05-13T18:31:25.432Z\",\"latitude\":24.665991666666667,\"longitude\":46.74046499999999}', '13-05-2022', '2022-05-13 18:31:27', '2022-05-13 18:31:27'),
(895, 2, '{\"time\":\"2022-05-13T18:31:35.429Z\",\"latitude\":24.665991666666667,\"longitude\":46.74046499999999}', '13-05-2022', '2022-05-13 18:31:37', '2022-05-13 18:31:37'),
(896, 2, '{\"time\":\"2022-05-13T18:31:45.430Z\",\"latitude\":24.66598666666666,\"longitude\":46.74039833333333}', '13-05-2022', '2022-05-13 18:31:47', '2022-05-13 18:31:47'),
(897, 2, '{\"time\":\"2022-05-13T18:31:55.435Z\",\"latitude\":24.66598666666666,\"longitude\":46.74039833333333}', '13-05-2022', '2022-05-13 18:31:57', '2022-05-13 18:31:57'),
(898, 2, '{\"time\":\"2022-05-13T18:32:05.442Z\",\"latitude\":24.66598666666666,\"longitude\":46.74039833333333}', '13-05-2022', '2022-05-13 18:32:07', '2022-05-13 18:32:07'),
(899, 2, '{\"time\":\"2022-05-13T18:32:15.441Z\",\"latitude\":24.665988333333335,\"longitude\":46.74039833333333}', '13-05-2022', '2022-05-13 18:32:17', '2022-05-13 18:32:17'),
(900, 2, '{\"time\":\"2022-05-13T18:32:25.434Z\",\"latitude\":24.665988333333335,\"longitude\":46.74039833333333}', '13-05-2022', '2022-05-13 18:32:27', '2022-05-13 18:32:27'),
(901, 2, '{\"time\":\"2022-05-13T18:32:35.435Z\",\"latitude\":24.665988333333335,\"longitude\":46.74039833333333}', '13-05-2022', '2022-05-13 18:32:37', '2022-05-13 18:32:37'),
(902, 2, '{\"time\":\"2022-05-13T18:32:45.427Z\",\"latitude\":24.665981666666667,\"longitude\":46.740410000000004}', '13-05-2022', '2022-05-13 18:32:47', '2022-05-13 18:32:47'),
(903, 2, '{\"time\":\"2022-05-13T18:32:55.440Z\",\"latitude\":24.66599666666667,\"longitude\":46.74042333333333}', '13-05-2022', '2022-05-13 18:32:57', '2022-05-13 18:32:57'),
(904, 2, '{\"time\":\"2022-05-13T18:33:05.439Z\",\"latitude\":24.666005000000002,\"longitude\":46.74044333333333}', '13-05-2022', '2022-05-13 18:33:07', '2022-05-13 18:33:07'),
(905, 2, '{\"time\":\"2022-05-13T18:33:15.509Z\",\"latitude\":24.666006666666664,\"longitude\":46.74046333333334}', '13-05-2022', '2022-05-13 18:33:17', '2022-05-13 18:33:17'),
(906, 2, '{\"time\":\"2022-05-13T18:33:25.438Z\",\"latitude\":24.665988333333335,\"longitude\":46.740453333333335}', '13-05-2022', '2022-05-13 18:33:27', '2022-05-13 18:33:27'),
(907, 2, '{\"time\":\"2022-05-13T18:33:35.402Z\",\"latitude\":24.665988333333335,\"longitude\":46.740453333333335}', '13-05-2022', '2022-05-13 18:33:37', '2022-05-13 18:33:37'),
(908, 2, '{\"time\":\"2022-05-13T18:33:45.437Z\",\"latitude\":24.665988333333335,\"longitude\":46.740453333333335}', '13-05-2022', '2022-05-13 18:33:47', '2022-05-13 18:33:47'),
(909, 2, '{\"time\":\"2022-05-13T18:33:55.430Z\",\"latitude\":24.666015,\"longitude\":46.74047166666666}', '13-05-2022', '2022-05-13 18:33:57', '2022-05-13 18:33:57'),
(910, 2, '{\"time\":\"2022-05-13T18:34:05.405Z\",\"latitude\":24.665975000000003,\"longitude\":46.74039500000001}', '13-05-2022', '2022-05-13 18:34:07', '2022-05-13 18:34:07'),
(911, 2, '{\"time\":\"2022-05-13T18:34:15.434Z\",\"latitude\":24.66596666666667,\"longitude\":46.74038666666667}', '13-05-2022', '2022-05-13 18:34:17', '2022-05-13 18:34:17'),
(912, 2, '{\"time\":\"2022-05-13T18:34:25.362Z\",\"latitude\":24.66596666666667,\"longitude\":46.74038666666667}', '13-05-2022', '2022-05-13 18:34:26', '2022-05-13 18:34:26'),
(913, 2, '{\"time\":\"2022-05-13T18:34:35.402Z\",\"latitude\":24.665961666666664,\"longitude\":46.74032166666666}', '13-05-2022', '2022-05-13 18:34:37', '2022-05-13 18:34:37'),
(914, 2, '{\"time\":\"2022-05-13T18:34:45.380Z\",\"latitude\":24.666008333333334,\"longitude\":46.74038}', '13-05-2022', '2022-05-13 18:34:47', '2022-05-13 18:34:47'),
(915, 2, '{\"time\":\"2022-05-13T18:34:55.372Z\",\"latitude\":24.665993333333336,\"longitude\":46.74037333333334}', '13-05-2022', '2022-05-13 18:34:56', '2022-05-13 18:34:56'),
(916, 2, '{\"time\":\"2022-05-13T18:35:05.393Z\",\"latitude\":24.66599666666667,\"longitude\":46.740404999999996}', '13-05-2022', '2022-05-13 18:35:06', '2022-05-13 18:35:06'),
(917, 2, '{\"time\":\"2022-05-13T18:35:15.363Z\",\"latitude\":24.666001666666663,\"longitude\":46.74042333333333}', '13-05-2022', '2022-05-13 18:35:16', '2022-05-13 18:35:16'),
(918, 2, '{\"time\":\"2022-05-13T18:35:25.394Z\",\"latitude\":24.666,\"longitude\":46.74036666666666}', '13-05-2022', '2022-05-13 18:35:26', '2022-05-13 18:35:26'),
(919, 2, '{\"time\":\"2022-05-13T18:35:35.414Z\",\"latitude\":24.66598333333333,\"longitude\":46.74030166666667}', '13-05-2022', '2022-05-13 18:35:37', '2022-05-13 18:35:37'),
(920, 2, '{\"time\":\"2022-05-13T18:35:45.392Z\",\"latitude\":24.665975000000003,\"longitude\":46.74028499999999}', '13-05-2022', '2022-05-13 18:35:47', '2022-05-13 18:35:47'),
(921, 2, '{\"time\":\"2022-05-13T18:35:55.395Z\",\"latitude\":24.66599833333333,\"longitude\":46.74029166666666}', '13-05-2022', '2022-05-13 18:35:56', '2022-05-13 18:35:56'),
(922, 2, '{\"time\":\"2022-05-13T18:36:05.363Z\",\"latitude\":24.666003333333332,\"longitude\":46.74031166666667}', '13-05-2022', '2022-05-13 18:36:06', '2022-05-13 18:36:06'),
(923, 2, '{\"time\":\"2022-05-13T18:36:15.423Z\",\"latitude\":24.66599666666667,\"longitude\":46.74038166666666}', '13-05-2022', '2022-05-13 18:36:17', '2022-05-13 18:36:17'),
(924, 2, '{\"time\":\"2022-05-13T18:36:25.410Z\",\"latitude\":24.665990000000004,\"longitude\":46.74039833333333}', '13-05-2022', '2022-05-13 18:36:29', '2022-05-13 18:36:29'),
(925, 2, '{\"time\":\"2022-05-13T18:36:35.423Z\",\"latitude\":24.665995,\"longitude\":46.74037166666667}', '13-05-2022', '2022-05-13 18:36:38', '2022-05-13 18:36:38'),
(926, 2, '{\"time\":\"2022-05-13T18:36:45.431Z\",\"latitude\":24.666038333333336,\"longitude\":46.74040166666667}', '13-05-2022', '2022-05-13 18:36:48', '2022-05-13 18:36:48'),
(927, 2, '{\"time\":\"2022-05-13T18:36:55.430Z\",\"latitude\":24.66594166666666,\"longitude\":46.74037}', '13-05-2022', '2022-05-13 18:36:57', '2022-05-13 18:36:57'),
(928, 2, '{\"time\":\"2022-05-13T18:37:05.417Z\",\"latitude\":24.665956666666663,\"longitude\":46.74037166666667}', '13-05-2022', '2022-05-13 18:37:07', '2022-05-13 18:37:07'),
(929, 2, '{\"time\":\"2022-05-13T18:37:15.429Z\",\"latitude\":24.665963333333334,\"longitude\":46.74040166666667}', '13-05-2022', '2022-05-13 18:37:16', '2022-05-13 18:37:16'),
(930, 2, '{\"time\":\"2022-05-13T18:37:25.420Z\",\"latitude\":24.665958333333332,\"longitude\":46.740429999999996}', '13-05-2022', '2022-05-13 18:37:27', '2022-05-13 18:37:27'),
(931, 2, '{\"time\":\"2022-05-13T18:37:35.436Z\",\"latitude\":24.66597,\"longitude\":46.74044166666666}', '13-05-2022', '2022-05-13 18:37:37', '2022-05-13 18:37:37'),
(932, 2, '{\"time\":\"2022-05-13T18:37:45.440Z\",\"latitude\":24.665945000000004,\"longitude\":46.74039}', '13-05-2022', '2022-05-13 18:37:47', '2022-05-13 18:37:47'),
(933, 2, '{\"time\":\"2022-05-13T18:37:55.428Z\",\"latitude\":24.665943333333335,\"longitude\":46.74038166666666}', '13-05-2022', '2022-05-13 18:37:57', '2022-05-13 18:37:57'),
(934, 2, '{\"time\":\"2022-05-13T18:38:05.387Z\",\"latitude\":24.665943333333335,\"longitude\":46.74038166666666}', '13-05-2022', '2022-05-13 18:38:07', '2022-05-13 18:38:07'),
(935, 2, '{\"time\":\"2022-05-13T18:38:15.434Z\",\"latitude\":24.665943333333335,\"longitude\":46.74038166666666}', '13-05-2022', '2022-05-13 18:38:17', '2022-05-13 18:38:17'),
(936, 2, '{\"time\":\"2022-05-13T18:38:25.394Z\",\"latitude\":24.665943333333335,\"longitude\":46.74038166666666}', '13-05-2022', '2022-05-13 18:38:27', '2022-05-13 18:38:27'),
(937, 2, '{\"time\":\"2022-05-13T18:38:35.424Z\",\"latitude\":24.665943333333335,\"longitude\":46.74038166666666}', '13-05-2022', '2022-05-13 18:38:37', '2022-05-13 18:38:37'),
(938, 2, '{\"time\":\"2022-05-13T18:38:45.437Z\",\"latitude\":24.665943333333335,\"longitude\":46.74038166666666}', '13-05-2022', '2022-05-13 18:38:47', '2022-05-13 18:38:47'),
(939, 2, '{\"time\":\"2022-05-13T18:38:55.435Z\",\"latitude\":24.66595166666667,\"longitude\":46.74038833333334}', '13-05-2022', '2022-05-13 18:38:57', '2022-05-13 18:38:57'),
(940, 2, '{\"time\":\"2022-05-13T18:39:05.430Z\",\"latitude\":24.665995,\"longitude\":46.74042333333333}', '13-05-2022', '2022-05-13 18:39:07', '2022-05-13 18:39:07'),
(941, 2, '{\"time\":\"2022-05-13T18:39:15.435Z\",\"latitude\":24.665995,\"longitude\":46.74042333333333}', '13-05-2022', '2022-05-13 18:39:17', '2022-05-13 18:39:17'),
(942, 2, '{\"time\":\"2022-05-13T18:39:25.434Z\",\"latitude\":24.665995,\"longitude\":46.74042333333333}', '13-05-2022', '2022-05-13 18:39:27', '2022-05-13 18:39:27'),
(943, 2, '{\"time\":\"2022-05-13T18:39:35.397Z\",\"latitude\":24.666003333333332,\"longitude\":46.74041333333333}', '13-05-2022', '2022-05-13 18:39:37', '2022-05-13 18:39:37'),
(944, 2, '{\"time\":\"2022-05-13T18:39:45.429Z\",\"latitude\":24.666003333333332,\"longitude\":46.74042333333333}', '13-05-2022', '2022-05-13 18:39:47', '2022-05-13 18:39:47'),
(945, 2, '{\"time\":\"2022-05-13T18:39:55.428Z\",\"latitude\":24.666005000000002,\"longitude\":46.740455000000004}', '13-05-2022', '2022-05-13 18:39:57', '2022-05-13 18:39:57'),
(946, 2, '{\"time\":\"2022-05-13T18:40:05.433Z\",\"latitude\":24.666018333333334,\"longitude\":46.740455000000004}', '13-05-2022', '2022-05-13 18:40:07', '2022-05-13 18:40:07'),
(947, 2, '{\"time\":\"2022-05-13T18:40:15.400Z\",\"latitude\":24.666018333333334,\"longitude\":46.74049}', '13-05-2022', '2022-05-13 18:40:17', '2022-05-13 18:40:17'),
(948, 2, '{\"time\":\"2022-05-13T18:40:25.437Z\",\"latitude\":24.666013333333332,\"longitude\":46.74048500000001}', '13-05-2022', '2022-05-13 18:40:27', '2022-05-13 18:40:27'),
(949, 2, '{\"time\":\"2022-05-13T18:40:35.400Z\",\"latitude\":24.666013333333332,\"longitude\":46.74048500000001}', '13-05-2022', '2022-05-13 18:40:37', '2022-05-13 18:40:37'),
(950, 2, '{\"time\":\"2022-05-13T18:40:45.368Z\",\"latitude\":24.666016666666664,\"longitude\":46.74047333333333}', '13-05-2022', '2022-05-13 18:40:47', '2022-05-13 18:40:47'),
(951, 2, '{\"time\":\"2022-05-13T18:40:55.431Z\",\"latitude\":24.666021666666666,\"longitude\":46.74047333333333}', '13-05-2022', '2022-05-13 18:40:57', '2022-05-13 18:40:57'),
(952, 2, '{\"time\":\"2022-05-13T18:41:05.381Z\",\"latitude\":24.666009999999996,\"longitude\":46.740449999999996}', '13-05-2022', '2022-05-13 18:41:07', '2022-05-13 18:41:07'),
(953, 2, '{\"time\":\"2022-05-13T18:41:15.416Z\",\"latitude\":24.666009999999996,\"longitude\":46.740449999999996}', '13-05-2022', '2022-05-13 18:41:17', '2022-05-13 18:41:17'),
(954, 2, '{\"time\":\"2022-05-13T18:41:25.391Z\",\"latitude\":24.666009999999996,\"longitude\":46.740449999999996}', '13-05-2022', '2022-05-13 18:41:26', '2022-05-13 18:41:26'),
(955, 2, '{\"time\":\"2022-05-13T18:41:35.426Z\",\"latitude\":24.666009999999996,\"longitude\":46.740449999999996}', '13-05-2022', '2022-05-13 18:41:37', '2022-05-13 18:41:37'),
(956, 2, '{\"time\":\"2022-05-13T18:41:45.386Z\",\"latitude\":24.666009999999996,\"longitude\":46.740449999999996}', '13-05-2022', '2022-05-13 18:41:46', '2022-05-13 18:41:46'),
(957, 2, '{\"time\":\"2022-05-13T18:41:55.404Z\",\"latitude\":24.666009999999996,\"longitude\":46.740449999999996}', '13-05-2022', '2022-05-13 18:41:57', '2022-05-13 18:41:57'),
(958, 2, '{\"time\":\"2022-05-13T18:42:05.406Z\",\"latitude\":24.666009999999996,\"longitude\":46.7404}', '13-05-2022', '2022-05-13 18:42:06', '2022-05-13 18:42:06'),
(959, 2, '{\"time\":\"2022-05-13T18:42:15.393Z\",\"latitude\":24.666006666666664,\"longitude\":46.74041833333334}', '13-05-2022', '2022-05-13 18:42:17', '2022-05-13 18:42:17'),
(960, 2, '{\"time\":\"2022-05-13T18:42:25.385Z\",\"latitude\":24.66598333333333,\"longitude\":46.74041999999999}', '13-05-2022', '2022-05-13 18:42:27', '2022-05-13 18:42:27'),
(961, 2, '{\"time\":\"2022-05-13T19:29:11.833Z\",\"latitude\":24.6481444,\"longitude\":46.7153683}', '13-05-2022', '2022-05-13 19:29:13', '2022-05-13 19:29:13'),
(962, 2, '{\"time\":\"2022-05-13T19:29:26.500Z\",\"latitude\":24.645523333333337,\"longitude\":46.71631833333333}', '13-05-2022', '2022-05-13 19:29:28', '2022-05-13 19:29:28'),
(963, 2, '{\"time\":\"2022-05-13T19:29:36.500Z\",\"latitude\":24.64566333333333,\"longitude\":46.716786666666664}', '13-05-2022', '2022-05-13 19:29:38', '2022-05-13 19:29:38'),
(964, 2, '{\"time\":\"2022-05-13T19:29:46.497Z\",\"latitude\":24.645681666666665,\"longitude\":46.71688833333333}', '13-05-2022', '2022-05-13 19:29:48', '2022-05-13 19:29:48'),
(965, 2, '{\"time\":\"2022-05-13T19:30:51.530Z\",\"latitude\":24.64575333333333,\"longitude\":46.715959999999995}', '13-05-2022', '2022-05-13 19:30:53', '2022-05-13 19:30:53'),
(966, 2, '{\"time\":\"2022-05-13T19:31:04.438Z\",\"latitude\":24.646463333333333,\"longitude\":46.71563333333334}', '13-05-2022', '2022-05-13 19:31:06', '2022-05-13 19:31:06'),
(967, 2, '{\"time\":\"2022-05-13T19:31:14.510Z\",\"latitude\":24.646523333333334,\"longitude\":46.71549666666667}', '13-05-2022', '2022-05-13 19:31:16', '2022-05-13 19:31:16'),
(968, 2, '{\"time\":\"2022-05-13T19:31:24.432Z\",\"latitude\":24.64656166666667,\"longitude\":46.71547999999999}', '13-05-2022', '2022-05-13 19:31:26', '2022-05-13 19:31:26'),
(969, 2, '{\"time\":\"2022-05-13T19:31:34.443Z\",\"latitude\":24.646595,\"longitude\":46.71552499999999}', '13-05-2022', '2022-05-13 19:31:36', '2022-05-13 19:31:36'),
(970, 2, '{\"time\":\"2022-05-13T19:31:44.440Z\",\"latitude\":24.64665,\"longitude\":46.71558166666667}', '13-05-2022', '2022-05-13 19:31:46', '2022-05-13 19:31:46'),
(971, 2, '{\"time\":\"2022-05-13T19:31:54.435Z\",\"latitude\":24.64666833333333,\"longitude\":46.715650000000004}', '13-05-2022', '2022-05-13 19:31:56', '2022-05-13 19:31:56'),
(972, 2, '{\"time\":\"2022-05-13T19:32:04.434Z\",\"latitude\":24.64675833333333,\"longitude\":46.715785000000004}', '13-05-2022', '2022-05-13 19:32:06', '2022-05-13 19:32:06'),
(973, 2, '{\"time\":\"2022-05-13T19:32:14.426Z\",\"latitude\":24.646721666666668,\"longitude\":46.71585833333334}', '13-05-2022', '2022-05-13 19:32:16', '2022-05-13 19:32:16'),
(974, 2, '{\"time\":\"2022-05-13T19:32:24.433Z\",\"latitude\":24.646749999999997,\"longitude\":46.71593500000001}', '13-05-2022', '2022-05-13 19:32:26', '2022-05-13 19:32:26'),
(975, 2, '{\"time\":\"2022-05-13T19:32:34.432Z\",\"latitude\":24.646703333333335,\"longitude\":46.71599}', '13-05-2022', '2022-05-13 19:32:36', '2022-05-13 19:32:36'),
(976, 2, '{\"time\":\"2022-05-13T19:32:44.430Z\",\"latitude\":24.64669666666667,\"longitude\":46.71601999999999}', '13-05-2022', '2022-05-13 19:32:46', '2022-05-13 19:32:46'),
(977, 2, '{\"time\":\"2022-05-13T19:32:54.435Z\",\"latitude\":24.646659999999997,\"longitude\":46.71602333333333}', '13-05-2022', '2022-05-13 19:32:56', '2022-05-13 19:32:56'),
(978, 2, '{\"time\":\"2022-05-13T19:33:04.434Z\",\"latitude\":24.646509999999996,\"longitude\":46.716035}', '13-05-2022', '2022-05-13 19:33:06', '2022-05-13 19:33:06'),
(979, 2, '{\"time\":\"2022-05-13T19:33:14.434Z\",\"latitude\":24.646400000000003,\"longitude\":46.71605833333333}', '13-05-2022', '2022-05-13 19:33:16', '2022-05-13 19:33:16'),
(980, 2, '{\"time\":\"2022-05-13T19:33:24.435Z\",\"latitude\":24.64623166666667,\"longitude\":46.71617166666667}', '13-05-2022', '2022-05-13 19:33:26', '2022-05-13 19:33:26'),
(981, 2, '{\"time\":\"2022-05-13T19:33:34.430Z\",\"latitude\":24.646121666666666,\"longitude\":46.71620500000001}', '13-05-2022', '2022-05-13 19:33:36', '2022-05-13 19:33:36'),
(982, 2, '{\"time\":\"2022-05-13T19:35:39.436Z\",\"latitude\":24.646193333333333,\"longitude\":46.71684833333334}', '13-05-2022', '2022-05-13 19:35:41', '2022-05-13 19:35:41'),
(983, 2, '{\"time\":\"2022-05-13T19:35:49.432Z\",\"latitude\":24.64633666666667,\"longitude\":46.71685000000001}', '13-05-2022', '2022-05-13 19:35:51', '2022-05-13 19:35:51'),
(984, 2, '{\"time\":\"2022-05-13T19:36:10.433Z\",\"latitude\":24.646914999999996,\"longitude\":46.716658333333335}', '13-05-2022', '2022-05-13 19:36:12', '2022-05-13 19:36:12'),
(985, 2, '{\"time\":\"2022-05-13T19:36:20.431Z\",\"latitude\":24.646871666666666,\"longitude\":46.71671166666667}', '13-05-2022', '2022-05-13 19:36:22', '2022-05-13 19:36:22'),
(986, 2, '{\"time\":\"2022-05-13T19:36:30.428Z\",\"latitude\":24.64666833333333,\"longitude\":46.716693333333325}', '13-05-2022', '2022-05-13 19:36:32', '2022-05-13 19:36:32'),
(987, 2, '{\"time\":\"2022-05-13T19:36:40.434Z\",\"latitude\":24.646665,\"longitude\":46.716559999999994}', '13-05-2022', '2022-05-13 19:36:42', '2022-05-13 19:36:42'),
(988, 2, '{\"time\":\"2022-05-13T19:36:50.430Z\",\"latitude\":24.64663,\"longitude\":46.71661166666666}', '13-05-2022', '2022-05-13 19:36:52', '2022-05-13 19:36:52'),
(989, 2, '{\"time\":\"2022-05-13T19:37:00.432Z\",\"latitude\":24.646556666666665,\"longitude\":46.716636666666666}', '13-05-2022', '2022-05-13 19:37:02', '2022-05-13 19:37:02'),
(990, 2, '{\"time\":\"2022-05-13T19:37:10.431Z\",\"latitude\":24.646543333333337,\"longitude\":46.71661833333333}', '13-05-2022', '2022-05-13 19:37:12', '2022-05-13 19:37:12'),
(991, 2, '{\"time\":\"2022-05-13T19:37:20.429Z\",\"latitude\":24.646621666666668,\"longitude\":46.71663}', '13-05-2022', '2022-05-13 19:37:22', '2022-05-13 19:37:22'),
(992, 2, '{\"time\":\"2022-05-13T19:38:26.508Z\",\"latitude\":24.646646666666665,\"longitude\":46.716321666666666}', '13-05-2022', '2022-05-13 19:38:28', '2022-05-13 19:38:28'),
(993, 2, '{\"time\":\"2022-05-13T19:38:51.431Z\",\"latitude\":24.64647166666667,\"longitude\":46.716603333333325}', '13-05-2022', '2022-05-13 19:38:53', '2022-05-13 19:38:53'),
(994, 2, '{\"time\":\"2022-05-13T19:39:01.426Z\",\"latitude\":24.646158333333332,\"longitude\":46.716636666666666}', '13-05-2022', '2022-05-13 19:39:03', '2022-05-13 19:39:03'),
(995, 2, '{\"time\":\"2022-05-13T19:39:13.433Z\",\"latitude\":24.64636666666667,\"longitude\":46.71659833333333}', '13-05-2022', '2022-05-13 19:39:15', '2022-05-13 19:39:15'),
(996, 2, '{\"time\":\"2022-05-13T19:39:23.433Z\",\"latitude\":24.646400000000003,\"longitude\":46.716333333333324}', '13-05-2022', '2022-05-13 19:39:25', '2022-05-13 19:39:25'),
(997, 2, '{\"time\":\"2022-05-13T19:39:33.433Z\",\"latitude\":24.646241666666665,\"longitude\":46.71625833333333}', '13-05-2022', '2022-05-13 19:39:35', '2022-05-13 19:39:35'),
(998, 2, '{\"time\":\"2022-05-13T19:39:43.434Z\",\"latitude\":24.646055,\"longitude\":46.71625166666666}', '13-05-2022', '2022-05-13 19:39:45', '2022-05-13 19:39:45'),
(999, 2, '{\"time\":\"2022-05-13T19:39:53.440Z\",\"latitude\":24.646033333333335,\"longitude\":46.716274999999996}', '13-05-2022', '2022-05-13 19:39:55', '2022-05-13 19:39:55'),
(1000, 2, '{\"time\":\"2022-05-13T19:40:03.437Z\",\"latitude\":24.64596333333333,\"longitude\":46.71636333333333}', '13-05-2022', '2022-05-13 19:40:05', '2022-05-13 19:40:05'),
(1001, 2, '{\"time\":\"2022-05-13T19:40:13.435Z\",\"latitude\":24.645913333333336,\"longitude\":46.716364999999996}', '13-05-2022', '2022-05-13 19:40:15', '2022-05-13 19:40:15'),
(1002, 2, '{\"time\":\"2022-05-13T19:40:23.396Z\",\"latitude\":24.645911666666667,\"longitude\":46.716379999999994}', '13-05-2022', '2022-05-13 19:40:25', '2022-05-13 19:40:25'),
(1003, 2, '{\"time\":\"2022-05-13T19:40:33.433Z\",\"latitude\":24.645795,\"longitude\":46.71642}', '13-05-2022', '2022-05-13 19:40:35', '2022-05-13 19:40:35'),
(1004, 2, '{\"time\":\"2022-05-13T19:40:43.498Z\",\"latitude\":24.645681666666665,\"longitude\":46.716456666666666}', '13-05-2022', '2022-05-13 19:40:45', '2022-05-13 19:40:45'),
(1005, 2, '{\"time\":\"2022-05-13T19:40:53.430Z\",\"latitude\":24.645611666666664,\"longitude\":46.716481666666674}', '13-05-2022', '2022-05-13 19:40:55', '2022-05-13 19:40:55'),
(1006, 2, '{\"time\":\"2022-05-13T19:41:03.434Z\",\"latitude\":24.645611666666664,\"longitude\":46.716501666666666}', '13-05-2022', '2022-05-13 19:41:05', '2022-05-13 19:41:05'),
(1007, 2, '{\"time\":\"2022-05-13T19:41:13.424Z\",\"latitude\":24.645611666666664,\"longitude\":46.716501666666666}', '13-05-2022', '2022-05-13 19:41:15', '2022-05-13 19:41:15'),
(1008, 2, '{\"time\":\"2022-05-13T19:41:23.429Z\",\"latitude\":24.645591666666665,\"longitude\":46.716604999999994}', '13-05-2022', '2022-05-13 19:41:25', '2022-05-13 19:41:25'),
(1009, 2, '{\"time\":\"2022-05-13T19:41:33.432Z\",\"latitude\":24.64557333333333,\"longitude\":46.71673666666667}', '13-05-2022', '2022-05-13 19:41:35', '2022-05-13 19:41:35'),
(1010, 2, '{\"time\":\"2022-05-13T19:41:43.432Z\",\"latitude\":24.645525,\"longitude\":46.71697000000001}', '13-05-2022', '2022-05-13 19:41:45', '2022-05-13 19:41:45'),
(1011, 2, '{\"time\":\"2022-05-13T19:41:53.431Z\",\"latitude\":24.645535000000002,\"longitude\":46.71702833333334}', '13-05-2022', '2022-05-13 19:41:55', '2022-05-13 19:41:55'),
(1012, 2, '{\"time\":\"2022-05-13T19:42:03.433Z\",\"latitude\":24.645698333333332,\"longitude\":46.717088333333336}', '13-05-2022', '2022-05-13 19:42:05', '2022-05-13 19:42:05'),
(1013, 2, '{\"time\":\"2022-05-13T19:42:13.431Z\",\"latitude\":24.645820000000004,\"longitude\":46.71708333333333}', '13-05-2022', '2022-05-13 19:42:15', '2022-05-13 19:42:15'),
(1014, 2, '{\"time\":\"2022-05-13T19:42:23.428Z\",\"latitude\":24.645946666666667,\"longitude\":46.71706833333333}', '13-05-2022', '2022-05-13 19:42:25', '2022-05-13 19:42:25'),
(1015, 2, '{\"time\":\"2022-05-13T19:42:33.432Z\",\"latitude\":24.64603833333333,\"longitude\":46.717000000000006}', '13-05-2022', '2022-05-13 19:42:35', '2022-05-13 19:42:35'),
(1016, 2, '{\"time\":\"2022-05-13T19:42:43.431Z\",\"latitude\":24.646115,\"longitude\":46.71695}', '13-05-2022', '2022-05-13 19:42:45', '2022-05-13 19:42:45'),
(1017, 2, '{\"time\":\"2022-05-13T19:42:53.430Z\",\"latitude\":24.646241666666665,\"longitude\":46.71694000000001}', '13-05-2022', '2022-05-13 19:42:55', '2022-05-13 19:42:55'),
(1018, 2, '{\"time\":\"2022-05-13T19:43:03.430Z\",\"latitude\":24.646340000000002,\"longitude\":46.71695166666667}', '13-05-2022', '2022-05-13 19:43:05', '2022-05-13 19:43:05'),
(1019, 2, '{\"time\":\"2022-05-13T19:43:13.430Z\",\"latitude\":24.646486666666668,\"longitude\":46.71694333333333}', '13-05-2022', '2022-05-13 19:43:15', '2022-05-13 19:43:15'),
(1020, 2, '{\"time\":\"2022-05-13T19:43:23.398Z\",\"latitude\":24.646608333333333,\"longitude\":46.716975000000005}', '13-05-2022', '2022-05-13 19:43:25', '2022-05-13 19:43:25'),
(1021, 2, '{\"time\":\"2022-05-13T19:43:33.429Z\",\"latitude\":24.646725,\"longitude\":46.716975000000005}', '13-05-2022', '2022-05-13 19:43:35', '2022-05-13 19:43:35'),
(1022, 2, '{\"time\":\"2022-05-13T19:43:43.426Z\",\"latitude\":24.646721666666668,\"longitude\":46.716995}', '13-05-2022', '2022-05-13 19:43:45', '2022-05-13 19:43:45'),
(1023, 2, '{\"time\":\"2022-05-13T19:43:53.435Z\",\"latitude\":24.646731666666664,\"longitude\":46.71699333333333}', '13-05-2022', '2022-05-13 19:43:55', '2022-05-13 19:43:55'),
(1024, 2, '{\"time\":\"2022-05-13T19:44:03.431Z\",\"latitude\":24.646693333333328,\"longitude\":46.71704833333333}', '13-05-2022', '2022-05-13 19:44:05', '2022-05-13 19:44:05'),
(1025, 2, '{\"time\":\"2022-05-13T19:44:13.427Z\",\"latitude\":24.64674,\"longitude\":46.71711666666667}', '13-05-2022', '2022-05-13 19:44:15', '2022-05-13 19:44:15'),
(1026, 2, '{\"time\":\"2022-05-13T19:44:23.401Z\",\"latitude\":24.64670833333333,\"longitude\":46.71712000000001}', '13-05-2022', '2022-05-13 19:44:25', '2022-05-13 19:44:25'),
(1027, 2, '{\"time\":\"2022-05-13T19:44:33.431Z\",\"latitude\":24.646715000000004,\"longitude\":46.717058333333334}', '13-05-2022', '2022-05-13 19:44:35', '2022-05-13 19:44:35'),
(1028, 2, '{\"time\":\"2022-05-13T19:44:43.376Z\",\"latitude\":24.646745000000003,\"longitude\":46.717045000000006}', '13-05-2022', '2022-05-13 19:44:44', '2022-05-13 19:44:44'),
(1029, 2, '{\"time\":\"2022-05-13T19:44:53.405Z\",\"latitude\":24.64675666666667,\"longitude\":46.716975000000005}', '13-05-2022', '2022-05-13 19:44:55', '2022-05-13 19:44:55'),
(1030, 2, '{\"time\":\"2022-05-13T19:45:03.405Z\",\"latitude\":24.646736666666666,\"longitude\":46.716966666666664}', '13-05-2022', '2022-05-13 19:45:05', '2022-05-13 19:45:05'),
(1031, 2, '{\"time\":\"2022-05-13T19:45:13.397Z\",\"latitude\":24.64668166666667,\"longitude\":46.71692666666666}', '13-05-2022', '2022-05-13 19:45:15', '2022-05-13 19:45:15'),
(1032, 2, '{\"time\":\"2022-05-13T19:45:23.415Z\",\"latitude\":24.646213333333336,\"longitude\":46.717000000000006}', '13-05-2022', '2022-05-13 19:45:25', '2022-05-13 19:45:25'),
(1033, 2, '{\"time\":\"2022-05-13T19:45:25.115Z\",\"latitude\":24.64620166666667,\"longitude\":46.717018333333336}', '13-05-2022', '2022-05-13 19:45:26', '2022-05-13 19:45:26'),
(1034, 2, '{\"time\":\"2022-05-13T19:45:27.751Z\",\"latitude\":24.646185,\"longitude\":46.71703000000001}', '13-05-2022', '2022-05-13 19:45:28', '2022-05-13 19:45:28'),
(1035, 2, '{\"time\":\"2022-05-13T19:45:38.406Z\",\"latitude\":24.646161666666664,\"longitude\":46.717066666666675}', '13-05-2022', '2022-05-13 19:45:40', '2022-05-13 19:45:40'),
(1036, 2, '{\"time\":\"2022-05-13T19:45:48.407Z\",\"latitude\":24.645950000000003,\"longitude\":46.717025}', '13-05-2022', '2022-05-13 19:45:50', '2022-05-13 19:45:50'),
(1037, 2, '{\"time\":\"2022-05-13T19:45:58.385Z\",\"latitude\":24.645764999999997,\"longitude\":46.716953333333336}', '13-05-2022', '2022-05-13 19:45:59', '2022-05-13 19:45:59'),
(1038, 2, '{\"time\":\"2022-05-13T19:46:08.418Z\",\"latitude\":24.645586666666667,\"longitude\":46.716788333333334}', '13-05-2022', '2022-05-13 19:46:10', '2022-05-13 19:46:10'),
(1039, 2, '{\"time\":\"2022-05-13T19:46:18.452Z\",\"latitude\":24.64513833333333,\"longitude\":46.71689666666666}', '13-05-2022', '2022-05-13 19:46:20', '2022-05-13 19:46:20'),
(1040, 2, '{\"time\":\"2022-05-13T19:46:22.153Z\",\"latitude\":24.644948333333332,\"longitude\":46.71724166666666}', '13-05-2022', '2022-05-13 19:46:23', '2022-05-13 19:46:23'),
(1041, 2, '{\"time\":\"2022-05-13T19:46:23.839Z\",\"latitude\":24.64491666666667,\"longitude\":46.71726166666667}', '13-05-2022', '2022-05-13 19:46:24', '2022-05-13 19:46:24'),
(1042, 2, '{\"time\":\"2022-05-13T19:46:34.444Z\",\"latitude\":24.644746666666666,\"longitude\":46.71720666666667}', '13-05-2022', '2022-05-13 19:46:36', '2022-05-13 19:46:36'),
(1043, 2, '{\"time\":\"2022-05-13T19:46:36.622Z\",\"latitude\":24.644743333333334,\"longitude\":46.71721666666667}', '13-05-2022', '2022-05-13 19:46:37', '2022-05-13 19:46:37'),
(1044, 2, '{\"time\":\"2022-05-13T19:46:39.290Z\",\"latitude\":24.64467666666667,\"longitude\":46.717299999999994}', '13-05-2022', '2022-05-13 19:46:40', '2022-05-13 19:46:40'),
(1045, 2, '{\"time\":\"2022-05-13T19:46:49.430Z\",\"latitude\":24.644418333333338,\"longitude\":46.717355}', '13-05-2022', '2022-05-13 19:46:51', '2022-05-13 19:46:51'),
(1046, 2, '{\"time\":\"2022-05-13T19:46:59.433Z\",\"latitude\":24.644238333333337,\"longitude\":46.717423333333336}', '13-05-2022', '2022-05-13 19:47:01', '2022-05-13 19:47:01'),
(1047, 2, '{\"time\":\"2022-05-13T19:47:09.410Z\",\"latitude\":24.643991666666672,\"longitude\":46.71754333333333}', '13-05-2022', '2022-05-13 19:47:11', '2022-05-13 19:47:11'),
(1048, 2, '{\"time\":\"2022-05-13T19:47:12.438Z\",\"latitude\":24.643948333333334,\"longitude\":46.71757666666667}', '13-05-2022', '2022-05-13 19:47:13', '2022-05-13 19:47:13'),
(1049, 2, '{\"time\":\"2022-05-13T19:47:18.104Z\",\"latitude\":24.643941666666667,\"longitude\":46.717571666666664}', '13-05-2022', '2022-05-13 19:47:19', '2022-05-13 19:47:19'),
(1050, 2, '{\"time\":\"2022-05-13T19:47:28.431Z\",\"latitude\":24.643906666666666,\"longitude\":46.717594999999996}', '13-05-2022', '2022-05-13 19:47:30', '2022-05-13 19:47:30'),
(1051, 2, '{\"time\":\"2022-05-13T19:47:38.445Z\",\"latitude\":24.64356833333333,\"longitude\":46.71769833333333}', '13-05-2022', '2022-05-13 19:47:40', '2022-05-13 19:47:40'),
(1052, 2, '{\"time\":\"2022-05-13T19:47:41.120Z\",\"latitude\":24.643456666666665,\"longitude\":46.71791499999999}', '13-05-2022', '2022-05-13 19:47:42', '2022-05-13 19:47:42'),
(1053, 2, '{\"time\":\"2022-05-13T19:47:43.802Z\",\"latitude\":24.643296666666668,\"longitude\":46.71779333333334}', '13-05-2022', '2022-05-13 19:47:44', '2022-05-13 19:47:44'),
(1054, 2, '{\"time\":\"2022-05-13T19:47:54.444Z\",\"latitude\":24.6433,\"longitude\":46.718093333333336}', '13-05-2022', '2022-05-13 19:47:56', '2022-05-13 19:47:56'),
(1055, 2, '{\"time\":\"2022-05-13T19:47:57.640Z\",\"latitude\":24.643281666666667,\"longitude\":46.71814666666668}', '13-05-2022', '2022-05-13 19:47:58', '2022-05-13 19:47:58'),
(1056, 2, '{\"time\":\"2022-05-13T19:48:01.117Z\",\"latitude\":24.643295,\"longitude\":46.71827666666666}', '13-05-2022', '2022-05-13 19:48:02', '2022-05-13 19:48:02'),
(1057, 2, '{\"time\":\"2022-05-13T19:48:11.487Z\",\"latitude\":24.643291666666663,\"longitude\":46.71898666666666}', '13-05-2022', '2022-05-13 19:48:13', '2022-05-13 19:48:13'),
(1058, 2, '{\"time\":\"2022-05-13T19:48:16.403Z\",\"latitude\":24.643261666666664,\"longitude\":46.71899333333334}', '13-05-2022', '2022-05-13 19:48:17', '2022-05-13 19:48:17'),
(1059, 2, '{\"time\":\"2022-05-13T19:48:38.087Z\",\"latitude\":24.643081666666664,\"longitude\":46.719105000000006}', '13-05-2022', '2022-05-13 19:48:39', '2022-05-13 19:48:39'),
(1060, 2, '{\"time\":\"2022-05-13T19:48:48.408Z\",\"latitude\":24.64218166666667,\"longitude\":46.71894}', '13-05-2022', '2022-05-13 19:48:50', '2022-05-13 19:48:50'),
(1061, 2, '{\"time\":\"2022-05-13T19:48:58.450Z\",\"latitude\":24.64083833333333,\"longitude\":46.718498333333336}', '13-05-2022', '2022-05-13 19:49:01', '2022-05-13 19:49:01'),
(1062, 2, '{\"time\":\"2022-05-13T19:49:05.414Z\",\"latitude\":24.640634999999996,\"longitude\":46.718968333333336}', '13-05-2022', '2022-05-13 19:49:06', '2022-05-13 19:49:06'),
(1063, 2, '{\"time\":\"2022-05-13T19:49:10.313Z\",\"latitude\":24.6407,\"longitude\":46.718975}', '13-05-2022', '2022-05-13 19:49:11', '2022-05-13 19:49:11'),
(1064, 2, '{\"time\":\"2022-05-13T19:49:20.394Z\",\"latitude\":24.640925,\"longitude\":46.71940500000001}', '13-05-2022', '2022-05-13 19:49:25', '2022-05-13 19:49:25'),
(1065, 2, '{\"time\":\"2022-05-13T19:49:31.404Z\",\"latitude\":24.640975000000005,\"longitude\":46.71949333333334}', '13-05-2022', '2022-05-13 19:49:33', '2022-05-13 19:49:33'),
(1066, 2, '{\"time\":\"2022-05-13T19:49:41.436Z\",\"latitude\":24.640948333333334,\"longitude\":46.71952833333333}', '13-05-2022', '2022-05-13 19:49:43', '2022-05-13 19:49:43'),
(1067, 2, '{\"time\":\"2022-05-13T19:49:51.439Z\",\"latitude\":24.640993333333334,\"longitude\":46.719525000000004}', '13-05-2022', '2022-05-13 19:49:53', '2022-05-13 19:49:53'),
(1068, 2, '{\"time\":\"2022-05-13T19:50:01.435Z\",\"latitude\":24.640993333333334,\"longitude\":46.71964833333333}', '13-05-2022', '2022-05-13 19:50:03', '2022-05-13 19:50:03'),
(1069, 2, '{\"time\":\"2022-05-13T19:50:11.432Z\",\"latitude\":24.640931666666667,\"longitude\":46.71962}', '13-05-2022', '2022-05-13 19:50:13', '2022-05-13 19:50:13'),
(1070, 2, '{\"time\":\"2022-05-13T19:50:21.398Z\",\"latitude\":24.640868333333334,\"longitude\":46.71962}', '13-05-2022', '2022-05-13 19:50:23', '2022-05-13 19:50:23'),
(1071, 2, '{\"time\":\"2022-05-13T19:50:31.432Z\",\"latitude\":24.64088166666667,\"longitude\":46.71966333333333}', '13-05-2022', '2022-05-13 19:50:33', '2022-05-13 19:50:33'),
(1072, 2, '{\"time\":\"2022-05-13T19:50:41.423Z\",\"latitude\":24.640960000000003,\"longitude\":46.71971666666666}', '13-05-2022', '2022-05-13 19:50:43', '2022-05-13 19:50:43'),
(1073, 2, '{\"time\":\"2022-05-13T19:50:51.426Z\",\"latitude\":24.640990000000002,\"longitude\":46.71965}', '13-05-2022', '2022-05-13 19:50:53', '2022-05-13 19:50:53'),
(1074, 2, '{\"time\":\"2022-05-13T19:51:01.428Z\",\"latitude\":24.64092333333333,\"longitude\":46.71962}', '13-05-2022', '2022-05-13 19:51:03', '2022-05-13 19:51:03'),
(1075, 2, '{\"time\":\"2022-05-13T19:51:11.506Z\",\"latitude\":24.64089,\"longitude\":46.71964333333334}', '13-05-2022', '2022-05-13 19:51:13', '2022-05-13 19:51:13'),
(1076, 2, '{\"time\":\"2022-05-13T19:51:21.429Z\",\"latitude\":24.64088166666667,\"longitude\":46.71972000000001}', '13-05-2022', '2022-05-13 19:51:23', '2022-05-13 19:51:23'),
(1077, 2, '{\"time\":\"2022-05-13T19:51:31.432Z\",\"latitude\":24.640728333333332,\"longitude\":46.71975666666667}', '13-05-2022', '2022-05-13 19:51:33', '2022-05-13 19:51:33'),
(1078, 2, '{\"time\":\"2022-05-13T19:51:41.431Z\",\"latitude\":24.640750000000004,\"longitude\":46.71971166666667}', '13-05-2022', '2022-05-13 19:51:43', '2022-05-13 19:51:43'),
(1079, 2, '{\"time\":\"2022-05-13T19:54:35.434Z\",\"latitude\":24.64110333333333,\"longitude\":46.719660000000005}', '13-05-2022', '2022-05-13 19:54:37', '2022-05-13 19:54:37'),
(1080, 2, '{\"time\":\"2022-05-13T19:54:45.385Z\",\"latitude\":24.6408,\"longitude\":46.71972833333333}', '13-05-2022', '2022-05-13 19:54:47', '2022-05-13 19:54:47'),
(1081, 2, '{\"time\":\"2022-05-13T19:54:55.414Z\",\"latitude\":24.640818333333332,\"longitude\":46.71975333333333}', '13-05-2022', '2022-05-13 19:55:00', '2022-05-13 19:55:00'),
(1082, 2, '{\"time\":\"2022-05-13T19:55:05.411Z\",\"latitude\":24.640828333333335,\"longitude\":46.71973666666666}', '13-05-2022', '2022-05-13 19:55:08', '2022-05-13 19:55:08'),
(1083, 2, '{\"time\":\"2022-05-13T19:55:15.396Z\",\"latitude\":24.640826666666666,\"longitude\":46.71973666666666}', '13-05-2022', '2022-05-13 19:55:17', '2022-05-13 19:55:17'),
(1084, 2, '{\"time\":\"2022-05-13T19:55:25.376Z\",\"latitude\":24.640886666666667,\"longitude\":46.719703333333335}', '13-05-2022', '2022-05-13 19:55:27', '2022-05-13 19:55:27'),
(1085, 2, '{\"time\":\"2022-05-13T19:55:35.365Z\",\"latitude\":24.640886666666667,\"longitude\":46.719703333333335}', '13-05-2022', '2022-05-13 19:55:37', '2022-05-13 19:55:37'),
(1086, 2, '{\"time\":\"2022-05-13T19:55:45.434Z\",\"latitude\":24.640886666666667,\"longitude\":46.719703333333335}', '13-05-2022', '2022-05-13 19:55:47', '2022-05-13 19:55:47'),
(1087, 2, '{\"time\":\"2022-05-13T19:55:55.403Z\",\"latitude\":24.640886666666667,\"longitude\":46.719703333333335}', '13-05-2022', '2022-05-13 19:55:57', '2022-05-13 19:55:57'),
(1088, 2, '{\"time\":\"2022-05-13T19:56:05.435Z\",\"latitude\":24.640886666666667,\"longitude\":46.719703333333335}', '13-05-2022', '2022-05-13 19:56:07', '2022-05-13 19:56:07'),
(1089, 2, '{\"time\":\"2022-05-13T19:56:15.432Z\",\"latitude\":24.640886666666667,\"longitude\":46.719703333333335}', '13-05-2022', '2022-05-13 19:56:17', '2022-05-13 19:56:17'),
(1090, 2, '{\"time\":\"2022-05-13T19:56:25.457Z\",\"latitude\":24.640886666666667,\"longitude\":46.719703333333335}', '13-05-2022', '2022-05-13 19:56:31', '2022-05-13 19:56:31'),
(1091, 2, '{\"time\":\"2022-05-13T19:56:35.428Z\",\"latitude\":24.640886666666667,\"longitude\":46.719703333333335}', '13-05-2022', '2022-05-13 19:56:36', '2022-05-13 19:56:36'),
(1092, 2, '{\"time\":\"2022-05-13T19:56:45.430Z\",\"latitude\":24.640919999999998,\"longitude\":46.719725000000004}', '13-05-2022', '2022-05-13 19:56:48', '2022-05-13 19:56:48'),
(1093, 2, '{\"time\":\"2022-05-13T19:56:55.419Z\",\"latitude\":24.640931666666667,\"longitude\":46.719701666666666}', '13-05-2022', '2022-05-13 19:56:57', '2022-05-13 19:56:57'),
(1094, 2, '{\"time\":\"2022-05-13T19:57:05.429Z\",\"latitude\":24.640933333333336,\"longitude\":46.71969666666667}', '13-05-2022', '2022-05-13 19:57:07', '2022-05-13 19:57:07'),
(1095, 2, '{\"time\":\"2022-05-13T19:57:15.438Z\",\"latitude\":24.640933333333336,\"longitude\":46.71969666666667}', '13-05-2022', '2022-05-13 19:57:17', '2022-05-13 19:57:17'),
(1096, 2, '{\"time\":\"2022-05-13T19:57:25.430Z\",\"latitude\":24.64090666666667,\"longitude\":46.71978666666667}', '13-05-2022', '2022-05-13 19:57:27', '2022-05-13 19:57:27'),
(1097, 2, '{\"time\":\"2022-05-13T19:57:35.432Z\",\"latitude\":24.64083833333333,\"longitude\":46.71981000000001}', '13-05-2022', '2022-05-13 19:57:37', '2022-05-13 19:57:37'),
(1098, 2, '{\"time\":\"2022-05-13T19:57:45.435Z\",\"latitude\":24.64085,\"longitude\":46.719703333333335}', '13-05-2022', '2022-05-13 19:57:47', '2022-05-13 19:57:47'),
(1099, 2, '{\"time\":\"2022-05-13T19:57:55.429Z\",\"latitude\":24.64081666666667,\"longitude\":46.71968166666667}', '13-05-2022', '2022-05-13 19:57:57', '2022-05-13 19:57:57'),
(1100, 2, '{\"time\":\"2022-05-13T19:58:05.434Z\",\"latitude\":24.640813333333334,\"longitude\":46.71967500000001}', '13-05-2022', '2022-05-13 19:58:07', '2022-05-13 19:58:07'),
(1101, 2, '{\"time\":\"2022-05-13T19:58:15.431Z\",\"latitude\":24.64088,\"longitude\":46.71959166666667}', '13-05-2022', '2022-05-13 19:58:17', '2022-05-13 19:58:17'),
(1102, 2, '{\"time\":\"2022-05-13T19:58:25.415Z\",\"latitude\":24.640876666666667,\"longitude\":46.71962833333334}', '13-05-2022', '2022-05-13 19:58:27', '2022-05-13 19:58:27'),
(1103, 2, '{\"time\":\"2022-05-13T19:58:35.410Z\",\"latitude\":24.640876666666667,\"longitude\":46.71962833333334}', '13-05-2022', '2022-05-13 19:58:39', '2022-05-13 19:58:39'),
(1104, 2, '{\"time\":\"2022-05-13T19:58:45.432Z\",\"latitude\":24.640859999999996,\"longitude\":46.71972833333333}', '13-05-2022', '2022-05-13 19:58:47', '2022-05-13 19:58:47'),
(1105, 2, '{\"time\":\"2022-05-13T19:58:55.432Z\",\"latitude\":24.64084666666667,\"longitude\":46.71971666666666}', '13-05-2022', '2022-05-13 19:58:57', '2022-05-13 19:58:57'),
(1106, 2, '{\"time\":\"2022-05-13T19:59:05.432Z\",\"latitude\":24.64084666666667,\"longitude\":46.71971666666666}', '13-05-2022', '2022-05-13 19:59:08', '2022-05-13 19:59:08'),
(1107, 2, '{\"time\":\"2022-05-13T19:59:15.438Z\",\"latitude\":24.64085,\"longitude\":46.71964500000001}', '13-05-2022', '2022-05-13 19:59:17', '2022-05-13 19:59:17'),
(1108, 2, '{\"time\":\"2022-05-13T19:59:25.436Z\",\"latitude\":24.64084666666667,\"longitude\":46.71964}', '13-05-2022', '2022-05-13 19:59:30', '2022-05-13 19:59:30'),
(1109, 2, '{\"time\":\"2022-05-13T19:59:35.434Z\",\"latitude\":24.64084666666667,\"longitude\":46.71964}', '13-05-2022', '2022-05-13 19:59:38', '2022-05-13 19:59:38'),
(1110, 2, '{\"time\":\"2022-05-13T19:59:45.434Z\",\"latitude\":24.64084666666667,\"longitude\":46.71964}', '13-05-2022', '2022-05-13 19:59:47', '2022-05-13 19:59:47'),
(1111, 2, '{\"time\":\"2022-05-13T19:59:55.432Z\",\"latitude\":24.64077666666667,\"longitude\":46.71972000000001}', '13-05-2022', '2022-05-13 19:59:57', '2022-05-13 19:59:57'),
(1112, 2, '{\"time\":\"2022-05-13T20:00:05.401Z\",\"latitude\":24.64077666666667,\"longitude\":46.71972000000001}', '13-05-2022', '2022-05-13 20:00:07', '2022-05-13 20:00:07'),
(1113, 2, '{\"time\":\"2022-05-13T20:00:15.424Z\",\"latitude\":24.64081666666667,\"longitude\":46.71971666666666}', '13-05-2022', '2022-05-13 20:00:17', '2022-05-13 20:00:17'),
(1114, 2, '{\"time\":\"2022-05-13T20:00:25.430Z\",\"latitude\":24.64082166666667,\"longitude\":46.719695}', '13-05-2022', '2022-05-13 20:00:28', '2022-05-13 20:00:28'),
(1115, 2, '{\"time\":\"2022-05-13T20:00:35.493Z\",\"latitude\":24.64083666666667,\"longitude\":46.71964666666666}', '13-05-2022', '2022-05-13 20:00:37', '2022-05-13 20:00:37'),
(1116, 2, '{\"time\":\"2022-05-13T20:00:45.439Z\",\"latitude\":24.640841666666667,\"longitude\":46.71967333333334}', '13-05-2022', '2022-05-13 20:00:47', '2022-05-13 20:00:47'),
(1117, 2, '{\"time\":\"2022-05-13T20:00:55.390Z\",\"latitude\":24.640874999999998,\"longitude\":46.71967166666666}', '13-05-2022', '2022-05-13 20:00:57', '2022-05-13 20:00:57'),
(1118, 2, '{\"time\":\"2022-05-13T20:01:05.436Z\",\"latitude\":24.64088166666667,\"longitude\":46.719676666666665}', '13-05-2022', '2022-05-13 20:01:09', '2022-05-13 20:01:09'),
(1119, 2, '{\"time\":\"2022-05-13T20:01:15.434Z\",\"latitude\":24.64088166666667,\"longitude\":46.719676666666665}', '13-05-2022', '2022-05-13 20:01:17', '2022-05-13 20:01:17'),
(1120, 2, '{\"time\":\"2022-05-13T20:01:25.418Z\",\"latitude\":24.64086666666667,\"longitude\":46.719665}', '13-05-2022', '2022-05-13 20:01:27', '2022-05-13 20:01:27'),
(1121, 2, '{\"time\":\"2022-05-13T20:01:35.435Z\",\"latitude\":24.64083333333333,\"longitude\":46.71964833333333}', '13-05-2022', '2022-05-13 20:01:37', '2022-05-13 20:01:37'),
(1122, 2, '{\"time\":\"2022-05-13T20:01:45.434Z\",\"latitude\":24.640828333333335,\"longitude\":46.719653333333326}', '13-05-2022', '2022-05-13 20:01:47', '2022-05-13 20:01:47'),
(1123, 2, '{\"time\":\"2022-05-13T20:01:55.434Z\",\"latitude\":24.640828333333335,\"longitude\":46.719653333333326}', '13-05-2022', '2022-05-13 20:01:57', '2022-05-13 20:01:57'),
(1124, 2, '{\"time\":\"2022-05-13T20:02:05.431Z\",\"latitude\":24.640828333333335,\"longitude\":46.719653333333326}', '13-05-2022', '2022-05-13 20:02:07', '2022-05-13 20:02:07'),
(1125, 2, '{\"time\":\"2022-05-13T20:02:15.430Z\",\"latitude\":24.640828333333335,\"longitude\":46.719653333333326}', '13-05-2022', '2022-05-13 20:02:17', '2022-05-13 20:02:17'),
(1126, 2, '{\"time\":\"2022-05-13T20:02:25.431Z\",\"latitude\":24.640828333333335,\"longitude\":46.719653333333326}', '13-05-2022', '2022-05-13 20:02:27', '2022-05-13 20:02:27'),
(1127, 2, '{\"time\":\"2022-05-13T20:02:35.432Z\",\"latitude\":24.640828333333335,\"longitude\":46.719653333333326}', '13-05-2022', '2022-05-13 20:03:28', '2022-05-13 20:03:28'),
(1128, 2, '{\"time\":\"2022-05-13T20:02:45.431Z\",\"latitude\":24.64090666666667,\"longitude\":46.71965166666667}', '13-05-2022', '2022-05-13 20:03:28', '2022-05-13 20:03:28'),
(1129, 2, '{\"time\":\"2022-05-13T20:03:15.427Z\",\"latitude\":24.64083833333333,\"longitude\":46.71969333333333}', '13-05-2022', '2022-05-13 20:03:28', '2022-05-13 20:03:28'),
(1130, 2, '{\"time\":\"2022-05-13T20:02:55.433Z\",\"latitude\":24.640885000000004,\"longitude\":46.71964666666666}', '13-05-2022', '2022-05-13 20:03:28', '2022-05-13 20:03:28'),
(1131, 2, '{\"time\":\"2022-05-13T20:03:05.395Z\",\"latitude\":24.640885000000004,\"longitude\":46.71967333333334}', '13-05-2022', '2022-05-13 20:03:28', '2022-05-13 20:03:28'),
(1132, 2, '{\"time\":\"2022-05-13T20:03:25.433Z\",\"latitude\":24.640751666666667,\"longitude\":46.719755}', '13-05-2022', '2022-05-13 20:03:29', '2022-05-13 20:03:29'),
(1133, 2, '{\"time\":\"2022-05-13T20:03:35.436Z\",\"latitude\":24.64061166666667,\"longitude\":46.71982333333334}', '13-05-2022', '2022-05-13 20:03:37', '2022-05-13 20:03:37'),
(1134, 2, '{\"time\":\"2022-05-13T20:04:48.390Z\",\"latitude\":24.640870000000003,\"longitude\":46.71930999999999}', '13-05-2022', '2022-05-13 20:04:50', '2022-05-13 20:04:50'),
(1135, 2, '{\"time\":\"2022-05-13T20:04:58.425Z\",\"latitude\":24.64101333333333,\"longitude\":46.71938166666667}', '13-05-2022', '2022-05-13 20:05:00', '2022-05-13 20:05:00'),
(1136, 2, '{\"time\":\"2022-05-13T20:05:08.366Z\",\"latitude\":24.641008333333335,\"longitude\":46.719428333333326}', '13-05-2022', '2022-05-13 20:05:10', '2022-05-13 20:05:10'),
(1137, 2, '{\"time\":\"2022-05-13T21:22:22.434Z\",\"latitude\":24.6990726,\"longitude\":46.7077961}', '14-05-2022', '2022-05-13 21:22:23', '2022-05-13 21:22:23'),
(1138, 2, '{\"time\":\"2022-05-13T21:22:29.073Z\",\"latitude\":24.69962333333334,\"longitude\":46.707863333333336}', '14-05-2022', '2022-05-13 21:22:30', '2022-05-13 21:22:30'),
(1139, 2, '{\"time\":\"2022-05-13T21:22:39.409Z\",\"latitude\":24.699486666666665,\"longitude\":46.707963333333325}', '14-05-2022', '2022-05-13 21:22:41', '2022-05-13 21:22:41'),
(1140, 2, '{\"time\":\"2022-05-13T21:22:49.430Z\",\"latitude\":24.69955333333333,\"longitude\":46.708085}', '14-05-2022', '2022-05-13 21:22:51', '2022-05-13 21:22:51'),
(1141, 2, '{\"time\":\"2022-05-13T21:22:59.382Z\",\"latitude\":24.699511666666663,\"longitude\":46.708125}', '14-05-2022', '2022-05-13 21:23:01', '2022-05-13 21:23:01'),
(1142, 2, '{\"time\":\"2022-05-14T12:11:45.246Z\",\"latitude\":24.6996122,\"longitude\":46.7083722}', '14-05-2022', '2022-05-14 12:11:46', '2022-05-14 12:11:46'),
(1143, 2, '{\"time\":\"2022-05-14T12:11:46.899Z\",\"latitude\":24.699679999999997,\"longitude\":46.70849499999999}', '14-05-2022', '2022-05-14 12:11:47', '2022-05-14 12:11:47'),
(1144, 2, '{\"time\":\"2022-05-14T12:11:57.398Z\",\"latitude\":24.69966833333334,\"longitude\":46.70844333333333}', '14-05-2022', '2022-05-14 12:11:58', '2022-05-14 12:11:58'),
(1145, 2, '{\"time\":\"2022-05-14T12:12:07.399Z\",\"latitude\":24.69961,\"longitude\":46.708479999999994}', '14-05-2022', '2022-05-14 12:12:09', '2022-05-14 12:12:09'),
(1146, 2, '{\"time\":\"2022-05-14T12:12:17.394Z\",\"latitude\":24.699596666666668,\"longitude\":46.708504999999995}', '14-05-2022', '2022-05-14 12:12:18', '2022-05-14 12:12:18'),
(1147, 2, '{\"time\":\"2022-05-14T12:12:27.429Z\",\"latitude\":24.699583333333333,\"longitude\":46.708524999999995}', '14-05-2022', '2022-05-14 12:12:29', '2022-05-14 12:12:29'),
(1148, 2, '{\"time\":\"2022-05-14T12:12:37.415Z\",\"latitude\":24.699608333333337,\"longitude\":46.70852166666667}', '14-05-2022', '2022-05-14 12:12:38', '2022-05-14 12:12:38');
INSERT INTO `track_employees` (`id`, `user_id`, `location`, `date`, `created_at`, `updated_at`) VALUES
(1149, 2, '{\"time\":\"2022-05-14T12:12:47.396Z\",\"latitude\":24.699603333333336,\"longitude\":46.708526666666664}', '14-05-2022', '2022-05-14 12:12:48', '2022-05-14 12:12:48'),
(1150, 2, '{\"time\":\"2022-05-15T17:53:29.813Z\",\"latitude\":24.6418941,\"longitude\":46.7262433}', '15-05-2022', '2022-05-15 17:53:31', '2022-05-15 17:53:31'),
(1151, 2, '{\"time\":\"2022-05-15T17:54:35.437Z\",\"latitude\":24.642895,\"longitude\":46.72628833333333}', '15-05-2022', '2022-05-15 17:54:36', '2022-05-15 17:54:36'),
(1152, 2, '{\"time\":\"2022-05-15T17:54:45.429Z\",\"latitude\":24.642801666666667,\"longitude\":46.726391666666665}', '15-05-2022', '2022-05-15 17:54:46', '2022-05-15 17:54:46'),
(1153, 2, '{\"time\":\"2022-05-15T17:54:55.683Z\",\"latitude\":24.643086666666665,\"longitude\":46.72632166666667}', '15-05-2022', '2022-05-15 17:54:58', '2022-05-15 17:54:58'),
(1154, 2, '{\"time\":\"2022-05-15T17:55:05.428Z\",\"latitude\":24.642998333333335,\"longitude\":46.726330000000004}', '15-05-2022', '2022-05-15 17:55:07', '2022-05-15 17:55:07'),
(1155, 2, '{\"time\":\"2022-05-15T20:42:16.550Z\",\"latitude\":24.69957833333334,\"longitude\":46.70823166666667}', '15-05-2022', '2022-05-15 20:42:17', '2022-05-15 20:42:17'),
(1156, 2, '{\"time\":\"2022-05-15T20:42:17.201Z\",\"latitude\":24.699568333333332,\"longitude\":46.708246666666675}', '15-05-2022', '2022-05-15 20:42:18', '2022-05-15 20:42:18'),
(1157, 2, '{\"time\":\"2022-05-15T20:42:54.101Z\",\"latitude\":24.699596666666668,\"longitude\":46.70828333333334}', '15-05-2022', '2022-05-15 20:42:55', '2022-05-15 20:42:55'),
(1158, 2, '{\"time\":\"2022-05-15T20:42:54.735Z\",\"latitude\":24.699596666666668,\"longitude\":46.70828333333334}', '15-05-2022', '2022-05-15 20:42:55', '2022-05-15 20:42:55'),
(1159, 2, '{\"time\":\"2022-05-15T20:43:05.425Z\",\"latitude\":24.699558333333336,\"longitude\":46.70827666666667}', '15-05-2022', '2022-05-15 20:43:07', '2022-05-15 20:43:07'),
(1160, 2, '{\"time\":\"2022-05-15T20:44:46.180Z\",\"latitude\":24.699605,\"longitude\":46.70829833333334}', '15-05-2022', '2022-05-15 20:44:47', '2022-05-15 20:44:47'),
(1161, 2, '{\"time\":\"2022-05-15T20:44:46.839Z\",\"latitude\":24.699540000000002,\"longitude\":46.708291666666675}', '15-05-2022', '2022-05-15 20:44:47', '2022-05-15 20:44:47'),
(1162, 2, '{\"time\":\"2022-05-15T20:44:57.395Z\",\"latitude\":24.699541666666665,\"longitude\":46.708279999999995}', '15-05-2022', '2022-05-15 20:44:58', '2022-05-15 20:44:58'),
(1163, 9, '{\"time\":\"2022-05-16T11:06:35.218Z\",\"latitude\":11.2952964,\"longitude\":75.9751701}', '16-05-2022', '2022-05-16 11:06:36', '2022-05-16 11:06:36'),
(1164, 2, '{\"time\":\"2022-05-16T11:09:28.150Z\",\"latitude\":11.31591353,\"longitude\":75.99805267}', '16-05-2022', '2022-05-16 11:09:30', '2022-05-16 11:09:30'),
(1165, 2, '{\"time\":\"2022-05-16T11:09:28.147Z\",\"latitude\":11.31591353,\"longitude\":75.99805267}', '16-05-2022', '2022-05-16 11:09:30', '2022-05-16 11:09:30'),
(1166, 5, '{\"time\":\"2022-05-16T15:24:25.075Z\",\"latitude\":24.6655816,\"longitude\":46.7045784}', '16-05-2022', '2022-05-16 15:24:26', '2022-05-16 15:24:26'),
(1167, 5, '{\"time\":\"2022-05-16T15:24:25.093Z\",\"latitude\":24.6655816,\"longitude\":46.7045784}', '16-05-2022', '2022-05-16 15:24:26', '2022-05-16 15:24:26'),
(1168, 5, '{\"time\":\"2022-05-16T15:24:39.915Z\",\"latitude\":24.66569551486261,\"longitude\":46.70437809404891}', '16-05-2022', '2022-05-16 15:24:41', '2022-05-16 15:24:41'),
(1169, 5, '{\"time\":\"2022-05-16T15:24:40.729Z\",\"latitude\":24.665680350114307,\"longitude\":46.70440561286656}', '16-05-2022', '2022-05-16 15:24:41', '2022-05-16 15:24:41'),
(1170, 5, '{\"time\":\"2022-05-16T15:24:39.910Z\",\"latitude\":24.66569551486261,\"longitude\":46.70437809404891}', '16-05-2022', '2022-05-16 15:24:41', '2022-05-16 15:24:41'),
(1171, 5, '{\"time\":\"2022-05-16T15:24:53.398Z\",\"latitude\":24.6655744,\"longitude\":46.7045466}', '16-05-2022', '2022-05-16 15:24:54', '2022-05-16 15:24:54'),
(1172, 5, '{\"time\":\"2022-05-16T15:24:53.407Z\",\"latitude\":24.6655744,\"longitude\":46.7045466}', '16-05-2022', '2022-05-16 15:24:54', '2022-05-16 15:24:54'),
(1173, 5, '{\"time\":\"2022-05-16T15:25:04.393Z\",\"latitude\":24.665584745224972,\"longitude\":46.70441594992214}', '16-05-2022', '2022-05-16 15:25:05', '2022-05-16 15:25:05'),
(1174, 5, '{\"time\":\"2022-05-16T15:25:04.401Z\",\"latitude\":24.665584745224972,\"longitude\":46.70441594992214}', '16-05-2022', '2022-05-16 15:25:05', '2022-05-16 15:25:05'),
(1175, 5, '{\"time\":\"2022-05-16T15:25:05.400Z\",\"latitude\":24.665584745224972,\"longitude\":46.70441594992214}', '16-05-2022', '2022-05-16 15:25:06', '2022-05-16 15:25:06'),
(1176, 5, '{\"time\":\"2022-05-16T15:25:08.476Z\",\"latitude\":24.665584745224972,\"longitude\":46.70441594992214}', '16-05-2022', '2022-05-16 15:25:09', '2022-05-16 15:25:09'),
(1177, 5, '{\"time\":\"2022-05-16T15:25:08.481Z\",\"latitude\":24.665584745224972,\"longitude\":46.70441594992214}', '16-05-2022', '2022-05-16 15:25:09', '2022-05-16 15:25:09'),
(1178, 5, '{\"time\":\"2022-05-16T15:25:09.451Z\",\"latitude\":24.665584745224972,\"longitude\":46.70441594992214}', '16-05-2022', '2022-05-16 15:25:10', '2022-05-16 15:25:10'),
(1179, 5, '{\"time\":\"2022-05-16T15:25:26.418Z\",\"latitude\":24.665578135736418,\"longitude\":46.70444018194779}', '16-05-2022', '2022-05-16 15:25:27', '2022-05-16 15:25:27'),
(1180, 5, '{\"time\":\"2022-05-16T15:25:26.423Z\",\"latitude\":24.665578135736418,\"longitude\":46.70444018194779}', '16-05-2022', '2022-05-16 15:25:27', '2022-05-16 15:25:27'),
(1181, 5, '{\"time\":\"2022-05-16T15:25:55.809Z\",\"latitude\":24.665643512340377,\"longitude\":46.70447143033931}', '16-05-2022', '2022-05-16 15:25:56', '2022-05-16 15:25:56'),
(1182, 5, '{\"time\":\"2022-05-16T15:25:54.907Z\",\"latitude\":24.66564281732445,\"longitude\":46.704471843661366}', '16-05-2022', '2022-05-16 15:25:56', '2022-05-16 15:25:56'),
(1183, 5, '{\"time\":\"2022-05-16T15:25:54.916Z\",\"latitude\":24.66564281732445,\"longitude\":46.704471843661366}', '16-05-2022', '2022-05-16 15:25:56', '2022-05-16 15:25:56'),
(1184, 5, '{\"time\":\"2022-05-16T15:26:17.062Z\",\"latitude\":24.665599753608777,\"longitude\":46.704503353604395}', '16-05-2022', '2022-05-16 15:26:18', '2022-05-16 15:26:18'),
(1185, 5, '{\"time\":\"2022-05-16T15:26:17.068Z\",\"latitude\":24.665599753608777,\"longitude\":46.704503353604395}', '16-05-2022', '2022-05-16 15:26:18', '2022-05-16 15:26:18'),
(1186, 5, '{\"time\":\"2022-05-16T15:26:18.069Z\",\"latitude\":24.66557312265734,\"longitude\":46.704446922373464}', '16-05-2022', '2022-05-16 15:26:19', '2022-05-16 15:26:19'),
(1187, 2, '{\"time\":\"2022-05-20T15:07:23.687Z\",\"latitude\":24.67888687,\"longitude\":46.72990152}', '20-05-2022', '2022-05-20 15:07:25', '2022-05-20 15:07:25'),
(1188, 2, '{\"time\":\"2022-05-20T15:11:52.685Z\",\"latitude\":24.67910816,\"longitude\":46.72987389}', '20-05-2022', '2022-05-20 15:11:54', '2022-05-20 15:11:54'),
(1189, 2, '{\"time\":\"2022-05-20T15:12:27.700Z\",\"latitude\":24.67896491,\"longitude\":46.72986076}', '20-05-2022', '2022-05-20 15:12:29', '2022-05-20 15:12:29'),
(1190, 2, '{\"time\":\"2022-05-22T09:26:18.311Z\",\"latitude\":24.6995909,\"longitude\":46.7084216}', '22-05-2022', '2022-05-23 09:26:19', '2022-05-23 09:26:19'),
(1191, 2, '{\"time\":\"2022-05-22T09:28:25.556Z\",\"latitude\":24.7014865,\"longitude\":46.7087237}', '22-05-2022', '2022-05-23 09:28:27', '2022-05-23 09:28:27'),
(1192, 2, '{\"time\":\"2022-05-22T09:52:57.914Z\",\"latitude\":24.699603333333336,\"longitude\":46.70858166666667}', '22-05-2022', '2022-05-23 09:52:58', '2022-05-23 09:52:58'),
(1195, 2, '{\"time\":\"2022-05-23T06:06:54.741Z\",\"latitude\":11.3160078,\"longitude\":75.9979931}', '23-05-2022', '2022-05-23 06:06:56', '2022-05-23 06:06:56'),
(1196, 2, '{\"time\":\"2022-05-23T06:06:54.707Z\",\"latitude\":11.3160078,\"longitude\":75.9979931}', '23-05-2022', '2022-05-23 06:06:56', '2022-05-23 06:06:56'),
(1197, 2, '{\"time\":\"2022-05-23T08:40:40.897Z\",\"latitude\":11.31585549,\"longitude\":75.99795143}', '23-05-2022', '2022-05-23 08:40:42', '2022-05-23 08:40:42'),
(1198, 2, '{\"time\":\"2022-05-23T08:40:40.900Z\",\"latitude\":11.31585549,\"longitude\":75.99795143}', '23-05-2022', '2022-05-23 08:40:42', '2022-05-23 08:40:42'),
(1199, 2, '{\"time\":\"2022-05-23T08:49:25.986Z\",\"latitude\":11.3160891,\"longitude\":75.9976623}', '23-05-2022', '2022-05-23 08:49:27', '2022-05-23 08:49:27'),
(1200, 2, '{\"time\":\"2022-05-23T08:49:25.984Z\",\"latitude\":11.3160891,\"longitude\":75.9976623}', '23-05-2022', '2022-05-23 08:49:28', '2022-05-23 08:49:28'),
(1201, 2, '{\"time\":\"2022-05-23T08:50:46.667Z\",\"latitude\":11.3160003,\"longitude\":75.9979888}', '23-05-2022', '2022-05-23 08:50:48', '2022-05-23 08:50:48'),
(1202, 2, '{\"time\":\"2022-05-23T08:50:46.670Z\",\"latitude\":11.3160003,\"longitude\":75.9979888}', '23-05-2022', '2022-05-23 08:50:48', '2022-05-23 08:50:48'),
(1203, 2, '{\"time\":\"2022-05-23T08:51:55.786Z\",\"latitude\":11.31598014,\"longitude\":75.99785869}', '23-05-2022', '2022-05-23 08:51:57', '2022-05-23 08:51:57'),
(1204, 22, '{\"time\":\"2022-05-23T09:00:40.061Z\",\"latitude\":24.665621,\"longitude\":46.7045521}', '23-05-2022', '2022-05-23 09:00:40', '2022-05-23 09:00:40'),
(1205, 22, '{\"time\":\"2022-05-23T09:00:40.056Z\",\"latitude\":24.665621,\"longitude\":46.7045521}', '23-05-2022', '2022-05-23 09:00:40', '2022-05-23 09:00:40'),
(1206, 22, '{\"time\":\"2022-05-23T09:02:52.811Z\",\"latitude\":24.66544325064104,\"longitude\":46.704414728928384}', '23-05-2022', '2022-05-23 09:02:53', '2022-05-23 09:02:53'),
(1207, 22, '{\"time\":\"2022-05-23T09:02:52.803Z\",\"latitude\":24.66544325064104,\"longitude\":46.704414728928384}', '23-05-2022', '2022-05-23 09:02:53', '2022-05-23 09:02:53'),
(1208, 22, '{\"time\":\"2022-05-23T09:02:54.787Z\",\"latitude\":24.66540795435271,\"longitude\":46.704381242601926}', '23-05-2022', '2022-05-23 09:02:54', '2022-05-23 09:02:54'),
(1209, 22, '{\"time\":\"2022-05-23T09:04:26.636Z\",\"latitude\":24.66576088180042,\"longitude\":46.70446885880071}', '23-05-2022', '2022-05-23 09:04:27', '2022-05-23 09:04:27'),
(1210, 22, '{\"time\":\"2022-05-23T09:04:26.630Z\",\"latitude\":24.66576088180042,\"longitude\":46.70446885880071}', '23-05-2022', '2022-05-23 09:04:27', '2022-05-23 09:04:27'),
(1211, 22, '{\"time\":\"2022-05-23T09:04:27.605Z\",\"latitude\":24.665751444265606,\"longitude\":46.70447339661812}', '23-05-2022', '2022-05-23 09:04:28', '2022-05-23 09:04:28'),
(1212, 2, '{\"time\":\"2022-05-23T09:04:47.812Z\",\"latitude\":11.3160071,\"longitude\":75.9979941}', '23-05-2022', '2022-05-23 09:04:49', '2022-05-23 09:04:49'),
(1213, 2, '{\"time\":\"2022-05-23T09:04:47.807Z\",\"latitude\":11.3160071,\"longitude\":75.9979941}', '23-05-2022', '2022-05-23 09:04:50', '2022-05-23 09:04:50'),
(1214, 2, '{\"time\":\"2022-05-23T09:06:22.793Z\",\"latitude\":11.31595444,\"longitude\":75.9977359}', '23-05-2022', '2022-05-23 09:06:24', '2022-05-23 09:06:24'),
(1215, 17, '{\"time\":\"2022-05-23T09:06:57.046Z\",\"latitude\":24.665728573862378,\"longitude\":46.704522804879375}', '23-05-2022', '2022-05-23 09:06:57', '2022-05-23 09:06:57'),
(1216, 17, '{\"time\":\"2022-05-23T09:06:57.038Z\",\"latitude\":24.665728573862378,\"longitude\":46.704522804879375}', '23-05-2022', '2022-05-23 09:06:57', '2022-05-23 09:06:57'),
(1217, 22, '{\"time\":\"2022-05-23T09:09:15.168Z\",\"latitude\":11.3160055,\"longitude\":75.997994}', '23-05-2022', '2022-05-23 09:09:16', '2022-05-23 09:09:16'),
(1218, 22, '{\"time\":\"2022-05-23T09:09:15.164Z\",\"latitude\":11.3160055,\"longitude\":75.997994}', '23-05-2022', '2022-05-23 09:09:16', '2022-05-23 09:09:16'),
(1219, 2, '{\"time\":\"2022-05-23T09:10:32.297Z\",\"latitude\":24.66556489877773,\"longitude\":46.70426334059026}', '23-05-2022', '2022-05-23 09:10:33', '2022-05-23 09:10:33'),
(1220, 2, '{\"time\":\"2022-05-23T09:10:32.301Z\",\"latitude\":24.66556489877773,\"longitude\":46.70426334059026}', '23-05-2022', '2022-05-23 09:10:33', '2022-05-23 09:10:33'),
(1221, 2, '{\"time\":\"2022-05-23T09:10:33.210Z\",\"latitude\":24.6655585837372,\"longitude\":46.70425724513918}', '23-05-2022', '2022-05-23 09:10:33', '2022-05-23 09:10:33'),
(1222, 2, '{\"time\":\"2022-05-23T09:11:38.489Z\",\"latitude\":24.665591797908274,\"longitude\":46.70437470766221}', '23-05-2022', '2022-05-23 09:11:39', '2022-05-23 09:11:39'),
(1223, 2, '{\"time\":\"2022-05-23T09:11:38.480Z\",\"latitude\":24.665591797908274,\"longitude\":46.70437470766221}', '23-05-2022', '2022-05-23 09:11:39', '2022-05-23 09:11:39'),
(1224, 2, '{\"time\":\"2022-05-23T09:11:40.249Z\",\"latitude\":24.66562615030858,\"longitude\":46.70435093635067}', '23-05-2022', '2022-05-23 09:11:40', '2022-05-23 09:11:40'),
(1227, 2, '{\"time\":\"2022-05-23T09:21:52.810Z\",\"latitude\":24.66575137877559,\"longitude\":46.70434826262918}', '23-05-2022', '2022-05-23 09:21:53', '2022-05-23 09:21:53'),
(1228, 2, '{\"time\":\"2022-05-23T09:21:52.815Z\",\"latitude\":24.66575137877559,\"longitude\":46.70434826262918}', '23-05-2022', '2022-05-23 09:21:53', '2022-05-23 09:21:53'),
(1229, 2, '{\"time\":\"2022-05-23T09:21:53.814Z\",\"latitude\":24.66575771276099,\"longitude\":46.704357082140774}', '23-05-2022', '2022-05-23 09:21:53', '2022-05-23 09:21:53'),
(1230, 2, '{\"time\":\"2022-05-23T09:21:54.785Z\",\"latitude\":24.665764769793782,\"longitude\":46.70436303160793}', '23-05-2022', '2022-05-23 09:21:54', '2022-05-23 09:21:54'),
(1231, 17, '{\"time\":\"2022-05-23T09:24:19.166Z\",\"latitude\":24.665768351044164,\"longitude\":46.70441380139994}', '23-05-2022', '2022-05-23 09:24:25', '2022-05-23 09:24:25'),
(1232, 17, '{\"time\":\"2022-05-23T09:24:23.088Z\",\"latitude\":24.665760850032648,\"longitude\":46.70435576399699}', '23-05-2022', '2022-05-23 09:24:25', '2022-05-23 09:24:25'),
(1233, 17, '{\"time\":\"2022-05-23T09:24:59.853Z\",\"latitude\":24.665729770139478,\"longitude\":46.704400589618224}', '23-05-2022', '2022-05-23 09:25:01', '2022-05-23 09:25:01'),
(1234, 17, '{\"time\":\"2022-05-23T09:24:59.847Z\",\"latitude\":24.665729770139478,\"longitude\":46.704400589618224}', '23-05-2022', '2022-05-23 09:25:01', '2022-05-23 09:25:01'),
(1235, 17, '{\"time\":\"2022-05-23T09:25:01.882Z\",\"latitude\":24.665712608894673,\"longitude\":46.70441586513231}', '23-05-2022', '2022-05-23 09:25:02', '2022-05-23 09:25:02'),
(1236, 17, '{\"time\":\"2022-05-23T09:26:34.167Z\",\"latitude\":24.66570025268064,\"longitude\":46.704413030651935}', '23-05-2022', '2022-05-23 09:26:35', '2022-05-23 09:26:35'),
(1237, 17, '{\"time\":\"2022-05-23T09:28:09.300Z\",\"latitude\":24.66567643410914,\"longitude\":46.70435203173089}', '23-05-2022', '2022-05-23 09:28:11', '2022-05-23 09:28:11'),
(1238, 17, '{\"time\":\"2022-05-23T09:29:15.571Z\",\"latitude\":24.665708248227517,\"longitude\":46.70433760923036}', '23-05-2022', '2022-05-23 09:29:17', '2022-05-23 09:29:17'),
(1239, 17, '{\"time\":\"2022-05-23T09:30:21.954Z\",\"latitude\":24.665692582251165,\"longitude\":46.704363265259445}', '23-05-2022', '2022-05-23 09:30:23', '2022-05-23 09:30:23'),
(1240, 17, '{\"time\":\"2022-05-23T09:31:42.351Z\",\"latitude\":24.665764304049194,\"longitude\":46.70437693940323}', '23-05-2022', '2022-05-23 09:31:43', '2022-05-23 09:31:43'),
(1241, 17, '{\"time\":\"2022-05-23T09:33:12.371Z\",\"latitude\":24.66552898994575,\"longitude\":46.70439293443713}', '23-05-2022', '2022-05-23 09:34:17', '2022-05-23 09:34:17'),
(1242, 17, '{\"time\":\"2022-05-23T09:34:35.693Z\",\"latitude\":24.665701829481126,\"longitude\":46.7041837155661}', '23-05-2022', '2022-05-23 09:34:36', '2022-05-23 09:34:36'),
(1243, 17, '{\"time\":\"2022-05-23T09:35:48.736Z\",\"latitude\":24.665427696618508,\"longitude\":46.704457792880476}', '23-05-2022', '2022-05-23 09:35:49', '2022-05-23 09:35:49'),
(1244, 17, '{\"time\":\"2022-05-23T09:37:21.461Z\",\"latitude\":24.66543307282627,\"longitude\":46.70444042159672}', '23-05-2022', '2022-05-23 09:37:22', '2022-05-23 09:37:22'),
(1245, 17, '{\"time\":\"2022-05-23T09:38:33.024Z\",\"latitude\":24.66549788905838,\"longitude\":46.70437403499843}', '23-05-2022', '2022-05-23 09:38:34', '2022-05-23 09:38:34'),
(1246, 17, '{\"time\":\"2022-05-23T09:39:39.928Z\",\"latitude\":24.665520564064384,\"longitude\":46.70433893135252}', '23-05-2022', '2022-05-23 09:39:40', '2022-05-23 09:39:40'),
(1247, 17, '{\"time\":\"2022-05-23T09:40:51.651Z\",\"latitude\":24.66552713339641,\"longitude\":46.70433670347307}', '23-05-2022', '2022-05-23 09:40:52', '2022-05-23 09:40:52'),
(1248, 17, '{\"time\":\"2022-05-23T09:42:06.395Z\",\"latitude\":24.665582000879745,\"longitude\":46.70436272145961}', '23-05-2022', '2022-05-23 09:42:07', '2022-05-23 09:42:07'),
(1249, 17, '{\"time\":\"2022-05-23T09:43:20.047Z\",\"latitude\":24.665610219692304,\"longitude\":46.70437420143457}', '23-05-2022', '2022-05-23 09:43:20', '2022-05-23 09:43:20'),
(1250, 17, '{\"time\":\"2022-05-23T09:44:53.715Z\",\"latitude\":24.665628837123098,\"longitude\":46.7043821057488}', '23-05-2022', '2022-05-23 09:44:54', '2022-05-23 09:44:54'),
(1251, 17, '{\"time\":\"2022-05-23T09:46:19.991Z\",\"latitude\":24.66555550879141,\"longitude\":46.70438483846925}', '23-05-2022', '2022-05-23 09:46:20', '2022-05-23 09:46:20'),
(1252, 17, '{\"time\":\"2022-05-23T09:47:26.383Z\",\"latitude\":24.66554812214135,\"longitude\":46.704369671152755}', '23-05-2022', '2022-05-23 09:47:27', '2022-05-23 09:47:27'),
(1253, 17, '{\"time\":\"2022-05-23T09:48:34.700Z\",\"latitude\":24.665564385331933,\"longitude\":46.70435824415674}', '23-05-2022', '2022-05-23 09:48:35', '2022-05-23 09:48:35'),
(1254, 17, '{\"time\":\"2022-05-23T09:50:06.446Z\",\"latitude\":24.66556308935293,\"longitude\":46.70438049313583}', '23-05-2022', '2022-05-23 09:50:07', '2022-05-23 09:50:07'),
(1255, 17, '{\"time\":\"2022-05-23T09:51:21.002Z\",\"latitude\":24.665597546006513,\"longitude\":46.704381487092334}', '23-05-2022', '2022-05-23 09:51:22', '2022-05-23 09:51:22'),
(1256, 17, '{\"time\":\"2022-05-23T09:52:29.120Z\",\"latitude\":24.665577180673413,\"longitude\":46.70441417453946}', '23-05-2022', '2022-05-23 09:52:30', '2022-05-23 09:52:30'),
(1257, 17, '{\"time\":\"2022-05-23T09:54:07.395Z\",\"latitude\":24.66564092269307,\"longitude\":46.70443116893232}', '23-05-2022', '2022-05-23 09:54:08', '2022-05-23 09:54:08'),
(1258, 17, '{\"time\":\"2022-05-23T09:55:16.663Z\",\"latitude\":24.665655077938176,\"longitude\":46.7044022884399}', '23-05-2022', '2022-05-23 09:55:17', '2022-05-23 09:55:17'),
(1259, 17, '{\"time\":\"2022-05-23T09:56:45.913Z\",\"latitude\":24.665677726082347,\"longitude\":46.70436482655132}', '23-05-2022', '2022-05-23 09:56:46', '2022-05-23 09:56:46'),
(1260, 17, '{\"time\":\"2022-05-23T09:58:16.881Z\",\"latitude\":24.665620350243497,\"longitude\":46.70436359729201}', '23-05-2022', '2022-05-23 09:58:17', '2022-05-23 09:58:17'),
(1261, 17, '{\"time\":\"2022-05-23T10:00:20.447Z\",\"latitude\":24.66558468608108,\"longitude\":46.704381597561024}', '23-05-2022', '2022-05-23 10:00:22', '2022-05-23 10:00:22'),
(1262, 17, '{\"time\":\"2022-05-23T10:02:10.283Z\",\"latitude\":24.665578609374375,\"longitude\":46.70440415515902}', '23-05-2022', '2022-05-23 10:02:11', '2022-05-23 10:02:11'),
(1263, 17, '{\"time\":\"2022-05-23T10:03:17.649Z\",\"latitude\":24.665632247283,\"longitude\":46.70439930581737}', '23-05-2022', '2022-05-23 10:03:18', '2022-05-23 10:03:18'),
(1264, 17, '{\"time\":\"2022-05-23T10:05:07.701Z\",\"latitude\":24.66553159234375,\"longitude\":46.704445347633246}', '23-05-2022', '2022-05-23 10:05:08', '2022-05-23 10:05:08'),
(1265, 17, '{\"time\":\"2022-05-23T10:06:43.701Z\",\"latitude\":24.665547737164896,\"longitude\":46.70445222620703}', '23-05-2022', '2022-05-23 10:06:44', '2022-05-23 10:06:44'),
(1266, 17, '{\"time\":\"2022-05-23T10:08:06.449Z\",\"latitude\":24.665656497786156,\"longitude\":46.70438352538613}', '23-05-2022', '2022-05-23 10:08:07', '2022-05-23 10:08:07'),
(1267, 17, '{\"time\":\"2022-05-23T10:09:50.441Z\",\"latitude\":24.666496182636006,\"longitude\":46.704101954227106}', '23-05-2022', '2022-05-23 10:09:51', '2022-05-23 10:09:51'),
(1268, 17, '{\"time\":\"2022-05-23T10:10:56.717Z\",\"latitude\":24.66567987932883,\"longitude\":46.70438737175489}', '23-05-2022', '2022-05-23 10:10:57', '2022-05-23 10:10:57'),
(1269, 17, '{\"time\":\"2022-05-23T10:12:06.441Z\",\"latitude\":24.665702123186197,\"longitude\":46.70439274913271}', '23-05-2022', '2022-05-23 10:12:07', '2022-05-23 10:12:07'),
(1270, 17, '{\"time\":\"2022-05-23T10:14:00.437Z\",\"latitude\":24.665503130171093,\"longitude\":46.704405453856474}', '23-05-2022', '2022-05-23 10:14:01', '2022-05-23 10:14:01'),
(1271, 17, '{\"time\":\"2022-05-23T10:15:36.430Z\",\"latitude\":24.665620548244686,\"longitude\":46.704401977262506}', '23-05-2022', '2022-05-23 10:15:37', '2022-05-23 10:15:37'),
(1272, 17, '{\"time\":\"2022-05-23T10:16:47.752Z\",\"latitude\":24.66561293502566,\"longitude\":46.70440784448362}', '23-05-2022', '2022-05-23 10:16:48', '2022-05-23 10:16:48'),
(1273, 17, '{\"time\":\"2022-05-23T10:18:08.302Z\",\"latitude\":24.665613021738164,\"longitude\":46.70441066501178}', '23-05-2022', '2022-05-23 10:18:09', '2022-05-23 10:18:09'),
(1274, 17, '{\"time\":\"2022-05-23T10:19:47.432Z\",\"latitude\":24.665609172845198,\"longitude\":46.704402676662}', '23-05-2022', '2022-05-23 10:19:48', '2022-05-23 10:19:48'),
(1275, 17, '{\"time\":\"2022-05-23T10:21:04.409Z\",\"latitude\":24.665507846830714,\"longitude\":46.70445891415923}', '23-05-2022', '2022-05-23 10:21:05', '2022-05-23 10:21:05'),
(1276, 17, '{\"time\":\"2022-05-23T10:22:08.784Z\",\"latitude\":24.66558736552691,\"longitude\":46.70436928298803}', '23-05-2022', '2022-05-23 10:22:09', '2022-05-23 10:22:09'),
(1277, 17, '{\"time\":\"2022-05-23T10:23:15.104Z\",\"latitude\":24.665558007129885,\"longitude\":46.70438689913178}', '23-05-2022', '2022-05-23 10:23:16', '2022-05-23 10:23:16'),
(1278, 17, '{\"time\":\"2022-05-23T10:24:21.262Z\",\"latitude\":24.66554973028767,\"longitude\":46.70438645081099}', '23-05-2022', '2022-05-23 10:24:23', '2022-05-23 10:24:23'),
(1279, 17, '{\"time\":\"2022-05-23T10:25:27.649Z\",\"latitude\":24.665544846012946,\"longitude\":46.70438140493779}', '23-05-2022', '2022-05-23 10:25:28', '2022-05-23 10:25:28'),
(1280, 17, '{\"time\":\"2022-05-23T10:26:33.939Z\",\"latitude\":24.665622073661716,\"longitude\":46.70440467093021}', '23-05-2022', '2022-05-23 10:26:34', '2022-05-23 10:26:34'),
(1281, 17, '{\"time\":\"2022-05-23T10:28:04.440Z\",\"latitude\":24.665611272980662,\"longitude\":46.7043930557762}', '23-05-2022', '2022-05-23 10:28:05', '2022-05-23 10:28:05'),
(1282, 17, '{\"time\":\"2022-05-23T10:29:53.273Z\",\"latitude\":24.665580824008696,\"longitude\":46.704414385855756}', '23-05-2022', '2022-05-23 10:29:54', '2022-05-23 10:29:54'),
(1283, 17, '{\"time\":\"2022-05-23T10:31:38.098Z\",\"latitude\":24.66561655962121,\"longitude\":46.70439486450383}', '23-05-2022', '2022-05-23 10:31:39', '2022-05-23 10:31:39'),
(1284, 17, '{\"time\":\"2022-05-23T10:33:05.342Z\",\"latitude\":24.665596481740202,\"longitude\":46.704422109333954}', '23-05-2022', '2022-05-23 10:33:09', '2022-05-23 10:33:09'),
(1285, 17, '{\"time\":\"2022-05-23T10:34:47.358Z\",\"latitude\":24.665630860012296,\"longitude\":46.70441430364908}', '23-05-2022', '2022-05-23 10:34:48', '2022-05-23 10:34:48'),
(1286, 17, '{\"time\":\"2022-05-23T10:34:48.323Z\",\"latitude\":24.665614376835315,\"longitude\":46.7044108790899}', '23-05-2022', '2022-05-23 10:34:48', '2022-05-23 10:34:48'),
(1287, 17, '{\"time\":\"2022-05-23T10:34:49.338Z\",\"latitude\":24.66559007818646,\"longitude\":46.7044164687852}', '23-05-2022', '2022-05-23 10:34:49', '2022-05-23 10:34:49'),
(1288, 17, '{\"time\":\"2022-05-23T10:36:37.123Z\",\"latitude\":24.665582269551717,\"longitude\":46.704417752704046}', '23-05-2022', '2022-05-23 10:36:38', '2022-05-23 10:36:38'),
(1289, 17, '{\"time\":\"2022-05-23T10:37:41.723Z\",\"latitude\":24.665581335707614,\"longitude\":46.704422539090594}', '23-05-2022', '2022-05-23 10:37:43', '2022-05-23 10:37:43'),
(1290, 17, '{\"time\":\"2022-05-23T10:39:22.098Z\",\"latitude\":24.665617563293445,\"longitude\":46.70448323034483}', '23-05-2022', '2022-05-23 10:39:23', '2022-05-23 10:39:23'),
(1291, 17, '{\"time\":\"2022-05-23T10:41:10.767Z\",\"latitude\":24.6656074,\"longitude\":46.7045621}', '23-05-2022', '2022-05-23 10:41:11', '2022-05-23 10:41:11'),
(1292, 17, '{\"time\":\"2022-05-23T10:41:10.700Z\",\"latitude\":24.6656074,\"longitude\":46.7045621}', '23-05-2022', '2022-05-23 10:41:11', '2022-05-23 10:41:11'),
(1293, 17, '{\"time\":\"2022-05-23T10:41:11.765Z\",\"latitude\":24.665622092813496,\"longitude\":46.70441931933118}', '23-05-2022', '2022-05-23 10:41:12', '2022-05-23 10:41:12'),
(1294, 17, '{\"time\":\"2022-05-23T10:42:40.079Z\",\"latitude\":24.66561631037043,\"longitude\":46.7044727603471}', '23-05-2022', '2022-05-23 10:42:41', '2022-05-23 10:42:41'),
(1295, 17, '{\"time\":\"2022-05-23T10:43:46.345Z\",\"latitude\":24.665597449795147,\"longitude\":46.70442630226224}', '23-05-2022', '2022-05-23 10:43:48', '2022-05-23 10:43:48'),
(1296, 17, '{\"time\":\"2022-05-23T10:44:56.159Z\",\"latitude\":24.665539653946336,\"longitude\":46.70443758757388}', '23-05-2022', '2022-05-23 10:44:57', '2022-05-23 10:44:57'),
(1297, 17, '{\"time\":\"2022-05-23T10:46:34.379Z\",\"latitude\":24.665550340659433,\"longitude\":46.704442087747616}', '23-05-2022', '2022-05-23 10:46:35', '2022-05-23 10:46:35'),
(1298, 17, '{\"time\":\"2022-05-23T10:48:03.383Z\",\"latitude\":24.66549153302996,\"longitude\":46.70434082528015}', '23-05-2022', '2022-05-23 10:48:04', '2022-05-23 10:48:04'),
(1299, 17, '{\"time\":\"2022-05-23T10:49:48.420Z\",\"latitude\":24.66558175003614,\"longitude\":46.704411754011645}', '23-05-2022', '2022-05-23 10:49:50', '2022-05-23 10:49:50'),
(1300, 17, '{\"time\":\"2022-05-23T10:49:50.361Z\",\"latitude\":24.665580513922368,\"longitude\":46.704420465756264}', '23-05-2022', '2022-05-23 10:49:50', '2022-05-23 10:49:50'),
(1301, 17, '{\"time\":\"2022-05-23T10:49:49.390Z\",\"latitude\":24.66557966187039,\"longitude\":46.70441739914569}', '23-05-2022', '2022-05-23 10:49:50', '2022-05-23 10:49:50'),
(1302, 17, '{\"time\":\"2022-05-23T10:51:40.093Z\",\"latitude\":24.66548269203874,\"longitude\":46.70438411996801}', '23-05-2022', '2022-05-23 10:51:41', '2022-05-23 10:51:41'),
(1303, 17, '{\"time\":\"2022-05-23T10:53:06.216Z\",\"latitude\":24.665564851331762,\"longitude\":46.704407797367}', '23-05-2022', '2022-05-23 10:53:07', '2022-05-23 10:53:07'),
(1304, 17, '{\"time\":\"2022-05-23T10:54:54.323Z\",\"latitude\":24.665532617726168,\"longitude\":46.704411031848835}', '23-05-2022', '2022-05-23 10:54:55', '2022-05-23 10:54:55'),
(1305, 17, '{\"time\":\"2022-05-23T10:56:03.392Z\",\"latitude\":24.665550845646617,\"longitude\":46.70440395125681}', '23-05-2022', '2022-05-23 10:56:04', '2022-05-23 10:56:04'),
(1306, 17, '{\"time\":\"2022-05-23T10:57:37.134Z\",\"latitude\":24.66557162047641,\"longitude\":46.70431255974397}', '23-05-2022', '2022-05-23 10:57:38', '2022-05-23 10:57:38'),
(1307, 17, '{\"time\":\"2022-05-23T10:59:06.439Z\",\"latitude\":24.665528914105977,\"longitude\":46.70438724723434}', '23-05-2022', '2022-05-23 10:59:07', '2022-05-23 10:59:07'),
(1308, 17, '{\"time\":\"2022-05-23T11:00:37.713Z\",\"latitude\":24.665539915191687,\"longitude\":46.704383926456245}', '23-05-2022', '2022-05-23 11:00:38', '2022-05-23 11:00:38'),
(1309, 2, '{\"time\":\"2022-05-23T11:34:26.965Z\",\"latitude\":24.699528333333333,\"longitude\":46.708265}', '23-05-2022', '2022-05-23 11:34:28', '2022-05-23 11:34:28'),
(1310, 2, '{\"time\":\"2022-05-23T11:34:43.614Z\",\"latitude\":24.699540000000002,\"longitude\":46.708290000000005}', '23-05-2022', '2022-05-23 11:34:44', '2022-05-23 11:34:44'),
(1311, 2, '{\"time\":\"2022-05-23T11:36:00.234Z\",\"latitude\":24.699538333333333,\"longitude\":46.70833}', '23-05-2022', '2022-05-23 11:36:01', '2022-05-23 11:36:01'),
(1312, 17, '{\"time\":\"2022-05-23T12:41:09.897Z\",\"latitude\":24.665740225035766,\"longitude\":46.704402192832}', '23-05-2022', '2022-05-23 12:41:10', '2022-05-23 12:41:10'),
(1313, 17, '{\"time\":\"2022-05-23T12:41:09.902Z\",\"latitude\":24.665740225035766,\"longitude\":46.704402192832}', '23-05-2022', '2022-05-23 12:41:10', '2022-05-23 12:41:10'),
(1314, 17, '{\"time\":\"2022-05-23T12:41:10.909Z\",\"latitude\":24.66573089029381,\"longitude\":46.70439562684959}', '23-05-2022', '2022-05-23 12:41:11', '2022-05-23 12:41:11'),
(1315, 17, '{\"time\":\"2022-05-23T12:42:12.483Z\",\"latitude\":24.66573096201733,\"longitude\":46.70439001736355}', '23-05-2022', '2022-05-23 12:42:13', '2022-05-23 12:42:13'),
(1316, 17, '{\"time\":\"2022-05-23T12:43:41.119Z\",\"latitude\":24.665769029111054,\"longitude\":46.70437906820478}', '23-05-2022', '2022-05-23 12:43:43', '2022-05-23 12:43:43'),
(1317, 17, '{\"time\":\"2022-05-23T12:44:48.338Z\",\"latitude\":24.665726945295333,\"longitude\":46.704327517553885}', '23-05-2022', '2022-05-23 12:44:49', '2022-05-23 12:44:49'),
(1318, 17, '{\"time\":\"2022-05-23T12:46:06.410Z\",\"latitude\":24.665747571472515,\"longitude\":46.7043703028951}', '23-05-2022', '2022-05-23 12:46:07', '2022-05-23 12:46:07'),
(1319, 17, '{\"time\":\"2022-05-23T12:47:12.748Z\",\"latitude\":24.665750769450586,\"longitude\":46.704342531629415}', '23-05-2022', '2022-05-23 12:47:14', '2022-05-23 12:47:14'),
(1320, 17, '{\"time\":\"2022-05-23T12:48:40.091Z\",\"latitude\":24.665772298980166,\"longitude\":46.70441779084131}', '23-05-2022', '2022-05-23 12:48:41', '2022-05-23 12:48:41'),
(1321, 17, '{\"time\":\"2022-05-23T12:49:49.322Z\",\"latitude\":24.66575888329462,\"longitude\":46.704336262077085}', '23-05-2022', '2022-05-23 12:49:50', '2022-05-23 12:49:50'),
(1322, 17, '{\"time\":\"2022-05-23T12:51:14.220Z\",\"latitude\":24.66574496134356,\"longitude\":46.70436291402178}', '23-05-2022', '2022-05-23 12:51:16', '2022-05-23 12:51:16'),
(1323, 17, '{\"time\":\"2022-05-23T12:52:20.528Z\",\"latitude\":24.665829885741964,\"longitude\":46.70434196137975}', '23-05-2022', '2022-05-23 12:52:22', '2022-05-23 12:52:22'),
(1324, 17, '{\"time\":\"2022-05-23T12:53:26.800Z\",\"latitude\":24.665713602114824,\"longitude\":46.704393976478336}', '23-05-2022', '2022-05-23 12:53:28', '2022-05-23 12:53:28'),
(1325, 17, '{\"time\":\"2022-05-23T12:54:33.087Z\",\"latitude\":24.665679575031678,\"longitude\":46.704387699699765}', '23-05-2022', '2022-05-23 12:54:35', '2022-05-23 12:54:35'),
(1326, 17, '{\"time\":\"2022-05-23T12:56:14.194Z\",\"latitude\":24.665699994685095,\"longitude\":46.70436753912958}', '23-05-2022', '2022-05-23 12:56:15', '2022-05-23 12:56:15'),
(1327, 17, '{\"time\":\"2022-05-23T12:57:40.007Z\",\"latitude\":24.66575826319306,\"longitude\":46.704344541140586}', '23-05-2022', '2022-05-23 12:57:41', '2022-05-23 12:57:41'),
(1328, 17, '{\"time\":\"2022-05-23T12:59:17.496Z\",\"latitude\":24.665675846297425,\"longitude\":46.70442004407756}', '23-05-2022', '2022-05-23 12:59:18', '2022-05-23 12:59:18'),
(1329, 17, '{\"time\":\"2022-05-23T13:00:39.050Z\",\"latitude\":24.665711667899735,\"longitude\":46.70438998263785}', '23-05-2022', '2022-05-23 13:00:41', '2022-05-23 13:00:41'),
(1330, 17, '{\"time\":\"2022-05-23T13:02:10.626Z\",\"latitude\":24.66571456784475,\"longitude\":46.704411888924504}', '23-05-2022', '2022-05-23 13:02:11', '2022-05-23 13:02:11'),
(1331, 17, '{\"time\":\"2022-05-23T13:03:17.834Z\",\"latitude\":24.665670914735802,\"longitude\":46.70446670721644}', '23-05-2022', '2022-05-23 13:03:20', '2022-05-23 13:03:20'),
(1332, 17, '{\"time\":\"2022-05-23T13:04:23.009Z\",\"latitude\":24.665589904489597,\"longitude\":46.704544315515996}', '23-05-2022', '2022-05-23 13:04:24', '2022-05-23 13:04:24'),
(1333, 17, '{\"time\":\"2022-05-23T13:05:30.597Z\",\"latitude\":24.6656792053441,\"longitude\":46.704468062310326}', '23-05-2022', '2022-05-23 13:05:36', '2022-05-23 13:05:36'),
(1334, 17, '{\"time\":\"2022-05-23T13:07:22.381Z\",\"latitude\":24.66573399710814,\"longitude\":46.704457695320016}', '23-05-2022', '2022-05-23 13:07:23', '2022-05-23 13:07:23'),
(1335, 17, '{\"time\":\"2022-05-23T13:08:28.534Z\",\"latitude\":24.665705323344795,\"longitude\":46.70447804494681}', '23-05-2022', '2022-05-23 13:08:30', '2022-05-23 13:08:30'),
(1336, 17, '{\"time\":\"2022-05-23T13:10:13.177Z\",\"latitude\":24.66568192189996,\"longitude\":46.704428787281294}', '23-05-2022', '2022-05-23 13:10:14', '2022-05-23 13:10:14'),
(1337, 17, '{\"time\":\"2022-05-23T13:11:44.226Z\",\"latitude\":24.66568673512879,\"longitude\":46.70455419340378}', '23-05-2022', '2022-05-23 13:11:46', '2022-05-23 13:11:46'),
(1338, 17, '{\"time\":\"2022-05-23T13:13:09.392Z\",\"latitude\":24.665682095294684,\"longitude\":46.704488396135034}', '23-05-2022', '2022-05-23 13:13:11', '2022-05-23 13:13:11'),
(1339, 17, '{\"time\":\"2022-05-23T13:14:15.110Z\",\"latitude\":24.665680639936117,\"longitude\":46.70438848997734}', '23-05-2022', '2022-05-23 13:14:17', '2022-05-23 13:14:17'),
(1340, 17, '{\"time\":\"2022-05-23T13:16:47.365Z\",\"latitude\":24.66573839650774,\"longitude\":46.70431436434528}', '23-05-2022', '2022-05-23 13:16:49', '2022-05-23 13:16:49'),
(1341, 17, '{\"time\":\"2022-05-23T13:18:19.773Z\",\"latitude\":24.665642017534903,\"longitude\":46.704383655177686}', '23-05-2022', '2022-05-23 13:18:21', '2022-05-23 13:18:21'),
(1342, 17, '{\"time\":\"2022-05-23T13:19:26.010Z\",\"latitude\":24.665680921656435,\"longitude\":46.704401954463044}', '23-05-2022', '2022-05-23 13:19:27', '2022-05-23 13:19:27'),
(1343, 17, '{\"time\":\"2022-05-23T13:20:33.730Z\",\"latitude\":24.66561704296088,\"longitude\":46.704318228629035}', '23-05-2022', '2022-05-23 13:20:35', '2022-05-23 13:20:35'),
(1344, 17, '{\"time\":\"2022-05-23T13:22:06.741Z\",\"latitude\":24.66563916059158,\"longitude\":46.70439224470097}', '23-05-2022', '2022-05-23 13:22:08', '2022-05-23 13:22:08'),
(1345, 17, '{\"time\":\"2022-05-23T13:23:45.297Z\",\"latitude\":24.665675749701332,\"longitude\":46.70444304647248}', '23-05-2022', '2022-05-23 13:23:46', '2022-05-23 13:23:46'),
(1346, 17, '{\"time\":\"2022-05-23T13:25:10.329Z\",\"latitude\":24.665679637218517,\"longitude\":46.704444955626826}', '23-05-2022', '2022-05-23 13:25:13', '2022-05-23 13:25:13'),
(1347, 17, '{\"time\":\"2022-05-23T13:26:29.458Z\",\"latitude\":24.66562283955538,\"longitude\":46.704401102331666}', '23-05-2022', '2022-05-23 13:26:30', '2022-05-23 13:26:30'),
(1348, 17, '{\"time\":\"2022-05-23T13:27:41.364Z\",\"latitude\":24.66551724305683,\"longitude\":46.7043691285496}', '23-05-2022', '2022-05-23 13:27:43', '2022-05-23 13:27:43'),
(1349, 17, '{\"time\":\"2022-05-23T13:29:33.904Z\",\"latitude\":24.665596644919155,\"longitude\":46.70444580888951}', '23-05-2022', '2022-05-23 13:29:35', '2022-05-23 13:29:35'),
(1350, 17, '{\"time\":\"2022-05-23T13:29:37.888Z\",\"latitude\":24.665612030030733,\"longitude\":46.704446046219296}', '23-05-2022', '2022-05-23 13:29:38', '2022-05-23 13:29:38'),
(1351, 17, '{\"time\":\"2022-05-23T16:51:12.790Z\",\"latitude\":24.665272807634636,\"longitude\":46.70471427781061}', '23-05-2022', '2022-05-23 16:51:14', '2022-05-23 16:51:14'),
(1352, 17, '{\"time\":\"2022-05-23T16:54:35.691Z\",\"latitude\":24.66602238766441,\"longitude\":46.70410805215436}', '23-05-2022', '2022-05-23 16:54:37', '2022-05-23 16:54:37'),
(1353, 17, '{\"time\":\"2022-05-23T16:54:39.598Z\",\"latitude\":24.665857096667153,\"longitude\":46.70424407797494}', '23-05-2022', '2022-05-23 16:54:39', '2022-05-23 16:54:39'),
(1354, 17, '{\"time\":\"2022-05-23T16:55:46.317Z\",\"latitude\":24.665570675191717,\"longitude\":46.704431821164846}', '23-05-2022', '2022-05-23 16:55:46', '2022-05-23 16:55:46'),
(1355, 2, '{\"time\":\"2022-05-24T05:22:17.170Z\",\"latitude\":37.421998333333335,\"longitude\":-122.08400000000002}', '24-05-2022', '2022-05-24 05:22:18', '2022-05-24 05:22:18'),
(1356, 2, '{\"time\":\"2022-05-24T05:22:17.173Z\",\"latitude\":37.421998333333335,\"longitude\":-122.08400000000002}', '24-05-2022', '2022-05-24 05:22:18', '2022-05-24 05:22:18'),
(1357, 2, '{\"time\":\"2022-05-24T05:22:17.178Z\",\"latitude\":37.421998333333335,\"longitude\":-122.08400000000002}', '24-05-2022', '2022-05-24 05:22:18', '2022-05-24 05:22:18'),
(1358, 2, '{\"time\":\"2022-05-24T09:09:26.848Z\",\"latitude\":24.6993749,\"longitude\":46.7078176}', '24-05-2022', '2022-05-24 09:09:28', '2022-05-24 09:09:28'),
(1359, 2, '{\"time\":\"2022-05-24T09:11:02.171Z\",\"latitude\":24.6993749,\"longitude\":46.7078176}', '24-05-2022', '2022-05-24 09:11:03', '2022-05-24 09:11:03'),
(1360, 28, '{\"time\":\"2022-05-24T09:35:40.778Z\",\"latitude\":24.699535,\"longitude\":46.70832}', '24-05-2022', '2022-05-24 09:35:42', '2022-05-24 09:35:42'),
(1361, 28, '{\"time\":\"2022-05-24T09:36:25.769Z\",\"latitude\":24.699571666666664,\"longitude\":46.70836666666667}', '24-05-2022', '2022-05-24 09:36:27', '2022-05-24 09:36:27'),
(1362, 28, '{\"time\":\"2022-05-24T09:38:26.723Z\",\"latitude\":24.699528333333333,\"longitude\":46.708333333333336}', '24-05-2022', '2022-05-24 09:38:27', '2022-05-24 09:38:27'),
(1363, 29, '{\"time\":\"2022-05-24T10:07:02.672Z\",\"latitude\":24.699661666666664,\"longitude\":46.708466666666666}', '24-05-2022', '2022-05-24 10:07:03', '2022-05-24 10:07:03'),
(1364, 29, '{\"time\":\"2022-05-24T10:07:06.505Z\",\"latitude\":24.699648333333336,\"longitude\":46.70841166666667}', '24-05-2022', '2022-05-24 10:07:07', '2022-05-24 10:07:07'),
(1365, 29, '{\"time\":\"2022-05-24T10:18:05.486Z\",\"latitude\":24.699616666666664,\"longitude\":46.708436666666664}', '24-05-2022', '2022-05-24 10:18:07', '2022-05-24 10:18:07'),
(1366, 29, '{\"time\":\"2022-05-24T10:19:27.798Z\",\"latitude\":24.699605,\"longitude\":46.708483333333334}', '24-05-2022', '2022-05-24 10:19:29', '2022-05-24 10:19:29'),
(1367, 29, '{\"time\":\"2022-05-24T10:20:44.479Z\",\"latitude\":24.69959833333333,\"longitude\":46.70850666666667}', '24-05-2022', '2022-05-24 10:20:46', '2022-05-24 10:20:46'),
(1368, 29, '{\"time\":\"2022-05-24T10:21:57.835Z\",\"latitude\":24.69959833333333,\"longitude\":46.708503333333326}', '24-05-2022', '2022-05-24 10:22:00', '2022-05-24 10:22:00'),
(1369, 29, '{\"time\":\"2022-05-24T10:23:06.796Z\",\"latitude\":24.69957,\"longitude\":46.708535}', '24-05-2022', '2022-05-24 10:23:08', '2022-05-24 10:23:08'),
(1370, 29, '{\"time\":\"2022-05-24T10:24:25.264Z\",\"latitude\":24.699561666666668,\"longitude\":46.708545}', '24-05-2022', '2022-05-24 10:24:26', '2022-05-24 10:24:26'),
(1371, 29, '{\"time\":\"2022-05-24T10:25:28.443Z\",\"latitude\":24.699548333333336,\"longitude\":46.70853833333334}', '24-05-2022', '2022-05-24 10:25:29', '2022-05-24 10:25:29'),
(1372, 29, '{\"time\":\"2022-05-24T10:26:37.149Z\",\"latitude\":24.699568333333332,\"longitude\":46.708549999999995}', '24-05-2022', '2022-05-24 10:26:38', '2022-05-24 10:26:38'),
(1373, 29, '{\"time\":\"2022-05-24T10:28:29.762Z\",\"latitude\":24.699636666666667,\"longitude\":46.70855333333334}', '24-05-2022', '2022-05-24 10:28:31', '2022-05-24 10:28:31'),
(1374, 29, '{\"time\":\"2022-05-24T10:29:51.755Z\",\"latitude\":24.699628333333333,\"longitude\":46.708470000000005}', '24-05-2022', '2022-05-24 10:29:53', '2022-05-24 10:29:53'),
(1375, 29, '{\"time\":\"2022-05-24T10:31:13.652Z\",\"latitude\":24.699633333333335,\"longitude\":46.708455}', '24-05-2022', '2022-05-24 10:31:15', '2022-05-24 10:31:15'),
(1376, 29, '{\"time\":\"2022-05-24T10:32:16.838Z\",\"latitude\":24.699628333333333,\"longitude\":46.70841}', '24-05-2022', '2022-05-24 10:32:18', '2022-05-24 10:32:18'),
(1377, 29, '{\"time\":\"2022-05-24T10:33:19.008Z\",\"latitude\":24.699618333333333,\"longitude\":46.708333333333336}', '24-05-2022', '2022-05-24 10:33:20', '2022-05-24 10:33:20'),
(1378, 29, '{\"time\":\"2022-05-24T10:35:06.769Z\",\"latitude\":24.69961,\"longitude\":46.70832166666667}', '24-05-2022', '2022-05-24 10:35:17', '2022-05-24 10:35:17'),
(1379, 29, '{\"time\":\"2022-05-24T10:36:11.478Z\",\"latitude\":24.699608333333337,\"longitude\":46.708323333333325}', '24-05-2022', '2022-05-24 10:36:14', '2022-05-24 10:36:14'),
(1380, 29, '{\"time\":\"2022-05-24T10:37:15.394Z\",\"latitude\":24.69964,\"longitude\":46.70824833333333}', '24-05-2022', '2022-05-24 10:37:16', '2022-05-24 10:37:16'),
(1381, 29, '{\"time\":\"2022-05-24T10:38:26.649Z\",\"latitude\":24.699634999999997,\"longitude\":46.70827333333333}', '24-05-2022', '2022-05-24 10:38:28', '2022-05-24 10:38:28'),
(1382, 29, '{\"time\":\"2022-05-24T10:40:09.071Z\",\"latitude\":24.69953333333334,\"longitude\":46.70823833333334}', '24-05-2022', '2022-05-24 10:40:11', '2022-05-24 10:40:11'),
(1383, 29, '{\"time\":\"2022-05-24T10:41:19.069Z\",\"latitude\":24.699543333333335,\"longitude\":46.708243333333336}', '24-05-2022', '2022-05-24 10:41:24', '2022-05-24 10:41:24'),
(1384, 29, '{\"time\":\"2022-05-24T10:42:22.076Z\",\"latitude\":24.699543333333335,\"longitude\":46.708239999999996}', '24-05-2022', '2022-05-24 10:42:23', '2022-05-24 10:42:23'),
(1385, 29, '{\"time\":\"2022-05-24T10:43:27.057Z\",\"latitude\":24.699583333333333,\"longitude\":46.70827333333333}', '24-05-2022', '2022-05-24 10:43:28', '2022-05-24 10:43:28'),
(1386, 29, '{\"time\":\"2022-05-24T10:44:38.708Z\",\"latitude\":24.69957833333334,\"longitude\":46.708290000000005}', '24-05-2022', '2022-05-24 10:44:40', '2022-05-24 10:44:40'),
(1387, 29, '{\"time\":\"2022-05-24T10:45:43.464Z\",\"latitude\":24.69958,\"longitude\":46.708290000000005}', '24-05-2022', '2022-05-24 10:45:44', '2022-05-24 10:45:44'),
(1388, 29, '{\"time\":\"2022-05-24T10:46:58.761Z\",\"latitude\":24.699591666666667,\"longitude\":46.70831166666667}', '24-05-2022', '2022-05-24 10:47:00', '2022-05-24 10:47:00'),
(1389, 29, '{\"time\":\"2022-05-24T10:48:04.719Z\",\"latitude\":24.699589999999997,\"longitude\":46.70830666666667}', '24-05-2022', '2022-05-24 10:48:06', '2022-05-24 10:48:06'),
(1390, 29, '{\"time\":\"2022-05-24T10:49:41.052Z\",\"latitude\":24.69952166666667,\"longitude\":46.70830666666667}', '24-05-2022', '2022-05-24 10:49:42', '2022-05-24 10:49:42'),
(1391, 29, '{\"time\":\"2022-05-24T10:50:47.068Z\",\"latitude\":24.699574999999996,\"longitude\":46.70831666666666}', '24-05-2022', '2022-05-24 10:50:48', '2022-05-24 10:50:48'),
(1392, 29, '{\"time\":\"2022-05-24T10:51:59.074Z\",\"latitude\":24.699588333333335,\"longitude\":46.70828333333334}', '24-05-2022', '2022-05-24 10:52:01', '2022-05-24 10:52:01'),
(1393, 29, '{\"time\":\"2022-05-24T10:53:07.044Z\",\"latitude\":24.699603333333336,\"longitude\":46.708324999999995}', '24-05-2022', '2022-05-24 10:53:09', '2022-05-24 10:53:09'),
(1394, 29, '{\"time\":\"2022-05-24T10:54:15.077Z\",\"latitude\":24.699606666666668,\"longitude\":46.708355}', '24-05-2022', '2022-05-24 10:54:16', '2022-05-24 10:54:16'),
(1395, 29, '{\"time\":\"2022-05-24T10:55:56.019Z\",\"latitude\":24.699595,\"longitude\":46.70834}', '24-05-2022', '2022-05-24 10:55:57', '2022-05-24 10:55:57'),
(1396, 29, '{\"time\":\"2022-05-24T11:43:40.773Z\",\"latitude\":24.699585000000003,\"longitude\":46.70844}', '24-05-2022', '2022-05-24 11:43:42', '2022-05-24 11:43:42'),
(1397, 29, '{\"time\":\"2022-05-24T11:45:02.368Z\",\"latitude\":24.699613333333332,\"longitude\":46.70846333333334}', '24-05-2022', '2022-05-24 11:45:03', '2022-05-24 11:45:03'),
(1398, 29, '{\"time\":\"2022-05-24T12:13:12.783Z\",\"latitude\":24.699589999999997,\"longitude\":46.7084}', '24-05-2022', '2022-05-24 12:13:14', '2022-05-24 12:13:14'),
(1399, 29, '{\"time\":\"2022-05-24T12:21:57.417Z\",\"latitude\":24.699493333333333,\"longitude\":46.708074999999994}', '24-05-2022', '2022-05-24 12:22:30', '2022-05-24 12:22:30'),
(1400, 16, '{\"time\":\"2022-05-24T13:33:49.274Z\",\"latitude\":24.66513958722158,\"longitude\":46.70441376651905}', '24-05-2022', '2022-05-24 13:33:49', '2022-05-24 13:33:49'),
(1401, 16, '{\"time\":\"2022-05-24T13:33:49.281Z\",\"latitude\":24.66513958722158,\"longitude\":46.70441376651905}', '24-05-2022', '2022-05-24 13:33:49', '2022-05-24 13:33:49'),
(1402, 16, '{\"time\":\"2022-05-24T13:33:57.298Z\",\"latitude\":24.66534829352038,\"longitude\":46.704417061255306}', '24-05-2022', '2022-05-24 13:33:57', '2022-05-24 13:33:57'),
(1403, 16, '{\"time\":\"2022-05-24T13:35:10.400Z\",\"latitude\":24.665415090495614,\"longitude\":46.704374420881614}', '24-05-2022', '2022-05-24 13:35:11', '2022-05-24 13:35:11'),
(1404, 16, '{\"time\":\"2022-05-24T13:36:13.819Z\",\"latitude\":24.66555114279187,\"longitude\":46.70444884842267}', '24-05-2022', '2022-05-24 13:36:14', '2022-05-24 13:36:14'),
(1405, 16, '{\"time\":\"2022-05-24T13:37:20.108Z\",\"latitude\":24.66566005208889,\"longitude\":46.70443446536904}', '24-05-2022', '2022-05-24 13:37:23', '2022-05-24 13:37:23'),
(1406, 16, '{\"time\":\"2022-05-24T13:39:07.551Z\",\"latitude\":24.665561443011306,\"longitude\":46.7044650124621}', '24-05-2022', '2022-05-24 13:39:08', '2022-05-24 13:39:08'),
(1407, 16, '{\"time\":\"2022-05-24T13:40:17.072Z\",\"latitude\":24.66555369802483,\"longitude\":46.70443067090687}', '24-05-2022', '2022-05-24 13:40:17', '2022-05-24 13:40:17'),
(1408, 30, '{\"time\":\"2022-05-24T18:55:49.933Z\",\"latitude\":24.7379339,\"longitude\":46.689237}', '24-05-2022', '2022-05-24 18:55:51', '2022-05-24 18:55:51'),
(1409, 2, '{\"time\":\"2022-05-25T16:06:27.662Z\",\"latitude\":24.71084,\"longitude\":46.68330833333333}', '25-05-2022', '2022-05-25 16:06:28', '2022-05-25 16:06:28'),
(1410, 2, '{\"time\":\"2022-05-25T16:06:36.296Z\",\"latitude\":24.71137666666667,\"longitude\":46.68378833333333}', '25-05-2022', '2022-05-25 16:06:36', '2022-05-25 16:06:36'),
(1411, 2, '{\"time\":\"2022-05-25T16:07:53.972Z\",\"latitude\":24.708630000000003,\"longitude\":46.68688999999999}', '25-05-2022', '2022-05-25 16:07:55', '2022-05-25 16:07:55'),
(1412, 2, '{\"time\":\"2022-05-25T16:08:58.642Z\",\"latitude\":24.6990211,\"longitude\":46.7093277}', '25-05-2022', '2022-05-25 16:08:59', '2022-05-25 16:08:59'),
(1413, 2, '{\"time\":\"2022-05-25T16:09:06.197Z\",\"latitude\":24.699546666666667,\"longitude\":46.708504999999995}', '25-05-2022', '2022-05-25 16:09:07', '2022-05-25 16:09:07'),
(1414, 2, '{\"time\":\"2022-05-25T16:10:13.488Z\",\"latitude\":24.69955,\"longitude\":46.708555}', '25-05-2022', '2022-05-25 16:10:14', '2022-05-25 16:10:14'),
(1415, 17, '{\"time\":\"2022-05-28T12:42:50.363Z\",\"latitude\":24.6557227,\"longitude\":46.71972}', '28-05-2022', '2022-05-28 12:42:51', '2022-05-28 12:42:51'),
(1416, 17, '{\"time\":\"2022-05-28T12:42:51.614Z\",\"latitude\":24.65561228,\"longitude\":46.71976412}', '28-05-2022', '2022-05-28 12:42:53', '2022-05-28 12:42:53'),
(1417, 17, '{\"time\":\"2022-05-28T12:43:53.731Z\",\"latitude\":24.65582669,\"longitude\":46.7198049}', '28-05-2022', '2022-05-28 12:43:56', '2022-05-28 12:43:56'),
(1418, 16, '{\"time\":\"2022-05-28T12:50:12.398Z\",\"latitude\":24.665600796673438,\"longitude\":46.70471766705168}', '28-05-2022', '2022-05-28 12:50:14', '2022-05-28 12:50:14'),
(1419, 16, '{\"time\":\"2022-05-28T12:50:12.423Z\",\"latitude\":24.665600796673438,\"longitude\":46.70471766705168}', '28-05-2022', '2022-05-28 12:50:14', '2022-05-28 12:50:14'),
(1420, 16, '{\"time\":\"2022-05-28T12:50:20.298Z\",\"latitude\":24.665615001200425,\"longitude\":46.70454607472679}', '28-05-2022', '2022-05-28 12:50:22', '2022-05-28 12:50:22'),
(1421, 16, '{\"time\":\"2022-05-28T12:51:34.815Z\",\"latitude\":24.665679403959036,\"longitude\":46.70430055680305}', '28-05-2022', '2022-05-28 12:51:36', '2022-05-28 12:51:36'),
(1422, 16, '{\"time\":\"2022-05-28T12:53:29.360Z\",\"latitude\":24.665686574149767,\"longitude\":46.704417187663104}', '28-05-2022', '2022-05-28 12:53:34', '2022-05-28 12:53:34'),
(1423, 17, '{\"time\":\"2022-05-29T07:55:09.575Z\",\"latitude\":24.67899418,\"longitude\":46.72992616}', '29-05-2022', '2022-05-29 07:55:11', '2022-05-29 07:55:11'),
(1424, 17, '{\"time\":\"2022-05-29T07:55:13.557Z\",\"latitude\":24.67899361,\"longitude\":46.72992601}', '29-05-2022', '2022-05-29 07:55:15', '2022-05-29 07:55:15'),
(1425, 17, '{\"time\":\"2022-05-29T07:56:22.631Z\",\"latitude\":24.67896847,\"longitude\":46.72992276}', '29-05-2022', '2022-05-29 07:56:25', '2022-05-29 07:56:25'),
(1426, 17, '{\"time\":\"2022-05-29T07:58:12.572Z\",\"latitude\":24.67893855,\"longitude\":46.72995597}', '29-05-2022', '2022-05-29 07:58:15', '2022-05-29 07:58:15'),
(1427, 17, '{\"time\":\"2022-05-29T08:00:04.574Z\",\"latitude\":24.67894818,\"longitude\":46.72992021}', '29-05-2022', '2022-05-29 08:00:07', '2022-05-29 08:00:07'),
(1428, 17, '{\"time\":\"2022-05-29T08:01:05.593Z\",\"latitude\":24.67894018,\"longitude\":46.72991755}', '29-05-2022', '2022-05-29 08:01:08', '2022-05-29 08:01:08'),
(1429, 17, '{\"time\":\"2022-05-29T08:02:01.539Z\",\"latitude\":24.67896315,\"longitude\":46.72992401}', '29-05-2022', '2022-05-29 08:02:04', '2022-05-29 08:02:04'),
(1430, 17, '{\"time\":\"2022-05-29T08:03:04.595Z\",\"latitude\":24.67896682,\"longitude\":46.72992654}', '29-05-2022', '2022-05-29 08:03:08', '2022-05-29 08:03:08'),
(1431, 17, '{\"time\":\"2022-05-29T08:04:02.615Z\",\"latitude\":24.67896654,\"longitude\":46.72992324}', '29-05-2022', '2022-05-29 08:04:05', '2022-05-29 08:04:05'),
(1432, 17, '{\"time\":\"2022-05-29T08:05:01.580Z\",\"latitude\":24.67894678,\"longitude\":46.72991342}', '29-05-2022', '2022-05-29 08:05:04', '2022-05-29 08:05:04'),
(1433, 17, '{\"time\":\"2022-05-29T08:06:01.583Z\",\"latitude\":24.67893797,\"longitude\":46.72991338}', '29-05-2022', '2022-05-29 08:06:04', '2022-05-29 08:06:04'),
(1434, 17, '{\"time\":\"2022-05-29T08:07:04.582Z\",\"latitude\":24.67893269,\"longitude\":46.72990918}', '29-05-2022', '2022-05-29 08:07:07', '2022-05-29 08:07:07'),
(1435, 17, '{\"time\":\"2022-05-29T08:08:05.563Z\",\"latitude\":24.6789334,\"longitude\":46.72990833}', '29-05-2022', '2022-05-29 08:08:08', '2022-05-29 08:08:08'),
(1436, 17, '{\"time\":\"2022-05-29T08:09:04.577Z\",\"latitude\":24.6789349,\"longitude\":46.72990696}', '29-05-2022', '2022-05-29 08:09:07', '2022-05-29 08:09:07'),
(1437, 17, '{\"time\":\"2022-05-29T08:10:05.549Z\",\"latitude\":24.67894161,\"longitude\":46.7299098}', '29-05-2022', '2022-05-29 08:10:08', '2022-05-29 08:10:08'),
(1438, 17, '{\"time\":\"2022-05-29T08:11:05.571Z\",\"latitude\":24.6789524,\"longitude\":46.72991861}', '29-05-2022', '2022-05-29 08:11:08', '2022-05-29 08:11:08'),
(1439, 17, '{\"time\":\"2022-05-29T08:12:02.593Z\",\"latitude\":24.67895092,\"longitude\":46.72991595}', '29-05-2022', '2022-05-29 08:12:05', '2022-05-29 08:12:05'),
(1440, 17, '{\"time\":\"2022-05-29T08:13:02.598Z\",\"latitude\":24.67894425,\"longitude\":46.7299078}', '29-05-2022', '2022-05-29 08:13:05', '2022-05-29 08:13:05');
INSERT INTO `track_employees` (`id`, `user_id`, `location`, `date`, `created_at`, `updated_at`) VALUES
(1441, 17, '{\"time\":\"2022-05-29T08:14:03.558Z\",\"latitude\":24.67894153,\"longitude\":46.7299056}', '29-05-2022', '2022-05-29 08:14:06', '2022-05-29 08:14:06'),
(1442, 17, '{\"time\":\"2022-05-29T08:15:01.620Z\",\"latitude\":24.67893862,\"longitude\":46.72990301}', '29-05-2022', '2022-05-29 08:15:05', '2022-05-29 08:15:05'),
(1443, 17, '{\"time\":\"2022-05-29T08:16:02.614Z\",\"latitude\":24.67893454,\"longitude\":46.72990381}', '29-05-2022', '2022-05-29 08:16:05', '2022-05-29 08:16:05'),
(1444, 17, '{\"time\":\"2022-05-29T08:17:03.532Z\",\"latitude\":24.67893157,\"longitude\":46.72990145}', '29-05-2022', '2022-05-29 08:17:06', '2022-05-29 08:17:06'),
(1445, 17, '{\"time\":\"2022-05-29T08:18:02.584Z\",\"latitude\":24.67892734,\"longitude\":46.72989724}', '29-05-2022', '2022-05-29 08:18:06', '2022-05-29 08:18:06'),
(1446, 17, '{\"time\":\"2022-05-29T08:19:01.549Z\",\"latitude\":24.6789231,\"longitude\":46.72989733}', '29-05-2022', '2022-05-29 08:19:04', '2022-05-29 08:19:04'),
(1447, 17, '{\"time\":\"2022-05-29T08:20:04.534Z\",\"latitude\":24.67892459,\"longitude\":46.72989528}', '29-05-2022', '2022-05-29 08:20:06', '2022-05-29 08:20:06'),
(1448, 17, '{\"time\":\"2022-05-29T08:21:08.582Z\",\"latitude\":24.67891989,\"longitude\":46.72989015}', '29-05-2022', '2022-05-29 08:21:11', '2022-05-29 08:21:11'),
(1449, 17, '{\"time\":\"2022-05-29T08:22:03.584Z\",\"latitude\":24.6789178,\"longitude\":46.72988704}', '29-05-2022', '2022-05-29 08:22:06', '2022-05-29 08:22:06'),
(1450, 17, '{\"time\":\"2022-05-29T08:23:03.615Z\",\"latitude\":24.67890999,\"longitude\":46.72988222}', '29-05-2022', '2022-05-29 08:23:06', '2022-05-29 08:23:06'),
(1451, 17, '{\"time\":\"2022-05-29T08:24:02.548Z\",\"latitude\":24.67890745,\"longitude\":46.72987879}', '29-05-2022', '2022-05-29 08:24:05', '2022-05-29 08:24:05'),
(1452, 17, '{\"time\":\"2022-05-29T08:25:01.614Z\",\"latitude\":24.67890368,\"longitude\":46.72987499}', '29-05-2022', '2022-05-29 08:25:04', '2022-05-29 08:25:04'),
(1453, 17, '{\"time\":\"2022-05-29T08:26:04.554Z\",\"latitude\":24.67890381,\"longitude\":46.72987484}', '29-05-2022', '2022-05-29 08:26:07', '2022-05-29 08:26:07'),
(1454, 17, '{\"time\":\"2022-05-29T08:27:03.581Z\",\"latitude\":24.67890234,\"longitude\":46.72987413}', '29-05-2022', '2022-05-29 08:27:06', '2022-05-29 08:27:06'),
(1455, 17, '{\"time\":\"2022-05-29T08:28:09.561Z\",\"latitude\":24.67889826,\"longitude\":46.72986984}', '29-05-2022', '2022-05-29 08:28:12', '2022-05-29 08:28:12'),
(1456, 17, '{\"time\":\"2022-05-29T08:29:04.578Z\",\"latitude\":24.67889779,\"longitude\":46.72986951}', '29-05-2022', '2022-05-29 08:29:07', '2022-05-29 08:29:07'),
(1457, 17, '{\"time\":\"2022-05-29T08:30:06.605Z\",\"latitude\":24.67889788,\"longitude\":46.72986941}', '29-05-2022', '2022-05-29 08:30:09', '2022-05-29 08:30:09'),
(1458, 17, '{\"time\":\"2022-05-29T08:31:03.602Z\",\"latitude\":24.67889789,\"longitude\":46.72986949}', '29-05-2022', '2022-05-29 08:31:07', '2022-05-29 08:31:07'),
(1459, 17, '{\"time\":\"2022-05-29T08:32:02.567Z\",\"latitude\":24.67889756,\"longitude\":46.72986923}', '29-05-2022', '2022-05-29 08:32:07', '2022-05-29 08:32:07'),
(1460, 17, '{\"time\":\"2022-05-29T08:33:03.596Z\",\"latitude\":24.67889544,\"longitude\":46.72986859}', '29-05-2022', '2022-05-29 08:33:06', '2022-05-29 08:33:06'),
(1461, 17, '{\"time\":\"2022-05-29T08:34:03.596Z\",\"latitude\":24.67889446,\"longitude\":46.72986777}', '29-05-2022', '2022-05-29 08:34:06', '2022-05-29 08:34:06'),
(1462, 17, '{\"time\":\"2022-05-29T08:35:03.570Z\",\"latitude\":24.67889518,\"longitude\":46.72986389}', '29-05-2022', '2022-05-29 08:35:06', '2022-05-29 08:35:06'),
(1463, 17, '{\"time\":\"2022-05-29T08:36:02.599Z\",\"latitude\":24.67889894,\"longitude\":46.72986323}', '29-05-2022', '2022-05-29 08:36:05', '2022-05-29 08:36:05'),
(1464, 17, '{\"time\":\"2022-05-29T08:37:02.577Z\",\"latitude\":24.67890369,\"longitude\":46.7298625}', '29-05-2022', '2022-05-29 08:37:05', '2022-05-29 08:37:05'),
(1465, 17, '{\"time\":\"2022-05-29T08:38:02.587Z\",\"latitude\":24.67890599,\"longitude\":46.72985911}', '29-05-2022', '2022-05-29 08:38:05', '2022-05-29 08:38:05'),
(1466, 17, '{\"time\":\"2022-05-29T08:39:01.582Z\",\"latitude\":24.67890482,\"longitude\":46.7298606}', '29-05-2022', '2022-05-29 08:39:04', '2022-05-29 08:39:04'),
(1467, 17, '{\"time\":\"2022-05-29T08:40:01.609Z\",\"latitude\":24.67890286,\"longitude\":46.72985913}', '29-05-2022', '2022-05-29 08:40:04', '2022-05-29 08:40:04'),
(1468, 17, '{\"time\":\"2022-05-29T08:41:01.564Z\",\"latitude\":24.67890528,\"longitude\":46.72986258}', '29-05-2022', '2022-05-29 08:41:04', '2022-05-29 08:41:04'),
(1469, 17, '{\"time\":\"2022-05-29T08:42:01.578Z\",\"latitude\":24.67890139,\"longitude\":46.72985889}', '29-05-2022', '2022-05-29 08:42:04', '2022-05-29 08:42:04'),
(1470, 17, '{\"time\":\"2022-05-29T08:43:02.601Z\",\"latitude\":24.67889831,\"longitude\":46.72985605}', '29-05-2022', '2022-05-29 08:43:05', '2022-05-29 08:43:05'),
(1471, 17, '{\"time\":\"2022-05-29T08:44:03.579Z\",\"latitude\":24.6788944,\"longitude\":46.72985369}', '29-05-2022', '2022-05-29 08:44:06', '2022-05-29 08:44:06'),
(1472, 17, '{\"time\":\"2022-05-29T08:45:01.569Z\",\"latitude\":24.67889378,\"longitude\":46.72985334}', '29-05-2022', '2022-05-29 08:45:04', '2022-05-29 08:45:04'),
(1473, 17, '{\"time\":\"2022-05-29T08:46:01.585Z\",\"latitude\":24.67889223,\"longitude\":46.72985094}', '29-05-2022', '2022-05-29 08:46:04', '2022-05-29 08:46:04'),
(1474, 17, '{\"time\":\"2022-05-29T08:47:01.563Z\",\"latitude\":24.67889446,\"longitude\":46.72985059}', '29-05-2022', '2022-05-29 08:47:04', '2022-05-29 08:47:04'),
(1475, 17, '{\"time\":\"2022-05-29T08:48:01.597Z\",\"latitude\":24.67889477,\"longitude\":46.72985333}', '29-05-2022', '2022-05-29 08:48:05', '2022-05-29 08:48:05'),
(1476, 17, '{\"time\":\"2022-05-29T08:49:01.573Z\",\"latitude\":24.6788935,\"longitude\":46.72985103}', '29-05-2022', '2022-05-29 08:49:04', '2022-05-29 08:49:04'),
(1477, 17, '{\"time\":\"2022-05-29T08:49:14.772Z\",\"latitude\":24.6790142,\"longitude\":46.7299337}', '29-05-2022', '2022-05-29 08:49:16', '2022-05-29 08:49:16'),
(1478, 17, '{\"time\":\"2022-05-29T08:49:16.557Z\",\"latitude\":24.67890031,\"longitude\":46.72985514}', '29-05-2022', '2022-05-29 08:49:18', '2022-05-29 08:49:18'),
(1479, 17, '{\"time\":\"2022-05-29T08:50:17.611Z\",\"latitude\":24.67906934,\"longitude\":46.72986464}', '29-05-2022', '2022-05-29 08:50:20', '2022-05-29 08:50:20'),
(1480, 17, '{\"time\":\"2022-05-29T08:51:18.616Z\",\"latitude\":24.67905796,\"longitude\":46.72989171}', '29-05-2022', '2022-05-29 08:51:21', '2022-05-29 08:51:21'),
(1481, 17, '{\"time\":\"2022-05-29T08:52:18.597Z\",\"latitude\":24.67898069,\"longitude\":46.72987015}', '29-05-2022', '2022-05-29 08:52:21', '2022-05-29 08:52:21'),
(1482, 17, '{\"time\":\"2022-05-29T08:53:18.585Z\",\"latitude\":24.6790095,\"longitude\":46.72987994}', '29-05-2022', '2022-05-29 08:53:21', '2022-05-29 08:53:21'),
(1483, 17, '{\"time\":\"2022-05-29T08:54:21.602Z\",\"latitude\":24.67902208,\"longitude\":46.72989115}', '29-05-2022', '2022-05-29 08:54:24', '2022-05-29 08:54:24'),
(1484, 17, '{\"time\":\"2022-05-29T08:55:18.614Z\",\"latitude\":24.67901282,\"longitude\":46.72988114}', '29-05-2022', '2022-05-29 08:55:21', '2022-05-29 08:55:21'),
(1485, 17, '{\"time\":\"2022-05-29T08:56:22.578Z\",\"latitude\":24.6790124,\"longitude\":46.72988309}', '29-05-2022', '2022-05-29 08:56:25', '2022-05-29 08:56:25'),
(1486, 17, '{\"time\":\"2022-05-29T08:57:20.566Z\",\"latitude\":24.67901216,\"longitude\":46.72988278}', '29-05-2022', '2022-05-29 08:57:23', '2022-05-29 08:57:23'),
(1487, 17, '{\"time\":\"2022-05-29T08:58:19.594Z\",\"latitude\":24.67899634,\"longitude\":46.72987756}', '29-05-2022', '2022-05-29 08:58:22', '2022-05-29 08:58:22'),
(1488, 17, '{\"time\":\"2022-05-29T08:59:20.574Z\",\"latitude\":24.67898604,\"longitude\":46.72986731}', '29-05-2022', '2022-05-29 08:59:23', '2022-05-29 08:59:23'),
(1489, 17, '{\"time\":\"2022-05-29T09:00:18.608Z\",\"latitude\":24.67898653,\"longitude\":46.72986976}', '29-05-2022', '2022-05-29 09:00:21', '2022-05-29 09:00:21'),
(1490, 17, '{\"time\":\"2022-05-29T09:01:21.588Z\",\"latitude\":24.678982,\"longitude\":46.72986553}', '29-05-2022', '2022-05-29 09:01:24', '2022-05-29 09:01:24'),
(1491, 17, '{\"time\":\"2022-05-29T09:02:19.585Z\",\"latitude\":24.67898261,\"longitude\":46.72986486}', '29-05-2022', '2022-05-29 09:02:22', '2022-05-29 09:02:22'),
(1492, 17, '{\"time\":\"2022-05-29T09:03:19.613Z\",\"latitude\":24.67898134,\"longitude\":46.72986585}', '29-05-2022', '2022-05-29 09:03:22', '2022-05-29 09:03:22'),
(1493, 17, '{\"time\":\"2022-05-29T09:04:20.603Z\",\"latitude\":24.67898693,\"longitude\":46.72986782}', '29-05-2022', '2022-05-29 09:04:24', '2022-05-29 09:04:24'),
(1494, 17, '{\"time\":\"2022-05-29T09:05:19.570Z\",\"latitude\":24.67898319,\"longitude\":46.72986694}', '29-05-2022', '2022-05-29 09:05:22', '2022-05-29 09:05:22'),
(1495, 17, '{\"time\":\"2022-05-29T09:06:20.569Z\",\"latitude\":24.67897801,\"longitude\":46.72987026}', '29-05-2022', '2022-05-29 09:06:24', '2022-05-29 09:06:24'),
(1496, 17, '{\"time\":\"2022-05-29T09:07:19.567Z\",\"latitude\":24.67896405,\"longitude\":46.72986819}', '29-05-2022', '2022-05-29 09:07:22', '2022-05-29 09:07:22'),
(1497, 17, '{\"time\":\"2022-05-29T09:08:20.598Z\",\"latitude\":24.67895975,\"longitude\":46.72986466}', '29-05-2022', '2022-05-29 09:08:23', '2022-05-29 09:08:23'),
(1498, 17, '{\"time\":\"2022-05-29T09:09:18.617Z\",\"latitude\":24.67896651,\"longitude\":46.72986618}', '29-05-2022', '2022-05-29 09:09:21', '2022-05-29 09:09:21'),
(1499, 17, '{\"time\":\"2022-05-29T09:10:17.586Z\",\"latitude\":24.67896394,\"longitude\":46.72986888}', '29-05-2022', '2022-05-29 09:10:20', '2022-05-29 09:10:20'),
(1500, 17, '{\"time\":\"2022-05-29T09:11:18.562Z\",\"latitude\":24.6789522,\"longitude\":46.72987002}', '29-05-2022', '2022-05-29 09:11:21', '2022-05-29 09:11:21'),
(1501, 17, '{\"time\":\"2022-05-29T09:12:24.608Z\",\"latitude\":24.67895201,\"longitude\":46.72986967}', '29-05-2022', '2022-05-29 09:12:27', '2022-05-29 09:12:27'),
(1502, 17, '{\"time\":\"2022-05-29T09:14:19.596Z\",\"latitude\":24.67894626,\"longitude\":46.72985573}', '29-05-2022', '2022-05-29 09:14:22', '2022-05-29 09:14:22'),
(1503, 17, '{\"time\":\"2022-05-29T09:15:20.600Z\",\"latitude\":24.67894796,\"longitude\":46.72985407}', '29-05-2022', '2022-05-29 09:15:23', '2022-05-29 09:15:23'),
(1504, 17, '{\"time\":\"2022-05-29T09:16:17.621Z\",\"latitude\":24.67893851,\"longitude\":46.72984713}', '29-05-2022', '2022-05-29 09:16:20', '2022-05-29 09:16:20'),
(1505, 17, '{\"time\":\"2022-05-29T09:17:17.613Z\",\"latitude\":24.67893819,\"longitude\":46.72984556}', '29-05-2022', '2022-05-29 09:17:20', '2022-05-29 09:17:20'),
(1506, 17, '{\"time\":\"2022-05-29T09:18:19.608Z\",\"latitude\":24.67893841,\"longitude\":46.72984678}', '29-05-2022', '2022-05-29 09:18:23', '2022-05-29 09:18:23'),
(1507, 17, '{\"time\":\"2022-05-29T09:19:20.594Z\",\"latitude\":24.67893881,\"longitude\":46.72984606}', '29-05-2022', '2022-05-29 09:19:23', '2022-05-29 09:19:23'),
(1508, 17, '{\"time\":\"2022-05-29T09:20:19.585Z\",\"latitude\":24.67894318,\"longitude\":46.72984678}', '29-05-2022', '2022-05-29 09:20:22', '2022-05-29 09:20:22'),
(1509, 17, '{\"time\":\"2022-05-29T09:21:18.617Z\",\"latitude\":24.67895323,\"longitude\":46.72984606}', '29-05-2022', '2022-05-29 09:21:21', '2022-05-29 09:21:21'),
(1510, 17, '{\"time\":\"2022-05-29T09:22:18.575Z\",\"latitude\":24.67896106,\"longitude\":46.72984618}', '29-05-2022', '2022-05-29 09:22:21', '2022-05-29 09:22:21'),
(1511, 17, '{\"time\":\"2022-05-29T09:23:17.624Z\",\"latitude\":24.67894745,\"longitude\":46.72984678}', '29-05-2022', '2022-05-29 09:23:20', '2022-05-29 09:23:20'),
(1512, 17, '{\"time\":\"2022-05-29T09:24:18.573Z\",\"latitude\":24.67896476,\"longitude\":46.72984798}', '29-05-2022', '2022-05-29 09:24:21', '2022-05-29 09:24:21'),
(1513, 17, '{\"time\":\"2022-05-29T09:25:18.647Z\",\"latitude\":24.67896248,\"longitude\":46.72985185}', '29-05-2022', '2022-05-29 09:25:21', '2022-05-29 09:25:21'),
(1514, 17, '{\"time\":\"2022-05-29T09:26:18.565Z\",\"latitude\":24.67896075,\"longitude\":46.72985703}', '29-05-2022', '2022-05-29 09:26:21', '2022-05-29 09:26:21'),
(1515, 17, '{\"time\":\"2022-05-29T09:27:17.613Z\",\"latitude\":24.6789639,\"longitude\":46.72985708}', '29-05-2022', '2022-05-29 09:27:22', '2022-05-29 09:27:22'),
(1516, 17, '{\"time\":\"2022-05-29T09:28:17.584Z\",\"latitude\":24.67896284,\"longitude\":46.72985803}', '29-05-2022', '2022-05-29 09:28:20', '2022-05-29 09:28:20'),
(1517, 17, '{\"time\":\"2022-05-29T09:29:18.617Z\",\"latitude\":24.67896183,\"longitude\":46.72985742}', '29-05-2022', '2022-05-29 09:29:21', '2022-05-29 09:29:21'),
(1518, 17, '{\"time\":\"2022-05-29T09:30:17.593Z\",\"latitude\":24.67896392,\"longitude\":46.7298592}', '29-05-2022', '2022-05-29 09:30:20', '2022-05-29 09:30:20'),
(1519, 17, '{\"time\":\"2022-05-29T09:31:18.577Z\",\"latitude\":24.67896467,\"longitude\":46.72985936}', '29-05-2022', '2022-05-29 09:31:21', '2022-05-29 09:31:21'),
(1520, 17, '{\"time\":\"2022-05-29T09:32:17.560Z\",\"latitude\":24.67896365,\"longitude\":46.72986057}', '29-05-2022', '2022-05-29 09:32:20', '2022-05-29 09:32:20'),
(1521, 17, '{\"time\":\"2022-05-29T09:33:17.587Z\",\"latitude\":24.67895741,\"longitude\":46.72986065}', '29-05-2022', '2022-05-29 09:33:20', '2022-05-29 09:33:20'),
(1522, 17, '{\"time\":\"2022-05-29T09:34:17.616Z\",\"latitude\":24.67895838,\"longitude\":46.72986063}', '29-05-2022', '2022-05-29 09:34:20', '2022-05-29 09:34:20'),
(1523, 17, '{\"time\":\"2022-05-29T09:35:18.567Z\",\"latitude\":24.67895863,\"longitude\":46.72986045}', '29-05-2022', '2022-05-29 09:35:21', '2022-05-29 09:35:21'),
(1524, 17, '{\"time\":\"2022-05-29T09:36:19.595Z\",\"latitude\":24.67895473,\"longitude\":46.72985607}', '29-05-2022', '2022-05-29 09:36:22', '2022-05-29 09:36:22'),
(1525, 17, '{\"time\":\"2022-05-29T09:37:18.575Z\",\"latitude\":24.67895576,\"longitude\":46.72985763}', '29-05-2022', '2022-05-29 09:37:21', '2022-05-29 09:37:21'),
(1526, 17, '{\"time\":\"2022-05-29T09:38:18.585Z\",\"latitude\":24.67895791,\"longitude\":46.72985291}', '29-05-2022', '2022-05-29 09:38:21', '2022-05-29 09:38:21'),
(1527, 17, '{\"time\":\"2022-05-29T09:39:17.565Z\",\"latitude\":24.67895653,\"longitude\":46.72985267}', '29-05-2022', '2022-05-29 09:39:20', '2022-05-29 09:39:20'),
(1528, 17, '{\"time\":\"2022-05-29T09:40:17.602Z\",\"latitude\":24.67895593,\"longitude\":46.72985174}', '29-05-2022', '2022-05-29 09:40:20', '2022-05-29 09:40:20'),
(1529, 17, '{\"time\":\"2022-05-29T09:41:18.544Z\",\"latitude\":24.67895372,\"longitude\":46.72985485}', '29-05-2022', '2022-05-29 09:41:21', '2022-05-29 09:41:21'),
(1530, 17, '{\"time\":\"2022-05-29T09:42:18.548Z\",\"latitude\":24.67895125,\"longitude\":46.7298544}', '29-05-2022', '2022-05-29 09:42:21', '2022-05-29 09:42:21'),
(1531, 17, '{\"time\":\"2022-05-29T09:43:18.619Z\",\"latitude\":24.67895147,\"longitude\":46.72985427}', '29-05-2022', '2022-05-29 09:43:21', '2022-05-29 09:43:21'),
(1532, 17, '{\"time\":\"2022-05-29T09:44:19.593Z\",\"latitude\":24.67895056,\"longitude\":46.72985445}', '29-05-2022', '2022-05-29 09:44:22', '2022-05-29 09:44:22'),
(1533, 17, '{\"time\":\"2022-05-29T09:45:18.599Z\",\"latitude\":24.67895362,\"longitude\":46.7298549}', '29-05-2022', '2022-05-29 09:45:21', '2022-05-29 09:45:21'),
(1534, 17, '{\"time\":\"2022-05-29T09:46:19.596Z\",\"latitude\":24.67895395,\"longitude\":46.72985555}', '29-05-2022', '2022-05-29 09:46:22', '2022-05-29 09:46:22'),
(1535, 17, '{\"time\":\"2022-05-29T09:47:19.571Z\",\"latitude\":24.67895341,\"longitude\":46.72985608}', '29-05-2022', '2022-05-29 09:47:22', '2022-05-29 09:47:22'),
(1536, 17, '{\"time\":\"2022-05-29T09:48:19.570Z\",\"latitude\":24.67895302,\"longitude\":46.72985596}', '29-05-2022', '2022-05-29 09:48:22', '2022-05-29 09:48:22'),
(1537, 17, '{\"time\":\"2022-05-29T09:49:19.610Z\",\"latitude\":24.67895173,\"longitude\":46.72985584}', '29-05-2022', '2022-05-29 09:49:23', '2022-05-29 09:49:23'),
(1538, 17, '{\"time\":\"2022-05-29T09:50:21.572Z\",\"latitude\":24.67895174,\"longitude\":46.72985671}', '29-05-2022', '2022-05-29 09:50:24', '2022-05-29 09:50:24'),
(1539, 17, '{\"time\":\"2022-05-29T09:51:21.608Z\",\"latitude\":24.67895163,\"longitude\":46.72985593}', '29-05-2022', '2022-05-29 09:51:24', '2022-05-29 09:51:24'),
(1540, 17, '{\"time\":\"2022-05-29T09:52:18.581Z\",\"latitude\":24.67895093,\"longitude\":46.72985657}', '29-05-2022', '2022-05-29 09:52:21', '2022-05-29 09:52:21'),
(1541, 17, '{\"time\":\"2022-05-29T09:53:20.581Z\",\"latitude\":24.67894996,\"longitude\":46.7298586}', '29-05-2022', '2022-05-29 09:53:23', '2022-05-29 09:53:23'),
(1542, 17, '{\"time\":\"2022-05-29T10:38:01.517Z\",\"latitude\":24.67899985,\"longitude\":46.73001187}', '29-05-2022', '2022-05-29 10:38:05', '2022-05-29 10:38:05'),
(1543, 17, '{\"time\":\"2022-05-29T10:39:03.601Z\",\"latitude\":24.67875841,\"longitude\":46.72986319}', '29-05-2022', '2022-05-29 10:39:06', '2022-05-29 10:39:06'),
(1544, 17, '{\"time\":\"2022-05-29T10:40:05.601Z\",\"latitude\":24.67868751,\"longitude\":46.72999048}', '29-05-2022', '2022-05-29 10:40:08', '2022-05-29 10:40:08'),
(1545, 17, '{\"time\":\"2022-05-29T10:41:03.586Z\",\"latitude\":24.67889421,\"longitude\":46.72984226}', '29-05-2022', '2022-05-29 10:41:07', '2022-05-29 10:41:07'),
(1546, 17, '{\"time\":\"2022-05-29T10:43:04.579Z\",\"latitude\":24.67961306,\"longitude\":46.73349262}', '29-05-2022', '2022-05-29 10:43:08', '2022-05-29 10:43:08'),
(1547, 17, '{\"time\":\"2022-05-29T10:43:06.545Z\",\"latitude\":24.67965569,\"longitude\":46.73351116}', '29-05-2022', '2022-05-29 10:43:08', '2022-05-29 10:43:08'),
(1548, 17, '{\"time\":\"2022-05-29T10:44:07.578Z\",\"latitude\":24.68016179,\"longitude\":46.73369423}', '29-05-2022', '2022-05-29 10:44:10', '2022-05-29 10:44:10'),
(1549, 17, '{\"time\":\"2022-05-29T10:45:06.582Z\",\"latitude\":24.68015444,\"longitude\":46.73376337}', '29-05-2022', '2022-05-29 10:45:09', '2022-05-29 10:45:09'),
(1550, 17, '{\"time\":\"2022-05-29T10:46:07.591Z\",\"latitude\":24.68010012,\"longitude\":46.7336369}', '29-05-2022', '2022-05-29 10:46:10', '2022-05-29 10:46:10'),
(1551, 17, '{\"time\":\"2022-05-29T10:47:07.602Z\",\"latitude\":24.68002428,\"longitude\":46.73367915}', '29-05-2022', '2022-05-29 10:47:10', '2022-05-29 10:47:10'),
(1552, 17, '{\"time\":\"2022-05-29T10:48:07.605Z\",\"latitude\":24.6800429,\"longitude\":46.73371612}', '29-05-2022', '2022-05-29 10:48:10', '2022-05-29 10:48:10'),
(1553, 17, '{\"time\":\"2022-05-29T10:49:06.600Z\",\"latitude\":24.68004805,\"longitude\":46.73370911}', '29-05-2022', '2022-05-29 10:49:09', '2022-05-29 10:49:09'),
(1554, 17, '{\"time\":\"2022-05-29T10:50:07.586Z\",\"latitude\":24.6800707,\"longitude\":46.73370124}', '29-05-2022', '2022-05-29 10:50:10', '2022-05-29 10:50:10'),
(1555, 17, '{\"time\":\"2022-05-29T10:51:07.597Z\",\"latitude\":24.68006394,\"longitude\":46.73371184}', '29-05-2022', '2022-05-29 10:51:10', '2022-05-29 10:51:10'),
(1556, 17, '{\"time\":\"2022-05-29T10:52:07.615Z\",\"latitude\":24.68005945,\"longitude\":46.73371821}', '29-05-2022', '2022-05-29 10:52:10', '2022-05-29 10:52:10'),
(1557, 17, '{\"time\":\"2022-05-29T10:53:07.607Z\",\"latitude\":24.6800628,\"longitude\":46.73371331}', '29-05-2022', '2022-05-29 10:53:10', '2022-05-29 10:53:10'),
(1558, 17, '{\"time\":\"2022-05-29T10:54:07.582Z\",\"latitude\":24.68005647,\"longitude\":46.73371721}', '29-05-2022', '2022-05-29 10:54:10', '2022-05-29 10:54:10'),
(1559, 17, '{\"time\":\"2022-05-29T10:55:08.586Z\",\"latitude\":24.68004855,\"longitude\":46.73371618}', '29-05-2022', '2022-05-29 10:55:11', '2022-05-29 10:55:11'),
(1560, 17, '{\"time\":\"2022-05-29T10:56:07.604Z\",\"latitude\":24.68004991,\"longitude\":46.73371522}', '29-05-2022', '2022-05-29 10:56:10', '2022-05-29 10:56:10'),
(1561, 17, '{\"time\":\"2022-05-29T10:57:07.606Z\",\"latitude\":24.68005182,\"longitude\":46.73371614}', '29-05-2022', '2022-05-29 10:57:10', '2022-05-29 10:57:10'),
(1562, 17, '{\"time\":\"2022-05-29T10:58:06.570Z\",\"latitude\":24.68005083,\"longitude\":46.73371662}', '29-05-2022', '2022-05-29 10:58:09', '2022-05-29 10:58:09'),
(1563, 17, '{\"time\":\"2022-05-29T10:59:07.585Z\",\"latitude\":24.68005077,\"longitude\":46.73372547}', '29-05-2022', '2022-05-29 10:59:10', '2022-05-29 10:59:10'),
(1564, 17, '{\"time\":\"2022-05-29T11:00:07.580Z\",\"latitude\":24.68004941,\"longitude\":46.73372645}', '29-05-2022', '2022-05-29 11:00:10', '2022-05-29 11:00:10'),
(1565, 17, '{\"time\":\"2022-05-29T11:01:07.603Z\",\"latitude\":24.6800533,\"longitude\":46.73372838}', '29-05-2022', '2022-05-29 11:01:10', '2022-05-29 11:01:10'),
(1566, 17, '{\"time\":\"2022-05-29T11:02:07.564Z\",\"latitude\":24.6800507,\"longitude\":46.73372694}', '29-05-2022', '2022-05-29 11:02:10', '2022-05-29 11:02:10'),
(1567, 17, '{\"time\":\"2022-05-29T11:03:07.569Z\",\"latitude\":24.68005243,\"longitude\":46.73372693}', '29-05-2022', '2022-05-29 11:03:10', '2022-05-29 11:03:10'),
(1568, 17, '{\"time\":\"2022-05-29T11:04:06.580Z\",\"latitude\":24.68005579,\"longitude\":46.73371222}', '29-05-2022', '2022-05-29 11:04:09', '2022-05-29 11:04:09'),
(1569, 17, '{\"time\":\"2022-05-29T11:05:01.590Z\",\"latitude\":24.67977555,\"longitude\":46.73350424}', '29-05-2022', '2022-05-29 11:05:04', '2022-05-29 11:05:04'),
(1570, 17, '{\"time\":\"2022-05-29T11:05:57.586Z\",\"latitude\":24.67935126,\"longitude\":46.73179779}', '29-05-2022', '2022-05-29 11:06:00', '2022-05-29 11:06:00'),
(1571, 17, '{\"time\":\"2022-05-29T11:05:58.568Z\",\"latitude\":24.67933912,\"longitude\":46.73172604}', '29-05-2022', '2022-05-29 11:06:00', '2022-05-29 11:06:00'),
(1572, 17, '{\"time\":\"2022-05-29T11:06:54.603Z\",\"latitude\":24.67892009,\"longitude\":46.72977215}', '29-05-2022', '2022-05-29 11:06:57', '2022-05-29 11:06:57'),
(1573, 17, '{\"time\":\"2022-05-29T11:06:55.576Z\",\"latitude\":24.67892009,\"longitude\":46.72977215}', '29-05-2022', '2022-05-29 11:06:57', '2022-05-29 11:06:57'),
(1574, 17, '{\"time\":\"2022-05-29T11:08:22.572Z\",\"latitude\":24.67904625,\"longitude\":46.73008146}', '29-05-2022', '2022-05-29 11:08:25', '2022-05-29 11:08:25'),
(1575, 17, '{\"time\":\"2022-05-29T11:09:23.617Z\",\"latitude\":24.67916838,\"longitude\":46.72981216}', '29-05-2022', '2022-05-29 11:09:26', '2022-05-29 11:09:26'),
(1576, 17, '{\"time\":\"2022-05-29T11:10:23.617Z\",\"latitude\":24.67916727,\"longitude\":46.72988644}', '29-05-2022', '2022-05-29 11:10:26', '2022-05-29 11:10:26'),
(1577, 17, '{\"time\":\"2022-05-29T11:11:23.594Z\",\"latitude\":24.67914468,\"longitude\":46.72990218}', '29-05-2022', '2022-05-29 11:11:26', '2022-05-29 11:11:26'),
(1578, 17, '{\"time\":\"2022-05-29T11:12:23.562Z\",\"latitude\":24.67914936,\"longitude\":46.72992001}', '29-05-2022', '2022-05-29 11:12:26', '2022-05-29 11:12:26'),
(1579, 17, '{\"time\":\"2022-05-29T11:13:23.590Z\",\"latitude\":24.67914258,\"longitude\":46.72992643}', '29-05-2022', '2022-05-29 11:13:26', '2022-05-29 11:13:26'),
(1580, 17, '{\"time\":\"2022-05-29T11:14:25.588Z\",\"latitude\":24.67914486,\"longitude\":46.7299294}', '29-05-2022', '2022-05-29 11:14:29', '2022-05-29 11:14:29'),
(1581, 17, '{\"time\":\"2022-05-29T11:15:23.580Z\",\"latitude\":24.67914177,\"longitude\":46.72993371}', '29-05-2022', '2022-05-29 11:15:27', '2022-05-29 11:15:27'),
(1582, 17, '{\"time\":\"2022-05-29T11:16:24.598Z\",\"latitude\":24.67912993,\"longitude\":46.72993688}', '29-05-2022', '2022-05-29 11:16:27', '2022-05-29 11:16:27'),
(1583, 17, '{\"time\":\"2022-05-29T11:17:24.578Z\",\"latitude\":24.67912002,\"longitude\":46.72993012}', '29-05-2022', '2022-05-29 11:17:27', '2022-05-29 11:17:27'),
(1584, 17, '{\"time\":\"2022-05-29T11:18:24.589Z\",\"latitude\":24.67910485,\"longitude\":46.72993297}', '29-05-2022', '2022-05-29 11:18:27', '2022-05-29 11:18:27'),
(1585, 17, '{\"time\":\"2022-05-29T11:19:23.581Z\",\"latitude\":24.6790829,\"longitude\":46.72992155}', '29-05-2022', '2022-05-29 11:19:28', '2022-05-29 11:19:28'),
(1586, 17, '{\"time\":\"2022-05-29T11:20:23.592Z\",\"latitude\":24.6790665,\"longitude\":46.72991439}', '29-05-2022', '2022-05-29 11:20:26', '2022-05-29 11:20:26'),
(1587, 17, '{\"time\":\"2022-05-29T11:21:24.587Z\",\"latitude\":24.67904484,\"longitude\":46.7299088}', '29-05-2022', '2022-05-29 11:21:27', '2022-05-29 11:21:27'),
(1588, 17, '{\"time\":\"2022-05-29T11:22:24.585Z\",\"latitude\":24.67903794,\"longitude\":46.72991509}', '29-05-2022', '2022-05-29 11:22:27', '2022-05-29 11:22:27'),
(1589, 17, '{\"time\":\"2022-05-29T11:23:24.567Z\",\"latitude\":24.67903434,\"longitude\":46.72991481}', '29-05-2022', '2022-05-29 11:23:27', '2022-05-29 11:23:27'),
(1590, 17, '{\"time\":\"2022-05-29T11:24:28.610Z\",\"latitude\":24.67903354,\"longitude\":46.72991497}', '29-05-2022', '2022-05-29 11:24:31', '2022-05-29 11:24:31'),
(1591, 17, '{\"time\":\"2022-05-29T11:25:27.590Z\",\"latitude\":24.67903336,\"longitude\":46.72991657}', '29-05-2022', '2022-05-29 11:25:30', '2022-05-29 11:25:30'),
(1592, 17, '{\"time\":\"2022-05-29T11:26:24.594Z\",\"latitude\":24.67903669,\"longitude\":46.72992012}', '29-05-2022', '2022-05-29 11:26:27', '2022-05-29 11:26:27'),
(1593, 17, '{\"time\":\"2022-05-29T11:27:25.570Z\",\"latitude\":24.67903567,\"longitude\":46.72991909}', '29-05-2022', '2022-05-29 11:27:28', '2022-05-29 11:27:28'),
(1594, 17, '{\"time\":\"2022-05-29T11:28:25.597Z\",\"latitude\":24.67903827,\"longitude\":46.72992001}', '29-05-2022', '2022-05-29 11:28:29', '2022-05-29 11:28:29'),
(1595, 17, '{\"time\":\"2022-05-29T11:29:23.573Z\",\"latitude\":24.6790352,\"longitude\":46.72992149}', '29-05-2022', '2022-05-29 11:29:26', '2022-05-29 11:29:26'),
(1596, 17, '{\"time\":\"2022-05-29T11:30:23.571Z\",\"latitude\":24.67903427,\"longitude\":46.72991856}', '29-05-2022', '2022-05-29 11:30:26', '2022-05-29 11:30:26'),
(1597, 17, '{\"time\":\"2022-05-29T11:31:25.574Z\",\"latitude\":24.67902762,\"longitude\":46.72991711}', '29-05-2022', '2022-05-29 11:31:28', '2022-05-29 11:31:28'),
(1598, 17, '{\"time\":\"2022-05-29T11:32:24.581Z\",\"latitude\":24.67902781,\"longitude\":46.72991327}', '29-05-2022', '2022-05-29 11:32:27', '2022-05-29 11:32:27'),
(1599, 17, '{\"time\":\"2022-05-29T11:33:24.585Z\",\"latitude\":24.67902605,\"longitude\":46.72991358}', '29-05-2022', '2022-05-29 11:33:27', '2022-05-29 11:33:27'),
(1600, 17, '{\"time\":\"2022-05-29T11:34:24.616Z\",\"latitude\":24.6790247,\"longitude\":46.72991553}', '29-05-2022', '2022-05-29 11:34:27', '2022-05-29 11:34:27'),
(1601, 17, '{\"time\":\"2022-05-29T11:35:23.599Z\",\"latitude\":24.67902666,\"longitude\":46.72991473}', '29-05-2022', '2022-05-29 11:35:26', '2022-05-29 11:35:26'),
(1602, 17, '{\"time\":\"2022-05-29T11:36:23.558Z\",\"latitude\":24.67902492,\"longitude\":46.72991126}', '29-05-2022', '2022-05-29 11:36:26', '2022-05-29 11:36:26'),
(1603, 17, '{\"time\":\"2022-05-29T11:37:22.588Z\",\"latitude\":24.67902373,\"longitude\":46.72990805}', '29-05-2022', '2022-05-29 11:37:25', '2022-05-29 11:37:25'),
(1604, 17, '{\"time\":\"2022-05-29T11:38:23.591Z\",\"latitude\":24.67902351,\"longitude\":46.72990506}', '29-05-2022', '2022-05-29 11:38:26', '2022-05-29 11:38:26'),
(1605, 17, '{\"time\":\"2022-05-29T11:39:23.579Z\",\"latitude\":24.67902239,\"longitude\":46.72990065}', '29-05-2022', '2022-05-29 11:39:26', '2022-05-29 11:39:26'),
(1606, 17, '{\"time\":\"2022-05-29T11:40:23.620Z\",\"latitude\":24.67902287,\"longitude\":46.7298973}', '29-05-2022', '2022-05-29 11:40:26', '2022-05-29 11:40:26'),
(1607, 17, '{\"time\":\"2022-05-29T11:41:23.585Z\",\"latitude\":24.67902218,\"longitude\":46.72989244}', '29-05-2022', '2022-05-29 11:41:26', '2022-05-29 11:41:26'),
(1608, 17, '{\"time\":\"2022-05-29T12:37:18.541Z\",\"latitude\":24.67909376,\"longitude\":46.73002746}', '29-05-2022', '2022-05-29 12:37:21', '2022-05-29 12:37:21'),
(1609, 17, '{\"time\":\"2022-05-29T12:38:18.530Z\",\"latitude\":24.67903792,\"longitude\":46.73004862}', '29-05-2022', '2022-05-29 12:38:20', '2022-05-29 12:38:20'),
(1610, 17, '{\"time\":\"2022-05-29T13:58:45.563Z\",\"latitude\":24.67887484,\"longitude\":46.72980974}', '29-05-2022', '2022-05-29 13:58:48', '2022-05-29 13:58:48'),
(1611, 17, '{\"time\":\"2022-05-29T13:58:48.780Z\",\"latitude\":24.67887189,\"longitude\":46.72990115}', '29-05-2022', '2022-05-29 13:58:50', '2022-05-29 13:58:50'),
(1612, 17, '{\"time\":\"2022-05-29T13:58:50.679Z\",\"latitude\":24.67883581,\"longitude\":46.72987665}', '29-05-2022', '2022-05-29 13:58:52', '2022-05-29 13:58:52'),
(1613, 32, '{\"time\":\"2022-05-30T05:40:30.369Z\",\"latitude\":24.679014,\"longitude\":46.7299175}', '30-05-2022', '2022-05-30 05:40:31', '2022-05-30 05:40:31'),
(1614, 32, '{\"time\":\"2022-05-30T05:41:02.834Z\",\"latitude\":24.678963333333332,\"longitude\":46.72991999999999}', '30-05-2022', '2022-05-30 05:41:04', '2022-05-30 05:41:04'),
(1615, 32, '{\"time\":\"2022-05-30T05:44:08.939Z\",\"latitude\":24.677981666666664,\"longitude\":46.72904833333334}', '30-05-2022', '2022-05-30 05:44:10', '2022-05-30 05:44:10'),
(1616, 32, '{\"time\":\"2022-05-30T05:44:11.793Z\",\"latitude\":24.677935,\"longitude\":46.729031666666664}', '30-05-2022', '2022-05-30 05:44:12', '2022-05-30 05:44:12'),
(1617, 2, '{\"time\":\"2022-05-30T07:10:47.408Z\",\"latitude\":24.6992668,\"longitude\":46.7075156}', '30-05-2022', '2022-05-30 07:10:47', '2022-05-30 07:10:47'),
(1618, 32, '{\"time\":\"2022-05-30T07:43:47.140Z\",\"latitude\":24.6790194,\"longitude\":46.7299229}', '30-05-2022', '2022-05-30 07:43:47', '2022-05-30 07:43:47'),
(1619, 32, '{\"time\":\"2022-05-30T07:44:06.642Z\",\"latitude\":24.679018333333335,\"longitude\":46.729915}', '30-05-2022', '2022-05-30 07:44:08', '2022-05-30 07:44:08'),
(1620, 32, '{\"time\":\"2022-05-30T07:45:51.649Z\",\"latitude\":24.679044999999995,\"longitude\":46.72984666666666}', '30-05-2022', '2022-05-30 07:45:53', '2022-05-30 07:45:53'),
(1621, 32, '{\"time\":\"2022-05-30T07:47:24.452Z\",\"latitude\":24.679028333333335,\"longitude\":46.729850000000006}', '30-05-2022', '2022-05-30 07:47:25', '2022-05-30 07:47:25'),
(1622, 32, '{\"time\":\"2022-05-30T07:49:09.903Z\",\"latitude\":24.679073333333335,\"longitude\":46.729908333333334}', '30-05-2022', '2022-05-30 07:49:11', '2022-05-30 07:49:11'),
(1623, 32, '{\"time\":\"2022-05-30T07:51:04.917Z\",\"latitude\":24.679471666666668,\"longitude\":46.73015}', '30-05-2022', '2022-05-30 07:51:06', '2022-05-30 07:51:06'),
(1624, 32, '{\"time\":\"2022-05-30T07:52:24.171Z\",\"latitude\":24.679430000000004,\"longitude\":46.73012333333333}', '30-05-2022', '2022-05-30 07:52:25', '2022-05-30 07:52:25'),
(1625, 32, '{\"time\":\"2022-05-30T07:53:27.397Z\",\"latitude\":24.679179999999995,\"longitude\":46.73001333333333}', '30-05-2022', '2022-05-30 07:53:28', '2022-05-30 07:53:28'),
(1626, 32, '{\"time\":\"2022-05-30T07:54:53.377Z\",\"latitude\":24.679033333333336,\"longitude\":46.729941666666676}', '30-05-2022', '2022-05-30 07:54:54', '2022-05-30 07:54:54'),
(1627, 32, '{\"time\":\"2022-05-30T07:56:26.060Z\",\"latitude\":24.679033333333336,\"longitude\":46.72991999999999}', '30-05-2022', '2022-05-30 07:56:27', '2022-05-30 07:56:27'),
(1628, 32, '{\"time\":\"2022-05-30T07:57:50.371Z\",\"latitude\":24.679029999999997,\"longitude\":46.729929999999996}', '30-05-2022', '2022-05-30 07:57:51', '2022-05-30 07:57:51'),
(1629, 32, '{\"time\":\"2022-05-30T07:58:56.770Z\",\"latitude\":24.679021666666667,\"longitude\":46.729925}', '30-05-2022', '2022-05-30 07:58:58', '2022-05-30 07:58:58'),
(1630, 32, '{\"time\":\"2022-05-30T08:00:27.622Z\",\"latitude\":24.679146666666664,\"longitude\":46.72996}', '30-05-2022', '2022-05-30 08:00:29', '2022-05-30 08:00:29'),
(1631, 32, '{\"time\":\"2022-05-30T08:01:51.368Z\",\"latitude\":24.679146666666664,\"longitude\":46.72996499999999}', '30-05-2022', '2022-05-30 08:01:52', '2022-05-30 08:01:52'),
(1632, 32, '{\"time\":\"2022-05-30T08:03:42.528Z\",\"latitude\":24.678986666666667,\"longitude\":46.72992666666667}', '30-05-2022', '2022-05-30 08:03:43', '2022-05-30 08:03:43'),
(1633, 32, '{\"time\":\"2022-05-30T08:06:14.227Z\",\"latitude\":24.67896,\"longitude\":46.72997}', '30-05-2022', '2022-05-30 08:06:16', '2022-05-30 08:06:16'),
(1634, 32, '{\"time\":\"2022-05-30T08:08:55.402Z\",\"latitude\":24.678974999999998,\"longitude\":46.729978333333335}', '30-05-2022', '2022-05-30 08:08:57', '2022-05-30 08:08:57'),
(1635, 32, '{\"time\":\"2022-05-30T08:10:06.739Z\",\"latitude\":24.679066666666667,\"longitude\":46.729886666666665}', '30-05-2022', '2022-05-30 08:10:08', '2022-05-30 08:10:08'),
(1636, 32, '{\"time\":\"2022-05-30T08:13:28.093Z\",\"latitude\":24.679095,\"longitude\":46.72987499999999}', '30-05-2022', '2022-05-30 08:13:30', '2022-05-30 08:13:30'),
(1637, 17, '{\"time\":\"2022-05-30T09:26:24.570Z\",\"latitude\":24.67888711,\"longitude\":46.72982486}', '30-05-2022', '2022-05-30 09:26:26', '2022-05-30 09:26:26'),
(1638, 17, '{\"time\":\"2022-05-30T09:26:26.555Z\",\"latitude\":24.67891495,\"longitude\":46.72986679}', '30-05-2022', '2022-05-30 09:26:28', '2022-05-30 09:26:28'),
(1639, 17, '{\"time\":\"2022-05-30T11:13:00.081Z\",\"latitude\":24.6555781,\"longitude\":46.7199064}', '30-05-2022', '2022-05-30 11:13:01', '2022-05-30 11:13:01'),
(1640, 17, '{\"time\":\"2022-05-30T11:13:02.543Z\",\"latitude\":24.65574317,\"longitude\":46.71985312}', '30-05-2022', '2022-05-30 11:13:04', '2022-05-30 11:13:04'),
(1641, 17, '{\"time\":\"2022-05-30T11:14:19.541Z\",\"latitude\":24.65612855,\"longitude\":46.719952}', '30-05-2022', '2022-05-30 11:14:22', '2022-05-30 11:14:22'),
(1642, 17, '{\"time\":\"2022-05-30T11:16:01.549Z\",\"latitude\":24.65565563,\"longitude\":46.72070792}', '30-05-2022', '2022-05-30 11:16:04', '2022-05-30 11:16:04'),
(1643, 17, '{\"time\":\"2022-05-30T11:17:01.585Z\",\"latitude\":24.6545601,\"longitude\":46.72255868}', '30-05-2022', '2022-05-30 11:17:04', '2022-05-30 11:17:04'),
(1644, 17, '{\"time\":\"2022-05-30T11:17:03.570Z\",\"latitude\":24.65455535,\"longitude\":46.72271572}', '30-05-2022', '2022-05-30 11:17:05', '2022-05-30 11:17:05'),
(1645, 17, '{\"time\":\"2022-05-30T11:18:03.598Z\",\"latitude\":24.65411201,\"longitude\":46.72571843}', '30-05-2022', '2022-05-30 11:18:06', '2022-05-30 11:18:06'),
(1646, 17, '{\"time\":\"2022-05-30T11:18:05.558Z\",\"latitude\":24.65415325,\"longitude\":46.72572841}', '30-05-2022', '2022-05-30 11:18:07', '2022-05-30 11:18:07'),
(1647, 17, '{\"time\":\"2022-05-30T11:19:05.548Z\",\"latitude\":24.65418134,\"longitude\":46.72569783}', '30-05-2022', '2022-05-30 11:19:08', '2022-05-30 11:19:08'),
(1648, 17, '{\"time\":\"2022-05-30T11:19:18.534Z\",\"latitude\":24.65418942,\"longitude\":46.72570891}', '30-05-2022', '2022-05-30 11:19:20', '2022-05-30 11:19:20'),
(1649, 17, '{\"time\":\"2022-05-30T11:19:20.545Z\",\"latitude\":24.65419303,\"longitude\":46.72571954}', '30-05-2022', '2022-05-30 11:19:22', '2022-05-30 11:19:22'),
(1650, 17, '{\"time\":\"2022-05-30T11:20:20.538Z\",\"latitude\":24.65419267,\"longitude\":46.72571048}', '30-05-2022', '2022-05-30 11:20:23', '2022-05-30 11:20:23'),
(1651, 33, '{\"time\":\"2022-05-30T12:23:28.648Z\",\"latitude\":26.2825282,\"longitude\":50.2163845}', '30-05-2022', '2022-05-30 12:23:29', '2022-05-30 12:23:29'),
(1652, 33, '{\"time\":\"2022-05-30T12:23:58.346Z\",\"latitude\":26.283043292351067,\"longitude\":50.21660710684955}', '30-05-2022', '2022-05-30 12:24:00', '2022-05-30 12:24:00'),
(1653, 33, '{\"time\":\"2022-05-30T12:25:28.355Z\",\"latitude\":26.282196468673646,\"longitude\":50.21447768434882}', '30-05-2022', '2022-05-30 12:25:30', '2022-05-30 12:25:30'),
(1654, 33, '{\"time\":\"2022-05-30T12:27:22.382Z\",\"latitude\":26.282041277736425,\"longitude\":50.215524500235915}', '30-05-2022', '2022-05-30 12:27:24', '2022-05-30 12:27:24'),
(1655, 33, '{\"time\":\"2022-05-30T12:31:32.424Z\",\"latitude\":26.282552699558437,\"longitude\":50.216858983039856}', '30-05-2022', '2022-05-30 12:31:34', '2022-05-30 12:31:34'),
(1656, 33, '{\"time\":\"2022-05-30T12:31:52.406Z\",\"latitude\":26.282034614123404,\"longitude\":50.21605717018247}', '30-05-2022', '2022-05-30 12:31:54', '2022-05-30 12:31:54'),
(1657, 33, '{\"time\":\"2022-05-30T12:40:49.454Z\",\"latitude\":26.282801474444568,\"longitude\":50.216571651399136}', '30-05-2022', '2022-05-30 12:40:51', '2022-05-30 12:40:51'),
(1658, 33, '{\"time\":\"2022-05-30T12:54:37.549Z\",\"latitude\":26.28219755832106,\"longitude\":50.21637802943587}', '30-05-2022', '2022-05-30 12:54:40', '2022-05-30 12:54:40'),
(1659, 33, '{\"time\":\"2022-05-30T12:55:11.517Z\",\"latitude\":26.283080633729696,\"longitude\":50.21580361761153}', '30-05-2022', '2022-05-30 12:55:13', '2022-05-30 12:55:13'),
(1660, 33, '{\"time\":\"2022-05-30T12:56:10.446Z\",\"latitude\":26.282437448389828,\"longitude\":50.2161970641464}', '30-05-2022', '2022-05-30 12:56:12', '2022-05-30 12:56:12'),
(1661, 33, '{\"time\":\"2022-05-30T13:07:52.475Z\",\"latitude\":26.282158372923732,\"longitude\":50.21586824208498}', '30-05-2022', '2022-05-30 13:07:55', '2022-05-30 13:07:55'),
(1662, 33, '{\"time\":\"2022-05-30T13:09:08.476Z\",\"latitude\":26.28233250696212,\"longitude\":50.216308794915676}', '30-05-2022', '2022-05-30 13:09:10', '2022-05-30 13:09:10'),
(1663, 33, '{\"time\":\"2022-05-30T13:19:26.506Z\",\"latitude\":26.28283018246293,\"longitude\":50.215969579294324}', '30-05-2022', '2022-05-30 13:19:29', '2022-05-30 13:19:29'),
(1664, 33, '{\"time\":\"2022-05-30T13:39:47.452Z\",\"latitude\":26.28240291494876,\"longitude\":50.21608281880617}', '30-05-2022', '2022-05-30 13:39:49', '2022-05-30 13:39:49'),
(1665, 33, '{\"time\":\"2022-05-30T13:44:45.603Z\",\"latitude\":26.281962948851287,\"longitude\":50.21551067009568}', '30-05-2022', '2022-05-30 13:44:47', '2022-05-30 13:44:47'),
(1666, 33, '{\"time\":\"2022-05-30T13:45:53.547Z\",\"latitude\":26.282607852481306,\"longitude\":50.21625079214573}', '30-05-2022', '2022-05-30 13:45:55', '2022-05-30 13:45:55'),
(1667, 33, '{\"time\":\"2022-05-30T13:46:08.108Z\",\"latitude\":26.28302020020783,\"longitude\":50.21612581796944}', '30-05-2022', '2022-05-30 13:46:09', '2022-05-30 13:46:09'),
(1668, 33, '{\"time\":\"2022-05-30T13:49:32.472Z\",\"latitude\":26.28246313892305,\"longitude\":50.21625288762152}', '30-05-2022', '2022-05-30 13:49:36', '2022-05-30 13:49:36'),
(1669, 33, '{\"time\":\"2022-05-30T13:51:02.511Z\",\"latitude\":26.28208331298083,\"longitude\":50.21637752652168}', '30-05-2022', '2022-05-30 13:51:04', '2022-05-30 13:51:04'),
(1670, 33, '{\"time\":\"2022-05-30T13:52:16.477Z\",\"latitude\":26.282727965153754,\"longitude\":50.21651322953403}', '30-05-2022', '2022-05-30 13:52:18', '2022-05-30 13:52:18'),
(1671, 33, '{\"time\":\"2022-05-30T13:54:01.533Z\",\"latitude\":26.282702526077628,\"longitude\":50.21641440689564}', '30-05-2022', '2022-05-30 13:54:03', '2022-05-30 13:54:03'),
(1672, 33, '{\"time\":\"2022-05-30T13:55:42.860Z\",\"latitude\":26.28283789381385,\"longitude\":50.21651331335306}', '30-05-2022', '2022-05-30 13:55:44', '2022-05-30 13:55:44'),
(1673, 33, '{\"time\":\"2022-05-30T13:56:51.573Z\",\"latitude\":26.282761325128376,\"longitude\":50.21645690314472}', '30-05-2022', '2022-05-30 13:56:53', '2022-05-30 13:56:53'),
(1674, 33, '{\"time\":\"2022-05-30T13:57:54.868Z\",\"latitude\":26.282662209123373,\"longitude\":50.2165699750185}', '30-05-2022', '2022-05-30 13:57:56', '2022-05-30 13:57:56'),
(1675, 33, '{\"time\":\"2022-05-30T13:59:31.061Z\",\"latitude\":26.28241670317948,\"longitude\":50.21679125726223}', '30-05-2022', '2022-05-30 13:59:35', '2022-05-30 13:59:35'),
(1676, 33, '{\"time\":\"2022-05-30T14:00:44.541Z\",\"latitude\":26.283068605698645,\"longitude\":50.21662118844688}', '30-05-2022', '2022-05-30 14:00:46', '2022-05-30 14:00:46'),
(1678, 2, '{\"time\":\"2022-06-08T06:37:59.166Z\",\"latitude\":37.33454218,\"longitude\":-122.03638578}', '08-06-2022', '2022-06-08 06:37:59', '2022-06-08 06:37:59'),
(1679, 2, '{\"time\":\"2022-06-08T06:38:21.166Z\",\"latitude\":37.33446146,\"longitude\":-122.04380955}', '08-06-2022', '2022-06-08 06:38:21', '2022-06-08 06:38:21'),
(1680, 2, '{\"time\":\"2022-06-08T06:38:52.074Z\",\"latitude\":37.33268517,\"longitude\":-122.05498531}', '08-06-2022', '2022-06-08 06:38:52', '2022-06-08 06:38:52'),
(1681, 2, '{\"time\":\"2022-06-08T06:39:23.169Z\",\"latitude\":37.33435409,\"longitude\":-122.06636961}', '08-06-2022', '2022-06-08 06:39:23', '2022-06-08 06:39:23'),
(1682, 2, '{\"time\":\"2022-06-08T06:39:54.156Z\",\"latitude\":37.33392322,\"longitude\":-122.07769942}', '08-06-2022', '2022-06-08 06:39:54', '2022-06-08 06:39:54'),
(1683, 2, '{\"time\":\"2022-06-08T06:40:22.074Z\",\"latitude\":37.3389669,\"longitude\":-122.08608946}', '08-06-2022', '2022-06-08 06:40:22', '2022-06-08 06:40:22'),
(1684, 2, '{\"time\":\"2022-06-08T06:40:54.139Z\",\"latitude\":37.34472464,\"longitude\":-122.09516438}', '08-06-2022', '2022-06-08 06:40:54', '2022-06-08 06:40:54'),
(1685, 2, '{\"time\":\"2022-06-08T06:41:22.073Z\",\"latitude\":37.34918436,\"longitude\":-122.10389589}', '08-06-2022', '2022-06-08 06:41:22', '2022-06-08 06:41:22'),
(1686, 2, '{\"time\":\"2022-06-08T06:41:54.149Z\",\"latitude\":37.35504792,\"longitude\":-122.11248818}', '08-06-2022', '2022-06-08 06:41:54', '2022-06-08 06:41:54'),
(1687, 2, '{\"time\":\"2022-06-08T06:42:26.160Z\",\"latitude\":37.36181958,\"longitude\":-122.1204183}', '08-06-2022', '2022-06-08 06:42:26', '2022-06-08 06:42:26'),
(1688, 2, '{\"time\":\"2022-06-08T06:42:58.102Z\",\"latitude\":37.36513495,\"longitude\":-122.13112023}', '08-06-2022', '2022-06-08 06:42:58', '2022-06-08 06:42:58'),
(1689, 2, '{\"time\":\"2022-06-08T06:54:30.096Z\",\"latitude\":11.315930834981694,\"longitude\":75.99800887524708}', '08-06-2022', '2022-06-08 06:54:30', '2022-06-08 06:54:30'),
(1690, 2, '{\"time\":\"2022-06-08T06:54:34.025Z\",\"latitude\":11.315930834981694,\"longitude\":75.99800887524708}', '08-06-2022', '2022-06-08 06:54:34', '2022-06-08 06:54:34'),
(1691, 2, '{\"time\":\"2022-06-08T06:54:35.030Z\",\"latitude\":11.315930834981694,\"longitude\":75.99800887524708}', '08-06-2022', '2022-06-08 06:54:35', '2022-06-08 06:54:35'),
(1692, 2, '{\"time\":\"2022-06-08T06:54:36.029Z\",\"latitude\":11.315930834981694,\"longitude\":75.99800887524708}', '08-06-2022', '2022-06-08 06:54:36', '2022-06-08 06:54:36'),
(1693, 2, '{\"time\":\"2022-06-08T06:54:37.033Z\",\"latitude\":11.315930834981694,\"longitude\":75.99800887524708}', '08-06-2022', '2022-06-08 06:54:37', '2022-06-08 06:54:37'),
(1694, 2, '{\"time\":\"2022-06-08T06:54:39.032Z\",\"latitude\":11.315930834981694,\"longitude\":75.99800887524708}', '08-06-2022', '2022-06-08 06:54:39', '2022-06-08 06:54:39'),
(1695, 2, '{\"time\":\"2022-06-08T07:54:04.025Z\",\"latitude\":11.317016583965378,\"longitude\":75.99752122225281}', '08-06-2022', '2022-06-08 07:54:04', '2022-06-08 07:54:04'),
(1696, 2, '{\"time\":\"2022-06-08T07:54:05.028Z\",\"latitude\":11.317016583965378,\"longitude\":75.99752122225281}', '08-06-2022', '2022-06-08 07:54:05', '2022-06-08 07:54:05'),
(1697, 2, '{\"time\":\"2022-06-08T07:54:06.027Z\",\"latitude\":11.317016583965378,\"longitude\":75.99752122225281}', '08-06-2022', '2022-06-08 07:54:06', '2022-06-08 07:54:06'),
(1698, 2, '{\"time\":\"2022-06-08T07:54:07.032Z\",\"latitude\":11.317016583965378,\"longitude\":75.99752122225281}', '08-06-2022', '2022-06-08 07:54:07', '2022-06-08 07:54:07'),
(1699, 2, '{\"time\":\"2022-06-08T07:54:08.037Z\",\"latitude\":11.317016583965378,\"longitude\":75.99752122225281}', '08-06-2022', '2022-06-08 07:54:08', '2022-06-08 07:54:08'),
(1700, 2, '{\"time\":\"2022-06-08T07:54:09.037Z\",\"latitude\":11.317016583965378,\"longitude\":75.99752122225281}', '08-06-2022', '2022-06-08 07:54:09', '2022-06-08 07:54:09'),
(1701, 2, '{\"time\":\"2022-06-08T07:54:10.037Z\",\"latitude\":11.317054675945032,\"longitude\":75.9975359205275}', '08-06-2022', '2022-06-08 07:54:10', '2022-06-08 07:54:10'),
(1702, 2, '{\"time\":\"2022-06-08T07:54:11.943Z\",\"latitude\":11.31705366280755,\"longitude\":75.99753656697627}', '08-06-2022', '2022-06-08 07:54:12', '2022-06-08 07:54:12'),
(1703, 2, '{\"time\":\"2022-06-08T07:54:12.036Z\",\"latitude\":11.317047392210435,\"longitude\":75.9975391571016}', '08-06-2022', '2022-06-08 07:54:12', '2022-06-08 07:54:12'),
(1704, 2, '{\"time\":\"2022-06-08T07:54:16.040Z\",\"latitude\":11.31703363065387,\"longitude\":75.99754143802801}', '08-06-2022', '2022-06-08 07:54:16', '2022-06-08 07:54:16'),
(1705, 2, '{\"time\":\"2022-06-08T07:54:17.038Z\",\"latitude\":11.317033656615633,\"longitude\":75.99754151082998}', '08-06-2022', '2022-06-08 07:54:17', '2022-06-08 07:54:17'),
(1706, 2, '{\"time\":\"2022-06-08T07:54:19.031Z\",\"latitude\":11.317033656615633,\"longitude\":75.99754151082998}', '08-06-2022', '2022-06-08 07:54:19', '2022-06-08 07:54:19'),
(1707, 2, '{\"time\":\"2022-06-08T07:54:21.044Z\",\"latitude\":11.317048636302031,\"longitude\":75.99757608500926}', '08-06-2022', '2022-06-08 07:54:21', '2022-06-08 07:54:21'),
(1708, 2, '{\"time\":\"2022-06-08T07:54:22.241Z\",\"latitude\":11.317024105487164,\"longitude\":75.99761608846036}', '08-06-2022', '2022-06-08 07:54:22', '2022-06-08 07:54:22'),
(1709, 2, '{\"time\":\"2022-06-08T07:54:24.040Z\",\"latitude\":11.317008804539684,\"longitude\":75.99761916606836}', '08-06-2022', '2022-06-08 07:54:24', '2022-06-08 07:54:24'),
(1710, 2, '{\"time\":\"2022-06-08T07:54:25.042Z\",\"latitude\":11.317017565582512,\"longitude\":75.99763488125312}', '08-06-2022', '2022-06-08 07:54:25', '2022-06-08 07:54:25'),
(1711, 2, '{\"time\":\"2022-06-08T07:54:26.041Z\",\"latitude\":11.317128083860858,\"longitude\":75.99759722457748}', '08-06-2022', '2022-06-08 07:54:26', '2022-06-08 07:54:26'),
(1712, 2, '{\"time\":\"2022-06-08T07:54:27.039Z\",\"latitude\":11.31714638909936,\"longitude\":75.99756840940125}', '08-06-2022', '2022-06-08 07:54:27', '2022-06-08 07:54:27'),
(1713, 2, '{\"time\":\"2022-06-08T07:54:28.033Z\",\"latitude\":11.31714086829991,\"longitude\":75.99756926844037}', '08-06-2022', '2022-06-08 07:54:28', '2022-06-08 07:54:28'),
(1714, 2, '{\"time\":\"2022-06-08T07:54:29.043Z\",\"latitude\":11.317152744366455,\"longitude\":75.99756665876396}', '08-06-2022', '2022-06-08 07:54:29', '2022-06-08 07:54:29'),
(1715, 2, '{\"time\":\"2022-06-08T07:54:30.031Z\",\"latitude\":11.31714926871442,\"longitude\":75.99756571477093}', '08-06-2022', '2022-06-08 07:54:30', '2022-06-08 07:54:30'),
(1716, 2, '{\"time\":\"2022-06-08T07:54:31.038Z\",\"latitude\":11.31715044849042,\"longitude\":75.997568546456}', '08-06-2022', '2022-06-08 07:54:31', '2022-06-08 07:54:31'),
(1717, 2, '{\"time\":\"2022-06-08T07:54:32.042Z\",\"latitude\":11.317148643076695,\"longitude\":75.99757324921656}', '08-06-2022', '2022-06-08 07:54:32', '2022-06-08 07:54:32'),
(1718, 2, '{\"time\":\"2022-06-08T07:54:33.033Z\",\"latitude\":11.31714468239624,\"longitude\":75.99757747180715}', '08-06-2022', '2022-06-08 07:54:33', '2022-06-08 07:54:33'),
(1719, 2, '{\"time\":\"2022-06-08T07:54:34.035Z\",\"latitude\":11.317139015606273,\"longitude\":75.99758496383207}', '08-06-2022', '2022-06-08 07:54:34', '2022-06-08 07:54:34'),
(1720, 2, '{\"time\":\"2022-06-08T07:54:50.046Z\",\"latitude\":11.31715839291966,\"longitude\":75.99758159703937}', '08-06-2022', '2022-06-08 07:54:50', '2022-06-08 07:54:50'),
(1721, 2, '{\"time\":\"2022-06-08T07:54:51.035Z\",\"latitude\":11.317156633697316,\"longitude\":75.99758260770876}', '08-06-2022', '2022-06-08 07:54:51', '2022-06-08 07:54:51'),
(1722, 2, '{\"time\":\"2022-06-08T07:54:52.040Z\",\"latitude\":11.317163452523134,\"longitude\":75.99757429374384}', '08-06-2022', '2022-06-08 07:54:52', '2022-06-08 07:54:52'),
(1723, 2, '{\"time\":\"2022-06-08T07:54:53.027Z\",\"latitude\":11.317161094169593,\"longitude\":75.9975607344511}', '08-06-2022', '2022-06-08 07:54:53', '2022-06-08 07:54:53'),
(1724, 2, '{\"time\":\"2022-06-08T07:54:54.038Z\",\"latitude\":11.317160963437988,\"longitude\":75.9975668584052}', '08-06-2022', '2022-06-08 07:54:54', '2022-06-08 07:54:54'),
(1725, 2, '{\"time\":\"2022-06-08T07:54:55.039Z\",\"latitude\":11.317146340096373,\"longitude\":75.99758092041112}', '08-06-2022', '2022-06-08 07:54:55', '2022-06-08 07:54:55'),
(1726, 2, '{\"time\":\"2022-06-08T07:54:56.033Z\",\"latitude\":11.3171506987173,\"longitude\":75.99759216331512}', '08-06-2022', '2022-06-08 07:54:56', '2022-06-08 07:54:56'),
(1727, 2, '{\"time\":\"2022-06-08T07:54:57.039Z\",\"latitude\":11.317143107753283,\"longitude\":75.99759468925099}', '08-06-2022', '2022-06-08 07:54:57', '2022-06-08 07:54:57'),
(1728, 2, '{\"time\":\"2022-06-08T07:54:58.032Z\",\"latitude\":11.317130266123096,\"longitude\":75.99759796998148}', '08-06-2022', '2022-06-08 07:54:58', '2022-06-08 07:54:58'),
(1729, 2, '{\"time\":\"2022-06-08T07:54:59.030Z\",\"latitude\":11.317115698685143,\"longitude\":75.99760834095419}', '08-06-2022', '2022-06-08 07:54:59', '2022-06-08 07:54:59'),
(1730, 2, '{\"time\":\"2022-06-08T07:55:00.027Z\",\"latitude\":11.31709906081173,\"longitude\":75.99762937205136}', '08-06-2022', '2022-06-08 07:55:00', '2022-06-08 07:55:00'),
(1731, 2, '{\"time\":\"2022-06-08T07:55:01.035Z\",\"latitude\":11.317097435514787,\"longitude\":75.99763278316122}', '08-06-2022', '2022-06-08 07:55:01', '2022-06-08 07:55:01'),
(1732, 5, '{\"time\":\"2022-06-08T10:48:19.093Z\",\"latitude\":24.752003558218483,\"longitude\":46.63078968521218}', '08-06-2022', '2022-06-08 10:48:20', '2022-06-08 10:48:20'),
(1733, 5, '{\"time\":\"2022-06-08T10:48:17.900Z\",\"latitude\":24.752016441734728,\"longitude\":46.630781809142775}', '08-06-2022', '2022-06-08 10:48:20', '2022-06-08 10:48:20'),
(1734, 5, '{\"time\":\"2022-06-08T10:48:41.458Z\",\"latitude\":24.75195492239212,\"longitude\":46.630848632879676}', '08-06-2022', '2022-06-08 10:48:42', '2022-06-08 10:48:42'),
(1735, 5, '{\"time\":\"2022-06-08T10:48:42.681Z\",\"latitude\":24.75198459327801,\"longitude\":46.630816469294416}', '08-06-2022', '2022-06-08 10:48:43', '2022-06-08 10:48:43'),
(1736, 5, '{\"time\":\"2022-06-08T10:48:49.165Z\",\"latitude\":24.75201162158787,\"longitude\":46.63079124833254}', '08-06-2022', '2022-06-08 10:48:50', '2022-06-08 10:48:50'),
(1737, 5, '{\"time\":\"2022-06-08T10:49:12.861Z\",\"latitude\":24.752018701392778,\"longitude\":46.63081865706277}', '08-06-2022', '2022-06-08 10:49:13', '2022-06-08 10:49:13'),
(1738, 5, '{\"time\":\"2022-06-08T10:49:14.080Z\",\"latitude\":24.75200539546693,\"longitude\":46.630819680060654}', '08-06-2022', '2022-06-08 10:49:14', '2022-06-08 10:49:14');
INSERT INTO `track_employees` (`id`, `user_id`, `location`, `date`, `created_at`, `updated_at`) VALUES
(1739, 5, '{\"time\":\"2022-06-08T10:49:23.553Z\",\"latitude\":24.751963656464273,\"longitude\":46.630806047614676}', '08-06-2022', '2022-06-08 10:49:26', '2022-06-08 10:49:26'),
(1740, 5, '{\"time\":\"2022-06-08T10:49:25.525Z\",\"latitude\":24.751592647328682,\"longitude\":46.63065980452921}', '08-06-2022', '2022-06-08 10:49:26', '2022-06-08 10:49:26'),
(1741, 5, '{\"time\":\"2022-06-08T10:49:24.528Z\",\"latitude\":24.751760238359765,\"longitude\":46.6307326219526}', '08-06-2022', '2022-06-08 10:49:26', '2022-06-08 10:49:26'),
(1742, 5, '{\"time\":\"2022-06-08T10:49:25.931Z\",\"latitude\":24.7519062511177,\"longitude\":46.630814398681224}', '08-06-2022', '2022-06-08 10:49:26', '2022-06-08 10:49:26'),
(1743, 5, '{\"time\":\"2022-06-08T10:49:28.199Z\",\"latitude\":24.751922480325046,\"longitude\":46.630823246493506}', '08-06-2022', '2022-06-08 10:49:28', '2022-06-08 10:49:28'),
(1744, 5, '{\"time\":\"2022-06-08T10:49:35.801Z\",\"latitude\":24.751928702085596,\"longitude\":46.63082926555651}', '08-06-2022', '2022-06-08 10:49:36', '2022-06-08 10:49:36'),
(1745, 5, '{\"time\":\"2022-06-08T10:49:37.011Z\",\"latitude\":24.751974376346215,\"longitude\":46.6308077289805}', '08-06-2022', '2022-06-08 10:49:37', '2022-06-08 10:49:37'),
(1746, 5, '{\"time\":\"2022-06-08T10:49:43.461Z\",\"latitude\":24.751939204384144,\"longitude\":46.630827517247404}', '08-06-2022', '2022-06-08 10:49:44', '2022-06-08 10:49:44'),
(1747, 5, '{\"time\":\"2022-06-08T10:49:44.681Z\",\"latitude\":24.75193619917349,\"longitude\":46.63083157452436}', '08-06-2022', '2022-06-08 10:49:45', '2022-06-08 10:49:45'),
(1748, 5, '{\"time\":\"2022-06-08T10:49:51.149Z\",\"latitude\":24.751954878696775,\"longitude\":46.63082896321346}', '08-06-2022', '2022-06-08 10:49:52', '2022-06-08 10:49:52'),
(1749, 5, '{\"time\":\"2022-06-08T10:49:52.375Z\",\"latitude\":24.751959802946363,\"longitude\":46.63082948820677}', '08-06-2022', '2022-06-08 10:49:52', '2022-06-08 10:49:52'),
(1750, 5, '{\"time\":\"2022-06-08T10:49:58.879Z\",\"latitude\":24.751989620178872,\"longitude\":46.63082543507148}', '08-06-2022', '2022-06-08 10:49:59', '2022-06-08 10:49:59'),
(1751, 5, '{\"time\":\"2022-06-08T10:50:14.908Z\",\"latitude\":24.75168527988677,\"longitude\":46.63085089307539}', '08-06-2022', '2022-06-08 10:50:15', '2022-06-08 10:50:15'),
(1752, 5, '{\"time\":\"2022-06-08T10:50:15.914Z\",\"latitude\":24.751689649747313,\"longitude\":46.63084962345969}', '08-06-2022', '2022-06-08 10:50:16', '2022-06-08 10:50:16'),
(1753, 5, '{\"time\":\"2022-06-08T10:50:16.922Z\",\"latitude\":24.751688669261746,\"longitude\":46.63085866436778}', '08-06-2022', '2022-06-08 10:50:17', '2022-06-08 10:50:17'),
(1754, 5, '{\"time\":\"2022-06-08T10:50:17.925Z\",\"latitude\":24.751693516162614,\"longitude\":46.63086300057724}', '08-06-2022', '2022-06-08 10:50:18', '2022-06-08 10:50:18'),
(1755, 5, '{\"time\":\"2022-06-08T10:50:18.922Z\",\"latitude\":24.751698928625903,\"longitude\":46.6308640102524}', '08-06-2022', '2022-06-08 10:50:19', '2022-06-08 10:50:19'),
(1756, 5, '{\"time\":\"2022-06-08T10:50:19.927Z\",\"latitude\":24.751709067738336,\"longitude\":46.63086169951148}', '08-06-2022', '2022-06-08 10:50:20', '2022-06-08 10:50:20'),
(1757, 5, '{\"time\":\"2022-06-08T10:50:20.913Z\",\"latitude\":24.75171296711663,\"longitude\":46.63085860121688}', '08-06-2022', '2022-06-08 10:50:21', '2022-06-08 10:50:21'),
(1758, 5, '{\"time\":\"2022-06-08T10:50:21.915Z\",\"latitude\":24.751716866494927,\"longitude\":46.63085550292218}', '08-06-2022', '2022-06-08 10:50:22', '2022-06-08 10:50:22'),
(1759, 5, '{\"time\":\"2022-06-08T10:50:22.911Z\",\"latitude\":24.751720765873223,\"longitude\":46.63085240462739}', '08-06-2022', '2022-06-08 10:50:23', '2022-06-08 10:50:23'),
(1760, 5, '{\"time\":\"2022-06-08T10:50:23.916Z\",\"latitude\":24.75172466525152,\"longitude\":46.6308493063325}', '08-06-2022', '2022-06-08 10:50:24', '2022-06-08 10:50:24'),
(1761, 5, '{\"time\":\"2022-06-08T10:50:24.912Z\",\"latitude\":24.751728564629815,\"longitude\":46.63084620803751}', '08-06-2022', '2022-06-08 10:50:25', '2022-06-08 10:50:25'),
(1762, 5, '{\"time\":\"2022-06-08T10:50:44.299Z\",\"latitude\":24.752097882855747,\"longitude\":46.630756729052635}', '08-06-2022', '2022-06-08 10:50:45', '2022-06-08 10:50:45'),
(1763, 5, '{\"time\":\"2022-06-08T10:50:55.526Z\",\"latitude\":24.752449990846088,\"longitude\":46.630725187402554}', '08-06-2022', '2022-06-08 10:50:56', '2022-06-08 10:50:56'),
(1764, 5, '{\"time\":\"2022-06-08T10:50:56.778Z\",\"latitude\":24.752278487590296,\"longitude\":46.630743957651994}', '08-06-2022', '2022-06-08 10:50:57', '2022-06-08 10:50:57'),
(1765, 5, '{\"time\":\"2022-06-08T10:51:03.286Z\",\"latitude\":24.7524205771424,\"longitude\":46.630744336839165}', '08-06-2022', '2022-06-08 10:51:04', '2022-06-08 10:51:04'),
(1766, 5, '{\"time\":\"2022-06-08T10:51:04.523Z\",\"latitude\":24.752302485924517,\"longitude\":46.63070867538178}', '08-06-2022', '2022-06-08 10:51:04', '2022-06-08 10:51:04'),
(1767, 5, '{\"time\":\"2022-06-08T10:51:11.049Z\",\"latitude\":24.752376934839774,\"longitude\":46.63060578423659}', '08-06-2022', '2022-06-08 10:51:11', '2022-06-08 10:51:11'),
(1768, 5, '{\"time\":\"2022-06-08T10:51:17.548Z\",\"latitude\":24.752445763742827,\"longitude\":46.630590429788576}', '08-06-2022', '2022-06-08 10:51:18', '2022-06-08 10:51:18'),
(1769, 5, '{\"time\":\"2022-06-08T10:51:24.063Z\",\"latitude\":24.752476641033827,\"longitude\":46.63060039744673}', '08-06-2022', '2022-06-08 10:51:25', '2022-06-08 10:51:25'),
(1770, 5, '{\"time\":\"2022-06-08T10:51:30.558Z\",\"latitude\":24.75247633557527,\"longitude\":46.63064441521936}', '08-06-2022', '2022-06-08 10:51:31', '2022-06-08 10:51:31'),
(1771, 5, '{\"time\":\"2022-06-08T10:51:37.008Z\",\"latitude\":24.752484055291067,\"longitude\":46.630648742383656}', '08-06-2022', '2022-06-08 10:51:37', '2022-06-08 10:51:37'),
(1772, 5, '{\"time\":\"2022-06-08T10:51:45.574Z\",\"latitude\":24.752438992532333,\"longitude\":46.630654481865825}', '08-06-2022', '2022-06-08 10:51:46', '2022-06-08 10:51:46'),
(1773, 5, '{\"time\":\"2022-06-08T10:51:54.545Z\",\"latitude\":24.7525600676404,\"longitude\":46.63077822987871}', '08-06-2022', '2022-06-08 10:51:55', '2022-06-08 10:51:55'),
(1774, 5, '{\"time\":\"2022-06-08T10:51:55.771Z\",\"latitude\":24.752502871955027,\"longitude\":46.630718598714026}', '08-06-2022', '2022-06-08 10:51:56', '2022-06-08 10:51:56'),
(1775, 5, '{\"time\":\"2022-06-08T10:52:02.301Z\",\"latitude\":24.752530677479392,\"longitude\":46.630733401022006}', '08-06-2022', '2022-06-08 10:52:03', '2022-06-08 10:52:03'),
(1776, 5, '{\"time\":\"2022-06-08T10:52:03.544Z\",\"latitude\":24.75239095679569,\"longitude\":46.630634435000054}', '08-06-2022', '2022-06-08 10:52:03', '2022-06-08 10:52:03'),
(1777, 5, '{\"time\":\"2022-06-08T10:52:10.088Z\",\"latitude\":24.752398071087434,\"longitude\":46.630581976111586}', '08-06-2022', '2022-06-08 10:52:11', '2022-06-08 10:52:11'),
(1778, 5, '{\"time\":\"2022-06-08T10:52:11.315Z\",\"latitude\":24.752388404177818,\"longitude\":46.63056411005222}', '08-06-2022', '2022-06-08 10:52:11', '2022-06-08 10:52:11'),
(1779, 5, '{\"time\":\"2022-06-08T10:52:17.794Z\",\"latitude\":24.752401218973482,\"longitude\":46.6306094780612}', '08-06-2022', '2022-06-08 10:52:18', '2022-06-08 10:52:18'),
(1780, 5, '{\"time\":\"2022-06-08T10:52:24.270Z\",\"latitude\":24.75241641070715,\"longitude\":46.63054249172397}', '08-06-2022', '2022-06-08 10:52:25', '2022-06-08 10:52:25'),
(1781, 5, '{\"time\":\"2022-06-08T10:52:30.725Z\",\"latitude\":24.752401555940637,\"longitude\":46.6307127245466}', '08-06-2022', '2022-06-08 10:52:31', '2022-06-08 10:52:31'),
(1782, 5, '{\"time\":\"2022-06-08T10:52:37.646Z\",\"latitude\":24.75243134584128,\"longitude\":46.630654553352855}', '08-06-2022', '2022-06-08 10:52:38', '2022-06-08 10:52:38'),
(1783, 5, '{\"time\":\"2022-06-08T10:52:44.147Z\",\"latitude\":24.752365689584604,\"longitude\":46.630562852377345}', '08-06-2022', '2022-06-08 10:52:45', '2022-06-08 10:52:45'),
(1784, 5, '{\"time\":\"2022-06-08T10:52:45.398Z\",\"latitude\":24.75233048835844,\"longitude\":46.63057003951648}', '08-06-2022', '2022-06-08 10:52:45', '2022-06-08 10:52:45'),
(1785, 5, '{\"time\":\"2022-06-08T10:52:51.847Z\",\"latitude\":24.752393669379877,\"longitude\":46.63064435250777}', '08-06-2022', '2022-06-08 10:52:52', '2022-06-08 10:52:52'),
(1786, 5, '{\"time\":\"2022-06-08T10:52:58.404Z\",\"latitude\":24.752337156875548,\"longitude\":46.630608597122134}', '08-06-2022', '2022-06-08 10:52:59', '2022-06-08 10:52:59'),
(1787, 5, '{\"time\":\"2022-06-08T10:53:10.270Z\",\"latitude\":24.752411172562617,\"longitude\":46.63050713796765}', '08-06-2022', '2022-06-08 10:53:10', '2022-06-08 10:53:10'),
(1788, 5, '{\"time\":\"2022-06-08T10:53:16.811Z\",\"latitude\":24.75241432074314,\"longitude\":46.63050620595298}', '08-06-2022', '2022-06-08 10:53:17', '2022-06-08 10:53:17'),
(1789, 5, '{\"time\":\"2022-06-08T10:53:41.301Z\",\"latitude\":24.752159272443667,\"longitude\":46.63071065236666}', '08-06-2022', '2022-06-08 10:53:42', '2022-06-08 10:53:42'),
(1790, 5, '{\"time\":\"2022-06-08T10:53:47.753Z\",\"latitude\":24.751991632006714,\"longitude\":46.63082511359198}', '08-06-2022', '2022-06-08 10:53:48', '2022-06-08 10:53:48'),
(1791, 5, '{\"time\":\"2022-06-08T10:53:48.965Z\",\"latitude\":24.75203469584908,\"longitude\":46.63078632717098}', '08-06-2022', '2022-06-08 10:53:49', '2022-06-08 10:53:49'),
(1792, 5, '{\"time\":\"2022-06-08T10:53:55.402Z\",\"latitude\":24.752087144508366,\"longitude\":46.63075618693064}', '08-06-2022', '2022-06-08 10:53:56', '2022-06-08 10:53:56'),
(1793, 5, '{\"time\":\"2022-06-08T10:53:56.835Z\",\"latitude\":24.75205709966907,\"longitude\":46.630833824342936}', '08-06-2022', '2022-06-08 10:53:57', '2022-06-08 10:53:57'),
(1794, 5, '{\"time\":\"2022-06-08T10:54:03.283Z\",\"latitude\":24.75201388424848,\"longitude\":46.630851516094324}', '08-06-2022', '2022-06-08 10:54:04', '2022-06-08 10:54:04'),
(1795, 5, '{\"time\":\"2022-06-08T10:54:04.566Z\",\"latitude\":24.75201641434804,\"longitude\":46.63086778836271}', '08-06-2022', '2022-06-08 10:54:04', '2022-06-08 10:54:04'),
(1796, 5, '{\"time\":\"2022-06-08T10:54:10.990Z\",\"latitude\":24.752012512180404,\"longitude\":46.63083316343467}', '08-06-2022', '2022-06-08 10:54:11', '2022-06-08 10:54:11'),
(1797, 5, '{\"time\":\"2022-06-08T10:54:12.489Z\",\"latitude\":24.752002958588616,\"longitude\":46.63087074681102}', '08-06-2022', '2022-06-08 10:54:12', '2022-06-08 10:54:12'),
(1798, 5, '{\"time\":\"2022-06-08T10:54:18.936Z\",\"latitude\":24.751999440475807,\"longitude\":46.630849272220246}', '08-06-2022', '2022-06-08 10:54:19', '2022-06-08 10:54:19'),
(1799, 5, '{\"time\":\"2022-06-08T10:54:20.150Z\",\"latitude\":24.75198894421686,\"longitude\":46.630866550458684}', '08-06-2022', '2022-06-08 10:54:20', '2022-06-08 10:54:20'),
(1800, 5, '{\"time\":\"2022-06-08T10:54:26.611Z\",\"latitude\":24.75211278777651,\"longitude\":46.63084507707459}', '08-06-2022', '2022-06-08 10:54:27', '2022-06-08 10:54:27'),
(1801, 5, '{\"time\":\"2022-06-08T10:54:33.054Z\",\"latitude\":24.752081366122763,\"longitude\":46.63079340842999}', '08-06-2022', '2022-06-08 10:54:34', '2022-06-08 10:54:34'),
(1802, 5, '{\"time\":\"2022-06-08T10:54:39.491Z\",\"latitude\":24.75213450111004,\"longitude\":46.630854894322326}', '08-06-2022', '2022-06-08 10:54:40', '2022-06-08 10:54:40'),
(1803, 5, '{\"time\":\"2022-06-08T10:54:45.929Z\",\"latitude\":24.75203048899907,\"longitude\":46.63084241335825}', '08-06-2022', '2022-06-08 10:54:47', '2022-06-08 10:54:47'),
(1804, 5, '{\"time\":\"2022-06-08T10:54:52.420Z\",\"latitude\":24.752039532428878,\"longitude\":46.63081179902596}', '08-06-2022', '2022-06-08 10:54:53', '2022-06-08 10:54:53'),
(1805, 5, '{\"time\":\"2022-06-08T10:54:58.909Z\",\"latitude\":24.75200689515185,\"longitude\":46.63098592245563}', '08-06-2022', '2022-06-08 10:55:00', '2022-06-08 10:55:00'),
(1806, 5, '{\"time\":\"2022-06-08T10:55:05.376Z\",\"latitude\":24.75196009212422,\"longitude\":46.63115646868177}', '08-06-2022', '2022-06-08 10:55:06', '2022-06-08 10:55:06'),
(1807, 5, '{\"time\":\"2022-06-08T10:55:11.918Z\",\"latitude\":24.752138744320344,\"longitude\":46.63127859677837}', '08-06-2022', '2022-06-08 10:55:12', '2022-06-08 10:55:12'),
(1808, 5, '{\"time\":\"2022-06-08T10:55:25.091Z\",\"latitude\":24.75209314956746,\"longitude\":46.63145201538678}', '08-06-2022', '2022-06-08 10:55:28', '2022-06-08 10:55:28'),
(1809, 5, '{\"time\":\"2022-06-08T10:55:31.526Z\",\"latitude\":24.75210692005688,\"longitude\":46.63144283231858}', '08-06-2022', '2022-06-08 10:55:31', '2022-06-08 10:55:31'),
(1810, 5, '{\"time\":\"2022-06-08T10:55:38.060Z\",\"latitude\":24.751918912212073,\"longitude\":46.631361927189765}', '08-06-2022', '2022-06-08 10:55:38', '2022-06-08 10:55:38'),
(1811, 5, '{\"time\":\"2022-06-08T10:55:41.151Z\",\"latitude\":24.751866378248593,\"longitude\":46.63133288559411}', '08-06-2022', '2022-06-08 10:55:41', '2022-06-08 10:55:41'),
(1812, 5, '{\"time\":\"2022-06-08T10:55:47.625Z\",\"latitude\":24.75197941372444,\"longitude\":46.63142736407098}', '08-06-2022', '2022-06-08 10:55:48', '2022-06-08 10:55:48'),
(1813, 5, '{\"time\":\"2022-06-08T10:55:48.843Z\",\"latitude\":24.752024346706406,\"longitude\":46.631454961846345}', '08-06-2022', '2022-06-08 10:55:49', '2022-06-08 10:55:49'),
(1814, 5, '{\"time\":\"2022-06-08T10:55:55.343Z\",\"latitude\":24.752102602386135,\"longitude\":46.63144668796269}', '08-06-2022', '2022-06-08 10:55:56', '2022-06-08 10:55:56'),
(1815, 5, '{\"time\":\"2022-06-08T10:55:58.909Z\",\"latitude\":24.75191108428344,\"longitude\":46.63136670276992}', '08-06-2022', '2022-06-08 10:55:59', '2022-06-08 10:55:59'),
(1816, 5, '{\"time\":\"2022-06-08T10:55:59.902Z\",\"latitude\":24.751911554974107,\"longitude\":46.631364484577546}', '08-06-2022', '2022-06-08 10:56:00', '2022-06-08 10:56:00'),
(1817, 5, '{\"time\":\"2022-06-08T10:56:00.895Z\",\"latitude\":24.75191149309238,\"longitude\":46.63136451967174}', '08-06-2022', '2022-06-08 10:56:01', '2022-06-08 10:56:01'),
(1818, 5, '{\"time\":\"2022-06-08T10:56:01.899Z\",\"latitude\":24.751911454983173,\"longitude\":46.631364726469855}', '08-06-2022', '2022-06-08 10:56:02', '2022-06-08 10:56:02'),
(1819, 5, '{\"time\":\"2022-06-08T10:56:02.909Z\",\"latitude\":24.751924530556767,\"longitude\":46.63137694715907}', '08-06-2022', '2022-06-08 10:56:03', '2022-06-08 10:56:03'),
(1820, 5, '{\"time\":\"2022-06-08T10:56:03.897Z\",\"latitude\":24.75193024142226,\"longitude\":46.63138292001877}', '08-06-2022', '2022-06-08 10:56:04', '2022-06-08 10:56:04'),
(1821, 5, '{\"time\":\"2022-06-08T10:56:04.897Z\",\"latitude\":24.751922089339068,\"longitude\":46.63138290428153}', '08-06-2022', '2022-06-08 10:56:05', '2022-06-08 10:56:05'),
(1822, 5, '{\"time\":\"2022-06-08T10:56:05.916Z\",\"latitude\":24.75191804034621,\"longitude\":46.63138628013633}', '08-06-2022', '2022-06-08 10:56:06', '2022-06-08 10:56:06'),
(1823, 5, '{\"time\":\"2022-06-08T10:56:06.914Z\",\"latitude\":24.7519109377358,\"longitude\":46.6313938461834}', '08-06-2022', '2022-06-08 10:56:07', '2022-06-08 10:56:07'),
(1824, 5, '{\"time\":\"2022-06-08T10:56:07.919Z\",\"latitude\":24.7519009580008,\"longitude\":46.631400410332475}', '08-06-2022', '2022-06-08 10:56:08', '2022-06-08 10:56:08'),
(1825, 5, '{\"time\":\"2022-06-08T10:56:08.914Z\",\"latitude\":24.75189373958393,\"longitude\":46.63140319243113}', '08-06-2022', '2022-06-08 10:56:09', '2022-06-08 10:56:09'),
(1826, 5, '{\"time\":\"2022-06-08T10:56:09.908Z\",\"latitude\":24.751886521167062,\"longitude\":46.63140597452963}', '08-06-2022', '2022-06-08 10:56:10', '2022-06-08 10:56:10'),
(1827, 5, '{\"time\":\"2022-06-08T10:56:10.914Z\",\"latitude\":24.751877719405996,\"longitude\":46.63141160498152}', '08-06-2022', '2022-06-08 10:56:11', '2022-06-08 10:56:11'),
(1828, 5, '{\"time\":\"2022-06-08T10:56:11.911Z\",\"latitude\":24.751870359002858,\"longitude\":46.63141111856261}', '08-06-2022', '2022-06-08 10:56:12', '2022-06-08 10:56:12'),
(1829, 5, '{\"time\":\"2022-06-08T10:56:12.907Z\",\"latitude\":24.751865645063628,\"longitude\":46.63140828754978}', '08-06-2022', '2022-06-08 10:56:13', '2022-06-08 10:56:13'),
(1830, 5, '{\"time\":\"2022-06-08T10:56:13.901Z\",\"latitude\":24.75187419227946,\"longitude\":46.63141334764501}', '08-06-2022', '2022-06-08 10:56:14', '2022-06-08 10:56:14'),
(1831, 5, '{\"time\":\"2022-06-08T10:56:14.909Z\",\"latitude\":24.75185889469355,\"longitude\":46.63138857340392}', '08-06-2022', '2022-06-08 10:56:15', '2022-06-08 10:56:15'),
(1832, 5, '{\"time\":\"2022-06-08T10:56:15.904Z\",\"latitude\":24.751848893404457,\"longitude\":46.631382363247354}', '08-06-2022', '2022-06-08 10:56:16', '2022-06-08 10:56:16'),
(1833, 5, '{\"time\":\"2022-06-08T10:56:16.903Z\",\"latitude\":24.751871380978912,\"longitude\":46.631398824505844}', '08-06-2022', '2022-06-08 10:56:17', '2022-06-08 10:56:17'),
(1834, 5, '{\"time\":\"2022-06-08T10:56:17.905Z\",\"latitude\":24.75187468316439,\"longitude\":46.63137753078831}', '08-06-2022', '2022-06-08 10:56:18', '2022-06-08 10:56:18'),
(1835, 5, '{\"time\":\"2022-06-08T10:56:18.905Z\",\"latitude\":24.751875011241257,\"longitude\":46.63136701406592}', '08-06-2022', '2022-06-08 10:56:19', '2022-06-08 10:56:19'),
(1836, 5, '{\"time\":\"2022-06-08T10:56:19.908Z\",\"latitude\":24.751879090837235,\"longitude\":46.63137233722129}', '08-06-2022', '2022-06-08 10:56:20', '2022-06-08 10:56:20'),
(1837, 5, '{\"time\":\"2022-06-08T10:56:20.915Z\",\"latitude\":24.751875813858373,\"longitude\":46.63136482469335}', '08-06-2022', '2022-06-08 10:56:21', '2022-06-08 10:56:21'),
(1838, 5, '{\"time\":\"2022-06-08T10:56:21.911Z\",\"latitude\":24.751871994944043,\"longitude\":46.631359429300645}', '08-06-2022', '2022-06-08 10:56:22', '2022-06-08 10:56:22'),
(1839, 5, '{\"time\":\"2022-06-08T10:56:22.903Z\",\"latitude\":24.75187347016854,\"longitude\":46.63135968562087}', '08-06-2022', '2022-06-08 10:56:23', '2022-06-08 10:56:23'),
(1840, 5, '{\"time\":\"2022-06-08T10:56:23.907Z\",\"latitude\":24.75187340172182,\"longitude\":46.631368914557655}', '08-06-2022', '2022-06-08 10:56:24', '2022-06-08 10:56:24'),
(1841, 5, '{\"time\":\"2022-06-08T10:56:24.905Z\",\"latitude\":24.75186961314713,\"longitude\":46.63137295122527}', '08-06-2022', '2022-06-08 10:56:25', '2022-06-08 10:56:25'),
(1842, 5, '{\"time\":\"2022-06-08T10:56:25.912Z\",\"latitude\":24.751862163084976,\"longitude\":46.63137295430161}', '08-06-2022', '2022-06-08 10:56:26', '2022-06-08 10:56:26'),
(1843, 5, '{\"time\":\"2022-06-08T10:56:26.911Z\",\"latitude\":24.75186301084108,\"longitude\":46.63137172272612}', '08-06-2022', '2022-06-08 10:56:27', '2022-06-08 10:56:27'),
(1844, 5, '{\"time\":\"2022-06-08T10:56:27.914Z\",\"latitude\":24.75186953854458,\"longitude\":46.631360922682326}', '08-06-2022', '2022-06-08 10:56:28', '2022-06-08 10:56:28'),
(1845, 5, '{\"time\":\"2022-06-08T10:56:28.915Z\",\"latitude\":24.751875059526295,\"longitude\":46.63135918001033}', '08-06-2022', '2022-06-08 10:56:29', '2022-06-08 10:56:29'),
(1846, 5, '{\"time\":\"2022-06-08T10:56:29.910Z\",\"latitude\":24.75188169202439,\"longitude\":46.631358553144025}', '08-06-2022', '2022-06-08 10:56:30', '2022-06-08 10:56:30'),
(1847, 5, '{\"time\":\"2022-06-08T10:56:30.910Z\",\"latitude\":24.7518804106228,\"longitude\":46.631357561569665}', '08-06-2022', '2022-06-08 10:56:31', '2022-06-08 10:56:31'),
(1848, 5, '{\"time\":\"2022-06-08T10:56:31.913Z\",\"latitude\":24.75187456657414,\"longitude\":46.631356492626}', '08-06-2022', '2022-06-08 10:56:32', '2022-06-08 10:56:32'),
(1849, 5, '{\"time\":\"2022-06-08T10:56:32.909Z\",\"latitude\":24.751876306369663,\"longitude\":46.6313563986611}', '08-06-2022', '2022-06-08 10:56:33', '2022-06-08 10:56:33'),
(1850, 5, '{\"time\":\"2022-06-08T10:56:33.909Z\",\"latitude\":24.751878343936962,\"longitude\":46.63135312293487}', '08-06-2022', '2022-06-08 10:56:34', '2022-06-08 10:56:34'),
(1851, 5, '{\"time\":\"2022-06-08T10:56:34.906Z\",\"latitude\":24.751883216503845,\"longitude\":46.631346260691224}', '08-06-2022', '2022-06-08 10:56:35', '2022-06-08 10:56:35'),
(1852, 5, '{\"time\":\"2022-06-08T10:56:35.904Z\",\"latitude\":24.75188813128469,\"longitude\":46.631335319390224}', '08-06-2022', '2022-06-08 10:56:36', '2022-06-08 10:56:36'),
(1853, 5, '{\"time\":\"2022-06-08T10:56:36.901Z\",\"latitude\":24.751891736141413,\"longitude\":46.63132982920687}', '08-06-2022', '2022-06-08 10:56:37', '2022-06-08 10:56:37'),
(1854, 5, '{\"time\":\"2022-06-08T10:56:37.913Z\",\"latitude\":24.751893435598646,\"longitude\":46.631328147107865}', '08-06-2022', '2022-06-08 10:56:38', '2022-06-08 10:56:38'),
(1855, 5, '{\"time\":\"2022-06-08T10:56:38.909Z\",\"latitude\":24.751894431310124,\"longitude\":46.63133463287966}', '08-06-2022', '2022-06-08 10:56:39', '2022-06-08 10:56:39'),
(1856, 5, '{\"time\":\"2022-06-08T10:56:39.910Z\",\"latitude\":24.751896961470447,\"longitude\":46.63134428784857}', '08-06-2022', '2022-06-08 10:56:40', '2022-06-08 10:56:40'),
(1857, 5, '{\"time\":\"2022-06-08T10:56:40.911Z\",\"latitude\":24.751895210960992,\"longitude\":46.63134269790036}', '08-06-2022', '2022-06-08 10:56:41', '2022-06-08 10:56:41'),
(1858, 5, '{\"time\":\"2022-06-08T10:56:41.909Z\",\"latitude\":24.751900166021457,\"longitude\":46.631347082490294}', '08-06-2022', '2022-06-08 10:56:42', '2022-06-08 10:56:42'),
(1859, 5, '{\"time\":\"2022-06-08T10:56:42.913Z\",\"latitude\":24.751897768003225,\"longitude\":46.63134266016557}', '08-06-2022', '2022-06-08 10:56:43', '2022-06-08 10:56:43'),
(1860, 5, '{\"time\":\"2022-06-08T10:56:43.910Z\",\"latitude\":24.751895257382568,\"longitude\":46.63133795687777}', '08-06-2022', '2022-06-08 10:56:44', '2022-06-08 10:56:44'),
(1861, 5, '{\"time\":\"2022-06-08T10:56:44.910Z\",\"latitude\":24.751894089581334,\"longitude\":46.63134138767979}', '08-06-2022', '2022-06-08 10:56:45', '2022-06-08 10:56:45'),
(1862, 5, '{\"time\":\"2022-06-08T10:56:45.910Z\",\"latitude\":24.751885856821815,\"longitude\":46.63134646454132}', '08-06-2022', '2022-06-08 10:56:46', '2022-06-08 10:56:46'),
(1863, 5, '{\"time\":\"2022-06-08T10:56:46.911Z\",\"latitude\":24.751875248445437,\"longitude\":46.631343410234976}', '08-06-2022', '2022-06-08 10:56:47', '2022-06-08 10:56:47'),
(1864, 5, '{\"time\":\"2022-06-08T10:56:47.910Z\",\"latitude\":24.751872434763364,\"longitude\":46.63135441143681}', '08-06-2022', '2022-06-08 10:56:48', '2022-06-08 10:56:48'),
(1865, 5, '{\"time\":\"2022-06-08T10:56:48.911Z\",\"latitude\":24.751862617616645,\"longitude\":46.63135539758835}', '08-06-2022', '2022-06-08 10:56:49', '2022-06-08 10:56:49'),
(1866, 5, '{\"time\":\"2022-06-08T10:56:49.911Z\",\"latitude\":24.75183801618969,\"longitude\":46.631349206682394}', '08-06-2022', '2022-06-08 10:56:50', '2022-06-08 10:56:50'),
(1867, 5, '{\"time\":\"2022-06-08T10:56:50.912Z\",\"latitude\":24.751839228438048,\"longitude\":46.63135185084121}', '08-06-2022', '2022-06-08 10:56:51', '2022-06-08 10:56:51'),
(1868, 5, '{\"time\":\"2022-06-08T10:56:51.902Z\",\"latitude\":24.75183870183534,\"longitude\":46.631354171374134}', '08-06-2022', '2022-06-08 10:56:52', '2022-06-08 10:56:52'),
(1869, 5, '{\"time\":\"2022-06-08T10:56:52.914Z\",\"latitude\":24.751839075057386,\"longitude\":46.631357673687525}', '08-06-2022', '2022-06-08 10:56:53', '2022-06-08 10:56:53'),
(1870, 5, '{\"time\":\"2022-06-08T10:56:53.914Z\",\"latitude\":24.75184200553622,\"longitude\":46.63136203917253}', '08-06-2022', '2022-06-08 10:56:54', '2022-06-08 10:56:54'),
(1871, 5, '{\"time\":\"2022-06-08T10:56:54.903Z\",\"latitude\":24.751842791063368,\"longitude\":46.631369497536944}', '08-06-2022', '2022-06-08 10:56:55', '2022-06-08 10:56:55'),
(1872, 5, '{\"time\":\"2022-06-08T10:57:30.292Z\",\"latitude\":24.75209314956746,\"longitude\":46.63145201538678}', '08-06-2022', '2022-06-08 10:57:31', '2022-06-08 10:57:31'),
(1873, 5, '{\"time\":\"2022-06-08T10:57:42.345Z\",\"latitude\":24.751988501737177,\"longitude\":46.63095574054361}', '08-06-2022', '2022-06-08 10:57:44', '2022-06-08 10:57:44'),
(1874, 5, '{\"time\":\"2022-06-08T10:57:51.373Z\",\"latitude\":24.752047753771112,\"longitude\":46.630799946439346}', '08-06-2022', '2022-06-08 10:57:52', '2022-06-08 10:57:52'),
(1875, 5, '{\"time\":\"2022-06-08T10:57:52.593Z\",\"latitude\":24.75202003865012,\"longitude\":46.63095207917306}', '08-06-2022', '2022-06-08 10:57:52', '2022-06-08 10:57:52'),
(1876, 2, '{\"time\":\"2022-06-23T11:56:04.833Z\",\"latitude\":11.31600089,\"longitude\":75.99798101}', '23-06-2022', '2022-06-23 11:56:05', '2022-06-23 11:56:05'),
(1877, 2, '{\"time\":\"2022-06-23T11:56:07.775Z\",\"latitude\":11.31599805,\"longitude\":75.99797962}', '23-06-2022', '2022-06-23 11:56:08', '2022-06-23 11:56:08'),
(1878, 2, '{\"time\":\"2022-06-23T12:12:21.810Z\",\"latitude\":11.32077186,\"longitude\":75.99735366}', '23-06-2022', '2022-06-23 12:12:22', '2022-06-23 12:12:22'),
(1879, 2, '{\"time\":\"2022-06-23T12:12:21.819Z\",\"latitude\":11.32077186,\"longitude\":75.99735366}', '23-06-2022', '2022-06-23 12:12:22', '2022-06-23 12:12:22'),
(1880, 2, '{\"time\":\"2022-06-23T12:12:23.780Z\",\"latitude\":11.32077861,\"longitude\":75.99737902}', '23-06-2022', '2022-06-23 12:12:24', '2022-06-23 12:12:24'),
(1881, 2, '{\"time\":\"2022-07-26T09:35:25.481Z\",\"latitude\":11.31602603,\"longitude\":75.99806582}', '26-07-2022', '2022-07-26 09:35:26', '2022-07-26 09:35:26'),
(1882, 2, '{\"time\":\"2022-07-26T09:35:25.486Z\",\"latitude\":11.31602603,\"longitude\":75.99806582}', '26-07-2022', '2022-07-26 09:35:26', '2022-07-26 09:35:26'),
(1883, 2, '{\"time\":\"2022-08-11T09:30:35.443Z\",\"latitude\":11.316019,\"longitude\":75.99787263}', '11-08-2022', '2022-08-11 09:30:36', '2022-08-11 09:30:36'),
(1884, 2, '{\"time\":\"2022-08-11T09:30:35.448Z\",\"latitude\":11.316019,\"longitude\":75.99787263}', '11-08-2022', '2022-08-11 09:30:36', '2022-08-11 09:30:36'),
(1885, 16, '{\"time\":\"2022-08-13T14:07:50.780Z\",\"latitude\":24.698326693631998,\"longitude\":46.72082560045725}', '13-08-2022', '2022-08-13 14:07:52', '2022-08-13 14:07:52'),
(1886, 16, '{\"time\":\"2022-08-13T14:07:56.754Z\",\"latitude\":24.698371289149442,\"longitude\":46.720903069564564}', '13-08-2022', '2022-08-13 14:07:57', '2022-08-13 14:07:57'),
(1887, 16, '{\"time\":\"2022-08-13T14:08:02.754Z\",\"latitude\":24.698353622683623,\"longitude\":46.72086938904232}', '13-08-2022', '2022-08-13 14:08:03', '2022-08-13 14:08:03'),
(1888, 16, '{\"time\":\"2022-08-13T14:08:08.749Z\",\"latitude\":24.698326177455442,\"longitude\":46.72073148576401}', '13-08-2022', '2022-08-13 14:08:10', '2022-08-13 14:08:10'),
(1889, 16, '{\"time\":\"2022-08-13T14:08:14.748Z\",\"latitude\":24.69833122148805,\"longitude\":46.72079774901741}', '13-08-2022', '2022-08-13 14:08:15', '2022-08-13 14:08:15'),
(1890, 16, '{\"time\":\"2022-08-13T14:08:20.730Z\",\"latitude\":24.698341281963657,\"longitude\":46.72078827142651}', '13-08-2022', '2022-08-13 14:08:21', '2022-08-13 14:08:21'),
(1891, 16, '{\"time\":\"2022-08-13T14:26:30.565Z\",\"latitude\":24.69848383837805,\"longitude\":46.72103812852894}', '13-08-2022', '2022-08-13 14:26:31', '2022-08-13 14:26:31'),
(1892, 16, '{\"time\":\"2022-08-13T14:26:36.583Z\",\"latitude\":24.698480544075533,\"longitude\":46.72103865516805}', '13-08-2022', '2022-08-13 14:26:38', '2022-08-13 14:26:38'),
(1893, 16, '{\"time\":\"2022-08-13T14:26:42.568Z\",\"latitude\":24.698473766291546,\"longitude\":46.720983527878666}', '13-08-2022', '2022-08-13 14:26:43', '2022-08-13 14:26:43'),
(1894, 16, '{\"time\":\"2022-08-13T14:26:48.566Z\",\"latitude\":24.698473653848033,\"longitude\":46.72100371876009}', '13-08-2022', '2022-08-13 14:26:49', '2022-08-13 14:26:49'),
(1895, 16, '{\"time\":\"2022-08-13T14:26:54.568Z\",\"latitude\":24.698428648449767,\"longitude\":46.72095886310622}', '13-08-2022', '2022-08-13 14:26:56', '2022-08-13 14:26:56'),
(1896, 16, '{\"time\":\"2022-08-13T14:27:00.565Z\",\"latitude\":24.69843870027453,\"longitude\":46.72096056143879}', '13-08-2022', '2022-08-13 14:27:01', '2022-08-13 14:27:01'),
(1897, 16, '{\"time\":\"2022-08-13T14:27:06.564Z\",\"latitude\":24.69846205519178,\"longitude\":46.720973842718415}', '13-08-2022', '2022-08-13 14:27:07', '2022-08-13 14:27:07'),
(1898, 16, '{\"time\":\"2022-08-13T14:27:12.567Z\",\"latitude\":24.69845482411827,\"longitude\":46.72099081292538}', '13-08-2022', '2022-08-13 14:27:14', '2022-08-13 14:27:14'),
(1899, 16, '{\"time\":\"2022-08-13T14:27:18.563Z\",\"latitude\":24.698471674260727,\"longitude\":46.72100573754885}', '13-08-2022', '2022-08-13 14:27:19', '2022-08-13 14:27:19'),
(1900, 16, '{\"time\":\"2022-08-13T14:27:24.573Z\",\"latitude\":24.69847821080342,\"longitude\":46.72101564624027}', '13-08-2022', '2022-08-13 14:27:25', '2022-08-13 14:27:25'),
(1901, 16, '{\"time\":\"2022-08-13T14:27:30.561Z\",\"latitude\":24.69847791323577,\"longitude\":46.72102460083073}', '13-08-2022', '2022-08-13 14:27:31', '2022-08-13 14:27:31'),
(1902, 16, '{\"time\":\"2022-08-13T14:27:35.570Z\",\"latitude\":24.69843100215886,\"longitude\":46.72094799889945}', '13-08-2022', '2022-08-13 14:27:36', '2022-08-13 14:27:36'),
(1903, 16, '{\"time\":\"2022-08-13T14:27:41.567Z\",\"latitude\":24.698479311121282,\"longitude\":46.72103587129496}', '13-08-2022', '2022-08-13 14:27:42', '2022-08-13 14:27:42'),
(1904, 16, '{\"time\":\"2022-08-13T14:27:47.565Z\",\"latitude\":24.698487612702106,\"longitude\":46.72104659184866}', '13-08-2022', '2022-08-13 14:27:48', '2022-08-13 14:27:48'),
(1905, 16, '{\"time\":\"2022-08-13T14:27:53.561Z\",\"latitude\":24.698481288888246,\"longitude\":46.72104696241121}', '13-08-2022', '2022-08-13 14:27:54', '2022-08-13 14:27:54'),
(1906, 16, '{\"time\":\"2022-08-13T14:27:59.562Z\",\"latitude\":24.698491367807804,\"longitude\":46.7210533087473}', '13-08-2022', '2022-08-13 14:28:00', '2022-08-13 14:28:00'),
(1907, 16, '{\"time\":\"2022-08-13T14:28:05.556Z\",\"latitude\":24.69845540327628,\"longitude\":46.72099700530357}', '13-08-2022', '2022-08-13 14:28:06', '2022-08-13 14:28:06'),
(1908, 16, '{\"time\":\"2022-08-13T14:28:11.544Z\",\"latitude\":24.69846603354814,\"longitude\":46.72098764278999}', '13-08-2022', '2022-08-13 14:28:12', '2022-08-13 14:28:12'),
(1909, 16, '{\"time\":\"2022-08-13T14:28:17.650Z\",\"latitude\":24.698444063606615,\"longitude\":46.72097364723428}', '13-08-2022', '2022-08-13 14:28:18', '2022-08-13 14:28:18'),
(1910, 16, '{\"time\":\"2022-08-13T14:28:23.580Z\",\"latitude\":24.69845808770828,\"longitude\":46.720983379545444}', '13-08-2022', '2022-08-13 14:28:24', '2022-08-13 14:28:24'),
(1911, 16, '{\"time\":\"2022-08-13T14:28:29.577Z\",\"latitude\":24.69847884930376,\"longitude\":46.721036839299316}', '13-08-2022', '2022-08-13 14:28:30', '2022-08-13 14:28:30'),
(1912, 16, '{\"time\":\"2022-08-13T14:28:35.556Z\",\"latitude\":24.69848397614607,\"longitude\":46.72103394150463}', '13-08-2022', '2022-08-13 14:28:36', '2022-08-13 14:28:36'),
(1913, 16, '{\"time\":\"2022-08-13T14:28:41.559Z\",\"latitude\":24.69848691705952,\"longitude\":46.72105036397739}', '13-08-2022', '2022-08-13 14:28:42', '2022-08-13 14:28:42'),
(1914, 16, '{\"time\":\"2022-08-13T14:28:47.567Z\",\"latitude\":24.698450635112795,\"longitude\":46.72097382871216}', '13-08-2022', '2022-08-13 14:28:48', '2022-08-13 14:28:48'),
(1915, 16, '{\"time\":\"2022-08-13T14:28:53.595Z\",\"latitude\":24.698451434550933,\"longitude\":46.72105074572795}', '13-08-2022', '2022-08-13 14:28:54', '2022-08-13 14:28:54'),
(1916, 16, '{\"time\":\"2022-08-13T14:28:58.372Z\",\"latitude\":24.698452474985277,\"longitude\":46.720925785965825}', '13-08-2022', '2022-08-13 14:28:59', '2022-08-13 14:28:59'),
(1917, 16, '{\"time\":\"2022-08-13T14:28:58.944Z\",\"latitude\":24.69843605167054,\"longitude\":46.72091609321323}', '13-08-2022', '2022-08-13 14:28:59', '2022-08-13 14:28:59'),
(1918, 16, '{\"time\":\"2022-08-13T14:28:59.916Z\",\"latitude\":24.69842288530135,\"longitude\":46.720914062309156}', '13-08-2022', '2022-08-13 14:29:00', '2022-08-13 14:29:00'),
(1919, 16, '{\"time\":\"2022-08-13T14:29:00.927Z\",\"latitude\":24.698419063495468,\"longitude\":46.720913001280294}', '13-08-2022', '2022-08-13 14:29:01', '2022-08-13 14:29:01'),
(1920, 16, '{\"time\":\"2022-08-13T14:29:01.936Z\",\"latitude\":24.698398817723273,\"longitude\":46.72092172403966}', '13-08-2022', '2022-08-13 14:29:02', '2022-08-13 14:29:02'),
(1921, 16, '{\"time\":\"2022-08-13T14:29:02.943Z\",\"latitude\":24.698396055007333,\"longitude\":46.720933230002075}', '13-08-2022', '2022-08-13 14:29:03', '2022-08-13 14:29:03'),
(1922, 16, '{\"time\":\"2022-08-13T14:29:03.935Z\",\"latitude\":24.698381304822565,\"longitude\":46.72095013625537}', '13-08-2022', '2022-08-13 14:29:04', '2022-08-13 14:29:04'),
(1923, 16, '{\"time\":\"2022-08-13T14:29:04.937Z\",\"latitude\":24.698368654961747,\"longitude\":46.72097441228788}', '13-08-2022', '2022-08-13 14:29:05', '2022-08-13 14:29:05'),
(1924, 16, '{\"time\":\"2022-08-13T14:29:05.930Z\",\"latitude\":24.698362738791698,\"longitude\":46.720982332779855}', '13-08-2022', '2022-08-13 14:29:06', '2022-08-13 14:29:06'),
(1925, 16, '{\"time\":\"2022-08-13T14:29:06.941Z\",\"latitude\":24.698357041604044,\"longitude\":46.72098553527075}', '13-08-2022', '2022-08-13 14:29:07', '2022-08-13 14:29:07'),
(1926, 16, '{\"time\":\"2022-08-13T14:29:07.941Z\",\"latitude\":24.698351642078062,\"longitude\":46.720984544893966}', '13-08-2022', '2022-08-13 14:29:08', '2022-08-13 14:29:08'),
(1927, 16, '{\"time\":\"2022-08-13T14:29:08.928Z\",\"latitude\":24.698342997166822,\"longitude\":46.72099276773453}', '13-08-2022', '2022-08-13 14:29:09', '2022-08-13 14:29:09'),
(1928, 16, '{\"time\":\"2022-08-13T14:29:09.929Z\",\"latitude\":24.6983379229289,\"longitude\":46.720995994362106}', '13-08-2022', '2022-08-13 14:29:10', '2022-08-13 14:29:10'),
(1929, 16, '{\"time\":\"2022-08-13T14:29:10.952Z\",\"latitude\":24.698342210710294,\"longitude\":46.72099537030688}', '13-08-2022', '2022-08-13 14:29:11', '2022-08-13 14:29:11'),
(1930, 16, '{\"time\":\"2022-08-13T14:29:11.943Z\",\"latitude\":24.69835036336155,\"longitude\":46.72099087036191}', '13-08-2022', '2022-08-13 14:29:12', '2022-08-13 14:29:12'),
(1931, 16, '{\"time\":\"2022-08-13T14:29:12.941Z\",\"latitude\":24.698348157780153,\"longitude\":46.72098795665881}', '13-08-2022', '2022-08-13 14:29:13', '2022-08-13 14:29:13'),
(1932, 16, '{\"time\":\"2022-08-13T14:29:13.932Z\",\"latitude\":24.69835004307529,\"longitude\":46.720991508348156}', '13-08-2022', '2022-08-13 14:29:14', '2022-08-13 14:29:14'),
(1933, 16, '{\"time\":\"2022-08-13T14:29:14.941Z\",\"latitude\":24.69835448758429,\"longitude\":46.72099395791352}', '13-08-2022', '2022-08-13 14:29:15', '2022-08-13 14:29:15'),
(1934, 16, '{\"time\":\"2022-08-13T14:29:15.937Z\",\"latitude\":24.698360873020235,\"longitude\":46.7209947199505}', '13-08-2022', '2022-08-13 14:29:16', '2022-08-13 14:29:16'),
(1935, 16, '{\"time\":\"2022-08-13T14:29:16.953Z\",\"latitude\":24.698361493165947,\"longitude\":46.72099307241707}', '13-08-2022', '2022-08-13 14:29:17', '2022-08-13 14:29:17'),
(1936, 16, '{\"time\":\"2022-08-13T14:29:17.951Z\",\"latitude\":24.698359595369368,\"longitude\":46.72099613334133}', '13-08-2022', '2022-08-13 14:29:18', '2022-08-13 14:29:18'),
(1937, 16, '{\"time\":\"2022-08-13T14:29:18.943Z\",\"latitude\":24.698354323362228,\"longitude\":46.72099689217772}', '13-08-2022', '2022-08-13 14:29:19', '2022-08-13 14:29:19'),
(1938, 16, '{\"time\":\"2022-08-13T14:29:19.932Z\",\"latitude\":24.698349471071364,\"longitude\":46.720998646397284}', '13-08-2022', '2022-08-13 14:29:20', '2022-08-13 14:29:20'),
(1939, 16, '{\"time\":\"2022-08-13T14:29:20.943Z\",\"latitude\":24.698343910292166,\"longitude\":46.72099934519472}', '13-08-2022', '2022-08-13 14:29:21', '2022-08-13 14:29:21'),
(1940, 16, '{\"time\":\"2022-08-13T14:29:21.940Z\",\"latitude\":24.698339896356718,\"longitude\":46.72101040480591}', '13-08-2022', '2022-08-13 14:29:22', '2022-08-13 14:29:22'),
(1941, 16, '{\"time\":\"2022-08-13T14:29:22.938Z\",\"latitude\":24.698338243520208,\"longitude\":46.721016309389164}', '13-08-2022', '2022-08-13 14:29:23', '2022-08-13 14:29:23'),
(1942, 16, '{\"time\":\"2022-08-13T14:29:23.945Z\",\"latitude\":24.6983343719323,\"longitude\":46.721025479703}', '13-08-2022', '2022-08-13 14:29:24', '2022-08-13 14:29:24'),
(1943, 16, '{\"time\":\"2022-08-13T14:29:24.931Z\",\"latitude\":24.698329379741157,\"longitude\":46.72103275912211}', '13-08-2022', '2022-08-13 14:29:25', '2022-08-13 14:29:25'),
(1944, 16, '{\"time\":\"2022-08-13T14:29:25.940Z\",\"latitude\":24.698326139604564,\"longitude\":46.721039493786826}', '13-08-2022', '2022-08-13 14:29:26', '2022-08-13 14:29:26'),
(1945, 16, '{\"time\":\"2022-08-13T14:29:26.950Z\",\"latitude\":24.69832506795441,\"longitude\":46.72104149392249}', '13-08-2022', '2022-08-13 14:29:27', '2022-08-13 14:29:27'),
(1946, 16, '{\"time\":\"2022-08-13T14:29:27.935Z\",\"latitude\":24.69832876914656,\"longitude\":46.72103670322219}', '13-08-2022', '2022-08-13 14:29:28', '2022-08-13 14:29:28'),
(1947, 16, '{\"time\":\"2022-08-13T14:29:28.935Z\",\"latitude\":24.698333577115186,\"longitude\":46.721034627676595}', '13-08-2022', '2022-08-13 14:29:29', '2022-08-13 14:29:29'),
(1948, 16, '{\"time\":\"2022-08-13T14:29:29.931Z\",\"latitude\":24.698337377359017,\"longitude\":46.72102614566362}', '13-08-2022', '2022-08-13 14:29:30', '2022-08-13 14:29:30'),
(1949, 16, '{\"time\":\"2022-08-13T14:29:30.935Z\",\"latitude\":24.69834312085977,\"longitude\":46.72102208490916}', '13-08-2022', '2022-08-13 14:29:31', '2022-08-13 14:29:31'),
(1950, 16, '{\"time\":\"2022-08-13T14:29:31.927Z\",\"latitude\":24.69834566185917,\"longitude\":46.72102050614608}', '13-08-2022', '2022-08-13 14:29:32', '2022-08-13 14:29:32'),
(1951, 16, '{\"time\":\"2022-08-13T14:29:32.928Z\",\"latitude\":24.698344026260603,\"longitude\":46.72101865156237}', '13-08-2022', '2022-08-13 14:29:33', '2022-08-13 14:29:33'),
(1952, 16, '{\"time\":\"2022-08-13T14:29:33.929Z\",\"latitude\":24.69834572371743,\"longitude\":46.721016671187115}', '13-08-2022', '2022-08-13 14:29:34', '2022-08-13 14:29:34'),
(1953, 16, '{\"time\":\"2022-08-13T14:29:34.940Z\",\"latitude\":24.69834858394515,\"longitude\":46.72101619201367}', '13-08-2022', '2022-08-13 14:29:35', '2022-08-13 14:29:35'),
(1954, 16, '{\"time\":\"2022-08-13T14:29:35.934Z\",\"latitude\":24.698353136643746,\"longitude\":46.72101958347778}', '13-08-2022', '2022-08-13 14:29:36', '2022-08-13 14:29:36'),
(1955, 16, '{\"time\":\"2022-08-13T14:29:36.935Z\",\"latitude\":24.698356633610864,\"longitude\":46.72101998080889}', '13-08-2022', '2022-08-13 14:29:37', '2022-08-13 14:29:37'),
(1956, 16, '{\"time\":\"2022-08-13T14:29:37.937Z\",\"latitude\":24.698359690716597,\"longitude\":46.7210184108093}', '13-08-2022', '2022-08-13 14:29:38', '2022-08-13 14:29:38'),
(1957, 16, '{\"time\":\"2022-08-13T14:29:38.932Z\",\"latitude\":24.698354152719087,\"longitude\":46.72100467489244}', '13-08-2022', '2022-08-13 14:29:39', '2022-08-13 14:29:39'),
(1958, 16, '{\"time\":\"2022-08-13T14:29:39.932Z\",\"latitude\":24.69834888246654,\"longitude\":46.720990944395176}', '13-08-2022', '2022-08-13 14:29:40', '2022-08-13 14:29:40'),
(1959, 16, '{\"time\":\"2022-08-13T14:29:49.007Z\",\"latitude\":24.69833827386545,\"longitude\":46.720985510495716}', '13-08-2022', '2022-08-13 14:29:50', '2022-08-13 14:29:50'),
(1960, 16, '{\"time\":\"2022-08-13T14:29:49.930Z\",\"latitude\":24.698335286738388,\"longitude\":46.7209851694916}', '13-08-2022', '2022-08-13 14:29:50', '2022-08-13 14:29:50'),
(1961, 16, '{\"time\":\"2022-08-13T14:29:50.934Z\",\"latitude\":24.698340274931983,\"longitude\":46.720983069668414}', '13-08-2022', '2022-08-13 14:29:51', '2022-08-13 14:29:51'),
(1962, 16, '{\"time\":\"2022-08-13T14:29:51.942Z\",\"latitude\":24.69833866614285,\"longitude\":46.72098511948309}', '13-08-2022', '2022-08-13 14:29:52', '2022-08-13 14:29:52'),
(1963, 16, '{\"time\":\"2022-08-13T14:29:52.938Z\",\"latitude\":24.69833848238482,\"longitude\":46.72098579794487}', '13-08-2022', '2022-08-13 14:29:53', '2022-08-13 14:29:53'),
(1964, 16, '{\"time\":\"2022-08-13T14:29:53.950Z\",\"latitude\":24.698331713864313,\"longitude\":46.72099075015356}', '13-08-2022', '2022-08-13 14:29:54', '2022-08-13 14:29:54'),
(1965, 16, '{\"time\":\"2022-08-13T14:29:54.947Z\",\"latitude\":24.698328468021284,\"longitude\":46.72099661144496}', '13-08-2022', '2022-08-13 14:29:55', '2022-08-13 14:29:55'),
(1966, 16, '{\"time\":\"2022-08-13T14:29:55.942Z\",\"latitude\":24.698325822012414,\"longitude\":46.72100282021458}', '13-08-2022', '2022-08-13 14:29:56', '2022-08-13 14:29:56'),
(1967, 16, '{\"time\":\"2022-08-13T14:29:56.932Z\",\"latitude\":24.698331263486747,\"longitude\":46.72100925799264}', '13-08-2022', '2022-08-13 14:29:57', '2022-08-13 14:29:57'),
(1968, 16, '{\"time\":\"2022-08-13T14:29:57.934Z\",\"latitude\":24.698337623914163,\"longitude\":46.7210063445618}', '13-08-2022', '2022-08-13 14:29:58', '2022-08-13 14:29:58'),
(1969, 16, '{\"time\":\"2022-08-13T14:29:58.937Z\",\"latitude\":24.698338539306196,\"longitude\":46.72100604086191}', '13-08-2022', '2022-08-13 14:29:59', '2022-08-13 14:29:59'),
(1970, 16, '{\"time\":\"2022-08-13T14:29:59.941Z\",\"latitude\":24.69833883375775,\"longitude\":46.72100634081277}', '13-08-2022', '2022-08-13 14:30:00', '2022-08-13 14:30:00'),
(1971, 16, '{\"time\":\"2022-08-13T14:30:00.945Z\",\"latitude\":24.69834029054846,\"longitude\":46.72100507306207}', '13-08-2022', '2022-08-13 14:30:01', '2022-08-13 14:30:01'),
(1972, 16, '{\"time\":\"2022-08-13T14:30:01.948Z\",\"latitude\":24.698341106198818,\"longitude\":46.7210047805771}', '13-08-2022', '2022-08-13 14:30:02', '2022-08-13 14:30:02'),
(1973, 16, '{\"time\":\"2022-08-13T14:30:02.946Z\",\"latitude\":24.698342006331256,\"longitude\":46.721004746655}', '13-08-2022', '2022-08-13 14:30:03', '2022-08-13 14:30:03'),
(1974, 16, '{\"time\":\"2022-08-13T14:30:03.948Z\",\"latitude\":24.698342214629058,\"longitude\":46.721005036583946}', '13-08-2022', '2022-08-13 14:30:04', '2022-08-13 14:30:04'),
(1975, 16, '{\"time\":\"2022-08-13T14:30:04.951Z\",\"latitude\":24.698338620673983,\"longitude\":46.72101009742367}', '13-08-2022', '2022-08-13 14:30:05', '2022-08-13 14:30:05'),
(1976, 16, '{\"time\":\"2022-08-13T14:30:05.932Z\",\"latitude\":24.69832574516116,\"longitude\":46.72101263335429}', '13-08-2022', '2022-08-13 14:30:06', '2022-08-13 14:30:06'),
(1977, 16, '{\"time\":\"2022-08-13T14:30:06.931Z\",\"latitude\":24.69831281814811,\"longitude\":46.721014396580856}', '13-08-2022', '2022-08-13 14:30:07', '2022-08-13 14:30:07'),
(1978, 16, '{\"time\":\"2022-08-13T14:30:07.950Z\",\"latitude\":24.698289560901312,\"longitude\":46.721015889152085}', '13-08-2022', '2022-08-13 14:30:08', '2022-08-13 14:30:08'),
(1979, 16, '{\"time\":\"2022-08-13T14:30:13.948Z\",\"latitude\":24.698016878579196,\"longitude\":46.72098231211821}', '13-08-2022', '2022-08-13 14:30:15', '2022-08-13 14:30:15'),
(1980, 16, '{\"time\":\"2022-08-13T14:30:17.948Z\",\"latitude\":24.697766775788608,\"longitude\":46.72098796621098}', '13-08-2022', '2022-08-13 14:30:18', '2022-08-13 14:30:18'),
(1981, 16, '{\"time\":\"2022-08-13T14:30:22.945Z\",\"latitude\":24.69751411835155,\"longitude\":46.721032811159056}', '13-08-2022', '2022-08-13 14:30:23', '2022-08-13 14:30:23'),
(1982, 16, '{\"time\":\"2022-08-13T14:30:26.942Z\",\"latitude\":24.69722951865224,\"longitude\":46.72108155229967}', '13-08-2022', '2022-08-13 14:30:27', '2022-08-13 14:30:27'),
(1983, 16, '{\"time\":\"2022-08-13T14:30:36.941Z\",\"latitude\":24.696316125647122,\"longitude\":46.72112662220571}', '13-08-2022', '2022-08-13 14:30:38', '2022-08-13 14:30:38'),
(1984, 16, '{\"time\":\"2022-08-13T14:30:45.943Z\",\"latitude\":24.69533548338969,\"longitude\":46.721162432957414}', '13-08-2022', '2022-08-13 14:30:47', '2022-08-13 14:30:47'),
(1985, 16, '{\"time\":\"2022-08-13T14:30:56.937Z\",\"latitude\":24.694405550676446,\"longitude\":46.72118050993909}', '13-08-2022', '2022-08-13 14:30:58', '2022-08-13 14:30:58'),
(1986, 16, '{\"time\":\"2022-08-13T14:31:00.941Z\",\"latitude\":24.694172010651165,\"longitude\":46.721178098423465}', '13-08-2022', '2022-08-13 14:31:01', '2022-08-13 14:31:01'),
(1987, 16, '{\"time\":\"2022-08-13T14:31:04.932Z\",\"latitude\":24.693923697629717,\"longitude\":46.721208677528814}', '13-08-2022', '2022-08-13 14:31:05', '2022-08-13 14:31:05'),
(1988, 16, '{\"time\":\"2022-08-13T14:31:14.938Z\",\"latitude\":24.69369361419722,\"longitude\":46.72121150936916}', '13-08-2022', '2022-08-13 14:31:16', '2022-08-13 14:31:16'),
(1989, 16, '{\"time\":\"2022-08-13T14:31:15.934Z\",\"latitude\":24.693684986870874,\"longitude\":46.721211116637186}', '13-08-2022', '2022-08-13 14:31:16', '2022-08-13 14:31:16'),
(1990, 16, '{\"time\":\"2022-08-13T14:31:16.950Z\",\"latitude\":24.693674669546482,\"longitude\":46.72120922236351}', '13-08-2022', '2022-08-13 14:31:17', '2022-08-13 14:31:17'),
(1991, 16, '{\"time\":\"2022-08-13T14:31:17.931Z\",\"latitude\":24.693664309300537,\"longitude\":46.72120377879401}', '13-08-2022', '2022-08-13 14:31:18', '2022-08-13 14:31:18'),
(1992, 16, '{\"time\":\"2022-08-13T14:31:18.932Z\",\"latitude\":24.693656777330865,\"longitude\":46.72119702220565}', '13-08-2022', '2022-08-13 14:31:19', '2022-08-13 14:31:19'),
(1993, 16, '{\"time\":\"2022-08-13T14:31:19.948Z\",\"latitude\":24.693653593395215,\"longitude\":46.72119663633609}', '13-08-2022', '2022-08-13 14:31:20', '2022-08-13 14:31:20'),
(1994, 16, '{\"time\":\"2022-08-13T14:31:20.946Z\",\"latitude\":24.693653659466662,\"longitude\":46.72118246477796}', '13-08-2022', '2022-08-13 14:31:21', '2022-08-13 14:31:21'),
(1995, 16, '{\"time\":\"2022-08-13T14:31:21.950Z\",\"latitude\":24.693654322999546,\"longitude\":46.721171492247706}', '13-08-2022', '2022-08-13 14:31:22', '2022-08-13 14:31:22'),
(1996, 16, '{\"time\":\"2022-08-13T14:31:22.946Z\",\"latitude\":24.693656214493075,\"longitude\":46.72115289517546}', '13-08-2022', '2022-08-13 14:31:23', '2022-08-13 14:31:23'),
(1997, 16, '{\"time\":\"2022-08-13T14:31:23.947Z\",\"latitude\":24.693660654019734,\"longitude\":46.721118265259}', '13-08-2022', '2022-08-13 14:31:24', '2022-08-13 14:31:24'),
(1998, 16, '{\"time\":\"2022-08-13T14:31:24.970Z\",\"latitude\":24.6936588073374,\"longitude\":46.72111104352582}', '13-08-2022', '2022-08-13 14:31:25', '2022-08-13 14:31:25'),
(1999, 16, '{\"time\":\"2022-08-13T14:31:25.952Z\",\"latitude\":24.693659275319227,\"longitude\":46.72109784531976}', '13-08-2022', '2022-08-13 14:31:26', '2022-08-13 14:31:26'),
(2000, 16, '{\"time\":\"2022-08-13T14:31:26.948Z\",\"latitude\":24.693659005648648,\"longitude\":46.7211003666387}', '13-08-2022', '2022-08-13 14:31:27', '2022-08-13 14:31:27'),
(2001, 16, '{\"time\":\"2022-08-13T14:31:27.950Z\",\"latitude\":24.69365487538032,\"longitude\":46.72110119514053}', '13-08-2022', '2022-08-13 14:31:28', '2022-08-13 14:31:28'),
(2002, 16, '{\"time\":\"2022-08-13T14:31:28.953Z\",\"latitude\":24.69364846960722,\"longitude\":46.72110050997269}', '13-08-2022', '2022-08-13 14:31:29', '2022-08-13 14:31:29'),
(2003, 16, '{\"time\":\"2022-08-13T14:31:29.957Z\",\"latitude\":24.69363781294347,\"longitude\":46.72110345196874}', '13-08-2022', '2022-08-13 14:31:30', '2022-08-13 14:31:30'),
(2004, 16, '{\"time\":\"2022-08-13T14:31:30.945Z\",\"latitude\":24.693627424520127,\"longitude\":46.72110814896225}', '13-08-2022', '2022-08-13 14:31:31', '2022-08-13 14:31:31'),
(2005, 16, '{\"time\":\"2022-08-13T14:31:31.946Z\",\"latitude\":24.693614175239095,\"longitude\":46.72111232619168}', '13-08-2022', '2022-08-13 14:31:32', '2022-08-13 14:31:32'),
(2006, 16, '{\"time\":\"2022-08-13T14:31:32.944Z\",\"latitude\":24.69359791834484,\"longitude\":46.721108885658865}', '13-08-2022', '2022-08-13 14:31:34', '2022-08-13 14:31:34'),
(2007, 16, '{\"time\":\"2022-08-13T14:31:33.943Z\",\"latitude\":24.693582075466985,\"longitude\":46.72111166716209}', '13-08-2022', '2022-08-13 14:31:34', '2022-08-13 14:31:34'),
(2008, 16, '{\"time\":\"2022-08-13T14:31:34.931Z\",\"latitude\":24.69356763605157,\"longitude\":46.72112462225794}', '13-08-2022', '2022-08-13 14:31:35', '2022-08-13 14:31:35'),
(2009, 16, '{\"time\":\"2022-08-13T14:31:35.948Z\",\"latitude\":24.693552388017554,\"longitude\":46.72112821737841}', '13-08-2022', '2022-08-13 14:31:36', '2022-08-13 14:31:36'),
(2010, 16, '{\"time\":\"2022-08-13T14:31:36.948Z\",\"latitude\":24.693534875787236,\"longitude\":46.72112517921282}', '13-08-2022', '2022-08-13 14:31:37', '2022-08-13 14:31:37'),
(2011, 16, '{\"time\":\"2022-08-13T14:31:37.945Z\",\"latitude\":24.693519246447103,\"longitude\":46.72112363227947}', '13-08-2022', '2022-08-13 14:31:38', '2022-08-13 14:31:38'),
(2012, 16, '{\"time\":\"2022-08-13T14:31:38.947Z\",\"latitude\":24.693504235980768,\"longitude\":46.72111908981549}', '13-08-2022', '2022-08-13 14:31:39', '2022-08-13 14:31:39'),
(2013, 16, '{\"time\":\"2022-08-13T14:31:39.943Z\",\"latitude\":24.693490925194794,\"longitude\":46.72111035834183}', '13-08-2022', '2022-08-13 14:31:40', '2022-08-13 14:31:40'),
(2014, 16, '{\"time\":\"2022-08-13T14:31:40.949Z\",\"latitude\":24.69347673479627,\"longitude\":46.7211085572166}', '13-08-2022', '2022-08-13 14:31:41', '2022-08-13 14:31:41'),
(2015, 16, '{\"time\":\"2022-08-13T14:31:41.945Z\",\"latitude\":24.693464503797898,\"longitude\":46.721106917043336}', '13-08-2022', '2022-08-13 14:31:42', '2022-08-13 14:31:42'),
(2016, 16, '{\"time\":\"2022-08-13T14:31:42.942Z\",\"latitude\":24.693456682742955,\"longitude\":46.72110439728815}', '13-08-2022', '2022-08-13 14:31:43', '2022-08-13 14:31:43'),
(2017, 16, '{\"time\":\"2022-08-13T14:31:43.944Z\",\"latitude\":24.69345244217616,\"longitude\":46.72109965446918}', '13-08-2022', '2022-08-13 14:31:44', '2022-08-13 14:31:44'),
(2018, 16, '{\"time\":\"2022-08-13T14:31:44.940Z\",\"latitude\":24.69344952859666,\"longitude\":46.72110396434253}', '13-08-2022', '2022-08-13 14:31:45', '2022-08-13 14:31:45'),
(2019, 16, '{\"time\":\"2022-08-13T14:31:45.947Z\",\"latitude\":24.693443902723274,\"longitude\":46.721104530276236}', '13-08-2022', '2022-08-13 14:31:46', '2022-08-13 14:31:46'),
(2020, 16, '{\"time\":\"2022-08-13T14:31:46.945Z\",\"latitude\":24.69343103703847,\"longitude\":46.7211161435947}', '13-08-2022', '2022-08-13 14:31:47', '2022-08-13 14:31:47'),
(2021, 16, '{\"time\":\"2022-08-13T14:31:47.951Z\",\"latitude\":24.69341608565014,\"longitude\":46.72112140871797}', '13-08-2022', '2022-08-13 14:31:48', '2022-08-13 14:31:48');
INSERT INTO `track_employees` (`id`, `user_id`, `location`, `date`, `created_at`, `updated_at`) VALUES
(2022, 16, '{\"time\":\"2022-08-13T14:31:48.949Z\",\"latitude\":24.693399804156936,\"longitude\":46.72111333130678}', '13-08-2022', '2022-08-13 14:31:49', '2022-08-13 14:31:49'),
(2023, 16, '{\"time\":\"2022-08-13T14:31:49.950Z\",\"latitude\":24.69337874570824,\"longitude\":46.721109495312895}', '13-08-2022', '2022-08-13 14:31:50', '2022-08-13 14:31:50'),
(2024, 16, '{\"time\":\"2022-08-13T14:31:50.945Z\",\"latitude\":24.693358149402584,\"longitude\":46.72111143859065}', '13-08-2022', '2022-08-13 14:31:51', '2022-08-13 14:31:51'),
(2025, 16, '{\"time\":\"2022-08-13T14:31:51.947Z\",\"latitude\":24.693339473480297,\"longitude\":46.72111001026642}', '13-08-2022', '2022-08-13 14:31:52', '2022-08-13 14:31:52'),
(2026, 16, '{\"time\":\"2022-08-13T14:31:52.944Z\",\"latitude\":24.693322856320002,\"longitude\":46.721105118773}', '13-08-2022', '2022-08-13 14:31:53', '2022-08-13 14:31:53'),
(2027, 16, '{\"time\":\"2022-08-13T14:31:53.950Z\",\"latitude\":24.693308655418065,\"longitude\":46.721097658096355}', '13-08-2022', '2022-08-13 14:31:54', '2022-08-13 14:31:54'),
(2028, 16, '{\"time\":\"2022-08-13T14:31:54.942Z\",\"latitude\":24.69329684506315,\"longitude\":46.72108825841615}', '13-08-2022', '2022-08-13 14:31:55', '2022-08-13 14:31:55'),
(2029, 16, '{\"time\":\"2022-08-13T14:31:55.949Z\",\"latitude\":24.69328727050779,\"longitude\":46.72107951357809}', '13-08-2022', '2022-08-13 14:31:56', '2022-08-13 14:31:56'),
(2030, 16, '{\"time\":\"2022-08-13T14:31:56.941Z\",\"latitude\":24.693284791836362,\"longitude\":46.721063032497305}', '13-08-2022', '2022-08-13 14:31:57', '2022-08-13 14:31:57'),
(2031, 16, '{\"time\":\"2022-08-13T14:31:57.947Z\",\"latitude\":24.693313688054204,\"longitude\":46.72102887325975}', '13-08-2022', '2022-08-13 14:31:58', '2022-08-13 14:31:58'),
(2032, 16, '{\"time\":\"2022-08-13T14:32:02.943Z\",\"latitude\":24.693280571208884,\"longitude\":46.72075822028808}', '13-08-2022', '2022-08-13 14:32:03', '2022-08-13 14:32:03'),
(2033, 16, '{\"time\":\"2022-08-13T14:32:06.944Z\",\"latitude\":24.69319209970765,\"longitude\":46.72047230265223}', '13-08-2022', '2022-08-13 14:32:07', '2022-08-13 14:32:07'),
(2034, 16, '{\"time\":\"2022-08-13T14:32:19.945Z\",\"latitude\":24.692997310070833,\"longitude\":46.71944999870241}', '13-08-2022', '2022-08-13 14:32:21', '2022-08-13 14:32:21'),
(2035, 16, '{\"time\":\"2022-08-13T14:32:37.943Z\",\"latitude\":24.692818301824246,\"longitude\":46.71847529768059}', '13-08-2022', '2022-08-13 14:32:39', '2022-08-13 14:32:39'),
(2036, 16, '{\"time\":\"2022-08-13T14:32:38.946Z\",\"latitude\":24.692826315632228,\"longitude\":46.71846000403501}', '13-08-2022', '2022-08-13 14:32:39', '2022-08-13 14:32:39'),
(2037, 16, '{\"time\":\"2022-08-13T14:32:39.950Z\",\"latitude\":24.692828661651202,\"longitude\":46.718455175795754}', '13-08-2022', '2022-08-13 14:32:40', '2022-08-13 14:32:40'),
(2038, 16, '{\"time\":\"2022-08-13T14:32:40.941Z\",\"latitude\":24.692828079939932,\"longitude\":46.718450826473585}', '13-08-2022', '2022-08-13 14:32:41', '2022-08-13 14:32:41'),
(2039, 16, '{\"time\":\"2022-08-13T14:32:41.940Z\",\"latitude\":24.692829222720167,\"longitude\":46.71844582770828}', '13-08-2022', '2022-08-13 14:32:42', '2022-08-13 14:32:42'),
(2040, 16, '{\"time\":\"2022-08-13T14:32:42.921Z\",\"latitude\":24.692836996263427,\"longitude\":46.71844543863124}', '13-08-2022', '2022-08-13 14:32:43', '2022-08-13 14:32:43'),
(2041, 16, '{\"time\":\"2022-08-13T14:32:43.925Z\",\"latitude\":24.69283530345153,\"longitude\":46.718433602911546}', '13-08-2022', '2022-08-13 14:32:44', '2022-08-13 14:32:44'),
(2042, 16, '{\"time\":\"2022-08-13T14:32:44.921Z\",\"latitude\":24.692848013905373,\"longitude\":46.718423001256106}', '13-08-2022', '2022-08-13 14:32:45', '2022-08-13 14:32:45'),
(2043, 16, '{\"time\":\"2022-08-13T14:32:45.947Z\",\"latitude\":24.692862445796028,\"longitude\":46.71839701747278}', '13-08-2022', '2022-08-13 14:32:46', '2022-08-13 14:32:46'),
(2044, 16, '{\"time\":\"2022-08-13T14:32:46.945Z\",\"latitude\":24.692879534341966,\"longitude\":46.718358088613094}', '13-08-2022', '2022-08-13 14:32:47', '2022-08-13 14:32:47'),
(2045, 16, '{\"time\":\"2022-08-13T14:32:51.945Z\",\"latitude\":24.692971357951144,\"longitude\":46.71811178138423}', '13-08-2022', '2022-08-13 14:32:52', '2022-08-13 14:32:52'),
(2046, 16, '{\"time\":\"2022-08-13T14:32:56.943Z\",\"latitude\":24.692878308197596,\"longitude\":46.717852490908754}', '13-08-2022', '2022-08-13 14:32:57', '2022-08-13 14:32:57'),
(2047, 16, '{\"time\":\"2022-08-13T14:33:00.947Z\",\"latitude\":24.69268986073009,\"longitude\":46.7176817585826}', '13-08-2022', '2022-08-13 14:33:01', '2022-08-13 14:33:01'),
(2048, 16, '{\"time\":\"2022-08-13T14:33:05.946Z\",\"latitude\":24.692528181386706,\"longitude\":46.717504792456374}', '13-08-2022', '2022-08-13 14:33:06', '2022-08-13 14:33:06'),
(2049, 16, '{\"time\":\"2022-08-13T14:33:11.948Z\",\"latitude\":24.692369504052163,\"longitude\":46.717250885741905}', '13-08-2022', '2022-08-13 14:33:13', '2022-08-13 14:33:13'),
(2050, 16, '{\"time\":\"2022-08-13T14:33:15.949Z\",\"latitude\":24.69222394047675,\"longitude\":46.716950392602676}', '13-08-2022', '2022-08-13 14:33:16', '2022-08-13 14:33:16'),
(2051, 16, '{\"time\":\"2022-08-13T14:33:24.948Z\",\"latitude\":24.69168300691748,\"longitude\":46.716105765101204}', '13-08-2022', '2022-08-13 14:33:26', '2022-08-13 14:33:26'),
(2052, 16, '{\"time\":\"2022-08-13T14:33:34.943Z\",\"latitude\":24.690982441061056,\"longitude\":46.71538098329874}', '13-08-2022', '2022-08-13 14:33:36', '2022-08-13 14:33:36'),
(2053, 16, '{\"time\":\"2022-08-13T14:33:43.948Z\",\"latitude\":24.690280125250013,\"longitude\":46.714708175801675}', '13-08-2022', '2022-08-13 14:33:45', '2022-08-13 14:33:45'),
(2054, 16, '{\"time\":\"2022-08-13T14:33:51.946Z\",\"latitude\":24.689688288008334,\"longitude\":46.71394335631893}', '13-08-2022', '2022-08-13 14:33:53', '2022-08-13 14:33:53'),
(2055, 16, '{\"time\":\"2022-08-13T14:34:08.947Z\",\"latitude\":24.688668033923012,\"longitude\":46.71190151853486}', '13-08-2022', '2022-08-13 14:34:10', '2022-08-13 14:34:10'),
(2056, 16, '{\"time\":\"2022-08-13T14:34:26.941Z\",\"latitude\":24.686614574378247,\"longitude\":46.71134871434536}', '13-08-2022', '2022-08-13 14:34:28', '2022-08-13 14:34:28'),
(2057, 16, '{\"time\":\"2022-08-13T14:34:43.947Z\",\"latitude\":24.68468513883306,\"longitude\":46.710429122788646}', '13-08-2022', '2022-08-13 14:34:45', '2022-08-13 14:34:45'),
(2058, 16, '{\"time\":\"2022-08-13T14:34:59.935Z\",\"latitude\":24.682928118819103,\"longitude\":46.70904733351287}', '13-08-2022', '2022-08-13 14:35:01', '2022-08-13 14:35:01'),
(2059, 16, '{\"time\":\"2022-08-13T14:35:15.946Z\",\"latitude\":24.681190037606143,\"longitude\":46.70767159966027}', '13-08-2022', '2022-08-13 14:35:17', '2022-08-13 14:35:17'),
(2060, 16, '{\"time\":\"2022-08-13T14:35:32.939Z\",\"latitude\":24.679487793883673,\"longitude\":46.7063731238929}', '13-08-2022', '2022-08-13 14:35:34', '2022-08-13 14:35:34');

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `id` int(10) UNSIGNED NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_original_name` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `file_size` int(11) DEFAULT NULL,
  `extension` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uploads`
--

INSERT INTO `uploads` (`id`, `file_name`, `file_original_name`, `user_id`, `file_size`, `extension`, `type`, `created_at`, `updated_at`) VALUES
(1, 'uploads/all/image3cbd2c6b753da074d408494dc27cb1c1.jpg', 'Moist-Chicken-Burgers.jpg', 1, NULL, 'jpg', 'image', '2022-05-24 10:23:40', '2022-05-24 10:23:40'),
(2, 'uploads/all/imagec83ef26a9b2538f0b623007d21e5a845.jpeg', 'WhatsApp Image 2022-05-24 at 5.08.27 PM.jpeg', 1, NULL, 'jpeg', 'image', '2022-05-24 11:40:55', '2022-05-24 11:40:55'),
(3, 'uploads/all/image67e6ae0dd71d1f2856e0cec30ff69f37.jpg', '9vfaOSKpD3ucVSozyEXD3lL6DPEl9iGsRD4alkaw.jpg', 480, NULL, 'jpg', 'image', '2022-10-14 14:08:20', '2022-10-14 14:08:20'),
(4, 'uploads/all/image3145cc63fd9a6439ccbcaeaf022ef6a8.jpg', '--_17882cde7b8_medium.jpg', 480, NULL, 'jpg', 'image', '2022-10-14 14:09:31', '2022-10-14 14:09:31');

-- --------------------------------------------------------

--
-- Table structure for table `useraddresses`
--

CREATE TABLE `useraddresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `permanent_address` varchar(100) DEFAULT NULL,
  `permanent_city` varchar(100) DEFAULT NULL,
  `permanent_state` varchar(100) DEFAULT NULL,
  `permanent_country` varchar(100) DEFAULT NULL,
  `permanent_pincode` varchar(100) DEFAULT NULL,
  `residential_address` varchar(100) DEFAULT NULL,
  `residential_city` varchar(100) DEFAULT NULL,
  `residential_state` varchar(100) DEFAULT NULL,
  `residential_country` varchar(100) DEFAULT NULL,
  `residential_pincode` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `useraddresses`
--

INSERT INTO `useraddresses` (`id`, `user_id`, `permanent_address`, `permanent_city`, `permanent_state`, `permanent_country`, `permanent_pincode`, `residential_address`, `residential_city`, `residential_state`, `residential_country`, `residential_pincode`, `created_at`, `updated_at`) VALUES
(1, 1, 'chennamagaloor mukkam', 'kozhikode', 'kerala', 'india', '673602', 'mukkom', 'calicut', 'kerala', 'India', '673602', NULL, NULL),
(2, 28, 'POOLAMANNIL (H), KAKKAD, KARASSERY (PO)', 'MUKKAM', 'KERALA', 'INDIA', '673602', 'POOLAMANNIL (H), KAKKAD, KARASSERY (PO)', 'MUKKAM', 'KERALA', 'INDIA', '673602', NULL, NULL),
(3, 40, 'Cheerath (H), kizhuparamba, Areekode', 'Malappuram', 'Kerala', 'India', '673639', 'Cheerath (H), Kizhuparamba, Areekode', 'Malappuram', 'Kerala', 'India', '673639', NULL, NULL),
(4, 41, 'Karunthattil Parambu, Nallalam', 'kozhikode', 'Kerala', 'India', '673027', 'Karunthattil Parambu, Nallalam', 'Kozhikode', 'Kerala', 'India', '673027', NULL, NULL),
(5, 44, 'Lower Kakkad,Kakkadampoyil (PO)', 'Kozhikode', 'Kerala', 'India', '673604', 'Lower kakkad, Kakkadam poyil', 'Kozhikode', 'Kerala', 'India', '673604', NULL, NULL),
(6, 45, 'Kunnath (H), Kodiyathur, Mukkam', 'Kozhikode', 'Kerala', 'India', '673602', 'Kunnath (H), Kodiyathur, mukkam', 'Kozhikode', 'Kerala', 'India', '673602', NULL, NULL),
(7, 49, 'Chennamangallur', 'kozhikode', 'Kerala', 'India', '673602', 'Chennamangallur', 'Kozhikode', 'Kerala', 'india', '673602', NULL, NULL),
(8, 52, 'Mukkam', 'Kozhikode', 'Kerala', 'India', '673602', 'Mukkam', 'Kozhikode', 'Kerala', 'India', '673602', NULL, NULL),
(9, 97, 'Cholakkal, Eranhimavu, Mukkam', 'Kozhikode', 'Kerala', 'India', '673602', '', '', '', '', '', NULL, NULL),
(10, 98, 'Kandathil Paamu, Karoor, Ambalappuzha', 'Alappuzha', 'Kerala', 'India', '688561', '', '', '', '', '', NULL, NULL),
(11, 100, 'POLY HOUSE', 'MACOOR (PO) KOZHIKODE', 'Kerala', 'India', '673661', 'POLY HOUSE ', 'MAVOOR PO KOZHIKODE', 'KERALA', 'India', '673661', NULL, NULL),
(12, 163, 'Kodiyathur, Mukkam', 'Kozhikode', 'kerala', 'India', '673602', 'Kodiyathur, Mukkam', 'Kozhikode', 'kerala', 'India', '673602', NULL, NULL),
(13, 164, 'Oyalott,Chennamangallur, Mukkam', 'Kozhikode', 'kerala', 'India', '673602', 'Oyalott, Chennamangallur, Mukkam', 'Kozhikode', 'kerala', 'India', '673602', NULL, NULL),
(14, 176, 'Nayarkuyi, Mukkam', 'kozhikode', 'kerala', 'india', '673601', '', '', '', '', '', NULL, NULL),
(15, 178, 'Thazhathu veettil, Koolimade', 'kozhikode', 'kerala', 'India', '673661', '', '', '', '', '', NULL, NULL),
(16, 179, 'South kodiyathur, Kodiyathur (PO)', 'kozhikode', 'kerala', 'India', '673602', '', '', '', '', '', NULL, NULL),
(17, 180, 'Theyyathum Kadavu, Kodiyathur, Mukkam', 'kozhikode', 'kerala', 'India', '673602', '', '', '', '', '', NULL, NULL),
(18, 181, 'Kodiyathur ,Mukkam', 'kozhikode', 'kerala', 'India', '673602', 'Kodiyathur ,Mukkam', 'kozhikode', 'kerala', 'India', '673602', NULL, NULL),
(19, 182, 'Pilakkootathil, Kottapadam', 'Palakkad', 'kerala', 'India', '679534', 'Mampetta, mukkam', 'kozhikode', 'kerala', 'India', '673602', NULL, NULL),
(20, 183, '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(21, 184, 'Panakkottil House, Chennamangallur Post, Mukkam', 'kozhikode', 'kerala', 'India', '673602', 'Panakkottil House, Chennamangallur Post, Mukkam', 'kozhikode', 'kerala', 'India', '673602', NULL, NULL),
(22, 185, 'Meenpetta (H), Kodiyathur (po)', 'kozhikode', 'kerala', 'India', '673602', 'Meenpetta (H), Kodiyathur (po)', 'kozhikode', 'kerala', 'India', '673602', NULL, NULL),
(23, 186, 'Nellikaparambil, mukkam', 'kozhikode', 'kerala', 'India', '673602', '', '', '', '', '', NULL, NULL),
(24, 201, 'Kalathingal, Nayarkuzhi,', 'KOZHIKODE', 'KERALA', 'INDIA', '673602', '', '', '', '', '', NULL, NULL),
(25, 218, '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(26, 275, '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(27, 277, '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(28, 301, 'Kokkadan (H), Kuniyil, Kizhuparamba', 'Malappuram', 'Kerala', 'India', '973639', 'Kokkadan (H), Kuniyil, Kizhuparamba', 'malappuram', 'Kerala', 'India', '673639', NULL, NULL),
(29, 302, 'Darulhuda Valachukettiyil (H), chennamangallur (PO), Mukkam', 'Kozhikode', 'Kerala', 'India', '673602', 'Darulhuda Valachukettiyil (H), chennamangallur (PO), Mukkam', 'Kozhikode', 'Kerala', 'India', '673602', NULL, NULL),
(30, 313, '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(31, 315, 'Kodiyathur ,Mukkam', 'kozhikode', 'kerala', 'India', '673602', '', '', '', '', '', NULL, NULL),
(32, 316, 'Kodiyathur ,Mukkam', 'kozhikode', 'kerala', 'India', '673602', '', '', '', '', '', NULL, NULL),
(33, 334, 'Kollolathil (H), kodiyathur', 'Mukkam', 'Kerala', 'India', '673602', 'Kollolathil (H), kodiyathur', 'Mukkam', 'Kerala', 'India', '673602', NULL, NULL),
(34, 335, 'Akkaradathil (H), West Chennamangallur (PO)', 'Mukkam', 'Kerala', 'India', '673602', 'Akkaradathil (H), West Chennamangallur (PO)', 'Mukkam', 'Kerala', 'India', '673602', NULL, NULL),
(35, 337, 'Ozhuparakkal (H), Kodiyathur (PO), Mukkam', 'Kozhikode', 'Kerala', 'India', '673602', 'Ozhuparakkal (H), Kodiyathur (PO), Mukkam', 'Kozhikode', 'Kerala', 'India', '673602', NULL, NULL),
(36, 353, 'VALLATHODI (h)', 'Kuniyil', 'Kerala', 'India', '673602', 'VALLATHODI (h)', 'Kuniyil', 'Kerala', 'India', '673602', NULL, NULL),
(37, 358, 'Mekkuth (H), Attupuram Colony, Chennamangallur', 'Kozhikode', 'Kerala', 'India', '673602', 'Mekkuth (H), Attupuram Colony, Chennamangallur', 'Mukkam', 'Kerala', 'India', '673602', NULL, NULL),
(38, 365, '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(39, 366, 'CHAPPANGA THODIKAYIL (H) NEELESWARAM (PO)', 'OMASSERY', 'KERALA', '', '673582', '', '', '', '', '', NULL, NULL),
(40, 368, 'Valiyaparambath House', 'Areekode', 'kerala', 'India', '763639', '', '', '', '', '', NULL, NULL),
(41, 373, 'Shabna manzil, kuyyil, Kodiyathur PO', 'Kodiyathur', 'Kerala', 'India', '673602', '', '', '', '', '', NULL, NULL),
(42, 374, 'Umminithodi House ', 'Kezhuparamb', 'Kerala', 'India', '673639', '', '', '', '', '', NULL, NULL),
(43, 375, 'Periyattu House', 'Mukkam', 'Kerala', 'India', '673602', '', '', '', '', '', NULL, NULL),
(44, 376, 'paruthiparammal House ,Vellalassery PO', 'Vellalassery', 'Kozhikode', 'India', '673601', '', '', '', '', '', NULL, NULL),
(45, 378, 'Pulparamb', 'Chennamangallur', 'Kerala', 'India', '673602', '', '', '', '', '', NULL, NULL),
(46, 379, 'palakkal ', 'Chennamangallur', 'Kerala', 'India', '673602', 'Mangalassery House', '', '', '', '', NULL, NULL),
(47, 380, 'Panangodan', 'Chennamangallur', 'Kerala', 'India', '673602', '', '', '', '', '', NULL, NULL),
(48, 381, 'Vattakandathil House', 'Chennamangallur', 'Kerala', 'India', '673602', '', '', '', '', '', NULL, NULL),
(49, 382, 'Mangalassery ', 'Chennamangallur', 'Kerala', 'India', '673602', '', '', '', '', '', NULL, NULL),
(50, 383, 'Sadique cheruvady', 'kuriyedath House', 'Kerala', 'India', '673602', '', '', '', '', '', NULL, NULL),
(51, 384, 'Mangalassery House', 'Chennamangallur', 'Kerala', 'India', '673602', '', '', '', '', '', NULL, NULL),
(52, 385, 'Kuyyil ,Kakkad', 'Kodiyathur', 'Kerala', 'India', '673602', '', '', '', '', '', NULL, NULL),
(53, 391, 'Valiyapeediyakkal (H)', 'Thekkumuri, Urungattiri', 'Kerala', 'India', '', '', '', '', '', '', NULL, NULL),
(54, 392, '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(55, 393, 'VAYANA HOUSE CHENNAMANGALLUR (PO) MUKKAM, ', 'Kozhikode', 'kerala', 'India', '673602', '', '', '', '', '', NULL, NULL),
(56, 394, '', '', '', '', '', 'Panakottil House ', 'Chennamangallur', 'Kerala', 'India', '673602', NULL, NULL),
(57, 395, 'Mannil house mysoormala po mukklam', 'Mukkam', 'Kerala', 'India', '673602', '', '', '', '', '', NULL, NULL),
(58, 396, 'Pallithodika House Kodiyathur', 'Kodiyathur', 'Kerala', 'India', '673602', '', '', '', '', '', NULL, NULL),
(59, 398, 'South kodiyathur, Kodiyathur (PO)', 'kozhikode', 'kerala', 'India', '673602', '', 'Mukkam', 'Kerala', 'India', '673602', NULL, NULL),
(60, 402, 'S/O Abdul Hameed C.P Cheriyampilakkal house Kizhuparamba', 'Malappuram', 'Kerala', 'India', '673639', '', '', '', '', '', NULL, NULL),
(61, 403, 'S/O Muhammed Shareef PP, Puthan Peedika, Puthalam Areecode, ', 'Malappuram', 'Kerala', 'India', '6736039', '', '', '', '', '', NULL, NULL),
(62, 404, 'Shabnas Kadamballi, Chennamangallur PO Mukkam', 'MUKKAM', 'KERALA', 'India', '673602', 'Shabnas Kadamballi, Chennamangallur PO Mukkam', '', '', '', '', NULL, NULL),
(63, 405, 'Sarkarparambu (H) Nellikaparamb (PO) Mukkam', 'Mukkam', 'Kerala', 'India', '673602', '', '', '', '', '', NULL, NULL),
(64, 406, 'Thottathil (H) Nayarkuzhi NIT', 'Kozhikode', 'Kerala', 'India', '673601', '', '', '', '', '', NULL, NULL),
(65, 407, 'Karimbanakandy (H) chennamangalore (PO) Mukkam ', 'kozhikode', 'kerala', 'India', '673602', '', '', '', '', '', NULL, NULL),
(66, 408, 'Karattil (H) Karumarakkad (Po) Vazhakkad Malappuram', 'Malappuram', 'Kerala', 'India', '673640', '', '', '', '', '', NULL, NULL),
(67, 409, '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(68, 410, 'Kuttippalackel (H) Edalampatt, Murigampurayi, Kumaranellur (Po) Mukkam', 'Kozhikode', 'Kerala', 'India', '673602', '', '', '', '', '', NULL, NULL),
(69, 411, '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(70, 412, '', '', '', '', '', 'Pallattil house Nellikuth (po)', 'Manjery', 'Kerala', 'INDIA', '676122', NULL, NULL),
(71, 413, '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(72, 414, '', '', '', '', '', 'Mm house, vadinoor kuniyil, kizhuparamba po', 'malappuram', 'kerala', '', '', NULL, NULL),
(73, 415, 'kaliyedath house chennamangalore mukkam', 'kozhikode', 'kerala', 'india', '673602', '', '', '', '', '', NULL, NULL),
(74, 416, 'keezhmuthedath house , vazhayur post', 'malappuram', 'kerala', 'india', '673633', '', '', '', '', '', NULL, NULL),
(75, 418, 'Kallivalappil anaayamkunnu mukkam', 'KZOHIKODE', 'KERALA', 'India', '673602', '', '', '', '', '', NULL, NULL),
(76, 419, 'KALAYATH, MUKKAM, KUMARANELLUR PO', 'KOZHIKODE', 'KERALA', 'INDIA', '673602', '', '', '', '', '', NULL, NULL),
(77, 420, 'MANAGALASSERY THOTTAM, CHENNAMANGALUR, MUKKAM, THAZHEKODE ', 'KOZHIKODE', 'KERALA', 'INDIA', '673602', '', '', '', '', '', NULL, NULL),
(78, 421, 'PALIYIL HOUSE, MUKKAM VIA, CHENNAMANGALLUR PO', 'KOZHIKODE', 'KERALA', 'INDIA', '673602', '', '', '', '', '', NULL, NULL),
(79, 422, 'JASEEL AHAMED MS S/O ABDUSSALAM MS SRAMBIYAKKAL HOUSE, MUNDUMUZHI VAZHAKKAD', 'MALAPPURAM', 'KERALA', 'INDIA', '673640', '', '', '', '', '', NULL, NULL),
(80, 424, '', '', '', '', '', '', 'mukkam', 'kerala', 'india', '673602', NULL, NULL),
(81, 425, '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(82, 427, 'Ottayil (H), Patterladavue PO, Malappuram-676519, Kerala', 'MALAPPURAM', 'KERALA', 'INDIA', '676519', '', '', '', '', '', NULL, NULL),
(83, 428, 'KOODARNJI', 'KOZHIKODE', 'KERALA', 'INDIA', '673603', '', '', '', '', '', NULL, NULL),
(84, 429, '', '', '', '', '', '', '', '', '', '', NULL, NULL),
(85, 430, 'Cherikkammmal hpuse kunnamangalam', 'kozhikode', 'kerala', 'India', '673571', '', '', '', '', '', NULL, NULL),
(86, 431, 'PANAKKOTTIL HOUSE THAZHECODE, KOZHIKODE', 'KOZHIKODE', 'KERALA', 'INDIA', '673602', '', '', '', '', '', NULL, NULL),
(87, 432, 'CHATHAPARAMBIL, KODIYATHUR, KOZHIKODE', 'KOZHIKODE', 'KERALA', 'INDIA', '673602', '', '', '', '', '', NULL, NULL),
(88, 433, 'KANIYATH (H),GOTHAMBA ROAD, NELLIKKAPARAMBU (PO), MUKKAM,673602', 'kozhikode', 'kerala', 'india', '673602', '', '', '', '', '', NULL, NULL),
(89, 434, 'Saneera manzil (h) kodiyathur (po) mukkam , kozhikode -673602', 'kozhikode', 'kerala', 'India', '673602', 'Saneera manzil (h) kodiyathur (po) mukkam , kozhikode -673602', 'KOZHIKODE', 'KERALA', 'India', '673602', NULL, NULL),
(90, 435, 'PARATHODIKA, THARIYODE, PO. THOTTUMUKKAM, AREECODE, THOTTUMUKKAM, MALAPPURAM', 'MALAPPURAM', 'KERALA', 'INDIA', '673639', '', '', '', '', '', NULL, NULL),
(91, 436, 'BAVA PK PILAKOOTTATHIL HOUSE, PO KOTTAPADAM, THRITHALA', 'PALAKKAD', 'KERALA', 'India', '679534', 'MANNIL HOUSE MURIGANPURAYIL MUKKAM', 'KOZHIKODE', 'KERALA', 'INDIA', '673602', NULL, NULL),
(92, 437, 'S/O MUHAMMED, VALAKKANDATHIL, KALLURITY, NEELESHARAM', 'KOZHIKODE', 'KERALA', 'INDIA', '673602', '', '', '', '', '', NULL, NULL),
(93, 438, 'KOODATHINGAL (H) KAYYITTAPOYIL MUKKAM POST', 'KOZHIKODE', 'KERALA', 'India', '673602', '', '', '', '', '', NULL, NULL),
(94, 439, 'Mullaparambil Houise Mavoor Cheroopa', 'KOZHIKODE', 'KERALA', 'INDIA', '673661', '', '', '', '', '', NULL, NULL),
(95, 440, 'EDATHIL HOUSE, KAKKAD, KARASSERY PO KAKKAD VILLAGE', 'KOZHIKODE', 'KERALA', 'INDIA', '673602', '', '', '', '', '', NULL, NULL),
(96, 441, '', '', '', '', '', 'KIZHAKKAPURAYIL (H) MUKKAM VIA MANASSERY VATTOLIPARAMBU', 'MANASSERY', 'KERALA', 'INDIA', '673602', NULL, NULL),
(97, 442, 'AREEPUZHA (H) MUKKAM POST THONDIMAL CHERUPRA ', 'MUKKAM', 'KERALA', 'INDIA', '673602', '', '', '', '', '', NULL, NULL),
(98, 443, 'KOZHIMANNIL HOUSE KOOLIMADU PAZHOOR POST MAVOOR', 'MAVOOR', 'kerala', 'INDIA', '673661', '', '', '', '', '', NULL, NULL),
(99, 444, 'POOMUGHAM HOUSE KARRASSERY POST MUKKAM', 'MUKKAM', 'kerala', 'INDIA', '673602', '', '', '', '', '', NULL, NULL),
(100, 446, 'PLEASANT HOUSE PATHANAPURAM  VALILLAPUZHA PO', 'AREECODE', 'KERALA', 'INDIA', '673639', '', '', '', '', '', NULL, NULL),
(101, 447, 'MEETHAL VEETIL WES KODIYATHUR', 'KODIYATHUR', 'KERALA', 'INDIA', '673602', '', '', '', '', '', NULL, NULL),
(102, 448, 'THOTTIYAN HOUSE KARASSERY KAKKAD KOZHIKODE', 'MUKKAM', 'KERALA', 'INDIA', '673602', '', '', '', '', '', NULL, NULL),
(103, 449, 'KUNNATH HOUSE KOOLIMADU PAZHUR POOLAKODE', 'KOZHIKODE', 'KERALA', 'INDIA', '673661', '', '', '', '', '', NULL, NULL),
(104, 450, 'PEECHAM POYIL PP  MUKKAM, KUMARANELLUR', 'MUKKAM, KOZHIKODE', 'KERALA', 'INDIA', '673602', '', '', '', '', '', NULL, NULL),
(105, 451, 'KUNNERIMMAL, ANAYAMKUNNU, MUKKAM KUMARANELLUR', 'KOZHIKODE', 'KERALA', 'INDIA', '673602', '', '', '', '', '', NULL, NULL),
(106, 453, 'MANNATHAZHATH HOUSE, KOODATHAI, BAZAR POST THAMARASSERY', 'KOZHIKODE', 'KERALA', 'INDIA', '', '', '', '', '', '', NULL, NULL),
(107, 454, 'CHITTANOOR HOUSE PERITHALMANNA POST EDAVANNA VIE OTHAYI', 'MALAPPURAM', 'KERALA', 'INDIA', '', '', '', '', '', '', NULL, NULL),
(108, 455, 'OLERIKUNNUMAL, NAYARKUZHI, POOLACODE,', 'KOZHIKODE', 'KERALA', 'INDIA', '673601', '', '', '', '', '', NULL, NULL),
(109, 456, 'MATTATHODIKAYIL HOUSE , CHATHAMANGALAM POST, NIT VIA', 'KOZHIKODE', 'KERALA', 'INDIA', '673601', '', '', '', '', '', NULL, NULL),
(110, 457, 'Ashiq Rahman PK s/o Basheer, Punachikuzhil, Poovattuparamba, Peruvayal cherukulathur', 'kozhikode', 'kerala', 'india', '673008', '', '', '', '', '', NULL, NULL),
(111, 458, 'MUHAMMED SHAHEER PK, S/O ABDUL RAHIMAN PK,  KARATTIL, KARUMARAKKAD PO VAZHAKKAD', 'MALAPPURAM', 'KERALA', 'INDIA', '', '', '', '', '', '', NULL, NULL),
(112, 459, '', '', '', '', '', 'CHERAPARAMBIL HOUSE KOTHACHIRA POST PERINGODE PALAKKAD', 'PALAKKAD', 'KERALA', 'INDIA', '679535', NULL, NULL),
(113, 460, 'VAYOLI HOUSE, PAZHUR POST, MAVOOR KOZHIKODE', 'MAVOOR', 'KERALA', 'INDIA', '673661', '', '', '', '', '', NULL, NULL),
(114, 461, 'PUNATHIL HOUSE EDAKKAD POST PALAKKADA', 'KOZHIKODE', 'KERALA', 'INDIA', '673005', '', '', '', '', '', NULL, NULL),
(115, 462, 'KUZHIKANDATHIL HOUSE KUMARANELLUR PO', 'KOZHIKODE', 'KERALA', 'INDIA', '673602', '', '', '', '', '', NULL, NULL),
(116, 463, 'KANNANCHERI HOUSE, KODIYATHUR POST MUKKAM ', 'KOZHIKODE', 'KERALA', 'INDIA', '673602', '', '', '', '', '', NULL, NULL),
(117, 464, 'PALATHUM THODIKA, POTTASSERY, THAZHECODE, MANASSERY', 'KOZHIKODE', 'KERALA', 'INDIA', '673602', '', '', '', '', '', NULL, NULL),
(118, 465, 'KUNDUNGAL KAKKAD, KARASSERY KAKKAD', 'KOZHIKODE', 'KERALA', 'INDIA', '673602', '', '', '', '', '', NULL, NULL),
(119, 466, 'CHATHAPARAMBIL HOUSE, KODIYATHUR POST, KODIYATHUR, KOZHIKODE', 'KOZHIKODE', 'KERALA', 'INDIA', '673602', '', '', '', '', '', NULL, NULL),
(120, 467, 'S/O SOMAN KG KIZHAHHAYIL, KANNOTH, KODANCHERY', 'THAMARACHERY', 'KERALA', 'INDIA', '673580', '', '', '', '', '', NULL, NULL),
(121, 468, 'VEKKATTU PARAMBIL CHERUVADY', 'CHERUVADY, KOZHIKODE', 'KERALA', 'INDIA', '673602', '', '', '', '', '', NULL, NULL),
(122, 469, 'MUTHAPPUMMAL HOUSE, CHENNAMANGALLURE', 'KOZHIKODE', 'KERALA', 'INDIA', '673602', '', '', '', '', '', NULL, NULL),
(123, 470, 's/o Abdul Khader C, Vallikkat, Vazhakkad Post, Vazhakkad Malppuram', 'vazhakkad', 'Kerala', 'India', '673640', '', '', '', '', '', NULL, NULL),
(124, 471, 'CHENNAMANGALOOR, FOREST', 'MUKKAM', 'KERALA', 'India', '673602', '', '', '', '', '', NULL, NULL),
(125, 472, 'Chathapparamp, Chennamangallur, Mukkam', 'KOZHIKODE', 'KERALA', 'INDIA', '673602', '', '', '', '', '', NULL, NULL),
(126, 473, 'MANAGALASSERY THOTTATHIL, CHENNAMANGALLUR, MUKKAM', 'KOZHIKODE', 'KERALA', 'INDIA', '673602', '', '', '', '', '', NULL, NULL),
(127, 474, 'KARIMBANAKANDI (H) PARAKKAD, KIZHUPARAMBA (PO)', 'MALAPPURAM', 'KERALA', 'INDIA', '673639', '', '', '', '', '', NULL, NULL),
(128, 475, 'chennamanagalure', '', '', '', '', '', '', '', '', '', NULL, NULL),
(129, 476, 'c/o Ammed N, Narookil, Nellamkandy, Koduvally, Vavad', 'KOZHIKODE', 'KERALA', 'INDIA', '673572', '', '', '', '', '', NULL, NULL),
(130, 477, 'S/O MUHAMMED NAJEEB, KUNNATH HOUSE, KODIYATHUR', 'KOZHIKODE', 'KERALA', 'INDIA', '673602', '', '', '', '', '', NULL, NULL),
(131, 478, 'VADAKKUVEETTIL, WEST KODIYATHUR, KODIYATHUR PO, MUKKAM', 'KOZHIKODE', 'KERALA', 'INDIA', '673602', '', '', '', '', '', NULL, NULL),
(132, 479, 'kott', 'Thiruvananthapuram', 'yy', 'India', '5345656', 'mkm', 'Thiruvananthapuram', 'KL', 'India', '2354', NULL, NULL),
(133, 480, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(134, 481, 'Ashiyana', 'Payyoli', 'Kerala', 'India', '673522', 'Ashiyana', 'Payyoli', 'Kerala', 'India', '673522', NULL, NULL),
(135, 482, 'Ashiyana', 'Payyoli', 'Kerala', 'India', '673522', 'Ashiyana', 'Payyoli', 'Kerala', 'India', '673522', NULL, NULL),
(256, 483, 'Ashiyana', 'Payyoli', 'Kerala', 'India', '673522', 'Ashiyana', 'Payyoli', 'Kerala', 'India', '673522', '2022-10-25 03:56:33', '2022-10-25 03:56:33'),
(257, 485, 'Ashiyana , Pallikkara , Payyoli', 'Kozhikode', 'Kerala', 'India', '673522', 'Ashiyana , Pallikkara , Payyoli', 'Kozhikode', 'Kerala', 'India', '673522', '2024-05-31 03:41:09', '2024-05-31 03:41:09'),
(258, 498, 'Ashiyana , Pallikkara , Payyoli', 'Kozhikode', 'Kerala', 'India', '673522', 'Ashiyana , Pallikkara , Payyoli', 'Kozhikode', 'Kerala', 'India', '673522', '2024-08-24 05:42:28', '2024-08-24 05:42:28'),
(259, 499, 'Ashiyana , Pallikkara , Payyoli', 'Kozhikode', 'Kerala', 'India', '673522', 'Ashiyana , Pallikkara , Payyoli', 'Kozhikode', 'Kerala', 'India', '673522', '2024-08-24 05:49:23', '2024-08-24 05:49:23'),
(260, 500, 'Ashiyana , Pallikkara , Payyoli', 'Kozhikode', 'Kerala', 'India', '673522', 'Ashiyana , Pallikkara , Payyoli', 'Kozhikode', 'Kerala', 'India', '673522', '2024-08-27 05:08:55', '2024-08-27 05:08:55'),
(261, 501, 'Ashiyana , Pallikkara , Payyoli', 'Kozhikode', 'Kerala', 'India', '673522', 'Ashiyana , Pallikkara , Payyoli', 'Kozhikode', 'Kerala', 'India', '673522', '2024-08-27 07:20:21', '2024-08-27 07:20:21'),
(262, 502, 'Ashiyana , Pallikkara , Payyoli', 'Kozhikode', 'Kerala', 'India', '673522', 'Ashiyana , Pallikkara , Payyoli', 'Kozhikode', 'Kerala', 'India', '673522', '2024-08-27 07:34:59', '2024-08-27 07:34:59');

-- --------------------------------------------------------

--
-- Table structure for table `userdetails`
--

CREATE TABLE `userdetails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `adhaar_no` varchar(100) DEFAULT NULL,
  `designation` varchar(200) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `whatsapp_no` varchar(100) DEFAULT NULL,
  `academic_qualification` text DEFAULT NULL,
  `experience_certificate` text DEFAULT NULL,
  `contract_starting_date` varchar(100) DEFAULT NULL,
  `contract_ending_date` varchar(100) DEFAULT NULL,
  `reason_for_leaving` text DEFAULT NULL,
  `blood_group` varchar(100) DEFAULT NULL,
  `marital_status` varchar(100) DEFAULT NULL,
  `joining_date` varchar(100) DEFAULT NULL,
  `pan_no` varchar(100) DEFAULT NULL,
  `sss_number` text DEFAULT NULL,
  `license_number` text DEFAULT NULL,
  `philHealth_number` text DEFAULT NULL,
  `license_exp_date` date DEFAULT NULL,
  `hdmf_number` text DEFAULT NULL,
  `bank_and_account_number` text DEFAULT NULL,
  `tax_identification_number` text DEFAULT NULL,
  `emergency_no` text DEFAULT NULL,
  `basic_salary` varchar(100) DEFAULT NULL,
  `annual_ctc_details` varchar(100) NOT NULL,
  `salary_pay_type` varchar(100) NOT NULL,
  `regular_rate` varchar(100) NOT NULL,
  `supervisor_incentive` varchar(200) DEFAULT NULL,
  `trans_allowance` varchar(200) DEFAULT NULL,
  `COLA` varchar(200) DEFAULT NULL,
  `daily_meal_allowance` varchar(200) DEFAULT NULL,
  `house_rent_allowance` varchar(100) DEFAULT NULL,
  `conveyance_allowance` varchar(100) DEFAULT NULL,
  `fixed_allowance` varchar(100) DEFAULT NULL,
  `resigned_date` date DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `userdetails`
--

INSERT INTO `userdetails` (`id`, `user_id`, `adhaar_no`, `designation`, `department`, `whatsapp_no`, `academic_qualification`, `experience_certificate`, `contract_starting_date`, `contract_ending_date`, `reason_for_leaving`, `blood_group`, `marital_status`, `joining_date`, `pan_no`, `sss_number`, `license_number`, `philHealth_number`, `license_exp_date`, `hdmf_number`, `bank_and_account_number`, `tax_identification_number`, `emergency_no`, `basic_salary`, `annual_ctc_details`, `salary_pay_type`, `regular_rate`, `supervisor_incentive`, `trans_allowance`, `COLA`, `daily_meal_allowance`, `house_rent_allowance`, `conveyance_allowance`, `fixed_allowance`, `resigned_date`, `location`, `created_at`, `updated_at`) VALUES
(1, 1, '      9876543244111', '', '13', '      9946318116', NULL, NULL, '     08/20/2019', '     08/29/2019', '      ', 'B-', 'Married', '    01/07/2019', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '  5000', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(2, 28, '   506088828058', '', '4', '   8547066642', NULL, NULL, '  ', '   ', '   ', 'O+', 'Married', '   03/09/2018', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '15000', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(3, 40, '568483878825', '', '4', ' 7594886188', NULL, NULL, ' ', ' ', ' ', 'B+', 'Married', ' 17/07/2017', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, ' 10000', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(4, 41, '857334097179', '', '4', '9746788761', NULL, NULL, '', '', '', 'A+', 'Single', '02/03/2018', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(5, 44, ' 000000000000', '', '4', ' 8089050607', NULL, NULL, '', '', ' ', 'B+', 'Married', ' 26/07/2017', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '12000', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(6, 45, '000000000000', '', '4', '8129849845', NULL, NULL, '', '', '', 'A+', 'Single', '10/07/2017', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(7, 49, '000000000000', '', '14', '9745785686', NULL, NULL, '', '', '', 'A+', 'Married', '01/04/2019', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(8, 52, '723185260336', '', '4', '9846393506', NULL, NULL, '', '', '', 'B+', 'Married', '01/03/2019', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(9, 97, '715520005143', '', '4', '9745686463', NULL, NULL, '', '', '', 'B+', 'Married', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(10, 98, ' 942602507157', '', '8', ' 9747606123', NULL, NULL, ' ', ' ', ' ', 'O+', 'Married', '01/01/2017', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0 ', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(11, 100, '  ', '', '4', '  ', NULL, NULL, ' ', ' ', '  ', 'O+', 'Single', '  10/01/2018', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(12, 163, '', '', '4', '812961834', NULL, NULL, '', '', '', '', 'Single', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '14000', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(13, 164, '366696323022', '', '4', '7510333515', NULL, NULL, '', '', '', '', 'Married', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(14, 176, '', '', '3', '', NULL, NULL, '', '', '', '', 'Married', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(15, 178, '', '', '4', '', NULL, NULL, '', '', '', 'B+', 'Married', '26/08/2004', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(16, 179, '', '', '13', '7510932020', NULL, NULL, '', '', '', '', 'Married', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(17, 180, ' ', '', '13', ' 9995935392', NULL, NULL, ' ', ' ', ' ', 'B+', 'Married', ' ', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, ' 5000', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(18, 181, ' ', '', '13', ' 9526466421', NULL, NULL, ' ', ' ', ' ', 'O+', 'Married', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(19, 182, '', '', '14', '9539767245', NULL, NULL, '', '', '', 'A+', 'Married', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(20, 183, '', '', '4', '', NULL, NULL, '', '', '', '', 'Married', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(21, 184, '233929929491', '', '13', '9645995588', NULL, NULL, '', '', '', 'O+', 'Married', '01/08/2017', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(22, 185, '', '', '3', '9539310709', NULL, NULL, '', '', '', 'A+', 'Married', '01/05/2018', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(23, 186, '', '', '2', '', NULL, NULL, '', '', '', '', 'Married', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(24, 201, '', '', '2', '9645245566', NULL, NULL, '', '', '', 'A+', 'Single', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(25, 218, '', '', '4', '9895140965', NULL, NULL, '', '', '', '', 'Married', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(26, 275, '', '', '4', '9744380553', NULL, NULL, '03/01/2020', '', '', '', 'Single', '03/01/2020', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(27, 277, '', '', '4', '9961353609', NULL, NULL, '', '', '', '', 'Married', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(28, 301, '', '', '4', '9539831290', NULL, NULL, '', '', '', '', 'Married', '17/02/2020', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(29, 302, '', '', '2', '8943904087', NULL, NULL, '', '', '', 'A+', 'Single', '01/02/2020', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '12000', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(30, 313, '', '', '4', '9496958460', NULL, NULL, '', '', '', '', 'Single', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(31, 315, '', '', '4', '9539719003', NULL, NULL, '', '', '', 'O+', 'Married', '01/06/2020', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '13000', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(32, 316, '', '', '4', '9539719003', NULL, NULL, '', '', '', 'O+', 'Married', '01/06/2020', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '13000', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(33, 334, '', '', '16', '8089922606', NULL, NULL, '01/07/2020', '', '', 'A+ve', 'Single', '01/07/2020', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(34, 335, '', '', '17', '9745879078', NULL, NULL, '01/06/2020', '', '', '', 'Single', '01/06/2020', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(35, 337, '', '', '4', '9544421300', NULL, NULL, '02/09/2020', '', '', '', 'Single', '02/09/2020', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(36, 353, '', '', '4', '8086727809', NULL, NULL, '01/11/2020', '', '', '', 'Single', '01/11/2020', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(37, 358, '', '', '2', '9539324925', NULL, NULL, '', '', '', '', 'Single', '22/12/2020', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(38, 365, '', '', '2', '8157090229', NULL, NULL, '01/01/2021', '', '', 'B+', 'Single', '01/01/2021', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(39, 366, '', '', '4', '9645128790', NULL, NULL, '16/03/2021', '', '', 'A+', 'Married', '16/03/2021', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(40, 368, '', '', '4', '9048642407', NULL, NULL, '', '', '', 'B+', 'Married', '16/03/2021', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(41, 373, '', '', '4', '9061707377', NULL, NULL, '', '', '', 'O+', 'Single', '31/12/2020', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(42, 374, '', '', '9', '9048262826', NULL, NULL, '', '', '', 'A+', 'Married', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(43, 375, '', '', '4', '9746928343', NULL, NULL, '', '', '', 'A+', 'Married', '07/02/2021', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(44, 376, '', '', '4', '9947810565', NULL, NULL, '', '', '', 'B+', 'Married', '10/02/2021', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(45, 378, '', '', '9', '9946265727', NULL, NULL, '', '', '', 'O+', 'Single', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(46, 379, '', '', '9', '7561886704', NULL, NULL, '', '', '', '', 'Single', '30/12/2020', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(47, 380, '', '', '9', '8606887006', NULL, NULL, '', '', '', 'O+', 'Married', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(48, 381, '', '', '4', '9544164149', NULL, NULL, '', '', '', 'O+', 'Married', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(49, 382, '', '', '4', '8606473359', NULL, NULL, '', '', '', '', 'Married', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(50, 383, '', '', '4', '9946497311', NULL, NULL, '', '', '', '', 'Single', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(51, 384, '', '', '10', '9846495914', NULL, NULL, '', '', '', 'O+', 'Married', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(52, 385, '', '', '9', '7558085492', NULL, NULL, '', '', '', 'A+', 'Single', '05/04/2021', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(53, 391, '', '', '4', '8943869820', NULL, NULL, '', '', '', 'O+', 'Single', '13/07/2021', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(54, 392, '', '', '13', '', NULL, NULL, '', '', '', 'O+', 'Single', '09/08/2021', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(55, 393, '', '', '14', '9544130543', NULL, NULL, '', '', '', '', 'Single', '09/08/2021', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(56, 394, '601440730795', '', '2', '8592812259', NULL, NULL, '', '', '', 'O-', 'Single', '19/11/2020', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(57, 395, '488155220146', '', '8', '9656702267', NULL, NULL, '', '', '', 'B+', 'Married', '12/08/2021', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(58, 396, '876033468945', '', '4', '9745014859', NULL, NULL, '', '', '', 'A+', 'Single', '17/08/2021', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(59, 398, '', '', '4', '', NULL, NULL, '', '', '', '', 'Married', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(60, 402, '806801359702', '', '4', '+91 98461 26113', NULL, NULL, '', '', '', 'A+ve', 'Married', '12/07/2021', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(61, 403, '972098241707', '', '4', '9744800387', NULL, NULL, '', '', '', 'AB+', 'Single', '01/07/2021', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(62, 404, '988598734425', '', '10', '9946704611', NULL, NULL, '', '', '', '', 'Married', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(63, 405, '', '', '4', '', NULL, NULL, '', '', '', 'A+', 'Married', '13/07/2021', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(64, 406, '506921691645', '', '4', '9745451631', NULL, NULL, '', '', '', 'O-', 'Married', '01/09/2021', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(65, 407, '758179024349', '', '4', '9072224200', NULL, NULL, '', '', '', 'B-', 'Single', '02/09/2021', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(66, 408, '341898127951', '', '4', '7356087423', NULL, NULL, '', '', '', 'O+', 'Single', '03/09/2021', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(67, 409, '492072029759', '', '4', '7034565072', NULL, NULL, '', '', '', 'B+', 'Married', '01/06/2017', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(68, 410, '', '', '4', '9946424556', NULL, NULL, '', '', '', '', 'Married', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(69, 411, '', '', '9', '9946265727', NULL, NULL, '', '', '', 'O+', 'Single', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(70, 412, '', '', '4', '', NULL, NULL, '', '', '', 'B+', 'Married', '18/06/2019', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(71, 413, '', '', '14', '9048333482', NULL, NULL, '', '', '', '', 'Married', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(72, 414, '', '', '4', '9400958521', NULL, NULL, '', '', '', 'O+', 'Single', '01/07/2019', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(73, 415, '423282500903', '', '4', '', NULL, NULL, '', '', '', 'A+', 'Single', '18/12/2017', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(74, 416, '931239827363', '', '9', '', NULL, NULL, '', '', '', 'A+', 'Single', '04/04/2019', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(75, 418, '870764986539', '', '4', '9747696667', NULL, NULL, '', '', '', 'A-', 'Married', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(76, 419, '395334196800', '', '4', '9562852565', NULL, NULL, '', '', '', 'O+', 'Married', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '14000', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(77, 420, '631680712979', '', '4', '7025756675', NULL, NULL, '', '', '', '', 'Married', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(78, 421, '512365526598', '', '12', '9745606822', NULL, NULL, '', '', '', 'B+', 'Married', '01/02/2002', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(79, 422, '912869987320', '', '9', '9744892348', NULL, NULL, '', '', '', 'B+', 'Married', '01/10/2021', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(80, 424, '871710561968', '', '9', '7902798702', NULL, NULL, '', '', '', '', 'Married', '01/01/2019', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(81, 425, '1234123123', '', '5', '', NULL, NULL, '', '', '', 'O+', 'Married', '26/10/2021', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '122222', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(82, 427, '827817111904', '', '4', '9061974146', NULL, NULL, '', '', '', 'A+', 'Single', '03/11/2021', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '10000', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(83, 428, '', '', '9', '9747633145', NULL, NULL, '', '', '', 'O+', 'Married', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(84, 429, '', '', '4', '', NULL, NULL, '', '', '', '', 'Single', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(85, 430, '706205980734', '', '4', '9605094372', NULL, NULL, '', '', '', 'B+', 'Married', '09/05/2017', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(86, 431, '533506095569', '', '9', '7994103290', NULL, NULL, '', '', '', '', 'Single', '12/11/2021', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(87, 432, '612536857338', '', '4', '8139041948', NULL, NULL, '', '', '', 'B+', 'Single', '01/10/2021', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(88, 433, '985175694433', '', '4', '7558890154', NULL, NULL, '', '', '', 'O+', 'Single', '23/11/2021', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(89, 434, '328577777123', '', '4', '9961504782', NULL, NULL, '', '', '', 'B+', 'Married', '24/11/2021', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(90, 435, '393667668099', '', '4', '9496658065', NULL, NULL, '', '', '', 'O+', 'Single', '29/11/2021', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(91, 436, '887436358036', '', '4', '8086995429', NULL, NULL, '', '', '', 'A+', 'Married', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(92, 437, '226335330284', '', '11', '8089723309', NULL, NULL, '', '', '', 'O+', 'Single', '02/11/2020', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(93, 438, '961101884150', '', '2', '8281636362', NULL, NULL, '', '', '', 'O +ve', 'Single', '14/01/2022', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '13000', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(94, 439, '312568775835', '', '4', '9072149343', NULL, NULL, '', '', '', 'B+', 'Single', '12/01/2022', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(95, 440, '425691290577', '', '4', '9605413177', NULL, NULL, '', '', '', '', 'Single', '04/01/2022', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(96, 441, '440127970981', '', '4', '9745787472', NULL, NULL, '', '', '', 'O+', 'Single', '17/02/2022', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(97, 442, '728036718810', '', '4', '8281355605', NULL, NULL, '', '', '', 'B+', 'Single', '20/01/2022', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '3000', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(98, 443, '967598351198', '', '4', '8592804815', NULL, NULL, '', '', '', 'A+', 'Single', '28/01/2022', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '3000', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(99, 444, '', '', '4', '9656464224', NULL, NULL, '', '', '', 'AB+', 'Single', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '3000', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(100, 446, '913204938694', '', '4', '8289897372', NULL, NULL, '04/02/2022', '31/07/2022', '', 'A+', 'Single', '04/02/2022', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '3000', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(101, 447, '648819666768', '', '4', '9061174724', NULL, NULL, '', '', '', 'O+', 'Married', '27/01/2022', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(102, 448, '919359998354', '', '4', '9946763540', NULL, NULL, '', '', '', 'B+ve', 'Married', '12/02/2022', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(103, 449, '823976677349', '', '2', '9605990538', NULL, NULL, '', '', '', '', 'Single', '15/02/2022', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(104, 450, '571953291961', '', '4', '8943901350', NULL, NULL, '', '', '', '', 'Single', '21/02/2022', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '3000', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(105, 451, '250011433584', '', '4', '9656641863', NULL, NULL, '', '', '', 'O+', 'Single', '24/02/2022', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(106, 453, '549026986710', '', '4', '9072544042', NULL, NULL, '', '', '', 'B-', 'Single', '10/03/2022', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '3500', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(107, 454, '418397284560', '', '4', '9747820155', NULL, NULL, '', '', '', 'A+', 'Single', '10/03/2022', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '2000', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(108, 455, '', '', '14', '9048725464', NULL, NULL, '', '', '', 'O+', 'Married', '04/03/2022', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(109, 456, '', '', '4', '7736520779', NULL, NULL, '', '', '', 'B+', 'Single', '10/03/2022', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '2000', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(110, 457, '222548360327', '', '4', '9846036920', NULL, NULL, '14/03/2022', '30/06/2022', '', '', 'Single', '14/03/2022', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '11000', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(111, 458, '', '', '4', '7356087423', NULL, NULL, '', '', '', 'O+', 'Single', '09/03/2022', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '3000', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(112, 459, '427494602492', '', '4', '', NULL, NULL, '', '', '', 'B+', 'Single', '17/03/2022', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '4000', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(113, 460, '319157703673', '', '4', '9656903145', NULL, NULL, '', '', '', 'O+', 'Married', '25/03/2022', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '10000', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(114, 461, '413347995323', '', '4', '9846117673', NULL, NULL, '', '', '', 'O+', 'Single', '28/03/2022', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '11000', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(115, 462, '607312957640', '', '4', '9539507968', NULL, NULL, '', '', '', '', 'Single', '28/03/2022', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '18000', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(116, 463, '510133565929', '', '4', '7559873749', NULL, NULL, '', '', '', 'O+', 'Single', '02/04/2022', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(117, 464, '744096359794', '', '14', '8606777609', NULL, NULL, '', '', '', '', 'Married', '01/04/2022', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(118, 465, '', '', '4', '9446964862', NULL, NULL, '', '', '', 'B positive', 'Married', '04/04/2022', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(119, 466, '892726412084', '', '6', '9048959459', NULL, NULL, '', '', '', '', 'Married', '01/04/2022', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(120, 467, '720983939293', '', '4', '', NULL, NULL, '', '', '', '', 'Single', '21/04/2022', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '13000', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(121, 468, '527636267742', '', '4', '9567916357', NULL, NULL, '', '', '', 'B+', 'Married', '19/01/2018', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(122, 469, '249432740101', '', '4', '9207521214', NULL, NULL, '', '', '', '', 'Single', '01/06/2022', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '3500', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(123, 470, '323324354358', '', '4', '6282722120', NULL, NULL, '', '', '', 'O+', 'Single', '21/06/2022', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(124, 471, '', '', '14', '9544332153', NULL, NULL, '', '', '', '', 'Married', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(125, 472, '953952882567', '', '4', '96452 22482', NULL, NULL, '', '', '', 'O+', 'Married', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(126, 473, '370475994912', '', '5', '94956 51853', NULL, NULL, '', '', '', 'O+', 'Married', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(127, 474, '781058542796', '', '14', '9846384600', NULL, NULL, '', '', '', 'AB+', 'Single', '01/07/2022', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '12500', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(128, 475, '', '', '14', '9539301601', NULL, NULL, '', '', '', 'A+', 'Married', '', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(129, 476, '304137929662', '', '14', '99474 27684', NULL, NULL, '', '', '', 'B+', 'UnMarried', '02/03/2022', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(130, 477, '515553817843', '', '4', '8129849845', NULL, NULL, '', '', '', 'A+', 'Single', '10/07/2017', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '0', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(131, 478, '968054430531', '', '19', '9946012592', NULL, NULL, '', '', '', 'B+', 'Single', '19/08/2022', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '10000', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(132, 479, '797900454', '', '2', '35464565', NULL, NULL, '30/07/2020', '19/08/2022', '', 'A+', 'Single', '19/08/2022', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, '10000', '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '', NULL, NULL),
(133, 480, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', NULL, NULL, NULL, NULL),
(134, 481, '7878788@$w4gfgfgfg', '3', '1', '9078564532', '[{\"InstitutionName\":\"College Of Engineering Vadakara\",\"Degree\":\"Btech\",\"Specialization\":\"CS\",\"DateofCompletion\":\"2015/04/01\"}]', '[{\"CompanyName\":\"Cybora\",\"JobTitle\":\"Web Developer\",\"FromDate\":\"2022/02/01\",\"ToDate\":\"2022/08/18\",\"JobDescription\":\"Web Developer\"}]', NULL, NULL, NULL, 'O+', 'Married', '2022/08/01', '9098987623232121212', '0', '0', '0', '0000-00-00', '0', '0', '0', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '0', '0', '0', NULL, '8', NULL, NULL),
(135, 482, '7878788@$w4gfgfgfg', '2', '1', '9078564532', '[{\"InstitutionName\":\"College Of Engineering Vadakara\",\"Degree\":\"Btech\",\"Specialization\":\"CS\",\"DateofCompletion\":\"2022/10/10\"}]', '[{\"CompanyName\":\"Cybora\",\"JobTitle\":\"Web Developer\",\"FromDate\":\"2022/10/10\",\"ToDate\":\"2022/10/10\",\"JobDescription\":\"Web Developer\"}]', NULL, NULL, NULL, 'O+', 'Single', '2022/10/10', 'y7878787878', '0', '0', '0', '0000-00-00', '0', '0', '0', '[{\"Name\":{},\"Relation\":\"Father\",\"Phone\":\"9087675645\"}]', '18792', '', '', '', NULL, NULL, NULL, NULL, '9396', '0', '9395', NULL, '1', NULL, NULL),
(136, 483, '7878788@$w4gfgfgfg', '1', '1', '9078564532', '[{\"InstitutionName\":\"College Of Engineering Vadakara\",\"Degree\":\"Btech\",\"Specialization\":\"CS\",\"DateofCompletion\":\"2022/10/25\"}]', '[{\"CompanyName\":\"Cybora\",\"JobTitle\":\"Web Developer\",\"FromDate\":\"2022/10/25\",\"ToDate\":\"2022/10/25\",\"JobDescription\":\"Web Developer\"}]', NULL, NULL, NULL, 'B+', 'Married', '2022/10/25', 'y7878787878', '0', '0', '0', '0000-00-00', '0', '0', '0', '[{\"Name\":{},\"Relation\":\"Father\",\"Phone\":\"9087675645\"}]', '18792', '', '', '', NULL, NULL, NULL, NULL, '9396', '0', '9395', NULL, '1', '2022-10-25 03:56:33', '2022-10-25 03:56:33'),
(137, 485, NULL, '1', '17', '9207437610', '[{\"InstitutionName\":\"test\",\"Degree\":\"test\",\"Specialization\":\"test\",\"DateofCompletion\":\"2024/05/31\"}]', '[{\"CompanyName\":\"Cybora Solutions\",\"JobTitle\":\"Finance Executive\",\"FromDate\":\"2024/05/31\",\"ToDate\":\"2024/05/31\",\"JobDescription\":\"Finance Executive\"}]', NULL, NULL, NULL, 'A+', 'Single', '2024/05/31', NULL, '0', '0', '0', '0000-00-00', '0', '0', '0', '[{\"Name\":{},\"Relation\":\"Mother\",\"Phone\":\"7034896646\"}]', '12500', '', '', '', NULL, NULL, NULL, NULL, '6250', '0', '6250', NULL, '13', '2024-05-31 03:41:09', '2024-05-31 03:41:09'),
(138, 498, '457836985912', '3', '7', NULL, '[{\"InstitutionName\":\"\",\"Degree\":\"\",\"Specialization\":\"\",\"DateofCompletion\":\"2024/08/24\"}]', '[{\"CompanyName\":\"\",\"JobTitle\":\"\",\"FromDate\":\"2024/08/24\",\"ToDate\":\"2024/08/24\",\"JobDescription\":\"\"}]', NULL, NULL, NULL, 'O+', 'Married', '2023/08/22', '85479623158', '0', '0', '0', '0000-00-00', '0', '0', '0', '[{\"Name\":{},\"Relation\":\"\",\"Phone\":\"\"}]', '6056', '', '', '', NULL, NULL, NULL, NULL, '3210', '0', '1176', NULL, '6', '2024-08-23 23:48:10', '2024-08-23 23:48:10'),
(139, 499, '55163867256', '4', '9', NULL, '[{\"InstitutionName\":\"\",\"Degree\":\"\",\"Specialization\":\"\",\"DateofCompletion\":\"2024/08/24\"}]', '[{\"CompanyName\":\"\",\"JobTitle\":\"\",\"FromDate\":\"2024/08/24\",\"ToDate\":\"2024/08/24\",\"JobDescription\":\"\"}]', NULL, NULL, NULL, 'B-', 'Widowed', '2024/08/24', '63529624563', '0', '0', '0', '0000-00-00', '0', '0', '0', '[{\"Name\":{},\"Relation\":\"\",\"Phone\":\"\"}]', '1912', '45896', 'Monthly Rate/Executive', 'Transportation allowance', NULL, NULL, NULL, NULL, '956', '0', '957', NULL, '8', '2024-08-24 00:51:53', '2024-08-24 00:51:53'),
(140, 498, 'tyt57557', '1', '12', NULL, '[{\"InstitutionName\":\"test\",\"Degree\":\"test\",\"Specialization\":\"test\",\"DateofCompletion\":\"2024/08/24\"}]', '[{\"CompanyName\":\"Cybora Solutions\",\"JobTitle\":\"Finance Executive\",\"FromDate\":\"2024/08/24\",\"ToDate\":\"2024/08/24\",\"JobDescription\":\"Finance Executive\"}]', NULL, NULL, NULL, 'O-', 'Separated', '2024/08/24', 'QQWW344544WD', '0', '0', '0', '0000-00-00', '0', '0', '0', '[{\"Name\":{},\"Relation\":\"Mother\",\"Phone\":\"7034896646\"}]', '12500', '300000', 'Daily Rate/Weekly Pay', 'supervisor incentive', NULL, NULL, NULL, NULL, '6250', '0', '6250', NULL, '11', '2024-08-24 05:42:28', '2024-08-24 05:42:28'),
(141, 499, 'tyt57557', '5', '6', NULL, '[{\"InstitutionName\":\"test\",\"Degree\":\"test\",\"Specialization\":\"test\",\"DateofCompletion\":\"2024/08/24\"}]', '[{\"CompanyName\":\"Cybora Solutions\",\"JobTitle\":\"Finance Executive\",\"FromDate\":\"2024/08/24\",\"ToDate\":\"2024/08/24\",\"JobDescription\":\"Finance Executive\"}]', NULL, NULL, NULL, 'AB-', 'Single', '2024/08/24', 'QQWW344544WD', '0', '0', '0', '0000-00-00', '0', '0', '0', '[{\"Name\":{},\"Relation\":\"Mother\",\"Phone\":\"7034896646\"}]', '12500', '300000', 'Daily Rate/Weekly Pay', 'supervisor incentive', NULL, NULL, NULL, NULL, '6250', '0', '6250', NULL, '13', '2024-08-24 05:49:23', '2024-08-24 05:49:23'),
(142, 500, 'tyt57557', '4', '14', NULL, '[{\"InstitutionName\":\"test\",\"Degree\":\"test\",\"Specialization\":\"test\",\"DateofCompletion\":\"2024/08/27\"}]', '[{\"CompanyName\":\"Cybora Solutions\",\"JobTitle\":\"Finance Executive\",\"FromDate\":\"2024/08/27\",\"ToDate\":\"2024/08/27\",\"JobDescription\":\"Finance Executive\"}]', NULL, NULL, NULL, 'O+', 'Single', '2024/08/27', 'QQWW344544WD', '787878', '0909090909', '898989', '2024-08-27', '898989', '89898989', '909090', '[{\"Name\":{},\"Relation\":\"Mother\",\"Phone\":\"7034896646\"}]', '12500', '300000', 'Daily Rate/Weekly Pay', 'supervisor incentive', NULL, NULL, NULL, NULL, '6250', '0', '6250', NULL, '13', '2024-08-27 05:08:55', '2024-08-27 05:08:55'),
(143, 501, 'tyt57557', '1', '1', NULL, '[{\"InstitutionName\":\"test\",\"Degree\":\"test\",\"Specialization\":\"test\",\"DateofCompletion\":\"2024/08/27\"}]', '[{\"CompanyName\":\"Cybora Solutions\",\"JobTitle\":\"Finance Executive\",\"FromDate\":\"2024/08/27\",\"ToDate\":\"2024/08/27\",\"JobDescription\":\"Finance Executive\"}]', NULL, NULL, NULL, 'O+', 'Single', '2024/08/01', 'QQWW344544WD', '787878', '0909090909', '898989', '2024-08-27', '898989', '89898989ioio', '909090', '[{\"Name\":{},\"Relation\":\"Mother\",\"Phone\":\"7034896646\"}]', NULL, '300000', 'Daily Rate/Weekly Pay', 'supervisor incentive', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '1', '2024-08-27 07:20:21', '2024-08-27 07:20:21'),
(144, 502, 'tyt57557', '2', '5', NULL, '[{\"InstitutionName\":\"test\",\"Degree\":\"test\",\"Specialization\":\"test\",\"DateofCompletion\":\"2024/08/27\"}]', '[{\"CompanyName\":\"Cybora Solutions\",\"JobTitle\":\"Finance Executive\",\"FromDate\":\"2024/08/27\",\"ToDate\":\"2024/08/27\",\"JobDescription\":\"Finance Executive\"}]', NULL, NULL, NULL, 'O+', 'Single', '2024/08/27', 'QQWW344544WD', '787878', '0909090909', '898989', '2024-08-27', '898989', '89898989', '909090', '[{\"Name\":{},\"Relation\":\"Mother\",\"Phone\":\"7034896646\"}]', NULL, '300000', 'Reliever/Monthly Rate', '677', '890', '567', '90', '12', NULL, '0', NULL, NULL, '3', '2024-08-27 07:34:59', '2024-08-27 07:34:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_code` varchar(100) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `job_role` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `profile_photo` text DEFAULT NULL,
  `status` int(11) DEFAULT 1 COMMENT '1 -  Active  0 - Terminated  2 -  Deceased  3 - Reigned',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `employee_code`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `user_type`, `phone`, `job_role`, `gender`, `dob`, `firstname`, `lastname`, `profile_photo`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, '1', 'info@anarcdevelopers.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '  9946318116', 'Employee', 'Male', '07/17/1990', 'Muhammed lais tk', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, '2024-05-31 06:30:02'),
(28, 'REY001', 'AFLAH K .C', 'aflah123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '8547066642', 'Employee', 'Male', '03/06/1995', 'AFLAH K .C', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(40, 'SUB001', 'Rashid Pk', 'rashidpk123@gmail.com', NULL, '$2y$10$ApquOfJ0Pz8bKqNVNi1Mr.BKC91nKQvlEMwH1VETq9E8Hze3Q4F9i', NULL, 'Employee', ' 9497344249', 'Employee', 'Male', '11/09/1990', 'RASHID. P.K', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(41, 'ALA001', 'Minshad', 'minshad3279@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9746788761', 'Employee', 'Male', '24/05/1993', 'Minshad. M', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(44, 'VEL001', 'Firoz', 'firoznooru8112@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', ' 8089050607', 'Employee', 'Male', '20/04/1982', 'FIROZ. RS', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, '2024-05-31 06:31:43'),
(45, NULL, '', 'shanil123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '8129849845', 'Employee', 'Male', '29/03/1996', 'Shanil K Najeeb', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 0, NULL, NULL),
(49, NULL, '', 'thamam123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9745785686', 'Employee', 'Male', '07/11/1994', 'THAMAM MUBARIS', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 0, NULL, NULL),
(52, NULL, '', 'vaseem123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9846393506', 'Employee', 'Male', '05/04/1993', 'VASEEM K', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(97, NULL, '', 'jamsheedemu@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9745686463', 'Employee', 'Male', '30/10/1989', 'JAMSHEED.C', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(98, NULL, '', 'nejualpy@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', ' 9747606123', 'Employee', 'Male', '08/11/1987', 'Najath T', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(100, NULL, '', 'faijaz123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '  7293997866', 'Employee', 'Male', '30/09/1994', 'FAIJAS MUHAMMED PP', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(163, NULL, '', 'fayiz123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '8129612834', 'Employee', 'Male', '08/11/1994', 'Fayiz Muhammed km', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(164, NULL, '', 'shafi123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '7510333515', 'Employee', 'Male', '28/02/1989', 'MUHAMMED SHAFI O', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(176, NULL, '', 'jasmal123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9946932808', 'Employee', 'Male', '03/03/1994', 'JASMAL N', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(178, NULL, '', 'haristvkmd@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9562080828', 'Employee', 'Male', '12/05/1982', 'HARIS T V', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(179, NULL, '', 'abd17mkm@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '7510932020', 'Employee', 'Male', '12/05/1982', 'ABDUL JABBAR', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(180, NULL, '', 'basilmiyan@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', ' 8592061010', 'Employee', 'Male', '12/05/1982', 'BASIL MIYAN', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(181, NULL, '', 'shan123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '09526466421', 'Employee', 'Male', '12/05/1982', 'MUHAMMED SHAN K', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(182, NULL, '', 'bavakarimba@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9539767245', 'Employee', 'Male', '31/05/1985', 'BAVA pk', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 0, NULL, NULL),
(183, NULL, '', 'er.thahirzaman@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '8089285825', 'Employee', 'Male', '12/05/1982', 'THAHIR ZAMAN', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(184, NULL, '', 'faizalpthekkumpaly@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9645995588', 'Employee', 'Male', '08/04/1993', 'FAISAL P', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(185, NULL, '', 'irshad123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9539310709', 'Employee', 'Male', '22/09/1993', 'MUHAMMED IRSHAD M', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(186, NULL, '', 'rashidck101.85@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '8129841588', 'Employee', 'Male', '12/05/1982', 'RASHID C K', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 0, NULL, NULL),
(201, NULL, '', 'mukhthar123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '964545566', 'New Venture', 'Male', '08/06/1996', 'UMER MUKHTHAR', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(218, NULL, '', 'junaidkc555@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9895140965', 'Employee', 'Male', '12/05/1982', 'JUNAID K C', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(275, NULL, '', 'adil.ct2011@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9744380553', 'Employee', 'Male', '12/05/1982', 'ADIL .C.T', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(277, NULL, '', 'sreejithpk0@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9961353609', 'Employee', 'Male', '12/05/1982', 'Sreejith .P K', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(301, NULL, '', 'ashkarkokkadan023@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9539831290', 'Employee', 'Male', '24/05/1990', 'ASHKAR .K', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(302, NULL, '', 'abidhismail0007@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '8943904087', 'New Venture', 'Male', '15/11/1997', 'Abidh Ismail', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(313, NULL, '', 'akhiljoseandrews@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9496958460', 'Employee', 'Male', '07/11/1993', 'AKHIL JOSE', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 0, NULL, NULL),
(315, NULL, '', 'shajicm97@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '09539719003', 'Employee', 'Male', '05/06/2020', 'shaji mkm', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(316, NULL, '', 'shajicm97@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '09539719003', 'Employee', 'Male', '05/06/2020', 'shaji mkm', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(334, NULL, '', 'rifankhalidkdr@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '8089922606', 'Employee', 'Male', '26/04/1999', 'Rifan Khalid', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 0, NULL, NULL),
(335, NULL, '', 'hashimhsm@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9745879078', 'Employee', 'Male', '10/04/1996', 'Hashim A', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 0, NULL, NULL),
(337, NULL, '', 'nihal123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9544421300', 'Employee', 'Male', '30/08/1996', 'NIHAL O P', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(353, NULL, '', 'fahad123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '8086727809', 'Employee', 'Male', '16/09/1998', 'FAHAD MARAKKAR P P', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(358, NULL, '', 'fasilcmr007@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9539324925', 'Employee', 'Male', '28/09/1994', 'FASIL .M', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(365, NULL, '', 'vknajikdr@GMAIL.COM', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '8157090229', 'Employee', 'Male', '07/11/1999', 'NAJIH VK', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 0, NULL, NULL),
(366, NULL, '', 'unaiseahmed38@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9645128790', 'Employee', 'Male', '20/09/1998', 'UNAISE K.T', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(368, NULL, '', 'inshad.aalam@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9048642407', 'Employee', 'Male', '29/11/1993', 'MUHAMMED INSHAD AALAM K', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(373, NULL, '', 'shanushahadk@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9061707377', 'Employee', 'Male', '24/03/1998', 'Shahad k', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(374, NULL, '', 'shoukathali123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9048262826', 'New Venture', 'Male', '10/05/1970', 'SHOUKATH ALI', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(375, NULL, '', 'brijeshmukkam@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9746928343', 'Employee', 'Male', '24/04/1982', 'P.Brijesh ', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(376, NULL, '', 'dhanush.vsry@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9947810565', 'Employee', 'Male', '17/05/1988', 'Dhanush P', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(378, NULL, '', 'harshadcmr@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9946265727', 'Employee', 'Male', '19/11/1995', 'Hrashad EK', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 0, NULL, NULL),
(379, NULL, '', 'shainfasalpa@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '7561886704', 'Employee', 'Male', '17/02/1998', 'Shain fasal PA', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 0, NULL, NULL),
(380, NULL, '', 'mkmmuneer16@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '8606887006', 'New Venture', 'Male', '06/02/1977', 'Muneer p', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(381, NULL, '', 'raoof123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9544164149', 'Employee', 'Male', '02/04/1978', 'ABDUL RAOOF K', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(382, NULL, '', 'sunilrahmanc@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '8606473359', 'Employee', 'Male', '30/05/1980', 'Sunil rahman', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 0, NULL, NULL),
(383, NULL, '', 'sadiquecheruvady@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9946497311', 'Employee', 'Male', '15/11/1968', 'Sadique Cheruvady', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(384, NULL, '', 'subairmcmrsubu@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9846495914', 'Employee', 'Male', '16/01/1984', 'Subair mangalassery', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(385, NULL, '', 'anshink76@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '7558085492', 'New Venture', 'Male', '18/03/1999', 'Anshin K', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(391, NULL, '', 'thafsalijas12345@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '8943869820', 'Employee', 'Male', '06/09/2000', 'Thafsal Ijas Vp', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(393, NULL, '', 'abhishekshiva06@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9544130543', 'Employee', 'Male', '06/10/1999', 'ABHISHEK.V', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(394, NULL, '', 'favaslpk@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '8592812259', 'Employee', 'Male', '27/04/1999', 'FAVAS PK', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(395, NULL, '', 'kunhiqst@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9656702267', 'New Venture', 'Male', '31/05/1970', 'Alikunhi mannil', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(396, NULL, '', 'shebinmalik.353@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9745014859', 'Trainee', 'Male', '14/08/1999', 'SHEBIN MALIK P', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 0, NULL, NULL),
(398, NULL, '', 'abd17mkm@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9048187505', 'Employee', 'Male', '12/05/1982', 'SAJID ', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(402, NULL, '', 'sarjascp1029@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '+91 98461 26113', 'Employee', 'Male', '15/12/1999', 'SARJAS CP', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 0, NULL, NULL),
(403, NULL, '', 'aliminshaj@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9744800387', 'Employee', 'Male', '27/09/1999', 'ALI MINSHAJ PP', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(404, NULL, '', 'firositems@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9946704611', 'Employee', 'Male', '25/05/1974', 'FIROS KHAN T', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(405, NULL, '', 'ashkersarkar58@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '09946438336', 'Employee', 'Male', '12/05/1982', 'ASHKER SARKAR', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 0, NULL, NULL),
(406, NULL, '', 'ajithtottathil123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9745451631', 'Employee', 'Male', '26/11/1991', 'AJITH T', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(407, NULL, '', 'nasimkcr7@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9072224200', 'Trainee', 'Male', '12/06/1996', 'NASEEM MOHAMMED K', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 0, NULL, NULL),
(408, NULL, '', 'shaheerpoolakkalvb@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '7356087423', 'Trainee', 'Male', '08/08/1997', 'MOHAMMED SHAHEER PK', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 0, NULL, NULL),
(409, NULL, '', 'abullais123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '7034565072', 'Employee', 'Male', '14/04/1995', 'ABULLAIS PM', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(410, NULL, '', 'abu123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '994642456', 'Employee', 'Male', '19/02/1998', 'ABOOBACKER KP', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(411, NULL, '', 'harshad123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9946265727', 'New Venture', 'Male', '19/11/1995', 'HARSHAD ', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(412, NULL, '', 'darish123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9846636248', 'Employee', 'Male', '12/05/1982', 'DARISH', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 0, NULL, NULL),
(413, NULL, '', 'asif123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9048333482', 'Employee', 'Male', '12/05/1982', 'ASIF ', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(414, NULL, '', 'shamil123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9400958521', 'Employee', 'Male', '29/01/1997', 'SHAMIL K', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(415, NULL, '', 'salih123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9048620697', 'Employee', 'Male', '12/05/1982', 'SALIH K', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(416, NULL, '', 'anushad123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9745458074', 'New Venture', 'Male', '09/07/1994', 'ANUSHAD MK', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(418, NULL, '', 'muhammed123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9747696667', 'Employee', 'Male', '06/09/2000', 'MUHAMMED KV', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(419, NULL, '', 'azeez123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9562852565', 'Employee', 'Male', '30/04/1967', 'ABDUL AZEEZ K', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(420, NULL, '', 'sabjan123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '7025756675', 'Employee', 'Male', '09/02/1966', 'SABJAN', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(421, NULL, '', 'jabir1234@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9745606822', 'Employee', 'Male', '06/05/1974', 'JABIR. K', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(422, NULL, '', 'jaseel123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9744892348', 'New Venture', 'Male', '24/03/1989', 'JASEEL  AHAMMED MS', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(424, NULL, '', 'saleem123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '7902798702', 'New Venture', 'Male', '13/05/1973', 'SALEEM CK', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 0, NULL, NULL),
(425, NULL, '', 'rufaida@adoxsolutions.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '123123123', 'Employee', 'Male', '06/06/06', 'Rufaida', 'P P', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(427, NULL, '', 'shahabas123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9061974146', 'Employee', 'Male', '30/05/1998', 'MOHAMMED SHAHABAS AMAN OTTAYIL', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 0, NULL, NULL),
(428, NULL, '', 'junaise123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9747633145', 'New Venture', 'Male', '12/05/1982', 'JUNAISE AK', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(429, NULL, '', 'abidali123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9061097609', 'Trainee', 'Male', '12/05/1982', 'ABID ALI', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 0, NULL, NULL),
(430, NULL, '', 'noushad123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9605094372', 'Employee', 'Male', '06/12/1974', 'NOUSHAD C', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(431, NULL, '', 'sharafath123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '7994103290', 'New Venture', 'Male', '10/02/1999', 'SHARAFATH', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 0, NULL, NULL),
(432, NULL, '', 'siraj123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '8139041948', 'Trainee', 'Male', '14/12/1996', 'MUHAMMED SIRAJ TN', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 0, NULL, NULL),
(433, NULL, '', 'sufaid123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '7558890154', 'Trainee', 'Male', '11/10/2001', 'SUFAID MIYAN K', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(434, NULL, '', 'niyas123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9961504782', 'Employee', 'Male', '21/01/1998', 'NIYAS ALI VK', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(435, NULL, '', 'sathar123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9496658065', 'Employee', 'Male', '06/03/1987', 'ABDUL SATHAR PT', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(436, NULL, '', 'bava123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '8086995429', 'Employee', 'Male', '31/05/1985', 'BAVA KARIMBA', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(437, NULL, '', 'ansar123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '8089723309', 'New Venture', 'Male', '30/12/1990', 'ANSAR', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(438, NULL, '', 'akhil123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '8281636362', 'Employee', 'Male', '20/05/1997', 'AKHIL', 'KR', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(439, NULL, '', 'jithin123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9072149343', 'Trainee', 'Male', '21/06/1991', 'JITHIN JOHN SUNIL', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 0, NULL, NULL),
(440, NULL, '', 'bassam123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9605413177', 'Trainee', 'Male', '03/03/2000', 'MUHAMMED BASSAM E', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(441, NULL, '', 'abinsree1998@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9745787472', 'Trainee', 'Male', '29/03/1998', 'ABIN K', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 0, NULL, NULL),
(442, NULL, '', 'thrusal123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '8281355605', 'Trainee', 'Male', '24/09/1995', 'THRUSAL A', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 0, NULL, NULL),
(443, NULL, '', 'anas123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '8592804815', 'Trainee', 'Male', '19/04/2001', 'ANAS KM', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(444, NULL, '', 'hazeem123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9656464224', 'Trainee', 'Male', '12/05/1982', 'HAZEEM KT', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(446, NULL, '', 'basimsidan123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '8289897372', 'Trainee', 'Male', '09/07/1998', 'BASIM SIDAN K', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 0, NULL, NULL),
(447, NULL, '', 'gafoor123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9061174724', 'Employee', 'Male', '24/06/1971', 'ABDUL GAFOOR MV', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(448, NULL, '', 'hyder123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9946763540', 'Employee', 'Male', '20/05/1967', 'HYDER', 'THOTTIYAN', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(449, NULL, '', 'shafeeque123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9605990538', 'Employee', 'Male', '29/12/1995', 'MUHAMMED SHAFEEQUE K', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(450, NULL, '', 'favas123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '8943901350', 'Trainee', 'Female', '12/07/1997', 'FAVAS PP', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 0, NULL, NULL),
(451, NULL, '', 'ajin123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '6238836311', 'Trainee', 'Male', '10/04/1998', 'AJIN K', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(453, NULL, '', 'jubair123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9072544042', 'Trainee', 'Male', '02/11/2000', 'MUHAMMED JUBAIR MT', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(454, NULL, '', 'suhaibch98@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9747820155', 'Trainee', 'Male', '31/03/1998', 'SUHAIB CH', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 0, NULL, NULL),
(455, NULL, '', 'haseeb123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9048725464', 'Employee', 'Male', '28/06/1994', 'HASEEB O.K', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(456, NULL, '', 'asish123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '7736520779', 'Trainee', 'Male', '07/10/1995', 'ASISH MT', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 0, NULL, NULL),
(457, NULL, '', 'ashiq123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9846036920', 'Employee', 'Male', '26/07/1997', 'Ashiq Rahman PK', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(458, NULL, '', 'shaheer123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '7356087423', 'Trainee', 'Male', '08/08/1997', 'MUHAMMED SHAHEER PK', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 0, NULL, NULL),
(459, NULL, '', 'afnan123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '974712309', 'Trainee', 'Male', '27/12/1998', 'MOHAMMED AFNAN CA', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(460, NULL, '', 'anees123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9656903145', 'Employee', 'Male', '23/08/1998', 'ANEESH MUHAMMED AV', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(461, NULL, '', 'vyshakpunathil56@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9846117673', 'Employee', 'Male', '07/02/1996', 'VYSHAK P', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(462, NULL, '', 'asharudeen1234@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9539507968', 'Employee', 'Male', '16/06/1994', 'MOHAMMED ASHARUDHEEN PC', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(463, NULL, '', 'favask123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '7559873749', 'Employee', 'Male', '20/05/1998', 'FAVAS K', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(464, NULL, '', 'rashad123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '8606777609', 'New Venture', 'Male', '12/05/1982', 'RASHAD PT', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(465, NULL, '', 'safeer123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9446964862', 'Employee', 'Male', '30/03/1996', 'MUHAMMED SAFEER K', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(466, NULL, '', 'shamsu123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9048959459', 'Employee', 'Male', '20/12/1888', 'SHAMSUDHEEN PM', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(467, NULL, '', 'deepu123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9745881112', 'Employee', 'Male', '07/08/1998', 'DEEPU KS', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(468, NULL, '', 'hamidrahlan@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9567916357', 'Employee', 'Male', '15/12/1995', 'HAMID RAHLAN VP', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(469, NULL, '', 'rafadh123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9207521214', 'Trainee', 'Male', '17/11/1999', 'RAFADH MUHAMMED', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(470, NULL, '', 'najih123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '6282722120', 'Trainee', 'Male', '05/12/2000', 'NAJIH SULTAN ABDUL KHADER', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(471, NULL, '', 'vahab123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9544332153', 'Employee', 'Male', '12/05/1982', 'VAHAB', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(472, NULL, '', 'ashraf123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '96452 22482', 'Employee', 'Male', '03/02/1984', 'ASHRAF CP', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(473, NULL, '', 'sreejith123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '94956 51853', 'Employee', 'Male', '01/04/1989', 'SREEJITH PK', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(474, NULL, '', 'shabeebp494@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9846384600', 'Employee', 'Male', '20/03/1996', 'SHABEEB P', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(475, NULL, '', 'saheer123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9539301601', 'Employee', 'Male', '12/05/1982', 'SAHEER', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(476, NULL, '', 'najmal123@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '99474 27684', 'New Venture', 'Male', '15/11/1994', 'NAJMAL N', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(477, NULL, '', 'shanilkwkdr@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '8129849845', 'Employee', 'Male', '29/03/1996', 'SHANIL K NAJEEB', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(478, NULL, '', 'yasiyaseen08@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '9946012592', 'New Venture', 'Male', '23/05/1998', 'MUHAMMED YASEEN VV', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(479, NULL, '', 'adox@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '+913534534', 'Trainee', 'Male', '20/08/2022', 'Adox Test', '', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(480, NULL, 'admin', 'admin@admin.com', NULL, '$2y$10$eWGFSTpQANGaIXN2SorrO.TYLngELFSLdMAm4dF5KxkFdxWlZVlP2', NULL, 'Admin', NULL, 'Admin', 'Female', '06/09/2000', NULL, NULL, 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(482, 'ANA TR 002', 'Rahul Raj', 'rahulraj@gmail.com', NULL, '$2y$10$66YXs2yIKn3FjQ9hTQyNBedbv2m.5IWTe1CxhJ5BdaObKHWhEkPuy', NULL, 'Employee', '8943437612', 'Trainee', 'Female', '15/11/1993', 'Rahul', 'Raj', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, '2022-10-10 06:02:49', '2022-10-10 06:02:49'),
(483, 'ANA TR 001', 'Shibila Basheer', 'shibila.aysha@gmail.com', NULL, '$2y$10$ApquOfJ0Pz8bKqNVNi1Mr.BKC91nKQvlEMwH1VETq9E8Hze3Q4F9i', NULL, 'Employee', '8943437612', 'Trainee', 'Female', '15/11/1993', 'Shibila', 'Basheer', 'http://localhost/payroll/assets/images/faces/1.jpg', 0, '2022-10-25 03:56:33', '2022-10-25 03:56:33'),
(484, NULL, 'Super Admin', 'superadmin@gmail.com', NULL, '$2y$10$eWGFSTpQANGaIXN2SorrO.TYLngELFSLdMAm4dF5KxkFdxWlZVlP2', NULL, 'Super Admin', NULL, NULL, NULL, NULL, NULL, NULL, 'http://localhost/payroll/assets/images/faces/1.jpg', 1, NULL, NULL),
(485, 'ANA TR 002', 'Shibila Basheer', 'lifestyle@gmail.com', NULL, '', NULL, 'Employee', '7034896646', 'Trainee', 'Female', '31/05/2024', 'Shibila', 'Basheer', 'http://localhost/payroll/assets/images/faces/1.jpg', 1, '2024-05-31 03:41:09', '2024-05-31 03:41:09'),
(498, 'ANA TR 003', 'Shibila Basheer', 'shibila.aysha@gmail.comkkl', NULL, '', NULL, 'Employee', '+96655209167790', 'Trainee', 'Male', '24/08/2024', 'Shibila', 'Basheer', 'http://localhost/payroll/uploads/082420241112282.jpg', 1, '2024-08-24 05:42:28', '2024-08-24 05:42:28'),
(499, 'ANA TR 004', 'Shibilaaaaaaaaaa Basheer', 'shibila.aysha@gmail.commuim', NULL, '', NULL, 'Employee', '70348966468', 'Trainee', 'Male', '24/08/2024', 'Shibilaaaaaaaaaa', 'Basheer', 'http://localhost/payroll/images/Capture.png', 0, '2024-08-24 05:49:23', '2024-08-27 07:20:36'),
(500, 'ANA TR 005', 'Zeyn Ezdhan', 'zeynezdhan@gmail.com', NULL, '', NULL, 'Employee', '0920743761', 'Trainee', 'Male', '27/08/2024', 'Zeyn', 'Ezdhan', 'http://localhost/payroll/uploads/0827202410385502282021104535carrot.jpg', 0, '2024-08-27 05:08:55', '2024-08-27 07:20:32'),
(501, NULL, 'Zeyn Ezdhan', 'zeynezzdhan@gmail.com', NULL, '', NULL, 'Employee', '7034896645', 'Trainee', 'Male', '01/01/2010', 'Zeyn', 'Ezdhan', 'http://localhost/payroll/uploads/082720241250211593600660blog1.jpg.jpg', 0, '2024-08-27 07:20:21', '2024-08-27 07:20:28'),
(502, NULL, 'Zeyn Ezdhan', 'zeyunezdhan@gmail.com', NULL, '', NULL, 'Employee', '0920743761', 'Trainee', 'Male', '27/08/2024', 'Zeyn', 'Ezdhan', 'http://localhost/payroll/uploads/0827202413045902282021104535carrot.jpg', 1, '2024-08-27 07:34:59', '2024-08-27 07:34:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deductions`
--
ALTER TABLE `deductions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_projects`
--
ALTER TABLE `employee_projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_timesheet`
--
ALTER TABLE `employee_timesheet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_timesheet_hourly`
--
ALTER TABLE `employee_timesheet_hourly`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expiry_notifications`
--
ALTER TABLE `expiry_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `firebases`
--
ALTER TABLE `firebases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `machine_types`
--
ALTER TABLE `machine_types`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_status`
--
ALTER TABLE `payment_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_components`
--
ALTER TABLE `payroll_components`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rates`
--
ALTER TABLE `rates`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sticky_notes`
--
ALTER TABLE `sticky_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timesheets`
--
ALTER TABLE `timesheets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `track_employees`
--
ALTER TABLE `track_employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `useraddresses`
--
ALTER TABLE `useraddresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userdetails`
--
ALTER TABLE `userdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `deductions`
--
ALTER TABLE `deductions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employee_projects`
--
ALTER TABLE `employee_projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `employee_timesheet`
--
ALTER TABLE `employee_timesheet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `employee_timesheet_hourly`
--
ALTER TABLE `employee_timesheet_hourly`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `expiry_notifications`
--
ALTER TABLE `expiry_notifications`
  MODIFY `id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `firebases`
--
ALTER TABLE `firebases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `machine_types`
--
ALTER TABLE `machine_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment_status`
--
ALTER TABLE `payment_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `payroll_components`
--
ALTER TABLE `payroll_components`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=649;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT for table `rates`
--
ALTER TABLE `rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `sticky_notes`
--
ALTER TABLE `sticky_notes`
  MODIFY `id` bigint(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `timesheets`
--
ALTER TABLE `timesheets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `track_employees`
--
ALTER TABLE `track_employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2061;

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `useraddresses`
--
ALTER TABLE `useraddresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=263;

--
-- AUTO_INCREMENT for table `userdetails`
--
ALTER TABLE `userdetails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=503;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
