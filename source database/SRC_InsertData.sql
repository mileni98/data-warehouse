/*==============================================================*/
/* Table: SRC_Country                                           */
/*==============================================================*/
INSERT INTO "SSP_RES".SRC_Country (country_id, country_name) VALUES (1, 'France');
INSERT INTO "SSP_RES".SRC_Country (country_id, country_name) VALUES (2, 'United States');
INSERT INTO "SSP_RES".SRC_Country (country_id, country_name) VALUES (3, 'Italy');
INSERT INTO "SSP_RES".SRC_Country (country_id, country_name) VALUES (4, 'Serbia');
INSERT INTO "SSP_RES".SRC_Country (country_id, country_name) VALUES (5, 'Montenegro');
commit;


/*==============================================================*/
/* Table: SRC_City                                              */
/*==============================================================*/
INSERT INTO "SSP_RES".SRC_City (city_id, city_name, country_id) VALUES (1,'Paris',1);
INSERT INTO "SSP_RES".SRC_City (city_id, city_name, country_id) VALUES (2,'New York',2);
INSERT INTO "SSP_RES".SRC_City (city_id, city_name, country_id) VALUES (3,'Rome',3);
INSERT INTO "SSP_RES".SRC_City (city_id, city_name, country_id) VALUES (4,'Belgrade',4);
INSERT INTO "SSP_RES".SRC_City (city_id, city_name, country_id) VALUES (5,'Budva',5);
commit;


/*==============================================================*/
/* Table: SRC_Guest                                             */
/*==============================================================*/
INSERT INTO "SSP_RES".SRC_Guest (guest_id, guest_firstname, guest_lastname, guest_password, guest_email, guest_contact, country_id)
	VALUES (1, 'Alexa', 'Milenovic', '123', 'aleksa@gmail.com', '+381111111', 4);
INSERT INTO "SSP_RES".SRC_Guest (guest_id, guest_firstname, guest_lastname, guest_password, guest_email, guest_contact, country_id)
	VALUES (2, 'Mike', 'Johnson', 'password123', 'mikejohnson@gmail.com', '+1-555-123-4567', 1);
INSERT INTO "SSP_RES".SRC_Guest (guest_id, guest_firstname, guest_lastname, guest_password, guest_email, guest_contact, country_id)
	VALUES (3, 'Emily', 'Davis', 'letmein321', 'emilydavis@hotmail.com', '+44 7123 456789', 2);
INSERT INTO "SSP_RES".SRC_Guest (guest_id, guest_firstname, guest_lastname, guest_password, guest_email, guest_contact, country_id)
	VALUES (4, 'Daniel', 'Lee', 'abc123', 'daniellee@yahoo.com', '+61 7 1234 5678', 3);
INSERT INTO "SSP_RES".SRC_Guest (guest_id, guest_firstname, guest_lastname, guest_password, guest_email, guest_contact, country_id)
	VALUES (5, 'Sarah', 'Smith', 'qwerty', 'sarahsmith@gmail.com', '+1-555-987-6543', 1);
INSERT INTO "SSP_RES".SRC_Guest (guest_id, guest_firstname, guest_lastname, guest_password, guest_email, guest_contact, country_id)
	VALUES (6, 'Ryan', 'Nguyen', 'password', 'ryannguyen@hotmail.com', '+44 7123 456789', 2);
INSERT INTO "SSP_RES".SRC_Guest (guest_id, guest_firstname, guest_lastname, guest_password, guest_email, guest_contact, country_id)
	VALUES (7, 'Lila', 'Garcia', '123456', 'lilagarcia@yahoo.com', '+61 7 1234 5678', 3);
INSERT INTO "SSP_RES".SRC_Guest (guest_id, guest_firstname, guest_lastname, guest_password, guest_email, guest_contact, country_id)
	VALUES (8, 'David', 'Brown', 'letmein', 'davidbrown@gmail.com', '+1-555-123-4567', 1);
