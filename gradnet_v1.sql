/*
SQLyog Community v12.3.2 (64 bit)
MySQL - 10.1.16-MariaDB : Database - gradnet_v1
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gradnet_v1` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `gradnet_v1`;

/*Table structure for table `auth` */

DROP TABLE IF EXISTS `auth`;

CREATE TABLE `auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `source` varchar(2056) DEFAULT NULL,
  `source_id` varchar(2056) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `auth_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `grad_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `bachelors_degree` */

DROP TABLE IF EXISTS `bachelors_degree`;

CREATE TABLE `bachelors_degree` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_id` int(10) DEFAULT NULL,
  `name_degree` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dept_bachillerato` (`dept_id`),
  CONSTRAINT `dept_bachillerato` FOREIGN KEY (`dept_id`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `certification` */

DROP TABLE IF EXISTS `certification`;

CREATE TABLE `certification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) DEFAULT NULL,
  `name_certification` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dept_cert` (`department_id`),
  CONSTRAINT `dept_cert` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_department` varchar(128) DEFAULT '',
  `description` varchar(128) DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `grad_addresses` */

DROP TABLE IF EXISTS `grad_addresses`;

CREATE TABLE `grad_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `address1` varchar(256) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Dirección #1',
  `address2` varchar(256) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Dirección #2',
  `city` varchar(256) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Ciudad',
  `zipcode` int(7) DEFAULT NULL COMMENT 'Código Postal',
  `state_id` varchar(2) CHARACTER SET latin1 DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `grad_addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `grad_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `grad_contact_details` */

DROP TABLE IF EXISTS `grad_contact_details`;

CREATE TABLE `grad_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `phone_number1` int(10) DEFAULT NULL,
  `phone_number2` int(11) DEFAULT NULL,
  `phone_type` varchar(128) DEFAULT NULL,
  `created_at` int(10) DEFAULT NULL,
  `updated_at` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`user_id`),
  CONSTRAINT `id` FOREIGN KEY (`user_id`) REFERENCES `grad_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `grad_events_stream` */

DROP TABLE IF EXISTS `grad_events_stream`;

CREATE TABLE `grad_events_stream` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `body` mediumtext,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `grad_mayor` */

DROP TABLE IF EXISTS `grad_mayor`;

CREATE TABLE `grad_mayor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `is_graduated` int(1) DEFAULT NULL,
  `grad_year` int(11) DEFAULT NULL,
  `mayor` varchar(128) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `grad_mayor_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `grad_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `grad_mayor_ibfk_2` FOREIGN KEY (`dept_id`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `grad_users` */

DROP TABLE IF EXISTS `grad_users`;

CREATE TABLE `grad_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `username` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`code`,`type`),
  CONSTRAINT `token_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `grad_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
