DROP TABLE HOSPITAL;
DROP TABLE SALA;
DROP TABLE PLANTILLA;
DROP TABLE EMPLEADO;
DROP TABLE OCUPACION;
DROP TABLE DOCTOR;
DROP TABLE ENFERMO;
DROP TABLE DEPARTAMENTO;


CREATE TABLE HOSPITAL (
    HOSPITAL_COD INT NOT NULL,
    NOMBRE VARCHAR(10) NOT NULL,
    DIRECCION VARCHAR(20) NOT NULL,
    TELEFONO VARCHAR(8) NOT NULL,
    NUM_CAMA INT NOT NULL,
    PRIMARY KEY (HOSPITAL_COD)
);

INSERT INTO HOSPITAL (HOSPITAL_COD, NOMBRE, DIRECCION, TELEFONO, NUM_CAMA)
VALUES 
    (13, 'Provincial', 'O Donell 50', '964-4264', 502),
    (18, 'General', 'Atocha s/n', '595-3111', 987),
    (22, 'La Paz', 'Castellana 1000', '923-5411', 412),
    (45, 'San Carlos', 'Ciudad Universitaria', '597-1500', 845);

CREATE TABLE SALA (
    SALA_ID INT NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1),
    HOSPITAL_COD INT NOT NULL,
    SALA_COD INT NOT NULL,
    NOMBRE VARCHAR(20),
    NUM_CAMA INT,
    PRIMARY KEY (SALA_ID)

);

INSERT INTO SALA (HOSPITAL_COD,SALA_COD, NOMBRE, NUM_CAMA)
VALUES 
   	(13, 3, 'Cuidados Intensivos', 21),
  	(13, 6, 'Psiquiátrico', 67),
  	(18, 3, 'Cuidados Intensivos', 10),
   	(18, 4, 'Cardiología', 53),
	(22, 1, 'Recuperación', 10),
	(22, 6, 'Psiquiátrico', 118),
	(22, 2, 'Maternidad', 34),
	(45, 4, 'Cardiología', 55),
	(45, 1, 'Recuperación', 13),
	(45, 2, 'Maternidad', 24)
;

CREATE TABLE PLANTILLA (
    	HOSPITAL_COD INT NOT NULL,
    	SALA_COD INT NOT NULL,
    	EMPLEADO_NO INT NOT NULL,
	APELLIDO VARCHAR(15),
	FUNCION VARCHAR(10),
	TURNO VARCHAR(1),
	SALARIO INT,
        PRIMARY KEY (EMPLEADO_NO)

);

INSERT INTO PLANTILLA (HOSPITAL_COD,SALA_COD, EMPLEADO_NO, APELLIDO, FUNCION, TURNO, SALARIO)
VALUES 
	(13, 6, 3754, 'Diaz B.', 'Enfermera', 'T', 2262000),
	(13, 6, 3106, 'Hernandez J.','Enfermero', 'T', 2755000),
	(18, 4, 6357, 'Karplus W.' ,'Interno', 'T', 3379000),
	(22, 6, 1009, 'Higueras D.', 'Enfermera', 'T', 2005000),
	(22, 6, 8422, 'Bocina G.', 'Enfermero', 'M', 1638000),
	(22, 2, 9901, 'NuÑez C.' ,'Interno', 'M', 2210000),
	(22, 1, 6065, 'Rivera G.','Enfermera', 'N', 1626000),
	(22, 1, 7379, 'Carlos R.', 'Enfermera', 'T', 2119000),
	(45, 4, 1280, 'Amigo R.', 'Interno', 'N', 2210000),
	(45, 1, 8526, 'Frank H.', 'Enfermera', 'T', 2522000),
	(22, 2, 1234, 'Garcia J.', 'Enfermero', 'M', 3000000)
;

CREATE TABLE OCUPACION (
	INSCRIPCION  INT NOT NULL,
	HOSPITAL_COD INT NOT NULL,
	SALA_COD  INT NOT NULL,
	CAMA INT,
	PRIMARY KEY (INSCRIPCION)
);


INSERT INTO OCUPACION (INSCRIPCION, HOSPITAL_COD, SALA_COD, CAMA)
VALUES
	(10995, 13, 3, 1),
	(14024, 13, 3, 3),
	(36658, 18, 4, 1),
	(38702, 18, 4, 2),
	(39217, 22, 6, 1),
	(59076, 22, 6, 2),
	(63827, 22, 6, 3),
	(64823, 22, 2, 1),
	(18004, 13, 3, 2)
;

CREATE TABLE DOCTOR (
	HOSPITAL_COD  INT NOT NULL,
	DOCTOR_NO  INT NOT NULL,
	APELLIDO VARCHAR(13),
	ESPECIALIDAD VARCHAR(16),
	PRIMARY KEY (DOCTOR_NO)
		
);
	
