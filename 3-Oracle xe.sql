--CONSTULTAS DE AGRUPACIÓN: NOS PERMITEN MOSTRAR ALGÚN RESUMEN SOBRE UN GRUPO DETERMINADO DE LOS DATOS
--UTILIZAN FUNCIONES DE AGRUPACIÓN PARA CONSEGUIR EL RESUMEN
--LAS FUNCIONES DEBEN TENER ALIAS
--COUNT(*): Cuenta el número de registros, incluyendo nulos
--COUNT(CAMPO): Cuenta el número de registros sin nulos
--SUM(NUMERO): Suma el total de un campo número
--AVG(NUMERO) Recupera la media de un campo numérico
--MAX(CAMPO): Devuelve el valor máximo de un campo
--MIN(CAMPO): Devuelve el valor mínimo de un campo

--MOSTRAR EL NUM DE REGISTROS DE LA TABLA DOCTOR
select count (*) from doctor;
--incluimos alias
select count(APELLIDO) as NUMERO_DOCTORES from DOCTOR;
--COMBINAMOS FUNCIONES, QUEREMOS NUM DOCTORES Y MAX SALARIO
select count(*) as DOCTORES, max (SALARIO) as MAXIMO from DOCTOR;
--PODEMOS AGRUPAR LOS DATOS RESULTANTES POR ALGÚN CAMPO DE LA TABLA
--CUANDO QUEREMOS AGRUPAR UTILIZAMOS group by DESPUES DEL from
--TRUCO!!!!AGRUPAR POR CADA CAMPO QUE NO SEA UNA FUNCIÓN
--MOSTRAR CUANTOS DOCTORES EXISTEN POR CADA ESPECIALIDAD
select COUNT (*) as DOCTORES, ESPECIALIDAD
from  DOCTOR
group by ESPECIALIDAD;

--MOSTRAR NUMERO DE PERSONAS Y MAX SALARIO DE LOS EMPLEADOS POR CADA DEPARTAMENTO Y OFICIO
select count (*) as PERSONAS, max (SALARIO) as MAX_SALARIO,
DEPT_NO, OFICIO
from EMP
group by DEPT_NO, OFICIO;


--MOSTRAR Nº PERSONAS PLANTILLA
select count (*) as NUM_PERSONAS from PLANTILLA;
--MOSTRAR Nº PERSONAS POR TURNO
select count (*) as PERSONAS, TURNO 
from PLANTILLA
group by TURNO;

--FILTRANDO EN CONSULTAS DE AGRUPACIÓN, TENEMOS DOS POSIBILIDADES
--1 WHERE: ANTES DEL GROUP BY Y PARA FILTRAR SOBRE LA TABLA
--2 HAVING: DESPUES DEL GROUP BY PARA FILTRAR SOBRE EL CONJUNTO
--MOSTRAR CUANTOS EMPLEADOS TENEMOS POR CADA OFICIO
--QUE COBREN + 200.0000
select count (*) as EMPLEADOS, OFICIO
from EMP
where SALARIO > 200000
group by OFICIO;

--FILTRANDO EN CONSULTAS DE AGRUPACIÓN, TENEMOS DOS POSIBILIDADES
--1 WHERE: ANTES DEL GROUP BY Y PARA FILTRAR SOBRE LA TABLA
--2 HAVING: DESPUES DEL GROUP BY PARA FILTRAR SOBRE EL CONJUNTO
--MOSTRAR CUANTOS EMPLEADOS TENEMOS POR CADA OFICIO
--QUE SEAN ANALISTAS O VENDEDORES
select count (*) as EMPLEADOS, OFICIO
from EMP
group by OFICIO
having OFICIO in ('ANALISTA', 'VENDEDOR');

--PODEMOS DECIDIR HAVING O WHERE, CUÁL VA MÁS RÁPIDO?having cuando son MUUUCHOSS registros
select count (*) as EMPLEADOS, OFICIO
from EMP
where OFICIO in ('ANALISTA', 'VENDEDOR')
group by OFICIO;

