DROP TABLE DEPT;
DROP TABLE EMP;
DROP TABLE HOSPITAL;
DROP TABLE SALA;
DROP TABLE DOCTOR;
DROP TABLE PLANTILLA;
DROP TABLE ENFERMO;
DROP TABLE OCUPACION;

CREATE TABLE DEPT
  (DEPT_NO NUMBER(9)
  ,DNOMBRE VARCHAR2(50)
  ,LOC VARCHAR2(50)
);

CREATE TABLE EMP
  (EMP_NO NUMBER(9)
  ,APELLIDO VARCHAR2(50)
  ,OFICIO VARCHAR2(50)
  ,DIR NUMBER(9)
  ,FECHA_ALT DATE
  ,SALARIO NUMBER(9)
  ,COMISION NUMBER(9)
  ,DEPT_NO NUMBER(9)
);

CREATE TABLE HOSPITAL(
  HOSPITAL_COD NUMBER(9)
  ,NOMBRE VARCHAR2(50)
  ,DIRECCION VARCHAR2(100),
  TELEFONO VARCHAR2(9),
  NUM_CAMA NUMBER(9)
);

CREATE TABLE SALA(
  HOSPITAL_COD NUMBER(9)
  ,SALA_COD NUMBER(9)
  ,NOMBRE VARCHAR2(60)
  ,NUM_CAMA NUMBER(9)
);

CREATE TABLE DOCTOR(
  HOSPITAL_COD NUMBER(9)
  ,DOCTOR_NO NUMBER(9)
  ,APELLIDO VARCHAR2(60)
  ,ESPECIALIDAD VARCHAR2(60),
  SALARIO NUMBER(9)
);

CREATE TABLE PLANTILLA(
  HOSPITAL_COD NUMBER(9)
  ,SALA_COD NUMBER(9)
  ,EMPLEADO_NO NUMBER(9)
  ,APELLIDO VARCHAR2(60)
  ,FUNCION VARCHAR2(60)
  ,TURNO VARCHAR2(1)
  ,SALARIO NUMBER(9)
);

CREATE TABLE ENFERMO(
  INSCRIPCION NUMBER(9)
  ,APELLIDO VARCHAR2(60)
  ,DIRECCION VARCHAR2(100)
  ,FECHA_NAC DATE
  ,SEXO VARCHAR2(1)
  ,NSS NUMBER(9)
);

CREATE TABLE OCUPACION(
  INSCRIPCION NUMBER(9)
  ,HOSPITAL_COD NUMBER(9)
  ,SALA_COD NUMBER(9)
  ,CAMA NUMBER(9)
);

ALTER TABLE EMP
ADD CONSTRAINT PK_EMP
PRIMARY KEY (EMP_NO);

ALTER TABLE DEPT
ADD CONSTRAINT PK_DEPT
PRIMARY KEY (DEPT_NO);

ALTER TABLE HOSPITAL
ADD CONSTRAINT PK_HOSPITAL
PRIMARY KEY (HOSPITAL_COD);

ALTER TABLE DOCTOR
ADD CONSTRAINT PK_DOCTOR
PRIMARY KEY (DOCTOR_NO);

ALTER TABLE PLANTILLA
ADD CONSTRAINT PK_PLANTILLA
PRIMARY KEY (EMPLEADO_NO);

ALTER TABLE ENFERMO
ADD CONSTRAINT PK_ENFERMO
PRIMARY KEY (INSCRIPCION);

