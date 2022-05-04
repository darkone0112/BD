/* Introducir datos */
DECLARE
V_DEPTNO_NEXT DEPT.DEPTNO%TYPE;
BEGIN
INSERT INTO DEPT
VALUES('&V_DEPTNO_NEXT', 'PUBLICIDAD', 'MADRID');
END;
SELECT * FROM DEPT;
/* CAMBIAR VALOR MATRICULA CODIGO = 10 */
DECLARE
V_MATRI ALUMNOS.MATRICULA%TYPE :=0;
BEGIN
    IF V_MATRI<12000 THEN
        UPDATE ALUMNOS
        SET MATRICULA=1250
        WHERE COD = 10;
    END IF;
END;
ROLLBACK;
SELECT * FROM ALUMNOS;

/*CURSO RENTABLE*/
CREATE TABLE TEMP(
    COD_CURSO NUMBER(3) PRIMARY KEY,
    ES_RENTA VARCHAR2(15)
);
DECLARE
    V_RENTA NUMBER(7);
    V_CODIGO_CURSO NUMBER(1):=3;
BEGIN
    SELECT SUM(MATRICULA) INTO V_RENTA
    FROM ALUMNOS
    WHERE COD_CURSO=V_CODIGO_CURSO;
    IF V_RENTA > 1000000 THEN
    INSERT INTO TEMP VALUES (V_CODIGO_CURSO,'RENTABLE');
    ELSE
    INSERT INTO TEMP VALUES (V_CODIGO_CURSO,'NO RENTABLE');
    END IF;
END;

SELECT * FROM TEMP;

/* Prueba Examen */
/* 1 */
DECLARE
V_VALOR_A NUMBER(6):= &V_VALOR_A;
V_VALOR_B NUMBER(6):= &V_VALOR_B;
V_RESULTADO NUMBER(12):= (V_VALOR_A + V_VALOR_B);
BEGIN
DBMS_OUTPUT.PUT_LINE(V_RESULTADO);
END;

/* 2 */
DECLARE
V_RADIO NUMBER(6) := &V_RADIO;
V_FORMULA NUMBER(6):= 4/3*3.14*V_RADIO**3; 
BEGIN
DBMS_OUTPUT.PUT_LINE(V_FORMULA);
END;

/* 3 */
DECLARE
V_RADIO NUMBER(6) := &V_RADIO;
V_FORMULA NUMBER(6):= 2*3.14*V_RADIO; 
BEGIN
DBMS_OUTPUT.PUT_LINE(V_FORMULA);
END;

/* 4 */
DECLARE
V_SALAR EMP.SAL%TYPE;
BEGIN
SELECT SAL INTO V_SALAR
FROM EMP
WHERE ENAME LIKE '%KING%';
DBMS_OUTPUT.PUT_LINE('EL SALARIO DE KING ES: ' ||  V_SALAR || '€');
END;

/* 5 */
SELECT * FROM ITEM;
DECLARE
    V_IMPORTE_UNI ITEM.IMPORTE_UNI%TYPE;
    V_PEDIDO ITEM.PEDIDO%TYPE;
BEGIN
    SELECT IMPORTE_UNI INTO V_IMPORTE_UNI
    FROM ITEM
    WHERE PEDIDO = 102;
    SELECT PEDIDO INTO V_PEDIDO
    FROM ITEM
    WHERE PEDIDO = 102;
DBMS_OUTPUT.PUT_LINE('EL IMPORTE UNITARIO DEL PEDIDO: ' ||  V_PEDIDO || ' ES DE: ' || V_IMPORTE_UNI);
END;

/* 6 */
SELECT * FROM EMP;
DECLARE
    V_EMPNO EMP.EMPNO%TYPE :=&V_EMPNO;
    V_NOMBRE EMP.ENAME%TYPE;
BEGIN
    SELECT ENAME INTO V_NOMBRE
    FROM EMP
    WHERE EMPNO = V_EMPNO;
    DBMS_OUTPUT.PUT_LINE('EL NOMBRE DEL EMPLEADO CON NUMERO ' ||  V_EMPNO || ' ES: ' || V_NOMBRE);
END;

/* 7 */
SELECT * FROM DEPT;
DECLARE
    V_SALE DEPT.DNAME%TYPE;
    V_DEPTNO DEPT.DEPTNO%TYPE;
    V_LOC DEPT.LOC%TYPE;
BEGIN
    SELECT DNAME,DEPTNO,LOC INTO V_SALE,V_DEPTNO,V_LOC
    FROM DEPT
    WHERE DNAME LIKE '%SALES%';
    DBMS_OUTPUT.PUT_LINE('EL DEPARTAMENTO ' ||  V_DEPTNO || ' ESTA EN: ' || V_LOC);
END;

/* 8 */
DECLARE
    V_EMPNO EMP.EMPNO%TYPE := 9999;
    V_ENAME EMP.ENAME%TYPE := 'PEREZ';
    V_JOB EMP.JOB%TYPE := 'ANALYST';
    V_DEPTNO EMP.DEPTNO%TYPE := 10;
