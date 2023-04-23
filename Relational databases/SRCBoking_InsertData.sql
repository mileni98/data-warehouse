/*==============================================================*/
/* Table: SRC_Country                                           */
/*==============================================================*/
INSERT INTO SRC_Country (country_id, country_name) VALUES ();
commit;


/*==============================================================*/
/* Table: SRC_City                                              */
/*==============================================================*/
INSERT INTO CREATE SRC_City (city_id, city_name, country_id) VALUES ();
commit;


/*==============================================================*/
/* Table: SRC_Guest                                             */
/*==============================================================*/
INSERT INTO SRC_Guest (guest_id, guest_firstname, guest_lastname, guest_password, guest_email, guest_contact, country_id)
	VALUES ();
commit;


/*==============================================================*/
/* Table: SRC_Building                                          */
/*==============================================================*/
INSERT INTO SRC_Building (building_id, building_name, building_address, building_status, building_type, city_id)
	VALUES ();
commit;


/*==============================================================*/
/* Table: SRC_Apartment_Type                                    */
/*==============================================================*/
INSERT INTO SRC_Apartment_Type (apartment_type_id, apartment_type_name, apartment_type_desc) 
	VALUES ();
commit;


/*==============================================================*/
/* Table: SRC_Apartment				                */
/*==============================================================*/
INSERT INTO SRC_Apartment (apartment_id, apartment_status, apartment_name, apartment_number, building_id, apartment_type_id)
	VALUES ();
commit;


/*==============================================================*/
/* Table: SRC_Reservation 	            	                */
/*==============================================================*/
INSERT INTO SRC_Reservation (reserviation_id, booked, start_date, end_date, status, price, number_of_guests, payment_method, advertiser, guest_id, apartment_id)
	VALUES ();
commit;


/*==============================================================*/
/* Table: SRC_Content 	            	                        */
/*==============================================================*/
INSERT INTO SRC_Content (content_id, content_name, content_quantity)
	VALUES ();
commit;


/*==============================================================*/
/* Table: SRC_Contains 	            	                        */
/*==============================================================*/
INSERT INTO SRC_Contains (content_id, apartment_id) VALUES ();
commit;


/*==============================================================*/
/* Table: SRC_Apartment_Ocupancy                                */
/*==============================================================*/
INSERT INTO SRC_Apartment_Ocupancy (ocupancy_id, start_date, end_date, apartment_id)
	VALUES ();
commit;


/*==============================================================*/
/* Table: SRC_Pricelist 	                                */
/*==============================================================*/
INSERT INTO SRC_Pricelist (pricelist_id, start_date, end_date, price_per_night, discount, apartment_id)
	VALUES ();
commit;
