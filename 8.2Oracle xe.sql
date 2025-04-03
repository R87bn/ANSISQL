------------------CAMPOS DE AUTOINCREMENTACIÓN------------------
--DEBIDO A LA RPOBLEMÁTICA AL REALIZAR LAS CONSULTAS DE ACCIÓN,GENERAR CAMPOS FANTASMAS Y SALTOS EN ID
--ORACLE LO SUSTITUYE POR UN CONTADOR, QUE ES UN OBJETO QUE LO UTILIZAMOS A NUESTRO ANTOJO
--Sintaxis SEQUENCE:

Create sequence NOMBRE_SECUENCIA
minvalue valor
maxvalue valor
increment by valor_incremento
start with valor_comienzo;
--Una vez creada la secuencia, tenemos DOS opciones para poder utilizarla o visualizar su valor actual.

    --1) NEXTVAL:  Incrementa en uno la secuencia por cada petición
    --2) CURRVAL: Nos devuelve el valor actual de la secuencia sin incrementar.
--!!!!No podemos utilizar secuencias con INSERT ALL!!! porque no ejecuta instrucción a instrucción
--sino que lo realiza en bloque (BATCH) y daría el mismo valor a todos los registros.

--SINTAXIS: creamos la seq con el nombre
--seleccionamos en incremento y desde donde empieza, HAY QUE EJECUTARLO!!!
create sequence seq_dept
increment by 10
start with 50;
--las secuencias no se pueden modificar, solo eliminar y crear de nuevo
--ejecutamos nextval, LA PRIMERA VEZ, QUE LA EJECUTAMOS NOS DA EL VALOR DEW START WITH
select SEQ_DEPT.nextval as SIGUIENTE from DUAL;

select seq_dept.currval as actual from dual;
--no podemos ejecutar currval hasta ejecutar nextval
--UNA VEZ INICIADO TE DA EL VALOR ACTUAL

--ya podemos insertar las nuevas columnas
INSERT INTO DEPT VALUES (SEQ_DEPT.NEXTVAL, 'NUEVO', 'NUEVO');

select * from dept;

----------si nos equivocamos...Y CREAMOS DE NUEVO--------
drop sequence seq_dept;

--UNA SEC NO VA ASOCIADA A UNA TABLA, SE PUEDE USAR EN DISTINTAS TABLAS, AUNQUE NO TENGA SENTIDO
INSERT INTO HOSPITAL VALUES (SEQ_DEPT.NEXTVAL,'EL CARMEN', 'CALLE PEZ', '12345', 125);
SELECT * FROM HOSPITAL

-----------------PRÁCTICA--------------
--NECESITO LAS SIGUIENTES CARACTERISTICAS DENTRO DE NUESTRA BBDD
--CLAVE PRIMARIA EN HOSPITAL
SELECT * FROM HOSPITAL;

alter table HOSPITAL
add constraint PK_HOSPITAL
primary key (HOSPITAL_COD);
--PK EN DOCTOR
SELECT * FROM DOCTOR;

ALTER TABLE DOCTOR
ADD CONSTRAINT PK_DOCTOR
PRIMARY KEY (DOCTOR_NO);
--RELACIONAR DOCTORES CON HOSPITAL
SELECT * FROM DOCTOR;
SELECT * FROM HOSPITAL 


ALTER TABLE DOCTOR
ADD CONSTRAINT FK_DOCTOR_HOSPITAL
FOREIGN KEY (HOSPITAL_COD)
REFERENCES HOSPITAL (HOSPITAL_COD);
--LAS PERSONAS DE LA PLANTILLA SOLAMENTE PUEDEN TRABAJAR EN TURNOS DE M,T,N

SELECT * FROM PLANTILLA;

ALTER TABLE PLANTILLA
ADD CONSTRAINT CH_PLANTILLA_TURNO
CHECK (TURNO = 'M' OR TURNO = 'T' OR TURNO = 'N');
-------OTRA FORMA-----

--BUSCAMOS LA CONSULTA
SELECT * FROM PLANTILLA WHERE TURNO IN ('M', 'T', 'N');
--LO INTORODUCIMOS EN EL CHECK
ALTER TABLE PLANTILLA 
ADD CONSTRAINT CH_PLANTILLA_TURNO
CHECK (TURNO IN ('M', 'T', 'N'));

drop table xxxx cascade constraints;--permite eliminar tablas con restricciones

--------------ARCHIVO/DATA MODELER/IMPORTAR/DICCIONARIO DE DATOS-------
ALTER TABLE DEPT
ADD CONSTRAINT PK_DEPT
PRIMARY KEY (DEPT_NO);

alter table EMP
add constraint CH_EMP_SALARIO
check (SALARIO>=0);

ALTER TABLE EMP
ADD CONSTRAINT FK_EMP_DEPT
FOREIGN KEY (DEPT_NO)
REFERENCES DEPT (DEPT_NO);

alter table EMP
add constraint PK_EMP
primary key (EMP_NO);
--------------ARCHIVO/DATA MODELER/IMPORTAR/DICCIONARIO DE DATOS/FUSIONAR-------    

--------------PRÁCTICAS------------

    /*• Crear la tabla COLEGIOS con los siguientes campos:

Campos			    Tipo de dato		     Restricción
Cod_colegio		        Numérico		         Clave Principal e Identidad
Nombre			        Texto	20 letras	     No permite nulos.
Localidad			    Texto 15 letras
Provincia			    Texto 15 letras
Año_Construcción	    Fecha
Coste_Construcción	    Numérico
Cod_Region		        Numérico
Unico			        Numérico		         Clave Unica*/