INSERT INTO "SSP_RES".SRC_Guest (guest_id, guest_firstname, guest_lastname, guest_password, guest_email, guest_contact, country_id)
	VALUES (9, 'Sophie', 'Taylor', 'password123', 'sophietaylor@hotmail.com', '+44 7123 456789', 4);
INSERT INTO "SSP_RES".SRC_Guest (guest_id, guest_firstname, guest_lastname, guest_password, guest_email, guest_contact, country_id)
	VALUES (10, 'Lucas', 'Rodriguez', 'abc123', 'lucasrodriguez@yahoo.com', '+61 7 1234 5678', 3);
INSERT INTO "SSP_RES".SRC_Guest (guest_id, guest_firstname, guest_lastname, guest_password, guest_email, guest_contact, country_id)
	VALUES (11, 'Olivia', 'Martin', 'qwerty', 'oliviamartin@gmail.com', '+1-555-987-6543', 1);
commit;


/*==============================================================*/
/* Table: SRC_Building                                          */
/*==============================================================*/
INSERT INTO "SSP_RES".SRC_Building (building_id, building_name, building_address, building_status, building_type, city_id)
	VALUES (1, 'Complex Lux', 'Moravska', 'Open', 'On_Beach', 5);
commit;


/*==============================================================*/
/* Table: SRC_Apartment_Type                                    */
/*==============================================================*/
INSERT INTO "SSP_RES".SRC_Apartment_Type (apartment_type_id, apartment_type_name, apartment_type_desc) 
	VALUES (1,'Studio', 'Text description');
commit;


/*==============================================================*/
/* Table: SRC_Apartment				                */
/*==============================================================*/
INSERT INTO "SSP_RES".SRC_Apartment (apartment_id, apartment_status, apartment_name, apartment_number, building_id, apartment_type_id)
	VALUES (1, 'Open', 'One-Bedroom Apartment with Balcony and Sea View', 1, 1, 1);
INSERT INTO "SSP_RES".SRC_Apartment (apartment_id, apartment_status, apartment_name, apartment_number, building_id, apartment_type_id)
	VALUES (2, 'Open', 'Studio with Patio', 2, 1, 1);
INSERT INTO "SSP_RES".SRC_Apartment (apartment_id, apartment_status, apartment_name, apartment_number, building_id, apartment_type_id)
	VALUES (3, 'Open', 'Studio with Patio and Sea View', 3, 1, 1);
INSERT INTO "SSP_RES".SRC_Apartment (apartment_id, apartment_status, apartment_name, apartment_number, building_id, apartment_type_id)
	VALUES (4, 'Open', 'One-Bedroom Apartment with Patio and Sea View', 4, 1, 1);
commit;


