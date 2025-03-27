--1-Seleccionar el apellido, oficio, salario, numero de departamento y su nombre de todos los empleados cuyo salario sea mayor de 300000


select EMP.APELLIDO, EMP.OFICIO, EMP.SALARIO, EMP.DEPT_NO, DEPT.DNOMBRE
from EMP
left join DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO;

select EMP.APELLIDO, EMP.OFICIO, EMP.SALARIO, EMP.DEPT_NO, DEPT.DNOMBRE
from EMP
right join DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO;

select EMP.APELLIDO, EMP.OFICIO, EMP.SALARIO, EMP.DEPT_NO, DEPT.DNOMBRE
from EMP
left join DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO
where EMP.SALARIO > 300000;

--2 Mostrar todos los nombres de Hospital con sus nombres de salas correspondientes.

select * from SALA;

select HOSPITAL.NOMBRE, SALA.NOMBRE
from HOSPITAL
left JOIN SALA
on HOSPITAL.HOSPITAL_COD = SALA.HOSPITAL_COD;
--CUANADO HAY DOS COLUMNAS QUE SE LLAMEN IGUAL HAY QUE FORZAR UN ALIAS

select HOSPITAL.NOMBRE as NOMBRE_HOSP, SALA.NOMBRE as NOMBRE_SALA
from HOSPITAL
left JOIN SALA
on HOSPITAL.HOSPITAL_COD = SALA.HOSPITAL_COD;

--3 Calcular cuántos trabajadores de la empresa hay en cada ciudad.

select count (EMP.EMP_NO) as TRABAJADORES, DEPT.LOC
from EMP
right join DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO
group by DEPT.LOC;

--si haces left no sale granada

select count (EMP.EMP_NO) as TRABAJADORES, DEPT.LOC
from EMP
left join DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO
group by DEPT.LOC;

--4 Visualizar cuantas personas realizan cada oficio en cada departamento mostrando el nombre del departamento.
--AGRUPAR EL Nº SE PERSONAS QUE TRABAJANO POR CADA DEPTARTAMENTPO
select count (EMP.EMP_NO) as PERSONAS, DEPT.DNOMBRE
from EMP
left join DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO
group by DEPT.DNOMBRE;

select count (EMP.EMP_NO) as PERSONAS, DEPT.DNOMBRE,EMP.OFICIO   ---AGRUPAMOS EN GROUP BY TODOS LOS CAMPOS QUE ESTAN EN SELECT
from EMP
left join DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO
group by DEPT.DNOMBRE, EMP.OFICIO;


--5. Contar cuantas salas hay en cada hospital, mostrando el nombre de las salas y el nombre del hospital.

select count (SALA.SALA_COD) FROM SALA;
select count (SALA.SALA_COD) as SALA from SALA;

select count (SALA.SALA_COD) as SALA, SALA.NOMBRE, HOSPITAL.NOMBRE
from SALA
left join HOSPITAL 
on HOSPITAL.HOSPITAL_COD = SALA.HOSPITAL_COD
group by SALA.NOMBRE, HOSPITAL.NOMBRE;

--6 Queremos saber cuántos trabajadores se dieron de alta entre el año 1997 y 1998 y en qué departamento.  DEPT TRAB>1997 y 1998<

select count (EMP.EMP_NO) as TRABAJADORES, EMP.FECHA_ALT, DEPT.DNOMBRE
from EMP
left join DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO
group by EMP.EMP_NO, EMP.FECHA_ALT, DEPT.DNOMBRE;

select count (EMP.EMP_NO) as TRABAJADORES, DEPT.DNOMBRE
from EMP
left join DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO
group by EMP.EMP_NO, EMP.FECHA_ALT, DEPT.DNOMBRE;

select count (EMP.EMP_NO) as ALTAS, DEPT.DNOMBRE
from EMP
inner join DEPT --inner para buscar datos coincidentes
on EMP.DEPT_NO = DEPT.DEPT_NO
where EMP.FECHA_ALT >= '01/01/1997' and EMP.FECHA_ALT <= '31/12/1998' --    WHERE SIEMPRE DESPUES DEL FROM, YA SEA CORTO "FROM TABLA" O LARGO "FROM ON" (INNER, JOIN)
group by DEPT.DNOMBRE;

