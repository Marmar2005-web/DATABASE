-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2026 at 02:33 AM
-- Server version: 10.11.16-MariaDB
-- PHP Version: 8.3.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tnhs_sis_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_years`
--

CREATE TABLE `academic_years` (
  `academic_year_id` int(11) NOT NULL,
  `year_label` varchar(20) NOT NULL,
  `semester` enum('1st','2nd','Summer') NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `academic_years`
--

INSERT INTO `academic_years` (`academic_year_id`, `year_label`, `semester`, `is_active`, `created_at`) VALUES
(1, '2024-2025', '1st', 1, '2026-10-21 17:54:20');

-- --------------------------------------------------------

--
-- Table structure for table `admin_profiles`
--

CREATE TABLE `admin_profiles` (
  `admin_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `extension_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_profiles`
--

INSERT INTO `admin_profiles` (`admin_id`, `user_id`, `email`, `first_name`, `last_name`, `extension_name`) VALUES
(1, 1, 'admin@tnhs.edu.ph', 'System', 'Administrator', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `announcement_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `target_role` enum('All','Teachers','Students','Staff') NOT NULL,
  `is_archived` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`announcement_id`, `created_by`, `title`, `content`, `author_id`, `target_role`, `is_archived`, `created_at`) VALUES
(3, 1, 'Talakag NHS Foundation Day', 'Join us for the annual Talakag National High School Foundation Day celebration this coming Friday at the school grounds.', 1, 'All', 0, '2026-10-21 17:51:48'),
(4, 1, 'TNHS Enrollment for S.Y. 2024-2025', 'Enrollment for the upcoming school year is now open. Please proceed to the TNHS administrative office or register online.', 1, 'Students', 0, '2026-10-21 17:51:48'),
(5, 1, 'Talakag NHS Foundation Day', 'Join us for the annual Talakag National High School Foundation Day celebration this coming Friday at the school grounds.', 1, 'All', 0, '2026-10-21 17:51:48'),
(6, 1, 'TNHS Enrollment for S.Y. 2024-2025', 'Enrollment for the upcoming school year is now open. Please proceed to the TNHS administrative office or register online.', 1, 'Students', 0, '2026-10-21 17:51:48');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `month` varchar(20) NOT NULL,
  `days_present` int(11) NOT NULL DEFAULT 0,
  `days_absent` int(11) NOT NULL DEFAULT 0,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attendance_id`, `student_id`, `month`, `days_present`, `days_absent`, `updated_at`) VALUES