--MOSTRAR CUANTOS EMPLEADOS TENEMOS POR CADA OFICIO
--QUE SEAN ANALISTAS O VENDEDORES
--CUANDO NO PODEMOS DECIDIR Y ESTAMOS OBLIGADOS A UTILIZAR HAVING
--SI QUEREMOS FILTRAR POR UNA FUNCIÓN DE AGRUPACIÓN
--SOLAMENTE DONDE TENGAMOS DOS O MÁS EMPLEADOS DEL MISMO OFICIO

--ANTE LA DUDA, HAVING--

select count (*) as EMPLEADOS, OFICIO
from EMP
group by OFICIO
having count(*) > 2;


                   --26/03/2025
                   
                   --PRÁCTICA 2!!
                   
Encontrar el salario más alto, mas bajo y la diferencia entre ambos de todos los empleados con oficio EMPLEADO.

select * from EMP;
select max (SALARIO) as maximo ,min (SALARIO)as minimo, ((maximo)- (minimo)), as diferencia FROM EMP WHERE OFICIO ='EMPLEADO';

select max (SALARIO),min (SALARIO), (MAX(SALARIO))- (MIN(SALARIO)) as diferencia FROM EMP;
select max (SALARIO),min (SALARIO), MAX(SALARIO)- MIN(SALARIO) as diferencia FROM EMP;      
select max (SALARIO),min (SALARIO), MAX(SALARIO)- MIN(SALARIO) as diferencia FROM EMP where OFICIO= 'EMPLEADO';    
select max (SALARIO),min (SALARIO), MAX(SALARIO)- MIN(SALARIO) as diferencia, OFICIO FROM EMP where OFICIO='EMPLEADO' group by OFICIO;    
select max (SALARIO),min (SALARIO), MAX(SALARIO)- MIN(SALARIO) as diferencia, OFICIO FROM EMP where OFICIO='EMPLEADO' group by OFICIO having OFICIO='EMPLEADO'; 

select max (SALARIO),min (SALARIO), MAX(SALARIO)- MIN(SALARIO) as diferencia, 
OFICIO FROM EMP where OFICIO='EMPLEADO' 
group by OFICIO 
having OFICIO='EMPLEADO'; 



                
Visualizar el número de personas que realizan cada oficio en cada departamento ordenado por departamento.

select * from dept;
select * from emp;

select count (*) as PERSONAS, OFICIO, DEPT_NO
from EMP 
group by OFICIO, DEPT_NO
order by 3; ---el order de las columnas depende de tu select, en este caso la tercera columna es departameno, si ponemos 1 lo ordena por personas

Buscar aquellos departamentos con cuatro o más personas trabajando.

select count (*) as PERSONAS, DEPT_NO
from EMP
group by DEPT_NO
having count(*) >=4;


    7. Visualizar el número de enfermeros, enfermeras e interinos que hay en la plantilla, ordenados por la función.

select count (*) as TRABAJADORES, FUNCION
from PLANTILLA
group by FUNCION;

select count (*) as TRABAJADORES, FUNCION
from PLANTILLA
group by FUNCION
having FUNCION in ('ENFERMERO', 'ENFERMERA','INTERINO');   ---having siempre que filtres por unm campo del select

Visualizar departamentos, oficios y número de personas, para aquellos departamentos que tengan dos o más personas trabajando en el mismo oficio.

select DEPT_NO, OFICIO, count (*) as PERSONAS
from EMP
group by DEPT_NO, oficio;

select DEPT_NO, OFICIO, count (*) as PERSONAS
from EMP
group by DEPT_NO, oficio
having count(*) >=2;

    10. Calcular el valor medio de las camas que existen para cada nombre de sala. Indicar el nombre de cada sala y el número de cada una de ellas.
    
    select * from SALA;
    
    select avg (NUM_CAMA) as MEDIA_CAMAS, count(*) as NUMERO, NOMBRE
    from SALA
    group by NOMBRE;

    11. Calcular el salario medio de la plantilla de la sala 6, según la función que realizan. Indicar la función y el número de empleados.
select * from PLANTILLA;

