-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-06-2022 a las 00:33:03
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `panificadora`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_unidadmedida`
--

CREATE TABLE `catalogo_unidadmedida` (
  `id_catalogo` int(11) NOT NULL,
  `unidad_medida` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `telefono` bigint(25) NOT NULL,
  `correo` varchar(200) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `dni` bigint(20) NOT NULL,
  `statusbajacl` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre`, `telefono`, `correo`, `direccion`, `dni`, `statusbajacl`) VALUES
(1, 'Lucas Gonzales', 4568798, 'lc_g27@gmail.com', 'la pampa 2770', 23546879, NULL),
(2, 'Alexis Fabio', 4587987, 'alexisfabio@hotmail.com', 'San Lorenzo 2700', 40526587, NULL),
(3, 'Facundo Mendoza', 4605879, 'Mendoza27@hotmail.com', 'Av Freyre 2354', 40521345, NULL),
(4, 'Lucas Maldonado', 4556625, 'LC_maldonado@gmail.com', 'JP lopez 4780', 23587798, NULL),
(5, 'Juan Machuca', 4552587, 'jmmachuca@hotmail.com', 'Juan del campillo 2900', 254687712, NULL),
(6, 'Lucas Caceres', 4665212, 'lccaseres@hotmail.com', 'alvear 5545', 5247812, NULL),
(7, 'Juan Rios', 342587789, 'jr_27@hotmail.com', 'las heras 5054', 23568789, NULL),
(8, 'Sofia Lopez', 342569874, 'sofialp@hotmail.com', 'San Martin 1745', 42985674, NULL),
(9, 'Rocio Mercado', 342669874, 'rociom@hotmail.com', 'la pampa 2770', 40123587, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id_detalle_pedido` int(11) NOT NULL,
  `id_pedido_cliente` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_orden_produccion` int(11) DEFAULT NULL,
  `statusbajadt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id_detalle_pedido`, `id_pedido_cliente`, `cantidad`, `id_producto`, `id_orden_produccion`, `statusbajadt`) VALUES
