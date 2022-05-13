# My SQL Project
Performed some basic queries to showcase SQL knowledge. The WORLD database used for this project is from: https://relational.fit.cvut.cz/dataset/World
    
    Used MySQL Workbench to connect to the database and to write and execute queries. Only had permission to read the database.

# Database Structure
World database contains 3 tables:
![Alt text](SnapShots/world-tables.PNG "Title")
## City Table:

`select * from City;`
![Alt text](SnapShots/city-table.PNG "Title")
## Country Table:

`select * from Country;`
![Alt text](SnapShots/country-table.PNG "Title")
## CountryLanguage Table: 

`select * from CountryLanguage;`
![alt text](SnapShots/countrylanguage-table.PNG)

# SQL Queries

## Select specific Column(s):

`select Name, Population from City;`
![alt text](SnapShots/select-column.PNG)

## Select distinct 
`select distinct CountryCode from City;`
![alt text](SnapShots/select-distinct.PNG)

## Where Clause & Between
`SELECT * FROM City WHERE Population BETWEEN 100000 AND 300000;`

![alt text](SnapShots/where-between.PNG)

## Where, AND, OR
`SELECT * FROM City WHERE CountryCode="DEU" OR (CountryCode="ESP" AND District="Madrid");`