BEGIN
    INSERT INTO EMP
        (EMPNO,ENAME,JOB,DEPTNO)
    VALUES (V_EMPNO,V_ENAME,V_JOB,V_DEPTNO);
END;

/* 9 */
DECLARE
V_AUMENTAR NUMBER(4) := 2000;
V_DEPTNO DEPT.DEPTNO%TYPE :=10;
BEGIN
Update EMP
  SET SAL=SAL + V_AUMENTAR
WHERE JOB LIKE '%ANALYST%' AND DEPTNO = V_DEPTNO;
END;

/*10*/
SELECT * FROM EMP;
DECLARE
    V_EMPNO EMP.EMPNO%TYPE := &V_EMPNO;
BEGIN
    DELETE FROM EMP
    WHERE EMPNO = V_EMPNO;
END;

/* 11 */
DECLARE
    V_PRODUCTNO ITEM.PRODUCTO_NO%TYPE :=4;
    CURSOR ELCURSOR IS
    SELECT * FROM ITEM
    WHERE PRODUCTO_NO > V_PRODUCTNO;
    TEMPORAL ELCURSOR%ROWTYPE;
BEGIN
    OPEN ELCURSOR;
        DELETE FROM ITEM
        WHERE PRODUCTO_NO > V_PRODUCTNO;
        FETCH ELCURSOR INTO TEMPORAL;
        ELCURSOR%ROWCOUNT;
    CLOSE ELCURSOR;
END;
ROLLBACK;

/* retomando */
DECLARE
V_COD ALUMNOS.COD%TYPE :=&V_COD;
V_NOMBRE ALUMNOS.NOMBRE%TYPE;
BEGIN
SELECT ALUMNOS.NOMBRE INTO V_NOMBRE FROM ALUMNOS
WHERE ALUMNOS.COD=V_COD;
DBMS_OUTPUT.PUT_LINE(V_NOMBRE);
END;

DECLARE
V_NOMBRE ALUMNOS.NOMBRE%TYPE;
V_COD ALUMNOS.COD%TYPE;
V_MATRICULA ALUMNOS.MATRICULA%TYPE;
V_COD_CURSO ALUMNOS.COD_CURSO%TYPE := &V_COD_CURSO;
BEGIN
UPDATE ALUMNOS
SET ALUMNOS.MATRICULA = (SELECT AVG(ALUMNOS.MATRICULA) FROM ALUMNOS)
WHERE MATRICULA <=4000 AND ALUMNOS.COD_CURSO = V_COD_CURSO;
END;
SELECT * FROM ALUMNOS;
ROLLBACK;


/* ESTRUCTURAS DE CONTROL */
DECLARE
V_NOMBRE ALUMNOS.NOMBRE%TYPE;
V_MATRICULA ALUMNOS.MATRICULA%TYPE;
V_COD ALUMNOS.COD%TYPE:=3;
V_MEDIA ALUMNOS.MATRICULA%TYPE;
BEGIN
SELECT AVG(ALUMNOS.MATRICULA)INTO V_MEDIA FROM ALUMNOS;
SELECT ALUMNOS.COD,ALUMNOS.MATRICULA INTO V_COD,V_MATRICULA FROM ALUMNOS
WHERE ALUMNOS.COD = V_COD;
IF V_MATRICULA < V_MEDIA
THEN
SELECT ALUMNOS.NOMBRE INTO V_NOMBRE FROM ALUMNOS
WHERE ALUMNOS.COD = V_COD;
DBMS_OUTPUT.PUT_LINE('POR DEBAJO');
ELSE
DBMS_OUTPUT.PUT_LINE('POR ENCIMA');
END IF;
END;

SELECT * FROM ALUMNOS;
DECLARE
V_NOMBRE ALUMNOS.NOMBRE%TYPE;
V_MATRICULA ALUMNOS.MATRICULA%TYPE;
V_COD_CURSO ALUMNOS.COD_CURSO%TYPE;
V_MEDIA ALUMNOS.MATRICULA%TYPE;
V_I ALUMNOS.COD%TYPE:=1;
V_CODMAX ALUMNOS.COD%TYPE;
BEGIN
SELECT MAX(COD) INTO V_CODMAX FROM ALUMNOS;
SELECT AVG(ALUMNOS.MATRICULA) INTO V_MEDIA FROM ALUMNOS;
LOOP
SELECT ALUMNOS.NOMBRE,ALUMNOS.MATRICULA
INTO V_NOMBRE,V_MATRICULA
FROM ALUMNOS
WHERE ALUMNOS.COD = V_I;
IF V_MATRICULA >= V_MEDIA THEN
DBMS_OUTPUT.PUT_LINE('ALUMNO ' || V_NOMBRE || ' POR ENCIMA DE LA MEDIA' || V_MATRICULA);
ELSE
DBMS_OUTPUT.PUT_LINE('ALUMNO ' || V_NOMBRE || ' POR DEBAJO DE LA MEDIA' || V_MATRICULA);
END IF;
V_I := V_I + 1;
EXIT WHEN V_I > V_CODMAX;
END LOOP;
END;