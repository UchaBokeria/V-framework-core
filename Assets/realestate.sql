-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2021 at 09:30 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `realestate`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `birthdate` datetime DEFAULT NULL,
  `profile_pic` varchar(500) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `username` varchar(500) DEFAULT NULL,
  `passcode` varchar(1500) DEFAULT NULL,
  `token` varchar(700) DEFAULT NULL,
  `email_confirmed` int(11) DEFAULT 0,
  `phone_confirmed` int(11) DEFAULT 0,
  `last_log` datetime DEFAULT NULL,
  `last_ip_address` varchar(255) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `blocked` int(11) DEFAULT 0,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `fullname`, `firstname`, `lastname`, `email`, `phone`, `age`, `gender`, `birthdate`, `profile_pic`, `role_id`, `country_id`, `city_id`, `zip_code`, `username`, `passcode`, `token`, `email_confirmed`, `phone_confirmed`, `last_log`, `last_ip_address`, `status_id`, `created`, `updated`, `blocked`, `actived`) VALUES
(1, 'Administrator', 'admin', 'admin', 'ucha1bokeria@gmail.com', '+995571197490', 20, 1, '2001-03-31 18:13:57', 'https://thumbs.dreamstime.com/b/businessman-icon-vector-male-avatar-profile-image-profile-businessman-icon-vector-male-avatar-profile-image-182095609.jpg', 1, NULL, NULL, '0190', 'admin', '', '123', 1, 1, NULL, NULL, 0, '2021-09-24 18:15:15', NULL, 0, 1);

--
-- Triggers `accounts`
--
DELIMITER $$
CREATE TRIGGER `send_count_in_role_del` BEFORE DELETE ON `accounts` FOR EACH ROW BEGIN
		UPDATE roles SET
					 roles.members = roles.members - 1
		 WHERE roles.id  = OLD.role_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `send_count_in_role_upd` AFTER UPDATE ON `accounts` FOR EACH ROW BEGIN
	IF(NEW.status_id != OLD.status_id) THEN
		UPDATE roles SET
					 roles.members = roles.members + 1
		 WHERE roles.id  = NEW.role_id;
	END IF;
	
	IF(NEW.actived = 1) THEN
		UPDATE roles SET
					 roles.members = roles.members + 1
		 WHERE roles.id  = NEW.role_id;
	END IF;
	
	IF(NEW.actived = 0) THEN
		UPDATE roles SET
					 roles.members = roles.members - 1
		 WHERE roles.id  = NEW.role_id;
	END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `send_count_in_roles` AFTER INSERT ON `accounts` FOR EACH ROW BEGIN 
	UPDATE roles SET
				 roles.members = roles.members + 1
	 WHERE roles.id  = NEW.role_id;
	
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `automator_attributes`
--

