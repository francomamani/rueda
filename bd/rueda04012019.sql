-- MySQL dump 10.13  Distrib 5.7.19, for Win64 (x86_64)
--
-- Host: localhost    Database: rueda
-- ------------------------------------------------------
-- Server version	5.7.19

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
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`empresa_id`),
  KEY `empresas_rubro_id_foreign` (`rubro_id`),
  KEY `empresas_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `empresas_rubro_id_foreign` FOREIGN KEY (`rubro_id`) REFERENCES `rubros` (`rubro_id`) ON DELETE CASCADE,
  CONSTRAINT `empresas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (1,3,2,'Campo Ferial 3 de Julio','logos/4yYy2VC9VS3Ecvo3SALZcYVhv7buLPM132DceuDS.bmp','Calle Hugo Bohero #650','(591) 761 37653','Oruro','7275047016','www.francomamani.com','Franco Jesus Mamani Pozo',1,3,'Servicios Software ...','Requerimientos empresariales',1,'vouchers/CoP4g579VFGcHfpVdsY4goQ5cPBPbeEZHZ8n0L7N.jpeg',NULL,'2019-01-02 21:15:43','2019-01-03 17:35:31'),(2,32,3,'ejemplo','logos/GVNVPquPvEE7qxslOUFqJbsas011sfVGF3P99jXA.bmp','Hugo Bohero 650','98127346','oruro','1027981234',NULL,'ejemplo',0,2,'ofertas','demandas',0,'vouchers/oTRhwXvz2iqaqBZFGOE5kEbaQS5ifYrNjr9R9bzn.bmp',NULL,'2019-01-02 23:00:52','2019-01-02 23:00:52'),(3,32,4,'ejemplo2','logos/Xt6NVv5E6d0r5gjo36SbR08fQW3r0Kcee6ZM3CUj.bmp','direccion','98769876','oruro','08679876',NULL,'ejemplo2',0,2,'oferta','demanda',0,'vouchers/LKX32G6cwpCviebKxVfoVKgXClByH3yLR1pPbhxP.bmp',NULL,'2019-01-02 23:03:38','2019-01-02 23:03:38'),(4,28,5,'Pamela SRL','logos/8biTNIFuupZfr8mkZTHU6gISAz93imonfXkzHbBu.bmp','direccion','52-85523','oruro','1264567',NULL,'representante legal',1,2,'ofertas','demandas',0,'vouchers/WOifJReL6JKWL9bIUHf5NcVaKxc0xe6Jvun4DUhK.png',NULL,'2019-01-02 23:14:31','2019-01-03 20:18:09'),(5,22,6,'lafro','logos/9kwAFqCXdVdnPIfqCLTR4VOyIk17IaIUXOSqJAfn.jpeg','Hugo Bohero 650','98769876','oruro','98769876',NULL,'lafro',1,2,'ofertas','demanda',0,'vouchers/KZBDI3VAfrToqIIESx0OIYyKd4EvGuUlrRQUQme6.png',NULL,'2019-01-02 23:29:44','2019-01-02 23:59:24'),(6,22,7,'matty','logos/pHPpHZRqMiJhnqV6e8jpH74BEMuA5EjrGVSfBt8L.png','Hugo Bohero 650','8969876','oruro','76','9876','matty',0,2,'ofertas','demandas',0,'vouchers/wLfMwEYYRzr4Z4c5mIcF1BOMDquOxI1Hb5AevA1O.bmp',NULL,'2019-01-02 23:31:35','2019-01-02 23:32:50'),(7,12,8,'Quantix','logos/lNm1bwjrxBTf18H3MjK4V2caDCXZsXtr4se05XLZ.png','direccion','5299512','oruro','123456789',NULL,'Franco Mamani',1,2,'ofertas','demanda',0,'vouchers/9TXmzmKJmaRTj7crV1CvMyS90oajU4JSdxkEGu96.bmp',NULL,'2019-01-02 23:42:38','2019-01-03 20:19:09'),(8,32,9,'qwerty','logos/nN7mHOaXXkxecQ1rlmVdxNr2HvFo2dTvfJBHNn4d.png','69876987','876987','69876987','679876','69876987','69876987',1,2,'oferta','demandas',0,'vouchers/gFdFgHYqwXtC52ER24z3b1rBCSVziuHLyIaDliWR.png',NULL,'2019-01-02 23:49:12','2019-01-02 23:59:34'),(9,17,10,'Realteck','logos/KObJHE8jXRV3yspY1KCOowdYDD5xR7CpIPEo2XYr.bmp','Calle Santa Bárbara','5299662','La Paz','12345678',NULL,'Manuel Suarez',0,2,'Ofertas','Demandas',0,NULL,NULL,'2019-01-02 23:51:31','2019-01-03 20:16:32'),(10,2,13,'Tortas y Frutas','logos/WL0hxGz1UxVsl7yRQjTawldVih33H8pOzYMD9xR2.bmp','Calle Renjel','5287551','Cochabamba','4561231564',NULL,'Lucio Montaño',0,2,'Tortas','Envolturas',0,'vouchers/osJek1G0EoqjVxhxv1td4OYxhPaIVhyhCRM0RdVm.bmp',NULL,'2019-01-02 23:52:39','2019-01-03 20:17:35'),(11,32,14,'Empresa 123',NULL,'aklsdhflkj','12873469','oruro','123456789',NULL,'Daniel Moztacedo',0,2,'Estas son las ofertas','Estas son las demandas',0,NULL,NULL,'2019-01-02 23:54:49','2019-01-03 20:15:05'),(12,29,15,'Quirchincho',NULL,'Calle I','5287551','Oruro','123456789',NULL,'Juana de Arco',0,2,'Ofertas','Demandas',0,NULL,NULL,'2019-01-02 23:56:48','2019-01-03 20:15:41'),(13,5,16,'campo','logos/HcMmN5Z1p0OCT6bqBkBls9OWex4qXFGtD0j2i1x1.png','calle','4562131','Oruro','123456',NULL,'juana de arco',1,3,'ofertas de la empresa','demandas de la empresa',0,'vouchers/IvXkoDmiYXF8UkkWuD9GWUlCKeUqHczGUZWZCmBi.png',NULL,'2019-01-03 20:23:43','2019-01-03 20:51:38'),(14,12,17,'123456789',NULL,'direccion','123123456','oruro','123456789',NULL,'representante legal',0,2,'ofertas','demandas',0,NULL,NULL,'2019-01-03 20:27:34','2019-01-03 20:27:34');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluacion_reuniones`
--

LOCK TABLES `evaluacion_reuniones` WRITE;
/*!40000 ALTER TABLE `evaluacion_reuniones` DISABLE KEYS */;
INSERT INTO `evaluacion_reuniones` VALUES (1,39,13,'Pamela SRL','no','Probable','Servicios','Hasta 50.000 USD','6 meses','comentario',NULL,'2019-01-03 21:07:31','2019-01-03 21:07:31');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluaciones_generales`
--

