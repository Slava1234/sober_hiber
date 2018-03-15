-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: arba_test
-- ------------------------------------------------------
-- Server version	5.7.19-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(11) NOT NULL DEFAULT '0',
  `closing_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `confirmation_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `delivery_building` varchar(255) DEFAULT NULL,
  `delivery_city` varchar(255) DEFAULT NULL,
  `delivery_office` varchar(255) DEFAULT NULL,
  `delivery_postcode` varchar(255) DEFAULT NULL,
  `delivery_street` varchar(255) DEFAULT NULL,
  `delivery_code` char(36) DEFAULT NULL,
  `delivery_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `delivery_date_to` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` varchar(255) DEFAULT NULL,
  `distance` double NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `pickup_building` varchar(255) DEFAULT NULL,
  `pickup_city` varchar(255) DEFAULT NULL,
  `pickup_office` varchar(255) DEFAULT NULL,
  `pickup_postcode` varchar(255) DEFAULT NULL,
  `pickup_street` varchar(255) DEFAULT NULL,
  `pickup_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pickup_date_from` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publication_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `shipping_code` char(36) DEFAULT NULL,
  `carrier_id` bigint(20) DEFAULT NULL,
  `delivery_country` char(2) DEFAULT NULL,
  `pickup_country` char(2) DEFAULT NULL,
  `shipper_id` bigint(20) NOT NULL,
  `truck_id` bigint(20) DEFAULT NULL,
  `pickup_date_to` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pickup_latitude` double DEFAULT NULL,
  `pickup_longitude` double DEFAULT NULL,
  `delivery_latitude` double DEFAULT NULL,
  `delivery_longitude` double DEFAULT NULL,
  `pickup_region` varchar(20) DEFAULT NULL,
  `delivery_region` varchar(20) DEFAULT NULL,
  `total_weight` double DEFAULT NULL,
  `total_volume` double DEFAULT NULL,
  `delivery_address` varchar(100) DEFAULT NULL,
  `pickup_address` varchar(100) DEFAULT NULL,
  `shipper_name` varchar(50) DEFAULT NULL,
  `shipper_company` varchar(50) DEFAULT NULL,
  `shipper_phone` varchar(20) DEFAULT NULL,
  `receiver_name` varchar(50) DEFAULT NULL,
  `receiver_company` varchar(50) DEFAULT NULL,
  `receiver_phone` varchar(20) DEFAULT NULL,
  `payer` int(11) DEFAULT NULL,
  `payment` int(11) DEFAULT NULL,
  `payer_company` varchar(255) DEFAULT NULL,
  `payer_name` varchar(255) DEFAULT NULL,
  `payer_phone` varchar(255) DEFAULT NULL,
  `fragile` tinyint(1) DEFAULT '0',
  `dangerous` tinyint(1) DEFAULT '0',
  `humidity` tinyint(1) DEFAULT '0',
  `temperature` tinyint(1) DEFAULT '0',
  `whole_truck` tinyint(1) NOT NULL DEFAULT '0',
  `search_range` int(11) NOT NULL DEFAULT '500',
  `truck_type_id` int(11) DEFAULT NULL,
  `payment_terms` int(11) DEFAULT NULL,
  `deferred_payment_days` int(11) DEFAULT NULL,
  `payer_code` bigint(20) DEFAULT NULL,
  `preferred_price` int(11) DEFAULT NULL,
  `delivery_locality` bigint(20) DEFAULT NULL,
  `pickup_locality` bigint(20) DEFAULT NULL,
  `currency` char(3) DEFAULT NULL,
  `delivery_date_from` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `price_request` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-15 17:29:11
