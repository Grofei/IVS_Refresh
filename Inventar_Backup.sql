-- MySQL dump 10.13  Distrib 5.7.26, for Win64 (x86_64)
--
-- Host: localhost    Database: Inventar
-- ------------------------------------------------------
-- Server version	5.7.26

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
-- Table structure for table `t_computer`
--

DROP TABLE IF EXISTS `t_computer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_computer` (
  `CID` int(11) NOT NULL AUTO_INCREMENT,
  `Hostname` varchar(50) DEFAULT NULL,
  `Model` varchar(50) DEFAULT NULL,
  `SN` varchar(50) DEFAULT NULL,
  `OS` varchar(50) DEFAULT NULL,
  `InstallDate` date DEFAULT NULL,
  `RAM` double DEFAULT NULL,
  `MAC` varchar(50) DEFAULT NULL,
  `CPU` varchar(50) DEFAULT NULL,
  `GPU` varchar(50) DEFAULT NULL,
  `Storage` double DEFAULT NULL,
  `DiskCount` int(11) DEFAULT NULL,
  `Delivery` date DEFAULT NULL,
  `Supplier` varchar(30) DEFAULT NULL,
  `EndWarranty` date DEFAULT NULL,
  `LastConnect` date DEFAULT NULL,
  PRIMARY KEY (`CID`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_computer`
--

LOCK TABLES `t_computer` WRITE;
/*!40000 ALTER TABLE `t_computer` DISABLE KEYS */;
INSERT INTO `t_computer` VALUES (1,'BRO-PC-W045','HP ProDesk 400 G3 MT','CZC54916K5','Microsoft Windows 10 Enterprise','2019-02-13',3.9,'34-64-A9-32-75-7F','Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz','Intel(R) HD Graphics 530',465.29,1,NULL,NULL,NULL,'2019-08-29'),(2,'BRO-PC-W015','OptiPlex 3050','8W6PKQ2','Microsoft Windows 10 Enterprise','2018-12-19',7.89,'8C-EC-4B-72-8B-14','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',703.76,2,NULL,NULL,NULL,'2019-08-30'),(3,'BRO-PC-W061','HP ProDesk 400 G3 MT','CZC54916KK','Microsoft Windows 10 Enterprise','2019-03-07',3.9,'34-64-A9-32-75-86','Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz','Intel(R) HD Graphics 530',465.29,1,NULL,NULL,NULL,'2019-08-30'),(4,'BRO-PC-W016','OptiPlex 3050','8WGYKQ2','Microsoft Windows 10 Enterprise','2018-12-19',7.89,'8C-EC-4B-74-15-53','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-30'),(5,'BRO-PC-W017','OptiPlex 3050','8WGQKQ2','Microsoft Windows 10 Enterprise','2018-12-19',7.89,'8C-EC-4B-74-15-5A','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-30'),(6,'BRO-PC-W018','OptiPlex 3050','8W0YKQ2','Microsoft Windows 10 Enterprise','2018-12-19',7.89,'8C-EC-4B-74-16-35','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-30'),(7,'BRO-PC-W020','OptiPlex 3050','8TSTKQ2','Microsoft Windows 10 Enterprise','2018-12-19',7.89,'8C-EC-4B-74-5D-3C','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-29'),(8,'BRO-PC-W073','ESPRIMO Q510','YLJK021743','Microsoft Windows 10 Enterprise','2019-04-03',3.92,'00-19-99-F8-6C-6E','Intel(R) Core(TM) i3-3220T CPU @ 2.80GHz','Intel(R) HD Graphics',465.29,1,NULL,NULL,NULL,'2019-08-30'),(9,'BRO-PC-W036','OptiPlex 3050','8V1YKQ2','Microsoft Windows 10 Enterprise','2019-01-03',7.89,'8C-EC-4B-74-5D-CA','Intel(R) Core(TM) i3-3220T CPU @ 2.80GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-30'),(10,'BRO-PC-W082','HP ProDesk 400 G3 MT','CZC54916JR','Microsoft Windows 10 Enterprise','2019-05-06',3.9,'34-64-A9-32-6D-73','Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz','Intel(R) HD Graphics 530',465.29,1,NULL,NULL,NULL,'2019-08-30'),(11,'BRO-PC-W037','OptiPlex 3050','8VBXKQ2','Microsoft Windows 10 Enterprise','2019-01-03',7.89,'8C-EC-4B-74-15-7B','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-29'),(12,'BRO-PC-W039','OptiPlex 3050','8VYNKQ2','Microsoft Windows 10 Enterprise','2019-01-03',7.89,'8C-EC-4B-72-8B-04','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-29'),(13,'BRO-PC-W040','OptiPlex 3050','8W5WKQ2','Microsoft Windows 10 Enterprise','2019-01-03',7.89,'8C-EC-4B-72-BB-6F','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-30'),(14,'BRO-PC-W041','OptiPlex 3050','8WFXKQ2','Microsoft Windows 10 Enterprise','2019-01-03',7.89,'8C-EC-4B-74-CB-0B','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-30'),(15,'BRO-PC-W042','OptiPlex 3050','8WBWKQ2','Microsoft Windows 10 Enterprise','2019-01-03',7.89,'8C-EC-4B-74-15-61','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-30'),(16,'BRO-PC-W077','HP Compaq Pro 6300 MT','CZC4104RJ0','Microsoft Windows 10 Enterprise','2019-04-11',3.88,'A0-48-1C-85-12-FF','Intel(R) Core(TM) i3-3240 CPU @ 3.40GHz','Intel(R) HD Graphics',465.29,1,NULL,NULL,NULL,'2019-08-30'),(17,'BRO-PC-W054','HP ProDesk 400 G3 MT','CZC54916KF','Microsoft Windows 10 Enterprise','2019-02-14',3.9,'34-64-A9-32-74-AC','Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz','Intel(R) HD Graphics 530',465.29,1,NULL,NULL,NULL,'2019-08-30'),(18,'BRO-PC-W058','HP 280 G2 MT (Non-Legacy) ','CZC647B6QW','Microsoft Windows 10 Enterprise','2019-02-27',11.87,'70-5A-0F-36-29-E4','Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz','Intel(R) HD Graphics 530',465.76,1,NULL,NULL,NULL,'2019-08-30'),(19,'BRO-PC-W066','HP ProDesk 490 G1 MT','CZC4242LHN','Microsoft Windows 10 Enterprise','2019-03-15',3.92,'A0-D3-C1-40-EC-8A','Intel(R) Core(TM) i5-4570 CPU @ 3.20GHz','Intel(R) HD Graphics 4600',465.29,1,NULL,NULL,NULL,'2019-08-30'),(20,'BRO-PC-W067','HP ProDesk 400 G3 MT','CZC623CDTT','Microsoft Windows 10 Enterprise','2019-03-18',3.9,'DC-4A-3E-43-18-EB','Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz','Intel(R) HD Graphics 530',465.29,1,NULL,NULL,NULL,'2019-08-30'),(21,'BRO-PC-W055','HP ProDesk 400 G3 MT','CZC54916K6','Microsoft Windows 10 Enterprise','2019-02-20',3.87,'34-64-A9-32-6D-F1','Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz','Intel(R) HD Graphics 530',465.29,1,NULL,NULL,NULL,'2019-08-30'),(22,'BRO-PC-W068','HP ProDesk 400 G3 MT','CZC623CDST','Microsoft Windows 10 Enterprise','2019-03-27',3.9,'DC-4A-3E-43-19-0F','Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz','Intel(R) HD Graphics 530',465.29,1,NULL,NULL,NULL,'2019-08-30'),(23,'BRO-PC-W057','HP ProDesk 400 G3 MT','CZC623CDWH','Microsoft Windows 10 Enterprise','2019-03-12',3.9,'DC-4A-3E-43-19-8D','Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz','Intel(R) HD Graphics 530',465.29,1,NULL,NULL,NULL,'2019-08-23'),(24,'BRO-PC-W080','HP ProDesk 490 G1 MT','CZC4242LHZ','Microsoft Windows 10 Enterprise','2019-04-30',3.92,'A0-D3-C1-40-EC-63','Intel(R) Core(TM) i5-4570 CPU @ 3.20GHz','Intel(R) HD Graphics 4600',465.29,1,NULL,NULL,NULL,'2019-08-13'),(25,'BRO-PC-W079','HP Z620 Workstation','CZC4522GL3','Microsoft Windows 10 Enterprise','2019-04-15',15.93,'64-51-06-44-F6-85','Intel(R) Xeon(R) CPU E5-1620 v2 @ 3.70GHz','NVIDIA Quadro K2000',931.04,1,NULL,NULL,NULL,'2019-08-29'),(26,'BRO-PC-W049','HP 280 G2 MT (Non-Legacy) ','CZC647B6Q5','Microsoft Windows 10 Enterprise','2019-02-26',11.86,'70-5A-0F-3E-CA-C4','Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz','Intel(R) HD Graphics 530',465.29,1,NULL,NULL,NULL,'2019-08-23'),(27,'BRO-PC-W083','HP ProDesk 400 G3 MT','CZC54916JC','Microsoft Windows 10 Enterprise','2019-05-09',3.9,'34-64-A9-32-75-5E','Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz','Intel(R) HD Graphics 530',465.29,1,NULL,NULL,NULL,'2019-08-30'),(28,'BRO-PC-W059','HP ProDesk 490 G2 MT','CZC5010TR7','Microsoft Windows 10 Enterprise','2019-03-19',3.92,'A0-D3-C1-4F-12-10','Intel(R) Core(TM) i5-4590 CPU @ 3.30GHz','Intel(R) HD Graphics 4600',118.77,1,NULL,NULL,NULL,'2019-08-30'),(29,'BRO-PC-W052','HP 280 G2 MT (Non-Legacy) ','CZC647B6GH','Microsoft Windows 10 Enterprise','2019-02-15',11.86,'70-5A-0F-35-FB-E6','Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz','Intel(R) HD Graphics 530',465.29,1,NULL,NULL,NULL,'2019-08-30'),(30,'BRO-PC-W026','OptiPlex 3050','8W7WKQ2','Microsoft Windows 10 Enterprise','2019-01-02',7.89,'8C-EC-4B-72-8A-E7','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-23'),(31,'BRO-PC-W028','OptiPlex 3050','8TRVKQ2','Microsoft Windows 10 Enterprise','2019-01-02',7.89,'8C-EC-4B-74-5D-57','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-30'),(32,'BRO-PC-W029','OptiPlex 3050','8TVVKQ2','Microsoft Windows 10 Enterprise','2019-01-02',7.89,'8C-EC-4B-74-5D-C6','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-30'),(33,'BRO-PC-W030','OptiPlex 3050','8V3RKQ2','Microsoft Windows 10 Enterprise','2019-03-12',7.89,'8C-EC-4B-74-5C-DF','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-30'),(34,'BRO-PC-W043','HP ProDesk 490 G1 MT','CZC4242LGP','Microsoft Windows 10 Enterprise','2019-03-20',7.92,'A0-D3-C1-40-EC-68','Intel(R) Core(TM) i5-4570 CPU @ 3.20GHz','Intel(R) HD Graphics 4600',465.29,1,NULL,NULL,NULL,'2019-08-30'),(35,'BRO-PC-W085','HP Elite 7500 Series MT ','CZC3315Y3B','Microsoft Windows 10 Enterprise','2019-06-28',3.87,'70-54-D2-E4-62-77','Intel(R) Core(TM) i5-3470 CPU @ 3.20GHz','Intel(R) HD Graphics',931.04,1,NULL,NULL,NULL,'2019-08-30'),(36,'BRO-PC-W003','OptiPlex 3050','8WCWKQ2','Microsoft Windows 10 Enterprise','2019-07-04',7.89,'8C-EC-4B-72-8A-E8','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-30'),(37,'BRO-PC-W069','HP ProDesk 490 G2 MT','CZC5010TQN','Microsoft Windows 10 Enterprise','2019-03-28',3.92,'A0-D3-C1-4F-12-56','Intel(R) Core(TM) i5-4590 CPU @ 3.30GHz','Intel(R) HD Graphics 4600',118.77,1,NULL,NULL,NULL,'2019-08-30'),(38,'BRO-PC-W044','HP 280 G2 MT (Non-Legacy) ','CZC647B6LC','Microsoft Windows 10 Enterprise','2019-02-21',11.86,'70-5A-0F-35-FB-E7','Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz','Intel(R) HD Graphics 530',465.29,1,NULL,NULL,NULL,'2019-08-30'),(39,'BRO-PC-W072','HP 280 G2 MT (Non-Legacy) ','CZC647B6R2','Microsoft Windows 10 Enterprise','2019-04-02',11.86,'70-5A-0F-3D-D9-BB','Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz','Intel(R) HD Graphics 530',465.29,1,NULL,NULL,NULL,'2019-08-30'),(40,'BRO-PC-W050','HP 280 G2 MT (Non-Legacy) ','CZC647B6R9','Microsoft Windows 10 Enterprise','2019-02-14',11.86,'70-5A-0F-36-2B-C2','Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz','NVIDIA GeForce GTX 750',1396.75,2,NULL,NULL,NULL,'2019-08-30'),(41,'BRO-PC-W051','HP 280 G2 MT (Non-Legacy) ','CZC647B6M1','Microsoft Windows 10 Enterprise','2019-02-13',11.86,'70-5A-0F-3B-6D-51','Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz','Intel(R) HD Graphics 530',465.29,1,NULL,NULL,NULL,'2019-08-26'),(42,'BRO-PC-W047','HP ProDesk 490 G2 MT','CZC5010TR4','Microsoft Windows 10 Enterprise','2019-02-15',3.92,'A0-D3-C1-4F-11-B7','Intel(R) Core(TM) i5-4590 CPU @ 3.30GHz','Intel(R) HD Graphics 4600',118.77,1,NULL,NULL,NULL,'2019-08-30'),(43,'BRO-PC-W074','HP ProDesk 490 G1 MT','CZC4242L90','Microsoft Windows 10 Enterprise','2019-04-08',3.92,'A0-D3-C1-42-72-22','Intel(R) Core(TM) i5-4570 CPU @ 3.20GHz','Intel(R) HD Graphics 4600',465.29,1,NULL,NULL,NULL,'2019-08-30'),(44,'BRO-PC-W065','HP 280 G2 MT (Non-Legacy) ','CZC647B6R6','Microsoft Windows 10 Enterprise','2019-03-15',11.86,'70-5A-0F-3D-D7-5E','Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz','Intel(R) HD Graphics 530',465.29,1,NULL,NULL,NULL,'2019-08-29'),(45,'BRO-PC-W056','HP ProDesk 400 G3 MT','CZC54916KJ','Microsoft Windows 10 Enterprise','2019-05-27',3.9,'34-64-A9-32-6D-BF','Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz','Intel(R) HD Graphics 530',465.29,1,NULL,NULL,NULL,'2019-08-29'),(46,'BRO-PC-W024','OptiPlex 3050','8W8RKQ2','Microsoft Windows 10 Enterprise','2018-12-19',7.89,'8C-EC-4B-74-16-36','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-23'),(47,'BRO-PC-W084','HP ProDesk 490 G2 MT','CZC5010TRD','Microsoft Windows 10 Enterprise','2019-05-14',3.92,'A0-D3-C1-4F-78-95','Intel(R) Core(TM) i5-4590 CPU @ 3.30GHz','Intel(R) HD Graphics 4600',118.77,1,NULL,NULL,NULL,'2019-08-30'),(48,'BRO-PC-W022','OptiPlex 3050','8VLYKQ2','Microsoft Windows 10 Enterprise','2018-12-19',7.89,'8C-EC-4B-74-17-26','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-30'),(49,'BRO-PC-W010','OptiPlex 3050','8VHRKQ2','Microsoft Windows 10 Enterprise','2018-12-12',7.89,'8C-EC-4B-72-C0-CF','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-30'),(50,'BRO-PC-W012','OptiPlex 3050','8W9WKQ2','Microsoft Windows 10 Enterprise','2018-12-12',7.89,'8C-EC-4B-72-8A-FC','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-30'),(51,'BRO-PC-W013','OptiPlex 3050','GGCT4W2','Microsoft Windows 10 Enterprise','2019-05-07',7.89,'8C-EC-4B-9F-71-9A','Intel(R) Core(TM) i3-6100 CPU @ 3.70GHz','Intel(R) HD Graphics 530',238.01,1,NULL,NULL,NULL,'2019-08-30'),(52,'BRO-PC-W053','HP ProDesk 400 G3 MT','CZC623CDXF','Microsoft Windows 10 Enterprise','2019-02-15',7.9,'DC-4A-3E-43-19-ED','Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz','Intel(R) HD Graphics 530',465.29,1,NULL,NULL,NULL,'2019-08-30'),(53,'BRO-PC-W046','HP ProDesk 400 G3 MT','CZC54825YN','Microsoft Windows 10 Enterprise','2019-06-28',3.9,'34-64-A9-32-70-55','Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz','Intel(R) HD Graphics 530',465.29,1,NULL,NULL,NULL,'2019-08-30'),(54,'BRO-PC-W070','HP ProDesk 490 G1 MT','CZC4241KL2','Microsoft Windows 10 Enterprise','2019-06-03',3.92,'A0-D3-C1-42-6E-8B','Intel(R) Core(TM) i5-4570 CPU @ 3.20GHz','Intel(R) HD Graphics 4600',465.29,1,NULL,NULL,NULL,'2019-08-19'),(55,'BRO-PC-W001','OptiPlex 3050','8WFQKQ2','Microsoft Windows 10 Enterprise','2019-01-21',7.89,'8C-EC-4B-74-16-74','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-29'),(56,'BRO-PC-W014','OptiPlex 3050','8VZWKQ2','Microsoft Windows 10 Enterprise','2018-12-18',7.87,'8C-EC-4B-51-1D-91','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-30'),(57,'BRO-PC-W032','OptiPlex 3050','8W0SKQ2','Microsoft Windows 10 Enterprise','2019-01-28',7.89,'8C-EC-4B-72-8A-FE','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-30'),(58,'BRO-PC-W033','OptiPlex 3050','8TNVKQ2','Microsoft Windows 10 Enterprise','2019-01-02',7.89,'8C-EC-4B-74-5D-F1','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-30'),(59,'BRO-PC-W034','OptiPlex 3050','8W3TKQ2','Microsoft Windows 10 Enterprise','2019-01-02',7.89,'8C-EC-4B-74-14-3A','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-30'),(60,'BRO-PC-W035','OptiPlex 3050','8V7VKQ2','Microsoft Windows 10 Enterprise','2019-03-20',7.89,'8C-EC-4B-74-5B-9C','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-30'),(61,'BRO-PC-W004','OptiPlex 3050','8WGWKQ2','Microsoft Windows 10 Enterprise','2019-02-04',7.89,'8C-EC-4B-72-8D-1B','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-30'),(62,'BRO-PC-W075','HP ProDesk 490 G1 MT','CZC4241KPK','Microsoft Windows 10 Enterprise','2019-04-09',3.92,'A0-D3-C1-40-EF-44','Intel(R) Core(TM) i5-4570 CPU @ 3.20GHz','Intel(R) HD Graphics 4600',465.29,1,NULL,NULL,NULL,'2019-08-19'),(63,'BRO-PC-W063','HP ProDesk 490 G1 MT','CZC4242LHJ','Microsoft Windows 10 Enterprise','2019-03-12',3.92,'A0-D3-C1-42-72-CB','Intel(R) Core(TM) i5-4570 CPU @ 3.20GHz','Intel(R) HD Graphics 4600',465.29,2,NULL,NULL,NULL,'2019-08-30'),(64,'BRO-PC-W005','OptiPlex 3050','8VQSKQ2','Microsoft Windows 10 Enterprise','2019-02-07',7.89,'8C-EC-4B-72-C0-FC','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-29'),(65,'BRO-PC-W007','OptiPlex 3050','8W2RKQ2','Microsoft Windows 10 Enterprise','2018-12-11',7.89,'8C-EC-4B-72-8A-EF','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-30'),(66,'BRO-PC-W011','OptiPlex 3050','8VXPKQ2','Microsoft Windows 10 Enterprise','2018-12-12',7.89,'8C-EC-4B-72-8A-FD','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,4,NULL,NULL,NULL,'2019-08-30'),(67,'BRO-PC-W019','OptiPlex 3050','8WDVKQ2','Microsoft Windows 10 Enterprise','2018-12-19',7.89,'8C-EC-4B-72-8A-DF','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',1169.52,2,NULL,NULL,NULL,'2019-08-30'),(68,'BRO-PC-W038','OptiPlex 3050','8V9XKQ2','Microsoft Windows 10 Enterprise','2019-01-03',7.89,'8C-EC-4B-74-14-37','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-23'),(69,'BRO-PC-W027','OptiPlex 3050','8VHQKQ2','Microsoft Windows 10 Enterprise','2019-01-02',7.89,'8C-EC-4B-74-15-7F','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-30'),(70,'BRO-PC-W023','OptiPlex 3050','8VFVKQ2','Microsoft Windows 10 Enterprise','2019-01-30',7.89,'8C-EC-4B-74-5B-B4','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-30'),(71,'BRO-PC-W081','HP Z620 Workstation','CZC4522G10','Microsoft Windows 10 Enterprise','2019-05-02',7.93,'64-51-06-44-F6-3D','Intel(R) Xeon(R) CPU E5-1620 v2 @ 3.70GHz','NVIDIA Quadro K2000',931.04,1,NULL,NULL,NULL,'2019-08-30'),(72,'BRO-PC-W076','HP Z440 Workstation','CZC6517KZY','Microsoft Windows 10 Enterprise','2019-04-09',15.92,'70-5A-0F-49-CE-AC','Intel(R) Xeon(R) CPU E5-1620 v4 @ 3.50GHz','NVIDIA Quadro K620',1981.67,2,NULL,NULL,NULL,'2019-08-29'),(73,'BRO-PC-W048','HP 280 G2 MT (Non-Legacy) ','CZC647B6JX','Microsoft Windows 10 Enterprise','2019-02-13',11.86,'70-5A-0F-36-2A-05','Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz','Intel(R) HD Graphics 530',465.29,1,NULL,NULL,NULL,'2019-08-30'),(74,'BRO-PC-W060','HP 280 G2 MT (Non-Legacy) ','CZC647B6QX','Microsoft Windows 10 Enterprise','2019-03-04',11.86,'70-5A-0F-3D-DA-94','Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz','Intel(R) HD Graphics 530',465.29,1,NULL,NULL,NULL,'2019-08-30'),(75,'BRO-PC-W062','HP ProDesk 490 G1 MT','CZC4242LHQ','Microsoft Windows 10 Enterprise','2019-03-12',3.92,'A0-D3-C1-40-EC-65','Intel(R) Core(TM) i5-4570 CPU @ 3.20GHz','Intel(R) HD Graphics 4600',465.29,1,NULL,NULL,NULL,'2019-08-29'),(76,'BRO-PC-W025','OptiPlex 3050','8VRTKQ2','Microsoft Windows 10 Enterprise','2018-12-19',7.89,'8C-EC-4B-74-15-B3','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-30'),(77,'BRO-PC-W064','HP ProDesk 400 G3 MT','CZC54916HV','Microsoft Windows 10 Enterprise','2019-03-13',3.9,'34-64-A9-30-98-D1','Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz','Intel(R) HD Graphics 530',465.29,1,NULL,NULL,NULL,'2019-08-30'),(78,'BRO-PC-W031','OptiPlex 3050','8WDWKQ2','Microsoft Windows 10 Enterprise','2019-01-02',7.89,'8C-EC-4B-74-15-72','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-30'),(79,'BRO-PC-W006','OptiPlex 3050','8V8VKQ2','Microsoft Windows 10 Enterprise','2018-12-11',7.89,'8C-EC-4B-72-C1-39','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-30'),(80,'BRO-PC-W071','HP ProDesk 490 G2 MT','CZC5010TR2','Microsoft Windows 10 Enterprise','2019-04-01',3.95,'A0-D3-C1-4F-11-EA','Intel(R) Core(TM) i5-4590 CPU @ 3.30GHz','NVIDIA Quadro FX 1700',118.77,1,NULL,NULL,NULL,'2019-08-29'),(81,'BRO-PC-W008','OptiPlex 3050','8VMXKQ2','Microsoft Windows 10 Enterprise','2018-12-11',7.89,'8C-EC-4B-72-BE-C9','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-30'),(82,'BRO-PC-W002','OptiPlex 3050','8TMQKQ2','Microsoft Windows 10 Enterprise','2019-01-08',7.89,'8C-EC-4B-74-5D-39','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-30'),(83,'BRO-PC-W021','OptiPlex 3050','8W1RKQ2','Microsoft Windows 10 Enterprise','2018-12-19',7.89,'8C-EC-4B-72-8D-13','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',536.02,2,NULL,NULL,NULL,'2019-08-30'),(84,'BRO-PC-W009','OptiPlex 3050','8WCRKQ2','Microsoft Windows 10 Enterprise','2018-12-12',7.89,'8C-EC-4B-72-8A-D4','Intel(R) Core(TM) i3-7100 CPU @ 3.90GHz','Intel(R) HD Graphics 630',238.01,1,NULL,NULL,NULL,'2019-08-30');
/*!40000 ALTER TABLE `t_computer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_department`
--

DROP TABLE IF EXISTS `t_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_department` (
  `DID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`DID`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_department`
--

LOCK TABLES `t_department` WRITE;
/*!40000 ALTER TABLE `t_department` DISABLE KEYS */;
INSERT INTO `t_department` VALUES (1,'V'),(2,'T'),(3,'R'),(4,'S1'),(5,'S2'),(6,'P'),(7,'K'),(8,'L'),(9,'L1'),(10,'L2'),(11,'L3'),(12,'L4'),(13,'E/M'),(14,'IuK');
/*!40000 ALTER TABLE `t_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_mobiledevice`
--

DROP TABLE IF EXISTS `t_mobiledevice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_mobiledevice` (
  `MDID` int(11) NOT NULL AUTO_INCREMENT,
  `Hostname` varchar(50) DEFAULT NULL,
  `Model` varchar(50) DEFAULT NULL,
  `OSVersion` varchar(50) DEFAULT NULL,
  `MAC` varchar(50) DEFAULT NULL,
  `LastConnect` date DEFAULT NULL,
  PRIMARY KEY (`MDID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_mobiledevice`
--

LOCK TABLES `t_mobiledevice` WRITE;
/*!40000 ALTER TABLE `t_mobiledevice` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_mobiledevice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_monitor`
--

DROP TABLE IF EXISTS `t_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_monitor` (
  `MID` int(11) NOT NULL AUTO_INCREMENT,
  `Model` varchar(50) DEFAULT NULL,
  `Manufacturer` varchar(50) DEFAULT NULL,
  `SN` varchar(50) DEFAULT NULL,
  `YoM` year(4) DEFAULT NULL,
  `CID` int(11) DEFAULT NULL,
  `Delivery` date DEFAULT NULL,
  `Supplier` varchar(30) DEFAULT NULL,
  `EndWarranty` date DEFAULT NULL,
  `LastConnect` date DEFAULT NULL,
  PRIMARY KEY (`MID`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_monitor`
--

LOCK TABLES `t_monitor` WRITE;
/*!40000 ALTER TABLE `t_monitor` DISABLE KEYS */;
INSERT INTO `t_monitor` VALUES (1,'EA221WMe','NEC','19A39911NB',2011,1,NULL,NULL,NULL,'2019-08-05'),(2,'EA221WMe','NEC','15A31111NB',2011,1,NULL,NULL,NULL,'2019-08-05'),(3,'B22W-5','FUS','YV1Q009557',2009,3,NULL,NULL,NULL,'2019-08-05'),(4,'EA241WM','NEC','03007326NB',2010,4,NULL,NULL,NULL,'2019-08-05'),(5,'EA241WM','NEC','1Y050053NB',2011,5,NULL,NULL,NULL,'2019-08-05'),(6,'EA244WMi','NEC','44029618NB',2014,6,NULL,NULL,NULL,'2019-08-05'),(7,'EA244WMi','NEC','69203717NB',2016,6,NULL,NULL,NULL,'2019-08-05'),(8,'DELL 2405FPW','DEL','M675461C02US ',2006,7,NULL,NULL,NULL,'2019-08-05'),(9,'EA241WM','NEC','1Z050259NB',2011,8,NULL,NULL,NULL,'2019-08-05'),(10,'EA245WMi-2','NEC','85314550NB',2018,9,NULL,NULL,NULL,'2019-08-05'),(11,'DELL E248WFP','DEL','FY1317A909NS ',2007,10,NULL,NULL,NULL,'2019-08-05'),(12,'EA221WMe','NEC','0YA18052NB',2010,11,NULL,NULL,NULL,'2019-08-05'),(13,'EA241WM','NEC','1Y050057NB',2011,12,NULL,NULL,NULL,'2019-08-05'),(14,'EA221WMe','NEC','0YA18155NB',2010,13,NULL,NULL,NULL,'2019-08-05'),(15,'EA221WMe','NEC','11A23634NB',2011,14,NULL,NULL,NULL,'2019-08-05'),(16,'EA221WMe','NEC','0YA18141NB',2010,14,NULL,NULL,NULL,'2019-08-05'),(17,'EA244WMi','NEC','69203711NB',2016,15,NULL,NULL,NULL,'2019-08-05'),(18,'EA244WMi','NEC','69203713NB',2016,15,NULL,NULL,NULL,'2019-08-05'),(19,'EA241WM','NEC','15025613NB',2011,16,NULL,NULL,NULL,'2019-08-05'),(20,'EA221WMe','NEC','15A31112NB',2011,17,NULL,NULL,NULL,'2019-08-05'),(21,'DELL 2407WFP','DEL','CC30369606YS ',2006,18,NULL,NULL,NULL,'2019-08-05'),(22,'DELL 2001FP','DEL','P03595640K0L ',2005,19,NULL,NULL,NULL,'2019-08-05'),(23,'DELL 2407WFP','DEL','UY5456BN04VS ',2006,20,NULL,NULL,NULL,'2019-08-05'),(24,'EA241WM','NEC','97103885ZB',2009,21,NULL,NULL,NULL,'2019-08-05'),(25,'EA241WM','NEC','03007325NB',2010,22,NULL,NULL,NULL,'2019-08-05'),(26,'EA221WMe','NEC','97401820NB',2009,23,NULL,NULL,NULL,'2019-08-05'),(27,'X22W-1','FUS','YE3L025714',2007,24,NULL,NULL,NULL,'2019-08-05'),(28,'EA243WM','NEC','37031321NB',2013,25,NULL,NULL,NULL,'2019-08-05'),(29,'EA243WM','NEC','37031319NB',2013,25,NULL,NULL,NULL,'2019-08-13'),(30,'LSL 3220WS','FUS','YE9Q004418',2009,26,NULL,NULL,NULL,'2019-08-05'),(31,'EA221WMe','NEC','97401972NB',2009,27,NULL,NULL,NULL,'2019-08-05'),(32,'EA221WMe','NEC','0YA18151NB',2010,28,NULL,NULL,NULL,'2019-08-05'),(33,'EA241WM','NEC','97103879ZB',2009,29,NULL,NULL,NULL,'2019-08-05'),(34,'EA221WMe','NEC','99801288NB',2009,30,NULL,NULL,NULL,'2019-08-05'),(35,'EA221WMe','NEC','97401626NB',2009,30,NULL,NULL,NULL,'2019-08-05'),(36,'EA244WMi','NEC','6Z209681NB',2016,31,NULL,NULL,NULL,'2019-08-05'),(37,'EA221WM','NEC','02607206NB',2010,32,NULL,NULL,NULL,'2019-08-05'),(38,'EA241WM','NEC','16843009',2008,33,NULL,NULL,NULL,'2019-08-30'),(39,'DELL 2408WFP','DEL','G286H8777APS',2008,34,NULL,NULL,NULL,'2019-08-05'),(40,'EA245WMi-2','NEC','83203596NB',2018,36,NULL,NULL,NULL,'2019-08-05'),(41,'EA221WMe','NEC','0YA18045NB',2010,37,NULL,NULL,NULL,'2019-08-05'),(42,'EA244WMi','NEC','51065775NB',2015,38,NULL,NULL,NULL,'2019-08-05'),(43,'EA244WMi','NEC','7Z219304NB',2017,39,NULL,NULL,NULL,'2019-08-05'),(44,'EA221WMe','NEC','15A32366NB',2011,40,NULL,NULL,NULL,'2019-08-05'),(45,'EA221WMe','NEC','0YA18154NB',2010,40,NULL,NULL,NULL,'2019-08-05'),(46,'EA241WM','NEC','97103904ZB',2009,41,NULL,NULL,NULL,'2019-08-05'),(47,'EA221WMe','NEC','0YA18053NB',2010,42,NULL,NULL,NULL,'2019-08-05'),(48,'X22W-1','FUS','YE3L022577',2007,43,NULL,NULL,NULL,'2019-08-05'),(49,'EA221WM','NEC','02607224NB',2010,44,NULL,NULL,NULL,'2019-08-05'),(50,'EA244WMi','NEC','6Z209670NB',2016,45,NULL,NULL,NULL,'2019-08-05'),(51,'EA244WMi','NEC','81219907NB',2018,46,NULL,NULL,NULL,'2019-08-05'),(52,'EA221WMe','NEC','97402075NB',2009,46,NULL,NULL,NULL,'2019-08-05'),(53,'X22W-1','FUS','YE3L001729',2007,47,NULL,NULL,NULL,'2019-08-05'),(54,'EA221WMe','NEC','0YA18063NB',2010,48,NULL,NULL,NULL,'2019-08-05'),(55,'EA221WMe','NEC','11A23628NB',2011,49,NULL,NULL,NULL,'2019-08-05'),(56,'EA221WMe','NEC','9X802189NB',2009,50,NULL,NULL,NULL,'2019-08-05'),(57,'EA221WMe','NEC','24A62244NB',2012,50,NULL,NULL,NULL,'2019-08-05'),(58,'DELL 2408WFP','DEL','G286H8777AVS',2008,51,NULL,NULL,NULL,'2019-08-05'),(59,'L22W-7SD','FUS','YE5E027117',2007,52,NULL,NULL,NULL,'2019-08-05'),(60,'EA221WM','NEC','02607219NB',2010,53,NULL,NULL,NULL,'2019-08-05'),(61,'DELL E248WFP','DEL','FY1317A909KS ',2007,54,NULL,NULL,NULL,'2019-08-05'),(62,'EA244WMi','NEC','69203697NB',2016,55,NULL,NULL,NULL,'2019-08-05'),(63,'EA244WMi','NEC','44029747NB',2014,55,NULL,NULL,NULL,'2019-08-05'),(64,'EA261WM','NEC','96003910ZB',2009,56,NULL,NULL,NULL,'2019-08-05'),(65,'EA261WM','NEC','02005765ZB',2010,56,NULL,NULL,NULL,'2019-08-05'),(66,'EA221WMe','NEC','0YA18061NB',2010,57,NULL,NULL,NULL,'2019-08-05'),(67,'EA241WM','NEC','03007335NB',2010,58,NULL,NULL,NULL,'2019-08-05'),(68,'EA221WMe','NEC','0YA18159NB',2010,60,NULL,NULL,NULL,'2019-08-05'),(69,'EA221WMe','NEC','23A60913NB',2012,60,NULL,NULL,NULL,'2019-08-05'),(70,'EA244WMi','NEC','49054887NB',2014,61,NULL,NULL,NULL,'2019-08-05'),(71,'EA241WM','NEC','0X016406NB',2010,61,NULL,NULL,NULL,'2019-08-05'),(72,'EA244WMi','NEC','6Z209671NB',2016,62,NULL,NULL,NULL,'2019-08-05'),(73,'DELL 2405FPW','DEL','M675461C02PS ',2006,63,NULL,NULL,NULL,'2019-08-05'),(74,'DELL 2407WFP','DEL','UY5456BN04TS ',2006,64,NULL,NULL,NULL,'2019-08-05'),(75,'EA245WMi-2','NEC','85314536NB',2018,65,NULL,NULL,NULL,'2019-08-05'),(76,'EA245WMi-2','NEC','85314610NB',2018,65,NULL,NULL,NULL,'2019-08-05'),(77,'DELL 2407WFP','DEL','UY5456BN04RS ',2006,66,NULL,NULL,NULL,'2019-08-05'),(78,'EA244WMi','NEC','69203707NB',2016,67,NULL,NULL,NULL,'2019-08-06'),(79,'EA244WMi','NEC','69203706NB',2016,67,NULL,NULL,NULL,'2019-08-06'),(80,'EA244WMi','NEC','49054012NB',2014,68,NULL,NULL,NULL,'2019-08-06'),(81,'EA221WMe','NEC','15A31097NB',2011,69,NULL,NULL,NULL,'2019-08-06'),(82,'EA221WMe','NEC','0YA18062NB',2010,70,NULL,NULL,NULL,'2019-08-06'),(83,'EA244WMi','NEC','7Z219302NB',2017,71,NULL,NULL,NULL,'2019-08-07'),(84,'EA244WMi','NEC','7Z219312NB',2017,71,NULL,NULL,NULL,'2019-08-07'),(85,'EA221WMe','NEC','0YA18139NB',2010,72,NULL,NULL,NULL,'2019-08-07'),(86,'EA221WMe','NEC','11A23617NB',2011,72,NULL,NULL,NULL,'2019-08-07'),(87,'EA241WM','NEC','03007323NB',2010,73,NULL,NULL,NULL,'2019-08-07'),(88,'EA241WM','NEC','0X016694NB',2010,74,NULL,NULL,NULL,'2019-08-08'),(89,'DELL 2405FPW','DEL','M675461C031S ',2006,75,NULL,NULL,NULL,'2019-08-08'),(90,'EA244WMi','NEC','5X095858NB',2015,76,NULL,NULL,NULL,'2019-08-08'),(91,'EA221WMe','NEC','0YA18040NB',2010,77,NULL,NULL,NULL,'2019-08-08'),(92,'EA221WMe','NEC','0YA18046NB',2010,77,NULL,NULL,NULL,'2019-08-08'),(93,'EA244WMi','NEC','6Z209679NB',2016,78,NULL,NULL,NULL,'2019-08-08'),(94,'DELL 2405FPW','DEL','M675461C02LS ',2006,79,NULL,NULL,NULL,'2019-08-08'),(95,'EA244WMi','NEC','49054901NB',2014,80,NULL,NULL,NULL,'2019-08-13'),(96,'EA244WMi','NEC','49054896NB',2014,80,NULL,NULL,NULL,'2019-08-13'),(97,'PT-EZ570E','MEI','51446115',2012,8,NULL,NULL,NULL,'2019-08-19'),(98,'EA244WMi','NEC','69203704NB',2016,81,NULL,NULL,NULL,'2019-08-19'),(99,'EA245WMi-2','NEC','83203601NB',2018,82,NULL,NULL,NULL,'2019-08-19'),(100,'DELL 2407WFP','DEL','UY5456BN04MS ',2006,83,NULL,NULL,NULL,'2019-08-19'),(101,'X22W-1','FUS','YE3L023289',2007,84,NULL,NULL,NULL,'2019-08-19');
/*!40000 ALTER TABLE `t_monitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_notebook`
--

DROP TABLE IF EXISTS `t_notebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_notebook` (
  `NID` int(11) NOT NULL AUTO_INCREMENT,
  `Hostname` varchar(50) DEFAULT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `Model` varchar(50) DEFAULT NULL,
  `SN` varchar(50) DEFAULT NULL,
  `OS` varchar(50) DEFAULT NULL,
  `InstallDate` date DEFAULT NULL,
  `RAM` double DEFAULT NULL,
  `MAC_Ethernet` varchar(50) DEFAULT NULL,
  `MAC_Wifi` varchar(50) DEFAULT NULL,
  `CPU` varchar(50) DEFAULT NULL,
  `GPU` varchar(50) DEFAULT NULL,
  `Storage` double DEFAULT NULL,
  `DiskCount` int(11) DEFAULT NULL,
  `DisplayResolutionHeight` int(11) DEFAULT NULL,
  `DisplayResolutionWidth` int(11) DEFAULT NULL,
  `Delivery` date DEFAULT NULL,
  `Supplier` varchar(30) DEFAULT NULL,
  `EndWarranty` date DEFAULT NULL,
  `LastConnect` date DEFAULT NULL,
  PRIMARY KEY (`NID`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_notebook`
--

LOCK TABLES `t_notebook` WRITE;
/*!40000 ALTER TABLE `t_notebook` DISABLE KEYS */;
INSERT INTO `t_notebook` VALUES (1,'BRO-NB-W021',NULL,'HP ProBook 450 G3','5CD5524WSG','Microsoft Windows 10 Enterprise','2019-06-07',7.9,'DC-4A-3E-EB-7F-D1','E0-94-67-F1-5B-B2','Intel(R) Core(TM) i5-6200U CPU @ 2.30GHz','Microsoft Basic Display Adapter',465.29,0,1080,1920,NULL,NULL,NULL,'2019-08-05'),(2,'BRO-NB-W000',NULL,'HP EliteBook 8760w','CNU20834LC','Microsoft Windows 10 Enterprise','2019-06-05',7.93,'E4-11-5B-42-29-01','10-0B-A9-8F-8C-BC','Intel(R) Core(TM) i7-2670QM CPU @ 2.20GHz','NVIDIA Quadro 3000M',465.29,1,1080,1920,NULL,NULL,NULL,'2019-08-30'),(3,'BRO-NB-W004',NULL,'LIFEBOOK E752','DSCN596266','Microsoft Windows 10 Enterprise','2019-02-21',7.86,'74-2B-62-88-3C-0E','9C-4E-36-DE-23-98','Intel(R) Core(TM) i5-3230M CPU @ 2.60GHz','Intel(R) HD Graphics 4000',238.01,0,900,1600,NULL,NULL,NULL,'2019-08-06'),(4,'BRO-NB-W005',NULL,'HP ProBook 450 G3','5CD5524WQJ','Microsoft Windows 10 Enterprise','2019-03-25',7.9,'DC-4A-3E-EC-6E-B0','E0-94-67-F0-C0-FD','Intel(R) Core(TM) i5-6200U CPU @ 2.30GHz','Intel(R) HD Graphics 520',465.76,0,1080,1920,NULL,NULL,NULL,'2019-08-08'),(5,'BRO-NB-W022',NULL,'81HN','R90SNDEC','Microsoft Windows 10 Enterprise','2019-06-17',7.44,'48-2A-E3-28-55-36','A0-A4-C5-4A-8F-B7','Intel(R) Core(TM) i3-6006U CPU @ 2.00GHz','Intel(R) HD Graphics 520',931.04,1,1080,1920,NULL,NULL,NULL,'2019-08-30'),(6,'BRO-NB-W023',NULL,'81HN','R90R6Z8C','Microsoft Windows 10 Enterprise','2019-06-18',7.44,'48-2A-E3-0C-0F-67','30-24-32-A9-0F-C4','Intel(R) Core(TM) i3-6006U CPU @ 2.00GHz','Intel(R) HD Graphics 520',931.04,1,1080,1920,NULL,NULL,NULL,'2019-08-13'),(7,'BRO-NB-W007',NULL,'LIFEBOOK E752','DSCN596205','Microsoft Windows 10 Enterprise','2019-02-18',7.86,'74-2B-62-88-3D-A0','9C-4E-36-DE-31-6C','Intel(R) Core(TM) i5-3230M CPU @ 2.60GHz','Intel(R) HD Graphics 4000',238.01,1,900,1440,NULL,NULL,NULL,'2019-08-29'),(8,'BRO-NB-W020',NULL,'LIFEBOOK A512','YLNC099433','Microsoft Windows 10 Enterprise','2019-05-09',3.89,'2C-D4-44-A1-B7-EB','68-17-29-D2-45-42','Intel(R) Core(TM) i5-2450M CPU @ 2.50GHz','Intel(R) HD Graphics 3000',465.29,1,1080,1920,NULL,NULL,NULL,'2019-08-14'),(11,'BRO-NB-W014',NULL,'LIFEBOOK A512','YLNC188011','Microsoft Windows 10 Enterprise','2019-03-20',3.89,'74-2B-62-6E-24-4C','00-C2-C6-5C-02-CE','Intel(R) Core(TM) i3-3110M CPU @ 2.40GHz','Microsoft Basic Display Adapter',297.62,1,768,1366,NULL,NULL,NULL,'2019-08-23'),(10,'BRO-NB-W001',NULL,'Surface Book 2','006228382457','Microsoft Windows 10 Enterprise','2019-06-24',7.93,'94-9A-A9-85-FE-CD','F0-6E-0B-C1-0E-96','Intel(R) Core(TM) i5-7300U CPU @ 2.60GHz','Intel(R) HD Graphics 620',238.01,1,2000,3000,NULL,NULL,NULL,'2019-08-19'),(12,'BRO-NB-W002',NULL,'HP 250 G5 Notebook PC','CND6388X0J','Microsoft Windows 10 Enterprise','2019-02-20',7.89,'98-E7-F4-D5-C5-BB','84-EF-18-F2-74-48','Intel(R) Core(TM) i5-6200U CPU @ 2.30GHz','Microsoft Basic Display Adapter',238.01,1,1080,1920,NULL,NULL,NULL,'2019-08-29');
/*!40000 ALTER TABLE `t_notebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_notebook_cat`
--

DROP TABLE IF EXISTS `t_notebook_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_notebook_cat` (
  `CATID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CATID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_notebook_cat`
--

LOCK TABLES `t_notebook_cat` WRITE;
/*!40000 ALTER TABLE `t_notebook_cat` DISABLE KEYS */;
INSERT INTO `t_notebook_cat` VALUES (1,'Schulungslaptop'),(2,'Leihlaptop'),(3,'Heimarbeit'),(4,'Hauptgerät'),(5,'Sondergerät');
/*!40000 ALTER TABLE `t_notebook_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_printer`
--

DROP TABLE IF EXISTS `t_printer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_printer` (
  `PID` int(11) NOT NULL AUTO_INCREMENT,
  `Hostname` varchar(50) DEFAULT NULL,
  `SN` varchar(50) DEFAULT NULL,
  `Office` varchar(50) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Manufacturer` varchar(50) DEFAULT NULL,
  `PrintedPages` int(11) DEFAULT NULL,
  `LastConnect` date DEFAULT NULL,
  PRIMARY KEY (`PID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_printer`
--

LOCK TABLES `t_printer` WRITE;
/*!40000 ALTER TABLE `t_printer` DISABLE KEYS */;
INSERT INTO `t_printer` VALUES (1,'bro-dr-w103etg','C7BF55062','103','Etagendrucker','TOSHIBA Corporation',326473,'2019-08-30'),(2,'bro-dr-w214etg','CFLG32284','214','Etagendrucker','TOSHIBA Corporation',192648,'2019-08-30'),(3,'bro-dr-w314etg','CFLG32357','314','Etagendrucker','TOSHIBA Corporation',101606,'2019-08-30'),(4,'bro-dr-w001mfp','7528711011139','001','Vorzimmerdrucker','Lexmark International',4505,'2019-08-30'),(5,'bro-dr-w110mfp','7559030006285','110','Vorzimmerdrucker','Lexmark International',17015,'2019-08-30'),(6,'bro-dr-w118','7528642010P6R','118','Abteilungsdrucker','Lexmark International',128226,'2019-08-09'),(7,'bro-dr-w212mfp','75287110110YN','212','Vorzimmerdrucker','Lexmark International',19975,'2019-08-30'),(8,'bro-dr-w311mfp','752871101113Y','311','Vorzimmerdrucker','Lexmark International',9883,'2019-08-30'),(9,'bro-dr-w404mfp','75287110110YK','404','Vorzimmerdrucker','Lexmark International',9645,'2019-08-30'),(10,'bro-dr-w407mfp','752871101112H','407','Vorzimmerdrucker','Lexmark International',23467,'2019-08-30');
/*!40000 ALTER TABLE `t_printer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_router`
--

DROP TABLE IF EXISTS `t_router`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_router` (
  `RID` int(11) NOT NULL AUTO_INCREMENT,
  `SN` varchar(50) DEFAULT NULL,
  `Hostname` varchar(50) DEFAULT NULL,
  `IP` varchar(50) DEFAULT NULL,
  `Model` varchar(50) DEFAULT NULL,
  `LastConnect` date DEFAULT NULL,
  PRIMARY KEY (`RID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_router`
--

LOCK TABLES `t_router` WRITE;
/*!40000 ALTER TABLE `t_router` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_router` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sector`
--

DROP TABLE IF EXISTS `t_sector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_sector` (
  `SID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(30) DEFAULT NULL,
  `StreetAddress` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`SID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sector`
--

LOCK TABLES `t_sector` WRITE;
/*!40000 ALTER TABLE `t_sector` DISABLE KEYS */;
INSERT INTO `t_sector` VALUES (1,'Hochbau','Wittelsbacherstr. 11'),(2,'Straßenbau','Greidererstr. 6'),(3,'SM Ampfing','Waldkraiburger Straße 43c'),(4,'SM Ebersberg','Wasserbrugerstraße 4'),(5,'SM Hausham','Nagelbachstraße 15'),(6,'SM Rosenheim','Greidererstraße 10');
/*!40000 ALTER TABLE `t_sector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_server`
--

DROP TABLE IF EXISTS `t_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_server` (
  `SVID` int(11) NOT NULL AUTO_INCREMENT,
  `SN` varchar(50) DEFAULT NULL,
  `Hostname` varchar(50) DEFAULT NULL,
  `IP` varchar(50) DEFAULT NULL,
  `Model` varchar(50) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `LastConnect` date DEFAULT NULL,
  PRIMARY KEY (`SVID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_server`
--

LOCK TABLES `t_server` WRITE;
/*!40000 ALTER TABLE `t_server` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_switch`
--

DROP TABLE IF EXISTS `t_switch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_switch` (
  `SHID` int(11) NOT NULL AUTO_INCREMENT,
  `SN` varchar(50) DEFAULT NULL,
  `Hostname` varchar(50) DEFAULT NULL,
  `IP` varchar(50) DEFAULT NULL,
  `Model` varchar(50) DEFAULT NULL,
  `LastConnect` date DEFAULT NULL,
  PRIMARY KEY (`SHID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_switch`
--

LOCK TABLES `t_switch` WRITE;
/*!40000 ALTER TABLE `t_switch` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_switch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user` (
  `UID` int(11) NOT NULL AUTO_INCREMENT,
  `Surname` varchar(50) DEFAULT NULL,
  `GivenName` varchar(50) DEFAULT NULL,
  `Office` varchar(50) DEFAULT NULL,
  `Department` int(11) DEFAULT NULL,
  `Sector` int(11) DEFAULT NULL,
  `Account` varchar(50) DEFAULT NULL,
  `ObjectSid` varchar(100) DEFAULT NULL,
  `LastRefresh` date DEFAULT NULL,
  PRIMARY KEY (`UID`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,'Widel','Elisabeth','310',12,1,'bro-widelE','S-1-5-21-1289117853-911153512-630672053-358872','2019-08-30'),(2,'Niederlechner','Rupert','104',14,1,'bro-nierup','S-1-5-21-1289117853-911153512-630672053-270764','2019-08-30'),(3,'Klemm','Daniel','305',12,1,'bro-KlemmD','S-1-5-21-1289117853-911153512-630672053-405767','2019-08-30'),(4,'Gantner','Alfred','308',11,1,'bro-gantnera','S-1-5-21-1289117853-911153512-630672053-271194','2019-08-30'),(5,'Jarschel','Kristina','306',12,1,'bro-JarscheK','S-1-5-21-1289117853-911153512-630672053-358994','2019-08-30'),(7,'Reiter','Helmut','401',1,1,'bro-reiterh','S-1-5-21-1289117853-911153512-630672053-161091','2019-08-30'),(8,'Hartl','Dominik','104',14,1,'bro-HartlD','S-1-5-21-1289117853-911153512-630672053-358973','2019-08-30'),(9,'Vordermayer','Georg','112',13,1,'bro-vordermg','S-1-5-21-1289117853-911153512-630672053-49785','2019-08-30'),(10,'Dumbeck','Jürgen','304',11,1,'bro-dumbeckj','S-1-5-21-1289117853-911153512-630672053-358850','2019-08-30'),(11,'Schmid','Luise','404',1,1,'bro-schmidl','S-1-5-21-1289117853-911153512-630672053-49854','2019-08-30'),(12,'Nünemann','Bea','116',2,1,'bro-nuenemab','S-1-5-21-1289117853-911153512-630672053-188961','2019-08-30'),(13,'Penninger','Markus','403',1,1,'bro-penningm','S-1-5-21-1289117853-911153512-630672053-49866','2019-08-30'),(14,'Weihermüller','Marion','307',12,1,'bro-weihermM','S-1-5-21-1289117853-911153512-630672053-358877','2019-08-30'),(15,'Appel','Carolin','213',9,1,'bro-appelc','S-1-5-21-1289117853-911153512-630672053-301844','2019-08-30'),(16,'Heller','Ferdinand','108',13,1,'bro-HellerF','S-1-5-21-1289117853-911153512-630672053-359193','2019-08-30'),(17,'Sykora','Gideon','219',9,1,'bro-SykoraG','S-1-5-21-1289117853-911153512-630672053-405918','2019-08-19'),(18,'Glock','Oliver','108',13,1,'bro-GlockO','S-1-5-21-1289117853-911153512-630672053-405863','2019-08-30'),(19,'Gebauer','Günter','305',12,1,'bro-GebauerG','S-1-5-21-1289117853-911153512-630672053-405864','2019-08-30'),(20,'Bulla','Waldemar','006',1,1,'bro-bullaw','S-1-5-21-1289117853-911153512-630672053-358775','2019-08-30'),(21,'Tourneau','Fabienne','207',10,1,'bro-TourneaF','S-1-5-21-1289117853-911153512-630672053-358989','2019-08-30'),(22,'Eiler','Tanja','115',2,1,'bro-eilert','S-1-5-21-1289117853-911153512-630672053-49831','2019-08-30'),(23,'Wiesner','Geraldine','307',12,1,'bro-wiesnerg','S-1-5-21-1289117853-911153512-630672053-188991','2019-08-30'),(24,'Ehret','Stefanie','001',1,1,'bro-EhretS','S-1-5-21-1289117853-911153512-630672053-359197','2019-08-30'),(25,'Eminger','Heike','202',10,1,'bro-emingerh','S-1-5-21-1289117853-911153512-630672053-188863','2019-08-30'),(26,'Krug','Ralph','205',10,1,'bro-KrugR','S-1-5-21-1289117853-911153512-630672053-405995','2019-08-30'),(27,'Ehrenberger','Thomas','302',11,1,'bro-ehrenbet','S-1-5-21-1289117853-911153512-630672053-301838','2019-08-30'),(28,'Erlacher','Alexander','403',1,1,'bro-ErlacheA','S-1-5-21-1289117853-911153512-630672053-359000','2019-08-30'),(29,'Kühnhauser','Karin','309',1,1,'bro-kuehnhak','S-1-5-21-1289117853-911153512-630672053-49822','2019-08-30'),(30,'Weyerer','Andrea','117',2,1,'bro-weyerera','S-1-5-21-1289117853-911153512-630672053-49823','2019-08-30'),(31,'Lechner','Bernhard','118',2,1,'bro-lechnerb','S-1-5-21-1289117853-911153512-630672053-49801','2019-08-30'),(32,'Bulla','Irmgard','406',1,1,'bro-bullai','S-1-5-21-1289117853-911153512-630672053-49795','2019-08-30'),(33,'Sporrer','Alfred','116',2,1,'bro-SporrerA','S-1-5-21-1289117853-911153512-630672053-358972','2019-08-30'),(34,'Abt','Bernhard','107',13,1,'bro-abtb','S-1-5-21-1289117853-911153512-630672053-301773','2019-08-30'),(35,'Steigerwald','Maximilian','213',9,1,'bro-SteigerM','S-1-5-21-1289117853-911153512-630672053-358991','2019-08-30'),(36,'Hartmann','Sarah','111',13,1,'bro-HartmanS','S-1-5-21-1289117853-911153512-630672053-359013','2019-08-30'),(37,'Nemet','Gabriele','212',1,1,'bro-nemetg','S-1-5-21-1289117853-911153512-630672053-359216','2019-08-30'),(38,'Julinek','Tobias','207',10,1,'bro-JulinekT','S-1-5-21-1289117853-911153512-630672053-359167','2019-08-30'),(39,'Thanner','Martin','105',13,1,'bro-thannerm','S-1-5-21-1289117853-911153512-630672053-359217','2019-08-30'),(40,'Geisler','Eveline','110',1,1,'bro-geislerE','S-1-5-21-1289117853-911153512-630672053-358873','2019-08-30'),(41,'Rösler','Sylvia','208',10,1,'bro-RoeslerS','S-1-5-21-1289117853-911153512-630672053-358990','2019-08-30'),(42,'Froschmayer','Rudolf','210',10,1,'bro-froschmr','S-1-5-21-1289117853-911153512-630672053-49827','2019-08-30'),(43,'Hundhammer','Christoph','209',10,1,'bro-hundhamc','S-1-5-21-1289117853-911153512-630672053-49834','2019-08-30'),(44,'Horniak','Andrea','101',13,1,'bro-HorniakA','S-1-5-21-1289117853-911153512-630672053-359257','2019-08-30'),(45,'Pfisterer','Josef','106',13,1,'bro-pfisterj','S-1-5-21-1289117853-911153512-630672053-49800','2019-08-30'),(46,'Seubert','Michael','202',10,1,'bro-seubertm','S-1-5-21-1289117853-911153512-630672053-301854','2019-08-30'),(47,'Bauer','Christian','112',13,1,'bro-bauerc','S-1-5-21-1289117853-911153512-630672053-49791','2019-08-30'),(48,'Lerner','Stephan','318',9,1,'bro-LernerS','S-1-5-21-1289117853-911153512-630672053-406102','2019-08-30'),(49,'Schempp','Susanna','215',9,1,'bro-schempps','S-1-5-21-1289117853-911153512-630672053-49816','2019-08-30'),(50,'Fischbacher','Wolfgang','107',13,1,'bro-fischbaw','S-1-5-21-1289117853-911153512-630672053-49798','2019-08-30'),(51,'Furtner','Armin','317',11,1,'bro-furtnera','S-1-5-21-1289117853-911153512-630672053-49821','2019-08-30'),(52,'Eichinger','Albert','216',9,1,'bro-eichinga','S-1-5-21-1289117853-911153512-630672053-49826','2019-08-30'),(53,'Eichberger','Norbert','217',9,1,'bro-eichbern','S-1-5-21-1289117853-911153512-630672053-49832','2019-08-30'),(54,'Lion','Peter','220',9,1,'bro-lionp','S-1-5-21-1289117853-911153512-630672053-49819','2019-08-30'),(55,'Windhör','Bert','219',9,1,'bro-windhoeb','S-1-5-21-1289117853-911153512-630672053-49815','2019-08-30'),(56,'Thaller','Christian','101',13,1,'bro-thallerC','S-1-5-21-1289117853-911153512-630672053-358930','2019-08-30'),(57,'Haas','Roman','215',9,1,'bro-HaasR','S-1-5-21-1289117853-911153512-630672053-359226','2019-08-30'),(58,'Tippl','Monika','117',2,1,'bro-tipplm','S-1-5-21-1289117853-911153512-630672053-49817','2019-08-30'),(59,'Leingartner','Ralph','318',9,1,'bro-leingarr','S-1-5-21-1289117853-911153512-630672053-49820','2019-08-30'),(60,'Pörnbacher','Kurt','218',9,1,'bro-poernbak','S-1-5-21-1289117853-911153512-630672053-49814','2019-08-30'),(61,'Schuster','Michael','316',10,1,'bro-schustem','S-1-5-21-1289117853-911153512-630672053-49812','2019-08-30'),(62,'Witschak','Marcel','206',9,1,'bro-witscham','S-1-5-21-1289117853-911153512-630672053-117583','2019-08-30'),(63,'Mooser','Carolina','203',10,1,'bro-mooserc','S-1-5-21-1289117853-911153512-630672053-160031','2019-08-30'),(64,'Langner','Martin','211',10,1,'bro-LangnerM','S-1-5-21-1289117853-911153512-630672053-359258','2019-08-30'),(65,'Schiffmann','Martin','205',10,1,'bro-SchiffmM','S-1-5-21-1289117853-911153512-630672053-406009','2019-08-30'),(66,'Simhofer','Rudolf','312',11,1,'bro-simhofer','S-1-5-21-1289117853-911153512-630672053-49836','2019-08-30'),(67,'Fuchs','Laura','206',12,1,'bro-fuchsl','S-1-5-21-1289117853-911153512-630672053-358863','2019-08-30'),(68,'Schuster','Uta','313',11,1,'bro-schusteu','S-1-5-21-1289117853-911153512-630672053-49839','2019-08-30'),(69,'Elmauer','Renate','311',1,1,'bro-elmauerr','S-1-5-21-1289117853-911153512-630672053-49847','2019-08-30'),(70,'Lampe','Michael','308',11,1,'bro-lampem','S-1-5-21-1289117853-911153512-630672053-358864','2019-08-30'),(71,'Schröcker','Andreas','306',12,1,'bro-schroeca','S-1-5-21-1289117853-911153512-630672053-49848','2019-08-30'),(72,'Burghardt','Franz','218',9,1,'bro-burgharf','S-1-5-21-1289117853-911153512-630672053-49813','2019-08-30'),(73,'Mauerer','Gunther','105',13,1,'bro-mauererg','S-1-5-21-1289117853-911153512-630672053-188910','2019-08-30'),(74,'Fortner','Josef','113',13,1,'bro-fortnerj','S-1-5-21-1289117853-911153512-630672053-49788','2019-08-30'),(75,'Bäumler','Susanne','407',1,1,'bro-baeumles','S-1-5-21-1289117853-911153512-630672053-188986','2019-08-30'),(76,'Schramm','Walter','113',13,1,'bro-schrammw','S-1-5-21-1289117853-911153512-630672053-49789','2019-08-30'),(77,'Tischer','Felix','106',13,1,'bro-tischerf','S-1-5-21-1289117853-911153512-630672053-49790','2019-08-30'),(78,'Hahn','Ursula','404',1,1,'bro-HahnU','S-1-5-21-1289117853-911153512-630672053-406112','2019-08-30'),(79,'Karl','Karin','402',1,1,'bro-karlk','S-1-5-21-1289117853-911153512-630672053-301918','2019-08-30'),(80,'Lackerbauer','Doris','408',8,1,'bro-lackerbd','S-1-5-21-1289117853-911153512-630672053-358931','2019-08-30'),(81,'Kneißl','Katharina','208',10,1,'bro-kneisslk','S-1-5-21-1289117853-911153512-630672053-188867','2019-08-30'),(82,'Meier','Elisabeth','310',12,1,'bro-MeierE','S-1-5-21-1289117853-911153512-630672053-406136','2019-08-30');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_computer`
--

DROP TABLE IF EXISTS `t_user_computer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_computer` (
  `UID` int(11) NOT NULL,
  `CID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_computer`
--

LOCK TABLES `t_user_computer` WRITE;
/*!40000 ALTER TABLE `t_user_computer` DISABLE KEYS */;
INSERT INTO `t_user_computer` VALUES (25,1),(4,4),(61,5),(3,6),(54,67),(59,7),(50,9),(63,10),(45,11),(36,68),(14,12),(77,13),(22,14),(58,15),(49,71),(7,16),(40,17),(26,18),(72,20),(15,21),(66,22),(52,23),(62,25),(56,72),(17,26),(11,27),(69,28),(43,29),(67,30),(73,69),(33,31),(34,32),(12,33),(65,34),(48,35),(19,36),(38,37),(20,38),(57,39),(44,40),(68,41),(24,42),(79,73),(29,43),(13,74),(18,82),(80,44),(5,45),(53,83),(76,70),(39,46),(28,47),(74,48),(31,84),(47,49),(60,66),(46,50),(64,51),(70,76),(37,54),(42,81),(10,77),(30,55),(27,80),(2,56),(41,78),(71,58),(32,59),(51,60),(75,61),(21,62),(1,63),(55,64),(16,79),(8,65);
/*!40000 ALTER TABLE `t_user_computer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_mobiledevice`
--

DROP TABLE IF EXISTS `t_user_mobiledevice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_mobiledevice` (
  `UID` int(11) NOT NULL,
  `MDID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_mobiledevice`
--

LOCK TABLES `t_user_mobiledevice` WRITE;
/*!40000 ALTER TABLE `t_user_mobiledevice` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_user_mobiledevice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_notebook`
--

DROP TABLE IF EXISTS `t_user_notebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_notebook` (
  `UID` int(11) NOT NULL,
  `NID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_notebook`
--

LOCK TABLES `t_user_notebook` WRITE;
/*!40000 ALTER TABLE `t_user_notebook` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_user_notebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_count_monitormodelle`
--

DROP TABLE IF EXISTS `v_count_monitormodelle`;
/*!50001 DROP VIEW IF EXISTS `v_count_monitormodelle`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_count_monitormodelle` AS SELECT 
 1 AS `Manufacturer`,
 1 AS `Model`,
 1 AS `Anzahl`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_count_pcmodelle`
--

DROP TABLE IF EXISTS `v_count_pcmodelle`;
/*!50001 DROP VIEW IF EXISTS `v_count_pcmodelle`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_count_pcmodelle` AS SELECT 
 1 AS `Model`,
 1 AS `Anzahl`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_count_userdepartment`
--

DROP TABLE IF EXISTS `v_count_userdepartment`;
/*!50001 DROP VIEW IF EXISTS `v_count_userdepartment`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_count_userdepartment` AS SELECT 
 1 AS `Description`,
 1 AS `Anzahl`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_monitor_older5y`
--

DROP TABLE IF EXISTS `v_monitor_older5y`;
/*!50001 DROP VIEW IF EXISTS `v_monitor_older5y`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_monitor_older5y` AS SELECT 
 1 AS `Mitarbeiter`,
 1 AS `MID`,
 1 AS `Yom`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_namekomplett`
--

DROP TABLE IF EXISTS `v_namekomplett`;
/*!50001 DROP VIEW IF EXISTS `v_namekomplett`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_namekomplett` AS SELECT 
 1 AS `NameKomplett`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_user_computer`
--

DROP TABLE IF EXISTS `v_user_computer`;
/*!50001 DROP VIEW IF EXISTS `v_user_computer`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_user_computer` AS SELECT 
 1 AS `CID`,
 1 AS `Hostname`,
 1 AS `UID`,
 1 AS `NameKomplett`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_count_monitormodelle`
--

/*!50001 DROP VIEW IF EXISTS `v_count_monitormodelle`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_count_monitormodelle` AS select `t_monitor`.`Manufacturer` AS `Manufacturer`,`t_monitor`.`Model` AS `Model`,count(`t_monitor`.`MID`) AS `Anzahl` from `t_monitor` group by `t_monitor`.`Model` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_count_pcmodelle`
--

/*!50001 DROP VIEW IF EXISTS `v_count_pcmodelle`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_count_pcmodelle` AS select `t_computer`.`Model` AS `Model`,count(`t_computer`.`CID`) AS `Anzahl` from `t_computer` group by `t_computer`.`Model` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_count_userdepartment`
--

/*!50001 DROP VIEW IF EXISTS `v_count_userdepartment`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_count_userdepartment` AS select `d`.`Description` AS `Description`,count(`u`.`UID`) AS `Anzahl` from (`t_user` `u` join `t_department` `d`) where (`u`.`Department` = `d`.`DID`) group by `d`.`Description` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_monitor_older5y`
--

/*!50001 DROP VIEW IF EXISTS `v_monitor_older5y`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_monitor_older5y` AS select `vuc`.`NameKomplett` AS `Mitarbeiter`,`m`.`MID` AS `MID`,`m`.`YoM` AS `Yom` from ((`t_monitor` `m` join `t_computer` `c`) join `v_user_computer` `vuc`) where ((`m`.`CID` = `c`.`CID`) and (`c`.`CID` = `vuc`.`CID`) and (`m`.`YoM` < (curdate() - interval 5 year))) order by `m`.`YoM` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_namekomplett`
--

/*!50001 DROP VIEW IF EXISTS `v_namekomplett`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_namekomplett` AS select concat(`t_user`.`Surname`,' ',`t_user`.`GivenName`) AS `NameKomplett` from `t_user` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_user_computer`
--

/*!50001 DROP VIEW IF EXISTS `v_user_computer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_user_computer` AS select `c`.`CID` AS `CID`,`c`.`Hostname` AS `Hostname`,`u`.`UID` AS `UID`,concat(`u`.`Surname`,' ',`u`.`GivenName`) AS `NameKomplett` from ((`t_user` `u` join `t_computer` `c`) join `t_user_computer` `uc`) where ((`uc`.`UID` = `u`.`UID`) and (`uc`.`CID` = `c`.`CID`)) */;
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

-- Dump completed on 2019-08-30 11:13:59
