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
###### INDICO QUE VOY A TRABAJAR SOBRE LA NUEVA BBDD 
use BBDD_IDBootcamps;

#################### ALUMNOS ######################
-- creamos la tabla de alumnos
CREATE TABLE alumnos
(
    id_alumno INT NOT NULL AUTO_INCREMENT,
    nombre_alumno VARCHAR(50) NOT NULL,
    apellido_alumno VARCHAR(50) NOT NULL,
    id_direccion INT,
    PRIMARY KEY (id_alumno),
    FOREIGN KEY (id_direccion) REFERENCES direcciones(id_direccion)
);

-- modificamos la tabla alumnos y agregamos columnas
ALTER TABLE alumnos add email VARCHAR(50) default null; # añado email como una columna nueva
ALTER TABLE alumnos add fecha_ingreso DATE default null; # añado fecha ingreso como una columna nueva
ALTER TABLE alumnos add estado TINYINT default null; # añado estado si está activo como una columna nueva
ALTER TABLE alumnos add fecha_nacimiento DATE default null; # añado fecha nacimiento como una columna nueva

-- DROP TABLE alumnos; -- por si queremos eliminar la tabla de alumnos

#################### PROFESORES ######################
-- creamos la tabla de profesores
CREATE TABLE profesores
(
    id_profesor INT NOT NULL AUTO_INCREMENT,
    nombre_profesor VARCHAR(50) NOT NULL,
    apellido_profesor VARCHAR(50) NOT NULL,
    id_direccion INT,
    PRIMARY KEY (id_profesor),
    FOREIGN KEY (id_direccion) REFERENCES direcciones(id_direccion)
);

-- modificamos la tabla alumnos y agregamos columnas
ALTER TABLE profesores add email VARCHAR(50) default null; # añado email como una columna nueva
ALTER TABLE profesores add fecha_ingreso DATE default null; # añado fecha ingreso como una columna nueva
ALTER TABLE profesores add estado TINYINT default null; # añado estado si está activo como una columna nueva
ALTER TABLE alumnos add fecha_nacimiento DATE default null; # añado fecha nacimiento como una columna nueva
-- DROP TABLE profesores; -- por si necesitamos borrar la tabla

#################### PROGRAMAS bootcamps ######################
-- creamos la tabla de asignaturas
CREATE TABLE bootcamp
(
    id_bootcamp INT NOT NULL AUTO_INCREMENT,
    nombre_bootcamp VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_bootcamp)
);
ALTER TABLE bootcamp add fecha_edicion DATE default null; # añado fecha edicion como una columna nueva
ALTER TABLE bootcamp add estado TINYINT default null; # añado estado si está activo como una columna nueva
#################### ASIGNATURAS ######################
-- creamos la tabla de asignaturas
CREATE TABLE asignaturas
(
    id_asignatura INT NOT NULL AUTO_INCREMENT,
    nombre_asignatura VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_asignatura)
);
-- modificamos la tabla 
ALTER TABLE asignaturas ADD id_bootcamp INT NOT NULL; -- agrego nueva columna con id del bootcamp
ALTER TABLE asignaturas ADD FOREIGN KEY (id_bootcamp) REFERENCES bootcamp(id_bootcamp);

#################### RELACION ASIGNATURAS CON PROFESORES ######################
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
-- DROP TABLE asignaturas_profesores; -- por si tenemos que eliminar la tabla

#################### RELACION ASIGNATURAS CON ALUMNOS ######################
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
-- DROP TABLE alumnos_asignaturas; -- por si tenemos que eliminar la tabla

#################### EXAMENES ######################
-- CREAMOS LA TABLA DE EXAMENES que tiene una clave primaria y una clave foranea de asignatura y alumno
CREATE TABLE examenes
(
    id_examen INT NOT NULL AUTO_INCREMENT,
    id_alumno_asignatura INT NOT NULL,
    nombre_examen INT NOT NULL,
    PRIMARY KEY (id_examen),
    FOREIGN KEY (id_alumno_asignatura) REFERENCES alumnos_asignaturas(id_alumno_asignatura)
);
-- MODIFICAMOS LA TABLA
ALTER TABLE examenes add nota FLOAT NOT NULL; # añado nota del examen como una columna nueva
ALTER TABLE examenes add fecha DATE NOT NULL; # añado fecha del examen como una columna nueva
-- DROP TABLE examenes; -- por si tenemos que eliminar la tabla


#################### PAIS ######################
-- creamos la tabla de ciudades
CREATE TABLE paises
(
    id_pais INT NOT NULL AUTO_INCREMENT,
    nombre_pais VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_pais)
);

#################### CIUDADES ######################
-- creamos la tabla de ciudades
CREATE TABLE ciudades
(
    id_ciudad INT NOT NULL AUTO_INCREMENT,
    nombre_ciudad VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_ciudad)
);
-- modificamos la tabla 
ALTER TABLE ciudades ADD id_pais INT NOT NULL; -- agrego nueva columna con id del pais
ALTER TABLE ciudades ADD FOREIGN KEY (id_pais) REFERENCES paises(id_pais);

#################### DIRECCIONES ######################
-- creamos la tabla de direcciones
CREATE TABLE direcciones
(
    id_direccion INT NOT NULL AUTO_INCREMENT,
    calle VARCHAR(50) NOT NULL,
    numero INT NOT NULL,
    id_ciudad INT NOT NULL,
    PRIMARY KEY (id_direccion),
    FOREIGN KEY (id_ciudad) REFERENCES ciudades(id_ciudad)
);

-- MODIFICAMOS LA TABLA
ALTER TABLE direcciones add cod_postal INT default null; # añado CODIGO POSTAL A LA DIRECCION como una columna nueva

