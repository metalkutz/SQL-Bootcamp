# SQL-Bootcamp
Trabajo/Practica en SQL a entregar al final del Bootcamp. 
## Objetivo
El objetivo de la entrega es poner en práctica los conocimientos adquiridos del lenguaje SQL durante el Bootcamp.

## Herramientas utilizadas
    - Motor de SQL: MySQL
    - Cliente: MySQL Workbench
    - Servidor: local
(tanto la instalación y configuración de lo anterior se asume realizadas para ejecutar el código)

## Instrucciones
### 1. Crear un esquema de Base de Datos relacional que contenga información de alumnos, profesores, exámenes y asignaturas.
La relación es la siguiente: 
	- Un alumno puede tener una o varias asignaturas
	- La relación del profesor y el alumno es a través de las asignaturas, no directa
	- La relación entre los examenes y los alumnos depende de la asignatura, no es directa.
	- Un profesor puede dar clase en varias asignaturas y una asignatura puede tener varios profesores.
	- Igual para los alumnos y las asignaturas.
	- Los exámenes son ÚNICOS por asignatura. SOLO HAY UN EXAMEN PARA CADA ASIGNATURA y ALUMNO Y SOLO UNO.
	Extra: los datos sociodemográficos puede ser tablas separadas (fijate en sakila.city y sakila.addres)

### 2. Una vez que has creado el schema, inventa valores y rellena las tablas con datos apropiados. Trata de tener columnas suficientes para almacenar toda la información que podría ser relevante.

### 3. Al terminar tienes que ser capaz de realizar las siguientes consultas.
	- Nota media de cada asignatura.
	- Nota media asociada a cada profesor (media las notas de sus asignaturas)
    - ¿Cuál es la nota del último examen realizado por el alumno con mayor nota media?
    - ¿Cuál es la asignatura más dificil?
    - Busca el grupo de riesgo de cada asignatura (alumnos que peor van) y verifica si hay alguno que esté en todas.

## Diagrama EER de la bbdd
[[modelo\EER_diagram_idbootcamps.png]]