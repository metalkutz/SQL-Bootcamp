-- Llenado de tablas
/*
Una vez que has creado el schema, inventa valores y rellena las tablas con datos apropiados.
Trata de tener columnas suficientes para almacenar toda la información que podría ser relevante.
*/

-- ###### INDICO QUE VOY A TRABAJAR SOBRE LA NUEVA BBDD 
use BBDD_IDBootcamps;

-- PRIMERO LLENAMOS LAS TABLAS QUE NO TIENEN FK

-- ###### ALUMNOS   ######
INSERT INTO alumnos 
(nombre_alumno,apellido_alumno,email,fecha_ingreso,estado)
VALUES
('Alvaro','Ferrer','aferrer@idbootcamps.com','2022-05-09',1),
('Belen','Gutierrez','bgutierrez@idbootcamps.com','2022-05-09',1),
('Enrique','Bartolome', 'ebartolome@idbootcamps.com','2022-05-09',1),
('Juliana','???', 'juli@idbootcamps.com','2022-05-09',1),
('Stefani', 'Pereira', 'spereira@idbootcamps.com','2022-05-09',1),
('Benjamin', 'Kutz', 'bkutz@idbootcamps.com','2022-05-09',1),
('Marina', 'Casilda', 'mcasilda@idbootcamps.com','2022-02-01',0),
('Dani', 'Roldan', 'mcasilda@idbootcamps.com','2022-03-02',0),
('Santiago', 'Barrico', 'sbarrico@idbootcamps.com','2021-10-01',0)
;
INSERT INTO alumnos 
SET 
nombre_alumno='Ana',
apellido_alumno='Diaz',
email='adiaz@idbootcamps.com',
fecha_ingreso='2022-02-01',
estado=0;

-- ###### PROFESORES   ######
INSERT INTO profesores 
(nombre_profesor,apellido_profesor,email,fecha_ingreso,estado)
VALUES
('Alfonso','D Blazquez','adblazquez@idbootcamps.com','2020-01-01',1),
('Miquel','Pocar','mpocar@idbootcamps.com','2020-01-01',1)
;

-- ###### BOOTCAMPS   ######
INSERT INTO bootcamp 
(nombre_bootcamp,fecha_edicion,estado)
VALUES
('Data Science','2022-05-09',1),
('Data Science','2022-02-01',0),
('Data Science','2021-10-01',0)
;

-- ###### ASIGNATURAS   ######
INSERT INTO asignaturas 
(nombre_asignatura,id_bootcamp)
VALUES
('Pre-Curso',1),
('Programando en Python',1),
('Matematicas y Estadisticas',1),
('Web Scrapping',1),
('SQL BBDDs',1),
('Machine Learning',1),
('NPL',1),
('Series de Tiempo',1),
('Deep Learning',1),
('Sistemas de Recomendacion',1)
;

-- ###### PAISES   ######
INSERT INTO bbdd_idbootcamps.paises 
(nombre_pais)
SELECT country
FROM sakila.country;

INSERT INTO paises 
(nombre_pais)
VALUES
('España'),
('Chile'),
('Venezuela'),
('Brasil'),
('Argentina')
;
Delete from bbdd_idbootcamps.paises;

-- ###### CIUDADES   ######
INSERT INTO bbdd_idbootcamps.ciudades 
(nombre_ciudad,id_pais) 
SELECT city,country_id
FROM sakila.city;

INSERT INTO ciudades 
(nombre_ciudad,id_pais)
VALUES
('Madrid',1),
('Barcelona',1),
('Valencia',1),
('Malaga',1),
('Santiago',2),
('Rio de Janeiro',4),
('Caracas',3),
('Buenos Aires',5),
('Sao Paulo',4)
;

-- si queremos borrar la data de la TABLE
Delete from bbdd_idbootcamps.ciudades;

-- ###### DIRECCIONES   ######
INSERT INTO bbdd_idbootcamps.direcciones 
(calle,id_ciudad,cod_postal,barrio,telefono) 
SELECT address,city_id,postal_code,district,phone
FROM sakila.address;


-- SEGUNDO LLENAMOS LAS TABLAS RELACIONALES CON 2 FK
-- ###### ALUMNOS ASIGNATURAS   ######



-- ###### PROFESORES ASIGNATURAS   ######






-- TERCERO LLENAMOS LAS TABLAS QUE DEPENDE DE UNA TABLA RELACIONAL CON 2 FK
-- ###### EXAMENES  ######
