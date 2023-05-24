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
-- Table structure for table `tbartistas`
--

DROP TABLE IF EXISTS `tbartistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbartistas` (
  `idArtista` int NOT NULL AUTO_INCREMENT,
  `NomeArtista` varchar(100) NOT NULL,
  PRIMARY KEY (`idArtista`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbartistas`
--

LOCK TABLES `tbartistas` WRITE;
/*!40000 ALTER TABLE `tbartistas` DISABLE KEYS */;
INSERT INTO `tbartistas` VALUES (1,'Ketelyn Sousa'),(2,'Matheus Júnior'),(3,'Kevelin Sousa'),(4,'Bruno'),(5,'Neds');
/*!40000 ALTER TABLE `tbartistas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbcategoria`
--

DROP TABLE IF EXISTS `tbcategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbcategoria` (
  `idCategoria` int NOT NULL AUTO_INCREMENT,
  `NomeCategoria` varchar(50) NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbcategoria`
--

LOCK TABLES `tbcategoria` WRITE;
/*!40000 ALTER TABLE `tbcategoria` DISABLE KEYS */;
INSERT INTO `tbcategoria` VALUES (1,'Rock'),(2,'Pop'),(3,'Classicas'),(4,'Forro'),(5,'Sertanejo');
/*!40000 ALTER TABLE `tbcategoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbcidade`
--

DROP TABLE IF EXISTS `tbcidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbcidade` (
  `idCidade` int NOT NULL AUTO_INCREMENT,
  `idSiglaEstado` char(2) NOT NULL,
  `NomeCidade` varchar(100) NOT NULL,
  PRIMARY KEY (`idCidade`),
  KEY `fkCidadeEstado` (`idSiglaEstado`),
  CONSTRAINT `fkCidadeEstado` FOREIGN KEY (`idSiglaEstado`) REFERENCES `tbestado` (`idSiglaEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbcidade`
--

LOCK TABLES `tbcidade` WRITE;
/*!40000 ALTER TABLE `tbcidade` DISABLE KEYS */;
INSERT INTO `tbcidade` VALUES (1,'sp','Mauá'),(2,'rj','Rio de Janeiro'),(3,'ma','Presidente Dutra'),(4,'ac','rio branco'),(5,'al','maceió');
/*!40000 ALTER TABLE `tbcidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbcliente`
--

DROP TABLE IF EXISTS `tbcliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbcliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `idCidade` int NOT NULL,
  `NomeCliente` varchar(100) NOT NULL,
  `EnderecoCliente` varchar(200) NOT NULL,
  `RendaCliente` decimal(10,2) NOT NULL DEFAULT '0.00',
  `SexoCliente` enum('f','m') NOT NULL DEFAULT 'f',
  PRIMARY KEY (`idCliente`),
  KEY `fkClienteCidade` (`idCidade`),
  CONSTRAINT `fkClienteCidade` FOREIGN KEY (`idCidade`) REFERENCES `tbcidade` (`idCidade`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbcliente`
--

LOCK TABLES `tbcliente` WRITE;
/*!40000 ALTER TABLE `tbcliente` DISABLE KEYS */;
INSERT INTO `tbcliente` VALUES (1,1,'Pedro','Rua 01',1900.00,'m'),(2,2,'Katerine','Rua 02',200.00,'f'),(3,3,'Lara','Rua 03',19.00,'f'),(4,4,'Joana','Rua 04',20.00,'f'),(5,5,'Vinicius','Rua 05',189.00,'m');
/*!40000 ALTER TABLE `tbcliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbconjuge`
--

DROP TABLE IF EXISTS `tbconjuge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbconjuge` (
  `idConjuge` int NOT NULL AUTO_INCREMENT,
  `idCliente` int NOT NULL,
  `NomeConjuge` varchar(100) NOT NULL,
  `RendaConjuge` decimal(10,2) NOT NULL DEFAULT '0.00',
  `SexoConjuge` enum('f','m') NOT NULL DEFAULT 'm',
  PRIMARY KEY (`idConjuge`),
  KEY `fkConjugeCliente` (`idCliente`),
  CONSTRAINT `fkConjugeCliente` FOREIGN KEY (`idCliente`) REFERENCES `tbcliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbconjuge`
--

LOCK TABLES `tbconjuge` WRITE;
/*!40000 ALTER TABLE `tbconjuge` DISABLE KEYS */;
INSERT INTO `tbconjuge` VALUES (1,1,'Luana',10.00,'f'),(2,2,'Leo',190.00,'m'),(3,3,'Marcos',2150.00,'m'),(4,4,'Matheus Júnior',2150.00,'m'),(5,5,'Liz',50.00,'f');
/*!40000 ALTER TABLE `tbconjuge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbdependente`
--

DROP TABLE IF EXISTS `tbdependente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbdependente` (
  `idDependente` int NOT NULL AUTO_INCREMENT,
  `idFuncionario` int NOT NULL,
  `NomeDependente` varchar(100) NOT NULL,
  `SexoDependente` enum('f','m') NOT NULL DEFAULT 'm',
  PRIMARY KEY (`idDependente`),
  KEY `fkDependenteFuncionario` (`idFuncionario`),
  CONSTRAINT `fkDependenteFuncionario` FOREIGN KEY (`idFuncionario`) REFERENCES `tbfuncionario` (`idFuncionario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbdependente`
--

LOCK TABLES `tbdependente` WRITE;
/*!40000 ALTER TABLE `tbdependente` DISABLE KEYS */;
INSERT INTO `tbdependente` VALUES (1,1,'Rafa','m'),(2,2,'Maria','f'),(3,3,'Pietra','f'),(4,4,'Victor','m'),(5,5,'Bruna','f');
/*!40000 ALTER TABLE `tbdependente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbestado`
--

DROP TABLE IF EXISTS `tbestado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbestado` (
  `idSiglaEstado` char(2) NOT NULL,
  `NomeEstado` varchar(50) NOT NULL,
  PRIMARY KEY (`idSiglaEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbestado`
--

LOCK TABLES `tbestado` WRITE;
/*!40000 ALTER TABLE `tbestado` DISABLE KEYS */;
INSERT INTO `tbestado` VALUES ('ac','acre'),('al','alagoas'),('ma','maranhão'),('rj','Rio de Janeiro'),('sp','São Paulo');
/*!40000 ALTER TABLE `tbestado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbfuncionario`
--

DROP TABLE IF EXISTS `tbfuncionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbfuncionario` (
  `idFuncionario` int NOT NULL AUTO_INCREMENT,
  `NomeFuncionario` varchar(100) NOT NULL,
  `EnderecoFuncionario` varchar(200) NOT NULL,
  `SalarioFuncionario` decimal(10,2) NOT NULL DEFAULT '0.00',
  `SexoFuncionario` enum('f','m') NOT NULL DEFAULT 'm',
  PRIMARY KEY (`idFuncionario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbfuncionario`
--

LOCK TABLES `tbfuncionario` WRITE;
/*!40000 ALTER TABLE `tbfuncionario` DISABLE KEYS */;
INSERT INTO `tbfuncionario` VALUES (1,'Fernando','Rua 06',1580.00,'m'),(2,'Amanda','Rua 07',1880.00,'f'),(3,'Laura ','Rua 08',2280.00,'f'),(4,'João','Rua 09',1380.00,'m'),(5,'Paula Brito','Rua 10',1780.00,'f');
/*!40000 ALTER TABLE `tbfuncionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbgravadora`
--

DROP TABLE IF EXISTS `tbgravadora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbgravadora` (
  `idGravadora` int NOT NULL AUTO_INCREMENT,
  `NomeGravadora` varchar(50) NOT NULL,
  PRIMARY KEY (`idGravadora`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbgravadora`
--

LOCK TABLES `tbgravadora` WRITE;
/*!40000 ALTER TABLE `tbgravadora` DISABLE KEYS */;
INSERT INTO `tbgravadora` VALUES (1,'PkDutra'),(2,'GotosGrav'),(3,'Dantas'),(4,'Central'),(5,'Tigres');
/*!40000 ALTER TABLE `tbgravadora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbpedido`
--

DROP TABLE IF EXISTS `tbpedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbpedido` (
  `idNumeroPedido` int NOT NULL AUTO_INCREMENT,
  `idCliente` int NOT NULL,
  `DataPedido` datetime NOT NULL,
  `ValorPedido` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`idNumeroPedido`),
  KEY `fkPedidoCliente` (`idCliente`),
  CONSTRAINT `fkPedidoCliente` FOREIGN KEY (`idCliente`) REFERENCES `tbcliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbpedido`
--

LOCK TABLES `tbpedido` WRITE;
/*!40000 ALTER TABLE `tbpedido` DISABLE KEYS */;
INSERT INTO `tbpedido` VALUES (1,1,'2003-06-13 00:00:00',475.50),(2,2,'2018-08-11 00:00:00',500.50),(3,3,'2002-06-15 00:00:00',20.50),(4,4,'2023-05-24 00:00:00',195.50),(5,5,'2003-05-16 00:00:00',388.50);
/*!40000 ALTER TABLE `tbpedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbpedido_titulo`
--

DROP TABLE IF EXISTS `tbpedido_titulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbpedido_titulo` (
  `idNumeroPedido` int NOT NULL,
  `idTitulo` int NOT NULL,
  `QuantidadeCds` int NOT NULL DEFAULT '1',
  `ValorCds` decimal(10,2) NOT NULL DEFAULT '1.00',
  PRIMARY KEY (`idNumeroPedido`,`idTitulo`),
  KEY `fkPedido_Titulo_Titulo` (`idTitulo`),
  CONSTRAINT `fkPedido_Titulo_Pedido` FOREIGN KEY (`idNumeroPedido`) REFERENCES `tbpedido` (`idNumeroPedido`),
  CONSTRAINT `fkPedido_Titulo_Titulo` FOREIGN KEY (`idTitulo`) REFERENCES `tbtitulo` (`idTitulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbpedido_titulo`
--

LOCK TABLES `tbpedido_titulo` WRITE;
/*!40000 ALTER TABLE `tbpedido_titulo` DISABLE KEYS */;
INSERT INTO `tbpedido_titulo` VALUES (1,1,85,75.00),(2,2,100,50.00),(3,3,40,79.00),(4,4,75,365.00),(5,5,36,105.00);
/*!40000 ALTER TABLE `tbpedido_titulo` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `tbtitulo_artista`
--

DROP TABLE IF EXISTS `tbtitulo_artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbtitulo_artista` (
  `idTitulo` int NOT NULL,
  `idArtista` int NOT NULL,
  PRIMARY KEY (`idTitulo`,`idArtista`),
  KEY `fkTitulo_Artista_Artista` (`idArtista`),
  CONSTRAINT `fkTitulo_Artista_Artista` FOREIGN KEY (`idArtista`) REFERENCES `tbartistas` (`idArtista`),
  CONSTRAINT `fkTitulo_Artista_Titulo` FOREIGN KEY (`idTitulo`) REFERENCES `tbtitulo` (`idTitulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbtitulo_artista`
--

LOCK TABLES `tbtitulo_artista` WRITE;
/*!40000 ALTER TABLE `tbtitulo_artista` DISABLE KEYS */;
INSERT INTO `tbtitulo_artista` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `tbtitulo_artista` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-24 17:27:22
