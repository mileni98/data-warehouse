# Data Warehouse Project

The objective of this project is to create a Data Warehousing system that can provide apartment advertisers with insights into their business performance. This will be achieved through an ECTL process, where data from various sources such as Excel files, text files, and an OLTP database will be preprocessed, transformed, and stored into a target relational database for querying.

The project will focus on three main business topics:

1. Monitoring the cash flow and number of nights stayed for each apartment in relation to the advertising method. Additionally, track the number of booked nights based on the guests' origin.
2. Supporting decision-making on implementing a new pricing policy for a specific number of overnight stays, based on factors such as booked stay length and occupancy rate.
5. Supporting decision-making around implementing a cancellation policy, considering factors like length of stay, booking lead time, and reservation price, to determine cancellation timelines without penalties.


## Folders Overview

The **Preprocessing folder** contains data from different sources that has been extracted and cleaned, with additional columns added. The data is transformed into a dataframe with the same attributes for each source, and then exported as Excel files.

In the **ETL folder**, the exported Excel files are loaded, transformations are performed, and fact and dimension tables are created. These tables are then loaded onto the server.

The **Queries folder** contains SQL code for querying the data that has been loaded onto the server. Use these queries to analyze and visualize the data.


## System Architecture

The system architecture for this project is presented in the following pipeline diagram:

<p align="center">
  <img src="https://github.com/mileni98/data-warehouse/assets/73794793/9d1d54f8-fa69-4438-86c4-2d6f6057bf3c" alt="System Architecture" style="width: 85%; display: block; margin-left: auto; margin-right: auto;">
</p>


## Source OLTP Schema

The ER schema for the database of one of the sources created for this project is shown in the following image. This schema represents a booking reservation system application, for which data was artificially generated.

<p align="center">
  <img src="https://github.com/mileni98/data-warehouse/assets/73794793/d27d27b0-e790-4386-8bb4-c4327a2798cf" alt="Source OLTP Schema" style="width: 85%; display: block; margin-left: auto; margin-right: auto;">
</p>


## Target DW OLAP Schema

The following image shows an ER schema for the target Data Warehouse database. It includes fact and dimension tables and is suitable for supporting all three topics this project had to cover.

<p align="center">
  <img src="https://github.com/mileni98/data-warehouse/assets/73794793/5af15e9f-4ae4-44ba-a76c-85cdaf0736c1" alt="Target Data Warehouse Schema" style="width: 85%; display: block; margin-left: auto; margin-right: auto;">
</p>


## Running the application

To use this project, follow these steps:

1. Create an "original files" directory in the "preprocessing" folder.
2. Download the Airbnb, Booking, and ApartmentTypes files (currently unavailable).
3. Ensure that you have working OracleDB and PostgreSQL servers with connection details used in the ETL files.
4. In CMD, run the command "icacls run.sh /grant Everyone:(RX)" to grant execute permissions to the run script.
5. Double-click the run.sh file to execute the ETL process.
6. Install Metabase and connect it to the PostgreSQL DW database by going to localhost:3000.
7. Visualize and analyze the data by performing various queries using Metabase.


## Querry example

You can find several SQL queries supporting 3 tasked themes in the **queries folder**. Here's an example query that shows the number of stay nights and average price per night per month for all apartments combined:

```sql
SELECT
    "Dim Dates"."month_name" AS "Dim Dates__month_name",
    COUNT("public"."fct_Price_Policy"."Price per day") AS "count",
    AVG("public"."fct_Price_Policy"."Price per day") AS "avg"
FROM "public"."dim_Dates" AS "Dim Dates"
LEFT JOIN "public"."fct_Price_Policy" ON "public"."fct_Price_Policy"."date_id" = "Dim Dates"."date_id"
INNER JOIN "public"."dim_Apartment" AS "Dim Apartment" ON "public"."fct_Price_Policy"."apartment_id" = "Dim Apartment"."apartment_id"
GROUP BY "Dim Dates"."month_name", "Dim Dates"."month"
ORDER BY "Dim Dates"."month"
```

Here's an output of the previous query:     

<p align="center">
  <img src="https://github.com/mileni98/data-warehouse/assets/73794793/e8cf9a6a-6395-4b62-bf58-288ffcf7f293" style="width: 95%; display: block; margin-left: auto; margin-right: auto;">
</p>

## Dependencies

This project has the following depencencies:

- pandas
- cx_Oracle
- sqlalchemy
- names_dataset
