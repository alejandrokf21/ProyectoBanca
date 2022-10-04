-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 04-10-2022 a las 16:52:20
-- Versión del servidor: 5.7.36
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `banking_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
CREATE TABLE IF NOT EXISTS `cuenta` (
  `account_id` int(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status_account_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `balance` float NOT NULL,
  `account_name` varchar(250) NOT NULL,
  `dpi` int(13) NOT NULL,
  PRIMARY KEY (`account_id`),
  KEY `user_id` (`user_id`),
  KEY `status_account_id` (`status_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta_tercero`
--

DROP TABLE IF EXISTS `cuenta_tercero`;
CREATE TABLE IF NOT EXISTS `cuenta_tercero` (
  `foreign_account_id` int(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  `account_id` int(30) NOT NULL,
  `max_amount_transfer` float NOT NULL,
  `max_daily_transactions` int(60) NOT NULL,
  `account_alias` varchar(250) NOT NULL,
  PRIMARY KEY (`foreign_account_id`),
  KEY `user_id` (`user_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_cuenta`
--

DROP TABLE IF EXISTS `estado_cuenta`;
CREATE TABLE IF NOT EXISTS `estado_cuenta` (
  `status_account_id` int(11) NOT NULL,
  `status_account_description` varchar(100) NOT NULL,
  PRIMARY KEY (`status_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado_cuenta`
--

INSERT INTO `estado_cuenta` (`status_account_id`, `status_account_description`) VALUES
(0, 'Inactiva'),
(1, 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_usuario`
--

DROP TABLE IF EXISTS `estado_usuario`;
CREATE TABLE IF NOT EXISTS `estado_usuario` (
  `status_id` int(11) NOT NULL,
  `status_description` varchar(100) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado_usuario`
--

INSERT INTO `estado_usuario` (`status_id`, `status_description`) VALUES
(0, 'Inactivo'),
(1, 'Activo'),
(2, 'Pendiente de Confirmacion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_transaccion`
--

DROP TABLE IF EXISTS `tipo_transaccion`;
CREATE TABLE IF NOT EXISTS `tipo_transaccion` (
  `transaction_type_id` int(11) NOT NULL COMMENT '1=Deposito, 2= Retiro, 3=Transferencia',
  `transaction_type_description` varchar(100) NOT NULL,
  PRIMARY KEY (`transaction_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_transaccion`
--

INSERT INTO `tipo_transaccion` (`transaction_type_id`, `transaction_type_description`) VALUES
(1, 'Deposito'),
(2, 'Retiro'),
(3, 'Transferencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
CREATE TABLE IF NOT EXISTS `tipo_usuario` (
  `user_type_id` int(11) NOT NULL,
  `user_type_description` varchar(100) NOT NULL,
  PRIMARY KEY (`user_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`user_type_id`, `user_type_description`) VALUES
(1, 'Administrador'),
(2, 'Cajero'),
(3, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `transaction_id` int(30) NOT NULL AUTO_INCREMENT,
  `account_id` int(30) NOT NULL,
  `transaction_type_id` int(11) NOT NULL,
  `transaction_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `transaction_amount` float NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `account_id` (`account_id`),
  KEY `transaction_type_id` (`transaction_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `user_name` varchar(500) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(250) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `email_verification_link` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  KEY `user_type_id` (`user_type_id`),
  KEY `status_id` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD CONSTRAINT `cuenta_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usuario` (`user_id`),
  ADD CONSTRAINT `cuenta_ibfk_2` FOREIGN KEY (`status_account_id`) REFERENCES `estado_cuenta` (`status_account_id`);

--
-- Filtros para la tabla `cuenta_tercero`
--
ALTER TABLE `cuenta_tercero`
  ADD CONSTRAINT `cuenta_tercero_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usuario` (`user_id`),
  ADD CONSTRAINT `cuenta_tercero_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `cuenta` (`account_id`);

--
-- Filtros para la tabla `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `cuenta` (`account_id`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`transaction_type_id`) REFERENCES `tipo_transaccion` (`transaction_type_id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`user_type_id`) REFERENCES `tipo_usuario` (`user_type_id`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `estado_usuario` (`status_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
