-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-12-2024 a las 00:33:33
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

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
  `Descripcion` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`IDProducto`, `Nombre`, `Marca`, `Tipo`, `Precio`, `Descripcion`) VALUES
(37, 'Perro x kilo', 'Agility', 'Comida', 2600, 'x% De proteinas'),
(38, 'Perro Bolsa', 'Agility', 'Comida', 4800, 'x% De proteinas'),
(39, 'Urinary Gato', 'Agility', 'comida', 5400, '30% de Proteina'),
(40, 'Urinary Gato', 'Agility', 'comida', 54000, '30% de Proteina'),
(41, 'Kitten', 'Agility', 'comida', 5200, '34% de Proteina'),
(42, 'Gato Por kilo', 'Agility', 'comida', 5100, '30% de Proteina'),
(43, 'Gato Bolsa', 'Agility', 'Bolsa', 50000, '30% de Proteina'),
(44, 'Holistic Food Bolsa', 'Greenline', 'comida', 44500, '32% de Proteina'),
(45, 'Holistic Food Kilo', 'Greenline', 'comida', 3400, '32% de Proteina'),
(46, 'Ocean Bolsa', 'Cat Chow', 'comida', 64000, 'x% De proteinas'),
(47, 'Pescado Bolsa', 'Cat Chow', 'comida', 64000, 'x%'),
(48, 'Gatitos Bolsa 15kg', 'Cat Chow', 'comida', 67000, '36% De proteinas'),
(49, 'Gatitos 8kg', 'Cat Chow', 'comida', 31000, 'x%'),
(50, 'Gatitos por kilo', 'Cat Chow', 'comida', 4800, 'x% De proteinas'),
(51, 'Ocean', 'Cat Chow', 'comida', 4800, 'x% De proteinas'),
(52, 'Cordero medium bolsa 15kg', 'Old prince', 'comida', 67000, 'x% De proteinas'),
(53, 'Cordero medium kilo', 'Old prince', 'comida', 4600, 'x% De proteinas'),
(54, 'Small 15kg', 'Old prince', 'comida', 67000, 'x% De proteinas'),
(55, 'Small 1kg', 'Old prince', 'comida', 4600, 'x% De proteinas'),
(56, 'Gato Equilibrium Complete', 'Old prince', 'comida', 5200, 'x% De proteinas'),
(57, 'Gato Bolsa', 'Old prince', 'comida', 36000, 'x% De proteinas'),
(58, 'Adulto Bolsa 20kg', 'Performance', 'comida', 68000, 'x% De proteinas'),
(59, 'Adulto por kilo', 'Performance', 'comida', 4400, 'x% De proteinas'),
(60, 'Gato Bolsa 7,5 kg ', 'Performance', 'comida', 37000, 'x% De proteinas'),
(61, 'Gato Por kilo', 'Performance', 'comida', 6800, 'x% De proteinas'),
(62, 'Perro Bolsa 20kg', 'Valiant', 'comida', 22600, 'x% De proteinas'),
(63, 'Perro por kilo', 'Valiant', 'comida', 1200, 'x% De proteinas'),
(64, 'Premiun Gato 24kg', 'Vital Safety', 'comida', 70000, 'x% De proteinas'),
(65, 'Premiun Gato por kg', 'Vital Safety', 'comida', 4200, 'x% De proteinas'),
(66, 'Premiun Gato kilo', 'Vital Safety', 'comida', 4200, 'x% De proteinas'),
(67, 'Premiun Perro kilo', 'Vital Safety', 'comida', 2800, 'x% De proteinas'),
(68, 'Cachorros Bolsa 15kg', 'Nutribon', 'comida', 24000, 'x% De proteinas'),
(69, 'Cachorros por kg', 'Nutribon', 'comida', 1700, 'x% De proteinas'),
(70, 'Adulto Bolsa 15kg', 'Nutribon', 'comida', 18800, 'x% De proteinas'),
(71, 'Adulto por kg', 'Nutribon', 'comida', 1400, 'x% De proteinas'),
(72, 'Raza pequeña por kg', 'Nutribon', 'comida', 1700, 'x% De proteinas'),
(73, 'Gato bolsa 20kg', 'Nutribon', 'comida', 37000, 'x% De proteinas'),
(74, 'Gato por kg', 'Nutribon', 'comida', 1900, 'x% De proteinas'),
(75, 'Criadores bolsa 20kg', 'Sieger', 'comida', 62000, 'x% De proteinas'),
(76, 'Criadores por kg', 'Sieger', 'comida', 3600, 'x% De proteinas'),
(77, 'Gato bolsa 20kg', 'Vagoneta', 'comida', 31000, 'x% De proteinas'),
(78, 'Gato por kg', 'Vagoneta', 'comida', 1900, 'x% De proteinas'),
(79, 'Criadores bolsa 20kg', 'Estampa', 'comida', 28500, 'x% De proteinas'),
(80, 'Criadores por kg', 'Estampa', 'comida', 1900, 'x% De proteinas'),
(81, 'Plus perro bolsa 20kg', 'Estampa', 'comida', 33400, 'x% De proteinas'),
(82, 'Plus perro por kg', 'Estampa', 'comida', 2300, 'x% De proteinas'),
(83, 'Plus raza pequeña bolsa 8kg', 'Estampa', 'comida', 19000, 'x% De proteinas'),
(84, 'Plus raza pequeña bolsa 15kg', 'Estampa', 'comida', 25500, 'x% De proteinas');

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
  MODIFY `IDProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `IDProveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
