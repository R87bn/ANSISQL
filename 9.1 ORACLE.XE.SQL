select * from emp;

SELECT * FROM USER_TABLES;

--DICCIONARIO DE DATOS:
    --USERS_   -LOS OBJETOS DEL ESQUEMA ( = USUARIO)
    --ALL      -LOS OBJETOS DEL ESQUEMA/USUARIO Y DE OTROS ESQUEMAS EN LOS QUE EL USUARIO TIENE ALGÚN RPIVILEGIO
    --DBA_     -SOLO CON PRIVILIEGIOS DEL ADMIN. TODOS LOS OBJETOS DE LA INSTANCIA
    
    select count (*) from dba_tables;
    
    -------------------------MULTITENANT------------------------
    --TECNOLOGÍA INCLUÍDA EN 2012 (SIMILAR A DOCKER)
    
         --CDB_ (CONTAINER DATABASE) MUESTRA TODOS LOS OBJETOS DE TODOS LOS CONTENEDORES SI LA SERSIÓN ESTÁ EN EL CONTENEDOR CDB$ROOT 
         --O TODOS LOS IBJETOS DE CONENEDOR EN EL QUE SE ENCUENTRA LA SESIÓN SI ES UNA PDB (PLUGGABLE DATABASE)
         --DBA_ TODOS LOS OBJETOS DEL CONTENEDOR EN EL QUE SE ENCUENTRA LA SESIÓN
         
         --VER SI ESTÁS EN UNA MULTITENANT. SIES DISTINTO DE "0" ES MULTITENANT
          SHOW CON_ID;
         --CONTENEDOR 1 -->CDB$ROOT. LA ADMINISTRATIVA
         --CONTENEDOR 2 -->PDB$SEED. SE USA PARA CREAR PDBS NUEVAS, (SEEDERS)
         --CONTENEDOR +3 -->PDBs
         
         --CADA USUARIO TIENE SUS PROPIAS VISTAS, SUS PROPIAS TABLAS...
         
         SHOW PDBS; --MUESTRA LOS PDBS DE LA BBDD 
         SHOW CON_NAME; --MUESTRA EL CONTENEDOR
       
       ---------------DICTIONARY----------
       --APARECEN TODAS LAS TABLAS Y LOS COMENTARIOS (EN USUARIOS ADMIN)
       select * from dict;
       select * from dictionary;
       
       select * from dict WHERE TABLE_NAME LIKE '%IND%';--BUSCAR TABLAS INDICES
       
       select * from CDB_IND_STATISTICS;
       SELECT COUNT (*) FROM DBA_TABLES;
       
       ---------------TABLAS PRINCIPALES PARA CONSULTA/DESARROLLO-------------
       -- *_OBJECTS                 TODOS LOS OBJETOS
       -- *_TABLES                  TABLAS
       -- *_TAB_COLUMNS             LISTA DE COLUMNAS
       -- *_CONSTRAINTS             RESTRICCIONES
       -- *_CONS_COLUMNS            COLUMNAS DE LAS RESTRICCIONES
       -- *_VIEWS                   VISTAS
       -- * INDEXES                 INDICES
       -- *IND_COLUMNS              COLUMNAS DE LOS INDICES
       -- *_SYNONYMUS               SINONIMOS
       -- *_SEQ_SECUENCIAS          SECUENCIAS
       -- *_USER_TAB_COMMENTS       COMENTARIOS DE LAS TABLAS
       -- *_USER_COL_COMMENTS       COMMENTARIOS DE COL DE TABLAS
       
       C
       
       SELECT * FROM DICT;
       
       SELECT * FROM USER_TABLES;
       SELECT * FROM USER_TAB_COLUMNS;
       SELECT * FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'EMP' ORDER BY COLUMN_ID;
       SELECT * FROM USER_VIEWS
       
       SELECT * FROM USER_OBJECTS; 
       
       SELECT * FROM USER_CONSTRAINTS;
       SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'EMP';
        SELECT * FROM USER_CONS_COLUMNS WHERE TABLE_NAME = 'EMP';
       CREATE TABLE T1 (C1 NUMBER(3));
       COMMENT ON TABLE T1 IS 'ES UNA TABLA DE PRUEBA';

COMMENT ON COLUMN T1.C1 IS 'ES LA COLUMNA C1 DE LA T1';       
SELECT * FROM USER_TAB_COMMENTS WHERE TABLE_NAME = 'T1';
select * from user_col_comments where table_name='T1';


       --R = FOREIGN K
       --C = CHECK/NOT NULL...
       --P = PK
       --U = UNIQUE
       
       -----------------TABLAS V$--------------
       
       --VISTAS/INFORMACIÓN RELACIONADA CON EL RENDIMIENTO QUE ESTÁN EN MEMORIA, NO EXISTEN COMO TAL, NO ALMACENADAS EN DISCO
         SELECT * FROM V$SESSION;
         SELECT * FROM V$INSTANCE; 
         SELECT * FROM V$DATABASE;
          SELECT * FROM V$SQL;  ---TRABAJOS QUE REALIZA LA PROPIA BBDD
          
          
          --Practice 12-1: Introduction to Data Dictionary Views

--1 Query the USER_TABLES data dictionary view to see information about the tables that you own

SELECT * FROM USER_TABLES;

--2 Query the ALL_TABLES data dictionary view to see information about all the tables that you can access. Exclude the tables that you own.

SELECT * FROM DICT;

--3 For a specified table, create a script that reports the column names, data types, and data
--types’ lengths, as well as whether nulls are allowed. Prompt the user to enter the table
--name. Give appropriate aliases to the DATA_PRECISION and DATA_SCALE columns.
--Save this script in a file named lab_12_03.sql.


