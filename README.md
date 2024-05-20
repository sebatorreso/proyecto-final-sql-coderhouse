# Proyecto CoderHouse
#### Sebastián Torres

### Problema:

Una empresa de tecnología con operación en varios países solicitó diseñar un sistema de gestión de recursos humanos.

La empresa necesita una base de datos robusta que le permita gestionar de manera eficiente información sobre:

1. **Empleados**: Se necesita que la base de datos permita registrar los datos personales de cada empleado, esto es nombre, apellido, fecha de nacimiento, género, email, entre otros.
2. **Departamentos**: También debe permitir contar con los registros correspondiente al departamento en el cual se desempeña el trabajador, el nombre del departamento, dónde se ubica, descripción, etc.
3. **Cargos**: Es fundamental que pueda registrar los cargos con los que cuenta la empresa, descripción, salarios y más.
4. **Salarios**: La base de datos debe poder registrar los salarios que ofrecerá la empresa de acuerdo al cargo y experiencia del empleado, la moneda en que se pagó, etc.
5. **País**: Se debe contar con los registros de los distintos paises en donde opera la empresa.



## Objetivo

Diseñar e implementar una base de datos relacional que mejore la eficiencia y la efectividad en la administración del capital humano de la organización.

La base de datos debe permitir gestionar datos, facilitar la recuperación y manipulación de información rápida, precisa y segura. Debe permitir a la organización tomar decisiones de manera informada, garantizar la integridad de los datos, adaptarse a cambios en la estructura o regulaciones, y optimizar el rendimiento del sistema para una experiencia de usuario óptima.

## Descripción de la Base de Datos - Sistema de Gestión para Recursos Humanos


1. **EMPLEADOS** (Tabla de Datos o Hechos):

Registra los empleados que pertenecen a la empresa, con todos sus datos personales.


2. **DEPARTAMENTOS** (Tabla Dimensional):

Contiene los registros de los distintos departamentos con los que funciona la empresa.


3. **CARGOS** (Tabla Dimensional):

Registra los diferentes cargos que aplican en la empresa, y el departamento al cual pertenece.


4. **SALARIOS** (Tabla Dimensional):

Contiene los diferentes salarios y el tipo de moneda que ofrece la organización.


5. **PAISES** (Tabla Dimensional):

Contiene los registros de los diferentes paises en donde opera la empresa.


6. **CARGOS_ASIGNADOS** (Tabla Intermedia):

Registra los cargos que han sido asignado a los empleados, junto con el salario acordado.

### Sistema Gestión de RRHH - Entidades y Atributos
Descripción de los tipos de datos

| Tabla             | Columna                | Tipo de Datos                         |
| -------------     | ---------------------- |                                  ---: |
| EMPLEADOS         | EMPLEADO_ID            | INT                                   |
|                   | NOMBRE_EMPLEADO        | VARCHAR(50) DEFAULT 'DESCONOCIDO'     |
|                   | APELLIDO_EMPLEADO      | VARCHAR(50) DEFAULT 'DESCONOCIDO'     |
|                   | FECHA_NAC              | DATE                                  |
|                   | GENERO                 | VARCHAR(50)                           |
|                   | EMAIL                  | VARCHAR(100) UNIQUE NOT NULL          |
| DEPARTAMENTOS     | DEPTO_ID               | INT                                   |
|                   | NOMBRE_DEPTO           | VARCHAR(100) NOT NULL                 |
|                   | DESCRIPCION_DEPTO      | VARCHAR(200)                          |
|                   | PAIS_ID                | INT                                   |
| CARGOS            | CARGO_ID               | INT                                   |
|                   | NOMBRE_CARGO           | VARCHAR(100) NOT NULL                 |
|                   | DESCRIPCION_CARGO      | VARCHAR(200)                          |
|                   | DEPTO_ID               | INT                                   |
| SALARIOS          | SALARIO_ID             | INT                                   |
|                   | MONTO_SALARIO          | DECIMAL(15,2)                         |
|                   | TIPO MONEDA            | VARCHAR(5) DEFAULT 'USD'              |
| PAISES            | PAIS_ID                | INT                                   |
|                   | NOMBRE_PAIS            | VARCHAR(50)                           |
|                   | DOMINIO_PAIS           | VARCHAR(10)                           |
| CARGOS_ASIGNADOS  | CASIG_ID               | INT                                   |
|                   | EMPLEADO_ID            | INT                                   |
|                   | CARGO_ID               | INT                                   |
|                   | SALARIO_ID             | INT                                   |
|                   | FECHA_INI              | DATE                                  |
|                   | FECHA_FIN              | DATE DEFAULT '9999-12-31'             |
|                   |                        |                                       |  

A continuación se detalla la documentación corresponidente a la **Segunda PreEntrega SQL**

# Segunda PreEntrega Proyecto SQL
## Documentación de Vistas

### Vista: EmpleadosPorGenero
**Descripción:** Proporciona una visión general de la distribución de empleados por género.

**Columnas:** 
* **Genero:** Género del empleado (Masculino o Femenino)
* **Cantidad_Empleados:** Número de empleados por género

