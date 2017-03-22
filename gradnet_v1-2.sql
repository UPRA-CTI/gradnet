-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 22, 2017 at 06:31 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gradnet_v1`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth`
--

CREATE TABLE `auth` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `source` varchar(2056) DEFAULT NULL,
  `source_id` varchar(2056) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bachelors_degree`
--

CREATE TABLE `bachelors_degree` (
  `id` int(11) NOT NULL,
  `dept_id` int(10) DEFAULT NULL,
  `name_degree` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `name_department` varchar(128) DEFAULT '',
  `description` varchar(128) DEFAULT NULL,
  `active` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `grad_addresses`
--

CREATE TABLE `grad_addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address1` varchar(256) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Dirección #1',
  `address2` varchar(256) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Dirección #2',
  `city` varchar(256) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Ciudad',
  `zipcode` int(7) DEFAULT NULL COMMENT 'Código Postal',
  `state_id` varchar(2) CHARACTER SET latin1 DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `grad_contact_details`
--

CREATE TABLE `grad_contact_details` (
  `id` int(11) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `phone_number1` int(10) DEFAULT NULL,
  `phone_number2` int(11) DEFAULT NULL,
  `phone_type` varchar(128) DEFAULT NULL,
  `created_at` int(10) DEFAULT NULL,
  `updated_at` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `grad_events_stream`
--

CREATE TABLE `grad_events_stream` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `body` mediumtext,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `grad_mayor`
--

CREATE TABLE `grad_mayor` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `is_graduated` int(1) DEFAULT NULL,
  `grad_year` int(11) DEFAULT NULL,
  `mayor` varchar(128) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `grad_users`
--

CREATE TABLE `grad_users` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `email` varchar(128) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Email',
  `first_name` varchar(128) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Nombre',
  `initial` varchar(2) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Inicial',
  `last_name` varchar(128) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Primer Apellido',
  `second_last_name` varchar(128) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Sengundo Apellido',
  `password_hash` varchar(256) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Password',
  `status` int(2) DEFAULT '10' COMMENT 'Estatus',
  `created_at` int(11) DEFAULT NULL COMMENT 'Fecha Creado',
  `updated_at` int(11) DEFAULT NULL COMMENT 'Fecha Actualizado',
  `auth_key` varchar(128) DEFAULT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `github` varchar(128) DEFAULT NULL,
  `username` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1490131161),
('m140209_132017_init', 1490131167),
('m140403_174025_create_account_table', 1490131167),
('m140504_113157_update_tables', 1490131168),
('m140504_130429_create_token_table', 1490131339),
('m140830_171933_fix_ip_field', 1490131339),
('m140830_172703_change_account_table_name', 1490131339);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `public_email` varchar(255) DEFAULT NULL,
  `gravatar_email` varchar(255) DEFAULT NULL,
  `gravatar_id` varchar(32) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `bio` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`user_id`, `name`, `public_email`, `gravatar_email`, `gravatar_id`, `location`, `website`, `bio`) VALUES
(1, NULL, NULL, 'roberto.rosa2@upr.edu', '789a98f4d3b252610a21cecfd18c42a4', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` int(11) NOT NULL,
  `skill_name` varchar(128) DEFAULT NULL,
  `active` int(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`id`, `skill_name`, `active`) VALUES
(1, 'web design', 1);

-- --------------------------------------------------------

--
-- Table structure for table `social_account`
--

CREATE TABLE `social_account` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(60) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `registration_ip` bigint(20) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `confirmed_at`, `unconfirmed_email`, `blocked_at`, `role`, `registration_ip`, `created_at`, `updated_at`, `flags`) VALUES
(1, 'robertorosa', 'roberto.rosa2@upr.edu', '$2y$10$BMgN8t4dju2bsW7w0Yzr2.UomYiilL2HZZ6H0VlAY6S3mXWz8/6Yi', 'TH1_ORUZCbOZP08KcX1ZiptMBVc0B-_a', NULL, NULL, NULL, NULL, 0, 1490131302, 1490131302, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth`
--
ALTER TABLE `auth`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `bachelors_degree`
--
ALTER TABLE `bachelors_degree`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dept_bachillerato` (`dept_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grad_addresses`
--
ALTER TABLE `grad_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `grad_contact_details`
--
ALTER TABLE `grad_contact_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`user_id`);

--
-- Indexes for table `grad_events_stream`
--
ALTER TABLE `grad_events_stream`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grad_mayor`
--
ALTER TABLE `grad_mayor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `grad_users`
--
ALTER TABLE `grad_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_account`
--
ALTER TABLE `social_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_unique` (`provider`,`client_id`),
  ADD KEY `fk_user_account` (`user_id`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD UNIQUE KEY `token_unique` (`user_id`,`code`,`type`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_unique_username` (`username`),
  ADD UNIQUE KEY `user_unique_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth`
--
ALTER TABLE `auth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bachelors_degree`
--
ALTER TABLE `bachelors_degree`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `grad_addresses`
--
ALTER TABLE `grad_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `grad_contact_details`
--
ALTER TABLE `grad_contact_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `grad_events_stream`
--
ALTER TABLE `grad_events_stream`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `grad_mayor`
--
ALTER TABLE `grad_mayor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `grad_users`
--
ALTER TABLE `grad_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `social_account`
--
ALTER TABLE `social_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth`
--
ALTER TABLE `auth`
  ADD CONSTRAINT `auth_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `grad_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bachelors_degree`
--
ALTER TABLE `bachelors_degree`
  ADD CONSTRAINT `dept_bachillerato` FOREIGN KEY (`dept_id`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `grad_addresses`
--
ALTER TABLE `grad_addresses`
  ADD CONSTRAINT `grad_addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `grad_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `grad_contact_details`
--
ALTER TABLE `grad_contact_details`
  ADD CONSTRAINT `id` FOREIGN KEY (`user_id`) REFERENCES `grad_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `grad_mayor`
--
ALTER TABLE `grad_mayor`
  ADD CONSTRAINT `grad_mayor_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `grad_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grad_mayor_ibfk_2` FOREIGN KEY (`dept_id`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `social_account`
--
ALTER TABLE `social_account`
  ADD CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
