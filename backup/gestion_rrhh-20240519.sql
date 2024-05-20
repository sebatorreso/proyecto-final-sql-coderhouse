CREATE DATABASE  IF NOT EXISTS `gestion_rrhh` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gestion_rrhh`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: gestion_rrhh
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cargos`
--

DROP TABLE IF EXISTS `cargos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargos` (
  `CARGO_ID` int NOT NULL AUTO_INCREMENT,
  `NOMBRE_CARGO` varchar(100) NOT NULL,
  `DESCRIPCION_CARGO` varchar(200) DEFAULT NULL,
  `DEPTO_ID` int DEFAULT NULL,
  PRIMARY KEY (`CARGO_ID`),
  KEY `FK_DEPTO_CARGO` (`DEPTO_ID`),
  CONSTRAINT `FK_DEPTO_CARGO` FOREIGN KEY (`DEPTO_ID`) REFERENCES `departamentos` (`DEPTO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargos`
--

LOCK TABLES `cargos` WRITE;
/*!40000 ALTER TABLE `cargos` DISABLE KEYS */;
INSERT INTO `cargos` VALUES (1,'CEO EJECUTIVO','Liderazgo, estrategia, toma de decisiones',6),(2,'CEO FINANCIERO','Finanzas, presupuesto, inversion, contabilidad',1),(3,'CEO TECNOLOGIA','Innovacion, tecnologia, desarrollo, estrategia',4),(4,'INGENIERO OPERACIONES','Eficiencia, operaciones, logistica, gestion',3),(5,'DIRECTOR DE MARKETING','Promocion, marca, estrategia, publicidad',2),(6,'GERENTE RRHH','Personal, contratacion, desarrollo, cultura',5),(7,'PROJECT MANAGER','Planificacion, coordinacion, seguimiento, entrega',6),(8,'SALES MANAGER','Estrategia, clientes, negociacion, ventas',2),(9,'ADMINISTRADOR TI','Redes, sistemas, seguridad, soporte',4),(10,'CONSEJERO LEGAL','Leyes, regulaciones, contratos, asesoramiento',8);
/*!40000 ALTER TABLE `cargos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargos_asignados`
--

DROP TABLE IF EXISTS `cargos_asignados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargos_asignados` (
  `CASIG_ID` int NOT NULL AUTO_INCREMENT,
  `EMPLEADO_ID` int DEFAULT NULL,
  `CARGO_ID` int DEFAULT NULL,
  `SALARIO_ID` int DEFAULT NULL,
  `FECHA_INI` date DEFAULT NULL,
  `FECHA_FIN` date DEFAULT '9999-12-31',
  PRIMARY KEY (`CASIG_ID`),
  KEY `FK_CASIG_EMPLEADO` (`EMPLEADO_ID`),
  KEY `FK_CASIG_CARGO` (`CARGO_ID`),
  KEY `FK_CASIG_SALARIO` (`SALARIO_ID`),
  CONSTRAINT `FK_CASIG_CARGO` FOREIGN KEY (`CARGO_ID`) REFERENCES `cargos` (`CARGO_ID`),
  CONSTRAINT `FK_CASIG_EMPLEADO` FOREIGN KEY (`EMPLEADO_ID`) REFERENCES `empleados` (`EMPLEADO_ID`),
  CONSTRAINT `FK_CASIG_SALARIO` FOREIGN KEY (`SALARIO_ID`) REFERENCES `salarios` (`SALARIO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registra los cargos que han sido asginado a los empleados';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargos_asignados`
--

LOCK TABLES `cargos_asignados` WRITE;
/*!40000 ALTER TABLE `cargos_asignados` DISABLE KEYS */;
INSERT INTO `cargos_asignados` VALUES (1,1,8,8,'2017-03-03','9999-12-31'),(2,2,5,6,'2018-09-10','9999-12-31'),(3,8,7,5,'2017-04-05','9999-12-31'),(4,9,7,5,'2017-04-05','9999-12-31'),(5,10,7,5,'2017-04-05','9999-12-31'),(6,15,9,3,'2017-04-05','9999-12-31'),(7,3,6,2,'2017-04-05','9999-12-31'),(8,11,3,3,'2018-09-10','9999-12-31'),(9,12,10,8,'2018-09-10','9999-12-31'),(10,14,8,6,'2018-06-06','9999-12-31'),(11,4,7,5,'2018-04-05','9999-12-31'),(12,5,7,5,'2018-03-06','9999-12-31'),(13,6,3,2,'2018-03-10','9999-12-31'),(14,7,2,3,'2018-03-10','9999-12-31'),(15,13,3,2,'2018-04-05','9999-12-31'),(17,17,7,7,'2017-05-01','9999-12-31');
/*!40000 ALTER TABLE `cargos_asignados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cargossinasignar`
--

DROP TABLE IF EXISTS `cargossinasignar`;
/*!50001 DROP VIEW IF EXISTS `cargossinasignar`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cargossinasignar` AS SELECT 
 1 AS `NOMBRE_CARGO`,
 1 AS `DESCRIPCION_CARGO`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `DEPTO_ID` int NOT NULL AUTO_INCREMENT,
  `NOMBRE_DEPTO` varchar(100) NOT NULL,
  `DESCRIPCION_DEPTO` varchar(200) DEFAULT NULL,
  `PAIS_ID` int DEFAULT NULL,
  PRIMARY KEY (`DEPTO_ID`),
  KEY `FK_DEPTO_PAIS` (`PAIS_ID`),
  CONSTRAINT `FK_DEPTO_PAIS` FOREIGN KEY (`PAIS_ID`) REFERENCES `paises` (`PAIS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'FINANZAS','ENCARGADO FINANZAS',1),(2,'MARKETING Y VENTAS','ENCARGADO MARKETING Y VENTAS',1),(3,'OPERACIONES','ENCARGADO OPERACIONES',2),(4,'TI','ENCARGADO TI',1),(5,'RECURSOS HUMANOS','ENCARGADO RECURSOS HUMANOS',3),(6,'INVESTIGACION Y DESARROLLO','ENCARGADO INNOVACION',1),(7,'PROCESOS INDUSTRIALES','ENCARGADO PROCESOS INDUSTRIALES',2),(8,'LEGAL','ENCARGADO LEGAL',5);
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `EMPLEADO_ID` int NOT NULL AUTO_INCREMENT,
  `NOMBRE_EMPLEADO` varchar(50) DEFAULT 'DESCONOCIDO',
  `APELLIDO_EMPLEADO` varchar(50) DEFAULT 'DESCONOCIDO',
  `FECHA_NAC` date DEFAULT NULL,
  `GENERO` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(100) NOT NULL,
  PRIMARY KEY (`EMPLEADO_ID`),
  UNIQUE KEY `EMAIL` (`EMAIL`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'ERNESTO','BONUCCI','1991-12-11','MASCULINO','ERNESTO@MAIL.COM'),(2,'PAULO','PARRA','1992-08-07','MASCULINO','PAULO@MAIL.COM'),(3,'ANDREA','BASCUR','1985-12-20','FEMENINO','ANDREA@MAIL.COM'),(4,'NATALY','TORRES','1995-03-12','FEMENINO','NATALY@MAIL.COM'),(5,'MARTINA','QUIROGA','1988-12-24','FEMENINO','MARTINA@MAIL.COM'),(6,'CAMILO','GONZALEZ','1993-11-10','MASCULINO','CAMILO@MAIL.COM'),(7,'KAREN','ARAYA','1988-04-06','FEMENINO','KAREN@MAIL.COM'),(8,'SEBASTIAN','TORRES','1989-07-13','MASCULINO','SEBASTIAN@MAIL.COM'),(9,'CESAR','HIDALGO','1990-09-24','MASCULINO','CESAR@MAIL.COM'),(10,'VALENTIN','MOSQUERA','1991-11-24','MASCULINO','VALENTIN@MAIL.COM'),(11,'CLAUDIO','OPAZO','1990-08-08','MASCULINO','CLAUDIO@MAIL.COM'),(12,'ANDRES','INIESTA','1991-04-03','MASCULINO','ANDRES@MAIL.COM'),(13,'JAVIER','MASCHERANO','1987-02-17','MASCULINO','JAVIER@MAIL.COM'),(14,'MARCELO','SALAS','1990-11-11','MASCULINO','MARCELO@MAIL.COM'),(15,'ALEXIS','VIDAL','1993-05-12','MASCULINO','ALEXIS@MAIL.COM'),(17,'ANTONIO','SANDOVAL','1990-11-11','MASCULINO','ANTONIO@MAIL.COM'),(19,'CARLOS','MANDIOLA','2000-12-21','MASCULINO','CARLOS@MAIL.COM');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ControlarEmpleadosMenoresEdad` BEFORE INSERT ON `empleados` FOR EACH ROW BEGIN
    DECLARE edad_empleado INT;
    
    SET edad_empleado = TIMESTAMPDIFF(YEAR, NEW.FECHA_NAC, CURDATE());
    
    IF edad_empleado < 18 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pueden registrar empleados menores de 18 años.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ControlarEliminacionEmpleado` BEFORE DELETE ON `empleados` FOR EACH ROW BEGIN
    IF EXISTS (
		SELECT 1 
        FROM CARGOS_ASIGNADOS 
        WHERE EMPLEADO_ID = OLD.EMPLEADO_ID AND FECHA_FIN = '9999-12-31') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede eliminar un empleado asignado a un cargo activo.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `empleadoscargos`
--

DROP TABLE IF EXISTS `empleadoscargos`;
/*!50001 DROP VIEW IF EXISTS `empleadoscargos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `empleadoscargos` AS SELECT 
 1 AS `EMPLEADO_ID`,
 1 AS `NOMBRE_EMPLEADO`,
 1 AS `APELLIDO_EMPLEADO`,
 1 AS `NOMBRE_CARGO`,
 1 AS `MONTO_SALARIO`,
 1 AS `TIPO_MONEDA`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `empleadospordepartamento`
--

DROP TABLE IF EXISTS `empleadospordepartamento`;
/*!50001 DROP VIEW IF EXISTS `empleadospordepartamento`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `empleadospordepartamento` AS SELECT 
 1 AS `NOMBRE_DEPTO`,
 1 AS `CANTIDAD_EMPLEADOS`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `empleadosporgenero`
--

DROP TABLE IF EXISTS `empleadosporgenero`;
/*!50001 DROP VIEW IF EXISTS `empleadosporgenero`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `empleadosporgenero` AS SELECT 
 1 AS `GENERO`,
 1 AS `CANTIDAD_EMPLEADOS`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paises` (
  `PAIS_ID` int NOT NULL AUTO_INCREMENT,
  `NOMBRE_PAIS` varchar(50) DEFAULT NULL,
  `DOMINIO_PAIS` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`PAIS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
INSERT INTO `paises` VALUES (1,'CHILE','CHI'),(2,'ARGENTINA','ARG'),(3,'COLOMBIA','COL'),(4,'PERU','PER'),(5,'BRASIL','BRA');
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `resumendepartamentos`
--

DROP TABLE IF EXISTS `resumendepartamentos`;
/*!50001 DROP VIEW IF EXISTS `resumendepartamentos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `resumendepartamentos` AS SELECT 
 1 AS `NOMBRE_DEPTO`,
 1 AS `DESCRIPCION_DEPTO`,
 1 AS `NOMBRE_PAIS`,
 1 AS `NUM_EMPLEADOS`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `salarios`
--

DROP TABLE IF EXISTS `salarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salarios` (
  `SALARIO_ID` int NOT NULL AUTO_INCREMENT,
  `MONTO_SALARIO` decimal(10,2) DEFAULT NULL,
  `TIPO_MONEDA` varchar(5) DEFAULT 'USD',
  PRIMARY KEY (`SALARIO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salarios`
--

LOCK TABLES `salarios` WRITE;
/*!40000 ALTER TABLE `salarios` DISABLE KEYS */;
INSERT INTO `salarios` VALUES (1,8000.00,'USD'),(2,7500.00,'USD'),(3,7000.00,'USD'),(4,6000.00,'USD'),(5,5000.00,'USD'),(6,4500.00,'USD'),(7,4000.00,'USD'),(8,3000.00,'USD'),(9,2500.00,'USD'),(10,2000.00,'USD'),(11,1500.00,'USD'),(12,1000.00,'USD');
/*!40000 ALTER TABLE `salarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'gestion_rrhh'
--

--
-- Dumping routines for database 'gestion_rrhh'
--
/*!50003 DROP FUNCTION IF EXISTS `nombre_departamento_empleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `nombre_departamento_empleado`(empleado_id INT) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE nombre_departamento VARCHAR(100);
    DECLARE nombre_empleado VARCHAR(100);

    -- Obtener el nombre del departamento del empleado
    SELECT D.NOMBRE_DEPTO INTO nombre_departamento
    FROM DEPARTAMENTOS AS D
    INNER JOIN CARGOS AS C
        ON D.DEPTO_ID = C.DEPTO_ID
    INNER JOIN CARGOS_ASIGNADOS AS CA
        ON C.CARGO_ID = CA.CARGO_ID
    WHERE CA.EMPLEADO_ID = empleado_id
    LIMIT 1;

    -- Obtener el nombre
    SELECT CONCAT(E.NOMBRE_EMPLEADO, ' ', E.APELLIDO_EMPLEADO) INTO nombre_empleado
    FROM EMPLEADOS AS E
    INNER JOIN CARGOS_ASIGNADOS AS CA
        ON E.EMPLEADO_ID = CA.EMPLEADO_ID
    INNER JOIN CARGOS AS C
        ON CA.CARGO_ID = C.CARGO_ID
    WHERE CA.EMPLEADO_ID = empleado_id
    LIMIT 1;
    
    RETURN CONCAT(nombre_empleado, ' - ', nombre_departamento);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `salario_promedio_departamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `salario_promedio_departamento`(depto_id INT) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE salario_promedio DECIMAL(15,2);

	-- Calcular el salario promedio del departamento
    SELECT
    AVG(S.MONTO_SALARIO) INTO salario_promedio
    FROM SALARIOS AS S
    INNER JOIN CARGOS_ASIGNADOS AS CA 
		ON S.SALARIO_ID = CA.SALARIO_ID
    INNER JOIN CARGOS AS C 
		ON CA.CARGO_ID = C.CARGO_ID
    WHERE C.DEPTO_ID = depto_id;

    RETURN CONCAT(salario_promedio);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddEmployeeAndAssignRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddEmployeeAndAssignRole`(
	IN p_nombre_empleado VARCHAR(50),
    IN p_apellido_empleado VARCHAR(50),
    IN p_fecha_nac DATE,
    IN p_genero VARCHAR(50),
    IN p_email VARCHAR(100),
    IN p_cargo_id INT,
    IN p_salario_id INT,
    IN p_fecha_ini DATE
)
BEGIN
	-- Declaración de variables
	DECLARE p_empleado_id INT;
     
	-- Manejador de errores
	DECLARE exit HANDLER FOR SQLEXCEPTION
    BEGIN
		-- Manejo de errores: deshacer la transacción
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Transacción fallida';
	END;
    
    -- Comenzar la transacción
    START TRANSACTION;
    
    -- Insertar nuevo empleado
    INSERT INTO EMPLEADOS (NOMBRE_EMPLEADO, APELLIDO_EMPLEADO, FECHA_NAC, GENERO, EMAIL)
    VALUES (p_nombre_empleado, p_apellido_empleado, p_fecha_nac, p_genero, p_email);
        
	-- Obtener el ID del empleado recién insertado
    SET p_empleado_id = LAST_INSERT_ID();
    
    -- Insertar en CARGOS_ASIGNADOS
    INSERT INTO CARGOS_aSIGNADOS (EMPLEADO_ID, CARGO_ID, SALARIO_ID, FECHA_INI)
    VALUES (p_empleado_id, p_cargo_id, p_salario_id, p_fecha_ini);
    
    -- Confirmar la transacción si todo salió bien
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuscarEmpleadoPorID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarEmpleadoPorID`( IN p_empleado_id INT )
BEGIN
    DECLARE v_existencia INT;
    
    SELECT COUNT(*) INTO v_existencia 
    FROM EMPLEADOS 
    WHERE EMPLEADO_ID = p_empleado_id;
    
    IF v_existencia = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se encontró ningún empleado con el ID especificado.';
    ELSE
        SELECT * 
        FROM EMPLEADOS 
        WHERE EMPLEADO_ID = p_empleado_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EmpleadosPorDepartamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EmpleadosPorDepartamento`( IN p_depto_id INT )
BEGIN
    SELECT E.*, D.NOMBRE_DEPTO
    FROM EMPLEADOS AS E
    INNER JOIN CARGOS_ASIGNADOS AS CA 
		ON E.EMPLEADO_ID = CA.EMPLEADO_ID
    INNER JOIN CARGOS AS C 
		ON CA.CARGO_ID = C.CARGO_ID
	INNER JOIN DEPARTAMENTOS AS D
		ON C.DEPTO_ID = D.DEPTO_ID
	WHERE D.DEPTO_ID = p_depto_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `cargossinasignar`
--

/*!50001 DROP VIEW IF EXISTS `cargossinasignar`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cargossinasignar` AS select `c`.`NOMBRE_CARGO` AS `NOMBRE_CARGO`,`c`.`DESCRIPCION_CARGO` AS `DESCRIPCION_CARGO` from (`cargos` `c` left join `cargos_asignados` `ca` on((`c`.`CARGO_ID` = `ca`.`CARGO_ID`))) where (`ca`.`CASIG_ID` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `empleadoscargos`
--

/*!50001 DROP VIEW IF EXISTS `empleadoscargos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `empleadoscargos` AS select `e`.`EMPLEADO_ID` AS `EMPLEADO_ID`,`e`.`NOMBRE_EMPLEADO` AS `NOMBRE_EMPLEADO`,`e`.`APELLIDO_EMPLEADO` AS `APELLIDO_EMPLEADO`,`c`.`NOMBRE_CARGO` AS `NOMBRE_CARGO`,`s`.`MONTO_SALARIO` AS `MONTO_SALARIO`,`s`.`TIPO_MONEDA` AS `TIPO_MONEDA` from (((`empleados` `e` join `cargos_asignados` `ca` on((`e`.`EMPLEADO_ID` = `ca`.`EMPLEADO_ID`))) join `cargos` `c` on((`ca`.`CARGO_ID` = `c`.`CARGO_ID`))) join `salarios` `s` on((`ca`.`SALARIO_ID` = `s`.`SALARIO_ID`))) order by `e`.`EMPLEADO_ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `empleadospordepartamento`
--

/*!50001 DROP VIEW IF EXISTS `empleadospordepartamento`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `empleadospordepartamento` AS select `d`.`NOMBRE_DEPTO` AS `NOMBRE_DEPTO`,count(`e`.`EMPLEADO_ID`) AS `CANTIDAD_EMPLEADOS` from (((`departamentos` `d` left join `cargos` `c` on((`d`.`DEPTO_ID` = `c`.`DEPTO_ID`))) left join `cargos_asignados` `ca` on((`c`.`CARGO_ID` = `ca`.`CARGO_ID`))) left join `empleados` `e` on((`ca`.`EMPLEADO_ID` = `e`.`EMPLEADO_ID`))) group by `d`.`NOMBRE_DEPTO` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `empleadosporgenero`
--

/*!50001 DROP VIEW IF EXISTS `empleadosporgenero`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `empleadosporgenero` AS select `empleados`.`GENERO` AS `GENERO`,count(0) AS `CANTIDAD_EMPLEADOS` from `empleados` group by `empleados`.`GENERO` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `resumendepartamentos`
--

/*!50001 DROP VIEW IF EXISTS `resumendepartamentos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `resumendepartamentos` AS select `d`.`NOMBRE_DEPTO` AS `NOMBRE_DEPTO`,`d`.`DESCRIPCION_DEPTO` AS `DESCRIPCION_DEPTO`,`p`.`NOMBRE_PAIS` AS `NOMBRE_PAIS`,count(`e`.`EMPLEADO_ID`) AS `NUM_EMPLEADOS` from ((((`departamentos` `d` join `paises` `p` on((`d`.`PAIS_ID` = `p`.`PAIS_ID`))) left join `cargos` `c` on((`d`.`DEPTO_ID` = `c`.`DEPTO_ID`))) left join `cargos_asignados` `ca` on((`c`.`CARGO_ID` = `ca`.`CARGO_ID`))) left join `empleados` `e` on((`ca`.`EMPLEADO_ID` = `e`.`EMPLEADO_ID`))) group by `d`.`DEPTO_ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-19 15:04:18
