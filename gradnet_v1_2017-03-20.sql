# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.1.16-MariaDB)
# Database: gradnet_v1
# Generation Time: 2017-03-20 18:02:02 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table bachelors_degree
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bachelors_degree`;

CREATE TABLE `bachelors_degree` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_id` int(10) DEFAULT NULL,
  `name_degree` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dept_bachillerato` (`dept_id`),
  CONSTRAINT `dept_bachillerato` FOREIGN KEY (`dept_id`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `bachelors_degree` WRITE;
/*!40000 ALTER TABLE `bachelors_degree` DISABLE KEYS */;

INSERT INTO `bachelors_degree` (`id`, `dept_id`, `name_degree`)
VALUES
	(1,1,'Ciencias de Cómputos');

/*!40000 ALTER TABLE `bachelors_degree` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table certification
# ------------------------------------------------------------

DROP TABLE IF EXISTS `certification`;

CREATE TABLE `certification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) DEFAULT NULL,
  `name_certification` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dept_cert` (`department_id`),
  CONSTRAINT `dept_cert` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `certification` WRITE;
/*!40000 ALTER TABLE `certification` DISABLE KEYS */;

INSERT INTO `certification` (`id`, `department_id`, `name_certification`)
VALUES
	(1,1,'Diseño de paginas web');

/*!40000 ALTER TABLE `certification` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table department
# ------------------------------------------------------------

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_department` varchar(128) DEFAULT '',
  `description` varchar(128) DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;

INSERT INTO `department` (`id`, `name_department`, `description`, `active`)
VALUES
	(1,'Ciencias de Computos',NULL,1);

/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grad_addresses
# ------------------------------------------------------------

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



# Dump of table grad_contact_details
# ------------------------------------------------------------

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



# Dump of table grad_events_stream
# ------------------------------------------------------------

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



# Dump of table grad_mayor
# ------------------------------------------------------------

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



# Dump of table grad_users
# ------------------------------------------------------------

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `grad_users` WRITE;
/*!40000 ALTER TABLE `grad_users` DISABLE KEYS */;

INSERT INTO `grad_users` (`id`, `student_id`, `email`, `first_name`, `initial`, `last_name`, `second_last_name`, `password_hash`, `status`, `created_at`, `updated_at`, `auth_key`)
VALUES
	(1,0,'roberto.rosa2@upr.edu',NULL,NULL,NULL,NULL,'',10,NULL,NULL,NULL),
	(2,0,'roberto.rosa2@upr.edu',NULL,NULL,NULL,NULL,'',10,NULL,NULL,NULL),
	(3,0,'roberto.rosa2@upr.edu',NULL,NULL,NULL,NULL,'',10,NULL,NULL,NULL),
	(4,0,'roberto.rosa2@upr.edu',NULL,NULL,NULL,NULL,'',10,NULL,NULL,NULL),
	(5,0,'roberto.rosa2@upr.edu',NULL,NULL,NULL,NULL,'',10,NULL,NULL,NULL),
	(6,0,'roberto.rosa2@upr.edu',NULL,NULL,NULL,NULL,'',10,NULL,NULL,NULL);

/*!40000 ALTER TABLE `grad_users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
