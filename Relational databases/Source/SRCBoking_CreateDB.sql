drop table SRC_Country cascade constraints;
drop table SRC_City cascade constraints;
drop table SRC_Guest cascade constraints;
drop table SRC_Building cascade constraints;
drop table SRC_Apartment_Type cascade constraints;
drop table SRC_Apartment cascade constraints;
drop table SRC_Reservation cascade constraints;
drop table SRC_Content cascade constraints;
drop table SRC_Contains cascade constraints;
drop table SRC_Apartment_Ocupancy cascade constraints;
drop table SRC_Pricelist cascade constraints;


/*==============================================================*/
/* Table: SRC_Country                                           */
/*==============================================================*/
CREATE TABLE SRC_Country (
    country_id    		INTEGER 		NOT NULL,
    country_name 		VARCHAR2(30 CHAR) 	NOT NULL,
    CONSTRAINT pk_country PRIMARY KEY ( country_id )
);


/*==============================================================*/
/* Table: SRC_City                                              */
/*==============================================================*/
CREATE TABLE SRC_City (
    city_id     		INTEGER 		NOT NULL,
    city_name   		VARCHAR2(30 CHAR) 	NOT NULL,
    country_id  		INTEGER 		NOT NULL,
    CONSTRAINT pk_city PRIMARY KEY ( city_id )
);


/*==============================================================*/
/* Table: SRC_Guest                                             */
/*==============================================================*/
CREATE TABLE SRC_Guest (
    guest_id         		INTEGER 		NOT NULL,
    guest_firstname  		VARCHAR2(30 CHAR) 	NOT NULL,
    guest_lastname   		VARCHAR2(30 CHAR) 	NOT NULL,
    guest_password   		VARCHAR2(30 CHAR) 	NOT NULL,
    guest_email      		VARCHAR2(30 CHAR) 	NOT NULL,
    guest_contact    		INTEGER 		NOT NULL,
    country_id       		INTEGER 		NOT NULL,
    CONSTRAINT pk_guest PRIMARY KEY ( guest_id )
);


/*==============================================================*/
/* Table: SRC_Building                                          */
/*==============================================================*/
CREATE TABLE SRC_Building (
    building_id       		INTEGER 		NOT NULL,
    building_name     		VARCHAR2(30 CHAR) 	NOT NULL,
    building_address  		VARCHAR2(30 CHAR) 	NOT NULL,
    building_status   		VARCHAR2(10) 		NOT NULL,
    building_type     		VARCHAR2(30),
    city_id           		INTEGER 		NOT NULL,
    CONSTRAINT pk_building PRIMARY KEY ( building_id )
);

ALTER TABLE SRC_Building 
    ADD CHECK ( building_status IN ( 'Open', 'Temporary_Closed', 'Closed' ) );

ALTER TABLE SRC_Building 
    ADD CHECK ( building_type IN ( 'In_City', 'On_Beach', 'In_Mountain' ) );


/*==============================================================*/
/* Table: SRC_Apartment_Type                                    */
/*==============================================================*/
CREATE TABLE SRC_Apartment_Type (
    apartment_type_id    	INTEGER 		NOT NULL,
    apartment_type_name  	VARCHAR2(30 CHAR) 	NOT NULL,
    apartment_type_desc  	VARCHAR2(100 CHAR),
    CONSTRAINT pk_apartment_type PRIMARY KEY ( apartment_type_id )
);


/*==============================================================*/
/* Table: SRC_Apartment				                */
/*==============================================================*/
CREATE TABLE SRC_Apartment (
    apartment_id       		INTEGER 		NOT NULL,
    apartment_status   		VARCHAR2(10) 		NOT NULL,
    apartment_name     		VARCHAR2(30 CHAR) 	NOT NULL,
    apartment_number   		INTEGER 		NOT NULL,
    building_id        		INTEGER 		NOT NULL,
    apartment_type_id  		INTEGER 		NOT NULL,
    CONSTRAINT pk_apartment PRIMARY KEY ( apartment_id )
);

ALTER TABLE SRC_Apartment 
    ADD CHECK ( apartment_status IN ( 'Open', 'Temporary_Closed', 'Closed' ) );


/*==============================================================*/
/* Table: SRC_Reservation 	            	                */
/*==============================================================*/
CREATE TABLE SRC_Reservation (
    reserviation_id   		INTEGER 		NOT NULL,
    booked            		DATE 			NOT NULL,
    start_date        		DATE 			NOT NULL,
    end_date          		DATE 			NOT NULL,
    status            		VARCHAR2(10) 		NOT NULL,
    price             		FLOAT(4),
    number_of_guests  		INTEGER 		NOT NULL,
    payment_method    		VARCHAR2(10),
    advertiser        		VARCHAR2(30 CHAR) 	NOT NULL,
    guest_id          		INTEGER 		NOT NULL,
    apartment_id      		INTEGER 		NOT NULL,
    CONSTRAINT pk_reservation PRIMARY KEY ( reserviation_id ) 
);

