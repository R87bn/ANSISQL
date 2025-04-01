--CONSULTAS INSERT ALL

--Vamos a visualizar otro tipo de consultas de acción únicas de oracle

--En Ansi SQL no existen consultas masivas de datos a no ser que los recuperemos de otra tabla.


--ANSI SQL: Un insert para cada registro.  

--5 inserciones = 5 insert

--Bulk insert

--Inserta mas rápido que el resto de consultas, porque el motor de base de datos sabe que tiene que ejecutar un conjunto.

--1) Insertar varios registros en una tabla que exista
--SINTAXIS:

     INSERT ALL
              INTO TABLA VALUES (VALOR1, VALOR2)
              INTO TABLA VALUES (VALOR1, VALOR2)
              INTO TABLA (CAMPO1, CAMPO2) VALUES (VALOR1, VALOR2)
     SELECT * FROM DUAL;



select * from DEPT;
insert all
into DEPT values (50, 'ORACLE', 'BERNABEU')
into DEPT values (60, 'I+D', 'OVIEDO')
select * from DUAL;

rollback;

--CON DUAL SE EVITA QUE SE DUPLIQUEN LOS DATOS DE FORMA EXPONENCIAL YA QUE EL INSERT ALL INSERTA REGISTROS POR CADA NUMERO DE FILA
--EN EL EJEMPLO ANTERIOR HAY 4 FILAS, POR DOS REGISTRON SERÍAN 8

--INSERT DE ANSISQL (MENOS RÁPIDO)
insert into DEPT values ((select max (DEPT_NO) + 1 from DEPT), 'INTO', 'INTO');
insert into DEPT values ((select max (DEPT_NO) + 1 from DEPT), 'INTO2', 'INTO2');
insert into DEPT values ((select max (DEPT_NO) + 1 from DEPT), 'INTO3', 'INTO3');

select * from DEPT;

-----------------------agregamos CON EL INSERT ALL

insert all
into DEPT values ((select max (DEPT_NO) + 1 from DEPT), 'ALL', 'ALL')
into DEPT values ((select max (DEPT_NO) + 1 from DEPT), 'ALL2', 'ALL2')
into DEPT values ((select max (DEPT_NO) + 1 from DEPT), 'ALL3', 'ALL3')
select * from DUAL;

--NO ES ÚTIL PARA REGISTROS CON CLAVES ÚNICAS YA QUE AL HCAERLO DE GOLPE SE DUPLICAN LOS NÚMEROS Y NO LOS SUMA 
rollback;


-----CREACION DE TABLAS PARA INSERCIONES

--CREATE..SELECT

--Esta instrucción lo que realiza es crear tablas a partir de un select
--Solamente podemos utilizarla una vez.  Si la tabla ya está creada, devuelve error.

--También inserta registros en la tabla si el select devuelve registros

--Create permite crear objetos permanentes dentro de la bbdd.

--Se utiliza para la creación de objetos que iremos viendo en clases posteriores

--Ahora mismo lo que estamos viendo para una herramienta de inserción

--CREATE...SELECT no solo crea, sino que además incluye los mismos tipos de dato que el origen.

--ROLLBACK NI COMMIT FUNCIONAN.  TODO QUEDA ALMACENADO.

--SINTAXIS:

      CREATE TABLE DESTINO
      AS
      SELECT * FROM ORIGEN;

--Hacer una COPIA DE SEGURIDAD de la tabla departamentos.

select * from DEPT;
describe dept;

create table DEPARTAMENTOS
as
select * from DEPT;

describe DEPARTAMENTOS;
select * from DEPARTAMENTOS;

-------------CREAMOS UNA TABLA CON REGISTROS DE VARIAS TABLAS Y DANDO ALIAS

create table DOCTORESHOSPITAL
as
select DOCTOR.DOCTOR_NO as IDDOCTOR,
DOCTOR.APELLIDO, HOSPITAL.NOMBRE, HOSPITAL.TELEFONO
from DOCTOR
inner join HOSPITAL
on DOCTOR.HOSPITAL_COD = HOSPITAL.HOSPITAL_COD;

select * from DOCTORESHOSPITAL;
------------------------------------------------------

