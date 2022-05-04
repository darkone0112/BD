/* introducir valores
INSERT INTO nombretabla (Columna1,Columa2...)
VALUES (valor1,valor2.....; */)

INSERT INTO DEPT (DEPTNO,DNAME)
VALUES (60,'mis');
select * FROM DEPT;

/* perdir datos por pantalla 
VALUES ($valor1, $valor2..... */)

INSERT INTO DEPT (DEPTNO,DNAME,LOC)
VALUES ('&DNAME','&DNAME','&LOC');

/* Insertar en tabla nueva usando subqueries */
INSERT INTO MANAGER (ENAME, EMPNO,SAL)
(SELECT ENAME,EMPNO,SAL
            FROM EMP
            WHERE JOB IN 'MANAGER');

/* La Querie del Kino */
SELECT * FROM EMP;
INSERT INTO EMP
VALUES (7368,'KinoMaja','Maja',NULL,SYSDATE,1,10,10);

/* Ejercicios modificacion de datos */

/* 21 */
INSERT INTO TDEPTO
VALUES (123,10,350,'F',4,120,'PLANIFICACION');

/* 22 */
INSERT INTO TEMPLE
VALUES ((SELECT (MAX(NUMEM)+1) FROM TEMPLE),121,350,'10-02-01',SYSDATE,2000,NULL,2,'Garces, Constantino');

/* 23 */
CREATE TABLE TEMPLE2
AS (SELECT * FROM TEMPLE WHERE FECIN > '31/DEC/1990');

/* 24 */
DELETE FROM TEMPLE
WHERE NOMEM IN ('Garces, Constantino');

/* 25 */

SELECT E.NOMEM, E.SALAR, E.NUMDE
FROM TEMPLE E
JOIN TEMPLE B ON E.NUMDE = B.NUMDE AND E.SALAR > (SELECT AVG(SALAR)
FROM TEMPLE
GROUP BY NUMDE
HAVING NUMDE = E.numde);

/*Creacion tablas ejercicios*/
CREATE TABLE EDITORIALES
codigo_ed NUMBER(3)
nombre_ed VARCHAR2(20)
;











