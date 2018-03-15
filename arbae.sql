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
-- Table structure for table `account_users`
--

DROP TABLE IF EXISTS `account_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_users` (
  `id` bigint(20) NOT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `role` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_users`
--

LOCK TABLES `account_users` WRITE;
/*!40000 ALTER TABLE `account_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_book`
--

DROP TABLE IF EXISTS `address_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_book` (
  `id` bigint(20) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(11) NOT NULL DEFAULT '0',
  `company` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `owner` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_book`
--

LOCK TABLES `address_book` WRITE;
/*!40000 ALTER TABLE `address_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrators`
--

DROP TABLE IF EXISTS `administrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrators` (
  `id` bigint(20) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(11) NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrators`
--

LOCK TABLES `administrators` WRITE;
/*!40000 ALTER TABLE `administrators` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bids`
--

DROP TABLE IF EXISTS `bids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bids` (
  `id` bigint(20) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(11) NOT NULL DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  `delivery_date_from` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pickup_date_from` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `amount` double DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `validity_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `company_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `currency` char(3) DEFAULT NULL,
  `pickup_date_to` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `delivery_date_to` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `waypoints` text,
  `truck_id` int(11) DEFAULT NULL,
  `notify_shipper` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bids`
--

LOCK TABLES `bids` WRITE;
/*!40000 ALTER TABLE `bids` DISABLE KEYS */;
/*!40000 ALTER TABLE `bids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brake_records`
--

DROP TABLE IF EXISTS `brake_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brake_records` (
  `id` bigint(20) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(11) NOT NULL DEFAULT '0',
  `accuracy` double DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `provider` varchar(10) DEFAULT NULL,
  `finish_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `track_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brake_records`
--

LOCK TABLES `brake_records` WRITE;
/*!40000 ALTER TABLE `brake_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `brake_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` bigint(20) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `site` varchar(50) DEFAULT NULL,
  `building` varchar(10) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `country` char(2) DEFAULT NULL,
  `street` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `office` varchar(10) DEFAULT NULL,
  `post_code` varchar(10) DEFAULT NULL,
  `freelancer` tinyint(1) NOT NULL DEFAULT '0',
  `registration_status` varchar(20) NOT NULL DEFAULT 'INCOMPLETE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_phones`
--

DROP TABLE IF EXISTS `company_phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_phones` (
  `company_id` bigint(20) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_phones`
--

LOCK TABLES `company_phones` WRITE;
/*!40000 ALTER TABLE `company_phones` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_phones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_to_shipper_evaluation`
--

DROP TABLE IF EXISTS `company_to_shipper_evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_to_shipper_evaluation` (
  `id` bigint(20) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(11) NOT NULL DEFAULT '0',
  `comment_negative` varchar(255) DEFAULT NULL,
  `comment_positive` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `shipper_id` bigint(20) NOT NULL,
  `rating` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_to_shipper_evaluation`
--

LOCK TABLES `company_to_shipper_evaluation` WRITE;
/*!40000 ALTER TABLE `company_to_shipper_evaluation` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_to_shipper_evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `iso2` char(2) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `name` varchar(60) NOT NULL,
  `name_en` varchar(60) NOT NULL,
  `iso_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `iso` char(3) NOT NULL,
  `name` varchar(40) NOT NULL,
  `code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver_device_information`
--

DROP TABLE IF EXISTS `driver_device_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `driver_device_information` (
  `id` bigint(20) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(11) NOT NULL DEFAULT '0',
  `android_version` int(11) NOT NULL,
  `application_version` int(11) NOT NULL,
  `model` varchar(255) DEFAULT NULL,
  `driver_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver_device_information`
--

LOCK TABLES `driver_device_information` WRITE;
/*!40000 ALTER TABLE `driver_device_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `driver_device_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drivers` (
  `id` bigint(20) NOT NULL,
  `identity` varchar(255) DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `tax_number` varchar(255) DEFAULT NULL,
  `additional_information` text,
  `login_token` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_verification_tokens`
--

DROP TABLE IF EXISTS `email_verification_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_verification_tokens` (
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `token` varchar(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_verification_tokens`
--

LOCK TABLES `email_verification_tokens` WRITE;
/*!40000 ALTER TABLE `email_verification_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_verification_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluation_criteria`
--

DROP TABLE IF EXISTS `evaluation_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluation_criteria` (
  `id` bigint(20) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `weight` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluation_criteria`
--

LOCK TABLES `evaluation_criteria` WRITE;
/*!40000 ALTER TABLE `evaluation_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluation_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluation_items`
--

DROP TABLE IF EXISTS `evaluation_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluation_items` (
  `evaluation_id` bigint(20) NOT NULL,
  `criterium_id` bigint(20) NOT NULL,
  `value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluation_items`
--

LOCK TABLES `evaluation_items` WRITE;
/*!40000 ALTER TABLE `evaluation_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluation_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `freelancers`
--

DROP TABLE IF EXISTS `freelancers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freelancers` (
  `id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `freelancers`
--

LOCK TABLES `freelancers` WRITE;
/*!40000 ALTER TABLE `freelancers` DISABLE KEYS */;
/*!40000 ALTER TABLE `freelancers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localities`
--

DROP TABLE IF EXISTS `localities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localities` (
  `id` bigint(20) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(11) NOT NULL DEFAULT '0',
  `area1` varchar(255) DEFAULT NULL,
  `area2` varchar(255) DEFAULT NULL,
  `area3` varchar(255) DEFAULT NULL,
  `country` varchar(255) NOT NULL,
  `formatted_address` varchar(255) NOT NULL,
  `latitude` double NOT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `longitude` double NOT NULL,
  `start_point` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localities`
--

LOCK TABLES `localities` WRITE;
/*!40000 ALTER TABLE `localities` DISABLE KEYS */;
/*!40000 ALTER TABLE `localities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_records`
--

DROP TABLE IF EXISTS `location_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_records` (
  `id` bigint(20) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(11) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `track_id` bigint(20) NOT NULL,
  `accuracy` double DEFAULT NULL,
  `provider` varchar(10) DEFAULT NULL,
  `speed` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_records`
--

LOCK TABLES `location_records` WRITE;
/*!40000 ALTER TABLE `location_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `location_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` bigint(20) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(11) NOT NULL DEFAULT '0',
  `height` int(11) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `order_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `orders_history`
--

DROP TABLE IF EXISTS `orders_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_history` (
  `order_id` bigint(20) NOT NULL,
  `record_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_history`
--

LOCK TABLES `orders_history` WRITE;
/*!40000 ALTER TABLE `orders_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_verification_tokens`
--

DROP TABLE IF EXISTS `phone_verification_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phone_verification_tokens` (
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `token` varchar(10) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_verification_tokens`
--

LOCK TABLES `phone_verification_tokens` WRITE;
/*!40000 ALTER TABLE `phone_verification_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_verification_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reset_password_tokens`
--

DROP TABLE IF EXISTS `reset_password_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reset_password_tokens` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(10) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reset_password_tokens`
--

LOCK TABLES `reset_password_tokens` WRITE;
/*!40000 ALTER TABLE `reset_password_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `reset_password_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipper_to_company_evaluation`
--

DROP TABLE IF EXISTS `shipper_to_company_evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipper_to_company_evaluation` (
  `id` bigint(20) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(11) NOT NULL DEFAULT '0',
  `comment_negative` varchar(255) DEFAULT NULL,
  `comment_positive` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `shipper_id` bigint(20) NOT NULL,
  `rating` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipper_to_company_evaluation`
--

LOCK TABLES `shipper_to_company_evaluation` WRITE;
/*!40000 ALTER TABLE `shipper_to_company_evaluation` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipper_to_company_evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shippers`
--

DROP TABLE IF EXISTS `shippers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shippers` (
  `id` bigint(20) NOT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `registration_status` varchar(20) NOT NULL DEFAULT 'INCOMPLETE',
  `company` varchar(50) DEFAULT NULL,
  `building` varchar(10) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `office` varchar(10) DEFAULT NULL,
  `post_code` varchar(10) DEFAULT NULL,
  `street` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shippers`
--

LOCK TABLES `shippers` WRITE;
/*!40000 ALTER TABLE `shippers` DISABLE KEYS */;
/*!40000 ALTER TABLE `shippers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snapped_location_records`
--

DROP TABLE IF EXISTS `snapped_location_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snapped_location_records` (
  `id` bigint(20) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(11) NOT NULL DEFAULT '0',
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `track_id` bigint(20) NOT NULL,
  `date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snapped_location_records`
--

LOCK TABLES `snapped_location_records` WRITE;
/*!40000 ALTER TABLE `snapped_location_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `snapped_location_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_pages`
--

DROP TABLE IF EXISTS `static_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_pages` (
  `id` bigint(20) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(11) NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_pages`
--

LOCK TABLES `static_pages` WRITE;
/*!40000 ALTER TABLE `static_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `static_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `truck_brands`
--

DROP TABLE IF EXISTS `truck_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `truck_brands` (
  `id` bigint(20) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(11) NOT NULL DEFAULT '0',
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truck_brands`
--

LOCK TABLES `truck_brands` WRITE;
/*!40000 ALTER TABLE `truck_brands` DISABLE KEYS */;
/*!40000 ALTER TABLE `truck_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `truck_tracks`
--

DROP TABLE IF EXISTS `truck_tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `truck_tracks` (
  `id` bigint(20) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(11) NOT NULL DEFAULT '0',
  `finish_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `truck_id` bigint(20) NOT NULL,
  `distance` double DEFAULT NULL,
  `distance_accuracy` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truck_tracks`
--

LOCK TABLES `truck_tracks` WRITE;
/*!40000 ALTER TABLE `truck_tracks` DISABLE KEYS */;
/*!40000 ALTER TABLE `truck_tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `truck_types`
--

DROP TABLE IF EXISTS `truck_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `truck_types` (
  `id` bigint(20) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truck_types`
--

LOCK TABLES `truck_types` WRITE;
/*!40000 ALTER TABLE `truck_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `truck_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trucks`
--

DROP TABLE IF EXISTS `trucks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trucks` (
  `id` bigint(20) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(11) NOT NULL DEFAULT '0',
  `available_floorage` double NOT NULL,
  `available_volume` double NOT NULL,
  `overall_floorage` double NOT NULL,
  `overall_volume` double NOT NULL,
  `registration_number` varchar(255) NOT NULL,
  `brand_id` bigint(20) NOT NULL,
  `driver_id` bigint(20) DEFAULT NULL,
  `type_id` bigint(20) NOT NULL,
  `latest_location_id` bigint(20) DEFAULT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `previous_location_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trucks`
--

LOCK TABLES `trucks` WRITE;
/*!40000 ALTER TABLE `trucks` DISABLE KEYS */;
/*!40000 ALTER TABLE `trucks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_phones`
--

DROP TABLE IF EXISTS `user_phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_phones` (
  `user_id` bigint(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'NOT_VERYFIED'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_phones`
--

LOCK TABLES `user_phones` WRITE;
/*!40000 ALTER TABLE `user_phones` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_phones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modification_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(11) NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `user_type` varchar(50) DEFAULT 'AccountUser',
  `email_status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2018-03-15 16:38:02
