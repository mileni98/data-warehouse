# Data Warehouse Project

The goal of this project is to create a DW system that will provide the apartment advertiser an insight into his business. Based on this insight he will be able to make a series of decisions in order to improve his business. This will be implemented through an ECTL process where input data is taken from various different sources, including excel files, textual file and an OLTP database.

Three main business topics to cover are:

1. Monitoring the cash flow and number of nights stayed for each apartment in relation to the advertising method. Additionally, track the number of booked nights based on the guests' origin.
2. Providing support for decision-making on whether it would be profitable to implement a different pricing policy for a certain number of overnight stays. The main factors to consider are the length of the booked stay and the occupancy rate for a specific period of time.
3. Providing support for decision-making on how and to what extent to implement a cancellation policy. This includes deciding how far in advance a client can cancel a reservation without consequences, taking into account factors such as the length of stay, how far in advance the reservation was made, and the price of the reservation.


## System Architecture

<p align="center">
  <img src="https://github.com/mileni98/data-warehouse/assets/73794793/9d1d54f8-fa69-4438-86c4-2d6f6057bf3c" alt="System Architecture" style="width: 85%; display: block; margin-left: auto; margin-right: auto;">
</p>


## Source OLTP Schema

<p align="center">
  <img src="https://github.com/mileni98/data-warehouse/assets/73794793/d27d27b0-e790-4386-8bb4-c4327a2798cf" alt="Source OLTP Schema" style="width: 85%; display: block; margin-left: auto; margin-right: auto;">
</p>


## Data Warehouse OLAP Schema

<p align="center">
  <img src="https://github.com/mileni98/data-warehouse/assets/73794793/5af15e9f-4ae4-44ba-a76c-85cdaf0736c1" alt="Target Data Warehouse Schema" title="NESTTT" style="width: 85%; display: block; margin-left: auto; margin-right: auto;">
</p>


## ECTL Processes for 3 tasks

<p align="center">
  <img src="https://github.com/mileni98/data-warehouse/assets/73794793/c60fd985-2ed8-43ad-b3de-e0f8f97c6bd9" alt=""  style="width: 85%; display: block; margin-left: auto; margin-right: auto;">
</p>

<p align="center">
  <img src="https://github.com/mileni98/data-warehouse/assets/73794793/0196711c-68f8-44fe-b4b8-fc6fb76f6f63" alt=""  style="width: 85%; display: block; margin-left: auto; margin-right: auto;">
</p>

<p align="center">
  <img src="https://github.com/mileni98/data-warehouse/assets/73794793/a20e9c29-bb47-4ba3-9823-2d4be7dd7dee" alt=""  style="width: 85%; display: block; margin-left: auto; margin-right: auto;">
</p>


## Running the application

To use this project, follow these steps:

1. Create "original files" directory in the "preprocessing" folder
2. Download Airbnb, Booking and ApartmentTypes files (currently unavailable)
3. Have working OracleDB and PostgreSQL servers with details used in etl files
4. Enter command: "icacls run.sh /grant Everyone:(RX)" in CMD
5. Double click run.sh file
6. Install metabase, go to localhost:3000 and perform various querries


## Dependencies

This project has the following depencencies:

- pandas
- cx_Oracle
- sqlalchemy
- names_dataset
