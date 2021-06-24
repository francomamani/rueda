-- MariaDB dump 10.19  Distrib 10.5.10-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: rueda
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (1,3,2,'Campo Ferial 3 de Julio',NULL,'AV. CIRCUNVALACIÓN Y PROLONGACIÓN ESPAÑA','5266111','Bolivia, Estado Plurinacional de','Oruro','281488020','campoferial3dejulio.com','ROCIO VILLCA QUISPE',1,2,'Otros','Empresas',1,NULL,'no',NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
INSERT INTO `mesas` VALUES (1,'1',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(2,'2',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(3,'3',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(4,'4',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(5,'5',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2018_10_10_210842_create_rubros_table',1),(4,'2018_10_10_211740_create_usuarios_table',1),(5,'2018_10_11_001137_create_empresas_table',1),(6,'2018_10_11_020040_create_participantes_table',1),(7,'2018_10_11_020723_create_horarios_table',1),(8,'2018_10_11_021710_create_mesas_table',1),(9,'2018_10_11_022030_create_reunions_table',1),(10,'2018_10_15_044311_create_agendas_table',1),(11,'2018_10_15_045356_create_horario_ocupados_table',1),(12,'2018_10_19_121153_create_evaluacion_generals_table',1),(13,'2018_10_19_180028_create_evaluacion_reunions_table',1),(14,'2019_10_27_224539_create_oferta_demandas_table',1),(15,'2019_11_08_164121_create_noticias_table',1),(16,'2020_08_30_091239_create_pais_table',1),(17,'2020_08_30_111542_create_ruedas_table',1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oferta_demandas`
--

LOCK TABLES `oferta_demandas` WRITE;
/*!40000 ALTER TABLE `oferta_demandas` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participantes`
--

LOCK TABLES `participantes` WRITE;
/*!40000 ALTER TABLE `participantes` DISABLE KEYS */;
INSERT INTO `participantes` VALUES (1,1,'Andrea Luisa','Silvestre Lobo','7287697','61836193','SISTEMAS',0,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reuniones`
--

LOCK TABLES `reuniones` WRITE;
/*!40000 ALTER TABLE `reuniones` DISABLE KEYS */;
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
INSERT INTO `rubros` VALUES (1,'AGRÍCOLA',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(2,'ALIMENTOS Y BEBIDAS',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(3,'ALMACENAMIENTO Y DISTRIBUCIÓN',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(4,'ARTES ESCENICAS',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(5,'ARTES LITERARIAS',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(6,'ARTES MUSICALES',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(7,'ARTES PLASTICAS',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(8,'ARTESANIAS',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(9,'ARTÍCULOS DE LIMPIEZA Y DESINFECCION',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(10,'ARTÍCULOS',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(11,'BANCOS Y FINANCIERAS',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(12,'CÁMARAS Y ORGANIZACIONES EMPRESARIALES',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(13,'COMPAÑÍA DE TRADING',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(14,'COSMÉTICOS',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(15,'CUERO CALZADO Y MANUFACTURAS DE CUERO',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(16,'ELECTRODOMÉSTICOS Y LÍNEA BLANCA',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(17,'ENVASES',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(18,'EQUIPOS DE TECNÓLOGÍA PARA LA INDUSTRIA MINERA',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(19,'EQUIPOS E IMPLEMENTOS HIDRAULICOS',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(20,'EQUIPOS ELÉCTRICOS',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(21,'FARMACIA',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(22,'FERRETERÍA Y HERRAMIENTAS',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(23,'FLETES Y TRANSPORTE',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(24,'GOBIERNO Y SUS ORGANISMOS',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(25,'HIDROCARBUROS',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(26,'INDUSTRIA DE ENERGIAS LIMPIAS',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(27,'INDUSTRIA DE LA MADERA Y MUEBLES EN GENERAL',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(28,'INDUSTRIA ENERGETICA',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(29,'INDUSTRIA METALURGICA',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(30,'INDUSTRIA PAPELERA Y GRÁFICA',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(31,'INDUSTRIA TEXTIL',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(32,'JOYERÍA. BISUTERÍA Y ORFEBRERÍA',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(33,'JUGUETERÍA Y ARTÍCULOS DE ENTRETENIMIENTO',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(34,'MERCADOTECNIA',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(35,'METALMECÁNICA Y ELECTROMECÁNICA',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(36,'MINERIA ENERGETICA',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(37,'MINERIA METALURGICA',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(38,'MINERIA NO METALURGICA',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(39,'ORGANISMOS INTERNACIONALES',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(40,'ORGANIZACIONES DE ECOLÓGÍA Y PROTECCIÓN DE MEDIO AMBIENTE',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(41,'OTROS',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(42,'OTROS SERVICIOS',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(43,'PLÁSTICOS O AFINES',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(44,'PRODUCCION AUDIOVISUAL',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(45,'PRODUCTOS PARA LA CONTRUCCIÓN Y DECORACIÓN',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(46,'QUÍMICOS Y REACTIVOS',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(47,'SEGUROS',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(48,'SERVICIOS ADUANEROS',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(49,'SERVICIOS DE CONSULTORIA AMBIENTAL',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(50,'SERVICIOS DE CONSULTORIA EN SEGURIDAD INDUSTRIAL',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(51,'SERVICIOS DE COSTRUCCIÓN E INGENIERÍA',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(52,'SERVICIOS EMPRESARIALES',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(53,'SERVICIOS INFORMÁTICOS Y DE TELECOMUNICACIÓN',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(54,'SERVICIOS PARA LA AGROINDUSTRIA',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(55,'SERVICIOS Y ORGANIZACION DE EVENTOS',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(56,'TECNOLOGÍA Y EQUIPAMIENTO PARA AGROPECUARIA E INDUSTRIA',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(57,'TECNOLOGÍAS DE LA INFORMACIÓN Y COMUNICACIÓN',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(58,'TURISMO',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(59,'VEHÍCULOS AUTOMOTORES',NULL,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10');
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
INSERT INTO `rueda` VALUES (1,0,NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Ebeliz','Fuentes Claros','admin123456789','ebelizfuentes@gmail.com','71100743','71100743','administrador','$2y$10$ozGavobIFAivloiLelGYTeucxR2x515dFv7moNR3vYGewPz0cDC2a',NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10'),(2,'Ebeliz','Fuentes Claros','ebelizfuentes','ebelizfuentes@gmail.com','71100743','71100743','empresa','$2y$10$jVKOI0o/K8ciNiUmjh8Pa.L.DS8v43DzxYp/3AneL0F3GNfDnSeV2',NULL,'2021-06-24 16:30:10','2021-06-24 16:30:10');
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

-- Dump completed on 2021-06-24 15:46:19
