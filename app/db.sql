-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-05-2022 a las 07:23:39
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `a_cargo`
--

CREATE TABLE `a_cargo` (
  `id_a_cargo` int(11) NOT NULL,
  `id_secretaria` int(11) NOT NULL,
  `id_medico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `a_cargo`
--

INSERT INTO `a_cargo` (`id_a_cargo`, `id_secretaria`, `id_medico`) VALUES
(1, 12, 7),
(2, 10, 8),
(3, 12, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

CREATE TABLE `turno` (
  `id_turno` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_autor` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `hora` varchar(5) NOT NULL,
  `razon_consulta` varchar(255) NOT NULL,
  `id_medico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `turno`
--

INSERT INTO `turno` (`id_turno`, `id_usuario`, `id_autor`, `fecha`, `hora`, `razon_consulta`, `id_medico`) VALUES
(2, 6, 12, '2022-06-09 23:01:48', '14:00', 'dolor de espalda', 7),
(4, 6, 10, '2022-05-30 16:57:12', '13:00', 'dolor de rodilla', 8),
(8, 6, 12, '2022-06-09 23:01:48', '14:00', 'dolor de pecho', 9),
(55, 6, 12, '2022-06-18 00:00:00', '17:20', 'dolor de hombro', 7),
(57, 6, 12, '2022-06-24 00:00:00', '18:00', 'dolor de muela', 7),
(58, 6, 12, '2022-06-25 00:00:00', '20:22', 'cambio de muela', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `dni` int(11) NOT NULL,
  `pass` varchar(300) NOT NULL,
  `rol` varchar(1) NOT NULL,
  `nombre_apellido` varchar(25) NOT NULL,
  `especialidad` varchar(15) DEFAULT NULL,
  `num_afiliado` int(15) DEFAULT NULL,
  `obra_social` varchar(15) NOT NULL,
  `email` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `dni`, `pass`, `rol`, `nombre_apellido`, `especialidad`, `num_afiliado`, `obra_social`, `email`) VALUES
(6, 42041728, 'prueba123', 'p', 'Nahuel Ruppel', NULL, 1234567891, 'Osecac', 'nahuelruppel10@gmail.com'),
(7, 34678980, 'prueba123', 'm', 'Prueba Medico', 'Odontologo', NULL, 'Osecac', 'prueba123@gmail.com'),
(8, 67984545, '', 'm', 'Pruseba Usuario2', NULL, 0, 'Osecac', 'nahuel@gmail.com'),
(9, 0, '$2y$10$xKIDJTlV0CyEHifAHCnmt.gI3/SwMnjh7SGMtGc0xPnwiHWKRyyC2', 'm', 'medico', NULL, NULL, '', ''),
(10, 42345678, '$2y$10$tY/X2r3eLNDpDe2ZWMct4ukpbWtah.m12ysnyAxJFDx12HQqJPAa2', 's', 'secretaria', NULL, NULL, '', ''),
(11, 0, '$2y$10$39ueCRYOSTYGFiYol5BitOhqfWDbIp1i2cK0xEdzATQV/0Gl46pc2', 'a', 'admin', NULL, NULL, '', ''),
(12, 42463568, 'prueb123', 's', 'prueba secretare', NULL, NULL, 'Osde', 'secretaria@hotmail.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `a_cargo`
--
ALTER TABLE `a_cargo`
  ADD PRIMARY KEY (`id_a_cargo`),
  ADD KEY `a_cargo_ibfk_1` (`id_secretaria`),
  ADD KEY `a_cargo_ibfk_2` (`id_medico`);

--
-- Indices de la tabla `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`id_turno`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_autor` (`id_autor`),
  ADD KEY `id_medico` (`id_medico`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `a_cargo`
--
ALTER TABLE `a_cargo`
  MODIFY `id_a_cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `turno`
--
ALTER TABLE `turno`
  MODIFY `id_turno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `a_cargo`
--
ALTER TABLE `a_cargo`
  ADD CONSTRAINT `a_cargo_ibfk_1` FOREIGN KEY (`id_secretaria`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `a_cargo_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `turno`
--
ALTER TABLE `turno`
  ADD CONSTRAINT `turno_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `turno_ibfk_2` FOREIGN KEY (`id_autor`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `turno_ibfk_3` FOREIGN KEY (`id_medico`) REFERENCES `usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
