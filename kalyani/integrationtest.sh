#!/bin/bash

FRONTEND_URL="http://192.168.59.100:32568"

EXPECTED_MESSAGE="Hello, World!"

RESPONSE=$(curl -s "$FRONTEND_URL")

# Check if the response contains the expected message
if [[ "$RESPONSE" == *"$EXPECTED_MESSAGE"* ]]; then
    echo "Integartion tests has been passed"
    exit 0
else
    echo "Integartion test failed"
    exit 1
fi