(1, 1, 'October', 19, 0, '2026-10-29 04:18:40'),
(2, 2, 'October', 17, 2, '2026-10-29 04:18:40'),
(3, 3, 'October', 16, 3, '2026-10-29 04:18:40'),
(4, 4, 'October', 17, 3, '2026-10-29 04:18:40'),
(5, 5, 'October', 15, 1, '2026-10-29 04:18:40'),
(6, 6, 'October', 18, 1, '2026-10-29 04:18:40'),
(7, 7, 'October', 15, 3, '2026-10-29 04:18:40'),
(8, 8, 'October', 19, 1, '2026-10-29 04:18:40'),
(9, 9, 'October', 17, 1, '2026-10-29 04:18:40'),
(10, 10, 'October', 19, 3, '2026-10-29 04:18:40'),
(11, 11, 'October', 19, 0, '2026-10-29 04:18:40'),
(12, 12, 'October', 15, 2, '2026-10-29 04:18:40'),
(13, 13, 'October', 18, 0, '2026-10-29 04:18:40'),
(14, 14, 'October', 16, 0, '2026-10-29 04:18:40'),
(15, 15, 'October', 16, 3, '2026-10-29 04:18:40'),
(16, 16, 'October', 18, 4, '2026-10-29 04:18:40'),
(17, 17, 'October', 15, 0, '2026-10-29 04:18:40'),
(18, 18, 'October', 17, 4, '2026-10-29 04:18:40'),
(19, 19, 'October', 19, 3, '2026-10-29 04:18:40'),
(20, 20, 'October', 16, 2, '2026-10-29 04:18:40'),
(21, 21, 'October', 15, 4, '2026-10-29 04:18:40'),
(22, 22, 'October', 15, 2, '2026-10-29 04:18:40'),
(23, 23, 'October', 18, 3, '2026-10-29 04:18:40'),
(24, 24, 'October', 19, 4, '2026-10-29 04:18:40'),
(25, 25, 'October', 15, 3, '2026-10-29 04:18:40'),
(26, 26, 'October', 16, 1, '2026-10-29 04:18:40'),
(27, 27, 'October', 18, 4, '2026-10-29 04:18:40'),
(28, 28, 'October', 15, 3, '2026-10-29 04:18:40'),
(29, 29, 'October', 17, 4, '2026-10-29 04:18:40'),
(30, 30, 'October', 17, 2, '2026-10-29 04:18:40'),
(31, 31, 'October', 15, 2, '2026-10-29 04:18:40'),
(32, 32, 'October', 19, 4, '2026-10-29 04:18:40'),
(33, 33, 'October', 16, 0, '2026-10-29 04:18:40'),
(34, 34, 'October', 16, 2, '2026-10-29 04:18:40'),
(35, 35, 'October', 18, 4, '2026-10-29 04:18:40'),
(36, 36, 'October', 17, 4, '2026-10-29 04:18:40'),
(37, 37, 'October', 15, 4, '2026-10-29 04:18:40'),
(38, 38, 'October', 19, 0, '2026-10-29 04:18:40'),
(39, 39, 'October', 17, 2, '2026-10-29 04:18:40'),
(40, 40, 'October', 15, 3, '2026-10-29 04:18:40'),
(41, 41, 'October', 16, 0, '2026-10-29 04:18:40'),
(42, 42, 'October', 15, 4, '2026-10-29 04:18:40'),
(43, 43, 'October', 16, 3, '2026-10-29 04:18:40'),
(44, 44, 'October', 16, 3, '2026-10-29 04:18:40'),
(45, 45, 'October', 19, 1, '2026-10-29 04:18:40'),
(46, 46, 'October', 17, 0, '2026-10-29 04:18:40'),
(47, 47, 'October', 19, 1, '2026-10-29 04:18:40'),
(48, 48, 'October', 19, 0, '2026-10-29 04:18:40'),
(49, 49, 'October', 16, 0, '2026-10-29 04:18:40'),
(50, 50, 'October', 16, 0, '2026-10-29 04:18:40'),
(51, 51, 'October', 15, 1, '2026-10-29 04:18:40'),
(52, 52, 'October', 18, 0, '2026-10-29 04:18:40'),
(53, 53, 'October', 18, 4, '2026-10-29 04:18:40'),
(54, 54, 'October', 15, 3, '2026-10-29 04:18:40'),
(55, 55, 'October', 16, 2, '2026-10-29 04:18:40'),
(56, 56, 'October', 19, 2, '2026-10-29 04:18:40'),
(57, 57, 'October', 18, 1, '2026-10-29 04:18:40'),
(58, 58, 'October', 15, 2, '2026-10-29 04:18:40'),
(59, 59, 'October', 17, 4, '2026-10-29 04:18:40'),
(60, 60, 'October', 15, 1, '2026-10-29 04:18:40'),
(61, 61, 'October', 18, 3, '2026-10-29 04:18:40'),
(62, 62, 'October', 16, 3, '2026-10-29 04:18:40'),
(63, 63, 'October', 17, 2, '2026-10-29 04:18:40'),
(64, 64, 'October', 16, 2, '2026-10-29 04:18:40'),
(65, 65, 'October', 17, 0, '2026-10-29 04:18:40'),
(66, 66, 'October', 15, 4, '2026-10-29 04:18:40'),
(67, 67, 'October', 15, 3, '2026-10-29 04:18:40'),
(68, 68, 'October', 17, 0, '2026-10-29 04:18:40'),
(69, 69, 'October', 17, 3, '2026-10-29 04:18:40'),
(70, 70, 'October', 16, 3, '2026-10-29 04:18:40'),
(71, 71, 'October', 16, 2, '2026-10-29 04:18:40'),
(72, 72, 'October', 18, 0, '2026-10-29 04:18:40'),
(73, 73, 'October', 16, 2, '2026-10-29 04:18:40'),
(74, 74, 'October', 16, 4, '2026-10-29 04:18:40'),
(75, 75, 'October', 19, 1, '2026-10-29 04:18:40'),
(76, 76, 'October', 18, 0, '2026-10-29 04:18:40'),
(77, 77, 'October', 17, 4, '2026-10-29 04:18:40'),
(78, 78, 'October', 16, 2, '2026-10-29 04:18:40'),
(79, 79, 'October', 17, 3, '2026-10-29 04:18:40'),
(80, 80, 'October', 17, 1, '2026-10-29 04:18:40'),
(81, 81, 'October', 18, 2, '2026-10-29 04:18:40'),
(82, 82, 'October', 19, 4, '2026-10-29 04:18:40'),
(83, 83, 'October', 18, 0, '2026-10-29 04:18:40'),
(84, 84, 'October', 15, 3, '2026-10-29 04:18:40'),
(85, 85, 'October', 17, 4, '2026-10-29 04:18:40'),
(86, 86, 'October', 19, 2, '2026-10-29 04:18:40'),
(87, 87, 'October', 16, 1, '2026-10-29 04:18:40'),
(88, 88, 'October', 16, 2, '2026-10-29 04:18:40'),
(89, 89, 'October', 16, 1, '2026-10-29 04:18:40'),
(90, 90, 'October', 19, 0, '2026-10-29 04:18:40'),
(91, 91, 'October', 17, 3, '2026-10-29 04:18:40'),
(92, 92, 'October', 15, 1, '2026-10-29 04:18:40'),
(93, 93, 'October', 17, 3, '2026-10-29 04:18:40'),
(94, 94, 'October', 17, 2, '2026-10-29 04:18:40'),
(95, 95, 'October', 16, 1, '2026-10-29 04:18:40'),
(96, 96, 'October', 15, 2, '2026-10-29 04:18:40'),
(97, 97, 'October', 18, 3, '2026-10-29 04:18:40'),
(98, 98, 'October', 16, 3, '2026-10-29 04:18:40'),
(99, 99, 'October', 15, 1, '2026-10-29 04:18:40'),
(100, 100, 'October', 18, 3, '2026-10-29 04:18:40');

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(100) NOT NULL,
  `target_table` varchar(50) NOT NULL,
  `record_id` varchar(50) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audit_logs`
--

INSERT INTO `audit_logs` (`log_id`, `user_id`, `action`, `target_table`, `record_id`, `ip_address`, `user_agent`, `timestamp`) VALUES
(1, NULL, 'LOGIN', 'users', '1', '192.168.1.10', 'Mozilla/5.0', '2026-10-21 16:20:52'),
(2, NULL, 'UPDATE_GRADE', 'grades', '1', '192.168.1.15', 'Mozilla/5.0', '2026-10-21 16:20:52'),
(3, NULL, 'CREATE_USER', 'users', '51', '192.168.1.10', 'Mozilla/5.0', '2026-10-21 16:20:52'),
(4, NULL, 'LOGIN', 'users', '3', '192.168.1.20', 'Mozilla/5.0', '2026-10-21 16:20:52'),
(5, NULL, 'DELETE_ANNOUNCEMENT', 'announcements', '5', '192.168.1.10', 'Mozilla/5.0', '2026-10-21 16:20:52'),
(6, NULL, 'UPDATE_ATTENDANCE', 'attendance', '10', '192.168.1.22', 'Mozilla/5.0', '2026-10-21 16:20:52'),
(7, NULL, 'EXPORT_DATA', 'students', 'NULL', '192.168.1.10', 'Mozilla/5.0', '2026-10-21 16:20:52'),
(8, NULL, 'LOGIN', 'users', '5', '192.168.1.25', 'Mozilla/5.0', '2026-10-21 16:20:52'),
(9, NULL, 'RESET_PASSWORD', 'users', '7', '192.168.1.15', 'Mozilla/5.0', '2026-10-21 16:20:52'),
(10, NULL, 'LOGOUT', 'users', '1', '192.168.1.10', 'Mozilla/5.0', '2026-10-21 16:20:52'),
(11, 1, 'LOGIN', 'users', '1', '192.168.1.50', 'Mozilla/5.0', '2026-10-29 04:55:34'),
(12, 2, 'LOGIN', 'users', '2', '192.168.1.50', 'Mozilla/5.0', '2026-10-29 04:55:34'),
(13, 3, 'LOGIN', 'users', '3', '192.168.1.50', 'Mozilla/5.0', '2026-10-29 04:55:34');

-- --------------------------------------------------------

--
-- Table structure for table `chatbot_knowledge_base`
--

CREATE TABLE `chatbot_knowledge_base` (
  `faq_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `target_role` enum('All','Teachers','Students','Staff') NOT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chatbot_knowledge_base`
--

INSERT INTO `chatbot_knowledge_base` (`faq_id`, `question`, `answer`, `category_id`, `target_role`, `is_published`, `created_by`, `updated_by`, `updated_at`) VALUES
(6, 'How can I view my quarterly grades?', 'You can view your grades by logging into your student portal and clicking on the Grades tab on your dashboard.', 1, 'Students', 1, 1, 1, '2026-10-21 17:50:27'),
(7, 'What are the requirements for enrollment?', 'Enrollment requirements include your Form 138 (Report Card), birth certificate from PSA, and a completed registration form.', 2, 'Students', 1, 1, 1, '2026-10-21 17:50:27'),
(8, 'How do I reset my account password?', 'You can click on the \"Forgot Password\" link on the login page, or visit the school office for assistance.', 3, 'All', 1, 1, 1, '2026-10-21 17:50:27'),
(9, 'What are the school administrative office hours?', 'The school admin office is open from Monday to Friday, 8:00 AM to 5:00 PM.', 3, 'All', 1, 1, 1, '2026-10-21 17:50:27'),
(10, 'How many days am I allowed to be absent?', 'Students are allowed up to a maximum number of excused absences per semester as set by DepEd guidelines. Please check your attendance tab for details.', 1, 'Students', 1, 1, 1, '2026-10-21 17:50:27');

-- --------------------------------------------------------

--
-- Table structure for table `educ_stages`
--

CREATE TABLE `educ_stages` (
  `stage_id` int(11) NOT NULL,
  `stage_code` varchar(20) NOT NULL,
  `stage_name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `educ_stages`
--

INSERT INTO `educ_stages` (`stage_id`, `stage_code`, `stage_name`, `description`, `created_at`) VALUES
(1, 'JHS', 'Junior High School', 'Grades 7 to 10', '2026-10-21 15:49:07'),
(2, 'SHS', 'Senior High School', 'Grades 11 to 12', '2026-10-21 15:49:07');

-- --------------------------------------------------------

--
-- Table structure for table `emergency_contacts`
--

