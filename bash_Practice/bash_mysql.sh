#!/bin/bash

# run query from bash script

# Execute SQL query from the Linux command-line:
# 	mysql -u USER -pPASSWORD -e "SQL_QUERY"
mysql -u root -p950918 -e "show databases;"

# Run SQL query on the explicitly specified database:
#	mysql -u USER -pPASSWORD -D DATABASE -e "SQL_QUERY"
mysql -u root -p950918 -D "world" -e "show tables;"

# Run SQL query on the explicitly specified host:
#	$ mysql -u USER -pPASSWORD -h HOSTNAME -e "SQL_QUERY"
mysql -h localhost -u root -p950918 -D "world" -e "select * from city limit 10;"

# Suppressing column headings:
#	mysql -u USER -pPASSWORD -N -e "SQL_QUERY"
mysql -u root -p950918 -N -D "world" -e "show tables;"

# Suppress table borders:
# mysql -u USER -pPASSWORD -B -e "SQL_QUERY"
mysql -h localhost -u root -p950918 -D "world" -B -e "select * from city limit 10;"

# Save the output to a file:
# 	mysql -u USER -pPASSWORD -e "SQL_QUERY" > FILE
mysql -h localhost -u root -p950918 -D "world" -B -e "select * from city limit 10;" > ../data/test.txt

cat ../data/titanic.dat.txt
# create the structure of the database
mysql -h localhost -u root -p950918 -e "create database titanic;"

mysql -h localhost -u root -p950918 -D "titanic" -e "drop table titanic;"

# create the structure of the table
mysql -h localhost -u root -p950918 -D "titanic" -e "create table titanic (class smallint not null, age smallint not null, sex smallint not null, survived smallint not null)"
mysql -h localhost -u root -p950918 -D "titanic" -e "describe titanic;"

# populate the database.
mysql -h localhost -u root -p950918 <<MY_QUERY
USE titanic;
LOAD DATA LOCAL INFILE '../data/titanic.dat.txt' INTO TABLE titanic
FIELDS TERMINATED BY '        '
LINES TERMINATED BY '\n';
MY_QUERY


mysql -h localhost -u root -p950918 -D "titanic" -e "select * from titanic;"

mysql -h localhost -u root -p950918 -D "titanic" -e "select count(*) from titanic;" 

mysql -h localhost -u root -p950918 -D "titanic" -e "select count(*) from titanic where survived = 1;"
# nested SQL query
mysql -h localhost -u root -p950918 -D "titanic" -e "select (select count(*) from titanic where survived = 1)/count(*) as survied_rate from titanic;"

