-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: impuesto
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `contribuyente`
--

DROP TABLE IF EXISTS `contribuyente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contribuyente` (
  `id_contribuyente` int(11) NOT NULL,
  `nombres` varchar(50) DEFAULT NULL,
  `apellido_1` varchar(30) DEFAULT NULL,
  `apellido_2` varchar(30) DEFAULT NULL,
  `apellido_casada` varchar(30) DEFAULT NULL,
  `domicilio` varchar(30) DEFAULT NULL,
  `tipo_documento` varchar(30) DEFAULT NULL,
  `numero_documento` varchar(15) DEFAULT NULL,
  `lugar_expedicion_doc` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id_contribuyente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='			';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contribuyente`
--

LOCK TABLES `contribuyente` WRITE;
/*!40000 ALTER TABLE `contribuyente` DISABLE KEYS */;
INSERT INTO `contribuyente` VALUES (1,'Luis Fernando','Vargas','Quiroz',NULL,'C/ taborga s/n','CI','4450410','CB'),(2,'Favio','Vargas','Camacho',NULL,'C/ taborga s/n','CI','6503043','CB');
/*!40000 ALTER TABLE `contribuyente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `id_factura` int(11) NOT NULL,
  `nit` int(11) DEFAULT NULL,
  `numero_factura` int(11) DEFAULT NULL,
  `numero_autorizacion` bigint(15) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `importe` decimal(10,0) DEFAULT NULL,
  `codigo_control` varchar(14) DEFAULT NULL,
  `factura_electronica` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_factura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='			';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,1009445021,26663,263401900052933,'2019-07-17',48,'02-E3-DB-80-5F',NULL),(2,1009445021,24259,263401900052967,'2019-07-09',59,'0C-41-85-F8-02',NULL);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form110`
--

DROP TABLE IF EXISTS `form110`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `form110` (
  `id_form110` int(11) NOT NULL,
  `lugar` varchar(25) DEFAULT NULL,
  `fecha_presentacion` date DEFAULT NULL,
  `periodo_anio` int(11) DEFAULT NULL,
  `periodo_mes` int(2) DEFAULT NULL,
  `id_contribuyente` int(11) DEFAULT NULL,
  `empleador_nit` varchar(50) DEFAULT NULL,
  `empleador_rason_social` varchar(250) DEFAULT NULL,
  `empleador_domicilio` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_form110`),
  KEY `id_contribuyente_idx` (`id_contribuyente`),
  CONSTRAINT `id_contribuyente` FOREIGN KEY (`id_contribuyente`) REFERENCES `contribuyente` (`id_contribuyente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='			';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form110`
--

LOCK TABLES `form110` WRITE;
/*!40000 ALTER TABLE `form110` DISABLE KEYS */;
INSERT INTO `form110` VALUES (1,'COCHABAMBA','2019-07-20',2019,8,1,'1020705027','ET','C/ SUIPACHA');
/*!40000 ALTER TABLE `form110` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form110_detalle`
--

DROP TABLE IF EXISTS `form110_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `form110_detalle` (
  `id_form110_detalle` int(11) NOT NULL,
  `id_form110` int(11) DEFAULT NULL,
  `id_factura` int(11) DEFAULT NULL,
  `validado` varchar(2) DEFAULT 'NO',
  PRIMARY KEY (`id_form110_detalle`),
  KEY `id_form110_idx` (`id_form110`),
  KEY `id_factura_idx` (`id_factura`),
  CONSTRAINT `id_factura` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`),
  CONSTRAINT `id_form110` FOREIGN KEY (`id_form110`) REFERENCES `form110` (`id_form110`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='			';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form110_detalle`
--

LOCK TABLES `form110_detalle` WRITE;
/*!40000 ALTER TABLE `form110_detalle` DISABLE KEYS */;
INSERT INTO `form110_detalle` VALUES (1,1,1,'NO'),(2,1,2,'NO');
/*!40000 ALTER TABLE `form110_detalle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-03  1:08:37
