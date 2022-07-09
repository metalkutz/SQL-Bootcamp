-- Creación BBDD
/* 
Crear un esquema de Base de Datos relacional que contenga información de alumnos, profesores, exámenes y asignaturas.
La relación es la siguiente: 
	Un alumno puede tener una o varias asignaturas
	La relación del profesor y el alumno es a través de las asignaturas, no directa
	La relación entre los examenes y los alumnos depende de la asignatura, no es directa.
	Un profesor puede dar clase en varias asignaturas y una asignatura puede tener varios profesores.
	Igual para los alumnos y las asignaturas.
	Los exámenes son ÚNICOS por asignatura. SOLO HAY UN EXAMEN PARA CADA ASIGNATURA y ALUMNO Y SOLO UNO.
	
	Extra: los datos sociodemográficos puede ser tablas separadas (fijate en sakila.city y sakila.addres)
*/ 

-- Crear un esquema de Base de Datos relacional que contenga información de alumnos, profesores, exámenes y asignaturas.
CREATE DATABASE BBDD_IDBootcamps;
-- INDICO QUE VOY A TRABAJAR SOBRE LA NUEVA BBDD 
use BBDD_IDBootcamps;

-- ############ALUMNOS##############
-- creamos la tabla de alumnos
CREATE TABLE alumnos
(
    id_alumno INT NOT NULL AUTO_INCREMENT,
    nombre_alumno VARCHAR(50) NOT NULL,
    apellido_alumno VARCHAR(50) NOT NULL,
    id_direccion SMALLINT UNSIGNED,
    email VARCHAR(50) default null,
    fecha_ingreso DATE default null,
    fecha_nacimiento DATE default null,
    estado TINYINT default null,
    PRIMARY KEY (id_alumno),
    FOREIGN KEY (id_direccion) REFERENCES direcciones(id_direccion)
);

-- #############PROFESORES##############
-- creamos la tabla de profesores
CREATE TABLE profesores
(
    id_profesor INT NOT NULL AUTO_INCREMENT,
    nombre_profesor VARCHAR(50) NOT NULL,
    apellido_profesor VARCHAR(50) NOT NULL,
    id_direccion SMALLINT UNSIGNED,
    email VARCHAR(50) default null,
    fecha_ingreso DATE default null,
    fecha_nacimiento DATE default null,
    estado TINYINT default null,
    PRIMARY KEY (id_profesor),
    FOREIGN KEY (id_direccion) REFERENCES direcciones(id_direccion)
);

-- ############### PROGRAMAS bootcamps ###############
-- creamos la tabla de asignaturas
CREATE TABLE bootcamp
(
    id_bootcamp INT NOT NULL AUTO_INCREMENT,
    nombre_bootcamp VARCHAR(50) NOT NULL,
    fecha_edicion DATE default null,
    estado TINYINT default null,
    PRIMARY KEY (id_bootcamp)
);

-- #################### ASIGNATURAS ######################
-- creamos la tabla de asignaturas
CREATE TABLE asignaturas
(
    id_asignatura INT NOT NULL AUTO_INCREMENT,
    nombre_asignatura VARCHAR(50) NOT NULL,
    id_bootcamp INT NOT NULL,
    PRIMARY KEY (id_asignatura),
    FOREIGN KEY (id_bootcamp) REFERENCES bootcamp(id_bootcamp)
);

-- #################### RELACION ASIGNATURAS CON PROFESORES ######################
-- CREAMOS LA TABLA DE ASIGNATURAS_PROFESORES que relaciona las tablas profesores y asignaturas
CREATE TABLE asignaturas_profesores
(
    id_asigntatura_profesor INT NOT NULL AUTO_INCREMENT,
    id_profesor INT NOT NULL,
    id_asignatura INT NOT NULL,
    PRIMARY KEY (id_asigntatura_profesor),
    FOREIGN KEY (id_profesor) REFERENCES profesores(id_profesor),
    FOREIGN KEY (id_asignatura) REFERENCES asignaturas(id_asignatura)
);

-- #################### RELACION ASIGNATURAS CON ALUMNOS ######################
-- creamos la tabla de alumnos_asignaturas que relaciona las tablas alumnos y asignaturas
CREATE TABLE alumnos_asignaturas
(
    id_alumno_asignatura INT NOT NULL AUTO_INCREMENT,
    id_alumno INT NOT NULL,
    id_asignatura INT NOT NULL,
    PRIMARY KEY (id_alumno_asignatura),
    FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno),
    FOREIGN KEY (id_asignatura) REFERENCES asignaturas(id_asignatura)
);

-- #################### EXAMENES ######################
-- CREAMOS LA TABLA DE EXAMENES que tiene una clave primaria y una clave foranea de asignatura y alumno
CREATE TABLE examenes
(
    id_examen INT NOT NULL AUTO_INCREMENT,
    id_alumno_asignatura INT NOT NULL,
    nombre_examen VARCHAR(50) NOT NULL,
	nota FLOAT NOT NULL,
    fecha DATE NOT NULL,
    PRIMARY KEY (id_examen),
    FOREIGN KEY (id_alumno_asignatura) REFERENCES alumnos_asignaturas(id_alumno_asignatura)
);

-- #################### PAIS ######################
-- creamos la tabla de paises
CREATE TABLE paises
(
    id_pais SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre_pais VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_pais)
);

-- #################### CIUDADES ######################
-- creamos la tabla de ciudades
CREATE TABLE ciudades
(
    id_ciudad SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre_ciudad VARCHAR(50) NOT NULL,
    id_pais SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (id_ciudad),
    FOREIGN KEY (id_pais) REFERENCES paises(id_pais)
);

-- #################### DIRECCIONES ######################
-- creamos la tabla de direcciones
CREATE TABLE direcciones
(
    id_direccion SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    calle VARCHAR(50) NOT NULL,
    barrio VARCHAR(50) default null,
    telefono VARCHAR(20) default null,
    cod_postal VARCHAR(10) default null,
    id_ciudad SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (id_direccion),
    FOREIGN KEY (id_ciudad) REFERENCES ciudades(id_ciudad)
);