INSERT INTO DOCTOR (HOSPITAL_COD, DOCTOR_NO, APELLIDO, ESPECIALIDAD)
VALUES
	(13, 435, 'Lopez A.', 'Cardiología'),
	(18, 585, 'Miller G.', 'Ginecología'),
	(18, 982, 'Cajal R.', 'Cardiología'),
	(22, 453, 'Galo D.', 'Pediatría'),
	(22, 398, 'Best K.', 'Urología'),
	(22, 386, 'Cabeza D.', 'Psiquiatría'),
	(45, 607, 'Niqo P.', 'Pediatría'),
	(45, 522, 'Adams C.', 'Neurología')
;

CREATE TABLE ENFERMO (
	ENFERMO_NO INT NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1),
	INSCRIPCION  INT NOT NULL,
	APELLIDO VARCHAR(15),
	DIRECCION VARCHAR(20),
	FECHA_NAC DATE,
	S VARCHAR(1),
	NSS INT,
	PRIMARY KEY (ENFERMO_NO)	
);

INSERT INTO ENFERMO (INSCRIPCION, APELLIDO, DIRECCION, FECHA_NAC, S, NSS)
VALUES
	(10995, 'Laguia M.', 'Recoletos 50', '1967-06-23', 'M', 280862482),
	(18004, 'Serrano V.', 'Alcala 12', '1960-05-21', 'F', 284991452),
	(14024, 'Fernandez M', 'Recoletos 50', '1967-06-23', 'F', 321790059),
	(36658, 'Domin S.', 'Mayor 71', '1942-01-01', 'M', 160657471),
	(38702, 'Neal R.', 'Orense 11', '1940-06-18', 'F', 380010217),
	(39217, 'Cervantes M.', 'Peron 38', '1952-02-29', 'M', 440294390),
	(59076, 'Miller G.', 'Lopez de Hoyos 2', '1945-09-16','F', 311969044),
	(63827, 'Ruiz P.', 'Esquerdo 103', '1980-12-26', 'M', 100973253),
	(64823, 'Fraser A.', 'Soto 3', '1980-07-10', 'F', 285201776),
	(74835, 'Benitez E.', 'Argentina 5', '1957-10-05', 'M', 154811767)
;


CREATE TABLE EMPLEADO(
	EMP_NO INT NOT NULL,
	APELLIDO VARCHAR(10),
	OFICIO VARCHAR(10),
	DIR INT,
	FECHA_ALTA DATE,
	SALARIO INT,
	COMISION INT,
	DEPT_NO INT NOT NULL,
	PRIMARY KEY (EMP_NO)
);


INSERT INTO EMPLEADO (EMP_NO, APELLIDO, OFICIO, DIR, FECHA_ALTA, SALARIO, COMISION, DEPT_NO)
VALUES
	(7369, 'Sanchez','Empleado', 7902, '1980-12-17', 104000, NULL,	20),
	(7499, 'Arroyo', 'Vendedor', 7698, '1981-02-20',	208000, 39000, 30),
	(7521, 'Sala', 'Vendedor', 7698, '1981-02-22', 162500, 65000, 30),
	(7566, 'Jimenez', 'Director', 7839, '1981-04-02', 386750, NULL,	20),
	(7654, 'Arenas', 'Vendedor', 7698, '1981-09-28', 162500, 182000, 30),
	(7698, 'Negro', 'Director', 7839, '1981-05-01',	370500,	NULL, 30),
	(7782, 'Cerezo','Director', 7839, '1981-06-09', 318500, NULL, 10),
	(7788, 'Gil', 'Analista', 7566,	'1982-12-09', 390000, NULL, 20),
	(7839, 'Rey', 'Presidente', NULL, '1981-11-17', 650000,	NULL, 10),
	(7844, 'Tovar', 'Vendedor', 7698, '1981-09-08', 195000,	0, 30),
	(7876, 'Alonso', 'Empleado', 7788, '1983-01-12', 143000, NULL, 20),
	(7900, 'Jimeno', 'Empleado', 7698, '1981-12-03', 123500, NULL, 30),
	(7902, 'Fernandez' ,'Analista', 7566, '1981-12-03', 390000, NULL, 20),
	(7934, 'Muñoz', 'Empleado', 7782, '1982-01-23', 169000,	NULL, 10)	
;


CREATE TABLE DEPARTAMENTO(
	DEPT_NO INT NOT NULL,
	DNOMBRE VARCHAR(14),
	LOC VARCHAR(14),
	PRIMARY KEY (DEPT_NO)
);
	
INSERT INTO DEPARTAMENTO(DEPT_NO, DNOMBRE, LOC)
VALUES
	(10, 'CONTABILIDAD', 'MADRID'),
	(20, 'INVESTIGACIÓN', 'BILBAO'),
	(30, 'VENTAS', 'SEVILLA'),
	(40, 'OPERACIONES', 'MALAGA')
;