CREATE TABLE `automator_attributes` (
  `id` int(11) NOT NULL,
  `automator_el_id` int(11) DEFAULT NULL,
  `attrkey` varchar(255) DEFAULT NULL,
  `attrvalue` varchar(1500) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `automator_attributes`
--

INSERT INTO `automator_attributes` (`id`, `automator_el_id`, `attrkey`, `attrvalue`, `created`, `updated`, `actived`) VALUES
(1, 1, 'data-id', '12', '2021-10-14 16:41:30', NULL, 1),
(2, 2, 'data-type', '21', '2021-10-14 16:41:30', NULL, 1),
(3, 2, 'data-lang', '13', '2021-10-14 16:41:30', NULL, 1),
(4, 3, 'data-pow', '14', '2021-10-14 16:41:30', NULL, 1),
(5, 4, 'data-id', '15', '2021-10-14 16:41:30', NULL, 1),
(6, 5, 'data-type-in', '16', '2021-10-14 16:41:30', NULL, 1),
(7, 6, 'data-lang', '17', '2021-10-14 16:41:30', NULL, 1),
(8, 6, 'data-pow', '18', '2021-10-14 16:41:30', NULL, 1),
(9, 4, 'data-pow', '19', '2021-10-14 16:41:30', NULL, 1),
(10, 7, 'data-lo', '54', NULL, NULL, 1),
(11, 8, 'd', '2', NULL, NULL, 1),
(12, 9, 'central', '1', NULL, NULL, 1),
(13, 10, 'type', 'checkbox', NULL, NULL, 1),
(14, 11, 'Vtext', 'CENTRAL_HEATING', NULL, NULL, 1),
(15, 12, 'parent-block', 'true', NULL, NULL, 1),
(16, 13, 'type', 'checkbox', NULL, NULL, 1),
(17, 14, 'Vtext', 'AIR_CONDITIONING', NULL, NULL, 1),
(18, 15, 'filter-natural-gas-title', 'filter-natural-gas-title', NULL, NULL, 1),
(19, 16, 'type', 'checkbox', NULL, NULL, 1),
(20, 17, 'Vtext', 'NATURAL_GAS', NULL, NULL, 1),
(21, 18, 'parent-block', 'true', NULL, NULL, 1),
(22, 19, 'filter-price-title-block', 'true', NULL, NULL, 1),
(23, 20, 'filter-price-input-block', 'true', NULL, NULL, 1),
(24, 21, 'Vtext', 'PRICE', NULL, NULL, 1),
(25, 22, 'filter-price-toggle', 'true', NULL, NULL, 1),
(26, 23, 'filter-price-from', 'true', NULL, NULL, 1),
(27, 24, 'filter-price-to', 'true', NULL, NULL, 1),
(31, 25, 'filter-area-title-block', 'true', NULL, NULL, 1),
(32, 26, 'filter-area-input-block', 'true', NULL, NULL, 1),
(33, 27, 'Vtext', 'AREA', NULL, NULL, 1),
(34, 28, 'filter-area-toggle', 'true', NULL, NULL, 1),
(35, 29, 'filter-area-from', 'true', NULL, NULL, 1),
(36, 30, 'filter-area-to', 'true', NULL, NULL, 1),
(37, 31, 'filter-floor-title-block', 'true', NULL, NULL, 1),
(38, 32, 'filter-floor-input-block', 'true', NULL, NULL, 1),
(39, 33, 'Vtext', 'AREA', NULL, NULL, 1),
(40, 34, 'filter-floor-toggle', 'true', NULL, NULL, 1),
(41, 35, 'filter-floor-from', 'true', NULL, NULL, 1),
(42, 36, 'filter-floor-to', 'true', NULL, NULL, 1),
(43, 37, 'filter-rooms-block', 'true', NULL, NULL, 1),
(44, 38, 'Vtext', 'ROOMS', NULL, NULL, 1),
(45, 39, 'filter-rooms-toggle', 'true', NULL, NULL, 1),
(46, 40, 'filter-rooms-input', 'true', NULL, NULL, 1),
(47, 41, 'onlywithphoto', 'true', NULL, NULL, 1),
(48, 42, 'type', 'checkbox', NULL, NULL, 1),
(49, 43, 'Vtext', 'ONLYWITHPHOTO', NULL, NULL, 1),
(50, 44, 'onlyvips', 'true', NULL, NULL, 1),
(51, 45, 'type', 'checkbox', NULL, NULL, 1),
(52, 46, 'Vtext', 'ONLYVIPS', NULL, NULL, 1),
(53, 47, 'onlySvips', 'true', NULL, NULL, 1),
(54, 48, 'type', 'checkbox', NULL, NULL, 1),
(55, 49, 'Vtext', 'ONLYSVIPS', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `automator_classes`
--

CREATE TABLE `automator_classes` (
  `id` int(11) NOT NULL,
  `automator_el_id` int(11) DEFAULT NULL,
  `classname` varchar(255) DEFAULT NULL,
  `path` varchar(500) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `automator_classes`
--

INSERT INTO `automator_classes` (`id`, `automator_el_id`, `classname`, `path`, `created`, `updated`, `actived`) VALUES
(1, 1, 'filter-category', NULL, '2021-10-14 16:38:05', NULL, 0),
(2, 2, 'filter-category-option', NULL, '2021-10-14 16:38:05', NULL, 0),
(3, 2, 'filter-category-option', NULL, '2021-10-14 16:38:05', NULL, 0),
(4, 3, 'filter-price', NULL, '2021-10-14 16:38:05', NULL, 0),
(5, 4, 'filter-price-from', NULL, '2021-10-14 16:38:05', NULL, 0),
(6, 5, 'filter-price-to', NULL, '2021-10-14 16:38:05', NULL, 0),
(7, 6, 'filter-price-range', NULL, '2021-10-14 16:38:05', NULL, 0),
(8, 6, 'filter-addon', NULL, '2021-10-14 16:38:05', NULL, 0),
(9, 7, 'filter-alt', NULL, '2021-10-14 16:38:05', NULL, 0),
(10, 8, 'filter-category', NULL, '2021-10-14 16:38:05', NULL, 1),
(11, 9, 'filter-checkbox-container', NULL, NULL, NULL, 1),
(12, 10, 'filter-checkbox', NULL, NULL, NULL, 1),
(13, 11, 'filter-heating-title', NULL, NULL, NULL, 1),
(14, 12, 'filter-checkbox-container', NULL, NULL, NULL, 1),
(15, 13, 'filter-air-conditioning-checkbox', NULL, NULL, NULL, 1),
(16, 14, 'filter-air-conditioning-title', NULL, NULL, NULL, 1),
(17, 15, 'filter-checkbox-container', NULL, NULL, NULL, 1),
(18, 16, 'filter-natural-gas-checkbox', NULL, NULL, NULL, 1),
(19, 17, 'filter-natural-gas-title', NULL, NULL, NULL, 1),
(20, 18, 'filter-container', NULL, NULL, NULL, 1),
(21, 19, 'filter-price-title-container', NULL, NULL, NULL, 1),
(22, 20, 'filter-price-input-container', NULL, NULL, NULL, 1),
(23, 21, 'filter-price-title', NULL, NULL, NULL, 1),
(24, 22, 'filter-price-toggle', NULL, NULL, NULL, 1),
(25, 23, 'filter-price-from', NULL, NULL, NULL, 1),
(26, 24, 'filter-price-to', NULL, NULL, NULL, 1),
(27, 25, 'filter-area-title-container', NULL, NULL, NULL, 1),
(28, 26, 'filter-area-input-container', NULL, NULL, NULL, 1),
(29, 27, 'filter-area-title', NULL, NULL, NULL, 1),
(30, 28, 'filter-area-toggle', NULL, NULL, NULL, 1),
(31, 29, 'filter-area-from', NULL, NULL, NULL, 1),
(32, 30, 'filter-area-to', NULL, NULL, NULL, 1),
(33, 31, 'filter-floor-title-container', NULL, NULL, NULL, 1),
(34, 32, 'filter-floor-input-container', NULL, NULL, NULL, 1),
(35, 33, 'filter-floor-title', NULL, NULL, NULL, 1),
(36, 34, 'filter-floor-toggle', NULL, NULL, NULL, 1),
(37, 35, 'filter-floor-from', NULL, NULL, NULL, 1),
(38, 36, 'filter-floor-to', NULL, NULL, NULL, 1),
(39, 37, 'filter-rooms-title-container', NULL, NULL, NULL, 1),
(40, 38, 'filter-rooms-title', NULL, NULL, NULL, 1),
(41, 39, 'filter-rooms-toggle', NULL, NULL, NULL, 1),
(42, 40, 'filter-rooms-input', NULL, NULL, NULL, 1),
(43, 41, 'filter-checkbox-container', NULL, NULL, NULL, 1),
(44, 42, 'filter-checkbox', NULL, NULL, NULL, 1),
(45, 43, 'filter-onlywithphoto-title', NULL, NULL, NULL, 1),
(46, 44, 'filter-checkbox-container', NULL, NULL, NULL, 1),
(47, 45, 'filter-checkbox', NULL, NULL, NULL, 1),
(48, 46, 'filter-onlyvips-title', NULL, NULL, NULL, 1),
(49, 47, 'filter-checkbox-container', NULL, NULL, NULL, 1),
(50, 48, 'filter-checkbox', NULL, NULL, NULL, 1),
(51, 49, 'filter-onlySvips-title', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `automator_data`
--

CREATE TABLE `automator_data` (
  `id` int(11) NOT NULL,
  `automator_el_id` int(11) DEFAULT NULL,
  `datakey` varchar(255) DEFAULT NULL,
  `datavalue` varchar(1500) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `automator_data`
--

INSERT INTO `automator_data` (`id`, `automator_el_id`, `datakey`, `datavalue`, `method`, `url`, `created`, `updated`, `actived`) VALUES
(1, 1, 'route', '12', NULL, NULL, '2021-10-14 16:45:43', NULL, 0),
(2, 2, 'act', '13', NULL, NULL, '2021-10-14 16:45:43', NULL, 0),
(3, 3, 'id', '14', NULL, NULL, '2021-10-14 16:45:43', NULL, 0),
(4, 4, 'pow', '15', NULL, NULL, '2021-10-14 16:45:43', NULL, 0),
(5, 5, 'pow', '16', NULL, NULL, '2021-10-14 16:45:43', NULL, 0),
(6, 6, 'pow', '17', NULL, NULL, '2021-10-14 16:45:43', NULL, 0),
(7, 7, 'id', '18', NULL, NULL, '2021-10-14 16:45:43', NULL, 0),
(8, 1, 'act', '19', NULL, NULL, '2021-10-14 16:45:43', NULL, 0),
(9, 2, 'route', '10', NULL, NULL, '2021-10-14 16:45:43', NULL, 0),
(10, 3, 'route', '11', NULL, NULL, '2021-10-14 16:45:43', NULL, 0),
(11, 4, 'act', '12', NULL, NULL, '2021-10-14 16:45:43', NULL, 0),
(12, 6, 'id', '13', NULL, NULL, '2021-10-14 16:45:43', NULL, 0),
(13, 7, 'pow', '14', NULL, NULL, '2021-10-14 16:45:43', NULL, 0),
(14, 1, 'pow', '16', NULL, NULL, '2021-10-14 16:45:43', NULL, 0),
(15, 3, 'pow', '17', NULL, NULL, '2021-10-14 16:45:43', NULL, 0),
(16, 5, 'id', '19', NULL, NULL, '2021-10-14 16:45:43', NULL, 0),
(17, 7, 'act', '11', NULL, NULL, '2021-10-14 16:45:43', NULL, 0),
(18, 5, 'route', '12', NULL, NULL, '2021-10-14 16:45:43', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `automator_elements`
--

CREATE TABLE `automator_elements` (
  `id` int(11) NOT NULL,
  `el` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `section` int(11) DEFAULT NULL,
  `view` int(11) DEFAULT NULL,
  `el_id` varchar(255) DEFAULT NULL,
  `changable` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `automator_elements`
--

INSERT INTO `automator_elements` (`id`, `el`, `parent`, `section`, `view`, `el_id`, `changable`, `created`, `updated`, `user_id`, `actived`) VALUES
(1, 'select', 0, 1, 1, '', 0, '2021-10-14 14:47:52', '2021-10-14 14:47:52', 1, 0),
(2, 'option', 1, 1, 1, '', 0, '2021-10-14 14:47:52', '2021-10-14 14:47:52', 1, 0),
(3, 'option', 1, 2, 1, '', 0, '2021-10-14 14:47:52', '2021-10-14 14:47:52', 1, 0),
(4, 'input', 0, 2, 1, '', 0, '2021-10-14 14:47:52', '2021-10-14 14:47:52', 1, 0),
(5, 'input', 7, 1, 1, '', 0, '2021-10-14 14:47:52', '2021-10-14 14:47:52', 1, 0),
(6, 'input', 7, 2, 1, '', 0, '2021-10-14 14:47:52', '2021-10-14 14:47:52', 1, 0),
(7, 'div', 0, 2, 1, '', 0, '2021-10-14 14:47:52', '2021-10-14 14:47:52', 1, 0),
(8, 'div', 0, 1, 1, 'filter-category', 0, '2021-10-24 14:37:05', '2021-10-24 14:37:08', 1, 1),
(9, 'div', 0, 2, 1, 'filter-central-block', 0, NULL, NULL, 1, 1),
(10, 'input', 9, 1, 1, 'filter-heating-checkbox', 0, NULL, NULL, 1, 1),
(11, 'p', 9, 2, 1, 'filter-heating-title', 0, NULL, NULL, 1, 1),
(12, 'div', 0, 3, 1, 'filter-air-conditioning-block', 0, NULL, NULL, 1, 1),
(13, 'input', 12, 1, 1, 'filter-air-conditioning-checkbox', 0, NULL, NULL, 1, 1),
(14, 'p', 12, 2, 1, 'filter-air-title', 0, NULL, NULL, 1, 1),
(15, 'div', 0, 4, 1, 'filter-natural-gas', 0, NULL, NULL, 1, 1),
(16, 'input', 15, 1, 1, 'filter-natural-gas-checkbox', 0, NULL, NULL, 1, 1),
(17, 'p', 15, 2, 1, 'filter-natural-gas-title', 0, NULL, NULL, 1, 1),
(18, 'div', 0, 5, 1, 'filter-price-block', 0, NULL, NULL, 1, 0),
(19, 'div', 0, 5, 1, 'filter-price-label', 0, NULL, NULL, 1, 1),
(20, 'div', 0, 6, 1, 'filter-price-inputs', 0, NULL, NULL, 1, 1),
(21, 'p', 19, 1, 1, 'filter-price-title', 0, NULL, NULL, 1, 1),
(22, 'span', 19, 2, 1, 'filter-price-toggle', 0, NULL, NULL, 1, 1),
(23, 'input', 20, 1, 1, 'filter-price-from', 0, NULL, NULL, 1, 1),
(24, 'input', 20, 2, 1, 'filter-price-to', 0, NULL, NULL, 1, 1),
(25, 'div', 0, 7, 1, 'filter-area-label', 0, NULL, NULL, 1, 1),
(26, 'div', 0, 8, 1, 'filter-area-inputs', 0, NULL, NULL, 1, 1),
(27, 'p', 25, 1, 1, 'filter-area-title', 0, NULL, NULL, 1, 1),
(28, 'span', 25, 2, 1, 'filter-area-toggle', 0, NULL, NULL, 1, 1),
(29, 'input', 26, 1, 1, 'filter-area-from', 0, NULL, NULL, 1, 1),
(30, 'input', 26, 2, 1, 'filter-area-to', 0, NULL, NULL, 1, 1),
(31, 'div', 0, 9, 1, 'filter-floor-label', 0, NULL, NULL, 1, 1),
(32, 'div', 0, 10, 1, 'filter-floor-inputs', 0, NULL, NULL, 1, 1),
(33, 'p', 31, 1, 1, 'filter-floor-title', 0, NULL, NULL, 1, 1),
(34, 'span', 31, 2, 1, 'filter-floor-toggle', 0, NULL, NULL, 1, 1),
(35, 'input', 32, 1, 1, 'filter-floor-from', 0, NULL, NULL, 1, 1),
(36, 'input', 32, 2, 1, 'filter-floor-to', 0, NULL, NULL, 1, 1),
(37, 'div', 0, 11, 1, 'filter-rooms-block', 0, NULL, NULL, NULL, 1),
(38, 'p', 37, 1, 1, 'filter-rooms-title', 0, NULL, NULL, NULL, 1),
(39, 'i', 37, 2, 1, 'filter-rooms-toggle', 0, NULL, NULL, NULL, 1),
(40, 'input', 0, 12, 1, 'filter-rooms-input', 0, NULL, NULL, NULL, 1),
(41, 'div', 0, 13, 1, 'filter-onlywithphoto-block', 0, '2021-10-24 14:37:05', '2021-10-24 14:37:08', 1, 1),
(42, 'input', 41, 1, 1, 'filter-onlywithphoto-checkbox', 0, NULL, NULL, 1, 1),
(43, 'p', 41, 2, 1, 'filter-onlywithphoto-title', 0, NULL, NULL, 1, 1),
(44, 'div', 0, 14, 1, 'filter-onlyvips-block', NULL, NULL, NULL, NULL, 1),
(45, 'input', 44, 1, 1, 'filter-onlyvips-checkbox', NULL, NULL, NULL, NULL, 1),
(46, 'p', 44, 2, 1, 'filter-onlyvips-title', NULL, NULL, NULL, NULL, 1),
(47, 'div', 0, 15, 1, 'filter-onlySvips-block', NULL, NULL, NULL, NULL, 1),
(48, 'input', 47, 1, 1, 'filter-onlySvips-checkbox', NULL, NULL, NULL, NULL, 1),
(49, 'p', 48, 2, 1, 'filter-onlySvips-title', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `automator_onchange`
--

CREATE TABLE `automator_onchange` (
  `id` int(11) NOT NULL,
  `automator_el_id` int(11) DEFAULT NULL,
  `change_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `automator_onchange`
--

INSERT INTO `automator_onchange` (`id`, `automator_el_id`, `change_id`, `created`, `updated`, `actived`) VALUES
(1, 4, 7, '2021-10-14 16:46:35', NULL, 1),
(2, 7, 4, '2021-10-17 14:29:13', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `declarations`
--

CREATE TABLE `declarations` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `controller_user_id` int(11) DEFAULT NULL,
  `seen` int(11) DEFAULT NULL,
  `dir` varchar(1500) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Triggers `declarations`
--
DELIMITER $$
CREATE TRIGGER `send_post_status` AFTER UPDATE ON `declarations` FOR EACH ROW BEGIN
	UPDATE posts SET
				 posts.status_id = NEW.status_id 
	 WHERE posts.id = NEW.post_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `estate_types`
--

CREATE TABLE `estate_types` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `posts` int(11) DEFAULT 0,
  `icon_dir` varchar(500) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `estate_types`
--

INSERT INTO `estate_types` (`id`, `title`, `parent`, `posts`, `icon_dir`, `created`, `updated`, `actived`) VALUES
(1, 'category 1', 0, 0, NULL, '2021-10-10 15:30:35', NULL, 1),
(2, ' category  2', 0, 0, NULL, '2021-10-10 15:30:35', NULL, 1),
(3, ' category  3', 0, 0, NULL, '2021-10-10 15:30:35', NULL, 1),
(4, ' category  4', 0, 0, NULL, '2021-10-10 15:30:35', NULL, 1),
(5, 'sub-cat 1', 1, 0, NULL, '2021-10-10 15:30:35', NULL, 1),
(6, 'sub-cat 2', 1, 0, NULL, '2021-10-10 15:30:35', NULL, 1),
(7, 'sub-cat 3', 1, 0, NULL, '2021-10-10 15:30:35', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `help`
--

CREATE TABLE `help` (
  `id` int(11) NOT NULL,
  `question` varchar(1000) DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `help`
--

INSERT INTO `help` (`id`, `question`, `answer`, `user_id`, `created`, `updated`, `actived`) VALUES
(1, 'How to upload a post', 'just do it', NULL, '2021-09-24 18:28:52', NULL, 1),
(2, 'How to draw?', 'idk', NULL, '2021-09-25 02:45:31', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `title`, `created`, `updated`, `actived`) VALUES
(1, 'Geo', '2021-09-24 18:32:41', NULL, 1),
(2, 'Eng', '2021-09-24 18:32:41', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `media_extensions`
--

CREATE TABLE `media_extensions` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `permissionLVL` int(11) DEFAULT NULL,
  `description` varchar(1500) DEFAULT NULL,
  `file_name` varchar(500) DEFAULT NULL,
  `path` varchar(500) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(1500) DEFAULT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `vip_status_id` int(11) DEFAULT NULL,
  `location` varchar(1500) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `declaration_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `description`, `thumbnail_id`, `user_id`, `status_id`, `price`, `type_id`, `vip_status_id`, `location`, `country_id`, `city_id`, `declaration_id`, `created`, `updated`, `actived`) VALUES
(1, 'Apartment in wkneti', 'Lorem ipsum dolor sit amet,', 1, 1, 1, '1.00', NULL, 1, NULL, NULL, NULL, NULL, '2021-10-10 14:29:12', NULL, 1),
(2, 'Apartment In isani', 'consectetur adipiscing elit ut aliquam', 1, 1, 1, '1.00', NULL, 1, '', NULL, NULL, NULL, '2021-10-10 14:29:12', NULL, 1),
(3, 'Apartment in varketili', 'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit ut aliquam', 1, 1, 1, '1.00', NULL, 1, NULL, NULL, NULL, NULL, '2021-10-10 14:29:12', NULL, 1),
(4, 'apartment in gori', 'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit ut aliquam', 1, 1, 1, '1.00', NULL, 1, NULL, NULL, NULL, NULL, '2021-10-10 14:29:12', NULL, 1),
(5, 'Apartment in vake', 'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit ut aliquam', 1, 1, 1, '1.00', NULL, 1, NULL, NULL, NULL, NULL, '2021-10-10 14:29:12', NULL, 1),
(6, 'apartment in saburtalo', 'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit ut aliquam', 1, 1, 1, '1.00', NULL, 1, NULL, NULL, NULL, NULL, '2021-10-10 14:29:12', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `post_details`
--

CREATE TABLE `post_details` (
  `id` int(11) NOT NULL,
  `value` varchar(1000) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `post_setting_id` int(11) DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post_details`
--

INSERT INTO `post_details` (`id`, `value`, `post_id`, `post_setting_id`, `actived`) VALUES
(1, '121', 1, 1, 1),
(2, '13', 1, 2, 1),
(3, '141', 1, 3, 1),
(4, '123', 1, 4, 1),
(5, '156', 1, 12, 1),
(6, '513', 2, 1, 1),
(7, '514', 2, 2, 1),
(8, '515', 2, 3123, 1),
(9, '516', 2, 4, 1),
(10, '517', 2, 5, 1),
(11, NULL, NULL, 0, 1),
(12, '6.394365133153615', 3, 1, 1),
(13, '8.347665921177404', 3, 2, 1),
(14, '3.5552344830289804', 3, 3, 1),
(15, '9.733174928215496', 3, 4, 1),
(16, '1.0001714685933398', 3, 5, 1),
(17, '1.8013328349230187', 4, 1, 1),
(18, '5.006150045437878', 4, 2, 1),
(19, '9.62675199902314', 4, 3, 1),
(20, '5.115310135404868', 4, 4, 1),
(21, '4.696294956557727', 4, 5, 1),
(22, '7.135544653176837', 5, 1, 1),
(23, '2.588838672813809', 5, 2, 1),
(24, '8.537559681141339', 5, 3, 1),
(25, '6.921282663868071', 5, 4, 1),
(26, '7.9937345525191486', 5, 5, 1),
(27, '9.204825047594332', 6, 1, 1),
(28, '3.04292185701702', 6, 2, 1),
(29, '4.600134418904906', 6, 3, 1),
(30, '3.8719068000762786', 6, 4, 1),
(31, '4.559131020269479', 6, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `post_media`
--

CREATE TABLE `post_media` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dir` varchar(1500) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `extension_id` int(11) DEFAULT NULL,
  `compressed` int(11) DEFAULT NULL,
  `size` double DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post_media`
--

INSERT INTO `post_media` (`id`, `title`, `dir`, `type_id`, `extension_id`, `compressed`, `size`, `user_id`, `post_id`, `created`, `updated`, `actived`) VALUES
(1, 'home', 'home.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `post_media_types`
--

CREATE TABLE `post_media_types` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `post_settings`
--

CREATE TABLE `post_settings` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `icon_dir` varchar(1500) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `default` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post_settings`
--

INSERT INTO `post_settings` (`id`, `title`, `icon_dir`, `priority`, `default`, `user_id`, `created`, `updated`, `actived`) VALUES
(1, 'price', NULL, 1, 1, 1, '2021-10-09 18:45:29', '0000-00-00 00:00:00', 1),
(2, 'space', NULL, 1, 1, 1, '2021-10-09 18:45:29', '0000-00-00 00:00:00', 1),
(3, 'floor', NULL, 1, 1, 1, '2021-10-09 18:45:29', '0000-00-00 00:00:00', 1),
(4, 'bedrooms', NULL, 1, 1, 1, '2021-10-09 18:45:29', '0000-00-00 00:00:00', 1),
(5, 'rooms', NULL, 1, 1, 1, '2021-10-09 18:45:29', '0000-00-00 00:00:00', 1),
(6, NULL, NULL, 1, 1, 1, '2021-10-09 18:45:29', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `post_status`
--

CREATE TABLE `post_status` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `permissionLVL` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post_status`
--

INSERT INTO `post_status` (`id`, `title`, `user_id`, `permissionLVL`, `created`, `updated`, `actived`) VALUES
(1, 'Approved', 1, 1, '2021-10-09 18:44:49', NULL, 1),
(2, 'Not Approved', 1, 1, '2021-10-09 18:44:49', NULL, 1),
(3, 'Pendding', 1, 1, '2021-10-09 18:44:49', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `permissionLVL` int(11) DEFAULT NULL,
  `members` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `title`, `permissionLVL`, `members`, `user_id`, `created`, `updated`, `actived`) VALUES
(1, 'admin', 999, 2, 1, '2021-09-24 18:17:43', '2021-09-25 01:48:21', 1),
(2, 'clientUser', 1, 1, 1, '2021-09-24 18:17:43', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `translate`
--

CREATE TABLE `translate` (
  `id` int(11) NOT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT 0,
  `lang_key` varchar(255) DEFAULT NULL,
  `lang_value` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `translate`
--

INSERT INTO `translate` (`id`, `lang_id`, `page_id`, `lang_key`, `lang_value`, `user_id`, `created`, `updated`, `actived`) VALUES
(2, 1, 1, 'HOME', 'მთავარი', 1, '2021-09-24 18:37:38', NULL, 1),
(3, 1, 1, 'PRODUCT', 'ქონება', 1, '2021-09-24 18:37:38', NULL, 1),
(4, 1, 1, 'HELP', 'დახმარება', 1, '2021-09-24 18:37:38', NULL, 1),
(5, 1, 1, 'SEARCH_CATEGORY', 'კატეგორია', 1, '2021-09-24 18:37:38', NULL, 1),
(6, 1, 1, 'SEARCH_LOCATION', 'ლოკაცია', 1, '2021-09-24 18:37:38', NULL, 1),
(7, 1, 1, 'SEARCH_PLACEHOLDER', 'ძებნა', 1, '2021-09-24 18:37:38', NULL, 1),
(8, 1, 1, 'SUPER_VIPS_TITLE', 'სუპერ ვიპ განცხადებები', 1, '2021-09-24 18:37:38', NULL, 1),
(9, 1, 1, 'VIPS_TITLE', 'ვიპ განცხადებები', 1, '2021-09-24 18:37:38', NULL, 1),
(10, 1, 1, 'POUPLAR_TITLE', 'პოპულალური განცხადებები', 1, '2021-09-24 18:37:38', NULL, 1),
(11, 1, 1, 'SEE_MORE', 'ნახე მეტი', 1, '2021-09-24 18:37:38', NULL, 1),
(12, 1, 1, 'FOOTER_TEXT', '2021 Real Estate. All Rights Reserved.', 1, '2021-09-24 18:37:38', NULL, 1),
(13, 1, 2, 'FILTER_TITLE', 'ვეძებ', 1, '2021-09-24 18:37:38', NULL, 1),
(14, 1, 2, 'SORT_BY', 'დახარისხება', 1, '2021-09-24 18:37:38', NULL, 1),
(15, 1, 2, 'PRINT', 'დაპრინტვა', 1, '2021-09-24 18:37:38', NULL, 1),
(16, 1, 2, 'SHARE', 'გაზიარება', 1, '2021-09-24 18:37:38', NULL, 1),
(17, 1, 3, 'MAIL', 'ელ. ფოსტა', 1, '2021-09-24 18:37:38', NULL, 1),
(18, 1, 3, 'PASSWORD', 'პაროლი', 1, '2021-09-24 18:37:38', NULL, 1),
(19, 1, 3, 'FORGOT_PASSWORD', 'დაგავიწყდა პაროლი', 1, '2021-09-24 18:37:38', NULL, 1),
(20, 1, 3, 'DONT_HAVE_ACC', 'ჯერ არ დარეგისტრირებულხარ? შექმენი ახლა', 1, '2021-09-24 18:37:38', NULL, 1),
(21, 1, 3, 'SIGN_IN', 'შესვლა', 1, '2021-09-24 18:37:38', NULL, 1),
(22, 1, 3, 'ALREADY_HAVE_ACC', 'ხარ უკვე დარეგისტრირებული', 1, '2021-09-24 18:37:38', NULL, 1),
(23, 1, 3, 'SEND_CODE', 'კოდის გაგზავნა', 1, '2021-09-24 18:37:38', NULL, 1),
(24, 1, 3, 'SIGN_UP', 'დარეგისტრირება', 1, '2021-09-24 18:37:38', NULL, 1),
(25, 1, 3, 'PHONE_NUMBER', 'ნომერი', 1, '2021-09-24 18:37:38', NULL, 1),
(26, 1, 3, 'COUNTRY', 'ქვეყანა', 1, '2021-09-24 18:37:38', NULL, 1),
(27, 1, 3, 'CITY', 'ქალაქი', 1, '2021-09-24 18:37:38', NULL, 1),
(28, 1, 3, 'BIRTHDAY', 'დაბადების თარიღი', 1, '2021-09-24 18:37:38', NULL, 1),
(29, 1, 3, 'GENDER', 'სქესი', 1, '2021-09-24 18:37:38', NULL, 1),
(30, 1, 3, 'CONFIRM', 'დადასტურება', 1, '2021-09-24 18:37:38', NULL, 1),
(31, 1, 3, 'FULLNAME', 'სრული სახელი', 1, '2021-09-24 18:37:38', NULL, 1),
(32, 1, 3, 'RESET_PASSWORD', 'პაროლის აღდგენა', 1, '2021-09-24 18:37:38', NULL, 1),
(33, 1, 3, 'RESET_PLACEHOLDER', 'შეიყვანე შენი მეილი', 1, '2021-09-24 18:37:38', NULL, 1),
(34, 1, 3, 'WE_SENT_LINK', 'აღსადგენი ლინკი გაგზავნილია თქვენ მეილზე', 1, '2021-09-24 18:37:38', NULL, 1),
(35, 1, 3, 'SEND', 'გაგზავნა', 1, '2021-09-24 18:37:38', NULL, 1),
(36, 1, 4, 'LOGOUT', 'გამოსვლა', 1, '2021-09-24 18:37:38', NULL, 1),
(37, 1, 4, 'DASHBOARD', 'დეშბორდი', 1, '2021-09-24 18:37:38', NULL, 1),
(38, 1, 4, 'BOOKMARKS', 'შენახულები', 1, '2021-09-24 18:37:38', NULL, 1),
(39, 1, 4, 'ANALYTICS', 'ანალიზი', 1, '2021-09-24 18:37:38', NULL, 1),
(40, 1, 4, 'PROFILE', 'პროფილი', 1, '2021-09-24 18:37:38', NULL, 1),
(41, 1, 4, 'CREATE', 'ახლის შექმნა', 1, '2021-09-24 18:37:38', NULL, 1),
(42, 1, 4, 'APPROVED', 'დადასტურებული', 1, '2021-09-24 18:37:38', NULL, 1),
(43, 1, 4, 'NOT_APPROVED', 'არ დადასტურებული', 1, '2021-09-24 18:37:38', NULL, 1),
(44, 1, 4, 'PENDING', 'ლოდინის პროცესშია', 1, '2021-09-24 18:37:38', NULL, 1),
(45, 1, 4, 'SEE_REPORT', 'ნახე რეპორტი', 1, '2021-09-24 18:37:38', NULL, 1),
(46, 1, 4, 'POSTS', 'პოსტები', 1, '2021-09-24 18:37:38', NULL, 1),
(47, 1, 4, 'SAVED', 'შენახულები', 1, '2021-09-24 18:37:38', NULL, 1),
(48, 1, 4, 'SOLD', 'გაყიდული', 1, '2021-09-24 18:37:38', NULL, 1),
(49, 1, 4, 'BROUGHT', 'ნაყიდი', 1, '2021-09-24 18:37:38', NULL, 1),
(50, 1, 4, 'RATE', 'შეფასება', 1, '2021-09-24 18:37:38', NULL, 1),
(51, 1, 4, 'SAVE', 'შენახვა', 1, '2021-09-24 18:37:38', NULL, 1),
(52, 1, 4, 'CANCEL', 'გაუქმება', 1, '2021-09-24 18:37:38', NULL, 1),
(53, 1, 4, 'DESCLARATION_UPLOAD', 'ატვირთე ამონაწერი', 1, '2021-09-24 18:37:38', NULL, 1),
(54, 1, 4, 'SVIPS', 'სუპერ ვიაიპი', 1, '2021-09-24 18:37:38', NULL, 1),
(55, 1, 4, 'VIPS', 'ვიაიპი', 1, '2021-09-24 18:37:38', NULL, 1),
(56, 1, 4, 'UPDATE', 'განახლება', 1, '2021-09-24 18:37:38', NULL, 1),
(57, 1, 4, 'GO_TO_LOGIN', 'შესვლა', 1, '2021-09-24 18:37:38', NULL, 1),
(58, 1, 3, 'HELP_TITLE', 'ხშირად დასმული შეკითხვები', 1, '2021-10-17 23:36:50', NULL, 1),
(59, 2, 1, 'HOME', 'Home', 1, '2021-09-24 18:37:38', NULL, 1),
(60, 2, 1, 'PRODUCT', 'Estate', 1, '2021-09-24 18:37:38', NULL, 1),
(61, 2, 1, 'HELP', 'Help', 1, '2021-09-24 18:37:38', NULL, 1),
(62, 2, 1, 'SEARCH_CATEGORY', 'Type Of Estate', 1, '2021-09-24 18:37:38', NULL, 1),
(63, 2, 1, 'SEARCH_LOCATION', 'Location', 1, '2021-09-24 18:37:38', NULL, 1),
(64, 2, 1, 'SEARCH_PLACEHOLDER', 'Search', 1, '2021-09-24 18:37:38', NULL, 1),
(65, 2, 1, 'SUPER_VIPS_TITLE', 'S-VIP Statements', 1, '2021-09-24 18:37:38', NULL, 1),
(66, 2, 1, 'VIPS_TITLE', 'VIP Statements', 1, '2021-09-24 18:37:38', NULL, 1),
(67, 2, 1, 'POUPLAR_TITLE', 'Popular Statements', 1, '2021-09-24 18:37:38', NULL, 1),
(68, 2, 1, 'SEE_MORE', 'See more', 1, '2021-09-24 18:37:38', NULL, 1),
(69, 2, 1, 'FOOTER_TEXT', '2021 Real Estate. All Rights Reserved.', 1, '2021-09-24 18:37:38', NULL, 1),
(70, 2, 2, 'FILTER_TITLE', '', 1, '2021-09-24 18:37:38', NULL, 1),
(71, 2, 2, 'SORT_BY', 'Sort By', 1, '2021-09-24 18:37:38', NULL, 1),
(72, 2, 2, 'PRINT', 'Print', 1, '2021-09-24 18:37:38', NULL, 1),
(73, 2, 2, 'SHARE', 'Share', 1, '2021-09-24 18:37:38', NULL, 1),
(74, 2, 3, 'MAIL', 'Email', 1, '2021-09-24 18:37:38', NULL, 1),
(75, 2, 3, 'PASSWORD', 'Password', 1, '2021-09-24 18:37:38', NULL, 1),
(76, 2, 3, 'FORGOT_PASSWORD', 'Forgot Password', 1, '2021-09-24 18:37:38', NULL, 1),
(77, 2, 3, 'DONT_HAVE_ACC', 'Don’t have an account? Create one.', 1, '2021-09-24 18:37:38', NULL, 1),
(78, 2, 3, 'SIGN_IN', 'Sign in', 1, '2021-09-24 18:37:38', NULL, 1),
(79, 2, 3, 'ALREADY_HAVE_ACC', 'Already have an account? Sign in', 1, '2021-09-24 18:37:38', NULL, 1),
(80, 2, 3, 'SEND_CODE', 'SEND CODE', 1, '2021-09-24 18:37:38', NULL, 1),
(81, 2, 3, 'SIGN_UP', 'Sign up', 1, '2021-09-24 18:37:38', NULL, 1),
(82, 2, 3, 'PHONE_NUMBER', 'Phone number', 1, '2021-09-24 18:37:38', NULL, 1),
(83, 2, 3, 'COUNTRY', 'Country', 1, '2021-09-24 18:37:38', NULL, 1),
(84, 2, 3, 'CITY', 'City', 1, '2021-09-24 18:37:38', NULL, 1),
(85, 2, 3, 'BIRTHDAY', 'Birthday', 1, '2021-09-24 18:37:38', NULL, 1),
(86, 2, 3, 'GENDER', 'Gender', 1, '2021-09-24 18:37:38', NULL, 1),
(87, 2, 3, 'CONFIRM', 'Confirm', 1, '2021-09-24 18:37:38', NULL, 1),
(88, 2, 3, 'FULLNAME', 'Fullname', 1, '2021-09-24 18:37:38', NULL, 1),
(89, 2, 3, 'RESET_PASSWORD', 'Reset Password', 1, '2021-09-24 18:37:38', NULL, 1),
(90, 2, 3, 'RESET_PLACEHOLDER', 'Enter Your Email', 1, '2021-09-24 18:37:38', NULL, 1),
(91, 2, 3, 'WE_SENT_LINK', 'We sent a reset link. Please check your Email', 1, '2021-09-24 18:37:38', NULL, 1),
(92, 2, 3, 'SEND', 'Send', 1, '2021-09-24 18:37:38', NULL, 1),
(93, 2, 4, 'LOGOUT', 'Logout', 1, '2021-09-24 18:37:38', NULL, 1),
(94, 2, 4, 'DASHBOARD', 'Dashboard', 1, '2021-09-24 18:37:38', NULL, 1),
(95, 2, 4, 'BOOKMARKS', 'BOOKMARKS', 1, '2021-09-24 18:37:38', NULL, 1),
(96, 2, 4, 'ANALYTICS', 'Analytics', 1, '2021-09-24 18:37:38', NULL, 1),
(97, 2, 4, 'PROFILE', 'Profile', 1, '2021-09-24 18:37:38', NULL, 1),
(98, 2, 4, 'CREATE', 'Create', 1, '2021-09-24 18:37:38', NULL, 1),
(99, 2, 4, 'APPROVED', 'Approved', 1, '2021-09-24 18:37:38', NULL, 1),
(100, 2, 4, 'NOT_APPROVED', 'Not Approved', 1, '2021-09-24 18:37:38', NULL, 1),
(101, 2, 4, 'PENDING', 'Pendding', 1, '2021-09-24 18:37:38', NULL, 1),
(102, 2, 4, 'SEE_REPORT', 'See Report', 1, '2021-09-24 18:37:38', NULL, 1),
(103, 2, 4, 'POSTS', 'Posts', 1, '2021-09-24 18:37:38', NULL, 1),
(104, 2, 4, 'SAVED', 'Saved', 1, '2021-09-24 18:37:38', NULL, 1),
(105, 2, 4, 'SOLD', 'Sold', 1, '2021-09-24 18:37:38', NULL, 1),
(106, 2, 4, 'BROUGHT', 'Brought', 1, '2021-09-24 18:37:38', NULL, 1),
(107, 2, 4, 'RATE', 'Rate', 1, '2021-09-24 18:37:38', NULL, 1),
(108, 2, 4, 'SAVE', 'Save', 1, '2021-09-24 18:37:38', NULL, 1),
(109, 2, 4, 'CANCEL', 'Cancel', 1, '2021-09-24 18:37:38', NULL, 1),
(110, 2, 4, 'DESCLARATION_UPLOAD', 'UPLOAD DECLARATION OF THE PROPERTY', 1, '2021-09-24 18:37:38', NULL, 1),
(111, 2, 4, 'SVIPS', 'S-VIP', 1, '2021-09-24 18:37:38', NULL, 1),
(112, 2, 4, 'VIPS', 'VIP', 1, '2021-09-24 18:37:38', NULL, 1),
(113, 2, 4, 'UPDATE', 'Update', 1, '2021-09-24 18:37:38', NULL, 1),
(114, 2, 4, 'GO_TO_LOGIN', 'Go To Login', 1, '2021-09-24 18:37:38', NULL, 1),
(115, 2, 3, 'HELP_TITLE', 'Frequently Asked Questions', 1, '2021-09-24 18:37:38', NULL, 1),
(116, 2, 2, 'CENTRAL_HEATING', 'Central heating', 1, NULL, NULL, 1),
(117, 1, 2, 'CENTRAL_HEATING', 'ცენტრალური გათბობა', 1, NULL, NULL, 1),
(118, 1, 2, 'AIR_CONDITIONING', 'კონდიციონერი', 1, NULL, NULL, 1),
(119, 2, 2, 'AIR_CONDITIONING', 'Air Conditioning', 1, NULL, NULL, 1),
(120, 1, 2, 'NATURAL_GAS', 'ბუნებრივი გაზი', 1, NULL, NULL, 1),
(121, 2, 2, 'NATURAL_GAS', 'Natural gas', 1, NULL, NULL, 1),
(122, 1, 2, 'PRICE', 'ფასი', 1, NULL, NULL, 1),
(123, 2, 2, 'PRICE', 'Price', 1, NULL, NULL, 1),
(124, 1, 2, 'AREA', 'სივრცე', 1, NULL, NULL, 1),
(125, 2, 2, 'AREA', 'Area', 1, NULL, NULL, 1),
(126, 1, 2, 'FLOOR', 'სართული', 1, NULL, NULL, 1),
(127, 2, 2, 'FLOOR', 'floor', 1, NULL, NULL, 1),
(128, 1, 2, 'ROOMS', 'ოთახები', 1, NULL, NULL, 1),
(129, 2, 2, 'ROOMS', 'Rooms', 1, NULL, NULL, 1),
(130, 1, 2, 'ONLYWITHPHOTO', 'მხოლოდ ფოტოთი', 1, NULL, NULL, 1),
(131, 2, 2, 'ONLYWITHPHOTO', 'Only with photo', 1, NULL, NULL, 1),
(132, 1, 2, 'ONLYVIPS', 'მხოლოდ VIP', 1, NULL, NULL, 1),
(133, 2, 2, 'ONLYVIPS', 'Only VIP', 1, NULL, NULL, 1),
(134, 1, 2, 'ONLYSVIPS', 'მხოლოდ S-VIP', NULL, NULL, NULL, 1),
(135, 2, 2, 'ONLYSVIPS', 'Only S-VIP', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vips`
--

CREATE TABLE `vips` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `posts` int(11) DEFAULT 0,
  `price` decimal(10,2) DEFAULT 0.00,
  `icon` varchar(500) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `actived` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vips`
--

INSERT INTO `vips` (`id`, `title`, `posts`, `price`, `icon`, `user_id`, `period`, `created`, `updated`, `actived`) VALUES
(0, 'S-vip', 0, '0.00', NULL, NULL, NULL, '2021-09-24 18:30:49', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `automator_attributes`
--
ALTER TABLE `automator_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `automator_classes`
--
ALTER TABLE `automator_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `automator_data`
--
ALTER TABLE `automator_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `automator_elements`
--
ALTER TABLE `automator_elements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `automator_onchange`
--
ALTER TABLE `automator_onchange`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `declarations`
--
ALTER TABLE `declarations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estate_types`
--
ALTER TABLE `estate_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `help`
--
ALTER TABLE `help`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media_extensions`
--
ALTER TABLE `media_extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_details`
--
ALTER TABLE `post_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_media`
--
ALTER TABLE `post_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_media_types`
--
ALTER TABLE `post_media_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_settings`
--
ALTER TABLE `post_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_status`
--
ALTER TABLE `post_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translate`
--
ALTER TABLE `translate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vips`
--
ALTER TABLE `vips`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `automator_attributes`
--
ALTER TABLE `automator_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `automator_classes`
--
ALTER TABLE `automator_classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `automator_data`
--
ALTER TABLE `automator_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `automator_elements`
--
ALTER TABLE `automator_elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `automator_onchange`
--
ALTER TABLE `automator_onchange`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `declarations`
--
ALTER TABLE `declarations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estate_types`
--
ALTER TABLE `estate_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `help`
--
ALTER TABLE `help`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `media_extensions`
--
ALTER TABLE `media_extensions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `post_details`
--
ALTER TABLE `post_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `post_media`
--
ALTER TABLE `post_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `post_media_types`
--
ALTER TABLE `post_media_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_settings`
--
ALTER TABLE `post_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `post_status`
--
ALTER TABLE `post_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `translate`
--
ALTER TABLE `translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
