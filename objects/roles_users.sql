-- ***************************************************************
-- *********** ENTREGA FINAL PROYECTO SQL - CODERHOUSE ***********
-- ***********           ROLES & PERMISOS             ************
-- ***************************************************************

USE `gestion_rrhh` ;

USE MySQL;

-- CREACIÓN DE USUARIOS Y PASSWORD
DROP USER IF EXISTS 'sebastian'@'localhost';
CREATE USER 'sebastian'@'localhost' IDENTIFIED BY 'coder1_1234';

DROP USER IF EXISTS 'ignacio'@'localhost';
CREATE USER 'ignacio'@'localhost' IDENTIFIED BY 'code2r_1234';

DROP USER IF EXISTS 'alejandra'@'localhost';
CREATE USER 'alejandra'@'localhost' IDENTIFIED BY 'coder3_1234'; 

-- CREACIÓN DE ROLES
DROP ROLE IF EXISTS role_crud_rrhh;
DROP ROLE IF EXISTS role_select_vistas;
DROP ROLE IF EXISTS role_insert_update_delete;

CREATE ROLE role_crud_rrhh;
CREATE ROLE role_select_vistas;
CREATE ROLE role_insert_update_delete;

-- ASIGNACIÓN DE PRIVILEGIOS AL ROL role_crud_rrhh
GRANT ALL PRIVILEGES ON gestion_rrhh.* TO role_crud_rrhh;

-- ASIGNACIÓN DE PRIVILEGIOS AL ROL role_select_vistas
GRANT SELECT ON gestion_rrhh.CARGOS TO role_select_vistas;
GRANT SELECT ON gestion_rrhh.CARGOS_ASIGNADOS TO role_select_vistas;
GRANT SELECT ON gestion_rrhh.DEPARTAMENTOS TO role_select_vistas;
GRANT SELECT ON gestion_rrhh.EMPLEADOS TO role_select_vistas;
GRANT SELECT ON gestion_rrhh.PAISES TO role_select_vistas;
GRANT SELECT ON gestion_rrhh.SALARIOS TO role_select_vistas;

-- ASIGNACIÓN DE PRIVILEGIOS AL ROL role_insert_update_delete
GRANT INSERT, UPDATE, DELETE ON gestion_rrhh.CARGOS TO role_insert_update_delete;
GRANT INSERT, UPDATE, DELETE ON gestion_rrhh.CARGOS_ASIGNADOS TO role_insert_update_delete;
GRANT INSERT, UPDATE, DELETE ON gestion_rrhh.DEPARTAMENTOS TO role_insert_update_delete;
GRANT INSERT, UPDATE, DELETE ON gestion_rrhh.EMPLEADOS TO role_insert_update_delete;
GRANT INSERT, UPDATE, DELETE ON gestion_rrhh.PAISES TO role_insert_update_delete;
GRANT INSERT, UPDATE, DELETE ON gestion_rrhh.SALARIOS TO role_insert_update_delete;

-- ASIGNACIÓN DE ROLES A USUARIOS
GRANT 'role_crud_rrhh' TO 'sebastian'@'localhost' ;

GRANT 'role_select_vistas' TO 'ignacio'@'localhost' ;

GRANT 'role_insert_update_delete' TO 'alejandra'@'localhost' ;
GRANT 'role_select_vistas' TO 'alejandra'@'localhost' ;

FLUSH PRIVILEGES ;