LOCK TABLES `evaluaciones_generales` WRITE;
/*!40000 ALTER TABLE `evaluaciones_generales` DISABLE KEYS */;
INSERT INTO `evaluaciones_generales` VALUES (1,13,'Regular','Malo','Malo','Malo','Malo','Nacional','Revistas','No','este es un comentario',NULL,'2019-01-03 21:06:50','2019-01-03 21:06:50');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios`
--

LOCK TABLES `horarios` WRITE;
/*!40000 ALTER TABLE `horarios` DISABLE KEYS */;
INSERT INTO `horarios` VALUES (1,'2019-01-02 08:00:00','2019-01-02 12:00:00','2019-01-03 00:58:14','2019-01-02 23:17:05','2019-01-03 00:58:14'),(2,'2019-01-02 14:00:00','2019-01-02 18:00:00',NULL,'2019-01-02 23:17:14','2019-01-02 23:17:14'),(3,'2019-01-02 10:30:00','2019-01-02 12:00:00',NULL,'2019-01-03 00:42:32','2019-01-03 00:42:32'),(4,'2019-01-04 08:00:00','2019-01-04 12:00:00',NULL,'2019-01-03 21:05:28','2019-01-03 21:05:28');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios_ocupados`
--

LOCK TABLES `horarios_ocupados` WRITE;
/*!40000 ALTER TABLE `horarios_ocupados` DISABLE KEYS */;
INSERT INTO `horarios_ocupados` VALUES (4,1,2,'2019-01-03 16:58:21','2019-01-03 00:39:55','2019-01-03 16:58:21'),(5,13,2,NULL,'2019-01-03 20:33:01','2019-01-03 20:33:01');
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`mesa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesas`
--

