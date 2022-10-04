-- To have a view of all column names and their various datatyes
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'records_may21';

--- To count the ROWS
SELECT COUNT(*)
FROM records;

-- TO ALTER Table details
ALTER TABLE records_may21
RENAME compani_name TO company_name;


--To delete records
DELETE FROM records_may21
WHERE record_id =430;


--Insert a new RECORD
INSERT INTO records_may21(
    record_id,
date,
ceo_id,
first_name,
last_name,
date_of_birth,
total_revenue,
total_expenses,
state,
postal_codes,
company_name,
industry,
email)
    VALUES('430',
'2020-10-31',
'1012',
'David',
'Wells',
'1977-09-19',
'495.71',
'202.0',
'Florida',
'13888',
'Adams-Rice',
'Financial',
'david.wells@Adams.io'
);

--Update state that appears isnull to texas  
UPDATE records_may21
SET state = 'Texas'
WHERE state ISNULL;

-- select distinct state
select distinct(state)
from records_may21
-- ANSWER WAS 5

--Update state that appears as 'New Yoke' TO 'New York'
UPDATE records_may21
SET state = 'New York'
WHERE state = 'New Yoke'


--total profit
SELECT sum(total_revenue-total_Expenses) AS profit
from records_may21
 -- 541,129.9
 
 --Company with lowest profit in 3 years
select distinct(company_name), sum(profit) AS Total_Profit
from records_may21
group by company_name
order by total_profit asc
 --johnson olson and smith had the lowest profit of 10,655
 
 
 
 -- company with highest mean profit in 3 years was Smith ltd = 304.10
select distinct(company_name), avg(profit) AS Total_profit
from records_may21
group by company_name
order by total_profit desc

-- The youngest CEO is Marcus Burgess
select distinct(ceo_id) first_name,last_name,date_of_birth
from records_may21
order by date_of_birth desc


---The CEOS whose company are in California & industry is IT respecticely is Joel and jessica
 select distinct(ceo_id), first_name, industry, state
  from records_may21
  where state = 'California' AND industry ='IT'
  
  
  -- Postal code with highest total rvevenue is 95239
  select distinct(postal_codes),sum(total_revenue) AS Total_revenue
  from records_may21
  group by postal_codes
  order by total_revenue desc


-- There are 468 CEOS with high level email that ends with ,com
  SELECT email
  from records_may21
  where email LIKE '%.com'
  
  
  -- The First names that appeared the most was Melissa and David appearing 108 each
   SELECT first_name, COUNT(first_name) AS count_of_names
  from records_may21
 GROUP BY FIRST_NAME
 order by count_of_names desc
 
 
  INSERT INTO Employees
    VALUES (100,'Steven','king','SKING','515.123.4567','2003-06-17','ad-pres','24000.00','0.00','0','90')
    VALUES (101,'Neena','Kocharr','NKOCHARR','515.123.4567','2005-09-21', 'AD_VP','17000.00','0.00','0','90'
    VALUES (102, 'Lex','De Haan','LDEHAAN','515.123.4569','2001-01-13','AD_VP', '17000.00','0.00','100', '90')