CREATE TABLE `emergency_contacts` (
  `contact_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `guardian_name` varchar(100) NOT NULL,
  `relationship` varchar(50) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `alternative_number` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emergency_contacts`
--

INSERT INTO `emergency_contacts` (`contact_id`, `student_id`, `guardian_name`, `relationship`, `contact_number`, `alternative_number`, `address`, `is_primary`) VALUES
(1, 1, 'Guardian of First1', 'Parent', '09190000001', NULL, 'Talakag, Bukidnon', 1),
(2, 2, 'Guardian of First2', 'Parent', '09190000002', NULL, 'Talakag, Bukidnon', 1),
(3, 3, 'Guardian of First3', 'Parent', '09190000003', NULL, 'Talakag, Bukidnon', 1),
(4, 4, 'Guardian of First4', 'Parent', '09190000004', NULL, 'Talakag, Bukidnon', 1),
(5, 5, 'Guardian of First5', 'Parent', '09190000005', NULL, 'Talakag, Bukidnon', 1),
(6, 6, 'Guardian of First6', 'Parent', '09190000006', NULL, 'Talakag, Bukidnon', 1),
(7, 7, 'Guardian of First7', 'Parent', '09190000007', NULL, 'Talakag, Bukidnon', 1),
(8, 8, 'Guardian of First8', 'Parent', '09190000008', NULL, 'Talakag, Bukidnon', 1),
(9, 9, 'Guardian of First9', 'Parent', '09190000009', NULL, 'Talakag, Bukidnon', 1),
(10, 10, 'Guardian of First10', 'Parent', '09190000010', NULL, 'Talakag, Bukidnon', 1),
(11, 11, 'Guardian of First11', 'Parent', '09190000011', NULL, 'Talakag, Bukidnon', 1),
(12, 12, 'Guardian of First12', 'Parent', '09190000012', NULL, 'Talakag, Bukidnon', 1),
(13, 13, 'Guardian of First13', 'Parent', '09190000013', NULL, 'Talakag, Bukidnon', 1),
(14, 14, 'Guardian of First14', 'Parent', '09190000014', NULL, 'Talakag, Bukidnon', 1),
(15, 15, 'Guardian of First15', 'Parent', '09190000015', NULL, 'Talakag, Bukidnon', 1),
(16, 16, 'Guardian of First16', 'Parent', '09190000016', NULL, 'Talakag, Bukidnon', 1),
(17, 17, 'Guardian of First17', 'Parent', '09190000017', NULL, 'Talakag, Bukidnon', 1),
(18, 18, 'Guardian of First18', 'Parent', '09190000018', NULL, 'Talakag, Bukidnon', 1),
(19, 19, 'Guardian of First19', 'Parent', '09190000019', NULL, 'Talakag, Bukidnon', 1),
(20, 20, 'Guardian of First20', 'Parent', '09190000020', NULL, 'Talakag, Bukidnon', 1),
(21, 21, 'Guardian of First21', 'Parent', '09190000021', NULL, 'Talakag, Bukidnon', 1),
(22, 22, 'Guardian of First22', 'Parent', '09190000022', NULL, 'Talakag, Bukidnon', 1),
(23, 23, 'Guardian of First23', 'Parent', '09190000023', NULL, 'Talakag, Bukidnon', 1),
(24, 24, 'Guardian of First24', 'Parent', '09190000024', NULL, 'Talakag, Bukidnon', 1),
(25, 25, 'Guardian of First25', 'Parent', '09190000025', NULL, 'Talakag, Bukidnon', 1),
(26, 26, 'Guardian of First26', 'Parent', '09190000026', NULL, 'Talakag, Bukidnon', 1),
(27, 27, 'Guardian of First27', 'Parent', '09190000027', NULL, 'Talakag, Bukidnon', 1),
(28, 28, 'Guardian of First28', 'Parent', '09190000028', NULL, 'Talakag, Bukidnon', 1),
(29, 29, 'Guardian of First29', 'Parent', '09190000029', NULL, 'Talakag, Bukidnon', 1),
(30, 30, 'Guardian of First30', 'Parent', '09190000030', NULL, 'Talakag, Bukidnon', 1),
(31, 31, 'Guardian of First31', 'Parent', '09190000031', NULL, 'Talakag, Bukidnon', 1),
(32, 32, 'Guardian of First32', 'Parent', '09190000032', NULL, 'Talakag, Bukidnon', 1),
(33, 33, 'Guardian of First33', 'Parent', '09190000033', NULL, 'Talakag, Bukidnon', 1),
(34, 34, 'Guardian of First34', 'Parent', '09190000034', NULL, 'Talakag, Bukidnon', 1),
(35, 35, 'Guardian of First35', 'Parent', '09190000035', NULL, 'Talakag, Bukidnon', 1),
(36, 36, 'Guardian of First36', 'Parent', '09190000036', NULL, 'Talakag, Bukidnon', 1),
(37, 37, 'Guardian of First37', 'Parent', '09190000037', NULL, 'Talakag, Bukidnon', 1),
(38, 38, 'Guardian of First38', 'Parent', '09190000038', NULL, 'Talakag, Bukidnon', 1),
(39, 39, 'Guardian of First39', 'Parent', '09190000039', NULL, 'Talakag, Bukidnon', 1),
(40, 40, 'Guardian of First40', 'Parent', '09190000040', NULL, 'Talakag, Bukidnon', 1),
(41, 41, 'Guardian of First41', 'Parent', '09190000041', NULL, 'Talakag, Bukidnon', 1),
(42, 42, 'Guardian of First42', 'Parent', '09190000042', NULL, 'Talakag, Bukidnon', 1),
(43, 43, 'Guardian of First43', 'Parent', '09190000043', NULL, 'Talakag, Bukidnon', 1),
(44, 44, 'Guardian of First44', 'Parent', '09190000044', NULL, 'Talakag, Bukidnon', 1),
(45, 45, 'Guardian of First45', 'Parent', '09190000045', NULL, 'Talakag, Bukidnon', 1),
(46, 46, 'Guardian of First46', 'Parent', '09190000046', NULL, 'Talakag, Bukidnon', 1),
(47, 47, 'Guardian of First47', 'Parent', '09190000047', NULL, 'Talakag, Bukidnon', 1),
(48, 48, 'Guardian of First48', 'Parent', '09190000048', NULL, 'Talakag, Bukidnon', 1),
(49, 49, 'Guardian of First49', 'Parent', '09190000049', NULL, 'Talakag, Bukidnon', 1),
(50, 50, 'Guardian of First50', 'Parent', '09190000050', NULL, 'Talakag, Bukidnon', 1),
(51, 51, 'Guardian of First51', 'Parent', '09190000051', NULL, 'Talakag, Bukidnon', 1),
(52, 52, 'Guardian of First52', 'Parent', '09190000052', NULL, 'Talakag, Bukidnon', 1),
(53, 53, 'Guardian of First53', 'Parent', '09190000053', NULL, 'Talakag, Bukidnon', 1),
(54, 54, 'Guardian of First54', 'Parent', '09190000054', NULL, 'Talakag, Bukidnon', 1),
(55, 55, 'Guardian of First55', 'Parent', '09190000055', NULL, 'Talakag, Bukidnon', 1),
(56, 56, 'Guardian of First56', 'Parent', '09190000056', NULL, 'Talakag, Bukidnon', 1),
(57, 57, 'Guardian of First57', 'Parent', '09190000057', NULL, 'Talakag, Bukidnon', 1),
(58, 58, 'Guardian of First58', 'Parent', '09190000058', NULL, 'Talakag, Bukidnon', 1),
(59, 59, 'Guardian of First59', 'Parent', '09190000059', NULL, 'Talakag, Bukidnon', 1),
(60, 60, 'Guardian of First60', 'Parent', '09190000060', NULL, 'Talakag, Bukidnon', 1),
(61, 61, 'Guardian of First61', 'Parent', '09190000061', NULL, 'Talakag, Bukidnon', 1),
(62, 62, 'Guardian of First62', 'Parent', '09190000062', NULL, 'Talakag, Bukidnon', 1),
(63, 63, 'Guardian of First63', 'Parent', '09190000063', NULL, 'Talakag, Bukidnon', 1),
(64, 64, 'Guardian of First64', 'Parent', '09190000064', NULL, 'Talakag, Bukidnon', 1),
(65, 65, 'Guardian of First65', 'Parent', '09190000065', NULL, 'Talakag, Bukidnon', 1),
(66, 66, 'Guardian of First66', 'Parent', '09190000066', NULL, 'Talakag, Bukidnon', 1),
(67, 67, 'Guardian of First67', 'Parent', '09190000067', NULL, 'Talakag, Bukidnon', 1),
(68, 68, 'Guardian of First68', 'Parent', '09190000068', NULL, 'Talakag, Bukidnon', 1),
(69, 69, 'Guardian of First69', 'Parent', '09190000069', NULL, 'Talakag, Bukidnon', 1),
(70, 70, 'Guardian of First70', 'Parent', '09190000070', NULL, 'Talakag, Bukidnon', 1),
(71, 71, 'Guardian of First71', 'Parent', '09190000071', NULL, 'Talakag, Bukidnon', 1),
(72, 72, 'Guardian of First72', 'Parent', '09190000072', NULL, 'Talakag, Bukidnon', 1),
(73, 73, 'Guardian of First73', 'Parent', '09190000073', NULL, 'Talakag, Bukidnon', 1),
(74, 74, 'Guardian of First74', 'Parent', '09190000074', NULL, 'Talakag, Bukidnon', 1),
(75, 75, 'Guardian of First75', 'Parent', '09190000075', NULL, 'Talakag, Bukidnon', 1),
(76, 76, 'Guardian of First76', 'Parent', '09190000076', NULL, 'Talakag, Bukidnon', 1),
(77, 77, 'Guardian of First77', 'Parent', '09190000077', NULL, 'Talakag, Bukidnon', 1),
(78, 78, 'Guardian of First78', 'Parent', '09190000078', NULL, 'Talakag, Bukidnon', 1),
(79, 79, 'Guardian of First79', 'Parent', '09190000079', NULL, 'Talakag, Bukidnon', 1),
(80, 80, 'Guardian of First80', 'Parent', '09190000080', NULL, 'Talakag, Bukidnon', 1),
(81, 81, 'Guardian of First81', 'Parent', '09190000081', NULL, 'Talakag, Bukidnon', 1),
(82, 82, 'Guardian of First82', 'Parent', '09190000082', NULL, 'Talakag, Bukidnon', 1),
(83, 83, 'Guardian of First83', 'Parent', '09190000083', NULL, 'Talakag, Bukidnon', 1),
(84, 84, 'Guardian of First84', 'Parent', '09190000084', NULL, 'Talakag, Bukidnon', 1),
(85, 85, 'Guardian of First85', 'Parent', '09190000085', NULL, 'Talakag, Bukidnon', 1),
(86, 86, 'Guardian of First86', 'Parent', '09190000086', NULL, 'Talakag, Bukidnon', 1),
(87, 87, 'Guardian of First87', 'Parent', '09190000087', NULL, 'Talakag, Bukidnon', 1),
(88, 88, 'Guardian of First88', 'Parent', '09190000088', NULL, 'Talakag, Bukidnon', 1),
(89, 89, 'Guardian of First89', 'Parent', '09190000089', NULL, 'Talakag, Bukidnon', 1),
(90, 90, 'Guardian of First90', 'Parent', '09190000090', NULL, 'Talakag, Bukidnon', 1),
(91, 91, 'Guardian of First91', 'Parent', '09190000091', NULL, 'Talakag, Bukidnon', 1),
(92, 92, 'Guardian of First92', 'Parent', '09190000092', NULL, 'Talakag, Bukidnon', 1),
(93, 93, 'Guardian of First93', 'Parent', '09190000093', NULL, 'Talakag, Bukidnon', 1),
(94, 94, 'Guardian of First94', 'Parent', '09190000094', NULL, 'Talakag, Bukidnon', 1),
(95, 95, 'Guardian of First95', 'Parent', '09190000095', NULL, 'Talakag, Bukidnon', 1),
(96, 96, 'Guardian of First96', 'Parent', '09190000096', NULL, 'Talakag, Bukidnon', 1),
(97, 97, 'Guardian of First97', 'Parent', '09190000097', NULL, 'Talakag, Bukidnon', 1),
(98, 98, 'Guardian of First98', 'Parent', '09190000098', NULL, 'Talakag, Bukidnon', 1),
(99, 99, 'Guardian of First99', 'Parent', '09190000099', NULL, 'Talakag, Bukidnon', 1),
(100, 100, 'Guardian of First100', 'Parent', '09190000100', NULL, 'Talakag, Bukidnon', 1);

-- --------------------------------------------------------

--
-- Table structure for table `enrollment_status`
--

CREATE TABLE `enrollment_status` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollment_status`
--

INSERT INTO `enrollment_status` (`status_id`, `status_name`, `description`, `created_at`) VALUES
(1, 'Enrolled', 'Currently enrolled and active', '2026-10-21 15:54:44'),
(2, 'Dropped', 'No longer attending classes', '2026-10-21 15:54:44'),
(3, 'Graduated', 'Completed the program', '2026-10-21 15:54:44');

-- --------------------------------------------------------

--
-- Table structure for table `faq_categories`
--

CREATE TABLE `faq_categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faq_categories`
--

INSERT INTO `faq_categories` (`category_id`, `category_name`, `description`, `created_at`) VALUES
(1, 'Academics', 'Queries related to grades, subjects, and curriculum', '2026-10-21 15:56:39'),
(2, 'Admissions', 'Enrollment, requirements, and school policies', '2026-10-21 15:56:39'),
(3, 'Technical Support', 'Portal login, password resets, and system issues', '2026-10-21 15:56:39');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `grade_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `q1_grade` decimal(5,2) DEFAULT NULL,
  `q2_grade` decimal(5,2) DEFAULT NULL,
  `q3_grade` decimal(5,2) DEFAULT NULL,
  `q4_grade` decimal(5,2) DEFAULT NULL,
  `final_grade` decimal(5,2) DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`grade_id`, `student_id`, `subject_id`, `teacher_id`, `q1_grade`, `q2_grade`, `q3_grade`, `q4_grade`, `final_grade`, `remarks`, `is_locked`, `updated_by`, `updated_at`) VALUES
