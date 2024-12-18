-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-12-2024 a las 18:30:02
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
  `Descripcion` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`IDProducto`, `Nombre`, `Marca`, `Tipo`, `Precio`, `Descripcion`) VALUES
(34, 'Producto 60', 'Marca T', 'comida', 1050, 'Descripción del Producto 60'),
(35, 'pescaditos', 'gati', 'comida', 1500, 'proteina 35%'),
(36, 'pescaditoss', 'gati', 'comida', 1500, 'proteina 50%');

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
  MODIFY `IDProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `IDProveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
