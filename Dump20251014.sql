CREATE DATABASE  IF NOT EXISTS `iot_camila_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `iot_camila_db`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: iot_camila_db
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `production_logs`
--

DROP TABLE IF EXISTS `production_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `production_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` varchar(100) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `details` varchar(500) DEFAULT NULL,
  `timestamp` datetime DEFAULT (now()),
  PRIMARY KEY (`id`),
  KEY `ix_production_logs_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_logs`
--

LOCK TABLES `production_logs` WRITE;
/*!40000 ALTER TABLE `production_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `production_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensor_data`
--

DROP TABLE IF EXISTS `sensor_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sensor_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `topic` varchar(255) DEFAULT NULL,
  `value` float DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `timestamp` datetime DEFAULT (now()),
  PRIMARY KEY (`id`),
  KEY `ix_sensor_data_topic` (`topic`),
  KEY `ix_sensor_data_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensor_data`
--

LOCK TABLES `sensor_data` WRITE;
/*!40000 ALTER TABLE `sensor_data` DISABLE KEYS */;
INSERT INTO `sensor_data` VALUES (1,'smart40n1/umidade',63,'%','2025-10-14 09:01:39'),(2,'smart40n1/umidade',62,'%','2025-10-14 09:02:15'),(3,'smart40n1/umidade',63,'%','2025-10-14 09:02:19'),(4,'smart40n1/umidade',62,'%','2025-10-14 09:02:25'),(5,'smart40n1/temperatura',26,'°C','2025-10-14 09:03:22'),(6,'smart40n1/umidade',61,'%','2025-10-14 09:03:31'),(7,'smart40n1/umidade',60,'%','2025-10-14 09:04:07'),(8,'smart40n1/umidade',59,'%','2025-10-14 09:04:37'),(9,'smart40n1/temperatura',52,'°C','2025-10-14 09:05:10'),(10,'smart40n1/umidade',118,'%','2025-10-14 09:05:10'),(11,'smart40n1/temperatura',26,'°C','2025-10-14 09:05:13'),(12,'smart40n1/umidade',59,'%','2025-10-14 09:05:13'),(13,'smart40n1/umidade',60,'%','2025-10-14 09:05:22'),(14,'smart40n1/umidade',64,'%','2025-10-14 09:09:44'),(15,'smart40n1/umidade',65,'%','2025-10-14 09:11:26'),(16,'smart40n1/umidade',66,'%','2025-10-14 09:12:38'),(17,'smart40n1/umidade',65,'%','2025-10-14 09:13:32'),(18,'smart40n1/umidade',64,'%','2025-10-14 09:14:09'),(19,'smart40n1/umidade',63,'%','2025-10-14 09:14:50'),(20,'smart40n1/umidade',62,'%','2025-10-14 09:15:23'),(21,'smart40n1/umidade',61,'%','2025-10-14 09:16:00'),(22,'smart40n1/temperatura',52,'°C','2025-10-14 09:16:36'),(23,'smart40n1/umidade',122,'%','2025-10-14 09:16:36'),(24,'smart40n1/temperatura',26,'°C','2025-10-14 09:16:45'),(25,'smart40n1/umidade',61,'%','2025-10-14 09:16:45'),(26,'smart40n1/temperatura',52,'°C','2025-10-14 09:16:51'),(27,'smart40n1/umidade',120,'%','2025-10-14 09:16:51'),(28,'smart40n1/temperatura',26,'°C','2025-10-14 09:17:03'),(29,'smart40n1/umidade',60,'%','2025-10-14 09:17:03'),(30,'smart40n1/umidade',59,'%','2025-10-14 09:17:30'),(31,'smart40n1/umidade',58,'%','2025-10-14 09:18:12'),(32,'smart40n1/umidade',59,'%','2025-10-14 09:19:06'),(33,'smart40n1/umidade',60,'%','2025-10-14 09:20:06'),(34,'smart40n1/umidade',61,'%','2025-10-14 09:20:57'),(35,'smart40n1/umidade',62,'%','2025-10-14 09:21:43'),(36,'smart40n1/umidade',63,'%','2025-10-14 09:22:46'),(37,'smart40n1/umidade',64,'%','2025-10-14 09:23:49'),(38,'smart40n1/umidade',65,'%','2025-10-14 09:24:43'),(39,'smart40n1/umidade',64,'%','2025-10-14 09:25:43'),(40,'smart40n1/umidade',63,'%','2025-10-14 09:26:10'),(41,'smart40n1/umidade',62,'%','2025-10-14 09:27:04'),(42,'smart40n1/umidade',61,'%','2025-10-14 09:28:08'),(43,'smart40n1/temperatura',25,'°C','2025-10-14 09:28:38'),(44,'smart40n1/umidade',60,'%','2025-10-14 09:28:59'),(45,'smart40n1/umidade',61,'%','2025-10-14 09:29:08'),(46,'smart40n1/temperatura',26,'°C','2025-10-14 09:29:14'),(47,'smart40n1/umidade',60,'%','2025-10-14 09:29:14'),(48,'smart40n1/umidade',59,'%','2025-10-14 09:29:50'),(49,'smart40n1/umidade',58,'%','2025-10-14 09:30:38'),(50,'smart40n1/umidade',59,'%','2025-10-14 09:31:38'),(51,'smart40n1/umidade',60,'%','2025-10-14 09:32:26'),(52,'smart40n1/umidade',61,'%','2025-10-14 09:33:24'),(53,'smart40n1/umidade',62,'%','2025-10-14 09:34:21'),(54,'smart40n1/umidade',63,'%','2025-10-14 09:35:30'),(55,'smart40n1/umidade',64,'%','2025-10-14 09:36:30'),(56,'smart40n1/umidade',63,'%','2025-10-14 09:39:06'),(57,'smart40n1/umidade',62,'%','2025-10-14 09:39:31'),(58,'smart40n1/umidade',61,'%','2025-10-14 09:40:28'),(59,'smart40n1/temperatura',25,'°C','2025-10-14 09:40:49'),(60,'smart40n1/umidade',60,'%','2025-10-14 09:41:04'),(61,'smart40n1/umidade',59,'%','2025-10-14 09:41:52'),(62,'smart40n1/umidade',60,'%','2025-10-14 09:42:01'),(63,'smart40n1/umidade',59,'%','2025-10-14 09:42:16'),(64,'smart40n1/umidade',58,'%','2025-10-14 10:03:21'),(65,'smart40n1/umidade',56,'%','2025-10-14 10:03:43'),(66,'smart40n1/umidade',55,'%','2025-10-14 10:04:25'),(67,'smart40n1/umidade',56,'%','2025-10-14 10:04:37'),(68,'smart40n1/umidade',57,'%','2025-10-14 10:05:14'),(69,'smart40n1/umidade',58,'%','2025-10-14 10:05:56'),(70,'smart40n1/umidade',57,'%','2025-10-14 10:05:59'),(71,'smart40n1/umidade',58,'%','2025-10-14 10:06:02'),(72,'smart40n1/umidade',59,'%','2025-10-14 10:07:05'),(73,'smart40n1/umidade',60,'%','2025-10-14 10:08:02'),(74,'smart40n1/umidade',61,'%','2025-10-14 10:09:11'),(75,'smart40n1/umidade',62,'%','2025-10-14 10:10:47'),(76,'smart40n1/umidade',61,'%','2025-10-14 10:10:50'),(77,'smart40n1/umidade',62,'%','2025-10-14 10:10:53'),(78,'smart40n1/umidade',61,'%','2025-10-14 10:13:36'),(79,'smart40n1/umidade',60,'%','2025-10-14 10:14:18'),(80,'smart40n1/umidade',59,'%','2025-10-14 10:14:48'),(81,'smart40n1/umidade',58,'%','2025-10-14 10:15:36'),(82,'smart40n1/umidade',57,'%','2025-10-14 10:17:00'),(83,'smart40n1/umidade',56,'%','2025-10-14 10:17:46'),(84,'smart40n1/umidade',55,'%','2025-10-14 10:18:16'),(85,'smart40n1/umidade',56,'%','2025-10-14 10:18:46'),(86,'smart40n1/umidade',57,'%','2025-10-14 10:19:31'),(87,'smart40n1/umidade',58,'%','2025-10-14 10:20:10'),(88,'smart40n1/umidade',59,'%','2025-10-14 10:20:52'),(89,'smart40n1/umidade',60,'%','2025-10-14 10:21:49'),(90,'smart40n1/umidade',61,'%','2025-10-14 10:23:23'),(91,'smart40n1/umidade',62,'%','2025-10-14 10:24:32'),(92,'smart40n1/umidade',61,'%','2025-10-14 10:27:02'),(93,'smart40n1/umidade',60,'%','2025-10-14 10:27:41'),(94,'smart40n1/umidade',59,'%','2025-10-14 10:28:09'),(95,'smart40n1/umidade',58,'%','2025-10-14 10:28:57'),(96,'smart40n1/umidade',57,'%','2025-10-14 10:29:48'),(97,'smart40n1/umidade',56,'%','2025-10-14 10:30:21'),(98,'smart40n1/temperatura',52,'°C','2025-10-14 10:31:12'),(99,'smart40n1/umidade',110,'%','2025-10-14 10:31:12'),(100,'smart40n1/temperatura',26,'°C','2025-10-14 10:31:15'),(101,'smart40n1/umidade',55,'%','2025-10-14 10:31:15'),(102,'smart40n1/umidade',56,'%','2025-10-14 10:31:18'),(103,'smart40n1/umidade',55,'%','2025-10-14 10:31:27'),(104,'smart40n1/umidade',56,'%','2025-10-14 10:32:09'),(105,'smart40n1/umidade',57,'%','2025-10-14 10:32:54'),(106,'smart40n1/umidade',58,'%','2025-10-14 10:33:45'),(107,'smart40n1/umidade',59,'%','2025-10-14 10:34:18'),(108,'smart40n1/umidade',60,'%','2025-10-14 10:35:00'),(109,'smart40n1/umidade',61,'%','2025-10-14 10:36:19'),(110,'smart40n1/umidade',62,'%','2025-10-14 10:39:04'),(111,'smart40n1/umidade',61,'%','2025-10-14 10:39:43'),(112,'smart40n1/umidade',60,'%','2025-10-14 10:40:13'),(113,'smart40n1/umidade',59,'%','2025-10-14 10:41:13'),(114,'smart40n1/umidade',58,'%','2025-10-14 10:42:22'),(115,'smart40n1/umidade',57,'%','2025-10-14 10:43:14'),(116,'smart40n1/umidade',56,'%','2025-10-14 10:43:56'),(117,'smart40n1/umidade',55,'%','2025-10-14 10:44:26'),(118,'smart40n1/umidade',56,'%','2025-10-14 10:45:08'),(119,'smart40n1/umidade',57,'%','2025-10-14 10:45:53'),(120,'smart40n1/umidade',58,'%','2025-10-14 10:46:50'),(121,'smart40n1/umidade',59,'%','2025-10-14 10:47:44'),(122,'smart40n1/umidade',60,'%','2025-10-14 10:48:50'),(123,'smart40n1/umidade',61,'%','2025-10-14 10:50:54'),(124,'smart40n1/umidade',60,'%','2025-10-14 10:54:06'),(125,'smart40n1/umidade',59,'%','2025-10-14 10:54:30'),(126,'smart40n1/umidade',58,'%','2025-10-14 10:55:10'),(127,'smart40n1/umidade',57,'%','2025-10-14 10:55:46'),(128,'smart40n1/umidade',56,'%','2025-10-14 10:56:21'),(129,'smart40n1/umidade',55,'%','2025-10-14 10:58:04'),(130,'smart40n1/umidade',56,'%','2025-10-14 10:58:34'),(131,'smart40n1/umidade',57,'%','2025-10-14 10:59:13');
/*!40000 ALTER TABLE `sensor_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-14 10:59:52
