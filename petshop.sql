-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-12-2024 a las 03:52:55
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `petshop`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `IDProducto` int(11) NOT NULL,
  `Nombre` varchar(250) NOT NULL,
  `Marca` varchar(250) NOT NULL,
  `Tipo` varchar(250) NOT NULL,
  `Precio` int(11) NOT NULL,
  `Descripcion` varchar(500) NOT NULL,
  `imagen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`IDProducto`, `Nombre`, `Marca`, `Tipo`, `Precio`, `Descripcion`, `imagen`) VALUES
(37, 'Perro x kilo', 'Agility', 'Comida', 2600, 'x% De proteinas ', 'img/fond.jpg'),
(38, 'Perro Bolsa', 'Agility', 'Comida', 4800, 'x% De proteinas', ''),
(39, 'Urinary Gato', 'Agility', 'comida', 5400, '30% de Proteina', ''),
(40, 'Urinary Gato', 'Agility', 'comida', 54000, '30% de Proteina', ''),
(41, 'Kitten', 'Agility', 'comida', 5200, '34% de Proteina', ''),
(42, 'Gato Por kilo', 'Agility', 'comida', 5100, '30% de Proteina', ''),
(43, 'Gato Bolsa', 'Agility', 'Bolsa', 50000, '30% de Proteina', ''),
(44, 'Holistic Food Bolsa', 'Greenline', 'comida', 44500, '32% de Proteina', ''),
(45, 'Holistic Food Kilo', 'Greenline', 'comida', 3400, '32% de Proteina', ''),
(46, 'Ocean Bolsa', 'Cat Chow', 'comida', 64000, 'x% De proteinas', ''),
(47, 'Pescado Bolsa', 'Cat Chow', 'comida', 64000, 'x%', ''),
(48, 'Gatitos Bolsa 15kg', 'Cat Chow', 'comida', 67000, '36% De proteinas', ''),
(49, 'Gatitos 8kg', 'Cat Chow', 'comida', 31000, 'x%', ''),
(50, 'Gatitos por kilo', 'Cat Chow', 'comida', 4800, 'x% De proteinas', ''),
(51, 'Ocean', 'Cat Chow', 'comida', 4800, 'x% De proteinas', ''),
(52, 'Cordero medium bolsa 15kg', 'Old prince', 'comida', 67000, 'x% De proteinas', ''),
(53, 'Cordero medium kilo', 'Old prince', 'comida', 4600, 'x% De proteinas', ''),
(54, 'Small 15kg', 'Old prince', 'comida', 67000, 'x% De proteinas', ''),
(55, 'Small 1kg', 'Old prince', 'comida', 4600, 'x% De proteinas', ''),
(56, 'Gato Equilibrium Complete', 'Old prince', 'comida', 5200, 'x% De proteinas', ''),
(57, 'Gato Bolsa', 'Old prince', 'comida', 36000, 'x% De proteinas', ''),
(58, 'Adulto Bolsa 20kg', 'Performance', 'comida', 68000, 'x% De proteinas', ''),
(59, 'Adulto por kilo', 'Performance', 'comida', 4400, 'x% De proteinas', ''),
(60, 'Gato Bolsa 7,5 kg ', 'Performance', 'comida', 37000, 'x% De proteinas', ''),
(61, 'Gato Por kilo', 'Performance', 'comida', 6800, 'x% De proteinas', ''),
(62, 'Perro Bolsa 20kg', 'Valiant', 'comida', 22600, 'x% De proteinas', ''),
(63, 'Perro por kilo', 'Valiant', 'comida', 1200, 'x% De proteinas', ''),
(64, 'Premiun Gato 24kg', 'Vital Safety', 'comida', 70000, 'x% De proteinas', ''),
(65, 'Premiun Gato por kg', 'Vital Safety', 'comida', 4200, 'x% De proteinas', ''),
(66, 'Premiun Gato kilo', 'Vital Safety', 'comida', 4200, 'x% De proteinas', ''),
(67, 'Premiun Perro kilo', 'Vital Safety', 'comida', 2800, 'x% De proteinas', ''),
(68, 'Cachorros Bolsa 15kg', 'Nutribon', 'comida', 24000, 'x% De proteinas', ''),
(69, 'Cachorros por kg', 'Nutribon', 'comida', 1700, 'x% De proteinas', ''),
(70, 'Adulto Bolsa 15kg', 'Nutribon', 'comida', 18800, 'x% De proteinas', ''),
(71, 'Adulto por kg', 'Nutribon', 'comida', 1400, 'x% De proteinas', ''),
(72, 'Raza pequeña por kg', 'Nutribon', 'comida', 1700, 'x% De proteinas', ''),
(73, 'Gato bolsa 20kg', 'Nutribon', 'comida', 37000, 'x% De proteinas', ''),
(74, 'Gato por kg', 'Nutribon', 'comida', 1900, 'x% De proteinas', ''),
(75, 'Criadores bolsa 20kg', 'Sieger', 'comida', 62000, 'x% De proteinas', ''),
(76, 'Criadores por kg', 'Sieger', 'comida', 3600, 'x% De proteinas', ''),
(77, 'Gato bolsa 20kg', 'Vagoneta', 'comida', 31000, 'x% De proteinas', ''),
(78, 'Gato por kg', 'Vagoneta', 'comida', 1900, 'x% De proteinas', ''),
(79, 'Criadores bolsa 20kg', 'Estampa', 'comida', 28500, 'x% De proteinas', ''),
(80, 'Criadores por kg', 'Estampa', 'comida', 1900, 'x% De proteinas', ''),
(81, 'Plus perro bolsa 20kg', 'Estampa', 'comida', 33400, 'x% De proteinas', ''),
(82, 'Plus perro por kg', 'Estampa', 'comida', 2300, 'x% De proteinas', ''),
(83, 'Plus raza pequeña bolsa 8kg', 'Estampa', 'comida', 19000, 'x% De proteinas', ''),
(84, 'Plus raza pequeña bolsa 15kg', 'Estampa', 'comida', 25500, 'x% De proteinas', ''),
(87, 'ss', 'Greenline', 'Higieness', 2313, '32443', ''),
(88, 'Raza Pequeña', 'Estampa', 'comida', 2300, 'x% De proteinas', ''),
(89, 'Gato bolsa 15kg', 'Estampa', 'comida', 31000, 'x% De proteinas', ''),
(90, 'Gato Por kg', 'Estampa', 'comida', 2600, 'x% De proteinas', ''),
(91, 'Cachorro Bolsa 15kg', 'Estampa', 'comida', 30500, 'x% De proteinas', ''),
(92, 'Cachorros Por kg', 'Estampa', 'comida', 2500, 'x% De proteinas', ''),
(93, 'Gato urinary Bolsa', 'XQ', 'comida', 26500, 'x% De proteinas', ''),
(94, 'Gato Por kg', 'XQ', 'comida', 3400, 'x% De proteinas', ''),
(95, 'Adult Light Bolsa 15kg', 'Eukanuba', 'comida', 67000, 'x% De proteinas', ''),
(96, 'Adult Light Por kg', 'Eukanuba', 'comida', 4900, 'x% De proteinas', ''),
(97, 'Cachorro Small Bolsa 15kg', 'Eukanuba', 'comida', 66000, 'x% De proteinas', ''),
(98, 'Cachorro Small Por kg', 'Eukanuba', 'comida', 4800, 'x% De proteinas', ''),
(99, 'Gato Por Bolsa 15kg', 'Excellent', 'comida', 94000, 'x% De proteinas', ''),
(100, 'Gato Por kg', 'Excellent', 'comida', 6800, 'x% De proteinas', ''),
(101, 'Gato Kitten Bolsa 7.5kg', 'Excellent', 'comida', 54000, 'x% De proteinas', ''),
(102, 'Gato Kitten Por Kg', 'Excellent', 'comida', 7600, 'x% De proteinas', ''),
(103, 'Perro Por Bolsa 15kg', 'Excellent', 'comida', 55000, 'x% De proteinas', ''),
(104, 'Perro por kg', 'Excellent', 'comida', 4200, 'x% De proteinas', ''),
(105, 'Perro Adulto Small Por Bolsa 15kg', 'Excellent', 'comida', 50500, 'x% De proteinas', ''),
(106, 'Perro Adulto Small Por kg', 'Excellent', 'comida', 4200, 'x% De proteinas', ''),
(107, 'Urinary Gato Por kg', 'Excellent', 'comida', 7600, 'x% De proteinas', ''),
(108, 'Urinary Gato Por Bolsa 7.5', 'Excellent', 'comida', 52500, 'x% De proteinas', ''),
(109, 'Mini Adulto Por kg', 'Royal canin', 'comida', 55500, 'x% De proteinas', ''),
(110, 'Mini Adulto Por kg', 'Royal canin', 'comida', 7400, 'x% De proteinas', ''),
(111, 'Mini Puppy Por Bolsa 15kg', 'Royal canin', 'comida', 79500, 'x% De proteinas', ''),
(112, 'Mini Puppy Por kg', 'Royal canin', 'comida', 6400, 'x% De proteinas', ''),
(113, 'Pescado y Salmon Bolsa 15kg', 'Gati', 'comida', 39500, 'x% De proteinas', ''),
(114, 'Pescado y Salmon Por kg', 'Gati', 'comida', 3000, 'x% De proteinas', ''),
(115, 'Pescado Por Bolsa 15kg', 'Sabrositos', 'comida', 46000, 'x% De proteinas', ''),
(116, 'Mix Carne Por Bolsa 15kg', 'Sabrositos', 'comida', 46000, 'x% De proteinas', ''),
(117, 'Pescado Por kg', 'Sabrositos', 'comida', 2400, 'x% De proteinas', ''),
(118, 'Mix Carne Por kg', 'Sabrositos', 'comida', 2400, 'x% De proteinas', ''),
(119, 'Bebe Por Bolsa', 'Whiskas', 'comida', 39500, 'x% De proteinas', ''),
(120, 'Bebe Por kg', 'Whiskas', 'comida', 4000, 'x% De proteinas', ''),
(121, 'Pollo Por Bolsa 10kg ', 'Whiskas', 'comida', 41000, 'x% De proteinas', ''),
(122, 'Pescado Por Bolsa 10kg', 'Whiskas', 'comida', 41000, 'x% De proteinas', ''),
(123, 'Pollo Por kg', 'Whiskas', 'comida', 4200, 'x% De proteinas', ''),
(124, 'Pescado Por kg', 'Whiskas', 'comida', 4200, 'x% De proteinas', ''),
(125, 'Hepatic Perro 10kg', 'Royal canin', 'comida', 70000, 'x% De proteinas', ''),
(126, 'Hepatic Perro Por Bolsa', 'Royal canin', 'comida', 7100, 'x% De proteinas', ''),
(127, 'Diabetic Por Bolsa 10kg', 'Royal canin', 'comida', 73000, 'x% De proteinas', ''),
(128, 'Diabetic Por kg', 'Royal canin', 'comida', 7400, 'x% De proteinas', ''),
(129, 'Satiety Perro Por Bolsa 15kg', 'Royal canin', 'comida', 83000, 'x% De proteinas', ''),
(130, 'Satiety Perro Por kg', 'Royal canin', 'comida', 5600, 'x% De proteinas', ''),
(131, 'Max Adult Por Bolsa 15kg', 'Royal canin', 'comida', 71000, 'x% De proteinas', ''),
(132, 'Maxi Adult Por Bolsa 15kg', 'Royal canin', 'comida', 6200, 'x% De proteinas', ''),
(133, 'Medium Adult Por Bolsa 15kg', 'Royal canin', 'comida', 79000, 'x% De proteinas', ''),
(134, 'Medium Adult Por kg', 'Royal canin', 'comida', 6200, 'x% De proteinas', ''),
(135, 'Bull Dog Frances Adulto Por Bolsa 7.5 kg', 'Royal canin', 'comida', 50500, 'x% De proteinas', ''),
(136, 'Bull Dog Frances Adulto Por kg', 'Royal canin', 'comida', 6700, 'x% De proteinas', ''),
(137, 'Cat Por kg', 'Super Premiun', 'comida', 7600, 'x% De proteinas', ''),
(138, 'Conejo Ganave Por kg ', 'Productos Sin Marca', 'Utilidad', 1000, 'x% De proteinas', ''),
(139, 'Maderitas/Pellets Por kg', 'Productos Sin Marca', 'Utilidad', 800, 'x', ''),
(140, 'Maderitas/Pellets Por Bolsa', 'Productos Sin Marca', 'Utilidad', 8500, 'x', ''),
(141, 'Latas', 'Agility', 'comida', 3200, '99% De proteinas Animal', ''),
(142, 'Bocaditos Naturales', 'Auki', 'comida', 1600, 'x% De proteinas', ''),
(143, 'Pouch', 'Cat Chow', 'comida', 1400, 'x% De proteinas', ''),
(144, 'Pouch', 'Felix', 'comida', 1400, 'x% De proteinas', ''),
(145, 'Pouch', 'Dog Chow', 'comida', 1400, 'x% De proteinas', ''),
(146, 'Pouch', 'Whiskas', 'comida', 900, 'x% De proteinas', ''),
(147, 'Pouch', 'Pedigri', 'comida', 900, 'x% De proteinas', ''),
(148, 'Lavanda', 'Alta Gama', 'comida', 6700, 'x% De proteinas', ''),
(149, 'Limon', 'Alta Gama', 'comida', 6700, 'x% De proteinas', ''),
(150, 'Bolsa Negra jajajj', 'Alta Gama', 'comida', 6500, 'x% De proteinas', ''),
(151, 'Shampoo', 'Higiene', 'Higiene', 4500, 'x', ''),
(152, 'Acondicionador', 'Higiene', 'Higiene', 4500, 'x', ''),
(153, 'Locion OssPret', 'Higiene', 'Higiene', 5500, 'x', ''),
(154, 'Pino Pack Viruta', 'Productos Sin Marca', 'Utilidad', 1150, 'x', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `IDProveedor` int(11) NOT NULL,
  `NombreProveedor` varchar(250) NOT NULL,
  `Contacto` varchar(250) NOT NULL,
  `Direccion` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`IDProveedor`, `NombreProveedor`, `Contacto`, `Direccion`) VALUES
(1, 'Proveedor 1', 'Contacto 1', 'Direccion 1'),
(2, 'Proveedor 2', 'Contacto 2', 'Direccion 2'),
(4, 'Proveedor 4', 'Contacto 4', 'Direccion 4'),
(5, 'Proveedor 5', 'Contacto 5', 'Direccion 5'),
(6, 'Proveedor 6', 'Contacto 6', 'Direccion 6'),
(7, 'Proveedor 7', 'Contacto 7', 'Direccion 7'),
(8, 'Proveedor 8', 'Contacto 8', 'Direccion 8'),
(9, 'Proveedor 9', 'Contacto 9', 'Direccion 9'),
(10, 'Proveedor 10', 'Contacto 10', 'Direccion 10'),
(11, 'Proveedor 1saaaaaasdasdasdsadsadasdsaaaa', 'Contacto 1', 'Direccion 1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`IDProducto`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`IDProveedor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `IDProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `IDProveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
