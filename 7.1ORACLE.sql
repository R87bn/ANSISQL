--------------CREACIÓN DE TABLAS---------
-- SE UTILIZA EL LENGUAJE DML

-----Sintaxis:
CREATE TABLE NB_TABLA [(COLUMNA, COLUMNA)...]
  AS QUERY ;
  
  --EJEMPLO:
  create table PRUEBA(
    identificador integer,
    texto10 varchar2(10),
    textochar char (5)
    );
    
    describe prueba;
    
insert into PRUEBA values (1, 'abcdefgh', 'aeiou');
insert into PRUEBA values (1, 'abcdefgh', 'aeio');
insert into PRUEBA values (1, 'abcdefg', 'aeio');

select * from prueba;


--char te rellena con espacios hata completar los caracteres seleccionados

--ELIMINAR TABLA, !!!no se puede recuperar!!!
drop table PRUEBA;

--------------------AÑADIR REGISTROS------------
--SIEMPRE QUE HAGAS UN ALTER TABLE, HACE COMMIT, NO FUNCIONARÍA ROLLBACK
 create table PRUEBA(
    identificador integer,
    texto10 varchar2(10),
    textochar char (5)
    );
    
    insert into PRUEBA values (1, 'abcdefgh', 'aeiou');
    
-AGREGAMOS UNA NUEVA COLUMNAA DE TIPO TEXTO LLAMADA "NUEVA"

alter table PRUEBA
add (NUEVA varchar2 (3));

--AGREGAMOS OTRA DE TIPO TEXTO QUE NO ADMITA NULOS  LLAMADA "SINNULOS"

alter table PRUEBA
add (SINNULOS varchar2 (7) not null);

--EN TABLA CON REGISTROS, DE MOMENTO, NO SE PUEDE AÑADIR UN CAMPO "NOT NULL"
--YA QUE LOS REGISTROS ANTERIORES NO TIENEN ESEW CAMPO CUMPLIENDO LA CONDICIÓN

--ELIMINAR COLUMNA

ROLLBACK;
DROP TABLE PRUEBA;
select * from prueba;

drop column NUEVA;

----MODIFICAR TIPADO DE COLUMNA------

 create table PRUEBA(
    identificador integer,
    texto10 varchar2(10),
    textochar char (5)
    );
    
    alter table SINNULOS
add (SINNULOS varchar2 (7) not null);
-----------------------------
alter table PRUEBA
modify SINNULOS NUMBER (7);

--TRUNCATE: LA FORMA MÁS RÁPIDA DE BORRAR UNA TABLA---
--LIBERA MUCHO ESPACIO EN BBDD Y NO DEJA HUELLA
 TRUNCATE TABLE PRUEBA; --NO EJECUTAR
 
 --RENOMBRAR TABLA---HACE COMMIT AUTOMÁTICO
 
 RENAME PRUEBA TO PRUEBA1; --NO EJECUTAR, SEGUIMOS CON "TABLA"

----COMENTARIO---
comment on table PRUEBA
is 'Hoy es miercoles';

----CONSULTAS AL DICCIONARIO DE DATOS-----
--1)DESCRIBIR LAS TABLAS

SELECT * FROM USER_TAB_COMMENTS WHERE TABLE_NAME='PRUEBA';

SELECT * FROM ALL_TAB_COMMENTS WHERE TABLE_NAME='PRUEBA';

--USER ES SOLO PARA VER LOS COMM DE MI USUARIO, ALL ES PARA VER EL DE TODOS (ADMIN)

--2)VER LAS TABLAS
select * from USER_TABLES;
select * from ALL_TABLES;

--3)VER LOS DISTINTOS TIPOS DE OBJETOS

SELECT DISTINCT OBJECT_TYPE FROM USER_OBJECTS;

--4)VER LOS OBJETOS PROPIEDAD DEL USUARIO

SELECT * FROM FROM CAT;

