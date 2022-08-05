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
select a.id_alumno, asig.id_asignatura 
from asignaturas as asig cross join alumnos as a
order by a.id_alumno; 
-- Delete from alumnos_asignaturas;

-- ###### PROFESORES ASIGNATURAS   ######
INSERT INTO asignaturas_profesores 
(id_profesor,id_asignatura)
VALUES
(1,1),(1,3),(1,5),(1,7),(1,9),(1,11), -- asociamos solo asignaturas impares a alfonso
(2,2),(2,4),(2,6),(2,8),(2,10) -- asignamos solo asignaturas pares a miquel
;
-- select p.id_profesor, asig.id_asignatura from profesores as p cross join asignaturas as asig order by p.id_profesor;
-- DELETE FROM asignaturas_profesores;


-- TERCERO LLENAMOS LAS TABLAS QUE DEPENDE DE UNA TABLA RELACIONAL CON 2 FK

-- ###### EXAMENES  ######
-- Llenado notas pre-curso
INSERT INTO examenes 
(id_alumno_asignatura,nombre_examen,nota,fecha) 
SELECT
	id_alumno_asignatura, 
    CONCAT_WS('_','Examen',asig.nombre_asignatura),
    ROUND(RAND()*(10-3+1)+2,1),
    date(concat(2022,'-',ROUND(RAND()*(7-5)+5,0),'-',ROUND(RAND()*(29)+1,0))) 
From alumnos_asignaturas aa 
	left join asignaturas asig on asig.id_asignatura = aa.id_asignatura
;
-- Delete from examenes;

-- agregamos algunas notas rojas
INSERT INTO examenes 
(id_alumno_asignatura,nombre_examen,nota,fecha) 
SELECT
	id_alumno_asignatura, 
    CONCAT_WS('_','Examen',asig.nombre_asignatura),
    ROUND(RAND()*(5-1+1)+1,1),
    date(concat(2022,'-',ROUND(RAND()*(7-5)+5,0),'-',ROUND(RAND()*(29)+1,0))) -- '2022-05-01'
From alumnos_asignaturas aa 
	left join asignaturas asig on asig.id_asignatura = aa.id_asignatura
;

-- agregamos algunas notas medias
INSERT INTO examenes 
(id_alumno_asignatura,nombre_examen,nota,fecha) 
SELECT
	id_alumno_asignatura, 
    CONCAT_WS('_','Examen',asig.nombre_asignatura),
    ROUND(RAND()*(10-5)+4,1),
    date(concat(2022,'-',ROUND(RAND()*(7-5)+5,0),'-',ROUND(RAND()*(30),0))) 
From alumnos_asignaturas aa 
	left join asignaturas asig on asig.id_asignatura = aa.id_asignatura
;


-- Cuarto actualizo tabla alumnos con direcciones
UPDATE alumnos SET id_direccion = ROUND(RAND()*603);
UPDATE profesores SET id_direccion = ROUND(RAND()*603);
