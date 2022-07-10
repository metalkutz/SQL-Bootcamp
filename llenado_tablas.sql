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
('Juliana','Silva', 'juli@idbootcamps.com','2022-05-09',1),
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
INSERT INTO asignaturas 
SET 
nombre_asignatura='Kahoot',
id_bootcamp=1;


-- ###### PAISES   ######
INSERT INTO bbdd_idbootcamps.paises 
(nombre_pais)
SELECT country
FROM sakila.country;
-- Delete from bbdd_idbootcamps.paises;

-- ###### CIUDADES   ######
INSERT INTO bbdd_idbootcamps.ciudades 
(nombre_ciudad,id_pais) 
SELECT city,country_id
FROM sakila.city;
-- si queremos borrar la data de la TABLE
-- Delete from bbdd_idbootcamps.ciudades;

-- ###### DIRECCIONES   ######
INSERT INTO bbdd_idbootcamps.direcciones 
(calle,id_ciudad,cod_postal,barrio,telefono) 
SELECT address,city_id,postal_code,district,phone
FROM sakila.address;


-- SEGUNDO LLENAMOS LAS TABLAS RELACIONALES CON 2 FK
-- ###### ALUMNOS ASIGNATURAS   ######
INSERT INTO alumnos_asignaturas 
(id_alumno,id_asignatura)
VALUES
(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),
(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),
(3,1),(3,2),(3,3),(3,4),(3,5),(3,6),(3,7),(3,8),(3,9),(3,10),
(4,1),(4,2),(4,3),(4,4),(4,5),(4,6),(4,7),(4,8),(4,9),(4,10),
(5,1),(5,2),(5,3),(5,4),(5,5),(5,6),(5,7),(5,8),(5,9),(5,10),
(6,1),(6,2),(6,3),(6,4),(6,5),(6,6),(6,7),(6,8),(6,9),(6,10)
;

-- ###### PROFESORES ASIGNATURAS   ######
INSERT INTO asignaturas_profesores 
(id_profesor,id_asignatura)
VALUES
(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),
(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10)
;

