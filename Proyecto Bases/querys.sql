
SELECT * FROM TDIRECT;
SELECT * FROM TORQUES;
SELECT * FROM TCONCIER;
SELECT * FROM TDIRORQ;
SELECT * FROM TCOMPOS;
SELECT * FROM TSOLIS;
SELECT * FROM TOBRA;
SELECT * FROM OBRASOLI;
SELECT * FROM CONOBR;
SELECT * FROM CONSOLI;
COMMIT;
ROLLBACK;
/* Nombre de director, orquesta de la cual es director y el concierto en el que tocan */
SELECT TDIRECT.NOMBRE AS DIRECTOR , TORQUES.NOMBRE AS ORQUESTA,TCONCIER.NOMBRE AS CONCIERTO,
TCOMPOS.NOMBRE AS COMPOSITOR,TOBRA.TITULO AS OBRA,TSOLIS.NOMBRE AS SOLISTA
FROM TDIRECT,TORQUES,TCONCIER,TCOMPOS,TOBRA,CONOBR,CONSOLI,TSOLIS
WHERE TDIRECT.NUMDIR = TORQUES.NUMDIR AND TORQUES.NUMORQ = TCONCIER.NUMORQ AND TCOMPOS.NUMCOMP = TOBRA.NUMCOMP
AND TOBRA.NUMOBR = CONOBR.NUMOBR AND CONOBR.NUMCON = TCONCIER.NUMCON AND TSOLIS.NUMSOLIS = CONSOLI.NUMSOLI AND
CONSOLI.NUMCON = TCONCIER.NUMCON;

/* NOMBRE, EDAD, ORQUESTA Y DIRECCION DEL DIRECTOR INVITADO MAS JOVEN */
SELECT TDIRECT.NOMBRE AS NOMBRE, TRUNC((SYSDATE-TDIRECT.FECNA)/365) AS EDAD,
 TORQUES.NOMBRE AS ORQUESTA,TORQUES.DIRECCION AS DIRECCION
FROM TORQUES,TDIRECT,TDIRORQ
WHERE TDIRECT.NUMDIR = TDIRORQ.NUMDIR AND TORQUES.NUMORQ=TDIRORQ.NUMORQ
AND TDIRECT.FECNA >= (SELECT MAX(TDIRECT.FECNA) FROM TDIRECT WHERE TDIRECT.TITULAR IN ('NO'));
SELECT * FROM TDIRORQ

/* MOSTRAR  EL NOMBRE DEL COMPOSITOR Y SU EDAD DE AQUELLOS MAYORES DE 50 AÑOS, LAS OBRAS
QUE HAN COMPUESTO Y LOS SOLISTAS QUE LAS HAN INTERPREATADO ASI COMO SU EDAD*/
SELECT TCOMPOS.NOMBRE AS COMPOSITOR,TRUNC((SYSDATE-TCOMPOS.FECNA)/365) AS EDAD, TOBRA.TITULO AS OBRA
,TSOLIS.NOMBRE AS SOLISTA,TRUNC((SYSDATE-TSOLIS.FECNA)/365) AS EDAD
FROM TCOMPOS,TSOLIS,TOBRA,OBRASOLI
WHERE TCOMPOS.NUMCOMP = TOBRA.NUMCOMP AND TOBRA.NUMOBR = OBRASOLI.NUMOBR AND
OBRASOLI.NUMSOLIS = TSOLIS.NUMSOLIS AND TRUNC((SYSDATE-TCOMPOS.FECNA)/365) > 50;

/* MOSTRAR EL NOMBRE DEL SOLISTA; QUE UTILIZAN INSTRUMENTOS CUYO NOMBRE EMPIEZA POR LA LETRA 'T'
ASI COMO EL TITULO DE LAS OBRAS QUE HAN INTERPRETADO */
SELECT TSOLIS.NOMBRE,TSOLIS.INSTRUMENTO,TOBRA.TITULO
FROM TSOLIS,TOBRA,OBRASOLI
WHERE TSOLIS.NUMSOLIS = OBRASOLI.NUMSOLIS AND OBRASOLI.NUMOBR = TOBRA.NUMOBR AND
TSOLIS.INSTRUMENTO LIKE 'T%' AND TRUNC((SYSDATE - TSOLIS.FECNA)/365) < (
    SELECT AVG(TRUNC(SYSDATE - TSOLIS.FECNA)/365) FROM TSOLIS
);

/* MOSTRAR EL NOMBRE DE LA ORQUESTA QUE TENGA INVITADOS ASI COMO LOS NOMBRES DE LOS INVITADOS */
SELECT TORQUES.NOMBRE AS ORQUESTA,  
TDIRECT.NOMBRE AS INVITADOS
FROM TDIRECT,TORQUES,TDIRORQ
WHERE(TDIRECT.NUMDIR = TDIRORQ.NUMDIR AND TORQUES.NUMORQ=TDIRORQ.NUMORQ); 