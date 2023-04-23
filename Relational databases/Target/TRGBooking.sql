drop table DIM_APARTMAN cascade constraints;
drop table DIM_BR_GOSTIJU cascade constraints;
drop table DIM_BR_NOCENJA cascade constraints;
drop table DIM_OGLASAVAC cascade constraints;
drop table DIM_TIP_GOSTA cascade constraints;
drop table FCT_CENOVNA_POLITIKA cascade constraints;
drop table FCT_POLISA_OTKAZIVANJA cascade constraints;
drop table FCT_POSLOVANJE cascade constraints;
drop table DIM_VREME cascade constraints;


/*==============================================================*/
/* Table: DIM_APARTMAN 					        */
/*==============================================================*/
CREATE TABLE DIM_APARTMAN (
    APARTMAN_ID     		INTEGER 		NOT NULL,
    APARTMAN_NAZIV  		VARCHAR2(30 CHAR),
    CONSTRAINT PK_DIM_APARTMAN PRIMARY KEY ( APARTMAN_ID )
);


/*==============================================================*/
/* Table: DIM_BR_GOSTIJU 					*/
/*==============================================================*/
CREATE TABLE DIM_BR_GOSTIJU (
    BR_GOSTIJU_ID  		INTEGER 		NOT NULL,
    BR_GOSTIJU_OD  		INTEGER,
    BR_GOSTIJU_DO		INTEGER,
    CONSTRAINT PK_DIM_BR_GOSTIJU PRIMARY KEY ( BR_GOSTIJU_ID )
);


/*==============================================================*/
/* Table: DIM_BR_NOCENJA 					*/
/*==============================================================*/
CREATE TABLE DIM_BR_NOCENJA (
    BR_NOCENJA_ID  		INTEGER 		NOT NULL,
    BR_NOCENJA_OD  		INTEGER,
    BR_NOCENJA_DO  		INTEGER,
    CONSTRAINT PK_DIM_BR_NOCENJA PRIMARY KEY ( BR_NOCENJA_ID )
);


/*==============================================================*/
/* Table: DIM_OGLASAVAC 					*/
/*==============================================================*/
CREATE TABLE DIM_OGLASAVAC (
    OGLASAVAC_ID     		INTEGER 		NOT NULL,
    OGLASAVAC_NAZIV  		VARCHAR2(30 CHAR),
    CONSTRAINT PK_DIM_OGLASAVAC PRIMARY KEY ( OGLASAVAC_ID )
);


/*==============================================================*/
/* Table: DIM_TIP_GOSTA 					*/
/*==============================================================*/
CREATE TABLE DIM_TIP_GOSTA (
    TIP_GOSTA_ID 		INTEGER 		NOT NULL,
    GOST_DRZAVA 		VARCHAR2(30 CHAR),
    CONSTRAINT PK_DIM_TIP_GOSTA PRIMARY KEY ( TIP_GOSTA_ID )
);


/*==============================================================*/
/* Table: FCT_CENOVNA_POLITIKA					*/
/*==============================================================*/
CREATE TABLE FCT_CENOVNA_POLITIKA(
    CENOVNA_POLITIKA_ID		INTEGER   		NOT NULL,
    NAPLACENO_UKUPNO            NUMERIC(10,2),
    NAPLACENO_PO_NOCI           NUMERIC(10,2),
    REZERVISANA_NOC             CHAR(1),
    BR_NOCENJA_ID  		INTEGER 		NOT NULL,
    VREME_ID			INTEGER 		NOT NULL,
    APARTMAN_ID     		INTEGER			NOT NULL,
    CONSTRAINT PK_FCT_CENOVNA_POLITIKA PRIMARY KEY ( CENOVNA_POLITIKA_ID )
);


