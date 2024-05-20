<center>
<img src="https://objetivo.news/download/multimedia.normal.bcba10cea1861629.Y29kZXJob3VzZS1xdWUtZXMtcXVlLWhhY2VuX25vcm1hbC53ZWJw.webp" style="width: 100% ; aspect-ratio:16/9">
</center>

# <center>Entrega de Proyecto Final - SQL </center>
Estudiante : Sebastián Torres

Comisión : 53180

Tutores : Carla Palermo & Santiago González

Docente : Anderson Ocaña 

---

## Indice

 - [Temática del Proyecto](#temática-del-proyecto)
 - [Modelo de Negocio](#modelo-de-negocio)
 - [Diagrama Entidad-Relación](#diagrama-entidad-relación)
 - [Listado de Tablas y Descripción](#listado-de-tablas-y-descripción)
 - [Ingesta de Datos](#ingesta-de-datos)
 - [Objetos de la Base de Datos](#objetos-de-la-base-de-datos)
   - [Documentación de Vistas](#documentación-de-vistas)
   - [Documentación de Funciones](#documentación-de-funciones)
   - [Documentación de Procedimientos Almacenados](#documentación-de-procedimientos-almacenados)
   - [Documentación de Triggers](#documentación-de-triggers)
   - [Roles, Permisos y Usuarios](#roles-permisos-y-usuarios)
 - [Backup de la Base de Datos](#backup-de-la-base-de-datos)
 - [Herramientas y Tecnologías Usadas](#herramientas-y-tecnologías-usadas)
 - [Instrucciones para Levantar el Proyecto en CodeSpaces GitHub](#instrucciones-para-levantar-el-proyecto-en-codespaces-github)
 - [Formato de Entrega](#formato-de-entrega)

---

## Temática del Proyecto:

Una empresa de tecnología con operación en varios países solicitó diseñar un sistema de gestión de recursos humanos.

La base de datos debe permitir gestionar datos, facilitar la recuperación y manipulación de información rápida, precisa y segura. Debe permitir a la organización tomar decisiones de manera informada, garantizar la integridad de los datos, adaptarse a cambios en la estructura o regulaciones, y optimizar el rendimiento del sistema para una experiencia de usuario óptima.

### Objetivo

Diseñar e implementar una base de datos relacional que mejore la eficiencia y la efectividad en la administración del capital humano de la organización.

---

## Modelo de Negocio

La empresa necesita una base de datos robusta que le permita gestionar de manera eficiente información sobre:

1. **Empleados**: Se necesita que la base de datos permita registrar los datos personales de cada empleado, esto es nombre, apellido, fecha de nacimiento, género, email, entre otros.
2. **Departamentos**: También debe permitir contar con los registros correspondiente al departamento en el cual se desempeña el trabajador, el nombre del departamento, dónde se ubica, descripción, etc.
3. **Cargos**: Es fundamental que pueda registrar los cargos con los que cuenta la empresa, descripción, salarios y más.
4. **Salarios**: La base de datos debe poder registrar los salarios que ofrecerá la empresa de acuerdo al cargo y experiencia del empleado, la moneda en que se pagó, etc.
5. **País**: Se debe contar con los registros de los distintos paises en donde opera la empresa.

---

## Diagrama Entidad-Relación

[![Diagrama-ER.png](https://i.postimg.cc/kXXXD2n6/Diagrama-ER.png)](https://postimg.cc/G9V15hTd)

---

## Listado de Tablas y Descripción


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

---

### Tablas
Tablas y descripción de tipos de datos

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

---

## Ingesta de Datos

La ingesta de datos se lleva a cabo a través del script **population.sql** ubicado en la carpeta **structure** del proyecto.

---

## Objetos de la Base de Datos

En la carpeta **objects** del proyecto se encuentran los objetos de la base de datos, estos son:
* vistas.sql
* funciones.sql
* procedures.sql
* triggers.sql
* roles_users.sql

--- 

### Documentación de Vistas

---

### Vista 1: EmpleadosPorGenero
**Descripción:** Proporciona una visión general de la distribución de empleados por género.

**Columnas:** 
* **Genero:** Género del empleado (Masculino o Femenino)
* **Cantidad_Empleados:** Número de empleados por género

### Vista 2: EmpleadosCargos
**Descripción:** Muestra a qué cargos están o han sido asignados los empleados, junto con el nombre y la descripción del cargo, salario y tipo moneda.

**Columnas:** 
* **Empleado_ID:** Identificación del empleado (número entero)
* **Nombre_Empleado:** Nombre del empleado
* **Apellido_Empleado:** Apellido paterno del empleado
* **Nombre_Cargo:** Cargo asignado al empleado
* **Descripcion_Cargo:** Descripción del cargo asignado al empleado
* **Monto_Salario:** Monto del salario asignado al empleado
* **Tipo_Moneda:** Tipo de moneda en el cual se encuentra el salario

### Vista 3: EmpleadosPorDepartamento
**Descripción:** Muestra la cantidad de empleados que trabajan en cada departamento.

**Columnas:**
* **Nombre_Depto:** Nombre de departamento en cuestión
* **Cantidad_Empleados:** Número de empleados que trabajan en el departamento

### Vista 4: ResumenDepartamentos
**Descripción:** Proporciona un resumen de cada departamento, incluyendo el nombre del departamento, descripción, país y número de empleados.

**Columnas:** 
* **Nombre_Depto:** Nombre del departamento en cuestión
* **Descripcion_Depto:** Descripción del departamento en cuestión
* **Nombre_Pais:** Nombre del país en dónde se ubica el departamento
* **Num_Empleados:** Número de empleados en cada departamento

### Vista 5: CargosSinAsignar
**Descripción:** Muestra los cargos que no han sido asignados a empleados.

**Columnas:** 
* **Nombre_Cargo:** Nombre del cargo que no ha sido asignado
* **Descripcion_Cargo:** Descripcion del cargo que no ha sido asignado

---

### Documentación de Funciones

---

### Función 1: salario_promedio_departamento
**Descripción:** Toma el ID de un departamento, y calcula el salario promedio de los empleados de ese departamento en específico.

**Parámetros:**
* **depto_id:** Identificador único del departamento

**Retorno:**
* Cálculo del salario promedio del departamento

**Ejemplo de uso:**

```sql
SELECT salario_promedio_departamento(8);
```

### Función 2: nombre_departamento_empleado
**Descripción:** Toma el ID de un empleado y devuelve el nombre del departamento al que está asignado actualmente.

**Parámetros:**
* **empleado_id:** Identificador único del empleado

**Retorno:**
* Devuelve el nombre y apellido del empleado, junto con el departamento en el cual se desempeña

**Ejemplo de uso:**

```sql
SELECT nombre_departamento_empleado(3);
```
---

### Documentación de Procedimientos Almacenados

---

### Procedimiento 1: EmpleadosPorDepartamento

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

### Procedimiento 2: BuscarEmpleadoPorID

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

### Procedimiento con Transacción: AddEmployeeAndAssignRole

**Descripción:** Este procedimiento asegurará que tanto la inserción del empleado como la asignación de su cargo se realicen de manera automática. Si alguna de las operaciones falla, toda la transacción se revertirá manteniendo la integridad de los datos.

**Parámetros:**

* **p_nombre_empleado:** Nombre del empleado a ingresar
* **p_apellido_empleado:** Apellido del empleado a ingresar
* **p_fecha_nac:** Fecha de nacimiento del empleado
* **p_genero_nac:** Género del empleado
* **p_email:** Email del empleado
* **p_cargo_id:** Identificador único del cargo del empleado
* **p_salario_id:** Identificador único del salario para el empleado
* **p_fecha_ini:** Fecha de inicio de contrato en el empleado

**Retorno:**

* Un error por mal ingreso en algunos de los parámetros devolverá el mensaje **'Error: Transacción fallida'**
* En caso contrario, hará el ingreso correcto del nuevo empleado y sus datos a las tablas **EMPLEADOS** y **CARGOS_ASIGNADOS**

**Ejemplo de uso:**

* Ejemplo 1: Error: Transacción fallida.

```sql
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
```

* Ejemplo 2: Se ingresan los datos del empleado.

```sql
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
```
  
---

### Documentación de Triggers

---

### Trigger 1: ControlarEliminacionEmpleado

**Descripción:** Evita que se elimine un empleado que está actualmente asignado a un cargo activo en la tabla de CARGOS_ASIGNADOS.

* **Tabla afectada:** EMPLEADOS
* **Acción:** DELETE

**Ejemplo de uso:**

* Se intenta eliminar al empleado_id = 8, quién ya tiene un cargo asignado, por lo tanto no es posible eliminarlo.
* Luego se intenta eliminar al empleado_id = 16 (agregado previamente), quién no tiene un cargo asignado, y por lo tanto, se elimina.

```sql
DELETE FROM EMPLEADOS WHERE EMPLEADO_ID = 16;
```

### Trigger 2: ControlarEmpleadosMenoresEdad

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

---

## Roles, Permisos y Usuarios

El script de creación de usuarios, roles y permisos se encuentra bajo el nombre de **role_users.sql** en la carpeta **objects** del proyecto.

Se generaron los siguientes roles:

1. `role_crud_rrhh`: Tiene permiso para CRUD en toda las tablas de la Base de Datos.
2. `role_select_vistas`: Tiene permiso para hacer consultas de lectura en las tablas de la Base de Datos.
3. `role_insert_update_delete`: Tiene permiso para Insertar, Actualizar y Eliminar registros en las tablas de la Base de Datos.

Se crearon los siguientes usuarios:

1. `sebastian@localhost`: A quien se le asigna el **role_crud_rrhh**
2. `alejandra@localhost`: A quien se le asignan los roles **role_select_vistas** y **role_insert_update_delete**
3. `ignacio@localhost`: A quien se le asigna el rol **role_select_vistas**

---

## Backup de la Base de Datos

El backup o respaldo de la base de datos **gestion_rrhh** contiene la estructura y la data involucrada, asi como también los procedimientos, funciones y triggers (objetos).
Es del tipo Self-Contained File.

El script se encuentra en la carpeta *backup* bajo el nombre de *gestion_rrhh-20240519.sql*

---

[<- volver al índice](#indice)

---

## Herramientas y Tecnologías Usadas
* MySQL (motor de bases de datos, version 8.0.36)
* MySQL Workbench (interfaz gráfica, version 8.0.36)
* Visual Studio Code (para desarrollar el documento README.md)
* Google Drive y Zoom (para ver el contenido de las clases)
* https://mockaroo.com/ (para generar datos ficticios)
* https://www.tablesgenerator.com/ (para transformar tablas de formato csv a markdown)
* Makefile (para generar una interfaz sencilla de procesos)
* Docker (para generar un container)
* GitHub (para entregar el proyecto)

---

[<- volver al índice](#indice)

---


## Instrucciones para Levantar el Proyecto en CodeSpaces GitHub

* env : archivo con contraseñas y data secretas
* Makefile : abstracción de creacción del proyecto
* docker-compose.yml : permite generar las bases de datos en forma de contenedores

### Pasos para arrancar el proyecto

* En la terminal de linux escribir :
    - `make` _si da un error de que no conexion al socket, volver al correr el comando `make`_
    - `make clean-db` limpia la base de datos
    - `make test-db` para observar los datos de cada tabla
    - `make backup-db` para realizar un backup de la base de datos
    - `make access-db` para acceder a la base de datos

---

[<- volver al índice](#indice)

---

## Formato de Entrega 

El Proyecto Final de SQL se entregará como repositorio de GitHub, al cual se podrá acceder mediante el siguiente link:

**https://github.com/sebatorreso/proyecto-final-sql-coderhouse**

