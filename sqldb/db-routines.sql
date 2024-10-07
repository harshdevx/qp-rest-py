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
-- Dumping routines for database 'kliqitDB'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_uuidv4` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`qp_count_dba`@`%` FUNCTION `fn_uuidv4`() RETURNS char(36) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN
  -- Generate 8 2-byte strings that we will combine into a UUIDv4
    SET @h1 = LPAD(HEX(FLOOR(RAND() * 0xffff)), 4, '0');
    SET @h2 = LPAD(HEX(FLOOR(RAND() * 0xffff)), 4, '0');
    SET @h3 = LPAD(HEX(FLOOR(RAND() * 0xffff)), 4, '0');
    SET @h6 = LPAD(HEX(FLOOR(RAND() * 0xffff)), 4, '0');
    SET @h7 = LPAD(HEX(FLOOR(RAND() * 0xffff)), 4, '0');
    SET @h8 = LPAD(HEX(FLOOR(RAND() * 0xffff)), 4, '0');

    -- 4th section will start with a 4 indicating the version
    SET @h4 = CONCAT('4', LPAD(HEX(FLOOR(RAND() * 0x0fff)), 3, '0'));

    -- 5th section first half-byte can only be 8, 9 A or B
    SET @h5 = CONCAT(HEX(FLOOR(RAND() * 4 + 8)),
                LPAD(HEX(FLOOR(RAND() * 0x0fff)), 3, '0'));

    -- Build the complete UUID
    RETURN LOWER(CONCAT(
        @h1, @h2, '-', @h3, '-', @h4, '-', @h5, '-', @h6, @h7, @h8
    ));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_v2_cp_get_registered_devices_limit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`qp_count_dba`@`%` FUNCTION `fn_v2_cp_get_registered_devices_limit`() RETURNS int(11)
BEGIN

	DECLARE l_registered_devices_limit INT;

	SELECT cp.VALUE INTO @l_registered_devices_limit
	FROM configuration_parameters cp
	WHERE cp.`KEY` = 'REGISTERED_DEVICES_LIMIT';
	
	RETURN @l_registered_devices_limit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_v2_get_city_key` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`qp_count_dba`@`%` FUNCTION `fn_v2_get_city_key`(`v_city_name` VARCHAR(100)
) RETURNS int(11)
BEGIN
	DECLARE l_city_id INT;
	
	SELECT t1.id INTO @l_city_id FROM vendor_worldcities t1 WHERE t1.city_ascii = v_city_name;
	
	RETURN @l_city_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_v2_get_device_key` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`qp_count_dba`@`%` FUNCTION `fn_v2_get_device_key`(`v_device_uuid` VARCHAR(36)
) RETURNS int(11)
BEGIN
	
	DECLARE l_device_key INT;
	
	SELECT device.DEVICE_KEY INTO @l_device_key FROM device WHERE device.UUID = v_device_uuid;
	
	RETURN @l_device_key;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_v2_get_domain_key` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`qp_count_dba`@`%` FUNCTION `fn_v2_get_domain_key`(`v_domain_uuid` VARCHAR(36)
) RETURNS int(11)
BEGIN
	
	DECLARE l_domain_key INT;
	
	SELECT domains.DOMAIN_ID INTO @l_domain_key FROM domains WHERE domains.UUID = v_domain_uuid;
	
	RETURN @l_domain_key;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_v2_get_event_goal_key` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`qp_count_dba`@`%` FUNCTION `fn_v2_get_event_goal_key`(`v_event_goal_uuid` VARCHAR(36)
) RETURNS int(11)
BEGIN
	
	DECLARE l_event_goal_key INT;
	
	SELECT event_goal.EVENT_GOAL_KEY INTO @l_event_goal_key FROM event_goal WHERE event_goal.UUID = v_event_goal_uuid;
	
	RETURN @l_event_goal_key;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_v2_get_event_key` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`qp_count_dba`@`%` FUNCTION `fn_v2_get_event_key`(`v_event_uuid` VARCHAR(36)
) RETURNS int(11)
BEGIN
	
	DECLARE l_event_key INT;
	
	SELECT `events`.EVENT_KEY INTO @l_event_key FROM `events` WHERE `events`.UUID = v_event_uuid;
	
	RETURN @l_event_key;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_v2_get_event_schedule_key` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`qp_count_dba`@`%` FUNCTION `fn_v2_get_event_schedule_key`(`v_event_schedule_uuid` VARCHAR(36)
) RETURNS int(11)
BEGIN
	
	DECLARE l_event_schedule_key INT;
	
	SELECT events_schedule.EVENT_SCHEDULE_KEY INTO @l_event_schedule_key FROM events_schedule WHERE events_schedule.UUID = v_event_schedule_uuid;
	
	RETURN @l_event_schedule_key;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_v2_get_event_uuid_from_order_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`qp_count_dba`@`%` FUNCTION `fn_v2_get_event_uuid_from_order_id`(`v_order_id` BIGINT
) RETURNS varchar(36) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN

	DECLARE l_event_uuid VARCHAR(36);
	
	SELECT e.`UUID` INTO @l_event_uuid
	FROM `events` e
	WHERE e.ORDER_ID = v_order_id;
	
	RETURN @l_event_uuid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_v2_get_group_key` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`qp_count_dba`@`%` FUNCTION `fn_v2_get_group_key`(`v_group_uuid` VARCHAR(36)
) RETURNS int(11)
BEGIN
	
	DECLARE l_group_key INT;
	
	SELECT `group`.GROUP_KEY INTO @l_group_key FROM `group` WHERE `group`.UUID = v_group_uuid;
	
	RETURN @l_group_key;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_v2_get_item_key` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`qp_count_dba`@`%` FUNCTION `fn_v2_get_item_key`(`v_item_uuid` VARCHAR(36)
) RETURNS int(11)
BEGIN
	
	DECLARE l_item_key INT;
	
	SELECT `items`.ITEM_KEY INTO @l_item_key FROM `items` WHERE `items`.ITEM_UUID = v_item_uuid;
	
	RETURN @l_item_key;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_v2_get_user_key` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`qp_count_dba`@`%` FUNCTION `fn_v2_get_user_key`(`v_user_uuid` VARCHAR(36)
) RETURNS int(11)
BEGIN
	
	DECLARE l_user_key INT;
	
	SELECT `user`.USER_KEY INTO @l_user_key FROM `user` WHERE `user`.UUID = v_user_uuid;
	
	RETURN @l_user_key;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_activate_deactivate_device_by_uuid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_activate_deactivate_device_by_uuid`(
	IN `v_device_uuid` VARCHAR(36),
	IN `v_user_uuid` VARCHAR(36),
	IN `v_device_hash` VARCHAR(40),
	IN `v_inactivation_date` DATETIME,
	IN `v_reactivation_date` DATETIME,
	IN `v_criteria` VARCHAR(25),
	OUT `v_result` INT
)
BEGIN
	DECLARE v_user_key INT;
	DECLARE v_registered_devices INT;
	DECLARE v_is_active CHAR(1);
	DECLARE v_device_type CHAR(1);
	
	START TRANSACTION;

	IF (v_criteria = 'unregister') THEN

		SELECT d.IS_ACTIVE, d.DEVICE_TYPE INTO @v_is_active, @v_device_type FROM device d WHERE d.DEVICE_HASH = v_device_hash;

		IF((@v_is_active = 'Y') AND (@v_device_type = 'H')) THEN
			UPDATE `device` d 
			SET d.IS_ACTIVE = 'N', d.INACTIVATION_DATE = v_inactivation_date
			WHERE d.UUID = v_device_uuid AND d.DEVICE_HASH = v_device_hash AND d.DEVICE_TYPE = 'H';
			
			SET v_result = 1;
		
			UPDATE `user` u
			SET u.REGISTERED_DEVICES = u.REGISTERED_DEVICES-1
			WHERE u.UUID = v_user_uuid;
		ELSE
			SET v_result = -1;
		END IF;
		
	
	ELSEIF (v_criteria = 'register') THEN

		SELECT u.USER_KEY, u.REGISTERED_DEVICES INTO @v_user_key, @v_registered_devices FROM `user` u WHERE u.UUID = v_user_uuid;
		
		SELECT d.IS_ACTIVE INTO @v_is_active FROM device d WHERE d.DEVICE_HASH = v_device_hash;

		IF ((@v_is_active = 'N') AND (@v_registered_devices < 2)) THEN
			UPDATE `device` d 
			SET d.IS_ACTIVE = 'Y', d.REACTIVATION_DATE = v_reactivation_date, d.USER_KEY = @v_user_key
			WHERE d.UUID = v_device_uuid AND d.DEVICE_HASH = v_device_hash AND d.DEVICE_TYPE = 'H';
		
			SET v_result = 2;

			UPDATE `user` u
			SET u.REGISTERED_DEVICES = u.REGISTERED_DEVICES+1
			WHERE u.UUID = v_user_uuid;
		ELSE
		
			SET v_result = -2;
		END IF;
		
	END IF; 
	COMMIT;

	SELECT v_result AS RESULT;

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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_activate_deactivate_event`(
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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_activate_deactivate_group_user`(
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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_add_new_user_group_invitations`(
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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_event_daily_counts_for_today_per_device`(
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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_get_all_groups`(
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_get_counts_tile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_get_counts_tile`(
	IN `v_user_uuid` VARCHAR(36),
	IN `v_group_uuid` VARCHAR(36),
	IN `v_count_date` DATETIME,
	IN `v_tz` VARCHAR(40)
)
BEGIN
	
	(SELECT 'TOTAL_OF_ALL_GROUPS', SUM(gdcs.GROUP_DAILY_TOTAL_COUNTS) AS RESULT
	FROM group_daily_counts_summary gdcs, `group` g
	WHERE gdcs.GROUP_KEY = g.GROUP_KEY
	AND g.GROUP_KEY IN (
			SELECT g1.GROUP_KEY
			FROM group_user gu, `user` u, `group` g1
			WHERE gu.USER_KEY = u.USER_KEY
			AND gu.GROUP_KEY = g1.GROUP_KEY
			AND u.UUID = v_user_uuid
		))
	UNION
	(SELECT 'LAST_UPDATED_COUNT_FROM_ALL_GROUPS', CONVERT_TZ(gc.COUNT_DATE, 'UTC', v_tz) AS RESULT
	FROM 
	group_counts gc
	WHERE gc.GROUP_KEY IN 
		(SELECT  g1.GROUP_KEY
			FROM group_user gu, `user` u, `group` g1
			WHERE gu.USER_KEY = u.USER_KEY
			AND gu.GROUP_KEY = g1.GROUP_KEY
			AND u.UUID = v_user_uuid)
	ORDER BY COUNT_DATE DESC
	LIMIT 1
	)
	UNION
	(SELECT 'TOTAL_GROUP_COUNTS_TO_DATE', SUM(gdcs.GROUP_DAILY_TOTAL_COUNTS)
	FROM group_daily_counts_summary gdcs, `group` g
	WHERE g.GROUP_KEY = gdcs.GROUP_KEY
	AND g.UUID = v_group_uuid
	GROUP BY gdcs.GROUP_KEY)
	UNION
	(SELECT 'GRAPH_DATA_DAILY_COUNTS_GOAL', CONCAT(gdcs.GROUP_DAILY_TOTAL_COUNTS, ',', g.GROUP_GOAL)
	FROM group_daily_counts_summary gdcs, `group` g
	WHERE g.GROUP_KEY = gdcs.GROUP_KEY
	AND g.UUID = v_group_uuid
	AND gdcs.GROUP_COUNT_DATE = DATE(CONVERT_TZ(v_count_date, v_tz, 'UTC')));
	
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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_get_device`(
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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_get_devices`(
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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_get_device_by_device_hash`(
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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_get_device_key`(
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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_get_event`(
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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_get_events`(
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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_get_events_daily_counts_for_today`(
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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_get_groups`(
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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_get_group_counts_total_for_month`(
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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_get_group_count_last_update`(
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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_get_group_daily_counts_by_range`(
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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_get_group_daily_counts_for_today`(
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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_get_group_daily_counts_for_today_per_device`(
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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_get_group_invitations`(
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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_get_group_key`(
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
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_get_user_app_sec_data`(
	IN `v_user_uuid` VARCHAR(36)
)
BEGIN
	SELECT u.USER_KEY, u.EMAIL_HASH, u.CREATION_DATE, u.INACTIVATION_DATE, u.ACCOUNT_EXPIRY_DATE, u.DEVICE_TOKEN, 
	u.IS_ACTIVE, u.IS_PREMIUM, u.REFRESH_TOKEN, u.REGISTERED_DEVICES, u.UUID, u.`ROLE`, st.SUBSC_TYPE, st.UUID AS SUBSC_UUID, u.SIGN_IN_METHOD AS SIGNIN_METHOD
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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_get_user_from_fields`(
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_get_user_password` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_get_user_password`(
	IN `v_email_hash` VARCHAR(40)
)
BEGIN
	SELECT u.UUID, u.PASSWORD_HASH, u.EMAIL_HASH, u.PRIMARY_EMAIL_ID
	FROM `user` u, domains d 
	WHERE u.DOMAIN_KEY = d.DOMAIN_ID 
	AND u.EMAIL_HASH = v_email_hash;
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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_get_user_personal_data`(
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_get_user_uuid_from_email` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_get_user_uuid_from_email`(
	IN `v_email_hash` VARCHAR(40)
)
BEGIN

	SELECT u.UUID
	FROM `user` u
	WHERE u.EMAIL_HASH = v_email_hash;
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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_insert_default_device`(
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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_insert_event_and_event_user`(
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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_insert_event_goal`(
	IN `v_event_schedule_uuid` VARCHAR(50),
	IN `v_item_uuid` VARCHAR(50),
	IN `v_event_goal` INT,
	IN `v_event_goal_uuid` VARCHAR(50)
)
BEGIN
	DECLARE l_event_schedule_key INT;
	DECLARE l_item_key INT;
	DECLARE errno INT;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
		GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
		SELECT errno AS MYSQL_ERROR;
		ROLLBACK;
		END;
			START TRANSACTION;
				SELECT es.EVENT_SCHEDULE_KEY INTO @l_event_schedule_key FROM `events_schedule` es WHERE es.UUID = v_event_schedule_uuid;

				SELECT i.ITEM_KEY INTO @l_item_key FROM `items` i WHERE i.ITEM_UUID = v_item_uuid;
				
				INSERT INTO `event_goal` (EVENT_SCHEDULE_KEY, ITEM_KEY, GOAL, UUID)
				VALUES(@l_event_schedule_key, @l_item_key, v_event_goal, v_event_goal_uuid);
			COMMIT WORK;
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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_insert_event_schedule`(
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_insert_group_and_group_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_insert_group_and_group_user`(
	IN `v_user_uuid` VARCHAR(36),
	IN `v_group_uuid` VARCHAR(36),
	IN `v_group_name` VARCHAR(50),
	IN `v_group_creation_date` DATETIME,
	IN `v_city_uuid` VARCHAR(36),
	IN `v_group_goal` BIGINT,
	IN `v_is_default` CHAR(1)
)
BEGIN

	DECLARE l_user_key INT;
	DECLARE l_subsc_key TINYINT;

	DECLARE l_group_key INT;
	DECLARE l_group_uuid VARCHAR(36);
	
	
	
	DECLARE l_city_id VARCHAR(10);
	
	DECLARE l_total_group_members INT;
	
	DECLARE l_record_count INT;

	DECLARE errno INT;

	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	   BEGIN
		   GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
		   SELECT errno AS MYSQL_ERROR;
		   ROLLBACK;
	   END;
			
     START TRANSACTION;
			
     		SELECT u.USER_KEY, u.SUBSC_KEY INTO @l_user_key, @l_subsc_key FROM `user` u WHERE u.UUID = v_user_uuid;

    		
    		
    		SELECT id INTO @l_city_id FROM vendor_worldcities vmc WHERE vmc.uuid = v_city_uuid;

			INSERT INTO `group` (UUID, GROUP_NAME, CREATOR_USER_KEY, GROUP_CREATION_DATE, IS_ACTIVE, GROUP_GOAL, CITY_ID, SUBSC_KEY) 
				VALUES(v_group_uuid, v_group_name, @l_user_key, v_group_creation_date, 'Y', v_group_goal, @l_city_id, @l_subsc_key);
		
			
			SELECT LAST_INSERT_ID() INTO @l_group_key;
			SELECT (TOTAL_GROUP_MEMBERS+1) INTO @l_total_group_members FROM `group` WHERE `group`.GROUP_KEY = @l_group_key;
         
      	INSERT INTO group_user (GROUP_KEY, USER_KEY, IS_ADMIN, IS_ACTIVE, IS_DEFAULT, CREATION_DATE) VALUES(@l_group_key, @l_user_key, 'Y', 'Y', v_is_default, v_group_creation_date);
      
			UPDATE `group` SET `group`.TOTAL_GROUP_MEMBERS = @l_total_group_members WHERE `group`.GROUP_KEY = @l_group_key;
			
			
     COMMIT WORK;
        
      SELECT g.UUID AS GROUP_UUID, g.GROUP_NAME, g.IS_ACTIVE, g.GROUP_CREATION_DATE, g.GROUP_GOAL, g.TOTAL_GROUP_COUNTS, concat(vw.city_ascii, ', ', vw.country) AS GROUP_CITY
		FROM `user` AS u, `group` AS g, vendor_worldcities vw
		WHERE u.`USER_KEY` = g.CREATOR_USER_KEY AND vw.id = g.CITY_ID AND u.`USER_KEY` = @l_user_key AND g.GROUP_KEY = @l_group_key;
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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_insert_group_invitations`(
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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_insert_group_user`(
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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_update_default_group`(
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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_update_group`(
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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_update_refresh_token`(
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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_upsert_devices`(
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
	

END ;;
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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_upsert_event_daily_counts`(
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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_upsert_group_daily_counts`(
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_validate_create_modify_group` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_validate_create_modify_group`(
	IN `v_user_uuid` VARCHAR(36),
	IN `v_configuration_type_uuid` VARCHAR(36)
)
BEGIN

	DECLARE l_existing_num_of_groups INT;
	DECLARE l_allowed_num_of_groups INT;
	DECLARE l_result BOOL;
	
	SELECT COUNT(*) INTO @l_existing_num_of_groups
	FROM `group` g, `user` u
	WHERE g.CREATOR_USER_KEY = u.USER_KEY
	AND u.UUID = v_user_uuid;

	SELECT gs.`VALUES` INTO @l_allowed_num_of_groups FROM get_subscriptions gs
	WHERE gs.OONFIGURATION_TYPE_UUID = v_configuration_type_uuid
	AND gs.SUBSCRIPTION_UUID IN ( 
	SELECT st.UUID AS SUBSCRIPTION_UUID
	FROM `user` u, subscription_type st
	WHERE u.SUBSC_KEY = st.SUBSC_KEY
	AND u.UUID = v_user_uuid);
	
	IF (@l_existing_num_of_groups < @l_allowed_num_of_groups) THEN
		SET @l_result = TRUE;
	ELSE
		SET @l_result = FALSE;
	END IF;
	
	SELECT @l_result AS RESULT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_validate_group_count_history` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_validate_group_count_history`(
	IN `v_user_uuid` VARCHAR(50),
	IN `v_configuration_type_uuid` VARCHAR(50),
	IN `v_user_criteria` VARCHAR(50)
)
BEGIN

	DECLARE l_allowed_num_of_days INT;
	DECLARE l_result BOOL;

	SELECT gs.`VALUES` INTO @l_allowed_num_of_days FROM get_subscriptions gs
	WHERE gs.OONFIGURATION_TYPE_UUID = v_configuration_type_uuid
	AND gs.SUBSCRIPTION_UUID IN ( 
	SELECT st.UUID AS SUBSCRIPTION_UUID
	FROM `user` u, subscription_type st
	WHERE u.SUBSC_KEY = st.SUBSC_KEY
	AND u.UUID = v_user_uuid);
	
	IF (v_user_criteria <= @l_allowed_num_of_days) THEN
		SET @l_result = TRUE;
	ELSE
		SET @l_result = FALSE;
	END IF;
	
	SELECT @l_result AS RESULT;
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
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_validate_group_invitations`(
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_v3_validate_group_member_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`qp_count_dba`@`%` PROCEDURE `sp_v3_validate_group_member_count`(
	IN `v_group_uuid` VARCHAR(36),
	IN `v_user_uuid` VARCHAR(36),
	IN `v_configuration_type_uuid` VARCHAR(36)
)
BEGIN
	
	DECLARE l_existing_num_of_group_members INT;
	DECLARE l_allowed_num_of_group_members INT;
	DECLARE l_result BOOL;
	
	SELECT COUNT(gu.USER_KEY)-1 INTO @l_existing_num_of_group_members
	FROM `group_user` gu, `user` u, `group` g
	WHERE gu.`GROUP_KEY` = g.`GROUP_KEY`
	AND gu.`USER_KEY` = u.USER_KEY
	AND g.UUID = v_group_uuid;
	

	SELECT gs.`VALUES` INTO @l_allowed_num_of_group_members FROM get_subscriptions gs
	WHERE gs.OONFIGURATION_TYPE_UUID = v_configuration_type_uuid
	AND gs.SUBSCRIPTION_UUID IN ( 
	SELECT st.UUID AS SUBSCRIPTION_UUID
	FROM `user` u, subscription_type st
	WHERE u.SUBSC_KEY = st.SUBSC_KEY
	AND u.UUID = v_user_uuid);
	
	
	IF (@l_existing_num_of_group_members <= @l_existing_num_of_group_members) THEN
		SET @l_result = TRUE;
	ELSE
		SET @l_result = FALSE;
	END IF;
	
	SELECT @l_result AS RESULT;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-06 18:52:27
