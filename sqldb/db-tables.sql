-- MySQL dump 10.13  Distrib 8.4.2, for macos14.4 (x86_64)
--
-- Host: 192.168.122.11    Database: kliqitDB
-- ------------------------------------------------------
-- Server version	5.5.5-10.6.16-MariaDB-0ubuntu0.22.04.1

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
-- Table structure for table `a2_Anushthan_Type`
--

DROP TABLE IF EXISTS `a2_Anushthan_Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `a2_Anushthan_Type` (
  `ANUSHTHAN_TYPE_KEY` smallint(4) NOT NULL AUTO_INCREMENT,
  `UUID` varchar(36) DEFAULT NULL,
  `ANUSHTHAN_TYPE_NAME` varchar(50) DEFAULT NULL,
  `ANUSHTHAN_TYPE_DESCRIPTION` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ANUSHTHAN_TYPE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `a2_Anusthan_Sankhya`
--

DROP TABLE IF EXISTS `a2_Anusthan_Sankhya`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `a2_Anusthan_Sankhya` (
  `ANUSHTHAN_SANKHYA_KEY` smallint(4) NOT NULL DEFAULT 0,
  `UUID` varchar(36) NOT NULL,
  `ANUSHTHAN_SANKHYA_NAME` varchar(50) NOT NULL,
  PRIMARY KEY (`ANUSHTHAN_SANKHYA_KEY`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `a2_Anusthatan`
--

DROP TABLE IF EXISTS `a2_Anusthatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `a2_Anusthatan` (
  `ANUSHTAHN_KEY` bigint(11) NOT NULL AUTO_INCREMENT,
  `ANUSHTAHN_TYPE_KEY` smallint(4) DEFAULT NULL,
  `ANUSHTAHN_SANKHYA_TYPE_KEY` smallint(4) DEFAULT NULL,
  `EVENT_KEY` int(11) DEFAULT NULL,
  `GOTRA_TYPE_KEY` smallint(4) DEFAULT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  `ADDRESS` varchar(50) DEFAULT NULL,
  `DONATION_AMOUNT` double(8,2) DEFAULT NULL,
  `MATERIAL_AMOUNT` double(8,2) DEFAULT NULL,
  `CREATOR_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ANUSHTAHN_KEY`),
  KEY `FK_a2_Anusthatan_a2_Anushthan_Type` (`ANUSHTAHN_TYPE_KEY`),
  KEY `FK_a2_Anusthatan_a2_Anusthan_Sankhya` (`ANUSHTAHN_SANKHYA_TYPE_KEY`),
  KEY `FK_a2_Anusthatan_a2_Events` (`EVENT_KEY`),
  KEY `FK_a2_Anusthatan_a2_gotra` (`GOTRA_TYPE_KEY`),
  CONSTRAINT `FK_a2_Anusthatan_a2_Anushthan_Type` FOREIGN KEY (`ANUSHTAHN_TYPE_KEY`) REFERENCES `a2_Anushthan_Type` (`ANUSHTHAN_TYPE_KEY`),
  CONSTRAINT `FK_a2_Anusthatan_a2_Anusthan_Sankhya` FOREIGN KEY (`ANUSHTAHN_SANKHYA_TYPE_KEY`) REFERENCES `a2_Anusthan_Sankhya` (`ANUSHTHAN_SANKHYA_KEY`),
  CONSTRAINT `FK_a2_Anusthatan_a2_Events` FOREIGN KEY (`EVENT_KEY`) REFERENCES `events` (`EVENT_KEY`),
  CONSTRAINT `FK_a2_Anusthatan_a2_gotra` FOREIGN KEY (`GOTRA_TYPE_KEY`) REFERENCES `a2_gotra` (`GOTRA_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `a2_gotra`
--

DROP TABLE IF EXISTS `a2_gotra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `a2_gotra` (
  `GOTRA_KEY` smallint(4) NOT NULL AUTO_INCREMENT,
  `UUID` varchar(36) NOT NULL,
  `GOTRA_NAME` varchar(50) NOT NULL,
  PRIMARY KEY (`GOTRA_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anushthan`
--

DROP TABLE IF EXISTS `anushthan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anushthan` (
  `anushthan_key` int(11) NOT NULL AUTO_INCREMENT,
  `anushthan_uuid` varchar(36) DEFAULT NULL,
  `anushthan_name` varchar(50) DEFAULT NULL,
  `image` blob DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `count` varchar(50) DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  `mantra` varchar(200) DEFAULT NULL,
  `reason_to_perform` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`anushthan_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `CATEGORY_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `CATEGORY_NAME` varchar(50) DEFAULT NULL,
  `CATEGORY_UUID` varchar(36) DEFAULT NULL,
  `CATEGORY_DESC` varchar(50) DEFAULT NULL,
  `DOMAIN_KEY` int(11) DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_KEY`),
  KEY `DOMAIN_KEY` (`DOMAIN_KEY`),
  CONSTRAINT `FK1_DOMAIN_KEY` FOREIGN KEY (`DOMAIN_KEY`) REFERENCES `domains` (`DOMAIN_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `configuration_parameters`
--

DROP TABLE IF EXISTS `configuration_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configuration_parameters` (
  `KEY` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `configuration_type`
--

DROP TABLE IF EXISTS `configuration_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configuration_type` (
  `CONFIG_TYPE_KEY` tinyint(4) NOT NULL DEFAULT 0,
  `CONFIG_TYPE_DESC` varchar(255) DEFAULT NULL,
  `CREATE_MODIFY_GROUP` tinyint(4) DEFAULT NULL,
  `GROUP_MEMBER_COUNT` tinyint(4) DEFAULT NULL,
  `CREATE_MODIFY_USER` tinyint(4) DEFAULT NULL,
  `RESOURCE_IDENTIFIER` varchar(255) DEFAULT NULL,
  `METHOD_TYPE` varchar(15) DEFAULT NULL,
  `UUID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`CONFIG_TYPE_KEY`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `counts`
--

DROP TABLE IF EXISTS `counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `counts` (
  `COUNTS_KEY` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_KEY` int(10) NOT NULL,
  `DEVICE_KEY` int(10) NOT NULL,
  `COUNT_DATE` datetime NOT NULL,
  `LOCAL_DATE` datetime NOT NULL,
  `TZ` varchar(40) DEFAULT NULL,
  `LOCLAT` varchar(11) DEFAULT NULL,
  `LOCLONG` varchar(11) DEFAULT NULL,
  `COUNTS` int(11) NOT NULL DEFAULT 1,
  `UNITS_DOMAINS` int(11) NOT NULL DEFAULT 0,
  `COUNTER_NUMBER` char(2) NOT NULL DEFAULT 'C1',
  PRIMARY KEY (`COUNTS_KEY`),
  KEY `FK_DEVICE_DAILY_COUNT_USER_LINK` (`USER_KEY`),
  KEY `FK_DEVICE_DAILY_COUNT_DEVICE_DETAIL_LINK` (`DEVICE_KEY`),
  KEY `counts_FK` (`DEVICE_KEY`,`USER_KEY`),
  KEY `FK_counts_units_domains` (`UNITS_DOMAINS`),
  CONSTRAINT `FK_counts_device` FOREIGN KEY (`DEVICE_KEY`) REFERENCES `device` (`DEVICE_KEY`),
  CONSTRAINT `FK_counts_units_domains` FOREIGN KEY (`UNITS_DOMAINS`) REFERENCES `units_domains` (`UNITS_DOMAINS`),
  CONSTRAINT `FK_counts_user` FOREIGN KEY (`USER_KEY`) REFERENCES `user` (`USER_KEY`),
  CONSTRAINT `counts_FK` FOREIGN KEY (`DEVICE_KEY`, `USER_KEY`) REFERENCES `device` (`DEVICE_KEY`, `USER_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `counts_backup`
--

DROP TABLE IF EXISTS `counts_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `counts_backup` (
  `COUNTS_KEY` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_KEY` int(10) NOT NULL,
  `DEVICE_KEY` int(10) NOT NULL,
  `COUNT_DATE` datetime NOT NULL,
  `LOCAL_DATE` datetime NOT NULL,
  `TZ` varchar(40) DEFAULT NULL,
  `LOCLAT` varchar(11) DEFAULT NULL,
  `LOCLONG` varchar(11) DEFAULT NULL,
  `COUNTS` int(11) NOT NULL DEFAULT 1,
  `UNITS_DOMAINS` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`COUNTS_KEY`) USING BTREE,
  KEY `FK_DEVICE_DAILY_COUNT_USER_LINK` (`USER_KEY`) USING BTREE,
  KEY `FK_DEVICE_DAILY_COUNT_DEVICE_DETAIL_LINK` (`DEVICE_KEY`) USING BTREE,
  KEY `counts_FK` (`DEVICE_KEY`,`USER_KEY`) USING BTREE,
  KEY `FK_counts_units_domains` (`UNITS_DOMAINS`) USING BTREE,
  CONSTRAINT `counts_backup_ibfk_1` FOREIGN KEY (`DEVICE_KEY`) REFERENCES `device` (`DEVICE_KEY`),
  CONSTRAINT `counts_backup_ibfk_2` FOREIGN KEY (`UNITS_DOMAINS`) REFERENCES `units_domains` (`UNITS_DOMAINS`),
  CONSTRAINT `counts_backup_ibfk_3` FOREIGN KEY (`USER_KEY`) REFERENCES `user` (`USER_KEY`),
  CONSTRAINT `counts_backup_ibfk_4` FOREIGN KEY (`DEVICE_KEY`, `USER_KEY`) REFERENCES `device` (`DEVICE_KEY`, `USER_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cron_process_stats`
--

DROP TABLE IF EXISTS `cron_process_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cron_process_stats` (
  `PROCESS_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `PROCESS_ID` varchar(36) NOT NULL,
  `PROCESS_NAME` varchar(255) NOT NULL,
  `PROCESS_START_TIME` datetime NOT NULL,
  `PROCESS_END_TIME` datetime NOT NULL,
  PRIMARY KEY (`PROCESS_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `daily_counts_summary`
--

DROP TABLE IF EXISTS `daily_counts_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_counts_summary` (
  `USER_KEY` int(10) NOT NULL,
  `COUNT_DATE` date NOT NULL,
  `TOTAL_DATE_COUNTS` int(11) unsigned NOT NULL DEFAULT 1,
  `UNITS_DOMAINS` int(11) NOT NULL DEFAULT 0,
  `ADJUSTMENT` int(11) NOT NULL DEFAULT 0,
  KEY `FK_DEVICE_DAILY_COUNT_USER_LINK` (`USER_KEY`),
  KEY `FK_daily_counts_summary_units_domains` (`UNITS_DOMAINS`),
  CONSTRAINT `FK_daily_counts_summary_units_domains` FOREIGN KEY (`UNITS_DOMAINS`) REFERENCES `units_domains` (`UNITS_DOMAINS`),
  CONSTRAINT `FK_daily_counts_summary_user` FOREIGN KEY (`USER_KEY`) REFERENCES `user` (`USER_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device` (
  `DEVICE_KEY` int(10) NOT NULL AUTO_INCREMENT,
  `USER_KEY` int(10) NOT NULL,
  `UUID` varchar(36) DEFAULT NULL,
  `DEVICE_NAME` varchar(20) DEFAULT NULL,
  `DEVICE_HASH` varchar(40) DEFAULT NULL,
  `DEVICE_TYPE` char(1) NOT NULL DEFAULT 'S',
  `DEVICE_FIRMWARE_VERSION` varchar(40) DEFAULT NULL,
  `IS_ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `REGISTRATION_DATE` datetime DEFAULT NULL,
  `INACTIVATION_DATE` datetime DEFAULT NULL,
  `REACTIVATION_DATE` datetime DEFAULT NULL,
  `C1` varchar(50) NOT NULL DEFAULT 'C1',
  `C2` varchar(50) NOT NULL DEFAULT 'C2',
  `PROMO_CODE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`DEVICE_KEY`),
  UNIQUE KEY `USER_DEVICE_KEY` (`DEVICE_KEY`,`USER_KEY`),
  UNIQUE KEY `UUID` (`UUID`),
  UNIQUE KEY `USER_KEY_DEVICE_HASH` (`USER_KEY`,`DEVICE_HASH`),
  KEY `FK_DEVICE_DETAIL_USER_LINK` (`USER_KEY`),
  CONSTRAINT `FK_device_user` FOREIGN KEY (`USER_KEY`) REFERENCES `user` (`USER_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device_inventory`
--

DROP TABLE IF EXISTS `device_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_inventory` (
  `DEVICE_INV_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `DEVICE_ANDROID_HASH` varchar(40) DEFAULT NULL,
  `DEVICE_IOS_HASH` varchar(40) DEFAULT NULL,
  `CREATED_DATE` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `IN_USE` char(1) DEFAULT 'N',
  PRIMARY KEY (`DEVICE_INV_KEY`),
  UNIQUE KEY `DEVICE_ANDROID_HASH` (`DEVICE_ANDROID_HASH`),
  UNIQUE KEY `DEVICE_IOS_HASH` (`DEVICE_IOS_HASH`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domains`
--

DROP TABLE IF EXISTS `domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domains` (
  `DOMAIN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DOMAIN_NAME` varchar(255) NOT NULL,
  `UUID` varchar(36) DEFAULT NULL,
  `IS_ENABLED` char(1) DEFAULT 'N',
  PRIMARY KEY (`DOMAIN_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_counts_queue`
--

DROP TABLE IF EXISTS `event_counts_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_counts_queue` (
  `EVENT_UUID` varchar(36) DEFAULT NULL,
  `USER_UUID` varchar(36) DEFAULT NULL,
  `ITEM_UUID` varchar(36) DEFAULT NULL,
  `DEVICE_UUID` varchar(36) DEFAULT NULL,
  `TZ` varchar(50) DEFAULT NULL,
  `LOCLAT` varchar(10) DEFAULT NULL,
  `LOCLONG` varchar(10) DEFAULT NULL,
  `COUNT_DATA` longtext DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT current_timestamp(),
  `QUEUE_UUID` varchar(36) DEFAULT NULL,
  `PROCESSED` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_daily_counts_summary`
--

DROP TABLE IF EXISTS `event_daily_counts_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_daily_counts_summary` (
  `EVENT_KEY` int(11) DEFAULT NULL,
  `EVENT_COUNT_DATE` date DEFAULT NULL,
  `EVENT_DAILY_TOTAL_COUNTS` bigint(20) DEFAULT NULL,
  `DOMAIN_KEY` int(11) DEFAULT NULL,
  `ITEM_KEY` int(11) DEFAULT NULL,
  `LAST_UPDATED_DATETIME` datetime DEFAULT NULL,
  KEY `DOMAIN_KEY` (`DOMAIN_KEY`),
  KEY `ITEM_KEY` (`ITEM_KEY`),
  KEY `EVENT_KEY` (`EVENT_KEY`),
  CONSTRAINT `FK2_DOMAIN_KEY` FOREIGN KEY (`DOMAIN_KEY`) REFERENCES `domains` (`DOMAIN_ID`),
  CONSTRAINT `FK3_EVENT_KEY` FOREIGN KEY (`EVENT_KEY`) REFERENCES `events` (`EVENT_KEY`),
  CONSTRAINT `FK3_ITEM_KEY` FOREIGN KEY (`ITEM_KEY`) REFERENCES `items` (`ITEM_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_daily_counts_summary_enhanced`
--

DROP TABLE IF EXISTS `event_daily_counts_summary_enhanced`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_daily_counts_summary_enhanced` (
  `EVENT_COUNT_DATE` date DEFAULT NULL,
  `EVENT_DAILY_ITEM_TOTAL_COUNTS` bigint(20) DEFAULT NULL,
  `EVENT_KEY` int(11) DEFAULT NULL,
  `DOMAIN_KEY` int(11) DEFAULT NULL,
  `ITEM_KEY` int(11) DEFAULT NULL,
  `EVENT_SCHEDULE_KEY` int(11) DEFAULT NULL,
  `EVENT_GOAL_KEY` int(11) DEFAULT NULL,
  `LAST_UPDATED_DATETIME` datetime DEFAULT NULL,
  KEY `DOMAIN_KEY` (`DOMAIN_KEY`) USING BTREE,
  KEY `ITEM_KEY` (`ITEM_KEY`) USING BTREE,
  KEY `FK_event_daily_counts_summary_enhanced_events_schedule` (`EVENT_SCHEDULE_KEY`),
  KEY `FK_event_daily_counts_summary_enhanced_event_goal` (`EVENT_GOAL_KEY`),
  KEY `FK_event_daily_counts_summary_enhanced_events` (`EVENT_KEY`),
  CONSTRAINT `FK_event_daily_counts_summary_enhanced_event_goal` FOREIGN KEY (`EVENT_GOAL_KEY`) REFERENCES `event_goal` (`EVENT_GOAL_KEY`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_event_daily_counts_summary_enhanced_events` FOREIGN KEY (`EVENT_KEY`) REFERENCES `events` (`EVENT_KEY`),
  CONSTRAINT `FK_event_daily_counts_summary_enhanced_events_schedule` FOREIGN KEY (`EVENT_SCHEDULE_KEY`) REFERENCES `events_schedule` (`EVENT_SCHEDULE_KEY`),
  CONSTRAINT `FK_event_daily_counts_summary_enhanced_items` FOREIGN KEY (`ITEM_KEY`) REFERENCES `items` (`ITEM_KEY`),
  CONSTRAINT `event_daily_counts_summary_enhanced_ibfk_1` FOREIGN KEY (`DOMAIN_KEY`) REFERENCES `domains` (`DOMAIN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_goal`
--

DROP TABLE IF EXISTS `event_goal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_goal` (
  `EVENT_GOAL_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `ITEM_KEY` int(11) DEFAULT NULL,
  `GOAL` bigint(20) DEFAULT NULL,
  `EVENT_SCHEDULE_KEY` int(11) DEFAULT NULL,
  `UUID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`EVENT_GOAL_KEY`),
  KEY `FK_ITEM_KEY` (`ITEM_KEY`),
  KEY `EVENT_SCHEDULE_KEY` (`EVENT_SCHEDULE_KEY`),
  CONSTRAINT `FK2_EVENT_SCHEDULE_KEY` FOREIGN KEY (`EVENT_SCHEDULE_KEY`) REFERENCES `events_schedule` (`EVENT_SCHEDULE_KEY`),
  CONSTRAINT `FK2_ITEM_KEY` FOREIGN KEY (`ITEM_KEY`) REFERENCES `items` (`ITEM_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_users`
--

DROP TABLE IF EXISTS `event_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_users` (
  `EVENT_KEY` int(11) NOT NULL,
  `USER_KEY` int(11) NOT NULL,
  `IS_ACTIVE` char(50) DEFAULT NULL,
  `IS_DEFAULT` char(50) DEFAULT NULL,
  `CREATION_DATE` datetime DEFAULT NULL,
  `INACTIVATION_DATE` datetime DEFAULT NULL,
  `REACTIVATION_DATE` datetime DEFAULT NULL,
  KEY `FK2_USER_KEY_1` (`USER_KEY`),
  KEY `EVENT_KEY` (`EVENT_KEY`),
  CONSTRAINT `FK_EVENT_USER_EVENT_KEY` FOREIGN KEY (`EVENT_KEY`) REFERENCES `events` (`EVENT_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `EVENT_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `CREATOR_USER_KEY` int(11) DEFAULT NULL,
  `UUID` varchar(36) DEFAULT NULL,
  `EVENT_NAME` varchar(50) DEFAULT NULL,
  `IS_ACTIVE` char(1) DEFAULT NULL,
  `EVENT_CREATION_DATE` datetime NOT NULL,
  `TOTAL_EVENT_MEMBERS` int(11) NOT NULL DEFAULT 0,
  `TOTAL_EVENT_COUNTS` bigint(20) NOT NULL DEFAULT 0,
  `CITY_ID` varchar(10) DEFAULT NULL,
  `DOMAIN_KEY` int(11) DEFAULT NULL,
  `GROUP_KEY` int(11) DEFAULT NULL,
  `IS_PRIVATE` tinyint(4) NOT NULL DEFAULT 1,
  `SUBSC_KEY` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`EVENT_KEY`),
  KEY `fk_event_user_key` (`CREATOR_USER_KEY`) USING BTREE,
  KEY `DOMAIN_KEY` (`DOMAIN_KEY`),
  KEY `FK_events_group` (`GROUP_KEY`),
  KEY `SUBSC_KEY` (`SUBSC_KEY`),
  CONSTRAINT `FK2_events_domain_key` FOREIGN KEY (`DOMAIN_KEY`) REFERENCES `domains` (`DOMAIN_ID`),
  CONSTRAINT `FK_creator_user_key` FOREIGN KEY (`CREATOR_USER_KEY`) REFERENCES `user` (`USER_KEY`),
  CONSTRAINT `FK_events_group` FOREIGN KEY (`GROUP_KEY`) REFERENCES `group` (`GROUP_KEY`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `events_ibfk_1` FOREIGN KEY (`SUBSC_KEY`) REFERENCES `subscription_type` (`SUBSC_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `events_counts`
--

DROP TABLE IF EXISTS `events_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events_counts` (
  `EVENT_KEY` int(11) NOT NULL,
  `USER_KEY` int(11) NOT NULL,
  `DEVICE_KEY` int(11) NOT NULL,
  `COUNT_DATE` datetime DEFAULT NULL,
  `LOCAL_DATE` datetime DEFAULT NULL,
  `TZ` varchar(50) DEFAULT NULL,
  `LOCLAT` varchar(50) DEFAULT NULL,
  `LOCLONG` varchar(50) DEFAULT NULL,
  `COUNTS` bigint(20) DEFAULT NULL,
  `ITEM_KEY` int(11) NOT NULL,
  KEY `FK_USER_KEY` (`USER_KEY`) USING BTREE,
  KEY `FK_DEVICE_KEY` (`DEVICE_KEY`) USING BTREE,
  KEY `FK_ITEM_KEY` (`ITEM_KEY`),
  KEY `EVENT_KEY` (`EVENT_KEY`),
  CONSTRAINT `FK_DEVICE_KEY` FOREIGN KEY (`DEVICE_KEY`) REFERENCES `device` (`DEVICE_KEY`),
  CONSTRAINT `FK_EVENT_KEY` FOREIGN KEY (`EVENT_KEY`) REFERENCES `events` (`EVENT_KEY`),
  CONSTRAINT `FK_ITEM_KEY` FOREIGN KEY (`ITEM_KEY`) REFERENCES `items` (`ITEM_KEY`),
  CONSTRAINT `FK_USER_KEY` FOREIGN KEY (`USER_KEY`) REFERENCES `user` (`USER_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `events_counts_backup`
--

DROP TABLE IF EXISTS `events_counts_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events_counts_backup` (
  `EVENT_KEY` int(11) NOT NULL,
  `USER_KEY` int(11) NOT NULL,
  `DEVICE_KEY` int(11) NOT NULL,
  `COUNT_DATE` datetime DEFAULT NULL,
  `LOCAL_DATE` datetime DEFAULT NULL,
  `TZ` varchar(50) DEFAULT NULL,
  `LOCLAT` varchar(50) DEFAULT NULL,
  `LOCLONG` varchar(50) DEFAULT NULL,
  `COUNTS` bigint(20) DEFAULT NULL,
  `ITEM_KEY` int(11) NOT NULL,
  KEY `FK_USER_KEY` (`USER_KEY`) USING BTREE,
  KEY `FK_DEVICE_KEY` (`DEVICE_KEY`) USING BTREE,
  KEY `FK_ITEM_KEY` (`ITEM_KEY`) USING BTREE,
  KEY `EVENT_KEY` (`EVENT_KEY`) USING BTREE,
  CONSTRAINT `events_counts_backup_ibfk_1` FOREIGN KEY (`DEVICE_KEY`) REFERENCES `device` (`DEVICE_KEY`),
  CONSTRAINT `events_counts_backup_ibfk_2` FOREIGN KEY (`EVENT_KEY`) REFERENCES `events` (`EVENT_KEY`),
  CONSTRAINT `events_counts_backup_ibfk_3` FOREIGN KEY (`ITEM_KEY`) REFERENCES `items` (`ITEM_KEY`),
  CONSTRAINT `events_counts_backup_ibfk_4` FOREIGN KEY (`USER_KEY`) REFERENCES `user` (`USER_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `events_schedule`
--

DROP TABLE IF EXISTS `events_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events_schedule` (
  `EVENT_SCHEDULE_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `EVENT_KEY` int(11) DEFAULT NULL,
  `EVENT_START_TIME` datetime NOT NULL,
  `EVENT_END_TIME` datetime NOT NULL,
  `UUID` varchar(36) DEFAULT NULL,
  `TZ` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`EVENT_SCHEDULE_KEY`),
  KEY `EVENT_KEY` (`EVENT_KEY`),
  CONSTRAINT `FK1_EVENT_KEY` FOREIGN KEY (`EVENT_KEY`) REFERENCES `events` (`EVENT_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `FEEDBACK_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `FEEDBACK_UUID` varchar(36) DEFAULT NULL,
  `USER_KEY` int(11) DEFAULT NULL,
  `FEEDBACK_AREA` enum('SALES & MARKETING','MOBILE APPLICATION','KLIQIT GROUP COUNTER','WEB APPLICATION') DEFAULT NULL,
  `FEEDBACK_CONTENT` text DEFAULT NULL,
  `FEEDBACK_DATE` datetime DEFAULT NULL,
  `FEEDBACK_STATUS` enum('IMPLEMENTED','CONSIDERING','WORK IN PROGRESS') DEFAULT NULL,
  PRIMARY KEY (`FEEDBACK_ID`),
  KEY `USER_KEY` (`USER_KEY`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`USER_KEY`) REFERENCES `user` (`USER_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `get_event_summary`
--

DROP TABLE IF EXISTS `get_event_summary`;
/*!50001 DROP VIEW IF EXISTS `get_event_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_event_summary` AS SELECT 
 1 AS `EVENT_NAME`,
 1 AS `UUID`,
 1 AS `EVENT_KEY`,
 1 AS `USER_KEY`,
 1 AS `DEVICE_KEY`,
 1 AS `COUNT_DATE`,
 1 AS `LOCAL_DATE`,
 1 AS `TZ`,
 1 AS `COUNTS`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `get_events_items_summary`
--

DROP TABLE IF EXISTS `get_events_items_summary`;
/*!50001 DROP VIEW IF EXISTS `get_events_items_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_events_items_summary` AS SELECT 
 1 AS `EVENT_NAME`,
 1 AS `UUID`,
 1 AS `EVENT_KEY`,
 1 AS `ITEM_KEY`,
 1 AS `USER_KEY`,
 1 AS `DEVICE_KEY`,
 1 AS `COUNT_DATE`,
 1 AS `LOCAL_DATE`,
 1 AS `TZ`,
 1 AS `COUNTS`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `get_events_items_summary_1`
--

DROP TABLE IF EXISTS `get_events_items_summary_1`;
/*!50001 DROP VIEW IF EXISTS `get_events_items_summary_1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_events_items_summary_1` AS SELECT 
 1 AS `EVENT_NAME`,
 1 AS `UUID`,
 1 AS `EVENT_KEY`,
 1 AS `ITEM_KEY`,
 1 AS `USER_KEY`,
 1 AS `DEVICE_KEY`,
 1 AS `COUNT_DATE`,
 1 AS `LOCAL_DATE`,
 1 AS `EVENT_START_TIME`,
 1 AS `TZ`,
 1 AS `COUNTS`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `get_groups_summary`
--

DROP TABLE IF EXISTS `get_groups_summary`;
/*!50001 DROP VIEW IF EXISTS `get_groups_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_groups_summary` AS SELECT 
 1 AS `GROUP_NAME`,
 1 AS `UUID`,
 1 AS `GROUP_KEY`,
 1 AS `USER_KEY`,
 1 AS `DEVICE_KEY`,
 1 AS `COUNT_DATE`,
 1 AS `LOCAL_DATE`,
 1 AS `TZ`,
 1 AS `LOCLAT`,
 1 AS `LOCLONG`,
 1 AS `COUNTS`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `get_groups_summary_with_different_tz`
--

DROP TABLE IF EXISTS `get_groups_summary_with_different_tz`;
/*!50001 DROP VIEW IF EXISTS `get_groups_summary_with_different_tz`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_groups_summary_with_different_tz` AS SELECT 
 1 AS `GROUP_NAME`,
 1 AS `UUID`,
 1 AS `GROUP_KEY`,
 1 AS `USER_KEY`,
 1 AS `DEVICE_KEY`,
 1 AS `COUNT_DATE`,
 1 AS `LOCAL_DATE`,
 1 AS `IST`,
 1 AS `EST`,
 1 AS `TZ`,
 1 AS `COUNTS`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `get_subscriptions`
--

DROP TABLE IF EXISTS `get_subscriptions`;
/*!50001 DROP VIEW IF EXISTS `get_subscriptions`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_subscriptions` AS SELECT 
 1 AS `SUBSC_TYPE`,
 1 AS `SUBSCRIPTION_UUID`,
 1 AS `SUBSC_CONFIG_KEY`,
 1 AS `CONFIG_TYPE_DESC`,
 1 AS `OONFIGURATION_TYPE_UUID`,
 1 AS `VALUES`,
 1 AS `SUBSCRIPTION_CONFIG_UUID`,
 1 AS `RESOURCE_IDENTIFIER`,
 1 AS `METHOD_TYPE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `get_user_mappings`
--

DROP TABLE IF EXISTS `get_user_mappings`;
/*!50001 DROP VIEW IF EXISTS `get_user_mappings`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_user_mappings` AS SELECT 
 1 AS `USER_KEY`,
 1 AS `WP_VENDOR_ID`,
 1 AS `WP_CUSTOMER_ID`,
 1 AS `UUID`,
 1 AS `FULL_NAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group` (
  `GROUP_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `CREATOR_USER_KEY` int(11) NOT NULL,
  `UUID` varchar(36) NOT NULL,
  `GROUP_NAME` varchar(50) NOT NULL,
  `IS_ACTIVE` char(1) DEFAULT 'Y',
  `GROUP_CREATION_DATE` datetime NOT NULL,
  `GROUP_INACTIVATION_DATE` datetime DEFAULT NULL,
  `GROUP_REACTIVATION_DATE` datetime DEFAULT NULL,
  `GROUP_GOAL` bigint(20) NOT NULL DEFAULT 0,
  `TOTAL_GROUP_MEMBERS` int(11) NOT NULL DEFAULT 0,
  `TOTAL_GROUP_COUNTS` bigint(20) NOT NULL DEFAULT 0,
  `UNITS_DOMAINS` int(11) NOT NULL DEFAULT 0,
  `CITY_ID` varchar(10) DEFAULT NULL,
  `SUBSC_KEY` tinyint(11) DEFAULT NULL,
  PRIMARY KEY (`GROUP_KEY`),
  KEY `FK_group_user` (`CREATOR_USER_KEY`),
  KEY `FK_group_units_domains` (`UNITS_DOMAINS`),
  KEY `SUBSC_KEY` (`SUBSC_KEY`),
  CONSTRAINT `FK_group_units_domains` FOREIGN KEY (`UNITS_DOMAINS`) REFERENCES `units_domains` (`UNITS_DOMAINS`),
  CONSTRAINT `FK_group_user` FOREIGN KEY (`CREATOR_USER_KEY`) REFERENCES `user` (`USER_KEY`),
  CONSTRAINT `group_ibfk_1` FOREIGN KEY (`SUBSC_KEY`) REFERENCES `subscription_type` (`SUBSC_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_counts`
--

DROP TABLE IF EXISTS `group_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_counts` (
  `GROUP_KEY` int(11) NOT NULL,
  `USER_KEY` int(11) NOT NULL,
  `DEVICE_KEY` int(11) NOT NULL,
  `COUNT_DATE` datetime NOT NULL,
  `LOCAL_DATE` datetime DEFAULT NULL,
  `TZ` varchar(40) DEFAULT NULL,
  `LOCLAT` varchar(11) DEFAULT NULL,
  `LOCLONG` varchar(11) DEFAULT NULL,
  `COUNTS` bigint(20) NOT NULL DEFAULT 0,
  `ITEM_KEY` int(11) DEFAULT NULL,
  KEY `FK_group_counts_group` (`GROUP_KEY`),
  KEY `FK_group_counts_user` (`USER_KEY`),
  KEY `FK_group_counts_device` (`DEVICE_KEY`),
  KEY `group_counts_FK` (`DEVICE_KEY`,`USER_KEY`),
  KEY `FK_group_counts_items` (`ITEM_KEY`),
  CONSTRAINT `FK_group_counts_device` FOREIGN KEY (`DEVICE_KEY`) REFERENCES `device` (`DEVICE_KEY`),
  CONSTRAINT `FK_group_counts_group` FOREIGN KEY (`GROUP_KEY`) REFERENCES `group` (`GROUP_KEY`),
  CONSTRAINT `FK_group_counts_items` FOREIGN KEY (`ITEM_KEY`) REFERENCES `items` (`ITEM_KEY`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_group_counts_user` FOREIGN KEY (`USER_KEY`) REFERENCES `user` (`USER_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_counts_backup`
--

DROP TABLE IF EXISTS `group_counts_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_counts_backup` (
  `GROUP_KEY` int(11) NOT NULL,
  `USER_KEY` int(11) NOT NULL,
  `DEVICE_KEY` int(11) NOT NULL,
  `COUNT_DATE` datetime NOT NULL,
  `LOCAL_DATE` datetime DEFAULT NULL,
  `TZ` varchar(40) DEFAULT NULL,
  `LOCLAT` varchar(11) DEFAULT NULL,
  `LOCLONG` varchar(11) DEFAULT NULL,
  `COUNTS` bigint(20) NOT NULL DEFAULT 0,
  `ITEM_KEY` int(11) DEFAULT 0,
  KEY `FK_group_counts_group` (`GROUP_KEY`) USING BTREE,
  KEY `FK_group_counts_user` (`USER_KEY`) USING BTREE,
  KEY `FK_group_counts_device` (`DEVICE_KEY`) USING BTREE,
  KEY `group_counts_FK` (`DEVICE_KEY`,`USER_KEY`) USING BTREE,
  KEY `FK_group_counts_units_domains` (`ITEM_KEY`) USING BTREE,
  CONSTRAINT `FK_group_counts_backup_items` FOREIGN KEY (`ITEM_KEY`) REFERENCES `items` (`ITEM_KEY`),
  CONSTRAINT `group_counts_backup_ibfk_1` FOREIGN KEY (`DEVICE_KEY`) REFERENCES `device` (`DEVICE_KEY`),
  CONSTRAINT `group_counts_backup_ibfk_2` FOREIGN KEY (`GROUP_KEY`) REFERENCES `group` (`GROUP_KEY`),
  CONSTRAINT `group_counts_backup_ibfk_4` FOREIGN KEY (`USER_KEY`) REFERENCES `user` (`USER_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_counts_queue`
--

DROP TABLE IF EXISTS `group_counts_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_counts_queue` (
  `GROUP_UUID` varchar(36) NOT NULL DEFAULT '',
  `USER_KEY` int(11) NOT NULL,
  `DEVICE_KEY` int(11) NOT NULL,
  `TZ` varchar(40) DEFAULT NULL,
  `LOCLAT` varchar(11) DEFAULT NULL,
  `LOCLONG` varchar(11) DEFAULT NULL,
  `COUNT_DATA` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `PROCESSED` tinyint(4) DEFAULT 0,
  `CREATED_DATE` timestamp NULL DEFAULT current_timestamp(),
  `QUEUE_UUID` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_daily_counts_summary`
--

DROP TABLE IF EXISTS `group_daily_counts_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_daily_counts_summary` (
  `GROUP_KEY` int(11) NOT NULL,
  `GROUP_COUNT_DATE` date NOT NULL,
  `GROUP_DAILY_TOTAL_COUNTS` bigint(20) NOT NULL,
  `UNITS_DOMAINS` int(11) DEFAULT 0,
  `LAST_UPDATED_DATETIME` datetime DEFAULT NULL,
  UNIQUE KEY `GROUP_KEY_GROUP_COUNT_DATE` (`GROUP_KEY`,`GROUP_COUNT_DATE`),
  KEY `FK_group_daily_counts_summary_group` (`GROUP_KEY`),
  KEY `FK_group_daily_counts_summary_units_domains` (`UNITS_DOMAINS`),
  CONSTRAINT `FK_group_daily_counts_summary_group` FOREIGN KEY (`GROUP_KEY`) REFERENCES `group` (`GROUP_KEY`),
  CONSTRAINT `FK_group_daily_counts_summary_units_domains` FOREIGN KEY (`UNITS_DOMAINS`) REFERENCES `units_domains` (`UNITS_DOMAINS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_goals`
--

DROP TABLE IF EXISTS `group_goals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_goals` (
  `GROUP_KEY` int(11) NOT NULL,
  `GOAL_DATE` datetime NOT NULL,
  `GROUP_DAILY_GOAL` bigint(20) DEFAULT NULL,
  KEY `FK_group_goals_group` (`GROUP_KEY`),
  CONSTRAINT `FK_group_goals_group` FOREIGN KEY (`GROUP_KEY`) REFERENCES `group` (`GROUP_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_invitation`
--

DROP TABLE IF EXISTS `group_invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_invitation` (
  `GROUP_INVITATION_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `GROUP_KEY` int(11) NOT NULL,
  `EMAIL_HASH` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `PRIMARY_EMAIL_ID` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `INVITE_CODE` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `INVITATION_DATE` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`GROUP_INVITATION_KEY`),
  UNIQUE KEY `GROUP_KEY_EMAIL_HASH` (`GROUP_KEY`,`EMAIL_HASH`),
  KEY `FK_group_invitation_group` (`GROUP_KEY`),
  CONSTRAINT `FK_group_invitation_group` FOREIGN KEY (`GROUP_KEY`) REFERENCES `group` (`GROUP_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_user`
--

DROP TABLE IF EXISTS `group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_user` (
  `GROUP_KEY` int(11) NOT NULL,
  `USER_KEY` int(11) NOT NULL,
  `IS_ADMIN` char(1) NOT NULL DEFAULT 'N',
  `IS_ACTIVE` char(1) NOT NULL DEFAULT 'N',
  `IS_DEFAULT` char(1) NOT NULL DEFAULT 'N',
  `CREATION_DATE` datetime DEFAULT NULL,
  `INACTIVATION_DATE` datetime DEFAULT NULL,
  `REACTIVATION_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`GROUP_KEY`,`USER_KEY`),
  KEY `FK__user` (`USER_KEY`),
  CONSTRAINT `FK_group_user_group` FOREIGN KEY (`GROUP_KEY`) REFERENCES `group` (`GROUP_KEY`),
  CONSTRAINT `FK_group_user_user` FOREIGN KEY (`USER_KEY`) REFERENCES `user` (`USER_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `ITEM_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `CATEGORY_KEY` int(11) DEFAULT NULL,
  `ITEM_NAME` varchar(50) DEFAULT NULL,
  `ITEM_DESC` text DEFAULT NULL,
  `ITEM_SPEC` varchar(50) DEFAULT NULL,
  `ITEM_UUID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ITEM_KEY`),
  KEY `CATEGORY_KEY` (`CATEGORY_KEY`),
  CONSTRAINT `FK1_CATEGORY_KEY` FOREIGN KEY (`CATEGORY_KEY`) REFERENCES `categories` (`CATEGORY_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nakshatra`
--

DROP TABLE IF EXISTS `nakshatra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nakshatra` (
  `NAKSHATRA_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `NAKSHATRA_UUID` varchar(36) DEFAULT NULL,
  `NAKSHATRA_NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`NAKSHATRA_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth_client_details`
--

DROP TABLE IF EXISTS `oauth_client_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_client_details` (
  `client_id` varchar(256) NOT NULL,
  `resource_ids` varchar(256) DEFAULT NULL,
  `client_secret` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `authorized_grant_types` varchar(256) DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) DEFAULT NULL,
  `authorities` varchar(256) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` varchar(256) DEFAULT NULL,
  `auto_approve` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `ORDER_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `ORDER_UUID` varchar(36) DEFAULT NULL,
  `ORDER_NAME` varchar(50) DEFAULT NULL,
  `ITEM_KEY` int(11) DEFAULT NULL,
  `NAKSHATRA_KEY` int(11) DEFAULT NULL,
  `RASHI_KEY` int(11) DEFAULT NULL,
  `ORDER_TIME` datetime DEFAULT NULL,
  `PANDIT_KEY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ORDER_KEY`),
  KEY `ITEM_KEY` (`ITEM_KEY`),
  KEY `NAKSHATRA_KEY` (`NAKSHATRA_KEY`),
  KEY `RASHI_KEY` (`RASHI_KEY`),
  KEY `PANDIT_KEY` (`PANDIT_KEY`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`ITEM_KEY`) REFERENCES `items` (`ITEM_KEY`),
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`NAKSHATRA_KEY`) REFERENCES `nakshatra` (`NAKSHATRA_KEY`),
  CONSTRAINT `order_details_ibfk_3` FOREIGN KEY (`RASHI_KEY`) REFERENCES `rashi` (`RASHI_KEY`),
  CONSTRAINT `order_details_ibfk_4` FOREIGN KEY (`PANDIT_KEY`) REFERENCES `pandit_profile` (`PANDIT_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `org`
--

DROP TABLE IF EXISTS `org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `org` (
  `ORG_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `UUID` varchar(36) NOT NULL,
  `ORG_NAME` varchar(100) NOT NULL,
  `ORG_ADDRESS` varchar(256) DEFAULT NULL,
  `ORG_PRIMARY_MOBILE_NUMBER` varchar(256) DEFAULT NULL,
  `ORG_EMAIL_ID` varchar(256) NOT NULL,
  `ORG_CREATION_DATE` datetime NOT NULL,
  `ORG_INACTIVATION_DATE` datetime DEFAULT NULL,
  `ORG_EXPIRY_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ORG_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `org_groups`
--

DROP TABLE IF EXISTS `org_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `org_groups` (
  `ORG_KEY` int(11) NOT NULL,
  `GROUP_KEY` int(11) NOT NULL,
  `CREATION_DATE` datetime NOT NULL,
  `INACTIVATION_DATE` datetime NOT NULL,
  `IS_ACTIVE` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ORG_KEY`,`GROUP_KEY`),
  KEY `FK_org_users_org` (`ORG_KEY`),
  KEY `FK_org_users_user` (`GROUP_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `org_users`
--

DROP TABLE IF EXISTS `org_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `org_users` (
  `ORG_KEY` int(11) NOT NULL,
  `USER_KEY` int(11) NOT NULL,
  `ORG_ADMIN` char(1) NOT NULL DEFAULT 'N',
  `CREATION_DATE` datetime NOT NULL,
  `INACTIVATION_DATE` datetime NOT NULL,
  `IS_ACTIVE` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ORG_KEY`,`USER_KEY`),
  KEY `FK_org_users_org` (`ORG_KEY`),
  KEY `FK_org_users_user` (`USER_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pandit_profile`
--

DROP TABLE IF EXISTS `pandit_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pandit_profile` (
  `PANDIT_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `PANDIT_UUID` varchar(36) DEFAULT NULL,
  `PANDIT_NAME` varchar(50) DEFAULT NULL,
  `PANDIT_DESCRIPTION` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`PANDIT_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `passcode_temp`
--

DROP TABLE IF EXISTS `passcode_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passcode_temp` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EMAIL_HASH` varchar(40) DEFAULT NULL,
  `PASS_CODE` varchar(40) DEFAULT NULL,
  `CREATED_DATE` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `PRIMARY_EMAIL_ID` (`EMAIL_HASH`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_variation_mapping`
--

DROP TABLE IF EXISTS `product_variation_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variation_mapping` (
  `VARIATION_ID` bigint(20) DEFAULT NULL,
  `VARIATION_TYPE` char(1) DEFAULT NULL,
  `VARIATION_VALUE` varchar(255) DEFAULT NULL,
  `VARIATION_DESC` text DEFAULT NULL,
  UNIQUE KEY `VARIATION_ID` (`VARIATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rashi`
--

DROP TABLE IF EXISTS `rashi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rashi` (
  `RASHI_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `RASHI_UUID` varchar(36) DEFAULT NULL,
  `RASHI_NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`RASHI_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resource_operation`
--

DROP TABLE IF EXISTS `resource_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_operation` (
  `OPERATION_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `UUID` varchar(36) NOT NULL,
  `OPERATION_NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`OPERATION_KEY`),
  UNIQUE KEY `OPERATION_UUID` (`UUID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subscription_config`
--

DROP TABLE IF EXISTS `subscription_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription_config` (
  `SUBSC_CONFIG_KEY` tinyint(4) NOT NULL AUTO_INCREMENT,
  `SUBSC_KEY` tinyint(4) NOT NULL,
  `CONFIG_TYPE_KEY` tinyint(4) NOT NULL,
  `UUID` varchar(36) DEFAULT NULL,
  `VALUES` int(11) NOT NULL,
  PRIMARY KEY (`SUBSC_CONFIG_KEY`),
  KEY `FK_subscription_config_subscription_type` (`SUBSC_KEY`),
  KEY `FK_subscription_config_configuration_type` (`CONFIG_TYPE_KEY`),
  CONSTRAINT `FK_subscription_config_configuration_type` FOREIGN KEY (`CONFIG_TYPE_KEY`) REFERENCES `configuration_type` (`CONFIG_TYPE_KEY`),
  CONSTRAINT `FK_subscription_config_subscription_type` FOREIGN KEY (`SUBSC_KEY`) REFERENCES `subscription_type` (`SUBSC_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subscription_type`
--

DROP TABLE IF EXISTS `subscription_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription_type` (
  `SUBSC_KEY` tinyint(4) NOT NULL AUTO_INCREMENT,
  `SUBSC_TYPE` varchar(50) DEFAULT NULL,
  `UUID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`SUBSC_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1`
--

DROP TABLE IF EXISTS `test1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test1` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DESC` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_users_table`
--

DROP TABLE IF EXISTS `test_users_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_users_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `units` (
  `UNITS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UUID` varchar(36) DEFAULT NULL,
  `UNITS` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `DESC` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`UNITS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `units_domains`
--

DROP TABLE IF EXISTS `units_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `units_domains` (
  `UNITS_DOMAINS` int(11) NOT NULL AUTO_INCREMENT,
  `UNIT_ID` int(11) NOT NULL,
  `DOMAIN_ID` int(11) NOT NULL,
  `UUID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`UNITS_DOMAINS`),
  UNIQUE KEY `UNIT_ID_DOMAIN_ID` (`UNIT_ID`,`DOMAIN_ID`),
  KEY `FK_units_domains_domains` (`DOMAIN_ID`),
  CONSTRAINT `FK_units_domains_domains` FOREIGN KEY (`DOMAIN_ID`) REFERENCES `domains` (`DOMAIN_ID`),
  CONSTRAINT `FK_units_domains_units` FOREIGN KEY (`UNIT_ID`) REFERENCES `units` (`UNITS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `USER_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `UUID` varchar(36) NOT NULL,
  `USER_NAME` varchar(50) NOT NULL DEFAULT '0',
  `PASSWORD_HASH` varchar(255) DEFAULT NULL,
  `FULL_NAME` varchar(256) DEFAULT '',
  `GENDER` varchar(40) DEFAULT NULL,
  `PRIMARY_EMAIL_ID` varchar(256) NOT NULL DEFAULT '',
  `EMAIL_HASH` varchar(40) NOT NULL DEFAULT '',
  `PRIMARY_MOBILE_NUMBER` varchar(40) NOT NULL DEFAULT '',
  `DEVICE_TOKEN` varchar(200) DEFAULT NULL,
  `ACCOUNT_EXPIRY_DATE` datetime DEFAULT NULL,
  `REFRESH_TOKEN` varchar(40) DEFAULT NULL,
  `ROLE` varchar(50) NOT NULL DEFAULT 'user',
  `IS_ACTIVE` char(1) DEFAULT NULL,
  `IS_PREMIUM` char(1) NOT NULL DEFAULT 'N',
  `SUBSC_KEY` tinyint(4) NOT NULL DEFAULT 1,
  `CREATION_DATE` datetime NOT NULL,
  `INACTIVATION_DATE` datetime DEFAULT NULL,
  `REGISTERED_DEVICES` smallint(6) DEFAULT 0,
  `DAILY_GOAL` int(10) DEFAULT 0,
  `USER_TOTAL_COUNT` bigint(20) DEFAULT 0,
  `SIGN_IN_METHOD` varchar(10) DEFAULT NULL,
  `DOMAIN_KEY` int(11) NOT NULL,
  `SUBSC_START_DATE` datetime DEFAULT NULL,
  `SUBSC_END_DATE` datetime DEFAULT NULL,
  `DELETED_UUID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`USER_KEY`),
  UNIQUE KEY `USER_UUID` (`UUID`),
  UNIQUE KEY `PRIMARY_MOBILE_NUMBER` (`PRIMARY_MOBILE_NUMBER`),
  UNIQUE KEY `EMAIL_HASH` (`EMAIL_HASH`),
  KEY `FK_user_subscription_config` (`SUBSC_KEY`) USING BTREE,
  KEY `DOMAIN_KEY` (`DOMAIN_KEY`),
  CONSTRAINT `FK_Domain_Key` FOREIGN KEY (`DOMAIN_KEY`) REFERENCES `domains` (`DOMAIN_ID`),
  CONSTRAINT `FK_user_subscription_type` FOREIGN KEY (`SUBSC_KEY`) REFERENCES `subscription_type` (`SUBSC_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_current_settings`
--

DROP TABLE IF EXISTS `user_current_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_current_settings` (
  `USER_KEY` int(11) DEFAULT NULL,
  `USER_SETTINGS` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `USER_STATUS` tinyint(1) DEFAULT NULL,
  `CREATION_DATE` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `user_current_settings_UN` (`USER_KEY`),
  CONSTRAINT `user_current_settings_FK` FOREIGN KEY (`USER_KEY`) REFERENCES `user` (`USER_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_goals`
--

DROP TABLE IF EXISTS `user_goals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_goals` (
  `USER_KEY` int(11) NOT NULL,
  `GOAL_DATE` datetime NOT NULL,
  `GOAL_LOCAL_DATE` datetime NOT NULL,
  `TZ` datetime NOT NULL,
  `DAILY_GOAL` int(11) DEFAULT NULL,
  KEY `FK__user` (`USER_KEY`),
  CONSTRAINT `FK__user` FOREIGN KEY (`USER_KEY`) REFERENCES `user` (`USER_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_mapping`
--

DROP TABLE IF EXISTS `user_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_mapping` (
  `USER_KEY` int(11) DEFAULT NULL,
  `WP_VENDOR_ID` bigint(20) DEFAULT NULL,
  `WP_CUSTOMER_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_temp`
--

DROP TABLE IF EXISTS `user_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_temp` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EMAIL_HASH` varchar(40) DEFAULT NULL,
  `REGISTRATION_CODE` varchar(40) DEFAULT NULL,
  `CREATED_DATE` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `PRIMARY_EMAIL_ID` (`EMAIL_HASH`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_transactions`
--

DROP TABLE IF EXISTS `user_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_transactions` (
  `TRANSACTION_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FROM_USER_KEY` int(11) DEFAULT NULL,
  `TO_USER_KEY` int(11) DEFAULT NULL,
  `TRANSACTION_UUID` varchar(36) DEFAULT NULL,
  `TRANSACTION_DATE` datetime DEFAULT NULL,
  `COUNTS` int(11) DEFAULT NULL,
  PRIMARY KEY (`TRANSACTION_ID`),
  KEY `FK__user_1` (`FROM_USER_KEY`),
  KEY `FK__user_2` (`TO_USER_KEY`),
  CONSTRAINT `FK__user_1` FOREIGN KEY (`FROM_USER_KEY`) REFERENCES `user` (`USER_KEY`),
  CONSTRAINT `FK__user_2` FOREIGN KEY (`TO_USER_KEY`) REFERENCES `user` (`USER_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_worldcities`
--

DROP TABLE IF EXISTS `vendor_worldcities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_worldcities` (
  `id` varchar(10) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  `city` varchar(120) DEFAULT NULL,
  `city_ascii` varchar(120) DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `lng` float DEFAULT NULL,
  `country` varchar(120) DEFAULT NULL,
  `iso2` varchar(2) DEFAULT NULL,
  `iso3` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_worldcities_db`
--

DROP TABLE IF EXISTS `vendor_worldcities_db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_worldcities_db` (
  `city_ascii` text DEFAULT NULL,
  `uuid` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_worldcities_deprecated`
--

DROP TABLE IF EXISTS `vendor_worldcities_deprecated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_worldcities_deprecated` (
  `id` varchar(10) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  `city` varchar(120) DEFAULT NULL,
  `city_ascii` varchar(120) DEFAULT NULL,
  `city_alt` varchar(1000) DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `lng` float DEFAULT NULL,
  `country` varchar(120) DEFAULT NULL,
  `iso2` varchar(2) DEFAULT NULL,
  `iso3` varchar(3) DEFAULT NULL,
  `admin_name` varchar(120) DEFAULT NULL,
  `admin_name_ascii` varchar(120) DEFAULT NULL,
  `admin_code` varchar(6) DEFAULT NULL,
  `admin_type` varchar(27) DEFAULT NULL,
  `capital` varchar(7) DEFAULT NULL,
  `density` float DEFAULT NULL,
  `population` float DEFAULT NULL,
  `population_proper` float DEFAULT NULL,
  `ranking` int(11) DEFAULT NULL,
  `timezone` varchar(120) DEFAULT NULL,
  `same_name` varchar(5) DEFAULT NULL,
  `country_id` int(11) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_worldcountries`
--

DROP TABLE IF EXISTS `vendor_worldcountries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_worldcountries` (
  `country_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) DEFAULT NULL,
  `country` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`country_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `view_categories_in_domains`
--

DROP TABLE IF EXISTS `view_categories_in_domains`;
/*!50001 DROP VIEW IF EXISTS `view_categories_in_domains`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_categories_in_domains` AS SELECT 
 1 AS `CATEGORY_NAME`,
 1 AS `CATEGORY_UUID`,
 1 AS `CATEGORY_DESC`,
 1 AS `DOMAIN_NAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_items_in_categories_and_domains`
--

DROP TABLE IF EXISTS `view_items_in_categories_and_domains`;
/*!50001 DROP VIEW IF EXISTS `view_items_in_categories_and_domains`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_items_in_categories_and_domains` AS SELECT 
 1 AS `ITEM_NAME`,
 1 AS `ITEM_DESC`,
 1 AS `ITEM_SPEC`,
 1 AS `CATEGORY_NAME`,
 1 AS `CATEGORY_UUID`,
 1 AS `DOMAIN_NAME`,
 1 AS `UUID`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `get_event_summary`
--

/*!50001 DROP VIEW IF EXISTS `get_event_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`kliqitdba`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `get_event_summary` AS select `e`.`EVENT_NAME` AS `EVENT_NAME`,`e`.`UUID` AS `UUID`,`ec`.`EVENT_KEY` AS `EVENT_KEY`,`ec`.`USER_KEY` AS `USER_KEY`,`ec`.`DEVICE_KEY` AS `DEVICE_KEY`,`ec`.`COUNT_DATE` AS `COUNT_DATE`,`ec`.`LOCAL_DATE` AS `LOCAL_DATE`,`ec`.`TZ` AS `TZ`,`ec`.`COUNTS` AS `COUNTS` from ((`events_counts` `ec` join `events` `e`) join `user` `u`) where `ec`.`USER_KEY` = `u`.`USER_KEY` and `ec`.`EVENT_KEY` = `e`.`EVENT_KEY` and exists(select 1 from ((`events_counts` `ec1` join `user` `u1`) join `events` `e1`) where `ec1`.`USER_KEY` = `u1`.`USER_KEY` and `ec1`.`EVENT_KEY` = `e1`.`EVENT_KEY` limit 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `get_events_items_summary`
--

/*!50001 DROP VIEW IF EXISTS `get_events_items_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`kliqitdba`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `get_events_items_summary` AS select `e`.`EVENT_NAME` AS `EVENT_NAME`,`e`.`UUID` AS `UUID`,`ec`.`EVENT_KEY` AS `EVENT_KEY`,`ec`.`ITEM_KEY` AS `ITEM_KEY`,`ec`.`USER_KEY` AS `USER_KEY`,`ec`.`DEVICE_KEY` AS `DEVICE_KEY`,`ec`.`COUNT_DATE` AS `COUNT_DATE`,`ec`.`LOCAL_DATE` AS `LOCAL_DATE`,`ec`.`TZ` AS `TZ`,`ec`.`COUNTS` AS `COUNTS` from ((`events_counts` `ec` join `events` `e`) join `user` `u`) where `ec`.`USER_KEY` = `u`.`USER_KEY` and `ec`.`EVENT_KEY` = `e`.`EVENT_KEY` and exists(select 1 from ((`events_counts` `ec1` join `user` `u1`) join `events` `e1`) where `ec1`.`USER_KEY` = `u1`.`USER_KEY` and `ec1`.`EVENT_KEY` = `e1`.`EVENT_KEY` limit 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `get_events_items_summary_1`
--

/*!50001 DROP VIEW IF EXISTS `get_events_items_summary_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`kliqitdba`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `get_events_items_summary_1` AS select `e`.`EVENT_NAME` AS `EVENT_NAME`,`e`.`UUID` AS `UUID`,`ec`.`EVENT_KEY` AS `EVENT_KEY`,`ec`.`ITEM_KEY` AS `ITEM_KEY`,`ec`.`USER_KEY` AS `USER_KEY`,`ec`.`DEVICE_KEY` AS `DEVICE_KEY`,`ec`.`COUNT_DATE` AS `COUNT_DATE`,`ec`.`LOCAL_DATE` AS `LOCAL_DATE`,`es`.`EVENT_START_TIME` AS `EVENT_START_TIME`,`ec`.`TZ` AS `TZ`,`ec`.`COUNTS` AS `COUNTS` from (((`events_counts` `ec` join `events` `e`) join `user` `u`) join `events_schedule` `es`) where `ec`.`USER_KEY` = `u`.`USER_KEY` and `e`.`EVENT_KEY` = `es`.`EVENT_KEY` and `ec`.`EVENT_KEY` = `e`.`EVENT_KEY` and exists(select 1 from ((`events_counts` `ec1` join `user` `u1`) join `events` `e1`) where `ec1`.`USER_KEY` = `u1`.`USER_KEY` and `ec1`.`EVENT_KEY` = `e1`.`EVENT_KEY` limit 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `get_groups_summary`
--

/*!50001 DROP VIEW IF EXISTS `get_groups_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`kliqitdba`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `get_groups_summary` AS select `g`.`GROUP_NAME` AS `GROUP_NAME`,`g`.`UUID` AS `UUID`,`gc`.`GROUP_KEY` AS `GROUP_KEY`,`gc`.`USER_KEY` AS `USER_KEY`,`gc`.`DEVICE_KEY` AS `DEVICE_KEY`,`gc`.`COUNT_DATE` AS `COUNT_DATE`,`gc`.`LOCAL_DATE` AS `LOCAL_DATE`,`gc`.`TZ` AS `TZ`,`gc`.`LOCLAT` AS `LOCLAT`,`gc`.`LOCLONG` AS `LOCLONG`,`gc`.`COUNTS` AS `COUNTS` from (((`group_counts` `gc` join `group` `g`) join `group_user` `gu`) join `user` `u`) where `gu`.`USER_KEY` = `u`.`USER_KEY` and `gc`.`USER_KEY` = `u`.`USER_KEY` and `gu`.`USER_KEY` = `u`.`USER_KEY` and `gc`.`GROUP_KEY` = `g`.`GROUP_KEY` and `gc`.`GROUP_KEY` = `gu`.`GROUP_KEY` and exists(select 1 from (((`group_counts` `gc1` join `group_user` `gu1`) join `user` `u1`) join `group` `g1`) where `gu1`.`USER_KEY` = `u1`.`USER_KEY` and `gc1`.`USER_KEY` = `u1`.`USER_KEY` and `gu1`.`USER_KEY` = `u1`.`USER_KEY` and `gc1`.`GROUP_KEY` = `g1`.`GROUP_KEY` and `gc1`.`GROUP_KEY` = `gu1`.`GROUP_KEY` and `gu1`.`GROUP_KEY` = `g1`.`GROUP_KEY` limit 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `get_groups_summary_with_different_tz`
--

/*!50001 DROP VIEW IF EXISTS `get_groups_summary_with_different_tz`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`kliqitdba`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `get_groups_summary_with_different_tz` AS select `g`.`GROUP_NAME` AS `GROUP_NAME`,`g`.`UUID` AS `UUID`,`gc`.`GROUP_KEY` AS `GROUP_KEY`,`gc`.`USER_KEY` AS `USER_KEY`,`gc`.`DEVICE_KEY` AS `DEVICE_KEY`,`gc`.`COUNT_DATE` AS `COUNT_DATE`,`gc`.`LOCAL_DATE` AS `LOCAL_DATE`,convert_tz(`gc`.`COUNT_DATE`,'UTC','Asia/Kolkata') AS `IST`,convert_tz(`gc`.`COUNT_DATE`,'UTC','America/Toronto') AS `EST`,`gc`.`TZ` AS `TZ`,`gc`.`COUNTS` AS `COUNTS` from (((`group_counts` `gc` join `group` `g`) join `group_user` `gu`) join `user` `u`) where `gu`.`USER_KEY` = `u`.`USER_KEY` and `gc`.`USER_KEY` = `u`.`USER_KEY` and `gu`.`USER_KEY` = `u`.`USER_KEY` and `gc`.`GROUP_KEY` = `g`.`GROUP_KEY` and `gc`.`GROUP_KEY` = `gu`.`GROUP_KEY` and exists(select 1 from (((`group_counts` `gc1` join `group_user` `gu1`) join `user` `u1`) join `group` `g1`) where `gu1`.`USER_KEY` = `u1`.`USER_KEY` and `gc1`.`USER_KEY` = `u1`.`USER_KEY` and `gu1`.`USER_KEY` = `u1`.`USER_KEY` and `gc1`.`GROUP_KEY` = `g1`.`GROUP_KEY` and `gc1`.`GROUP_KEY` = `gu1`.`GROUP_KEY` and `gu1`.`GROUP_KEY` = `g1`.`GROUP_KEY` limit 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `get_subscriptions`
--

/*!50001 DROP VIEW IF EXISTS `get_subscriptions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`kliqitdba`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `get_subscriptions` AS select `st`.`SUBSC_TYPE` AS `SUBSC_TYPE`,`st`.`UUID` AS `SUBSCRIPTION_UUID`,`sc`.`SUBSC_CONFIG_KEY` AS `SUBSC_CONFIG_KEY`,`ct`.`CONFIG_TYPE_DESC` AS `CONFIG_TYPE_DESC`,`ct`.`UUID` AS `OONFIGURATION_TYPE_UUID`,`sc`.`VALUES` AS `VALUES`,`sc`.`UUID` AS `SUBSCRIPTION_CONFIG_UUID`,`ct`.`RESOURCE_IDENTIFIER` AS `RESOURCE_IDENTIFIER`,`ct`.`METHOD_TYPE` AS `METHOD_TYPE` from ((`subscription_type` `st` join `subscription_config` `sc`) join `configuration_type` `ct`) where `st`.`SUBSC_KEY` = `sc`.`SUBSC_KEY` and `sc`.`CONFIG_TYPE_KEY` = `ct`.`CONFIG_TYPE_KEY` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `get_user_mappings`
--

/*!50001 DROP VIEW IF EXISTS `get_user_mappings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`kliqitdba`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `get_user_mappings` AS select `t1`.`USER_KEY` AS `USER_KEY`,`t2`.`WP_VENDOR_ID` AS `WP_VENDOR_ID`,`t2`.`WP_CUSTOMER_ID` AS `WP_CUSTOMER_ID`,`t1`.`UUID` AS `UUID`,`t1`.`FULL_NAME` AS `FULL_NAME` from (`user` `t1` join `user_mapping` `t2`) where `t1`.`USER_KEY` = `t2`.`USER_KEY` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_categories_in_domains`
--

/*!50001 DROP VIEW IF EXISTS `view_categories_in_domains`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`kliqitdba`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_categories_in_domains` AS select `c`.`CATEGORY_NAME` AS `CATEGORY_NAME`,`c`.`CATEGORY_UUID` AS `CATEGORY_UUID`,`c`.`CATEGORY_DESC` AS `CATEGORY_DESC`,`d`.`DOMAIN_NAME` AS `DOMAIN_NAME` from (`categories` `c` join `domains` `d`) where `c`.`DOMAIN_KEY` = `d`.`DOMAIN_ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_items_in_categories_and_domains`
--

/*!50001 DROP VIEW IF EXISTS `view_items_in_categories_and_domains`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`kliqitdba`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_items_in_categories_and_domains` AS select `i`.`ITEM_NAME` AS `ITEM_NAME`,`i`.`ITEM_DESC` AS `ITEM_DESC`,`i`.`ITEM_SPEC` AS `ITEM_SPEC`,`c`.`CATEGORY_NAME` AS `CATEGORY_NAME`,`c`.`CATEGORY_UUID` AS `CATEGORY_UUID`,`d`.`DOMAIN_NAME` AS `DOMAIN_NAME`,`d`.`UUID` AS `UUID` from ((`items` `i` join `categories` `c`) join `domains` `d`) where `i`.`CATEGORY_KEY` = `c`.`CATEGORY_KEY` and `c`.`DOMAIN_KEY` = `d`.`DOMAIN_ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-07  6:19:34