--INSTRUCCION INSERT INTO SELECT
--NOS PERMITE COPIAR DATOS DE UNA TABLA ORIGEN A UNA TABLA DESTINO 
--LA DIFERENCIA CON CREATE...SELECT ESTÁ EN QUE LA TABLA DEBE EXISTIR
--SIN TABLA DE DESTINO NO PODEMOS EJECUTAR ESTA INSTRUCCION
--LA TABLA DE DESTINO DEBE DE TENER LA MISMA ESTRUCTURA QUE LOS DATOS DEL SELECT DE ORIGEN
--SINTAXIS:
    INSERT INTO DESTINO
    SELECT * FROM ORIGEN;
    
    --COPIAMOS LOS DATOS DE LA TABLA DEPT DENTRO DE LA TABLA DEPARTAMENTOS
    
    insert into DEPARTAMENTOS
    select * from DEPT;
    select * from DEPARTAMENTOS;
    
    ------------------VARIABLES DE SUSTITUCIÓN-------------------
    --SON ELEMENOTOS QUE PERMITEN SUSTITUIR PARTE DEL CÓDIGO DE UNA
    --CONSULTA SQL ORACLE CUANDO ENCUENTRA & O && PREGUNTA POR EL VALOR AL USUARIO
    
    SELECT APELLIDO, OFICIO, SALARIO, COMISION FROM EMP
    WHERE EMP_NO = &NUMERO;
    
    SELECT * FROM EMP;
    
    --Cuando Oracle encuentre un & lo tomará como variable de sustitución y nos solicitará introducir un valor a esa variable a través de un cuadro de diálogo.
    --Al introducir un valor, ese dato será sustituido por la variable y ejecutará la consulta.
    
    ---------------------
    Tenemos que considerar el tipo de dato a sustituir. Si el dato fuera un String la consulta quedaría así:
    
    select apellido, oficio, salario, comision from emp
    where emp_no=&ape;
    
    ---La variable puedes sustituir parte de una consulta, no sólo un criterio de búsqueda:
---------------------------------


       select apellido, oficio, salario, comision from emp
    where apellido=&ape;
    --La variable puedes sustituir parte de una consulta, no sólo un criterio de búsqueda:
    --En el ejemplo anterior estamos solicitando toda una condición como parte del filtrado.
    
      select apellido, oficio, salario, comision from emp
    where &condicion;
    
    ------------------
    Ejemplo con &&:

Cuando se utiliza “&&” el entorno solo solicita la variable una vez durante una misma sesión.

Ejemplo:
select apellido, oficio, salario, comision from emp
    where &campo1='dato';
    
    select apellido, &&camppo1, salario, comision, dept_no from emp
    where &campo1='&dato';
    --El valor de campo1 lo pide una única vez en toda la sesión.
    --Podemos apreciar como solicitamos en la condición where el valor de campo1 y no lo vuelve a pedir.
    --DEFINE DATO, CREA UNA VARIABLE PARA REALIZAR LAS CONSULTAS, EJEMPLO, "VENDEDOR"
--CADA VEZ QUE PIDAS "&DATO" PEDIRÁ "VENDEDOR" HASTA QUE HAGAS EL "UNDEFINED"

------------------------------------------

--------------DEFINE Y UNDEFINE variable-----------------------------

--El comando DEFINE nos permite definir una variable que se sustituye textualmente en cualquier lugar de nuestro script.
--UNDEFINE dará por finalizado el uso de dicha variable. Si ignoramos UNDEFINE se podrá utilizar en toda la sesión.

--------------------------SET VERIFY--------------------------

--Utilice el comando VERIFY para visualizar el valor de la variable de sustitución.

----------------------NATURAL JOIN-------------sustituye al inner join, join para vagos

--Un natural join toma las columnas de igual nombre entre dos tablas
--Las utiliza para realizar un join
--El beneficio es que no hay que nombrar las columnas en el join.

SELECT apellido, loc from emp natural join dept;
SELECT apellido, oficio, dnombre, loc from emp natural join dept;

--A LO BESTIA
select * from emp natural join dept;
select * from emp natural join dept natural join hospital;--mal
select * from emp natural join dept, hospital;

---------------------USING--------------

--Permite especificar el campo (o los campos) por el cual se enlazarán las tablas;
--los campos de ambas tablas deben tener el mismo nombre y ser de tipos compatibles.


SELECT apellido,loc,dnombre from emp inner join dept
using (dept_no)


-------------------SELF KEY, CONSULTASD DE RECUPERACIÓN JERÁRQUICA-----------------
--NECESITO SABER LOS EMPLEADOS QUE TRABAJAN PARA negro (7698)
--el campo "dir" indica para quien trabaja un empleado
select * from emp;
select * from emp where dir = 7698;

--Los que trabajan para REY (7839)
select * from emp where dir = 7839;

--Con las consultas jerárquicas, puede recuperar datos basándose en una relación 
--jerárquica natural entre filas de una tabla.

