#!/bin/bash

echo "                     _                ___ _____ _"
echo "                    | |__   ___ _ __ / _ \___ /| | ___   _"
echo "                    | '_ \ / _ \ '__| | | ||_ \| |/ / | | |"
echo "                    | | | |  __/ |  | |_| |__) |   <| |_| |"
echo "                    |_| |_|\___|_|   \___/____/|_|\_\\__,_|"
echo "                                                           "
echo "                                          made by @didjemss"
echo "                                                           "
echo "                                                           "
for i in `cat $1`
do
        # poc from : https://github.com/streaak/keyhacks?tab=readme-ov-file#Heroku-API-key
        status_code=`curl -s -I -X POST https://api.heroku.com/apps -H "Accept: application/vnd.heroku+json; version=3" -H "Authorization: Bearer $i" | grep -oP 'HTTP/\d\K\s+\d+'`
        if [ $status_code -ne "401" ]; then
                echo "$i is a poc !"
        else
                echo "$i have $status_code status code..."
        fi
done