select count (EMP.EMP_NO) as ALTAS, DEPT.DNOMBRE
from EMP
inner join DEPT --inner para buscar datos coincidentes
on EMP.DEPT_NO = DEPT.DEPT_NO
where EMP.FECHA_ALT between '01/01/1997' and '12/12/1998'
group by DEPT.DNOMBRE;


--7. Buscar aquellas ciudades con cuatro o más personas trabajando.

select count (EMP.EMP_NO) as PERSONAS, DEPT.LOC
from EMP
inner join DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO
group by DEPT.LOC
having count (*) >=4 ;

--8 Calcular la media salarial por ciudad.  Mostrar solamente la media para Madrid y Sevilla.

select DEPT.LOC as CIUDAD,
avg(EMP.SALARIO) as MEDIA_SALARIAL
from EMP
inner join DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO
group by DEPT.LOC
having DEPT.LOC in ('MADRID', 'SEVILLA')

--9 Mostrar los doctores junto con el nombre de hospital en el que ejercen, la dirección y el teléfono del mismo.

select DOCTOR.APELLIDO, HOSPITAL.NOMBRE, HOSPITAL.DIRECCION, HOSPITAL.TELEFONO
from doctor
inner join HOSPITAL
on DOCTOR.HOSPITAL_COD = HOSPITAL.HOSPITAL_COD;

10-Mostrar los nombres de los hospitales junto con el mejor salario de los empleados de la plantilla de cada hospital.

select HOSPITAL.NOMBRE, max (PLANTILLA.SALARIO) as SALARIO_MAX
from HOSPITAL
inner join PLANTILLA
on HOSPITAL.HOSPITAL_COD = PLANTILLA.HOSPITAL_COD
group by HOSPITAL.NOMBRE;

--11/Visualizar el Apellido, función y turno de los empleados de la plantilla junto con el nombre de la sala y el nombre del hospital con el teléfono.
--POR CADA TABLA UN "JOIN" Y UNO "ON"
--CUANDO SE ASOCIAN VARIAS TABLAS, SE UNEN CON UN "ON" Y VARIOS "INNER JOIN"
--from TABLA1
--inner join TABLA2
--ON TABLA1.RELACION....

select *from PLANTILLA;
select *from SALA;
select *from HOSPITAL;

select PLANTILLA.APELLIDO, PLANTILLA.FUNCION, PLANTILLA.TURNO, SALA.NOMBRE AS nombre_sala, HOSPITAL.NOMBRE as NOMBRE_HOSPITAL, HOSPITAL.TELEFONO
from PLANTILLA
inner join HOSPITAL
on PLANTILLA.HOSPITAL_COD = HOSPITAL.HOSPITAL_COD
inner join SALA
on HOSPITAL.HOSPITAL_COD = SALA.HOSPITAL_COD;

--SI TE MUESTRA MÁS REGISTROS DE LOS DEL ORIGEN (PRODUCTO CARTESIANO), IR A LA FUNCIÓN PRINCIPAL, EN ESTE CASO "PLANTILLA"
--FALTA UNA RELACIÓN

select PLANTILLA.APELLIDO, PLANTILLA.FUNCION, PLANTILLA.TURNO, SALA.NOMBRE AS nombre_sala, HOSPITAL.NOMBRE as NOMBRE_HOSPITAL, HOSPITAL.TELEFONO
from PLANTILLA
inner join HOSPITAL
on PLANTILLA.HOSPITAL_COD = HOSPITAL.HOSPITAL_COD
inner join SALA
on HOSPITAL.HOSPITAL_COD = SALA.HOSPITAL_COD;

--EL FALLO ES QUE LOS TRABAJADORES DEL DEPT 6 (PSIQUIATRÍA) ESTÁN EN "SALSA_COD" DE SALA Y DE HOSPITAL, Y SE SUMAN. ARREGLEMOSLO

