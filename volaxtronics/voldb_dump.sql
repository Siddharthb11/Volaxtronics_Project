-- MySQL dump 10.13  Distrib 8.1.0, for Win64 (x86_64)
--
-- Host: localhost    Database: volaxtronics
-- ------------------------------------------------------
-- Server version	8.1.0

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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add contact',7,'add_contact'),(26,'Can change contact',7,'change_contact'),(27,'Can delete contact',7,'delete_contact'),(28,'Can view contact',7,'view_contact'),(29,'Can add products',8,'add_products'),(30,'Can change products',8,'change_products'),(31,'Can delete products',8,'delete_products'),(32,'Can view products',8,'view_products'),(33,'Can add customer details',9,'add_customerdetails'),(34,'Can change customer details',9,'change_customerdetails'),(35,'Can delete customer details',9,'delete_customerdetails'),(36,'Can view customer details',9,'view_customerdetails'),(37,'Can add order',10,'add_order'),(38,'Can change order',10,'change_order'),(39,'Can delete order',10,'delete_order'),(40,'Can view order',10,'view_order'),(41,'Can add cart',11,'add_cart'),(42,'Can change cart',11,'change_cart'),(43,'Can delete cart',11,'delete_cart'),(44,'Can view cart',11,'view_cart');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$720000$Rb5Bch5yhbYGLksw0wmmjI$njuzU9Gu44wsxWfEIzsfJ4vKMsmByGsz4g20DG6axCw=','2024-09-21 10:11:05.691702',1,'Siddharth','','','bhoirsiddhart@gmail.com',1,1,'2024-09-21 10:10:37.858668'),(2,'pbkdf2_sha256$720000$kKbzceRCQ2499QrerKyoCn$71J4dQlcNNxl4c08Q0XYCvp1gH05HRkP2K8IkL2kgh8=','2024-09-21 10:19:55.549179',0,'Sam','','','',0,1,'2024-09-21 10:19:47.102698');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-09-21 10:13:27.099693','1','Acer Aspire 5 added successfully!',1,'[{\"added\": {}}]',8,1),(2,'2024-09-21 10:14:55.092437','2','Asus ROG Zephyrus G15 added successfully!',1,'[{\"added\": {}}]',8,1),(3,'2024-09-21 10:15:42.046382','3','Acer Washing Machine added successfully!',1,'[{\"added\": {}}]',8,1),(4,'2024-09-21 10:16:22.532715','4','Samsung Washing Machine added successfully!',1,'[{\"added\": {}}]',8,1),(5,'2024-09-21 10:17:07.696503','5','ROG Phone 7 added successfully!',1,'[{\"added\": {}}]',8,1),(6,'2024-09-21 10:17:47.937926','6','Galaxy S23 5G added successfully!',1,'[{\"added\": {}}]',8,1),(7,'2024-09-21 10:18:25.829340','7','Samsung 4k Android TV added successfully!',1,'[{\"added\": {}}]',8,1),(8,'2024-09-21 10:19:04.480493','8','Galaxy A50 added successfully!',1,'[{\"added\": {}}]',8,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(11,'products','cart'),(7,'products','contact'),(9,'products','customerdetails'),(10,'products','order'),(8,'products','products'),(6,'sessions','session');
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
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-09-21 10:07:21.063760'),(2,'auth','0001_initial','2024-09-21 10:07:21.919699'),(3,'admin','0001_initial','2024-09-21 10:07:22.099035'),(4,'admin','0002_logentry_remove_auto_add','2024-09-21 10:07:22.114674'),(5,'admin','0003_logentry_add_action_flag_choices','2024-09-21 10:07:22.131435'),(6,'contenttypes','0002_remove_content_type_name','2024-09-21 10:07:22.230105'),(7,'auth','0002_alter_permission_name_max_length','2024-09-21 10:07:22.327602'),(8,'auth','0003_alter_user_email_max_length','2024-09-21 10:07:22.373752'),(9,'auth','0004_alter_user_username_opts','2024-09-21 10:07:22.382515'),(10,'auth','0005_alter_user_last_login_null','2024-09-21 10:07:22.479895'),(11,'auth','0006_require_contenttypes_0002','2024-09-21 10:07:22.480169'),(12,'auth','0007_alter_validators_add_error_messages','2024-09-21 10:07:22.495198'),(13,'auth','0008_alter_user_username_max_length','2024-09-21 10:07:22.599912'),(14,'auth','0009_alter_user_last_name_max_length','2024-09-21 10:07:22.696628'),(15,'auth','0010_alter_group_name_max_length','2024-09-21 10:07:22.732266'),(16,'auth','0011_update_proxy_permissions','2024-09-21 10:07:22.746471'),(17,'auth','0012_alter_user_first_name_max_length','2024-09-21 10:07:22.836018'),(18,'products','0001_initial','2024-09-21 10:07:23.330375'),(19,'sessions','0001_initial','2024-09-21 10:07:23.364204');
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
-- Table structure for table `products_cart`
--

DROP TABLE IF EXISTS `products_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `uid` int NOT NULL,
  `pid` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_cart_uid_af6dc3e0_fk_auth_user_id` (`uid`),
  KEY `products_cart_pid_eda3f414_fk_products_products_id` (`pid`),
  CONSTRAINT `products_cart_pid_eda3f414_fk_products_products_id` FOREIGN KEY (`pid`) REFERENCES `products_products` (`id`),
  CONSTRAINT `products_cart_uid_af6dc3e0_fk_auth_user_id` FOREIGN KEY (`uid`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_cart`
--

LOCK TABLES `products_cart` WRITE;
/*!40000 ALTER TABLE `products_cart` DISABLE KEYS */;
INSERT INTO `products_cart` VALUES (1,1,1,2);
/*!40000 ALTER TABLE `products_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_contact`
--

DROP TABLE IF EXISTS `products_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_contact` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_contact`
--

LOCK TABLES `products_contact` WRITE;
/*!40000 ALTER TABLE `products_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_customerdetails`
--

DROP TABLE IF EXISTS `products_customerdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_customerdetails` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address_type` varchar(10) NOT NULL,
  `full_address` varchar(200) NOT NULL,
  `pincode` varchar(10) NOT NULL,
  `uid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_customerdetails_uid_4b5f1b04_fk_auth_user_id` (`uid`),
  CONSTRAINT `products_customerdetails_uid_4b5f1b04_fk_auth_user_id` FOREIGN KEY (`uid`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_customerdetails`
--

LOCK TABLES `products_customerdetails` WRITE;
/*!40000 ALTER TABLE `products_customerdetails` DISABLE KEYS */;
INSERT INTO `products_customerdetails` VALUES (1,'Sam','Jackson','9978989809','sam123@gmail.com','home','Street:  202, A, Suncrest Park, Babhola Chulna Road, Vasai (west)\r\nCity:   Mumbai                        \r\n                    ','400908',2);
/*!40000 ALTER TABLE `products_customerdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_order`
--

DROP TABLE IF EXISTS `products_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` varchar(50) NOT NULL,
  `quantity` int NOT NULL,
  `uid` int NOT NULL,
  `pid` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_order_uid_ecaabb57_fk_auth_user_id` (`uid`),
  KEY `products_order_pid_ee7408a0_fk_products_products_id` (`pid`),
  CONSTRAINT `products_order_pid_ee7408a0_fk_products_products_id` FOREIGN KEY (`pid`) REFERENCES `products_products` (`id`),
  CONSTRAINT `products_order_uid_ecaabb57_fk_auth_user_id` FOREIGN KEY (`uid`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_order`
--

LOCK TABLES `products_order` WRITE;
/*!40000 ALTER TABLE `products_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_products`
--

DROP TABLE IF EXISTS `products_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `price` double NOT NULL,
  `details` longtext NOT NULL,
  `brand` varchar(7) NOT NULL,
  `category` varchar(15) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `rating` double NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_products`
--

LOCK TABLES `products_products` WRITE;
/*!40000 ALTER TABLE `products_products` DISABLE KEYS */;
INSERT INTO `products_products` VALUES (1,'Acer Aspire 5',30000,'• 8GB RAM | 512GB SSD Storage \r\n• RTX1650 | 4GB Graphics \r\n• Everyday use laptop, with medium features for gaming','Acer','Laptops',1,3.9,'image/acer_lap.jpg'),(2,'Asus ROG Zephyrus G15',120000,'• 16GB RAM | 1TB SSD Storage\r\n • Windows 11 Pro\r\n • RTX 3080 | 8GB Graphics\r\n • AMD Ryzen 9 processor\r\n • Heavyweight Gaming Laptop','Asus','Laptops',1,4.9,'image/asus_lap_200.png'),(3,'Acer Washing Machine',25000,'• 9/5 kg Washer with Dryer Front Load Washer Dryer\r\n • Dryer with AI Direct Drive Technology\r\n • Wi-Fi Enabled, Steam removes allergen\r\n • Turbo Wash Ready to Wear Clothes with In-built Heater Black','Acer','Home Appliances',1,2.8,'image/acer_WM.jpg'),(4,'Samsung Washing Machine',43000,'• 8.0 kg in weight\r\n • Ecobubble™ Front Load Washing Machine\r\n • Machine with AI Control, Super Speed, Hygiene Steam\r\n • SmartThings Connectivity (WiFi)','Samsung','Home Appliances',1,4.2,'image/sam_WM.jpg'),(5,'ROG Phone 7',65000,'• 12 GB LPDDR5X RAM | STORAGE 256GB UFS4.0\r\n • 17.22cm(6.78\") FHD+ 2448x1080,165Hz\r\n • Qualcomm Snapdragon 8 Gen2, SM8550, Qcta-core CPUs,3.2 Ghz (5G)\r\n • Rear Cam-50MP + 13MP + 5MP, Front Cam- 32MP\r\n • Android™ 13 with Game Genie + ROG UI + Classic UI\r\n • Battery-6000 mAh','Asus','Mobiles',1,4.6,'image/asus_mob_200_.jpg'),(6,'Galaxy S23 5G',85000,'• 8 GB RAM | 128 GB ROM\r\n • 15.49 cm (6.1 inch) Full HD+ Display\r\n • 50MP + 10MP + 12MP | 12MP Front Camera\r\n • 3900 mAh Lithium Ion Battery\r\n • Qualcomm Snapdragon 8 Gen 2 Processor','Samsung','Mobiles',1,1.5,'image/sam_mobile.jpg'),(7,'Samsung 4k Android TV',16000,'• Display: 43-inch 4K Ultra HD (3840 x 2160 pixels) resolution\r\n • Operating System: Runs on Android TV with built-in Google Assistant\r\n • Smart Features: Features built-in Chromecast, voice control\r\n • Audio: Equipped with Dolby Audio','Samsung','TVs',1,1.6,'image/iFFalcon-TV.png'),(8,'Galaxy A50',9000,'• 4GB RAM | 64GB ROM\r\n • Android OS\r\n • 25MP and 8MP Cameras\r\n • AMOLED FHD Display\r\n • 4000 mAh Battery','Samsung','Mobiles',1,4.1,'image/samsung_mob.jpeg');
/*!40000 ALTER TABLE `products_products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-21 16:30:37
