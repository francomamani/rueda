-- MySQL dump 10.13  Distrib 8.0.18, for linux-glibc2.12 (x86_64)
--
-- Host: localhost    Database: ruedabioseguridad
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `agendas`
--

DROP TABLE IF EXISTS `agendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agendas` (
  `agenda_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `empresa_solicitante_id` int(10) unsigned NOT NULL,
  `empresa_demandada_id` int(10) unsigned NOT NULL,
  `horario_id` int(10) unsigned NOT NULL,
  `mesa_id` int(10) unsigned NOT NULL,
  `estado` enum('aceptado','rechazado','pendiente') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_asignacion` enum('pre_agendado','administracion','cita_de_contingencia') COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`agenda_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendas`
--

LOCK TABLES `agendas` WRITE;
/*!40000 ALTER TABLE `agendas` DISABLE KEYS */;
/*!40000 ALTER TABLE `agendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresas` (
  `empresa_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rubro_id` int(10) unsigned NOT NULL,
  `usuario_id` int(10) unsigned NOT NULL,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pais` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ciudad_localidad` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pagina_web` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `representante_legal` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `habilitado` tinyint(1) NOT NULL DEFAULT '0',
  `max_participantes` int(10) unsigned NOT NULL DEFAULT '2',
  `oferta` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `demanda` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `especial` tinyint(1) NOT NULL DEFAULT '0',
  `voucher` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `con_material` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`empresa_id`),
  KEY `empresas_rubro_id_foreign` (`rubro_id`),
  KEY `empresas_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `empresas_rubro_id_foreign` FOREIGN KEY (`rubro_id`) REFERENCES `rubros` (`rubro_id`) ON DELETE CASCADE,
  CONSTRAINT `empresas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (1,3,2,'Campo Ferial 3 de Julio',NULL,'AV. CIRCUNVALACIÓN Y PROLONGACIÓN ESPAÑA','5266111','Bolivia, Estado Plurinacional de','Oruro','281488020','campoferial3dejulio.com','ROCIO VILLCA QUISPE',0,2,'Otros','Empresas',1,NULL,'si',NULL,'2020-08-31 08:40:36','2020-08-31 12:27:11'),(2,3,5,'CAMPO FERIAL TRES DE JULIO, UNIDAD DESCENTRALIZADA','logos/46AoM7G3jyddEILlyeYf2hsXNwg9CPBT8XqV4rnl.jpeg','ASDF','34343','Bolivia, Estado Plurinacional de','ORURO','123434',NULL,'ASDF',0,2,'ofertas','demandas',0,NULL,'si','2020-08-31 21:22:18','2020-08-31 09:30:23','2020-08-31 21:22:18'),(3,51,6,'GOTASOFT','logos/zWZ17mqPB3U89oR1kcDccDuz8bXC5KfOAoYiXNWW.jpeg','CALLE I','76137653','Bolivia, Estado Plurinacional de','ORURO','7275047016',NULL,'FRANCO JESUS MAMANI POZO',1,2,'ofertas','demandas',0,NULL,'si','2020-08-31 17:12:47','2020-08-31 09:32:44','2020-08-31 17:12:47'),(4,31,8,'COMERCIAL CHARITO SRL',NULL,'CALLE PARI 464','78525277','Bolivia, Estado Plurinacional de','SANTA CRUZ','1012377026',NULL,'JUAN PEREZ',1,2,'ofertas','demandas',0,NULL,'no','2020-09-01 21:03:45','2020-08-31 12:45:16','2020-09-01 21:03:45'),(5,9,9,'UNILEVER ANDINA BOLIVIA S.A.',NULL,'AV. BLANCO GALINDO KM. 10.5 ZONA: IRQUICOLLO','70618539','Bolivia, Estado Plurinacional de','COCHABAMBA','1023225025',NULL,'JUAN PEREZ',1,2,'ofertas','demandas',0,NULL,'no',NULL,'2020-08-31 12:52:00','2020-09-01 15:33:02'),(6,41,10,'COLHER GROUP SRL',NULL,'CIRCUNVALACION','67896616','Bolivia, Estado Plurinacional de','SANTA CRUZ','163328020',NULL,'JUAN PEREZ',1,2,'ofertas','demandas',0,NULL,'no',NULL,'2020-08-31 12:54:34','2020-09-01 15:36:48'),(7,41,11,'NUEVO MILENIO SRL',NULL,'CIRCUNVALACION','69130708','Bolivia, Estado Plurinacional de','ORURO','337088020',NULL,'JUAN PEREZ',1,2,'ofertas','demandas',0,NULL,'no',NULL,'2020-08-31 12:56:37','2020-09-01 15:38:35'),(8,42,12,'GREEN FUTURE',NULL,'SORIA GALVARRO - FORTIN BOQUERON 204','70420677','Bolivia, Estado Plurinacional de','ORURO','3557673010',NULL,'ALEJANDRO RUIZ',1,2,'ofertas','demandas',0,NULL,'no',NULL,'2020-08-31 12:59:30','2020-09-01 15:43:15'),(9,52,13,'SSTYGEB',NULL,'C','72291338','Bolivia, Estado Plurinacional de','O','8009555014',NULL,'JP',1,2,'ofertas','demandas',0,NULL,'no',NULL,'2020-08-31 13:00:48','2020-09-01 15:44:41'),(10,41,14,'REAL REPRESENTACIONES',NULL,'C','76139915','Bolivia, Estado Plurinacional de','O','12',NULL,'JP',1,2,'ofertas','demandas',0,NULL,'no','2020-09-01 21:04:20','2020-08-31 13:03:03','2020-09-01 21:04:20'),(11,41,15,'DONNELMOTORS SRL',NULL,'C','71882845','Bolivia, Estado Plurinacional de','O','12',NULL,'ANTONIO NAVA LOPEZ',1,2,'ofertas','demandas',0,NULL,'no',NULL,'2020-08-31 13:04:38','2020-09-01 15:23:58'),(12,41,16,'IMPORTADORA FARROBOL',NULL,'C','63637261','Bolivia, Estado Plurinacional de','O','1',NULL,'MARGOT FARRO IGNACIO',1,2,'ofertas','demandas',0,NULL,'no',NULL,'2020-08-31 13:06:22','2020-09-01 15:25:30'),(13,41,17,'SIDERURGICA ACERO SRL',NULL,'A','68224683','Bolivia, Estado Plurinacional de','O','12',NULL,'EVA MANRIQUE LIZARAZU',1,2,'ofertas','demandas',0,NULL,'no',NULL,'2020-08-31 13:08:00','2020-09-01 15:27:01'),(14,41,18,'JH7 SERVICIOS INTEGRALES',NULL,'S','67261872','Bolivia, Estado Plurinacional de','Z','1',NULL,'HENRRY EULATE',1,2,'ofertas','demandas',0,NULL,'no',NULL,'2020-08-31 13:09:59','2020-09-01 15:28:15'),(15,9,21,'EMPRESA X CON UN NOMBRE SUPER LARGO','logos/hwjd2rBUtU1bbtDxuWFzUO3o7Gj5H0O2fM98aKFr.png','CALLE I','123456789','Bolivia, Estado Plurinacional de','ORURO','123456789',NULL,'SHIRLEY LOPEZ SANCHEZ',1,2,'ofertas','demandas',0,'vouchers/ZSFRzoC9Yr86c6Hbmctl3TU79NedHO2ehgC4GKXM.jpeg','no','2020-08-31 21:22:33','2020-08-31 16:57:55','2020-08-31 21:22:33'),(16,41,22,'KINESIS TECHNOLOGY SRL',NULL,'AS','69852927','Bolivia, Estado Plurinacional de','A','298750026',NULL,'A',1,2,'ofertas','demandas',0,NULL,'no',NULL,'2020-08-31 21:28:38','2020-09-01 15:47:09'),(17,41,23,'IMAUTO DEALER SRL',NULL,'A','77418614','Bolivia, Estado Plurinacional de','A','310532028',NULL,'A',1,2,'ofertas','demandas',0,NULL,'no',NULL,'2020-08-31 21:30:49','2020-09-01 15:48:20'),(18,41,24,'EPANOR',NULL,'A','69574367','Bolivia, Estado Plurinacional de','A','1',NULL,'PATRICIA ALCOCER TARDIO',1,2,'ofertas','demandas',0,NULL,'no',NULL,'2020-08-31 21:32:56','2020-09-01 15:29:23'),(19,41,25,'COMERCIAL JHON-AYLIN',NULL,'CARO 1087','68351543','Bolivia, Estado Plurinacional de','ORURO','2797256019',NULL,'JHONNY CHOQUE',1,2,'ofertas','demandas',0,NULL,'no',NULL,'2020-09-01 09:30:23','2020-09-01 15:30:31'),(20,41,26,'FB-20',NULL,'A','1','Bolivia, Estado Plurinacional de','O','1',NULL,'SA',1,2,'ofertas','demandas',0,NULL,'no','2020-09-01 21:03:04','2020-09-01 11:23:45','2020-09-01 21:03:04'),(21,41,27,'BUSINESS',NULL,'A','1','Bolivia, Estado Plurinacional de','U','11',NULL,'A',1,2,'ofertas','demandas',0,NULL,'no',NULL,'2020-09-01 22:02:18','2020-09-01 22:02:33');
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluacion_reuniones`
--

DROP TABLE IF EXISTS `evaluacion_reuniones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluacion_reuniones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reunion_id` int(10) unsigned NOT NULL,
  `empresa_id` int(10) unsigned NOT NULL,
  `uno` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dos` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tres` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cuatro` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cinco` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seis` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `siete` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluacion_reuniones_reunion_id_foreign` (`reunion_id`),
  KEY `evaluacion_reuniones_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `evaluacion_reuniones_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`empresa_id`) ON DELETE CASCADE,
  CONSTRAINT `evaluacion_reuniones_reunion_id_foreign` FOREIGN KEY (`reunion_id`) REFERENCES `reuniones` (`reunion_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluacion_reuniones`
--

LOCK TABLES `evaluacion_reuniones` WRITE;
/*!40000 ALTER TABLE `evaluacion_reuniones` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluacion_reuniones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluaciones_generales`
--

DROP TABLE IF EXISTS `evaluaciones_generales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluaciones_generales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` int(10) unsigned NOT NULL,
  `uno` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dos` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tres` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cuatro` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cinco` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seis` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `siete` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ocho` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nueve` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluaciones_generales_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `evaluaciones_generales_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`empresa_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluaciones_generales`
--

LOCK TABLES `evaluaciones_generales` WRITE;
/*!40000 ALTER TABLE `evaluaciones_generales` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluaciones_generales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horarios`
--

DROP TABLE IF EXISTS `horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horarios` (
  `horario_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `inicio` datetime NOT NULL,
  `fin` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`horario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios`
--

LOCK TABLES `horarios` WRITE;
/*!40000 ALTER TABLE `horarios` DISABLE KEYS */;
INSERT INTO `horarios` VALUES (1,'2020-09-02 08:00:00','2020-09-02 10:00:00',NULL,'2020-08-31 09:34:56','2020-08-31 21:35:11'),(2,'2020-09-02 12:00:00','2020-09-02 14:00:00',NULL,'2020-08-31 09:35:28','2020-08-31 21:37:05'),(3,'2020-09-02 18:00:00','2020-09-02 20:00:00',NULL,'2020-08-31 09:35:55','2020-08-31 21:37:40'),(4,'2020-09-02 10:00:00','2020-09-02 12:00:00',NULL,'2020-08-31 21:34:38','2020-08-31 21:34:38'),(5,'2020-09-02 14:00:00','2020-09-02 16:00:00',NULL,'2020-08-31 21:35:46','2020-08-31 21:35:46'),(6,'2020-09-02 16:00:00','2020-09-02 18:00:00',NULL,'2020-08-31 21:36:27','2020-08-31 21:36:27');
/*!40000 ALTER TABLE `horarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horarios_ocupados`
--

DROP TABLE IF EXISTS `horarios_ocupados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horarios_ocupados` (
  `horario_ocupado_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` int(10) unsigned NOT NULL,
  `horario_id` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`horario_ocupado_id`),
  KEY `horarios_ocupados_empresa_id_foreign` (`empresa_id`),
  KEY `horarios_ocupados_horario_id_foreign` (`horario_id`),
  CONSTRAINT `horarios_ocupados_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`empresa_id`) ON DELETE CASCADE,
  CONSTRAINT `horarios_ocupados_horario_id_foreign` FOREIGN KEY (`horario_id`) REFERENCES `horarios` (`horario_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios_ocupados`
--

LOCK TABLES `horarios_ocupados` WRITE;
/*!40000 ALTER TABLE `horarios_ocupados` DISABLE KEYS */;
INSERT INTO `horarios_ocupados` VALUES (1,10,2,'2020-09-01 21:04:20','2020-08-31 13:20:38','2020-09-01 21:04:20'),(2,10,1,'2020-09-01 21:04:20','2020-08-31 13:20:41','2020-09-01 21:04:20'),(3,16,1,NULL,'2020-08-31 21:39:39','2020-08-31 21:39:39'),(4,16,4,NULL,'2020-08-31 21:39:42','2020-08-31 21:39:42'),(5,16,2,NULL,'2020-08-31 21:39:44','2020-08-31 21:39:44'),(6,16,5,'2020-08-31 21:42:21','2020-08-31 21:39:53','2020-08-31 21:42:21'),(7,16,3,NULL,'2020-08-31 21:40:05','2020-08-31 21:40:05'),(8,17,1,NULL,'2020-08-31 21:43:44','2020-08-31 21:43:44'),(9,17,4,NULL,'2020-08-31 21:43:48','2020-08-31 21:43:48'),(10,17,2,NULL,'2020-08-31 21:43:52','2020-08-31 21:43:52'),(11,17,5,NULL,'2020-08-31 21:43:54','2020-08-31 21:43:54'),(12,18,1,NULL,'2020-08-31 21:47:12','2020-08-31 21:47:12'),(13,18,4,NULL,'2020-08-31 21:47:15','2020-08-31 21:47:15'),(14,18,2,NULL,'2020-08-31 21:47:17','2020-08-31 21:47:17'),(15,18,3,NULL,'2020-08-31 21:47:19','2020-08-31 21:47:19'),(16,13,1,NULL,'2020-09-01 21:08:42','2020-09-01 21:11:36'),(17,13,4,NULL,'2020-09-01 21:08:43','2020-09-01 21:11:38'),(18,13,2,NULL,'2020-09-01 21:08:47','2020-09-01 21:11:40'),(19,13,5,NULL,'2020-09-01 21:09:02','2020-09-01 21:11:42');
/*!40000 ALTER TABLE `horarios_ocupados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesas`
--

DROP TABLE IF EXISTS `mesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mesas` (
  `mesa_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `numero` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`mesa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesas`
--

LOCK TABLES `mesas` WRITE;
/*!40000 ALTER TABLE `mesas` DISABLE KEYS */;
INSERT INTO `mesas` VALUES (1,'1','https://us02web.zoom.us/j/82032862707',NULL,'2020-08-31 08:40:36','2020-08-31 13:15:24'),(2,'2','https://us02web.zoom.us/j/83559716197',NULL,'2020-08-31 08:40:36','2020-09-01 20:08:55'),(3,'3','https://us02web.zoom.us/j/85664027356',NULL,'2020-08-31 08:40:36','2020-09-01 20:09:26'),(4,'4','http://ruedabioseguridad.campoferial3jvirtual.com/','2020-08-31 12:23:29','2020-08-31 08:40:36','2020-08-31 12:23:29'),(5,'5','http://ruedabioseguridad.campoferial3jvirtual.com/','2020-08-31 12:23:21','2020-08-31 08:40:36','2020-08-31 12:23:21');
/*!40000 ALTER TABLE `mesas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (31,'2014_10_12_000000_create_users_table',1),(32,'2014_10_12_100000_create_password_resets_table',1),(33,'2018_10_10_210842_create_rubros_table',1),(34,'2018_10_10_211740_create_usuarios_table',1),(35,'2018_10_11_001137_create_empresas_table',1),(36,'2018_10_11_020040_create_participantes_table',1),(37,'2018_10_11_020723_create_horarios_table',1),(38,'2018_10_11_021710_create_mesas_table',1),(39,'2018_10_11_022030_create_reunions_table',1),(40,'2018_10_15_044311_create_agendas_table',1),(41,'2018_10_15_045356_create_horario_ocupados_table',1),(42,'2018_10_19_121153_create_evaluacion_generals_table',1),(43,'2018_10_19_180028_create_evaluacion_reunions_table',1),(44,'2019_10_27_224539_create_oferta_demandas_table',1),(45,'2019_11_08_164121_create_noticias_table',1),(46,'2020_08_30_091239_create_pais_table',1),(47,'2020_08_30_111542_create_ruedas_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticias`
--

DROP TABLE IF EXISTS `noticias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `noticias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contenido` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticias`
--

LOCK TABLES `noticias` WRITE;
/*!40000 ALTER TABLE `noticias` DISABLE KEYS */;
/*!40000 ALTER TABLE `noticias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oferta_demandas`
--

DROP TABLE IF EXISTS `oferta_demandas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oferta_demandas` (
  `oferta_demanda_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` int(10) unsigned NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `producto_servicio` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` enum('oferta','demanda') COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`oferta_demanda_id`),
  KEY `oferta_demandas_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `oferta_demandas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`empresa_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oferta_demandas`
--

LOCK TABLES `oferta_demandas` WRITE;
/*!40000 ALTER TABLE `oferta_demandas` DISABLE KEYS */;
INSERT INTO `oferta_demandas` VALUES (1,2,'MESAS','producto','oferta',NULL,'2020-08-31 09:30:23','2020-08-31 09:30:23'),(2,3,'PRODUCTO','producto','oferta',NULL,'2020-08-31 09:32:44','2020-08-31 09:32:44'),(3,4,'TELAS','producto','oferta','2020-09-01 15:18:02','2020-08-31 12:45:16','2020-09-01 15:18:02'),(4,5,'PRODUCTOS DE LIMPIEZA EN GRAL','producto','oferta',NULL,'2020-08-31 12:52:00','2020-08-31 12:52:00'),(5,5,'ALCOHOL EN GEL','producto','oferta',NULL,'2020-08-31 12:52:00','2020-08-31 12:52:00'),(6,6,'BARBIJOS QUIRURGICOS','producto','oferta',NULL,'2020-08-31 12:54:34','2020-08-31 12:54:34'),(7,6,'ALCOHOL','producto','oferta',NULL,'2020-08-31 12:54:34','2020-08-31 12:54:34'),(8,6,'INSUMOS MEDICOS','producto','oferta',NULL,'2020-08-31 12:54:34','2020-08-31 12:54:34'),(9,7,'IMPORTACIONES EN GRAL','producto','oferta',NULL,'2020-08-31 12:56:37','2020-08-31 12:56:37'),(10,8,'SUPLEMENTOS VITAMINICOS','producto','oferta','2020-09-01 15:41:53','2020-08-31 12:59:30','2020-09-01 15:41:53'),(11,8,'ELABORACION DE PROGRAMAS DE SEGURIDAD Y SALUD EN EL TRABAJO','servicio','oferta',NULL,'2020-08-31 12:59:30','2020-09-01 15:43:15'),(12,9,'SERVICIOS','servicio','oferta',NULL,'2020-08-31 13:00:48','2020-08-31 13:00:48'),(13,10,'PRODUCTOS VARIOS DE LIMPIEZA','producto','demanda',NULL,'2020-08-31 13:03:03','2020-08-31 13:03:03'),(14,11,'OTROS DE LIMPIEZA','producto','demanda',NULL,'2020-08-31 13:04:38','2020-08-31 13:04:38'),(15,11,'ALCOHOL','producto','demanda',NULL,'2020-08-31 13:04:38','2020-08-31 13:04:38'),(16,11,'BARBIJOS','producto','demanda',NULL,'2020-08-31 13:04:38','2020-08-31 13:04:38'),(17,12,'INSUMOS VARIOS','producto','demanda',NULL,'2020-08-31 13:06:22','2020-08-31 13:06:22'),(18,12,'MEDICAMENTOS CONTRA COVID','producto','demanda',NULL,'2020-08-31 13:06:22','2020-08-31 13:06:22'),(19,13,'PRODUCTOS DE LIMPIEZA','producto','demanda',NULL,'2020-08-31 13:08:00','2020-08-31 13:08:00'),(20,13,'BARBIJOS','producto','demanda',NULL,'2020-08-31 13:08:00','2020-08-31 13:08:00'),(21,13,'TRAJES DE BIOSEGURIDAD','producto','demanda',NULL,'2020-08-31 13:08:00','2020-08-31 13:08:00'),(22,14,'PRODUCTOS VARIOS DE LIMPIEZA','producto','demanda',NULL,'2020-08-31 13:09:59','2020-08-31 13:09:59'),(23,14,'INSUMOS DE DESINFECCION','producto','demanda',NULL,'2020-08-31 13:09:59','2020-08-31 13:09:59'),(24,14,'MASCARILLAS','producto','demanda',NULL,'2020-08-31 13:09:59','2020-08-31 13:09:59'),(25,8,'EPPS POR MAYOR','producto','demanda','2020-09-01 15:41:30','2020-08-31 13:19:52','2020-09-01 15:41:30'),(26,8,'BAR POR MAYOR','producto','demanda','2020-09-01 15:41:27','2020-08-31 13:19:52','2020-09-01 15:41:27'),(27,15,'PRODUCTO DE OFERTA','producto','oferta',NULL,'2020-08-31 16:57:56','2020-08-31 16:57:56'),(28,16,'LENTES','producto','oferta',NULL,'2020-08-31 21:28:38','2020-08-31 21:28:38'),(29,16,'BARBIJOS','producto','oferta',NULL,'2020-08-31 21:28:38','2020-08-31 21:28:38'),(30,17,'ROPA DE BIOSEGURIDAD','producto','oferta',NULL,'2020-08-31 21:30:49','2020-08-31 21:30:49'),(31,17,'MASCARILLAS','producto','oferta',NULL,'2020-08-31 21:30:49','2020-08-31 21:30:49'),(32,17,'BARBIJOS K95','producto','oferta',NULL,'2020-08-31 21:30:49','2020-08-31 21:30:49'),(33,18,'MEDICAMENTOS','producto','demanda',NULL,'2020-08-31 21:32:56','2020-08-31 21:32:56'),(34,18,'INSUMOS DE BIOSEGURIDAD','producto','demanda',NULL,'2020-08-31 21:32:56','2020-08-31 21:32:56'),(35,19,'BARBIJOS KN95 CON VALVULA','producto','oferta',NULL,'2020-09-01 09:30:23','2020-09-01 09:30:23'),(36,19,'BARBIJOS QUIRURGICOS DE 3 CAPAS CERTIFICADOS','producto','oferta',NULL,'2020-09-01 09:30:23','2020-09-01 09:30:23'),(37,20,'TELAS','producto','demanda',NULL,'2020-09-01 11:23:45','2020-09-01 11:23:45'),(38,4,'TELAS','producto','oferta',NULL,'2020-09-01 15:18:16','2020-09-01 15:18:16'),(39,8,'SUPLEMENTOS NUTRICIONALES','producto','oferta',NULL,'2020-09-01 15:43:15','2020-09-01 15:43:15'),(40,8,'INSUMOS DE BIOSEGURIDAD','producto','oferta',NULL,'2020-09-01 15:43:15','2020-09-01 15:43:15'),(41,8,'INSUMOS DE BIOSEGURIDAD','producto','demanda',NULL,'2020-09-01 15:43:15','2020-09-01 15:43:15'),(42,21,'ROPA DE BIOSEGURIDAD','producto','oferta',NULL,'2020-09-01 22:02:18','2020-09-01 22:02:18');
/*!40000 ALTER TABLE `oferta_demandas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paises` (
  `pais_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo_marcado` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`pais_id`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
INSERT INTO `paises` VALUES (1,'Bolivia, Estado Plurinacional de','+591','BO',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(2,'Afghanistan','+93','AF',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(3,'Albania','+355','AL',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(4,'Algeria','+213','DZ',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(5,'AmericanSamoa','+1 684','AS',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(6,'Andorra','+376','AD',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(7,'Angola','+244','AO',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(8,'Anguilla','+1 264','AI',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(9,'Antigua and Barbuda','+1268','AG',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(10,'Argentina','+54','AR',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(11,'Armenia','+374','AM',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(12,'Aruba','+297','AW',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(13,'Australia','+61','AU',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(14,'Austria','+43','AT',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(15,'Azerbaijan','+994','AZ',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(16,'Bahamas','+1 242','BS',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(17,'Bahrain','+973','BH',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(18,'Bangladesh','+880','BD',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(19,'Barbados','+1 246','BB',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(20,'Belarus','+375','BY',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(21,'Belgium','+32','BE',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(22,'Belize','+501','BZ',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(23,'Benin','+229','BJ',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(24,'Bermuda','+1 441','BM',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(25,'Bhutan','+975','BT',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(26,'Bosnia and Herzegovina','+387','BA',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(27,'Botswana','+267','BW',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(28,'Brazil','+55','BR',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(29,'British Indian Ocean Territory','+246','IO',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(30,'Bulgaria','+359','BG',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(31,'Burkina Faso','+226','BF',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(32,'Burundi','+257','BI',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(33,'Cambodia','+855','KH',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(34,'Cameroon','+237','CM',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(35,'Canada','+1','CA',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(36,'Cape Verde','+238','CV',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(37,'Cayman Islands','+ 345','KY',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(38,'Central African Republic','+236','CF',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(39,'Chad','+235','TD',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(40,'Chile','+56','CL',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(41,'China','+86','CN',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(42,'Christmas Island','+61','CX',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(43,'Colombia','+57','CO',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(44,'Comoros','+269','KM',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(45,'Congo','+242','CG',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(46,'Cook Islands','+682','CK',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(47,'Costa Rica','+506','CR',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(48,'Croatia','+385','HR',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(49,'Cuba','+53','CU',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(50,'Cyprus','+537','CY',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(51,'Czech Republic','+420','CZ',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(52,'Denmark','+45','DK',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(53,'Djibouti','+253','DJ',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(54,'Dominica','+1 767','DM',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(55,'Dominican Republic','+1 849','DO',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(56,'Ecuador','+593','EC',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(57,'Egypt','+20','EG',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(58,'El Salvador','+503','SV',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(59,'Equatorial Guinea','+240','GQ',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(60,'Eritrea','+291','ER',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(61,'Estonia','+372','EE',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(62,'Ethiopia','+251','ET',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(63,'Faroe Islands','+298','FO',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(64,'Fiji','+679','FJ',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(65,'Finland','+358','FI',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(66,'France','+33','FR',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(67,'French Guiana','+594','GF',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(68,'French Polynesia','+689','PF',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(69,'Gabon','+241','GA',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(70,'Gambia','+220','GM',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(71,'Georgia','+995','GE',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(72,'Germany','+49','DE',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(73,'Ghana','+233','GH',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(74,'Gibraltar','+350','GI',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(75,'Greece','+30','GR',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(76,'Greenland','+299','GL',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(77,'Grenada','+1 473','GD',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(78,'Guadeloupe','+590','GP',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(79,'Guam','+1 671','GU',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(80,'Guatemala','+502','GT',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(81,'Guinea','+224','GN',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(82,'Guinea-Bissau','+245','GW',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(83,'Guyana','+595','GY',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(84,'Haiti','+509','HT',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(85,'Honduras','+504','HN',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(86,'Hungary','+36','HU',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(87,'Iceland','+354','IS',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(88,'India','+91','IN',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(89,'Indonesia','+62','ID',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(90,'Iraq','+964','IQ',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(91,'Ireland','+353','IE',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(92,'Israel','+972','IL',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(93,'Italy','+39','IT',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(94,'Jamaica','+1 876','JM',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(95,'Japan','+81','JP',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(96,'Jordan','+962','JO',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(97,'Kazakhstan','+7 7','KZ',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(98,'Kenya','+254','KE',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(99,'Kiribati','+686','KI',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(100,'Kuwait','+965','KW',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(101,'Kyrgyzstan','+996','KG',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(102,'Latvia','+371','LV',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(103,'Lebanon','+961','LB',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(104,'Lesotho','+266','LS',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(105,'Liberia','+231','LR',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(106,'Liechtenstein','+423','LI',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(107,'Lithuania','+370','LT',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(108,'Luxembourg','+352','LU',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(109,'Madagascar','+261','MG',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(110,'Malawi','+265','MW',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(111,'Malaysia','+60','MY',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(112,'Maldives','+960','MV',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(113,'Mali','+223','ML',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(114,'Malta','+356','MT',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(115,'Marshall Islands','+692','MH',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(116,'Martinique','+596','MQ',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(117,'Mauritania','+222','MR',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(118,'Mauritius','+230','MU',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(119,'Mayotte','+262','YT',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(120,'Mexico','+52','MX',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(121,'Monaco','+377','MC',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(122,'Mongolia','+976','MN',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(123,'Montenegro','+382','ME',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(124,'Montserrat','+1664','MS',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(125,'Morocco','+212','MA',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(126,'Myanmar','+95','MM',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(127,'Namibia','+264','NA',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(128,'Nauru','+674','NR',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(129,'Nepal','+977','NP',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(130,'Netherlands','+31','NL',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(131,'Netherlands Antilles','+599','AN',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(132,'New Caledonia','+687','NC',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(133,'New Zealand','+64','NZ',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(134,'Nicaragua','+505','NI',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(135,'Niger','+227','NE',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(136,'Nigeria','+234','NG',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(137,'Niue','+683','NU',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(138,'Norfolk Island','+672','NF',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(139,'Northern Mariana Islands','+1 670','MP',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(140,'Norway','+47','NO',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(141,'Oman','+968','OM',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(142,'Pakistan','+92','PK',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(143,'Palau','+680','PW',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(144,'Panama','+507','PA',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(145,'Papua New Guinea','+675','PG',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(146,'Paraguay','+595','PY',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(147,'Peru','+51','PE',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(148,'Philippines','+63','PH',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(149,'Poland','+48','PL',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(150,'Portugal','+351','PT',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(151,'Puerto Rico','+1 939','PR',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(152,'Qatar','+974','QA',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(153,'Romania','+40','RO',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(154,'Rwanda','+250','RW',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(155,'Samoa','+685','WS',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(156,'San Marino','+378','SM',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(157,'Saudi Arabia','+966','SA',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(158,'Senegal','+221','SN',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(159,'Serbia','+381','RS',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(160,'Seychelles','+248','SC',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(161,'Sierra Leone','+232','SL',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(162,'Singapore','+65','SG',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(163,'Slovakia','+421','SK',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(164,'Slovenia','+386','SI',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(165,'Solomon Islands','+677','SB',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(166,'South Africa','+27','ZA',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(167,'South Georgia and the South Sandwich Islands','+500','GS',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(168,'Spain','+34','ES',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(169,'Sri Lanka','+94','LK',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(170,'Sudan','+249','SD',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(171,'Suripais','+597','SR',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(172,'Swaziland','+268','SZ',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(173,'Sweden','+46','SE',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(174,'Switzerland','+41','CH',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(175,'Tajikistan','+992','TJ',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(176,'Thailand','+66','TH',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(177,'Togo','+228','TG',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(178,'Tokelau','+690','TK',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(179,'Tonga','+676','TO',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(180,'Trinidad and Tobago','+1 868','TT',NULL,'2020-08-31 08:45:30','2020-08-31 08:45:30'),(181,'Tunisia','+216','TN',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(182,'Turkey','+90','TR',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(183,'Turkmenistan','+993','TM',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(184,'Turks and Caicos Islands','+1 649','TC',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(185,'Tuvalu','+688','TV',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(186,'Uganda','+256','UG',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(187,'Ukraine','+380','UA',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(188,'United Arab Emirates','+971','AE',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(189,'United Kingdom','+44','GB',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(190,'United States','+1','US',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(191,'Uruguay','+598','UY',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(192,'Uzbekistan','+998','UZ',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(193,'Vanuatu','+678','VU',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(194,'Wallis and Futuna','+681','WF',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(195,'Yemen','+967','YE',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(196,'Zambia','+260','ZM',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(197,'Zimbabwe','+263','ZW',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(198,'land Islands',NULL,'AX',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(199,'Antarctica',NULL,'AQ',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(200,'Brunei Darussalam','+673','BN',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(201,'Cocos (Keeling) Islands','+61','CC',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(202,'Congo, The Democratic Republic of the','+243','CD',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(203,'Cote d\'Ivoire','+225','CI',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(204,'Falkland Islands (Malvinas)','+500','FK',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(205,'Guernsey','+44','GG',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(206,'Holy See (Vatican City State)','+379','VA',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(207,'Hong Kong','+852','HK',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(208,'Iran, Islamic Republic of','+98','IR',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(209,'Isle of Man','+44','IM',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(210,'Jersey','+44','JE',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(211,'Korea, Democratic People\'s Republic of','+850','KP',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(212,'Korea, Republic of','+82','KR',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(213,'Lao People\'s Democratic Republic','+856','LA',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(214,'Libyan Arab Jamahiriya','+218','LY',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(215,'Macao','+853','MO',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(216,'Macedonia, The Former Yugoslav Republic of','+389','MK',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(217,'Micronesia, Federated States of','+691','FM',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(218,'Moldova, Republic of','+373','MD',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(219,'Mozambique','+258','MZ',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(220,'Palestinian Territory, Occupied','+970','PS',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(221,'Pitcairn','+872','PN',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(222,'Réunion','+262','RE',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(223,'Russia','+7','RU',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(224,'Saint Barthélemy','+590','BL',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(225,'Saint Helena, Ascension and Tristan Da Cunha','+290','SH',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(226,'Saint Kitts and Nevis','+1 869','KN',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(227,'Saint Lucia','+1 758','LC',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(228,'Saint Martin','+590','MF',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(229,'Saint Pierre and Miquelon','+508','PM',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(230,'Saint Vincent and the Grenadines','+1 784','VC',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(231,'Sao Tome and Principe','+239','ST',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(232,'Somalia','+252','SO',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(233,'Svalbard and Jan Mayen','+47','SJ',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(234,'Syrian Arab Republic','+963','SY',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(235,'Taiwan, Province of China','+886','TW',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(236,'Tanzania, United Republic of','+255','TZ',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(237,'Timor-Leste','+670','TL',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(238,'Venezuela, Bolivarian Republic of','+58','VE',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(239,'Viet Nam','+84','VN',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(240,'Virgin Islands, British','+1 284','VG',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31'),(241,'Virgin Islands, U.S.','+1 340','VI',NULL,'2020-08-31 08:45:31','2020-08-31 08:45:31');
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participantes`
--

DROP TABLE IF EXISTS `participantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participantes` (
  `participante_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` int(10) unsigned NOT NULL,
  `nombres` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carnet` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `celular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cargo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `es_usuario` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`participante_id`),
  KEY `participantes_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `participantes_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`empresa_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participantes`
--

LOCK TABLES `participantes` WRITE;
/*!40000 ALTER TABLE `participantes` DISABLE KEYS */;
INSERT INTO `participantes` VALUES (1,1,'Andrea Luisa','Silvestre Lobo','7287697','61836193','SISTEMAS',0,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(2,2,'EBELIZ','FUENTES','7279581','71100743','COMERCIAL',1,'2020-08-31 21:22:18','2020-08-31 09:30:23','2020-08-31 21:22:18'),(3,3,'FRANCO JESUS','MAMANI POZO','7275047','76137653','GERENTE',1,'2020-08-31 17:12:47','2020-08-31 09:32:44','2020-08-31 17:12:47'),(4,4,'JUAN','PEREZ','10101','123','COMERCIAL',1,'2020-09-01 21:03:45','2020-08-31 12:45:16','2020-09-01 21:03:45'),(5,5,'JUAN','PEREZ','10102','76543221','COMERCIAL',1,NULL,'2020-08-31 12:52:00','2020-08-31 12:52:00'),(6,6,'JUAN','PEREZ','10103','7654321','COMERCIAL',1,NULL,'2020-08-31 12:54:34','2020-08-31 12:54:34'),(7,7,'JUAN','PEREZ','10104','765311','COMERCIAL',1,NULL,'2020-08-31 12:56:37','2020-08-31 12:56:37'),(8,8,'JUAN','PEREZ','10105','765','COMERCIAL',1,NULL,'2020-08-31 12:59:30','2020-08-31 12:59:30'),(9,9,'JUAN','PEREZ','10106','65','C',1,NULL,'2020-08-31 13:00:48','2020-08-31 13:00:48'),(10,10,'JUAN','PEREZ','10109','76','C',1,'2020-09-01 21:04:20','2020-08-31 13:03:03','2020-09-01 21:04:20'),(11,11,'JUAN','PEREZ','101010','7','C',1,NULL,'2020-08-31 13:04:38','2020-08-31 13:04:38'),(12,12,'JUAN','PEREZ','101011','7','C',1,NULL,'2020-08-31 13:06:22','2020-08-31 13:06:22'),(13,13,'JUAN','PEREZ','101012','1','C',1,NULL,'2020-08-31 13:08:00','2020-08-31 13:08:00'),(14,14,'JUAN','PEREZ','101013','1','C',1,NULL,'2020-08-31 13:09:59','2020-08-31 13:09:59'),(15,15,'SHIRLEY','LOPEZ SANCHEZ','123456789','123456789','GERENTE',1,'2020-08-31 21:22:33','2020-08-31 16:57:55','2020-08-31 21:22:33'),(16,16,'JUAN','PEREZ','10107','1','A',1,NULL,'2020-08-31 21:28:38','2020-08-31 21:28:38'),(17,17,'JUAN','PEREZ','10108','1','C',1,NULL,'2020-08-31 21:30:49','2020-08-31 21:30:49'),(18,18,'JUAN','PEREZ','101014','1','A',1,NULL,'2020-08-31 21:32:56','2020-08-31 21:32:56'),(19,19,'JUAN','PEREZ','101015','68351543','PROPIETARIO',1,NULL,'2020-09-01 09:30:23','2020-09-01 09:30:23'),(20,20,'JUAN','PEREZ','101020','1','A',1,'2020-09-01 21:03:04','2020-09-01 11:23:45','2020-09-01 21:03:04'),(21,21,'JUAN','PEREZ','101016','1','S',1,NULL,'2020-09-01 22:02:18','2020-09-01 22:02:18');
/*!40000 ALTER TABLE `participantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reuniones`
--

DROP TABLE IF EXISTS `reuniones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reuniones` (
  `reunion_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mesa_id` int(10) unsigned NOT NULL,
  `empresa_solicitante_id` int(10) unsigned NOT NULL,
  `empresa_demandada_id` int(10) unsigned NOT NULL,
  `empresa_solicitante_asistio` tinyint(1) NOT NULL DEFAULT '0',
  `empresa_demandada_asistio` tinyint(1) NOT NULL DEFAULT '0',
  `resultado` enum('satisfactoria','ausencia','agendado') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'agendado',
  `desde` datetime NOT NULL,
  `hasta` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`reunion_id`),
  KEY `reuniones_mesa_id_foreign` (`mesa_id`),
  CONSTRAINT `reuniones_mesa_id_foreign` FOREIGN KEY (`mesa_id`) REFERENCES `mesas` (`mesa_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reuniones`
--

LOCK TABLES `reuniones` WRITE;
/*!40000 ALTER TABLE `reuniones` DISABLE KEYS */;
INSERT INTO `reuniones` VALUES (1,3,2,3,0,0,'agendado','2020-08-31 15:30:00','2020-08-31 15:55:00','2020-08-31 14:22:51','2020-08-31 09:37:14','2020-08-31 14:22:51'),(2,3,2,1,0,0,'agendado','2020-08-31 10:30:00','2020-08-31 10:55:00',NULL,'2020-08-31 09:37:41','2020-08-31 09:37:41'),(3,1,3,1,0,0,'agendado','2020-08-31 14:00:00','2020-08-31 14:25:00','2020-08-31 14:22:47','2020-08-31 09:46:29','2020-08-31 14:22:47'),(4,1,10,5,0,0,'agendado','2020-09-02 11:00:00','2020-09-02 11:25:00','2020-08-31 14:19:12','2020-08-31 14:18:37','2020-08-31 14:19:12'),(5,1,10,5,0,0,'agendado','2020-09-02 17:30:00','2020-09-02 17:55:00',NULL,'2020-08-31 14:19:36','2020-08-31 14:19:36'),(6,3,10,6,0,0,'agendado','2020-09-02 19:00:00','2020-09-02 19:25:00',NULL,'2020-08-31 14:20:39','2020-08-31 14:20:39'),(7,2,10,7,0,0,'agendado','2020-09-02 17:00:00','2020-09-02 17:25:00',NULL,'2020-08-31 14:20:47','2020-08-31 14:20:47'),(8,3,10,8,0,0,'agendado','2020-09-02 18:30:00','2020-09-02 18:55:00',NULL,'2020-08-31 14:20:57','2020-08-31 14:20:57'),(9,1,3,4,0,0,'agendado','2020-09-02 18:00:00','2020-09-02 18:25:00','2020-08-31 14:42:19','2020-08-31 14:21:58','2020-08-31 14:42:19'),(10,1,3,6,0,0,'agendado','2020-09-02 09:00:00','2020-09-02 09:25:00','2020-08-31 14:28:21','2020-08-31 14:22:00','2020-08-31 14:28:21'),(11,1,3,8,0,0,'agendado','2020-09-02 08:30:00','2020-09-02 08:55:00','2020-08-31 14:33:24','2020-08-31 14:22:02','2020-08-31 14:33:24'),(12,2,3,10,0,0,'agendado','2020-09-02 16:30:00','2020-09-02 16:55:00','2020-08-31 14:42:16','2020-08-31 14:22:06','2020-08-31 14:42:16'),(13,2,3,5,0,0,'agendado','2020-09-02 18:30:00','2020-09-02 18:55:00','2020-08-31 14:42:23','2020-08-31 14:23:10','2020-08-31 14:42:23'),(14,2,3,7,0,0,'agendado','2020-09-02 09:30:00','2020-09-02 09:55:00','2020-08-31 14:31:10','2020-08-31 14:23:14','2020-08-31 14:31:10'),(15,3,5,11,0,0,'agendado','2020-09-02 12:30:00','2020-09-02 12:55:00',NULL,'2020-08-31 14:24:35','2020-08-31 14:24:35'),(16,2,5,12,0,0,'agendado','2020-09-02 18:00:00','2020-09-02 18:25:00',NULL,'2020-08-31 14:24:41','2020-08-31 14:24:41'),(17,3,5,13,0,0,'agendado','2020-09-02 08:00:00','2020-09-02 08:25:00','2020-09-01 21:10:59','2020-08-31 14:24:56','2020-09-01 21:10:59'),(18,1,5,14,0,0,'agendado','2020-09-02 15:00:00','2020-09-02 15:25:00',NULL,'2020-08-31 14:25:18','2020-08-31 14:25:18'),(19,3,6,8,0,0,'agendado','2020-09-02 13:00:00','2020-09-02 13:25:00',NULL,'2020-08-31 14:27:26','2020-08-31 14:27:26'),(20,3,6,11,0,0,'agendado','2020-09-02 16:00:00','2020-09-02 16:25:00',NULL,'2020-08-31 14:27:42','2020-08-31 14:27:42'),(21,3,6,12,0,0,'agendado','2020-09-02 15:30:00','2020-09-02 15:55:00',NULL,'2020-08-31 14:27:47','2020-08-31 14:27:47'),(22,1,6,13,0,0,'agendado','2020-09-02 10:00:00','2020-09-02 10:25:00','2020-09-01 21:11:30','2020-08-31 14:27:51','2020-09-01 21:11:30'),(23,1,6,14,0,0,'agendado','2020-09-02 18:30:00','2020-09-02 18:55:00',NULL,'2020-08-31 14:28:50','2020-08-31 14:28:50'),(24,3,7,8,0,0,'agendado','2020-09-02 10:30:00','2020-09-02 10:55:00',NULL,'2020-08-31 14:30:05','2020-08-31 14:30:05'),(25,1,7,11,0,0,'agendado','2020-09-02 19:30:00','2020-09-02 19:55:00',NULL,'2020-08-31 14:30:28','2020-08-31 14:30:28'),(26,1,7,12,0,0,'agendado','2020-09-02 13:30:00','2020-09-02 13:55:00',NULL,'2020-08-31 14:30:33','2020-08-31 14:30:33'),(27,2,7,13,0,0,'agendado','2020-09-02 16:00:00','2020-09-02 16:25:00',NULL,'2020-08-31 14:30:37','2020-08-31 14:30:37'),(28,2,7,14,0,0,'agendado','2020-09-02 17:30:00','2020-09-02 17:55:00','2020-09-01 20:32:54','2020-08-31 14:31:39','2020-09-01 20:32:54'),(29,2,9,13,0,0,'agendado','2020-09-02 08:30:00','2020-09-02 08:55:00','2020-09-01 21:11:02','2020-08-31 14:34:28','2020-09-01 21:11:02'),(30,1,11,8,0,0,'agendado','2020-09-02 08:30:00','2020-09-02 08:55:00',NULL,'2020-08-31 14:35:46','2020-08-31 14:35:46'),(31,2,12,8,0,0,'agendado','2020-09-02 12:30:00','2020-09-02 12:55:00',NULL,'2020-08-31 14:37:40','2020-08-31 14:37:40'),(32,1,13,4,0,0,'agendado','2020-09-02 09:30:00','2020-09-02 09:55:00','2020-09-01 21:11:05','2020-08-31 14:38:43','2020-09-01 21:11:05'),(33,3,15,3,0,0,'agendado','2020-09-02 17:00:00','2020-09-02 17:25:00','2020-08-31 17:12:11','2020-08-31 16:59:03','2020-08-31 17:12:11'),(34,1,15,4,0,0,'agendado','2020-09-02 16:00:00','2020-09-02 16:25:00','2020-08-31 17:12:27','2020-08-31 16:59:06','2020-08-31 17:12:27'),(35,1,15,12,0,0,'agendado','2020-09-02 14:30:00','2020-09-02 14:55:00','2020-08-31 17:12:30','2020-08-31 16:59:32','2020-08-31 17:12:30'),(36,3,15,11,0,0,'agendado','2020-09-02 09:00:00','2020-09-02 09:25:00','2020-08-31 17:12:25','2020-08-31 16:59:37','2020-08-31 17:12:25'),(37,3,16,8,0,0,'agendado','2020-09-02 17:00:00','2020-09-02 17:25:00',NULL,'2020-08-31 21:40:27','2020-08-31 21:40:27'),(38,3,16,11,0,0,'agendado','2020-09-02 16:30:00','2020-09-02 16:55:00',NULL,'2020-08-31 21:40:49','2020-08-31 21:40:49'),(39,3,16,12,0,0,'agendado','2020-09-02 17:30:00','2020-09-02 17:55:00',NULL,'2020-08-31 21:41:18','2020-08-31 21:41:18'),(40,1,16,14,0,0,'agendado','2020-09-02 16:00:00','2020-09-02 16:25:00',NULL,'2020-08-31 21:41:49','2020-08-31 21:41:49'),(41,3,16,13,0,0,'agendado','2020-09-02 15:00:00','2020-09-02 15:25:00','2020-09-01 21:11:20','2020-08-31 21:42:35','2020-09-01 21:11:20'),(42,1,16,18,0,0,'agendado','2020-09-02 14:00:00','2020-09-02 14:25:00',NULL,'2020-08-31 21:42:39','2020-08-31 21:42:39'),(43,1,16,9,0,0,'agendado','2020-09-02 14:30:00','2020-09-02 14:55:00','2020-08-31 21:42:56','2020-08-31 21:42:44','2020-08-31 21:42:56'),(44,2,17,8,0,0,'agendado','2020-09-02 19:30:00','2020-09-02 19:55:00',NULL,'2020-08-31 21:44:21','2020-08-31 21:44:21'),(45,3,17,10,0,0,'agendado','2020-09-02 18:00:00','2020-09-02 18:25:00',NULL,'2020-08-31 21:44:31','2020-08-31 21:44:31'),(46,2,17,11,0,0,'agendado','2020-09-02 19:00:00','2020-09-02 19:25:00',NULL,'2020-08-31 21:44:47','2020-08-31 21:44:47'),(47,1,17,12,0,0,'agendado','2020-09-02 17:00:00','2020-09-02 17:25:00',NULL,'2020-08-31 21:44:51','2020-08-31 21:44:51'),(48,2,17,13,0,0,'agendado','2020-09-02 18:30:00','2020-09-02 18:55:00',NULL,'2020-08-31 21:44:55','2020-08-31 21:44:55'),(49,2,17,14,0,0,'agendado','2020-09-02 16:30:00','2020-09-02 16:55:00',NULL,'2020-08-31 21:44:59','2020-08-31 21:44:59'),(50,2,18,5,0,0,'agendado','2020-09-02 14:30:00','2020-09-02 14:55:00',NULL,'2020-08-31 21:48:19','2020-08-31 21:48:19'),(51,1,18,8,0,0,'agendado','2020-09-02 16:30:00','2020-09-02 16:55:00',NULL,'2020-08-31 21:48:34','2020-08-31 21:48:34'),(52,2,18,6,0,0,'agendado','2020-09-02 15:00:00','2020-09-02 15:25:00',NULL,'2020-08-31 21:48:53','2020-08-31 21:48:53'),(53,1,18,9,0,0,'agendado','2020-09-02 15:30:00','2020-09-02 15:55:00',NULL,'2020-08-31 21:48:56','2020-08-31 21:48:56'),(54,2,19,8,0,0,'agendado','2020-09-02 11:30:00','2020-09-02 11:55:00',NULL,'2020-09-01 09:31:25','2020-09-01 09:31:25'),(55,3,19,11,0,0,'agendado','2020-09-02 14:00:00','2020-09-02 14:25:00',NULL,'2020-09-01 09:32:08','2020-09-01 09:32:08'),(56,1,19,12,0,0,'agendado','2020-09-02 09:00:00','2020-09-02 09:25:00',NULL,'2020-09-01 09:32:12','2020-09-01 09:32:12'),(57,1,19,13,0,0,'agendado','2020-09-02 13:00:00','2020-09-02 13:25:00','2020-09-01 21:11:24','2020-09-01 09:32:16','2020-09-01 21:11:24'),(58,3,19,14,0,0,'agendado','2020-09-02 12:00:00','2020-09-02 12:25:00',NULL,'2020-09-01 09:32:25','2020-09-01 09:32:25'),(59,2,9,5,0,0,'agendado','2020-09-02 10:30:00','2020-09-02 10:55:00',NULL,'2020-09-01 10:52:48','2020-09-01 10:52:48'),(60,2,20,4,0,0,'agendado','2020-09-02 13:00:00','2020-09-02 13:25:00',NULL,'2020-09-01 11:25:39','2020-09-01 11:25:39'),(61,3,13,5,0,0,'agendado','2020-09-02 19:30:00','2020-09-02 19:55:00',NULL,'2020-09-01 21:12:58','2020-09-01 21:12:58'),(62,2,13,9,0,0,'agendado','2020-09-02 17:30:00','2020-09-02 17:55:00',NULL,'2020-09-01 21:13:16','2020-09-01 21:13:16'),(63,1,13,6,0,0,'agendado','2020-09-02 18:00:00','2020-09-02 18:25:00',NULL,'2020-09-01 21:13:41','2020-09-01 21:13:41'),(64,1,13,19,0,0,'agendado','2020-09-02 19:00:00','2020-09-02 19:25:00',NULL,'2020-09-01 21:14:00','2020-09-01 21:14:00'),(65,2,21,12,0,0,'agendado','2020-09-02 09:30:00','2020-09-02 09:55:00',NULL,'2020-09-01 22:04:00','2020-09-01 22:04:00'),(66,1,21,14,0,0,'agendado','2020-09-02 10:30:00','2020-09-02 10:55:00',NULL,'2020-09-01 22:04:34','2020-09-01 22:04:34'),(67,1,21,11,0,0,'agendado','2020-09-02 13:00:00','2020-09-02 13:25:00','2020-09-01 22:07:33','2020-09-01 22:06:59','2020-09-01 22:07:33');
/*!40000 ALTER TABLE `reuniones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rubros`
--

DROP TABLE IF EXISTS `rubros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rubros` (
  `rubro_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`rubro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rubros`
--

LOCK TABLES `rubros` WRITE;
/*!40000 ALTER TABLE `rubros` DISABLE KEYS */;
INSERT INTO `rubros` VALUES (1,'AGRÍCOLA',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(2,'ALIMENTOS Y BEBIDAS',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(3,'ALMACENAMIENTO Y DISTRIBUCIÓN',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(4,'ARTES ESCENICAS',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(5,'ARTES LITERARIAS',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(6,'ARTES MUSICALES',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(7,'ARTES PLASTICAS',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(8,'ARTESANIAS',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(9,'ARTÍCULOS DE LIMPIEZA Y DESINFECCION',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(10,'ARTÍCULOS',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(11,'BANCOS Y FINANCIERAS',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(12,'CÁMARAS Y ORGANIZACIONES EMPRESARIALES',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(13,'COMPAÑÍA DE TRADING',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(14,'COSMÉTICOS',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(15,'CUERO CALZADO Y MANUFACTURAS DE CUERO',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(16,'ELECTRODOMÉSTICOS Y LÍNEA BLANCA',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(17,'ENVASES',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(18,'EQUIPOS DE TECNÓLOGÍA PARA LA INDUSTRIA MINERA',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(19,'EQUIPOS E IMPLEMENTOS HIDRAULICOS',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(20,'EQUIPOS ELÉCTRICOS',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(21,'FARMACIA',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(22,'FERRETERÍA Y HERRAMIENTAS',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(23,'FLETES Y TRANSPORTE',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(24,'GOBIERNO Y SUS ORGANISMOS',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(25,'HIDROCARBUROS',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(26,'INDUSTRIA DE ENERGIAS LIMPIAS',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(27,'INDUSTRIA DE LA MADERA Y MUEBLES EN GENERAL',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(28,'INDUSTRIA ENERGETICA',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(29,'INDUSTRIA METALURGICA',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(30,'INDUSTRIA PAPELERA Y GRÁFICA',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(31,'INDUSTRIA TEXTIL',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(32,'JOYERÍA. BISUTERÍA Y ORFEBRERÍA',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(33,'JUGUETERÍA Y ARTÍCULOS DE ENTRETENIMIENTO',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(34,'MERCADOTECNIA',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(35,'METALMECÁNICA Y ELECTROMECÁNICA',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(36,'MINERIA ENERGETICA',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(37,'MINERIA METALURGICA',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(38,'MINERIA NO METALURGICA',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(39,'ORGANISMOS INTERNACIONALES',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(40,'ORGANIZACIONES DE ECOLÓGÍA Y PROTECCIÓN DE MEDIO AMBIENTE',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(41,'OTROS',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(42,'OTROS SERVICIOS',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(43,'PLÁSTICOS O AFINES',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(44,'PRODUCCION AUDIOVISUAL',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(45,'PRODUCTOS PARA LA CONTRUCCIÓN Y DECORACIÓN',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(46,'QUÍMICOS Y REACTIVOS',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(47,'SEGUROS',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(48,'SERVICIOS ADUANEROS',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(49,'SERVICIOS DE CONSULTORIA AMBIENTAL',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(50,'SERVICIOS DE CONSULTORIA EN SEGURIDAD INDUSTRIAL',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(51,'SERVICIOS DE COSTRUCCIÓN E INGENIERÍA',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(52,'SERVICIOS EMPRESARIALES',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(53,'SERVICIOS INFORMÁTICOS Y DE TELECOMUNICACIÓN',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(54,'SERVICIOS PARA LA AGROINDUSTRIA',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(55,'SERVICIOS Y ORGANIZACION DE EVENTOS',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(56,'TECNOLOGÍA Y EQUIPAMIENTO PARA AGROPECUARIA E INDUSTRIA',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(57,'TECNOLOGÍAS DE LA INFORMACIÓN Y COMUNICACIÓN',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(58,'TURISMO',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(59,'VEHÍCULOS AUTOMOTORES',NULL,NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36');
/*!40000 ALTER TABLE `rubros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rueda`
--

DROP TABLE IF EXISTS `rueda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rueda` (
  `rueda_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `habilitado` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`rueda_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rueda`
--

LOCK TABLES `rueda` WRITE;
/*!40000 ALTER TABLE `rueda` DISABLE KEYS */;
INSERT INTO `rueda` VALUES (1,0,NULL,'2020-08-31 08:40:36','2020-08-31 09:33:45');
/*!40000 ALTER TABLE `rueda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `usuario_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombres` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cuenta` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono_celular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `whatsapp` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_usuario` enum('administrador','empresa') COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Ebeliz','Fuentes Claros','admin123456789','ebelizfuentes@gmail.com','71100743','71100743','administrador','$2y$10$whi84uv5wlDX11jsvjdKe.3T719XDmaKnYoEKGtiixvXSABV89vSS',NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(2,'Ebeliz','Fuentes Claros','ebelizfuentes','ebelizfuentes@gmail.com','71100743','71100743','empresa','$2y$10$m3o7cM6Ew.JQRDNIAVHkZ.iOL.679tF9X7IcPtLI1xQPiqm.9uuem',NULL,'2020-08-31 08:40:36','2020-08-31 08:40:36'),(3,'EBELIZ','FUENTES','ebeliz7279581',NULL,'71100743','71100743','empresa','$2y$10$2BJT0uIh4AE/XC06jUCV..1iTZzCOImGOw/nFhDvMv/vjzm1IB3Pa',NULL,'2020-08-31 09:26:33','2020-08-31 09:26:33'),(4,'NILDA','FUENTES','nilda7279581',NULL,'71100743','71100743','empresa','$2y$10$1YZh/3L3ngwQ0WdKcK1akeIXOuALsH0dH9FHLeiUSFluBaknZXfOW',NULL,'2020-08-31 09:27:13','2020-08-31 09:27:13'),(5,'EBELIZ','FUENTES','ebeliz7279581',NULL,'71100742','71100743','empresa','$2y$10$VttW12NyrCPnd9ZRARLJ3O2XRMG7WQVI/sBihDJiyurwgJACnSrg6','2020-08-31 21:22:18','2020-08-31 09:30:23','2020-08-31 21:22:18'),(6,'FRANCO JESUS','MAMANI POZO','franco7275047',NULL,'76137653','76137653','empresa','$2y$10$BrnK/voZtkLKiOkpDPQtFerC8Z9jcME7hpGxMrF.BYInI57McDAmW','2020-08-31 17:12:47','2020-08-31 09:32:44','2020-08-31 17:12:47'),(7,'EBELIZ NILDA','CLAROS','ebeliz1234',NULL,'71919','71919','empresa','$2y$10$oMytiVfLar4jjB.PSR28hus9ZioQiU/ViMYPns3d8ZhzexMe7CUOG',NULL,'2020-08-31 10:21:58','2020-08-31 10:21:58'),(8,'JUAN','PEREZ','juan10101',NULL,'123','123','empresa','$2y$10$FuoCzNElz6TJ9c/XSv5vPuwHD/miYrpbSmLcYUs09zCUIcPSFFxja','2020-09-01 21:03:45','2020-08-31 12:45:16','2020-09-01 21:03:45'),(9,'JUAN','PEREZ','juan10102',NULL,'76543221','76543221','empresa','$2y$10$2lrK95SPY6RJ0Q21.bVdS.d47oFCteujYmUefrNVR4JrAVKs04nTq',NULL,'2020-08-31 12:52:00','2020-08-31 12:52:00'),(10,'JUAN','PEREZ','juan10103',NULL,'7654321','7654321','empresa','$2y$10$.NONpAmIPGpaCd9tXYhrCex/5UZbEc57wvAQYy89BtjkhQ5PDSZgO',NULL,'2020-08-31 12:54:34','2020-08-31 12:54:34'),(11,'JUAN','PEREZ','juan10104',NULL,'765311','765311','empresa','$2y$10$6RC1Uq/YPzR0sVwqJObF0.gm0cNDj1BKNhMecY79O8w83EBiSY5.6',NULL,'2020-08-31 12:56:37','2020-08-31 12:56:37'),(12,'JUAN','PEREZ','juan10105',NULL,'765','765','empresa','$2y$10$z5K48VAHspl91lNT4AhDF.jJj6omb5FKkS03COdboof.emEjcDYOm',NULL,'2020-08-31 12:59:30','2020-08-31 12:59:30'),(13,'JUAN','PEREZ','juan10106',NULL,'65','65','empresa','$2y$10$rlXC1HAqRghjyT6VxHv7M.1WjGj2MEPR6anqv.9vWfNXvGKvsWGhC',NULL,'2020-08-31 13:00:48','2020-08-31 13:00:48'),(14,'JUAN','PEREZ','juan10109',NULL,'76','76','empresa','$2y$10$UBdwsJ88j4SRjRCfDUJwIua6BUTYKn9mncpkKgFbQt05Fw6Ai9jgu','2020-09-01 21:04:20','2020-08-31 13:03:03','2020-09-01 21:04:20'),(15,'JUAN','PEREZ','juan101010',NULL,'7','7','empresa','$2y$10$r1aOlQ.D5rlveUPLiKIImegRGZ/8UN9t5p.tSZItU5O/igCd1.X7y',NULL,'2020-08-31 13:04:38','2020-08-31 13:04:38'),(16,'JUAN','PEREZ','juan101011',NULL,'7','7','empresa','$2y$10$vqSsuMP4tQzdr2qZv.aDyOY.DlfT1YF4WE3Y8gjDTuSU8TIPF1F7y',NULL,'2020-08-31 13:06:22','2020-08-31 13:06:22'),(17,'JUAN','PEREZ','juan101012',NULL,'1','1','empresa','$2y$10$OcnEgEeeAAUdzn/HHTXF/Oqm5xrh7XsZat8OBHPPdlyJPt.svcO/q',NULL,'2020-08-31 13:08:00','2020-08-31 13:08:00'),(18,'JUAN','PEREZ','juan101013',NULL,'1','1','empresa','$2y$10$fDbe85owmPqHyUGZFo1YROP9XXiVc0um5CFTFPQs/7vAyPSM/x9CO',NULL,'2020-08-31 13:09:59','2020-08-31 13:09:59'),(19,'LORETA','SAN QUINTIN','loreta123456789',NULL,'123456789','123456789','empresa','$2y$10$O/0zfdIojdXXyY9URONB9O91aK93rWSnLxwU6T8XU1IDqRcGYpM62',NULL,'2020-08-31 15:24:51','2020-08-31 15:24:51'),(20,'LORETA','SAN QUINTIN','loreta123456789',NULL,'123456789','123456789','empresa','$2y$10$rmI0P0vx1uccLM.sgiyFPu5UcNIzLn17.KBemVhH9GY.SQeQBKawy',NULL,'2020-08-31 15:25:23','2020-08-31 15:25:23'),(21,'SHIRLEY','LOPEZ SANCHEZ','shirley123456789',NULL,'123456789','123456789','empresa','$2y$10$4eKDYnb.X7CC/JwjyxBYbOLs6WCLSVLc/e7MHX22d9YiGFuEwheMC','2020-08-31 21:22:33','2020-08-31 16:57:55','2020-08-31 21:22:33'),(22,'JUAN','PEREZ','juan10107',NULL,'1','1','empresa','$2y$10$ZF9NKhOD6rZbqNLlUwOIiufbHxSrcB0fJ1w.FEFbymtmq4gjJWZ7C',NULL,'2020-08-31 21:28:38','2020-08-31 21:28:38'),(23,'JUAN','PEREZ','juan10108',NULL,'1','1','empresa','$2y$10$s4kYQ372GtKV5ZW3edQfwupWlUY76JyiNS2DmN42edxuVIvP3qsYS',NULL,'2020-08-31 21:30:49','2020-08-31 21:30:49'),(24,'JUAN','PEREZ','juan101014',NULL,'1','1','empresa','$2y$10$kaQbBjJ7zlyjFx8epZv9A.oL8bNOlkLDPMpYvmrX3RQwUL/EaoVTu',NULL,'2020-08-31 21:32:56','2020-08-31 21:32:56'),(25,'JUAN','PEREZ','juan101015','jhon.cf@hotmail.com','68351543','68351543','empresa','$2y$10$cZAJIsWsRWfLBxDZ.wXEe.3w9dD1vxqaFG1o4cxHuciFswhO0.hxi',NULL,'2020-09-01 09:30:23','2020-09-01 09:30:23'),(26,'JUAN','PEREZ','juan101020',NULL,'1','1','empresa','$2y$10$eHaXK2NfyZGBiAS842WUguC/Nti6VMTsafR0KH4ljun6oMYqytPia','2020-09-01 21:03:04','2020-09-01 11:23:45','2020-09-01 21:03:04'),(27,'JUAN','PEREZ','juan101016',NULL,'1','1','empresa','$2y$10$ilCm1AqYV576o6881smOyeRA77J6cxDBdSF5vRe0R4yV.t4imQbYC',NULL,'2020-09-01 22:02:18','2020-09-01 22:02:18');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-02  2:13:13