(1, 1, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(2, 2, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(3, 3, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(4, 4, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(5, 5, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(6, 6, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(7, 7, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(8, 8, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(9, 9, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(10, 10, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(11, 11, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(12, 12, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(13, 13, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(14, 14, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(15, 15, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(16, 16, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(17, 17, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(18, 18, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(19, 19, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(20, 20, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(21, 21, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(22, 22, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(23, 23, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(24, 24, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(25, 25, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(26, 26, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(27, 27, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(28, 28, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(29, 29, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(30, 30, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(31, 31, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(32, 32, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(33, 33, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(34, 34, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(35, 35, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(36, 36, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(37, 37, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(38, 38, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(39, 39, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(40, 40, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(41, 41, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(42, 42, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(43, 43, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(44, 44, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(45, 45, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(46, 46, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(47, 47, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(48, 48, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(49, 49, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(50, 50, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(51, 51, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(52, 52, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(53, 53, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(54, 54, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(55, 55, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(56, 56, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(57, 57, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(58, 58, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(59, 59, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(60, 60, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(61, 61, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(62, 62, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(63, 63, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(64, 64, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(65, 65, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(66, 66, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(67, 67, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(68, 68, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(69, 69, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(70, 70, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(71, 71, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(72, 72, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(73, 73, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(74, 74, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(75, 75, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(76, 76, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(77, 77, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(78, 78, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(79, 79, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(80, 80, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(81, 81, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(82, 82, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(83, 83, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(84, 84, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(85, 85, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(86, 86, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(87, 87, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(88, 88, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(89, 89, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(90, 90, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(91, 91, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(92, 92, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(93, 93, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(94, 94, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(95, 95, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(96, 96, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(97, 97, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(98, 98, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(99, 99, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(100, 100, 1, 1, 85.00, 85.00, 85.00, 85.00, 85.00, 'Failed', 0, 1, '2026-10-29 05:50:12'),
(128, 1, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(129, 2, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(130, 3, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(131, 4, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(132, 5, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(133, 6, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(134, 7, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(135, 8, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(136, 9, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(137, 10, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(138, 11, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(139, 12, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(140, 13, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(141, 14, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(142, 15, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(143, 16, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(144, 17, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(145, 18, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(146, 19, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(147, 20, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(148, 21, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(149, 22, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(150, 23, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(151, 24, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(152, 25, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(153, 26, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(154, 27, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(155, 28, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(156, 29, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(157, 30, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(158, 31, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(159, 32, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(160, 33, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(161, 34, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(162, 35, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(163, 36, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(164, 37, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(165, 38, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(166, 39, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(167, 40, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(168, 41, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(169, 42, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(170, 43, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(171, 44, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(172, 45, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(173, 46, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(174, 47, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(175, 48, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(176, 49, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(177, 50, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(178, 51, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(179, 52, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(180, 53, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(181, 54, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(182, 55, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(183, 56, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(184, 57, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(185, 58, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(186, 59, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(187, 60, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(188, 61, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(189, 62, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(190, 63, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(191, 64, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(192, 65, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(193, 66, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(194, 67, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(195, 68, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(196, 69, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(197, 70, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(198, 71, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(199, 72, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(200, 73, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(201, 74, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(202, 75, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(203, 76, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(204, 77, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(205, 78, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(206, 79, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(207, 80, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(208, 81, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(209, 82, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(210, 83, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(211, 84, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(212, 85, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(213, 86, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(214, 87, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(215, 88, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(216, 89, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(217, 90, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(218, 91, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(219, 92, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(220, 93, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(221, 94, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(222, 95, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(223, 96, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(224, 97, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(225, 98, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(226, 99, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58'),
(227, 100, 2, 2, 88.00, 88.00, 88.00, 88.00, 88.00, 'Passed', 0, 1, '2026-10-29 03:27:58');

-- --------------------------------------------------------

--
-- Table structure for table `grade_levels`
--

CREATE TABLE `grade_levels` (
  `grade_level_id` int(11) NOT NULL,
  `grade_level_name` varchar(50) NOT NULL,
  `grade_level_order` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grade_levels`
--

INSERT INTO `grade_levels` (`grade_level_id`, `grade_level_name`, `grade_level_order`, `description`, `created_at`) VALUES
(1, 'Grade 7', 7, 'Junior High School', '2026-10-21 16:01:25'),
(2, 'Grade 8', 8, 'Junior High School', '2026-10-21 16:01:25'),
(3, 'Grade 9', 9, 'Junior High School', '2026-10-21 16:01:25'),
(4, 'Grade 10', 10, 'Junior High School', '2026-10-21 16:01:25'),
(5, 'Grade 11', 11, 'Senior High School', '2026-10-21 16:01:25'),
(6, 'Grade 12', 12, 'Senior High School', '2026-10-21 16:01:25');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `permission_id` int(11) NOT NULL,
  `permission_name` varchar(100) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `module` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`permission_id`, `permission_name`, `display_name`, `module`, `description`, `created_at`, `updated_at`) VALUES
(1, 'manage_users', '', '', 'Can create, edit, and delete user accounts', '2026-10-21 18:03:18', '2026-10-21 18:03:18'),
(2, 'manage_grades', '', '', 'Can input and edit student grades', '2026-10-21 18:03:18', '2026-10-21 18:03:18'),
(3, 'view_reports', '', '', 'Can view academic and attendance reports', '2026-10-21 18:03:18', '2026-10-21 18:03:18');

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `position_id` int(11) NOT NULL,
  `position_title` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`position_id`, `position_title`, `description`, `created_at`) VALUES
(1, 'Principal', 'Head of the institution', '2026-10-21 15:55:40'),
(2, 'Head Teacher', 'Department head', '2026-10-21 15:55:40'),
(3, 'Registrar', 'Handles student records and enrollment', '2026-10-21 15:55:40'),
(4, 'Teacher 1', 'Entry-level teaching position.', '2026-10-29 04:35:41'),
(5, 'Teacher 2', 'Intermediate teaching position', '2026-10-29 04:35:41'),
(6, 'Teacher 3', 'Senior teaching position', '2026-10-29 04:35:41');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_system_role` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`, `display_name`, `description`, `is_system_role`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'System Administrator', 'Full access to all system features', 1, '2026-10-21 15:40:21', '2026-10-21 15:40:21'),
(2, 'Teacher', 'Faculty Member', 'Can manage grades and attendance for assigned classes', 1, '2026-10-21 15:40:21', '2026-10-21 15:40:21'),
(3, 'Student', 'Student Account', 'Can view grades, attendance, and announcements', 1, '2026-10-21 15:40:21', '2026-10-21 15:40:21'),
(4, 'Staff', 'Staff Member', 'Administrative or general staff access for school portal operations', 1, '2026-10-29 04:12:48', '2026-10-29 04:12:48');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `assigned_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`role_id`, `permission_id`, `assigned_at`) VALUES
(1, 1, '2026-10-21 18:05:41'),
(1, 2, '2026-10-21 18:05:41'),
(1, 3, '2026-10-21 18:05:41');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `section_id` int(11) NOT NULL,
  `section_name` varchar(100) NOT NULL,
  `grade_level_id` int(11) NOT NULL,
  `strand_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `academic_year_id` int(11) DEFAULT NULL,
  `educ_stage_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`section_id`, `section_name`, `grade_level_id`, `strand_id`, `teacher_id`, `academic_year_id`, `educ_stage_id`, `created_at`) VALUES
(1, 'Grade 11 - STEM A', 5, 1, 1, 1, 2, '2026-10-21 17:55:51'),
(2, 'Grade 11 - ABM B', 5, 2, 2, 1, 2, '2026-10-21 17:55:51'),
(3, 'Grade 12 - HUMSS A', 6, 3, 3, 1, 2, '2026-10-21 17:55:51'),
(4, 'Grade 12 - TVL B', 6, 4, 4, 1, 2, '2026-10-21 17:55:51');

-- --------------------------------------------------------

--
-- Table structure for table `staff_profiles`
--

CREATE TABLE `staff_profiles` (
  `staff_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `extension_name` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `office_department` varchar(100) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff_profiles`
--

INSERT INTO `staff_profiles` (`staff_id`, `user_id`, `first_name`, `last_name`, `extension_name`, `email`, `contact_number`, `office_department`, `position_id`) VALUES
(16, 2, 'John', 'Smith', NULL, 'teacher1@tnhs.edu.ph', '09170000001', 'Mathematics Dept', 2),
(17, 3, 'Jane', 'Doe', NULL, 'teacher2@tnhs.edu.ph', '09170000002', 'Science Dept', 2),
(18, 4, 'Juan', 'Dela Cruz', NULL, 'teacher3@tnhs.edu.ph', '09170000003', 'English Dept', 2),
(19, 5, 'Maria', 'Clara', NULL, 'teacher4@tnhs.edu.ph', '09170000004', 'Filipino Dept', 2),
(20, 6, 'Pedro', 'Penduko', NULL, 'teacher5@tnhs.edu.ph', '09170000005', 'PE Dept', 2);

-- --------------------------------------------------------

--
-- Table structure for table `strands`
--

CREATE TABLE `strands` (
  `strand_id` int(11) NOT NULL,
  `strand_code` varchar(20) NOT NULL,
  `strand_name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `strands`
--

INSERT INTO `strands` (`strand_id`, `strand_code`, `strand_name`, `description`, `created_at`) VALUES
(1, 'STEM', 'Science, Technology, Engineering, and Mathematics', 'Academic Track', '2026-10-21 15:51:02'),
(2, 'ABM', 'Accountancy, Business, and Management', 'Academic Track', '2026-10-21 15:51:02'),
(3, 'HUMSS', 'Humanities and Social Sciences', 'Academic Track', '2026-10-21 15:51:02'),
(4, 'TVL', 'Technical-Vocational-Livelihood', 'Applied Track', '2026-10-21 15:51:02');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `lrn` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `extension_name` varchar(20) DEFAULT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `birthdate` date NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `user_id`, `lrn`, `email`, `first_name`, `last_name`, `middle_name`, `extension_name`, `gender`, `birthdate`, `section_id`, `status_id`, `deleted_at`) VALUES
(1, 7, '136000000001', 'student7@tnhs.edu.ph', 'First1', 'Last1', NULL, NULL, 'Female', '2011-10-22', 1, 1, NULL),
(2, 8, '136000000002', 'student8@tnhs.edu.ph', 'First2', 'Last2', NULL, NULL, 'Male', '2011-10-22', 1, 1, NULL),
(3, 9, '136000000003', 'student9@tnhs.edu.ph', 'First3', 'Last3', NULL, NULL, 'Female', '2011-10-22', 1, 1, NULL),
(4, 10, '136000000004', 'student10@tnhs.edu.ph', 'First4', 'Last4', NULL, NULL, 'Male', '2011-10-22', 1, 1, NULL),
(5, 11, '136000000005', 'student11@tnhs.edu.ph', 'First5', 'Last5', NULL, NULL, 'Female', '2011-10-22', 1, 1, NULL),
(6, 12, '136000000006', 'student12@tnhs.edu.ph', 'First6', 'Last6', NULL, NULL, 'Male', '2011-10-22', 2, 1, NULL),
(7, 13, '136000000007', 'student13@tnhs.edu.ph', 'First7', 'Last7', NULL, NULL, 'Female', '2011-10-22', 2, 1, NULL),
(8, 14, '136000000008', 'student14@tnhs.edu.ph', 'First8', 'Last8', NULL, NULL, 'Male', '2011-10-22', 2, 1, NULL),
(9, 15, '136000000009', 'student15@tnhs.edu.ph', 'First9', 'Last9', NULL, NULL, 'Female', '2011-10-22', 2, 1, NULL),
(10, 16, '136000000010', 'student16@tnhs.edu.ph', 'First10', 'Last10', NULL, NULL, 'Male', '2011-10-22', 2, 1, NULL),
(11, 17, '136000000011', 'student17@tnhs.edu.ph', 'First11', 'Last11', NULL, NULL, 'Female', '2011-10-22', 3, 1, NULL),
(12, 18, '136000000012', 'student18@tnhs.edu.ph', 'First12', 'Last12', NULL, NULL, 'Male', '2011-10-22', 3, 1, NULL),
(13, 19, '136000000013', 'student19@tnhs.edu.ph', 'First13', 'Last13', NULL, NULL, 'Female', '2011-10-22', 3, 1, NULL),
(14, 20, '136000000014', 'student20@tnhs.edu.ph', 'First14', 'Last14', NULL, NULL, 'Male', '2011-10-22', 3, 1, NULL),
(15, 21, '136000000015', 'student21@tnhs.edu.ph', 'First15', 'Last15', NULL, NULL, 'Female', '2011-10-22', 3, 1, NULL),
(16, 22, '136000000016', 'student22@tnhs.edu.ph', 'First16', 'Last16', NULL, NULL, 'Male', '2011-10-22', 4, 1, NULL),
(17, 23, '136000000017', 'student23@tnhs.edu.ph', 'First17', 'Last17', NULL, NULL, 'Female', '2011-10-22', 4, 1, NULL),
(18, 24, '136000000018', 'student24@tnhs.edu.ph', 'First18', 'Last18', NULL, NULL, 'Male', '2011-10-22', 4, 1, NULL),
(19, 25, '136000000019', 'student25@tnhs.edu.ph', 'First19', 'Last19', NULL, NULL, 'Female', '2011-10-22', 4, 1, NULL),
(20, 26, '136000000020', 'student26@tnhs.edu.ph', 'First20', 'Last20', NULL, NULL, 'Male', '2011-10-22', 4, 1, NULL),
(21, 27, '136000000021', 'student27@tnhs.edu.ph', 'First21', 'Last21', NULL, NULL, 'Female', '2011-10-22', 4, 1, NULL),
(22, 28, '136000000022', 'student28@tnhs.edu.ph', 'First22', 'Last22', NULL, NULL, 'Male', '2011-10-22', 4, 1, NULL),
(23, 29, '136000000023', 'student29@tnhs.edu.ph', 'First23', 'Last23', NULL, NULL, 'Female', '2011-10-22', 4, 1, NULL),
(24, 30, '136000000024', 'student30@tnhs.edu.ph', 'First24', 'Last24', NULL, NULL, 'Male', '2011-10-22', 4, 1, NULL),
(25, 31, '136000000025', 'student31@tnhs.edu.ph', 'First25', 'Last25', NULL, NULL, 'Female', '2011-10-22', 4, 1, NULL),
(26, 32, '136000000026', 'student32@tnhs.edu.ph', 'First26', 'Last26', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(27, 33, '136000000027', 'student33@tnhs.edu.ph', 'First27', 'Last27', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(28, 34, '136000000028', 'student34@tnhs.edu.ph', 'First28', 'Last28', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(29, 35, '136000000029', 'student35@tnhs.edu.ph', 'First29', 'Last29', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(30, 36, '136000000030', 'student36@tnhs.edu.ph', 'First30', 'Last30', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(31, 37, '136000000031', 'student37@tnhs.edu.ph', 'First31', 'Last31', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(32, 38, '136000000032', 'student38@tnhs.edu.ph', 'First32', 'Last32', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(33, 39, '136000000033', 'student39@tnhs.edu.ph', 'First33', 'Last33', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(34, 40, '136000000034', 'student40@tnhs.edu.ph', 'First34', 'Last34', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(35, 41, '136000000035', 'student41@tnhs.edu.ph', 'First35', 'Last35', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(36, 42, '136000000036', 'student42@tnhs.edu.ph', 'First36', 'Last36', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(37, 43, '136000000037', 'student43@tnhs.edu.ph', 'First37', 'Last37', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(38, 44, '136000000038', 'student44@tnhs.edu.ph', 'First38', 'Last38', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(39, 45, '136000000039', 'student45@tnhs.edu.ph', 'First39', 'Last39', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(40, 46, '136000000040', 'student46@tnhs.edu.ph', 'First40', 'Last40', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(41, 47, '136000000041', 'student47@tnhs.edu.ph', 'First41', 'Last41', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(42, 48, '136000000042', 'student48@tnhs.edu.ph', 'First42', 'Last42', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(43, 49, '136000000043', 'student49@tnhs.edu.ph', 'First43', 'Last43', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(44, 50, '136000000044', 'student50@tnhs.edu.ph', 'First44', 'Last44', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(45, 51, '136000000045', 'student51@tnhs.edu.ph', 'First45', 'Last45', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(46, 52, '136000000046', 'student52@tnhs.edu.ph', 'First46', 'Last46', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(47, 53, '136000000047', 'student53@tnhs.edu.ph', 'First47', 'Last47', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(48, 54, '136000000048', 'student54@tnhs.edu.ph', 'First48', 'Last48', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(49, 55, '136000000049', 'student55@tnhs.edu.ph', 'First49', 'Last49', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(50, 56, '136000000050', 'student56@tnhs.edu.ph', 'First50', 'Last50', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(51, 57, '136000000051', 'student57@tnhs.edu.ph', 'First51', 'Last51', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(52, 58, '136000000052', 'student58@tnhs.edu.ph', 'First52', 'Last52', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(53, 59, '136000000053', 'student59@tnhs.edu.ph', 'First53', 'Last53', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(54, 60, '136000000054', 'student60@tnhs.edu.ph', 'First54', 'Last54', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(55, 61, '136000000055', 'student61@tnhs.edu.ph', 'First55', 'Last55', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(56, 62, '136000000056', 'student62@tnhs.edu.ph', 'First56', 'Last56', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(57, 63, '136000000057', 'student63@tnhs.edu.ph', 'First57', 'Last57', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(58, 64, '136000000058', 'student64@tnhs.edu.ph', 'First58', 'Last58', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(59, 65, '136000000059', 'student65@tnhs.edu.ph', 'First59', 'Last59', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(60, 66, '136000000060', 'student66@tnhs.edu.ph', 'First60', 'Last60', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(61, 67, '136000000061', 'student67@tnhs.edu.ph', 'First61', 'Last61', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(62, 68, '136000000062', 'student68@tnhs.edu.ph', 'First62', 'Last62', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(63, 69, '136000000063', 'student69@tnhs.edu.ph', 'First63', 'Last63', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(64, 70, '136000000064', 'student70@tnhs.edu.ph', 'First64', 'Last64', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(65, 71, '136000000065', 'student71@tnhs.edu.ph', 'First65', 'Last65', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(66, 72, '136000000066', 'student72@tnhs.edu.ph', 'First66', 'Last66', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(67, 73, '136000000067', 'student73@tnhs.edu.ph', 'First67', 'Last67', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(68, 74, '136000000068', 'student74@tnhs.edu.ph', 'First68', 'Last68', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(69, 75, '136000000069', 'student75@tnhs.edu.ph', 'First69', 'Last69', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(70, 76, '136000000070', 'student76@tnhs.edu.ph', 'First70', 'Last70', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(71, 77, '136000000071', 'student77@tnhs.edu.ph', 'First71', 'Last71', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(72, 78, '136000000072', 'student78@tnhs.edu.ph', 'First72', 'Last72', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(73, 79, '136000000073', 'student79@tnhs.edu.ph', 'First73', 'Last73', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(74, 80, '136000000074', 'student80@tnhs.edu.ph', 'First74', 'Last74', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(75, 81, '136000000075', 'student81@tnhs.edu.ph', 'First75', 'Last75', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(76, 82, '136000000076', 'student82@tnhs.edu.ph', 'First76', 'Last76', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(77, 83, '136000000077', 'student83@tnhs.edu.ph', 'First77', 'Last77', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(78, 84, '136000000078', 'student84@tnhs.edu.ph', 'First78', 'Last78', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(79, 85, '136000000079', 'student85@tnhs.edu.ph', 'First79', 'Last79', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(80, 86, '136000000080', 'student86@tnhs.edu.ph', 'First80', 'Last80', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(81, 87, '136000000081', 'student87@tnhs.edu.ph', 'First81', 'Last81', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(82, 88, '136000000082', 'student88@tnhs.edu.ph', 'First82', 'Last82', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(83, 89, '136000000083', 'student89@tnhs.edu.ph', 'First83', 'Last83', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(84, 90, '136000000084', 'student90@tnhs.edu.ph', 'First84', 'Last84', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(85, 91, '136000000085', 'student91@tnhs.edu.ph', 'First85', 'Last85', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(86, 92, '136000000086', 'student92@tnhs.edu.ph', 'First86', 'Last86', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(87, 93, '136000000087', 'student93@tnhs.edu.ph', 'First87', 'Last87', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(88, 94, '136000000088', 'student94@tnhs.edu.ph', 'First88', 'Last88', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(89, 95, '136000000089', 'student95@tnhs.edu.ph', 'First89', 'Last89', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(90, 96, '136000000090', 'student96@tnhs.edu.ph', 'First90', 'Last90', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(91, 97, '136000000091', 'student97@tnhs.edu.ph', 'First91', 'Last91', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(92, 98, '136000000092', 'student98@tnhs.edu.ph', 'First92', 'Last92', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(93, 99, '136000000093', 'student99@tnhs.edu.ph', 'First93', 'Last93', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(94, 100, '136000000094', 'student100@tnhs.edu.ph', 'First94', 'Last94', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(95, 101, '136000000095', 'student101@tnhs.edu.ph', 'First95', 'Last95', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(96, 102, '136000000096', 'student102@tnhs.edu.ph', 'First96', 'Last96', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(97, 103, '136000000097', 'student103@tnhs.edu.ph', 'First97', 'Last97', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(98, 104, '136000000098', 'student104@tnhs.edu.ph', 'First98', 'Last98', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL),
(99, 105, '136000000099', 'student105@tnhs.edu.ph', 'First99', 'Last99', NULL, NULL, 'Female', '2011-10-22', NULL, 1, NULL),
(100, 106, '136000000100', 'student106@tnhs.edu.ph', 'First100', 'Last100', NULL, NULL, 'Male', '2011-10-22', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `subject_code` varchar(20) NOT NULL,
  `subject_name` varchar(100) NOT NULL,
  `grade_level_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject_id`, `subject_code`, `subject_name`, `grade_level_id`, `created_at`) VALUES
(1, 'MATH-7', 'Mathematics 7', 1, '2026-10-21 16:04:33'),
(2, 'SCI-7', 'Science 7', 1, '2026-10-21 16:04:33'),
(3, 'ENG-7', 'English 7', 1, '2026-10-21 16:04:33'),
(4, 'FIL-7', 'Filipino 7', 1, '2026-10-21 16:04:33'),
(5, 'MATH-8', 'Mathematics 8', 2, '2026-10-21 16:04:33'),
(6, 'SCI-8', 'Science 8', 2, '2026-10-21 16:04:33'),
(7, 'ENG-8', 'English 8', 2, '2026-10-21 16:04:33'),
(8, 'TLE-8', 'Technology and Livelihood Education 8', 2, '2026-10-21 16:04:33'),
(9, 'MATH-9', 'Mathematics 9', 3, '2026-10-21 16:04:33'),
(10, 'SCI-9', 'Science 9', 3, '2026-10-21 16:04:33'),
(11, 'ENG-9', 'English 9', 3, '2026-10-21 16:04:33'),
(12, 'AP-9', 'Araling Panlipunan 9', 3, '2026-10-21 16:04:33'),
(13, 'MATH-10', 'Mathematics 10', 4, '2026-10-21 16:04:33'),
(14, 'SCI-10', 'Science 10', 4, '2026-10-21 16:04:33'),
(15, 'ENG-10', 'English 10', 4, '2026-10-21 16:04:33'),
(16, 'ESP-10', 'Edukasyon sa Pagpapakatao 10', 4, '2026-10-21 16:04:33'),
(17, 'GEN-MATH', 'General Mathematics', 5, '2026-10-21 16:04:33'),
(18, 'EARTH-SCI', 'Earth and Life Science', 5, '2026-10-21 16:04:33'),
(19, 'BUS-MATH', 'Business Mathematics', 5, '2026-10-21 16:04:33'),
(20, 'PRACT-RES1', 'Practical Research 1', 5, '2026-10-21 16:04:33'),
(21, 'STAT-PROB', 'Statistics and Probability', 6, '2026-10-21 16:04:33'),
(22, 'PHYS-SCI', 'Physical Science', 6, '2026-10-21 16:04:33'),
(23, 'PRACT-RES2', 'Practical Research 2', 6, '2026-10-21 16:04:33'),
(24, 'PE-12', 'Physical Education and Health 12', 6, '2026-10-21 16:04:33');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `teacher_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `extension_name` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`teacher_id`, `user_id`, `first_name`, `last_name`, `extension_name`, `email`, `contact_number`, `specialization`, `deleted_at`) VALUES
(1, 2, 'Teacher', 'One', NULL, 'teacher1@tnhs.edu.ph', '09170000001', 'Math', NULL),
(2, 3, 'Teacher', 'Two', NULL, 'teacher2@tnhs.edu.ph', '09170000002', 'Science', NULL),
(3, 4, 'Teacher', 'Three', NULL, 'teacher3@tnhs.edu.ph', '09170000003', 'English', NULL),
(4, 5, 'Teacher', 'Four', NULL, 'teacher4@tnhs.edu.ph', '09170000004', 'Filipino', NULL),
(5, 6, 'Teacher', 'Five', NULL, 'teacher5@tnhs.edu.ph', '09170000005', 'PE', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `failed_login_attempts` int(11) NOT NULL DEFAULT 0,
  `account_locked` tinyint(1) DEFAULT 0,
  `must_change_password` tinyint(1) NOT NULL DEFAULT 0,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `last_login_ip` varchar(45) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `position_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `role_id`, `username`, `email`, `password_hash`, `failed_login_attempts`, `account_locked`, `must_change_password`, `last_login_at`, `last_login_ip`, `is_active`, `created_at`, `updated_at`, `position_id`) VALUES
(1, 1, 'admin_tnhs', 'admin@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(2, 2, 'teacher_1', 'teacher1@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(3, 2, 'teacher_2', 'teacher2@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(4, 2, 'teacher_3', 'teacher3@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(5, 2, 'teacher_4', 'teacher4@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(6, 2, 'teacher_5', 'teacher5@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(7, 3, 'student_7', 'student7@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(8, 3, 'student_8', 'student8@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(9, 3, 'student_9', 'student9@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(10, 3, 'student_10', 'student10@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(11, 3, 'student_11', 'student11@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(12, 3, 'student_12', 'student12@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(13, 3, 'student_13', 'student13@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(14, 3, 'student_14', 'student14@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(15, 3, 'student_15', 'student15@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(16, 3, 'student_16', 'student16@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(17, 3, 'student_17', 'student17@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(18, 3, 'student_18', 'student18@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(19, 3, 'student_19', 'student19@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(20, 3, 'student_20', 'student20@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(21, 3, 'student_21', 'student21@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(22, 3, 'student_22', 'student22@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(23, 3, 'student_23', 'student23@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(24, 3, 'student_24', 'student24@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(25, 3, 'student_25', 'student25@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(26, 3, 'student_26', 'student26@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(27, 3, 'student_27', 'student27@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(28, 3, 'student_28', 'student28@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(29, 3, 'student_29', 'student29@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(30, 3, 'student_30', 'student30@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(31, 3, 'student_31', 'student31@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(32, 3, 'student_32', 'student32@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(33, 3, 'student_33', 'student33@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(34, 3, 'student_34', 'student34@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(35, 3, 'student_35', 'student35@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(36, 3, 'student_36', 'student36@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(37, 3, 'student_37', 'student37@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(38, 3, 'student_38', 'student38@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(39, 3, 'student_39', 'student39@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(40, 3, 'student_40', 'student40@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(41, 3, 'student_41', 'student41@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(42, 3, 'student_42', 'student42@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(43, 3, 'student_43', 'student43@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(44, 3, 'student_44', 'student44@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(45, 3, 'student_45', 'student45@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(46, 3, 'student_46', 'student46@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(47, 3, 'student_47', 'student47@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(48, 3, 'student_48', 'student48@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(49, 3, 'student_49', 'student49@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(50, 3, 'student_50', 'student50@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(51, 3, 'student_51', 'student51@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(52, 3, 'student_52', 'student52@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(53, 3, 'student_53', 'student53@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(54, 3, 'student_54', 'student54@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(55, 3, 'student_55', 'student55@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(56, 3, 'student_56', 'student56@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(57, 3, 'student_57', 'student57@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(58, 3, 'student_58', 'student58@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(59, 3, 'student_59', 'student59@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(60, 3, 'student_60', 'student60@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(61, 3, 'student_61', 'student61@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(62, 3, 'student_62', 'student62@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(63, 3, 'student_63', 'student63@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(64, 3, 'student_64', 'student64@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(65, 3, 'student_65', 'student65@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(66, 3, 'student_66', 'student66@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(67, 3, 'student_67', 'student67@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(68, 3, 'student_68', 'student68@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(69, 3, 'student_69', 'student69@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(70, 3, 'student_70', 'student70@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(71, 3, 'student_71', 'student71@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(72, 3, 'student_72', 'student72@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(73, 3, 'student_73', 'student73@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(74, 3, 'student_74', 'student74@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(75, 3, 'student_75', 'student75@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(76, 3, 'student_76', 'student76@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(77, 3, 'student_77', 'student77@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(78, 3, 'student_78', 'student78@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(79, 3, 'student_79', 'student79@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(80, 3, 'student_80', 'student80@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(81, 3, 'student_81', 'student81@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(82, 3, 'student_82', 'student82@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(83, 3, 'student_83', 'student83@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(84, 3, 'student_84', 'student84@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(85, 3, 'student_85', 'student85@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(86, 3, 'student_86', 'student86@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(87, 3, 'student_87', 'student87@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(88, 3, 'student_88', 'student88@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(89, 3, 'student_89', 'student89@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(90, 3, 'student_90', 'student90@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(91, 3, 'student_91', 'student91@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(92, 3, 'student_92', 'student92@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(93, 3, 'student_93', 'student93@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(94, 3, 'student_94', 'student94@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(95, 3, 'student_95', 'student95@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(96, 3, 'student_96', 'student96@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(97, 3, 'student_97', 'student97@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(98, 3, 'student_98', 'student98@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(99, 3, 'student_99', 'student99@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(100, 3, 'student_100', 'student100@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(101, 3, 'student_101', 'student101@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(102, 3, 'student_102', 'student102@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(103, 3, 'student_103', 'student103@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(104, 3, 'student_104', 'student104@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(105, 3, 'student_105', 'student105@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(106, 3, 'student_106', 'student106@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-21 17:30:00', '2026-10-21 17:30:00', NULL),
(107, 4, 'staff_1', 'staff1@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-29 04:07:14', '2026-10-29 04:07:14', NULL),
(108, 4, 'staff_2', 'staff2@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-29 04:07:14', '2026-10-29 04:07:14', NULL),
(109, 4, 'staff_3', 'staff3@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-29 04:07:14', '2026-10-29 04:07:14', NULL),
(110, 4, 'staff_4', 'staff4@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-29 04:07:14', '2026-10-29 04:07:14', NULL),
(111, 4, 'staff_5', 'staff5@tnhs.edu.ph', 'hash123', 0, 0, 0, NULL, NULL, 1, '2026-10-29 04:07:14', '2026-10-29 04:07:14', NULL),
(113, 3, 'Marsimle Tapic', 'marsimle@gmail.com', 'hash123', 0, 0, 0, NULL, NULL, 0, '0000-00-00 00:00:00', '2026-10-29 05:18:56', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_years`
--
ALTER TABLE `academic_years`
  ADD PRIMARY KEY (`academic_year_id`),
  ADD UNIQUE KEY `year_label` (`year_label`);

--
-- Indexes for table `admin_profiles`
--
ALTER TABLE `admin_profiles`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`announcement_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD UNIQUE KEY `uq_attendance_student_month` (`student_id`,`month`);

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `chatbot_knowledge_base`
--
ALTER TABLE `chatbot_knowledge_base`
  ADD PRIMARY KEY (`faq_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `educ_stages`
--
ALTER TABLE `educ_stages`
  ADD PRIMARY KEY (`stage_id`),
  ADD UNIQUE KEY `stage_code` (`stage_code`);

--
-- Indexes for table `emergency_contacts`
--
ALTER TABLE `emergency_contacts`
  ADD PRIMARY KEY (`contact_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `enrollment_status`
--
ALTER TABLE `enrollment_status`
  ADD PRIMARY KEY (`status_id`),
  ADD UNIQUE KEY `status_name` (`status_name`);

--
-- Indexes for table `faq_categories`
--
ALTER TABLE `faq_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`grade_id`),
  ADD UNIQUE KEY `uq_grade_student_subject` (`student_id`,`subject_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `grade_levels`
--
ALTER TABLE `grade_levels`
  ADD PRIMARY KEY (`grade_level_id`),
  ADD UNIQUE KEY `grade_level_name` (`grade_level_name`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`permission_id`),
  ADD UNIQUE KEY `permission_name` (`permission_name`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`position_id`),
  ADD UNIQUE KEY `position_title` (`position_title`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `permission_id` (`permission_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`section_id`),
  ADD KEY `grade_level_id` (`grade_level_id`),
  ADD KEY `strand_id` (`strand_id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `academic_year_id` (`academic_year_id`),
  ADD KEY `educ_stage_id` (`educ_stage_id`);

--
-- Indexes for table `staff_profiles`
--
ALTER TABLE `staff_profiles`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `position_id` (`position_id`);

--
-- Indexes for table `strands`
--
ALTER TABLE `strands`
  ADD PRIMARY KEY (`strand_id`),
  ADD UNIQUE KEY `strand_code` (`strand_code`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `lrn` (`lrn`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`),
  ADD UNIQUE KEY `uq_subject_code_grade` (`subject_code`,`grade_level_id`),
  ADD KEY `grade_level_id` (`grade_level_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`teacher_id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `position_id` (`position_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_years`
--
ALTER TABLE `academic_years`
  MODIFY `academic_year_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_profiles`
--
ALTER TABLE `admin_profiles`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `announcement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `chatbot_knowledge_base`
--
ALTER TABLE `chatbot_knowledge_base`
  MODIFY `faq_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `educ_stages`
--
ALTER TABLE `educ_stages`
  MODIFY `stage_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `emergency_contacts`
--
ALTER TABLE `emergency_contacts`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `enrollment_status`
--
ALTER TABLE `enrollment_status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `faq_categories`
--
ALTER TABLE `faq_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `grade_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=255;

--
-- AUTO_INCREMENT for table `grade_levels`
--
ALTER TABLE `grade_levels`
  MODIFY `grade_level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `staff_profiles`
--
ALTER TABLE `staff_profiles`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `strands`
--
ALTER TABLE `strands`
  MODIFY `strand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_profiles`
--
ALTER TABLE `admin_profiles`
  ADD CONSTRAINT `admin_profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `announcements_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `announcements_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD CONSTRAINT `audit_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `chatbot_knowledge_base`
--
ALTER TABLE `chatbot_knowledge_base`
  ADD CONSTRAINT `chatbot_knowledge_base_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `faq_categories` (`category_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chatbot_knowledge_base_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chatbot_knowledge_base_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `emergency_contacts`
--
ALTER TABLE `emergency_contacts`
  ADD CONSTRAINT `emergency_contacts_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `grades_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `grades_ibfk_3` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `grades_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD CONSTRAINT `role_permissions_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_permissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`permission_id`) ON DELETE CASCADE;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_ibfk_1` FOREIGN KEY (`grade_level_id`) REFERENCES `grade_levels` (`grade_level_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sections_ibfk_2` FOREIGN KEY (`strand_id`) REFERENCES `strands` (`strand_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `sections_ibfk_3` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `sections_ibfk_4` FOREIGN KEY (`academic_year_id`) REFERENCES `academic_years` (`academic_year_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `sections_ibfk_5` FOREIGN KEY (`educ_stage_id`) REFERENCES `educ_stages` (`stage_id`) ON DELETE SET NULL;

--
-- Constraints for table `staff_profiles`
--
ALTER TABLE `staff_profiles`
  ADD CONSTRAINT `staff_profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `staff_profiles_ibfk_2` FOREIGN KEY (`position_id`) REFERENCES `positions` (`position_id`) ON DELETE SET NULL;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `students_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `enrollment_status` (`status_id`) ON DELETE SET NULL;

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`grade_level_id`) REFERENCES `grade_levels` (`grade_level_id`) ON DELETE CASCADE;

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`position_id`) REFERENCES `positions` (`position_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
