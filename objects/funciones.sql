-- ***************************************************************
-- ******** ENTREGA FINAL PROYECTO SQL - CODERHOUSE **************
-- *********************    FUNCIONES    *************************
-- ***************************************************************

-- Función: salario_promedio_departamento
-- Descripción: Calcula el salario promedio de los empleados de un departamento específico.

USE `gestion_rrhh` ;

DROP FUNCTION IF EXISTS salario_promedio_departamento;

DELIMITER //
CREATE FUNCTION salario_promedio_departamento(depto_id INT)
RETURNS VARCHAR(100)
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
END //
DELIMITER ;

-- Llamada a la función DEPTO_ID = 2 (DEPARTAMENTO DE MARKETING Y VENTAS)
SELECT salario_promedio_departamento(8);


-- Función: nombre_departamento_empleado
-- Descripción: Toma el ID de un empleado y devuelve el nombre del departamento al que está asignado actualmente

DROP FUNCTION IF EXISTS nombre_departamento_empleado;

DELIMITER //
CREATE FUNCTION nombre_departamento_empleado(empleado_id INT)
RETURNS VARCHAR(100)
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
END //
DELIMITER ;

-- Llamada a la función EMPLEADO_ID = 3 (Andrea Bascur)
SELECT nombre_departamento_empleado(3);