insert into hospital values(19,'provincial','o donell 50','964-4264',502);
insert into hospital values(18,'general','Atocha s/n','595-3111',987);
insert into hospital values(22,'la paz','castellana 1000','923-5411',412);
insert into hospital values(45,'san carlos','ciudad universitaria','597-1500',845);
insert into hospital values(17,'ruber','juan bravo 49','914027100',217);
/
insert into sala values(19,3,'cuidados intensivos',21);
insert into sala values(19,6,'psiquiatria',67);
insert into sala values(18,3,'cuidados intensivos',10);
insert into sala values(18,4,'cardiologia',53);
insert into sala values(22,1,'recuperacion',10);
insert into sala values(22,6,'psiquiatria',118);
insert into sala values(22,2,'maternidad',34);
insert into sala values(45,4,'cardiologia',55);
insert into sala values(45,1,'recuperacion',17);
insert into sala values(45,2,'maternidad',24);
insert into sala values(17,2,'maternidad',19);
insert into sala values(17,6,'psiquiatria',20);
insert into sala values(17,3,'cuidados intensivos',21);
/
insert into plantilla values(19,6,3754,'diaz b.','ENFERMERO','T',226200);
insert into plantilla values(19,6,3106,'hernandez j.','ENFERMERO','T',275500);
insert into plantilla values(18,4,6357,'karplus w.','INTERINO','T',337900);
insert into plantilla values(22,6,1009,'higueras d.','ENFERMERA','T',200500);
insert into plantilla values(22,6,8422,'bocina g.','ENFERMERO','M',163800);
insert into plantilla values(22,2,9901,'nuñez c.','INTERINO','M',221000);
insert into plantilla values(22,1,6065,'rivera g.','ENFERMERA','N',162600);
insert into plantilla values(22,1,7379,'carlos r.','ENFERMERA','T',211900);
insert into plantilla values(45,4,1280,'amigo r.','INTERINO','N',221000);
insert into plantilla values(45,1,8526,'frank h.','ENFERMERO','T',252200);
insert into plantilla values(17,2,8519,'chuko c.','ENFERMERO','T',252200);
insert into plantilla values(17,6,8520,'palomo c.','INTERINO','M',219210);
insert into plantilla values(17,6,8521,'cortes v.','ENFERMERA','N',221200);