/*==============================================================*/
/* Table: FCT_POLISA_OTKAZIVANJA				*/
/*==============================================================*/
CREATE TABLE FCT_POLISA_OTKAZIVANJA (
    POLISA_OTKAZIVANJA_ID	INTEGER 		NOT NULL,
    CENA_UKUPNA                 NUMERIC(10,2),
    NAPLACENO_UKUPNO            NUMERIC(10,2),
    BR_DANA_UNAPRED_REZ	  	INTEGER,
    NACIN_PLACANJA              VARCHAR2(10),
    TIP_GOSTA_ID 		INTEGER 		NOT NULL,
    OGLASAVAC_ID 		INTEGER 		NOT NULL,
    APARTMAN_ID 		INTEGER 		NOT NULL,
    VREME_OTKAZIVANJA_ID 	INTEGER 		NOT NULL,
    VREME_POCETKA_REZ_ID 	INTEGER 		NOT NULL,
    CONSTRAINT PK_FCT_POLISA_OTKAZIVANJA PRIMARY KEY ( POLISA_OTKAZIVANJA_ID )
);


/*==============================================================*/
/* Table: FCT_POSLOVANJE 					*/
/*==============================================================*/
CREATE TABLE FCT_POSLOVANJE (
    POSLOVANJE_ID                  INTEGER 		NOT NULL,
    NAPLACENO_PO_NOCI              NUMERIC(10,2),
    NAPLACENO_UKUPNO               NUMERIC(10,2),
    APARTMAN_ID			   INTEGER 		NOT NULL,
    VREME_ID			   INTEGER 		NOT NULL,
    BR_NOCENJA_ID 		   INTEGER 		NOT NULL,
    BR_GOSTIJU_ID  		   INTEGER		NOT NULL,
    TIP_GOSTA_ID 		   INTEGER 		NOT NULL,
    OGLASAVAC_ID 		   INTEGER 		NOT NULL,
    CONSTRAINT PK_FCT_POSLOVANJE PRIMARY KEY ( POSLOVANJE_ID )
);


/*==============================================================*/
/* Table: DIM_VREME 						*/
/*==============================================================*/
CREATE TABLE DIM_VREME (
    VREME_ID			NUMERIC(10)  		NOT NULL,
    DATUM			DATE 	     		NOT NULL,
    DAN		        	VARCHAR(10),
    DAN_U_NEDELJI 		NUMERIC(10),
    DAN_U_MESECU		NUMERIC(10),
    DAN_U_GODINI		NUMERIC(10),
    PRETHODAN_DATUM 		DATE,
    NAREDAN_DATUM		DATE,
    NEDELJA_U_GODINI		NUMERIC(10),
    MESEC			VARCHAR(10),
    MESEC_U_GODINI		NUMERIC(10),
    KVARTAL_U_GODINI		NUMERIC(10),
    GODINA			NUMERIC(10),
CONSTRAINT PK_DIM_VREME PRIMARY KEY ( VREME_ID )
);
INSERT INTO DIM_VREME 
SELECT
    to_number(to_char(CurrDate, 'YYYYMMDD')) AS VREME_ID,
    CurrDate                                 AS DATUM,
    TO_CHAR(CurrDate,'Day')                  AS DAN,
    to_number(TO_CHAR(CurrDate,'D'))         AS DAN_U_NEDELJI,
    to_number(TO_CHAR(CurrDate,'DD'))        AS DAN_U_MESECU,
    to_number(TO_CHAR(CurrDate,'DDD'))       AS DAN_U_GODINI,
    CurrDate - 1                             AS PRETHODAN_DATUM,
    CurrDate + 1 			     AS NAREDAN_DATUM,
    to_number(TO_CHAR(CurrDate+1,'IW'))      AS NEDELJA_U_GODINI,
    TO_CHAR(CurrDate,'Month')                AS MESEC,
    to_number(TO_CHAR(CurrDate,'MM'))        AS MESEC_U_GODINI,
    to_number((TO_CHAR(CurrDate,'Q')))       AS KVARTAL_U_GODINI,		
    to_number(TO_CHAR(CurrDate,'YYYY'))      AS GODINA			
FROM (
    select level n, TO_DATE('31/12/1989','DD/MM/YYYY') + NUMTODSINTERVAL(level,'day') CurrDate
    from dual
    connect by level <= 7670)
