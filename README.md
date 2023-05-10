# Data Warehouse Project

The goal of this project is to create a Data Warehousing system that will provide apartment advertisers with helpful insights into their business performances. This will be implemented through an ECTL process, where input data is taken from various sources (Excel files, .txt files, and an OLTP database), transformed, and stored into a target relational database for querying.

Three main business topics to cover are:

1. Monitoring the cash flow and number of nights stayed for each apartment in relation to the advertising method. Additionally, track the number of booked nights based on the guests' origin.
2. Supporting decision-making on implementing a new pricing policy for a specific number of overnight stays, based on factors such as booked stay length and occupancy rate.
5. Supporting decision-making around implementing a cancellation policy, considering factors like length of stay, booking lead time, and reservation price, to determine cancellation timelines without penalties.


## System Architecture

In the following picture, a pipeline architecture for this system is presented.

<p align="center">
  <img src="https://github.com/mileni98/data-warehouse/assets/73794793/9d1d54f8-fa69-4438-86c4-2d6f6057bf3c" alt="System Architecture" style="width: 85%; display: block; margin-left: auto; margin-right: auto;">
</p>


## Source OLTP Schema

The following image shows an ER schema for the database of one of the sources that was created for this project. This is a schema for a booking reservation system application, for which data was artificially created.

<p align="center">
  <img src="https://github.com/mileni98/data-warehouse/assets/73794793/d27d27b0-e790-4386-8bb4-c4327a2798cf" alt="Source OLTP Schema" style="width: 75%; display: block; margin-left: auto; margin-right: auto;">
</p>


## Target DW OLAP Schema

The following image shows an ER schema for the target data warehouse database. It includes fact and dimension tables and is suitable for supporting all three topics this project had to cover.

<p align="center">
  <img src="https://github.com/mileni98/data-warehouse/assets/73794793/5af15e9f-4ae4-44ba-a76c-85cdaf0736c1" alt="Target Data Warehouse Schema" style="width: 75%; display: block; margin-left: auto; margin-right: auto;">
</p>


## Running the application

To use this project, follow these steps:

1. Create an "original files" directory in the "preprocessing" folder.
2. Download the Airbnb, Booking, and ApartmentTypes files (currently unavailable).
3. Ensure that you have working OracleDB and PostgreSQL servers with connection details used in the ETL files.
4. In CMD, run the command "icacls run.sh /grant Everyone:(RX)" to grant execute permissions to the run script.
5. Double-click the run.sh file to execute the ETL process.
6. Install Metabase and connect it to the PostgreSQL DW database by going to localhost:3000.
7. Perform various queries using Metabase to analyze the data.


## ECTL Processes for 3 tasks

<p align="center">
  <img src="https://github.com/mileni98/data-warehouse/assets/73794793/c60fd985-2ed8-43ad-b3de-e0f8f97c6bd9" alt=""  style="width: 75%; display: block; margin-left: auto; margin-right: auto;">
</p>

<p align="center">
  <img src="https://github.com/mileni98/data-warehouse/assets/73794793/0196711c-68f8-44fe-b4b8-fc6fb76f6f63" alt=""  style="width: 75%; display: block; margin-left: auto; margin-right: auto;">
</p>

<p align="center">
  <img src="https://github.com/mileni98/data-warehouse/assets/73794793/a20e9c29-bb47-4ba3-9823-2d4be7dd7dee" alt=""  style="width: 75%; display: block; margin-left: auto; margin-right: auto;">
</p>

## Dependencies

This project has the following depencencies:

- pandas
- cx_Oracle
- sqlalchemy
- names_dataset
