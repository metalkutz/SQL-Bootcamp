-- Consultas

-- INDICO QUE VOY A TRABAJAR SOBRE LA NUEVA BBDD 
use BBDD_IDBootcamps;

select * from examenes;  -- lista de notas de exámenes de cada alumno por asignatura, puede haber más de 1 examen rendido por alumno, por asignatura
select avg(nota) as nota_media from examenes; -- lista de todas las notas de exámenes de alumnos en distintas asignaturas
select * from asignaturas; -- lista de asignaturas
select * from alumnos_asignaturas; -- relacion de alumnos con asignaturas
select * from bootcamp; -- ediciones de bootcamps
select * from alumnos; -- lista de alumnos

-- nota media de cada asignatura
select 
	asig.nombre_asignatura as asignatura,
    round(avg(e.nota),1) as nota_media
from asignaturas asig 
	left join alumnos_asignaturas aa on asig.id_asignatura = aa.id_asignatura -- unimos asignaturas con su relación con alumnos
		left join examenes e on e.id_alumno_asignatura = aa.id_alumno_asignatura -- unimos los examenes rendidos por alumnos en sus asignaturas
where asig.id_bootcamp =1  -- solo para edición del bootcamp data science may-2022
group by asig.nombre_asignatura
;

-- Nota media asociada a cada profesor (media las notas de sus asignaturas)
select 
	p.nombre_profesor as profesor,
    round(avg(e.nota),1) as nota_media
from profesores p
	left join asignaturas_profesores ap on p.id_profesor = ap.id_profesor -- unimos los profesores con su relacion con asignaturas
		left join asignaturas asig on asig.id_asignatura = ap.id_asignatura -- unimos las asignaturas con su relación con profesores
			left join alumnos_asignaturas aa on asig.id_asignatura = aa.id_asignatura -- unimos asignaturas con su relación con alumnos
				left join examenes e on e.id_alumno_asignatura = aa.id_alumno_asignatura -- unimos los examenes rendidos por alumnos en sus asignaturas
where asig.id_bootcamp =1  -- solo para edición del bootcamp data science may-2022
group by p.id_profesor
;

-- ¿Cuál es la nota del último examen realizado por el alumno con mayor nota media?
select * 
from alumnos al
	left join alumnos_asignaturas aa on al.id_alumno = aa.id_alumno
		left join examenes e on e.id_alumno_asignatura = aa.id_alumno_asignatura
			left join (select al.id_alumno, round(avg(e.nota),1) as nota_media 
						from alumnos al	left join alumnos_asignaturas aa on al.id_alumno = aa.id_alumno left join examenes e on e.id_alumno_asignatura = aa.id_alumno_asignatura
						where al.estado = 1 -- solo alumnos activos 
                        group by al.id_alumno
                        order by nota_media desc
                        limit 1) temp on temp.id_alumno = al.id_alumno
; 

select -- nota medias alumnos
	al.nombre_alumno as alumno, 
    round(avg(e.nota),1) as nota_media
from alumnos al
	left join alumnos_asignaturas aa on al.id_alumno = aa.id_alumno
		left join examenes e on e.id_alumno_asignatura = aa.id_alumno_asignatura
where al.estado = 1 -- solo alumnos activos
group by al.id_alumno
order by nota_media desc
limit 1
; 

-- ¿Cuál es la asignatura más dificil?
select 
	asig.nombre_asignatura as asignatura,
    round(avg(e.nota),1) as nota_media
from asignaturas asig 
	left join alumnos_asignaturas aa on asig.id_asignatura = aa.id_asignatura -- unimos asignaturas con su relación con alumnos
		left join examenes e on e.id_alumno_asignatura = aa.id_alumno_asignatura -- unimos los examenes rendidos por alumnos en sus asignaturas
where asig.id_bootcamp =1  -- solo para edición del bootcamp data science may-2022
group by asig.nombre_asignatura
order by nota_media 
limit 1
;

-- Busca el grupo de riesgo de cada asignatura (alumnos que peor van) y verifica si hay alguno que esté en todas.
select 
	asig.nombre_asignatura as asignatura,
    al.nombre_alumno as alumno,
    round(avg(e.nota),1) as nota_media
from asignaturas asig 
	left join alumnos_asignaturas aa on asig.id_asignatura = aa.id_asignatura -- unimos asignaturas con su relación con alumnos
		inner join alumnos al on al.id_alumno = aa.id_alumno -- unimos con los datos de alumnos
			left join examenes e on e.id_alumno_asignatura = aa.id_alumno_asignatura -- unimos los examenes rendidos por alumnos en sus asignaturas
where asig.id_bootcamp =1 -- and asig.id_asignatura=1  -- solo para 1 curso
group by asignatura, alumno
having nota_media < 5.0
order by asignatura, nota_media 
-- limit 3
;

