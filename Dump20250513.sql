-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: hospitaldb
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS admin;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  idadmin int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  email varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (idadmin)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES admin WRITE;
/*!40000 ALTER TABLE admin DISABLE KEYS */;
INSERT INTO admin VALUES (7,'Namidu','2000','namidu@gmail.com','Develop');
/*!40000 ALTER TABLE admin ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS booking;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE booking (
  booking_id int NOT NULL AUTO_INCREMENT,
  doctor_id int NOT NULL,
  patient_id int NOT NULL,
  availability_id int NOT NULL,
  patient_name varchar(100) NOT NULL,
  NIC varchar(12) NOT NULL,
  address varchar(100) NOT NULL,
  contact varchar(100) NOT NULL,
  pay varchar(50) NOT NULL,
  appointment_date date NOT NULL,
  `status` enum('Pending','Confirmed','Cancelled') DEFAULT 'Pending',
  PRIMARY KEY (booking_id),
  KEY doctor_id (doctor_id),
  KEY patient_id (patient_id),
  KEY availability_id (availability_id),
  CONSTRAINT booking_ibfk_1 FOREIGN KEY (doctor_id) REFERENCES doctor (id),
  CONSTRAINT booking_ibfk_2 FOREIGN KEY (patient_id) REFERENCES customer (id),
  CONSTRAINT booking_ibfk_3 FOREIGN KEY (availability_id) REFERENCES doctor_availability (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES booking WRITE;
/*!40000 ALTER TABLE booking DISABLE KEYS */;
/*!40000 ALTER TABLE booking ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS customer;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE customer (
  id int NOT NULL AUTO_INCREMENT,
  email varchar(100) NOT NULL,
  `password` varchar(45) NOT NULL,
  address1 varchar(45) DEFAULT NULL,
  address2 varchar(45) DEFAULT NULL,
  city varchar(45) DEFAULT NULL,
  state varchar(45) DEFAULT NULL,
  zip varchar(45) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES customer WRITE;
/*!40000 ALTER TABLE customer DISABLE KEYS */;
/*!40000 ALTER TABLE customer ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS doctor;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE doctor (
  id int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  hospital varchar(45) DEFAULT NULL,
  speciality varchar(45) DEFAULT NULL,
  experience varchar(45) DEFAULT NULL,
  contact varchar(45) DEFAULT NULL,
  email varchar(45) DEFAULT NULL,
  country varchar(45) DEFAULT NULL,
  gender varchar(45) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES doctor WRITE;
/*!40000 ALTER TABLE doctor DISABLE KEYS */;
/*!40000 ALTER TABLE doctor ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_availability`
--

DROP TABLE IF EXISTS doctor_availability;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE doctor_availability (
  id int NOT NULL AUTO_INCREMENT,
  doctor_id int NOT NULL,
  day_of_week varchar(20) NOT NULL,
  start_time time NOT NULL,
  end_time time NOT NULL,
  location varchar(100) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY doctor_id (doctor_id),
  CONSTRAINT doctor_availability_ibfk_1 FOREIGN KEY (doctor_id) REFERENCES doctor (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_availability`
--

LOCK TABLES doctor_availability WRITE;
/*!40000 ALTER TABLE doctor_availability DISABLE KEYS */;
/*!40000 ALTER TABLE doctor_availability ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-13 11:40:16
