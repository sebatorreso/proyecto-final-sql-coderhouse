-- ***************************************************************
-- ******** ENTREGA FINAL PROYECTO SQL - CODERHOUSE **************
-- ********      STORED PROCEDURES & TRANSACCIONES      **********
-- ***************************************************************

-- Procedure: EmpleadosPorDepartamento
-- Descripción: Devuelve una lista de empleados que pertenecen a un departamento específico.

USE `gestion_rrhh` ;

DROP PROCEDURE IF EXISTS EmpleadosPorDepartamento;	
		
DELIMITER //
CREATE PROCEDURE EmpleadosPorDepartamento( IN p_depto_id INT )
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
END//
DELIMITER ;

-- Llamada al SP utilizando DEPTO_ID = 6 (Departamento de Investigación y Desarrollo).
CALL EmpleadosPorDepartamento(6);



-- Procedure: BuscarEmpleadoPorID
-- Descripción: Busca un empleado por su ID y retorna sus detalles, generando un error si no se encuentra.

DROP PROCEDURE IF EXISTS BuscarEmpleadoPorID;	
	
DELIMITER //
CREATE PROCEDURE BuscarEmpleadoPorID( IN p_empleado_id INT )
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
END//
DELIMITER ;

-- Llamada al SP haciendo uso de EMPLEADO_ID = 8 (Correspondiente a Sebastián Torres)
CALL BuscarEmpleadoPorID(8);


-- PROCEDIMIENTO CON TRANSACCIÓN (TCL)

-- Procedure: AddEmployeeAndAssignRole
-- Descripción: Este procedimiento asegurará que tanto en la inserción del empleado como la asignación de su cargo
-- 				se realicen de manera automática. Si alguna de las operaciones falla, toda la transacción se revertira
-- 				manteniendo la integridad de los datos.

DROP PROCEDURE IF EXISTS AddEmployeeAndAssignRole;	

DELIMITER //
CREATE PROCEDURE AddEmployeeAndAssignRole(
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
END //
DELIMITER ;

-- Llamada al Procedimiento con Transacción: Error por mal ingreso de parametro p_salario_id = 1500
CALL AddEmployeeAndAssignRole(
	'ANTONIO',
    'SANDOVAL',
    '1990-11-11',
    'MASCULINO',
    'ANTONIO@MAIL.COM',
    7,
    1500,
    '2017-05-01'
	);

-- Llamada al Procedimiento con Transacción: El ingreso de parámetros se hace correctamente
CALL AddEmployeeAndAssignRole(
	'ANTONIO',
    'SANDOVAL',
    '1990-11-11',
    'MASCULINO',
    'ANTONIO@MAIL.COM',
    7,
    7,
    '2017-05-01'
	);
    
    