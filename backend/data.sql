-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: spring
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `audit`
--

DROP TABLE IF EXISTS `audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accessed_at` datetime(6) DEFAULT NULL,
  `bookname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `is_email_sent` bit(1) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit`
--

LOCK TABLES `audit` WRITE;
/*!40000 ALTER TABLE `audit` DISABLE KEYS */;
INSERT INTO `audit` VALUES (2,'2025-07-13 20:56:42.955218','Summer in the City','rammuthukumar33@gmail.com',_binary '','Carco'),(3,'2025-07-16 15:48:44.387141','Summer in the City','rammuthukumar33@gmail.com',_binary '','Carco'),(4,'2025-07-16 15:49:10.137512','Summer in the City','rammuthukumar33@gmail.com',_binary '','Carco'),(5,'2025-08-13 15:19:43.089941',NULL,'rammuthukumar33@gmail.com',_binary '','Carco'),(6,'2025-08-13 15:19:51.464079',NULL,'rammuthukumar33@gmail.com',_binary '','Carco'),(7,'2025-08-13 15:42:52.474660',NULL,'rammuthukumar33@gmail.com',_binary '','Carco'),(8,'2025-08-17 12:10:57.007891',NULL,'rammuthukumar33@gmail.com',_binary '','Carco'),(9,'2025-08-17 12:14:20.476489',NULL,'rammuthukumar33@gmail.com',_binary '','Carco');
/*!40000 ALTER TABLE `audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_availablity_request`
--

DROP TABLE IF EXISTS `book_availablity_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_availablity_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `book_name` varchar(255) DEFAULT NULL,
  `notified` bit(1) NOT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_availablity_request`
--

LOCK TABLES `book_availablity_request` WRITE;
/*!40000 ALTER TABLE `book_availablity_request` DISABLE KEYS */;
INSERT INTO `book_availablity_request` VALUES (1,'Onyx Storm',_binary '','rammuthukumar33@gmail.com','Carco'),(2,'Onyx Storm',_binary '','rammuthukumar33@gmail.com','Carco');
/*!40000 ALTER TABLE `book_availablity_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_category`
--

DROP TABLE IF EXISTS `book_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_category` (
  `book_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`book_id`,`category_id`),
  KEY `FKam8llderp40mvbbwceqpu6l2s` (`category_id`),
  CONSTRAINT `FK8f2kuva2lluw2g7cbn0540p46` FOREIGN KEY (`book_id`) REFERENCES `book_store` (`id`),
  CONSTRAINT `FKam8llderp40mvbbwceqpu6l2s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_category`
--

LOCK TABLES `book_category` WRITE;
/*!40000 ALTER TABLE `book_category` DISABLE KEYS */;
INSERT INTO `book_category` VALUES (58,20),(62,20),(59,21),(60,22),(64,22),(61,23),(62,24),(61,26),(65,28),(81,29),(68,31),(72,33),(79,34),(74,35),(80,36);
/*!40000 ALTER TABLE `book_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_store`
--

DROP TABLE IF EXISTS `book_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_store` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author_name` varchar(50) NOT NULL,
  `book_name` varchar(100) NOT NULL,
  `genre` varchar(50) NOT NULL,
  `language` varchar(50) DEFAULT NULL,
  `pages` int NOT NULL,
  `price` double NOT NULL,
  `published_date` date DEFAULT NULL,
  `stock` int NOT NULL,
  `year` int NOT NULL,
  `publisher_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfwmv3t7tykap693jyh7pk9vyd` (`publisher_id`),
  CONSTRAINT `FKfwmv3t7tykap693jyh7pk9vyd` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`id`),
  CONSTRAINT `book_store_chk_1` CHECK ((`pages` >= 1)),
  CONSTRAINT `book_store_chk_2` CHECK ((`price` >= 1)),
  CONSTRAINT `book_store_chk_3` CHECK ((`stock` >= 0)),
  CONSTRAINT `book_store_chk_4` CHECK ((`year` >= 1400))
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_store`
--

LOCK TABLES `book_store` WRITE;
/*!40000 ALTER TABLE `book_store` DISABLE KEYS */;
INSERT INTO `book_store` VALUES (58,'Rebecca Yarros','Onyx Storm','Fantasy','English',480,190,'2025-03-20',3,2025,47),(59,'Alex Aster','Summer in the City','Fiction','English',320,499,'2024-08-10',59,2024,48),(60,'Harlan Coben','Nobody\'s Fool','Thriller','English',350,599.5,'2025-01-15',42,2025,49),(61,'Gregory Maguire','Elphie','Fantasy','English',400,650,'2025-03-01',33,2025,50),(62,'John Sandford','Lethal Prey','Thriller','English',370,580.75,'2025-02-20',45,2025,51),(64,'Sarah Wynn-Williams','Careless People','Memoir','English',310,530,'2025-01-25',41,2025,53),(65,'John Green','Everything Is Tuberculosis','Memoir','English',280,460,'2025-02-02',37,2025,54),(68,'Freida McFadden','Ward D','Thriller','English',300,445,'2024-11-10',44,2024,57),(72,'Morgan Housel','The Psychology of Money','Non-Fiction','English',256,286,'2022-12-09',100,2020,60),(74,'Feliks Lofting','Pride and Prejudice','Drama|Mystery','English',177,1966,'2025-01-08',83,2023,62),(79,'Zachariah Kittiman','The Catcher in the Rye','Action|Thriller','English',245,1954,'2025-04-06',87,2020,61),(80,'Fred Pantridge','1984','Action|Comedy|Horror','English',276,1939,'2024-05-10',180,2019,63),(81,'Roberto Andrea','To Kill a Mockingbird','Documentary','English',167,1906,'2024-08-02',185,2017,64);
/*!40000 ALTER TABLE `book_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (20,'Fiction'),(21,'Thriller'),(22,'Historical Fiction'),(23,'Contemporary'),(24,'Romance'),(25,'Fantasy'),(26,'Humor'),(27,'Memoir'),(28,'Self-help'),(29,'Horror'),(30,'Romantic Comedy'),(31,'Fantasy Romance'),(33,'Money'),(34,'Adventure|Comedy|Romance'),(35,'Drama'),(36,'Action|Drama|War');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `total_price` double NOT NULL,
  `book_id` int DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKq663ama6dyjep5mhq4y3soyh0` (`book_id`),
  KEY `FK5ul5qtyh6slfyq8i4jby7qecx` (`username`),
  CONSTRAINT `FK5ul5qtyh6slfyq8i4jby7qecx` FOREIGN KEY (`username`) REFERENCES `users` (`username`),
  CONSTRAINT `FKq663ama6dyjep5mhq4y3soyh0` FOREIGN KEY (`book_id`) REFERENCES `book_store` (`id`),
  CONSTRAINT `orders_chk_1` CHECK ((`quantity` >= 1))
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (6,3,2399.9700000000003,58,'Ram'),(8,2,1199,60,'Ram'),(12,1,530,64,'Ram'),(14,1,650,61,'Ram');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otpmodel`
--

DROP TABLE IF EXISTS `otpmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `otpmodel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `otp` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `local_data_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otpmodel`
--

LOCK TABLES `otpmodel` WRITE;
/*!40000 ALTER TABLE `otpmodel` DISABLE KEYS */;
INSERT INTO `otpmodel` VALUES (12,'685339','rammuthukumar33@gmail.com','2025-06-29 21:39:40.389868'),(13,'196890','sonthoshram03@gmail.com','2025-06-29 21:54:11.295929');
/*!40000 ALTER TABLE `otpmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `publisher_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_publisher_name` (`publisher_name`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (47,'Alfred A. Knopf'),(57,'Avon'),(48,'Berkley'),(51,'Bloom Books'),(49,'Forever'),(58,'Harleem Goates'),(60,'Harriman House'),(61,'Kenna Camamile'),(54,'Little, Brown'),(63,'Marie-jeanne Morrall'),(46,'Penguin Random House'),(53,'Putnam'),(62,'Randolf Broy'),(56,'Red Tower Books'),(64,'Sallee Shew'),(50,'Simon & Schuster'),(52,'Sourcebooks Casablanca'),(55,'St. Martin\'s Press');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(16) NOT NULL,
  `password` varchar(200) NOT NULL,
  `role` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('Carco','$2a$12$WAae23WEFtbrWYEi2suMLOthEqV.Svj7.H/YTIHWfLCLnZNDPRd2.','ADMIN','rammuthukumar33@gmail.com'),('Hoss','$2a$12$lAhbqh1L.EbL72.qvYUHQ.X9Sz7nANk7/oIIiTy3qB/A39EQnaxxW','USER',NULL),('Joss','$2a$12$HREIdBfWI6SqQVt6OLVuE.1GXs.ry36t1cPx9QgFijXTF51HAJwLq','USER',NULL),('Marco','$2a$12$qU0q.Y40p3pKlOFCV5KdJus5caXz8nZqFd3wJ4L4Xq4LsSDuItMdy','ADMIN',NULL),('Oriol','$2a$12$8V7V/xxPTAIJLYw2ULVBP.PFNV.We3FxXsGIeCsEjsREUoQ.ewSwS','USER',NULL),('Ram','$2a$12$KEAprfxPNNZYNmdp1xefT.ih/XLpxfc5PJ4cjApjXQLpbMlpAFjIm','USER',NULL),('Rohit','$2a$12$4H72ew6A4OHk/3X9.SlSMuMJSnuLdA/4et4HsohwsET6K4QXIe0k2','USER',NULL),('Santhosh','$2a$12$8y6SRao.xJy.oIgfhSp.TuJM1qe/H1Zm0.F0P0I0pxXbAopIlCS8G','USER',NULL),('Son','$2a$12$Dm2ZFWMvyOoYRbsnBy/LBu8KfI7WWI9VlyJ8R3Vx4l0ppiNbWz1CW','USER','sonthoshram03@gmail.com'),('Vijay','$2a$12$gkWAAnpEVlCAq0Kfcs9JpOZ6UvmtVUgbsK3x8QePJdqbPbSvHBITy','USER',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-17 19:50:24