--CREAMOS LA TABLA CON EL CAMPO NOT NULL
 create TABLE COLEGIOS(
    COD_COLEGIO integer,
    NOMBRE varchar2(20) NOT NULL,
    LOCALIDAD varchar2(15),
    PROVINCIA varchar2(15),
    ANO_CONSTRUCCION DATE,
    COSTE_CONSTRUCCION NUMBER(10,2),
    COD_REGION NUMBER(10,2),
    UNICO INTEGER
    );
    
     SELECT * FROM COLEGIOS;
     DROP TABLE COLEGIOS;
     
     --  Clave Principal e Identidad COD COLEGIO
alter table COLEGIOS
add constraint PK_COLEGIOS
primary key (COD_COLEGIO);

---Unico			        Numérico		         Clave Unica
ALTER TABLE COLEGIOS
ADD CONSTRAINT U_COLEGIOS_UNICO
UNIQUE (UNICO);

--Utilizar una secuencia para insertar Colegios


--las secuencias no se pueden modificar, solo eliminar y crear de nuevo
--ejecutamos nextval, LA PRIMERA VEZ, QUE LA EJECUTAMOS NOS DA EL VALOR DEW START WI
--no podemos ejecutar currval hasta ejecutar nextval
--UNA VEZ INICIADO TE DA EL VALOR ACTUAL

--ya podemos insertar las nuevas columnas
INSERT INTO COLEGIOS VALUES (SEQ_COLEGIO.NEXTVAL, 'NUEVO', 'NUEVO', 'NUEVO','02/02/2000', 3000000, 3000,3000);

--1º CREAMOS Y EJECUTAMOS LA SECUENCIA
create sequence SEQ_COLEGIO
increment by 1
start with 1;

--2º EJECUTAMOS EL NEXTVAL
select SEQ_COLEGIO.nextval as SIGUIENTE from DUAL;

--3ºCREAMOS COLEGIO DE PRUEBA
INSERT INTO COLEGIOS VALUES (SEQ_COLEGIO.NEXTVAL, 'NUEVO', 'NUEVO', 'NUEVO','02/02/2000', 3000000, 3000,3000);

-- NO UTILIZAMOS EL -- select SEQ_COLEGIO.currval as actual from dual;

/*   • Crear la tabla PROFESORES con los siguientes campos:

Campos		    Tipo de dato		Restricción
Cod_Profe		Texto			    Clave Principal y no permite nulos.
Nombre		    Texto			    No permite nulos.
Apellido1		Texto*/
Apellido2		Texto
DNI             Texto			    Clave Unica.  Verificar formato NIF
Edad		    Numérico
Localidad		Texto
Provincia		Texto
Salario		    Numérico
Cod_Colegio   	Numérico		    Clave ajena: COLEGIOS

DROP TABLE PROFESORES;

CREATE TABLE PROFESORES(
COD_PROFE VARCHAR2(5) NOT NULL,
NOMBRE VARCHAR2(20) NOT NULL,
APELLIDO1 VARCHAR2(20),
APELLIDO2 VARCHAR2(20),
DNI VARCHAR2(9),
EDAD INT,
SALARIO NUMBER (10,2),
COD_COLEGIO NUMBER
);

SELECT * FROM PROFESORES;

/* • Crear la tabla REGIONES con los siguientes campos:

Campos		    Tipo de dato		Restricción
Cod_Region	    Numérico		    Clave Principal e Identidad
Regiones		Texto(20)		    No permite nulos.*/

create table REGIONES(
COD_REGION INT,
REGIONES VARCHAR2(20) NOT NULL);

--PK COD_REGION
ALTER TABLE REGIONES
ADD CONSTRAINT PK_REGIONES
PRIMARY KEY (COD_REGION);

/*    • Crear la tabla ALUMNOS con los siguientes campos:

Campos		    Tipo de dato		Restricción
DNI		        Texto			    Clave Principal y no permite nulos.
Nombre		    Texto			    No permite nulos.
Apellidos		Texto
Fecha_Ingreso	Fecha
Fecha_nac		Fecha
Localidad		Texto(15)
Provincia		Texto(30)
Cod_Colegio   	Numérico		    Clave ajena: COLEGIOS(Cod_colegio) */

CREATE TABLE ALUMNOS(
DNI VARCHAR2(9) NOT NULL,
NOMBRE VARCHAR2 (20),
APELLIDOS VARCHAR2(50),
FECHA_INGRESO DATE,
FECHA_NAC DATE,
LOCALIDAD VARCHAR2(15),
PROVINCIA VARCHAR2(30),
COD_COLEGIO INT
);

--PK

alter table ALUMNOS
add constraint PK_ALUMNOS
primary key (DNI);


------------------NO FUNCIONA PORQUE NO HEMOS INSERTADO LOS CAMPOS, SIEMPRE QUE CREAMOS TABLAS ES BUENO PONER UN EJEEMPLO DE PRUEBA----------

 --Clave ajena: COLEGIOS(Cod_colegio) */
ALTER TABLE ALUMNOS
ADD CONSTRAINT FK_ALUMNOS_COLEGIOS
FOREIGN KEY (COD_COLEGIO)
REFERENCES COLEGIOS (COD_COLEGIO);

----Crear una nueva relación entre el campo Cod_Region de la tabla REGIONES y Cod_Region de la tabla colegios.

ALTER TABLE COLEGIOS
ADD CONSTRAINT FK_COLEGIOS_REGIONES
FOREIGN KEY (COD_REGION)
REFERENCES REGIONES (COD_REGION);