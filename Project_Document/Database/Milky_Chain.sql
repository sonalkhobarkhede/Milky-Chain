-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: Milk_Management
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `complaint_comment_table`
--

DROP TABLE IF EXISTS `complaint_comment_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaint_comment_table` (
  `complaint_comment_id` int NOT NULL AUTO_INCREMENT,
  `complaint_id` int NOT NULL,
  `comment_text` varchar(500) NOT NULL,
  `comment_date_time` datetime NOT NULL,
  PRIMARY KEY (`complaint_comment_id`),
  KEY `complaint_id` (`complaint_id`),
  CONSTRAINT `complaint_comment_table_ibfk_1` FOREIGN KEY (`complaint_id`) REFERENCES `complaint_table` (`complaint_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint_comment_table`
--

LOCK TABLES `complaint_comment_table` WRITE;
/*!40000 ALTER TABLE `complaint_comment_table` DISABLE KEYS */;
INSERT INTO `complaint_comment_table` VALUES (1,1,'We will try to improve packaging','2022-01-19 00:00:00'),(2,2,'Sorry for bad experience','2022-01-22 00:00:00'),(3,2,'We will try to improve','2022-01-31 00:00:00');
/*!40000 ALTER TABLE `complaint_comment_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaint_table`
--

DROP TABLE IF EXISTS `complaint_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaint_table` (
  `complaint_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `complaint_info` varchar(300) NOT NULL,
  `complaint_date` datetime NOT NULL,
  `complaint_status` varchar(100) NOT NULL,
  PRIMARY KEY (`complaint_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `complaint_table_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer_info_table` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint_table`
--

LOCK TABLES `complaint_table` WRITE;
/*!40000 ALTER TABLE `complaint_table` DISABLE KEYS */;
INSERT INTO `complaint_table` VALUES (1,1,'Received Bad Package','2022-01-18 00:00:00','Resolved'),(2,2,'Received Spoiled Milk','2022-01-22 00:00:00','Resolved'),(3,3,'Milk quality was not good','2022-01-30 00:00:00','Pending');
/*!40000 ALTER TABLE `complaint_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_bill_table`
--

DROP TABLE IF EXISTS `customer_bill_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_bill_table` (
  `customer_bill_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `customer_bill_date_time` datetime NOT NULL,
  `customer_bill_for_month` varchar(100) NOT NULL,
  `total_order_days` int NOT NULL,
  `total_quantity` int NOT NULL,
  `total_amount_rs` int NOT NULL,
  `customer_bill_status` varchar(100) NOT NULL,
  PRIMARY KEY (`customer_bill_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `customer_bill_table_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer_info_table` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_bill_table`
--

LOCK TABLES `customer_bill_table` WRITE;
/*!40000 ALTER TABLE `customer_bill_table` DISABLE KEYS */;
INSERT INTO `customer_bill_table` VALUES (1,1,'2022-01-31 00:00:00','January',29,60,7260,'Pending'),(2,2,'2022-01-31 00:00:00','January',29,64,7250,'Paid'),(3,3,'2022-01-31 00:00:00','January',31,65,7250,'Pending'),(4,4,'2022-01-31 00:00:00','January',30,62,1500,'Paid'),(5,5,'2022-01-31 00:00:00','January',1,5,300,'Paid');
/*!40000 ALTER TABLE `customer_bill_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_info_table`
--

DROP TABLE IF EXISTS `customer_info_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_info_table` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_fname` varchar(100) NOT NULL,
  `customer_lname` varchar(100) NOT NULL,
  `customer_address` varchar(500) NOT NULL,
  `customer_mobile_no` varchar(100) NOT NULL,
  `customer_email` varchar(100) NOT NULL,
  `customer_username` varchar(100) NOT NULL,
  `customer_password` varchar(100) NOT NULL,
  `customer_pincode` int NOT NULL,
  `customer_area` varchar(100) NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_email` (`customer_email`),
  UNIQUE KEY `customer_username` (`customer_username`),
  UNIQUE KEY `customer_password` (`customer_password`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_info_table`
--

LOCK TABLES `customer_info_table` WRITE;
/*!40000 ALTER TABLE `customer_info_table` DISABLE KEYS */;
INSERT INTO `customer_info_table` VALUES (1,'Suresh','Patil','409-Ashwini Heritage, PCMC Road, Opp. Telephone Exchange,Clover Park, Pimpri Chinchwad','8888552263','sureshpatil@gmail.com','suresh123','suresh123',411057,'Pimpri Chinchwad'),(2,'Vinita','Rege','702-Vishnu Vilas,Near Ram-Mandir,Baner-Pimple Saudagar,Pune','7777665598','vinitarege@gmail.com','vinita678','vinita678',411028,'Pimple Saudagar'),(3,'Shiv','Durge','B-302,Ramakant Apartment,Near BOI,Wakad-Hinjewadi,Pune','9234661208','shivdurge234@gmail.com','shivdurge','shivdurge',411057,'Hinjewadi'),(4,'Prasanna','Verma','Pranav Bunglow,Near Awati Motors,Viman Nagar','8823498554','prasannaverma678@gmail.com','Prasanna567','prasanna876',411045,'Viman Nagar'),(5,'Satish','Singh','Silver offsprings,on BAIF Road,Near Moze College,Kharadi-Wagholi','9663492201','satishsingh6@gmail.com','satishsingh','satish123',411045,'Wagholi');
/*!40000 ALTER TABLE `customer_info_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milk_production_table`
--

DROP TABLE IF EXISTS `milk_production_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `milk_production_table` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `milk_type` varchar(100) NOT NULL,
  `production_per_day_liter` int NOT NULL,
  `price_per_liter` int NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milk_production_table`
--

LOCK TABLES `milk_production_table` WRITE;
/*!40000 ALTER TABLE `milk_production_table` DISABLE KEYS */;
INSERT INTO `milk_production_table` VALUES (1,'pasteurized milk','cow',500,60),(2,'tonned milk','cow',400,50);
/*!40000 ALTER TABLE `milk_production_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `non_deliver_record`
--

DROP TABLE IF EXISTS `non_deliver_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `non_deliver_record` (
  `non_deliver_record_id` int NOT NULL AUTO_INCREMENT,
  `subscription_id` int NOT NULL,
  `non_deliver_record_date` date NOT NULL,
  `non_deliver_record_status` varchar(100) NOT NULL,
  PRIMARY KEY (`non_deliver_record_id`),
  KEY `subscription_id` (`subscription_id`),
  CONSTRAINT `non_deliver_record_ibfk_1` FOREIGN KEY (`subscription_id`) REFERENCES `subscription_table` (`subscription_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `non_deliver_record`
--

LOCK TABLES `non_deliver_record` WRITE;
/*!40000 ALTER TABLE `non_deliver_record` DISABLE KEYS */;
INSERT INTO `non_deliver_record` VALUES (1,1,'2022-01-01','Not Delivered'),(2,2,'2022-02-01','Not Delivered'),(3,2,'2022-03-01','Not Delivered'),(4,4,'2022-04-01','Not Delivered'),(5,1,'2022-05-01','Not Delivered');
/*!40000 ALTER TABLE `non_deliver_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_table`
--

DROP TABLE IF EXISTS `order_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_table` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `supplier_id` int NOT NULL,
  `order_date` datetime NOT NULL,
  `product_id` int NOT NULL,
  `order_quantity` int NOT NULL,
  `order_delivery_date` datetime NOT NULL,
  `order_status` varchar(100) NOT NULL,
  `total_order_cost` int NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `product_id` (`product_id`),
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `order_table_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer_info_table` (`customer_id`),
  CONSTRAINT `order_table_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `milk_production_table` (`product_id`),
  CONSTRAINT `order_table_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `supplier_info_table` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_table`
--

LOCK TABLES `order_table` WRITE;
/*!40000 ALTER TABLE `order_table` DISABLE KEYS */;
INSERT INTO `order_table` VALUES (1,5,3,'2022-01-15 00:00:00',1,5,'2022-01-16 00:00:00','order placed',300);
/*!40000 ALTER TABLE `order_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_table`
--

DROP TABLE IF EXISTS `subscription_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription_table` (
  `subscription_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `product_id` int NOT NULL,
  `supplier_id` int NOT NULL,
  `subscription_start_date` date NOT NULL,
  `subscription_end_date` date NOT NULL,
  `subscription_status` varchar(100) NOT NULL,
  `milk_quantity_ltr` int NOT NULL,
  PRIMARY KEY (`subscription_id`),
  KEY `customer_id` (`customer_id`),
  KEY `product_id` (`product_id`),
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `subscription_table_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer_info_table` (`customer_id`),
  CONSTRAINT `subscription_table_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `milk_production_table` (`product_id`),
  CONSTRAINT `subscription_table_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `supplier_info_table` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_table`
--

LOCK TABLES `subscription_table` WRITE;
/*!40000 ALTER TABLE `subscription_table` DISABLE KEYS */;
INSERT INTO `subscription_table` VALUES (1,1,1,1,'2022-01-01','2022-01-31','active',4),(2,2,2,2,'2022-01-01','2022-01-31','active',5),(3,3,1,1,'2022-01-01','2022-01-31','active',2),(4,4,2,3,'2022-01-01','2022-01-31','active',5);
/*!40000 ALTER TABLE `subscription_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_info_table`
--

DROP TABLE IF EXISTS `supplier_info_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier_info_table` (
  `supplier_id` int NOT NULL AUTO_INCREMENT,
  `supplier_fname` varchar(100) NOT NULL,
  `supplier_lname` varchar(100) NOT NULL,
  `supplier_address` varchar(100) NOT NULL,
  `supplier_mobile_no` varchar(100) NOT NULL,
  `supplier_email` varchar(100) NOT NULL,
  `supplier_username` varchar(100) NOT NULL,
  `supplier_password` varchar(100) NOT NULL,
  `supplier_work_area` varchar(100) NOT NULL,
  `suppler_work_area_pincode` int NOT NULL,
  PRIMARY KEY (`supplier_id`),
  UNIQUE KEY `supplier_username` (`supplier_username`),
  UNIQUE KEY `supplier_password` (`supplier_password`),
  UNIQUE KEY `supplier_email` (`supplier_email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_info_table`
--

LOCK TABLES `supplier_info_table` WRITE;
/*!40000 ALTER TABLE `supplier_info_table` DISABLE KEYS */;
INSERT INTO `supplier_info_table` VALUES (1,'Radhe','Tiwari','Pure Dairy,Eastern Complex,Near Ambedkar Square,Pimpri Chinchwad','9555330012','radhetiwari123@gmail.com','radhetiwari','radhe3343','pimpri Chinchwad',411057),(2,'Shyam','Mishra','Gajanan Milk Shop,Clover Park,Ravet','9367772243','mishrashyam22@gmail.com','shyammishra','shyam7890','Ravet',411028),(3,'Hari','Patel','Golden Suppliers,Near Bank Of Maharashtra,ShivajiNagar','9773412098','haripatel@gmail.com','haripatel','hari1123','ShivajiNagar',411045);
/*!40000 ALTER TABLE `supplier_info_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-28  2:41:24
