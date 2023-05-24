-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: db_cds
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbtitulo`
--

DROP TABLE IF EXISTS `tbtitulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbtitulo` (
  `idTitulo` int NOT NULL AUTO_INCREMENT,
  `idCategoria` int NOT NULL,
  `idGravadora` int NOT NULL,
  `NomeCD` varchar(100) NOT NULL,
  `ValorCD` decimal(10,2) NOT NULL DEFAULT '1.00',
  `QuantidadeEstoque` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`idTitulo`),
  KEY `fkTituloCategoria` (`idCategoria`),
  KEY `fkTituloGravadora` (`idGravadora`),
  CONSTRAINT `fkTituloCategoria` FOREIGN KEY (`idCategoria`) REFERENCES `tbcategoria` (`idCategoria`),
  CONSTRAINT `fkTituloGravadora` FOREIGN KEY (`idGravadora`) REFERENCES `tbgravadora` (`idGravadora`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbtitulo`
--

LOCK TABLES `tbtitulo` WRITE;
/*!40000 ALTER TABLE `tbtitulo` DISABLE KEYS */;
INSERT INTO `tbtitulo` VALUES (1,1,1,'Disco 01',275.50,750),(2,2,2,'Disco 02',160.50,301),(3,3,3,'Disco 03',400.50,188),(4,4,4,'Disco 04',90.50,28),(5,5,5,'Disco 05',308.50,158);
/*!40000 ALTER TABLE `tbtitulo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-24 17:25:24