--4 Create a script that reports the column name, constraint name, constraint type, search
--condition, and status for a specified table. You must join the USER_CONSTRAINTS and
--USER_CONS_COLUMNS tables to obtain all this information. Prompt the user to enter the
--table name. Save the script in a file named lab_12_04.sql.

--5 Add a comment to the DEPARTMENTS table. Then query the USER_TAB_COMMENTS view to
--verify that the comment is present.

COMMENT ON TABLE DEPT IS 'COMENTARIO DE PRUEBA';
SELECT * FROM USER_TAB_COMMENTS WHERE TABLE_NAME = 'DEPT';

--6 6. Run the lab_02_06_tab.sql script as a prerequisite for exercises 6 through 9.
--Alternatively, open the script file to copy the code and paste it into your SQL Worksheet.
--Then execute the script. This script:
-- Drops the existing DEPT2 and EMP2 tables
-- Creates the DEPT2 and EMP2 tables 

-- TEMA 13. SECUENCIAS, SINÓNIMOS E ÍNDICES
-- SECUENCIAS


u00_ora21

drop table e purge;
create table e as select employee_id, first_name, salary, salary*12 as ann_sal
from   employees
where  employee_id < 105;

select * from e;

select * from u00_ora21.e;

grant select on e to
u01_ora21,
u02_ora21,
u03_ora21,
u04_ora21,
u05_ora21,
u06_ora21,
u07_ora21,
u08_ora21,
u09_ora21,
u10_ora21,
u11_ora21,
u12_ora21,
u13_ora21,
u14_ora21,
u15_ora21,
u16_ora21,
u17_ora21,
u18_ora21,
u19_ora21,
u20_ora21;



-- ESQUEMAS/USUARIOS
-- Como SYSDBA
select * from dba_users;


select * from user_objects;



-- SECUENCIAS
create sequence seq1;

select * from user_sequences;

select seq1.nextval from dual;

select * from e;
insert into e values (seq1.nextval, 'fn', 1, 1);
insert into e values (seq1.nextval, 'fn2', 2, 2);
select * from e;
rollback;
select * from e;
  -- Filas nuevas desaparecen
insert into e values (seq1.nextval, 'fn', 1, 1);
select * from e;
  -- La secuencia no hace "rollback"
  
-- Se puede usar como valor por defecto de una columna de una tabla
drop sequence seq1;
create sequence seq1;

create table t1 (id number(3) default seq1.nextval, nombre varchar2(100));

insert into t1 (nombre) values ('Nombre 1');
insert into t1 (nombre) values ('Nombre 2');
select * from t1;

insert into t1 (id, nombre) values (4, 'Nombre 3');
select * from t1;
insert into t1 (nombre) values ('Nombre 4');
select * from t1;

insert into t1 (nombre) values ('Nombre 5');
select * from t1;
  -- Hay dos "cuatro"
  
  
drop sequence seq1;
create sequence seq1;
drop table t1 purge;
create table t1 (id number(3) default seq1.nextval primary key, nombre varchar2(100));

insert into t1 (nombre) values ('Nombre 1');
insert into t1 (nombre) values ('Nombre 2');
select * from t1;

insert into t1 (id, nombre) values (4, 'Nombre 3');
select * from t1;
insert into t1 (nombre) values ('Nombre 4');
select * from t1;

insert into t1 (nombre) values ('Nombre 5');
select * from t1;
  -- Hay dos "cuatro"  
  

-- 
select * from user_sequences;
9999999999999999999999999999;

--



-- SINÓNIMOS

select * from u00_ora21.e;

create synonym te for u00_ora21.e;

select * from te;



create table d as select * from departments where department_id < 50;

select * from d;

create public synonym td for d;

select * from td;

--
select * from user_synonyms;

select * from all_synonyms;

select * from all_synonyms where synonym_name like '%DUAL%';
  -- dual -> sys.dual
  
select * from sys.dual;



select * from user_synonyms;
  -- aunque indique table_name, los sinónimos también se pueden hacer para
  -- vistas, etc.
  



-- ÍNDICES

select * from user_indexes;
select * from user_ind_columns;

-- ROWID


/*

TABLESPACE
DATAFILES
SEGMENTS   - El nombre de espacio que ocupa un objeto
EXTENTS    - Un conjunto de bloques contiguos en un data file
BLOCK      - Mínima unidad de almacenamiento

*/

select * from user_tables;


select rowid, employee_id, first_name
from   employees;
  -- rowid no existe en la tabla, se genera en tiempo de consulta
  -- ROWID: Primeros 15 caracteres -> data file y número de bloque
  
  --drops tables so that they cannot be restored
DROP TABLE EMP2 PURGE;
DROP TABLE dept2 PURGE;
--creates tables and adds constraints
CREATE TABLE dept2
       (id NUMBER(7),
        name VARCHAR2(25));
INSERT INTO dept2
      SELECT  department_id, department_name
      FROM    departments;
CREATE TABLE  emp2
  (id           NUMBER(7),
   last_name     VARCHAR2(25),
   first_name    VARCHAR2(25),
   dept_id       NUMBER(7));
ALTER TABLE emp2
      MODIFY (last_name   VARCHAR2(50));
ALTER TABLE    emp2
      ADD CONSTRAINT my_emp_id_pk PRIMARY KEY (id);
ALTER TABLE    dept2
     ADD CONSTRAINT my_dept_id_pk PRIMARY KEY(id);
ALTER TABLE emp2
      ADD CONSTRAINT my_emp_dept_id_fk
      FOREIGN KEY (dept_id) REFERENCES dept2(id);