-- TERCERO LLENAMOS LAS TABLAS QUE DEPENDE DE UNA TABLA RELACIONAL CON 2 FK
-- ###### EXAMENES  ######
INSERT INTO examenes 
(id_alumno_asignatura,nombre_examen,nota,fecha) 
VALUES
(1,'Ex-Precurso',ROUND(RAND()*(10-3+1)+3,1),'2022-05-01'),(2,'Ex-Python',ROUND(RAND()*(10-3+1)+3,1),'2022-06-01'),(3,'Ex-Mates',ROUND(RAND()*(10-3+1)+3,1),'2022-06-07'),(4,'Ex-WebAPI',ROUND(RAND()*(10-3+1)+3,1),'2022-06-14'),(5,'Ex-SQL',ROUND(RAND()*(10-3+1)+3,1),'2022-06-21'),(6,'Ex-ML',ROUND(RAND()*(10-3+1)+3,1),'2022-07-01'),(7,'Ex-NPL',ROUND(RAND()*(10-3+1)+3,1),'2022-07-02'),(8,'Ex-SeriesT',ROUND(RAND()*(10-3+1)+3,1),'2022-07-04'),(9,'Ex-RNN',ROUND(RAND()*(10-3+1)+3,1),'2022-07-06'),(10,'Ex-SistR',ROUND(RAND()*(10-3+1)+3,1),'2022-07-06'),
(11,'Ex-Precurso',ROUND(RAND()*(10-3+1)+3,1),'2022-05-01'),(12,'Ex-Python',ROUND(RAND()*(10-3+1)+3,1),'2022-06-01'),(13,'Ex-Mates',ROUND(RAND()*(10-3+1)+3,1),'2022-06-07'),(14,'Ex-WebAPI',ROUND(RAND()*(10-3+1)+3,1),'2022-06-14'),(15,'Ex-SQL',ROUND(RAND()*(10-3+1)+3,1),'2022-06-21'),(16,'Ex-ML',ROUND(RAND()*(10-3+1)+3,1),'2022-07-01'),(17,'Ex-NPL',ROUND(RAND()*(10-3+1)+3,1),'2022-07-02'),(18,'Ex-SeriesT',ROUND(RAND()*(10-3+1)+3,1),'2022-07-04'),(19,'Ex-RNN',ROUND(RAND()*(10-3+1)+3,1),'2022-07-06'),(20,'Ex-SistR',ROUND(RAND()*(10-3+1)+3,1),'2022-07-06'),
(21,'Ex-Precurso',ROUND(RAND()*(10-3+1)+3,1),'2022-05-01'),(22,'Ex-Python',ROUND(RAND()*(10-3+1)+3,1),'2022-06-01'),(23,'Ex-Mates',ROUND(RAND()*(10-3+1)+3,1),'2022-06-07'),(24,'Ex-WebAPI',ROUND(RAND()*(10-3+1)+3,1),'2022-06-14'),(25,'Ex-SQL',ROUND(RAND()*(10-3+1)+3,1),'2022-06-21'),(26,'Ex-ML',ROUND(RAND()*(10-3+1)+3,1),'2022-07-01'),(27,'Ex-NPL',ROUND(RAND()*(10-3+1)+3,1),'2022-07-02'),(28,'Ex-SeriesT',ROUND(RAND()*(10-3+1)+3,1),'2022-07-04'),(29,'Ex-RNN',ROUND(RAND()*(10-3+1)+3,1),'2022-07-06'),(30,'Ex-SistR',ROUND(RAND()*(10-3+1)+3,1),'2022-07-06'),
(31,'Ex-Precurso',ROUND(RAND()*(10-3+1)+3,1),'2022-05-01'),(32,'Ex-Python',ROUND(RAND()*(10-3+1)+3,1),'2022-06-01'),(33,'Ex-Mates',ROUND(RAND()*(10-3+1)+3,1),'2022-06-07'),(34,'Ex-WebAPI',ROUND(RAND()*(10-3+1)+3,1),'2022-06-14'),(35,'Ex-SQL',ROUND(RAND()*(10-3+1)+3,1),'2022-06-21'),(36,'Ex-ML',ROUND(RAND()*(10-3+1)+3,1),'2022-07-01'),(37,'Ex-NPL',ROUND(RAND()*(10-3+1)+3,1),'2022-07-02'),(38,'Ex-SeriesT',ROUND(RAND()*(10-3+1)+3,1),'2022-07-04'),(39,'Ex-RNN',ROUND(RAND()*(10-3+1)+3,1),'2022-07-06'),(40,'Ex-SistR',ROUND(RAND()*(10-3+1)+3,1),'2022-07-06'),
(41,'Ex-Precurso',ROUND(RAND()*(10-3+1)+3,1),'2022-05-01'),(42,'Ex-Python',ROUND(RAND()*(10-3+1)+3,1),'2022-06-01'),(43,'Ex-Mates',ROUND(RAND()*(10-3+1)+3,1),'2022-06-07'),(44,'Ex-WebAPI',ROUND(RAND()*(10-3+1)+3,1),'2022-06-14'),(45,'Ex-SQL',ROUND(RAND()*(10-3+1)+3,1),'2022-06-21'),(46,'Ex-ML',ROUND(RAND()*(10-3+1)+3,1),'2022-07-01'),(47,'Ex-NPL',ROUND(RAND()*(10-3+1)+3,1),'2022-07-02'),(48,'Ex-SeriesT',ROUND(RAND()*(10-3+1)+3,1),'2022-07-04'),(49,'Ex-RNN',ROUND(RAND()*(10-3+1)+3,1),'2022-07-06'),(50,'Ex-SistR',ROUND(RAND()*(10-3+1)+3,1),'2022-07-06'),
(51,'Ex-Precurso',ROUND(RAND()*(10-3+1)+3,1),'2022-05-01'),(52,'Ex-Python',ROUND(RAND()*(10-3+1)+3,1),'2022-06-01'),(53,'Ex-Mates',ROUND(RAND()*(10-3+1)+3,1),'2022-06-07'),(54,'Ex-WebAPI',ROUND(RAND()*(10-3+1)+3,1),'2022-06-14'),(55,'Ex-SQL',ROUND(RAND()*(10-3+1)+3,1),'2022-06-21'),(56,'Ex-ML',ROUND(RAND()*(10-3+1)+3,1),'2022-07-01'),(57,'Ex-NPL',ROUND(RAND()*(10-3+1)+3,1),'2022-07-02'),(58,'Ex-SeriesT',ROUND(RAND()*(10-3+1)+3,1),'2022-07-04'),(59,'Ex-RNN',ROUND(RAND()*(10-3+1)+3,1),'2022-07-06'),(60,'Ex-SistR',ROUND(RAND()*(10-3+1)+3,1),'2022-07-06')
;
-- Delete from examenes;

-- Cuarto actualizo tabla alumnos con direcciones
UPDATE alumnos SET id_direccion = ROUND(RAND()*603);
UPDATE profesores SET id_direccion = ROUND(RAND()*603);
