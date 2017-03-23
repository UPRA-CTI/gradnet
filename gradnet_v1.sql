/*
SQLyog Community v12.3.1 (64 bit)
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

/*Data for the table `auth` */

insert  into `auth`(`id`,`user_id`,`source`,`source_id`) values 
(1,1,'linkedin','NPiD1pEguJ');

/*Table structure for table `bachelors_degree` */

DROP TABLE IF EXISTS `bachelors_degree`;

CREATE TABLE `bachelors_degree` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_id` int(10) DEFAULT NULL,
  `name_degree` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dept_bachillerato` (`dept_id`),
  CONSTRAINT `dept_bachillerato` FOREIGN KEY (`dept_id`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bachelors_degree` */

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_department` varchar(128) DEFAULT '',
  `description` varchar(128) DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `department` */

/*Table structure for table `experience_category` */

DROP TABLE IF EXISTS `experience_category`;

CREATE TABLE `experience_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `name` varchar(128) DEFAULT NULL COMMENT 'Nombre',
  `description` varchar(255) DEFAULT NULL COMMENT 'Descripción',
  `is_active` int(1) DEFAULT '1' COMMENT 'Activo?',
  `created_at` int(11) DEFAULT NULL COMMENT 'Fecha Creado',
  `updated_at` int(11) DEFAULT NULL COMMENT 'Fecha Actualizado',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `experience_category` */

insert  into `experience_category`(`id`,`name`,`description`,`is_active`,`created_at`,`updated_at`) values 
(1,'Bachillerato',NULL,1,NULL,NULL);

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

/*Data for the table `grad_addresses` */

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

/*Data for the table `grad_contact_details` */

/*Table structure for table `grad_events_stream` */

DROP TABLE IF EXISTS `grad_events_stream`;

CREATE TABLE `grad_events_stream` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `body` mediumtext,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `grad_events_stream_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `grad_events_stream` */

/*Table structure for table `grad_experience` */

DROP TABLE IF EXISTS `grad_experience`;

CREATE TABLE `grad_experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `user_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL COMMENT 'Lugar',
  `category_id` int(11) DEFAULT NULL COMMENT 'Tipo de Experiencia',
  `title` varchar(255) DEFAULT NULL COMMENT 'Título',
  `sub_title` varchar(255) DEFAULT NULL COMMENT 'Nombre',
  `description` mediumtext COMMENT 'Descripción',
  `date_from` int(11) DEFAULT NULL COMMENT 'Fecha de Comienzo',
  `date_to` int(11) DEFAULT NULL COMMENT 'Fecha de Final',
  `is_active` int(1) DEFAULT '1' COMMENT 'Activo?',
  `updated_at` int(11) DEFAULT NULL COMMENT 'Fecha Actualizado',
  `created_at` int(11) DEFAULT NULL COMMENT 'Fecha Creado',
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `grad_experience_ibfk_3` (`category_id`),
  KEY `grad_experience_ibfk_1` (`user_id`),
  CONSTRAINT `grad_experience_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `grad_experience_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `grad_locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `grad_experience_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `experience_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `grad_experience` */

insert  into `grad_experience`(`id`,`user_id`,`location_id`,`category_id`,`title`,`sub_title`,`description`,`date_from`,`date_to`,`is_active`,`updated_at`,`created_at`) values 
(1,2,1,1,'Bachillerato','Ciencias de Cómputos','Ciencias de Cómputos',NULL,NULL,1,NULL,NULL);

/*Table structure for table `grad_locations` */

DROP TABLE IF EXISTS `grad_locations`;

CREATE TABLE `grad_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Nombre',
  `description` mediumtext COMMENT 'Descripción',
  `address` varchar(255) DEFAULT NULL COMMENT 'Dirección Postal',
  `address2` varchar(255) DEFAULT NULL COMMENT 'Dirección Física',
  `state` varchar(255) DEFAULT NULL COMMENT 'Estado',
  `state_id` int(11) DEFAULT NULL COMMENT 'Estado',
  `city` varchar(255) DEFAULT NULL COMMENT 'Ciudad',
  `zipcode` int(11) DEFAULT NULL COMMENT 'Código Postal',
  `type_id` int(11) DEFAULT NULL COMMENT 'Tipo de Localización, Compañía',
  `phone1` varchar(128) DEFAULT NULL COMMENT 'Teléfono #1',
  `phone2` varchar(128) DEFAULT NULL COMMENT 'Teléfono #2',
  `contact_email` varchar(128) DEFAULT NULL COMMENT 'Correo Electrónico',
  `contact_email2` varchar(128) DEFAULT NULL COMMENT 'Correo Electrónico #2',
  `created_at` int(11) DEFAULT NULL COMMENT 'Fecha Creado',
  `updated_at` int(11) DEFAULT NULL COMMENT 'Fecha Actualizado',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `grad_locations` */

insert  into `grad_locations`(`id`,`name`,`description`,`address`,`address2`,`state`,`state_id`,`city`,`zipcode`,`type_id`,`phone1`,`phone2`,`contact_email`,`contact_email2`,`created_at`,`updated_at`) values 
(1,'UPR Arecibo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

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
  CONSTRAINT `grad_mayor_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `grad_mayor_ibfk_2` FOREIGN KEY (`dept_id`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `grad_mayor` */

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `grad_users` */

insert  into `grad_users`(`id`,`student_id`,`email`,`first_name`,`initial`,`last_name`,`second_last_name`,`password_hash`,`status`,`created_at`,`updated_at`,`auth_key`,`password_reset_token`,`github`,`username`) values 
(1,NULL,'sales@eolpr.com',NULL,NULL,NULL,NULL,'$2y$13$Xso/8gRpBdEzk04ns6YalOdrenkh7WmbuqGQq83CHDfF.t50bmth.',10,NULL,NULL,'AHHK1l2nKhu8Ek_UUMmgpy0gtqHXlldE','lqgmqSOvP0HPu3RB9AKR_WhHgX2h8OTQ_1490281035',NULL,NULL);

/*Table structure for table `migration` */

DROP TABLE IF EXISTS `migration`;

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `migration` */

insert  into `migration`(`version`,`apply_time`) values 
('m000000_000000_base',1490131161),
('m140209_132017_init',1490131167),
('m140403_174025_create_account_table',1490131167),
('m140504_113157_update_tables',1490131168),
('m140504_130429_create_token_table',1490131339),
('m140830_171933_fix_ip_field',1490131339),
('m140830_172703_change_account_table_name',1490131339);

/*Table structure for table `profile` */

DROP TABLE IF EXISTS `profile`;

CREATE TABLE `profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `public_email` varchar(255) DEFAULT NULL,
  `gravatar_email` varchar(255) DEFAULT NULL,
  `gravatar_id` varchar(32) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `bio` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `profile` */

insert  into `profile`(`id`,`user_id`,`name`,`public_email`,`gravatar_email`,`gravatar_id`,`location`,`website`,`bio`) values 
(1,1,NULL,NULL,'roberto.rosa2@upr.edu','789a98f4d3b252610a21cecfd18c42a4',NULL,NULL,NULL),
(2,1,'Roberto Rosa','admin@eolpr.com','','','Camuy','robert.me','Unfinished');

/*Table structure for table `skills` */

DROP TABLE IF EXISTS `skills`;

CREATE TABLE `skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skill_name` varchar(128) DEFAULT NULL,
  `active` int(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `skills` */

insert  into `skills`(`id`,`skill_name`,`active`) values 
(1,'web design',1);

/*Table structure for table `social_account` */

DROP TABLE IF EXISTS `social_account`;

CREATE TABLE `social_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `data` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_unique` (`provider`,`client_id`),
  KEY `fk_user_account` (`user_id`),
  CONSTRAINT `social_account_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `social_account` */

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  UNIQUE KEY `token_unique` (`user_id`,`code`,`type`),
  CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `token` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_unique_username` (`username`),
  UNIQUE KEY `user_unique_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`email`,`password_hash`,`auth_key`,`confirmed_at`,`unconfirmed_email`,`blocked_at`,`role`,`registration_ip`,`created_at`,`updated_at`,`flags`) values 
(1,'robertorosa','roberto.rosa2@upr.edu','$2y$10$BMgN8t4dju2bsW7w0Yzr2.UomYiilL2HZZ6H0VlAY6S3mXWz8/6Yi','TH1_ORUZCbOZP08KcX1ZiptMBVc0B-_a',NULL,NULL,NULL,NULL,0,1490131302,1490131302,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
