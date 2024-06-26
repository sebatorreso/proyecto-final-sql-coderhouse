-- ENTREGA FINAL PROYECTO SQL - CODERHOUSE
-- CREACIÓN DE BASE DE DATOS - SISTEMA GESTIÓN DE RRHH

DROP DATABASE IF EXISTS gestion_rrhh;
CREATE DATABASE gestion_rrhh;

USE gestion_rrhh;

-- CREACIÓN DE TABLAS

CREATE TABLE EMPLEADOS(
	EMPLEADO_ID 		INT PRIMARY KEY AUTO_INCREMENT
,	NOMBRE_EMPLEADO		VARCHAR(50) DEFAULT 'DESCONOCIDO'
,	APELLIDO_EMPLEADO	VARCHAR(50) DEFAULT 'DESCONOCIDO'
,	FECHA_NAC			DATE
, 	GENERO				VARCHAR(50)
,	EMAIL 				VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE DEPARTAMENTOS(
	DEPTO_ID			INT PRIMARY KEY AUTO_INCREMENT
,	NOMBRE_DEPTO		VARCHAR(100) NOT NULL
,	DESCRIPCION_DEPTO	VARCHAR(200)
,	PAIS_ID				INT
);

CREATE TABLE CARGOS(
	CARGO_ID			INT PRIMARY KEY AUTO_INCREMENT
,	NOMBRE_CARGO		VARCHAR(100) NOT NULL
,	DESCRIPCION_CARGO	VARCHAR(200)
, 	DEPTO_ID			INT
);

CREATE TABLE CARGOS_ASIGNADOS (
	CASIG_ID			INT PRIMARY KEY AUTO_INCREMENT
,	EMPLEADO_ID			INT 
,   CARGO_ID			INT
, 	SALARIO_ID			INT
,	FECHA_INI			DATE
, 	FECHA_FIN			DATE DEFAULT '9999-12-31'
)
COMMENT 'Registra los cargos que han sido asginado a los empleados'
;

CREATE TABLE SALARIOS(
	SALARIO_ID			INT PRIMARY KEY AUTO_INCREMENT
,	MONTO_SALARIO		DECIMAL(10, 2)
,	TIPO_MONEDA			VARCHAR(5) DEFAULT 'USD'
);

CREATE TABLE PAISES (
	PAIS_ID				INT PRIMARY KEY AUTO_INCREMENT
,	NOMBRE_PAIS			VARCHAR(50)
,	DOMINIO_PAIS		VARCHAR(10)
)
;



-- CREACIÓN FOREIGN KEY
-- FK

 -- DEPARTAMENTOS
ALTER TABLE DEPARTAMENTOS
	ADD CONSTRAINT FK_DEPTO_PAIS
    FOREIGN KEY (PAIS_ID) REFERENCES PAISES(PAIS_ID);

-- CARGOS
ALTER TABLE CARGOS
	ADD CONSTRAINT FK_DEPTO_CARGO
    FOREIGN KEY (DEPTO_ID) REFERENCES DEPARTAMENTOS(DEPTO_ID);
    
-- CARGOS ASIGNADOS
ALTER TABLE CARGOS_ASIGNADOS
	ADD CONSTRAINT FK_CASIG_EMPLEADO
    FOREIGN KEY (EMPLEADO_ID) REFERENCES EMPLEADOS(EMPLEADO_ID);
    
ALTER TABLE CARGOS_ASIGNADOS
	ADD CONSTRAINT FK_CASIG_CARGO
    FOREIGN KEY (CARGO_ID) REFERENCES CARGOS(CARGO_ID);
    
ALTER TABLE CARGOS_ASIGNADOS
	ADD CONSTRAINT FK_CASIG_SALARIO
    FOREIGN KEY (SALARIO_ID) REFERENCES SALARIOS(SALARIO_ID);


SELECT 
	*
FROM INFORMATION_SCHEMA.TABLES
WHERE table_schema = "gestion_rrhh";


-- CONSULTA DATOS IMPORTADOS A TABLAS DE BBDD
-- EL ORDEN DE EJECUCIÓN ES EL MISMO EN EL CUAL SE IMPORTARON

SELECT * FROM EMPLEADOS;
    
SELECT * FROM PAISES;
    
SELECT * FROM DEPARTAMENTOS;
    
SELECT * FROM SALARIOS;

SELECT * FROM CARGOS;

SELECT * FROM CARGOS_ASIGNADOS;




    
    





