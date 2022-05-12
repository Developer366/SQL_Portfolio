-- Kamil Peza SQL Script for World database

-- Use Database and then select all columns from tables
USE world;
select * from City;
select * from Country;
select * from CountryLanguage;

-- Select specific Column(s) from table
select Name, Population from City;
select Language from CountryLanguage;

-- Select DISTINCT (no duplicate) values
select CountryCode from City;
select distinct CountryCode from City;
select distinct * from City;

-- WHERE Clause used to filter records (text need single/double quation marks)
SELECT * FROM City WHERE CountryCode="USA";
SELECT * FROM City WHERE Population>=8000000; -- greater than or equal to  
SELECT * FROM City WHERE Population!=100000; -- not equal to (could also use <>)
SELECT * FROM City WHERE Population BETWEEN 100000 AND 300000;

-- AND, OR, NOT Filter Operators (AND: both must be true/ OR: one needs to be true/ NOT: not true)
SELECT * FROM City WHERE CountryCode="USA" AND Population>=1000000;
SELECT * FROM City WHERE CountryCode="GBR" OR District="Santiago";
SELECT * FROM City WHERE NOT CountryCode="USA" AND Population>=4000000;
SELECT * FROM City WHERE CountryCode="DEU" OR (CountryCode="ESP" AND District="Madrid");

-- ORDER BY used for sorting in ascending to descending order (ascending is the default)
SELECT * from CountryLanguage ORDER BY Percentage DESC;
SELECT * from CountryLanguage ORDER BY Percentage DESC, Language; 

-- Inset into table (Column1, column2, column3) values (1,2,3)
-- INSERT INTO table_name VALUES (value1, value2, value3, ...); [dont need column names]
Insert INTO City (Name, CountryCode, District, Population)
Values ('Magic City', 'MGC', 'Sparkle', '5000');

-- IS NULL/ IS NOT NULL (check if there is a null value) 
SELECT * FROM City WHERE District IS NULL;
SELECT * FROM City WHERE District IS NOT NULL;

-- UPDATE statement is used to modify the existing records in a table
UPDATE city SET Name = 'J-town' 
WHERE ID =1; 
 
 -- Delete a record
 DELETE FROM City Where Name="Kabul";
 DELETE FROM City;  -- Delete all rows without deleting the table
 
 -- TOP, LIMIT, FETCH FIRST, ROWNUM Clause (different databases use different name)
SELECT * from City LIMIT 3; -- only show 3 rows
SELECT * from City WHERE Population >= 2000000 LIMIT 3; -- shows top 3 results

-- MIN MAX (return smallest and largest value)
SELECT MIN(SurfaceArea) from Country;
SELECT MIN(SurfaceArea) AS SmallestCountry FROM Country; -- save min value in a new column name
SELECT MAX(SurfaceArea) from Country;
SELECT MAX(SurfaceArea) AS LargestCountry from Country WHERE Continent="North America";

-- COUNT, AVG, SUM
SELECT COUNT(Name) AS NumberOfCountries FROM Country; -- Count the number of countries
SELECT AVG(LifeExpectancy) AS AverageLife FROM Country; -- Average life Expectancy of every country
SELECT SUM(Population) AS WorldPopulation FROM Country; -- Sum of world population

-- LIKE Operator (used for finding patterns) % means rest of String
Select Name FROM Country WHERE Name LIKE 'a%'; -- find all countries that start with a
Select Name FROM Country WHERE Name LIKE '%a'; -- countries ending with a
Select Name FROM Country WHERE Name LIKE '%land%'; -- countries that have land in their name any position
Select Name FROM Country WHERE Name LIKE '_r%'; -- finds countries with second letter being r
Select Name FROM Country WHERE Name LIKE '__r%'; -- countries with thrid letter being r
Select Name FROM Country WHERE Name LIKE 'a__%'; -- coutries that start with aand are atleast 3 characters in length
Select Name FROM Country WHERE Name LIKE 'm%a'; -- countries that start with m and end with a
Select Name FROM Country WHERE Name NOT LIKE 'a%'; -- countries that do not start with the letter a

