/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 10.4.6-MariaDB : Database - domaciiteh
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`domaciiteh` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `domaciiteh`;

/*Table structure for table `lekar` */

DROP TABLE IF EXISTS `lekar`;

CREATE TABLE `lekar` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ime` varchar(30) NOT NULL,
  `prezime` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `lekar` */

insert  into `lekar`(`id`,`ime`,`prezime`) values 
(1,'dr Petar','Petrovic'),
(2,'dr Ivan','Ristic'),
(3,'dr Jovan','Jovanovic'),
(4,'dr Milos','Milosevic');

/*Table structure for table `pacijent` */

DROP TABLE IF EXISTS `pacijent`;

CREATE TABLE `pacijent` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brojKartona` varchar(20) NOT NULL,
  `ime` varchar(20) NOT NULL,
  `prezime` varchar(20) NOT NULL,
  `datumRodjenja` date NOT NULL,
  `lekarId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lekarId` (`lekarId`),
  CONSTRAINT `pacijent_ibfk_1` FOREIGN KEY (`lekarId`) REFERENCES `lekar` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

/*Data for the table `pacijent` */

insert  into `pacijent`(`id`,`brojKartona`,`ime`,`prezime`,`datumRodjenja`,`lekarId`) values 
(42,'01/2019','Milos','Milosevic','2019-11-21',1),
(47,'02/2019','Zoran','Jovanovic','1970-11-06',2),
(48,'03/2019','Djordje','Djordjevic','1974-01-06',4),
(50,'04/2019','Dragan','Jovanovic','1999-11-06',3);

/*Table structure for table `pregledi` */

DROP TABLE IF EXISTS `pregledi`;

CREATE TABLE `pregledi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `terapija` text NOT NULL,
  `dijagnoza` text NOT NULL,
  `pacijentId` bigint(20) NOT NULL,
  `datumPregleda` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pacijentId` (`pacijentId`),
  CONSTRAINT `pregledi_ibfk_1` FOREIGN KEY (`pacijentId`) REFERENCES `pacijent` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;

/*Data for the table `pregledi` */

insert  into `pregledi`(`id`,`terapija`,`dijagnoza`,`pacijentId`,`datumPregleda`) values 
(82,'Kortikosteroidna mast, 2x dnevno u trajanju od 7 dana.','DG - Dermatitis Atopica\r\n',42,'2019-10-28'),
(83,'Kateterizacija srca','Infarkcus miokardi\r\n',42,'2019-09-24'),
(84,'Dymista','Simulsitis chronica\r\n',47,'2019-11-19'),
(85,'Cromolin','Astma Bronchiale\r\n',47,'2019-11-26');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