(1, 1, 1000, 1, 3, NULL),
(2, 1, 0.5, 2, 2, NULL),
(3, 3, 5, 1, NULL, NULL),
(4, 5, 25, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido_proveedor`
--

CREATE TABLE `detalle_pedido_proveedor` (
  `id_detalle_pedido_proveedor` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `id_pedido_proveedor` int(11) NOT NULL,
  `id_materia_prima` int(11) NOT NULL,
  `statusbajadtpedprov` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_pedido_proveedor`
--

INSERT INTO `detalle_pedido_proveedor` (`id_detalle_pedido_proveedor`, `cantidad`, `id_pedido_proveedor`, `id_materia_prima`, `statusbajadtpedprov`) VALUES
(8, 0, 7, 1, NULL),
(9, 35, 2, 1, NULL),
(10, 20, 4, 2, NULL),
(11, 0, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_receta`
--

CREATE TABLE `detalle_receta` (
  `id_detalle_receta` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `unidad_medida` varchar(5) NOT NULL,
  `id_receta` int(11) NOT NULL,
  `id_materia_prima` int(11) NOT NULL,
  `statusbajadtrc` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_receta`
--

INSERT INTO `detalle_receta` (`id_detalle_receta`, `cantidad`, `unidad_medida`, `id_receta`, `id_materia_prima`, `statusbajadtrc`) VALUES
(1, 0.5, 'Kg', 1, 1, NULL),
(2, 0.1, 'Kg', 1, 9, NULL),
(3, 0.2, 'Kg', 1, 10, NULL),
(4, 280, 'Cc', 1, 5, NULL),
(5, 20, 'Kg', 1, 7, NULL),
(6, 10, 'Kg', 1, 6, NULL),
(7, 20, 'Cc', 1, 2, NULL),
(8, 500, 'Kg', 2, 1, NULL),
(9, 300, 'Cc', 2, 5, NULL),
(10, 15, 'Kg', 2, 10, NULL),
(11, 10, 'Kg', 2, 6, NULL),
(12, 400, 'Kg', 3, 1, NULL),
(13, 10, 'Kg', 3, 10, NULL),
(14, 1, 'U', 3, 3, NULL),
(15, 45, 'Cc', 3, 12, NULL),
(16, 180, 'Cc', 3, 2, NULL),
(17, 5, 'Kg', 3, 9, NULL),
(18, 10, 'Kg', 3, 6, NULL),
(19, 500, 'Kg', 4, 1, NULL),
(20, 300, 'Cc', 4, 2, NULL),
(21, 40, 'Kg', 4, 9, NULL),
(22, 5, 'Kg', 4, 6, NULL),
(23, 8, 'Kg', 4, 10, NULL),
(24, 500, 'Kg', 4, 1, NULL),
(25, 120, 'Kg', 7, 1, NULL),
(26, 100, 'Kg', 7, 9, NULL),
(27, 2, 'U', 7, 3, NULL),
(28, 70, 'Kg', 7, 4, NULL),
(29, 20, 'Kg', 7, 10, NULL),
(30, 30, 'Cc', 7, 2, NULL),
(31, 1, 'U', 6, 3, NULL),
(32, 30, 'Kg', 6, 1, NULL),
(33, 45, 'Kg', 6, 9, NULL),
(34, 15, 'Kg', 6, 4, NULL),
(35, 50, 'U', 10, 3, NULL),
(36, 75, 'Cc', 10, 12, NULL),
(37, 25, 'Cc', 10, 2, NULL),
(38, 15, 'Kg', 10, 10, NULL),
(39, 135, 'Kg', 12, 1, NULL),
(40, 45, 'Kg', 12, 4, NULL),
(41, 200, 'Cc', 12, 5, NULL),
(42, 45, 'Kg', 11, 1, NULL),
(43, 20, 'Kg', 11, 10, NULL),
(44, 65, 'Kg', 11, 4, NULL),
(45, 20, 'Kg', 11, 6, NULL),
(46, 30, 'Kg', 11, 9, NULL),
(47, 45, 'Cc', 11, 5, NULL),
(48, 4, 'U', 9, 3, NULL),
(49, 100, 'Kg', 9, 9, NULL),
(50, 50, 'Cc', 9, 12, NULL),
(51, 40, 'Cc', 9, 2, NULL),
(52, 75, 'Kg', 9, 1, NULL),
(53, 300, 'Cc', 8, 2, NULL),
(54, 100, 'Kg', 8, 9, NULL),
(55, 50, 'Kg', 8, 4, NULL),
(56, 70, 'Kg', 8, 10, NULL),
(57, 4, 'U', 8, 3, NULL),
(58, 80, 'Kg', 24, 1, NULL),
(59, 10, 'U', 24, 3, NULL),
(60, 90, 'Cc', 24, 2, NULL),
(61, 125, 'Cc', 24, 5, NULL),
(62, 25, 'Kg', 24, 4, NULL),
(63, 15, 'Cc', 20, 2, NULL),
(64, 40, 'Kg', 21, 1, NULL),
(65, 500, 'Kg', 25, 1, NULL),
(66, 2, 'U', 25, 3, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia_prima`
--

CREATE TABLE `materia_prima` (
  `id_materia_prima` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `unidad_medida` varchar(5) NOT NULL,
  `stock_min` int(25) NOT NULL,
  `statusbajamp` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `materia_prima`
--

INSERT INTO `materia_prima` (`id_materia_prima`, `descripcion`, `stock`, `unidad_medida`, `stock_min`, `statusbajamp`) VALUES
(1, 'Harina', 1000, 'Kg', 50, NULL),
(2, 'Leche', 100, 'Cc', 50, NULL),
(3, 'Huevo', 24, 'U', 50, NULL),
(4, 'Manteca', 1000, 'Kg', 50, NULL),
(5, 'Agua', 10000, 'Cc', 50, NULL),
(6, 'Sal', 1000, 'Kg', 50, NULL),
(7, 'Grasa', 1000, 'Kg', 50, NULL),
(8, 'Maicena', 1000, 'Kg', 50, NULL),
(9, 'Azucar', 1000, 'Kg', 50, NULL),
(10, 'Levadura', 80, 'Kg', 50, NULL),
(11, 'Leche en Polvo', 350, 'Kg', 50, NULL),
(12, 'Aceite', 500, 'Cc', 50, NULL),
(13, 'Dulce de leche', 1000, 'Kg', 50, NULL),
(14, 'Merengue', 0, 'Kg', 50, '2022-04-26'),
(15, 'Semillas', 150, 'Kg', 50, NULL),
(17, 'Harina de maiz', 55, 'Kg', 50, NULL),
(18, 'Chocolate negro', 25, 'Kg', 50, '2022-05-02'),
(19, 'Harina de centeno', 0, 'Kg', 50, NULL),
(20, 'Chocolate negro', 0, 'Kg', 50, NULL),
(21, 'Cholocate blanco', 0, 'Kg', 50, NULL),
(22, 'Harina de avena', 0, 'Kg', 50, NULL),
(23, 'Harina de arroz', 0, 'Kg', 50, NULL),
(24, 'Harina de frutos secos', 0, 'Kg', 50, NULL),
(25, 'Harina de legumbres', 0, 'Kg', 50, NULL),
(26, 'Miel', 30, 'Kg', 50, '2022-05-04'),
(27, 'Chocolate sin azucar', 0, 'U', 50, NULL),
(28, 'Miel', 525, 'Kg', 50, '2022-05-04'),
(29, 'Azucar negra', 0, 'Gr', 50, NULL),
(30, 'Miel', 0, 'Ml', 50, '2022-05-18'),
(31, 'Cacao en polvo', 0, 'Gr', 50, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia_prima_catalogo`
--

CREATE TABLE `materia_prima_catalogo` (
  `id_mp_catalogo` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `materia_prima_catalogo`
--

INSERT INTO `materia_prima_catalogo` (`id_mp_catalogo`, `Nombre`) VALUES
(1, 'Harina 000'),
(2, 'Harina 0000'),
(3, 'Harina de Mandioca'),
(4, 'Harina de Avena'),
(5, 'Harina de trigo'),
(6, 'Harina Leudante'),
(7, 'Agua'),
(8, 'Aceite de Girasol'),
(9, 'Aceite de Oliva'),
(10, 'Aceite de maiz'),
(11, 'Levadura Seca'),
(12, 'Polvo de Hornear'),
(13, 'Chocolate Amargo'),
(14, 'Cacao'),
(15, 'Chocolate Blanco'),
(16, 'Maicena'),
(17, 'Azúcar blanca'),
(18, 'Azúcar Glase'),
(19, 'Azúcar Vainillado'),
(20, 'Azúcar Perlado'),
(21, 'Azúcar Caña'),
(22, 'Azúcar Mascabado'),
(23, 'Azúcar de coco'),
(24, 'Manteca de cacahuete'),
(25, 'Manteca de cerdo'),
(26, 'Manteca colorá'),
(27, 'Manteca de cacao'),
(28, 'Manteca Vegetal'),
(29, 'Manteca de frutos secos'),
(30, 'Manteca de almendras'),
(31, 'Manteca de coco'),
(32, 'Almendras'),
(33, 'Coco'),
(34, 'Pasta de Maní'),
(35, 'Dulce de leche'),
(36, 'Dulce de leche repostero'),
(37, 'Grasa Porcina'),
(38, 'Grasa Vacuna'),
(39, 'Esencia de Vainilla'),
(40, 'Huevo'),
(41, 'Sal fina'),
(42, 'Sal entre fina'),
(43, 'Sal gruesa'),
(44, 'Leche de coco'),
(45, 'Leche de almendras'),
(46, 'Leche condensada'),
(47, 'Leche de vaca'),
(48, 'Fruta Abrillantada'),
(49, 'Nuez'),
(50, 'Avellanas'),
(51, 'Mani'),
(52, 'Pistachos'),
(53, 'Limón'),
(54, 'Cafe'),
(55, 'Licor de chocolate'),
(56, 'Licor de dulce de leche'),
(57, 'Licor de cafe'),
(58, 'Vino de oporto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_de_produccion`
--

CREATE TABLE `orden_de_produccion` (
  `id_orden_produccion` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `fecha` date DEFAULT NULL,
  `id_producto` int(11) NOT NULL,
  `statusbajaordprod` date DEFAULT NULL,
  `interno` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `orden_de_produccion`
--

INSERT INTO `orden_de_produccion` (`id_orden_produccion`, `cantidad`, `fecha`, `id_producto`, `statusbajaordprod`, `interno`) VALUES
(1, 10, '2022-04-30', 1, NULL, 1),
(2, 1000, NULL, 1, NULL, 0),
(3, 1000, NULL, 1, NULL, 0),
(4, 25, '2022-04-29', 6, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_a_proveedor`
--

CREATE TABLE `pedido_a_proveedor` (
  `id_pedido_proveedor` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `statusbajapedprov` date DEFAULT NULL,
  `control` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedido_a_proveedor`
--

INSERT INTO `pedido_a_proveedor` (`id_pedido_proveedor`, `fecha`, `id_proveedor`, `statusbajapedprov`, `control`) VALUES
(1, '2022-04-11', 1, NULL, 1),
(2, '2022-04-11', 2, NULL, 1),
(4, '2022-04-11', 3, NULL, 0),
(5, '2022-04-20', 3, NULL, 0),
(6, '2022-04-25', 5, NULL, 0),
(7, '2022-04-25', 7, NULL, 1),
(8, '2022-04-25', 7, NULL, 0),
(9, '2022-04-25', 4, NULL, 0),
(10, '2022-04-26', 13, NULL, 0),
(11, '2022-05-02', 3, NULL, 0),
(12, '2022-05-02', 3, NULL, 0),
(13, '2022-05-04', 1, NULL, 0),
(14, '2022-05-04', 1, NULL, 0),
(15, '2022-05-04', 5, NULL, 0),
(16, '2022-05-04', 6, NULL, 0),
(18, '2022-05-25', 2, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_cliente`
--

CREATE TABLE `pedido_cliente` (
  `id_pedido_cliente` int(11) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `statusbajapedcl` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedido_cliente`
--

INSERT INTO `pedido_cliente` (`id_pedido_cliente`, `estado`, `fecha`, `id_cliente`, `statusbajapedcl`) VALUES
(1, 'En Produccion', '2022-04-17', 1, NULL),
(2, 'Pendiente', '2022-04-20', 2, NULL),
(3, 'Pendiente', '2022-04-20', 3, NULL),
(4, 'Pendiente', '2022-04-26', 7, NULL),
(5, 'Pendiente', '2022-05-04', 5, NULL),
(6, 'Pendiente', '2022-05-04', 7, NULL),
(7, 'Pendiente', '2022-05-25', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `stock` float NOT NULL,
  `unidad_medida` varchar(5) DEFAULT NULL,
  `id_receta` int(11) NOT NULL,
  `statusbajaprod` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `descripcion`, `stock`, `unidad_medida`, `id_receta`, `statusbajaprod`) VALUES
(1, 'Pan Mignon', 2, 'Kg', 1, NULL),
(2, 'Pan Frances', 0, 'Kg', 2, NULL),
(3, 'Pan Lactal', 0, 'Kg', 3, NULL),
(4, 'Medialunas de Manteca', 0, 'Kg', 4, NULL),
(5, 'Bizcocho', 0, 'Kg', 5, NULL),
(6, 'Alfajores de chocolate', 0, 'Kg', 6, NULL),
(7, 'Torta alemana', 2, 'Kg', 7, NULL),
(8, 'Rosca de pascua', 0, 'Kg', 8, NULL),
(9, 'Budin de vainilla', 0, 'Kg', 9, NULL),
(10, 'Donas rellenas', 0, 'Kg', 10, NULL),
(11, 'Tortita negra', 0, 'Kg', 11, NULL),
(12, 'Cañones con crema', 0, 'Kg', 12, NULL),
(13, 'Ravioles', 0, 'Kg', 13, NULL),
(14, 'Sorrentinos de verdura', 0, 'Kg', 14, NULL),
(15, 'Sorrentinos de jamon y queso', 0, 'Kg', 15, NULL),
(16, 'Sorrentinos de ricota', 0, 'Kg', 16, NULL),
(17, 'Sorrentinos de ricota', 0, 'Kg', 17, NULL),
(18, 'Pan Malteado', 0, 'Kg', 18, NULL),
(19, 'Palmeritas', 0, 'Kg', 19, NULL),
(20, 'Pan Negro', 0, 'Kg', 20, NULL),
(21, 'Chipa', 0, 'Kg', 21, NULL),
(22, 'Pan Dulce', 0, 'Kg', 22, NULL),
(23, 'Pan de Salvado', 0, 'Kg', 23, NULL),
(24, 'Pan Milongita', 0, 'Kg', 24, NULL),
(25, 'Chipa2', 0, 'Kg', 25, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `cuit` int(20) NOT NULL,
  `statusbajaprov` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `nombre`, `cuit`, `statusbajaprov`) VALUES
(1, 'Dispan', 23, NULL),
(2, 'Arcor', 0, NULL),
(3, 'Milkaut', 0, NULL),
(4, 'Serenisima', 0, '2022-04-26'),
(5, 'Balear', 0, '2022-04-26'),
(6, 'Perez', 0, '2022-04-25'),
(7, 'Trigolandia', 0, '2022-04-26'),
(8, 'Dist. Harinas y MP Guillermo Lopez', 0, NULL),
(9, 'Cremosan', 0, NULL),
(10, 'Casa Bruno Nanni', 0, NULL),
(11, 'Quality SRL', 0, NULL),
(12, 'Matfra', 0, NULL),
(13, 'Dist. Toluma', 0, NULL),
(14, 'Reposteria Yapur', 0, NULL),
(15, 'CVS Fornitura', 0, NULL),
(16, 'L&L Futura', 0, NULL),
(17, 'Dist. Nicollier', 0, NULL),
(18, 'Maicenas y Asociados SRL', 0, '2022-05-04'),
(19, 'Maicenita', 0, '2022-05-04'),
(22, 'dis', 23, NULL),
(23, 'asdasd', 0, NULL),
(24, 'analitic', 23, NULL),
(25, 'Dispan', 0, NULL),
(26, '', 0, NULL),
(27, 'Dispan', 0, NULL),
(28, '', 0, NULL),
(29, 'Dispan', 23, NULL),
(30, '', 0, NULL),
(31, 'Dispan', 23, NULL),
(32, '', 0, NULL),
(33, 'Dispan', 23, NULL),
(34, '', 0, NULL),
(35, 'Qualis', 23, NULL),
(36, 'qualiss', 23, NULL),
(37, 'Dispann', 23, NULL),
(38, 'asdDIs', 23, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta`
--

CREATE TABLE `receta` (
  `id_receta` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `cantidad` float NOT NULL,
  `unidad_medida` varchar(5) NOT NULL,
  `statusbajarc` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `receta`
--

INSERT INTO `receta` (`id_receta`, `nombre`, `cantidad`, `unidad_medida`, `statusbajarc`) VALUES
(1, 'Pan Mignon', 0.75, 'Kg', NULL),
(2, 'Pan Frances', 4, 'Kg', NULL),
(3, 'Pan Lactal', 180, 'Kg', NULL),
(4, 'Medialunas de Manteca', 24, 'Kg', NULL),
(5, 'Bizcocho', 500, 'Kg', '2022-05-30'),
(6, 'Alfajores de chocolate', 60, 'Kg', NULL),
(7, 'Torta alemana', 100, 'Kg', NULL),
(8, 'Rosca de pascua', 75, 'Kg', NULL),
(9, 'Budin de vainilla', 35, 'Kg', NULL),
(10, 'Donas rellenas', 50, 'Kg', NULL),
(11, 'Tortita negra', 125, 'Kg', NULL),
(12, 'Cañones con crema', 70, 'Kg', NULL),
(13, 'Ravioles', 120, 'Kg', NULL),
(14, 'Sorrentinos de verdura', 500, 'Kg', NULL),
(15, 'Sorrentinos de jamon y queso', 1000, 'Kg', NULL),
(16, 'Sorrentinos de ricota', 1000, 'Kg', NULL),
(17, 'Sorrentinos de ricota', 450, 'Kg', NULL),
(18, 'Pan Malteado', 15, 'Kg', NULL),
(19, 'Palmeritas', 300, 'Kg', NULL),
(20, 'Pan Negro', 100, 'Kg', NULL),
(21, 'Chipa', 120, 'Kg', NULL),
(22, 'Pan Dulce', 120, 'Kg', NULL),
(23, 'Pan de Salvado', 40, 'Kg', NULL),
(24, 'Pan Milongita', 35, 'Kg', NULL),
(25, 'Chipa2', 0.5, 'Kg', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(20) NOT NULL,
  `password` char(40) NOT NULL,
  `credencial` int(11) NOT NULL,
  `statusBajaUser` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `password`, `credencial`, `statusBajaUser`) VALUES
(1, 'ian', 'iancasta2014', 0, '2022-05-24'),
(2, 'santi', 'santi23', 0, '2022-05-24'),
(3, 'pedro', 'pedro1', 0, '2022-05-24'),
(4, 'pedro23', '246810', 23900, NULL),
(5, 'matias10', 'hola246810', 23901, NULL),
(6, 'roberto22', 'hola246810', 23902, NULL),
(7, 'admin', 'admin', 333, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `catalogo_unidadmedida`
--
ALTER TABLE `catalogo_unidadmedida`
  ADD PRIMARY KEY (`id_catalogo`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id_detalle_pedido`),
  ADD KEY `id_pedido_cliente_fk` (`id_pedido_cliente`),
  ADD KEY `id_producto_ibfk` (`id_producto`);

--
-- Indices de la tabla `detalle_pedido_proveedor`
--
ALTER TABLE `detalle_pedido_proveedor`
  ADD PRIMARY KEY (`id_detalle_pedido_proveedor`),
  ADD KEY `id_materia_prima_fk1` (`id_materia_prima`),
  ADD KEY `id_pedido_proveedor_fk` (`id_pedido_proveedor`);

--
-- Indices de la tabla `detalle_receta`
--
ALTER TABLE `detalle_receta`
  ADD PRIMARY KEY (`id_detalle_receta`),
  ADD KEY `id_detalle_receta_fk` (`id_receta`),
  ADD KEY `id_materia_prima_fk` (`id_materia_prima`);

--
-- Indices de la tabla `materia_prima`
--
ALTER TABLE `materia_prima`
  ADD PRIMARY KEY (`id_materia_prima`);

--
-- Indices de la tabla `materia_prima_catalogo`
--
ALTER TABLE `materia_prima_catalogo`
  ADD PRIMARY KEY (`id_mp_catalogo`);

--
-- Indices de la tabla `orden_de_produccion`
--
ALTER TABLE `orden_de_produccion`
  ADD PRIMARY KEY (`id_orden_produccion`),
  ADD KEY `id_producto_fk` (`id_producto`);

--
-- Indices de la tabla `pedido_a_proveedor`
--
ALTER TABLE `pedido_a_proveedor`
  ADD PRIMARY KEY (`id_pedido_proveedor`),
  ADD KEY `id_proveedor_fk` (`id_proveedor`);

--
-- Indices de la tabla `pedido_cliente`
--
ALTER TABLE `pedido_cliente`
  ADD PRIMARY KEY (`id_pedido_cliente`),
  ADD KEY `id_cliente_fk` (`id_cliente`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_receta_fk` (`id_receta`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `receta`
--
ALTER TABLE `receta`
  ADD PRIMARY KEY (`id_receta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `catalogo_unidadmedida`
--
ALTER TABLE `catalogo_unidadmedida`
  MODIFY `id_catalogo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id_detalle_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido_proveedor`
--
ALTER TABLE `detalle_pedido_proveedor`
  MODIFY `id_detalle_pedido_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `detalle_receta`
--
ALTER TABLE `detalle_receta`
  MODIFY `id_detalle_receta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT de la tabla `materia_prima`
--
ALTER TABLE `materia_prima`
  MODIFY `id_materia_prima` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `materia_prima_catalogo`
--
ALTER TABLE `materia_prima_catalogo`
  MODIFY `id_mp_catalogo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `orden_de_produccion`
--
ALTER TABLE `orden_de_produccion`
  MODIFY `id_orden_produccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pedido_a_proveedor`
--
ALTER TABLE `pedido_a_proveedor`
  MODIFY `id_pedido_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `pedido_cliente`
--
ALTER TABLE `pedido_cliente`
  MODIFY `id_pedido_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `receta`
--
ALTER TABLE `receta`
  MODIFY `id_receta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `id_pedido_cliente_fk` FOREIGN KEY (`id_pedido_cliente`) REFERENCES `pedido_cliente` (`id_pedido_cliente`),
  ADD CONSTRAINT `id_producto_ibfk` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `detalle_pedido_proveedor`
--
ALTER TABLE `detalle_pedido_proveedor`
  ADD CONSTRAINT `id_materia_prima_fk1` FOREIGN KEY (`id_materia_prima`) REFERENCES `materia_prima` (`id_materia_prima`),
  ADD CONSTRAINT `id_pedido_proveedor_fk` FOREIGN KEY (`id_pedido_proveedor`) REFERENCES `pedido_a_proveedor` (`id_pedido_proveedor`);

--
-- Filtros para la tabla `detalle_receta`
--
ALTER TABLE `detalle_receta`
  ADD CONSTRAINT `id_detalle_receta_fk` FOREIGN KEY (`id_receta`) REFERENCES `receta` (`id_receta`),
  ADD CONSTRAINT `id_materia_prima_fk` FOREIGN KEY (`id_materia_prima`) REFERENCES `materia_prima` (`id_materia_prima`);

--
-- Filtros para la tabla `orden_de_produccion`
--
ALTER TABLE `orden_de_produccion`
  ADD CONSTRAINT `id_producto_fk` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `pedido_a_proveedor`
--
ALTER TABLE `pedido_a_proveedor`
  ADD CONSTRAINT `id_proveedor_fk` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`);

--
-- Filtros para la tabla `pedido_cliente`
--
ALTER TABLE `pedido_cliente`
  ADD CONSTRAINT `id_cliente_fk` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `id_receta_fk` FOREIGN KEY (`id_receta`) REFERENCES `receta` (`id_receta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