/*==============================================================*/
/* Table: SRC_Reservation 	            	                */
/*==============================================================*/
INSERT INTO "SSP_RES".SRC_Reservation (reserviation_id, booked, start_date, end_date, cancellation_date, status, price, number_of_guests, payment_method, advertiser, guest_id, apartment_id)
VALUES (1, TO_DATE('2022-04-01', 'yyyy-mm-dd'), TO_DATE('2022-04-05', 'yyyy-mm-dd'), TO_DATE('2022-04-10', 'yyyy-mm-dd'), NULL, 'Confirmed', 500.0, 2, 'Card', 'OLTP', 2, 1);
INSERT INTO "SSP_RES".SRC_Reservation (reserviation_id, booked, start_date, end_date, cancellation_date, status, price, number_of_guests, payment_method, advertiser, guest_id, apartment_id)
VALUES (2, TO_DATE('2022-05-20', 'yyyy-mm-dd'), TO_DATE('2022-06-01', 'yyyy-mm-dd'), TO_DATE('2022-06-08', 'yyyy-mm-dd'), NULL,'Confirmed', 750.0, 3, 'Card', 'OLTP', 3, 1);
INSERT INTO "SSP_RES".SRC_Reservation (reserviation_id, booked, start_date, end_date, cancellation_date, status, price, number_of_guests, payment_method, advertiser, guest_id, apartment_id)
VALUES (3, TO_DATE('2022-01-05', 'yyyy-mm-dd'), TO_DATE('2022-01-20', 'yyyy-mm-dd'), TO_DATE('2022-01-25', 'yyyy-mm-dd'), NULL,'Confirmed', 400.0, 1, 'Cash', 'OLTP', 4, 1);
INSERT INTO "SSP_RES".SRC_Reservation (reserviation_id, booked, start_date, end_date, cancellation_date, status, price, number_of_guests, payment_method, advertiser, guest_id, apartment_id)
VALUES (4, TO_DATE('2022-02-10', 'yyyy-mm-dd'), TO_DATE('2022-02-15', 'yyyy-mm-dd'), TO_DATE('2022-02-20', 'yyyy-mm-dd'), NULL,'Confirmed', 600.0, 2, 'Card', 'OLTP', 5, 1);
INSERT INTO "SSP_RES".SRC_Reservation (reserviation_id, booked, start_date, end_date, cancellation_date, status, price, number_of_guests, payment_method, advertiser, guest_id, apartment_id)
VALUES (5, TO_DATE('2022-08-01', 'yyyy-mm-dd'), TO_DATE('2022-08-15', 'yyyy-mm-dd'), TO_DATE('2022-08-22', 'yyyy-mm-dd'), NULL,'Confirmed', 900.0, 3, 'Card', 'OLTP', 6, 1);
INSERT INTO "SSP_RES".SRC_Reservation (reserviation_id, booked, start_date, end_date, cancellation_date, status, price, number_of_guests, payment_method, advertiser, guest_id, apartment_id)
VALUES (111, TO_DATE('2022-04-01', 'yyyy-mm-dd'), TO_DATE('2022-04-05', 'yyyy-mm-dd'), TO_DATE('2022-04-10', 'yyyy-mm-dd'), NULL, 'Confirmed', 350.0, 2, 'Card', 'OLTP', 2, 2);
INSERT INTO "SSP_RES".SRC_Reservation (reserviation_id, booked, start_date, end_date, cancellation_date, status, price, number_of_guests, payment_method, advertiser, guest_id, apartment_id)
VALUES (211, TO_DATE('2022-05-20', 'yyyy-mm-dd'), TO_DATE('2022-06-01', 'yyyy-mm-dd'), TO_DATE('2022-06-08', 'yyyy-mm-dd'), NULL,'Confirmed', 600.0, 3, 'Card', 'OLTP', 3, 2);
INSERT INTO "SSP_RES".SRC_Reservation (reserviation_id, booked, start_date, end_date, cancellation_date, status, price, number_of_guests, payment_method, advertiser, guest_id, apartment_id)
VALUES (311, TO_DATE('2022-01-05', 'yyyy-mm-dd'), TO_DATE('2022-01-20', 'yyyy-mm-dd'), TO_DATE('2022-01-25', 'yyyy-mm-dd'), NULL,'Confirmed', 400.0, 1, 'Cash', 'OLTP', 4, 2);
INSERT INTO "SSP_RES".SRC_Reservation (reserviation_id, booked, start_date, end_date, cancellation_date, status, price, number_of_guests, payment_method, advertiser, guest_id, apartment_id)
VALUES (511, TO_DATE('2022-08-01', 'yyyy-mm-dd'), TO_DATE('2022-08-15', 'yyyy-mm-dd'), TO_DATE('2022-08-22', 'yyyy-mm-dd'), NULL,'Confirmed', 900.0, 3, 'Card', 'OLTP', 6, 2);
INSERT INTO "SSP_RES".SRC_Reservation (reserviation_id, booked, start_date, end_date, cancellation_date, status, price, number_of_guests, payment_method, advertiser, guest_id, apartment_id)
VALUES (1111, TO_DATE('2022-04-01', 'yyyy-mm-dd'), TO_DATE('2022-04-05', 'yyyy-mm-dd'), TO_DATE('2022-04-10', 'yyyy-mm-dd'), NULL, 'Confirmed', 350.0, 2, 'Card', 'OLTP', 2, 3);
INSERT INTO "SSP_RES".SRC_Reservation (reserviation_id, booked, start_date, end_date, cancellation_date, status, price, number_of_guests, payment_method, advertiser, guest_id, apartment_id)
VALUES (2111, TO_DATE('2022-05-20', 'yyyy-mm-dd'), TO_DATE('2022-06-01', 'yyyy-mm-dd'), TO_DATE('2022-06-08', 'yyyy-mm-dd'), NULL,'Confirmed', 600.0, 3, 'Card', 'OLTP', 3,3);
INSERT INTO "SSP_RES".SRC_Reservation (reserviation_id, booked, start_date, end_date, cancellation_date, status, price, number_of_guests, payment_method, advertiser, guest_id, apartment_id)
VALUES (3111, TO_DATE('2022-01-05', 'yyyy-mm-dd'), TO_DATE('2022-01-20', 'yyyy-mm-dd'), TO_DATE('2022-01-25', 'yyyy-mm-dd'), NULL,'Confirmed', 400.0, 1, 'Cash', 'OLTP', 4, 3);
INSERT INTO "SSP_RES".SRC_Reservation (reserviation_id, booked, start_date, end_date, cancellation_date, status, price, number_of_guests, payment_method, advertiser, guest_id, apartment_id)
VALUES (1123, TO_DATE('2022-04-01', 'yyyy-mm-dd'), TO_DATE('2022-04-05', 'yyyy-mm-dd'), TO_DATE('2022-04-10', 'yyyy-mm-dd'), NULL, 'Confirmed', 500.0, 2, 'Card', 'OLTP', 2, 4);
INSERT INTO "SSP_RES".SRC_Reservation (reserviation_id, booked, start_date, end_date, cancellation_date, status, price, number_of_guests, payment_method, advertiser, guest_id, apartment_id)
VALUES (3123, TO_DATE('2022-01-05', 'yyyy-mm-dd'), TO_DATE('2022-01-20', 'yyyy-mm-dd'), TO_DATE('2022-01-25', 'yyyy-mm-dd'), NULL,'Confirmed', 400.0, 1, 'Cash', 'OLTP', 4, 4);
INSERT INTO "SSP_RES".SRC_Reservation (reserviation_id, booked, start_date, end_date, cancellation_date, status, price, number_of_guests, payment_method, advertiser, guest_id, apartment_id)
VALUES (4123, TO_DATE('2022-02-10', 'yyyy-mm-dd'), TO_DATE('2022-02-15', 'yyyy-mm-dd'), TO_DATE('2022-02-20', 'yyyy-mm-dd'), NULL,'Confirmed', 665.0, 2, 'Card', 'OLTP', 5, 4);
INSERT INTO "SSP_RES".SRC_Reservation (reserviation_id, booked, start_date, end_date, cancellation_date, status, price, number_of_guests, payment_method, advertiser, guest_id, apartment_id)
VALUES (5123, TO_DATE('2022-08-01', 'yyyy-mm-dd'), TO_DATE('2022-08-15', 'yyyy-mm-dd'), TO_DATE('2022-08-22', 'yyyy-mm-dd'), NULL,'Confirmed', 900.0, 3, 'Card', 'OLTP', 6, 4);


