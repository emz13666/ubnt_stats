-- phpMyAdmin SQL Dump
-- version 4.4.7
-- http://www.phpmyadmin.net
--
-- ����: localhost
-- ����� ��������: ��� 14 2021 �., 17:39
-- ������ �������: 5.5.23
-- ������ PHP: 5.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES cp1251 */;

--
-- ���� ������: `ubiquiti`
--
CREATE DATABASE IF NOT EXISTS `ubiquiti` DEFAULT CHARACTER SET cp1251 COLLATE cp1251_general_cs;
USE `ubiquiti`;

DELIMITER $$
--
-- ���������
--
DROP PROCEDURE IF EXISTS `del_old_from_stats`$$
CREATE DEFINER=`root`@`%` PROCEDURE `del_old_from_stats`()
BEGIN
  DECLARE affected_rows INT DEFAULT 0;
  DECLARE count_rows INT DEFAULT 0;
  DECLARE count INT DEFAULT 1;
  DECLARE lastdate varchar(10);
 -- DECLARE var_sql varchar(100);
  
  call resetLog ();
  REPEAT 
    DELETE FROM `stats_ap` where date<=DATE_SUB(curdate(),INTERVAL 70 day) LIMIT 50000;
    SELECT ROW_COUNT() INTO affected_rows;
    set count_rows = count_rows + affected_rows;
    if affected_rows <> 0 then 
      call dolog(concat_ws(': ','CountDeletedRowsIn_stats_ap',  count_rows));
    end if;
  UNTIL affected_rows=0
  END REPEAT;
  set count_rows=0;
  REPEAT
    DELETE FROM `stats_lte` where date<=DATE_SUB(curdate(),INTERVAL 70 day) LIMIT 50000;
    SELECT ROW_COUNT() INTO affected_rows;
    set count_rows = count_rows + affected_rows;
    if affected_rows <> 0  then 
      call dolog(concat_ws(': ','CountDeletedRowsIn_stats_lte',  count_rows));
	end if;
  UNTIL affected_rows=0
  END REPEAT;    
  set count_rows=0;
  REPEAT
    DELETE FROM `stats_ping` where date<=DATE_SUB(curdate(),INTERVAL 70 day) LIMIT 50000;
    SELECT ROW_COUNT() INTO affected_rows;
    set count_rows = count_rows + affected_rows;
    if affected_rows <> 0 then
      call dolog(concat_ws(': ','CountDeletedRowsIn_stats_ping',  count_rows));
	end if;
  UNTIL affected_rows=0
  END REPEAT;
  set count_rows=0;
  REPEAT
    delete  from `stats_status` where datetimeend<=DATE_SUB(curdate(),interval 70 day) LIMIT 50000;
    SELECT ROW_COUNT() INTO affected_rows;
    set count_rows = count_rows + affected_rows;
    if affected_rows <> 0 then
      call dolog(concat_ws(': ','CountDeletedRowsIn_stats_status',  count_rows));
	end if;
  UNTIL affected_rows=0
  END REPEAT;
  set count_rows=0;
  set count=1;
  REPEAT
   SET lastdate=DATE_SUB(curdate(),INTERVAL 70 day);
   -- call dolog(concat_ws(': ','lastdate',  lastdate));
   SET @var_sql = CONCAT('DELETE /* del_old_from_stats: ', count, ' */ FROM `statss` where date<=\'', lastdate, '\' limit 50000');
   -- call dolog(concat_ws(': ','@var_sql',  @var_sql));
   PREPARE zxc FROM @var_sql;
   EXECUTE zxc;
   -- DELETE /* proc del_old_from stats */ FROM `statss` where date<=DATE_SUB(curdate(),INTERVAL 70 day) limit 50000;
   SELECT ROW_COUNT() INTO affected_rows;
    set count_rows = count_rows + affected_rows;
    set count=count+1;
    if affected_rows <> 0 then 
      call dolog(concat_ws(': ','CountDeletedRowsIn_statss',  count_rows));
	end if;
  UNTIL affected_rows=0
  END REPEAT;
END$$

DROP PROCEDURE IF EXISTS `doLog`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `doLog`(in logMsg nvarchar(2048))
BEGIN  
  insert into log_debug_proc (msg) values(logMsg);
END$$

DROP PROCEDURE IF EXISTS `resetLog`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `resetLog`()
BEGIN   
    create table if not exists log_debug_proc (ts timestamp default current_timestamp, msg varchar(2048)) engine = myisam; 
    truncate table log_debug_proc;
END$$

DROP PROCEDURE IF EXISTS `test1`$$
CREATE DEFINER=`root`@`%` PROCEDURE `test1`()
BEGIN
	select id, date_time, sectorsize, xstart, ystart, xend, yend from wifi_stat_map into @id, @dttm, @sectorsize, @xstart, @ystart, @xend, @yend;
set @xcurr:=@xstart;
set @ycurr:=@ystart;
set @rowscount:=0;
set @colscount:=0;
WHILE @ycurr < @yend do
    while @xcurr<@xend do
		set @colscount:=@colscount+1;
		set @xcurr:=@xcurr+@sectorsize;
    end while;
    set @rowscount:=@rowscount+1;
    set @ycurr:=@ycurr+@sectorsize;
end while;
select @colscount, @rowscount;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- ��������� ������� `bullet_history`
--

