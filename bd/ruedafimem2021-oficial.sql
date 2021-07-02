-- MariaDB dump 10.19  Distrib 10.5.10-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ruedafimem
-- ------------------------------------------------------
-- Server version	10.5.10-MariaDB-0ubuntu0.21.04.1

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
-- Table structure for table `agendas`
--

DROP TABLE IF EXISTS `agendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
  `habilitado` tinyint(1) NOT NULL DEFAULT 0,
  `max_participantes` int(10) unsigned NOT NULL DEFAULT 2,
  `oferta` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `demanda` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `especial` tinyint(1) NOT NULL DEFAULT 0,
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (1,3,2,'Campo Ferial 3 de Julio',NULL,'AV. CIRCUNVALACIÓN Y PROLONGACIÓN ESPAÑA','5266111','Bolivia, Estado Plurinacional de','Oruro','281488020','campoferial3dejulio.com','ROCIO VILLCA QUISPE',1,2,'Otros','Empresas',1,NULL,'no',NULL,'2020-09-11 09:38:30','2020-09-24 13:07:20'),(2,42,3,'CARMAR LTDA',NULL,'AV. 20 DE OCTUBRE N° 2665 EDIFICIO TORRE AZUL PISO 4 OFICINA 401','+591 (2) 2434561 - 2432630','Bolivia, Estado Plurinacional de','LA PAZ','1020671027','www.carmarltda.com','JUAN CARLOS JIMÉNEZ',0,2,'ofertas','demandas',0,NULL,'no',NULL,'2020-09-23 15:33:16','2020-09-24 14:28:16'),(3,37,4,'EMPRESA MINERA COROCORO',NULL,'A','71562620','Bolivia, Estado Plurinacional de','POTOSI','123456789',NULL,'FRANZ GONZALO GORENA GONZALES',0,2,'ofertas','demandas',0,NULL,'no',NULL,'2020-09-24 11:49:23','2020-09-24 13:04:44'),(4,37,5,'EMPRESA MINERA HUANUNI',NULL,'HUANUNI','72544913','Bolivia, Estado Plurinacional de','ORURO','1006965023',NULL,'ARTURO WALTER ARIAS SANDOVAL',0,2,'ofertas','demandas',0,NULL,'no',NULL,'2020-09-24 11:54:16','2020-09-24 13:03:32'),(5,37,6,'PLANTA INDUSTRIAL PULACAYO',NULL,'LA PAZ','71101499','Bolivia, Estado Plurinacional de','LA PAZ','1006569023',NULL,'PAOLA CAMPOVERDE',0,2,'ofertas','demandas',0,NULL,'no',NULL,'2020-09-24 11:58:15','2020-09-24 13:02:42'),(6,37,7,'UNIDAD DE COMERCIALIZACION - COMIBOL',NULL,'LA PAZ','72016499','Bolivia, Estado Plurinacional de','LA PAZ','1006569023',NULL,'ING.WILLIAM TICONAAGUILERA',0,2,'ofertas','demandas',0,NULL,'no',NULL,'2020-09-24 12:00:41','2020-09-24 13:01:36'),(7,37,8,'UNIDAD PRODUCTIVA MINA BLANCA CAOLIN',NULL,'LA PAZ','1','Bolivia, Estado Plurinacional de','LA PAZ','1',NULL,'A',0,2,'ofertas','demandas',0,NULL,'no',NULL,'2020-09-24 12:04:03','2020-09-24 13:00:39'),(8,37,9,'CENTRO DE INVESTIGACION MINERO METALURGICO - CIMM',NULL,'LA PAZ','1','Bolivia, Estado Plurinacional de','LA PAZ','1',NULL,'A',0,2,'ofertas','demandas',0,NULL,'no',NULL,'2020-09-24 12:06:21','2020-09-24 12:59:52'),(9,52,10,'GREEN FUTURE',NULL,'ORURO','1','Bolivia, Estado Plurinacional de','ORURO','1',NULL,'A',0,2,'ofertas','demandas',0,NULL,'no',NULL,'2020-09-24 12:09:39','2020-09-24 12:58:26'),(10,41,11,'COLHER GROUP SRL',NULL,'SANTA CRUZ','1','Bolivia, Estado Plurinacional de','SA','1',NULL,'A',0,2,'ofertas','demandas',0,NULL,'no',NULL,'2020-09-24 12:11:22','2020-09-24 12:55:13'),(11,41,12,'METAL 73',NULL,'ORURO','1','Bolivia, Estado Plurinacional de','ORURO','1',NULL,'A',0,2,'ofertas','demandas',0,NULL,'no',NULL,'2020-09-24 12:14:23','2020-09-24 13:06:28'),(12,41,13,'AUTO RUSH',NULL,'ORURO','1','Bolivia, Estado Plurinacional de','ORURO','1',NULL,'A',0,2,'ofertas','demandas',0,NULL,'no',NULL,'2020-09-24 12:15:51','2020-09-24 13:05:58'),(13,41,14,'ANDRES RAMIREZ',NULL,'ORURO','1','Bolivia, Estado Plurinacional de','ORURO','1',NULL,'A',0,2,'ofertas','demandas',0,NULL,'no',NULL,'2020-09-24 12:17:27','2020-09-24 13:06:09'),(14,37,15,'APALIP',NULL,'RIO SECO EXTRANCA','63266677','Bolivia, Estado Plurinacional de','EL ALTO','7047667',NULL,'RUDDY APAZA',0,2,'ofertas','demandas',0,NULL,'no','2020-09-24 20:15:18','2020-09-24 17:31:34','2020-09-24 20:15:18'),(15,37,16,'EMPRESA METALURGICA KARACHIPAMPA',NULL,'A','1','Bolivia, Estado Plurinacional de','A','1',NULL,'A',0,2,'ofertas','demandas',0,NULL,'no',NULL,'2020-09-24 18:20:52','2020-09-24 18:21:25'),(16,41,17,'NUEVO MILENIO SRL',NULL,'AA','1','Bolivia, Estado Plurinacional de','ORURO','1',NULL,'A',0,2,'ofertas','demandas',0,NULL,'no',NULL,'2020-09-24 18:28:42','2020-09-24 18:29:04'),(17,37,18,'EMPRESA MINERA COLQUIRI',NULL,'A','1','Bolivia, Estado Plurinacional de','LA PAZ','1',NULL,'A',0,2,'ofertas','demandas',0,NULL,'no',NULL,'2020-09-24 21:42:44','2020-09-24 21:43:09'),(18,41,19,'AJAM',NULL,'A','1','Bolivia, Estado Plurinacional de','OO','1',NULL,'A',0,2,'ofertas','demandas',0,NULL,'no',NULL,'2020-09-25 10:38:01','2020-09-25 10:38:14'),(19,41,20,'SENARECOM',NULL,'A','1','Bolivia, Estado Plurinacional de','A','1',NULL,'A',0,2,'ofertas','demandas',0,NULL,'no',NULL,'2020-09-25 12:20:14','2020-09-25 12:20:53'),(20,2,21,'SASE',NULL,'AV PRINCIPAL','25234455','Bolivia, Estado Plurinacional de','ORURO','12345667',NULL,'JUAN PEREZ',0,2,'ofertas','demandas',0,NULL,'no',NULL,'2021-06-04 11:58:46','2021-06-04 12:04:06');
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluacion_reuniones`
--

