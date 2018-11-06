-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 05, 2018 at 08:53 AM
-- Server version: 10.1.36-MariaDB-cll-lve
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qetpcyjf_rueda`
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
  `estado` enum('aceptado','rechazado','pendiente') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_asignacion` enum('pre_agendado','administracion','cita_de_contingencia') COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agendas`
--

INSERT INTO `agendas` (`agenda_id`, `empresa_solicitante_id`, `empresa_demandada_id`, `horario_id`, `mesa_id`, `estado`, `tipo_asignacion`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 8, 12, 0, 0, 'pendiente', 'pre_agendado', NULL, '2018-10-23 20:25:16', '2018-10-23 20:25:16'),
(2, 8, 12, 0, 0, 'pendiente', 'pre_agendado', NULL, '2018-10-23 20:25:35', '2018-10-23 20:25:35'),
(3, 8, 12, 3, 1, 'pendiente', 'pre_agendado', '2018-10-23 23:26:01', '2018-10-23 20:26:04', '2018-10-23 23:26:01'),
(4, 8, 12, 3, 1, 'pendiente', 'pre_agendado', '2018-10-23 23:28:38', '2018-10-23 20:26:08', '2018-10-23 23:28:38'),
(5, 8, 12, 3, 1, 'pendiente', 'pre_agendado', '2018-10-23 23:26:11', '2018-10-23 20:26:09', '2018-10-23 23:26:11'),
(6, 8, 12, 3, 1, 'pendiente', 'pre_agendado', '2018-10-23 23:32:41', '2018-10-23 20:26:09', '2018-10-23 23:32:41'),
(7, 8, 12, 3, 1, 'pendiente', 'pre_agendado', '2018-10-24 13:19:47', '2018-10-23 20:26:27', '2018-10-24 13:19:47'),
(8, 8, 11, 3, 2, 'pendiente', 'pre_agendado', '2018-10-24 13:19:51', '2018-10-23 20:32:07', '2018-10-24 13:19:51'),
(9, 8, 11, 3, 2, 'pendiente', 'pre_agendado', '2018-10-23 23:26:08', '2018-10-23 20:32:10', '2018-10-23 23:26:08'),
(10, 14, 15, 3, 5, 'pendiente', 'pre_agendado', '2018-10-25 23:38:59', '2018-10-25 23:38:26', '2018-10-25 23:38:59'),
(11, 14, 15, 3, 5, 'pendiente', 'pre_agendado', NULL, '2018-10-25 23:38:40', '2018-10-25 23:38:40'),
(12, 14, 8, 3, 10, 'pendiente', 'pre_agendado', '2018-10-27 17:33:58', '2018-10-25 23:40:26', '2018-10-27 17:33:58'),
(13, 31, 38, 3, 1, 'pendiente', 'administracion', '2018-10-26 22:30:30', '2018-10-26 22:29:27', '2018-10-26 22:30:30'),
(14, 14, 38, 5, 5, 'aceptado', 'pre_agendado', NULL, '2018-10-27 17:34:28', '2018-10-30 13:25:11'),
(15, 14, 8, 7, 5, 'aceptado', 'pre_agendado', NULL, '2018-10-27 17:35:03', '2018-10-29 01:18:33'),
(16, 37, 3, 3, 1, 'pendiente', 'pre_agendado', NULL, '2018-10-29 20:44:28', '2018-10-29 20:44:28'),
(17, 37, 0, 0, 0, 'pendiente', 'pre_agendado', NULL, '2018-10-29 20:44:39', '2018-10-29 20:44:39'),
(18, 43, 31, 0, 0, 'pendiente', 'pre_agendado', NULL, '2018-11-01 17:28:15', '2018-11-01 17:28:15'),
(19, 44, 41, 5, 1, 'pendiente', 'pre_agendado', NULL, '2018-11-01 21:27:31', '2018-11-01 21:27:31'),
(20, 47, 37, 0, 0, 'pendiente', 'administracion', NULL, '2018-11-05 03:33:13', '2018-11-05 03:33:13');

-- --------------------------------------------------------

--
-- Table structure for table `empresas`
--

CREATE TABLE `empresas` (
  `empresa_id` int(10) UNSIGNED NOT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `empresas`
--

INSERT INTO `empresas` (`empresa_id`, `rubro_id`, `usuario_id`, `nombre`, `logo`, `direccion`, `telefono`, `ciudad_localidad`, `nit`, `pagina_web`, `representante_legal`, `habilitado`, `max_participantes`, `oferta`, `demanda`, `especial`, `deleted_at`, `created_at`, `updated_at`) VALUES
(3, 16, 9, 'Infoline', 'logos/hcNhrd9exRBwmCcoA4waT8E0S7tjCBbz7qyHwBjM.png', 'Av. 6 de agosto esq. 1ro de noviembre', '61665748', 'Oruro', '5744568011', 'no', 'Adimer Hugo Vicente Choque', 1, 2, 'Registro de empresas en nuestro directorio empresarial a travez de nuestro soporte de aplicacion movil', 'Nesecitamos registrar en nuestra app a cada sector de empresas en sus diferentes rubros y sectores', 0, NULL, '2018-10-22 13:31:15', '2018-10-22 14:46:38'),
(4, 26, 11, 'MaquiStore', NULL, 'Fortin Boquerón av del maestro y Juan lechin Oquendo', '77156676', 'Oruro', '7327341', 'no', 'Michael Dennis Machicado Fernandez', 1, 2, 'Juguetes originales de colección de la serie Dragonball Z. \nPoleras y gorras\nPinturas de 230 g de lienzo mate de alta calidad. \nBilleteras. \nY productos saludables para adelgazar, crear masa muscular o mejorar el sistema inmunologico tomando exquisitos productos saludables.', 'Focos luminosos, bases acrílicas, góndolas de doble cartón prensado o algun material parecido', 0, NULL, '2018-10-22 13:38:12', '2018-10-22 14:46:49'),
(5, 10, 12, 'MUEBLES VENTURA', NULL, 'ZONA BARRIO MUNICIPALD-3 CALLE UYUSTUS N°2044 ENTRE AV, COCHABAMBA', '75877753', 'LA PAZ - EL ALTO', '2305947016', 'no', 'JUAN VENTURA ALEJO', 1, 2, 'MUEBLES PARA EL HOGAR, LA OFICINA, PUERTAS, VENTANAS A PEDIDO DEL CLIENTE. TRBAJOS A NIVEL NACIONAL POR MAYOR Y MENOR.', 'MATERIAL DE TRABAJO (VENESTA, MADERA )ACCESORIOS (JALADORES RIELES DE CAJONES)', 0, NULL, '2018-10-22 13:44:45', '2018-10-22 14:47:28'),
(6, 43, 13, 'EMPRESA DE BIENES RAICES \"NIÑO CUSQUEÑO\"', 'logos/CXWbhD5TSLVrhsdAVSxon7ShbDvE0cyXWBa3D0dG.png', 'BOLIVAR 650 TACNA Y ARICA', '5212141', 'ORURO', '618165014', 'www.facebook.com/bienesraicesnbolivia', 'OMAR GROVER LAVAYEN', 1, 2, 'TERRENOS A CRÉDITO Y CONTADO.', 'ENTIDADES BANCARIAS Y FINANCIERAS', 0, NULL, '2018-10-22 13:51:55', '2018-10-25 20:11:06'),
(7, 3, 14, 'IMPORT EXPORT LAS LOMAS LTDA.', NULL, 'CARRETERA A VINTO KM.4,5', '5210714', 'ORURO', '1028443027', 'www.laslomas.com.bo', 'No definió', 1, 2, 'MATERIAL  DE CONSTRUCCIÓN - ACERO Y SUS DERIVADOS', 'MATERIAL DE ESCRITORIO Y LIMPIEZA, LUBRICANTES, EPPS.', 0, NULL, '2018-10-22 13:55:05', '2018-10-22 14:46:30'),
(8, 9, 15, 'NUEVO MILENIO SRL.', NULL, 'radial 26 avenida ovidio barbery barrio tropical calle 6 pasillo a #63', '69130708', 'Santa Cruz de la Sierra', '337088020', 'www.nuevomileniobolivia.com', 'No definió', 1, 2, 'Compra de minerales y productos en general y prestación de servicios de importación y exportación.', 'Proveedores de minerales y productos', 1, NULL, '2018-10-22 14:03:00', '2018-10-23 21:17:52'),
(9, 2, 16, 'Unilever Andina Bolivia S.A', NULL, 'Arica esq ayacucho', '78300592', 'Oruro', '1023225025', NULL, 'No definió', 1, 2, 'Productos de limpieza cuidado personal y alimentos', 'Personal tercero', 0, NULL, '2018-10-22 14:06:38', '2018-10-24 14:46:18'),
(10, 31, 17, 'Centro de Investigación y Servicio Popular CISEP', 'logos/h2VcpA4r7XV4e3dWwcPhg1618w5TKzW8Bp4jZwD9.jpeg', '6 de octubre y ayacucho No 559', '5257138', 'Oruro', '120139027', NULL, 'No definió', 1, 2, 'Promocionar nuestros productos como tejidos a máquina, ropa deportiva, trabajo, uniformes, capacitaciones talleres a unidades productivas comunitarias', 'Promoción, a través ves de convenios', 0, NULL, '2018-10-22 14:13:30', '2018-10-25 19:55:44'),
(11, 20, 18, 'PELIKAR', NULL, 'AV. PARAGUA CALLE SOCORI #2455', '77024341', 'SANTA CRUZ', '2829666014', 'pelikarbolivia.com', 'No definió', 1, 2, 'Somos un centro especialista en calvicie con mas de 17 años de experiencia en el mercado, producimos y distribuimos  a nivel nacional 2 lineas de productos: capilares y faciales, los cuales tienen como caracteristica principal el ser 100% naturales. Ademas de contar con todas las certificaciones que acreditan la calidad de los productos, como ser ISO 9001:2015, UNIMED, SENASAG, entre otros.', 'Distribuidor de productos cosmeticos, personas o empresas que deseen generar ingresos extras, proveedores de plasticos, etiquetas, maquinaria de mezcclado, envases', 0, NULL, '2018-10-22 14:19:11', '2018-10-22 14:47:44'),
(12, 10, 19, 'MUBRITEC Innovacion en Muebles', NULL, 'Av. 6 de Agosto Caro y Cochabamba #1106', '70415183', 'Oruro', '7261499019', 'no', 'No definió', 1, 2, '-Fabricación de Muebles en Melamina (Roperos Empotrados, Cajoneria Alta y Baja de Cocina, Modulos de Oficina, Muebles para el Hogar)\n-Estructuras Metálicas (Tinglados, barandas,etc)\n-Instalación de Cielo Falso y Piso flotante \n- Accesorios en General', '- Proveedores de Material ( Melamina y Accesorios)\n-Transporte interdepartamental e internacional', 0, NULL, '2018-10-22 14:31:41', '2018-10-22 14:47:18'),
(13, 31, 20, 'Clinica URME', NULL, 'Calle Cochabamba nro 548', '67200673', 'Oruro', '1274620010', 'no', 'No definió', 1, 2, 'Servicios médicos integrales en medicina', 'Empresas que requieran servicios médicos', 0, NULL, '2018-10-22 14:36:07', '2018-10-22 14:46:05'),
(14, 33, 21, 'ETV S.A.', 'logos/5YMW5RbnB2CDurJ7m54IxpSAZNWuqqx9bWTIQp5a.jpeg', 'JAEN ARICA E IQUIQUE #100', '5283324', 'ORURO', '177458029', 'www.etv.com.bo', 'No definió', 1, 2, 'Transporte de Valores y alquiler de cerraduras y cajas fuertes (equipo de seguridad en general para el sector financiero).', 'Distribuidores de repuestos y mantenimientos mecánicos.', 0, NULL, '2018-10-22 14:39:15', '2018-10-26 18:56:51'),
(15, 14, 22, 'MATISA AUTOS S.R.L.', 'logos/zLKFTvRW95k0KANwxKgkBm4zD1fBR4fmxBo6nl8j.jpeg', 'HERRERA ENTRE MELCHOR PEREZ DE OLGIN Y TARAPACA', '5280630', 'ORURO', '312808023', 'www.matisaautos.com', 'No definió', 1, 2, 'VENTA DE VEHÍCULOS Y MOTOS.', 'ENTIDADES FINANCIERAS.', 0, NULL, '2018-10-22 14:42:37', '2018-10-25 20:08:57'),
(16, 43, 29, 'SOLUCION MODULAR / ALVARADO DISTRIBUCIONES', NULL, '7 1/2 ANILLO y AV. CRUZ del SUR', '591 3 3578989', 'SANTA CRUZ de la SIERRA', '1883995015', NULL, 'OSCAR ALVARADO', 0, 2, 'SOFWARE DE GESTION – PARA CONTROL DE INFORMACION EN TIEMPO REAL para la INDUSTRIA, COMERCIO, SERVICIO, CONSTRUCCION, CONSULTORAS CONTABLES, ACADEMICO Y OTROS mediante módulos de COMPRA, INVENTARIO, VENTA, SERVICIO, CUENTA POR COBRAR, CAJA-BANCO, CUENTA POR PAGAR y CONTABILIDAD.\nPermite la implementación puntual al giro de negocio mediante su plataforma parametrizable o ajustable a políticas y lineamientos definidos en la organización pequeña, mediana o grande – MyPe, PyMe o Corporativo.\nEl flujo de información integra procesos críticos y operativos en un solo resultado final – Estado Resultado determinando el balance de la organización en TIEMPO REAL.\nCon versiones puntuales al giro de negocio permite competir y afirmar el posicionamiento en el mercado global – local, nacional e internacional de cualquier unidad o giro de negocio, brindando información en TIEMPO REAL para la toma de decisiones directivas, gerenciales, administrativas u operativas en la organización.', 'ORGANIZACIONES QUE NECESITEN CONTROLAR SU INFORMACION EN\nTIEMPO REAL DE CUALQUIER RUBRO COMERCIO, DISTRIBUCION, SERVICIO, INDUSTRIA, CONSTRUCCION, AGRO – AGROINDISTRIA y DESARROLLO PUNTUAL A REQUERIMIENTO DEL CLIENTE FINAL.', 0, NULL, '2018-10-23 14:03:22', '2018-10-23 22:01:54'),
(17, 43, 129, 'TIERRA Y TECHO', 'logos/4i0qtRzdZB44aHkAtb20HgccsBm7SqPaLmGkLZdW.jpeg', 'Avenida irala 712', '78180368', 'Santa cruz', '2836876015', NULL, 'Gerardo Cespedes', 0, 2, 'SOMOS UNA EMPRESA CON 12 AÑOS DE EXPERIENCIA EN VENTA DE TERRENOS TENEMOS DESDE 6000$ DE 270MT2', 'Nesecitamos mas productos', 0, NULL, '2018-10-23 17:02:58', '2018-10-23 22:02:11'),
(31, 43, 163, 'CAMPO FERIAL 3 DE JULIO', 'logos/M0dxp6akZ8miNVFAdt5vi00VQ9TqnOs1SBUD4z2s.jpeg', 'Av. Dehene prolongación circunvalación', '2 52-66111', 'Oruro, Bolibia', '281488020', 'www.campoferial3dejulio.com', 'Marcelo T. Zenteno Rafael', 1, 2, 'Somos organizadores de eventos, brindamos el servicio de alquiler de ambientes para fiestas, ferias conciertos, etc.\nTenemos eventos posicionados por excelencia (EXPOTECO, FIMEM).\nVendemos stands para nuestros eventos PRINCIPALES.', 'Demandamos servicios de imprenta, prensa publicidad en general.\nOtros servicios secundarios que requerimos son de: proyectos de construcción para la mejora del Campo Ferial. \nPatrocinios y convenios para nuestros eventos principales.\nCualquier producto ofrecido relacionado con nuestros servicios. \nINTERCAMBIO DE SERVICIOS EN FUNCIÓN DE GENERAR MAS EVENTOS ANUALES.', 0, NULL, '2018-10-23 22:27:58', '2018-11-05 06:28:29'),
(37, 3, 175, 'Vivion S.A.Bolivia', 'logos/FORQ7ak6EX34D3u25XWOBBBk7sfNbePqw0k4QVBw.png', 'Av.Paragua 3er anillo', '59170050449', 'Santa Cruz', '20503850017', 'www.vivionelectric.com', 'Marisol Escalante', 1, 2, 'Viviin S.A. fabrica y comercializa materiales Electricos , placas Tomas e interruptores, con certificaciones de calidad a nivel mundial  y Garantia de 20 años, Material antillama', 'Necesito constructoras que esten desarrollando proyectos o importadores que quieran adquirir el producto en Bolivia .', 0, NULL, '2018-10-24 18:33:22', '2018-10-24 18:33:22'),
(38, 31, 176, 'ADUANA NACIONAL', NULL, 'MADRID N° 390 ENTRE AMERICA Y COLON', '65415686', 'ORURO', '1004777023', 'https://www.aduana.gob.bo/aduana7/Institucion01', 'OSCAR DANIEL ARANCIBIA BRACAMONTE', 1, 2, 'EXPLICAR, ORIENTAR SOBRE LAS OPERACIONES DE COMERCIO EXTERIOR,  EL CONTROL DE MERCANCÍAS, Y TRABAJO QUE REALIZA LA ADUANA NACIONAL', 'MUEBLES, COMPUTADORAS, INFRAESTRUCTURA, ROPA DE TRABAJO Y OTROS', 0, NULL, '2018-10-26 19:01:18', '2018-10-26 19:01:18'),
(39, 2, 177, 'IMPORTADORA QUIRQUINCHO', 'logos/NuZiQljpXaoAbuyIKv6uFGCLrWgjqJRttH8jqJZE.jpeg', 'Av. Antofagasta s/n', '72559099', 'Villazon', '4844456010', NULL, 'Mario Chavez Choque', 1, 2, 'Harina de Trigo 000 Marca Letizia\nHarina de Trigo 000 Marca Adelia Maria\nArroz Pulido Marca Perseguido', 'Panificadoras\nDistribuidora de alimentos\nDistribuidora de Desayuno Escolar', 0, NULL, '2018-10-29 12:29:38', '2018-10-29 12:29:38'),
(40, 39, 178, 'Consultora GuiaRSE', 'logos/IYE4YK15eq2eSkiSHAfi3AKguaLyyYr5yNhdvpZv.jpeg', 'Virreynato de Lima #1544', '72222246', 'Cochabamba', '4465830016', NULL, 'Americo Dennis Arias Centellas', 1, 2, 'Servicios de asesoramiento empresarial, en el desarrollo de la Gestión Estratégica Empresarial.\nImplementación de los SGC ISO 9001; SGA ISO 14001; Seguridad y Salud Ocupacional ISO 45001; y RSE ISO 26000.', 'Posibilidades de negocio', 0, NULL, '2018-10-29 16:18:49', '2018-10-29 16:18:49'),
(41, 4, 179, 'Envases Flexibles ZEPOL LTDA', 'logos/9LpMgcurqdx2JCo7Cxp4jUlTOlAYhtZQgtACMGCE.jpeg', 'Planta de producción: Av. Néstor Galindo Zona Rosas Pampa Industrial Oficina comercial: Calle Cañada Strongest esq. Otero de la Vega No.1620 Of. 207', '2850068', 'La Paz', '1020429022', 'www.zepolltda.com', 'Patricia Lopez', 1, 2, 'Envases flexibles de todo tipo de material plásticos bolsas y bobinas transparentes, metalizados, laminados, trilaminados, acabados Mate tipo Stand Up con Zipper y válvulas con excelente calidad de impresión flexográfica.', 'Formas de reciclaje de materiales plásticos.', 0, NULL, '2018-10-31 14:01:48', '2018-10-31 14:01:48'),
(42, 43, 180, 'UNIOR SRK', 'logos/ElMk8S45Vo4f971i5IUsGAIlMBcMZ6X3UUWhE7GW.jpeg', 'Junin#348 esquina Potosí', '52-73780', 'Oruro', '1023343028', 'www.unior.edu.bo', 'María Beatriz  Cortés Gumucio', 1, 2, 'Ofertas educativas en sus diversas carreras', 'Socios para emprendimientos educativos', 0, NULL, '2018-10-31 15:18:04', '2018-10-31 15:18:04'),
(43, 31, 181, 'PROCEM S.R.L.', 'logos/mJYXcTEjsLANcmJ4fPB0tMdtKivvPRxvHkx7qKsG.jpeg', 'Av. Sexto Anillo #1200, entree Av. 2 dee Agosto y Av. Alemana', '3325633', 'Santa Cruz', '211778028', 'www.procemat.com', 'Juan Eduardo Sanchez', 1, 2, 'PROCEM SRL es  una empresa líder a nivel nacional con más de 25 años de experiencia. Dentro de la gama de productos que se ofrece son equipos de Balanzas camioneras, balanzas de peso por ejes, ganaderas, plataformas, grúas, rielera, para uso comercial, industriales, agropecuaria, minera.\r\nDe la misma manera también se realiza todo tipo de mantenimientos preventivos y correctivos de balanzas y equipos de pesaje, abarcando geográficamente a toda Bolivia.', 'Minería , Industria, ganadería, agroindustria, textil, pecuario, etc', 0, NULL, '2018-11-01 16:26:33', '2018-11-01 17:10:33'),
(44, 2, 182, 'Quirk Beer', 'logos/OuaFSqsWLcch6Yywd5LsX2BbK9HJpfLAPRfrVboG.jpeg', 'Calle k esq calle 22 #4', '67256188', 'Oruro', '5759012', NULL, 'Miguel Colque', 1, 2, 'Cerveza Artesanal y maltas', 'Botellas, envases plasticos, publicidad, acero inoxidable industria.', 0, NULL, '2018-11-01 21:24:02', '2018-11-01 21:24:02'),
(45, 33, 184, 'BANCO NACIONAL DE BOLIVIA S.A.', 'logos/GKf858Tz4U0kxo2pcRDC9jNiSdPs8nssaXO68kXD.png', 'Calle La Plata entre Sucre y Bolívar N°6160', '5115050', 'Oruro', '1016253021', 'www.bnb.com.bo', 'No definió', 1, 2, 'RELACIONES COMERCIALES', 'SERVICIOS FINANCIEROS', 1, NULL, '2018-11-02 13:13:48', '2018-11-02 19:44:51'),
(46, 8, 185, 'Team Group Oruro', 'logos/nh07woU7yvGgA03rc4iSl4QQ9sLig0UsVDiDD76y.jpeg', 'Av. Campo Jordan casi Circunvalación', '61818974', 'Oruro', '8818893', 'teamgrouporuro@gmail.com', 'Raphael Fernando Rojas Gutiérrez', 1, 2, 'Artículo electrónicos', 'Mobiliario', 0, NULL, '2018-11-02 15:59:03', '2018-11-02 15:59:03'),
(47, 41, 186, 'Infoline', 'logos/Q6dOlIjn7tsq2nBASsidAAcJFoUxPHViYVBKpitf.jpeg', 'Av 6 de agosto esq. 1ro de noviembre', '61665748', 'Oruro', '7450337012', NULL, 'Adimer vicente', 1, 2, 'Publicidad e informacion para empresas que ofrescan sus productos o servicios en nuestra App', 'Registrar empresas e instituciones en nuestra app', 0, NULL, '2018-11-04 03:17:06', '2018-11-04 03:17:06');

-- --------------------------------------------------------

--
-- Table structure for table `evaluaciones_generales`
--

CREATE TABLE `evaluaciones_generales` (
  `id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
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
  `uno` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dos` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tres` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cuatro` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cinco` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seis` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `siete` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(1, '2018-10-21 09:00:53', '2018-10-21 09:30:53', '2018-10-22 19:06:25', '2018-10-22 01:04:48', '2018-10-22 19:06:25'),
(2, '2018-11-12 03:13:18', '2018-11-12 03:13:18', '2018-10-22 19:15:26', '2018-10-22 19:14:40', '2018-10-22 19:15:26'),
(3, '2018-11-12 15:00:00', '2018-11-12 15:25:00', NULL, '2018-10-22 19:17:18', '2018-10-26 22:07:45'),
(4, '2018-11-12 15:30:00', '2018-11-12 15:55:00', NULL, '2018-10-22 19:22:13', '2018-10-26 20:26:37'),
(5, '2018-11-12 16:00:00', '2018-11-12 16:25:00', NULL, '2018-10-22 19:23:53', '2018-10-26 20:28:06'),
(6, '2018-10-22 03:27:52', '2018-10-22 03:27:52', '2018-10-22 19:28:04', '2018-10-22 19:27:52', '2018-10-22 19:28:04'),
(7, '2018-11-12 16:30:00', '2018-11-12 16:55:00', NULL, '2018-10-22 19:29:21', '2018-10-26 20:28:28'),
(8, '2018-11-12 17:00:00', '2018-11-12 17:25:00', NULL, '2018-10-26 20:29:29', '2018-10-26 20:30:11'),
(9, '2018-11-12 17:30:00', '2018-11-12 17:55:00', NULL, '2018-10-26 20:30:22', '2018-10-26 20:30:44'),
(10, '2018-11-13 09:00:00', '2018-11-13 09:25:00', NULL, '2018-10-26 20:31:33', '2018-10-26 20:31:53'),
(11, '2018-11-13 09:30:00', '2018-11-13 09:55:00', NULL, '2018-10-26 20:31:33', '2018-10-26 20:32:10'),
(12, '2018-11-13 10:00:00', '2018-11-13 10:25:00', NULL, '2018-10-26 20:31:33', '2018-10-26 20:32:26'),
(13, '2018-11-13 10:30:00', '2018-11-13 10:55:00', NULL, '2018-10-26 20:31:33', '2018-10-26 20:32:51'),
(14, '2018-11-13 11:00:00', '2018-11-13 11:25:00', NULL, '2018-10-26 20:31:34', '2018-10-26 20:33:09'),
(15, '2018-11-13 11:30:00', '2018-11-13 11:55:00', NULL, '2018-10-26 20:31:34', '2018-10-26 20:33:30'),
(16, '2018-11-13 15:00:00', '2018-11-13 15:25:00', NULL, '2018-10-26 20:31:34', '2018-10-26 20:33:53'),
(17, '2018-11-13 15:30:00', '2018-11-13 15:55:00', NULL, '2018-10-26 20:31:34', '2018-10-26 20:34:08'),
(18, '2018-11-13 16:00:00', '2018-11-13 16:25:00', NULL, '2018-10-26 20:34:58', '2018-10-26 20:35:16'),
(19, '2018-11-13 16:30:00', '2018-11-13 16:55:00', NULL, '2018-10-26 20:34:58', '2018-10-26 20:35:35'),
(20, '2018-11-13 17:00:00', '2018-11-13 17:25:00', NULL, '2018-10-26 20:34:58', '2018-10-26 20:35:50'),
(21, '2018-11-13 17:30:00', '2018-11-13 17:55:00', NULL, '2018-10-26 20:34:58', '2018-10-26 20:36:11'),
(22, '2018-11-14 09:00:00', '2018-11-14 09:25:00', NULL, '2018-10-26 20:34:58', '2018-10-26 20:36:44'),
(23, '2018-11-14 09:30:00', '2018-11-14 09:55:00', NULL, '2018-10-26 20:37:04', '2018-10-26 20:37:21'),
(24, '2018-11-14 10:00:00', '2018-11-14 10:25:00', NULL, '2018-10-26 20:37:04', '2018-10-26 20:38:13'),
(25, '2018-11-14 10:30:00', '2018-11-14 10:55:00', NULL, '2018-10-26 20:37:04', '2018-10-26 20:38:14'),
(26, '2018-11-14 11:00:00', '2018-11-14 11:25:00', NULL, '2018-10-26 20:37:04', '2018-10-26 20:38:15'),
(27, '2018-11-14 11:30:00', '2018-11-14 11:55:00', NULL, '2018-10-26 20:38:29', '2018-10-26 20:38:46'),
(28, '2018-10-26 04:56:20', '2018-10-26 04:56:20', '2018-10-26 20:57:00', '2018-10-26 20:56:53', '2018-10-26 20:57:00'),
(29, '2018-10-26 16:58:22', '2018-10-26 16:58:22', '2018-10-26 20:58:34', '2018-10-26 20:58:26', '2018-10-26 20:58:34'),
(30, '2018-10-26 17:07:12', '2018-10-26 17:07:12', '2018-10-26 21:07:49', '2018-10-26 21:07:37', '2018-10-26 21:07:49'),
(31, '2018-10-26 17:14:24', '2018-10-26 17:14:24', '2018-10-26 21:14:43', '2018-10-26 21:14:34', '2018-10-26 21:14:43'),
(32, '2018-10-26 17:00:05', '2018-10-26 17:25:05', '2018-10-26 21:17:15', '2018-10-26 21:17:05', '2018-10-26 21:17:15'),
(33, '2018-10-26 17:00:42', '2018-10-26 17:25:42', '2018-10-26 21:22:30', '2018-10-26 21:22:18', '2018-10-26 21:22:30'),
(34, '2018-10-26 06:08:20', '2018-10-26 06:08:20', '2018-10-26 22:08:36', '2018-10-26 22:08:28', '2018-10-26 22:08:36'),
(35, '2018-10-26 18:25:10', '2018-10-26 18:50:10', '2018-10-26 22:26:05', '2018-10-26 22:25:52', '2018-10-26 22:26:05');

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

--
-- Dumping data for table `horarios_ocupados`
--

INSERT INTO `horarios_ocupados` (`horario_ocupado_id`, `empresa_id`, `horario_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 31, 3, '2018-11-05 06:27:12', '2018-11-05 06:22:21', '2018-11-05 06:27:12'),
(2, 31, 3, '2018-11-05 06:24:32', '2018-11-05 06:22:33', '2018-11-05 06:24:32'),
(3, 31, 4, '2018-11-05 06:27:14', '2018-11-05 06:24:38', '2018-11-05 06:27:14'),
(4, 31, 11, '2018-11-05 06:27:16', '2018-11-05 06:26:02', '2018-11-05 06:27:16'),
(5, 31, 4, '2018-11-05 06:27:05', '2018-11-05 06:26:40', '2018-11-05 06:27:05'),
(6, 31, 5, '2018-11-05 06:27:19', '2018-11-05 06:26:48', '2018-11-05 06:27:19'),
(7, 31, 3, NULL, '2018-11-05 06:29:38', '2018-11-05 06:29:38');