LOCK TABLES `mesas` WRITE;
/*!40000 ALTER TABLE `mesas` DISABLE KEYS */;
INSERT INTO `mesas` VALUES (1,'RN-1',NULL,'2019-01-02 21:15:43','2019-01-04 16:12:24'),(2,'2',NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(3,'3',NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(4,'4',NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(5,'5',NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(6,'6',NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(7,'7',NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(8,'8',NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(9,'9',NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(10,'10',NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(11,'11',NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(12,'12',NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(13,'13',NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(14,'14',NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(15,'15',NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(16,'16',NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(17,'17',NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(18,'18',NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(19,'19',NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(20,'20',NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43');
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
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (157,'2014_10_12_000000_create_users_table',1),(158,'2014_10_12_100000_create_password_resets_table',1),(159,'2018_10_10_210842_create_rubros_table',1),(160,'2018_10_10_211740_create_usuarios_table',1),(161,'2018_10_11_001137_create_empresas_table',1),(162,'2018_10_11_020040_create_participantes_table',1),(163,'2018_10_11_020723_create_horarios_table',1),(164,'2018_10_11_021710_create_mesas_table',1),(165,'2018_10_11_022030_create_reunions_table',1),(166,'2018_10_15_044311_create_agendas_table',1),(167,'2018_10_15_045356_create_horario_ocupados_table',1),(168,'2018_10_19_121153_create_evaluacion_generals_table',1),(169,'2018_10_19_180028_create_evaluacion_reunions_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`participante_id`),
  KEY `participantes_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `participantes_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`empresa_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participantes`
--

LOCK TABLES `participantes` WRITE;
/*!40000 ALTER TABLE `participantes` DISABLE KEYS */;
INSERT INTO `participantes` VALUES (1,1,'Marcelo','Zenteno Rafael','123456789','69586290','Admnistrador Gerente','2019-01-04 16:12:48','2019-01-02 21:15:43','2019-01-04 16:12:48'),(2,1,'Pamela Nuevo','León Mamani','123456789','74464355','Administrativo',NULL,'2019-01-02 21:15:43','2019-01-03 17:34:58'),(3,2,'ejemplo','ejemplo','9876987','68976987','admin',NULL,'2019-01-02 23:00:52','2019-01-02 23:00:52'),(4,3,'ejemplo2','ejemplo2 apellidos','98768795667','98769876','administrador',NULL,'2019-01-02 23:03:38','2019-01-02 23:03:38'),(5,4,'nuevo','nuevo apellidos','9876','9876','admin',NULL,'2019-01-02 23:14:31','2019-01-02 23:14:31'),(6,5,'laro','lafro apellidos','9876987','69876987','administrador',NULL,'2019-01-02 23:29:44','2019-01-02 23:29:44'),(7,6,'matty','apellidos','98769876','9876987','super admin!',NULL,'2019-01-02 23:31:35','2019-01-02 23:31:35'),(8,7,'celu','celua','9876987','6987698','Administrador',NULL,'2019-01-02 23:42:38','2019-01-02 23:42:38'),(9,8,'qwerty','apellidos','qwerty','574576','admin',NULL,'2019-01-02 23:49:12','2019-01-02 23:49:12'),(10,9,'askdjfhlk','jhlkjasdhlk','jhlkjahsdlfkjh','lkjhlaskjdfhlkj','hlkjashdflkj',NULL,'2019-01-02 23:51:31','2019-01-02 23:51:31'),(11,10,'askdjfhlk','jhlkjasdhlk','jhlkjahsdlfkjh','lkjhlaskjdfhlkj','hlkjashdflkj',NULL,'2019-01-02 23:52:39','2019-01-02 23:52:39'),(12,11,'123','123','1234','8756','8756876',NULL,'2019-01-02 23:54:49','2019-01-02 23:54:49'),(13,12,'asdf','asdf','asdf','asdf','asdf',NULL,'2019-01-02 23:56:48','2019-01-02 23:56:48'),(14,1,'alksdjfhlkj','hlkjhsalskjh','lkjhlksjah','lkjhlksjhlk','jhlkjadfsh',NULL,'2019-01-03 17:40:50','2019-01-03 17:40:50'),(15,13,'juana','de arco','132465','727525465','Admin',NULL,'2019-01-03 20:23:43','2019-01-03 20:23:43'),(16,14,'juan','michael','123456','1321654','admin',NULL,'2019-01-03 20:27:34','2019-01-03 20:27:34'),(17,13,'daniel','arancibia','7869876','70987','admin',NULL,'2019-01-03 20:50:29','2019-01-03 20:50:41'),(18,13,'franco','mamani','123456','65465','admin',NULL,'2019-01-03 20:52:11','2019-01-03 20:52:11'),(19,14,'franco','mamani','123456','56465','admin',NULL,'2019-01-03 20:56:27','2019-01-03 20:56:27');
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reuniones`
--

LOCK TABLES `reuniones` WRITE;
/*!40000 ALTER TABLE `reuniones` DISABLE KEYS */;
INSERT INTO `reuniones` VALUES (20,19,1,12,0,0,'agendado','2019-01-02 11:00:00','2019-01-02 11:20:00','2019-01-03 16:55:34','2019-01-03 01:02:52','2019-01-03 16:55:34'),(21,4,1,1,0,0,'agendado','2019-01-02 10:30:00','2019-01-02 10:50:00','2019-01-03 16:54:33','2019-01-03 01:02:53','2019-01-03 16:54:33'),(22,15,1,5,0,0,'agendado','2019-01-02 11:30:00','2019-01-02 11:50:00','2019-01-03 16:57:19','2019-01-03 01:03:08','2019-01-03 16:57:19'),(23,20,11,12,0,0,'agendado','2019-01-02 14:00:00','2019-01-02 14:20:00',NULL,'2019-01-03 15:16:00','2019-01-03 15:16:00'),(24,5,5,7,0,0,'agendado','2019-01-02 14:30:00','2019-01-02 14:50:00',NULL,'2019-01-03 16:36:24','2019-01-03 16:36:24'),(25,2,1,4,0,0,'agendado','2019-01-02 10:30:00','2019-01-02 10:50:00','2019-01-03 16:56:56','2019-01-03 16:55:51','2019-01-03 16:56:56'),(26,3,1,7,0,0,'agendado','2019-01-02 11:00:00','2019-01-02 11:20:00','2019-01-03 16:57:21','2019-01-03 16:55:58','2019-01-03 16:57:21'),(27,9,1,7,0,0,'agendado','2019-01-02 11:00:00','2019-01-02 11:20:00','2019-01-03 16:59:06','2019-01-03 16:57:31','2019-01-03 16:59:06'),(28,9,1,4,0,0,'agendado','2019-01-02 10:30:00','2019-01-02 10:50:00','2019-01-03 16:58:48','2019-01-03 16:57:45','2019-01-03 16:58:48'),(29,8,1,5,0,0,'agendado','2019-01-02 11:30:00','2019-01-02 11:50:00','2019-01-03 16:58:51','2019-01-03 16:58:03','2019-01-03 16:58:51'),(30,4,1,8,0,0,'agendado','2019-01-02 15:30:00','2019-01-02 15:50:00','2019-01-03 16:58:54','2019-01-03 16:58:25','2019-01-03 16:58:54'),(31,13,1,12,0,0,'agendado','2019-01-02 16:00:00','2019-01-02 16:20:00','2019-01-03 16:59:02','2019-01-03 16:58:30','2019-01-03 16:59:02'),(32,7,1,7,0,0,'agendado','2019-01-02 10:30:00','2019-01-02 10:50:00','2019-01-03 20:54:27','2019-01-03 16:59:11','2019-01-03 20:54:27'),(33,19,1,4,0,0,'agendado','2019-01-02 14:30:00','2019-01-02 14:50:00','2019-01-03 17:02:00','2019-01-03 17:01:39','2019-01-03 17:02:00'),(34,11,1,8,0,0,'agendado','2019-01-02 17:00:00','2019-01-02 17:20:00',NULL,'2019-01-03 17:01:48','2019-01-03 17:01:48'),(35,9,1,5,0,0,'agendado','2019-01-02 15:30:00','2019-01-02 15:50:00',NULL,'2019-01-03 17:05:24','2019-01-03 17:05:24'),(36,16,13,1,0,0,'agendado','2019-01-02 16:00:00','2019-01-02 16:20:00','2019-01-03 20:32:32','2019-01-03 20:32:01','2019-01-03 20:32:32'),(37,14,13,1,0,0,'agendado','2019-01-02 11:00:00','2019-01-02 11:20:00','2019-01-03 20:37:17','2019-01-03 20:33:11','2019-01-03 20:37:17'),(38,11,13,5,0,0,'agendado','2019-01-02 11:30:00','2019-01-02 11:50:00',NULL,'2019-01-03 20:33:15','2019-01-03 20:33:15'),(39,12,13,4,0,0,'agendado','2019-01-02 10:30:00','2019-01-02 10:50:00',NULL,'2019-01-03 20:36:34','2019-01-03 20:36:34'),(40,10,13,7,0,0,'agendado','2019-01-02 11:00:00','2019-01-02 11:20:00',NULL,'2019-01-03 20:37:23','2019-01-03 20:37:23'),(41,7,1,4,0,0,'agendado','2019-01-02 16:30:00','2019-01-02 16:50:00',NULL,'2019-01-03 20:40:57','2019-01-03 20:40:57'),(42,17,1,7,0,0,'agendado','2019-01-02 16:00:00','2019-01-02 16:20:00','2019-01-03 20:55:12','2019-01-03 20:54:37','2019-01-03 20:55:12'),(43,16,14,4,0,0,'agendado','2019-01-02 11:00:00','2019-01-02 11:20:00',NULL,'2019-01-03 20:57:48','2019-01-03 20:57:48'),(44,5,14,7,0,0,'agendado','2019-01-02 15:00:00','2019-01-02 15:20:00',NULL,'2019-01-03 20:57:52','2019-01-03 20:57:52');
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rubros`
--

LOCK TABLES `rubros` WRITE;
/*!40000 ALTER TABLE `rubros` DISABLE KEYS */;
INSERT INTO `rubros` VALUES (1,'AGRÍCOLA, PECUARIO Y HORTOFRUTICOLA',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(2,'ALIMENTOS Y BEBIDAS',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(3,'PRODUCTOS PARA LA CONTRUCCIÓN Y DECORACIÓN',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(4,'PLÁSTICOS O AFINES',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(5,'ENVASES, EMBALAJES Y AFINES',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(6,'QUÍMICOS',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(7,'FARMACIA, MEDICAMENTOS',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(8,'EQUIPOS ELÉCTRICOS',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(9,'MINERÍA',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(10,'INDUSTRIA DE LA MADERA Y MUEBLES EN GENERAL',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(11,'INDUSTRIA TEXTIL, CONFECCIONES Y MODA',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(12,'CUERO CALZADO Y MANUFACTURAS DE CUERO',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(13,'INDUSTRIA PAPELERA Y GRÁFICA',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(14,'VEHÍCULOS AUTOMOTORES, PIEZAS, PARTES',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(15,'EQUIPOS E IMPLEMENTOS HIDRAHULICOS',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(16,'TECNOLOGÍAS DE LA INFORMACIÓN Y COMUNICACIÓN',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(17,'ELECTRODOMÉSTICOS Y LÍNEA BLANCA',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(18,'ARTESANIAS',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(19,'JOYERÍA. BISUTERÍA Y ORFEBRERÍA',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(20,'COSMÉTICOS, BELLEZA Y SALUD',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(21,'METALMECÁNICA Y ELECTROMECÁNICA',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(22,'EQUIPOS DE TECNÓLOGÍA PARA LA INDUSTRIA MINERA, GAS, PETROLIO O SIMILARES',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(23,'PETROLEO, GAS Y PETROQUÍMICA',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(24,'ARTÍCULOS, IMPLEMENTOS Y EQUIPOS DE SEGURIDAD',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(25,'ARTÍCULOS DE LIMPIEZA PARA EL HOGAR',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(26,'JUGUETERÍA Y ARTÍCULOS DE ENTRETENIMIENTO',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(27,'FERRETERÍA Y HERRAMIENTAS',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(28,'ENERGÍA',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(29,'ECOLÓGÍA Y PROTECCIÓN DE MEDIO AMBIENTE',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(30,'TECNOLOGÍA Y EQUIPAMIENTO PARA AGROPECUARIA E INDUSTRIA',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(31,'OTROS',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(32,'COMPAÑÍA DE TRADING',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(33,'BANCOS Y FINANCIERAS',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(34,'FLETES Y TRANSPORTE',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(35,'SERVICIOS ADUANEROS',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(36,'ALMACENAMIENTO Y DISTRIBUCIÓN',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(37,'SEGUROS',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(38,'TURISMO',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(39,'SERVICIOS EMPRESARIALES',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(40,'SERVICIOS DE COSTRUCCIÓN E INGENIERÍA',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(41,'SERVICIOS INFORMÁTICOS Y DE TELECOMUNICACIÓN',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(42,'SERVICIOS PARA LA AGROINDUSTRIA',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(43,'OTROS SERVICIOS',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(44,'GOBIERNO Y SUS ORGANISMOS',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(45,'ORGANISMOS INTERNACIONALES',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(46,'CÁMARAS Y ORGANIZACIONES EMPRESARIALES',NULL,NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43');
/*!40000 ALTER TABLE `rubros` ENABLE KEYS */;
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
  PRIMARY KEY (`usuario_id`),
  UNIQUE KEY `usuarios_cuenta_unique` (`cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Franco Jesus','Mamani Pozo','admin','admin@admin.com','76137653','76137653','administrador','$2y$10$JdNsgtvTdSjiLbx/6w5Vnewi1fwb9LG0hw6wTEpRU2vkCSHOTjph.',NULL,'2019-01-02 21:15:43','2019-01-02 21:15:43'),(2,'Andrea Megan','Lafuente Rocha','empresa',NULL,'123456789','789456123','empresa','$2y$10$PsM0U3GJlSDIWQj5tMBcEeCH.2WNg69ovUKeVny/bUw.Wv4RjaNZy',NULL,'2019-01-02 21:15:43','2019-01-03 17:17:55'),(3,'ajsdhflkjh','kljhasfkjh','ejemplo',NULL,'9987698','76987','empresa','$2y$10$qAp4q3eb5L53epwYaIFt2eY724iQs026LHsIwnXBPreYmGwA1PXei',NULL,'2019-01-02 23:00:52','2019-01-02 23:00:52'),(4,'ejemplo2','ejemplo2 apellidos','ejemplo2',NULL,'987698769876','9876987698','empresa','$2y$10$qyINRrYClesfa74QH6G/YeQjh9KYSJ/.x3RyqCbBUOoIIs0ZXInAO',NULL,'2019-01-02 23:03:38','2019-01-02 23:03:38'),(5,'nuevo','nuevo apellidos','nuevo',NULL,'9876987','698756879','empresa','$2y$10$CoeZIwQLIGOe8tX3Cq9loe0WUs3cLrxGG6woZQ7xfsCPZsXD5S/eC',NULL,'2019-01-02 23:14:31','2019-01-02 23:14:31'),(6,'lafro','lafro apellidos','lafro',NULL,'876','9876987','empresa','$2y$10$rOcVOvrAtZqRhspVc1sXt.74qZah/Dm5srxH97yOJGZHXJoGCgJ/m',NULL,'2019-01-02 23:29:44','2019-01-02 23:29:44'),(7,'matty','apellidos','matty',NULL,'9876987','69876987','empresa','$2y$10$K438ZsCN8pJ2O7PvX78wtuD7cepX6/ss524Jn60OwgNlp1VmVpfDu',NULL,'2019-01-02 23:31:35','2019-01-02 23:31:35'),(8,'celu','apellidos','celu',NULL,'9876987','6987','empresa','$2y$10$apabNIiaft2Wy2c8Zry0lO6ChMLvEY7M2o8A1zSxxdIqs5fN.Okhu',NULL,'2019-01-02 23:42:38','2019-01-02 23:42:38'),(9,'qwerty','apellidos','qwerty',NULL,'8756876','8768756876','empresa','$2y$10$nw/eVWaiwZ9/D5lsLMCvp.jOFYCvbT.sFecyi8x0A.fCErg5Ae.FG',NULL,'2019-01-02 23:49:12','2019-01-02 23:49:12'),(10,'hkljhalksj','laksjdfhlk','123456',NULL,'9876987','69876','empresa','$2y$10$9WimrrEQ7plVRIj0kzu9veKq3q6ZTXuV9HpyhYxpOaKd/WT6KBJaW',NULL,'2019-01-02 23:51:31','2019-01-02 23:51:31'),(13,'hkljhalksj','laksjdfhlk','1234567',NULL,'9876987','69876','empresa','$2y$10$13qTtO/83L08a33qhULK1ugduRJp2yLPVBbo489HzjJHTMLk623l2',NULL,'2019-01-02 23:52:39','2019-01-02 23:52:39'),(14,'franco','jesus','123','franco@gmail.com','123456789','789456123','empresa','$2y$10$5J368kdCwMBbq2M9VJ2i1.saRpJ1N7F9ijJixJAWMyTmprGxcSU7m',NULL,'2019-01-02 23:54:49','2019-01-04 20:33:02'),(15,'asdf','asdf','asdf',NULL,'asdf','asdf','empresa','$2y$10$lIeBwVoZsDNh.7YLkHhRM.RurjJWxEdvljR202gCx71Y4kLTvriyW',NULL,'2019-01-02 23:56:48','2019-01-02 23:56:48'),(16,'campo','apellidos suarez','campo',NULL,'123456789','789456123','empresa','$2y$10$HPJv.d3IpvOPT0bcRTPWKeSHD8Mzf6Ydc5CmKacxDbwVUjRDBHlI6',NULL,'2019-01-03 20:23:43','2019-01-03 20:53:41'),(17,'juan','michael','123456789',NULL,'123456789','123456789','empresa','$2y$10$4.CVKZREi6YJIYALPtaNhODB7p./fTDfn46C/9Gk3qlmdaV8HJq5O',NULL,'2019-01-03 20:27:34','2019-01-03 20:27:34'),(18,'megan','lafuente','megan',NULL,'98769876','9876987687','administrador','$2y$10$EwsjRvKlUIqRruISk5zCAeBEYvIAH3xNITuz5BKcrEGKrSefncwsG',NULL,'2019-01-04 19:53:43','2019-01-04 19:53:43');
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

-- Dump completed on 2019-01-04 16:40:54
