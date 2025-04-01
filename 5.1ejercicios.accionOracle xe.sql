CONSULTAS DE ACCION

    --1. Dar de alta con fecha actual al empleado José Escriche Barrera como programador perteneciente al departamento de producción.  Tendrá un salario base de 70000 pts/mes y no cobrará comisión. 

INSERT INTO EMP
(APELLIDO, OFICIO, FECHA_ALT, SALARIO, COMISION, DEPT_NO)
VALUES ('escriche', 'PROGRAMADOR', '28/10/2021' , 70000, 0, (SELECT DEPT_NO FROM DEPT WHERE DNOMBRE='PRODUCCION'))

    --2. Se quiere dar de alta un departamento de informática situado en Fuenlabrada (Madrid).

INSERT INTO DEPT
VALUES(50, 'INFORMATICA','FUENLABRADA')

INSERT INTO DEPT
VALUES((SELECT MAX(DEPT_NO) + 10 FROM DEPT), 'INFORMATICA','FUENLABRADA')

    --3. El departamento de ventas, por motivos peseteros, se traslada a Teruel, realizar dicha modificación.

UPDATE DEPT
SET LOC='TERUEL'
WHERE DNOMBRE='VENTAS'

    --4. En el departamento anterior (ventas), se dan de alta dos empleados: Julián Romeral y Luis Alonso.  Su salario base es el menor que cobre un empleado, y cobrarán una comisión del 15% de dicho salario.

INSERT INTO EMP
(APELLIDO, SALARIO, COMISION, DEPT_NO)
VALUES ('romeral', (SELECT MIN(SALARIO) FROM EMP WHERE OFICIO='EMPLEADO'), 
(SELECT MIN(SALARIO)*15/100 FROM EMP WHERE OFICIO='EMPLEADO')
, (SELECT DEPT_NO FROM DEPT WHERE DNOMBRE='VENTAS'))

INSERT INTO EMP
(APELLIDO, SALARIO, COMISION, DEPT_NO)
VALUES ('alonso', (SELECT MIN(SALARIO) FROM EMP WHERE OFICIO='EMPLEADO'), 
(SELECT MIN(SALARIO)*15/100 FROM EMP WHERE OFICIO='EMPLEADO')
, (SELECT DEPT_NO FROM DEPT WHERE DNOMBRE='VENTAS'))

    --5. Modificar la comisión de los empleados de la empresa, de forma que todos tengan un incremento del 10% del salario.

UPDATE EMP
SET COMISION = SALARIO*10/100

   -- 6. Incrementar un 5% el salario de los interinos de la plantilla que trabajen en el turno de noche.

UPDATE PLANTILLA
SET SALARIO = SALARIO*5/100
WHERE FUNCION = 'INTERINO' AND TURNO ='N'

    --7. Incrementar en 5000 Pts. el salario de los empleados del departamento de ventas y del presidente, tomando en cuenta los que se dieron de alta antes que el presidente de la empresa.

UPDATE EMP
SET SALARIO=SALARIO+5000
WHERE OFICIO='PRESIDENTE' OR DEPT_NO=(SELECT DEPT_NO FROM DEPT WHERE DNOMBRE='VENTAS') AND FECHA_ALT<(SELECT FECHA_ALT FROM EMP WHERE OFICIO='PRESIDENTE')

    --8. El empleado Sancha ha pasado por la derecha a un compañero.  Debe cobrar de comisión 12.000 ptas más que el empleado Arroyo y su sueldo se ha incrementado un 10% respecto a su compañero.

UPDATE EMP SET COMISION =
(SELECT COMISION + 12000 FROM EMP 
WHERE UPPER(APELLIDO) = 'ARROYO')
, SALARIO = 
(SELECT SALARIO * 1.10 FROM EMP 
WHERE UPPER(APELLIDO) = 'ARROYO')
WHERE UPPER(APELLIDO) = 'SANCHA'

   -- 9. Se tienen que desplazar cien camas del Hospital SAN CARLOS para un Hospital de Venezuela.  Actualizar el número de camas del Hospital SAN CARLOS.

UPDATE HOSPITAL
SET NUM_CAMA=NUM_CAMA-100
WHERE NOMBRE='san carlos'

    --10. Subir el salario y la comisión en 100000 pesetas y veinticinco mil pesetas respectivamente a los empleados que se dieron de alta en este año.

UPDATE EMP
SET SALARIO= SALARIO+100000, COMISION=COMISION+25000
WHERE FECHA_ALT>='01/01/2011'


    --11. Ha llegado un nuevo doctor a la Paz.  Su apellido es House y su especialidad es Diagnostico.   Introducir el siguiente número de doctor disponible.

insert into doctor values 
((select hospital_cod from hospital
where nombre='la paz')
 , (select max(doctor_no) + 1 from doctor)
 , 'House', 'Diagnostico')

    --12. Borrar todos los empleados dados de alta entre las fechas 01/01/80 y 31/12/82.

DELETE FROM EMP
WHERE FECHA_ALT BETWEEN '01/01/1980' AND '31/12/1982'

    --13. Modificar el salario de los empleados trabajen en la paz y estén destinados a Psiquiatría.  Subirles el sueldo 20000 Ptas. más que al señor Amigo R.

UPDATE DOCTOR
SET SALARIO = (SELECT SALARIO+20000 FROM PLANTILLA WHERE APELLIDO='amigo r.')
WHERE HOSPITAL_COD = (SELECT HOSPITAL_COD FROM HOSPITAL WHERE NOMBRE='la paz') AND ESPECIALIDAD='Psiquiatria'

    --14. Insertar un empleado con valores null (por ejemplo la comisión o el oficio), y después borrarlo buscando como valor dicho valor null creado.

INSERT INTO EMP
(APELLIDO, SALARIO, COMISION, DEPT_NO)
VALUES ('gutierrez', 225000, NULL, 10)

DELETE FROM EMP
WHERE OFICIO IS NULL AND COMISION IS NULL AND APELLIDO='gutierrez';

    --15. Borrar los empleados cuyo nombre de departamento sea producción.

DELETE FROM EMP
WHERE DEPT_NO = (SELECT DEPT_NO FROM DEPT WHERE DNOMBRE='PRODUCCION')

    --16. Borrar todos los registros de la tabla Emp de la forma más rápida.

DELETE FROM EMP;

TRUNCATE TABLE EMP;