-- --------------------------------------------------------

--
-- Table structure for table `mesas`
--

CREATE TABLE `mesas` (
  `mesa_id` int(10) UNSIGNED NOT NULL,
  `numero` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mesas`
--

INSERT INTO `mesas` (`mesa_id`, `numero`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'RN-1', NULL, '2018-10-20 04:42:47', '2018-10-26 21:33:51'),
(2, 'RN-2', NULL, '2018-10-20 04:42:47', '2018-10-26 21:34:44'),
(3, 'RN-3', NULL, '2018-10-20 04:42:47', '2018-10-26 21:34:46'),
(4, 'RN-4', NULL, '2018-10-20 04:42:47', '2018-10-26 21:35:02'),
(5, 'RN-5', NULL, '2018-10-20 04:42:47', '2018-10-26 21:34:49'),
(6, 'RN-6', NULL, '2018-10-20 04:42:47', '2018-10-26 21:35:00'),
(7, 'RN-7', NULL, '2018-10-20 04:42:47', '2018-10-26 21:34:58'),
(8, 'RN-8', NULL, '2018-10-20 04:42:47', '2018-10-26 21:34:51'),
(9, 'RN-9', NULL, '2018-10-20 04:42:47', '2018-10-26 21:34:55'),
(10, 'RN-10', NULL, '2018-10-20 04:42:47', '2018-10-26 21:34:53'),
(11, 'RN-11', NULL, '2018-10-20 04:42:47', '2018-10-26 21:35:43'),
(12, 'RN-12', NULL, '2018-10-20 04:42:47', '2018-10-26 21:35:45'),
(13, 'RN-13', NULL, '2018-10-20 04:42:47', '2018-10-26 21:35:47'),
(14, 'RN-14', NULL, '2018-10-20 04:42:47', '2018-10-26 21:35:51'),
(15, 'RN-15', NULL, '2018-10-20 04:42:47', '2018-10-26 21:35:50'),
(16, 'RN-16', NULL, '2018-10-20 04:42:47', '2018-10-26 21:36:03'),
(17, 'RN-17', NULL, '2018-10-20 04:42:47', '2018-10-26 21:35:54'),
(18, 'RN-18', NULL, '2018-10-20 04:42:47', '2018-10-26 21:35:56'),
(19, 'RN-19', NULL, '2018-10-20 04:42:47', '2018-10-26 21:35:58'),
(20, 'RN-20', NULL, '2018-10-20 04:42:47', '2018-10-26 21:36:01');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(27, '2014_10_12_000000_create_users_table', 1),
(28, '2014_10_12_100000_create_password_resets_table', 1),
(29, '2018_10_10_210842_create_rubros_table', 1),
(30, '2018_10_10_211740_create_usuarios_table', 1),
(31, '2018_10_11_001137_create_empresas_table', 1),
(32, '2018_10_11_020040_create_participantes_table', 1),
(33, '2018_10_11_020723_create_horarios_table', 1),
(34, '2018_10_11_021710_create_mesas_table', 1),
(35, '2018_10_11_022030_create_reunions_table', 1),
(36, '2018_10_15_044311_create_agendas_table', 1),
(37, '2018_10_15_045356_create_horario_ocupados_table', 1),
(38, '2018_10_19_121153_create_evaluacion_generals_table', 1),
(39, '2018_10_19_180028_create_evaluacion_reunions_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `participantes`
--

CREATE TABLE `participantes` (
  `participante_id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(10) UNSIGNED NOT NULL,
  `nombres` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carnet` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `celular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cargo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `participantes`
--

INSERT INTO `participantes` (`participante_id`, `empresa_id`, `nombres`, `apellidos`, `carnet`, `celular`, `cargo`, `deleted_at`, `created_at`, `updated_at`) VALUES
(5, 3, 'Adimer Hugo', 'Vicente Choque', '5744568', '61665748', 'Desarrollador web', NULL, '2018-10-22 13:31:15', '2018-10-22 13:31:15'),
(6, 3, 'Victor Hugo', 'Vicente Choque', 'Desarrollador web', '77149380', 'Desarrollador web', NULL, '2018-10-22 13:31:15', '2018-10-22 13:31:15'),
(7, 4, 'Michael Dennis', 'Machicado Fernandez', '7327341', '77156676', 'Propietario', NULL, '2018-10-22 13:38:12', '2018-10-22 13:38:12'),
(8, 4, 'Carla Francisca', 'Daza Poma', '12772647', '75427977', 'Ejecutiva de marketing', NULL, '2018-10-22 13:38:12', '2018-10-22 13:38:12'),
(9, 5, 'JUAN', 'VENTURA ALEJO', '2305947', '75877753', 'PROPIETARIO', NULL, '2018-10-22 13:44:45', '2018-10-22 13:44:45'),
(10, 5, 'RUFINA', 'MAMANI DE VENTURA', '123456789', '77288381', 'CO-PROPIETARIO', NULL, '2018-10-22 13:44:45', '2018-10-22 13:44:45'),
(11, 6, 'NESTOR FAVIAN', 'TORRICO TORRICO', '4078189', '70417316', 'EJECUTIVO DE VENTAS', NULL, '2018-10-22 13:51:55', '2018-10-22 13:51:55'),
(12, 6, 'OMAR', 'GROVER LAVAYEN', '6828213', '70417262', 'GERENTE', NULL, '2018-10-22 13:51:55', '2018-10-22 13:51:55'),
(13, 7, 'Roberto Carlos', 'Merida Machaca', '5724621 OR.', '71843917', 'Vendedor externo', NULL, '2018-10-22 13:55:05', '2018-10-22 13:55:05'),
(14, 8, 'Carlos Dino', 'Paz Soldan Duarte', '980790-1V', '69130708', 'Presidente', NULL, '2018-10-22 14:03:00', '2018-10-22 14:03:00'),
(15, 9, 'Eric', 'Gonzales', '7282397', '78300592', 'Gerente de ventas', NULL, '2018-10-22 14:06:38', '2018-10-22 14:06:38'),
(16, 9, 'Leandro', 'Gonzales', '4061717', '70516360', 'Ejecutivo de ventas', NULL, '2018-10-22 14:06:38', '2018-10-22 14:06:38'),
(17, 10, 'Beatriz', 'Ramirez Quispe', '4052923', '74545796', 'Tecnico del departamento minero', NULL, '2018-10-22 14:13:30', '2018-10-22 14:13:30'),
(18, 11, 'Sarah Cecilia', 'Cabrera Ortiz', '3067990 sc', '79064768', 'Promotora', NULL, '2018-10-22 14:19:11', '2018-10-22 14:19:11'),
(19, 12, 'Limberth', 'Burgoa Martinez', '7261499', '70415183', 'Gerente', NULL, '2018-10-22 14:31:41', '2018-10-22 14:31:41'),
(20, 12, 'Lina', 'Chavez Calderón', '6529773', '60704421', 'DISEÑO', NULL, '2018-10-22 14:31:41', '2018-10-22 14:31:41'),
(21, 13, 'Haidee', 'Fuertes', '5075411', '67200673', 'Adminsitradora', NULL, '2018-10-22 14:36:07', '2018-10-22 14:36:07'),
(22, 13, 'Henry', 'Ayala', '4245443', '73830577', 'Supervisor comercial', NULL, '2018-10-22 14:36:07', '2018-10-22 14:36:07'),
(23, 14, 'Jose Luis', 'Alvarado Conde', '3397782', '67199184', 'Gerente Regional', NULL, '2018-10-22 14:39:15', '2018-10-22 14:39:15'),
(24, 15, 'RUDY CESAR', 'SANEZ CLEMENTE', '4931954', '70414883', 'GERENTE', NULL, '2018-10-22 14:42:37', '2018-10-22 14:42:37'),
(25, 15, 'FABIOLA ISABEL', 'VIDEA QUIROGA', '5733142', '70417037', 'ADMINISTRADORA', NULL, '2018-10-22 14:42:37', '2018-10-22 14:42:37'),
(26, 16, 'OSCAR', 'ALVARADO', '1883995', '72130390', 'DIRECCION', NULL, '2018-10-23 14:03:22', '2018-10-23 14:03:22'),
(27, 17, 'Banesa', 'Candia arnes', '4622848', '78180368', 'Jefe de ventas', NULL, '2018-10-23 17:02:58', '2018-10-23 17:02:58'),
(28, 17, 'Adrian', 'Arana pereira', '4622898', '78180362', 'Coordinador general', NULL, '2018-10-23 17:02:58', '2018-10-23 17:02:58'),
(42, 31, 'Marcelo T.', 'Zenteno Rafael', '7309750', '69586290', 'Administrador Gerente', NULL, '2018-10-23 22:27:58', '2018-10-23 22:27:58'),
(43, 31, 'Rocio Jimena', 'Villca Quispe', '8226808', '69619300', 'E. Comercial y de Marketing', NULL, '2018-10-23 22:27:58', '2018-10-23 22:27:58'),
(49, 37, 'Marisol', 'Escalante', '3247144', '70050449', 'Representante en Bolivia', NULL, '2018-10-24 18:33:22', '2018-10-24 18:33:22'),
(50, 37, 'Mauricio', 'Rivarola', '3257622', '59170270373', 'Representante en Bolivia', NULL, '2018-10-24 18:33:22', '2018-10-24 18:33:22'),
(51, 14, 'Juan Pablo', 'Lopez Fulguera', '3554234', '75409967', 'Asistente Administrativo', NULL, '2018-10-25 23:28:19', '2018-10-25 23:28:19'),
(52, 14, 'Daniel Alejandro', 'Lozano Guibarra', '6824854', '71723648', 'Supervisor de Operaciones', NULL, '2018-10-25 23:30:52', '2018-10-25 23:30:52'),
(53, 14, 'Nelida Mabel', 'Gomez Vides', '2521295', '71880367', 'Supervisora de Procesamiento', NULL, '2018-10-25 23:33:43', '2018-10-25 23:33:43'),
(54, 38, 'HILDA MARGARITA', 'VENTURA FERNANDEZ', '2761893-ORU', '72491626', 'PROFESIONAL EN SERVICIO A OPERADORES II', NULL, '2018-10-26 19:01:18', '2018-10-29 13:36:50'),
(55, 38, 'ROSALBA', 'GARCIA MAYTA', '7304640-ORU', '72468145', 'TECNICO ADMINISTRATIVO FINANCIERO II', NULL, '2018-10-26 19:01:18', '2018-10-26 19:01:18'),
(56, 39, 'Mario', 'Chavez Choque', '4844456', '72559099', 'Gerente Propietario', NULL, '2018-10-29 12:29:38', '2018-10-29 12:29:38'),
(57, 40, 'Américo Dennis', 'Arias Centellas', '4465830', '72222246', 'Gerente General', NULL, '2018-10-29 16:18:49', '2018-10-29 16:18:49'),
(58, 41, 'Herlan Reynaldo', 'Valdivia Rocha', '4811073 LP', '78970346', 'Supervisor Comercial', NULL, '2018-10-31 14:01:48', '2018-10-31 14:01:48'),
(59, 42, 'José Simón', 'Cortés Gumucio', '531531', '71914371', 'Director de auto evaluación UNIOR', NULL, '2018-10-31 15:18:04', '2018-10-31 15:18:04'),
(60, 42, 'María del Carmen', 'Bohrt cortés', '3048009', '72471816', 'Directa ejecutiva fundación Sebastián pagador', NULL, '2018-10-31 15:18:04', '2018-10-31 15:18:04'),
(61, 43, 'Dardo', 'Aguirre Vaca', '4688158', '75556561', 'Jefe de ventas', NULL, '2018-11-01 16:26:33', '2018-11-01 16:26:33'),
(62, 43, 'Gary', 'Sanchez Crespo', '2851806', '76370171', 'Gerente comercial', NULL, '2018-11-01 16:26:33', '2018-11-01 16:26:33'),
(63, 44, 'Miguel Ángel', 'Colque Miranda', '5759012', '67256188', 'Propietario', NULL, '2018-11-01 21:24:02', '2018-11-01 21:24:02'),
(64, 45, 'Alvaro Efrain', 'Peña Escobar', '5726479', '78989722', 'Oficial de Negocios Mesa de Dinero', NULL, '2018-11-02 13:13:48', '2018-11-02 13:13:48'),
(65, 45, 'Roberto Carlos', 'Flores Pinaya', '4062549', '78989707', 'Oficial de Negocios Banca Microcredito', NULL, '2018-11-02 13:13:48', '2018-11-02 13:13:48'),
(66, 46, 'Raphael Fernando', 'Rojas Gutiérrez', '8818893', '61818974', 'Vice director ejecutivo', NULL, '2018-11-02 15:59:03', '2018-11-02 15:59:03'),
(67, 46, 'Tomasa Jhandira', 'Mejillones Véliz', '6033337', '76222204', 'Directora ejecutiva', NULL, '2018-11-02 15:59:03', '2018-11-02 15:59:03'),
(68, 47, 'Adimer', 'Vicente', '5744568', '61665748', 'Propietario', NULL, '2018-11-04 03:17:06', '2018-11-04 03:17:06');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reuniones`
--

CREATE TABLE `reuniones` (
  `reunion_id` int(10) UNSIGNED NOT NULL,
  `mesa_id` int(10) UNSIGNED NOT NULL,
  `horario_id` int(10) UNSIGNED NOT NULL,
  `empresa_solicitante_id` int(10) UNSIGNED NOT NULL,
  `empresa_demandada_id` int(10) UNSIGNED NOT NULL,
  `empresa_solicitante_asistio` tinyint(1) NOT NULL DEFAULT '0',
  `empresa_demandada_asistio` tinyint(1) NOT NULL DEFAULT '0',
  `resultado` enum('satisfactoria','ausencia','cronogramado') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cronogramado',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reuniones`
--

INSERT INTO `reuniones` (`reunion_id`, `mesa_id`, `horario_id`, `empresa_solicitante_id`, `empresa_demandada_id`, `empresa_solicitante_asistio`, `empresa_demandada_asistio`, `resultado`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 5, 7, 14, 8, 0, 0, 'cronogramado', NULL, '2018-10-29 01:18:33', '2018-10-29 01:18:33'),
(2, 5, 5, 14, 38, 0, 0, 'cronogramado', NULL, '2018-10-30 13:25:11', '2018-10-30 13:25:11');

-- --------------------------------------------------------

--
-- Table structure for table `rubros`
--

CREATE TABLE `rubros` (
  `rubro_id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rubros`
--

INSERT INTO `rubros` (`rubro_id`, `nombre`, `descripcion`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'AGRÍCOLA, PECUARIO Y HORTOFRUTICOLA', NULL, NULL, '2018-10-20 04:42:46', '2018-10-20 04:42:46'),
(2, 'ALIMENTOS Y BEBIDAS', NULL, NULL, '2018-10-20 04:42:46', '2018-10-20 04:42:46'),
(3, 'PRODUCTOS PARA LA CONTRUCCIÓN Y DECORACIÓN', NULL, NULL, '2018-10-20 04:42:46', '2018-10-20 04:42:46'),
(4, 'PLÁSTICOS O AFINES', NULL, NULL, '2018-10-20 04:42:46', '2018-10-20 04:42:46'),
(5, 'ENVASES, EMBALAJES Y AFINES', NULL, NULL, '2018-10-20 04:42:46', '2018-10-20 04:42:46'),
(6, 'QUÍMICOS', NULL, NULL, '2018-10-20 04:42:46', '2018-10-20 04:42:46'),
(7, 'FARMACIA, MEDICAMENTOS', NULL, NULL, '2018-10-20 04:42:46', '2018-10-20 04:42:46'),
(8, 'EQUIPOS ELÉCTRICOS', NULL, NULL, '2018-10-20 04:42:46', '2018-10-20 04:42:46'),
(9, 'MINERÍA', NULL, NULL, '2018-10-20 04:42:46', '2018-10-20 04:42:46'),
(10, 'INDUSTRIA DE LA MADERA Y MUEBLES EN GENERAL', NULL, NULL, '2018-10-20 04:42:46', '2018-10-20 04:42:46'),
(11, 'INDUSTRIA TEXTIL, CONFECCIONES Y MODA', NULL, NULL, '2018-10-20 04:42:46', '2018-10-20 04:42:46'),
(12, 'CUERO CALZADO Y MANUFACTURAS DE CUERO', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(13, 'INDUSTRIA PAPELERA Y GRÁFICA', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(14, 'VEHÍCULOS AUTOMOTORES, PIEZAS, PARTES', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(15, 'EQUIPOS E IMPLEMENTOS HIDRAHULICOS', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(16, 'TECNOLOGÍAS DE LA INFORMACIÓN Y COMUNICACIÓN', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(17, 'ELECTRODOMÉSTICOS Y LÍNEA BLANCA', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(18, 'ARTESANIAS', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(19, 'JOYERÍA. BISUTERÍA Y ORFEBRERÍA', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(20, 'COSMÉTICOS, BELLEZA Y SALUD', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(21, 'METALMECÁNICA Y ELECTROMECÁNICA', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(22, 'EQUIPOS DE TECNÓLOGÍA PARA LA INDUSTRIA MINERA, GAS, PETROLIO O SIMILARES', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(23, 'PETROLEO, GAS Y PETROQUÍMICA', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(24, 'ARTÍCULOS, IMPLEMENTOS Y EQUIPOS DE SEGURIDAD', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(25, 'ARTÍCULOS DE LIMPIEZA PARA EL HOGAR', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(26, 'JUGUETERÍA Y ARTÍCULOS DE ENTRETENIMIENTO', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(27, 'FERRETERÍA Y HERRAMIENTAS', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(28, 'ENERGÍA', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(29, 'ECOLÓGÍA Y PROTECCIÓN DE MEDIO AMBIENTE', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(30, 'TECNOLOGÍA Y EQUIPAMIENTO PARA AGROPECUARIA E INDUSTRIA', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(31, 'OTROS', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(32, 'COMPAÑÍA DE TRADING', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(33, 'BANCOS Y FINANCIERAS', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(34, 'FLETES Y TRANSPORTE', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(35, 'SERVICIOS ADUANEROS', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(36, 'ALMACENAMIENTO Y DISTRIBUCIÓN', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(37, 'SEGUROS', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(38, 'TURISMO', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(39, 'SERVICIOS EMPRESARIALES', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(40, 'SERVICIOS DE COSTRUCCIÓN E INGENIERÍA', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(41, 'SERVICIOS INFORMÁTICOS Y DE TELECOMUNICACIÓN', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(42, 'SERVICIOS PARA LA AGROINDUSTRIA', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(43, 'OTROS SERVICIOS', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(44, 'GOBIERNO Y SUS ORGANISMOS', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(45, 'ORGANISMOS INTERNACIONALES', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(46, 'CÁMARAS Y ORGANIZACIONES EMPRESARIALES', NULL, NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `nombres` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_usuario` enum('administrador','empresa') COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `nombres`, `apellidos`, `email`, `tipo_usuario`, `password`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Rocio Jimena', 'Villca Quispe', 'rvillca@campoferial3dejulio.com', 'administrador', '$2y$10$XtsoSEH0LN17O1GjMgB6deOeKco/wTPbL9V343sj0wQfd6NOUPohi', NULL, '2018-10-20 04:42:47', '2018-10-20 04:42:47'),
(3, 'Adimer Hugo', 'Vicente Choque', 'eavimpresionesgraficas@gmail.com', 'empresa', '$2y$10$inJmtCCNBo00yfRUp0Bu8.PiHu4unR9SKPXGR9qCbxrcSs8N5hvYG', NULL, '2018-10-20 16:23:15', '2018-10-20 16:23:15'),
(9, 'Adimer Hugo', 'Vicente Choque', 'no', 'empresa', '$2y$10$5Mc1mhhdoedGqb.tVw9KQOOlgMecTcgcV1yyW/jEy0q/xCpvM/HwS', NULL, '2018-10-22 13:31:15', '2018-10-22 13:31:15'),
(11, 'Michael Dennis', 'Machicado Fernandez', 'maquistore@maquistore.com', 'empresa', '$2y$10$PxS1dRjkOHgzpfz5b4xutO5nBZNB1yxABFFNkzE5Zwr9NAq.MyxjC', NULL, '2018-10-22 13:38:12', '2018-10-22 13:38:12'),
(12, 'JUAN', 'VENTURA ALEJO', 'ventura@ventura.com', 'empresa', '$2y$10$RUtxFhq7p5piLWv6b6qz0OgLJVYbTeEf/drBHYRhC4M6iwMxbnPzy', NULL, '2018-10-22 13:44:45', '2018-10-22 13:44:45'),
(13, 'NESTOR FAVIAN', 'TORRICO TORRICO', 'bienesraices@bienesraices.com', 'empresa', '$2y$10$6J0/1pLKgtQKCIfWBwzxeee7c1trPExXN0V62.QrsO1hanOAdVu7a', NULL, '2018-10-22 13:51:55', '2018-10-22 13:51:55'),
(14, 'Roberto Carlos', 'Merida Machaca', 'ingrid.robles@laslomas.com.bo', 'empresa', '$2y$10$Uo37XCW4MSN1epbzwfiBp.MPXCxfjETHvCzGyPMHP.lvpCBDVmnva', NULL, '2018-10-22 13:55:05', '2018-10-22 13:55:05'),
(15, 'Carlos Dino', 'Paz Soldan Duarte', 'nuevomileniobolivia@gmail.com', 'empresa', '$2y$10$h8qxqxH4NuPHzjBlxY3dKeFUXomwKNK1YRzcJm2Mp7oQJLkkgUU4u', NULL, '2018-10-22 14:03:00', '2018-10-22 14:03:00'),
(16, 'Erick', 'Gonzales', 'Emgonzab@gmail.com', 'empresa', '$2y$10$9BZwLs8obGZ3gHIco7EFn.zpwhU1bYdYvHVJu/TqxGuayPJNRbq9K', NULL, '2018-10-22 14:06:38', '2018-10-22 14:06:38'),
(17, 'Beatriz', 'Ramirez Quispe', 'bramirez.cisep@gmail.com', 'empresa', '$2y$10$ogW8gyFtKMMuiGf8p/.Wfe7E.rLKp4oYNkvS8xdTFjYF5E.2T9GWO', NULL, '2018-10-22 14:13:30', '2018-10-22 14:13:30'),
(18, 'Sarah Cecilia', 'Cabrera Ortiz', 'contacto@pelikarbolivia.com', 'empresa', '$2y$10$fbNYFC5hwFy407v1YRhLt.m/8yNO.axlE6UVprHUvujJ/IFxhPQaq', NULL, '2018-10-22 14:19:11', '2018-10-22 14:19:11'),
(19, 'Limberth', 'Burgoa Martinez', 'limberth61@hotmail.com', 'empresa', '$2y$10$XGk7FnGhWs60oHz3cRpI0O.H65sooDsylrSCTrdHRJLLSM1jwdqmi', NULL, '2018-10-22 14:31:41', '2018-10-22 14:31:41'),
(20, 'Haidee', 'Fuertes', 'clinica_urme@hotmail.com', 'empresa', '$2y$10$gefukWqAgsn6PUvZFUA71eZv8M6oLoyj/LlGGzDFRFXxE9YnFs0a2', NULL, '2018-10-22 14:36:07', '2018-10-22 14:36:07'),
(21, 'Jose Luis', 'Alvarado Conde', 'juanl@etv.com.bo', 'empresa', '$2y$10$5SUZkepHoTvpTSPgnMXu1urEz/xA7t2aVInM7BzTVDCravOMCexAC', NULL, '2018-10-22 14:39:15', '2018-10-22 14:39:15'),
(22, 'RUDY CESAR', 'SANEZ CLEMENTE', 'matisaautos@matisaautos.com', 'empresa', '$2y$10$0afdiDK89YSzda29iwDxmO14/x2ymDLHSnv5svwUwXvbU1CHNxRNa', NULL, '2018-10-22 14:42:37', '2018-10-22 14:42:37'),
(29, 'OSCAR', 'ALVARADO', 'solucionmodular@gmail.com', 'empresa', '$2y$10$TzHNQc6hk8yHZelYruBNCesmG8amuMvum1RJUx4M0Mh0n/dgSDzdO', NULL, '2018-10-23 14:03:22', '2018-10-23 14:03:22'),
(129, 'Banesa', 'Candia Arnes', 'candia123ba@gmail.com', 'empresa', '$2y$10$AV/I75cIr50nk9kAW5QvJuNKqeMbvLlujMFpzIYeoRpSwqzbssfcu', NULL, '2018-10-23 17:02:58', '2018-10-23 17:02:58'),
(163, 'Rocio', 'Villca', 'mzenteno', 'empresa', '$2y$10$06bwbUR6DPn07qDoSAmBCOcIdN9IABAgiLyQCy6ZAZsPJvLnX5ALC', NULL, '2018-10-23 22:27:58', '2018-10-23 22:27:58'),
(175, 'Marisol', 'Escalante', 'marisolescalante181@hotmail.com', 'empresa', '$2y$10$IWHV.Aio5EwwRFGBZef9ieO.SIlG74/EmPBk.PS8SG5FMCD1towvW', NULL, '2018-10-24 18:33:22', '2018-10-24 18:33:22'),
(176, 'YBETH ROXANA', 'MONTAÑO GONZALES', 'yrmontano', 'empresa', '$2y$10$hFThAyxANnlGIa/aTcYPquvGZ6g9O2rAYSszHQWRPO5eCez1Z/VcS', NULL, '2018-10-26 19:01:18', '2018-10-26 19:01:18'),
(177, 'Mario', 'Chavez Choque', 'iquirquincho', 'empresa', '$2y$10$Cclw/7IVzBmx.ngFrJckzOfIAu8VTVhcMzFrOf7mbJ4Pp8Fu0h4jO', NULL, '2018-10-29 12:29:38', '2018-10-29 12:29:38'),
(178, 'Americo Dennis', 'Arias Centellas', 'Guiarse', 'empresa', '$2y$10$mRDrnxlAoKPxOt7rQVkVheShk.CuL0vRB74T5NkxamS3PK2bW6cRK', NULL, '2018-10-29 16:18:49', '2018-10-29 16:18:49'),
(179, 'Herlan', 'Valdivia', 'herlan_craft@msn.com', 'empresa', '$2y$10$PutXcKpE1m.rnerRCwZtBuDqZ3MlIEuqjUwiOrZD0LtRZbSHQJO6y', NULL, '2018-10-31 14:01:48', '2018-10-31 14:01:48'),
(180, 'Gabriela America', 'Ayllon Lara', 'expotecoPMTD', 'empresa', '$2y$10$a/rmVK8ucgNEGItK724DV.p2mNFQ4FwOccINP53lFCmgScBZ6eLgq', NULL, '2018-10-31 15:18:04', '2018-10-31 15:18:04'),
(181, 'Jennifer', 'Verhorik', 'jverhorik@procemat.com', 'empresa', '$2y$10$XOpwgIY7UBj6ZvzB5hXeRuc2yQfD391NsH/mHz9mX4e4r9Ws0pw4S', NULL, '2018-11-01 16:26:33', '2018-11-01 16:26:33'),
(182, 'Miguel Ángel', 'Colque Miranda', 'quirkbeer', 'empresa', '$2y$10$Sx1/hPLc3F6H/.aM9Dpxeepz8d9BOcVVKGJeU3d5J1s49nwBBlKNO', NULL, '2018-11-01 21:24:02', '2018-11-01 21:24:02'),
(184, 'Alvaro Efrain Peña Escobar', 'Peña Escobar', 'bnb@bnb', 'empresa', '$2y$10$LxLrHxY7UDw/n2d0N8CmkeYFI78JoGTo7rGPviFod26cY9LYC6pKi', NULL, '2018-11-02 13:13:48', '2018-11-02 13:13:48'),
(185, 'Raphael', 'Rojas', 'expotecoYJJB', 'empresa', '$2y$10$jSTU0soislyrKVaWADcBze4LQXfaOKqo8V.ktD2dUypL46yfCqT42', NULL, '2018-11-02 15:59:03', '2018-11-02 15:59:03'),
(186, 'Adimer', 'Vicente', 'INFOLINE', 'empresa', '$2y$10$3DD.XFRE9JtZoboRgYfBmeMpYvZStDNQi/PzYPJ4Fl3V2dbEV10IW', NULL, '2018-11-04 03:17:06', '2018-11-04 03:17:06');

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
  ADD KEY `reuniones_mesa_id_foreign` (`mesa_id`),
  ADD KEY `reuniones_horario_id_foreign` (`horario_id`);

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
  ADD PRIMARY KEY (`usuario_id`),
  ADD UNIQUE KEY `usuarios_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agendas`
--
ALTER TABLE `agendas`
  MODIFY `agenda_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `empresas`
--
ALTER TABLE `empresas`
  MODIFY `empresa_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

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
  MODIFY `horario_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `horarios_ocupados`
--
ALTER TABLE `horarios_ocupados`
  MODIFY `horario_ocupado_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `mesas`
--
ALTER TABLE `mesas`
  MODIFY `mesa_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `participantes`
--
ALTER TABLE `participantes`
  MODIFY `participante_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `reuniones`
--
ALTER TABLE `reuniones`
  MODIFY `reunion_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `usuario_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;

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
