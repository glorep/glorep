-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versione server:              5.5.32 - MySQL Community Server (GPL)
-- S.O. server:                  Win32
-- HeidiSQL Versione:            9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dump della struttura del database glorep2_shared
CREATE DATABASE IF NOT EXISTS `glorep2_shared` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `glorep2_shared`;

-- Dump della struttura di tabella glorep2_shared.lo_annotation
CREATE TABLE IF NOT EXISTS `lo_annotation` (
  `Id_Annotation` int(11) NOT NULL,
  `Id_Identifier` int(11) NOT NULL,
  `Entity` varchar(1000) NOT NULL,
  `Date` datetime NOT NULL,
  `Description` varchar(1000) NOT NULL,
  `TimeUpd` int(11) NOT NULL,
  PRIMARY KEY (`Id_Annotation`,`Id_Identifier`),
  KEY `Id_Identifier` (`Id_Identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella glorep2_shared.lo_annotation: ~0 rows (circa)
/*!40000 ALTER TABLE `lo_annotation` DISABLE KEYS */;
/*!40000 ALTER TABLE `lo_annotation` ENABLE KEYS */;

-- Dump della struttura di tabella glorep2_shared.lo_contribute
CREATE TABLE IF NOT EXISTS `lo_contribute` (
  `Id_Contribute` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Fd` varchar(255) NOT NULL,
  `Role` varchar(50) NOT NULL,
  `Entity` varchar(1000) NOT NULL,
  `Date` varchar(20) NOT NULL,
  PRIMARY KEY (`Id_Contribute`),
  KEY `Id_Fd` (`Id_Fd`),
  CONSTRAINT `` FOREIGN KEY (`Id_Fd`) REFERENCES `lo_metadata` (`Id_Fd`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_lo_contribute_lo_metadata` FOREIGN KEY (`Id_Fd`) REFERENCES `lo_metadata` (`Id_Fd`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella glorep2_shared.lo_contribute: ~2 rows (circa)
/*!40000 ALTER TABLE `lo_contribute` DISABLE KEYS */;
INSERT INTO `lo_contribute` (`Id_Contribute`, `Id_Fd`, `Role`, `Entity`, `Date`) VALUES
	(15, 'GLOREP2 Glorep2111 4', 'creator', 'Lagana', '2016-28-03 11:50:23'),
	(16, 'GLOREP2 Glorep2111 5', 'creator', 'Lagana', '2016-17-05 10:58:02');
/*!40000 ALTER TABLE `lo_contribute` ENABLE KEYS */;

-- Dump della struttura di tabella glorep2_shared.lo_educational
CREATE TABLE IF NOT EXISTS `lo_educational` (
  `Id_Fd` varchar(255) NOT NULL,
  `InteractivityType` varchar(200) NOT NULL,
  `LearningResourceType` varchar(200) NOT NULL,
  `InteractivityLevel` varchar(200) NOT NULL,
  `SemanticDensity` varchar(200) NOT NULL,
  `IntendedEndUserRole` varchar(200) NOT NULL,
  `Context` varchar(200) NOT NULL,
  `TypicalAgeRange` varchar(1000) NOT NULL,
  `Difficulty` varchar(200) NOT NULL,
  `TypicalLearningTime` varchar(50) NOT NULL,
  `Description` varchar(1000) NOT NULL,
  `Language` varchar(100) NOT NULL,
  PRIMARY KEY (`Id_Fd`),
  CONSTRAINT `FK_lo_educational_lo_general` FOREIGN KEY (`Id_Fd`) REFERENCES `lo_general` (`Id_Fd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella glorep2_shared.lo_educational: ~2 rows (circa)
/*!40000 ALTER TABLE `lo_educational` DISABLE KEYS */;
INSERT INTO `lo_educational` (`Id_Fd`, `InteractivityType`, `LearningResourceType`, `InteractivityLevel`, `SemanticDensity`, `IntendedEndUserRole`, `Context`, `TypicalAgeRange`, `Difficulty`, `TypicalLearningTime`, `Description`, `Language`) VALUES
	('GLOREP2 Glorep2111 4', 'active', 'exercise', 'very low', 'very low', 'teacher', 'school', '', 'very easy', '', '', 'en'),
	('GLOREP2 Glorep2111 5', 'active', 'exercise', 'very low', 'very low', 'teacher', 'school', '', 'very easy', '', '', 'en');
/*!40000 ALTER TABLE `lo_educational` ENABLE KEYS */;

-- Dump della struttura di tabella glorep2_shared.lo_federation
CREATE TABLE IF NOT EXISTS `lo_federation` (
  `ServerName` varchar(20) NOT NULL,
  `ServerAddress` varchar(250) NOT NULL,
  `Login` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Active` tinyint(1) NOT NULL,
  `N_Lo` int(11) NOT NULL,
  `TimeUpd` int(11) NOT NULL,
  PRIMARY KEY (`ServerName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella glorep2_shared.lo_federation: ~2 rows (circa)
/*!40000 ALTER TABLE `lo_federation` DISABLE KEYS */;
INSERT INTO `lo_federation` (`ServerName`, `ServerAddress`, `Login`, `Password`, `Active`, `N_Lo`, `TimeUpd`) VALUES
	('Glorep2111', 'http://glorep.unipg.it/', 'GlorepF', 'wmac', 1, 0, 1463475482),
	('Glorep2121', 'http://glorep.unige.it/', 'GlorepF', 'wmac', 1, 0, 0);
/*!40000 ALTER TABLE `lo_federation` ENABLE KEYS */;

-- Dump della struttura di tabella glorep2_shared.lo_file
CREATE TABLE IF NOT EXISTS `lo_file` (
  `Id_Fd` varchar(255) NOT NULL,
  `File` varchar(1000) NOT NULL,
  `TimeUpd` int(11) NOT NULL,
  PRIMARY KEY (`Id_Fd`),
  CONSTRAINT `FK_lo_file_lo_general` FOREIGN KEY (`Id_Fd`) REFERENCES `lo_general` (`Id_Fd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella glorep2_shared.lo_file: ~0 rows (circa)
/*!40000 ALTER TABLE `lo_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `lo_file` ENABLE KEYS */;

-- Dump della struttura di tabella glorep2_shared.lo_general
CREATE TABLE IF NOT EXISTS `lo_general` (
  `Id_Fd` varchar(255) NOT NULL,
  `Title` varchar(1000) DEFAULT NULL,
  `Language` varchar(100) DEFAULT NULL,
  `Description` varchar(2000) DEFAULT NULL,
  `Keyword` varchar(1000) DEFAULT NULL,
  `Coverage` varchar(1000) DEFAULT NULL,
  `Structure` varchar(1000) DEFAULT NULL,
  `Aggregation_Level` tinyint(4) DEFAULT NULL,
  `Deleted` varchar(5) NOT NULL DEFAULT 'no',
  `TimeUpd` int(11) DEFAULT '0',
  PRIMARY KEY (`Id_Fd`),
  KEY `Id_Fd` (`Id_Fd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella glorep2_shared.lo_general: ~2 rows (circa)
/*!40000 ALTER TABLE `lo_general` DISABLE KEYS */;
INSERT INTO `lo_general` (`Id_Fd`, `Title`, `Language`, `Description`, `Keyword`, `Coverage`, `Structure`, `Aggregation_Level`, `Deleted`, `TimeUpd`) VALUES
	('GLOREP2 Glorep2111 4', 'molecular', 'en', 'molecular de', 'molecular', '', '1', 1, 'no', 1463475107),
	('GLOREP2 Glorep2111 5', 'kinetics', 'en', 'kinetics', '', '', '1', 1, 'no', 1463475482);
/*!40000 ALTER TABLE `lo_general` ENABLE KEYS */;

-- Dump della struttura di tabella glorep2_shared.lo_identifier
CREATE TABLE IF NOT EXISTS `lo_identifier` (
  `Id_Identifier` int(11) NOT NULL,
  `Id_Fd` varchar(255) NOT NULL,
  `Catalog` varchar(1000) NOT NULL,
  `Entry` varchar(1000) NOT NULL,
  `TimeUpd` int(11) NOT NULL,
  PRIMARY KEY (`Id_Identifier`,`Id_Fd`),
  KEY `Id_Fd` (`Id_Fd`),
  KEY `Id_Identifier` (`Id_Identifier`),
  CONSTRAINT `FK_lo_identifier_lo_general` FOREIGN KEY (`Id_Fd`) REFERENCES `lo_general` (`Id_Fd`),
  CONSTRAINT `FK_lo_identifier_lo_relation` FOREIGN KEY (`Id_Identifier`) REFERENCES `lo_relation` (`Id_Target`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella glorep2_shared.lo_identifier: ~0 rows (circa)
/*!40000 ALTER TABLE `lo_identifier` DISABLE KEYS */;
/*!40000 ALTER TABLE `lo_identifier` ENABLE KEYS */;

-- Dump della struttura di tabella glorep2_shared.lo_lifecycle
CREATE TABLE IF NOT EXISTS `lo_lifecycle` (
  `Id_Fd` varchar(255) NOT NULL,
  `Version` int(11) NOT NULL,
  `Status` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_Fd`),
  KEY `Id_Fd` (`Id_Fd`),
  CONSTRAINT `FK_lo_lifecycle_lo_metadata` FOREIGN KEY (`Id_Fd`) REFERENCES `lo_metadata` (`Id_Fd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella glorep2_shared.lo_lifecycle: ~2 rows (circa)
/*!40000 ALTER TABLE `lo_lifecycle` DISABLE KEYS */;
INSERT INTO `lo_lifecycle` (`Id_Fd`, `Version`, `Status`) VALUES
	('GLOREP2 Glorep2111 4', 2, 'draft'),
	('GLOREP2 Glorep2111 5', 1, 'draft');
/*!40000 ALTER TABLE `lo_lifecycle` ENABLE KEYS */;

-- Dump della struttura di tabella glorep2_shared.lo_metadata
CREATE TABLE IF NOT EXISTS `lo_metadata` (
  `Id_Fd` varchar(255) NOT NULL,
  `MetadataSchema` varchar(30) NOT NULL DEFAULT 'LOM v1.0',
  `Language` varchar(100) NOT NULL DEFAULT 'En',
  PRIMARY KEY (`Id_Fd`),
  CONSTRAINT `FK_lo_metadata_lo_general` FOREIGN KEY (`Id_Fd`) REFERENCES `lo_general` (`Id_Fd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella glorep2_shared.lo_metadata: ~2 rows (circa)
/*!40000 ALTER TABLE `lo_metadata` DISABLE KEYS */;
INSERT INTO `lo_metadata` (`Id_Fd`, `MetadataSchema`, `Language`) VALUES
	('GLOREP2 Glorep2111 4', 'LOMv1.0', 'en'),
	('GLOREP2 Glorep2111 5', 'LOMv1.0', 'en');
/*!40000 ALTER TABLE `lo_metadata` ENABLE KEYS */;

-- Dump della struttura di tabella glorep2_shared.lo_orcomposite
CREATE TABLE IF NOT EXISTS `lo_orcomposite` (
  `Id_Composite` int(11) NOT NULL,
  `Type` varchar(1000) NOT NULL,
  `Name` varchar(1000) NOT NULL,
  `MinimumVersion` varchar(30) NOT NULL,
  `MaximumVersion` varchar(30) NOT NULL,
  PRIMARY KEY (`Id_Composite`),
  CONSTRAINT `FK_lo_orcomposite_lo_requirement` FOREIGN KEY (`Id_Composite`) REFERENCES `lo_requirement` (`Id_Composite`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella glorep2_shared.lo_orcomposite: ~0 rows (circa)
/*!40000 ALTER TABLE `lo_orcomposite` DISABLE KEYS */;
/*!40000 ALTER TABLE `lo_orcomposite` ENABLE KEYS */;

-- Dump della struttura di tabella glorep2_shared.lo_relation
CREATE TABLE IF NOT EXISTS `lo_relation` (
  `Id_Fd` varchar(255) NOT NULL,
  `Kind` varchar(200) NOT NULL,
  `Id_Target` int(11) NOT NULL,
  `TimeUpd` int(11) NOT NULL,
  PRIMARY KEY (`Id_Fd`),
  KEY `Id_Fd` (`Id_Fd`),
  KEY `Id_Target` (`Id_Target`),
  CONSTRAINT `FK_lo_relation_lo_annotation` FOREIGN KEY (`Id_Target`) REFERENCES `lo_annotation` (`Id_Identifier`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_lo_relation_lo_general` FOREIGN KEY (`Id_Fd`) REFERENCES `lo_general` (`Id_Fd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella glorep2_shared.lo_relation: ~0 rows (circa)
/*!40000 ALTER TABLE `lo_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `lo_relation` ENABLE KEYS */;

-- Dump della struttura di tabella glorep2_shared.lo_requirement
CREATE TABLE IF NOT EXISTS `lo_requirement` (
  `Id_Fd` varchar(255) NOT NULL,
  `Id_Composite` int(11) NOT NULL,
  PRIMARY KEY (`Id_Fd`,`Id_Composite`),
  UNIQUE KEY `Id_Lo_2` (`Id_Fd`,`Id_Composite`),
  KEY `Id_Lo_3` (`Id_Fd`,`Id_Composite`),
  KEY `Id_Composite` (`Id_Composite`),
  KEY `Id_Fd` (`Id_Fd`),
  CONSTRAINT `lo_requirement_ibfk_1` FOREIGN KEY (`Id_Fd`) REFERENCES `lo_technical` (`Id_Fd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella glorep2_shared.lo_requirement: ~0 rows (circa)
/*!40000 ALTER TABLE `lo_requirement` DISABLE KEYS */;
/*!40000 ALTER TABLE `lo_requirement` ENABLE KEYS */;

-- Dump della struttura di tabella glorep2_shared.lo_rights
CREATE TABLE IF NOT EXISTS `lo_rights` (
  `Id_Fd` varchar(255) NOT NULL,
  `Cost` varchar(5) NOT NULL,
  `Copyright` varchar(5) NOT NULL,
  `Description` varchar(1000) NOT NULL,
  PRIMARY KEY (`Id_Fd`),
  KEY `Id_Fd` (`Id_Fd`),
  CONSTRAINT `FK_lo_rights_lo_general` FOREIGN KEY (`Id_Fd`) REFERENCES `lo_general` (`Id_Fd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella glorep2_shared.lo_rights: ~2 rows (circa)
/*!40000 ALTER TABLE `lo_rights` DISABLE KEYS */;
INSERT INTO `lo_rights` (`Id_Fd`, `Cost`, `Copyright`, `Description`) VALUES
	('GLOREP2 Glorep2111 4', 'no', 'no', ''),
	('GLOREP2 Glorep2111 5', 'no', 'no', '');
/*!40000 ALTER TABLE `lo_rights` ENABLE KEYS */;

-- Dump della struttura di tabella glorep2_shared.lo_technical
CREATE TABLE IF NOT EXISTS `lo_technical` (
  `Id_Fd` varchar(255) NOT NULL,
  `Format` varchar(500) NOT NULL,
  `Size` varchar(30) NOT NULL,
  `Location` varchar(1000) NOT NULL,
  `InstallationRemarks` varchar(1000) NOT NULL,
  `OtherPlatformRequirements` varchar(1000) NOT NULL,
  `Duration` varchar(50) NOT NULL,
  `TimeUpd` int(11) NOT NULL,
  PRIMARY KEY (`Id_Fd`),
  KEY `Id_Fd` (`Id_Fd`),
  CONSTRAINT `FK_lo_technical_lo_file` FOREIGN KEY (`Id_Fd`) REFERENCES `lo_file` (`Id_Fd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella glorep2_shared.lo_technical: ~0 rows (circa)
/*!40000 ALTER TABLE `lo_technical` DISABLE KEYS */;
/*!40000 ALTER TABLE `lo_technical` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
