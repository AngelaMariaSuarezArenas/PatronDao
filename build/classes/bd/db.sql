/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  Angela
 * Created: 5/5/2023
 */
DROP DATABASE IF EXISTS recursosiud;

CREATE DATABASE IF NOT EXISTS recursosiud;-- crea la BBDD

USE recursosiud;-- selecciona la BBDD

/*
Creación de tablas
*/

CREATE TABLE tipos_identificacion(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    descripcion VARCHAR(250),
    PRIMARY KEY(id)
);

CREATE TABLE estados_civil(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    descripcion VARCHAR(250),
    PRIMARY KEY(id)
);

CREATE TABLE funcionarios(
    id INT NOT NULL AUTO_INCREMENT,
    numero_identificacion VARCHAR(120) NOT NULL,
    nombres VARCHAR(120) NOT NULL,
    apellidos VARCHAR(120) NOT NULL,
    sexo CHAR(2),
    direccion VARCHAR(255),
    telefono VARCHAR(255),
    fecha_nacimiento DATE,
    fecha_creacion DATETIME DEFAULT NOW(),
    fecha_actualizacion DATETIME DEFAULT NOW(),
    tipos_identificacion_id INT NOT NULL,
    estados_civil_id INT NOT NULL,
    PRIMARY KEY(id),
    UNIQUE(numero_identificacion),
    FOREIGN KEY(tipos_identificacion_id) REFERENCES tipos_identificacion(id),
    FOREIGN KEY(estados_civil_id) REFERENCES estados_civil(id) 
);

CREATE TABLE parentescos(
id INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(120) NOT NULL,
descripcion VARCHAR(120),
PRIMARY KEY(id)
);

CREATE TABLE grupo_familiares(
id INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(120) NOT NULL,
apellido VARCHAR(120) NOT NULL,
direccion VARCHAR(45) NOT NULL,
fecha_creacion DATETIME DEFAULT NOW(),
fecha_actualizacion DATETIME DEFAULT NOW(),
id_funcionarios INT NOT NULL,
id_parentescos INT NOT NULL,
PRIMARY KEY (id),
UNIQUE(nombre),
FOREIGN KEY(id_funcionarios) REFERENCES funcionarios(id),
FOREIGN KEY(id_parentescos) REFERENCES parentescos(id)
);

CREATE TABLE niveles_educativos(
id INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(120) NOT NULL,
descripcion VARCHAR(120),
PRIMARY KEY(id)
);

CREATE TABLE universidades(
id INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(120) NOT NULL,
descripcion VARCHAR(250),
fecha_creacion DATETIME DEFAULT NOW(),
fecha_actualizacion DATETIME DEFAULT NOW(),
PRIMARY KEY(id)
);

CREATE TABLE estados_formacion(
id INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(120) NOT NULL,
descripcion VARCHAR(250),
PRIMARY KEY(id)
);

CREATE TABLE formaciones_academicas(
id INT NOT NULL AUTO_INCREMENT,
fecha_inicio DATETIME DEFAULT NOW(),
fecha_creacion DATETIME DEFAULT NOW(),
id_niveles_educativos INT NOT NULL,
id_universidades INT NOT NULL,
id_estados_formacion INT NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY(id_niveles_educativos)REFERENCES niveles_educativos(id),
FOREIGN KEY(id_universidades)REFERENCES universidades(id),
FOREIGN KEY(id_estados_formacion)REFERENCES estados_formacion(id)
);

/*
POPULATION (llenado) DE TABLAS
*/
-- llenado tabla tipos de identificación
INSERT INTO tipos_identificacion(nombre,descripcion) 
VALUES ('CC', 'Cédula de ciudadanía');
INSERT INTO tipos_identificacion(nombre,descripcion) 
VALUES ('TI', 'Tarjeta de identidad');
INSERT INTO tipos_identificacion(nombre,descripcion) 
VALUES ('CE', 'Tarjeta de extranjería');
INSERT INTO tipos_identificacion(nombre,descripcion) 
VALUES ('PS', 'Pasaporte');
INSERT INTO tipos_identificacion(nombre,descripcion) 
VALUES ('OT', 'Otro documento de identificación');

-- llenado tabla estados civiles
INSERT INTO estados_civil(nombre,descripcion) 
VALUES ('SOL', 'Solterito y a la orden');
INSERT INTO estados_civil(nombre,descripcion) 
VALUES ('CAS', 'Casado y no a la orden');
INSERT INTO estados_civil(nombre,descripcion) 
VALUES ('ULB', 'En Unión libre');
INSERT INTO estados_civil(nombre,descripcion) 
VALUES ('VAC', 'Vacilando con la muchacha de al lado');
INSERT INTO estados_civil(nombre,descripcion) 
VALUES ('OTR', 'Otro estado civil');

-- llenado de tabla funcionario: se hace por la APP de Java
INSERT INTO funcionarios(
    numero_identificacion,
    nombres,
    apellidos,
    sexo,
    direccion,
    telefono,
    fecha_nacimiento,
    tipos_identificacion_id,
    estados_civil_id
)
VALUES ('111111', 'Perfectamente', 'Intuitiva', 'M', 'Calle 20',
'603522222', '1985-08-05', 1, 2);

-- DAO: Data Access Object