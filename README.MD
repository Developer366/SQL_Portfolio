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

![alt text](SnapShots/and-or.PNG)

## Order By

`SELECT * from CountryLanguage ORDER BY Percentage DESC`

![alt text](SnapShots/orderby-percent.PNG)

## Insert Into

`Insert INTO City (Name, CountryCode, District, Population)
Values ('Magic City', 'MGC', 'Sparkle', '5000');`

## Is Not Null

`SELECT * FROM City WHERE District IS NOT NULL;`

![alt text](SnapShots/isnotnull.PNG)

## Update

`UPDATE city SET Name = 'J-town' WHERE ID =1; `

 ## Delete Record

 `DELETE FROM City Where Name="Kabul";`

 ## Limit

 `SELECT * from City WHERE Population >= 2000000 LIMIT 3;`

 ![alt text](SnapShots/limit.PNG)

## Min 

`SELECT MIN(SurfaceArea) from Country;`

 ![alt text](SnapShots/min.PNG)

 ## Count the number of countries

 `SELECT COUNT(Name) AS NumberOfCountries FROM Country;`

  ![alt text](SnapShots/count.PNG)

## Average Life expectancy of all the countries

`SELECT AVG(LifeExpectancy) AS AverageLife FROM Country; -- Average life Expectancy of every country`

 ![alt text](SnapShots/average.PNG)

 ## Sum of the population from each country

 `SELECT SUM(Population) AS WorldPopulation FROM Country;`

![alt text](SnapShots/sum.PNG)

## Like - show countries with "land" in the name

`Select Name FROM Country WHERE Name LIKE '%land%';`

![alt text](SnapShots/like.PNG)

##  IN

`SELECT * FROM Country WHERE Continent IN ("Asia", "Africa");`

![alt text](SnapShots/in.PNG)

## Between a range of two countries

`SELECT * FROM Country WHERE Name BETWEEN 'Albania' AND 'France' ORDER BY Name; -- selects range of text in alphabetical order`

![alt text](SnapShots/between.PNG)

## Concat - make a string from two column values

`SELECT NAME , CONCAT(Continent, ', ', Region) AS Location from Country; -- concat to join column names`

![alt text](SnapShots/concat.PNG)

## Inner Join

`SELECT City.Name, City.District, City.Population, CountryLanguage.CountryCode, CountryLanguage.Language
From City
INNER JOIN CountryLanguage ON City.CountryCode = CountryLanguage.CountryCode;`

![alt text](SnapShots/innerjoin.PNG)

## Left Join

`SELECT City.Name, Country.LifeExpectancy 
From City
LEFT JOIN Country ON City.CountryCode = Country.Code
ORDER BY Country.LifeExpectancy;`

![alt text](SnapShots/leftjoin.PNG)

## Union - add city and country names together

`SELECT Name FROM City
Union
SELECT Name FROM Country
ORDER BY Name DESC;`

![alt text](SnapShots/union.PNG)

## Group By

`SELECT COUNT(Name) as Total, Continent FROM Country
GROUP BY Continent;`

![alt text](SnapShots/groupby.PNG)

## Cases

    SELECT Name, Population, LifeExpectancy, SurfaceArea,
    CASE
        WHEN LifeExpectancy > 85 THEN 'Great Healthcare and longlife expected'
        WHEN LifeExpectancy >= 70 THEN 'Decent healthcare and average life expected'
        WHEN LifeExpectancy < 70 Then 'Bad Healthcare and short life expected'
    END AS "Life Expectancy Overview"
    FROM Country;

![alt text](SnapShots/case.PNG)

# Sources

https://www.w3schools.com/sql/default.asp

https://relational.fit.cvut.cz/dataset/World