/
insert into doctor values(19,435,'Lopez A.','Cardiologia',350000);
insert into doctor values(18,585,'Miller G.','Ginecologia',250000);
insert into doctor values(18,982,'Cajal R','Cardiologia',290000);
insert into doctor values(22,453,'Galo C.','Pediatria',250000);
insert into doctor values(22,398,'Best K.','Urologia',150000);
insert into doctor values(22,386,'Cabeza D.','Psiquiatria',125000);
insert into doctor values(45,607,'Niqo P.','Pediatria',240000);
insert into doctor values(45,522,'Adams C.','Neurologia',450000);
insert into doctor values(17,521,'Nino P.','Neurologia',390000);
insert into doctor values(17,120,'Curro F.','Urologia',250000);
/
INSERT INTO ENFERMO VALUES(10995, 'Languia M.', 'Goya 20', TO_DATE('16-05-1956', 'DD-MM-YYYY'), 'M', 280862482);
INSERT INTO ENFERMO VALUES(18004, 'Serrano V.', 'Alcala 12', TO_DATE('21-05-1960', 'DD-MM-YYYY'), 'F', 284991452);
INSERT INTO ENFERMO VALUES(14024, 'Fernandez N.', 'Recoletos 5', TO_DATE('23-07-1967', 'DD-MM-YYYY'), 'F', 321790059);
INSERT INTO ENFERMO VALUES(36658, 'Domin S.', 'Mayor 71', TO_DATE('01-01-1942', 'DD-MM-YYYY'), 'M', 160657471);
INSERT INTO ENFERMO VALUES(38702, 'Neal R.', 'Orense 21', TO_DATE('18-07-1940', 'DD-MM-YYYY'), 'F', 380010217);
INSERT INTO ENFERMO VALUES(39217, 'Cervantes M.', 'Perón 38', TO_DATE('29-02-1952', 'DD-MM-YYYY'), 'M', 440294390);
INSERT INTO ENFERMO VALUES(59076, 'Miller G.', 'Lopez de Hoyos 2', TO_DATE('16-09-1945', 'DD-MM-YYYY'), 'F', 311969044);
INSERT INTO ENFERMO VALUES(63827, 'Ruiz P.', 'Esquerdo 103', TO_DATE('26-12-1980', 'DD-MM-YYYY'), 'M', 200973253);
INSERT INTO ENFERMO VALUES(64882, 'Fraser A.', 'Soto 3', TO_DATE('10-07-1980', 'DD-MM-YYYY'), 'F', 285201776);
INSERT INTO ENFERMO VALUES(74835, 'Benitez E.', 'Argentina 5', TO_DATE('05-10-1956', 'DD-MM-YYYY'), 'M', 154811767);
/
INSERT INTO OCUPACION VALUES(10995,19,6,1);
INSERT INTO OCUPACION VALUES(18004,19,3,2);
INSERT INTO OCUPACION VALUES(14024,19,6,3);
INSERT INTO OCUPACION VALUES(36658,18,4,1);
INSERT INTO OCUPACION VALUES(38702,18,4,2);
INSERT INTO OCUPACION VALUES(39217,22,1,1);
INSERT INTO OCUPACION VALUES(59076,22,6,2);
INSERT INTO OCUPACION VALUES(63827,22,6,3);
INSERT INTO OCUPACION VALUES(64882,22,2,1);
/
insert into dept values(10,'CONTABILIDAD','SEVILLA');
insert into dept values(20,'INVESTIGACIÓN','MADRID');
insert into dept values(30,'VENTAS','BARCELONA');
insert into dept values(40,'PRODUCCIÓN','GRANADA');
/
INSERT INTO emp VALUES('7839', 'rey', 'PRESIDENTE', NULL, TO_DATE('17-11-1995', 'DD-MM-YYYY'), 650000, NULL, 10);
INSERT INTO emp VALUES('7698', 'negro', 'DIRECTOR', 7839, TO_DATE('01-05-1995', 'DD-MM-YYYY'), 370500, 0, 30);
INSERT INTO emp VALUES('7566', 'jimenez', 'DIRECTOR', 7839, TO_DATE('02-04-1995', 'DD-MM-YYYY'), 386750, 0, 20);
INSERT INTO emp VALUES('7782', 'cerezo', 'DIRECTOR', 7839, TO_DATE('09-06-1995', 'DD-MM-YYYY'), 318500, 0, 10);
INSERT INTO emp VALUES('7499', 'arroyo', 'VENDEDOR', 7698, TO_DATE('20-02-1994', 'DD-MM-YYYY'), 208000, 39000, 30);
INSERT INTO emp VALUES('7521', 'sala', 'VENDEDOR', 7698, TO_DATE('22-02-1995', 'DD-MM-YYYY'), 162500, 65000, 30);
INSERT INTO emp VALUES('7654', 'martin', 'VENDEDOR', 7698, TO_DATE('29-07-1995', 'DD-MM-YYYY'), 162500, 182000, 30);
INSERT INTO emp VALUES('7844', 'tovar', 'VENDEDOR', 7698, TO_DATE('08-07-1995', 'DD-MM-YYYY'), 195000, 0, 30);
INSERT INTO emp VALUES('7900', 'jimeno', 'EMPLEADO', 7698, TO_DATE('03-12-1995', 'DD-MM-YYYY'), 123500, 0, 30);
INSERT INTO emp VALUES('7902', 'fernandez', 'ANALISTA', 7566, TO_DATE('03-12-1995', 'DD-MM-YYYY'), 390000, 0, 20);
INSERT INTO emp VALUES('7788', 'gil', 'ANALISTA', 7566, TO_DATE('09-11-1995', 'DD-MM-YYYY'), 390000, 0, 20);
INSERT INTO emp VALUES('7369', 'sanchez', 'EMPLEADO', 7902, TO_DATE('17-12-1994', 'DD-MM-YYYY'), 104000, 0, 20);
INSERT INTO emp VALUES('7876', 'alonso', 'EMPLEADO', 7788, TO_DATE('23-07-1995', 'DD-MM-YYYY'), 143000, 0, 20);
INSERT INTO emp VALUES('7934', 'muñoz', 'EMPLEADO', 7782, TO_DATE('23-01-1996', 'DD-MM-YYYY'), 169000, 0, 10);
INSERT INTO emp VALUES('7919', 'serra', 'DIRECTOR', 7839, TO_DATE('11-12-1997', 'DD-MM-YYYY'), 395000, 0, 20);
INSERT INTO emp VALUES('7907', 'campayo', 'ANALISTA', 7919, TO_DATE('04-06-1994', 'DD-MM-YYYY'), 251000, 25000, 20);
INSERT INTO emp VALUES('7917', 'nino', 'VENDEDOR', 7919, TO_DATE('06-02-1995', 'DD-MM-YYYY'), 171000, 0, 20);
INSERT INTO emp VALUES('7904', 'ford', 'EMPLEADO', 7907, TO_DATE('04-04-1996', 'DD-MM-YYYY'), 162500, 0, 20);
INSERT INTO emp VALUES('7914', 'gutierrez', 'ANALISTA', 7919, TO_DATE('20-10-1986', 'DD-MM-YYYY'), 258500, 50000, 20);
commit;

