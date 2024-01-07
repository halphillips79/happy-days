-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: happydays
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add characters',7,'add_characters'),(26,'Can change characters',7,'change_characters'),(27,'Can delete characters',7,'delete_characters'),(28,'Can view characters',7,'view_characters'),(29,'Can add episodes',8,'add_episodes'),(30,'Can change episodes',8,'change_episodes'),(31,'Can delete episodes',8,'delete_episodes'),(32,'Can view episodes',8,'view_episodes'),(33,'Can add scenes',9,'add_scenes'),(34,'Can change scenes',9,'change_scenes'),(35,'Can delete scenes',9,'delete_scenes'),(36,'Can view scenes',9,'view_scenes'),(37,'Can add character_ scene',10,'add_character_scene'),(38,'Can change character_ scene',10,'change_character_scene'),(39,'Can delete character_ scene',10,'delete_character_scene'),(40,'Can view character_ scene',10,'view_character_scene');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_scene`
--

DROP TABLE IF EXISTS `character_scene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_scene` (
  `id` int NOT NULL,
  `scene_id` int DEFAULT NULL,
  `character_id` int DEFAULT NULL,
  `regular` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_scene`
--

LOCK TABLES `character_scene` WRITE;
/*!40000 ALTER TABLE `character_scene` DISABLE KEYS */;
INSERT INTO `character_scene` VALUES (1,1,1,'Y'),(2,1,2,'Y'),(3,1,3,'Y'),(4,1,4,'N'),(5,1,6,'N'),(6,2,1,'Y'),(7,2,5,'Y'),(8,2,7,'N'),(9,2,8,'N'),(10,3,1,'Y'),(11,3,5,'Y'),(12,3,7,'N'),(13,3,8,'N'),(14,3,9,'N'),(15,4,1,'Y'),(16,4,2,'Y'),(17,4,3,'Y'),(18,4,4,'N'),(19,4,5,'Y'),(20,5,2,'Y'),(21,5,7,'N'),(22,5,8,'N'),(23,6,1,'Y'),(24,6,2,'Y'),(25,6,5,'Y'),(26,6,9,'N'),(27,7,1,'Y'),(28,7,5,'Y'),(29,7,7,'N'),(30,7,8,'N'),(31,7,10,'N'),(32,8,2,'Y'),(33,8,6,'N'),(34,9,1,'Y'),(35,9,2,'Y'),(36,9,3,'Y'),(37,9,4,'N'),(38,10,1,'Y'),(39,10,5,'Y'),(40,10,8,'N'),(41,10,11,'N'),(42,11,1,'Y'),(43,11,5,'Y'),(44,11,7,'N'),(45,12,1,'Y'),(46,12,2,'Y'),(47,12,3,'Y'),(48,12,4,'N'),(49,13,1,'Y'),(50,13,2,'Y'),(51,13,15,'N'),(52,14,1,'Y'),(53,14,8,'N'),(54,14,9,'N'),(55,15,1,'Y'),(56,15,7,'N'),(57,15,8,'N'),(58,15,10,'N'),(59,16,1,'Y'),(60,16,4,'N'),(61,16,5,'Y'),(62,16,6,'N'),(63,17,1,'Y'),(64,17,2,'Y'),(65,17,3,'Y'),(66,17,4,'N'),(67,17,5,'Y'),(68,18,1,'Y'),(69,18,2,'Y'),(70,18,5,'Y'),(71,18,7,'N'),(72,18,8,'N'),(73,19,1,'Y'),(74,19,5,'Y'),(75,19,7,'N'),(76,19,8,'N'),(77,19,11,'N'),(78,20,1,'Y'),(79,20,5,'Y'),(80,20,7,'N'),(81,20,12,'N'),(82,21,1,'Y'),(83,21,5,'Y'),(84,21,10,'N'),(85,21,12,'N'),(86,22,7,'N'),(87,22,10,'N'),(88,23,1,'Y'),(89,23,2,'Y'),(90,23,3,'Y'),(91,23,4,'N'),(92,23,6,'N'),(93,24,1,'Y'),(94,24,2,'Y'),(95,24,3,'Y'),(96,24,4,'N'),(97,24,5,'Y'),(98,25,1,'Y'),(99,25,5,'Y'),(100,25,7,'N'),(101,25,8,'N'),(102,25,9,'N'),(103,25,13,'N'),(104,26,1,'Y'),(105,26,2,'Y'),(106,26,3,'Y'),(107,26,4,'N'),(108,26,7,'N'),(109,27,1,'Y'),(110,27,5,'Y'),(111,27,8,'N'),(112,27,10,'N'),(113,28,1,'Y'),(114,28,2,'Y'),(115,28,3,'Y'),(116,28,4,'N'),(117,28,5,'Y'),(118,28,7,'N'),(119,29,1,'Y'),(120,29,2,'Y'),(121,29,3,'Y'),(122,29,4,'N'),(123,29,6,'N'),(124,30,1,'Y'),(125,30,5,'Y'),(126,30,8,'N'),(127,30,9,'N'),(128,30,13,'N'),(129,31,1,'Y'),(130,31,2,'Y'),(131,31,3,'Y'),(132,31,4,'N'),(133,32,1,'Y'),(134,32,2,'Y'),(135,32,3,'Y'),(136,32,5,'Y'),(137,32,7,'N'),(138,32,8,'N'),(139,33,1,'Y'),(140,33,5,'Y'),(141,33,7,'N'),(142,33,8,'N'),(143,33,12,'N'),(144,34,1,'Y'),(145,34,2,'Y'),(146,34,3,'Y'),(147,34,4,'N'),(148,34,5,'Y'),(149,35,1,'Y'),(150,35,2,'Y'),(151,35,3,'Y'),(152,35,4,'N'),(153,35,6,'N'),(154,36,1,'Y'),(155,36,10,'N'),(156,37,1,'Y'),(157,37,5,'Y'),(158,37,8,'N'),(159,37,11,'N'),(160,38,1,'Y'),(161,38,2,'Y'),(162,38,3,'Y'),(163,38,4,'N'),(164,39,1,'Y'),(165,39,5,'Y'),(166,39,7,'N'),(167,39,8,'N'),(168,40,2,'Y'),(169,40,3,'Y'),(170,40,14,'N'),(171,41,1,'Y'),(172,41,3,'Y'),(173,41,5,'Y'),(174,41,7,'N'),(175,41,8,'N'),(176,42,1,'Y'),(177,42,2,'Y'),(178,42,3,'Y'),(179,42,5,'Y'),(180,43,1,'Y'),(181,43,2,'Y'),(182,43,3,'Y'),(183,43,4,'N'),(184,44,1,'Y'),(185,44,2,'Y'),(186,44,5,'Y'),(187,44,8,'N'),(188,45,1,'Y'),(189,45,5,'Y'),(190,45,8,'N'),(191,46,1,'Y'),(192,46,7,'N'),(193,47,1,'Y'),(194,47,2,'Y'),(195,47,3,'Y'),(196,47,4,'N'),(197,48,5,'Y'),(198,48,8,'N'),(199,48,10,'N'),(200,49,1,'Y'),(201,49,2,'Y'),(202,49,3,'Y'),(203,49,4,'N'),(204,50,1,'Y'),(205,50,7,'N'),(206,51,1,'Y'),(207,51,5,'Y'),(208,51,8,'N'),(209,51,10,'N'),(210,52,1,'Y'),(211,52,2,'Y'),(212,52,3,'Y'),(213,52,5,'Y'),(214,53,1,'Y'),(215,53,5,'Y'),(216,53,7,'N'),(217,53,8,'N'),(218,54,1,'Y'),(219,54,2,'Y'),(220,54,3,'Y'),(221,54,4,'N'),(222,55,1,'Y'),(223,55,2,'Y'),(224,55,3,'Y'),(225,55,4,'N'),(226,55,5,'Y'),(227,55,7,'N'),(228,55,8,'N'),(229,56,1,'Y'),(230,56,7,'N'),(231,56,8,'N'),(232,56,10,'N'),(233,56,13,'N'),(234,57,1,'Y'),(235,57,3,'Y'),(236,57,15,'N'),(237,58,1,'Y'),(238,58,2,'Y'),(239,58,15,'N'),(240,59,1,'Y'),(241,59,2,'Y'),(242,59,3,'Y'),(243,59,4,'N'),(244,59,6,'N'),(245,60,1,'Y'),(246,60,5,'Y'),(247,60,8,'Y'),(248,60,10,'N'),(249,61,1,'Y'),(250,61,5,'Y'),(251,61,6,'N'),(252,61,7,'Y'),(253,61,8,'Y'),(254,61,9,'N'),(255,61,15,'N'),(256,62,1,'Y'),(257,62,16,'N'),(258,63,1,'Y'),(259,63,2,'Y'),(260,63,15,'N'),(261,64,1,'Y'),(262,64,2,'Y'),(263,64,3,'Y'),(264,64,4,'N'),(265,64,7,'Y'),(266,65,1,'Y'),(267,65,5,'Y'),(268,65,7,'Y'),(269,65,8,'Y'),(270,66,1,'Y'),(271,66,17,'N'),(272,67,1,'Y'),(273,67,5,'Y'),(274,67,7,'Y'),(275,67,8,'Y'),(276,67,18,'N'),(277,68,1,'Y'),(278,68,2,'Y'),(279,68,3,'Y'),(280,68,4,'N'),(281,69,1,'Y'),(282,69,5,'Y'),(283,69,8,'Y'),(284,69,17,'N'),(285,70,1,'Y'),(286,70,7,'Y'),(287,70,16,'N'),(288,71,1,'Y'),(289,71,2,'Y'),(290,71,3,'Y'),(291,71,4,'N'),(292,72,2,'Y'),(293,72,3,'Y'),(294,72,5,'Y'),(295,72,7,'Y'),(296,72,8,'Y'),(297,73,1,'Y'),(298,73,2,'Y'),(299,73,3,'Y'),(300,73,4,'N'),(301,74,1,'Y'),(302,74,7,'Y'),(303,74,8,'Y'),(304,74,16,'N');
/*!40000 ALTER TABLE `character_scene` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characters` (
  `id` int NOT NULL,
  `name` text,
  `gender` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (1,'Richie Cunningham','M'),(2,'Howard Cunningham','M'),(3,'Marion Cunningham','F'),(4,'Joanie Cunningham','F'),(5,'Potsie Weber','M'),(6,'Chuck Cunningham','M'),(7,'Arthur \"Fonzie\" Fonzarelli','M'),(8,'Ralph Malph','M'),(9,'Trudy','F'),(10,'Marsha Simms','F'),(11,'Moose','M'),(12,'Bag Zombroski','M'),(13,'Sandy','F'),(14,'Harry Malph','M'),(15,'Gloria','F'),(16,'Wendy','F'),(17,'Carole','F'),(18,'Arlene','F');
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(10,'happydaysapp','character_scene'),(7,'happydaysapp','characters'),(8,'happydaysapp','episodes'),(9,'happydaysapp','scenes'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-09-06 17:37:02.484646'),(2,'auth','0001_initial','2023-09-06 17:37:02.834405'),(3,'admin','0001_initial','2023-09-06 17:37:02.943220'),(4,'admin','0002_logentry_remove_auto_add','2023-09-06 17:37:02.952482'),(5,'admin','0003_logentry_add_action_flag_choices','2023-09-06 17:37:02.959662'),(6,'contenttypes','0002_remove_content_type_name','2023-09-06 17:37:03.013999'),(7,'auth','0002_alter_permission_name_max_length','2023-09-06 17:37:03.102605'),(8,'auth','0003_alter_user_email_max_length','2023-09-06 17:37:03.153297'),(9,'auth','0004_alter_user_username_opts','2023-09-06 17:37:03.165118'),(10,'auth','0005_alter_user_last_login_null','2023-09-06 17:37:03.223403'),(11,'auth','0006_require_contenttypes_0002','2023-09-06 17:37:03.227006'),(12,'auth','0007_alter_validators_add_error_messages','2023-09-06 17:37:03.235414'),(13,'auth','0008_alter_user_username_max_length','2023-09-06 17:37:03.273759'),(14,'auth','0009_alter_user_last_name_max_length','2023-09-06 17:37:03.316802'),(15,'auth','0010_alter_group_name_max_length','2023-09-06 17:37:03.335498'),(16,'auth','0011_update_proxy_permissions','2023-09-06 17:37:03.344903'),(17,'auth','0012_alter_user_first_name_max_length','2023-09-06 17:37:03.383140'),(18,'happydaysapp','0001_initial','2023-09-06 17:37:03.525873'),(19,'sessions','0001_initial','2023-09-06 17:37:03.553315');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `episodes`
--

DROP TABLE IF EXISTS `episodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `episodes` (
  `id` int NOT NULL,
  `title` text,
  `series` text,
  `season` int DEFAULT NULL,
  `episode_number` int DEFAULT NULL,
  `airdate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episodes`
--

LOCK TABLES `episodes` WRITE;
/*!40000 ALTER TABLE `episodes` DISABLE KEYS */;
INSERT INTO `episodes` VALUES (1,'All the Way','Happy Days',1,1,'1974-01-15'),(2,'The Lemon','Happy Days',1,2,'1974-01-22'),(3,'Richie\'s Cup Runneth Over','Happy Days',1,3,'1974-01-29'),(4,'Guess Who\'s Coming to Visit?','Happy Days',1,4,'1974-02-05'),(5,'Hardware Jungle','Happy Days',1,5,'1974-02-12'),(6,'The Deadly Dares','Happy Days',1,6,'1974-02-19'),(7,'Fonzie Drops In','Happy Days',1,7,'1974-02-26'),(8,'The Skin Game','Happy Days',1,8,'1974-03-05'),(9,'Breaking Up is Hard to Do','Happy Days',1,9,'1974-03-12'),(10,'Give the Band a Hand','Happy Days',1,10,'1974-03-26'),(11,'Because She\'s There','Happy Days',1,11,'1974-04-02'),(12,'In the Name of Love','Happy Days',1,12,'1974-04-09'),(13,'Great Expectations','Happy Days',1,13,'1974-04-16'),(14,'The Best Man','Happy Days',1,14,'1974-04-23'),(15,'Knock Around the Block','Happy Days',1,15,'1974-04-30'),(16,'Be the First on Your Block','Happy Days',1,16,'1974-05-07'),(17,'Richie Moves Out','Happy Days',2,1,'1974-09-10'),(18,'Richie\'s Car','Happy Days',2,2,'1974-09-17'),(19,'Who\'s Sorry Now','Happy Days',2,3,'1974-09-24'),(20,'You Go to My Head','Happy Days',2,4,'1974-10-01'),(21,'R.O.T.C.','Happy Days',2,5,'1974-10-08');
/*!40000 ALTER TABLE `episodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `happydaysapp_character_scene`
--

DROP TABLE IF EXISTS `happydaysapp_character_scene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `happydaysapp_character_scene` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `regular` varchar(1) NOT NULL,
  `character_id` bigint NOT NULL,
  `scene_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `happydaysapp_charact_character_id_3b7a681c_fk_happydays` (`character_id`),
  KEY `happydaysapp_charact_scene_id_85f88193_fk_happydays` (`scene_id`),
  CONSTRAINT `happydaysapp_charact_character_id_3b7a681c_fk_happydays` FOREIGN KEY (`character_id`) REFERENCES `happydaysapp_characters` (`id`),
  CONSTRAINT `happydaysapp_charact_scene_id_85f88193_fk_happydays` FOREIGN KEY (`scene_id`) REFERENCES `happydaysapp_scenes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `happydaysapp_character_scene`
--

LOCK TABLES `happydaysapp_character_scene` WRITE;
/*!40000 ALTER TABLE `happydaysapp_character_scene` DISABLE KEYS */;
/*!40000 ALTER TABLE `happydaysapp_character_scene` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `happydaysapp_characters`
--

DROP TABLE IF EXISTS `happydaysapp_characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `happydaysapp_characters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `gender` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `happydaysapp_characters`
--

LOCK TABLES `happydaysapp_characters` WRITE;
/*!40000 ALTER TABLE `happydaysapp_characters` DISABLE KEYS */;
/*!40000 ALTER TABLE `happydaysapp_characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `happydaysapp_episodes`
--

DROP TABLE IF EXISTS `happydaysapp_episodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `happydaysapp_episodes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `series` varchar(255) NOT NULL,
  `season` int NOT NULL,
  `episode_number` int NOT NULL,
  `airdate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `happydaysapp_episodes`
--

LOCK TABLES `happydaysapp_episodes` WRITE;
/*!40000 ALTER TABLE `happydaysapp_episodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `happydaysapp_episodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `happydaysapp_scenes`
--

DROP TABLE IF EXISTS `happydaysapp_scenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `happydaysapp_scenes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `episode_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `happydaysapp_scenes_episode_id_ff263073_fk_happydays` (`episode_id`),
  CONSTRAINT `happydaysapp_scenes_episode_id_ff263073_fk_happydays` FOREIGN KEY (`episode_id`) REFERENCES `happydaysapp_episodes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `happydaysapp_scenes`
--

LOCK TABLES `happydaysapp_scenes` WRITE;
/*!40000 ALTER TABLE `happydaysapp_scenes` DISABLE KEYS */;
/*!40000 ALTER TABLE `happydaysapp_scenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scenes`
--

DROP TABLE IF EXISTS `scenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scenes` (
  `id` int NOT NULL,
  `episode_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scenes`
--

LOCK TABLES `scenes` WRITE;
/*!40000 ALTER TABLE `scenes` DISABLE KEYS */;
INSERT INTO `scenes` VALUES (1,1),(2,1),(3,2),(4,2),(5,2),(6,2),(7,3),(8,3),(9,3),(10,5),(11,5),(12,5),(13,5),(14,5),(15,4),(16,4),(17,4),(18,4),(19,4),(20,6),(21,6),(22,6),(23,6),(24,6),(25,7),(26,7),(27,8),(28,8),(29,8),(30,9),(31,9),(32,9),(33,10),(34,10),(35,10),(36,11),(37,11),(38,11),(39,11),(40,11),(41,12),(42,12),(43,12),(44,12),(45,13),(46,13),(47,13),(48,13),(49,14),(50,14),(51,15),(52,15),(53,15),(54,15),(55,16),(56,16),(57,17),(58,17),(59,17),(60,17),(61,17),(62,17),(63,18),(64,18),(65,18),(66,16),(67,19),(68,19),(69,20),(70,20),(71,20),(72,21),(73,21),(74,21);
/*!40000 ALTER TABLE `scenes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-30 18:34:10
