#!/bin/bash

THRESHOLD=80
USAGE=$(df -P  / | awk 'NR==2 { print $5 }' | sed 's/%//')

# python alert.py "$USAGE"

# echo "Disk usage is ${USAGE}%"

# if [ "$USAGE" -ge 80 ];
# then
#     echo -e "\e[31m[Warning] disk usage is above threshold! ($USAGE%)\e[0m"
# else
#     echo -e "\e[32m[OK] Disk usage is normal.\e[0m"
# fi

if [ "$USAGE" -gt "$THRESHOLD" ];
then
    echo -e "\e[31m[Warning] disk usage is above threshold! ($USAGE%)\e[0m"
    python alert.py "$USAGE"
else
    echo -e "\e[32m[OK] Disk usage is normal.\e[0m"
fi