select * from EMP;
select * from DEPT;
select DEPT_NO, DNOMBRE, LOC from DEPT;

Select * from EMP;
--La mejor praxis es utilizar el nombre de los campos
	select * APELLIDO, OFICIO, SALARIO from EMP; (no key sensitive)→SELECT apellido, oficio…

*Se ejecuta con ctrl+ENTER

--ORDENACIÓN DE DATOS, Siempre se escribe al final y afecta al select
	Siempre es ascendente
    
    --CURSOR: RESULTADO DE LA CONSULTA

select * from EMP order by APELLIDO; (se ordena de forma ascendente)
select * from EMP order by ASC APELLIDO; (ídem, no necesario)
select * from EMP order by  DESC APELLIDO; (se ordena de forma descendente)

--ORDENAR POR MÁS DE UN CAMPO
Select from EMP order by DEPT_NO, OFICIO;

--FILTRADO DE REGISTROS
--OPERADORES DE COMPARACIÓN
/*
=
>=
<=
>
>
<> distinto !=
*/

--Oracle diferencia MAY y MIN en sus textos (key sensitive)
--Todo lo que no sea un número se escribe entre comillas simples '...'
--Para filtrar se utiliza la palabra "WHERE" y se escribe después del FROM
--MOSTRAR TODOS LOS EMPLEADOS DEL DEPARTAMIENTO 10
select * from EMP where DEPT_NO=10;
--MOSTRAR TODOS LOS EMPLEADOS CON OFICIO DIRECTOR
select * from EMP where OFICIO='DIRECTOR';
--MOSTRAR TODOS LOS EMPLEADOS CUYO OFICIO SEA DISTINTO A DIRECTOR
select * from EMP where OFICIO<>'DIRECTOR';
select * from EMP where OFICIO!='DIRECTOR';

--OPERADORES RELACIONALES, NOS PERMITEN REALIZAR MÁS DE UNA CONSULTA DENTRO DE UNA CONSULTA
/*
OR-->MUESTRA LOS DATOS DE CADA FILTRO
AND-->TODOS LOS FILTROS DEBEN CUMPLIRSE
NOT-->NEGACIÓN DE UNA CONDICIÓN (EVITARLO SIEWMPRE)
*/
--MOSTRAR LOS EMPLEADOS DEL DEPARTAMENTO 10 Y QUE SEAN DIRECTORES
select * from EMP where DEPT_NO=10 AND OFICIO= 'DIRECTOR';--DEBEN CUMPLIRSE AMBOS
select * from EMP where DEPT_NO=10 OR OFICIO= 'DIRECTOR';--TE MUESTRA TODOS LOS CAMPOS

--MOSTRAR LOS EMPLEADOS DEL DEP 10 Y DEL 20
select * from EMP where DEPT_NO=10 or DEPT_NO=20;--MAL!!NO SE CUMPLEN AMBOS
select * from EMP where DEPT_NO=10 or DEPT_NO=20;

