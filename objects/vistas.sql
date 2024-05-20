-- ***************************************************************
-- ********   ENTREGA FINAL PROYECTO SQL - CODERHOUSE   **********
-- *******************       VISTAS     **************************
-- ***************************************************************

USE `gestion_rrhh` ;

-- 1) Vista EmpleadosPorGenero: Proprociona una visión general de la distribución de empleados por género
DROP VIEW IF EXISTS EmpleadosPorGenero;
CREATE VIEW EmpleadosPorGenero AS
	(
		SELECT
			GENERO,
            COUNT(*) AS CANTIDAD_EMPLEADOS
            FROM EMPLEADOS
            GROUP BY GENERO
    );

-- LLAMADA A VISTA EmpleadosPorGenero
	SELECT * FROM EmpleadosPorGenero;


-- 2) Vista EmpleadosCargos: Muestra a qué cargos están o han sido asignados los empleados, junto con el nombre y la descripción del cargo, salario y tipo moneda.
DROP VIEW IF EXISTS EmpleadosCargos;
CREATE VIEW EmpleadosCargos AS
	(
		SELECT
			E.EMPLEADO_ID,
			E.NOMBRE_EMPLEADO,
			E.APELLIDO_EMPLEADO,
			C.NOMBRE_CARGO,
			S.MONTO_SALARIO,
			S.TIPO_MONEDA
		FROM
			EMPLEADOS AS E
		JOIN
			CARGOS_ASIGNADOS AS CA 
			ON E.EMPLEADO_ID = CA.EMPLEADO_ID
		JOIN
			CARGOS AS C
			ON CA.CARGO_ID = C.CARGO_ID
		JOIN
			SALARIOS AS S
			ON CA.SALARIO_ID = S.SALARIO_ID
		ORDER BY EMPLEADO_ID ASC
	);
        
-- LLAMADA A VISTA EmpleadosCargos
	SELECT * FROM EmpleadosCargos;
    

-- 3) Vista EmpleadosPorDepartamento: Muestra la cantidad de empleados que trabajan en cada departamento
DROP VIEW IF EXISTS EmpleadosPorDepartamento;
CREATE VIEW EmpleadosPorDepartamento AS
	(
		SELECT
			D.NOMBRE_DEPTO,
            COUNT(E.EMPLEADO_ID) AS CANTIDAD_EMPLEADOS
		FROM
			DEPARTAMENTOS AS D
		LEFT JOIN
			CARGOS AS C 
            ON D.DEPTO_ID = C.DEPTO_ID
		LEFT JOIN
			CARGOS_ASIGNADOS AS CA
            ON C.CARGO_ID = CA.CARGO_ID
		LEFT JOIN EMPLEADOS AS E
			ON CA.EMPLEADO_ID = E.EMPLEADO_ID
		GROUP BY D.NOMBRE_DEPTO
    );

-- LLAMADA A VISTA EmpleadosPorDepartamento
	SELECT * FROM EmpleadosPorDepartamento;
    
    
-- 4) Vista ResumenDepartamentos: Proporciona un resumen de los departamentos, incluyendo el nombre del departamento, descripción, país y número de empleados
DROP VIEW IF EXISTS ResumenDepartamentos;
CREATE VIEW ResumenDepartamentos AS
		(
			SELECT
				D.NOMBRE_DEPTO,
				D.DESCRIPCION_DEPTO,
				P.NOMBRE_PAIS,
				COUNT(E.EMPLEADO_ID) AS NUM_EMPLEADOS
			FROM
				DEPARTAMENTOS AS D
			JOIN
				PAISES AS P
				ON D.PAIS_ID = P.PAIS_ID
			LEFT JOIN
				CARGOS AS C
				ON D.DEPTO_ID = C.DEPTO_ID
			LEFT JOIN
				CARGOS_ASIGNADOS AS CA 
				ON C.CARGO_ID = CA.CARGO_ID
			LEFT JOIN
				EMPLEADOS AS E
				ON CA.EMPLEADO_ID = E.EMPLEADO_ID
			GROUP BY D.DEPTO_ID
        );
        
-- LLAMADA A VISTA EmpleadosCargos
	SELECT * FROM ResumenDepartamentos;
    
    
-- 5) Vista CargosSinAsignar: Muestra los cargos que no han sido asignados a empleados.
DROP VIEW IF EXISTS CargosSinAsignar;
CREATE VIEW CargosSinAsignar AS
	(
		SELECT 
			C.NOMBRE_CARGO,
            C.DESCRIPCION_CARGO
		FROM
			CARGOS AS C
		LEFT JOIN CARGOS_ASIGNADOS AS CA
			ON C.CARGO_ID = CA.CARGO_ID
		WHERE CA.CASIG_ID IS NULL
    );
    
-- LLAMADA A VISTA CargosSinAsignar
	SELECT * FROM CargosSinAsignar;