### Vista: EmpleadosCargos
**Descripción:** Muestra a qué cargos están o han sido asignados los empleados, junto con el nombre y la descripción del cargo, salario y tipo moneda.

**Columnas:** 
* **Empleado_ID:** Identificación del empleado (número entero)
* **Nombre_Empleado:** Nombre del empleado
* **Apellido_Empleado:** Apellido paterno del empleado
* **Nombre_Cargo:** Cargo asignado al empleado
* **Descripcion_Cargo:** Descripción del cargo asignado al empleado
* **Monto_Salario:** Monto del salario asignado al empleado
* **Tipo_Moneda:** Tipo de moneda en el cual se encuentra el salario

### Vista: EmpleadosPorDepartamento
**Descripción:** Muestra la cantidad de empleados que trabajan en cada departamento.

**Columnas:**
* **Nombre_Depto:** Nombre de departamento en cuestión
* **Cantidad_Empleados:** Número de empleados que trabajan en el departamento

### Vista: ResumenDepartamentos
**Descripción:** Proporciona un resumen de cada departamento, incluyendo el nombre del departamento, descripción, país y número de empleados.

**Columnas:** 
* **Nombre_Depto:** Nombre del departamento en cuestión
* **Descripcion_Depto:** Descripción del departamento en cuestión
* **Nombre_Pais:** Nombre del país en dónde se ubica el departamento
* **Num_Empleados:** Número de empleados en cada departamento

### Vista: CargosSinAsignar
**Descripción:** Muestra los cargos que no han sido asignados a empleados.

**Columnas:** 
* **Nombre_Cargo:** Nombre del cargo que no ha sido asignado
* **Descripcion_Cargo:** Descripcion del cargo que no ha sido asignado


## Documentación de Funciones

### Función: salario_promedio_departamento
**Descripción:** Toma el ID de un departamento, y calcula el salario promedio de los empleados de ese departamento en específico.

**Parámetros:**
* **depto_id:** Identificador único del departamento

**Retorno:**
* Cálculo del salario promedio del departamento

**Ejemplo de uso:**

```sql
SELECT salario_promedio_departamento(8);
```

### Función: nombre_departamento_empleado
**Descripción:** Toma el ID de un empleado y devuelve el nombre del departamento al que está asignado actualmente.

**Parámetros:**
* **empleado_id:** Identificador único del empleado

**Retorno:**
* Devuelve el nombre y apellido del empleado, junto con el departamento en el cual se desempeña

**Ejemplo de uso:**

```sql
SELECT nombre_departamento_empleado(3);
```

## Documentación de Procedimientos Almacenados

### Procedimiento: EmpleadosPorDepartamento

**Descripción:** Devuelve una lista con los empleados que pertenecen a un departamento específico.

**Parámetros:**

* **p_depto_id:** Identificador único del departamento

**Retorno:**

* Devuelve una consulta con todos los empleados del departamento, una consulta en vacío si el departamento ingresado no existe.

**Ejemplo de uso:**

* Llamada al SP utilizando depto_id = 6 (Departamento de Investigación y Desarrollo).

```sql
CALL EmpleadosPorDepartamento(6);
```

### Procedimiento: BuscarEmpleadoPorID

**Descripción:** Busca a un empleado por su ID y retorna sus detalles, generando un error si no se encuentra.

**Parámetros:**

* **p_depto_id:** Identificador único del empleado

**Retorno:**

* Devuelve el registro del empleado con sus datos, o un mennsaje de error en caso de no existir el ID.

**Ejemplo de uso:**

* Llamada al SP haciendo uso de empleado_id = 8 (Correspondiente a Sebastián Torres)

```sql
CALL BuscarEmpleadoPorID(8);
```

## Documentación de Triggers

### Trigger: ControlarEliminacionEmpleado

**Descripción:** Evita que se elimine un empleado que está actualmente asignado a un cargo activo en la tabla de CARGOS_ASIGNADOS.

* **Tabla afectada:** EMPLEADOS
* **Acción:** DELETE

**Ejemplo de uso:**

* Se intenta eliminar al empleado_id = 8, quién ya tiene un cargo asignado, por lo tanto no es posible eliminarlo.
* Luego se intenta eliminar al empleado_id = 16 (agregado previamente), quién no tiene un cargo asignado, y por lo tanto, se elimina.

```sql
DELETE FROM EMPLEADOS WHERE EMPLEADO_ID = 16;
```

### Trigger: ControlarEmpleadosMenoresEdad

**Descripción:** Evita que se registren nuevos empleados menores de edad, generando un error si se intenta hacerlo.

* **Tabla afectada:** EMPLEADOS
* **Acción:** INSERT

**Ejemplo de uso:**

* Se intenta ingresar un nuevo registro a la tabla EMPLEADOS, con edad menor a 18 años. Envia error de código por ser menor de edad.

```sql
INSERT INTO EMPLEADOS (NOMBRE_EMPLEADO, APELLIDO_EMPLEADO, FECHA_NAC, GENERO, EMAIL)
VALUES
	('IGNACIO','BASCUR','2010-12-21','MASCULINO','IGNACIO@MAIL.COM');
```