--OTROS OPERADORES ADEMÁS DE LOS STANDARD
--BETWEEN MUESTRA LOS DATOS ENTRE UN RANGO INCLUSIVE
--MOSTRAR EMPLEADOS CON SALARIOS EN RANGO 251000-390000

select * from EMP where SALARIO between 251000 and 390000;
select * from EMP where SALARIO between 251000 and 390000 order by salario;
--PODEMOS HACER LA MISMA CONSULTA CON OPERDORES DE LA MISMA FORMA
select * from EMP where SALARIO >= 251000 and SALARIO <= 390000 order by SALARIO;
--HUIR DE LA NEGACIÓN
--MOSTRAR EMPLEADOS QUE NO SEAN DIRECTORES
select * from EMP where NOT OFICIO='DIRECTOR';--PRIMERO BUSCA LOS DIRECTORES Y LUEGO LOS DISTINTOS, MUY LENTO
--COSULTA CON OPERADOR
select * from EMP where OFICIO!='DIRECTOR';
select * from EMP where OFICIO<>'DIRECTOR';
--EXISTE UN OPERADOR PARA BUSCAR COINCIDENCIAS EN TEXTOS
--NOS PERMITE MEDIANTE CARACTERES ESPECIALES HACER FILTROS EN TEXTOS
/*
% busca cualquier caracter y longitud
_ busca un caracter cualquiera
? busca un caracter numérico
*/
--MOSTRAR LOS EMPLEADOS CUYO APELLIDO COMIENZA CON "S"
select * from EMP where APELLIDO like 's';--mostraría el apellido "s"
select * from EMP where APELLIDO like 's%';--los que comienzan con "s"
select * from EMP where APELLIDO like 's%a';--"empiezan con "s" y acaban por "a"
--MOSTRAR TODOS LOS APELLIDOS CON 4 LETRAS
select * from EMP where APELLIDO like '____';
--EXISTE OTRO OPERADOR PARA BUSCAR COINCIDENCIAS DE IGUALDAD EN UN MISMO CAMPO
--CAMPO: in (valor1, valor2)
--MOSTRAR LOS EMPLEADOS DEL DEP 10, 20 Y 30...SI SE AÑADEN CON OR
select * from EMP where DEPT_NO=10 or DEPT_NO=20 or DEPT_NO 30;
--USAMOS IN
select * from EMP where DEPT_NO in (10,20,30,55,77);
--OPERADOR not in, REALIZA LO MISMO QUE in PERO RECUPERA LOS QUE NO COINCIDEN
--EJEMPLO: MOSTRAR TODOS LOS EMPLEADOS QUE NO ESTÉN EN LOS DEPARTAMENTOS SELECCIONADOS
select * from EMP where not DEPT_NO in (10,20);--NEGACIÓN NO EFICIENTE YA QUE BUSCA LAS NEGADAS Y LUEGO DEVUELVE EL RESTO
select * from EMP where DEPT_NO not in (10,20);--NEGACIÓN EFICIENTE YA QUE ES UN OPERADOR QUE BUSCA LOS CAMPOS NO INDICADOS, AL REVÉS

