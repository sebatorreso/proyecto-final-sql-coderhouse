-- ***************************************************************
-- ********    ENTREGA FINAL PROYECTO SQL - CODERHOUSE   *********
-- *******************     TRIGGERS      *************************
-- ***************************************************************

-- Trigger: ControlarEliminacionEmpleado
-- Descripcion: Evita que se elimine un empleado que está actualmente asignado a un cargo activo en la tabla de CARGOS_ASIGNADOS

USE `gestion_rrhh` ;

DROP TRIGGER IF EXISTS ControlarEliminacionEmpleado;

DELIMITER //
CREATE TRIGGER ControlarEliminacionEmpleado
BEFORE DELETE ON EMPLEADOS
FOR EACH ROW
BEGIN
    IF EXISTS (
		SELECT 1 
        FROM CARGOS_ASIGNADOS 
        WHERE EMPLEADO_ID = OLD.EMPLEADO_ID AND FECHA_FIN = '9999-12-31') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede eliminar un empleado asignado a un cargo activo.';
    END IF;
END//
DELIMITER ;

-- Se inserta un nuevo empleado, SIN ASIGNARLE UN CARGO (Para luego ser eliminado)
INSERT INTO EMPLEADOS (NOMBRE_EMPLEADO, APELLIDO_EMPLEADO, FECHA_NAC, GENERO, EMAIL)
VALUES
	('ALBERTO','FERREIRA','1990-05-12','MASCULINO','ALBERTO@MAIL.COM');

-- Se consulta la tabla EMPLEADOS para verificar el registro anterior.
SELECT * FROM EMPLEADOS;

-- Se intenta eliminar al EMPLEADO_ID = 8, el cual ya tiene un cargo asignado.
DELETE FROM EMPLEADOS WHERE EMPLEADO_ID = 8;

-- Luego se intenta eliminar al EMPLEADO_ID = 18, quien no tiene cargo asignado (Se elimina) (corresponde a ALBERTO FERREIRA).
DELETE FROM EMPLEADOS WHERE EMPLEADO_ID = 18;



-- Trigger: ControlarEmpleadosMenoresEdad
-- Descripcion: Evita que se registren nuevos empleados menores de edad, generando un error si se intenta hacerlo.

DROP TRIGGER IF EXISTS ControlarEmpleadosMenoresEdad;

DELIMITER //
CREATE TRIGGER ControlarEmpleadosMenoresEdad
BEFORE INSERT ON EMPLEADOS
FOR EACH ROW
BEGIN
    DECLARE edad_empleado INT;
    
    SET edad_empleado = TIMESTAMPDIFF(YEAR, NEW.FECHA_NAC, CURDATE());
    
    IF edad_empleado < 18 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pueden registrar empleados menores de 18 años.';
    END IF;
END//
DELIMITER ;

-- Se ingresa un nuevo registro a la tabla EMPLEADOS, con edad mayor a 18 años.
INSERT INTO EMPLEADOS (NOMBRE_EMPLEADO, APELLIDO_EMPLEADO, FECHA_NAC, GENERO, EMAIL)
VALUES
	('CARLOS','MANDIOLA','2000-12-21','MASCULINO','CARLOS@MAIL.COM');
 
 -- Se intenta ingresar un nuevo registro a la tabla EMPLEADOS, con edad menor a 18 años.
INSERT INTO EMPLEADOS (NOMBRE_EMPLEADO, APELLIDO_EMPLEADO, FECHA_NAC, GENERO, EMAIL)
VALUES
	('IGNACIO','BASCUR','2010-12-21','MASCULINO','IGNACIO@MAIL.COM');