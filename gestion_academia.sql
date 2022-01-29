-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-01-2022 a las 18:22:23
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestion_academia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id_alumno` int(11) NOT NULL,
  `nombre_alumno` varchar(30) NOT NULL,
  `apellido1_alumno` varchar(30) NOT NULL,
  `aepllido2_alumno` varchar(30) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `dni_alumno` varchar(10) NOT NULL,
  `email_alumno` varchar(50) NOT NULL,
  `telefono_alumno` int(11) NOT NULL,
  `estado_alumno` tinyint(1) NOT NULL,
  `estado_laboral_alumno` tinyint(1) NOT NULL,
  `url_foto_alumno` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `id_curso` int(11) NOT NULL,
  `nombre_curso` varchar(100) NOT NULL,
  `fecha_inicio_curso` date NOT NULL,
  `fecha_fin_curso` date NOT NULL,
  `duracion_curso` int(11) NOT NULL,
  `horario_inicio_curso` time NOT NULL,
  `horario_fin_curso` time NOT NULL,
  `modalida_curso` enum('online','presencial','semipresencial','') NOT NULL,
  `tipo_curso` enum('módulo','certificado profesional','','') NOT NULL,
  `codigo_curso` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `id_documento` int(11) NOT NULL,
  `nombre_documento` varchar(30) NOT NULL,
  `url_documento` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos_incidencias_alumnos`
--

CREATE TABLE `documentos_incidencias_alumnos` (
  `id_documento_incidencia_alumno` int(11) NOT NULL,
  `id_documento` int(11) NOT NULL,
  `id_incidencia_alumno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos_incidencias_profesores`
--

CREATE TABLE `documentos_incidencias_profesores` (
  `id_documento_incidencia_profesor` int(11) NOT NULL,
  `id_incidencia_profesor` int(11) NOT NULL,
  `id_documento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidencias_alumnos`
--

CREATE TABLE `incidencias_alumnos` (
  `id_incidencia_alumno` int(11) NOT NULL,
  `titulo_incidencia_alumno` varchar(30) NOT NULL,
  `contenido_incidencia_alumno` text NOT NULL,
  `fecha_incidencia_alumno` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_alumno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidencias_profesores`
--

CREATE TABLE `incidencias_profesores` (
  `id_incidencia_profesor` int(11) NOT NULL,
  `titulo_incidencia_profesor` varchar(30) NOT NULL,
  `contenido_incidencia_profesor` text NOT NULL,
  `fecha_incidencia_profesor` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_profesor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `id_profesor` int(11) NOT NULL,
  `nombre_profesor` varchar(30) NOT NULL,
  `apellido1_profesor` varchar(30) NOT NULL,
  `aepllido2_profesor` varchar(30) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `dni_profesor` varchar(10) NOT NULL,
  `email_profesor` varchar(50) NOT NULL,
  `telefono_profesor` int(11) NOT NULL,
  `url_foto_profesor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(30) NOT NULL,
  `apellido1_usuario` varchar(30) NOT NULL,
  `aepllido2_usuario` varchar(30) NOT NULL,
  `email_usuario` varchar(50) NOT NULL,
  `telefono_usuario` int(11) NOT NULL,
  `dni_usuario` varchar(10) NOT NULL,
  `password_usuario` varchar(255) NOT NULL,
  `tipo_usuario` enum('administrador','editor','usuario','') NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `token` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id_alumno`),
  ADD UNIQUE KEY `dni_alumno` (`dni_alumno`),
  ADD KEY `relacion_alumno_curso` (`id_curso`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id_curso`);

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`id_documento`);

--
-- Indices de la tabla `documentos_incidencias_alumnos`
--
ALTER TABLE `documentos_incidencias_alumnos`
  ADD PRIMARY KEY (`id_documento_incidencia_alumno`),
  ADD KEY `relacion_documento_alumno` (`id_documento`),
  ADD KEY `relacion_documento_alumno2` (`id_incidencia_alumno`);

--
-- Indices de la tabla `documentos_incidencias_profesores`
--
ALTER TABLE `documentos_incidencias_profesores`
  ADD PRIMARY KEY (`id_documento_incidencia_profesor`),
  ADD KEY `relacion_documento_profesor` (`id_documento`),
  ADD KEY `relacion_documento_profesor2` (`id_incidencia_profesor`);

--
-- Indices de la tabla `incidencias_alumnos`
--
ALTER TABLE `incidencias_alumnos`
  ADD PRIMARY KEY (`id_incidencia_alumno`),
  ADD KEY `relacion_incidencia_alumno` (`id_alumno`);

--
-- Indices de la tabla `incidencias_profesores`
--
ALTER TABLE `incidencias_profesores`
  ADD PRIMARY KEY (`id_incidencia_profesor`),
  ADD KEY `relacion_incidencia_profesor` (`id_profesor`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`id_profesor`),
  ADD UNIQUE KEY `dni_profesor` (`dni_profesor`),
  ADD KEY `relacion_profesor_curso` (`id_curso`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `dni_usuario` (`dni_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id_alumno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id_curso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `documentos`
--
ALTER TABLE `documentos`
  MODIFY `id_documento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `documentos_incidencias_alumnos`
--
ALTER TABLE `documentos_incidencias_alumnos`
  MODIFY `id_documento_incidencia_alumno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `documentos_incidencias_profesores`
--
ALTER TABLE `documentos_incidencias_profesores`
  MODIFY `id_documento_incidencia_profesor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `incidencias_alumnos`
--
ALTER TABLE `incidencias_alumnos`
  MODIFY `id_incidencia_alumno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `incidencias_profesores`
--
ALTER TABLE `incidencias_profesores`
  MODIFY `id_incidencia_profesor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `profesores`
--
ALTER TABLE `profesores`
  MODIFY `id_profesor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `relacion_alumno_curso` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`);

--
-- Filtros para la tabla `documentos_incidencias_alumnos`
--
ALTER TABLE `documentos_incidencias_alumnos`
  ADD CONSTRAINT `relacion_documento_alumno` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id_documento`),
  ADD CONSTRAINT `relacion_documento_alumno2` FOREIGN KEY (`id_incidencia_alumno`) REFERENCES `incidencias_alumnos` (`id_incidencia_alumno`);

--
-- Filtros para la tabla `documentos_incidencias_profesores`
--
ALTER TABLE `documentos_incidencias_profesores`
  ADD CONSTRAINT `relacion_documento_profesor` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id_documento`),
  ADD CONSTRAINT `relacion_documento_profesor2` FOREIGN KEY (`id_incidencia_profesor`) REFERENCES `incidencias_profesores` (`id_incidencia_profesor`);

--
-- Filtros para la tabla `incidencias_alumnos`
--
ALTER TABLE `incidencias_alumnos`
  ADD CONSTRAINT `relacion_incidencia_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `alumnos` (`id_alumno`);

--
-- Filtros para la tabla `incidencias_profesores`
--
ALTER TABLE `incidencias_profesores`
  ADD CONSTRAINT `relacion_incidencia_profesor` FOREIGN KEY (`id_profesor`) REFERENCES `profesores` (`id_profesor`);

--
-- Filtros para la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD CONSTRAINT `relacion_profesor_curso` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