DROP TABLE IF EXISTS `evaluacion_reuniones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horarios` (
  `horario_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `inicio` datetime NOT NULL,
  `fin` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`horario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios`
--

LOCK TABLES `horarios` WRITE;
/*!40000 ALTER TABLE `horarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `horarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horarios_ocupados`
--

DROP TABLE IF EXISTS `horarios_ocupados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios_ocupados`
--

LOCK TABLES `horarios_ocupados` WRITE;
/*!40000 ALTER TABLE `horarios_ocupados` DISABLE KEYS */;
/*!40000 ALTER TABLE `horarios_ocupados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesas`
--

DROP TABLE IF EXISTS `mesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `mesas` VALUES (1,'1',NULL,NULL,'2020-09-11 09:38:30','2020-09-24 18:12:53'),(2,'2',NULL,NULL,'2020-09-11 09:38:30','2020-09-24 21:19:25'),(3,'3',NULL,NULL,'2020-09-11 09:38:30','2020-09-24 21:30:23'),(4,'4',NULL,NULL,'2020-09-11 09:38:30','2020-09-24 12:19:29'),(5,'5',NULL,NULL,'2020-09-11 09:38:30','2020-09-24 12:19:24');
/*!40000 ALTER TABLE `mesas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oferta_demandas`
--

LOCK TABLES `oferta_demandas` WRITE;
/*!40000 ALTER TABLE `oferta_demandas` DISABLE KEYS */;
INSERT INTO `oferta_demandas` VALUES (1,2,'EQUIPOS DE PROTECCIÓN PERSONAL','producto','oferta',NULL,'2020-09-23 15:33:16','2020-09-23 15:33:16'),(2,2,'DETECTORES DE GASES PORTATILES','producto','oferta',NULL,'2020-09-23 15:33:16','2020-09-23 15:33:16'),(3,2,'EXPLOSIVOS Y ACCESORIOS PARA VOLADURA ','producto','oferta',NULL,'2020-09-23 15:33:16','2020-09-23 15:33:16'),(4,3,'COBRE METÁLICO REFINADO','producto','oferta',NULL,'2020-09-24 11:49:23','2020-09-24 11:49:23'),(5,3,'PHMETRO DE MESA, PULVERIZADOR DE ANILLOS, VARIOS','producto','demanda',NULL,'2020-09-24 11:49:23','2020-09-24 11:49:23'),(6,3,'ACEITE 20W30, GRADEA, ISO 68, EP 220, RODAMIENTOS ','producto','demanda',NULL,'2020-09-24 11:49:23','2020-09-24 11:49:23'),(7,4,'PRODUCIMOS CONCENTRADOS DE ESTAÑO CON LEY >45%','producto','oferta',NULL,'2020-09-24 11:54:16','2020-09-24 11:54:16'),(8,4,'INSUMOS Y MATERIALES PARA EXPLOTACION DE ESTAÑO','producto','demanda',NULL,'2020-09-24 11:54:16','2020-09-24 11:54:16'),(9,4,'EQUIPOS, MAQUINARIAS PARA EXPLOTACION DE ESTAÑO','producto','demanda',NULL,'2020-09-24 11:54:16','2020-09-24 11:54:16'),(10,5,'CARROS METALEROS, BOMBAS TIPO WILFLEY, ENTRE OTROS','producto','oferta',NULL,'2020-09-24 11:58:15','2020-09-24 11:58:15'),(11,5,'OTROS','producto','demanda',NULL,'2020-09-24 11:58:15','2020-09-24 11:58:15'),(12,5,'FERRO SILICIO, FERRO MANGANESO ALTO CARBONO','producto','demanda',NULL,'2020-09-24 11:58:15','2020-09-24 11:58:15'),(13,5,'CEMENTO REFRACTARIO PARA BOBINA, CARTÓN DE ASBESTO','producto','demanda',NULL,'2020-09-24 11:58:15','2020-09-24 11:58:15'),(14,5,'BENTONITA SÓDICA, CEMENTO REFRACTARIO PARA CRISO','producto','demanda',NULL,'2020-09-24 11:58:15','2020-09-24 11:58:15'),(15,6,'VARIOS','producto','demanda',NULL,'2020-09-24 12:00:41','2020-09-24 12:00:41'),(16,7,'CAOLIN, ARCILLA BLANCA, AZUFRE','producto','oferta',NULL,'2020-09-24 12:04:03','2020-09-24 12:04:03'),(17,8,'VARIOS','producto','oferta',NULL,'2020-09-24 12:06:21','2020-09-24 12:06:21'),(18,9,'VARIOS','producto','oferta',NULL,'2020-09-24 12:09:39','2020-09-24 12:09:39'),(19,10,'VARIOS','producto','oferta',NULL,'2020-09-24 12:11:22','2020-09-24 12:11:22'),(20,11,'SERVICIO DE MOLIENDA, CONCENTRACIÓN DE MINERALES M','producto','oferta',NULL,'2020-09-24 12:14:23','2020-09-24 12:14:23'),(21,11,'ORO METÁLICO, PLATA METÁLICA, PALADIO, PLATINO,  C','producto','demanda',NULL,'2020-09-24 12:14:23','2020-09-24 12:14:23'),(22,12,'VARIOS','producto','oferta',NULL,'2020-09-24 12:15:51','2020-09-24 12:15:51'),(23,13,'PLANTA DE PRODUCCIÓN SULFATO DE COBRE - VENDER A P','producto','oferta',NULL,'2020-09-24 12:17:27','2020-09-24 12:17:27'),(24,2,'SEGURIDAD PARA TRABAJOS EN ALTURAS','producto','oferta',NULL,'2020-09-24 14:25:23','2020-09-24 14:25:23'),(25,14,'MINERAL','producto','oferta',NULL,'2020-09-24 17:31:34','2020-09-24 17:31:34'),(26,15,'OFRECE LINGOTES DE PLOMO Y PLATA TAMBIÈN SUBPRODUC','producto','oferta',NULL,'2020-09-24 18:20:52','2020-09-24 18:20:52'),(27,16,'VARIOS','producto','oferta',NULL,'2020-09-24 18:28:42','2020-09-24 18:28:42'),(28,17,'VARIOS','producto','oferta',NULL,'2020-09-24 21:42:44','2020-09-24 21:42:44'),(29,18,'VARIOS','producto','oferta',NULL,'2020-09-25 10:38:01','2020-09-25 10:38:01'),(30,19,'VARIOS','producto','oferta',NULL,'2020-09-25 12:20:14','2020-09-25 12:20:14'),(31,20,'CONSULTORIA EN MEDIO AMBIENTE','servicio','oferta',NULL,'2021-06-04 11:58:46','2021-06-04 11:58:46'),(32,20,'EQUIPOS DE MEDICION','producto','demanda',NULL,'2021-06-04 11:58:46','2021-06-04 11:58:46');
/*!40000 ALTER TABLE `oferta_demandas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `paises` VALUES (1,'Bolivia, Estado Plurinacional de','+591','BO',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(2,'Afghanistan','+93','AF',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(3,'Albania','+355','AL',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(4,'Algeria','+213','DZ',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(5,'AmericanSamoa','+1 684','AS',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(6,'Andorra','+376','AD',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(7,'Angola','+244','AO',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(8,'Anguilla','+1 264','AI',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(9,'Antigua and Barbuda','+1268','AG',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(10,'Argentina','+54','AR',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(11,'Armenia','+374','AM',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(12,'Aruba','+297','AW',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(13,'Australia','+61','AU',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(14,'Austria','+43','AT',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(15,'Azerbaijan','+994','AZ',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(16,'Bahamas','+1 242','BS',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(17,'Bahrain','+973','BH',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(18,'Bangladesh','+880','BD',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(19,'Barbados','+1 246','BB',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(20,'Belarus','+375','BY',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(21,'Belgium','+32','BE',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(22,'Belize','+501','BZ',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(23,'Benin','+229','BJ',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(24,'Bermuda','+1 441','BM',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(25,'Bhutan','+975','BT',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(26,'Bosnia and Herzegovina','+387','BA',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(27,'Botswana','+267','BW',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(28,'Brazil','+55','BR',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(29,'British Indian Ocean Territory','+246','IO',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(30,'Bulgaria','+359','BG',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(31,'Burkina Faso','+226','BF',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(32,'Burundi','+257','BI',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(33,'Cambodia','+855','KH',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(34,'Cameroon','+237','CM',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(35,'Canada','+1','CA',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(36,'Cape Verde','+238','CV',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(37,'Cayman Islands','+ 345','KY',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(38,'Central African Republic','+236','CF',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(39,'Chad','+235','TD',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(40,'Chile','+56','CL',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(41,'China','+86','CN',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(42,'Christmas Island','+61','CX',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(43,'Colombia','+57','CO',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(44,'Comoros','+269','KM',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(45,'Congo','+242','CG',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(46,'Cook Islands','+682','CK',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(47,'Costa Rica','+506','CR',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(48,'Croatia','+385','HR',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(49,'Cuba','+53','CU',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(50,'Cyprus','+537','CY',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(51,'Czech Republic','+420','CZ',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(52,'Denmark','+45','DK',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(53,'Djibouti','+253','DJ',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(54,'Dominica','+1 767','DM',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(55,'Dominican Republic','+1 849','DO',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(56,'Ecuador','+593','EC',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(57,'Egypt','+20','EG',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(58,'El Salvador','+503','SV',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(59,'Equatorial Guinea','+240','GQ',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(60,'Eritrea','+291','ER',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(61,'Estonia','+372','EE',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(62,'Ethiopia','+251','ET',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(63,'Faroe Islands','+298','FO',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(64,'Fiji','+679','FJ',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(65,'Finland','+358','FI',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(66,'France','+33','FR',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(67,'French Guiana','+594','GF',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(68,'French Polynesia','+689','PF',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(69,'Gabon','+241','GA',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(70,'Gambia','+220','GM',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(71,'Georgia','+995','GE',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(72,'Germany','+49','DE',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(73,'Ghana','+233','GH',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(74,'Gibraltar','+350','GI',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(75,'Greece','+30','GR',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(76,'Greenland','+299','GL',NULL,'2020-09-11 09:42:55','2020-09-11 09:42:55'),(77,'Grenada','+1 473','GD',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(78,'Guadeloupe','+590','GP',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(79,'Guam','+1 671','GU',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(80,'Guatemala','+502','GT',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(81,'Guinea','+224','GN',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(82,'Guinea-Bissau','+245','GW',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(83,'Guyana','+595','GY',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(84,'Haiti','+509','HT',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(85,'Honduras','+504','HN',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(86,'Hungary','+36','HU',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(87,'Iceland','+354','IS',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(88,'India','+91','IN',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(89,'Indonesia','+62','ID',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(90,'Iraq','+964','IQ',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(91,'Ireland','+353','IE',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(92,'Israel','+972','IL',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(93,'Italy','+39','IT',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(94,'Jamaica','+1 876','JM',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(95,'Japan','+81','JP',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(96,'Jordan','+962','JO',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(97,'Kazakhstan','+7 7','KZ',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(98,'Kenya','+254','KE',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(99,'Kiribati','+686','KI',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(100,'Kuwait','+965','KW',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(101,'Kyrgyzstan','+996','KG',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(102,'Latvia','+371','LV',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(103,'Lebanon','+961','LB',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(104,'Lesotho','+266','LS',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(105,'Liberia','+231','LR',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(106,'Liechtenstein','+423','LI',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(107,'Lithuania','+370','LT',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(108,'Luxembourg','+352','LU',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(109,'Madagascar','+261','MG',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(110,'Malawi','+265','MW',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(111,'Malaysia','+60','MY',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(112,'Maldives','+960','MV',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(113,'Mali','+223','ML',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(114,'Malta','+356','MT',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(115,'Marshall Islands','+692','MH',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(116,'Martinique','+596','MQ',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(117,'Mauritania','+222','MR',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(118,'Mauritius','+230','MU',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(119,'Mayotte','+262','YT',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(120,'Mexico','+52','MX',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(121,'Monaco','+377','MC',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(122,'Mongolia','+976','MN',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(123,'Montenegro','+382','ME',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(124,'Montserrat','+1664','MS',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(125,'Morocco','+212','MA',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(126,'Myanmar','+95','MM',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(127,'Namibia','+264','NA',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(128,'Nauru','+674','NR',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(129,'Nepal','+977','NP',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(130,'Netherlands','+31','NL',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(131,'Netherlands Antilles','+599','AN',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(132,'New Caledonia','+687','NC',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(133,'New Zealand','+64','NZ',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(134,'Nicaragua','+505','NI',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(135,'Niger','+227','NE',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(136,'Nigeria','+234','NG',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(137,'Niue','+683','NU',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(138,'Norfolk Island','+672','NF',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(139,'Northern Mariana Islands','+1 670','MP',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(140,'Norway','+47','NO',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(141,'Oman','+968','OM',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(142,'Pakistan','+92','PK',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(143,'Palau','+680','PW',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(144,'Panama','+507','PA',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(145,'Papua New Guinea','+675','PG',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(146,'Paraguay','+595','PY',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(147,'Peru','+51','PE',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(148,'Philippines','+63','PH',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(149,'Poland','+48','PL',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(150,'Portugal','+351','PT',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(151,'Puerto Rico','+1 939','PR',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(152,'Qatar','+974','QA',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(153,'Romania','+40','RO',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(154,'Rwanda','+250','RW',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(155,'Samoa','+685','WS',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(156,'San Marino','+378','SM',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(157,'Saudi Arabia','+966','SA',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(158,'Senegal','+221','SN',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(159,'Serbia','+381','RS',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(160,'Seychelles','+248','SC',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(161,'Sierra Leone','+232','SL',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(162,'Singapore','+65','SG',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(163,'Slovakia','+421','SK',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(164,'Slovenia','+386','SI',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(165,'Solomon Islands','+677','SB',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(166,'South Africa','+27','ZA',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(167,'South Georgia and the South Sandwich Islands','+500','GS',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(168,'Spain','+34','ES',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(169,'Sri Lanka','+94','LK',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(170,'Sudan','+249','SD',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(171,'Suripais','+597','SR',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(172,'Swaziland','+268','SZ',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(173,'Sweden','+46','SE',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(174,'Switzerland','+41','CH',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(175,'Tajikistan','+992','TJ',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(176,'Thailand','+66','TH',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(177,'Togo','+228','TG',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(178,'Tokelau','+690','TK',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(179,'Tonga','+676','TO',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(180,'Trinidad and Tobago','+1 868','TT',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(181,'Tunisia','+216','TN',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(182,'Turkey','+90','TR',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(183,'Turkmenistan','+993','TM',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(184,'Turks and Caicos Islands','+1 649','TC',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(185,'Tuvalu','+688','TV',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(186,'Uganda','+256','UG',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(187,'Ukraine','+380','UA',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(188,'United Arab Emirates','+971','AE',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(189,'United Kingdom','+44','GB',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(190,'United States','+1','US',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(191,'Uruguay','+598','UY',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(192,'Uzbekistan','+998','UZ',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(193,'Vanuatu','+678','VU',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(194,'Wallis and Futuna','+681','WF',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(195,'Yemen','+967','YE',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(196,'Zambia','+260','ZM',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(197,'Zimbabwe','+263','ZW',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(198,'land Islands',NULL,'AX',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(199,'Antarctica',NULL,'AQ',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(200,'Brunei Darussalam','+673','BN',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(201,'Cocos (Keeling) Islands','+61','CC',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(202,'Congo, The Democratic Republic of the','+243','CD',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(203,'Cote d\'Ivoire','+225','CI',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(204,'Falkland Islands (Malvinas)','+500','FK',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(205,'Guernsey','+44','GG',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(206,'Holy See (Vatican City State)','+379','VA',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(207,'Hong Kong','+852','HK',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(208,'Iran, Islamic Republic of','+98','IR',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(209,'Isle of Man','+44','IM',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(210,'Jersey','+44','JE',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(211,'Korea, Democratic People\'s Republic of','+850','KP',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(212,'Korea, Republic of','+82','KR',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(213,'Lao People\'s Democratic Republic','+856','LA',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(214,'Libyan Arab Jamahiriya','+218','LY',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(215,'Macao','+853','MO',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(216,'Macedonia, The Former Yugoslav Republic of','+389','MK',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(217,'Micronesia, Federated States of','+691','FM',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(218,'Moldova, Republic of','+373','MD',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(219,'Mozambique','+258','MZ',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(220,'Palestinian Territory, Occupied','+970','PS',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(221,'Pitcairn','+872','PN',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(222,'Réunion','+262','RE',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(223,'Russia','+7','RU',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(224,'Saint Barthélemy','+590','BL',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(225,'Saint Helena, Ascension and Tristan Da Cunha','+290','SH',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(226,'Saint Kitts and Nevis','+1 869','KN',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(227,'Saint Lucia','+1 758','LC',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(228,'Saint Martin','+590','MF',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(229,'Saint Pierre and Miquelon','+508','PM',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(230,'Saint Vincent and the Grenadines','+1 784','VC',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(231,'Sao Tome and Principe','+239','ST',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(232,'Somalia','+252','SO',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(233,'Svalbard and Jan Mayen','+47','SJ',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(234,'Syrian Arab Republic','+963','SY',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(235,'Taiwan, Province of China','+886','TW',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(236,'Tanzania, United Republic of','+255','TZ',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(237,'Timor-Leste','+670','TL',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(238,'Venezuela, Bolivarian Republic of','+58','VE',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(239,'Viet Nam','+84','VN',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(240,'Virgin Islands, British','+1 284','VG',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56'),(241,'Virgin Islands, U.S.','+1 340','VI',NULL,'2020-09-11 09:42:56','2020-09-11 09:42:56');
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participantes`
--

DROP TABLE IF EXISTS `participantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participantes` (
  `participante_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` int(10) unsigned NOT NULL,
  `nombres` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carnet` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `celular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cargo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `es_usuario` tinyint(1) NOT NULL DEFAULT 0,
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
INSERT INTO `participantes` VALUES (1,1,'Andrea Luisa','Silvestre Lobo','7287697','61836193','SISTEMAS',0,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(2,2,'GABRIEL4839957','ZELADA VARGAS','4839957','71820507','ASISTENTE TÉCNICO COMERCIAL',1,NULL,'2020-09-23 15:33:16','2020-09-23 15:33:16'),(3,2,'GONZALO','GUTIÉRREZ CALLAU','3428398','76756308','JEFE COMERCIAL',0,NULL,'2020-09-23 15:33:16','2020-09-23 15:33:16'),(4,3,'FI','FIMEM','1','1','A',1,NULL,'2020-09-24 11:49:23','2020-09-24 11:49:23'),(5,4,'FI','FI','2','72544913','A',1,NULL,'2020-09-24 11:54:16','2020-09-24 11:54:16'),(6,5,'FI','FI','3','71101499','A',1,NULL,'2020-09-24 11:58:15','2020-09-24 11:58:15'),(7,6,'FI','FI','4','72016499','A',1,NULL,'2020-09-24 12:00:41','2020-09-24 12:00:41'),(8,7,'FI','FI','5','1','A',1,NULL,'2020-09-24 12:04:03','2020-09-24 12:04:03'),(9,8,'FI','FI','6','1','A',1,NULL,'2020-09-24 12:06:21','2020-09-24 12:06:21'),(10,9,'FI','FI','7','1','A',1,NULL,'2020-09-24 12:09:39','2020-09-24 12:09:39'),(11,10,'FI','FI','8','1','A',1,NULL,'2020-09-24 12:11:22','2020-09-24 12:11:22'),(12,11,'FI','FI','9','1','A',1,NULL,'2020-09-24 12:14:23','2020-09-24 12:14:23'),(13,12,'FI','FI','10','1','A',1,NULL,'2020-09-24 12:15:51','2020-09-24 12:15:51'),(14,13,'FI','FI','11','1','A',1,NULL,'2020-09-24 12:17:27','2020-09-24 12:17:27'),(15,14,'RUDDY FRANZ','APAZA LIPA','7047667','63266677','DUEÑO',1,'2020-09-24 20:15:18','2020-09-24 17:31:34','2020-09-24 20:15:18'),(16,15,'FI','FI','12','1','A',1,NULL,'2020-09-24 18:20:52','2020-09-24 18:20:52'),(17,16,'FI','FI','13','1','A',1,NULL,'2020-09-24 18:28:42','2020-09-24 18:28:42'),(18,17,'FI','FI','14','1','Q',1,NULL,'2020-09-24 21:42:44','2020-09-24 21:42:44'),(19,18,'FI','FI','15','1','A',1,NULL,'2020-09-25 10:38:01','2020-09-25 10:38:01'),(20,19,'FI','FI','16','1','A',1,NULL,'2020-09-25 12:20:14','2020-09-25 12:20:14'),(21,20,'JUAN','PEREZ','7279581','71100743','VENTAS',1,NULL,'2021-06-04 11:58:46','2021-06-04 11:58:46');
/*!40000 ALTER TABLE `participantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reuniones` (
  `reunion_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mesa_id` int(10) unsigned NOT NULL,
  `empresa_solicitante_id` int(10) unsigned NOT NULL,
  `empresa_demandada_id` int(10) unsigned NOT NULL,
  `empresa_solicitante_asistio` tinyint(1) NOT NULL DEFAULT 0,
  `empresa_demandada_asistio` tinyint(1) NOT NULL DEFAULT 0,
  `resultado` enum('satisfactoria','ausencia','agendado') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'agendado',
  `desde` datetime NOT NULL,
  `hasta` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`reunion_id`),
  KEY `reuniones_mesa_id_foreign` (`mesa_id`),
  CONSTRAINT `reuniones_mesa_id_foreign` FOREIGN KEY (`mesa_id`) REFERENCES `mesas` (`mesa_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reuniones`
--

LOCK TABLES `reuniones` WRITE;
/*!40000 ALTER TABLE `reuniones` DISABLE KEYS */;
INSERT INTO `reuniones` VALUES (1,3,2,3,0,0,'agendado','2020-09-26 15:00:00','2020-09-26 15:25:00',NULL,'2020-09-24 14:10:25','2020-09-24 14:10:25'),(2,1,2,4,0,0,'agendado','2020-09-25 11:00:00','2020-09-25 11:25:00',NULL,'2020-09-24 14:10:45','2020-09-24 14:10:45'),(3,1,2,5,0,0,'agendado','2020-09-25 10:30:00','2020-09-25 10:55:00',NULL,'2020-09-24 14:10:49','2020-09-24 14:10:49'),(4,2,2,7,0,0,'agendado','2020-09-26 09:00:00','2020-09-26 09:25:00',NULL,'2020-09-24 14:10:59','2020-09-24 14:10:59'),(5,3,2,6,0,0,'agendado','2020-09-26 16:00:00','2020-09-26 16:25:00',NULL,'2020-09-24 14:40:06','2020-09-24 14:40:06'),(6,3,12,3,0,0,'agendado','2020-09-25 14:00:00','2020-09-25 14:25:00','2020-09-25 09:54:00','2020-09-24 19:18:35','2020-09-25 09:54:00'),(7,3,12,4,0,0,'agendado','2020-09-25 10:30:00','2020-09-25 10:55:00','2020-09-25 09:53:55','2020-09-24 19:18:49','2020-09-25 09:53:55'),(8,2,12,5,0,0,'agendado','2020-09-25 09:30:00','2020-09-25 09:55:00','2020-09-25 09:56:15','2020-09-24 19:19:01','2020-09-25 09:56:15'),(9,1,12,7,0,0,'agendado','2020-09-26 11:00:00','2020-09-26 11:25:00',NULL,'2020-09-24 19:19:32','2020-09-24 19:19:32'),(10,1,12,8,0,0,'agendado','2020-09-25 09:00:00','2020-09-25 09:25:00','2020-09-25 09:53:49','2020-09-24 19:19:39','2020-09-25 09:53:49'),(11,2,13,3,0,0,'agendado','2020-09-25 15:30:00','2020-09-25 15:55:00',NULL,'2020-09-24 19:21:27','2020-09-24 19:21:27'),(12,2,13,4,0,0,'agendado','2020-09-25 11:30:00','2020-09-25 11:55:00',NULL,'2020-09-24 19:21:37','2020-09-24 19:21:37'),(13,3,13,5,0,0,'agendado','2020-09-25 10:00:00','2020-09-25 10:25:00',NULL,'2020-09-24 19:21:42','2020-09-24 19:21:42'),(14,1,13,6,0,0,'agendado','2020-09-26 17:30:00','2020-09-26 17:55:00',NULL,'2020-09-24 19:21:50','2020-09-24 19:21:50'),(15,3,13,7,0,0,'agendado','2020-09-26 11:30:00','2020-09-26 11:55:00',NULL,'2020-09-24 19:21:56','2020-09-24 19:21:56'),(16,3,13,8,0,0,'agendado','2020-09-25 11:00:00','2020-09-25 11:25:00',NULL,'2020-09-24 19:22:01','2020-09-24 19:22:01'),(17,3,10,3,0,0,'agendado','2020-09-25 15:00:00','2020-09-25 15:25:00',NULL,'2020-09-24 19:29:52','2020-09-24 19:29:52'),(18,2,10,11,0,0,'agendado','2020-09-25 17:00:00','2020-09-25 17:25:00',NULL,'2020-09-24 19:30:46','2020-09-24 19:30:46'),(19,3,9,7,0,0,'agendado','2020-09-26 10:00:00','2020-09-26 10:25:00',NULL,'2020-09-24 19:31:55','2020-09-24 19:31:55'),(20,1,9,11,0,0,'agendado','2020-09-26 09:00:00','2020-09-26 09:25:00',NULL,'2020-09-24 19:32:09','2020-09-24 19:32:09'),(21,3,11,3,0,0,'agendado','2020-09-26 14:30:00','2020-09-26 14:55:00',NULL,'2020-09-24 19:46:04','2020-09-24 19:46:04'),(22,2,11,4,0,0,'agendado','2020-09-25 10:00:00','2020-09-25 10:25:00',NULL,'2020-09-24 19:46:10','2020-09-24 19:46:10'),(23,2,11,5,0,0,'agendado','2020-09-25 09:00:00','2020-09-25 09:25:00',NULL,'2020-09-24 19:46:13','2020-09-24 19:46:13'),(24,3,11,6,0,0,'agendado','2020-09-26 17:00:00','2020-09-26 17:25:00',NULL,'2020-09-24 19:46:18','2020-09-24 19:46:18'),(25,2,11,7,0,0,'agendado','2020-09-26 09:30:00','2020-09-26 09:55:00',NULL,'2020-09-24 19:46:26','2020-09-24 19:46:26'),(26,2,11,8,0,0,'agendado','2020-09-25 10:30:00','2020-09-25 10:55:00',NULL,'2020-09-24 19:46:33','2020-09-24 19:46:33'),(27,3,16,3,0,0,'agendado','2020-09-25 14:30:00','2020-09-25 14:55:00',NULL,'2020-09-24 20:15:43','2020-09-24 20:15:43'),(28,3,16,5,0,0,'agendado','2020-09-25 11:30:00','2020-09-25 11:55:00',NULL,'2020-09-24 20:16:16','2020-09-24 20:16:16'),(29,3,15,2,0,0,'agendado','2020-09-25 09:30:00','2020-09-25 09:55:00',NULL,'2020-09-24 21:31:51','2020-09-24 21:31:51'),(30,2,15,11,0,0,'agendado','2020-09-25 11:00:00','2020-09-25 11:25:00',NULL,'2020-09-24 21:32:12','2020-09-24 21:32:12'),(31,1,15,12,0,0,'agendado','2020-09-25 11:30:00','2020-09-25 11:55:00','2020-09-25 09:56:22','2020-09-24 21:32:18','2020-09-25 09:56:22'),(32,3,15,13,0,0,'agendado','2020-09-25 09:00:00','2020-09-25 09:25:00',NULL,'2020-09-24 21:32:22','2020-09-24 21:32:22'),(33,1,15,16,0,0,'agendado','2020-09-25 10:00:00','2020-09-25 10:25:00',NULL,'2020-09-24 21:32:30','2020-09-24 21:32:30'),(34,3,17,2,0,0,'agendado','2020-09-26 11:00:00','2020-09-26 11:25:00',NULL,'2020-09-24 21:44:53','2020-09-24 21:44:53'),(35,2,17,9,0,0,'agendado','2020-09-26 11:30:00','2020-09-26 11:55:00',NULL,'2020-09-24 21:45:10','2020-09-24 21:45:10'),(36,1,17,11,0,0,'agendado','2020-09-26 10:30:00','2020-09-26 10:55:00',NULL,'2020-09-24 21:45:25','2020-09-24 21:45:25'),(37,3,17,12,0,0,'agendado','2020-09-26 09:00:00','2020-09-26 09:25:00',NULL,'2020-09-24 21:45:27','2020-09-24 21:45:27'),(38,3,17,13,0,0,'agendado','2020-09-26 09:30:00','2020-09-26 09:55:00',NULL,'2020-09-24 21:45:31','2020-09-24 21:45:31'),(39,1,17,16,0,0,'agendado','2020-09-25 09:30:00','2020-09-25 09:55:00','2020-09-25 12:13:54','2020-09-24 21:45:40','2020-09-25 12:13:54'),(40,1,10,6,0,0,'agendado','2020-09-26 16:30:00','2020-09-26 16:55:00',NULL,'2020-09-25 03:40:50','2020-09-25 03:40:50'),(41,3,10,7,0,0,'agendado','2020-09-26 10:30:00','2020-09-26 10:55:00',NULL,'2020-09-25 03:41:00','2020-09-25 03:41:00'),(42,2,10,17,0,0,'agendado','2020-09-26 10:00:00','2020-09-26 10:25:00',NULL,'2020-09-25 03:42:38','2020-09-25 03:42:38'),(43,2,12,3,0,0,'agendado','2020-09-26 15:30:00','2020-09-26 15:55:00','2020-09-25 20:24:23','2020-09-25 09:55:00','2020-09-25 20:24:23'),(44,3,18,12,0,0,'agendado','2020-09-27 11:30:00','2020-09-27 11:55:00','2020-09-25 12:17:50','2020-09-25 10:39:20','2020-09-25 12:17:50'),(45,3,18,13,0,0,'agendado','2020-09-27 14:30:00','2020-09-27 14:55:00',NULL,'2020-09-25 10:39:26','2020-09-25 10:39:26'),(46,3,18,16,0,0,'agendado','2020-09-27 09:00:00','2020-09-27 09:25:00',NULL,'2020-09-25 10:39:33','2020-09-25 10:39:33'),(47,2,17,16,0,0,'agendado','2020-09-27 11:00:00','2020-09-27 11:25:00',NULL,'2020-09-25 12:15:15','2020-09-25 12:15:15'),(48,2,18,10,0,0,'agendado','2020-09-27 17:00:00','2020-09-27 17:25:00',NULL,'2020-09-25 12:18:11','2020-09-25 12:18:11'),(49,1,19,10,0,0,'agendado','2020-09-26 14:30:00','2020-09-26 14:55:00',NULL,'2020-09-25 12:21:51','2020-09-25 12:21:51'),(50,3,19,13,0,0,'agendado','2020-09-26 14:00:00','2020-09-26 14:25:00',NULL,'2020-09-25 12:22:10','2020-09-25 12:22:10'),(51,1,20,2,0,0,'agendado','2020-09-26 14:00:00','2020-09-26 14:25:00',NULL,'2021-06-04 12:44:25','2021-06-04 12:44:25');
/*!40000 ALTER TABLE `reuniones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rubros`
--

DROP TABLE IF EXISTS `rubros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `rubros` VALUES (1,'AGRÍCOLA',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(2,'ALIMENTOS Y BEBIDAS',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(3,'ALMACENAMIENTO Y DISTRIBUCIÓN',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(4,'ARTES ESCENICAS',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(5,'ARTES LITERARIAS',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(6,'ARTES MUSICALES',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(7,'ARTES PLASTICAS',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(8,'ARTESANIAS',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(9,'ARTÍCULOS DE LIMPIEZA Y DESINFECCION',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(10,'ARTÍCULOS',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(11,'BANCOS Y FINANCIERAS',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(12,'CÁMARAS Y ORGANIZACIONES EMPRESARIALES',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(13,'COMPAÑÍA DE TRADING',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(14,'COSMÉTICOS',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(15,'CUERO CALZADO Y MANUFACTURAS DE CUERO',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(16,'ELECTRODOMÉSTICOS Y LÍNEA BLANCA',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(17,'ENVASES',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(18,'EQUIPOS DE TECNÓLOGÍA PARA LA INDUSTRIA MINERA',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(19,'EQUIPOS E IMPLEMENTOS HIDRAULICOS',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(20,'EQUIPOS ELÉCTRICOS',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(21,'FARMACIA',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(22,'FERRETERÍA Y HERRAMIENTAS',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(23,'FLETES Y TRANSPORTE',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(24,'GOBIERNO Y SUS ORGANISMOS',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(25,'HIDROCARBUROS',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(26,'INDUSTRIA DE ENERGIAS LIMPIAS',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(27,'INDUSTRIA DE LA MADERA Y MUEBLES EN GENERAL',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(28,'INDUSTRIA ENERGETICA',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(29,'INDUSTRIA METALURGICA',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(30,'INDUSTRIA PAPELERA Y GRÁFICA',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(31,'INDUSTRIA TEXTIL',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(32,'JOYERÍA. BISUTERÍA Y ORFEBRERÍA',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(33,'JUGUETERÍA Y ARTÍCULOS DE ENTRETENIMIENTO',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(34,'MERCADOTECNIA',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(35,'METALMECÁNICA Y ELECTROMECÁNICA',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(36,'MINERIA ENERGETICA',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(37,'MINERIA METALURGICA',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(38,'MINERIA NO METALURGICA',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(39,'ORGANISMOS INTERNACIONALES',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(40,'ORGANIZACIONES DE ECOLÓGÍA Y PROTECCIÓN DE MEDIO AMBIENTE',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(41,'OTROS',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(42,'OTROS SERVICIOS',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(43,'PLÁSTICOS O AFINES',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(44,'PRODUCCION AUDIOVISUAL',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(45,'PRODUCTOS PARA LA CONTRUCCIÓN Y DECORACIÓN',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(46,'QUÍMICOS Y REACTIVOS',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(47,'SEGUROS',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(48,'SERVICIOS ADUANEROS',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(49,'SERVICIOS DE CONSULTORIA AMBIENTAL',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(50,'SERVICIOS DE CONSULTORIA EN SEGURIDAD INDUSTRIAL',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(51,'SERVICIOS DE COSTRUCCIÓN E INGENIERÍA',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(52,'SERVICIOS EMPRESARIALES',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(53,'SERVICIOS INFORMÁTICOS Y DE TELECOMUNICACIÓN',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(54,'SERVICIOS PARA LA AGROINDUSTRIA',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(55,'SERVICIOS Y ORGANIZACION DE EVENTOS',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(56,'TECNOLOGÍA Y EQUIPAMIENTO PARA AGROPECUARIA E INDUSTRIA',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(57,'TECNOLOGÍAS DE LA INFORMACIÓN Y COMUNICACIÓN',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(58,'TURISMO',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(59,'VEHÍCULOS AUTOMOTORES',NULL,NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30');
/*!40000 ALTER TABLE `rubros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rueda`
--

DROP TABLE IF EXISTS `rueda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rueda` (
  `rueda_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `habilitado` tinyint(1) NOT NULL DEFAULT 0,
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
INSERT INTO `rueda` VALUES (1,0,NULL,'2020-09-11 09:38:30','2021-07-02 20:25:50');
/*!40000 ALTER TABLE `rueda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Ebeliz','Fuentes Claros','admin123456789','ebelizfuentes@gmail.com','71100743','71100743','administrador','$2y$10$JyZAJdNogNdVfqo0eRcSAO6CEAUBrg7TZ8UEPcSKr2zOAX3xkAsti',NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(2,'Ebeliz','Fuentes Claros','ebelizfuentes','ebelizfuentes@gmail.com','71100743','71100743','empresa','$2y$10$HnqvqjXWLot/TJMs/5x5DuMedd07Vh567Io0I3eZB/nHdxqHDufhi',NULL,'2020-09-11 09:38:30','2020-09-11 09:38:30'),(3,'GABRIEL4839957','ZELADA VARGAS','gabriel48399574839957','gzelada@carmarltda.com','71820507','71820507','empresa','$2y$10$eMRvgRY2dVu/HKFqBuCqROD2MftBUPTFUgfGj4QNWpwoRhKn.wJbu',NULL,'2020-09-23 15:33:16','2020-09-23 15:33:16'),(4,'FI','FIMEM','fi1',NULL,'1','1','empresa','$2y$10$SVQoSlGbQcB6zl1JP/KGCuletnfh36nmKQ6rvV66Q2TductCYbb.C',NULL,'2020-09-24 11:49:23','2020-09-24 11:49:23'),(5,'FI','FI','fi2',NULL,'72544913','72544913','empresa','$2y$10$yNkVqRro9/83lH9se2/YFe31.P4P8LdcnznHij02WWEK4pbd9Eb8C',NULL,'2020-09-24 11:54:16','2020-09-24 11:54:16'),(6,'FI','FI','fi3',NULL,'71101499','71101499','empresa','$2y$10$j.1.O28TsRKHdwcbe9VFLe8V4OS5JWCmnF5IPvjW.DxQAauB//Cxq',NULL,'2020-09-24 11:58:15','2020-09-24 11:58:15'),(7,'FI','FI','fi4',NULL,'72016499','72016499','empresa','$2y$10$cvI2oht7s5PTyxYApYn72OSpfISiMTu1kW664fmC36bnH6hljytv.',NULL,'2020-09-24 12:00:41','2020-09-24 12:00:41'),(8,'FI','FI','fi5',NULL,'1','1','empresa','$2y$10$VfQF5oJ5t9OHdM/zDoX15.6wp9sx.jSeAUlBsNvNZ04uq21xKsL/G',NULL,'2020-09-24 12:04:03','2020-09-24 12:04:03'),(9,'FI','FI','fi6',NULL,'1','1','empresa','$2y$10$qiJZZfo9sm9a1I3/wqbeSOomUZ3Qbv9bNADMbBOFjTUgPiowWrQ/S',NULL,'2020-09-24 12:06:21','2020-09-24 12:06:21'),(10,'FI','FI','fi7',NULL,'1','1','empresa','$2y$10$EH898F0irqox.wRvKoytbuUe3rTwGx9d3QqDSauLMgJqTb32CWQZK',NULL,'2020-09-24 12:09:39','2020-09-24 12:09:39'),(11,'FI','FI','fi8',NULL,'1','1','empresa','$2y$10$rSY.0367C2FZgfArktZUZu8FZCM0O9aFyVtOHI5aj0s9dewCwBUL6',NULL,'2020-09-24 12:11:22','2020-09-24 12:11:22'),(12,'FI','FI','fi9',NULL,'1','1','empresa','$2y$10$S3XaBY1MfGyl1BoeqOVSFOnMLE56wQWfwL9qT7tw6zfk6.MsMcscS',NULL,'2020-09-24 12:14:23','2020-09-24 12:14:23'),(13,'FI','FI','fi10',NULL,'1','1','empresa','$2y$10$xDd4kUaCLka3w6MGzSdt0.Ivg5XDsXrorFTbop9ktXbY/abHzTzTS',NULL,'2020-09-24 12:15:51','2020-09-24 12:15:51'),(14,'FI','FI','fi11',NULL,'1','1','empresa','$2y$10$Mmisp9ONVBl/NjW0T3KLMerryGcG4eGGNuFCi9riqv1k.n./Ckm0a',NULL,'2020-09-24 12:17:27','2020-09-24 12:17:27'),(15,'RUDDY FRANZ','APAZA LIPA','ruddy7047667','ralf.1995.crj@gmail.com','63266677','63266677','empresa','$2y$10$LAV/vDuMZ2skDiF/M0kT/ulI4m1uujhxjYH8E0hj09hBW0kT6E0c2','2020-09-24 20:15:18','2020-09-24 17:31:34','2020-09-24 20:15:18'),(16,'FI','FI','fi12',NULL,'1','1','empresa','$2y$10$pGKvxibNHuATROJ/TKrDnu3.4Cg5Q.XlkYMACb6MAEW0tVd2XY7x.',NULL,'2020-09-24 18:20:52','2020-09-24 18:20:52'),(17,'FI','FI','fi13',NULL,'1','1','empresa','$2y$10$c3vnxigaGYS6TEUS96PL.uOxnxcHMIr5Qo0Tt7zsFdNZqkPi486.2',NULL,'2020-09-24 18:28:42','2020-09-24 18:28:42'),(18,'FI','FI','fi14',NULL,'1','1','empresa','$2y$10$/SgFObuJEtQ/lf4ajxEs/OKA3bZ5Iqu3jZxmLp3OYnod2Wp7HtDui',NULL,'2020-09-24 21:42:44','2020-09-24 21:42:44'),(19,'FI','FI','fi15',NULL,'1','1','empresa','$2y$10$lDBXECLiL6xV7GlpryVpU.WOM73gIS/o/9LynAssLU6SiHCQovu4i',NULL,'2020-09-25 10:38:01','2020-09-25 10:38:01'),(20,'FI','FI','fi16',NULL,'1','1','empresa','$2y$10$M.1JZeQbbDTjTYu8bLCKzOXO7nl9H8dyy3KJFHY43chc72Aaw47Nm',NULL,'2020-09-25 12:20:14','2020-09-25 12:20:14'),(21,'JUAN','PEREZ','juan7279581',NULL,'71100743','71100743','empresa','$2y$10$iuvxwu.Jp/7F20kQC4Si0e7f/iksEURF3k1sYi1fzFZ9/G2rjRSlm',NULL,'2021-06-04 11:58:46','2021-06-04 11:58:46');
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

-- Dump completed on 2021-07-02 16:45:26
