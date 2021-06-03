-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-06-2021 a las 17:32:25
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestionparcelas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `animal`
--

CREATE TABLE `animal` (
  `idanimal` int(20) NOT NULL,
  `sexo` varchar(20) NOT NULL,
  `ideganadera` int(20) NOT NULL COMMENT 'ID de referencia de la especie',
  `idparcela` int(20) NOT NULL,
  `crotal` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `animal`
--

INSERT INTO `animal` (`idanimal`, `sexo`, `ideganadera`, `idparcela`, `crotal`) VALUES
(1, 'm', 1, 1, 123),
(9, 'f', 2, 2, 124),
(28, 'm', 1, 2, 125),
(33, 'm', 2, 1, 126),
(34, 'm', 2, 1, 127),
(37, 'M', 2, 9, 129);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eagricola`
--

CREATE TABLE `eagricola` (
  `ideagricola` int(20) NOT NULL,
  `idespecie` int(20) NOT NULL,
  `nombreespecie` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `eagricola`
--

INSERT INTO `eagricola` (`ideagricola`, `idespecie`, `nombreespecie`) VALUES
(1, 2, 'trigo'),
(2, 3, 'maiz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eganadera`
--

CREATE TABLE `eganadera` (
  `ideganadera` int(11) NOT NULL,
  `idespecie` int(11) NOT NULL,
  `nombreespecie` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `eganadera`
--

INSERT INTO `eganadera` (`ideganadera`, `idespecie`, `nombreespecie`) VALUES
(1, 1, 'bovina'),
(2, 4, 'porcina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especie`
--

CREATE TABLE `especie` (
  `idespecie` int(20) NOT NULL,
  `nombreespecie` varchar(20) NOT NULL,
  `tipo` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `especie`
--

INSERT INTO `especie` (`idespecie`, `nombreespecie`, `tipo`) VALUES
(1, 'bovina', 2),
(2, 'trigo', 1),
(3, 'maiz', 1),
(4, 'porcina', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `idestado` int(20) NOT NULL,
  `nombrestado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`idestado`, `nombrestado`) VALUES
(1, 'libre'),
(2, 'ocupado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadoa`
--

CREATE TABLE `estadoa` (
  `idestado` int(20) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estadoa`
--

INSERT INTO `estadoa` (`idestado`, `nombre`) VALUES
(1, 'libre'),
(2, 'ocupada'),
(3, 'en barbecho'),
(4, 'abonando'),
(5, 'siembra'),
(6, 'recogida');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadog`
--

CREATE TABLE `estadog` (
  `idestado` int(20) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estadog`
--

INSERT INTO `estadog` (`idestado`, `nombre`) VALUES
(1, 'libre'),
(2, 'ocupada'),
(3, 'moviendo animales'),
(4, 'reposando tierra');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornalero`
--

CREATE TABLE `jornalero` (
  `idjornalero` int(20) NOT NULL,
  `idusuario` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `jornalero`
--

INSERT INTO `jornalero` (`idjornalero`, `idusuario`) VALUES
(1, 7),
(2, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagricola`
--

CREATE TABLE `pagricola` (
  `idpagricola` int(11) NOT NULL,
  `idparcela` int(11) NOT NULL,
  `idestado` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pagricola`
--

INSERT INTO `pagricola` (`idpagricola`, `idparcela`, `idestado`) VALUES
(1, 1, 1),
(11, 37, 2),
(16, 45, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parcela`
--

CREATE TABLE `parcela` (
  `idparcela` int(20) NOT NULL,
  `hectareas` int(20) NOT NULL,
  `idpropietario` int(20) NOT NULL,
  `idtipoparcela` int(20) NOT NULL,
  `referencia` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `parcela`
--

INSERT INTO `parcela` (`idparcela`, `hectareas`, `idpropietario`, `idtipoparcela`, `referencia`) VALUES
(1, 33, 3, 1, 1234),
(2, 34, 3, 2, 5678),
(7, 123, 3, 2, 9012),
(37, 58678, 3, 1, 55555454),
(45, 123455, 3, 1, 5214521),
(46, 123455, 3, 2, 45645645);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pganadera`
--

CREATE TABLE `pganadera` (
  `idpganadera` int(20) NOT NULL,
  `idparcela` int(20) NOT NULL,
  `idestado` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pganadera`
--

INSERT INTO `pganadera` (`idpganadera`, `idparcela`, `idestado`) VALUES
(1, 2, 1),
(2, 7, 2),
(9, 46, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantacion`
--

CREATE TABLE `plantacion` (
  `idplantacion` int(20) NOT NULL,
  `fplantacion` date NOT NULL,
  `frecogida` date DEFAULT NULL,
  `idparcela` int(20) NOT NULL,
  `ideagricola` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `plantacion`
--

INSERT INTO `plantacion` (`idplantacion`, `fplantacion`, `frecogida`, `idparcela`, `ideagricola`) VALUES
(4, '2020-02-03', '2021-06-26', 1, 1),
(32, '2021-06-26', NULL, 11, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietario`
--

CREATE TABLE `propietario` (
  `idpropietario` int(20) NOT NULL,
  `idusuario` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `propietario`
--

INSERT INTO `propietario` (`idpropietario`, `idusuario`) VALUES
(3, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idrol` int(20) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `nombre`) VALUES
(1, 'propietario'),
(2, 'jornalero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `idtipo` int(20) NOT NULL,
  `nombretipo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`idtipo`, `nombretipo`) VALUES
(1, 'agricola'),
(2, 'ganadera');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabaja`
--

CREATE TABLE `trabaja` (
  `idtrabaja` int(20) NOT NULL,
  `idjornalero` int(20) NOT NULL,
  `idparcela` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `trabaja`
--

INSERT INTO `trabaja` (`idtrabaja`, `idjornalero`, `idparcela`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 7),
(5, 2, 2),
(12, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `dni` varchar(20) NOT NULL,
  `telefono` int(20) NOT NULL,
  `idrol` int(20) NOT NULL,
  `pass` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nombre`, `email`, `dni`, `telefono`, `idrol`, `pass`) VALUES
(5, 'Mar', 'marsan97.ms@gmail.co', '72106031L', 655727258, 1, '7c4a8d09ca3762af61e59520943dc26494f8941b'),
(7, 'jornale', 'jornalero@jornalero.es', '54126395J', 125478961, 2, '7c4a8d09ca3762af61e59520943dc26494f8941b'),
(9, 'jornalero2', 'jornalero2@jornalero', '12365452K', 15265452, 2, 'dd5fef9c1c1da1394d6d34b248c51be2ad740840');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`idanimal`),
  ADD KEY `ideganadera` (`ideganadera`),
  ADD KEY `idparcela` (`idparcela`);

--
-- Indices de la tabla `eagricola`
--
ALTER TABLE `eagricola`
  ADD PRIMARY KEY (`ideagricola`),
  ADD KEY `idespecie` (`idespecie`);

--
-- Indices de la tabla `eganadera`
--
ALTER TABLE `eganadera`
  ADD PRIMARY KEY (`ideganadera`),
  ADD KEY `idespecie` (`idespecie`);

--
-- Indices de la tabla `especie`
--
ALTER TABLE `especie`
  ADD PRIMARY KEY (`idespecie`),
  ADD KEY `tipo` (`tipo`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`idestado`);

--
-- Indices de la tabla `estadoa`
--
ALTER TABLE `estadoa`
  ADD PRIMARY KEY (`idestado`);

--
-- Indices de la tabla `estadog`
--
ALTER TABLE `estadog`
  ADD PRIMARY KEY (`idestado`);

--
-- Indices de la tabla `jornalero`
--
ALTER TABLE `jornalero`
  ADD PRIMARY KEY (`idjornalero`),
  ADD KEY `idusuario` (`idusuario`);

--
-- Indices de la tabla `pagricola`
--
ALTER TABLE `pagricola`
  ADD PRIMARY KEY (`idpagricola`),
  ADD KEY `idparcela` (`idparcela`),
  ADD KEY `idestado` (`idestado`);

--
-- Indices de la tabla `parcela`
--
ALTER TABLE `parcela`
  ADD PRIMARY KEY (`idparcela`),
  ADD KEY `idpropietario` (`idpropietario`),
  ADD KEY `idtipoparcela` (`idtipoparcela`);

--
-- Indices de la tabla `pganadera`
--
ALTER TABLE `pganadera`
  ADD PRIMARY KEY (`idpganadera`),
  ADD KEY `idparcela` (`idparcela`),
  ADD KEY `idestado` (`idestado`);

--
-- Indices de la tabla `plantacion`
--
ALTER TABLE `plantacion`
  ADD PRIMARY KEY (`idplantacion`),
  ADD KEY `idparcela` (`idparcela`),
  ADD KEY `ideagricola` (`ideagricola`);

--
-- Indices de la tabla `propietario`
--
ALTER TABLE `propietario`
  ADD PRIMARY KEY (`idpropietario`),
  ADD KEY `idusuario` (`idusuario`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrol`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`idtipo`);

--
-- Indices de la tabla `trabaja`
--
ALTER TABLE `trabaja`
  ADD PRIMARY KEY (`idtrabaja`),
  ADD KEY `idjornalero` (`idjornalero`),
  ADD KEY `idparcela` (`idparcela`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `idrol` (`idrol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `animal`
--
ALTER TABLE `animal`
  MODIFY `idanimal` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `eagricola`
--
ALTER TABLE `eagricola`
  MODIFY `ideagricola` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `eganadera`
--
ALTER TABLE `eganadera`
  MODIFY `ideganadera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `especie`
--
ALTER TABLE `especie`
  MODIFY `idespecie` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `idestado` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estadoa`
--
ALTER TABLE `estadoa`
  MODIFY `idestado` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `estadog`
--
ALTER TABLE `estadog`
  MODIFY `idestado` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `jornalero`
--
ALTER TABLE `jornalero`
  MODIFY `idjornalero` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pagricola`
--
ALTER TABLE `pagricola`
  MODIFY `idpagricola` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `parcela`
--
ALTER TABLE `parcela`
  MODIFY `idparcela` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `pganadera`
--
ALTER TABLE `pganadera`
  MODIFY `idpganadera` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `plantacion`
--
ALTER TABLE `plantacion`
  MODIFY `idplantacion` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `propietario`
--
ALTER TABLE `propietario`
  MODIFY `idpropietario` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idrol` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `idtipo` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `trabaja`
--
ALTER TABLE `trabaja`
  MODIFY `idtrabaja` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `animal_ibfk_1` FOREIGN KEY (`ideganadera`) REFERENCES `eganadera` (`ideganadera`),
  ADD CONSTRAINT `animal_ibfk_2` FOREIGN KEY (`idparcela`) REFERENCES `pganadera` (`idpganadera`);

--
-- Filtros para la tabla `eagricola`
--
ALTER TABLE `eagricola`
  ADD CONSTRAINT `eagricola_ibfk_1` FOREIGN KEY (`idespecie`) REFERENCES `especie` (`idespecie`);

--
-- Filtros para la tabla `eganadera`
--
ALTER TABLE `eganadera`
  ADD CONSTRAINT `eganadera_ibfk_1` FOREIGN KEY (`idespecie`) REFERENCES `especie` (`idespecie`);

--
-- Filtros para la tabla `especie`
--
ALTER TABLE `especie`
  ADD CONSTRAINT `especie_ibfk_1` FOREIGN KEY (`tipo`) REFERENCES `tipo` (`idtipo`);

--
-- Filtros para la tabla `jornalero`
--
ALTER TABLE `jornalero`
  ADD CONSTRAINT `jornalero_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `pagricola`
--
ALTER TABLE `pagricola`
  ADD CONSTRAINT `pagricola_ibfk_2` FOREIGN KEY (`idparcela`) REFERENCES `parcela` (`idparcela`),
  ADD CONSTRAINT `pagricola_ibfk_3` FOREIGN KEY (`idestado`) REFERENCES `estadoa` (`idestado`);

--
-- Filtros para la tabla `parcela`
--
ALTER TABLE `parcela`
  ADD CONSTRAINT `parcela_ibfk_2` FOREIGN KEY (`idpropietario`) REFERENCES `propietario` (`idpropietario`),
  ADD CONSTRAINT `parcela_ibfk_3` FOREIGN KEY (`idtipoparcela`) REFERENCES `tipo` (`idtipo`);

--
-- Filtros para la tabla `pganadera`
--
ALTER TABLE `pganadera`
  ADD CONSTRAINT `pganadera_ibfk_1` FOREIGN KEY (`idparcela`) REFERENCES `parcela` (`idparcela`),
  ADD CONSTRAINT `pganadera_ibfk_2` FOREIGN KEY (`idestado`) REFERENCES `estadog` (`idestado`);

--
-- Filtros para la tabla `plantacion`
--
ALTER TABLE `plantacion`
  ADD CONSTRAINT `plantacion_ibfk_2` FOREIGN KEY (`idparcela`) REFERENCES `pagricola` (`idpagricola`),
  ADD CONSTRAINT `plantacion_ibfk_3` FOREIGN KEY (`ideagricola`) REFERENCES `eagricola` (`ideagricola`);

--
-- Filtros para la tabla `propietario`
--
ALTER TABLE `propietario`
  ADD CONSTRAINT `propietario_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `trabaja`
--
ALTER TABLE `trabaja`
  ADD CONSTRAINT `trabaja_ibfk_1` FOREIGN KEY (`idjornalero`) REFERENCES `jornalero` (`idjornalero`),
  ADD CONSTRAINT `trabaja_ibfk_2` FOREIGN KEY (`idparcela`) REFERENCES `parcela` (`idparcela`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