INSERT INTO "SSP_RES".SRC_Reservation (reserviation_id, booked, start_date, end_date, cancellation_date, status, price, number_of_guests, payment_method, advertiser, guest_id, apartment_id)
VALUES (6, TO_DATE('2022-11-10', 'yyyy-mm-dd'), TO_DATE('2022-11-25', 'yyyy-mm-dd'), TO_DATE('2022-11-30', 'yyyy-mm-dd'), NULL,'Confirmed', 600.0, 2, 'Card', 'OLTP', 7, 1);
INSERT INTO "SSP_RES".SRC_Reservation (reserviation_id, booked, start_date, end_date, cancellation_date, status, price, number_of_guests, payment_method, advertiser, guest_id, apartment_id)
VALUES (9, TO_DATE('2022-06-01', 'yyyy-mm-dd'), TO_DATE('2022-07-15', 'yyyy-mm-dd'), TO_DATE('2022-07-25', 'yyyy-mm-dd'), TO_DATE('2022-07-13', 'yyyy-mm-dd'),'Cancelled', 600.0, 3, 'Card', 'OLTP', 10, 2);
INSERT INTO "SSP_RES".SRC_Reservation (reserviation_id, booked, start_date, end_date, cancellation_date, status, price, number_of_guests, payment_method, advertiser, guest_id, apartment_id)
VALUES (10, TO_DATE('2022-04-04', 'yyyy-mm-dd'), TO_DATE('2022-04-11', 'yyyy-mm-dd'), TO_DATE('2022-04-18', 'yyyy-mm-dd'), TO_DATE('2022-04-03', 'yyyy-mm-dd'),'Cancelled', 432.0, 5, 'Card', 'OLTP', 6, 3);
INSERT INTO "SSP_RES".SRC_Reservation (reserviation_id, booked, start_date, end_date, cancellation_date, status, price, number_of_guests, payment_method, advertiser, guest_id, apartment_id)
VALUES (11, TO_DATE('2022-01-01', 'yyyy-mm-dd'), TO_DATE('2022-06-10', 'yyyy-mm-dd'), TO_DATE('2022-06-12', 'yyyy-mm-dd'), TO_DATE('2022-06-07', 'yyyy-mm-dd'),'Cancelled', 140.0, 1, 'Cash', 'OLTP', 3, 4);
INSERT INTO "SSP_RES".SRC_Reservation (reserviation_id, booked, start_date, end_date, cancellation_date, status, price, number_of_guests, payment_method, advertiser, guest_id, apartment_id)
VALUES (12, TO_DATE('2022-01-01', 'yyyy-mm-dd'), TO_DATE('2022-06-10', 'yyyy-mm-dd'), TO_DATE('2022-06-12', 'yyyy-mm-dd'), TO_DATE('2022-06-07', 'yyyy-mm-dd'),'Cancelled', 210.0, 1, 'Cash', 'OLTP', 3, 2);
INSERT INTO "SSP_RES".SRC_Reservation (reserviation_id, booked, start_date, end_date, cancellation_date, status, price, number_of_guests, payment_method, advertiser, guest_id, apartment_id)
VALUES (13, TO_DATE('2022-01-01', 'yyyy-mm-dd'), TO_DATE('2022-06-10', 'yyyy-mm-dd'), TO_DATE('2022-06-12', 'yyyy-mm-dd'), TO_DATE('2022-06-07', 'yyyy-mm-dd'),'Cancelled', 430.0, 1, 'Cash', 'OLTP', 3, 2);
commit;