ALTER TABLE SRC_Reservation 
    ADD CHECK ( status IN ( 'Confirmed', 'Cancelled' ) );

ALTER TABLE SRC_Reservation 
    ADD CHECK ( payment_method IN ( 'Card', 'Cash' ) );


/*==============================================================*/
/* Table: SRC_Content 	            	                        */
/*==============================================================*/
CREATE TABLE SRC_Content (
    content_id        		INTEGER 		NOT NULL,
    content_name      		VARCHAR2(30 CHAR) 	NOT NULL,
    content_quantity  		INTEGER,
    CONSTRAINT pk_content PRIMARY KEY ( content_id )
);


/*==============================================================*/
/* Table: SRC_Contains 	            	                        */
/*==============================================================*/
CREATE TABLE SRC_Contains (
    content_id    		INTEGER 		NOT NULL,
    apartment_id  		INTEGER 		NOT NULL,
    CONSTRAINT pk_contains PRIMARY KEY ( content_id, apartment_id )
);


/*==============================================================*/
/* Table: SRC_Apartment_Ocupancy                                */
/*==============================================================*/
CREATE TABLE SRC_Apartment_Ocupancy (
    ocupancy_id   		INTEGER 		NOT NULL,
    start_date    		DATE 			NOT NULL,
    end_date      		DATE 			NOT NULL,
    apartment_id  		INTEGER 		NOT NULL,
    CONSTRAINT pk_apartment_ocupancy PRIMARY KEY ( ocupancy_id )
);


/*==============================================================*/
/* Table: SRC_Pricelist 	                                */
/*==============================================================*/
CREATE TABLE SRC_Pricelist (
    pricelist_id     		INTEGER 		NOT NULL,
    start_date       		DATE 			NOT NULL,
    end_date         		DATE 			NOT NULL,
    price_per_night  		FLOAT(8) 		NOT NULL,
    discount         		INTEGER,
    apartment_id     		INTEGER 		NOT NULL,
    CONSTRAINT pk_pricelist PRIMARY KEY ( pricelist_id )
);



ALTER TABLE SRC_Apartment 
    ADD CONSTRAINT fk_apart_apart_type FOREIGN KEY ( apartment_type_id )
        REFERENCES SRC_Apartment_Type ( apartment_type_id );

ALTER TABLE SRC_Apartment 
    ADD CONSTRAINT fk_apartment_building FOREIGN KEY ( building_id )
        REFERENCES SRC_Building ( building_id );

ALTER TABLE SRC_Building 
    ADD CONSTRAINT fk_building_city FOREIGN KEY ( city_id )
        REFERENCES SRC_City ( city_id );

ALTER TABLE SRC_City 
    ADD CONSTRAINT fk_city_country FOREIGN KEY ( country_id )
        REFERENCES SRC_Country ( country_id );

ALTER TABLE SRC_Contains 
    ADD CONSTRAINT fk_contains_apart FOREIGN KEY ( apartment_id )
        REFERENCES SRC_Apartment ( apartment_id );

ALTER TABLE SRC_Contains 
    ADD CONSTRAINT fk_contains_content FOREIGN KEY ( content_id )
        REFERENCES SRC_Content ( content_id );

ALTER TABLE SRC_Guest 
    ADD CONSTRAINT fk_guest_country FOREIGN KEY ( country_id )
        REFERENCES SRC_Country ( country_id );

ALTER TABLE SRC_Apartment_Ocupancy 
    ADD CONSTRAINT fk_occupancy_apart FOREIGN KEY ( apartment_id )
        REFERENCES SRC_Apartment ( apartment_id );

ALTER TABLE SRC_Pricelist 
    ADD CONSTRAINT fk_pricelist_apartment FOREIGN KEY ( apartment_id )
        REFERENCES SRC_Apartment ( apartment_id );

ALTER TABLE SRC_Reservation 
    ADD CONSTRAINT fk_res_apartm FOREIGN KEY ( apartment_id )
        REFERENCES SRC_Apartment ( apartment_id );

ALTER TABLE SRC_Reservation 
    ADD CONSTRAINT fk_res_guest FOREIGN KEY ( guest_id )
        REFERENCES SRC_Guest ( guest_id );