select FUNCION,
count (*) as PERSONAS,
avg(SALARIO) as MEDIA_SALARIO
from PLANTILLA
where SALA_COD=6
group by FUNCION;

    12. Averiguar los últimos empleados que se dieron de alta en la empresa en cada uno de los oficios, ordenados por la fecha.

select max(fecha_alt) AS FECHAMAXIMA, 
Oficio from emp
group by oficio
order by 1

    13. Mostrar el número de hombres y el número de mujeres que hay entre los enfermos.
    select * from ENFERMO;
    select count (*)

    15. Calcular el número de salas que existen en cada hospital.
    
    select * from SALA;
    
    select count (*) as NUMERO_SALAS,
    HOSPITAL_COD
    from SALA group by HOSPITAL_COD;

    16. Mostrar el número de enfermeras que existan por cada sala.
    
    select * from PLANTILLA
    
    select count (*) as ENFERMERAS, SALA_COD
    from PLANTILLA
    where FUNCION='ENFERMERA'
    group by SALA_COD;
    
    --CONSULTAS DE COMBINACIÓN
    --NOS PERMITEN MOSTRAR DATOS DE VARIAS TABLAS
    --DEBEN ESTAR RELACIONADAS ENTRE SÍ MEDIANTE UNA CLAVE
    --1) NECESITAMOS CAMPO/S DE RELACIÓN ENTRE LAS TABLAS
    --2)DEBEMOS PONER EL NOMBRE DE CADA TABLA Y CADA CAMPO EN LA CONSULTA
    --
    
    select TABLA1.CAMPO1., TABLA1.CAMPO2,
    TABLA2.CAMPO1, TABLA.CAMPO2
    from TABLA1
    inner join TABLA2
    on TABLA1.CAMPO_RELACION = TABLA2.CAMPO_RELACION;
    
    --MOSTRAR APELLIDO, OFICIO DE EMPLEADOS JUNTO A 
    --NOMBRE DE DEPARTAMENTO Y LOCALIDAD
    
    select EMP.APELLIDO, EMP.OFICIO,   --Se pone el nombre de la tabla.campo, los que sea necesarios
    DEPT.DNOMBRE, DEPT.LOC             --Segunda tabla y campos
    from EMP                           --nombre 1º tabla    
    inner join DEPT                    --nombre 2ª tabla    
    on EMP.DEPT_NO = DEPT.DEPT_NO; --el on se hace sobre el campo común, como si fuera la clave foránea
   --podría hacerse ala inversa EMP--DEPT
    
    --TENEMOS OTRA SINTAXIS PARA REALIZAR LOS JOIN, NO SE UTILIZA
    select EMP.APELLIDO, EMP.OFICIO,
    DEPT.DNOMBRE, DEPT.LOC
    from EMP, DEPT
    where EMP.DEPT_no = DEPT.DEPT_NO;
    
    
    --PODEMOS REALIZAR NUESTRO WHERE
    --QUEREMOS MOSTRAR LOS DATOS DE MADRID
    select EMP.APELLIDO, EMP.OFICIO,   
    DEPT.DNOMBRE, DEPT.LOC             
    from EMP                            
    inner join DEPT                       
    on EMP.DEPT_NO = DEPT.DEPT_NO
    where DEPT.LOC = 'MADRID';
    
    --NO ES OBLIGATORIO INCLUIR EL NOMBRE DE LA TABLA ANTES DEL CAMPO A MOSTRAR EN EL SELECT
    --EL PROBLEMA CUANDO EL CAMPO ES COMÚN EN VARIAS TABLAS
     select APELLIDO, EMP.OFICIO,   
    DEPT.DNOMBRE, DEPT.LOC             
    from EMP                            
    inner join DEPT                       
    on EMP.DEPT_NO = DEPT.DEPT_NO
    where DEPT.LOC = 'MADRID';
    
    DESC EMP;

