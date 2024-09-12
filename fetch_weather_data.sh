#!/usr/bin/env bash 

# Read input from user
read -rp "Enter the name of the city: " city_name

temp_c=$(curl "https://downloads.codingcoursestv.eu/055%20-%20bash/api/api.php" \
     -G --data-urlencode "city=${city_name}" -s | jq '.temperature')

temp_f=$(echo "$temp_c * 1.8 + 32" | bc)

echo "Temperature in ${city_name} is: ${temp_c} C"
echo "Temperature in ${city_name} is: ${temp_f} F"