-- Wildcard characters (used to substitute one ore more characters in a string) % _ [] ^ -
Select Name FROM Country WHERE Name LIKE 'uni%'; -- countries starting with uni
Select Name FROM Country WHERE Name LIKE '%es%'; -- countries containing es in them
SELECT Name FROM Country WHERE Name LIKE '_angladesh'; -- countries that have any character followed by angladesh
SELECT Name FROM City WHERE Name LIKE 'L_n_on';
-- SELECT Name FROM City WHERE Name LIKE '[a-c]%'; -- charlist not working

-- IN Operator (shorthand for multiple OR Conditions)
SELECT * FROM Country WHERE Continent IN ("Asia", "Africa"); -- search countries IN Asia and Africa
SELECT * FROM Country WHERE Continent NOT IN ("Asia", "Africa"); -- not in Asia or Africa

-- BETWEEN operator (select values within a given range [numbers, text, or dates)
SELECT * FROM Country WHERE SurfaceArea BETWEEN 100 AND 300;
SELECT * FROM Country WHERE SurfaceArea NOT BETWEEN 100 AND 300; -- surface area that is not between 100 and 300
SELECT * FROM Country WHERE SurfaceArea NOT BETWEEN 100 AND 300 AND Continent NOT IN ("North America");
SELECT * FROM Country WHERE Name BETWEEN 'Albania' AND 'France' ORDER BY Name; -- selects range of text in alphabetical order
SELECT * FROM Country WHERE IndepYear BETWEEN '1990' AND '2002' ORDER BY IndepYear; -- data range

-- Alias (give a table or column a temporary name. only used for the one query)
Select Name AS Country, SurfaceArea AS "Country Size" from Country; -- Alias with a space
SELECT NAME , CONCAT(Continent, ', ', Region, ', ') AS Location from Country; -- concat to join column names

-- JOIN Clasue (used to combine tow or more tables)
-- When Using multiple tables, you have to pu the name of the table in front of the Column
-- INNER, LEFT, RIGHT, FULL, SELF, UNION
SELECT City.Name, City.District, City.Population, CountryLanguage.CountryCode, CountryLanguage.Language
From City
INNER JOIN CountryLanguage ON City.CountryCode = CountryLanguage.CountryCode;

-- left Join returns all records from the left table (CIty), right table (Country)
SELECT City.Name, Country.LifeExpectancy 
From City
LEFT JOIN Country ON City.CountryCode = Country.Code
ORDER BY Country.LifeExpectancy;

-- right join
SELECT City.Name, Country.LifeExpectancy 
From City
RIGHT JOIN Country ON City.CountryCode = Country.Code
ORDER BY Country.LifeExpectancy DESC;

-- ****** FULL OUTER JOIN (full outer join and full join are the same)
SELECT City.Name, Country.Continent
FROM City
FULL JOIN Country ON City.CountryCode = Country.Code
ORDER BY Country.Continent;

-- ***** SELF JOIN (a regular join, but the table is joined with itself)
SELECT *
FROM City;

-- UNION Operator (union is used to combine the result-set of two or more Select statements) only distinct values
SELECT Name FROM City
Union
SELECT Name FROM Country
ORDER BY Name DESC;
-- UNION all selects duplicate values
SELECT Name FROM City
Union ALL
SELECT Name FROM Country
ORDER BY Name DESC;

-- GROUP BY statement(groups rows that have the same values into summary rows)
SELECT COUNT(Name), Continent FROM Country
GROUP BY Continent;

SELECT COUNT(Name), District FROM City -- counties cities in each district 
GROUP BY District
ORDER BY COUNT(Name) DESC;

-- SQL HAVING Clause (where keyword cannot be used with aggregate functions)
SELECT COUNT(Name), District -- count city in each district that have mroe than 5 cities
FROM City
GROUP BY District
HAVING COUNT(Name) > 5
ORDER BY COUNT(Name) DESC;

-- SQL Exists OPERATOR (check for the existance of any record in a subquery. Returns True or false)
SELECT * FROM City
WHERE EXISTS (SELECT Name FROM City WHERE Population > 50000);

SELECT * FROM City
WHERE EXISTS (SELECT Name FROM City WHERE Population > 50000000);

-- ANY (perform comparisons between a single column value and a range of other values)
-- ANY means condition will be true if the operation is true for any values in the range
SELECT * FROM Country
WHERE SurfaceArea < ANY (SELECT Population from Country WHERE Population > 800000);

-- ALL returns a boolean value as a result (True if all of the subquery values meet the condition)
SELECT ALL Name FROM Country
WHERE Continent = "Africa";