--PODEMOS INCLUIR ALIAS A LOS NOMBRES DE LAS TABLAS
--PARA LLAMARLAS ASÍ A LO LARGO DE LA CONSULTA
--ES ÚTIL CUANDO TENEMOS TABLAS CON NOMBRES MUY LARGOS
--CUANDO TENEMOS ALIAS LA TAABLA SE LLAMARA ASÍ OPARA TODAS LAS CONSULTAS

 select e.APELLIDO, e.OFICIO,   
    d.DNOMBRE, LOC             
    from EMP e                            
    inner join DEPT d                      
    on e.DEPT_NO = e.DEPT_NO;
    
    --Tenemos multiples tipos de join en las  BBDDD
    --INNER: combina resultados de las dos tablas
    --LEFT: combina las dos tablas y tambien la tabla IZQ
    --RIGHT: combina las dos tablas y fuerza la tabla dcha
    --FULL: Combina las dos tablas y fuerza las dos tablas
    --CROSS: Producto cartesiano, combina cada dato de una tabla con los otros datos de la otra tabla
    
    select DISTINCT DEPT_NO from EMP;--al no trabajar gente en el 40 no aparece
    select * from DEPT;
    
    --TENEMOS UN DEPARTAMENTO (40, PRODUCCIÓN) SIN EMPLEADOS
    --VAMOS A CREAR UN NUEVO EMPLEADO Q NO TENGA DEPARTAMENTO
    --CREAMOS EMPLEADO SIN DEPARTAMENTO EN EL 50
    
    -INSERTAR NUEVO EMPLEADO                                                                              0, nº dept, creamops trabajador en el dept 50
INSERT INTO emp VALUES('1111', 'sin dept', 'VENDEDOR', 7919, TO_DATE('06-02-1995', 'DD-MM-YYYY'), 171000, 0, 50);

select EMP:APELLIDO, DEPT.NOMBRE, DEPT.LOC
from EMP
inner join DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO;

--!!!!!!ANTES DEL join ES LEFT, después, RIGHT!!!!!

--left 
select EMP.APELLIDO, DEPT.DNOMBRE, DEPT.LOC
from EMP
left join DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO;

--RIGHT
select EMP.APELLIDO, DEPT.DNOMBRE, DEPT.LOC
from EMP
right join DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO;

--FULL JOIN NO SE UTILIZA
--COMBINA LAS DOS TABLAS Y LOS DATOS QUE NO COMBINAN
--MUESTRA EMPLEADO SIN DEPARTAMENTO Y DEPARTAMENTO SIN EMPLEADO
select EMP.APELLIDO, DEPT.DNOMBRE, DEPT.LOC
from EMP
FULL join DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO;

--CROSS JOIN: PRODUCTO CARTESIANO, NO LLEVA ON, no se suele usar
--EJEMPLO DE USO ---> TENEMOS TABLA DE COCHES, TABLA DE COLORES, MOSTRAR TODAS LAS COMBINACIONES
select EMP.APELLIDO, DEPT.DNOMBRE, DEPT.LOC
from EMP
cross join DEPT;

rollback;

--MOSTRAR LA MEDIA SALARAIAL DE LOS DOCTORES POR HOSPITAL

select * from DOCTOR;

select avg(SALARIO) as MEDIA, HOSPITAL_COD
from DOCTOR
group by HOSPITAL_COD;

--MOSTRAR LA MEDIA SALARAIAL DE LOS DOCTORES POR HOSPITAL
--MOSTRANDO EL NOMBRE DEL HOSPITAL
select * from HOSPITAL;
select avg(DOCTOR.SALARIO) as MEDIA, HOSPITAL.NOMBRE
from DOCTOR
inner join HOSPITAL
on DOCTOR.HOSPITAL_COD = HOSPITAL.HOSPITAL_COD
group by HOSPITAL.NOMBRE;

--MOSTRRAR NO DE EMPLEADOS QUE EXISTEN POR CADA LOCALIDAD

select * from DEPT;

select count (*) as EMPLEADOS, DEPT.LOC
from EMP 
inner join DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO
group by DEPT.LOC;



select count (*) as EMPLEADOS, DEPT.LOC
from EMP 
right join DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO
group by DEPT.LOC;

select count (EMP.EMP_NO) as EMPLEADOS, DEPT.LOC
from EMP 
right join DEPT
on EMP.DEPT_NO = DEPT.DEPT_NO
group by DEPT.LOC;