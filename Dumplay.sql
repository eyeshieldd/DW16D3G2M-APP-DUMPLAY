/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.11-MariaDB : Database - dumbplay
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dumbplay` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `dumbplay`;

/*Table structure for table `Artists` */

DROP TABLE IF EXISTS `Artists`;

CREATE TABLE `Artists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `old` varchar(255) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `start` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

/*Data for the table `Artists` */

insert  into `Artists`(`id`,`name`,`old`,`genre`,`start`,`createdAt`,`updatedAt`) values (2,'Ungu','23','Band','2004','2020-06-25 08:25:45','2020-06-25 08:25:45'),(3,'Afgan','27','Solo','2016','2020-06-25 08:28:55','2020-06-25 08:28:55'),(4,'niki minaj','28','Solo','2017','2020-06-25 09:01:53','2020-06-25 09:01:53'),(5,'samsons','24','Solo','2017','2020-06-25 09:04:44','2020-06-25 09:04:44'),(9,'niki minaj','24','Solo','2019','2020-06-25 09:08:50','2020-06-25 09:08:50'),(18,'Avenged','24','Band','2002','2020-06-25 09:45:16','2020-06-25 09:45:16');

/*Table structure for table `SequelizeMeta` */

DROP TABLE IF EXISTS `SequelizeMeta`;

CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `SequelizeMeta` */

insert  into `SequelizeMeta`(`name`) values ('20200611115852-create-users.js'),('20200611141220-create-category.js'),('20200611141453-create-film.js'),('20200611171756-create-transaction.js');

/*Table structure for table `Songs` */

DROP TABLE IF EXISTS `Songs`;

CREATE TABLE `Songs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `attache` varchar(255) DEFAULT NULL,
  `artisId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `artisId` (`artisId`),
  CONSTRAINT `Songs_ibfk_1` FOREIGN KEY (`artisId`) REFERENCES `Artists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `Songs` */

insert  into `Songs`(`id`,`title`,`year`,`thumbnail`,`attache`,`artisId`,`createdAt`,`updatedAt`) values (2,'Pencari Cinta',2004,'1593073673395-music11.png','https://res.cloudinary.com/ehsanahmadi/video/upload/v1573550770/Sirvan-Khosravi-Dorost-Nemisham-128_kb8urq.mp3',2,'2020-06-25 08:27:53','2020-06-25 08:27:53'),(3,'Iwan Fals',2002,'1593075232283-music2.png','https://res.cloudinary.com/ehsanahmadi/video/upload/v1573550770/Sirvan-Khosravi-Dorost-Nemisham-128_kb8urq.mp3',3,'2020-06-25 08:53:52','2020-06-25 08:53:52');

/*Table structure for table `Transaction` */

DROP TABLE IF EXISTS `Transaction`;

CREATE TABLE `Transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `startDate` date DEFAULT NULL,
  `dueDate` date DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `attache` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `Transaction_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `Transaction` */

insert  into `Transaction`(`id`,`startDate`,`dueDate`,`userId`,`attache`,`status`,`createdAt`,`updatedAt`) values (1,'2020-06-27','2020-07-25',2,'1593080873055-music7.png','Reject','2020-06-25 10:27:53','2020-06-25 12:42:36');

/*Table structure for table `Users` */

DROP TABLE IF EXISTS `Users`;

CREATE TABLE `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `subscribe` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `Users` */

insert  into `Users`(`id`,`fullName`,`email`,`password`,`role`,`gender`,`phone`,`address`,`subscribe`,`createdAt`,`updatedAt`) values (1,'anjar','anjar@email.com','$2b$10$oLNODsu8Vbc8TzexePOZ6OEZFHdfVQR6pI4LNhFVC54wfalU/0q/.',1,'lakilaki','ini data coba saja','ini data coba saja',1,'2020-06-23 01:02:05','2020-06-23 07:33:46'),(2,'joko','jo@gmail.com','$2b$10$qG5qDSbm2/TpGIgYkOf9eub.6x2n0z0CrQ3.QS09DDklw8ebyrV3i',2,'Male','08989898989898','dfsdfsdfsdfsfsdfsfsf',1,'2020-06-23 12:15:04','2020-06-25 12:42:13'),(3,'amir','amirudin@gmail.com','$2b$10$CJu7LHi9m9Uu81oI0VBY7uBHCHgvv.RTzYgi4rcURutNUAhmaW0Zy',2,'Famale','0909090909090','sadasdasdasddasd',0,'2020-06-23 15:19:33','2020-06-23 15:19:33');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