--RESTRICCIÓN DE BAJO NIVEL: TIPO DE DATO, NULL, NOT NULL Y PRECISIÓN (EJ LONGITUD 50)
--RESTRICCIONES DE NIVEL MEDIO
     
    -- Restricciones de nivel medio: Debemos incluirlas a partir de la creación de la tabla una vez que ya esté creada.  
        --Primary Key: SÓLO UNA POR TABLA
       
        --Foreign Key: Restricción de relación entre tablas
       
        --Unique: Restricción de campo único.  Impide que existan repetidos en un campo. 
        --Podemos poner más de un campo Unique por tabla.  Admite Nulos.
        --Esta restricción se representa en los diagramas con la letra U.
       
        --Check:  Comprueba que se introduzcan valores correctos en un campo mediante una condición.  
        --Si no cumplimos la condición, no se incluye el registro.  
        --Un check solamente puede verificar valores CONSTANTES.
        --(ej, asignar 'M' 'N' 'T' A LA FILA TURNO
    

 DROP TABLE PRUEBA;
 
  create table PRUEBA(
    identificador integer,
    texto10 varchar2(10),
    textochar char (5)
    );
    
     insert into PRUEBA values (1, 'abcdefgh', 'aeiou');
     
     SELECT * FROM PRUEBA;
     
     DESCRIBE PRUEBA;
     
     --AÑADIMOS UNA NUEVA COLUMNA LLAMADA TEXTO
     ALTER TABLE PRUEBA
     ADD (TEST INT);
     
     --AÑADIMOS OTRA COLUMNA CON VALORES POR DEFECTO
     ALTER TABLE PRUEBA
     ADD (DEFECTO INT DEFAULT -1);
     
     insert into PRUEBA
     (identificador, texto10, textochar)
     values (2, 'AA', 'aa');
     
     insert into PRUEBA
     (identificador, texto10, textochar, defecto)
     values (2, 'AA', 'aa', '22');
     
      insert into PRUEBA
     (identificador, texto10, textochar, defecto)
     values (2, 'AA', 'null', '5');
     
     ---si es un campo string, enm un campo nulo puedes poner "null" ya que "nulee" es una string como tal
     
     
     -------------------------RESTRICCIONES DE ALTO NIVEL------------------
     --Consumen recursos de la base de datos.  
     --Se utilizan cuando no existen restricciones de integridad en los datos, 
     --sino que son características propias de la lógica de la BBDD.
     --TRIGGERS: son disparadores de acción sobre los datos de las tablas.
     --Ejemplo:No podemos eliminar al Presidente REY.  
     --Crearíamos un código PL/SQL dónde si alguien intenta eliminar (DELETE) a Rey,
     --lanzamos una excepción y no podrá eliminarlo.
     
--INCLUIMOS RESTRICCIÓN PRIMARY KEY (PK) EN ELCAMPO DPT_NO PARA QUE NO PUEDA ADMITIR NULOS

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

--------COPIAR Y PEGAR LA TABLA LIMPIA-----------


alter table DEPT
add constraint PK_DEPT
primary key (DEPT_NO);

select * from USER_CONSTRAINTS;

--INTENTAR INSERTAR UN DEPT REPETIDO, NO TE DEJA DEBIDO A LA PK

INSERT INTO DEPT VALUES (10, 'REPE', 'REPE');
--ORA-00001: restricción única (SYSTEM.PK_DEPT) violada--

--ELIMINAMOS LA RESTRICCION DE PK DE DEPT E INTENTAMOS INSERTAR DE NUEVO

alter table DEPT
drop constraint
PK_DEPT;

INSERT INTO DEPT VALUES (10, 'REPE', 'REPE');

select * from dept;

--SI INTENTAMOS HACER LA RESTRICCIÓN, Y LA TABLA NO SE CUMPLE, NO TE DEJA
alter table DEPT
drop constraint
PK_DEPT;
--SI HACEMOS ALTER TABLE SE GUARDA LA TABLA, ASÍ QUE ROLLBACK NO FUNCIONA
ROLLBACK;
--ME CARGO LOS DOS DEWPT_NO=10
delete from DEPT where dept_no=10;
commit;

---------------------------EMPLEADOS-------------------
--CREAMOS UNA PK PARA EL CAMPO EMP_NO
alter table EMP
add constraint PK_EMP
primary key (EMP_NO);

select * from EMP;

--AÑADIMOS RESTRICCIÓN PARA QUE SALARIO SIEMPRE SEA POSITIVO 
--ES UN CHECK, SINTAXIS: CH_TABLA_CAMPO O CHK_TABLA_CAMPO
alter table EMP
add constraint CH_EMP_SALARIO
check (SALARIO>=0);

--PONEMOS UN VALOR NEGATIVO A UN EMPLEADO, NO TE DEJA

update EMP set SALARIO = -1 where EMP_NO=7782;

----eliminamos la restricción y lo intentamos de nuevo
alter table EMP
drop constraint CH_EMP_salario;

update EMP set SALARIO = -1 where EMP_NO=7782;

select * from EMP;

-----------------------------------------------ENFERMO------------------

select * from ENFERMO;
--QUEREMOS DOS CAMPOS ÚNICOS, SÓLO PODEMOS PONER UNA PK POR TABLA
--AÑADIMOS UNA PK A UNO DE LOS CAMPOS, Y AL RESTO UNIQUE

alter table ENFERMO
add constraint PK_ENFERMO
primary key (INSCRIPCION);

ALTER TABLE ENFERMO
ADD CONSTRAINT U_ENFERMO_NSS
UNIQUE (NSS);

--AL TRENER LA PK Y EL UNIQUE ACTICVADO NO NOS DEJA INTRODUCIR PACIENTES CON ESOS DATOS REPETIDOS
select * from ENFERMO;
insert into ENFERMO values (10995,'nuevo', 'calle nueva', '01/01/2000', 'f', '123');
insert into ENFERMO values (22222,'nuevo', 'calle nueva', '01/01/2000', 'f', '321790059')

--¿NULOS EN PK?NUNCA DEBE ADMITIR NULOS EN PK
insert into ENFERMO values (123456, 'nuevo', 'calle nueva', '01/01/2000', 'f', '123');
desc enfermo;
select * from ENFERMO;

--¿NULOS EN UNIQUE?--SI NO PONEMOS LA RESTRICCIÓN ANTES, SÍ
insert into ENFERMO values (22222,'nuevo', 'calle nueva', '01/01/2000', 'f' 'null');
select * from ENFERMO;
desc enfermo;