DROP TABLE IF EXISTS `bullet_history`;
CREATE TABLE IF NOT EXISTS `bullet_history` (
  `id` bigint(20) unsigned NOT NULL,
  `id_bullet` bigint(20) NOT NULL,
  `datetime` datetime NOT NULL,
  `info` varchar(255) COLLATE cp1251_general_cs DEFAULT NULL,
  `place_install` varchar(50) COLLATE cp1251_general_cs NOT NULL COMMENT '����� ���������� ���������',
  `place_install_new` varchar(100) COLLATE cp1251_general_cs NOT NULL COMMENT '����� ��������� '
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs;

-- --------------------------------------------------------

--
-- ��������� ������� `device`
--

DROP TABLE IF EXISTS `device`;
CREATE TABLE IF NOT EXISTS `device` (
  `ID` int(11) NOT NULL,
  `device_type` int(11) NOT NULL COMMENT '��� ����������',
  `serial` varchar(30) COLLATE cp1251_general_cs DEFAULT NULL COMMENT '�������� ����� ����������',
  `status` int(11) NOT NULL COMMENT '������ �� ������ ����������',
  `equipment` int(11) DEFAULT NULL COMMENT '�����������, ��� ����������� ����������',
  `comment` text COLLATE cp1251_general_cs NOT NULL,
  `device_link` int(11) NOT NULL COMMENT '������ �� ������ ������� ���� ����������'
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='����������';

-- --------------------------------------------------------

--
-- ��������� ������� `device_events`
--

DROP TABLE IF EXISTS `device_events`;
CREATE TABLE IF NOT EXISTS `device_events` (
  `ID` int(11) NOT NULL,
  `device` int(11) NOT NULL,
  `equipment` int(11) NOT NULL,
  `ref_event_type` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='������� �� ������ � ��������� ���������';

-- --------------------------------------------------------

--
-- ��������� ������� `equipment`
--

DROP TABLE IF EXISTS `equipment`;
CREATE TABLE IF NOT EXISTS `equipment` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(50) COLLATE cp1251_general_cs DEFAULT NULL,
  `equipment_type` int(11) NOT NULL,
  `ip_address` varchar(50) COLLATE cp1251_general_cs NOT NULL DEFAULT '' COMMENT 'IP ����� ������',
  `ip_pc` varchar(50) COLLATE cp1251_general_cs DEFAULT NULL COMMENT 'IP ����� ��������� ����������',
  `ip_alias` varchar(15) COLLATE cp1251_general_cs DEFAULT NULL COMMENT 'IP ����� ������ ��� �� ���������',
  `comment` text COLLATE cp1251_general_cs,
  `useInMonitoring` tinyint(1) NOT NULL DEFAULT '1' COMMENT '���� ������������� � ��������� �����������',
  `LastGPSDateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs;

-- --------------------------------------------------------

--
-- ��������� ������� `equipment_interfaces`
--

DROP TABLE IF EXISTS `equipment_interfaces`;
CREATE TABLE IF NOT EXISTS `equipment_interfaces` (
  `id` int(11) NOT NULL,
  `equipment` int(11) NOT NULL COMMENT '������������',
  `interface` int(11) NOT NULL COMMENT '������ �� ref_interface'
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='����������, ������� ������� �� ������������';

-- --------------------------------------------------------

--
-- ��������� ������� `hist_maps`
--

DROP TABLE IF EXISTS `hist_maps`;
CREATE TABLE IF NOT EXISTS `hist_maps` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='������ ������ �������';

-- --------------------------------------------------------

--
-- ��������� ������� `hist_map_points`
--

DROP TABLE IF EXISTS `hist_map_points`;
CREATE TABLE IF NOT EXISTS `hist_map_points` (
  `id` int(11) NOT NULL,
  `map` int(11) NOT NULL COMMENT '������ �� ������� hist_maps',
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `name` varchar(20) COLLATE cp1251_general_cs NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='������� ��������� ��������';

-- --------------------------------------------------------

--
-- ��������� ������� `hist_map_roads`
--

DROP TABLE IF EXISTS `hist_map_roads`;
CREATE TABLE IF NOT EXISTS `hist_map_roads` (
  `id` int(11) NOT NULL,
  `map` int(11) NOT NULL COMMENT '������ �� hist_map',
  `name_start` varchar(20) COLLATE cp1251_general_cs NOT NULL,
  `name_end` varchar(20) COLLATE cp1251_general_cs NOT NULL,
  `xstart` int(11) NOT NULL,
  `ystart` int(11) NOT NULL,
  `xend` int(11) NOT NULL,
  `yend` int(11) NOT NULL,
  `p1x` int(11) DEFAULT NULL,
  `p1y` int(11) DEFAULT NULL,
  `p2x` int(11) DEFAULT NULL,
  `p2y` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='���������� ��������� ������� �����';

-- --------------------------------------------------------

--
-- ��������� ������� `interface_monitoring_off`
--

DROP TABLE IF EXISTS `interface_monitoring_off`;
CREATE TABLE IF NOT EXISTS `interface_monitoring_off` (
  `id` int(11) NOT NULL,
  `equipment` int(11) NOT NULL COMMENT '������������, �� ������� ��������� ���������� �����������',
  `ref_interface` int(11) NOT NULL COMMENT '��������� � ����������� ������������',
  `Active` tinyint(4) NOT NULL DEFAULT '1' COMMENT '�������� �� ���������� ��������',
  `datetimestart` datetime NOT NULL,
  `datetimeend` datetime DEFAULT NULL,
  `reason` varchar(255) COLLATE cp1251_general_cs NOT NULL COMMENT '������� �������� ����������',
  `reason_category` tinyint(1) NOT NULL DEFAULT '0',
  `FIO` varchar(100) COLLATE cp1251_general_cs NOT NULL COMMENT '��� �����������'
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='������� ���������� �����������';

-- --------------------------------------------------------

--
-- ��������� ������� `kobus_current_breaks`
--

DROP TABLE IF EXISTS `kobus_current_breaks`;
CREATE TABLE IF NOT EXISTS `kobus_current_breaks` (
  `breakId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='������ �������� �� kobus.breaks.breakage_history, � ������� ����� ��������� null';

-- --------------------------------------------------------

--
-- ��������� ������� `kobus_export`
--

DROP TABLE IF EXISTS `kobus_export`;
CREATE TABLE IF NOT EXISTS `kobus_export` (
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LastBreakageHistoryID` bigint(20) DEFAULT NULL COMMENT '��������� ID �� �� kobus_lgok ������� breaks.breakage_history'
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='����������, � ������� ���������� ���������� � ���������';

-- --------------------------------------------------------

--
-- ��������� ������� `kobus_pribors`
--

DROP TABLE IF EXISTS `kobus_pribors`;
CREATE TABLE IF NOT EXISTS `kobus_pribors` (
  `id_equipment` int(11) NOT NULL,
  `pribor_id_kobus` int(11) NOT NULL,
  `last_gps_writed` datetime NOT NULL COMMENT '���� � ����� ��������� ������������ ������ �� gps.online_position'
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='������������� ������������ equipment � id ���������� �� �� kobus public.pribors';

-- --------------------------------------------------------

--
-- ��������� ������� `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE IF NOT EXISTS `log` (
  `datetime` datetime NOT NULL,
  `message` char(255) COLLATE cp1251_general_cs NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs;

-- --------------------------------------------------------

--
-- ��������� ������� `log_analize_wifi_by_equip`
--

DROP TABLE IF EXISTS `log_analize_wifi_by_equip`;
CREATE TABLE IF NOT EXISTS `log_analize_wifi_by_equip` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='������ ���, �� ������� �������� ������ WiFi �� ������������';

-- --------------------------------------------------------

--
-- ��������� ������� `log_debug_proc`
--

DROP TABLE IF EXISTS `log_debug_proc`;
CREATE TABLE IF NOT EXISTS `log_debug_proc` (
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `msg` varchar(2048) COLLATE cp1251_general_cs DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs;

-- --------------------------------------------------------

--
-- ��������� ������� `lte`
--

DROP TABLE IF EXISTS `lte`;
CREATE TABLE IF NOT EXISTS `lte` (
  `id_lte` bigint(20) unsigned NOT NULL,
  `name` varchar(50) COLLATE cp1251_general_cs DEFAULT NULL,
  `ip_lte` varchar(50) COLLATE cp1251_general_cs NOT NULL,
  `ip_vpn` varchar(50) COLLATE cp1251_general_cs NOT NULL,
  `mac_eth01` varchar(50) COLLATE cp1251_general_cs DEFAULT NULL,
  `mac_eth02` varchar(50) COLLATE cp1251_general_cs DEFAULT NULL,
  `mac_ovpn` varchar(50) COLLATE cp1251_general_cs DEFAULT NULL,
  `place_install` varchar(100) COLLATE cp1251_general_cs DEFAULT NULL,
  `firmware` varchar(100) COLLATE cp1251_general_cs NOT NULL,
  `id_equipment` bigint(20) unsigned DEFAULT NULL,
  `model_lte` varchar(100) COLLATE cp1251_general_cs DEFAULT NULL,
  `serial_lte` varchar(50) COLLATE cp1251_general_cs DEFAULT NULL,
  `serial_modem` varchar(50) COLLATE cp1251_general_cs DEFAULT NULL,
  `imei_modem` varchar(50) COLLATE cp1251_general_cs DEFAULT NULL,
  `model_modem` varchar(50) COLLATE cp1251_general_cs DEFAULT NULL,
  `prim` varchar(100) COLLATE cp1251_general_cs DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs;

-- --------------------------------------------------------

--
-- ��������� ������� `lte_history`
--

DROP TABLE IF EXISTS `lte_history`;
CREATE TABLE IF NOT EXISTS `lte_history` (
  `id` bigint(20) unsigned NOT NULL,
  `id_lte` bigint(20) NOT NULL,
  `datetime` datetime NOT NULL,
  `info` varchar(255) COLLATE cp1251_general_cs DEFAULT NULL,
  `place_install` varchar(50) COLLATE cp1251_general_cs NOT NULL COMMENT '����� ���������� ���������',
  `place_install_new` varchar(100) COLLATE cp1251_general_cs NOT NULL COMMENT '����� ��������� '
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs;

-- --------------------------------------------------------

--
-- ��������� ������� `modems`
--

DROP TABLE IF EXISTS `modems`;
CREATE TABLE IF NOT EXISTS `modems` (
  `id_modem` bigint(20) unsigned NOT NULL,
  `is_access_point` tinyint(4) NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE cp1251_general_cs DEFAULT NULL,
  `ip_address` varchar(50) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `mac_address` varchar(50) COLLATE cp1251_general_cs DEFAULT NULL,
  `place_install` varchar(255) COLLATE cp1251_general_cs DEFAULT NULL,
  `power` tinyint(4) NOT NULL DEFAULT '20',
  `prim` varchar(255) COLLATE cp1251_general_cs DEFAULT NULL,
  `color` bigint(20) NOT NULL DEFAULT '0',
  `online` tinyint(4) NOT NULL DEFAULT '0',
  `firmware` char(8) COLLATE cp1251_general_cs NOT NULL DEFAULT '5.5',
  `id_equipment` bigint(20) unsigned DEFAULT NULL,
  `is_ap_repeater` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mac_wds_peer` varchar(50) COLLATE cp1251_general_cs DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs;

-- --------------------------------------------------------

--
-- ��������� ������� `modems_test`
--

DROP TABLE IF EXISTS `modems_test`;
CREATE TABLE IF NOT EXISTS `modems_test` (
  `id_modem` bigint(20) unsigned NOT NULL DEFAULT '0',
  `is_access_point` tinyint(4) NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE cp1251_general_cs DEFAULT NULL,
  `ip_address` varchar(50) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `mac_address` varchar(50) COLLATE cp1251_general_cs DEFAULT NULL,
  `place_install` varchar(255) COLLATE cp1251_general_cs DEFAULT NULL,
  `power` tinyint(4) NOT NULL DEFAULT '20',
  `prim` varchar(255) COLLATE cp1251_general_cs DEFAULT NULL,
  `color` bigint(20) NOT NULL DEFAULT '0',
  `online` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs;

-- --------------------------------------------------------

--
-- ��������� ������� `planned_works`
--

DROP TABLE IF EXISTS `planned_works`;
CREATE TABLE IF NOT EXISTS `planned_works` (
  `id` int(11) NOT NULL,
  `equipment` int(11) NOT NULL COMMENT '������ �� ������������',
  `workname` varchar(255) COLLATE cp1251_general_cs NOT NULL,
  `status` int(11) NOT NULL COMMENT '������ �� ������ ������',
  `lastActionsDate` datetime NOT NULL COMMENT '���� ���������� ���������',
  `CreatedDate` datetime NOT NULL COMMENT '���� �������� ������',
  `comments` text COLLATE cp1251_general_cs,
  `userid` int(11) NOT NULL COMMENT '������ �� users',
  `groupid` int(11) NOT NULL COMMENT '������ �� usergroups',
  `access` int(11) NOT NULL COMMENT '��� �������. ������ �� ref_accesstype'
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='������� ��������������� �����';

-- --------------------------------------------------------

--
-- ��������� ������� `planned_works_waitactions`
--

DROP TABLE IF EXISTS `planned_works_waitactions`;
CREATE TABLE IF NOT EXISTS `planned_works_waitactions` (
  `id` int(11) NOT NULL,
  `work` int(11) NOT NULL COMMENT '������ �� Planned_works',
  `waitAction` int(11) NOT NULL COMMENT '������ �� ref_waitactions'
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='������� ������ ����������� ��������, � ������� ��������� ����������� ������';

-- --------------------------------------------------------

--
-- ��������� ������� `ptx`
--

DROP TABLE IF EXISTS `ptx`;
CREATE TABLE IF NOT EXISTS `ptx` (
  `id_ptx` bigint(20) unsigned NOT NULL,
  `id_modem` bigint(20) unsigned DEFAULT NULL,
  `serial` varchar(20) COLLATE cp1251_general_cs DEFAULT NULL,
  `ip_address` varchar(15) COLLATE cp1251_general_cs DEFAULT NULL,
  `os_ver` varchar(50) COLLATE cp1251_general_cs DEFAULT NULL,
  `dispatch_ver` varchar(50) COLLATE cp1251_general_cs DEFAULT NULL,
  `oem_driver_ver` varchar(50) COLLATE cp1251_general_cs DEFAULT NULL,
  `prim` varchar(255) COLLATE cp1251_general_cs DEFAULT NULL,
  `mac_address` varchar(20) COLLATE cp1251_general_cs DEFAULT NULL,
  `id_equipment` bigint(20) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs;

-- --------------------------------------------------------

--
-- ��������� ������� `ptx_history`
--

DROP TABLE IF EXISTS `ptx_history`;
CREATE TABLE IF NOT EXISTS `ptx_history` (
  `id` bigint(20) unsigned NOT NULL,
  `id_ptx` bigint(20) NOT NULL,
  `datetime` datetime NOT NULL,
  `info` varchar(255) COLLATE cp1251_general_cs DEFAULT NULL,
  `place_install` varchar(50) COLLATE cp1251_general_cs NOT NULL COMMENT '����� ���������� ���������',
  `place_install_new` varchar(100) COLLATE cp1251_general_cs NOT NULL COMMENT '����� ��������� '
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs;

-- --------------------------------------------------------

--
-- ��������� ������� `ref_accesstype`
--

DROP TABLE IF EXISTS `ref_accesstype`;
CREATE TABLE IF NOT EXISTS `ref_accesstype` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE cp1251_general_cs NOT NULL,
  `description` varchar(255) COLLATE cp1251_general_cs NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='��� �������. ';

-- --------------------------------------------------------

--
-- ��������� ������� `ref_connect_type`
--

DROP TABLE IF EXISTS `ref_connect_type`;
CREATE TABLE IF NOT EXISTS `ref_connect_type` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE cp1251_general_cs NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='��� ����������� ���. ������';

-- --------------------------------------------------------

--
-- ��������� ������� `ref_device_status`
--

DROP TABLE IF EXISTS `ref_device_status`;
CREATE TABLE IF NOT EXISTS `ref_device_status` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) COLLATE cp1251_general_cs NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='��������� �������� ���������';

-- --------------------------------------------------------

--
-- ��������� ������� `ref_device_type`
--

DROP TABLE IF EXISTS `ref_device_type`;
CREATE TABLE IF NOT EXISTS `ref_device_type` (
  `ID` int(11) NOT NULL,
  `Name` varchar(100) COLLATE cp1251_general_cs NOT NULL,
  `ShortName` varchar(30) COLLATE cp1251_general_cs DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='���� ���������';

-- --------------------------------------------------------

--
-- ��������� ������� `ref_equipment_type`
--

DROP TABLE IF EXISTS `ref_equipment_type`;
CREATE TABLE IF NOT EXISTS `ref_equipment_type` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE cp1251_general_cs NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs;

-- --------------------------------------------------------

--
-- ��������� ������� `ref_event_type`
--

DROP TABLE IF EXISTS `ref_event_type`;
CREATE TABLE IF NOT EXISTS `ref_event_type` (
  `ID` int(11) NOT NULL,
  `name` varchar(20) COLLATE cp1251_general_cs NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='���������� ����� �������';

-- --------------------------------------------------------

--
-- ��������� ������� `ref_interface`
--

DROP TABLE IF EXISTS `ref_interface`;
CREATE TABLE IF NOT EXISTS `ref_interface` (
  `id` int(11) NOT NULL,
  `Name` varchar(20) COLLATE cp1251_general_cs NOT NULL COMMENT '��� ����������',
  `FullName` varchar(50) COLLATE cp1251_general_cs NOT NULL,
  `Category` int(11) DEFAULT NULL COMMENT '��������� ����������. ������ �� ������� ref_interface_category'
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs;

-- --------------------------------------------------------

--
-- ��������� ������� `ref_interface_category`
--

DROP TABLE IF EXISTS `ref_interface_category`;
CREATE TABLE IF NOT EXISTS `ref_interface_category` (
  `id` int(11) NOT NULL,
  `shortName` varchar(10) COLLATE cp1251_general_cs NOT NULL COMMENT '�������� ��� ���������',
  `FullName` varchar(50) COLLATE cp1251_general_cs DEFAULT NULL COMMENT '������ ��� ���������'
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='������� ��������� �����������';

-- --------------------------------------------------------

--
-- ��������� ������� `ref_monitor_off_category`
--

DROP TABLE IF EXISTS `ref_monitor_off_category`;
CREATE TABLE IF NOT EXISTS `ref_monitor_off_category` (
  `id` int(11) NOT NULL,
  `Name` varchar(15) COLLATE cp1251_general_cs NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='���������� ��������� ������ ����������';

-- --------------------------------------------------------

--
-- ��������� ������� `ref_statss_status`
--

DROP TABLE IF EXISTS `ref_statss_status`;
CREATE TABLE IF NOT EXISTS `ref_statss_status` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE cp1251_general_cs DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='������� ������������ ��� ���������� ����� (������� statss)';

-- --------------------------------------------------------

--
-- ��������� ������� `ref_system`
--

DROP TABLE IF EXISTS `ref_system`;
CREATE TABLE IF NOT EXISTS `ref_system` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE cp1251_general_cs NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='������� ������������� ������';

-- --------------------------------------------------------

--
-- ��������� ������� `ref_waitactions`
--

DROP TABLE IF EXISTS `ref_waitactions`;
CREATE TABLE IF NOT EXISTS `ref_waitactions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE cp1251_general_cs NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='���������� �������� ��� ���������� ������������';

-- --------------------------------------------------------

--
-- ��������� ������� `ref_works`
--

DROP TABLE IF EXISTS `ref_works`;
CREATE TABLE IF NOT EXISTS `ref_works` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE cp1251_general_cs NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='������ �����';

-- --------------------------------------------------------

--
-- ��������� ������� `ref_work_status`
--

DROP TABLE IF EXISTS `ref_work_status`;
CREATE TABLE IF NOT EXISTS `ref_work_status` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE cp1251_general_cs NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='������� ���������� �����';

-- --------------------------------------------------------

--
-- ��������� ������� `repairs`
--

DROP TABLE IF EXISTS `repairs`;
CREATE TABLE IF NOT EXISTS `repairs` (
  `ID` int(11) NOT NULL,
  `device` int(11) NOT NULL,
  `fail_date` date NOT NULL,
  `link_to_doc` varchar(100) COLLATE cp1251_general_cs DEFAULT NULL COMMENT '������ �� �������������� ����� ����',
  `sending_date` date DEFAULT NULL,
  `ticket` int(11) NOT NULL,
  `transport_num` varchar(20) COLLATE cp1251_general_cs DEFAULT NULL,
  `return_date` date NOT NULL,
  `complete` tinyint(1) NOT NULL COMMENT '������� ��������� �������'
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs;

-- --------------------------------------------------------

--
-- ��������� ������� `statss`
--

DROP TABLE IF EXISTS `statss`;
CREATE TABLE IF NOT EXISTS `statss` (
  `id` int(10) unsigned NOT NULL,
  `id_equipment` bigint(20) NOT NULL DEFAULT '0',
  `id_modem` int(10) unsigned NOT NULL DEFAULT '0',
  `mac_ap` char(20) COLLATE cp1251_general_cs NOT NULL DEFAULT '',
  `signal_level` tinyint(4) NOT NULL DEFAULT '0',
  `date` date NOT NULL DEFAULT '0000-00-00',
  `time` time NOT NULL DEFAULT '00:00:00',
  `datetime` datetime DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `num_sats` smallint(6) NOT NULL DEFAULT '0',
  `x` smallint(6) DEFAULT '0',
  `y` smallint(6) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs;

-- --------------------------------------------------------

--
-- ��������� ������� `stats_ap`
--

DROP TABLE IF EXISTS `stats_ap`;
CREATE TABLE IF NOT EXISTS `stats_ap` (
  `id` bigint(20) unsigned NOT NULL,
  `id_modem` int(10) unsigned NOT NULL DEFAULT '0',
  `id_equipment` bigint(20) NOT NULL DEFAULT '0',
  `signal_level` tinyint(4) NOT NULL DEFAULT '0',
  `date` date NOT NULL,
  `time` time NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `loadavg` smallint(4) NOT NULL DEFAULT '0',
  `memfree` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `rx_octets_eth0` bigint(20) unsigned NOT NULL DEFAULT '0',
  `tx_octets_eth0` bigint(20) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs;

-- --------------------------------------------------------

--
-- ��������� ������� `stats_fail_auto_tmp`
--

DROP TABLE IF EXISTS `stats_fail_auto_tmp`;
CREATE TABLE IF NOT EXISTS `stats_fail_auto_tmp` (
  `id` bigint(20) unsigned NOT NULL,
  `name` char(10) COLLATE cp1251_general_cs DEFAULT NULL,
  `percent` double NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs;

-- --------------------------------------------------------

--
-- ��������� ������� `stats_lte`
--

DROP TABLE IF EXISTS `stats_lte`;
CREATE TABLE IF NOT EXISTS `stats_lte` (
  `id` bigint(20) unsigned NOT NULL,
  `id_equipment` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `datetime` datetime NOT NULL,
  `signal_rsrp` smallint(6) DEFAULT NULL,
  `signal_rsrq` smallint(6) DEFAULT NULL,
  `signal_sinr` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs;

-- --------------------------------------------------------

--
-- ��������� ������� `stats_ping`
--

DROP TABLE IF EXISTS `stats_ping`;
CREATE TABLE IF NOT EXISTS `stats_ping` (
  `id` bigint(20) unsigned NOT NULL,
  `id_equipment` bigint(20) unsigned NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `datetime` datetime NOT NULL,
  `time_ping` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs;

-- --------------------------------------------------------

--
-- ��������� ������� `stats_status`
--

DROP TABLE IF EXISTS `stats_status`;
CREATE TABLE IF NOT EXISTS `stats_status` (
  `id` bigint(20) NOT NULL,
  `id_equipment` bigint(20) unsigned NOT NULL,
  `status` int(11) NOT NULL,
  `datetimestart` datetime NOT NULL,
  `datetimeend` datetime NOT NULL,
  `asu_id` varchar(20) COLLATE cp1251_general_cs NOT NULL COMMENT 'ID � �������, ������ ���������'
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='������� �������';

-- --------------------------------------------------------

--
-- ��������� ������� `stats_status_kobus_current_breaks`
--

DROP TABLE IF EXISTS `stats_status_kobus_current_breaks`;
CREATE TABLE IF NOT EXISTS `stats_status_kobus_current_breaks` (
  `breakId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='������ �������� �� kobus.breaks.breakage_history, � ������� ����� ��������� null';

-- --------------------------------------------------------

--
-- ��������� ������� `stats_status_settings_kobus`
--

DROP TABLE IF EXISTS `stats_status_settings_kobus`;
CREATE TABLE IF NOT EXISTS `stats_status_settings_kobus` (
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LastBreakageHistoryID` bigint(20) DEFAULT NULL COMMENT '��������� ID �� �� kobus_lgok ������� breaks.breakage_history'
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='����������, � ������� ���������� ���������� � ���������';

-- --------------------------------------------------------

--
-- ��������� ������� `stats_status_settings_modular`
--

DROP TABLE IF EXISTS `stats_status_settings_modular`;
CREATE TABLE IF NOT EXISTS `stats_status_settings_modular` (
  `id` int(11) NOT NULL,
  `shiftindex` int(11) NOT NULL COMMENT '�����, ������ ������� ��� ����������',
  `minendtime` int(11) NOT NULL COMMENT '����� ��������� �������, �� �������� ��� ����������'
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='��������� ';

-- --------------------------------------------------------

--
-- ��������� ������� `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
CREATE TABLE IF NOT EXISTS `usergroups` (
  `id` int(11) NOT NULL,
  `groupname` varchar(255) COLLATE cp1251_general_cs NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='������ �������������';

-- --------------------------------------------------------

--
-- ��������� ������� `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `ID` int(11) NOT NULL,
  `Login` varchar(50) COLLATE cp1251_general_cs NOT NULL,
  `password_md5` varchar(200) COLLATE cp1251_general_cs DEFAULT NULL,
  `FIO` varchar(100) COLLATE cp1251_general_cs DEFAULT NULL,
  `groupid` int(11) DEFAULT NULL COMMENT '������ �� usergroups'
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='������� ������������ �������';

-- --------------------------------------------------------

--
-- ��������� ������� `wifi_log`
--

DROP TABLE IF EXISTS `wifi_log`;
CREATE TABLE IF NOT EXISTS `wifi_log` (
  `id` bigint(20) unsigned NOT NULL,
  `datetime` datetime NOT NULL,
  `action` char(3) COLLATE cp1251_general_cs NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs;

-- --------------------------------------------------------

--
-- ��������� ������� `wifi_stat_equipment`
--

DROP TABLE IF EXISTS `wifi_stat_equipment`;
CREATE TABLE IF NOT EXISTS `wifi_stat_equipment` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `hour` tinyint(4) NOT NULL,
  `equipment` int(11) NOT NULL,
  `count_all` int(11) NOT NULL COMMENT '����� ���������� �����',
  `count_success` int(11) NOT NULL COMMENT '���������� �������� (������� ������� > -100)',
  `signal_avg` float NOT NULL COMMENT '������� ������� �������'
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='���������� �� WiFi ��� ������������';

-- --------------------------------------------------------

--
-- ��������� ������� `wifi_stat_map`
--

DROP TABLE IF EXISTS `wifi_stat_map`;
CREATE TABLE IF NOT EXISTS `wifi_stat_map` (
  `id` int(11) NOT NULL,
  `date_time` datetime NOT NULL COMMENT '���� � ����� ��������',
  `xstart` int(11) NOT NULL,
  `ystart` int(11) NOT NULL,
  `xend` int(11) NOT NULL,
  `yend` int(11) NOT NULL,
  `sectorsize` smallint(6) NOT NULL COMMENT '������ �������'
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='����� ��� ���������� ����������� ����������';

-- --------------------------------------------------------

--
-- ��������� ������� `wifi_stat_map_data`
--

DROP TABLE IF EXISTS `wifi_stat_map_data`;
CREATE TABLE IF NOT EXISTS `wifi_stat_map_data` (
  `id` int(11) NOT NULL,
  `equipment_id` bigint(20) unsigned NOT NULL,
  `map_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `hour` tinyint(4) NOT NULL,
  `AP_id` bigint(20) unsigned DEFAULT NULL COMMENT '������� �������. ������ �� modems',
  `sector_id` int(4) NOT NULL,
  `count_all` int(11) NOT NULL,
  `count_success` int(11) NOT NULL,
  `signal_avg` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='���������� Wifi �� ����� �������';

-- --------------------------------------------------------

--
-- ��������� ������� `wifi_stat_map_log`
--

DROP TABLE IF EXISTS `wifi_stat_map_log`;
CREATE TABLE IF NOT EXISTS `wifi_stat_map_log` (
  `map_id` int(11) NOT NULL,
  `id_equipment` bigint(20) unsigned NOT NULL,
  `lastGPSCalculated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='������� ��������� ������������ ��������� ��� ���������� ����� �������';

-- --------------------------------------------------------

--
-- ��������� ������� `wifi_stat_map_sectors`
--

DROP TABLE IF EXISTS `wifi_stat_map_sectors`;
CREATE TABLE IF NOT EXISTS `wifi_stat_map_sectors` (
  `id` int(11) NOT NULL,
  `map_id` int(11) NOT NULL,
  `xstart` int(11) NOT NULL,
  `ystart` int(11) NOT NULL,
  `xend` int(11) NOT NULL,
  `yend` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='� ������� �������� ������� ����� ������� �� wifi_stat_map';

-- --------------------------------------------------------

--
-- ��������� ������� `workers`
--

DROP TABLE IF EXISTS `workers`;
CREATE TABLE IF NOT EXISTS `workers` (
  `ID` int(11) NOT NULL,
  `Family` varchar(50) COLLATE cp1251_general_cs NOT NULL,
  `Name` varchar(50) COLLATE cp1251_general_cs DEFAULT NULL,
  `Second_Name` varchar(50) COLLATE cp1251_general_cs DEFAULT NULL,
  `user` int(11) DEFAULT NULL COMMENT '������ �� ������� ������������'
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='��������� �������';

-- --------------------------------------------------------

--
-- ��������� ������� `workexecution`
--

DROP TABLE IF EXISTS `workexecution`;
CREATE TABLE IF NOT EXISTS `workexecution` (
  `ID` int(11) NOT NULL,
  `WorkOrder` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `comment` text COLLATE cp1251_general_cs
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='���������� �����';

-- --------------------------------------------------------

--
-- ��������� ������� `workexecution_workers`
--

DROP TABLE IF EXISTS `workexecution_workers`;
CREATE TABLE IF NOT EXISTS `workexecution_workers` (
  `ID` int(11) NOT NULL,
  `WorkExecution` int(11) NOT NULL COMMENT '������',
  `Worker` int(11) NOT NULL COMMENT '��������, ����������� ������'
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='����� ��������� ��������� ����� ������';

-- --------------------------------------------------------

--
-- ��������� ������� `workorders`
--

DROP TABLE IF EXISTS `workorders`;
CREATE TABLE IF NOT EXISTS `workorders` (
  `ID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `equipment_type` int(11) DEFAULT NULL COMMENT '������ �� ��� �����������',
  `equipment` int(11) DEFAULT NULL COMMENT 'ID ������������',
  `failure` int(11) NOT NULL,
  `completed` tinyint(1) NOT NULL COMMENT '������ ������. ��������� ��� ���'
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_general_cs COMMENT='������ �� ���������� �����';

--
-- ������� ���������� ������
--

--
-- ������� ������� `bullet_history`
--
ALTER TABLE `bullet_history`
  ADD PRIMARY KEY (`id`);

--
-- ������� ������� `device_events`
--
ALTER TABLE `device_events`
  ADD PRIMARY KEY (`ID`);

--
-- ������� ������� `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`id`);

--
-- ������� ������� `equipment_interfaces`
--
ALTER TABLE `equipment_interfaces`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `EQIntfc` (`equipment`,`interface`);

--
-- ������� ������� `hist_maps`
--
ALTER TABLE `hist_maps`
  ADD PRIMARY KEY (`id`);

--
-- ������� ������� `hist_map_points`
--
ALTER TABLE `hist_map_points`
  ADD PRIMARY KEY (`id`);

--
-- ������� ������� `hist_map_roads`
--
ALTER TABLE `hist_map_roads`
  ADD PRIMARY KEY (`id`);

--
-- ������� ������� `interface_monitoring_off`
--
ALTER TABLE `interface_monitoring_off`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipment` (`equipment`,`ref_interface`);

--
-- ������� ������� `kobus_current_breaks`
--
ALTER TABLE `kobus_current_breaks`
  ADD PRIMARY KEY (`breakId`);

--
-- ������� ������� `kobus_pribors`
--
ALTER TABLE `kobus_pribors`
  ADD UNIQUE KEY `id_equipment` (`id_equipment`);

--
-- ������� ������� `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`datetime`);

--
-- ������� ������� `log_analize_wifi_by_equip`
--
ALTER TABLE `log_analize_wifi_by_equip`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `date` (`date`);

--
-- ������� ������� `lte`
--
ALTER TABLE `lte`
  ADD PRIMARY KEY (`id_lte`);

--
-- ������� ������� `lte_history`
--
ALTER TABLE `lte_history`
  ADD PRIMARY KEY (`id`);

--
-- ������� ������� `modems`
--
ALTER TABLE `modems`
  ADD PRIMARY KEY (`id_modem`),
  ADD UNIQUE KEY `mac_address` (`mac_address`);

--
-- ������� ������� `planned_works`
--
ALTER TABLE `planned_works`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `StatusEquipment` (`status`,`equipment`),
  ADD KEY `status` (`status`);

--
-- ������� ������� `planned_works_waitactions`
--
ALTER TABLE `planned_works_waitactions`
  ADD PRIMARY KEY (`id`);

--
-- ������� ������� `ptx`
--
ALTER TABLE `ptx`
  ADD PRIMARY KEY (`id_ptx`);

--
-- ������� ������� `ptx_history`
--
ALTER TABLE `ptx_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_ptx` (`id_ptx`);

--
-- ������� ������� `ref_accesstype`
--
ALTER TABLE `ref_accesstype`
  ADD PRIMARY KEY (`id`);

--
-- ������� ������� `ref_connect_type`
--
ALTER TABLE `ref_connect_type`
  ADD PRIMARY KEY (`id`);

--
-- ������� ������� `ref_device_status`
--
ALTER TABLE `ref_device_status`
  ADD PRIMARY KEY (`ID`);

--
-- ������� ������� `ref_device_type`
--
ALTER TABLE `ref_device_type`
  ADD PRIMARY KEY (`ID`);

--
-- ������� ������� `ref_equipment_type`
--
ALTER TABLE `ref_equipment_type`
  ADD PRIMARY KEY (`id`);

--
-- ������� ������� `ref_event_type`
--
ALTER TABLE `ref_event_type`
  ADD PRIMARY KEY (`ID`);

--
-- ������� ������� `ref_interface`
--
ALTER TABLE `ref_interface`
  ADD PRIMARY KEY (`id`);

--
-- ������� ������� `ref_interface_category`
--
ALTER TABLE `ref_interface_category`
  ADD PRIMARY KEY (`id`);

--
-- ������� ������� `ref_monitor_off_category`
--
ALTER TABLE `ref_monitor_off_category`
  ADD PRIMARY KEY (`id`);

--
-- ������� ������� `ref_statss_status`
--
ALTER TABLE `ref_statss_status`
  ADD PRIMARY KEY (`id`);

--
-- ������� ������� `ref_system`
--
ALTER TABLE `ref_system`
  ADD PRIMARY KEY (`id`);

--
-- ������� ������� `ref_waitactions`
--
ALTER TABLE `ref_waitactions`
  ADD PRIMARY KEY (`id`);

--
-- ������� ������� `ref_works`
--
ALTER TABLE `ref_works`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- ������� ������� `ref_work_status`
--
ALTER TABLE `ref_work_status`
  ADD PRIMARY KEY (`id`);

--
-- ������� ������� `repairs`
--
ALTER TABLE `repairs`
  ADD PRIMARY KEY (`ID`);

--
-- ������� ������� `statss`
--
ALTER TABLE `statss`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mac_ap` (`mac_ap`),
  ADD KEY `x` (`x`),
  ADD KEY `date_idmodem` (`date`,`id_modem`,`time`),
  ADD KEY `date` (`date`,`x`,`y`),
  ADD KEY `id_modem` (`id_modem`,`date`,`status`) USING BTREE,
  ADD KEY `datetime` (`id_equipment`,`datetime`) USING BTREE,
  ADD KEY `datetime_` (`datetime`);

--
-- ������� ������� `stats_ap`
--
ALTER TABLE `stats_ap`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date_id_modem_time` (`date`,`id_modem`,`time`),
  ADD KEY `datetime` (`datetime`) USING BTREE,
  ADD KEY `id_equipment` (`id_equipment`),
  ADD KEY `id_equip__datetime` (`id_equipment`,`datetime`);

--
-- ������� ������� `stats_fail_auto_tmp`
--
ALTER TABLE `stats_fail_auto_tmp`
  ADD PRIMARY KEY (`id`);

--
-- ������� ������� `stats_lte`
--
ALTER TABLE `stats_lte`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_equip__datetime` (`id_equipment`,`datetime`) USING BTREE;

--
-- ������� ������� `stats_ping`
--
ALTER TABLE `stats_ping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_equipment` (`id_equipment`),
  ADD KEY `date` (`date`),
  ADD KEY `time` (`time`),
  ADD KEY `index_datetime` (`id`) USING BTREE,
  ADD KEY `idx_stats_ping_id_equipment_datetime` (`id_equipment`,`datetime`);

--
-- ������� ������� `stats_status`
--
ALTER TABLE `stats_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_equipment` (`id_equipment`),
  ADD KEY `status` (`status`),
  ADD KEY `asu_id` (`asu_id`),
  ADD KEY `datetimeend_index` (`datetimeend`),
  ADD KEY `id_equipment_datetimeend` (`id_equipment`,`datetimeend`);

--
-- ������� ������� `stats_status_kobus_current_breaks`
--
ALTER TABLE `stats_status_kobus_current_breaks`
  ADD PRIMARY KEY (`breakId`);

--
-- ������� ������� `stats_status_settings_modular`
--
ALTER TABLE `stats_status_settings_modular`
  ADD PRIMARY KEY (`id`);

--
-- ������� ������� `usergroups`
--
ALTER TABLE `usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `groupname` (`groupname`);

--
-- ������� ������� `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Login` (`Login`);

--
-- ������� ������� `wifi_log`
--
ALTER TABLE `wifi_log`
  ADD PRIMARY KEY (`id`);

--
-- ������� ������� `wifi_stat_equipment`
--
ALTER TABLE `wifi_stat_equipment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dateEquip` (`date`,`equipment`);

--
-- ������� ������� `wifi_stat_map`
--
ALTER TABLE `wifi_stat_map`
  ADD PRIMARY KEY (`id`);

--
-- ������� ������� `wifi_stat_map_data`
--
ALTER TABLE `wifi_stat_map_data`
  ADD PRIMARY KEY (`id`);

--
-- ������� ������� `wifi_stat_map_log`
--
ALTER TABLE `wifi_stat_map_log`
  ADD PRIMARY KEY (`map_id`,`id_equipment`),
  ADD KEY `id_equipment` (`id_equipment`);

--
-- ������� ������� `wifi_stat_map_sectors`
--
ALTER TABLE `wifi_stat_map_sectors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `map_id` (`map_id`);

--
-- ������� ������� `workers`
--
ALTER TABLE `workers`
  ADD PRIMARY KEY (`ID`);

--
-- ������� ������� `workexecution`
--
ALTER TABLE `workexecution`
  ADD PRIMARY KEY (`ID`);

--
-- ������� ������� `workexecution_workers`
--
ALTER TABLE `workexecution_workers`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT ��� ���������� ������
--

--
-- AUTO_INCREMENT ��� ������� `bullet_history`
--
ALTER TABLE `bullet_history`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `device_events`
--
ALTER TABLE `device_events`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `equipment`
--
ALTER TABLE `equipment`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `equipment_interfaces`
--
ALTER TABLE `equipment_interfaces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `hist_maps`
--
ALTER TABLE `hist_maps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `hist_map_points`
--
ALTER TABLE `hist_map_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `hist_map_roads`
--
ALTER TABLE `hist_map_roads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `interface_monitoring_off`
--
ALTER TABLE `interface_monitoring_off`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `log_analize_wifi_by_equip`
--
ALTER TABLE `log_analize_wifi_by_equip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `lte`
--
ALTER TABLE `lte`
  MODIFY `id_lte` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `lte_history`
--
ALTER TABLE `lte_history`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `modems`
--
ALTER TABLE `modems`
  MODIFY `id_modem` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `planned_works`
--
ALTER TABLE `planned_works`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `ptx`
--
ALTER TABLE `ptx`
  MODIFY `id_ptx` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `ptx_history`
--
ALTER TABLE `ptx_history`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `ref_accesstype`
--
ALTER TABLE `ref_accesstype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `ref_connect_type`
--
ALTER TABLE `ref_connect_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `ref_device_status`
--
ALTER TABLE `ref_device_status`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `ref_device_type`
--
ALTER TABLE `ref_device_type`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `ref_equipment_type`
--
ALTER TABLE `ref_equipment_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `ref_event_type`
--
ALTER TABLE `ref_event_type`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `ref_interface`
--
ALTER TABLE `ref_interface`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `ref_interface_category`
--
ALTER TABLE `ref_interface_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `ref_statss_status`
--
ALTER TABLE `ref_statss_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `ref_system`
--
ALTER TABLE `ref_system`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `ref_waitactions`
--
ALTER TABLE `ref_waitactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `ref_works`
--
ALTER TABLE `ref_works`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `ref_work_status`
--
ALTER TABLE `ref_work_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `repairs`
--
ALTER TABLE `repairs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `statss`
--
ALTER TABLE `statss`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `stats_ap`
--
ALTER TABLE `stats_ap`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `stats_fail_auto_tmp`
--
ALTER TABLE `stats_fail_auto_tmp`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `stats_lte`
--
ALTER TABLE `stats_lte`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `stats_ping`
--
ALTER TABLE `stats_ping`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `stats_status`
--
ALTER TABLE `stats_status`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `stats_status_settings_modular`
--
ALTER TABLE `stats_status_settings_modular`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `usergroups`
--
ALTER TABLE `usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `wifi_log`
--
ALTER TABLE `wifi_log`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `wifi_stat_equipment`
--
ALTER TABLE `wifi_stat_equipment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `wifi_stat_map`
--
ALTER TABLE `wifi_stat_map`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `wifi_stat_map_data`
--
ALTER TABLE `wifi_stat_map_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `wifi_stat_map_sectors`
--
ALTER TABLE `wifi_stat_map_sectors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `workers`
--
ALTER TABLE `workers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `workexecution`
--
ALTER TABLE `workexecution`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT ��� ������� `workexecution_workers`
--
ALTER TABLE `workexecution_workers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- ����������� �������� ����� ����������� ������
--

--
-- ����������� �������� ����� ������� `stats_status`
--
ALTER TABLE `stats_status`
  ADD CONSTRAINT `stats_status_ibfk_1` FOREIGN KEY (`id_equipment`) REFERENCES `equipment` (`id`),
  ADD CONSTRAINT `stats_status_ibfk_2` FOREIGN KEY (`status`) REFERENCES `ref_statss_status` (`id`);

--
-- ����������� �������� ����� ������� `wifi_stat_map_log`
--
ALTER TABLE `wifi_stat_map_log`
  ADD CONSTRAINT `wifi_stat_map_log_ibfk_1` FOREIGN KEY (`map_id`) REFERENCES `wifi_stat_map` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wifi_stat_map_log_ibfk_2` FOREIGN KEY (`id_equipment`) REFERENCES `equipment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- ����������� �������� ����� ������� `wifi_stat_map_sectors`
--
ALTER TABLE `wifi_stat_map_sectors`
  ADD CONSTRAINT `map_id` FOREIGN KEY (`map_id`) REFERENCES `wifi_stat_map` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