--CAMPOS CALCULADOS:
--SIEMPRE TIENE QUE TENER UN ALIAS
--HERRAMIENTA DE CONSULTA QUE SIRVE PARA GENERAR CAMPOS QUE NO EXISTAN EN LA TABLA Y LOS PODEMOS CALCULAR, COMO SUMAR SALARIO Y COMISIÓN
--MOSTRAR APELLIDO, SALARIO, COMISIÓN Y EL SALARIO TOTAL (SUMA DE AMBOS)
--UN CAMPO CALCULADO SOLO ES PARA EL CURSOR
select APELLIDO, SALARIO, COMISION, (SALARIO + COMISION) from EMP;
select APELLIDO, SALARIO, COMISION, (SALARIO + COMISION) as TOTAL from EMP;
--BUSCAR EMPLEADOS CON SALARIO TOTAL >= A 344500
select APELLIDO, SALARIO, COMISION, (SALARIO + COMISION) as TOTAL from EMP where (SALARIO + COMISION) >344500;-- primero calcula el campo, luego lo nombras, pero como no existe tienes que indicarle de nuevo como se forma el campo
select APELLIDO, SALARIO, COMISION, (SALARIO + COMISION) as TOTAL from EMP order by TOTAL;--where sobre la tabla, order by sobre la consulta
--CLAUSULA DISTINCT: SE UTILIZA PARA EL SELECT Y ELIMINA REPETIDOS DE LA CONSULTA
--MOSTRAR EL OFICIO DE LOS EMPLEADOS
select OFICIO from EMP;
--MOSTRAR LOS DIFERENTES OFICIOS (SIN REPETICIÓN)
select distinct OFICIO from EMP;
--SELECIONAMOS LOS EMPLEADOS ORDENADOS POR SALARIO DE FORMA DESCENDENTE Y SU PUESTO Y APELLIDO
select OFICIO, salario, apellido from EMP order by salario desc;

                --PRACTICA 1

    --1. Mostrar todos los enfermos nacidos antes del 11/01/1970.
    select * from ENFERMO where FECHA_NAC <= '11/01/1970';
select * from ENFERMO where FECHA_NAC <= '11/01/1970' order by FECHA_NAC;
select APELLIDO, FECHA_NAC FROM ENFERMO WHERE FECHA_NAC <= '11/01/1970' order by FECHA_NAC;

    --2. Igual que el anterior, para los nacidos antes del 1/1/1970 ordenados por número de inscripción.
    select * from ENFERMO where FECHA_NAC <= '1/1/1970' order by INSCRIPCION;

    --3. Listar todos los datos de la plantilla del hospital del turno de mañana
select * from PLANTILLA where turno='M';
    --4. Idem del turno de noche.
    
select * from PLANTILLA where turno='N';

    --5. Listar los doctores que su salario anual supere 3.000.000 €.
select * from DOCTOR;
select APELLIDO, SALARIO from  DOCTOR where SALARIO > 250000;
select * from DOCTOR where(salario*12)>3000000;
select APELLIDO, SALARIO,(SALARIO*12) as SALARIO_ANUAL FROM DOCTOR where (salario*12)>3000000;

    --6. Visualizar los empleados de la plantilla del turno de mañana que tengan un salario entre 200.000 y 2.250.000.
    select APELLIDO, SALARIO from PLANTILLA where TURNO='M' and SALARIO between 200000 and 2250000;
   -- select APELLIDO, SALARIO,(SALARIO*12) as SALARIO_ANUAL FROM DOCTOR where (salario*12)>3000000;
    --select APELLIDO, SALARIO,(SALARIO*12) as SALARIO_ANUAL FROM DOCTOR where (salario*12)>3000000;
    
   -- 7. Visualizar los empleados de la tabla emp que no se dieron de alta entre el 01/01/1980 y el 12/12/1982.
select * from EMP FECHA_ALT order by FECHA_ALT;
select APELLIDO, FECHA_ALT from EMP where FECHA_ALT <= '01/01/1980' or FECHA_ALT >= '12/12/1982' order by FECHA_ALT;--Código Standart, válido para cualquier BBDD
select APELLIDO, FECHA_ALT from EMP where FECHA_ALT not between '01/01/1980' and '12/12/1982' order by FECHA_ALT;

    --8. Mostrar los nombres de los departamentos situados en Madrid o en Barcelona.*/
select * from dept;
select * from dept where loc in ('MADRID', 'BARCELONA');
select DNOMBRE, LOC from DEPT WHERE LOC= 'MADRID' or LOC='BARCELONA';
select DNOMBRE, LOC from DEPT WHERE LOC IN ('MADRID', 'BARCELONA');



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




