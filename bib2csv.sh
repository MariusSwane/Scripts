#!/bin/bash

title=$(grep "title =" $1 | awk -F '{' '{print $2}' | awk -F '}' '{print $1}')

author=$(grep "author =" $1 | awk -F '{' '{print $2}' | awk -F '}' '{print $1}')

date=$(grep "date =" $1 | awk -F ' ' '{print $3}' | awk -F ',' '{print $1}')

key=$(grep @ $1 | awk -F '{' '{print $2}' | awk -F ',' '{print $1}')

url=$(grep "url =" $1 | awk -F '{' '{print $2}' | awk -F '}' '{print $1}')

#printf "$key; $title; $author; $url" > map.csv

paste <(echo "$key") <(echo "$url") <(echo "$title") <(echo "$author") <(echo "$date") | sort -k 2 > map.csv

uniq -f 1 map.csv | awk '{print $1 "\t" $3 "\t" $4 "\t" $5}' | sort > urlUniq.csv

#paste <(echo "$key") | sort -k 2 > tad.csv

uniq -f 1 urlUniq.csv | awk '{print $1}' | sort > uniqMaps

#echo "$key" | wc -l
#echo "$url" | wc -l

#echo "$url" > urlvar

#uniq -d "$url"
