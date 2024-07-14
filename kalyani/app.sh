#!/bin/bash

URL="https://www.google.com/"  # Replace with your application's URL
EXPECTED_STATUS_CODE=200  # Replace with the expected HTTP status code for a successful response

while true; do
    status_code=$(curl -s -o /dev/null -w "%{http_code}" $URL)
    
    if [ $status_code -eq $EXPECTED_STATUS_CODE ]; then
        echo "Application is UP! Status code: $status_code"
    else
        echo "Application is DOWN or not functioning correctly. Status code: $status_code"
    fi
    
    # Adjust the sleep duration based on your monitoring needs (e.g., every 60 seconds)
    sleep 60
done

