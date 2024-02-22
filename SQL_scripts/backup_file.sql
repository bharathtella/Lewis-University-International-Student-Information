-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: Lewis
-- ------------------------------------------------------
-- Server version	10.4.27-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `courseinfo`
--

DROP TABLE IF EXISTS `courseinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseinfo` (
  `CourseId` char(10) NOT NULL,
  `CourseName` varchar(32) NOT NULL,
  `CreditHours` int(11) NOT NULL,
  `CourseDescription` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`CourseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseinfo`
--

LOCK TABLES `courseinfo` WRITE;
/*!40000 ALTER TABLE `courseinfo` DISABLE KEYS */;
INSERT INTO `courseinfo` VALUES ('CPSC-50100','Programming Fundamentals',3,'This course teaches the fundamentals of object-oriented programming, algorithm development, and software development skills such'),('CPSC-50900','Database Systems',3,'This course provides a comprehensive coverage of relational databases and DBMS, including database design using ERDs and normali'),('DATA-51100','Statistical Programming',3,'In this course, students will learn programming structures and algorithms for large-scale statistical data processing and visual');
/*!40000 ALTER TABLE `courseinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseregistrationinfo`
--

DROP TABLE IF EXISTS `courseregistrationinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseregistrationinfo` (
  `RegistrationId` char(4) NOT NULL,
  `StudentId` char(4) NOT NULL,
  `CourseId` char(10) NOT NULL,
  `Grade` char(1) DEFAULT NULL,
  PRIMARY KEY (`RegistrationId`),
  KEY `CourseRegistrationInfo_CourseInfo` (`CourseId`),
  KEY `CourseRegistrationInfo_Student_Info` (`StudentId`),
  CONSTRAINT `CourseRegistrationInfo_CourseInfo` FOREIGN KEY (`CourseId`) REFERENCES `courseinfo` (`CourseId`),
  CONSTRAINT `CourseRegistrationInfo_Student_Info` FOREIGN KEY (`StudentId`) REFERENCES `studentinfo` (`StudentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseregistrationinfo`
--

LOCK TABLES `courseregistrationinfo` WRITE;
/*!40000 ALTER TABLE `courseregistrationinfo` DISABLE KEYS */;
INSERT INTO `courseregistrationinfo` VALUES ('R101','L101','CPSC-50100','A'),('R102','L102','CPSC-50900','B'),('R104','L102','CPSC-50900','C'),('R105','L103','CPSC-50900',NULL);
/*!40000 ALTER TABLE `courseregistrationinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coursescheduleinfo`
--

DROP TABLE IF EXISTS `coursescheduleinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coursescheduleinfo` (
  `CRNId` int(11) NOT NULL AUTO_INCREMENT,
  `Day` varchar(9) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `ClassTime` varchar(20) NOT NULL,
  `Location` varchar(20) NOT NULL,
  `Instructor` varchar(40) NOT NULL,
  `CourseId` char(10) NOT NULL,
  PRIMARY KEY (`CRNId`),
  KEY `CourseScheduleInfo_CourseInfo` (`CourseId`),
  CONSTRAINT `CourseScheduleInfo_CourseInfo` FOREIGN KEY (`CourseId`) REFERENCES `courseinfo` (`CourseId`)
) ENGINE=InnoDB AUTO_INCREMENT=12005 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursescheduleinfo`
--

LOCK TABLES `coursescheduleinfo` WRITE;
/*!40000 ALTER TABLE `coursescheduleinfo` DISABLE KEYS */;
INSERT INTO `coursescheduleinfo` VALUES (12000,'Tuesday','2022-03-14','2022-05-06','6:00pm - 8:00pm','Romeoville','Raymond Klump','CPSC-50900'),(12001,'Wednesday','2022-03-15','2022-05-06','6:00pm - 8:00pm','Romeoville','Young June Kim','CPSC-50100'),(12002,'Monday','2022-03-13','2022-05-06','6:00pm - 8:00pm','Romeoville','Osama Y Abuomar','DATA-51100'),(12003,'Tuesday','2022-03-14','2022-05-06','6:00pm - 8:00pm','Online','Raymond Klump','CPSC-50900'),(12004,'Monday','2022-03-13','2022-05-06','6:00pm - 8:00pm','Online','Osama Y Abuomar','DATA-51100');
/*!40000 ALTER TABLE `coursescheduleinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `housinginfo`
--

DROP TABLE IF EXISTS `housinginfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `housinginfo` (
  `AddressId` char(4) NOT NULL,
  `FlatNo` int(11) NOT NULL,
  `AptNo` int(11) DEFAULT NULL,
  `AptType` varchar(10) DEFAULT NULL,
  `Street` varchar(40) NOT NULL,
  `Zipcode` int(11) NOT NULL,
  `City` varchar(40) NOT NULL,
  PRIMARY KEY (`AddressId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housinginfo`
--

LOCK TABLES `housinginfo` WRITE;
/*!40000 ALTER TABLE `housinginfo` DISABLE KEYS */;
INSERT INTO `housinginfo` VALUES ('A101',151,203,'2BHK','Highpoint',60446,'Romeoville'),('A102',71,NULL,'3BHK','Sonoma',60446,'Romeoville'),('A103',4107,NULL,NULL,'Chinaberry',60564,'Naperville'),('A104',171,205,'2BHK','Highpoint',60446,'Romeoville');
/*!40000 ALTER TABLE `housinginfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurancedetails`
--

DROP TABLE IF EXISTS `insurancedetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insurancedetails` (
  `InsuranceId` char(4) NOT NULL,
  `Provider` varchar(32) NOT NULL,
  `StartDate` date NOT NULL,
  `ExpiryDate` date NOT NULL,
  `MaxBenefit` int(11) NOT NULL,
  `StudentId` char(4) NOT NULL,
  PRIMARY KEY (`InsuranceId`),
  KEY `InsuranceDetails_Student_Info` (`StudentId`),
  CONSTRAINT `InsuranceDetails_Student_Info` FOREIGN KEY (`StudentId`) REFERENCES `studentinfo` (`StudentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurancedetails`
--

LOCK TABLES `insurancedetails` WRITE;
/*!40000 ALTER TABLE `insurancedetails` DISABLE KEYS */;
INSERT INTO `insurancedetails` VALUES ('I101','Lewer mark','2023-01-09','2023-05-02',6000,'L101'),('I102','Aetna','2023-01-10','2023-05-03',6100,'L102'),('I103','Lewer mark','2023-01-09','2023-05-02',6000,'L104');
/*!40000 ALTER TABLE `insurancedetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentinfo`
--

DROP TABLE IF EXISTS `studentinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentinfo` (
  `StudentId` char(4) NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Gender` char(1) NOT NULL CHECK (`Gender` in ('M','F')),
  `Major` varchar(20) NOT NULL,
  `ContactNo` char(12) NOT NULL,
  `EmergencyContact` char(12) NOT NULL,
  `LinkedInId` varchar(32) DEFAULT NULL,
  `AddressId` char(4) NOT NULL,
  `VendorId` char(4) DEFAULT NULL,
  PRIMARY KEY (`StudentId`),
  KEY `Student_Info_HousingInfo` (`AddressId`),
  KEY `Student_Info_VehicleVendors` (`VendorId`),
  CONSTRAINT `Student_Info_HousingInfo` FOREIGN KEY (`AddressId`) REFERENCES `housinginfo` (`AddressId`),
  CONSTRAINT `Student_Info_VehicleVendors` FOREIGN KEY (`VendorId`) REFERENCES `vehiclevendors` (`VendorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentinfo`
--

LOCK TABLES `studentinfo` WRITE;
/*!40000 ALTER TABLE `studentinfo` DISABLE KEYS */;
INSERT INTO `studentinfo` VALUES ('L101','Bharath Kumar','Tella','M','Data Science','779-206-6727','331-246-6646','bharath_tella','A101','V101'),('L102','VidhyaSagar','Janga','M','Data Science','331-246-6646','779-206-6727','vidhyasagar_janga','A101','V102'),('L103','Sai','Teja','M','Business Analytics','779-233-6980','900-029-9432','sai_teja','A104','V103'),('L104','Karthik','Amanaganti','M','Computer Science','331-246-6500','812-152-2151',NULL,'A101',NULL);
/*!40000 ALTER TABLE `studentinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiclevendors`
--

DROP TABLE IF EXISTS `vehiclevendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiclevendors` (
  `VendorId` char(4) NOT NULL,
  `VendorName` varchar(32) NOT NULL,
  `Contact` varchar(12) NOT NULL,
  `Email` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`VendorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiclevendors`
--

LOCK TABLES `vehiclevendors` WRITE;
/*!40000 ALTER TABLE `vehiclevendors` DISABLE KEYS */;
INSERT INTO `vehiclevendors` VALUES ('V101','Harris','682-433-2634','harris12@gmail.com'),('V102','Delta Cars LLC','630-706-1593','car.delta@yahoo.com'),('V103','Walter Auto','774-523-8843',NULL),('V104','Smart Cars Inc.','789-456-1230','info@smartcars.com'),('V105','Eco Auto','657-890-4321','sales@ecoauto.com'),('V106','Mega Motors','321-654-0987','megamotors@gmail.com'),('V107','Smart Cars Inc.','789-456-1230','info@smartcars.com');
/*!40000 ALTER TABLE `vehiclevendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workingdetails`
--

DROP TABLE IF EXISTS `workingdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workingdetails` (
  `WorkId` char(4) NOT NULL,
  `JobType` varchar(20) NOT NULL,
  `Employer` varchar(20) NOT NULL,
  `Jobtitle` varchar(32) NOT NULL,
  `SalaryPerHr` int(11) NOT NULL,
  `StudentId` char(4) NOT NULL,
  PRIMARY KEY (`WorkId`),
  KEY `WorkingDetails_Student_Info` (`StudentId`),
  CONSTRAINT `WorkingDetails_Student_Info` FOREIGN KEY (`StudentId`) REFERENCES `studentinfo` (`StudentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workingdetails`
--

LOCK TABLES `workingdetails` WRITE;
/*!40000 ALTER TABLE `workingdetails` DISABLE KEYS */;
INSERT INTO `workingdetails` VALUES ('W101','On campus','Sodexo','Food service worker',12,'L101'),('W102','On campus','Sodexo','Food service worker',12,'L103'),('W103','CPT','Dayton','Software Developer Intern',34,'L104');
/*!40000 ALTER TABLE `workingdetails` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-24 21:12:24
