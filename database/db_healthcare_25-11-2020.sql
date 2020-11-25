-- Adminer 4.7.6 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment` (
  `appId` int(3) NOT NULL AUTO_INCREMENT,
  `patientIc` bigint(12) NOT NULL,
  `scheduleId` int(10) NOT NULL,
  `appSymptom` varchar(100) NOT NULL,
  `appComment` varchar(100) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'process',
  PRIMARY KEY (`appId`),
  UNIQUE KEY `scheduleId_2` (`scheduleId`),
  KEY `patientIc` (`patientIc`),
  KEY `scheduleId` (`scheduleId`),
  CONSTRAINT `appointment_ibfk_4` FOREIGN KEY (`patientIc`) REFERENCES `patient` (`icPatient`),
  CONSTRAINT `appointment_ibfk_5` FOREIGN KEY (`scheduleId`) REFERENCES `doctorschedule` (`scheduleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `appointment` (`appId`, `patientIc`, `scheduleId`, `appSymptom`, `appComment`, `status`) VALUES
(86,	920517105553,	40,	'Pening Kepala',	'Bila doktor free?',	'done'),
(87,	920517105553,	45,	'',	'',	'process');

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `body_parts`;
CREATE TABLE `body_parts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body_part_name` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

INSERT INTO `body_parts` (`id`, `body_part_name`) VALUES
(1,	'head'),
(2,	'neck'),
(3,	'arms'),
(4,	'upper torso'),
(5,	'stomach'),
(6,	'legs');

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `icDoctor` bigint(12) NOT NULL,
  `password` varchar(20) NOT NULL,
  `doctorId` int(3) NOT NULL,
  `doctorFirstName` varchar(50) NOT NULL,
  `doctorLastName` varchar(50) NOT NULL,
  `doctorAddress` varchar(100) NOT NULL,
  `doctorPhone` varchar(15) NOT NULL,
  `doctorEmail` varchar(20) NOT NULL,
  `doctorDOB` date NOT NULL,
  PRIMARY KEY (`icDoctor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `doctor` (`icDoctor`, `password`, `doctorId`, `doctorFirstName`, `doctorLastName`, `doctorAddress`, `doctorPhone`, `doctorEmail`, `doctorDOB`) VALUES
(123456789,	'123',	123,	'Doctor',	'Sehgal',	'kuala lumpur',	'0173567758',	'dsehgal@gmail.com',	'1990-04-10');

DROP TABLE IF EXISTS `doctorschedule`;
CREATE TABLE `doctorschedule` (
  `scheduleId` int(11) NOT NULL AUTO_INCREMENT,
  `scheduleDate` date NOT NULL,
  `scheduleDay` varchar(15) NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  `bookAvail` varchar(10) NOT NULL,
  PRIMARY KEY (`scheduleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `doctorschedule` (`scheduleId`, `scheduleDate`, `scheduleDay`, `startTime`, `endTime`, `bookAvail`) VALUES
(40,	'2020-12-13',	'Sunday',	'09:00:00',	'10:00:00',	'available'),
(41,	'2015-12-13',	'Sunday',	'10:00:00',	'11:00:00',	'available'),
(42,	'2015-12-13',	'Sunday',	'11:00:00',	'12:00:00',	'available'),
(43,	'2015-12-14',	'Monday',	'11:00:00',	'12:00:00',	'available'),
(44,	'2015-12-13',	'Sunday',	'01:00:00',	'02:00:00',	'available'),
(45,	'2020-11-26',	'Thursday',	'02:30:00',	'03:30:00',	'notavail'),
(46,	'2020-11-26',	'Thursday',	'02:30:00',	'03:30:00',	'available');

DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient` (
  `icPatient` bigint(12) NOT NULL,
  `password` varchar(20) NOT NULL,
  `patientFirstName` varchar(20) NOT NULL,
  `patientLastName` varchar(20) NOT NULL,
  `patientMaritialStatus` varchar(10) NOT NULL,
  `patientDOB` date NOT NULL,
  `patientGender` varchar(10) NOT NULL,
  `patientAddress` varchar(100) NOT NULL,
  `patientPhone` varchar(15) NOT NULL,
  `patientEmail` varchar(100) NOT NULL,
  PRIMARY KEY (`icPatient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `patient` (`icPatient`, `password`, `patientFirstName`, `patientLastName`, `patientMaritialStatus`, `patientDOB`, `patientGender`, `patientAddress`, `patientPhone`, `patientEmail`) VALUES
(920517105553,	'123',	'Mohd',	'Mazlan',	'single',	'1992-05-17',	'male',	'NO 153 BLOK MURNI\r\nKOLEJ CANSELOR UNIVERSITI PUTRA MALAYSIA',	'173567758',	'lan.psis@gmail.com');

DROP TABLE IF EXISTS `symptoms`;
CREATE TABLE `symptoms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `symptom_details` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `body_part_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `body_part_id` (`body_part_id`),
  CONSTRAINT `symptoms_ibfk_1` FOREIGN KEY (`body_part_id`) REFERENCES `body_parts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

INSERT INTO `symptoms` (`id`, `symptom_details`, `body_part_id`) VALUES
(1,	'headache',	1),
(2,	'sinus pain',	1),
(3,	'throat pain',	2),
(4,	'sprain',	3),
(5,	'gastric',	5),
(6,	'diarrhea',	5);

-- 2020-11-25 16:44:05
