/*==============================================================*/
/* Table: SRC_Country                                           */
/*==============================================================*/
INSERT INTO "SSP_RES".SRC_Country (country_id, country_name) VALUES (1, "Italy");
commit;


/*==============================================================*/
/* Table: SRC_City                                              */
/*==============================================================*/
INSERT INTO "SSP_RES".SRC_City (city_id, city_name, country_id) VALUES ();
commit;


/*==============================================================*/
/* Table: SRC_Guest                                             */
/*==============================================================*/
INSERT INTO "SSP_RES".SRC_Guest (guest_id, guest_firstname, guest_lastname, guest_password, guest_email, guest_contact, country_id)
	VALUES ();
commit;


/*==============================================================*/
/* Table: SRC_Building                                          */
/*==============================================================*/
INSERT INTO "SSP_RES".SRC_Building (building_id, building_name, building_address, building_status, building_type, city_id)
	VALUES ();
commit;


/*==============================================================*/
/* Table: SRC_Apartment_Type                                    */
/*==============================================================*/
INSERT INTO "SSP_RES".SRC_Apartment_Type (apartment_type_id, apartment_type_name, apartment_type_desc) 
	VALUES ();
commit;


/*==============================================================*/
/* Table: SRC_Apartment				                */
/*==============================================================*/
INSERT INTO "SSP_RES".SRC_Apartment (apartment_id, apartment_status, apartment_name, apartment_number, building_id, apartment_type_id)
	VALUES (1, 'Open', 'Studio with Patio', 1, 1, 1);
INSERT INTO "SSP_RES".SRC_Apartment (apartment_id, apartment_status, apartment_name, apartment_number, building_id, apartment_type_id)
	VALUES (2, 'Open', 'Studio with Patio and Sea View', 2, 1, 1);
INSERT INTO "SSP_RES".SRC_Apartment (apartment_id, apartment_status, apartment_name, apartment_number, building_id, apartment_type_id)
	VALUES (3, 'Open', 'One-Bedroom Apartment with Balcony and Sea View', 3, 1, 1);
INSERT INTO "SSP_RES".SRC_Apartment (apartment_id, apartment_status, apartment_name, apartment_number, building_id, apartment_type_id)
	VALUES (4, 'Open', 'Studio with Patio', 4, 1, 1);
commit;


/*==============================================================*/
/* Table: SRC_Reservation 	            	                */
/*==============================================================*/
INSERT INTO "SSP_RES".SRC_Reservation (reserviation_id, booked, start_date, end_date, status, price, number_of_guests, payment_method, advertiser, guest_id, apartment_id)
	VALUES ();
commit;


/*==============================================================*/
/* Table: SRC_Content 	            	                        */
/*==============================================================*/
INSERT INTO "SSP_RES".SRC_Content (content_id, content_name, content_quantity)
	VALUES ();
commit;


/*==============================================================*/
/* Table: SRC_Contains 	            	                        */
/*==============================================================*/
INSERT INTO "SSP_RES".SRC_Contains (content_id, apartment_id) VALUES ();
commit;


/*==============================================================*/
/* Table: SRC_Apartment_Ocupancy                                */
/*==============================================================*/
INSERT INTO "SSP_RES".SRC_Apartment_Ocupancy (ocupancy_id, start_date, end_date, apartment_id)
	VALUES ();
commit;


/*==============================================================*/
/* Table: SRC_Pricelist 	                                */
/*==============================================================*/
INSERT INTO "SSP_RES".SRC_Pricelist (pricelist_id, start_date, end_date, price_per_night, discount, apartment_id)
	VALUES ();
commit;