select PLANTILLA.APELLIDO, PLANTILLA.FUNCION, PLANTILLA.TURNO, SALA.NOMBRE AS nombre_sala, HOSPITAL.NOMBRE as NOMBRE_HOSPITAL, HOSPITAL.TELEFONO
from PLANTILLA
inner join HOSPITAL
on PLANTILLA.HOSPITAL_COD = HOSPITAL.HOSPITAL_COD
inner join SALA
on HOSPITAL.HOSPITAL_COD = SALA.HOSPITAL_COD
and PLANTILLA.SALA_COD = SALA.SALA_COD;         ---AÑADIMOS EL AND PARA QUE COJA LOS RESULTADOS COINCIDENTES

--12 Visualizar el máximo salario, mínimo salario de los Directores dependiendo de la ciudad en la que trabajen. Indicar el número total de directores por ciudad.

select count(EMP.EMP_NO) as DIRECTORES, DEPT.LOC as CIUDAD
, max(EMP.SALARIO) as SALARIOMAXIMO
, min(EMP.SALARIO) as SALARIOMINIMO
from EMP 
inner join DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO
where OFICIO='DIRECTOR'
group by DEPT.LOC;



--13. Averiguar la combinación de que salas podría haber por cada uno de los hospitales.

select SALA.NOMBRE as NOMBRESALA
, HOSPITAL.NOMBRE as NOMBREHOSPITAL
from SALA
cross join HOSPITAL;


---------------------------------TEORÍA-------------------------

--SUBCONSULTAS 
--SON CONSULTAS QUE NECESITAN DEL RESULTADO DE OTRA CONSULTA PARA PODER SER EJECUTADAS
--NO SON AUTÓNOMAS.
--NO IMPORTA EL NIVEL DE ANIDAMIENTO DE SUBCONSULTAS AUNQUE PUEDEN RALENTIZAR LAS RESPUESTAS
--GENERAN BLOQUEOS EN CONSULTAS SELECT, LO QUE TAMBIÉN RALENTIZAN LAS RESPUESTAS
--QUIERO VISULIZAR LOS DATOS DEL EMPLEADO QUE MÁS COBRA DE LA EMPRESA (EMP)
--DEBEMOS INTENTAR EVITARLAS EN LA  MEDIDA DE LA POSIBLE CON SELECT

select max(SALARIO) from EMP; --650000
select * from EMP where SALARIO=650000;

--SE EJECUTAN LAS DOS CONSULTAS A LA VEZ Y SE ANIDA EL RESULTADO DE UNA CONSULTA
--CON LA IGUALDAD DE LA RESPUESTA DE OTRA CONSULTA
--LAS SUBCONSULTAS VAN ENTRE PARENTESIS

select * from EMP where SALARIO = (select max(SALARIO) from EMP); --650000

--MOSTRAR LOS EMPLEADOS QUE TIENEN EL MISMO OFICIO QUE EL EMPLEADO "GIL"

select * from EMP;
select * from EMP where OFICIO = ( select OFICIO from EMP where APELLIDO = 'gil');

--Y QUE COBRAN MENOS QUE JIMENEZ

select * from EMP where OFICIO = ( select OFICIO from EMP where APELLIDO = 'gil')
and SALARIO < (select SALARIO from EMP where APELLIDO = 'jimenez');

-- MOSTRAR LOS EMPLEADOS QUE TIENEN EL MISMO OFICIO QUE GIL Y JIMENEZ

select * from EMP where OFICIO = ( select OFICIO from EMP where APELLIDO = 'gil' on APELLIDO = 'jimenez';---mal
--si muna subconsulta devuele más de un valor usamos el valor "in"
select * from EMP where OFICIO in ( select OFICIO from EMP where APELLIDO = 'gil' or APELLIDO = 'jimenez');

--POR SUPUESTO, PODEMOS UTILIZAR SUBCONSULTASPARA OTRAS TABLAS
--MOSTRAR EL APELLIDO Y OFICIO DE LOS DEP DE MADRID

select APELLIDO, OFICIO from EMP where DEPT_NO = (select DEPT_NO from DEPT where LOC = 'MADRID')

--SI TIENEN UN CAMPO COMÚN DEBEMOS HUIR DE LAS SUBCONSULTAS Y USAR UN JOIN
select EMP.APELLIDO, EMP.OFICIO
from EMP
inner join DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO
where DEPT.LOC = 'MADRID';

--CONSULTAS UNION
--MUESTRAN EN UN MISMO CURSOR UN MISMO CONJUNTO DE RESULTADOS
--ESTAS CONSULTAS SE UTILIZAN COMO CONCEPTO, NO COMO RELACION
--DEBEMOS SEGUIR TRES NORMAS
    --1)LA PRIMERA CONSULTA ES LA JEFA
    --2)TODAS LAS CONSULTAS DEBEN TENER EL MISMO Nº DE COLUMNAS
    --3)TODAS LAS COLUMNAS DEBEN TENER EL MISMO TIPO  DE DATOS ENTRE SI
    --EN NUESTRA BBDD TENEMOS DATOS DE PERSONAS EN DIFERENTES TABLAS
    --EMP, PLANTILLA, DOCTOR...

