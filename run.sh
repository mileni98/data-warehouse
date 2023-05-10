#!/bin/bash

# ------------------- Preprocessing ------------------- 
if jupyter nbconvert --to notebook --execute --inplace preprocessing/prep_airbnb.ipynb; then
    echo "prep_airbnb.ipynb ran successfully."
    echo
else
    echo "prep_airbnb.ipynb failed to run."
    echo
fi

if jupyter nbconvert --to notebook --execute --inplace preprocessing/prep_booking.ipynb; then
    echo "prep_booking.ipynb ran successfully."
    echo
else
    echo "prep_booking.ipynb failed to run."
    echo
fi

if jupyter nbconvert --to notebook --execute --inplace preprocessing/prep_oltp.ipynb; then
    echo "prep_oltp.ipynb ran successfully."
    echo
else
    echo "prep_oltp.ipynb failed to run."
    echo
fi

# ------------------- ETL ------------------- 
if jupyter nbconvert --to notebook --execute --inplace etl/etl_first_theme.ipynb; then
    echo "etl_first_theme.ipynb ran successfully."
    echo
else
    echo "etl_first_theme.ipynb failed to run."
    echo
fi

if jupyter nbconvert --to notebook --execute --inplace etl/etl_second_theme.ipynb; then
    echo "etl_second_theme.ipynb ran successfully."
    echo
else
    echo "etl_second_theme.ipynb failed to run."
    echo
fi

if jupyter nbconvert --to notebook --execute --inplace etl/etl_third_theme.ipynb; then
    echo "etl_third_theme.ipynb ran successfully."
    echo
else
    echo "etl_third_theme.ipynb failed to run."
    echo
fi

echo "Script execution complete. Waiting for 5 seconds..."
sleep 5