/*==============================================================*/
/* Table: SRC_Content 	            	                        */
/*==============================================================*/
INSERT INTO "SSP_RES".SRC_Content (content_id, content_name, content_quantity)
	VALUES (1, 'beds', 4);
INSERT INTO "SSP_RES".SRC_Content (content_id, content_name, content_quantity)
	VALUES (2, 'beds', 2);
commit;


/*==============================================================*/
/* Table: SRC_Contains 	            	                        */
/*==============================================================*/
INSERT INTO "SSP_RES".SRC_Contains (content_id, apartment_id) VALUES (1, 1);
INSERT INTO "SSP_RES".SRC_Contains (content_id, apartment_id) VALUES (1, 4);
INSERT INTO "SSP_RES".SRC_Contains (content_id, apartment_id) VALUES (2, 2);
INSERT INTO "SSP_RES".SRC_Contains (content_id, apartment_id) VALUES (2, 3);
commit;


/*==============================================================*/
/* Table: SRC_Apartment_Ocupancy                                */
/*==============================================================*/
/*
INSERT INTO "SSP_RES".SRC_Apartment_Ocupancy (ocupancy_id, start_date, end_date, apartment_id)
	VALUES ();
commit;
*/


/*==============================================================*/
/* Table: SRC_Pricelist 	                                */
/*==============================================================*/
/*
INSERT INTO "SSP_RES".SRC_Pricelist (pricelist_id, start_date, end_date, price_per_night, discount, apartment_id)
	VALUES ();
commit;
*/