select APELLIDO, OFICIO, SALARIO from EMP;
select APELLIDO, FUNCION, SALARIO from PLANTILLA;

select APELLIDO, OFICIO, SALARIO from EMP
union
select APELLIDO, FUNCION, SALARIO from PLANTILLA;

---SEGUIMOS ANIDANDO, SI CUMPLEN LAS CONDICIONES, AUNQUE NO TENGA SENTIDO SIGUE FUNCIONANDO
select APELLIDO, OFICIO, SALARIO from EMP
union
select APELLIDO, FUNCION, SALARIO from PLANTILLA
union
select DNOMBRE, LOC, DEPT_NO from DEPT;

-----------SI QUEREMOS PONER ALIAS, A LA PRIMERA
select APELLIDO, OFICIO, SALARIO as SUELDO from EMP
union
select APELLIDO, FUNCION, SALARIO from PLANTILLA;

-----------NO FUNCIONA EN LAS SUCESIVAS
select APELLIDO, OFICIO, SALARIO from EMP
union
select APELLIDO, FUNCION, SALARIO AS SUELDO from PLANTILLA;

--POR SUPUESTO, PODEMOS ORDENAR SIN PROBLEMAS, SIEMPRE ES RECOMENDABLE ORDENARLO POR NUMERANDOS (order by 3)
select APELLIDO, OFICIO, SALARIO as SUELDO from EMP
union
select APELLIDO, FUNCION, SALARIO from PLANTILLA
order by 3 desc;

-----
select APELLIDO, OFICIO, SALARIO as SUELDO from EMP
union
select APELLIDO, FUNCION, SALARIO from PLANTILLA
order by SALARIO;

--si no se llaman igual los campos en todas las consultas no se pueden ordenar con el nombre

select APELLIDO, OFICIO, SALARIO as SUELDO from EMP
union
select APELLIDO, FUNCION, SALARIO from PLANTILLA
order by OFICIO;

--PODEMOS FILTRAR LOS DATOS DE LA CONSULTA
--EJ: MOSTRAR LOS DATOS DE LAS PERSONAS QUE COBREN <300.000

select APELLIDO, OFICIO, SALARIO from EMP
union
select APELLIDO, FUNCION, SALARIO from PLANTILLA
union
select APELLIDO, ESPECIALIDAD, SALARIO from DOCTOR
order by 1;

----ponemos el filtro del salario, ese filtro solo se aplica al último select
--si hubiera un enfermero que cobrara 400.000 me saldría en la consulta
select APELLIDO, OFICIO, SALARIO from EMP
union
select APELLIDO, FUNCION, SALARIO from PLANTILLA
union
select APELLIDO, ESPECIALIDAD, SALARIO from DOCTOR
where SALARIO < 300000
order by 1;

--HAY QUE AÑADIR OTRO where
--CADA where ES INDEPENDIENTE AL UNION

select APELLIDO, OFICIO, SALARIO from EMP
union
select APELLIDO, FUNCION, SALARIO from PLANTILLA
where SALARIO < 300000
union
select APELLIDO, ESPECIALIDAD, SALARIO from DOCTOR
where SALARIO < 300000
order by 1;
--CADA WHERE ES INDEPENDIENTE AL UNION

--UNION ELIMINA LOS RESULTADOS REPETIDOS
select APELLIDO, OFICIO from EMP
union 
select APELLIDO, OFICIO from EMP;

--SI QUEREMOS REPETIDOS DEBEMOS USAR UNION ALL

select APELLIDO, OFICIO from EMP
union all
select APELLIDO, OFICIO from EMP;


