-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 18, 2019 at 05:44 PM
-- Server version: 8.0.18
-- PHP Version: 7.3.11

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

CREATE TABLE `agendas` (
  `agenda_id` int(10) UNSIGNED NOT NULL,
  `empresa_solicitante_id` int(10) UNSIGNED NOT NULL,
  `empresa_demandada_id` int(10) UNSIGNED NOT NULL,
  `horario_id` int(10) UNSIGNED NOT NULL,
  `mesa_id` int(10) UNSIGNED NOT NULL,
  `estado` enum('aceptado','rechazado','pendiente') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_asignacion` enum('pre_agendado','administracion','cita_de_contingencia') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `empresas`
--

CREATE TABLE `empresas` (
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `rubro_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ciudad_localidad` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nit` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pagina_web` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `representante_legal` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `habilitado` tinyint(1) NOT NULL DEFAULT '0',
  `max_participantes` int(10) UNSIGNED NOT NULL DEFAULT '2',
  `oferta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `demanda` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `especial` tinyint(1) NOT NULL DEFAULT '0',
  `voucher` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `con_material` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `empresas`
--

INSERT INTO `empresas` (`empresa_id`, `rubro_id`, `usuario_id`, `nombre`, `logo`, `direccion`, `telefono`, `ciudad_localidad`, `nit`, `pagina_web`, `representante_legal`, `habilitado`, `max_participantes`, `oferta`, `demanda`, `especial`, `voucher`, `con_material`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 3, 2, 'Campo Ferial 3 de Julio', 'logos/mFc5BBnSLQaxwSGGR3pYDiXYf020Uyxkf08mERf2.png', 'AV. CIRCUNVALACIÓN Y PROLONGACIÓN ESPAÑA', '5266111', 'Oruro', '281488020', 'campoferial3dejulio.com', 'ROCIO VILLCA QUISPE', 1, 2, 'Otros', 'Empresas', 1, 'vouchers/vNAOuCDfbsxsewAbjXaqcmzGe4Ymvw1MJixmh1xs.png', 'no', NULL, '2019-11-08 15:40:06', '2019-11-18 09:47:45'),
(2, 2, 3, 'ABUELA DELY SUK´ARANI', 'logos/dc3YTVhBAeVdrFwnC6IQXHwmRwmCqpN1kTntuzi9.jpeg', 'CALLE CUBA Nº 1652A ZONA DE MIRAFLORES', '75706335', 'LA PAZ', '3398390013', 'http://feriaecoart.net/stands/ps/abuela-dely-sukarani/', 'OMAR LANZA', 0, 2, 'Manjar de Quinua y Amaranto - Yogurt de Quinua y Amaranto en distintos sabores a Fruta endulzados con Stevia - Grageas de Quinua en distintos sabores de Fruta y otros - Granolas - Barras energéticas o turrones de Quinua y Amaranto - Nata', 'Maquinaria para elaboración de MANJAR - (MARMITA) - Maquinaria par el envasado de MANJAR - Maquinaria para elaboración de YOGURT - Maquinaria para el envasado de YOGURT - Aparato para medir densidad y el PH de la leche - (PACHIMETRO) - Aparato para medir el espesor y otros de la leche - (LACTODENCÍMETRO) - Aparato para medir la calidad de la leche (REFRACTÓMETRO) - Envases para Manjar de 250 grs, 500 grs. 1 Kg. - Envases para Yogurt de 500 ml. y 1 Litro. - Conservadores Industriales para lácteos. - Maquinaria para la elaboracion de GRAGEAS DE QUINUA - (MÁQUINA GRAGEADORA) - Maquinaria para la elaboracion de TURRONES - (MÁQUINA TURRONERA) - Maquinaria para el envasado de las GRAGEAS DE QUINUA - Maquinaria para en envasado de los TURRONES', 0, 'vouchers/7Xj0srmrUPB3XWUCa97kCQgWI8qmbzp4nDfQxtsH.jpeg', 'no', NULL, '2019-11-13 10:00:46', '2019-11-13 16:39:04'),
(3, 40, 4, 'IBCO SRL', 'logos/z9pQx79zaBfPqnAMwb8pkDTxECpdkP4jp79Vq0k6.png', '4TO ANILLO AV. ALEMANIA, CALLE COMBATE VUELTA EMPRESA NRO. 3939', '75024805', 'SANTA CRUZ', '310202021', 'www.ibco.com.bo', 'DANTE ORLANDO CUELLAR PATIÑO', 1, 2, 'oluciones de ingeniería\nSimulación y optimización de procesos para plantas nuevas y existentes\nIdentificación de cuellos de botella\nEvaluación de la capacidad\nDiseño de sistemas de automatización y control\nEvaluación de proyectos y selección de la tecnología\nEstudios de prevención de riesgo\nDiseño, Inspección y prueba de sistemas contra incendio', 'Proveedores de Equipamiento para sistemas contra incendio\nProveedores de tuberias y accesorios\nProveedores de bombas y soluciones hidráulicas\nProveedores de válvulas de control y sistemas de control de flujo', 0, 'vouchers/XvnL5Ndr217nWKv9mDyDMmucxBs23UH5d6IpehTb.png', 'no', NULL, '2019-11-13 16:32:25', '2019-11-16 11:25:36'),
(4, 31, 5, 'IMPORTADORA YULI', 'logos/W2n2G5yEJqOZq94TGJdecn0cZFWOPIyxRZcNojbF.jpeg', 'CALLE TUMUSLA N°107', '61782188', 'COCHABAMBA', '141089020', NULL, 'HUI WU', 0, 2, 'OFRECEMOS EQUIPOS DE PANADERÍA ,FRIALES ,EMBUTIDOS ,MESONES ,GÓNDOLAS LAVAPLATOS CARRITOS DE PURO INOX, REPOSTERÍA, SNACK ,COMIDA RÁPIDA ,BALAZAS Y SELLADORAS', 'SERVICIOS DE PAPELERÍA,TELECOMUNICACIÓN ,TRANSPORTE, SERVICIOS ADUANEROS, INSUMOS DE LIMPIEZA , INSUMOS DE EMBALAJE.', 0, NULL, 'no', NULL, '2019-11-13 16:59:51', '2019-11-13 17:00:40'),
(5, 16, 6, 'INFOLINE', 'logos/heR2Bjhmk9ajoGOUt1r9AH2V6vRJJXUVaM1zYTAY.jpeg', 'LA PLATA EDIF. CAMARA DE COMERCIO OFICINA 205B 2DO PISO', '60401775', 'ORURO', '7450337012', 'www.infolinebolivia.com', 'ADIMER HUGO VICENTE CHOQUE', 0, 2, 'Ofrecemos un porcentaje de nuestras acciones de nuestra startup', 'Buscamos un inversionista que pueda ayudarnos a realizar nuestra 4ta y 5ta actualizacion a nivel de redes social empresarial y demas servicios', 0, NULL, 'no', NULL, '2019-11-13 17:15:55', '2019-11-13 17:15:55'),
(6, 16, 7, 'MARKA MARKETING', NULL, 'CALLE 3 NRO 154, PISO 1, VILLA ARMONIA', '71224940', 'LA PAZ', '12543634013', 'www.markamkt.com', 'LIONEL FLORES FERNANDEZ', 0, 2, 'ÁREA TECNOLOGICA Desarrollo de sitios Sistemas a medida Instalación de sistemas de vigilancia Equipo de punto de venta Desarrollo de tienda online con pagos para tarjeta de crédito y débito (visa, mastercard, american express) Identidad Corporativa Publicidad en redes sociales (Facebook, Instagram) AREA PROMOCIONAL Bolsas ecológicas en tocuyo y tela galleta con servicio de impresión Servicio de sublimación en artículos promocionales, trazas, mouse pad, poleras, tazas, etc. Servicio de confección de indumentaria corporativa por mayor. Placas de reconocimientos, tomatodos, etc para sublimacion.', 'Proveedores de telas de tocuyo Proveedores de tela galleta Proveedores de insumos de serigrafia y sublimacion. Proveedores de articulos en general para la confecciones de chamarras, mochilas y demás', 0, NULL, 'no', NULL, '2019-11-13 17:18:57', '2019-11-13 17:18:57'),
(7, 11, 8, 'PATRIC JEANS', 'logos/OS6uDShoPoaywD7RvBvmyN4DGcoWGTFt7KjOcP3c.jpeg', 'GUAPOMOS #224', '67559078', 'COCHABAMBA', '3092296011', NULL, 'JHOVANA PATRICIA RAMOS MITA', 0, 2, 'Pantalones jeans para Varón y dama pantalones de trabajo en tela jeans', 'no', 0, NULL, 'no', NULL, '2019-11-13 17:21:41', '2019-11-13 17:21:41'),
(8, 8, 9, 'VIVION S.A.', NULL, 'AV. NUEVA JERUSALEN CALLE CANTARES NO.39', '70050449', 'SANTA CRUZ', '-------', NULL, '--------', 0, 2, 'VIVION ES UNA EMPRESA URUGUAYA QUE FABRICA Y COMERCIALIZA PRODUCTOS ELÉCTRICOS PARA LA CONSTRUCCION , PLACAS ELÉCTRICAS, ( TOMAS INTERRUPTORES, LUMINARIAS, SENSORES, CAJAS DE EMBUTIR ETC)', 'NECESITAMOS CLIENTES QUE REQUIERAN PRODUCTOS PARA LA OBRA CIVIL Y/O DISTRIBUIDORES QUE DESEEN COMERCIALIZAR EL PRODUCTO EN TODO BOLIVIA.', 0, NULL, 'no', NULL, '2019-11-13 17:27:09', '2019-11-13 17:27:09'),
(9, 37, 10, 'SEGUROS Y REASEGUROS PERSONALES UNIVIDA S.A.', NULL, 'CALLE ADOLFO MIER NRO. 369 POTOSI Y PAGADOR', '69600578', 'ORURO', '301204024', 'www.univida.bo', 'BELTHUR LUCIO CAMACHO FERRUFINO', 0, 2, 'SEGUROS PERSONALES Y GRUPALES DE ACCIDENTES PERSONALES Y DE VIDA SEGURO OBLIGATORIO DE ACCIDENTES DE TRANSITO', 'SERVICIOS EN GENERAL', 0, NULL, 'no', NULL, '2019-11-13 17:31:24', '2019-11-13 17:31:24'),
(10, 41, 11, 'GOTASOFT', 'logos/CB9uVXzrV8Vze5oRZYsfAjFRVztwiXeq7kdeTsQ8.png', 'CALLE I #650 PROLONGACIÓN RODRIGUEZ Y LEON', '76137653', 'ORURO', '7275047016', 'gotasoft.com', 'FRANCO JESUS MAMANI POZO', 1, 2, 'ofertas', 'demandas', 0, 'vouchers/7jZ8pfvocS2rov4ClOYZaQubaXl4yMZSHHgDS09O.png', 'no', '2019-11-15 18:22:03', '2019-11-13 17:53:53', '2019-11-15 18:22:03'),
(11, 16, 12, 'GOTASOFT', 'logos/UmtENew1biFCITYHEeYv6MW5nEjwU50J2nXn1wM3.png', 'CALLE I #650 PROLONGACIÓN RODRIGUEZ Y LEON', '76137653', 'ORURO', '7275047016', 'gotasoft.com', 'FRANCO JESUS MAMANI POZO', 0, 2, 'ofertas', 'demandas', 0, NULL, 'no', '2019-11-16 10:32:20', '2019-11-15 18:29:23', '2019-11-16 10:32:20'),
(12, 16, 13, 'GOTASOFT', 'logos/HjWBOeeX0RnIpJy7EZiYUjpKD9gPMLh312FWrPkP.png', 'CALLE I #650 PROLONGACIÓN RODRIGUEZ Y LEON', '76137653', 'ORURO', '7275047016', 'gotasoft.com', 'FRANCO JESUS MAMANI POZO', 0, 2, 'ofertas', 'demandas', 0, NULL, 'no', '2019-11-16 10:32:24', '2019-11-15 18:29:52', '2019-11-16 10:32:24'),
(13, 41, 14, 'GOTASOFT', 'logos/1b6yxLxmxC2VI0VxihThfV5FuzlIH4NBnBnEMpZm.png', 'CALLE I #650 PROLONGACIÓN RODRIGUEZ Y LEON', '76137653', 'ORURO', '7275047016', 'gotasoft.com', 'FRANCO JESUS MAMANI POZO', 0, 2, 'ofertas', 'demandas', 0, NULL, 'no', '2019-11-16 10:46:21', '2019-11-16 10:37:48', '2019-11-16 10:46:21'),
(14, 41, 15, 'GOTASOFT', 'logos/P13L9uqpGgggOX596CYRZr15u1R7wgQ15n2jRaCJ.png', 'CALLE I #650 PROLONGACIÓN RODRIGUEZ Y LEON', '76137653', 'ORURO', '7275047016', 'gotasoft.com', 'FRANCO JESUS MAMANI POZO', 1, 2, 'ofertas', 'demandas', 0, NULL, 'no', NULL, '2019-11-16 10:48:30', '2019-11-16 21:01:51'),
(15, 11, 16, 'MILOS', 'logos/iZpJe9s9PukPa0ZP8izHeHDwUJHikiAwXq6bAFSW.jpeg', 'QUINTANA#1226', '666', 'ORURO', '2222', NULL, 'MIRTHA LOBO', 0, 2, 'ofertas', 'demandas', 0, NULL, 'no', '2019-11-18 09:45:35', '2019-11-18 09:37:04', '2019-11-18 09:45:35'),
(16, 3, 18, 'IMPORT EXPORT LAS LOMAS LTDA', 'logos/OI5Pu89C3SGNpnhJPp3Fl2SoSQ2JDuKIP7I0f0KS.jpeg', 'AV. 24 DE JUNIO KM. 5', '71843670', 'ORURO', '1028443027', NULL, 'JUAN CARLOS ZURITA VERA', 0, 2, 'ofertas', 'demandas', 0, NULL, 'no', NULL, '2019-11-18 11:29:13', '2019-11-18 11:29:13');

-- --------------------------------------------------------

--
-- Table structure for table `evaluaciones_generales`
--

CREATE TABLE `evaluaciones_generales` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `uno` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dos` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tres` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cuatro` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cinco` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `seis` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `siete` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ocho` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nueve` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `evaluacion_reuniones`
--

CREATE TABLE `evaluacion_reuniones` (
  `id` int(10) UNSIGNED NOT NULL,
  `reunion_id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `uno` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dos` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tres` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cuatro` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cinco` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `seis` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `siete` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `horarios`
--

CREATE TABLE `horarios` (
  `horario_id` int(10) UNSIGNED NOT NULL,
  `inicio` datetime NOT NULL,
  `fin` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `horarios`
--

INSERT INTO `horarios` (`horario_id`, `inicio`, `fin`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '2019-12-03 15:00:00', '2019-12-03 15:30:00', NULL, '2019-11-18 10:25:02', '2019-11-18 10:25:02'),
(2, '2019-12-03 15:30:00', '2019-12-03 16:00:00', NULL, '2019-11-18 10:31:11', '2019-11-18 10:31:11'),
(3, '2019-12-03 16:00:00', '2019-12-03 16:30:00', NULL, '2019-11-18 10:31:42', '2019-11-18 10:31:42'),
(4, '2019-12-03 16:30:00', '2019-12-03 17:00:00', NULL, '2019-11-18 10:32:01', '2019-11-18 10:32:01'),
(5, '2019-12-03 17:00:00', '2019-12-03 17:30:00', NULL, '2019-11-18 10:32:27', '2019-11-18 10:32:27'),
(6, '2019-12-03 17:30:00', '2019-12-03 18:00:00', NULL, '2019-11-18 10:35:35', '2019-11-18 10:35:35'),
(7, '2019-12-03 18:00:00', '2019-12-03 18:30:00', NULL, '2019-11-18 10:36:03', '2019-11-18 10:36:03'),
(8, '2019-12-03 18:30:00', '2019-12-03 19:00:00', NULL, '2019-11-18 10:36:27', '2019-11-18 10:36:27'),
(9, '2019-12-04 09:00:00', '2019-12-04 09:30:00', NULL, '2019-11-18 10:37:03', '2019-11-18 10:37:03'),
(10, '2019-12-04 09:30:00', '2019-12-04 10:00:00', NULL, '2019-11-18 10:42:46', '2019-11-18 10:42:46'),
(11, '2019-12-04 10:30:00', '2019-12-04 11:00:00', NULL, '2019-11-18 10:43:09', '2019-11-18 10:43:09'),
(12, '2019-12-04 10:00:00', '2019-12-04 10:30:00', NULL, '2019-11-18 10:43:29', '2019-11-18 10:43:29'),
(13, '2019-12-04 11:00:00', '2019-12-04 11:30:00', NULL, '2019-11-18 10:43:54', '2019-11-18 10:43:54'),
(14, '2019-12-04 11:30:00', '2019-12-04 12:00:00', NULL, '2019-11-18 10:44:16', '2019-11-18 10:44:16'),
(15, '2019-12-04 14:00:00', '2019-12-04 14:30:00', NULL, '2019-11-18 10:45:00', '2019-11-18 10:45:00'),
(16, '2019-12-04 14:30:00', '2019-12-04 15:00:00', NULL, '2019-11-18 10:45:19', '2019-11-18 10:45:19'),
(17, '2019-12-04 15:00:00', '2019-12-04 15:30:00', NULL, '2019-11-18 10:45:45', '2019-11-18 10:45:45'),
(18, '2019-12-04 15:30:00', '2019-12-04 16:00:00', NULL, '2019-11-18 10:46:42', '2019-11-18 10:46:42'),
(19, '2019-12-04 16:00:00', '2019-12-04 16:30:00', NULL, '2019-11-18 10:47:06', '2019-11-18 10:47:06'),
(20, '2019-12-04 16:30:00', '2019-12-04 17:00:00', NULL, '2019-11-18 10:47:24', '2019-11-18 10:47:24'),
(21, '2019-12-04 17:00:00', '2019-12-04 17:30:00', NULL, '2019-11-18 10:47:52', '2019-11-18 10:47:52'),
(22, '2019-12-04 17:30:00', '2019-12-04 18:00:00', NULL, '2019-11-18 10:48:18', '2019-11-18 10:48:18');

-- --------------------------------------------------------

--
-- Table structure for table `horarios_ocupados`
--

CREATE TABLE `horarios_ocupados` (
  `horario_ocupado_id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `horario_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mesas`
--

CREATE TABLE `mesas` (
  `mesa_id` int(10) UNSIGNED NOT NULL,
  `numero` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mesas`
--

INSERT INTO `mesas` (`mesa_id`, `numero`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '1', NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(2, '2', NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(3, '3', NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(4, '4', NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(5, '5', NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(6, '6', NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(7, '7', NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(8, '8', NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(9, '9', NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(10, '10', NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(11, '11', NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(12, '12', NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(13, '13', NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(14, '14', NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(15, '15', NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(16, '16', NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(17, '17', NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(18, '18', NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(19, '19', NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(20, '20', NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(11, '2018_10_15_045356_create_horario_ocupados_table', 1),
(12, '2018_10_19_121153_create_evaluacion_generals_table', 1),
(13, '2018_10_19_180028_create_evaluacion_reunions_table', 1),
(14, '2019_10_27_224539_create_oferta_demandas_table', 1),
(15, '2019_11_08_164121_create_noticias_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `noticias`
--

CREATE TABLE `noticias` (
  `id` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contenido` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `noticias`
--

INSERT INTO `noticias` (`id`, `titulo`, `contenido`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'TITULO DE NOTICIA', '<p>CONTENIDO DE NOTICIA</p>', '2019-11-09 19:43:35', '2019-11-09 19:04:00', '2019-11-09 19:43:35'),
(2, 'Expoteco se desarrollará del 28 de noviembre al 8 de diciembre', '<p><strong>La Feria Exposici&oacute;n, T&eacute;cnica, Econ&oacute;mica y Comercial de Oruro (Expoteco) </strong>se desarrollar&aacute; del 28 de noviembre al 8 de diciembre en el Campo Ferial 3 de Julio, se prev&eacute; tener al menos 250 expositores. Esta nueva fecha se da luego de suspenderse en primera instancia por los conflictos sociales que vive el pa&iacute;s.<br />\n<br />\nLa gerente del Campo Ferial 3 de Julio, Roc&iacute;o Villca, oficializ&oacute; que la feria m&aacute;s grande del occidente boliviano, como es Expoteco, se efectuar&aacute; entre finales de noviembre y principios de diciembre.<br />\n<br />\nManifest&oacute; que ayer se tuvo una reuni&oacute;n con el comit&eacute; ejecutivo de Expoteco y se defini&oacute; realizar la actividad en la fecha establecida de forma inamovible, esperando que el conflicto social que vive el pa&iacute;s pueda solucionarse en los pr&oacute;ximos d&iacute;as.<br />\n<br />\nExpoteco deb&iacute;a desarrollarse del 14 al 24 de noviembre, no obstante se vio por conveniente posponer la feria por los problemas sociales que se tiene en el pa&iacute;s debido a la molestia de la poblaci&oacute;n por los hechos irregulares que se presentaron en las elecciones generales del 20 de octubre, que dio la victoria al actual mandatario, Evo Morales.<br />\n<br />\nVillca se&ntilde;al&oacute; que si bien se tom&oacute; la decisi&oacute;n de posponer Expoteco porque se registran bloqueos que pod&iacute;an impedir la llegada de algunos expositores que participan en la feria, sostuvo que la fecha que se defini&oacute; ahora no puede modificarse pues ya no se podr&iacute;a realizar la actividad que genera importantes ingresos para la regi&oacute;n.<br />\n<br />\nPara esta gesti&oacute;n, Expoteco presenta diferentes estrategias para atraer a los visitantes y expositores, adem&aacute;s, se tendr&aacute; diversos espacios para que puedan disfrutar en familia o con amigos.<br />\n<br />\nLa gerente del Campo Ferial, tambi&eacute;n mencion&oacute; que se hicieron mejoras en algunos espacios, incorporando m&aacute;s &aacute;reas verdes, entre otras caracter&iacute;sticas.</p>\n\n<p><img alt=\"\" src=\"http://lapatriaenlinea.com/fotos/11_2019/1004661_1_06.jpg\" style=\"float:left; height:280px; margin-left:14px; margin-right:14px; width:420px\" /></p>', NULL, '2019-11-09 19:45:15', '2019-11-09 20:10:37'),
(3, 'Cronograma de Actividades Expoteco 2019', '<div>\n<table>\n	<thead>\n		<tr>\n			<th>DIA</th>\n			<th>ACTIVIDAD</th>\n			<th>HORARIO</th>\n		</tr>\n	</thead>\n	<tbody>\n		<tr>\n			<td rowspan=\"4\">Lunes 12 de noviembre</td>\n			<td>Ingreso De los participantes, acreditaci&oacute;n y entrega de citas y materiales a los empresarios</td>\n			<td>14:00-14:30</td>\n		</tr>\n		<tr>\n			<td>Pre&aacute;mbulo (Cuerpo de baile)</td>\n			<td>14:30-14:40</td>\n		</tr>\n		<tr>\n			<td>Palabras de inauguraci&oacute;n y explicaci&oacute;n de las reglas</td>\n			<td>14:40-15:00</td>\n		</tr>\n		<tr>\n			<td>Inicio de reuniones 1ra jornada de la Rueda de negocios</td>\n			<td>15:00-18:00</td>\n		</tr>\n		<tr>\n			<td rowspan=\"2\">Martes 13 de noviembre</td>\n			<td>Inicio de reuniones 2da jornada de la Rueda de negocios (ma&ntilde;ana)</td>\n			<td>9:00-12:00</td>\n		</tr>\n		<tr>\n			<td>Reuniones 2da jornada de la Rueda de negocios (Tarde)</td>\n			<td>15:00-18:00</td>\n		</tr>\n		<tr>\n			<td rowspan=\"3\">Mi&eacute;rcoles 14 de noviembre</td>\n			<td>Reuniones 3ra jornada de la Rueda de negocios (ma&ntilde;ana)</td>\n			<td>9:00-12:00</td>\n		</tr>\n		<tr>\n			<td>Resultados provisionales de la XVII Versi&oacute;n de la Rueda de Negocios</td>\n			<td>12:00-12:10</td>\n		</tr>\n		<tr>\n			<td>Palabras de clausura y cierre del evento</td>\n			<td>12:10&ndash;12:30</td>\n		</tr>\n	</tbody>\n</table>\n</div>', NULL, '2019-11-09 19:52:38', '2019-11-09 20:20:52'),
(4, 'Dove Cameron', '<p><strong>La Feria Exposici&oacute;n, T&eacute;cnica, Econ&oacute;mica y Comercial de Oruro (Expoteco) </strong>se desarrollar&aacute; del 28 de noviembre al 8 de diciembre en el Campo Ferial 3 de Julio, se prev&eacute; tener al menos 250 expositores. Esta nueva fecha se da luego de suspenderse en primera instancia por los conflictos sociales que vive el pa&iacute;s.<br />\n<br />\nLa gerente del Campo Ferial 3 de Julio, Roc&iacute;o Villca, oficializ&oacute; que la feria m&aacute;s grande del occidente boliviano, como es Expoteco, se efectuar&aacute; entre finales de noviembre y principios de diciembre.<br />\n<br />\nManifest&oacute; que ayer se tuvo una reuni&oacute;n con el comit&eacute; ejecutivo de Expoteco y se defini&oacute; realizar la actividad en la fecha establecida de forma inamovible, esperando que el conflicto social que vive el pa&iacute;s pueda solucionarse en los pr&oacute;ximos d&iacute;as.<br />\n<br />\nExpoteco deb&iacute;a desarrollarse del 14 al 24 de noviembre, no obstante se vio por conveniente posponer la feria por los problemas sociales que se tiene en el pa&iacute;s debido a la molestia de la poblaci&oacute;n por los hechos irregulares que se presentaron en las elecciones generales del 20 de octubre, que dio la victoria al actual mandatario, Evo Morales.<br />\n<br />\nVillca se&ntilde;al&oacute; que si bien se tom&oacute; la decisi&oacute;n de posponer Expoteco porque se registran bloqueos que pod&iacute;an impedir la llegada de algunos expositores que participan en la feria, sostuvo que la fecha que se defini&oacute; ahora no puede modificarse pues ya no se podr&iacute;a realizar la actividad que genera importantes ingresos para la regi&oacute;n.<br />\n<br />\nPara esta gesti&oacute;n, Expoteco presenta diferentes estrategias para atraer a los visitantes y expositores, adem&aacute;s, se tendr&aacute; diversos espacios para que puedan disfrutar en familia o con amigos.<br />\n<br />\nLa gerente del Campo Ferial, tambi&eacute;n mencion&oacute; que se hicieron mejoras en algunos espacios, incorporando m&aacute;s &aacute;reas verdes, entre otras caracter&iacute;sticas.</p>\n\n<p><img alt=\"\" src=\"http://lapatriaenlinea.com/fotos/11_2019/1004661_1_06.jpg\" style=\"float:left; height:280px; margin-left:14px; margin-right:14px; width:420px\" /></p>', '2019-11-09 20:55:26', '2019-11-09 20:55:13', '2019-11-09 20:55:26');

-- --------------------------------------------------------

--
-- Table structure for table `oferta_demandas`
--

CREATE TABLE `oferta_demandas` (
  `oferta_demanda_id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `producto_servicio` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` enum('oferta','demanda') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oferta_demandas`
--

INSERT INTO `oferta_demandas` (`oferta_demanda_id`, `empresa_id`, `descripcion`, `producto_servicio`, `tipo`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'STANDS', 'servicio', 'oferta', NULL, '2019-11-09 21:46:20', '2019-11-09 21:46:20'),
(2, 14, 'SISTEMAS DE NOTICIAS Y EVENTOS', 'servicio', 'oferta', NULL, '2019-11-16 10:48:30', '2019-11-16 10:48:30'),
(3, 14, 'SISTEMAS DE ALMACENES', 'servicio', 'oferta', '2019-11-16 21:14:36', '2019-11-16 10:48:30', '2019-11-16 21:14:36'),
(4, 14, 'SISTEMAS  DE ACTIVOS FIJOS 2', 'servicio', 'oferta', '2019-11-16 21:03:32', '2019-11-16 10:48:30', '2019-11-16 21:03:32'),
(5, 14, 'SISTEMAS DE FACTURACION ELECTRONICA 2', 'servicio', 'oferta', '2019-11-16 20:59:20', '2019-11-16 10:48:30', '2019-11-16 20:59:20'),
(6, 14, 'REQUERIMIENTO DE SISTEMAS INFORMATICOS', 'servicio', 'demanda', NULL, '2019-11-16 10:48:30', '2019-11-16 10:48:30'),
(7, 3, 'SOLUCIONES DE INGENIERÍA', 'servicio', 'oferta', NULL, '2019-11-16 11:27:27', '2019-11-16 11:27:27'),
(8, 3, 'EVALUACION DE LA CAPACIDAD', 'servicio', 'oferta', NULL, '2019-11-16 11:27:45', '2019-11-16 11:27:45'),
(9, 3, 'IDENTIFICAIOND E CUELLOS DE BOTELLA', 'servicio', 'oferta', NULL, '2019-11-16 11:27:54', '2019-11-16 11:27:54'),
(10, 3, 'DISEÑO DE SISTEMAS DE AUTOMATIZACIÓN Y CONTROL', 'servicio', 'oferta', NULL, '2019-11-16 11:28:08', '2019-11-16 11:28:08'),
(11, 3, 'SIMULACION Y OPTIMIZACION DE PROCESO PARA PLANTAS', 'servicio', 'oferta', NULL, '2019-11-16 11:28:47', '2019-11-16 11:28:47'),
(12, 3, 'EQUIPAMIENTO PARA SISTEMAS CONTRA INCENDIO', 'producto', 'demanda', NULL, '2019-11-16 11:29:49', '2019-11-16 11:29:49'),
(13, 3, 'TUBERIAS Y ACCESORIOS', 'producto', 'demanda', NULL, '2019-11-16 11:30:05', '2019-11-16 11:30:05'),
(14, 3, 'BOMBAS Y SOLUCIONES HIDRAULICAS', 'producto', 'demanda', NULL, '2019-11-16 11:30:19', '2019-11-16 11:30:19'),
(15, 3, 'VÁLVULAS DE CONTROL', 'producto', 'demanda', NULL, '2019-11-16 11:30:31', '2019-11-16 11:30:31'),
(16, 3, 'SISTEMAS DE CONTROL DE FLUJO', 'producto', 'demanda', NULL, '2019-11-16 11:30:38', '2019-11-16 11:30:38'),
(17, 14, 'SISTEMA DE ACTIVOS FIJOS', 'servicio', 'oferta', '2019-11-16 21:06:36', '2019-11-16 21:06:09', '2019-11-16 21:06:36'),
(18, 14, 'SISTEMAS DE FACTURACION ELECTRONICA', 'servicio', 'oferta', '2019-11-16 21:15:25', '2019-11-16 21:13:39', '2019-11-16 21:15:25'),
(19, 14, 'SISTEMAS DE ACTIVOS FIJOS', 'servicio', 'oferta', '2019-11-16 21:14:00', '2019-11-16 21:13:39', '2019-11-16 21:14:00'),
(20, 14, 'SISTEMAS DE FACTURACION ELECTRONICA', 'servicio', 'oferta', NULL, '2019-11-16 21:15:04', '2019-11-16 21:15:04'),
(21, 14, 'SISTEMAS DE ALMACENES', 'servicio', 'oferta', NULL, '2019-11-16 21:15:04', '2019-11-16 21:15:04'),
(22, 14, 'SISTEMAS DE ACTIVOS FIJOS', 'servicio', 'oferta', NULL, '2019-11-16 21:15:43', '2019-11-16 21:15:43'),
(23, 14, 'SISTEMAS DE RUEDA DE NEGOCIOS', 'servicio', 'oferta', NULL, '2019-11-16 21:17:10', '2019-11-16 21:17:10'),
(24, 15, 'CHALECOS DE TRABAJO', 'producto', 'oferta', NULL, '2019-11-18 09:37:04', '2019-11-18 09:37:04'),
(25, 15, 'CATERIING', 'servicio', 'oferta', NULL, '2019-11-18 09:37:04', '2019-11-18 09:37:04'),
(26, 15, 'TELA', 'producto', 'demanda', NULL, '2019-11-18 09:37:04', '2019-11-18 09:37:04'),
(27, 15, 'LIMPIEZA', 'servicio', 'demanda', NULL, '2019-11-18 09:37:04', '2019-11-18 09:37:04'),
(28, 2, 'NATA', 'producto', 'oferta', NULL, '2019-11-18 10:54:37', '2019-11-18 10:54:37'),
(29, 2, 'BARRAS ENERGÉTICAS O TURRONES DE QUINUA Y AMARANTO', 'producto', 'oferta', NULL, '2019-11-18 10:54:37', '2019-11-18 10:54:37'),
(30, 2, 'GRANOLAS', 'producto', 'oferta', NULL, '2019-11-18 10:54:37', '2019-11-18 10:54:37'),
(31, 2, 'GRAGEAS DE QUINUA', 'producto', 'oferta', NULL, '2019-11-18 10:54:37', '2019-11-18 10:54:37'),
(32, 2, ' YOGURT DE QUINUA Y AMARANTO', 'producto', 'oferta', NULL, '2019-11-18 10:54:37', '2019-11-18 10:54:37'),
(33, 2, 'MANJAR DE QUINUA Y AMARANTO', 'producto', 'oferta', NULL, '2019-11-18 10:54:37', '2019-11-18 10:54:37'),
(34, 2, 'MAQUINARIA PARA EN ENVASADO DE LOS TURRONES', 'producto', 'demanda', NULL, '2019-11-18 10:54:37', '2019-11-18 10:54:37'),
(35, 2, 'MAQUINARIA PARA EL ENVASADO DE GRAGEAS DE QUINUA', 'producto', 'demanda', NULL, '2019-11-18 10:54:37', '2019-11-18 10:54:37'),
(36, 2, 'MÁQUINA TURRONERA', 'producto', 'demanda', NULL, '2019-11-18 10:54:37', '2019-11-18 10:54:37'),
(37, 2, 'MÁQUINA GRAGEADORA', 'producto', 'demanda', NULL, '2019-11-18 10:54:37', '2019-11-18 10:54:37'),
(38, 2, 'CONSERVADORES INDUSTRIALES PARA LÁCTEOS', 'producto', 'demanda', NULL, '2019-11-18 10:54:37', '2019-11-18 10:54:37'),
(39, 2, 'ENVASES PARA YOGURT DE 500 ML. Y 1 LITRO.', 'producto', 'demanda', NULL, '2019-11-18 10:54:37', '2019-11-18 10:54:37'),
(40, 2, 'ENVASES PARA MANJAR DE 250 GRS, 500 GRS. 1 KG.', 'producto', 'demanda', NULL, '2019-11-18 10:54:37', '2019-11-18 10:54:37'),
(41, 2, 'APARATO PARA MEDIR LA CALIDAD DE LA LECHE', 'producto', 'demanda', NULL, '2019-11-18 10:54:37', '2019-11-18 10:54:37'),
(42, 2, 'APARATO PARA MEDIR EL ESPESOR Y OTROS DE LA LECHE', 'producto', 'demanda', NULL, '2019-11-18 10:54:37', '2019-11-18 10:54:37'),
(43, 2, 'APARATO PARA MEDIR DENSIDAD Y EL PH DE LA LECHE', 'producto', 'demanda', NULL, '2019-11-18 10:54:37', '2019-11-18 10:54:37'),
(44, 2, 'MAQUINARIA PARA EL ENVASADO DE YOGURT', 'producto', 'demanda', NULL, '2019-11-18 10:54:37', '2019-11-18 10:54:37'),
(45, 2, 'MAQUINARIA PARA ELABORACIÓN DE YOGURT', 'producto', 'demanda', NULL, '2019-11-18 10:54:37', '2019-11-18 10:54:37'),
(46, 2, 'MAQUINARIA PAR EL ENVASADO DE MANJAR', 'producto', 'demanda', NULL, '2019-11-18 10:54:37', '2019-11-18 10:54:37'),
(47, 2, 'MAQUINARIA PARA ELABORACIÓN DE MANJAR', 'producto', 'demanda', NULL, '2019-11-18 10:54:37', '2019-11-18 10:54:37'),
(48, 4, 'BALANZAS Y SELLADORAS', 'producto', 'oferta', NULL, '2019-11-18 11:11:02', '2019-11-18 11:11:02'),
(49, 4, 'CARRITOS DE PURO INOX', 'producto', 'oferta', NULL, '2019-11-18 11:11:02', '2019-11-18 11:11:02'),
(50, 4, 'LAVAPLATOS', 'producto', 'oferta', NULL, '2019-11-18 11:11:02', '2019-11-18 11:11:02'),
(51, 4, 'GONDOLAS', 'producto', 'oferta', NULL, '2019-11-18 11:11:02', '2019-11-18 11:11:02'),
(52, 4, 'MESONES', 'producto', 'oferta', NULL, '2019-11-18 11:11:02', '2019-11-18 11:11:02'),
(53, 4, 'EQUIPOS PARA EMBUTIDOS', 'producto', 'oferta', NULL, '2019-11-18 11:11:02', '2019-11-18 11:11:02'),
(54, 4, 'EQUIPOS DE PANADERIA', 'producto', 'oferta', NULL, '2019-11-18 11:11:02', '2019-11-18 11:11:02'),
(55, 4, 'INSUMOS DE EMBALAJE', 'producto', 'demanda', NULL, '2019-11-18 11:11:02', '2019-11-18 11:11:02'),
(56, 4, 'INSUMOS DE LIMPIEZA', 'producto', 'demanda', NULL, '2019-11-18 11:11:02', '2019-11-18 11:11:02'),
(57, 4, 'PAPELERÍA', 'producto', 'demanda', NULL, '2019-11-18 11:11:02', '2019-11-18 11:11:02'),
(58, 4, 'SERVICIOS ADUANEROS', 'servicio', 'demanda', NULL, '2019-11-18 11:11:02', '2019-11-18 11:11:02'),
(59, 4, 'TRANSPORTE ', 'servicio', 'demanda', NULL, '2019-11-18 11:11:02', '2019-11-18 11:11:02'),
(60, 4, 'TELECOMUNICACIÓN', 'servicio', 'demanda', NULL, '2019-11-18 11:11:02', '2019-11-18 11:11:02'),
(61, 5, 'PORCENTAJE DE NUESTRAS ACCIONES DE NUESTRA STARTUP', 'servicio', 'oferta', NULL, '2019-11-18 11:13:38', '2019-11-18 11:13:38'),
(62, 5, 'INVERSIONISTA PARA LA  4TA Y 5TA ACTUALIZACIÓN', 'servicio', 'demanda', NULL, '2019-11-18 11:13:38', '2019-11-18 11:13:38'),
(63, 7, 'PANTALONES DE TRABAJO EN TELA JEANS', 'producto', 'oferta', NULL, '2019-11-18 11:14:41', '2019-11-18 11:14:41'),
(64, 7, 'PANTALONES JEANS PARA VARÓN Y DAMA', 'producto', 'oferta', NULL, '2019-11-18 11:14:41', '2019-11-18 11:14:41'),
(65, 7, 'INSUMOS DE COSTURA', 'producto', 'demanda', NULL, '2019-11-18 11:14:41', '2019-11-18 11:14:41'),
(66, 7, 'TELA', 'producto', 'demanda', NULL, '2019-11-18 11:14:41', '2019-11-18 11:14:41'),
(67, 9, 'SEGURO OBLIGATORIO DE ACCIDENTES DE TANSITO', 'servicio', 'oferta', NULL, '2019-11-18 11:16:03', '2019-11-18 11:16:03'),
(68, 9, 'SEGUROS PERSONALES Y GRUPALES DE VIDA', 'servicio', 'oferta', NULL, '2019-11-18 11:16:03', '2019-11-18 11:16:03'),
(69, 9, 'SEGUROS PERSONALES Y GRUPALES DE ACCIDENTES', 'servicio', 'oferta', NULL, '2019-11-18 11:16:03', '2019-11-18 11:16:03'),
(70, 9, '	SERVICIOS EN GENERAL', 'servicio', 'demanda', NULL, '2019-11-18 11:16:03', '2019-11-18 11:16:03'),
(71, 8, 'CAJAS DE EMBUTIR', 'producto', 'oferta', NULL, '2019-11-18 11:18:12', '2019-11-18 11:18:12'),
(72, 8, 'SENSORES', 'producto', 'oferta', NULL, '2019-11-18 11:18:12', '2019-11-18 11:18:12'),
(73, 8, 'LUMINARIAS', 'producto', 'oferta', NULL, '2019-11-18 11:18:12', '2019-11-18 11:18:12'),
(74, 8, 'TOMAS INTERRUPTORES', 'producto', 'oferta', NULL, '2019-11-18 11:18:12', '2019-11-18 11:18:12'),
(75, 8, 'PLACAS ELÉCTRICAS', 'producto', 'oferta', NULL, '2019-11-18 11:18:12', '2019-11-18 11:18:12'),
(76, 8, 'PRODUCTOS ELÉCTRICOS PARA LA CONSTRUCCIÓN', 'producto', 'oferta', NULL, '2019-11-18 11:18:12', '2019-11-18 11:18:12'),
(77, 8, 'DISTRIBUIDORES PARA COMERCIALIZAR EL PRODUCTO', 'servicio', 'demanda', NULL, '2019-11-18 11:18:12', '2019-11-18 11:18:12'),
(78, 8, 'CLIENTES QUE REQUIERAN PRODUCTOS PARA LA OBRA CIVI', 'servicio', 'demanda', NULL, '2019-11-18 11:18:12', '2019-11-18 11:18:12'),
(79, 16, 'CALAMINAS EN DIFERENTES MEDIDAS', 'producto', 'oferta', NULL, '2019-11-18 11:29:13', '2019-11-18 11:29:13'),
(80, 16, 'ENTREGA DE PRODUCTOS EN OBRA', 'servicio', 'oferta', NULL, '2019-11-18 11:29:13', '2019-11-18 11:29:13'),
(81, 16, 'MOBILIARIO PARA OFICINA', 'producto', 'demanda', NULL, '2019-11-18 11:29:13', '2019-11-18 11:29:13'),
(82, 16, 'NSUMOS PARA IMPRESORAS', 'producto', 'demanda', NULL, '2019-11-18 11:29:13', '2019-11-18 11:29:13'),
(83, 16, 'EPPS', 'producto', 'demanda', NULL, '2019-11-18 11:29:13', '2019-11-18 11:29:13'),
(84, 16, 'OVEROLES', 'producto', 'demanda', NULL, '2019-11-18 11:29:13', '2019-11-18 11:29:13'),
(85, 16, 'LUBRICANTES PARA CAMIONES Y EQUIPO PESADO', 'producto', 'demanda', NULL, '2019-11-18 11:29:13', '2019-11-18 11:29:13'),
(86, 16, 'MATERIAL DE ESCRITORIO', 'producto', 'demanda', NULL, '2019-11-18 11:29:13', '2019-11-18 11:29:13'),
(87, 16, 'CHATARRA FERROSA', 'producto', 'demanda', NULL, '2019-11-18 11:29:13', '2019-11-18 11:29:13'),
(88, 16, 'SERVICIOS DE MANTENIMIENTO DE COMPUTADORAS Y FOTOC', 'servicio', 'demanda', NULL, '2019-11-18 11:29:13', '2019-11-18 11:29:13'),
(89, 16, 'PERFILES ANGULARES Y PLATINOS.', 'producto', 'oferta', NULL, '2019-11-18 11:31:09', '2019-11-18 11:31:09'),
(90, 16, 'TUBOS ESTRUCTURALES', 'producto', 'oferta', NULL, '2019-11-18 11:31:09', '2019-11-18 11:31:09'),
(91, 16, 'CAÑERIAS DE GAS', 'producto', 'oferta', NULL, '2019-11-18 11:31:09', '2019-11-18 11:31:09'),
(92, 16, 'PLANCHAS DE ACERO', 'producto', 'oferta', NULL, '2019-11-18 11:31:09', '2019-11-18 11:31:09'),
(93, 16, 'CALAMINAS EN DIFERENTES TIPOS', 'producto', 'oferta', NULL, '2019-11-18 11:31:09', '2019-11-18 11:31:09'),
(94, 16, 'FIERRO CORRUGADO EN DIFERENTES MEDIDAS', 'producto', 'oferta', NULL, '2019-11-18 11:31:09', '2019-11-18 11:31:09'),
(95, 16, 'MALLAS ELECTROSOLDADAS', 'producto', 'oferta', NULL, '2019-11-18 11:31:09', '2019-11-18 11:31:09'),
(96, 16, 'LINEAS DE CREDITO', 'servicio', 'oferta', NULL, '2019-11-18 11:31:09', '2019-11-18 11:31:09'),
(97, 16, 'CORTAMOS Y PLEGAMOS PLANCHA', 'servicio', 'oferta', NULL, '2019-11-18 11:31:09', '2019-11-18 11:31:09');

-- --------------------------------------------------------

--
-- Table structure for table `participantes`
--

CREATE TABLE `participantes` (
  `participante_id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `nombres` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `carnet` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `celular` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cargo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `es_usuario` tinyint(4) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `participantes`
--

INSERT INTO `participantes` (`participante_id`, `empresa_id`, `nombres`, `apellidos`, `carnet`, `celular`, `cargo`, `es_usuario`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Andrea Luisa', 'Silvestre Lobo', '7287697', '61836193', 'SISTEMAS', 0, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(2, 2, 'OMAR', 'LANZA', '3398390', '75706335', 'GERENTE COMERCIAL', 0, NULL, '2019-11-13 10:00:46', '2019-11-13 10:00:46'),
(3, 2, 'YUDITH', 'RONCAL', '6398134', '60341827', 'JEFE DE VENTAS', 0, NULL, '2019-11-13 10:00:46', '2019-11-13 10:00:46'),
(4, 3, 'DANTE ORLANDO', 'CUELLAR PATIÑO', '8932365', '75024805', 'GERENTE GENERAL', 0, NULL, '2019-11-13 16:32:25', '2019-11-13 16:32:25'),
(5, 3, 'JOSUE JOEL', 'MALDONADO MALDONADO', '4822937', '60938028', 'GERENTE DE INGENIERIA', 0, NULL, '2019-11-13 16:32:25', '2019-11-13 16:32:25'),
(6, 4, 'LETICIA', 'NOGALES', '8676613', '61782188', 'ADMINISTRADORA', 0, NULL, '2019-11-13 16:59:51', '2019-11-13 16:59:51'),
(7, 5, 'HUGO', 'VICENTE', '5744568', '60401775', 'CEO', 0, NULL, '2019-11-13 17:15:55', '2019-11-13 17:15:55'),
(8, 5, 'VICTOR HUGO', 'VICENTE CHOQUE', '5744567', '77149380', 'CCO', 0, NULL, '2019-11-13 17:15:55', '2019-11-13 17:15:55'),
(9, 6, 'LIONEL', 'FLORES FERNANDEZ', '12543634', '71224940', 'GERENTE GENERAL', 0, NULL, '2019-11-13 17:18:57', '2019-11-13 17:18:57'),
(10, 7, 'JHOVANA PATRICIA', 'RAMOS MITA', '3528632', '67559078', 'RESPONSABLE ÁREA COMERCIAL', 0, NULL, '2019-11-13 17:21:41', '2019-11-13 17:21:41'),
(11, 8, 'MARISOL', 'ESCALANTE SOTO', '3247144', '70050449', 'REPRESENTANTE EN BOLIVIA', 0, NULL, '2019-11-13 17:27:09', '2019-11-13 17:27:09'),
(12, 9, 'BELTHUR LUCIO', 'CAMACHO FERRUFINO', '4047602', '69600578', 'RESPONSABLE DE SUCURSAL ORURO', 0, NULL, '2019-11-13 17:31:24', '2019-11-13 17:31:24'),
(13, 9, 'JUVENAL ANDRES', 'ZABALA IGNACIO', '5770110', '75426261', 'EJECUTIVO COMERCIAL', 0, NULL, '2019-11-13 17:31:24', '2019-11-13 17:31:24'),
(14, 10, 'FRANCO JESUS', 'MAMANI POZO', '7275047', '76137653', 'PROPIETARIO - REPRESENTANTE LEGAL', 0, '2019-11-15 18:22:03', '2019-11-13 17:53:53', '2019-11-15 18:22:03'),
(15, 11, 'FRANCO JESUS', 'MAMANI POZO', '7275047', '76137653', 'PROPIETARIO - REPRESENTANTE LEGAL', 0, '2019-11-16 10:32:20', '2019-11-15 18:29:23', '2019-11-16 10:32:20'),
(16, 12, 'FRANCO JESUS', 'MAMANI POZO', '7275047', '76137653', 'PROPIETARIO - REPRESENTANTE LEGAL', 0, '2019-11-16 10:32:24', '2019-11-15 18:29:52', '2019-11-16 10:32:24'),
(17, 13, 'FRANCO JESUS', 'MAMANI POZO', '7275047', '76137653', 'PROPIETARIO - REPRESENTANTE LEGAL', 0, '2019-11-16 10:46:21', '2019-11-16 10:37:48', '2019-11-16 10:46:21'),
(18, 14, 'FRANCO JESUS', 'MAMANI POZO', '7275047', '76137653', 'PROPIETARIO - REPRESENTANTE LEGAL', 0, NULL, '2019-11-16 10:48:30', '2019-11-16 10:48:30'),
(19, 15, 'alejandra', 'SILVESTRE', '7777', '666', 'GERENTE', 0, '2019-11-18 09:45:35', '2019-11-18 09:37:04', '2019-11-18 09:45:35'),
(20, 15, 'SEBASTIAN', 'SILVETRE', '5555', '1111', 'JEFE VENTAS', 0, '2019-11-18 09:45:35', '2019-11-18 09:37:04', '2019-11-18 09:45:35'),
(21, 16, 'ROBERTO', 'MERIDA MACHACA', '5724621', '71843670', 'VENTAS EXTERNAS', 0, NULL, '2019-11-18 11:29:13', '2019-11-18 11:29:13'),
(22, 16, 'VERONICA', 'GUTIERREZ', '5764414', '71843917', 'VENTAS EXTERNAS', 0, NULL, '2019-11-18 11:29:13', '2019-11-18 11:29:13');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reuniones`
--

CREATE TABLE `reuniones` (
  `reunion_id` int(10) UNSIGNED NOT NULL,
  `mesa_id` int(10) UNSIGNED NOT NULL,
  `empresa_solicitante_id` int(10) UNSIGNED NOT NULL,
  `empresa_demandada_id` int(10) UNSIGNED NOT NULL,
  `empresa_solicitante_asistio` tinyint(1) NOT NULL DEFAULT '0',
  `empresa_demandada_asistio` tinyint(1) NOT NULL DEFAULT '0',
  `resultado` enum('satisfactoria','ausencia','agendado') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'agendado',
  `desde` datetime NOT NULL,
  `hasta` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rubros`
--

CREATE TABLE `rubros` (
  `rubro_id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rubros`
--

INSERT INTO `rubros` (`rubro_id`, `nombre`, `descripcion`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'AGRÍCOLA, PECUARIO Y HORTOFRUTICOLA', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(2, 'ALIMENTOS Y BEBIDAS', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(3, 'PRODUCTOS PARA LA CONTRUCCIÓN Y DECORACIÓN', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(4, 'PLÁSTICOS O AFINES', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(5, 'ENVASES, EMBALAJES Y AFINES', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(6, 'QUÍMICOS', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(7, 'FARMACIA, MEDICAMENTOS', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(8, 'EQUIPOS ELÉCTRICOS', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(9, 'MINERÍA', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(10, 'INDUSTRIA DE LA MADERA Y MUEBLES EN GENERAL', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(11, 'INDUSTRIA TEXTIL, CONFECCIONES Y MODA', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(12, 'CUERO CALZADO Y MANUFACTURAS DE CUERO', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(13, 'INDUSTRIA PAPELERA Y GRÁFICA', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(14, 'VEHÍCULOS AUTOMOTORES, PIEZAS, PARTES', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(15, 'EQUIPOS E IMPLEMENTOS HIDRAHULICOS', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(16, 'TECNOLOGÍAS DE LA INFORMACIÓN Y COMUNICACIÓN', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(17, 'ELECTRODOMÉSTICOS Y LÍNEA BLANCA', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(18, 'ARTESANIAS', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(19, 'JOYERÍA. BISUTERÍA Y ORFEBRERÍA', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(20, 'COSMÉTICOS, BELLEZA Y SALUD', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(21, 'METALMECÁNICA Y ELECTROMECÁNICA', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(22, 'EQUIPOS DE TECNÓLOGÍA PARA LA INDUSTRIA MINERA, GAS, PETROLIO O SIMILARES', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(23, 'PETROLEO, GAS Y PETROQUÍMICA', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(24, 'ARTÍCULOS, IMPLEMENTOS Y EQUIPOS DE SEGURIDAD', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(25, 'ARTÍCULOS DE LIMPIEZA PARA EL HOGAR', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(26, 'JUGUETERÍA Y ARTÍCULOS DE ENTRETENIMIENTO', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(27, 'FERRETERÍA Y HERRAMIENTAS', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(28, 'ENERGÍA', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(29, 'ECOLÓGÍA Y PROTECCIÓN DE MEDIO AMBIENTE', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(30, 'TECNOLOGÍA Y EQUIPAMIENTO PARA AGROPECUARIA E INDUSTRIA', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(31, 'OTROS', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(32, 'COMPAÑÍA DE TRADING', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(33, 'BANCOS Y FINANCIERAS', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(34, 'FLETES Y TRANSPORTE', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(35, 'SERVICIOS ADUANEROS', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(36, 'ALMACENAMIENTO Y DISTRIBUCIÓN', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(37, 'SEGUROS', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(38, 'TURISMO', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(39, 'SERVICIOS EMPRESARIALES', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(40, 'SERVICIOS DE COSTRUCCIÓN E INGENIERÍA', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(41, 'SERVICIOS INFORMÁTICOS Y DE TELECOMUNICACIÓN', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(42, 'SERVICIOS PARA LA AGROINDUSTRIA', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(43, 'OTROS SERVICIOS', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(44, 'GOBIERNO Y SUS ORGANISMOS', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(45, 'ORGANISMOS INTERNACIONALES', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(46, 'CÁMARAS Y ORGANIZACIONES EMPRESARIALES', NULL, NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `nombres` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cuenta` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono_celular` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `whatsapp` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_usuario` enum('administrador','empresa') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `nombres`, `apellidos`, `cuenta`, `email`, `telefono_celular`, `whatsapp`, `tipo_usuario`, `password`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Andrea Luisa', 'Silvestre Lobo', 'andrea', 'asilvestre@campoferial3dejulio.com', '61836193', '61836193', 'administrador', '$2y$10$w7QgPA6GfzPiNhSw9TLM4O7sF2BLzoHdBLBnwpDduZF8FwR1GJAZm', NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(2, 'Andrea Luisa', 'Silvestre Lobo', 'luisa', 'asilvestre@campoferial3dejulio.com', '61836193', '61836193', 'empresa', '$2y$10$xFeUaz/xBO2oPagU9qD1h.f29ws485QPTZPivmA2Zb.Pa3LgJlI3a', NULL, '2019-11-08 15:40:06', '2019-11-08 15:40:06'),
(3, 'OMAR', 'LANZA', 'omar', 'omarlanza@hotmail.com', '75706335', '75706335', 'empresa', '$2y$10$13UjgOfzzUEvqAWdZs3X8.IK6u7CLb3HCLDz/WUqIDW523NBC7cAK', NULL, '2019-11-13 10:00:46', '2019-11-13 10:00:46'),
(4, 'DANTE ORLANDO', 'CUELLAR PATIÑO', 'dante', 'dante.cuellar@ibco.com.bo', '75024805', '75024805', 'empresa', '$2y$10$FeWqfiPpxvILi/d6K..J.O4ya7pfj9Va7kH4l2l6Bb/e4MueAkMpO', NULL, '2019-11-13 16:32:25', '2019-11-13 16:32:25'),
(5, 'LETICIA', 'NOGALES', 'leticia', NULL, '61782188', '61782188', 'empresa', '$2y$10$LAhz/FEw.mHAoMAmUYH5Q.9zIhluj64kTsYWeUcfc3pG593lWmvrO', NULL, '2019-11-13 16:59:51', '2019-11-18 11:36:31'),
(6, 'HUGO', 'VICENTE', 'hugo', 'pcreativobolivia@gmail.com', '60401775', '60401775', 'empresa', '$2y$10$o1kO5VPxnOPpMz99nMIugefyq4NDUG0FRK/5INwIoN.2brzejDt3.', NULL, '2019-11-13 17:15:55', '2019-11-13 17:15:55'),
(7, 'LIONEL', 'FLORES FERNANDEZ', 'lionel', 'lionelfloresfernandez@gmail.com', '71224940', '71224940', 'empresa', '$2y$10$Sx5Vp3v6i9uffeEfUHQxP.lty343IUB.nbns8znIqs6VXAWLy2gPW', NULL, '2019-11-13 17:18:57', '2019-11-13 17:18:57'),
(8, 'JHOVANA PATRICIA', 'RAMOS MITA', 'jhovana', NULL, '67559078', '67559078', 'empresa', '$2y$10$Iicjgwq53ua5xr4.AW9UDeaggBwkvSC1XORMm9VWSCUCVRqvTxRbG', NULL, '2019-11-13 17:21:41', '2019-11-13 17:21:41'),
(9, 'MARISOL', 'ESCALANTE SOTO', 'marisol', NULL, '70050449', '70050449', 'empresa', '$2y$10$duBs.LRFEwQfBoVIml1KduGyr1Xv8U9QKGvy.MUIqtnHAwes9P6iO', NULL, '2019-11-13 17:27:09', '2019-11-13 17:27:09'),
(10, 'BELTHUR LUCIO', 'CAMACHO FERRUFINO', 'belthur', NULL, '69600578', '69600578', 'empresa', '$2y$10$jjXsfcVgsxSFm39FAPaULO4VtlQz0KWu7aVO1UOWVMJVVac13VFWe', NULL, '2019-11-13 17:31:24', '2019-11-13 17:31:24'),
(11, 'FRANCO JESUS', 'MAMANI POZO', 'franco', 'mamanipozofrancojesus@gmail.com', '76137653', '76137653', 'empresa', '$2y$10$FSxsNcT5ObtbWFIurwbWl.DdL5RA4lVCyn/BUrJGBjS0oTkeSePxG', '2019-11-15 18:22:03', '2019-11-13 17:53:53', '2019-11-15 18:22:03'),
(12, 'FRANCO JESUS', 'MAMANI POZO', 'franco', 'mamanipozofrancojesus@gmail.com', '76137653', '76137653', 'empresa', '$2y$10$RU02b8cc82XbYBaw90t94ezicVWjvWxfC0jFWC5dv.D2S7g5T4Gom', '2019-11-16 10:32:20', '2019-11-15 18:29:23', '2019-11-16 10:32:20'),
(13, 'FRANCO JESUS', 'MAMANI POZO', 'franco', 'mamanipozofrancojesus@gmail.com', '76137653', '76137653', 'empresa', '$2y$10$JUYi/fL4ZqxB7aQN3esVCeACMrpmQyfuaG09oOw7WXMcU3QgP6Xsu', '2019-11-16 10:32:24', '2019-11-15 18:29:52', '2019-11-16 10:32:24'),
(14, 'FRANCO JESUS', 'MAMANI POZO', 'franco', 'mamanipozofrancojesus@gmail.com', '76137653', '76137653', 'empresa', '$2y$10$3TrnfzjQTYv/SlvPlUwCPOimxQZfI.wiNHilWxzuu82xIM267KNmW', '2019-11-16 10:46:21', '2019-11-16 10:37:48', '2019-11-16 10:46:21'),
(15, 'FRANCO JESUS', 'MAMANI POZO', 'franco', 'mamanipozofrancojesus@gmail.com', '76137653', '76137653', 'empresa', '$2y$10$JPqndSVlw/986HDLFeWxHOzvv/Qs2RE7r8fQwpbvxf8oU92Cy/pwy', NULL, '2019-11-16 10:48:30', '2019-11-16 10:48:30'),
(16, 'alejandra', 'SILVESTRE', 'andrea', NULL, '666', '666', 'empresa', '$2y$10$gp.50qi4UPYNexMDewOAf.KAKoxHpHcAH.uxm2yNmZ5nd/vlNatVy', '2019-11-18 09:45:35', '2019-11-18 09:37:04', '2019-11-18 09:45:35'),
(17, 'nada', 'nada', 'rosmery', NULL, '72358627', '72358627', 'empresa', '$2y$10$yYmDwSCGXlxoQIi/5FNWGOOso7rG1xaNyoVpJ66844x/hwHnK3od2', NULL, '2019-11-18 11:01:15', '2019-11-18 11:06:56'),
(18, 'ROBERTO', 'MERIDA MACHACA', 'roberto', NULL, '71843670', '71843670', 'empresa', '$2y$10$vqeAMhB5yXLdc8VDu7.gcePvGk4YriFZOqJ4//ggpKVPkwevoVSni', NULL, '2019-11-18 11:29:13', '2019-11-18 11:29:13'),
(19, 'Maria', 'Lopez', 'sistemas', NULL, '6666', '666', 'administrador', '$2y$10$EWILPit6jn92ZDdZGQSVuu2nzERK6t7kFTD.rESCSzUnSYZZ8J1GS', NULL, '2019-11-18 16:58:47', '2019-11-18 16:58:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agendas`
--
ALTER TABLE `agendas`
  ADD PRIMARY KEY (`agenda_id`);

--
-- Indexes for table `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`empresa_id`),
  ADD KEY `empresas_rubro_id_foreign` (`rubro_id`),
  ADD KEY `empresas_usuario_id_foreign` (`usuario_id`);

--
-- Indexes for table `evaluaciones_generales`
--
ALTER TABLE `evaluaciones_generales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluaciones_generales_empresa_id_foreign` (`empresa_id`);

--
-- Indexes for table `evaluacion_reuniones`
--
ALTER TABLE `evaluacion_reuniones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluacion_reuniones_reunion_id_foreign` (`reunion_id`),
  ADD KEY `evaluacion_reuniones_empresa_id_foreign` (`empresa_id`);

--
-- Indexes for table `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`horario_id`);

--
-- Indexes for table `horarios_ocupados`
--
ALTER TABLE `horarios_ocupados`
  ADD PRIMARY KEY (`horario_ocupado_id`),
  ADD KEY `horarios_ocupados_empresa_id_foreign` (`empresa_id`),
  ADD KEY `horarios_ocupados_horario_id_foreign` (`horario_id`);

--
-- Indexes for table `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`mesa_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oferta_demandas`
--
ALTER TABLE `oferta_demandas`
  ADD PRIMARY KEY (`oferta_demanda_id`),
  ADD KEY `oferta_demandas_empresa_id_foreign` (`empresa_id`);

--
-- Indexes for table `participantes`
--
ALTER TABLE `participantes`
  ADD PRIMARY KEY (`participante_id`),
  ADD KEY `participantes_empresa_id_foreign` (`empresa_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `reuniones`
--
ALTER TABLE `reuniones`
  ADD PRIMARY KEY (`reunion_id`),
  ADD KEY `reuniones_mesa_id_foreign` (`mesa_id`);

--
-- Indexes for table `rubros`
--
ALTER TABLE `rubros`
  ADD PRIMARY KEY (`rubro_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agendas`
--
ALTER TABLE `agendas`
  MODIFY `agenda_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `empresas`
--
ALTER TABLE `empresas`
  MODIFY `empresa_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `evaluaciones_generales`
--
ALTER TABLE `evaluaciones_generales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `evaluacion_reuniones`
--
ALTER TABLE `evaluacion_reuniones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `horarios`
--
ALTER TABLE `horarios`
  MODIFY `horario_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `horarios_ocupados`
--
ALTER TABLE `horarios_ocupados`
  MODIFY `horario_ocupado_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mesas`
--
ALTER TABLE `mesas`
  MODIFY `mesa_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `noticias`
--
ALTER TABLE `noticias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oferta_demandas`
--
ALTER TABLE `oferta_demandas`
  MODIFY `oferta_demanda_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `participantes`
--
ALTER TABLE `participantes`
  MODIFY `participante_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `reuniones`
--
ALTER TABLE `reuniones`
  MODIFY `reunion_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rubros`
--
ALTER TABLE `rubros`
  MODIFY `rubro_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuario_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
-- Constraints for table `evaluaciones_generales`
--
ALTER TABLE `evaluaciones_generales`
  ADD CONSTRAINT `evaluaciones_generales_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`empresa_id`) ON DELETE CASCADE;

--
-- Constraints for table `evaluacion_reuniones`
--
ALTER TABLE `evaluacion_reuniones`
  ADD CONSTRAINT `evaluacion_reuniones_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`empresa_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `evaluacion_reuniones_reunion_id_foreign` FOREIGN KEY (`reunion_id`) REFERENCES `reuniones` (`reunion_id`) ON DELETE CASCADE;

--
-- Constraints for table `horarios_ocupados`
--
ALTER TABLE `horarios_ocupados`
  ADD CONSTRAINT `horarios_ocupados_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`empresa_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `horarios_ocupados_horario_id_foreign` FOREIGN KEY (`horario_id`) REFERENCES `horarios` (`horario_id`) ON DELETE CASCADE;

--
-- Constraints for table `oferta_demandas`
--
ALTER TABLE `oferta_demandas`
  ADD CONSTRAINT `oferta_demandas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`empresa_id`) ON DELETE CASCADE;

--
-- Constraints for table `participantes`
--
ALTER TABLE `participantes`
  ADD CONSTRAINT `participantes_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`empresa_id`) ON DELETE CASCADE;

--
-- Constraints for table `reuniones`
--
ALTER TABLE `reuniones`
  ADD CONSTRAINT `reuniones_mesa_id_foreign` FOREIGN KEY (`mesa_id`) REFERENCES `mesas` (`mesa_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
