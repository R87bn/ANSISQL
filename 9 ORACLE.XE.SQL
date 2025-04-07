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