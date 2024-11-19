-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-11-2024 a las 00:01:32
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
-- Estructura de tabla para la tabla `movimientostock`
--

CREATE TABLE `movimientostock` (
  `IDMovimiento` int(11) NOT NULL,
  `IDProducto` int(11) NOT NULL,
  `TipoMovimiento` varchar(250) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `FechaMovimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `StockActual` int(11) NOT NULL,
  `StockMinimo` int(11) NOT NULL,
  `Descripcion` varchar(500) NOT NULL,
  `FechaAlta` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `movimientostock`
--
ALTER TABLE `movimientostock`
  ADD PRIMARY KEY (`IDMovimiento`),
  ADD KEY `fk_IDProducto` (`IDProducto`);

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
-- AUTO_INCREMENT de la tabla `movimientostock`
--
ALTER TABLE `movimientostock`
  MODIFY `IDMovimiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `IDProducto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `IDProveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `movimientostock`
--
ALTER TABLE `movimientostock`
  ADD CONSTRAINT `fk_IDProducto` FOREIGN KEY (`IDProducto`) REFERENCES `productos` (`IDProducto`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
