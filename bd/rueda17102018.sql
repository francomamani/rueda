-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 17, 2018 at 01:37 PM
-- Server version: 5.7.19
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rueda`
--

-- --------------------------------------------------------

--
-- Table structure for table `agendas`
--

DROP TABLE IF EXISTS `agendas`;
CREATE TABLE IF NOT EXISTS `agendas` (
  `agenda_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `empresa_solicitante_id` int(10) UNSIGNED NOT NULL,
  `empresa_demandada_id` int(10) UNSIGNED NOT NULL,
  `horario_id` int(10) UNSIGNED NOT NULL,
  `mesa_id` int(10) UNSIGNED NOT NULL,
  `estado` enum('aceptado','rechazado','pendiente') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_asignacion` enum('pre_agendado','administracion','cita_de_contingencia') COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`agenda_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
CREATE TABLE IF NOT EXISTS `empresas` (
  `empresa_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rubro_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ciudad_localidad` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pagina_web` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `representante_legal` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `habilitado` tinyint(1) NOT NULL DEFAULT '0',
  `max_participantes` int(10) UNSIGNED NOT NULL DEFAULT '2',
  `oferta` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `demanda` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `especial` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`empresa_id`),
  KEY `empresas_rubro_id_foreign` (`rubro_id`),
  KEY `empresas_usuario_id_foreign` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `empresas`
--

INSERT INTO `empresas` (`empresa_id`, `rubro_id`, `usuario_id`, `nombre`, `logo`, `direccion`, `telefono`, `ciudad_localidad`, `nit`, `pagina_web`, `representante_legal`, `habilitado`, `max_participantes`, `oferta`, `demanda`, `especial`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 3, 2, 'Coda', NULL, 'calle Hugo Bohero #650', '52-87551', 'Oruro', '7275047016', 'www.codasrl.com', 'El Representante Legal', 1, 2, 'Servicios Software', 'Requerimientos empresariales', 1, NULL, '2018-10-17 13:37:35', '2018-10-17 13:37:35');

-- --------------------------------------------------------

--
-- Table structure for table `horarios`
--

DROP TABLE IF EXISTS `horarios`;
CREATE TABLE IF NOT EXISTS `horarios` (
  `horario_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `inicio` datetime NOT NULL,
  `fin` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`horario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `horarios_ocupados`
--

DROP TABLE IF EXISTS `horarios_ocupados`;
CREATE TABLE IF NOT EXISTS `horarios_ocupados` (
  `horario_ocupado_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `horario_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`horario_ocupado_id`),
  KEY `horarios_ocupados_empresa_id_foreign` (`empresa_id`),
  KEY `horarios_ocupados_horario_id_foreign` (`horario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mesas`
--

DROP TABLE IF EXISTS `mesas`;
CREATE TABLE IF NOT EXISTS `mesas` (
  `mesa_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `numero` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`mesa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mesas`
--

INSERT INTO `mesas` (`mesa_id`, `numero`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(2, 2, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(3, 3, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(4, 4, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(5, 5, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(6, 6, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(7, 7, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(8, 8, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(9, 9, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(10, 10, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(11, 11, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(12, 12, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(13, 13, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(14, 14, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(15, 15, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(16, 16, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(17, 17, NULL, '2018-10-17 13:37:35', '2018-10-17 13:37:35'),
(18, 18, NULL, '2018-10-17 13:37:35', '2018-10-17 13:37:35'),
(19, 19, NULL, '2018-10-17 13:37:35', '2018-10-17 13:37:35'),
(20, 20, NULL, '2018-10-17 13:37:35', '2018-10-17 13:37:35');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_10_10_210842_create_rubros_table', 1),
(4, '2018_10_10_211740_create_usuarios_table', 1),
(5, '2018_10_11_001137_create_empresas_table', 1),
(6, '2018_10_11_020040_create_participantes_table', 1),
(7, '2018_10_11_020723_create_horarios_table', 1),
(8, '2018_10_11_021710_create_mesas_table', 1),
(9, '2018_10_11_022030_create_reunions_table', 1),
(10, '2018_10_15_044311_create_agendas_table', 1),
(11, '2018_10_15_045356_create_horario_ocupados_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `participantes`
--

DROP TABLE IF EXISTS `participantes`;
CREATE TABLE IF NOT EXISTS `participantes` (
  `participante_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `nombres` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carnet` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `celular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cargo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`participante_id`),
  KEY `participantes_empresa_id_foreign` (`empresa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `participantes`
--

INSERT INTO `participantes` (`participante_id`, `empresa_id`, `nombres`, `apellidos`, `carnet`, `celular`, `cargo`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Megan', 'Lafuente Rocha', '72754552', '72963512', 'Gerente', NULL, '2018-10-17 13:37:35', '2018-10-17 13:37:35'),
(2, 1, 'Maria Cristina', 'Pozo Andia', '7275623', '72465245', 'Administrativo', NULL, '2018-10-17 13:37:35', '2018-10-17 13:37:35');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reuniones`
--

DROP TABLE IF EXISTS `reuniones`;
CREATE TABLE IF NOT EXISTS `reuniones` (
  `reunion_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `mesa_id` int(10) UNSIGNED NOT NULL,
  `horario_id` int(10) UNSIGNED NOT NULL,
  `empresa_solicitante_id` int(10) UNSIGNED NOT NULL,
  `empresa_demandada_id` int(10) UNSIGNED NOT NULL,
  `empresa_solicitante_asistio` tinyint(1) NOT NULL DEFAULT '0',
  `empresa_demandada_asistio` tinyint(1) NOT NULL DEFAULT '0',
  `resultado` enum('satisfactoria','ausencia','cronogramado') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cronogramado',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`reunion_id`),
  KEY `reuniones_mesa_id_foreign` (`mesa_id`),
  KEY `reuniones_horario_id_foreign` (`horario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rubros`
--

DROP TABLE IF EXISTS `rubros`;
CREATE TABLE IF NOT EXISTS `rubros` (
  `rubro_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`rubro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rubros`
--

INSERT INTO `rubros` (`rubro_id`, `nombre`, `descripcion`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'AGRÍCOLA, PECUARIO Y HORTOFRUTICOLA', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(2, 'ALIMENTOS Y BEBIDAS', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(3, 'PRODUCTOS PARA LA CONTRUCCIÓN Y DECORACIÓN', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(4, 'PLÁSTICOS O AFINES', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(5, 'ENVASES, EMBALAJES Y AFINES', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(6, 'QUÍMICOS', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(7, 'FARMACIA, MEDICAMENTOS', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(8, 'EQUIPOS ELÉCTRICOS', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(9, 'MINERÍA', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(10, 'INDUSTRIA DE LA MADERA Y MUEBLES EN GENERAL', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(11, 'INDUSTRIA TEXTIL, CONFECCIONES Y MODA', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(12, 'CUERO CALZADO Y MANUFACTURAS DE CUERO', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(13, 'INDUSTRIA PAPELERA Y GRÁFICA', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(14, 'VEHÍCULOS AUTOMOTORES, PIEZAS, PARTES', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(15, 'EQUIPOS E IMPLEMENTOS HIDRAHULICOS', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(16, 'TECNOLOGÍAS DE LA INFORMACIÓN Y COMUNICACIÓN', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(17, 'ELECTRODOMÉSTICOS Y LÍNEA BLANCA', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(18, 'ARTESANIAS', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(19, 'JOYERÍA. BISUTERÍA Y ORFEBRERÍA', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(20, 'COSMÉTICOS, BELLEZA Y SALUD', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(21, 'METALMECÁNICA Y ELECTROMECÁNICA', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(22, 'EQUIPOS DE TECNÓLOGÍA PARA LA INDUSTRIA MINERA, GAS, PETROLIO O SIMILARES', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(23, 'PETROLEO, GAS Y PETROQUÍMICA', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(24, 'ARTÍCULOS, IMPLEMENTOS Y EQUIPOS DE SEGURIDAD', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(25, 'ARTÍCULOS DE LIMPIEZA PARA EL HOGAR', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(26, 'JUGUETERÍA Y ARTÍCULOS DE ENTRETENIMIENTO', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(27, 'FERRETERÍA Y HERRAMIENTAS', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(28, 'ENERGÍA', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(29, 'ECOLÓGÍA Y PROTECCIÓN DE MEDIO AMBIENTE', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(30, 'TECNOLOGÍA Y EQUIPAMIENTO PARA AGROPECUARIA E INDUSTRIA', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(31, 'OTROS', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(32, 'COMPAÑÍA DE TRADING', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(33, 'BANCOS Y FINANCIERAS', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(34, 'FLETES Y TRANSPORTE', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(35, 'SERVICIOS ADUANEROS', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(36, 'ALMACENAMIENTO Y DISTRIBUCIÓN', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(37, 'SEGUROS', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(38, 'TURISMO', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(39, 'SERVICIOS EMPRESARIALES', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(40, 'SERVICIOS DE COSTRUCCIÓN E INGENIERÍA', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(41, 'SERVICIOS INFORMÁTICOS Y DE TELECOMUNICACIÓN', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(42, 'SERVICIOS PARA LA AGROINDUSTRIA', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(43, 'OTROS SERVICIOS', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(44, 'GOBIERNO Y SUS ORGANISMOS', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(45, 'ORGANISMOS INTERNACIONALES', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34'),
(46, 'CÁMARAS Y ORGANIZACIONES EMPRESARIALES', NULL, NULL, '2018-10-17 13:37:34', '2018-10-17 13:37:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
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

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `usuario_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombres` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_usuario` enum('administrador','empresa') COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`usuario_id`),
  UNIQUE KEY `usuarios_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `nombres`, `apellidos`, `email`, `tipo_usuario`, `password`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Melvin', 'Callisaya', 'admin@admin.com', 'administrador', '$2y$10$WYQ1mSVvfQgD4R/QDEmevOOAzW9/Y7qVLrTKFJEV4bye.V4v0OP9y', NULL, '2018-10-17 13:37:35', '2018-10-17 13:37:35'),
(2, 'Franco', 'Mamani', 'empresa@empresa.com', 'empresa', '$2y$10$LQGHYscFWhtEAuYMwa0YGuO0VYfDzhpPdaib7YkhZCUl2SwGQRK3S', NULL, '2018-10-17 13:37:35', '2018-10-17 13:37:35');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `empresas`
--
ALTER TABLE `empresas`
  ADD CONSTRAINT `empresas_rubro_id_foreign` FOREIGN KEY (`rubro_id`) REFERENCES `rubros` (`rubro_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `empresas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE CASCADE;

--
-- Constraints for table `horarios_ocupados`
--
ALTER TABLE `horarios_ocupados`
  ADD CONSTRAINT `horarios_ocupados_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`empresa_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `horarios_ocupados_horario_id_foreign` FOREIGN KEY (`horario_id`) REFERENCES `horarios` (`horario_id`) ON DELETE CASCADE;

--
-- Constraints for table `participantes`
--
ALTER TABLE `participantes`
  ADD CONSTRAINT `participantes_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`empresa_id`) ON DELETE CASCADE;

--
-- Constraints for table `reuniones`
--
ALTER TABLE `reuniones`
  ADD CONSTRAINT `reuniones_horario_id_foreign` FOREIGN KEY (`horario_id`) REFERENCES `horarios` (`horario_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reuniones_mesa_id_foreign` FOREIGN KEY (`mesa_id`) REFERENCES `mesas` (`mesa_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
