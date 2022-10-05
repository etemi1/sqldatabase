-- Count the number of records in the People's TABLE
SELECT COUNT(*) AS count_records
FROM People;


--count the number of birthdates in people's TABLE
SELECT COUNT(birthdate) AS count_birthdate
FROM People;

-- Count the languages and countries in the films table; alias as count_languages and count_countries.
SELECT COUNT(language) AS count_languages,
COUNT(country) AS count_country
FROM films;

--Return the unique countries represented in the films table and limit to 10 records
SELECT DISTINCT country
FROM films
LIMIT 10;

--Return the unique countries represented in the films table where country is not null
SELECT DISTINCT country
FROM films
WHERE country IS NOT NULL;

--Return the number of unique countries represented in the films table, aliased as count_distinct_countries.
SELECT COUNT (DISTINCT Country) AS count_distinct_countries
FROM films;

-- Query the top 10 movies with the least budgets
SELECT id,
		title,
		release_year,
		language,
		country,
		SUM(budget) AS Total_budget
FROM films
WHERE budget < 1000000
GROUP BY id,
		title,
		release_year,
		country,
		language
ORDER BY Total_budget 
Limit 10;

--Find the title,certification and language of all films certified NC-17 or R that are in English, Italian or Greek
SELECT title,
		certification,
			language
	FROM films
WHERE certification IN('NC-17', 'R')
		AND language IN ('English','Italian','Greek')
		
		
--find the duration of the shortest film
SELECT MIN(duration) AS shortest_film
FROM films


--calculate the highest gross film released between 2000-2013
SELECT max(gross) AS highest_gross
FROM films
WHERE release_year BETWEEN 2000 AND 2012;


--calculate the percentage of people that are not alive
SELECT COUNT(deathrate)*100/count(*) AS percentage_death
FROM people;

--Find the number of decades the film table covers
SELECT (MAX(release_year) - MIN(release_year)) /10 AS No_of_decades
FROM fims;



SELECT SUM(SalesAmount) AS [Invoice Amount],
SUM(TaxAmt) AS [Tax Amount],
OrderDate,
CustomerKey AS [Customer ID]
FROM FactInternetsales 
WHERE SalesTerritoryKey = 6
GROUP BY Customerkey, OrderDate
HAVING SUM(SalesAmount) > 1000
ORDER BY SUM(SalesAmount) DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY


-- Querying salesordernumber detaila for sales made in december annd where sales territory is 1
SELECT SalesOrderNumber,SalesOrderLineNumber,SalesAmount,TaxAmt,OrderDate
FROM FactInternetSales
WHERE SalesTerritoryKey = 1 AND Month(OrderDate) = 12
