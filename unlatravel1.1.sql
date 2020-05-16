CREATE DATABASE  IF NOT EXISTS `unlatravel` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `unlatravel`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: unlatravel
-- ------------------------------------------------------
-- Server version	5.6.24-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actividad`
--

DROP TABLE IF EXISTS `actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actividad` (
  `idActividad` int(11) NOT NULL AUTO_INCREMENT,
  `nombreActividad` varchar(45) NOT NULL,
  `calificacion` int(11) NOT NULL,
  `Comentarios_idComentarios` int(11) NOT NULL,
  `Ciudad_idCiudad` int(11) NOT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  `Actividadcol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idActividad`),
  KEY `fk_Actividad_Comentarios1_idx` (`Comentarios_idComentarios`),
  KEY `fk_Actividad_Ciudad1_idx` (`Ciudad_idCiudad`),
  CONSTRAINT `fk_Actividad_Ciudad1` FOREIGN KEY (`Ciudad_idCiudad`) REFERENCES `ciudad` (`idCiudad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Actividad_Comentarios1` FOREIGN KEY (`Comentarios_idComentarios`) REFERENCES `comentarios` (`idComentarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad`
--

LOCK TABLES `actividad` WRITE;
/*!40000 ALTER TABLE `actividad` DISABLE KEYS */;
/*!40000 ALTER TABLE `actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actividad_has_ciudad`
--

DROP TABLE IF EXISTS `actividad_has_ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actividad_has_ciudad` (
  `actividad_idActividad` int(11) NOT NULL,
  `ciudad_idCiudad` int(11) NOT NULL,
  PRIMARY KEY (`actividad_idActividad`,`ciudad_idCiudad`),
  KEY `fk_actividad_has_ciudad_ciudad1_idx` (`ciudad_idCiudad`),
  KEY `fk_actividad_has_ciudad_actividad1_idx` (`actividad_idActividad`),
  CONSTRAINT `fk_actividad_has_ciudad_actividad1` FOREIGN KEY (`actividad_idActividad`) REFERENCES `actividad` (`idActividad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_actividad_has_ciudad_ciudad1` FOREIGN KEY (`ciudad_idCiudad`) REFERENCES `ciudad` (`idCiudad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad_has_ciudad`
--

LOCK TABLES `actividad_has_ciudad` WRITE;
/*!40000 ALTER TABLE `actividad_has_ciudad` DISABLE KEYS */;
/*!40000 ALTER TABLE `actividad_has_ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alojamiento`
--

DROP TABLE IF EXISTS `alojamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alojamiento` (
  `idAlojamiento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `categoria` int(11) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `cantidadHabInd` int(11) DEFAULT NULL,
  `cantidadHabDob` int(11) DEFAULT NULL,
  `regimen` varchar(45) NOT NULL,
  `Ciudad_idCiudad` int(11) NOT NULL,
  PRIMARY KEY (`idAlojamiento`),
  KEY `fk_Alojamiento_Ciudad1_idx` (`Ciudad_idCiudad`),
  CONSTRAINT `fk_Alojamiento_Ciudad1` FOREIGN KEY (`Ciudad_idCiudad`) REFERENCES `ciudad` (`idCiudad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alojamiento`
--

LOCK TABLES `alojamiento` WRITE;
/*!40000 ALTER TABLE `alojamiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `alojamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alojamiento_has_servicio`
--

DROP TABLE IF EXISTS `alojamiento_has_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alojamiento_has_servicio` (
  `alojamiento_idAlojamiento` int(11) NOT NULL,
  `servicio_idServicio` int(11) NOT NULL,
  PRIMARY KEY (`alojamiento_idAlojamiento`,`servicio_idServicio`),
  KEY `fk_alojamiento_has_servicio_servicio1_idx` (`servicio_idServicio`),
  KEY `fk_alojamiento_has_servicio_alojamiento1_idx` (`alojamiento_idAlojamiento`),
  CONSTRAINT `fk_alojamiento_has_servicio_alojamiento1` FOREIGN KEY (`alojamiento_idAlojamiento`) REFERENCES `alojamiento` (`idAlojamiento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_alojamiento_has_servicio_servicio1` FOREIGN KEY (`servicio_idServicio`) REFERENCES `servicio` (`idServicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alojamiento_has_servicio`
--

LOCK TABLES `alojamiento_has_servicio` WRITE;
/*!40000 ALTER TABLE `alojamiento_has_servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `alojamiento_has_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudad` (
  `idCiudad` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCiudad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCiudad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentarios` (
  `idComentarios` int(11) NOT NULL AUTO_INCREMENT,
  `comentarios` varchar(45) NOT NULL,
  PRIMARY KEY (`idComentarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `idPais` int(11) NOT NULL AUTO_INCREMENT,
  `nombrePais` varchar(45) NOT NULL,
  `Ciudad_idCiudad` int(11) NOT NULL,
  PRIMARY KEY (`idPais`),
  UNIQUE KEY `nombrePais_UNIQUE` (`nombrePais`),
  KEY `fk_Pais_Ciudad1_idx` (`Ciudad_idCiudad`),
  CONSTRAINT `fk_Pais_Ciudad1` FOREIGN KEY (`Ciudad_idCiudad`) REFERENCES `ciudad` (`idCiudad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasajero`
--

DROP TABLE IF EXISTS `pasajero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pasajero` (
  `idPasajero` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `dni` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPasajero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasajero`
--

LOCK TABLES `pasajero` WRITE;
/*!40000 ALTER TABLE `pasajero` DISABLE KEYS */;
/*!40000 ALTER TABLE `pasajero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfiles`
--

DROP TABLE IF EXISTS `perfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfiles` (
  `idperfiles` int(11) NOT NULL,
  `perfil` varchar(45) NOT NULL,
  PRIMARY KEY (`idperfiles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfiles`
--

LOCK TABLES `perfiles` WRITE;
/*!40000 ALTER TABLE `perfiles` DISABLE KEYS */;
INSERT INTO `perfiles` VALUES (1,'Administrador'),(2,'Viajero');
/*!40000 ALTER TABLE `perfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservaactividad`
--

DROP TABLE IF EXISTS `reservaactividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservaactividad` (
  `idReservaActividad` int(11) NOT NULL,
  `fechaActividad` date DEFAULT NULL,
  `Usuario_idCliente` int(11) NOT NULL,
  `Actividad_idActividad` int(11) NOT NULL,
  PRIMARY KEY (`idReservaActividad`),
  KEY `fk_ReservaActividad_Usuario1_idx` (`Usuario_idCliente`),
  KEY `fk_ReservaActividad_Actividad1_idx` (`Actividad_idActividad`),
  CONSTRAINT `fk_ReservaActividad_Actividad1` FOREIGN KEY (`Actividad_idActividad`) REFERENCES `actividad` (`idActividad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ReservaActividad_Usuario1` FOREIGN KEY (`Usuario_idCliente`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservaactividad`
--

LOCK TABLES `reservaactividad` WRITE;
/*!40000 ALTER TABLE `reservaactividad` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservaactividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservaalojamiento`
--

DROP TABLE IF EXISTS `reservaalojamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservaalojamiento` (
  `idReservaAlojamiento` int(11) NOT NULL AUTO_INCREMENT,
  `fechaIngreso` date NOT NULL,
  `fechaSalida` date NOT NULL,
  `cantidadHabInd` int(11) DEFAULT NULL,
  `cantidadHabDob` int(11) DEFAULT NULL,
  `Alojamiento_idAlojamiento` int(11) NOT NULL,
  `Usuario_idCliente` int(11) NOT NULL,
  PRIMARY KEY (`idReservaAlojamiento`),
  KEY `fk_ReservaAlojamiento_Alojamiento1_idx` (`Alojamiento_idAlojamiento`),
  KEY `fk_ReservaAlojamiento_Usuario1_idx` (`Usuario_idCliente`),
  CONSTRAINT `fk_ReservaAlojamiento_Alojamiento1` FOREIGN KEY (`Alojamiento_idAlojamiento`) REFERENCES `alojamiento` (`idAlojamiento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ReservaAlojamiento_Usuario1` FOREIGN KEY (`Usuario_idCliente`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservaalojamiento`
--

LOCK TABLES `reservaalojamiento` WRITE;
/*!40000 ALTER TABLE `reservaalojamiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservaalojamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservavuelo`
--

DROP TABLE IF EXISTS `reservavuelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservavuelo` (
  `idReservaVuelo` int(11) NOT NULL AUTO_INCREMENT,
  `plazas` int(11) NOT NULL,
  `Vuelo_idVuelo` int(11) NOT NULL,
  `Usuario_idCliente` int(11) NOT NULL,
  PRIMARY KEY (`idReservaVuelo`),
  KEY `fk_ReservaVuelo_Vuelo1_idx` (`Vuelo_idVuelo`),
  KEY `fk_ReservaVuelo_Usuario1_idx` (`Usuario_idCliente`),
  CONSTRAINT `fk_ReservaVuelo_Usuario1` FOREIGN KEY (`Usuario_idCliente`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ReservaVuelo_Vuelo1` FOREIGN KEY (`Vuelo_idVuelo`) REFERENCES `vuelo` (`idVuelo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservavuelo`
--

LOCK TABLES `reservavuelo` WRITE;
/*!40000 ALTER TABLE `reservavuelo` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservavuelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservavuelo_has_usuario`
--

DROP TABLE IF EXISTS `reservavuelo_has_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservavuelo_has_usuario` (
  `reservavuelo_idReservaVuelo` int(11) NOT NULL,
  `usuario_idCliente` int(11) NOT NULL,
  PRIMARY KEY (`reservavuelo_idReservaVuelo`,`usuario_idCliente`),
  KEY `fk_reservavuelo_has_usuario_usuario1_idx` (`usuario_idCliente`),
  KEY `fk_reservavuelo_has_usuario_reservavuelo1_idx` (`reservavuelo_idReservaVuelo`),
  CONSTRAINT `fk_reservavuelo_has_usuario_reservavuelo1` FOREIGN KEY (`reservavuelo_idReservaVuelo`) REFERENCES `reservavuelo` (`idReservaVuelo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservavuelo_has_usuario_usuario1` FOREIGN KEY (`usuario_idCliente`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservavuelo_has_usuario`
--

LOCK TABLES `reservavuelo_has_usuario` WRITE;
/*!40000 ALTER TABLE `reservavuelo_has_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservavuelo_has_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicio` (
  `idServicio` int(11) NOT NULL AUTO_INCREMENT,
  `nombreServicio` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idServicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `dni` int(11) DEFAULT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `perfil` varchar(45) NOT NULL DEFAULT '2',
  `contrasena` varchar(15) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,12345678,'admin','Admin','local','admin@admin.com','44441111','1','admin123');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_has_reservaactividad`
--

DROP TABLE IF EXISTS `usuario_has_reservaactividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_has_reservaactividad` (
  `usuario_idCliente` int(11) NOT NULL,
  `reservaactividad_idReservaActividad` int(11) NOT NULL,
  PRIMARY KEY (`usuario_idCliente`,`reservaactividad_idReservaActividad`),
  KEY `fk_usuario_has_reservaactividad_reservaactividad1_idx` (`reservaactividad_idReservaActividad`),
  KEY `fk_usuario_has_reservaactividad_usuario1_idx` (`usuario_idCliente`),
  CONSTRAINT `fk_usuario_has_reservaactividad_reservaactividad1` FOREIGN KEY (`reservaactividad_idReservaActividad`) REFERENCES `reservaactividad` (`idReservaActividad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_reservaactividad_usuario1` FOREIGN KEY (`usuario_idCliente`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_has_reservaactividad`
--

LOCK TABLES `usuario_has_reservaactividad` WRITE;
/*!40000 ALTER TABLE `usuario_has_reservaactividad` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_has_reservaactividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_has_reservaalojamiento`
--

DROP TABLE IF EXISTS `usuario_has_reservaalojamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_has_reservaalojamiento` (
  `usuario_idCliente` int(11) NOT NULL,
  `reservaalojamiento_idReservaAlojamiento` int(11) NOT NULL,
  PRIMARY KEY (`usuario_idCliente`,`reservaalojamiento_idReservaAlojamiento`),
  KEY `fk_usuario_has_reservaalojamiento_reservaalojamiento1_idx` (`reservaalojamiento_idReservaAlojamiento`),
  KEY `fk_usuario_has_reservaalojamiento_usuario1_idx` (`usuario_idCliente`),
  CONSTRAINT `fk_usuario_has_reservaalojamiento_reservaalojamiento1` FOREIGN KEY (`reservaalojamiento_idReservaAlojamiento`) REFERENCES `reservaalojamiento` (`idReservaAlojamiento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_reservaalojamiento_usuario1` FOREIGN KEY (`usuario_idCliente`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_has_reservaalojamiento`
--

LOCK TABLES `usuario_has_reservaalojamiento` WRITE;
/*!40000 ALTER TABLE `usuario_has_reservaalojamiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_has_reservaalojamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vuelo`
--

DROP TABLE IF EXISTS `vuelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vuelo` (
  `idVuelo` int(11) NOT NULL AUTO_INCREMENT,
  `fechaSalida` date NOT NULL,
  `fechaLlegada` date NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `plazas` int(11) NOT NULL,
  `Ciudad_idCiudadOrigen` int(11) NOT NULL,
  `Ciudad_idCiudadDestino` int(11) NOT NULL,
  PRIMARY KEY (`idVuelo`),
  KEY `fk_Vuelo_Ciudad1_idx` (`Ciudad_idCiudadOrigen`),
  KEY `fk_Vuelo_Ciudad2_idx` (`Ciudad_idCiudadDestino`),
  CONSTRAINT `fk_Vuelo_Ciudad1` FOREIGN KEY (`Ciudad_idCiudadOrigen`) REFERENCES `ciudad` (`idCiudad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vuelo_Ciudad2` FOREIGN KEY (`Ciudad_idCiudadDestino`) REFERENCES `ciudad` (`idCiudad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuelo`
--

LOCK TABLES `vuelo` WRITE;
/*!40000 ALTER TABLE `vuelo` DISABLE KEYS */;
/*!40000 ALTER TABLE `vuelo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-15 19:57:29
