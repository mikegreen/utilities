#!/bin/bash
# 2023-11-21 Mike Green for Instant Group/Upsuite

# DB credentials
dbhost='db.org'
dbport='3306'
dbname='dbname'
dbuser='admin'
# dbpassword='prompt for pw'

read -p "Enter DB password for $dbhost $dbuser: " dbpassword

# this will export the tables in the list below
tablestesting=(flex_deal)
tables=(flex_deal \
        flex_lead \
        flex_lead_location \
        location \
        market \
        neighborhood \
        operator_market \
        operator \
        space \
        sub_market1 )

for val in "${tables[@]}"
do
        echo Running export for $val
        mysql -u $dbuser -p$dbpassword -P $dbport -h "$dbhost" -e "select * from $dbname.$val" > ./$val.csv
done
