-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-05-2022 a las 22:40:59
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

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
(54, 6, 6, '2022-05-27 16:23:05', '10:00', 'Me duele el pie', 7);

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
(8, 67984545, '', 'p', 'Pruseba Usuario2', NULL, 0, 'Osecac', 'nahuel@gmail.com'),
(9, 0, '$2y$10$xKIDJTlV0CyEHifAHCnmt.gI3/SwMnjh7SGMtGc0xPnwiHWKRyyC2', 'm', 'medico', NULL, NULL, '', ''),
(10, 0, '$2y$10$tY/X2r3eLNDpDe2ZWMct4ukpbWtah.m12ysnyAxJFDx12HQqJPAa2', 's', 'secretaria', NULL, NULL, '', ''),
(11, 0, '$2y$10$39ueCRYOSTYGFiYol5BitOhqfWDbIp1i2cK0xEdzATQV/0Gl46pc2', 'a', 'admin', NULL, NULL, '', '');

-------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `id_horario` int(11) NOT NULL,
  `id_medico` int(11) NOT NULL,
  `hora` varchar(5) NOT NULL,
  `fecha` date NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`id_horario`, `id_medico`, `hora`, `fecha`) VALUES(1,7, '8:00','2022-06-27');
INSERT INTO `horario` (`id_horario`, `id_medico`, `hora`, `fecha`) VALUES(2,9, '10:00','2022-05-27');
INSERT INTO `horario` (`id_horario`, `id_medico`, `hora`, `fecha`) VALUES(3,9, '15:00','2022-09-30');
INSERT INTO `horario` (`id_horario`, `id_medico`, `hora`, `fecha`) VALUES(4,7, '2:00','2022-07-27');
INSERT INTO `horario` (`id_horario`, `id_medico`, `hora`, `fecha`) VALUES(5,9, '11:00','2022-05-25');
INSERT INTO `horario` (`id_horario`, `id_medico`, `hora`, `fecha`) VALUES(6,7, '12:00','2022-05-2');
INSERT INTO `horario` (`id_horario`, `id_medico`, `hora`, `fecha`) VALUES(7,9, '1:00','2022-05-27');
INSERT INTO `horario` (`id_horario`, `id_medico`, `hora`, `fecha`) VALUES(8,7, '19:00','2022-05-14');

------------------------------------
--
-- Índices para tablas volcadas
--

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
-------------------------------------
-- Indices de la tabla `usuario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`id_horario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `turno`
--
ALTER TABLE `turno`
  MODIFY `id_turno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `id_horario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;


--
-- Restricciones para tablas volcadas
--

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
