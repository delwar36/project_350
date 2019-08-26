-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for project_350
CREATE DATABASE IF NOT EXISTS `project_350` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `project_350`;

-- Dumping structure for table project_350.category
CREATE TABLE IF NOT EXISTS `category` (
  `catName` varchar(100) DEFAULT NULL,
  `docID` varchar(50) NOT NULL,
  KEY `docID` (`docID`),
  CONSTRAINT `FK_category_documaent` FOREIGN KEY (`docID`) REFERENCES `document` (`docID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table project_350.category: ~0 rows (approximately)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Dumping structure for table project_350.contributors
CREATE TABLE IF NOT EXISTS `contributors` (
  `cnt_username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `uploadedNo` int(10) unsigned zerofill NOT NULL,
  KEY `FK_contributors_users` (`cnt_username`),
  CONSTRAINT `FK_contributors_users` FOREIGN KEY (`cnt_username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table project_350.contributors: ~0 rows (approximately)
/*!40000 ALTER TABLE `contributors` DISABLE KEYS */;
/*!40000 ALTER TABLE `contributors` ENABLE KEYS */;

-- Dumping structure for table project_350.document
CREATE TABLE IF NOT EXISTS `document` (
  `docName` varchar(500) NOT NULL,
  `cntUser` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `docID` varchar(50) NOT NULL,
  `comments` varchar(5000) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`docID`),
  KEY `cntUser` (`cntUser`),
  CONSTRAINT `FK_documaent_contributors` FOREIGN KEY (`cntUser`) REFERENCES `contributors` (`cnt_username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table project_350.document: ~0 rows (approximately)
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
/*!40000 ALTER TABLE `document` ENABLE KEYS */;

-- Dumping structure for table project_350.users
CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_pass` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table project_350.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
