-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: gestion_kaonbi
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `animal`
--

DROP TABLE IF EXISTS `animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `animal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` varchar(10) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `num_chip` varchar(32) DEFAULT NULL,
  `id_madre` int(11) DEFAULT NULL,
  `id_padre` int(11) DEFAULT NULL,
  `fecha_fallecimiento` date DEFAULT NULL,
  `castrado` varchar(10) DEFAULT NULL,
  `id_tipo_animal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `animal_FK` (`id_tipo_animal`),
  KEY `animal_FK_1` (`id_madre`),
  KEY `animal_FK_2` (`id_padre`),
  CONSTRAINT `animal_FK` FOREIGN KEY (`id_tipo_animal`) REFERENCES `tipo_animal` (`id`),
  CONSTRAINT `animal_FK_1` FOREIGN KEY (`id_madre`) REFERENCES `animal` (`id`),
  CONSTRAINT `animal_FK_2` FOREIGN KEY (`id_padre`) REFERENCES `animal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal`
--

LOCK TABLES `animal` WRITE;
/*!40000 ALTER TABLE `animal` DISABLE KEYS */;
INSERT INTO `animal` VALUES (16,'Lola','2016-12-14','Hembra','Canela','227581480756219',NULL,NULL,NULL,'NO',1),(17,'Kiki','2016-04-10','Macho','Negro-Blanco','587027834700361',NULL,NULL,'2019-04-10','SI',1),(18,'Thor','2016-06-02','Hembra','Marron','014526520405349',NULL,NULL,NULL,'NO',1),(19,'Lai','2017-01-25','Macho','Blanco','751845095713048',NULL,NULL,'2021-01-25','NO',1),(20,'Toby','2018-12-14','Hembra','Canela','537227173644679',NULL,NULL,NULL,'NO',1),(21,'Max','2018-04-10','Macho','Negro-Blanco','611780435286747',NULL,NULL,NULL,'SI',1),(22,'Pancho','2018-06-02','Hembra','Marron','230518170899840',NULL,NULL,NULL,'NO',1),(23,'Jack','2019-01-25','Macho','Blanco','521127693042399',NULL,NULL,'2023-01-25','NO',1),(24,'Zeus','2019-12-14','Hembra','Canela','369819731027384',NULL,NULL,NULL,'NO',1),(25,'Firulais','2019-04-10','Macho','Negro-Blanco','073708859041246',NULL,NULL,NULL,'SI',1),(26,'Komotu','2020-06-02','Hembra','Marron','031870570050819',NULL,NULL,NULL,'NO',1),(27,'Coco','2020-01-25','Macho','Blanco','072943491613401',NULL,NULL,NULL,'NO',1),(28,'Coqui','2020-12-14','Hembra','Canela','269213667264529',NULL,NULL,NULL,'NO',1),(29,'Chispa','2021-04-10','Macho','Negro-Blanco','645870164493094',NULL,NULL,NULL,'SI',1),(30,'Kaco','2021-06-02','Hembra','Marron','737796511006027',NULL,NULL,NULL,'NO',1),(31,'Sua','2021-01-25','Macho','Blanco','929952879069349',16,17,NULL,'NO',1),(32,'Pongo','2022-12-14','Hembra','Canela','828261851985158',NULL,NULL,NULL,'NO',1),(33,'Golfo','2022-04-10','Macho','Negro-Blanco','548117695361358',NULL,NULL,NULL,'SI',1),(34,'Bruno','2022-06-02','Hembra','Marron','587633489936962',NULL,NULL,NULL,'NO',1),(35,'Rex','2023-01-25','Macho','Blanco','002594568523219',25,26,NULL,'NO',1);
/*!40000 ALTER TABLE `animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animal_contrae_enfermedad`
--

DROP TABLE IF EXISTS `animal_contrae_enfermedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `animal_contrae_enfermedad` (
  `id` int(11) DEFAULT NULL,
  `id_enfermedad` int(11) DEFAULT NULL,
  `id_animal` int(11) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  KEY `animal_contrae_enfermedad_FK` (`id_animal`),
  KEY `animal_contrae_enfermedad_FK_1` (`id_enfermedad`),
  CONSTRAINT `animal_contrae_enfermedad_FK` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id`),
  CONSTRAINT `animal_contrae_enfermedad_FK_1` FOREIGN KEY (`id_enfermedad`) REFERENCES `enfermedad` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal_contrae_enfermedad`
--

LOCK TABLES `animal_contrae_enfermedad` WRITE;
/*!40000 ALTER TABLE `animal_contrae_enfermedad` DISABLE KEYS */;
INSERT INTO `animal_contrae_enfermedad` VALUES (1,7,18,'2023-05-16','2023-05-23','Rapida sanacion'),(2,8,17,'2022-03-17','2022-03-24','Rapida sanacion'),(2,8,17,'2022-03-17','2022-03-24','Rapida sanacion'),(4,9,18,'2022-11-13','2022-11-20','Rapida sanacion'),(1,7,18,'2023-05-16','2023-05-23','Rapida sanacion'),(6,10,19,'2021-05-14','2021-05-21','Rapida sanacion'),(7,11,19,'2021-06-18','2021-06-25','Rapida sanacion'),(7,11,19,'2021-06-18','2021-06-25','Rapida sanacion'),(9,12,21,'2023-04-21','2023-04-28','Rapida sanacion'),(10,13,22,'2023-10-16','2023-10-23','Rapida sanacion'),(11,14,23,'2021-06-15','2021-06-22','Rapida sanacion'),(12,15,23,'2022-10-23','2022-10-30','Rapida sanacion'),(13,16,16,'2022-08-28','2022-09-04','Rapida sanacion'),(14,17,16,'2021-09-30','2021-10-07','Rapida sanacion'),(15,18,16,'2021-03-21','2021-03-28','Rapida sanacion'),(1,7,18,'2023-05-16','2023-05-23','Rapida sanacion'),(2,8,17,'2022-03-17','2022-03-24','Rapida sanacion'),(4,9,18,'2022-11-13','2022-11-20','Rapida sanacion'),(9,12,21,'2023-04-21','2023-04-28','Rapida sanacion'),(10,13,22,'2023-10-16','2023-10-23','Rapida sanacion'),(15,18,16,'2021-03-21','2021-03-28','Rapida sanacion'),(22,20,16,'2021-04-03','2021-04-10','Rapida sanacion'),(11,14,23,'2021-06-15','2021-06-22','Rapida sanacion'),(10,13,22,'2023-10-16','2023-10-23','Rapida sanacion'),(25,24,16,'2022-12-11','2022-12-18','Rapida sanacion'),(25,24,16,'2022-12-11','2022-12-18','Rapida sanacion'),(25,24,16,'2022-12-11','2022-12-18','Rapida sanacion'),(10,13,22,'2023-10-16','2023-10-23','Rapida sanacion'),(12,15,23,'2022-10-23','2022-10-30','Rapida sanacion'),(30,21,16,'2021-09-03','2021-09-10','Rapida sanacion'),(30,21,16,'2021-09-03','2021-09-10','Rapida sanacion'),(22,20,16,'2021-04-03','2021-04-10','Rapida sanacion'),(33,19,16,'2023-03-08','2023-03-15','Rapida sanacion'),(15,18,16,'2021-03-21','2021-03-28','Rapida sanacion'),(14,17,16,'2021-09-30','2021-10-07','Rapida sanacion'),(6,10,19,'2021-05-14','2021-05-21','Rapida sanacion'),(7,11,19,'2021-06-18','2021-06-25','Rapida sanacion'),(1,7,18,'2023-05-16','2023-05-23','Rapida sanacion'),(2,8,17,'2022-03-17','2022-03-24','Rapida sanacion'),(4,9,18,'2022-11-13','2022-11-20','Rapida sanacion');
/*!40000 ALTER TABLE `animal_contrae_enfermedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colaborador`
--

DROP TABLE IF EXISTS `colaborador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colaborador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(9) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido1` varchar(30) NOT NULL,
  `apellido2` varchar(30) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `cuidad` varchar(30) NOT NULL,
  `cp` int(11) NOT NULL,
  `piso` varchar(10) NOT NULL,
  `portal` int(11) NOT NULL,
  `calle` varchar(30) DEFAULT NULL,
  `nif_empresa` varchar(9) DEFAULT NULL,
  `nombre_empresa` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaborador`
--

LOCK TABLES `colaborador` WRITE;
/*!40000 ALTER TABLE `colaborador` DISABLE KEYS */;
INSERT INTO `colaborador` VALUES (1,'','Kaonbi','','','2020-01-01','Arrasate',20500,'',0,'','',''),(2,'66773039Z','Iker','Jimenez','Arteaga','1992-05-13','Arrasate',20500,'8',43,'Aldai Kalea','',''),(3,'58759621A','Ane','Goikoetxea','Ariza','1954-07-25','Arrasate',20500,'2',2,'Aldaigain Kalea','',''),(4,'57833616R','Ander','Rodriguez','Moyúa','1976-04-04','Arrasate',20500,'Bajo',14,'Plaza Alfonso X Jakintsua','',''),(5,'38431020K','Jon','Diaz','Ibarra','1986-01-11','Arrasate',20500,'4',29,'Alfontso Viii Kalea','',''),(6,'50459124E','Peru','Martin','Areizaga ','1975-08-22','Arrasate',20500,'3',18,'Altamirazpi Kalea','',''),(7,'36025128K','Maria','Iglesias','Aguirre','1953-09-25','Arrasate',20500,'2',27,'Anboto Kalea','',''),(8,'90456923Q','Jesus','De La Torre','Barrenetxea','1959-08-20','Arrasate',20500,'3',3,'Andaluzia Kalea','',''),(9,'35944345Z','Sira','Merino','Corral ','2004-04-08','Arrasate',20500,'Bajo',23,'Antso Abarka Kalea','',''),(10,'43147089D','Markel','Elorrio','Álava ','1945-11-08','Arrasate',20500,'1',6,'Aprendices Kalea','',''),(11,'62278560B','Martin','Sagasti','Lili ','1970-03-03','Arrasate',20500,'2',8,'Araba Etorbidea','',''),(12,'94228950C','Gorka','Legarain','Esquivel','1963-01-07','Arrasate',20500,'7',9,'Aragoa Kalea','',''),(13,'01154047E','Iñaki','Zuloaga','Mata Linares ','1985-02-20','Arrasate',20500,'4',3,'Aramaio Kalea','',''),(14,'67870592F','Carmen','San Diego','Urbina','1983-04-20','Arrasate',20500,'1',5,'Plaza Arimazubi Plaza','',''),(15,'22693985T','Eider','Blazquez','Fernández','1966-06-11','Arrasate',20500,'Bajo',33,'Arrasate Pasealekua','',''),(16,'61189161F','Nora','Blazquez','González','1996-02-25','Arrasate',20500,'3',23,'Arruena Parkea','',''),(17,'16494186N','Matxin','Bermejo','Rodríguez','1967-04-06','Arrasate',20500,'4',12,'Azeri KaleaAzoka Kalea','',''),(18,'30838408P','Leire','Etxeluze','Martínez','2004-01-04','Arrasate',20500,'1',11,'Bidekurtzeta Kalea','',''),(19,'64547522T','Urko','Gorrotxategi','García ','1987-01-26','Arrasate',20500,'2',7,'Biteri Etorbidea','',''),(20,'65688327M','Carlos','Mikeo','Mazarredo ','1994-06-07','Arrasate',20500,'5',9,'Bizkaia Etorbidea','','');
/*!40000 ALTER TABLE `colaborador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colaborador_acoge_animal`
--

DROP TABLE IF EXISTS `colaborador_acoge_animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colaborador_acoge_animal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `id_colaborador` int(11) NOT NULL,
  `id_animal` int(11) NOT NULL,
  `motivo_acogida` varchar(25) NOT NULL,
  `fecha_fin_real` date DEFAULT NULL,
  `id_tipo_acogida` int(11) DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `colaborador_acoge_animal_FK` (`id_animal`),
  KEY `colaborador_acoge_animal_FK_1` (`id_tipo_acogida`),
  KEY `colaborador_acoge_animal_FK_2` (`id_colaborador`),
  CONSTRAINT `colaborador_acoge_animal_FK` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id`),
  CONSTRAINT `colaborador_acoge_animal_FK_1` FOREIGN KEY (`id_tipo_acogida`) REFERENCES `tipo_acogida` (`id`),
  CONSTRAINT `colaborador_acoge_animal_FK_2` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaborador_acoge_animal`
--

LOCK TABLES `colaborador_acoge_animal` WRITE;
/*!40000 ALTER TABLE `colaborador_acoge_animal` DISABLE KEYS */;
INSERT INTO `colaborador_acoge_animal` VALUES (3,'2021-05-04','2021-07-14',6,16,'Cuidados hasta adopcion','2021-07-14',2,NULL),(4,'2021-06-04','2021-07-14',15,18,'Cuidados hasta adopcion',NULL,2,NULL),(5,'2021-09-04','2021-10-14',5,21,'Cuidados por enfermedad',NULL,1,NULL),(6,'2021-10-04','2021-11-14',16,26,'Cuidados por enfermedad',NULL,1,NULL),(7,'2021-05-04','2021-07-14',18,24,'Cuidados hasta adopcion',NULL,2,NULL),(8,'2021-05-04','2021-07-14',2,30,'Cuidados por enfermedad',NULL,1,NULL),(9,'2021-05-04','2021-07-14',5,23,'Cuidados por enfermedad',NULL,1,NULL),(10,'2021-05-04','2021-07-14',16,31,'Cuidados hasta adopcion',NULL,2,NULL),(13,'2021-05-04','2021-07-14',17,32,'Cuidados por enfermedad',NULL,1,NULL),(14,'2021-05-04','2021-07-14',20,25,'Cuidados por enfermedad',NULL,1,NULL),(15,'2021-05-04','2021-07-14',11,17,'Cuidados hasta adopcion',NULL,2,NULL);
/*!40000 ALTER TABLE `colaborador_acoge_animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colaborador_adopta_animal`
--

DROP TABLE IF EXISTS `colaborador_adopta_animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colaborador_adopta_animal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_adopción` date NOT NULL,
  `id_colaborador` int(11) NOT NULL,
  `id_animal` int(11) NOT NULL,
  `observaciones` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `colaborador_adopta_animal_FK` (`id_animal`),
  KEY `colaborador_adopta_animal_FK_1` (`id_colaborador`),
  CONSTRAINT `colaborador_adopta_animal_FK` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id`),
  CONSTRAINT `colaborador_adopta_animal_FK_1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaborador_adopta_animal`
--

LOCK TABLES `colaborador_adopta_animal` WRITE;
/*!40000 ALTER TABLE `colaborador_adopta_animal` DISABLE KEYS */;
INSERT INTO `colaborador_adopta_animal` VALUES (1,'2021-04-05',2,30,'En piso'),(2,'2021-07-25',3,31,'En piso'),(3,'2022-04-05',16,32,'Caserio'),(4,'2022-04-05',19,33,'Chalet'),(5,'2023-07-14',20,34,'En piso'),(6,'2023-11-05',10,35,'Caserio');
/*!40000 ALTER TABLE `colaborador_adopta_animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colaborador_apadrina_animal`
--

DROP TABLE IF EXISTS `colaborador_apadrina_animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colaborador_apadrina_animal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `id_colaborador` int(11) DEFAULT NULL,
  `id_animal` int(11) DEFAULT NULL,
  `cuota_mensual` int(11) DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `colaborador_apadrina_animal_FK` (`id_animal`),
  KEY `colaborador_apadrina_animal_FK_1` (`id_colaborador`),
  CONSTRAINT `colaborador_apadrina_animal_FK` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id`),
  CONSTRAINT `colaborador_apadrina_animal_FK_1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaborador_apadrina_animal`
--

LOCK TABLES `colaborador_apadrina_animal` WRITE;
/*!40000 ALTER TABLE `colaborador_apadrina_animal` DISABLE KEYS */;
INSERT INTO `colaborador_apadrina_animal` VALUES (1,'2021-01-01','2025-12-31',2,20,12,'Cargo en cuenta mensual'),(2,'2021-01-01','2026-12-31',5,24,12,'Cargo en cuenta mensual'),(4,'2021-01-01','2025-12-31',6,25,12,'Cargo en cuenta mensual'),(5,'2021-01-01','2024-12-31',7,27,12,'Cargo en cuenta mensual'),(6,'2021-01-01','2023-12-31',12,21,12,'Cargo en cuenta mensual');
/*!40000 ALTER TABLE `colaborador_apadrina_animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colaborador_entrega_animal`
--

DROP TABLE IF EXISTS `colaborador_entrega_animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colaborador_entrega_animal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_entrega` date DEFAULT NULL,
  `motivo_entrega` text DEFAULT NULL,
  `id_colaborador` int(11) NOT NULL,
  `id_animal` int(11) NOT NULL,
  `observaciones` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `colaborador_entrega_animal_FK` (`id_colaborador`),
  KEY `colaborador_entrega_animal_FK_1` (`id_animal`),
  CONSTRAINT `colaborador_entrega_animal_FK` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`),
  CONSTRAINT `colaborador_entrega_animal_FK_1` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaborador_entrega_animal`
--

LOCK TABLES `colaborador_entrega_animal` WRITE;
/*!40000 ALTER TABLE `colaborador_entrega_animal` DISABLE KEYS */;
INSERT INTO `colaborador_entrega_animal` VALUES (1,'2016-12-14','Posible abandono',1,16,'Desparasitacion interna y externa necesaria'),(2,'2016-04-10','Posible abandono',1,17,'Desparasitacion interna y externa necesaria'),(3,'2016-06-02','Posible abandono',1,18,'Desparasitacion interna y externa necesaria'),(4,'2017-01-25','Gato silvestre',10,19,'Desparasitacion interna y externa necesaria'),(5,'2018-12-14','Posible abandono',1,20,'Desparasitacion interna y externa necesaria'),(6,'2018-04-10','Posible abandono',10,21,'Desparasitacion interna y externa necesaria'),(7,'2018-06-02','Gato silvestre',10,22,'Desparasitacion interna y externa necesaria'),(8,'2019-01-25','Posible abandono',1,23,'Desparasitacion interna y externa necesaria'),(9,'2019-12-14','Posible abandono',19,24,'Desparasitacion interna y externa necesaria'),(10,'2019-04-10','Posible abandono',19,25,'Desparasitacion interna y externa necesaria'),(11,'2020-06-02','Gato silvestre',1,26,'Desparasitacion interna y externa necesaria'),(12,'2020-01-25','Gato silvestre',1,27,'Desparasitacion interna y externa necesaria'),(13,'2020-12-14','Posible abandono',1,28,'Desparasitacion interna y externa necesaria'),(14,'2021-04-10','Posible abandono',19,29,'Desparasitacion interna y externa necesaria'),(15,'2021-06-02','Posible abandono',10,30,'Desparasitacion interna y externa necesaria'),(16,'2021-01-25','Gato silvestre',1,32,'Desparasitacion interna y externa necesaria'),(17,'2022-12-14','Gato silvestre',10,32,'Desparasitacion interna y externa necesaria'),(18,'2022-04-10','Gato silvestre',19,33,'Desparasitacion interna y externa necesaria'),(19,'2022-06-02','Posible abandono',1,34,'Desparasitacion interna y externa necesaria'),(20,'2023-01-25','Posible abandono',19,35,'Desparasitacion interna y externa necesaria');
/*!40000 ALTER TABLE `colaborador_entrega_animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colaborador_ingresa_cuenta`
--

DROP TABLE IF EXISTS `colaborador_ingresa_cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `colaborador_ingresa_cuenta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_colaborador` int(11) DEFAULT NULL,
  `id_tipo_ingreso` int(11) DEFAULT NULL,
  `id_cuenta` int(11) DEFAULT NULL,
  `cantidad` float DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `colaborador_ingresa_cuenta_FK` (`id_colaborador`),
  KEY `colaborador_ingresa_cuenta_FK_1` (`id_cuenta`),
  KEY `colaborador_ingresa_cuenta_FK_2` (`id_tipo_ingreso`),
  CONSTRAINT `colaborador_ingresa_cuenta_FK` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`),
  CONSTRAINT `colaborador_ingresa_cuenta_FK_1` FOREIGN KEY (`id_cuenta`) REFERENCES `cuenta` (`id`),
  CONSTRAINT `colaborador_ingresa_cuenta_FK_2` FOREIGN KEY (`id_tipo_ingreso`) REFERENCES `tipo_ingreso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaborador_ingresa_cuenta`
--

LOCK TABLES `colaborador_ingresa_cuenta` WRITE;
/*!40000 ALTER TABLE `colaborador_ingresa_cuenta` DISABLE KEYS */;
INSERT INTO `colaborador_ingresa_cuenta` VALUES (1,2,1,2,50,'Bizum'),(2,5,1,2,50,'Bizum'),(3,4,1,2,20,'Bizum'),(4,7,1,2,100,'Bizum'),(5,12,1,2,50,'Bizum'),(6,2,1,2,50,'Bizum'),(7,19,1,2,50,'Bizum'),(8,5,1,2,100,'Bizum'),(9,3,1,2,300,'Bizum'),(10,8,1,2,100,'Bizum'),(11,10,1,2,20,'Bizum'),(12,12,1,2,50,'Bizum'),(13,11,1,2,100,'Bizum'),(14,7,1,2,300,'Bizum'),(15,17,1,2,100,'Bizum'),(16,18,1,2,20,'Bizum'),(17,10,1,2,50,'Bizum'),(18,14,1,2,100,'Bizum'),(19,3,1,2,100,'Bizum'),(20,4,1,2,300,'Bizum'),(21,5,1,2,100,'Bizum'),(22,6,1,2,100,'Bizum'),(23,7,1,2,50,'Bizum'),(24,8,1,2,50,'Bizum'),(25,9,1,2,100,'Bizum'),(26,10,1,2,300,'Bizum'),(27,11,1,2,50,'Bizum'),(28,12,1,2,50,'Bizum'),(29,13,1,2,100,'Bizum'),(30,14,1,2,100,'Bizum'),(31,15,1,2,300,'Bizum'),(32,16,1,2,100,'Bizum'),(33,17,1,2,10,'Bizum'),(34,18,1,2,100,'Bizum'),(35,19,1,2,50,'Bizum'),(36,12,1,2,100,'Bizum'),(37,7,1,2,10,'Bizum'),(38,6,1,2,100,'Bizum'),(39,13,1,2,50,'Bizum'),(40,17,1,2,10,'Bizum'),(41,2,1,3,12,'Cargo en cuenta'),(42,5,1,3,12,'Cargo en cuenta'),(43,6,1,3,12,'Cargo en cuenta'),(44,7,1,3,12,'Cargo en cuenta'),(45,12,1,3,12,'Cargo en cuenta'),(46,2,1,3,12,'Cargo en cuenta'),(47,5,1,3,12,'Cargo en cuenta'),(48,6,1,3,12,'Cargo en cuenta'),(49,7,1,3,12,'Cargo en cuenta'),(50,12,1,3,12,'Cargo en cuenta'),(51,2,1,3,12,'Cargo en cuenta'),(52,5,1,3,12,'Cargo en cuenta'),(53,6,1,3,12,'Cargo en cuenta'),(54,7,1,3,12,'Cargo en cuenta'),(55,12,1,3,12,'Cargo en cuenta'),(56,2,1,3,12,'Cargo en cuenta'),(57,5,1,3,12,'Cargo en cuenta'),(58,6,1,3,12,'Cargo en cuenta'),(59,7,1,3,12,'Cargo en cuenta'),(60,12,1,3,12,'Cargo en cuenta'),(61,2,1,3,12,'Cargo en cuenta'),(62,5,1,3,12,'Cargo en cuenta'),(63,6,1,3,12,'Cargo en cuenta'),(64,7,1,3,12,'Cargo en cuenta'),(65,12,1,3,12,'Cargo en cuenta'),(66,2,1,3,12,'Cargo en cuenta'),(67,5,1,3,12,'Cargo en cuenta'),(68,6,1,3,12,'Cargo en cuenta'),(69,7,1,3,12,'Cargo en cuenta'),(70,12,1,3,12,'Cargo en cuenta'),(71,2,1,3,12,'Cargo en cuenta'),(72,5,1,3,12,'Cargo en cuenta'),(73,6,1,3,12,'Cargo en cuenta'),(74,7,1,3,12,'Cargo en cuenta'),(75,12,1,3,12,'Cargo en cuenta'),(76,2,1,3,12,'Cargo en cuenta'),(77,5,1,3,12,'Cargo en cuenta'),(78,6,1,3,12,'Cargo en cuenta'),(79,7,1,3,12,'Cargo en cuenta'),(80,12,1,3,12,'Cargo en cuenta'),(81,2,1,3,12,'Cargo en cuenta'),(82,5,1,3,12,'Cargo en cuenta'),(83,6,1,3,12,'Cargo en cuenta'),(84,7,1,3,12,'Cargo en cuenta'),(85,12,1,3,12,'Cargo en cuenta'),(86,2,1,3,12,'Cargo en cuenta'),(87,5,1,3,12,'Cargo en cuenta'),(88,6,1,3,12,'Cargo en cuenta'),(89,7,1,3,12,'Cargo en cuenta'),(90,12,1,3,12,'Cargo en cuenta'),(91,2,1,3,12,'Cargo en cuenta'),(92,5,1,3,12,'Cargo en cuenta'),(93,6,1,3,12,'Cargo en cuenta'),(94,7,1,3,12,'Cargo en cuenta'),(95,12,1,3,12,'Cargo en cuenta'),(96,2,1,3,12,'Cargo en cuenta'),(97,5,1,3,12,'Cargo en cuenta'),(98,6,1,3,12,'Cargo en cuenta'),(99,7,1,3,12,'Cargo en cuenta'),(100,12,1,3,12,'Cargo en cuenta'),(101,2,1,3,12,'Cargo en cuenta'),(102,5,1,3,12,'Cargo en cuenta'),(103,6,1,3,12,'Cargo en cuenta'),(104,7,1,3,12,'Cargo en cuenta'),(105,12,1,3,12,'Cargo en cuenta'),(106,2,1,3,12,'Cargo en cuenta'),(107,5,1,3,12,'Cargo en cuenta'),(108,6,1,3,12,'Cargo en cuenta'),(109,7,1,3,12,'Cargo en cuenta'),(110,12,1,3,12,'Cargo en cuenta'),(111,2,1,3,12,'Cargo en cuenta'),(112,5,1,3,12,'Cargo en cuenta'),(113,6,1,3,12,'Cargo en cuenta'),(114,7,1,3,12,'Cargo en cuenta'),(115,12,1,3,12,'Cargo en cuenta'),(116,2,1,3,12,'Cargo en cuenta'),(117,5,1,3,12,'Cargo en cuenta'),(118,6,1,3,12,'Cargo en cuenta'),(119,7,1,3,12,'Cargo en cuenta'),(120,12,1,3,12,'Cargo en cuenta'),(121,2,1,3,12,'Cargo en cuenta'),(122,5,1,3,12,'Cargo en cuenta'),(123,6,1,3,12,'Cargo en cuenta'),(124,7,1,3,12,'Cargo en cuenta'),(125,12,1,3,12,'Cargo en cuenta'),(126,2,1,3,12,'Cargo en cuenta'),(127,5,1,3,12,'Cargo en cuenta'),(128,6,1,3,12,'Cargo en cuenta'),(129,7,1,3,12,'Cargo en cuenta'),(130,12,1,3,12,'Cargo en cuenta'),(131,2,1,3,12,'Cargo en cuenta'),(132,5,1,3,12,'Cargo en cuenta'),(133,6,1,3,12,'Cargo en cuenta'),(134,7,1,3,12,'Cargo en cuenta'),(135,12,1,3,12,'Cargo en cuenta'),(136,2,1,3,12,'Cargo en cuenta'),(137,5,1,3,12,'Cargo en cuenta'),(138,6,1,3,12,'Cargo en cuenta'),(139,7,1,3,12,'Cargo en cuenta'),(140,12,1,3,12,'Cargo en cuenta'),(141,2,1,3,12,'Cargo en cuenta'),(142,5,1,3,12,'Cargo en cuenta'),(143,6,1,3,12,'Cargo en cuenta'),(144,7,1,3,12,'Cargo en cuenta'),(145,12,1,3,12,'Cargo en cuenta'),(146,2,1,3,12,'Cargo en cuenta'),(147,5,1,3,12,'Cargo en cuenta'),(148,6,1,3,12,'Cargo en cuenta'),(149,7,1,3,12,'Cargo en cuenta'),(150,12,1,3,12,'Cargo en cuenta'),(151,2,1,3,12,'Cargo en cuenta'),(152,5,1,3,12,'Cargo en cuenta'),(153,6,1,3,12,'Cargo en cuenta'),(154,7,1,3,12,'Cargo en cuenta'),(155,12,1,3,12,'Cargo en cuenta');
/*!40000 ALTER TABLE `colaborador_ingresa_cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuenta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `iban` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
INSERT INTO `cuenta` VALUES (1,'Primaria','ES0823090780783703988778'),(2,'Donaciones','ES0823090780783703985473'),(3,'Padrinos','ES0823090780783703789768');
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta_compra_recursos`
--

DROP TABLE IF EXISTS `cuenta_compra_recursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuenta_compra_recursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cuenta` int(11) DEFAULT NULL,
  `id_recursos` int(11) DEFAULT NULL,
  `cantidad` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cuenta_compra_recursos_FK` (`id_cuenta`),
  KEY `cuenta_compra_recursos_FK_1` (`id_recursos`),
  CONSTRAINT `cuenta_compra_recursos_FK` FOREIGN KEY (`id_cuenta`) REFERENCES `cuenta` (`id`),
  CONSTRAINT `cuenta_compra_recursos_FK_1` FOREIGN KEY (`id_recursos`) REFERENCES `recurso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta_compra_recursos`
--

LOCK TABLES `cuenta_compra_recursos` WRITE;
/*!40000 ALTER TABLE `cuenta_compra_recursos` DISABLE KEYS */;
INSERT INTO `cuenta_compra_recursos` VALUES (1,1,1,1),(3,1,3,1);
/*!40000 ALTER TABLE `cuenta_compra_recursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermedad`
--

DROP TABLE IF EXISTS `enfermedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enfermedad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermedad`
--

LOCK TABLES `enfermedad` WRITE;
/*!40000 ALTER TABLE `enfermedad` DISABLE KEYS */;
INSERT INTO `enfermedad` VALUES (7,'Brucelosis'),(8,'Carbunco bacteridiano'),(9,'Encefalopatías'),(10,'Espongiformes'),(11,'Transmisibles'),(12,'Enfermedad hemorrágica epizoótica'),(13,'Equinococosis'),(14,'Estomatitis vesicular'),(15,'Fiebre Aftosa'),(16,'Fiebre Hemorrágica Crimea-Congo'),(17,'Fiebre del Oeste del Nilo'),(18,'Fiebre Q'),(19,'Fiebre del Valle del Rift'),(20,'Lengua Azul'),(21,'Rabia'),(22,'Salmonella'),(23,'Triquina'),(24,'Tuberculosis');
/*!40000 ALTER TABLE `enfermedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recurso`
--

DROP TABLE IF EXISTS `recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recurso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) NOT NULL,
  `id_tipo_recurso` int(11) NOT NULL,
  `id_colaborador` int(11) NOT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recurso_FK` (`id_tipo_recurso`),
  KEY `recurso_FK_1` (`id_colaborador`),
  CONSTRAINT `recurso_FK` FOREIGN KEY (`id_tipo_recurso`) REFERENCES `tipo_recurso` (`id`),
  CONSTRAINT `recurso_FK_1` FOREIGN KEY (`id_colaborador`) REFERENCES `colaborador` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recurso`
--

LOCK TABLES `recurso` WRITE;
/*!40000 ALTER TABLE `recurso` DISABLE KEYS */;
INSERT INTO `recurso` VALUES (1,1,1,1,NULL,NULL),(3,1,2,1,NULL,NULL),(4,1,3,7,NULL,NULL),(5,1,4,9,NULL,NULL),(6,1,5,11,NULL,NULL);
/*!40000 ALTER TABLE `recurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_acogida`
--

DROP TABLE IF EXISTS `tipo_acogida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_acogida` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_acogida`
--

LOCK TABLES `tipo_acogida` WRITE;
/*!40000 ALTER TABLE `tipo_acogida` DISABLE KEYS */;
INSERT INTO `tipo_acogida` VALUES (1,'Temporal'),(2,'Hasta adopcion');
/*!40000 ALTER TABLE `tipo_acogida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_animal`
--

DROP TABLE IF EXISTS `tipo_animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_animal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_animal`
--

LOCK TABLES `tipo_animal` WRITE;
/*!40000 ALTER TABLE `tipo_animal` DISABLE KEYS */;
INSERT INTO `tipo_animal` VALUES (1,'Gato'),(2,'Perro'),(3,'Ave'),(4,'Reptil');
/*!40000 ALTER TABLE `tipo_animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_ingreso`
--

DROP TABLE IF EXISTS `tipo_ingreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_ingreso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_ingreso`
--

LOCK TABLES `tipo_ingreso` WRITE;
/*!40000 ALTER TABLE `tipo_ingreso` DISABLE KEYS */;
INSERT INTO `tipo_ingreso` VALUES (1,'Monetario');
/*!40000 ALTER TABLE `tipo_ingreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_recurso`
--

DROP TABLE IF EXISTS `tipo_recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_recurso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_recurso`
--

LOCK TABLES `tipo_recurso` WRITE;
/*!40000 ALTER TABLE `tipo_recurso` DISABLE KEYS */;
INSERT INTO `tipo_recurso` VALUES (1,'Transportin'),(2,'Manta'),(3,'Lata de comida'),(4,'Comedero'),(5,'Juguete'),(6,'Saco pienso 1kg'),(7,'Saco pienso 2kg'),(8,'Saco pienso 3kg'),(9,'Saco pienso 5kg'),(10,'Saco pienso 10kg'),(11,'Jaula');
/*!40000 ALTER TABLE `tipo_recurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tratamiento`
--

DROP TABLE IF EXISTS `tratamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tratamiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_animal` int(11) DEFAULT NULL,
  `fecha_Inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `causa` text DEFAULT NULL,
  `tratamiento` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tratamiento_FK` (`id_animal`),
  CONSTRAINT `tratamiento_FK` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratamiento`
--

LOCK TABLES `tratamiento` WRITE;
/*!40000 ALTER TABLE `tratamiento` DISABLE KEYS */;
INSERT INTO `tratamiento` VALUES (8,16,'2022-02-17','2023-02-27','Eficaz, rapida sanacion','Golpe','Ibuprofeno'),(9,17,'2022-12-27',NULL,'Eficaz, rapida sanacion','Golpe','Ibuprofeno'),(10,18,'2023-05-16','2023-05-23','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(11,17,'2022-03-17','2022-03-24','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(12,17,'2022-03-17','2022-03-24','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(13,18,'2022-11-13','2022-11-20','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(14,18,'2023-05-16','2023-05-23','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(15,19,'2021-05-14','2021-05-21','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(16,19,'2021-06-18','2021-06-25','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(17,19,'2021-06-18','2021-06-25','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(18,21,'2023-04-21','2023-04-28','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(19,22,'2023-10-16','2023-10-23','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(20,23,'2021-06-15','2021-06-22','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(21,23,'2022-10-23','2022-10-30','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(22,16,'2022-08-28','2022-09-04','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(23,16,'2021-09-30','2021-10-07','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(24,16,'2021-03-21','2021-03-28','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(25,18,'2023-05-16','2023-05-23','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(26,17,'2022-03-17','2022-03-24','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(27,18,'2022-11-13','2022-11-20','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(28,21,'2023-04-21','2023-04-28','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(29,22,'2023-10-16','2023-10-23','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(30,16,'2021-03-21','2021-03-28','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(31,16,'2021-04-03','2021-04-10','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(32,23,'2021-06-15','2021-06-22','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(33,22,'2023-10-16','2023-10-23','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(34,16,'2022-12-11','2022-12-18','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(35,16,'2022-12-11','2022-12-18','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(36,16,'2022-12-11','2022-12-18','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(37,22,'2023-10-16','2023-10-23','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(38,23,'2022-10-23','2022-10-30','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(39,16,'2021-09-03','2021-09-10','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(40,16,'2021-09-03','2021-09-10','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(41,16,'2021-04-03','2021-04-10','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(42,16,'2023-03-08','2023-03-15','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(43,16,'2021-03-21','2021-03-28','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(44,16,'2021-09-30','2021-10-07','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(45,19,'2021-05-14','2021-05-21','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(46,19,'2021-06-18','2021-06-25','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(47,18,'2023-05-16','2023-05-23','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(48,17,'2022-03-17','2022-03-24','Rapida sanacion','Atropello','Inmovilizar y analgesico'),(49,18,'2022-11-13','2022-11-20','Rapida sanacion','Atropello','Inmovilizar y analgesico');
/*!40000 ALTER TABLE `tratamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin','21232f297a57a5a743894a0e4a801fc3',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'gestion_kaonbi'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-17 21:49:22