--SINTAXIS
SELECT [LEVEL], column, expr...
FROM table
[WHERE condition(s)]
[START WITH condition(s)]
[CONNECT BY PRIOR condition(s)];

--SELECT:  Es la cláusula SELECT estándar.
--LEVEL:  Para cada fila devuelta por una consulta jerárquica, la pseudocolumna LEVEL devuelve 1 para una fila de raíz, 2 para un secundario de la raíz y así sucesivamente.
--FROM: table Especifica la tabla, la vista o la instantánea que contiene las columnas. Puede seleccionar de una sola tabla.
--WHERE:  Restringe las filas devueltas por la consulta sin que afecte a otras filas de la jerarquía.
--condition: Es una comparación con expresiones.
--START WITH: Especifica las filas de raíz de la jerarquía (dónde comenzar). Esta cláusula es necesaria para una consulta jerárquica verdadera.
--CONNECT BY: Especifica las columnas en las que existe la relación entre filas PRIOR principales y secundarias. Esta cláusula es necesaria para una consulta jerárquica.

--MOSTRAMOS LOS EMPLEADOS SUBORDINADOS A PARTIR DEL DIRECTOR JIMENEZ

----en el caso inferior level as nivel es opcional
select LEVEL as NIVEL, APELLIDO, OFICIO from EMP
connect by prior EMP_NO=DIR
start with APELLIDO='jimenez';

select LEVEL as NIVEL, APELLIDO, OFICIO from EMP
connect by EMP_NO= prior DIR
start with APELLIDO='jimenez';

--PRIOR: SE UTILIZA EN EL nº empleado te da los "hijos", si se utiliza en DIR los "padres"
--HACIA ARRIBA, REPETIDOS, HACIA ABAJO, ÚNICOS
--ARROYO QUIERE REUNR A TODOS SUS JEFES EN EL DESPACHO

select LEVEL as NIVEL, APELLIDO, OFICIO from EMP
connect by EMP_NO= prior DIR
start with APELLIDO='arroyo' order by 1;


---------------------------SYS_CONNECT_BY_PATH---------------------


--La función SYS_CONNECT_BY_PATH() concatena los valores de las ramas del árbol en el recorrido.

select level, emp_no,apellido, dir,SYS_CONNECT_BY_PATH(apellido,'/') as desciende 
from emp
connect by prior emp_no=   dir
start with apellido='jimenez' order by 1;


select LEVEL as NIVEL, APELLIDO, OFICIO, 
SYS_CONNECT_BY_PATH(apellido, '/') as RELACION
from EMP
connect by EMP_NO= prior DIR
start with APELLIDO='arroyo' order by 1;


---------------------------OPERADORES CONJUNTOS------------------------

    ----------------OPERADOR UNION--------------
--VES TODOS LOS RESULTADOS
--Es un operador que combina un conjunto de resultados, por ejemplo, 
--una sentencia SELECT con OTRA Sentencia SELECT
--Sirve para recuperar datos de una o más tablas sin que existe relación entre las tablas.

    -- No existe límite en el número de tablas a combinar.
    -- El número de columnas de las consultas debe ser el mismo para todas las consultas
    -- Los tipos de datos de las columnas deben coincidir en todas las consultas
    -- Recomendable utilizar alias para las columnas.
    
    ------------------OPERADOR INTERSECT ------------
    --MUESTRA LOS DATOS COINCIDENTES ENTRE DOS CONSULTAS
    --Permite unir dos consultas SELECT de modo que el resultado
    --serán las filas que estén presentes en ambas consultas.
    
        --EJEMPLO: TABLA PLANTILLA VS HISTORIAL PLANTILLA
        --NO TIENEN NADA QUE VER, SI HACEMOS UN UNION SALDRÍAN TODOS LOS TRABAJADORES
        --SI HACEMOS EL INTERSECT SALDRÍAN LOS QUE SIGUEN TRABAJANDO
        
    -----------------OPERADOR MINUS----------------------
        --MUESTRA LOS QUE NO ESTÁN PRESENTES
        --MUESTRA DATOS REPETIDOS AL COMBINARLO CON INTERSECT
        
        
SELECT * FROM PLANTILLA WHERE TURNO='T'
UNION
SELECT * FROM PLANTILLA WHERE FUNCION='ENFERMERA';

SELECT * FROM PLANTILLA WHERE TURNO='T'
INTERSECT
SELECT * FROM PLANTILLA WHERE FUNCION='ENFERMERA';

SELECT * FROM PLANTILLA WHERE TURNO='T'
MINUS
SELECT * FROM PLANTILLA WHERE FUNCION='ENFERMERA';
    

    