ORDER BY 1;


/*==============================================================*/
/* ALTERING TABLES						*/
/*==============================================================*/
ALTER TABLE FCT_CENOVNA_POLITIKA
    ADD CONSTRAINT FK_CP_APART FOREIGN KEY ( APARTMAN_ID )
        REFERENCES DIM_APARTMAN ( APARTMAN_ID );

ALTER TABLE FCT_CENOVNA_POLITIKA
    ADD CONSTRAINT FK_CP_BR_NOC FOREIGN KEY ( BR_NOCENJA_ID )
        REFERENCES DIM_BR_NOCENJA ( BR_NOCENJA_ID );

ALTER TABLE FCT_CENOVNA_POLITIKA
    ADD CONSTRAINT FK_CP_VREME FOREIGN KEY ( VREME_ID )
        REFERENCES DIM_VREME ( VREME_ID );

ALTER TABLE FCT_POLISA_OTKAZIVANJA 
    ADD CHECK ( NACIN_PLACANJA IN ( 'KARTICA', 'KES' ) );

ALTER TABLE FCT_POLISA_OTKAZIVANJA
    ADD CONSTRAINT FK_PO_APART FOREIGN KEY ( APARTMAN_ID )
        REFERENCES DIM_APARTMAN ( APARTMAN_ID );
	
ALTER TABLE FCT_POLISA_OTKAZIVANJA
    ADD CONSTRAINT FK_PO_OGLASAV FOREIGN KEY ( OGLASAVAC_ID )
        REFERENCES DIM_OGLASAVAC ( OGLASAVAC_ID );

ALTER TABLE FCT_POLISA_OTKAZIVANJA
    ADD CONSTRAINT FK_PO_TIP_GOSTA FOREIGN KEY ( TIP_GOSTA_ID )
        REFERENCES DIM_TIP_GOSTA ( TIP_GOSTA_ID );

ALTER TABLE FCT_POLISA_OTKAZIVANJA
    ADD CONSTRAINT FK_PO_VREME_OTKAZIVANJA FOREIGN KEY ( VREME_OTKAZIVANJA_ID )
        REFERENCES DIM_VREME ( VREME_ID );

ALTER TABLE FCT_POLISA_OTKAZIVANJA
    ADD CONSTRAINT FK_PO_VREME_POCETKA_REZ FOREIGN KEY ( VREME_POCETKA_REZ_ID )
        REFERENCES DIM_VREME ( VREME_ID );

ALTER TABLE FCT_POSLOVANJE 
    ADD CONSTRAINT FK_POSL_APART FOREIGN KEY ( APARTMAN_ID )
        REFERENCES DIM_APARTMAN ( APARTMAN_ID );

ALTER TABLE FCT_POSLOVANJE 
    ADD CONSTRAINT FK_POSL_BR_GOST FOREIGN KEY ( BR_GOSTIJU_ID )
        REFERENCES DIM_BR_GOSTIJU ( BR_GOSTIJU_ID );

ALTER TABLE FCT_POSLOVANJE 
    ADD CONSTRAINT FK_POSL_BR_NOCENJA FOREIGN KEY ( BR_NOCENJA_ID )
        REFERENCES DIM_BR_NOCENJA ( BR_NOCENJA_ID );

ALTER TABLE FCT_POSLOVANJE 
    ADD CONSTRAINT FK_POSL_OGLASAVAC FOREIGN KEY ( OGLASAVAC_ID )
        REFERENCES DIM_OGLASAVAC ( OGLASAVAC_ID );

ALTER TABLE FCT_POSLOVANJE 
    ADD CONSTRAINT FK_POSL_TIP_GOSTA FOREIGN KEY ( TIP_GOSTA_ID )
        REFERENCES DIM_TIP_GOSTA ( TIP_GOSTA_ID );

ALTER TABLE FCT_POSLOVANJE 
    ADD CONSTRAINT FK_POSL_VREME FOREIGN KEY ( VREME_ID )
        REFERENCES DIM_VREME ( VREME_ID );

