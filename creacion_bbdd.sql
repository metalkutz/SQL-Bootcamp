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


-- creamos la tabla de alumnos

CREATE TABLE alumnos
(
    id_alumno INT NOT NULL AUTO_INCREMENT,
    nombre_alumno VARCHAR(50) NOT NULL,
    apellido_alumno VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_alumno)
);

-- creamos la tabla de profesores
CREATE TABLE profesores
(
    id_profesor INT NOT NULL AUTO_INCREMENT,
    nombre_profesor VARCHAR(50) NOT NULL,
    apellido_profesor VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_profesor)
);

-- creamos la tabla de asignaturas
CREATE TABLE asignaturas
(
    id_asignatura INT NOT NULL AUTO_INCREMENT,
    nombre_asignatura VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_asignatura)
);


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

-- CREAMOS LA TABLA DE EXAMENES que tiene una clave primaria y una clave foranea de asignatura y alumno
CREATE TABLE examenes
(
    id_examen INT NOT NULL AUTO_INCREMENT,
    id_alumno_asignatura INT NOT NULL,
    nombre_examen INT NOT NULL,
    PRIMARY KEY (id_examen),
    FOREIGN KEY (id_alumno_asignatura) REFERENCES alumnos(id_alumno_asignatura),
);

-- creamos la tabla de direcciones
CREATE TABLE direcciones
(
    id_direccion INT NOT NULL AUTO_INCREMENT,
    calle VARCHAR(50) NOT NULL,
    numero INT NOT NULL,
    id_ciudad INT NOT NULL,
    PRIMARY KEY (id_direccion)
    FOREIGN KEY (id_ciudad) REFERENCES ciudades(id_ciudad),
);

-- creamos la tabla de ciudades
CREATE TABLE ciudades
(
    id_ciudad INT NOT NULL AUTO_INCREMENT,
    nombre_ciudad VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_ciudad),
);