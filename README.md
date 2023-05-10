# Data Warehouse Project

![architecture](https://github.com/mileni98/data-warehouse/assets/73794793/9d1d54f8-fa69-4438-86c4-2d6f6057bf3c)

## Running the application

To use this project, follow these steps:

1. Create "original files" directory in the "preprocessing" folder
2. Download Airbnb, Booking and ApartmentTypes files (currently unavailable)
3. Have working OracleDB and PostgreSQL servers with details used in etl files
4. Enter command: "icacls run.sh /grant Everyone:(RX)" in CMD
5. Double click run.sh file

## Dependencies

This project has the following depencencies:

- pandas
- cx_Oracle
- sqlalchemy
- names_dataset
