ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY';

drop table tcentr;
create table tcentr(
        numce number (2),
        nomce varchar2 (25),
        domi varchar2 (25),
        primary key (numce)
);

drop table tdepto;
create table tdepto(
        numde number (3),
        numce number (2),
        direc number (3),
        tidir varchar2 (1),
        presu number (8,2),
        depde number (3),
        nomde varchar2 (20),
        primary key (numde),
        foreign key (numce) references tcentr(numce)
);



drop table temple;
create table temple(
        numem number (3),
        numde number (3),
        extel number (3),
        fecna date,
        fecin date,
        salar number (5),
        comis number (5),
        numhi number (1),
        nomem varchar2 (20),
        primary key (numem),
	foreign key (numde) references tdepto(numde)
);


delete from tcentr;
insert into tcentr values (10, 'SEDE CENTRAL', 'C. ALCALA, 820, MADRID');
insert into tcentr values (20, 'RELACIÓN CON CLIENTES', 'C. ATOCHA, 405, MADRID');


delete from tdepto;
insert into tdepto values (100, 10, 260, 'P', 480000, NULL, 'DIRECCIÓN GENERAL');
insert into tdepto values (110, 20, 180, 'P', 600000, 100, 'DIRECCIÓN COMERCIAL');
insert into tdepto values (111, 20, 180, 'F', 440000, 110, 'SECTOR INDUSTRIAL');
insert into tdepto values (112, 20, 270, 'P', 360000, 110, 'SECTOR SERVICIOS');
insert into tdepto values (120, 10, 150, 'F', 120000, 100, 'ORGANIZACIÓN');
insert into tdepto values (121, 10, 150, 'P', 080000, 120, 'PERSONAL');
insert into tdepto values (122, 10, 350, 'P', 240000, 120, 'PROCESO DE DATOS');
insert into tdepto values (130, 10, 310, 'P', 080000, 100, 'FINANZAS');


delete from temple;
insert into temple values (110, 121, 350, '10-11-1959', '15-02-1980', 1240, NULL, 3, 'PONS, CESAR');
insert into temple values (120, 112, 340, '09-06-1965', '01-10-1998', 1400,  440, 1, 'LASA, MARIO');
insert into temple values (130, 112, 810, '09-09-1975', '01-02-1999', 1160,  440, 2, 'TEROL, LUCIANO');
insert into temple values (150, 121, 340, '10-08-1960', '15-01-1988', 1760, NULL, 0, 'PEREZ, JULIO');
insert into temple values (160, 111, 740, '09-07-1969', '11-11-1998', 1240,  440, 2, 'AGUIRRE, AUREO');
insert into temple values (180, 110, 508, '18-10-1964', '18-03-1986', 1920,  200, 2, 'PEREZ, MARCOS');
insert into temple values (190, 121, 350, '12-05-1962', '11-02-1992', 1200, NULL, 4, 'VEIGA, JULIANA');
insert into temple values (210, 100, 200, '28-09-1970', '22-01-1989', 1520, NULL, 2, 'GALVEZ, PILAR');
insert into temple values (240, 111, 760, '26-02-1972', '24-02-1996', 1120,  400, 3, 'SANZ, LAVINIA');
insert into temple values (250, 100, 250, '27-10-1976', '01-03-1997', 1800, NULL, 0, 'ALBA, ADRIANA');
insert into temple values (260, 100, 220, '03-12-1973', '12-07-1998', 2880, NULL, 6, 'LOPEZ, ANTONIO');
insert into temple values (270, 112, 850, '21-05-1975', '10-09-1996', 1520,  320, 3, 'GARCIA, OCTAVIO');
insert into temple values (280, 130, 410, '11-01-1978', '08-10-2001', 1160, NULL, 5, 'FLOR, DOROTEA');
insert into temple values (285, 122, 620, '25-10-1979', '15-02-1998', 1120, NULL, 0, 'POLO, OTILIA');
insert into temple values (290, 120, 910, '30-11-1977', '14-02-1998', 1050, NULL, 3, 'GIL, GLORIA');
insert into temple values (310, 130, 480, '21-11-1976', '15-01-2001', 1680, NULL, 0, 'GARCIA, AUGUSTO');
insert into temple values (320, 122, 620, '25-12-1987', '05-02-2008', 1620, NULL, 2, 'SANZ, CORNELIO');
insert into temple values (330, 112, 850, '19-08-1978', '01-03-2002', 1120,  360, 0, 'DIEZ, AMELIA');
insert into temple values (350, 122, 610, '13-04-1979', '10-09-2014', 1400, NULL, 1, 'CAMPS, AURELIO');
insert into temple values (360, 111, 750, '29-10-1988', '10-10-2008', 1000,  400, 2, 'LARA, DORINDA');
insert into temple values (370, 121, 360, '22-06-1997', '20-01-2017', 0880, NULL, 1, 'RUIZ, FABIOLA');
insert into temple values (380, 112, 800, '30-03-1998', '01-01-2018', 0870, NULL, 0, 'MARTIN, MICAELA');
insert into temple values (390, 110, 500, '19-02-1996', '08-10-2016', 0920, NULL, 1, 'MORAN, CARMEN');
insert into temple values (400, 111, 780, '18-08-1999', '01-11-2017', 0900, NULL, 0, 'LARA, LUCRECIA');
insert into temple values (410, 122, 660, '14-07-1998', '13-07-2018', 0820, NULL, 0, 'MUÑOZ, AZUCENA');
insert into temple values (420, 130, 450, '22-10-1996', '19-08-2018', 1600, NULL, 0, 'FIERRO, CLAUDIA');
insert into temple values (430, 122, 650, '26-02-1997', '19-08-2018', 0840, NULL, 1, 'MORA, VALERIANA');
insert into temple values (440, 111, 760, '26-09-1996', '28-02-2016', 0840,  400, 0, 'DURAN, LIVIA');
insert into temple values (450, 112, 880, '21-10-1996', '28-02-2016', 0840,  400, 0, 'PEREZ, SABINA');
insert into temple values (480, 111, 760, '04-04-1995', '28-02-2016', 0840,  400, 1, 'PINO, DIANA');
insert into temple values (490, 112, 880, '06-06-1994', '01-01-2018', 0820,  400, 0, 'TORRES, HORACIO');
insert into temple values (500, 111, 750, '08-10-1995', '01-01-2017', 200,   400, 0, 'VAZQUEZ, HONORIA');
insert into temple values (510, 110, 550, '04-05-1996', '01-11-2016', 200,  NULL, 1, 'CAMPOS, ROMULO');
insert into temple values (550, 111, 780, '10-01-2000', '21-01-2018', 100,   480, 0, 'SANTOS, SANCHO');
 
