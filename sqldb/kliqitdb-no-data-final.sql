-- MySQL dump 10.19  Distrib 10.2.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: kliqitDBDEV
-- ------------------------------------------------------
-- Server version	10.2.38-MariaDB-10.2.38+maria~xenial-log

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
-- Table structure for table `a2_Anushthan_Type`
--

DROP TABLE IF EXISTS `a2_Anushthan_Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a2_Anushthan_Type` (
  `ANUSHTHAN_TYPE_KEY` smallint(4) NOT NULL AUTO_INCREMENT,
  `UUID` varchar(36) DEFAULT NULL,
  `ANUSHTHAN_TYPE_NAME` varchar(50) DEFAULT NULL,
  `ANUSHTHAN_TYPE_DESCRIPTION` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ANUSHTHAN_TYPE_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `a2_Anusthan_Sankhya`
--

DROP TABLE IF EXISTS `a2_Anusthan_Sankhya`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a2_Anusthan_Sankhya` (
  `ANUSHTHAN_SANKHYA_KEY` smallint(4) NOT NULL DEFAULT 0,
  `UUID` varchar(36) NOT NULL,
  `ANUSHTHAN_SANKHYA_NAME` varchar(50) NOT NULL,
  PRIMARY KEY (`ANUSHTHAN_SANKHYA_KEY`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `a2_Anusthatan`
--

DROP TABLE IF EXISTS `a2_Anusthatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `a2_gotra`
--

DROP TABLE IF EXISTS `a2_gotra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a2_gotra` (
  `GOTRA_KEY` smallint(4) NOT NULL AUTO_INCREMENT,
  `UUID` varchar(36) NOT NULL,
  `GOTRA_NAME` varchar(50) NOT NULL,
  PRIMARY KEY (`GOTRA_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `CATEGORY_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `CATEGORY_NAME` varchar(50) DEFAULT NULL,
  `CATEGORY_UUID` varchar(36) DEFAULT NULL,
  `CATEGORY_DESC` varchar(50) DEFAULT NULL,
  `DOMAIN_KEY` int(11) DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_KEY`),
  KEY `DOMAIN_KEY` (`DOMAIN_KEY`),
  CONSTRAINT `FK1_DOMAIN_KEY` FOREIGN KEY (`DOMAIN_KEY`) REFERENCES `domains` (`DOMAIN_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `configuration_parameters`
--

DROP TABLE IF EXISTS `configuration_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_parameters` (
  `KEY` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `configuration_type`
--

DROP TABLE IF EXISTS `configuration_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `counts`
--

DROP TABLE IF EXISTS `counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `counts` (
  `COUNTS_KEY` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_KEY` int(10) NOT NULL,
  `DEVICE_KEY` int(10) NOT NULL,
  `COUNT_DATE` datetime NOT NULL,
  `LOCAL_DATE` datetime NOT NULL,
  `TZ` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOCLAT` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOCLONG` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COUNTS` int(11) NOT NULL DEFAULT 1,
  `UNITS_DOMAINS` int(11) NOT NULL DEFAULT 0,
  `COUNTER_NUMBER` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'C1',
  PRIMARY KEY (`COUNTS_KEY`),
  KEY `FK_DEVICE_DAILY_COUNT_USER_LINK` (`USER_KEY`),
  KEY `FK_DEVICE_DAILY_COUNT_DEVICE_DETAIL_LINK` (`DEVICE_KEY`),
  KEY `counts_FK` (`DEVICE_KEY`,`USER_KEY`),
  KEY `FK_counts_units_domains` (`UNITS_DOMAINS`),
  CONSTRAINT `FK_counts_device` FOREIGN KEY (`DEVICE_KEY`) REFERENCES `device` (`DEVICE_KEY`),
  CONSTRAINT `FK_counts_units_domains` FOREIGN KEY (`UNITS_DOMAINS`) REFERENCES `units_domains` (`UNITS_DOMAINS`),
  CONSTRAINT `FK_counts_user` FOREIGN KEY (`USER_KEY`) REFERENCES `user` (`USER_KEY`),
  CONSTRAINT `counts_FK` FOREIGN KEY (`DEVICE_KEY`, `USER_KEY`) REFERENCES `device` (`DEVICE_KEY`, `USER_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `counts_backup`
--

DROP TABLE IF EXISTS `counts_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `counts_backup` (
  `COUNTS_KEY` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_KEY` int(10) NOT NULL,
  `DEVICE_KEY` int(10) NOT NULL,
  `COUNT_DATE` datetime NOT NULL,
  `LOCAL_DATE` datetime NOT NULL,
  `TZ` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOCLAT` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOCLONG` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `daily_counts_summary`
--

DROP TABLE IF EXISTS `daily_counts_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device` (
  `DEVICE_KEY` int(10) NOT NULL AUTO_INCREMENT,
  `USER_KEY` int(10) NOT NULL,
  `UUID` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEVICE_NAME` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEVICE_HASH` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEVICE_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `DEVICE_FIRMWARE_VERSION` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `REGISTRATION_DATE` datetime DEFAULT NULL,
  `INACTIVATION_DATE` datetime DEFAULT NULL,
  `REACTIVATION_DATE` datetime DEFAULT NULL,
  `C1` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'C1',
  `C2` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'C2',
  `PROMO_CODE` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DEVICE_KEY`),
  UNIQUE KEY `USER_DEVICE_KEY` (`DEVICE_KEY`,`USER_KEY`),
  UNIQUE KEY `UUID` (`UUID`),
  UNIQUE KEY `USER_KEY_DEVICE_HASH` (`USER_KEY`,`DEVICE_HASH`),
  KEY `FK_DEVICE_DETAIL_USER_LINK` (`USER_KEY`),
  CONSTRAINT `FK_device_user` FOREIGN KEY (`USER_KEY`) REFERENCES `user` (`USER_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domains`
--

DROP TABLE IF EXISTS `domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domains` (
  `DOMAIN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DOMAIN_NAME` varchar(255) NOT NULL,
  `UUID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`DOMAIN_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_daily_counts_summary`
--

DROP TABLE IF EXISTS `event_daily_counts_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_goal`
--

DROP TABLE IF EXISTS `event_goal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_users`
--

DROP TABLE IF EXISTS `event_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `EVENT_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `CREATOR_USER_KEY` int(11) DEFAULT NULL,
  `GROUP_KEY` int(11) DEFAULT NULL,
  `UUID` varchar(36) DEFAULT NULL,
  `EVENT_NAME` varchar(50) DEFAULT NULL,
  `EVENT_CREATION_DATE` datetime NOT NULL,
  `TOTAL_EVENT_MEMBERS` int(11) NOT NULL DEFAULT 0,
  `TOTAL_EVENT_COUNTS` bigint(20) NOT NULL DEFAULT 0,
  `CITY_ID` varchar(10) DEFAULT NULL,
  `DOMAIN_KEY` int(11) DEFAULT NULL,
  `IS_PRIVATE` tinyint(4) NOT NULL DEFAULT 1,
  `SUBSC_KEY` tinyint(4) DEFAULT NULL,
  `IS_ACTIVE` char(1) DEFAULT NULL,
  PRIMARY KEY (`EVENT_KEY`),
  KEY `fk_event_user_key` (`CREATOR_USER_KEY`) USING BTREE,
  KEY `DOMAIN_KEY` (`DOMAIN_KEY`),
  KEY `FK_events_group` (`GROUP_KEY`),
  KEY `SUBSC_KEY` (`SUBSC_KEY`),
  CONSTRAINT `FK2_events_domain_key` FOREIGN KEY (`DOMAIN_KEY`) REFERENCES `domains` (`DOMAIN_ID`),
  CONSTRAINT `FK_creator_user_key` FOREIGN KEY (`CREATOR_USER_KEY`) REFERENCES `user` (`USER_KEY`),
  CONSTRAINT `FK_events_group` FOREIGN KEY (`GROUP_KEY`) REFERENCES `group` (`GROUP_KEY`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `events_ibfk_1` FOREIGN KEY (`SUBSC_KEY`) REFERENCES `subscription_type` (`SUBSC_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `events_counts`
--

DROP TABLE IF EXISTS `events_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events_counts` (
  `EVENT_KEY` int(11) NOT NULL,
  `USER_KEY` int(11) NOT NULL,
  `DEVICE_KEY` int(11) NOT NULL,
  `COUNT_DATE` datetime DEFAULT NULL,
  `LOCAL_DATE` datetime DEFAULT NULL,
  `TZ` varchar(40) DEFAULT NULL,
  `LOCLAT` varchar(15) DEFAULT NULL,
  `LOCLONG` varchar(15) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `events_schedule`
--

DROP TABLE IF EXISTS `events_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `get_event_summary`
--

DROP TABLE IF EXISTS `get_event_summary`;
/*!50001 DROP VIEW IF EXISTS `get_event_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `get_event_summary` (
  `EVENT_NAME` tinyint NOT NULL,
  `UUID` tinyint NOT NULL,
  `EVENT_KEY` tinyint NOT NULL,
  `USER_KEY` tinyint NOT NULL,
  `DEVICE_KEY` tinyint NOT NULL,
  `COUNT_DATE` tinyint NOT NULL,
  `LOCAL_DATE` tinyint NOT NULL,
  `TZ` tinyint NOT NULL,
  `COUNTS` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `get_groups_summary`
--

DROP TABLE IF EXISTS `get_groups_summary`;
/*!50001 DROP VIEW IF EXISTS `get_groups_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `get_groups_summary` (
  `GROUP_NAME` tinyint NOT NULL,
  `UUID` tinyint NOT NULL,
  `GROUP_KEY` tinyint NOT NULL,
  `USER_KEY` tinyint NOT NULL,
  `DEVICE_KEY` tinyint NOT NULL,
  `COUNT_DATE` tinyint NOT NULL,
  `LOCAL_DATE` tinyint NOT NULL,
  `TZ` tinyint NOT NULL,
  `COUNTS` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `get_groups_summary_with_different_tz`
--

DROP TABLE IF EXISTS `get_groups_summary_with_different_tz`;
/*!50001 DROP VIEW IF EXISTS `get_groups_summary_with_different_tz`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `get_groups_summary_with_different_tz` (
  `GROUP_NAME` tinyint NOT NULL,
  `UUID` tinyint NOT NULL,
  `GROUP_KEY` tinyint NOT NULL,
  `USER_KEY` tinyint NOT NULL,
  `DEVICE_KEY` tinyint NOT NULL,
  `COUNT_DATE` tinyint NOT NULL,
  `LOCAL_DATE` tinyint NOT NULL,
  `IST` tinyint NOT NULL,
  `EST` tinyint NOT NULL,
  `TZ` tinyint NOT NULL,
  `COUNTS` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `get_subscriptions`
--

DROP TABLE IF EXISTS `get_subscriptions`;
/*!50001 DROP VIEW IF EXISTS `get_subscriptions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `get_subscriptions` (
  `SUBSC_TYPE` tinyint NOT NULL,
  `SUBSCRIPTION_UUID` tinyint NOT NULL,
  `SUBSC_CONFIG_KEY` tinyint NOT NULL,
  `CONFIG_TYPE_DESC` tinyint NOT NULL,
  `OONFIGURATION_TYPE_UUID` tinyint NOT NULL,
  `VALUES` tinyint NOT NULL,
  `SUBSCRIPTION_CONFIG_UUID` tinyint NOT NULL,
  `RESOURCE_IDENTIFIER` tinyint NOT NULL,
  `METHOD_TYPE` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `GROUP_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `CREATOR_USER_KEY` int(11) NOT NULL,
  `UUID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `IS_ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `GROUP_CREATION_DATE` datetime NOT NULL,
  `GROUP_INACTIVATION_DATE` datetime DEFAULT NULL,
  `GROUP_REACTIVATION_DATE` datetime DEFAULT NULL,
  `GROUP_GOAL` bigint(20) NOT NULL DEFAULT 0,
  `TOTAL_GROUP_MEMBERS` int(11) NOT NULL DEFAULT 0,
  `TOTAL_GROUP_COUNTS` bigint(20) NOT NULL DEFAULT 0,
  `UNITS_DOMAINS` int(11) NOT NULL DEFAULT 0,
  `CITY_ID` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUBSC_KEY` tinyint(11) DEFAULT NULL,
  PRIMARY KEY (`GROUP_KEY`),
  KEY `FK_group_user` (`CREATOR_USER_KEY`),
  KEY `FK_group_units_domains` (`UNITS_DOMAINS`),
  KEY `SUBSC_KEY` (`SUBSC_KEY`),
  CONSTRAINT `FK_group_units_domains` FOREIGN KEY (`UNITS_DOMAINS`) REFERENCES `units_domains` (`UNITS_DOMAINS`),
  CONSTRAINT `FK_group_user` FOREIGN KEY (`CREATOR_USER_KEY`) REFERENCES `user` (`USER_KEY`),
  CONSTRAINT `group_ibfk_1` FOREIGN KEY (`SUBSC_KEY`) REFERENCES `subscription_type` (`SUBSC_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_counts`
--

DROP TABLE IF EXISTS `group_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_counts` (
  `GROUP_KEY` int(11) NOT NULL,
  `USER_KEY` int(11) NOT NULL,
  `DEVICE_KEY` int(11) NOT NULL,
  `COUNT_DATE` datetime NOT NULL,
  `LOCAL_DATE` datetime DEFAULT NULL,
  `TZ` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOCLAT` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOCLONG` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_counts_backup`
--

DROP TABLE IF EXISTS `group_counts_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_counts_backup` (
  `GROUP_KEY` int(11) NOT NULL,
  `USER_KEY` int(11) NOT NULL,
  `DEVICE_KEY` int(11) NOT NULL,
  `COUNT_DATE` datetime NOT NULL,
  `LOCAL_DATE` datetime DEFAULT NULL,
  `TZ` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOCLAT` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOCLONG` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COUNTS` bigint(20) NOT NULL DEFAULT 0,
  `UNITS_DOMAINS` int(11) NOT NULL DEFAULT 0,
  KEY `FK_group_counts_group` (`GROUP_KEY`) USING BTREE,
  KEY `FK_group_counts_user` (`USER_KEY`) USING BTREE,
  KEY `FK_group_counts_device` (`DEVICE_KEY`) USING BTREE,
  KEY `group_counts_FK` (`DEVICE_KEY`,`USER_KEY`) USING BTREE,
  KEY `FK_group_counts_units_domains` (`UNITS_DOMAINS`) USING BTREE,
  CONSTRAINT `group_counts_backup_ibfk_1` FOREIGN KEY (`DEVICE_KEY`) REFERENCES `device` (`DEVICE_KEY`),
  CONSTRAINT `group_counts_backup_ibfk_2` FOREIGN KEY (`GROUP_KEY`) REFERENCES `group` (`GROUP_KEY`),
  CONSTRAINT `group_counts_backup_ibfk_3` FOREIGN KEY (`UNITS_DOMAINS`) REFERENCES `units_domains` (`UNITS_DOMAINS`),
  CONSTRAINT `group_counts_backup_ibfk_4` FOREIGN KEY (`USER_KEY`) REFERENCES `user` (`USER_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_daily_counts_summary`
--

DROP TABLE IF EXISTS `group_daily_counts_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_goals`
--

DROP TABLE IF EXISTS `group_goals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_invitation` (
  `GROUP_INVITATION_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `GROUP_KEY` int(11) NOT NULL,
  `EMAIL_HASH` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `PRIMARY_EMAIL_ID` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `INVITE_CODE` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `INVITATION_DATE` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`GROUP_INVITATION_KEY`),
  UNIQUE KEY `GROUP_KEY_EMAIL_HASH` (`GROUP_KEY`,`EMAIL_HASH`),
  KEY `FK_group_invitation_group` (`GROUP_KEY`),
  CONSTRAINT `FK_group_invitation_group` FOREIGN KEY (`GROUP_KEY`) REFERENCES `group` (`GROUP_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_user`
--

DROP TABLE IF EXISTS `group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_user` (
  `GROUP_KEY` int(11) NOT NULL,
  `USER_KEY` int(11) NOT NULL,
  `IS_ADMIN` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IS_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IS_DEFAULT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CREATION_DATE` datetime DEFAULT NULL,
  `INACTIVATION_DATE` datetime DEFAULT NULL,
  `REACTIVATION_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`GROUP_KEY`,`USER_KEY`),
  KEY `FK__user` (`USER_KEY`),
  CONSTRAINT `FK_group_user_group` FOREIGN KEY (`GROUP_KEY`) REFERENCES `group` (`GROUP_KEY`),
  CONSTRAINT `FK_group_user_user` FOREIGN KEY (`USER_KEY`) REFERENCES `user` (`USER_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `ITEM_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `CATEGORY_KEY` int(11) DEFAULT NULL,
  `ITEM_NAME` varchar(50) DEFAULT NULL,
  `ITEM_DESC` varchar(50) DEFAULT NULL,
  `ITEM_SPEC` varchar(50) DEFAULT NULL,
  `ITEM_UUID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ITEM_KEY`),
  KEY `CATEGORY_KEY` (`CATEGORY_KEY`),
  CONSTRAINT `FK1_CATEGORY_KEY` FOREIGN KEY (`CATEGORY_KEY`) REFERENCES `categories` (`CATEGORY_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth_client_details`
--

DROP TABLE IF EXISTS `oauth_client_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_client_details` (
  `client_id` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `resource_ids` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `client_secret` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scope` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authorized_grant_types` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authorities` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) COLLATE utf8_unicode_ci DEFAULT NULL,
  `autoapprove` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auto_approve` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `org`
--

DROP TABLE IF EXISTS `org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org` (
  `ORG_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `UUID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ORG_NAME` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ORG_ADDRESS` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ORG_PRIMARY_MOBILE_NUMBER` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ORG_EMAIL_ID` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_groups` (
  `ORG_KEY` int(11) NOT NULL,
  `GROUP_KEY` int(11) NOT NULL,
  `CREATION_DATE` datetime NOT NULL,
  `INACTIVATION_DATE` datetime NOT NULL,
  `IS_ACTIVE` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_users` (
  `ORG_KEY` int(11) NOT NULL,
  `USER_KEY` int(11) NOT NULL,
  `ORG_ADMIN` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `CREATION_DATE` datetime NOT NULL,
  `INACTIVATION_DATE` datetime NOT NULL,
  `IS_ACTIVE` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ORG_KEY`,`USER_KEY`),
  KEY `FK_org_users_org` (`ORG_KEY`),
  KEY `FK_org_users_user` (`USER_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resource_operation`
--

DROP TABLE IF EXISTS `resource_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_operation` (
  `OPERATION_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `UUID` varchar(36) NOT NULL,
  `OPERATION_NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`OPERATION_KEY`),
  UNIQUE KEY `OPERATION_UUID` (`UUID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subscription_config`
--

DROP TABLE IF EXISTS `subscription_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subscription_type`
--

DROP TABLE IF EXISTS `subscription_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_type` (
  `SUBSC_KEY` tinyint(4) NOT NULL AUTO_INCREMENT,
  `SUBSC_TYPE` varchar(50) DEFAULT NULL,
  `UUID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`SUBSC_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `units` (
  `UNITS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UUID` varchar(36) DEFAULT NULL,
  `UNITS` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DESC` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`UNITS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `units_domains`
--

DROP TABLE IF EXISTS `units_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `USER_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `UUID` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `USER_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `PASSWORD_HASH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FULL_NAME` varchar(256) COLLATE utf8_unicode_ci DEFAULT '',
  `GENDER` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRIMARY_EMAIL_ID` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `EMAIL_HASH` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `PRIMARY_MOBILE_NUMBER` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `DEVICE_TOKEN` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCOUNT_EXPIRY_DATE` datetime DEFAULT NULL,
  `REFRESH_TOKEN` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ROLE` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'user',
  `IS_ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_PREMIUM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SUBSC_KEY` tinyint(4) NOT NULL DEFAULT 1,
  `CREATION_DATE` datetime NOT NULL,
  `INACTIVATION_DATE` datetime DEFAULT NULL,
  `REGISTERED_DEVICES` smallint(6) DEFAULT 0,
  `DAILY_GOAL` int(10) DEFAULT 0,
  `USER_TOTAL_COUNT` bigint(20) DEFAULT 0,
  `SIGN_IN_METHOD` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DOMAIN_KEY` int(11) NOT NULL,
  `SUBSC_START_DATE` datetime DEFAULT NULL,
  `SUBSC_END_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_KEY`),
  UNIQUE KEY `USER_UUID` (`UUID`),
  UNIQUE KEY `PRIMARY_MOBILE_NUMBER` (`PRIMARY_MOBILE_NUMBER`),
  UNIQUE KEY `EMAIL_HASH` (`EMAIL_HASH`),
  KEY `FK_user_subscription_config` (`SUBSC_KEY`) USING BTREE,
  KEY `DOMAIN_KEY` (`DOMAIN_KEY`),
  CONSTRAINT `FK_Domain_Key` FOREIGN KEY (`DOMAIN_KEY`) REFERENCES `domains` (`DOMAIN_ID`),
  CONSTRAINT `FK_user_subscription_type` FOREIGN KEY (`SUBSC_KEY`) REFERENCES `subscription_type` (`SUBSC_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_current_settings`
--

DROP TABLE IF EXISTS `user_current_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_current_settings` (
  `USER_KEY` int(11) DEFAULT NULL,
  `USER_SETTINGS` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `CREATION_DATE` datetime DEFAULT NULL,
  UNIQUE KEY `user_current_settings_UN` (`USER_KEY`),
  CONSTRAINT `user_current_settings_FK` FOREIGN KEY (`USER_KEY`) REFERENCES `user` (`USER_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_goals`
--

DROP TABLE IF EXISTS `user_goals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
-- Table structure for table `user_transactions`
--

DROP TABLE IF EXISTS `user_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_worldcities`
--

DROP TABLE IF EXISTS `vendor_worldcities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_worldcities` (
  `id` varchar(10) NOT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  `city` varchar(120) DEFAULT NULL,
  `city_ascii` varchar(120) DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `lng` float DEFAULT NULL,
  `country` varchar(120) DEFAULT NULL,
  `iso2` varchar(2) DEFAULT NULL,
  `iso3` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'kliqitDBDEV'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_a1_get_anushthan_gotra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_a1_get_anushthan_gotra`()
BEGIN
SELECT g.GOTRA_NAME, g.UUID
FROM `a2_gotra` g;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_a1_get_anushthan_sankya_type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_a1_get_anushthan_sankya_type`()
BEGIN
SELECT a.ANUSHTHAN_SANKHYA_NAME, a.UUID
FROM `a2_Anusthan_Sankhya` a;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_a1_get_anushthan_type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_a1_get_anushthan_type`()
BEGIN
SELECT a.ANUSHTHAN_TYPE_NAME, a.ANUSHTHAN_TYPE_DESCRIPTION, a.UUID
FROM `a2_Anushthan_Type` a;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_a2_insert_anushthan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_a2_insert_anushthan`(
	IN `v_user_uuid` VARCHAR(50),
	IN `v_anushthan_type_uuid` VARCHAR(50),
	IN `v_anushthan_sankhya_uuid` VARCHAR(50),
	IN `v_gotra_uuid` VARCHAR(50),
	IN `v_anushthan_name` VARCHAR(50),
	IN `v_anushthan_description` VARCHAR(50),
	IN `v_anushthan_address` VARCHAR(50),
	IN `v_anushthan_donation_amount` DOUBLE,
	IN `v_anushthan_material_amount` DOUBLE
)
BEGIN
		DECLARE l_user_key INT;
		DECLARE l_anushthan_type_key INT;
		DECLARE l_anushthan_sankhya_key INT;
		DECLARE l_anushthan_gotra_key INT;
		DECLARE errno INT;
		DECLARE EXIT HANDLER FOR SQLEXCEPTION
	   BEGIN
	   GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
	   SELECT errno AS MYSQL_ERROR;
	   ROLLBACK;
	   END;
			
        START TRANSACTION;

				SELECT u.USER_KEY INTO @l_user_key FROM `user` u WHERE u.UUID = v_user_uuid;
				SELECT a.ANUSHTHAN_TYPE_KEY INTO @l_anushthan_type_key FROM a2_Anushthan_Type a WHERE a.UUID = v_anushthan_type_uuid;
				SELECT s.ANUSHTHAN_SANKHYA_KEY INTO @l_anushthan_sankhya_key FROM a2_Anusthan_Sankhya s WHERE s.UUID = v_anushthan_sankhya_uuid;
				SELECT g.GOTRA_KEY INTO @l_anushthan_gotra_key FROM a2_gotra g WHERE g.UUID = v_gotra_uuid;
				
				INSERT INTO `a2_Anusthatan` (CREATOR_ID, ANUSHTAHN_TYPE_KEY, ANUSHTAHN_SANKHYA_TYPE_KEY, GOTRA_TYPE_KEY, NAME, DESCRIPTION, ADDRESS, DONATION_AMOUNT,MATERIAL_AMOUNT)
				VALUES(@l_user_key, @l_anushthan_type_key, @l_anushthan_sankhya_key, @l_anushthan_gotra_key, v_anushthan_name , v_anushthan_description , v_anushthan_address, v_anushthan_donation_amount, v_anushthan_material_amount);

			
        COMMIT WORK;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_admin_v3_get_users` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_admin_v3_get_users`(
	IN `v_role` VARCHAR(10)
)
BEGIN

	IF (v_role = 'admin') THEN
		SELECT u.UUID, RPAD(SUBSTR(u.FULL_NAME, 1, 1), LENGTH(u.FULL_NAME), '*') AS FULL_NAME, 
			RPAD(SUBSTR(u.GENDER, 1, 1), LENGTH(u.GENDER), '*') AS GENDER,
			RPAD(SUBSTR(u.PRIMARY_EMAIL_ID, 1, 1), LENGTH(u.PRIMARY_EMAIL_ID), '*') AS PRIMARY_EMAIL_ID, 
			u.EMAIL_HASH, u.PRIMARY_MOBILE_NUMBER, u.ROLE, u.IS_ACTIVE, u.IS_PREMIUM, u.CREATION_DATE, u.INACTIVATION_DATE, 
			u.ACCOUNT_EXPIRY_DATE, d.DOMAIN_NAME, u.REGISTERED_DEVICES
		FROM `user` u, domains d 
		WHERE d.DOMAIN_ID = u.DOMAIN_KEY;
	END IF; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_check_config_group_member_limit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_check_config_group_member_limit`(
	IN `v_group_uuid` VARCHAR(36),
	IN `v_additional_members` INT,
	OUT `v_result` INT

)
BEGIN
	DECLARE v_total_group_members INT;
	DECLARE v_group_member_limit INT;
	DECLARE l_total_group_members INT;
	
	SELECT `group`.TOTAL_GROUP_MEMBERS INTO @v_total_group_members FROM `group` WHERE `group`.UUID = v_group_uuid;
	
	SET l_total_group_members := @v_total_group_members + v_additional_members;
	
	SELECT configuration_parameters.`VALUE` INTO @v_group_member_limit FROM configuration_parameters WHERE configuration_parameters.`KEY` = 'GROUP_MEMBER_LIMIT';
	
	IF (@l_total_group_members > @v_group_member_limit) THEN
		SET v_result := 0;
	ELSEIF (@v_total_group_members <= @v_group_member_limit) THEN
		SET v_result := 1;
	END IF;

	SELECT v_result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_group_daily_counts_by_user_v3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_group_daily_counts_by_user_v3`(
	IN `v_group_uuid` VARCHAR(36),
	IN `v_user_uuid` VARCHAR(36),
	IN `v_count_date` DATETIME,
	IN `v_interval` INT,
	IN `v_tz` VARCHAR(40)
)
BEGIN
	DECLARE v_user_key INT;	

	SELECT u.USER_KEY INTO @v_user_key FROM `user` u WHERE u.UUID = v_user_uuid;
	
	SELECT u.FULL_NAME, COALESCE(sum(gc.COUNTS), 0) AS COUNTS
	FROM `group` g, `user` u, group_user gu LEFT OUTER JOIN group_counts gc ON gc.USER_KEY = gu.USER_KEY AND gc.GROUP_KEY = gu.GROUP_KEY 
	AND gc.COUNT_DATE >= CONVERT_TZ(CONCAT(DATE(v_count_date), ' 00:00:00'), v_tz, 'UTC')
	AND gc.COUNT_DATE <= CONVERT_TZ(CONCAT(DATE(v_count_date), ' 23:59:59'), v_tz, 'UTC') 
	WHERE g.UUID = v_group_uuid
	AND g.GROUP_KEY = gu.GROUP_KEY
	AND u.USER_KEY = gu.USER_KEY
	AND EXISTS (
			SELECT 1 FROM group_user AS gu1, `group` AS g1 
			WHERE gu1.USER_KEY = @v_user_key
			AND gu1.IS_ADMIN = 'Y'
			AND gu1.GROUP_KEY = g1.GROUP_KEY
			AND g1.UUID = v_group_uuid)
	group BY u.FULL_NAME;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_group_users_v1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_group_users_v1`(
	IN `v_group_uuid` VARCHAR(36),
	IN `v_creator_user_uuid` VARCHAR(36),
	IN `v_user_search_uuid` VARCHAR(36), 
	IN `v_criteria` VARCHAR(11)
)
BEGIN
	
	DECLARE v_user_search_user_key INT;
	DECLARE v_creator_user_key INT;
	DECLARE v_group_key INT;
	
	SELECT GROUP_KEY INTO @v_group_key FROM `group` WHERE `group`.UUID = v_group_uuid;
	SELECT USER_KEY INTO @v_creator_user_key FROM `user` WHERE `user`.UUID = v_creator_user_uuid;
	SELECT USER_KEY INTO @v_user_search_user_key FROM `user` WHERE `user`.UUID = v_user_search_uuid;
	
	IF (v_criteria = 'all') THEN
		SELECT u.USER_KEY, u.FULL_NAME, gu.IS_ADMIN 
		FROM `group` g, group_user gu, `user` u 
		where g.GROUP_KEY = gu.GROUP_KEY 
		AND gu.USER_KEY = u.USER_KEY 
		AND g.GROUP_KEY = @v_group_key
		AND u.USER_KEY = @v_user_search_user_key
		AND EXISTS (SELECT 1 FROM group_user AS gu1, `group` AS g1 
			WHERE gu1.USER_KEY = @v_user_search_user_key 
			AND gu1.GROUP_KEY = g1.GROUP_KEY
			AND g1.CREATOR_GROUP_KEY = @v_creator_user_key);
	ELSEIF (v_criteria = 'one') THEN
		SELECT u.USER_KEY, u.FULL_NAME, gu.IS_ADMIN 
		FROM `group` g, group_user gu, `user` u 
		where g.GROUP_KEY = gu.GROUP_KEY 
		AND gu.USER_KEY = u.USER_KEY 
		AND g.GROUP_KEY = @v_group_key
		AND u.USER_KEY = @v_user_search_user_key
		AND EXISTS (SELECT 1 FROM group_user AS gu1, `group` AS g1 
			WHERE gu1.USER_KEY = @v_user_search_user_key 
			AND gu1.GROUP_KEY = g1.GROUP_KEY);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upsert_group_daily_counts_v3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_upsert_group_daily_counts_v3`(
	IN `v_count_date` DATETIME,
	IN `v_tz` VARCHAR(40),
	IN `v_loclat` VARCHAR(11),
	IN `v_loclong` VARCHAR(11),
	IN `v_user_key` INT,
	IN `v_device_key` INT,
	IN `v_group_uuid` VARCHAR(36),
	IN `v_counts` INT
)
BEGIN

		DECLARE v_group_key INT;
		DECLARE v_group_daily_counts BIGINT;

		DECLARE v_record_count INT;
		DECLARE v_user_daily_counts BIGINT;
		
		
		DECLARE errno INT;
		DECLARE EXIT HANDLER FOR SQLEXCEPTION
	   BEGIN
	   GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
	   SELECT errno AS MYSQL_ERROR;
	   ROLLBACK;
	   END;
			
        SELECT g.GROUP_KEY
		  INTO @v_group_key
		  FROM group_user AS gu, `group` AS g, `user` AS u
        WHERE gu.GROUP_KEY = g.GROUP_KEY AND gu.USER_KEY = u.USER_KEY 
        AND g.IS_ACTIVE = 'Y' AND u.USER_KEY = v_user_key AND g.UUID = v_group_uuid;

        IF (SELECT FOUND_ROWS() = 1) THEN
				START TRANSACTION;
                        INSERT INTO group_counts (GROUP_KEY, USER_KEY, DEVICE_KEY, COUNT_DATE, LOCAL_DATE, TZ, LOCLAT, LOCLONG, `COUNTS`)
                                VALUES(@v_group_key, v_user_key, v_device_key, CONVERT_TZ(v_count_date, v_tz, 'UTC'), v_count_date, v_tz, v_loclat, v_loclong, v_counts);

                        UPDATE `user` AS u1 SET u1.`USER_TOTAL_COUNT` =
                        (SELECT (SUM(u2.`USER_TOTAL_COUNT`) + v_counts) FROM (SELECT * FROM `user`) AS u2 WHERE u2.`USER_KEY` = v_user_key AND u2.USER_KEY = u1.USER_KEY)
                        WHERE u1.`USER_KEY` = v_user_key;

								UPDATE `group` AS g1 SET g1.TOTAL_GROUP_COUNTS =
					         (SELECT (SUM(g2.TOTAL_GROUP_COUNTS) + v_counts) FROM (SELECT * FROM `group`) AS g2 WHERE g2.`GROUP_KEY` = @v_group_key AND g2.GROUP_KEY = g1.GROUP_KEY)
					         WHERE g1.`GROUP_KEY` = @v_group_key;

                        IF (NOT EXISTS(SELECT GROUP_KEY FROM group_daily_counts_summary AS gdcs
                                WHERE gdcs.GROUP_COUNT_DATE = DATE(CONVERT_TZ(v_count_date, v_tz, 'UTC')) AND gdcs.GROUP_KEY = @v_group_key)) THEN
                                INSERT INTO group_daily_counts_summary (GROUP_KEY, GROUP_COUNT_DATE, GROUP_DAILY_TOTAL_COUNTS, LAST_UPDATED_DATETIME)
                                VALUES(@v_group_key, DATE(CONVERT_TZ(v_count_date, v_tz, 'UTC')), v_counts, CONVERT_TZ(v_count_date, v_tz, 'UTC'));
                        ELSE
                        		SELECT  SUM(gdcs.GROUP_DAILY_TOTAL_COUNTS + v_counts) INTO @v_group_daily_counts 
                        		FROM group_daily_counts_summary gdcs 
                        		WHERE gdcs.GROUP_COUNT_DATE = DATE(CONVERT_TZ(v_count_date, v_tz, 'UTC')) AND gdcs.GROUP_KEY = @v_group_key;
                        	
                        		UPDATE group_daily_counts_summary AS gdcs SET gdcs.GROUP_DAILY_TOTAL_COUNTS = @v_group_daily_counts, 
											gdcs.LAST_UPDATED_DATETIME = CONVERT_TZ(v_count_date, v_tz, 'UTC')
                        		WHERE gdcs.GROUP_COUNT_DATE = DATE(CONVERT_TZ(v_count_date, v_tz, 'UTC')) AND gdcs.GROUP_KEY = @v_group_key;
                                
                        END IF;
				COMMIT WORK;
			END IF;
			

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upsert_user_daily_counts_v3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_upsert_user_daily_counts_v3`(
	IN `v_count_date` DATETIME,
	IN `v_tz` VARCHAR(40),
	IN `v_loclat` VARCHAR(11),
	IN `v_loclong` VARCHAR(11),
	IN `v_user_key` INT,
	IN `v_device_key` INT,
	IN `v_counts` INT,
	IN `v_counter_number` CHAR(2)
)
BEGIN

		DECLARE v_record_count INT;
		DECLARE v_user_daily_counts BIGINT;
		DECLARE errno INT;
		DECLARE EXIT HANDLER FOR SQLEXCEPTION
	   BEGIN
	   GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
	   SELECT errno AS MYSQL_ERROR;
	   ROLLBACK;
	   END;
	
		START TRANSACTION;
         INSERT INTO counts (USER_KEY, DEVICE_KEY, COUNT_DATE, LOCAL_DATE, TZ, LOCLAT, LOCLONG, `COUNTS`, COUNTER_NUMBER)
	         VALUES(v_user_key, v_device_key, CONVERT_TZ(v_count_date, v_tz, 'UTC'), CONVERT_TZ(v_count_date, v_tz, v_tz), v_tz, v_loclat, v_loclong, v_counts, v_counter_number);


         UPDATE `user` AS u1 SET u1.`USER_TOTAL_COUNT` =
         (SELECT (SUM(u2.`USER_TOTAL_COUNT`) + v_counts) FROM (SELECT * FROM `user`) AS u2 WHERE u2.`USER_KEY` = v_user_key AND u2.USER_KEY = u1.USER_KEY)
         WHERE u1.`USER_KEY` = v_user_key;
         
         SET @v_record_count = 0;
			SELECT COUNT(USER_KEY) INTO @v_record_count FROM daily_counts_summary AS dcs
         WHERE DATE(dcs.COUNT_DATE) = DATE(CONVERT_TZ(v_count_date, v_tz, 'UTC')) AND dcs.USER_KEY = v_user_key;
         
         
        	IF (@v_record_count = 0) THEN
	
        		INSERT INTO daily_counts_summary (USER_KEY, COUNT_DATE, TOTAL_DATE_COUNTS)
        		VALUES (v_user_key, DATE(CONVERT_TZ(v_count_date, v_tz, 'UTC')), v_counts);
        		
         ELSE

         		SELECT  SUM(dcs.TOTAL_DATE_COUNTS + v_counts) INTO @v_user_daily_counts
         		FROM daily_counts_summary dcs
               WHERE DATE(dcs.COUNT_DATE) = DATE(CONVERT_TZ(v_count_date, v_tz, 'UTC')) AND dcs.USER_KEY = v_user_key; 
               
   	         UPDATE daily_counts_summary AS dcs SET dcs.TOTAL_DATE_COUNTS = @v_user_daily_counts
	            WHERE DATE(dcs.COUNT_DATE) = DATE(CONVERT_TZ(v_count_date, v_tz, 'UTC')) AND dcs.USER_KEY = v_user_key;
	 
				
         END IF;
        	
		COMMIT;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_activate_deactivate_event` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_activate_deactivate_event`(
	IN `v_user_uuid` VARCHAR(36),
	IN `v_group_uuid` VARCHAR(36),
	IN `v_event_uuid` VARCHAR(36),
	IN `v_operation_uuid` VARCHAR(36)
)
BEGIN

	
	IF (v_operation_uuid = '3d4f96dc-588e-4748-95a2-24d16e23ac99') THEN
		
		UPDATE `events` e 
		SET e.IS_ACTIVE = 'N' 
		WHERE e.UUID = v_event_uuid
		AND e.CREATOR_USER_KEY IN (SELECT u.USER_KEY FROM `user` u WHERE u.UUID = v_user_uuid)
		AND e.GROUP_KEY IN (SELECT g.GROUP_KEY FROM `group` g WHERE g.UUID = v_group_uuid);
	
	
	ELSEIF (v_operation_uuid = '2f5fd299-5608-4a3c-9373-97cc397a6fe0') THEN
	
		UPDATE `events` e 
		SET e.IS_ACTIVE = 'Y' 
		WHERE e.UUID = v_event_uuid
		AND e.CREATOR_USER_KEY IN (SELECT u.USER_KEY FROM `user` u WHERE u.UUID = v_user_uuid)
		AND e.GROUP_KEY IN (SELECT g.GROUP_KEY FROM `group` g WHERE g.UUID = v_group_uuid);
	
	ELSE
		SELECT 1;
	
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_activate_deactivate_group_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_activate_deactivate_group_user`(
	IN `v_group_uuid` VARCHAR(36),
	IN `v_requestor_user_uuid` VARCHAR(36),
	IN `v_processor_user_uuid` VARCHAR(36),
	IN `v_today` DATETIME,
	IN `v_criteria` VARCHAR(15)
)
BEGIN

	DECLARE l_requestor_user_key INT;
	DECLARE l_processor_user_key INT;
	
	DECLARE l_is_admin INT;
	DECLARE l_is_self INT;


	DECLARE errno INT;
	DECLARE errDesc TEXT;

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	   BEGIN
	   GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO, errDesc = MESSAGE_TEXT;
	   SELECT errno AS MYSQL_ERROR, errDesc AS MYSQL_ERRMESSAGE;
	   ROLLBACK;
	   END;
	
		START TRANSACTION;
		
		SELECT u.USER_KEY INTO @l_requestor_user_key FROM `user` u WHERE u.UUID = v_requestor_user_uuid;
		SELECT u.USER_KEY INTO @l_processor_user_key FROM `user` u WHERE u.UUID = v_processor_user_uuid;
		
		SELECT g.GROUP_KEY INTO @l_group_key FROM `group` g WHERE g.UUID = v_group_uuid;
		
		SELECT gu.IS_ADMIN INTO @l_is_admin
		FROM group_user gu
		WHERE gu.GROUP_KEY = @l_group_key
		AND gu.USER_KEY = @l_requestor_key;
		
		IF ((@l_is_admin = 'Y') OR (@l_requestor_user_key = @l_processor_user_key)) THEN
			IF (v_criteria = 'activate') THEN

				UPDATE group_user gu 
				SET gu.IS_ACTIVE = 'Y', gu.REACTIVATION_DATE = v_today 
				WHERE gu.GROUP_KEY = @l_group_key
				AND gu.USER_KEY = @l_processor_user_key;
			
				SET @l_is_admin = 0;

			ELSEIF (v_criteria = 'deactivate') THEN
			
				SET @l_is_admin = 1;

				UPDATE group_user gu
				SET gu.IS_ACTIVE = 'N', gu.INACTIVATION_DATE = v_today 
				WHERE gu.GROUP_KEY = @l_group_key
				AND gu.USER_KEY = @l_processor_user_key; 
				
			END IF;
		END IF;

		
		COMMIT WORK;
		
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_add_new_user_group_invitations` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_add_new_user_group_invitations`(
	IN `v_user_uuid` VARCHAR(36),
	IN `v_group_uuid` VARCHAR(36),
	IN `v_invite_code` VARCHAR(6),
	IN `v_creation_date` DATETIME
)
BEGIN

	DECLARE l_user_key INT;
	DECLARE l_email_hash VARCHAR(40);
	DECLARE l_group_key INT;
	
	DECLARE l_result INT;

	DECLARE errno INT;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION

	BEGIN
		GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
		SELECT errno AS MYSQL_ERROR;
		ROLLBACK;
	END;

		START TRANSACTION;
		
			SELECT u.USER_KEY, u.EMAIL_HASH INTO @l_user_key, @l_email_hash FROM `user` u WHERE u.UUID = v_user_uuid;
			
			SELECT g.GROUP_KEY INTO @l_group_key
			FROM `group` g, group_invitation gi 
			WHERE g.GROUP_KEY = gi.GROUP_KEY
			AND gi.INVITE_CODE = v_invite_code
			AND gi.EMAIL_HASH = @l_email_hash
			AND g.UUID = v_group_uuid;
			
			SELECT u.USER_KEY INTO @l_user_key FROM `user` u WHERE u.UUID = v_user_uuid;
			
			INSERT INTO group_user (GROUP_KEY, USER_KEY, IS_ADMIN, IS_ACTIVE, IS_DEFAULT, CREATION_DATE)
				VALUES(@l_group_key, @l_user_key, 'N', 'Y', 'N', v_creation_date);
				
			DELETE FROM group_invitation 
			WHERE group_invitation.GROUP_KEY = @l_group_key 
			AND group_invitation.INVITE_CODE = v_invite_code
			AND group_invitation.EMAIL_HASH = @l_email_hash;
				
			SET @l_result = 1;
					
		COMMIT WORK;
		
		
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_event_daily_counts_for_today_per_device` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_event_daily_counts_for_today_per_device`(
	IN `v_user_uuid` VARCHAR(36),
	IN `v_event_uuid` VARCHAR(36),
	IN `v_today` DATETIME,
	IN `v_tz` VARCHAR(40)
)
BEGIN
	DECLARE v_user_key INT;	
	DECLARE v_event_key INT;
	
		SELECT u.USER_KEY INTO @v_user_key FROM `user` u WHERE u.UUID = v_user_uuid;
		SELECT e.EVENT_KEY INTO @v_event_key FROM `events` e WHERE e.UUID = v_event_uuid;

		SELECT COALESCE (d.UUID, '00000000-0000-0000-0000-000000000000') AS DEVICE_UUID, COALESCE (d.DEVICE_TYPE, 'H') AS DEVICE_TYPE, 
			COALESCE(sum(ec1.COUNTS), 0) AS TOTAL_USER_DATE_COUNTS 
		FROM `user` u, `device` d LEFT JOIN `events_counts` ec1 ON ec1.DEVICE_KEY = d.DEVICE_KEY
		WHERE d.USER_KEY = u.USER_KEY
		AND ec1.USER_KEY = u.USER_KEY 
		AND u.IS_ACTIVE = 'Y' 
		AND u.USER_KEY = @v_user_key
		AND ec1.EVENT_KEY = @v_event_key
		AND d.DEVICE_TYPE = 'H'
		AND ec1.COUNT_DATE >= CONVERT_TZ(CONCAT(DATE(v_today), ' 00:00:00'), v_tz, 'UTC') 
		AND ec1.COUNT_DATE <= CONVERT_TZ(CONCAT(DATE(v_today), ' 23:59:59'), v_tz, 'UTC')
		UNION
		SELECT COALESCE (d.UUID, '00000000-0000-0000-0000-000000000000') AS DEVICE_UUID, COALESCE (d.DEVICE_TYPE, 'S') AS DEVICE_TYPE, COALESCE(sum(ec1.COUNTS), 0) AS TOTAL_USER_DATE_COUNTS 
		FROM `user` u, `device` d LEFT JOIN `events_counts` ec1 ON ec1.DEVICE_KEY = d.DEVICE_KEY
		WHERE d.USER_KEY = u.USER_KEY
		AND ec1.USER_KEY = u.USER_KEY 
		AND u.IS_ACTIVE = 'Y' 
		AND u.USER_KEY = @v_user_key
		AND ec1.EVENT_KEY = @v_event_key
		AND d.DEVICE_TYPE = 'S'
		AND ec1.COUNT_DATE >= CONVERT_TZ(CONCAT(DATE(v_today), ' 00:00:00'), v_tz, 'UTC') 
		AND ec1.COUNT_DATE <= CONVERT_TZ(CONCAT(DATE(v_today), ' 23:59:59'), v_tz, 'UTC');
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_get_all_groups` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_get_all_groups`(
	IN `v_user_uuid` VARCHAR(36)
)
BEGIN
	
	SELECT g.UUID AS GROUP_UUID, g.GROUP_NAME, g.IS_ACTIVE, gu.IS_ADMIN, gu.IS_DEFAULT, g.GROUP_CREATION_DATE, 
	g.GROUP_GOAL, g.TOTAL_GROUP_COUNTS, concat(vw.city_ascii, ', ', vw.country) AS GROUP_CITY, st.SUBSC_TYPE, 
	(CASE WHEN ((g.SUBSC_KEY = 1 AND u.SUBSC_KEY = 2) OR (g.SUBSC_KEY = 2 AND u.SUBSC_KEY = 2) OR (g.SUBSC_KEY = 1 AND u.SUBSC_KEY = 1))
		THEN 1
		WHEN (g.SUBSC_KEY = 2 AND u.SUBSC_KEY = 1) THEN 0
		END)
		AS DECISION
	FROM `user` AS u, `group` AS g, group_user AS gu, vendor_worldcities vw, subscription_type st
	WHERE u.`USER_KEY` = gu.USER_KEY 
	AND gu.GROUP_KEY = g.GROUP_KEY
	AND u.UUID = v_user_uuid
	AND st.SUBSC_KEY = g.SUBSC_KEY
	AND vw.id = g.CITY_ID
	AND EXISTS (
			SELECT 1 
			FROM `group_user` gu1, `user` u1
			WHERE gu1.USER_KEY = u1.USER_KEY
			AND u1.UUID = v_user_uuid);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_get_device` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_get_device`(
	IN `v_device_uuid` VARCHAR(36),
	IN `v_user_uuid` VARCHAR(36)
)
BEGIN
	
	SELECT d.*
	FROM `device` d, `user` u
	WHERE d.UUID = v_device_uuid 
	AND u.UUID = v_user_uuid
	AND d.USER_KEY = u.USER_KEY;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_get_devices` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_get_devices`(
	IN `v_user_uuid` VARCHAR(36)
)
BEGIN
	
	SELECT d.DEVICE_KEY, d.UUID, d.USER_KEY, d.DEVICE_HASH, d.DEVICE_NAME, d.DEVICE_TYPE,
		d.IS_ACTIVE, d.REGISTRATION_DATE, d.INACTIVATION_DATE, d.REACTIVATION_DATE
	FROM `device` d, `user` u
	WHERE u.UUID = v_user_uuid
	AND d.USER_KEY = u.USER_KEY;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_get_device_by_device_hash` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_get_device_by_device_hash`(
	IN `v_device_hash` VARCHAR(40)
)
BEGIN
	
	SELECT UUID, DEVICE_HASH, IS_ACTIVE, DEVICE_KEY FROM device WHERE DEVICE_HASH = v_device_hash AND DEVICE_TYPE = 'H';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_get_device_key` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_get_device_key`(
	IN `v_device_uuid` VARCHAR(36),
	IN `v_user_uuid` VARCHAR(36)
)
BEGIN
	
	SELECT d.DEVICE_KEY
	FROM `device` d, `user` u
	WHERE d.UUID = v_device_uuid 
	AND u.UUID = v_user_uuid
	AND d.USER_KEY = u.USER_KEY;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_get_event` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_get_event`(
	IN `v_user_uuid` VARCHAR(36),
	IN `v_group_uuid` VARCHAR(36),
	IN `v_event_uuid` VARCHAR(36)
)
BEGIN
	
	SELECT e.UUID AS EVENT_UUID, e.EVENT_NAME AS EVENT_NAME
	FROM `events` e, `group` g, `user` u
	WHERE e.GROUP_KEY = g.GROUP_KEY
	AND u.USER_KEY = g.CREATOR_USER_KEY
	AND u.USER_KEY = e.CREATOR_USER_KEY
	AND g.UUID = v_group_uuid
	AND u.UUID = v_user_uuid
	AND e.UUID = v_event_uuid
	AND e.IS_DELETED = 'N';
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_get_events` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_get_events`(
	IN `v_user_uuid` VARCHAR(36),
	IN `v_group_uuid` VARCHAR(36),
	IN `v_tz` VARCHAR(36),
	IN `v_today` DATETIME
)
BEGIN
	
	DECLARE l_future_event_days INT;

	SELECT CAST(cp.VALUE AS INT) INTO @l_future_event_days FROM configuration_parameters cp WHERE cp.`KEY` = 'FUTURE_EVENT_DAYS';
	
	SELECT e.UUID AS EVENT_UUID, e.EVENT_NAME AS EVENT_NAME, e.TOTAL_EVENT_COUNTS AS TOTAL_EVENT_COUNTS, 
	es.EVENT_START_TIME AS EVENT_START_TIME, es.EVENT_END_TIME AS EVENT_END_TIME, es.UUID AS ES_UUID, st.SUBSC_TYPE,
	(CASE WHEN ((g.SUBSC_KEY = 1 AND u.SUBSC_KEY = 2) OR (g.SUBSC_KEY = 2 AND u.SUBSC_KEY = 2) OR (g.SUBSC_KEY = 1 AND u.SUBSC_KEY = 1))
	THEN 1
	WHEN (g.SUBSC_KEY = 2 AND u.SUBSC_KEY = 1) THEN 0
	END)
	AS DECISION,
	(CASE WHEN DATE(CONVERT_TZ(v_today, v_tz, es.TZ)) BETWEEN DATE(es.EVENT_START_TIME) AND DATE(es.EVENT_END_TIME) THEN 1 ELSE 0 END) AS JOIN_DECISION
	FROM `events` e, `events_schedule` es, `group` g, subscription_type st, `user` u
	WHERE e.GROUP_KEY = g.GROUP_KEY
	AND e.EVENT_KEY = es.EVENT_KEY
	AND g.SUBSC_KEY = st.SUBSC_KEY
	AND u.USER_KEY = g.CREATOR_USER_KEY
	AND u.USER_KEY = e.CREATOR_USER_KEY
	AND e.IS_ACTIVE = 'Y'
	AND e.IS_DELETED = 'N'
	AND g.UUID = v_group_uuid
	AND u.UUID = v_user_uuid
	AND DATE(es.EVENT_START_TIME) BETWEEN  DATE(CONVERT_TZ(NOW(), 'EST', es.TZ)) AND DATE_ADD(CONVERT_TZ(NOW(), 'EST', es.TZ), INTERVAL @l_future_event_days DAY);
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_get_events_daily_counts_for_today` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_get_events_daily_counts_for_today`(
	IN `v_user_uuid` VARCHAR(36),
	IN `v_event_uuid` VARCHAR(36),
	IN `v_count_date` DATETIME,
	IN `v_tz` VARCHAR(40)
)
BEGIN
	
	DECLARE v_user_key INT;	
	DECLARE v_event_key INT;

	SELECT u.USER_KEY INTO @v_user_key FROM `user` u WHERE u.UUID = v_user_uuid;
	SELECT e.EVENT_KEY INTO @v_event_key FROM `events` e WHERE e.UUID = v_event_uuid;

	SELECT
		(SELECT EVENT_NAME FROM `events` e2 WHERE e2.EVENT_KEY = @v_event_key) AS EVENT_NAME, 
		(SELECT COALESCE (SUM(ges.COUNTS),0)
			FROM 
				get_event_summary AS ges
			WHERE
				ges.EVENT_KEY = @v_event_key
			AND EXISTS (
				SELECT 1 
				FROM 
					get_event_summary AS ges1
		
				WHERE
					ges1.EVENT_KEY = @v_event_key
				AND ges1.USER_KEY = @v_user_key)
				AND
					ges.COUNT_DATE >= CONVERT_TZ(CONCAT(DATE(v_count_date), ' 00:00:00'), v_tz, 'UTC') 
				AND 
					ges.COUNT_DATE <= CONVERT_TZ(CONCAT(DATE(v_count_date), ' 23:59:59'), v_tz, 'UTC')

			GROUP BY ges.EVENT_NAME, ges.EVENT_KEY) 
		AS TOTAL_EVENT_COUNTS_LIVE, 
			
		(SELECT COALESCE (SUM(ges.COUNTS),0)
			FROM 
				get_event_summary AS ges
			WHERE
				ges.EVENT_KEY = @v_event_key
			AND EXISTS (
				SELECT 1 
				FROM 
					get_event_summary AS ges1
		
				WHERE
					ges1.EVENT_KEY = @v_event_key
				AND ges1.USER_KEY = @v_user_key)
			AND
			ges.USER_KEY = @v_user_key
			AND
				ges.COUNT_DATE >= CONVERT_TZ(CONCAT(DATE(v_count_date), ' 00:00:00'), v_tz, 'UTC') 
			AND 
				ges.COUNT_DATE <= CONVERT_TZ(CONCAT(DATE(v_count_date), ' 23:59:59'), v_tz, 'UTC')
			GROUP BY ges.EVENT_NAME, ges.EVENT_KEY) 
		AS TOTAL_USER_COUNTS_LIVE
		
			 
	FROM DUAL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_get_groups` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_get_groups`(
	IN `v_group_uuid` VARCHAR(36),
	IN `v_user_uuid` VARCHAR(36)
)
BEGIN
	IF (v_group_uuid IS NULL) THEN
	
		SELECT g.*
		FROM `user` AS u, `group` AS g, group_user AS gu
		WHERE u.`USER_KEY` = gu.USER_KEY 
		AND gu.GROUP_KEY = g.GROUP_KEY 
		AND u.UUID = v_user_uuid;
	
	ELSE
		SELECT g.*
		FROM `user` AS u, `group` AS g, `group_user` gu
		WHERE gu.GROUP_KEY = g.GROUP_KEY 
		AND gu.USER_KEY = u.USER_KEY 
		AND u.UUID = v_user_uuid
		AND g.UUID = v_group_uuid
		AND EXISTS (
			SELECT 1 
			FROM `group_user` gu1, `user` u1
			WHERE gu1.USER_KEY = u1.USER_KEY
			AND u1.UUID = v_user_uuid);
	
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_get_group_counts_total_for_month` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_get_group_counts_total_for_month`(
	IN `v_user_uuid` VARCHAR(36),
	IN `v_group_uuid` VARCHAR(36),
	IN `v_month` INT,
	IN `v_today` DATETIME
)
BEGIN
	SELECT MONTH(gdcs.GROUP_COUNT_DATE) AS `month`, SUM(gdcs.GROUP_DAILY_TOTAL_COUNTS) AS total_counts
	FROM group_daily_counts_summary gdcs, group_user gu, `group` g, `user` u
	WHERE g.GROUP_KEY = gdcs.GROUP_KEY 
	AND gu.GROUP_KEY = g.GROUP_KEY
	AND gu.GROUP_KEY = gdcs.GROUP_KEY
	AND gu.USER_KEY = u.USER_KEY
	AND MONTH(gdcs.GROUP_COUNT_DATE) = v_month
	AND g.UUID = v_group_uuid
	AND u.UUID = v_user_uuid
	AND EXISTS (SELECT 1
			FROM group_user gu1, `user` u1, `group` g1
			WHERE gu1.USER_KEY = u1.USER_KEY
			AND gu1.GROUP_KEY = g1.GROUP_KEY
			AND g1.UUID = v_group_uuid
			AND u1.UUID = v_user_uuid)
	GROUP BY MONTH(gdcs.GROUP_COUNT_DATE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_get_group_count_last_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_get_group_count_last_update`(
	IN `v_user_uuid` VARCHAR(36),
	IN `v_group_uuid` VARCHAR(36),
	IN `v_tz` VARCHAR(40)
)
BEGIN
	
	SELECT CONVERT_TZ(gc.COUNT_DATE, 'UTC', v_tz) AS count_date, gc.LOCAL_DATE AS local_date
	FROM	group_counts gc, `group` g
	WHERE gc.GROUP_KEY = g.GROUP_KEY
	AND g.UUID = v_group_uuid
	AND EXISTS (
		SELECT 1
		FROM group_user gu, `user` u, `group` g1
		WHERE gu.USER_KEY = u.USER_KEY
		AND gu.GROUP_KEY = g1.GROUP_KEY
		AND g1.UUID = v_group_uuid
		AND u.UUID = v_user_uuid
	)
	ORDER BY gc.COUNT_DATE DESC
	LIMIT 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_get_group_daily_counts_by_range` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_get_group_daily_counts_by_range`(
	IN `v_user_uuid` VARCHAR(36),
	IN `v_group_uuid` VARCHAR(36),
	IN `v_from_date_time` DATETIME,
	IN `v_to_date_time` DATETIME,
	IN `v_tz` VARCHAR(40)
)
BEGIN
	
	SELECT DATE(ggs.LOCAL_DATE) AS count_date, SUM(ggs.COUNTS) AS total_counts
	FROM 
		get_groups_summary AS ggs
	WHERE
		ggs.UUID = v_group_uuid 
	AND EXISTS (
		SELECT 1 
		FROM 
			get_groups_summary AS ggs1, `user` AS u1

		WHERE ggs1.UUID = v_group_uuid
		AND ggs1.USER_KEY = u1.USER_KEY
		AND u1.UUID = v_user_uuid)
		AND ggs.COUNT_DATE >= CONVERT_TZ(CONCAT(DATE(v_from_date_time), ' 00:00:00'), v_tz, 'UTC') 
		AND ggs.COUNT_DATE <= CONVERT_TZ(CONCAT(DATE(v_to_date_time), ' 23:59:59'), v_tz, 'UTC')
	GROUP BY DATE(ggs.LOCAL_DATE)
	ORDER BY DATE(ggs.LOCAL_DATE);
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_get_group_daily_counts_for_today` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_get_group_daily_counts_for_today`(
	IN `v_user_uuid` VARCHAR(36),
	IN `v_group_uuid` VARCHAR(36),
	IN `v_today` DATETIME,
	IN `v_tz` VARCHAR(40)
)
BEGIN
	
	DECLARE v_user_key INT;	
	DECLARE v_group_key INT;

	SELECT u.USER_KEY INTO @v_user_key FROM `user` u WHERE u.UUID = v_user_uuid;
	SELECT g.GROUP_KEY INTO @v_group_key FROM `group` g WHERE g.UUID = v_group_uuid;

	SELECT
		(SELECT GROUP_NAME FROM `group` g2 WHERE g2.GROUP_KEY = @v_group_key) AS group_name, 
		(SELECT COALESCE (SUM(ggs.COUNTS),0) 
			FROM 
				get_groups_summary AS ggs
			WHERE
				ggs.GROUP_KEY = @v_group_key
			AND EXISTS (
				SELECT 1 
				FROM 
					get_groups_summary AS ggs1
		
				WHERE
					ggs1.GROUP_KEY = @v_group_key
				AND ggs1.USER_KEY = @v_user_key)
				AND
					ggs.COUNT_DATE >= CONVERT_TZ(CONCAT(DATE(v_today), ' 00:00:00'), v_tz, 'UTC') 
				AND 
					ggs.COUNT_DATE <= CONVERT_TZ(CONCAT(DATE(v_today), ' 23:59:59'), v_tz, 'UTC')

			GROUP BY ggs.GROUP_NAME) 
		AS total_group_counts_live, 
			
		(SELECT COALESCE (SUM(ggs.COUNTS),0)
			FROM 
				get_groups_summary AS ggs
			WHERE
				ggs.GROUP_KEY = @v_group_key
			AND EXISTS (
				SELECT 1 
				FROM 
					get_groups_summary AS ggs1
		
				WHERE
					ggs1.GROUP_KEY = @v_group_key
				AND ggs1.USER_KEY = @v_user_key)
			AND
			ggs.USER_KEY = @v_user_key
			AND
				ggs.COUNT_DATE >= CONVERT_TZ(CONCAT(DATE(v_today), ' 00:00:00'), v_tz, 'UTC') 
			AND 
				ggs.COUNT_DATE <= CONVERT_TZ(CONCAT(DATE(v_today), ' 23:59:59'), v_tz, 'UTC')
			GROUP BY ggs.GROUP_NAME) 
		AS total_user_counts_live
		
			 
	FROM DUAL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_get_group_daily_counts_for_today_per_device` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_get_group_daily_counts_for_today_per_device`(
	IN `v_user_uuid` VARCHAR(36),
	IN `v_group_uuid` VARCHAR(36),
	IN `v_today` DATETIME,
	IN `v_tz` VARCHAR(40)
)
BEGIN
	DECLARE v_user_key INT;	
	DECLARE v_group_key INT;
	
	
	SELECT u.USER_KEY INTO @v_user_key FROM `user` u WHERE u.UUID = v_user_uuid;
	SELECT g.GROUP_KEY INTO @v_group_key FROM `group` g WHERE g.UUID = v_group_uuid;

	SELECT COALESCE (d.UUID, '00000000-0000-0000-0000-000000000000') AS device_uuid, COALESCE (d.DEVICE_TYPE, 'H') AS device_type, 
		COALESCE(sum(gc1.COUNTS), 0) AS total_user_date_counts 
	FROM `user` u, `device` d LEFT JOIN `group_counts` gc1 ON gc1.DEVICE_KEY = d.DEVICE_KEY
	WHERE d.USER_KEY = u.USER_KEY
	AND gc1.USER_KEY = u.USER_KEY 
	AND u.IS_ACTIVE = 'Y' 
	AND u.USER_KEY = @v_user_key
	AND gc1.GROUP_KEY = @v_group_key
	AND d.DEVICE_TYPE = 'H'
	AND gc1.COUNT_DATE >= CONVERT_TZ(CONCAT(DATE(v_today), ' 00:00:00'), v_tz, 'UTC') 
	AND gc1.COUNT_DATE <= CONVERT_TZ(CONCAT(DATE(v_today), ' 23:59:59'), v_tz, 'UTC')
	UNION
	SELECT COALESCE (d.UUID, '00000000-0000-0000-0000-000000000000') AS device_uuid, COALESCE (d.DEVICE_TYPE, 'S') AS device_type, COALESCE(sum(gc1.COUNTS), 0) AS total_user_date_counts 
	FROM `user` u, `device` d LEFT JOIN `group_counts` gc1 ON gc1.DEVICE_KEY = d.DEVICE_KEY
	WHERE d.USER_KEY = u.USER_KEY
	AND gc1.USER_KEY = u.USER_KEY 
	AND u.IS_ACTIVE = 'Y' 
	AND u.USER_KEY = @v_user_key
	AND gc1.GROUP_KEY = @v_group_key
	AND d.DEVICE_TYPE = 'S'
	AND gc1.COUNT_DATE >= CONVERT_TZ(CONCAT(DATE(v_today), ' 00:00:00'), v_tz, 'UTC') 
	AND gc1.COUNT_DATE <= CONVERT_TZ(CONCAT(DATE(v_today), ' 23:59:59'), v_tz, 'UTC');
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_get_group_invitations` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_get_group_invitations`(
	IN `v_user_uuid` VARCHAR(36)
)
BEGIN

	DECLARE l_group_key INT;
	DECLARE l_user_key INT;
	
	SELECT gi.INVITE_CODE AS invite_code,  g.GROUP_NAME AS group_name, g.UUID AS group_uuid
	FROM group_invitation AS gi, `group` AS g, `user` AS u 
	WHERE gi.EMAIL_HASH = u.EMAIL_HASH
	AND gi.GROUP_KEY = g.GROUP_KEY 
	AND u.UUID = v_user_uuid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_get_group_key` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_get_group_key`(
	IN `v_group_uuid` VARCHAR(36),
	IN `v_user_uuid` VARCHAR(36)
)
BEGIN
	
		SELECT g.GROUP_Key
		FROM `user` AS u, `group` AS g, `group_user` AS gu
		WHERE gu.GROUP_KEY = g.GROUP_KEY 
		AND gu.USER_KEY = u.USER_KEY 
		AND u.UUID = v_user_uuid
		AND g.UUID = v_group_uuid
		AND EXISTS (
			SELECT 1 
			FROM `group_user` gu1, `user` u1
			WHERE gu1.USER_KEY = u1.USER_KEY);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_get_user_app_sec_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_get_user_app_sec_data`(
	IN `v_user_uuid` VARCHAR(36)
)
BEGIN
	SELECT u.USER_KEY, u.EMAIL_HASH, u.CREATION_DATE, u.INACTIVATION_DATE, u.ACCOUNT_EXPIRY_DATE, u.DEVICE_TOKEN, u.SIGN_IN_METHOD,
	u.IS_ACTIVE, u.IS_PREMIUM, u.REFRESH_TOKEN, u.REGISTERED_DEVICES, u.UUID, u.`ROLE`, st.SUBSC_TYPE, st.UUID AS SUBSC_UUID
	FROM `user` u, subscription_type st 
	WHERE u.SUBSC_KEY = st.SUBSC_KEY 
	AND u.UUID = v_user_uuid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_get_user_from_fields` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_get_user_from_fields`(
	IN `v_user_uuid` VARCHAR(36),
	IN `v_email_hash` VARCHAR(40),
	IN `v_phone_number` VARCHAR(40),
	IN `v_email` VARCHAR(50)
)
BEGIN
	
	IF ((v_user_uuid IS NOT NULL) AND (v_email_hash IS NULL) AND (v_phone_number) IS NULL AND (v_email IS NULL)) THEN
		
		SELECT USER_KEY, UUID FROM `user` u WHERE u.UUID = v_user_uuid;
		
	ELSEIF (v_user_uuid IS NULL AND v_email_hash IS NOT NULL AND v_phone_number IS NULL AND v_email IS NULL) THEN
	
		SELECT USER_KEY, UUID FROM `user` u WHERE u.EMAIL_HASH = v_email_hash;
	
	ELSEIF (v_user_uuid IS NOT NULL AND v_email_hash IS NOT NULL AND v_phone_number IS NOT NULL AND v_email IS NULL) THEN
	
		SELECT USER_KEY, UUID FROM `user` u WHERE u.PRIMARY_MOBILE_NUMBER = v_phone_number;
		
	ELSEIF ((v_user_uuid IS NOT NULL) AND (v_email_hash IS NULL) AND (v_phone_number IS NULL) AND (v_email IS NOT NULL)) THEN
	
		SELECT USER_KEY, UUID FROM `user` u WHERE u.PRIMARY_EMAIL_ID = v_email;
	
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_get_user_personal_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_get_user_personal_data`(
	IN `v_user_uuid` VARCHAR(36)
)
BEGIN
	SELECT u.USER_KEY, u.FULL_NAME, u.GENDER, u.PRIMARY_EMAIL_ID, u.EMAIL_HASH, u.PRIMARY_MOBILE_NUMBER, u.UUID, u.USER_NAME, u.DEVICE_TOKEN,
	u.CREATION_DATE, u.DAILY_GOAL, u.USER_TOTAL_COUNT, d.DOMAIN_NAME, d.UUID AS DOMAIN_UUID
	FROM `user` u, domains d 
	WHERE u.DOMAIN_KEY = d.DOMAIN_ID 
	AND u.UUID = v_user_uuid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_insert_default_device` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_insert_default_device`(
	IN `v_user_uuid` VARCHAR(36),
	IN `v_device_uuid` VARCHAR(36),
	IN `v_device_name` VARCHAR(20),
	IN `v_device_hash` VARCHAR(40),
	IN `v_device_type` CHAR(1),
	IN `v_creation_date` DATETIME
)
BEGIN

	DECLARE l_user_key INT;

	DECLARE l_device_key INT;
	DECLARE l_device_uuid VARCHAR(36);
	
	DECLARE l_result TINYINT;
	
	DECLARE errno INT;
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
   GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
   SELECT errno AS MYSQL_ERROR;
   ROLLBACK;
   END;
	
	START TRANSACTION;
	
		SELECT USER_KEY INTO @l_user_key FROM `user` u WHERE u.UUID = v_user_uuid;	
	
		IF (NOT EXISTS (SELECT DEVICE_KEY FROM device WHERE DEVICE_HASH = v_device_hash)) THEN
			INSERT INTO device (UUID, DEVICE_NAME, DEVICE_HASH, DEVICE_TYPE, USER_KEY, REGISTRATION_DATE) 
				VALUES (v_device_uuid, v_device_name, v_device_hash, v_device_type, @l_user_key, v_creation_date);
			
			SELECT LAST_INSERT_ID() INTO @l_device_key;
	
			UPDATE `user` SET REGISTERED_DEVICES = 1 WHERE USER_KEY = @l_user_key;
	
		END IF;
		
		SET @l_result = 1;
		
	COMMIT WORK;
	
	SELECT @l_result AS RESULT;
	
	/*
	SELECT d.UUID, d.DEVICE_NAME, d.DEVICE_TYPE
	FROM device d
	WHERE d.DEVICE_KEY = @l_device_key;
	*/
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_insert_event_and_event_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_insert_event_and_event_user`(
	IN `v_user_uuid` VARCHAR(50),
	IN `v_event_uuid` VARCHAR(50),
	IN `v_event_name` VARCHAR(50),
	IN `v_event_creation_date` DATETIME,
	IN `v_city_uuid` VARCHAR(50),
	IN `v_domains_uuid` VARCHAR(50),
	IN `v_is_default` CHAR(1),
	IN `v_group_uuid` VARCHAR(50)
)
BEGIN

	DECLARE l_user_key INT;
	DECLARE l_domain_key INT;
	DECLARE l_group_key INT;
	DECLARE l_city_id VARCHAR(10);
	DECLARE l_event_key INT;
	DECLARE l_total_event_members INT;
	
	DECLARE errno INT;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION

BEGIN
		GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
		SELECT errno AS MYSQL_ERROR;
		ROLLBACK;
END;

		START TRANSACTION;
			SELECT u.USER_KEY INTO @l_user_key FROM `user` u WHERE u.UUID = v_user_uuid;
			
			SELECT d.DOMAIN_ID INTO @l_domain_key FROM `domains` d WHERE d.UUID = v_domains_uuid;
			
			SELECT g.GROUP_KEY INTO @l_group_key FROM `group` g WHERE g.UUID = v_group_uuid;
			
			SELECT vmc.id INTO @l_city_id FROM `vendor_worldcities` vmc WHERE vmc.uuid = v_city_uuid;
			
			INSERT INTO `events` (CREATOR_USER_KEY, UUID, EVENT_NAME, IS_ACTIVE, EVENT_CREATION_DATE, DOMAIN_KEY, CITY_ID, GROUP_KEY)
			VALUES(@l_user_key, v_event_uuid, v_event_name,'Y', v_event_creation_date, @l_domain_key, @l_city_id, @l_group_key);
			
			SELECT LAST_INSERT_ID() INTO @l_event_key;
			
			SELECT (TOTAL_EVENT_MEMBERS+1) INTO @l_total_event_members FROM `events` WHERE `events`.EVENT_KEY = @l_event_key;
			
			INSERT INTO `event_users` (EVENT_KEY, USER_KEY, IS_ACTIVE, IS_DEFAULT, CREATION_DATE) 
			VALUES(@l_event_key, @l_user_key, 'Y', v_is_default, v_event_creation_date);
			
			UPDATE `events` SET `events`.TOTAL_EVENT_MEMBERS = @l_total_event_members WHERE `events`.EVENT_KEY = @l_event_key;

		COMMIT WORK;
		
		SELECT e.UUID AS EVENT_UUID, e.EVENT_NAME, e.IS_ACTIVE, e.EVENT_CREATION_DATE, e.TOTAL_EVENT_COUNTS, concat(vw.city_ascii, ', ', vw.country) AS EVENT_CITY
		FROM `user` AS u, `events` AS e, vendor_worldcities vw
		WHERE u.`USER_KEY` = e.CREATOR_USER_KEY AND vw.id = e.CITY_ID AND u.`USER_KEY` = @l_user_key AND e.EVENT_KEY = @l_event_key;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_insert_event_goal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_insert_event_goal`(
	IN `v_user_uuid` VARCHAR(36),
	IN `v_event_schedule_uuid` VARCHAR(36),
	IN `v_item_uuid` VARCHAR(36),
	IN `v_event_goal_uuid` VARCHAR(36),
	IN `v_event_goal` INT
)
BEGIN
	DECLARE l_event_schedule_key INT;
	DECLARE l_item_key INT;
	DECLARE errno INT;
	
	DECLARE l_creator_user_key INT;
	DECLARE l_validate_user_key INT;
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
		GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
		SELECT errno AS MYSQL_ERROR;
		ROLLBACK;
		END;
		
		SELECT e.CREATOR_USER_KEY INTO @l_creator_user_key
		FROM `events` e, `events_schedule` es
		WHERE es.UUID = v_event_schedule_uuid
		AND e.EVENT_KEY = es.EVENT_KEY;
		
		SELECT u.USER_KEY INTO @l_validate_user_key
		FROM `user` u
		WHERE u.UUID = v_user_uuid;

		IF (@l_validate_user_key = @l_creator_user_key) THEN
			START TRANSACTION;
	
				SELECT es.EVENT_SCHEDULE_KEY INTO @l_event_schedule_key FROM `events_schedule` es WHERE es.UUID = v_event_schedule_uuid;
	
				SELECT i.ITEM_KEY INTO @l_item_key FROM `items` i WHERE i.ITEM_UUID = v_item_uuid;
				
				INSERT INTO `event_goal` (EVENT_SCHEDULE_KEY, ITEM_KEY, GOAL, UUID)
				VALUES(@l_event_schedule_key, @l_item_key, v_event_goal, v_event_goal_uuid);
			COMMIT WORK;
		END IF;
		
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_insert_event_schedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_insert_event_schedule`(
	IN `v_event_uuid` VARCHAR(50),
	IN `v_event_schedule_uuid` VARCHAR(50),
	IN `v_start_time` DATETIME,
	IN `v_end_time` DATETIME
)
BEGIN
	DECLARE l_event_key INT;
	DECLARE l_event_schedule_key INT;
	DECLARE errno INT;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
		GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
		SELECT errno AS MYSQL_ERROR;
		ROLLBACK;
		END;
			START TRANSACTION;
				SELECT e.EVENT_KEY INTO @l_event_key FROM `events` e WHERE e.UUID = v_event_uuid;
				INSERT INTO `events_schedule` (EVENT_KEY, UUID, EVENT_START_TIME, EVENT_END_TIME)
				VALUES(@l_event_key, v_event_schedule_uuid, v_start_time, v_end_time);
				
				SELECT LAST_INSERT_ID() INTO @l_event_schedule_key;
			COMMIT WORK;

		
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_insert_group_invitations` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_insert_group_invitations`(
	IN `v_group_uuid` VARCHAR(36),
	IN `v_primary_email_id` VARCHAR(50),
	IN `v_invite_code` VARCHAR(6)
)
BEGIN

	DECLARE l_group_key INT;
	DECLARE l_group_member INT;
	
	DECLARE errno INT;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION

	BEGIN
			GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
			SELECT errno AS MYSQL_ERROR;
			ROLLBACK;
	END;

	START TRANSACTION;

		SELECT g.GROUP_KEY INTO @l_group_key FROM `group` g WHERE g.UUID = v_group_uuid;
	
		SELECT COUNT(g.GROUP_KEY) INTO @l_group_member
		FROM `group` AS g, group_user AS gu
		WHERE g.UUID = v_group_uuid
		AND gu.GROUP_KEY = g.GROUP_KEY
		AND gu.USER_KEY IN (SELECT USER_KEY FROM `user` u WHERE u.EMAIL_HASH = SHA1(v_primary_email_id)); 
		
		IF (@l_group_member = 0) THEN
			INSERT IGNORE INTO group_invitation (GROUP_KEY, EMAIL_HASH, PRIMARY_EMAIL_ID, INVITE_CODE)	
			VALUES (@l_group_key, SHA1(v_primary_email_id), v_primary_email_id, v_invite_code);
		
		END IF;
	
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_insert_group_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_insert_group_user`(
	IN `v_group_uuid` VARCHAR(36),
	IN `v_user_uuid` VARCHAR(36),
	IN `v_email_hash` VARCHAR(40),
	IN `v_primary_email_id` VARCHAR(256),
	IN `v_invite_code` VARCHAR(6),
	IN `v_invitation_date` DATETIME
)
BEGIN

	DECLARE l_record_count INT;
	DECLARE l_is_admin CHAR(1);
	
	DECLARE l_user_exists INT;
	DECLARE l_invitation_exists INT;
	DECLARE l_user_is_member INT;
	DECLARE l_user_invited INT;
	
	DECLARE l_user_key INT;
	DECLARE l_group_key INT;
	
	DECLARE errno INT;
	DECLARE errDesc TEXT;

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	   BEGIN
	   GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO, errDesc = MESSAGE_TEXT;
	   SELECT errno AS MYSQL_ERROR, errDesc AS MYSQL_ERRMESSAGE;
	   ROLLBACK;
	   END;
	
		START TRANSACTION;
		SELECT GROUP_KEY INTO @l_group_key FROM `group` g WHERE g.UUID = v_group_uuid;
		SELECT USER_KEY INTO @l_user_key FROM `user` u WHERE u.EMAIL_HASH = v_email_hash;
		
		SELECT gu.IS_ADMIN INTO @l_is_admin FROM group_user gu, `user` u WHERE gu.USER_KEY = @l_user_key AND gu.GROUP_KEY = @l_group_key;
		
		IF(@l_user_key IS NOT NULL) THEN
			SET @l_user_exists = 1;
		ELSE 
			SET @l_user_exists = 0;
		END IF;
		
		IF ((@l_user_exists = 1) AND (@l_is_admin = 'Y')) THEN
	
			SELECT count(g.GROUP_KEY) INTO @l_record_count
			FROM `group` AS g, group_user AS gu
			WHERE g.GROUP_KEY = @l_group_key
			AND gu.GROUP_KEY = g.GROUP_KEY
			AND gu.USER_KEY = @l_user_key;
			
			IF (@l_record_count > 0) THEN
				SET @l_user_is_member = 1;
			END IF;
					
			SET @l_record_count = 0;
			
			SELECT count(gi.GROUP_KEY) INTO @l_record_count
			FROM group_invitation gi
			WHERE gi.GROUP_KEY = @l_group_key
			AND gi.USER_KEY = @l_user_key;
			
			IF (@l_record_count > 0) THEN
				SET @l_invitation_exists = 1;
			END IF;
		ELSE
			SET @l_user_is_member = 0;
			SET @l_invitation_exists = 0;
			SET @l_user_invited = 0;
		END IF;
		
		
		IF ((@l_user_exists = 1) AND (@l_invitation_exists = 0)) THEN
		
			INSERT INTO group_user (GROUP_KEY, USER_KEY, CREATION_DATE) VALUES (@l_group_key, @l_user_key, v_creation_date);
			
		
		ELSEIF ((@l_user_exists = 0) AND (@l_invitation_exists = 0)) THEN
		
			INSERT INTO group_invitation (GROUP_KEY, EMAIL_HASH, PRIMARY_EMAIL_ID, INVITE_CODE, INVITATION_DATE)
			VALUES (@l_group_key, v_email_hash, v_primary_email_id, v_invite_code, v_invitation_date);
			
			SET @l_user_invited = 1;
			
		END IF;

		SELECT v_email_hash AS email_hash, @l_user_exists AS user_exists, @l_invitation_exists AS invitation_exists, @l_user_is_member AS user_is_member, @l_user_invited AS user_invited;
	
	COMMIT WORK;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_insert_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_insert_user`(
	IN `v_user_uuid` VARCHAR(36),
	IN `v_primary_email_id` VARCHAR(256),
	IN `v_email_hash` VARCHAR(40),
	IN `v_full_name` VARCHAR(256),
	IN `v_creation_date` DATETIME,
	IN `v_device_token` VARCHAR(175),
	IN `v_is_active` CHAR(1),
	IN `v_phone_number` VARCHAR(40),
	IN `v_gender` VARCHAR(40),
	IN `v_signin_method` VARCHAR(40),
	IN `v_domains_uuid` VARCHAR(50)
)
BEGIN

	DECLARE l_user_key INT;
	DECLARE l_domain_key INT;
	DECLARE l_user_uuid VARCHAR(36);
	
	DECLARE l_result INT;
	
	
	DECLARE errno INT;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
   GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
   SELECT errno AS MYSQL_ERROR;
   ROLLBACK;
   END;

	START TRANSACTION;
	
		SELECT d.DOMAIN_ID INTO @l_domain_key FROM `domains` d WHERE d.UUID = v_domains_uuid;
	
		INSERT INTO `user` (UUID, PRIMARY_EMAIL_ID, EMAIL_HASH, FULL_NAME, CREATION_DATE, DEVICE_TOKEN, IS_ACTIVE, PRIMARY_MOBILE_NUMBER, GENDER, SIGN_IN_METHOD, DOMAIN_KEY)
			VALUES (v_user_uuid, v_primary_email_id, v_email_hash, v_full_name, v_creation_date, v_device_token, v_is_active, v_phone_number, v_gender,v_signin_method, @l_domain_key);

		-- INSERT INTO `user` (UUID, PRIMARY_EMAIL_ID, EMAIL_HASH, FULL_NAME, CREATION_DATE, DEVICE_TOKEN, IS_ACTIVE, PRIMARY_MOBILE_NUMBER, USER_NAME, SIGN_IN_METHOD, DOMAIN_KEY)
		--	VALUES (v_user_uuid, v_primary_email_id, v_email_hash, v_full_name, v_creation_date, v_device_token, v_is_active, v_phone_number, v_user_name,v_signin_method, @l_domain_key);

		SET @l_result = 1;	
	COMMIT WORK;
	
	SELECT @l_result AS RESULT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_update_default_group` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_update_default_group`(
	IN `v_user_uuid` VARCHAR(36),
	IN `v_group_uuid` VARCHAR(36)
)
BEGIN
	
	UPDATE `group_user` gu
	SET gu.`IS_DEFAULT` = 'Y'
	WHERE gu.GROUP_KEY IN (SELECT g.GROUP_KEY FROM `group` g WHERE g.UUID = v_group_uuid)
	AND gu.USER_KEY IN (SELECT u.USER_KEY FROM `user` u WHERE u.UUID = v_user_uuid);
	
UPDATE `group_user` gu
	SET gu.`IS_DEFAULT` = 'N'
	WHERE gu.GROUP_KEY IN (SELECT g.GROUP_KEY FROM `group` g WHERE g.UUID <> v_group_uuid)
	AND gu.USER_KEY IN (SELECT u.USER_KEY FROM `user` u WHERE u.UUID = v_user_uuid);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_update_group` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_update_group`(
	IN `v_user_uuid` VARCHAR(36),
	IN `v_group_uuid` VARCHAR(36),
	IN `v_city_uuid` VARCHAR(36),
	IN `v_group_name` VARCHAR(50),
	IN `v_group_goal` BIGINT
)
BEGIN

	UPDATE `group` g 
	SET g.GROUP_NAME = v_group_name, g.CITY_ID = (SELECT vw.id FROM vendor_worldcities vw WHERE vw.UUID = v_city_uuid), 
		g.GROUP_GOAL = v_group_goal;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_update_refresh_token` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_update_refresh_token`(
	IN `v_email_hash` VARCHAR(40),
	IN `v_refresh_token` VARCHAR(40),
	IN `v_phone_hash` VARCHAR(40),
	IN `v_signin_method` VARCHAR(25)
)
BEGIN

	IF (v_signin_method = 'google') THEN
		UPDATE `user` u
		SET u.REFRESH_TOKEN = v_refresh_token
		WHERE u.EMAIL_HASH = v_email_hash;
	
	ELSEIF (v_signin_method = 'firebase') THEN
		UPDATE `user` u
		SET u.REFRESH_TOKEN = v_refresh_token
		WHERE u.PRIMARY_MOBILE_NUMBER = v_phone_hash;
	END IF;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_upsert_devices` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_upsert_devices`(
	IN `v_user_uuid` VARCHAR(36),
	IN `v_device_uuid` VARCHAR(36),
	IN `v_device_name` VARCHAR(20),
	IN `v_device_hash` VARCHAR(40),
	IN `v_device_firmware_version` VARCHAR(100),
	IN `v_registration_date` DATETIME,
	IN `v_promo_code` VARCHAR(10)
)
BEGIN

	DECLARE l_user_key INT;
	DECLARE l_result INT;
	DECLARE v_records INT;
	DECLARE v_old_user_key INT;
	DECLARE v_is_active CHAR(1);
	DECLARE v_registered_devices INT;
	DECLARE v_old_user_regd_devices INT;
	DECLARE v_new_user_regd_devices INT;
	DECLARE v_registered_devices_config INT;

	START TRANSACTION;
	
			SELECT USER_KEY INTO @l_user_key FROM `user` u WHERE u.UUID = v_user_uuid;

			SELECT cp.VALUE INTO @v_registered_devices_config FROM configuration_parameters cp WHERE  cp.`KEY` = 'REGISTERED_DEVICES_LIMIT';


			IF (NOT EXISTS (SELECT DEVICE_KEY FROM device 
				WHERE DEVICE_HASH = v_device_hash )) THEN

			      	SELECT REGISTERED_DEVICES INTO @v_registered_devices FROM `user` 
			      	WHERE USER_KEY = @l_user_key;
			   IF (@v_registered_devices < @v_registered_devices_config) THEN
  		  			SET @v_registered_devices := (@v_registered_devices + 1);
	
	   	  			INSERT INTO device (UUID, DEVICE_NAME, DEVICE_HASH, DEVICE_TYPE, DEVICE_FIRMWARE_VERSION, USER_KEY, REGISTRATION_DATE, PROMO_CODE) 
							VALUES (v_device_uuid, v_device_name, v_device_hash, 'H', v_device_firmware_version, @l_user_key, v_registration_date, v_promo_code);
		
					UPDATE `user` SET REGISTERED_DEVICES = @v_registered_devices WHERE USER_KEY = @l_user_key;
					SET l_result := 1;
				ELSE
					SET l_result := 0;
				END IF;
			ELSE
				SELECT USER_KEY, IS_ACTIVE INTO @v_old_user_key, @v_is_active 
					FROM device WHERE DEVICE_HASH = v_device_hash;

				SELECT REGISTERED_DEVICES INTO @v_new_user_regd_devices FROM `user` WHERE USER_KEY = @l_user_key;
		      
				IF (((@v_old_user_key != @l_user_key) && (@v_is_active = 'N')) && (@v_new_user_regd_devices < @v_registered_devices_config)) THEN
					UPDATE device SET USER_KEY = @l_user_key, IS_ACTIVE = 'Y', REGISTRATION_DATE = v_registration_date WHERE DEVICE_HASH = v_device_hash;

					SELECT REGISTERED_DEVICES INTO @v_registered_devices FROM `user` WHERE USER_KEY = @l_user_key;
					
					SET @v_registered_devices := (@v_registered_devices + 1);

					UPDATE `user` SET REGISTERED_DEVICES = @v_registered_devices WHERE USER_KEY = @l_user_key;
					SET l_result := 1;
				ELSE
					SET l_result := 0;
				END IF;
		
			END IF;

	COMMIT;
	SELECT l_result AS RESULT;
END;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_upsert_event_daily_counts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_upsert_event_daily_counts`(
	IN `v_count_date` DATETIME,
	IN `v_tz` VARCHAR(40),
	IN `v_loclat` VARCHAR(11),
	IN `v_loclong` VARCHAR(11),
	IN `v_user_uuid` VARCHAR(36),
	IN `v_device_uuid` VARCHAR(36),
	IN `v_domain_uuid` VARCHAR(36),
	IN `v_item_uuid` VARCHAR(36),
	IN `v_event_uuid` VARCHAR(36),
	IN `v_counts` INT
)
BEGIN

		DECLARE l_event_key INT;
		DECLARE l_event_daily_counts BIGINT;

		DECLARE l_user_key INT;
		DECLARE l_device_key INT;
		DECLARE l_domain_key INT;
		DECLARE l_item_key INT;

		DECLARE l_record_count INT;
		DECLARE l_user_daily_counts BIGINT;
		
		DECLARE errno INT;
		
		DECLARE EXIT HANDLER FOR SQLEXCEPTION
	   BEGIN
	   GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
	   SELECT errno AS MYSQL_ERROR;
	   ROLLBACK;
	   END;
	   
			
     SELECT e.EVENT_KEY
	  INTO @l_event_key
	  FROM event_users AS eu, `events` AS e, `user` AS u
     WHERE eu.EVENT_KEY = e.EVENT_KEY AND eu.USER_KEY = u.USER_KEY 
     AND e.IS_ACTIVE = 'Y' AND u.USER_KEY = v_user_key AND e.UUID = v_event_uuid;
     
     SELECT d.DOMAIN_ID INTO @l_domain_key FROM domains d WHERE d.UUID = v_domain_uuid;
     
     SELECT u.USER_KEY INTO @l_user_key FROM `user` u WHERE u.UUID = v_user_uuid;

     SELECT d.DEVICE_KEY INTO @l_device_key FROM device d WHERE d.UUID = v_device_uuid;
     
     SELECT i.ITEM_KEY INTO @l_item_key FROM items i WHERE i.ITEM_UUID = v_item_uuid;

     IF (SELECT FOUND_ROWS() = 1) THEN
			START TRANSACTION;
                     INSERT INTO events_counts (EVENT_KEY, USER_KEY, DEVICE_KEY, COUNT_DATE, LOCAL_DATE, TZ, LOCLAT, LOCLONG, `COUNTS`, ITEM_KEY)
                             VALUES(@l_event_key, @l_user_key, @l_device_key, CONVERT_TZ(v_count_date, v_tz, 'UTC'), v_count_date, v_tz, v_loclat, v_loclong, v_counts, @l_item_key);

                     UPDATE `user` AS u1 SET u1.`USER_TOTAL_COUNT` =
                     (SELECT (SUM(u2.`USER_TOTAL_COUNT`) + v_counts) FROM (SELECT * FROM `user`) AS u2 WHERE u2.`USER_KEY` = @l_user_key AND u2.USER_KEY = u1.USER_KEY)
                     WHERE u1.`USER_KEY` = @l_user_key;

							UPDATE `events` AS e1 SET e1.TOTAL_EVENT_COUNTS =
				         (SELECT (SUM(e2.TOTAL_EVENT_COUNTS) + v_counts) FROM (SELECT * FROM `events`) AS e2 WHERE e2.`EVENT_KEY` = @l_event_key AND e2.EVENT_KEY = e1.EVENT_KEY)
				         WHERE e1.`EVENT_KEY` = @l_event_key;

                     IF (NOT EXISTS(SELECT EVENT_KEY FROM event_daily_counts_summary AS edcs
                             WHERE edcs.EVENT_COUNT_DATE = DATE(CONVERT_TZ(v_count_date, v_tz, 'UTC')) AND edcs.EVENT_KEY = @l_event_key)) THEN
                             INSERT INTO event_daily_counts_summary (EVENT_KEY, EVENT_COUNT_DATE, EVENT_DAILY_TOTAL_COUNTS, LAST_UPDATED_DATETIME, DOMAIN_KEY, ITEM_KEY)
                             VALUES(@l_event_key, DATE(CONVERT_TZ(v_count_date, v_tz, 'UTC')), v_counts, CONVERT_TZ(v_count_date, v_tz, 'UTC'), @l_domain_key, @l_item_key);
                     ELSE
                     		SELECT  SUM(edcs.EVENT_DAILY_TOTAL_COUNTS + v_counts) INTO @v_event_daily_counts 
                     		FROM event_daily_counts_summary edcs 
                     		WHERE edcs.EVENT_COUNT_DATE = DATE(CONVERT_TZ(v_count_date, v_tz, 'UTC')) AND edcs.EVENT_KEY = @l_event_key;
                     	
                     		UPDATE event_daily_counts_summary AS edcs SET edcs.EVENT_DAILY_TOTAL_COUNTS = @v_event_daily_counts,
										edcs.LAST_UPDATED_DATETIME = CONVERT_TZ(v_count_date, v_tz, 'UTC')
                     		WHERE edcs.EVENT_COUNT_DATE = DATE(CONVERT_TZ(v_count_date, v_tz, 'UTC')) AND edcs.EVENT_KEY = @l_event_key;
                             
                     END IF;
			COMMIT WORK;
		END IF;
			
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_upsert_group_daily_counts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_upsert_group_daily_counts`(
	IN `v_count_date` DATETIME,
	IN `v_tz` VARCHAR(40),
	IN `v_loclat` VARCHAR(11),
	IN `v_loclong` VARCHAR(11),
	IN `v_user_uuid` VARCHAR(36),
	IN `v_device_uuid` VARCHAR(36),
	IN `v_group_uuid` VARCHAR(36),
	IN `v_counts` INT
)
BEGIN

		DECLARE l_user_key INT;
		DECLARE l_group_key INT;
        DECLARE l_device_key INT;
		DECLARE l_group_daily_counts BIGINT;

		DECLARE l_user_daily_counts BIGINT;
		
		
		DECLARE errno INT;
		DECLARE EXIT HANDLER FOR SQLEXCEPTION
	   	BEGIN
	   		GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
	   		SELECT errno AS MYSQL_ERROR;
	   		ROLLBACK;
	   	END;
	   
	   	SELECT u.USER_KEY INTO @l_user_key FROM `user` u WHERE u.UUID = v_user_uuid;
	   
	   	SELECT d.DEVICE_KEY INTO @l_device_key FROM `device` d, `user` u WHERE d.UUID = v_device_uuid AND d.USER_KEY = u.USER_KEY;
			
        SELECT g.GROUP_KEY INTO @l_group_key
		  FROM group_user AS gu, `group` AS g, `user` AS u
        WHERE gu.GROUP_KEY = g.GROUP_KEY AND gu.USER_KEY = u.USER_KEY
        AND g.IS_ACTIVE = 'Y' AND u.USER_KEY = @l_user_key AND g.UUID = v_group_uuid;

        IF (SELECT FOUND_ROWS() = 1) THEN
				START TRANSACTION;
                        INSERT INTO group_counts (GROUP_KEY, USER_KEY, DEVICE_KEY, COUNT_DATE, LOCAL_DATE, TZ, LOCLAT, LOCLONG, `COUNTS`)
                                VALUES(@l_group_key, @l_user_key, @l_device_key, CONVERT_TZ(v_count_date, v_tz, 'UTC'), v_count_date, v_tz, v_loclat, v_loclong, v_counts);

                        UPDATE `user` AS u1 SET u1.`USER_TOTAL_COUNT` =
                        (SELECT (SUM(u2.`USER_TOTAL_COUNT`) + v_counts) FROM (SELECT * FROM `user`) AS u2 WHERE u2.`USER_KEY` = @l_user_key AND u2.USER_KEY = u1.USER_KEY)
                        WHERE u1.`USER_KEY` = @l_user_key;

								UPDATE `group` AS g1 SET g1.TOTAL_GROUP_COUNTS =
					         (SELECT (SUM(g2.TOTAL_GROUP_COUNTS) + v_counts) FROM (SELECT * FROM `group`) AS g2 WHERE g2.`GROUP_KEY` = @l_group_key AND g2.GROUP_KEY = g1.GROUP_KEY)
					         WHERE g1.`GROUP_KEY` = @l_group_key;

                        IF (NOT EXISTS(SELECT GROUP_KEY FROM group_daily_counts_summary AS gdcs
                                WHERE gdcs.GROUP_COUNT_DATE = DATE(CONVERT_TZ(v_count_date, v_tz, 'UTC')) AND gdcs.GROUP_KEY = @l_group_key)) THEN
                                INSERT INTO group_daily_counts_summary (GROUP_KEY, GROUP_COUNT_DATE, GROUP_DAILY_TOTAL_COUNTS, LAST_UPDATED_DATETIME)
                                VALUES(@l_group_key, DATE(CONVERT_TZ(v_count_date, v_tz, 'UTC')), v_counts, CONVERT_TZ(v_count_date, v_tz, 'UTC'));
                        ELSE
                        		SELECT  SUM(gdcs.GROUP_DAILY_TOTAL_COUNTS + v_counts) INTO @l_group_daily_counts 
                        		FROM group_daily_counts_summary gdcs 
                        		WHERE gdcs.GROUP_COUNT_DATE = DATE(CONVERT_TZ(v_count_date, v_tz, 'UTC')) AND gdcs.GROUP_KEY = @l_group_key;
                        	
                        		UPDATE group_daily_counts_summary AS gdcs SET gdcs.GROUP_DAILY_TOTAL_COUNTS = @l_group_daily_counts, 
											gdcs.LAST_UPDATED_DATETIME = CONVERT_TZ(v_count_date, v_tz, 'UTC')
                        		WHERE gdcs.GROUP_COUNT_DATE = DATE(CONVERT_TZ(v_count_date, v_tz, 'UTC')) AND gdcs.GROUP_KEY = @l_group_key;
                                
                        END IF;
				COMMIT WORK;
			END IF;
			

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_validate_group_invitations` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_validate_group_invitations`(
	IN `v_group_uuid` VARCHAR(36),
	IN `v_user_uuid` VARCHAR(36),
	IN `v_email_hash` VARCHAR(40)
)
BEGIN
	
	
	(SELECT 'IS_ADMIN' AS PARTICULARS, gu.IS_ADMIN AS DECISION
	FROM group_user gu 
	WHERE gu.USER_KEY IN (SELECT u.USER_KEY FROM `user` u WHERE u.UUID = v_user_uuid)
	AND gu.GROUP_KEY IN (SELECT g.GROUP_KEY FROM `group` g WHERE g.UUID = v_group_uuid))
		UNION
	(SELECT 'USER_EXISTS', COUNT(u.USER_KEY) AS DECISION FROM `user` u WHERE u.EMAIL_HASH = v_email_hash )
		UNION 
	(SELECT 'GROUP_MEMBER', COUNT(g.GROUP_KEY) AS DECISION
	FROM `group` AS g, group_user AS gu
	WHERE g.UUID = v_group_uuid
	AND gu.GROUP_KEY = g.GROUP_KEY
	AND gu.USER_KEY IN (SELECT USER_KEY FROM `user` u WHERE u.EMAIL_HASH = v_email_hash))
		UNION
	(SELECT 'USER_INVITED', COUNT(gi.GROUP_KEY) AS DECISION
	FROM group_invitation gi
	WHERE gi.GROUP_KEY IN (SELECT g1.GROUP_KEY FROM `group` g1 WHERE g1.UUID = v_group_uuid)
	AND gi.EMAIL_HASH = v_email_hash);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_get_cities` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_v3_get_cities`()
BEGIN
	SELECT vw.uuid AS `UUID`, vw.city_ascii AS CITY, CONCAT(vw.city_ascii, ', ', vw.country) AS CITY_COUNTRY FROM vendor_worldcities vw;
END;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `get_event_summary`
--

/*!50001 DROP TABLE IF EXISTS `get_event_summary`*/;
/*!50001 DROP VIEW IF EXISTS `get_event_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `get_event_summary` AS select `e`.`EVENT_NAME` AS `EVENT_NAME`,`e`.`UUID` AS `UUID`,`ec`.`EVENT_KEY` AS `EVENT_KEY`,`ec`.`USER_KEY` AS `USER_KEY`,`ec`.`DEVICE_KEY` AS `DEVICE_KEY`,`ec`.`COUNT_DATE` AS `COUNT_DATE`,`ec`.`LOCAL_DATE` AS `LOCAL_DATE`,`ec`.`TZ` AS `TZ`,`ec`.`COUNTS` AS `COUNTS` from ((`events_counts` `ec` join `events` `e`) join `user` `u`) where `ec`.`USER_KEY` = `u`.`USER_KEY` and `ec`.`EVENT_KEY` = `e`.`EVENT_KEY` and exists(select 1 from ((`events_counts` `ec1` join `user` `u1`) join `events` `e1`) where `ec1`.`USER_KEY` = `u1`.`USER_KEY` and `ec1`.`EVENT_KEY` = `e1`.`EVENT_KEY` limit 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `get_groups_summary`
--

/*!50001 DROP TABLE IF EXISTS `get_groups_summary`*/;
/*!50001 DROP VIEW IF EXISTS `get_groups_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `get_groups_summary` AS select `g`.`GROUP_NAME` AS `GROUP_NAME`,`g`.`UUID` AS `UUID`,`gc`.`GROUP_KEY` AS `GROUP_KEY`,`gc`.`USER_KEY` AS `USER_KEY`,`gc`.`DEVICE_KEY` AS `DEVICE_KEY`,`gc`.`COUNT_DATE` AS `COUNT_DATE`,`gc`.`LOCAL_DATE` AS `LOCAL_DATE`,`gc`.`TZ` AS `TZ`,`gc`.`COUNTS` AS `COUNTS` from (((`group_counts` `gc` join `group` `g`) join `group_user` `gu`) join `user` `u`) where `gu`.`USER_KEY` = `u`.`USER_KEY` and `gc`.`USER_KEY` = `u`.`USER_KEY` and `gu`.`USER_KEY` = `u`.`USER_KEY` and `gc`.`GROUP_KEY` = `g`.`GROUP_KEY` and `gc`.`GROUP_KEY` = `gu`.`GROUP_KEY` and exists(select 1 from (((`group_counts` `gc1` join `group_user` `gu1`) join `user` `u1`) join `group` `g1`) where `gu1`.`USER_KEY` = `u1`.`USER_KEY` and `gc1`.`USER_KEY` = `u1`.`USER_KEY` and `gu1`.`USER_KEY` = `u1`.`USER_KEY` and `gc1`.`GROUP_KEY` = `g1`.`GROUP_KEY` and `gc1`.`GROUP_KEY` = `gu1`.`GROUP_KEY` and `gu1`.`GROUP_KEY` = `g1`.`GROUP_KEY` limit 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `get_groups_summary_with_different_tz`
--

/*!50001 DROP TABLE IF EXISTS `get_groups_summary_with_different_tz`*/;
/*!50001 DROP VIEW IF EXISTS `get_groups_summary_with_different_tz`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `get_groups_summary_with_different_tz` AS select `g`.`GROUP_NAME` AS `GROUP_NAME`,`g`.`UUID` AS `UUID`,`gc`.`GROUP_KEY` AS `GROUP_KEY`,`gc`.`USER_KEY` AS `USER_KEY`,`gc`.`DEVICE_KEY` AS `DEVICE_KEY`,`gc`.`COUNT_DATE` AS `COUNT_DATE`,`gc`.`LOCAL_DATE` AS `LOCAL_DATE`,convert_tz(`gc`.`COUNT_DATE`,'UTC','Asia/Kolkata') AS `IST`,convert_tz(`gc`.`COUNT_DATE`,'UTC','America/Toronto') AS `EST`,`gc`.`TZ` AS `TZ`,`gc`.`COUNTS` AS `COUNTS` from (((`group_counts` `gc` join `group` `g`) join `group_user` `gu`) join `user` `u`) where `gu`.`USER_KEY` = `u`.`USER_KEY` and `gc`.`USER_KEY` = `u`.`USER_KEY` and `gu`.`USER_KEY` = `u`.`USER_KEY` and `gc`.`GROUP_KEY` = `g`.`GROUP_KEY` and `gc`.`GROUP_KEY` = `gu`.`GROUP_KEY` and exists(select 1 from (((`group_counts` `gc1` join `group_user` `gu1`) join `user` `u1`) join `group` `g1`) where `gu1`.`USER_KEY` = `u1`.`USER_KEY` and `gc1`.`USER_KEY` = `u1`.`USER_KEY` and `gu1`.`USER_KEY` = `u1`.`USER_KEY` and `gc1`.`GROUP_KEY` = `g1`.`GROUP_KEY` and `gc1`.`GROUP_KEY` = `gu1`.`GROUP_KEY` and `gu1`.`GROUP_KEY` = `g1`.`GROUP_KEY` limit 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `get_subscriptions`
--

/*!50001 DROP TABLE IF EXISTS `get_subscriptions`*/;
/*!50001 DROP VIEW IF EXISTS `get_subscriptions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `get_subscriptions` AS select `st`.`SUBSC_TYPE` AS `SUBSC_TYPE`,`st`.`UUID` AS `SUBSCRIPTION_UUID`,`sc`.`SUBSC_CONFIG_KEY` AS `SUBSC_CONFIG_KEY`,`ct`.`CONFIG_TYPE_DESC` AS `CONFIG_TYPE_DESC`,`ct`.`UUID` AS `OONFIGURATION_TYPE_UUID`,`sc`.`VALUES` AS `VALUES`,`sc`.`UUID` AS `SUBSCRIPTION_CONFIG_UUID`,`ct`.`RESOURCE_IDENTIFIER` AS `RESOURCE_IDENTIFIER`,`ct`.`METHOD_TYPE` AS `METHOD_TYPE` from ((`subscription_type` `st` join `subscription_config` `sc`) join `configuration_type` `ct`) where `st`.`SUBSC_KEY` = `sc`.`SUBSC_KEY` and `sc`.`CONFIG_TYPE_KEY` = `ct`.`CONFIG_TYPE_KEY` */;
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

-- Dump completed on 2022-03-01 20:58:14
