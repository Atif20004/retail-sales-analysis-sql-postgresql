
--CREATE TABLE
DROP TABLE IF EXISTS retail_sales_tb;
create table retail_sales_tb(
			transactions_id INT PRIMARY KEY,
			sale_date DATE,
			sale_time TIME,
			customer_id INT,
			gender VARCHAR(15),
			age INT,
			category VARCHAR(15),
			quantity INT,
			price_per_unit INT,
			cogs FLOAT,
			total_sale FLOAT

            );
-- CHECK NO OF ROWS IMPORT
SELECT 
	COUNT(*)
	FROM retail_sales_tb;
-- SHOW ALL DATASET
SELECT * FROM retail_sales_tb;

-- MASTER CODE TO CHECK NULL VALUE IN ANY COLUMN

SELECT * FROM retail_sales_tb
WHERE 
		transactions_id IS NULL
		OR
		SALE_DATE IS NULL
		OR
		SALE_TIME IS NULL
		OR
		GENDER IS NULL
		OR
		CATEGORY IS NULL
		OR
		QUANTITY IS NULL
		OR
		COGS IS NULL
		OR
		TOTAL_SALE IS NULL
		
		;
-- DELETING NULL VALUE WHICH IS NOT REQUIRED

DELETE FROM retail_sales_tb
WHERE 
		transactions_id IS NULL
		OR
		SALE_DATE IS NULL
		OR
		SALE_TIME IS NULL
		OR
		GENDER IS NULL
		OR
		CATEGORY IS NULL
		OR
		QUANTITY IS NULL
		OR
		COGS IS NULL
		OR
		TOTAL_SALE IS NULL
		
		;


--BASIC → INTERMEDIATE (1–50)

-- 1. Retrieve all records from the table
SELECT * FROM retail_sales_tb;

-- 2. Retrieve only sale_date and total_sale columns

SELECT sale_date,total_sale
	FROM retail_sales_tb;
	
-- 3. Find all transactions where gender = 'Male'

SELECT * FROM retail_sales_tb
	WHERE gender = 'Male';
-- 4. Find all transactions where category = 'Electronics'

SELECT * FROM retail_sales_tb
	WHERE category = 'Electronics';
	

-- 5. Retrieve transactions where total_sale > 500

SELECT * FROM retail_sales_tb
	where total_sale > 500;

-- 6. Find transactions between '2022-11-01' and '2022-11-10'

SELECT * FROM retail_sales_tb
	WHERE sale_date between '2022-11-01' and '2022-11-10';

-- 7. Count total number of rows in the table

SELECT 
	COUNT(transactions_id)
FROM retail_sales_tb;

     								--OR
SELECT
	COUNT(*)
FROM retail_sales_tb;


-- 8. Find total number of transactions per category
SELECT
 	category,
	 COUNT(*) AS total_transactions
FROM retail_sales_tb
GROUP BY category;

-- 9. Find average price_per_unit

SELECT 
    Round(AVG(price_per_unit),2) AS avg_per_unit
FROM retail_sales_tb;


-- 10. Find minimum and maximum total_sale

SELECT 
    MIN(total_sale) AS min_sale, 
    MAX(total_sale) AS max_sale
FROM retail_sales_tb;  
-- 11. Find total revenue generated

SELECT
	SUM(total_sale) AS total_revenue_generated
	FROM retail_sales_tb;

-- 12. Find total cogs
SELECT 
	SUM(cogs) AS total_cogs
FROM retail_sales_tb;
-- 13. Find total quantity sold

SELECT
	SUM(quantity) AS quantity_sold
FROM retail_sales_tb; 

-- 14. Find average age of customers
SELECT
	ROUND(AVG(age),2) AS AVG_AGE
FROM retail_sales_tb; 


-- 15. Count number of male and female customers
SELECT
	gender,
	count(gender) as total_customers
FROM retail_sales_tb 
GROUP BY gender;


-- 16. Find total sales per category
SELECT
	category,
	SUM( total_sale)
	FROM  retail_sales_tb
GROUP BY category;


-- 17. Find average total_sale per category
SELECT
	category,
	AVG(total_sale)AS avg_total_sale
FROM retail_sales_tb
GROUP BY category;

-- 18. Find maximum total_sale per category

SELECT 
	category,
	MAX(total_sale) AS MAXIMUM_SALE
	FROM retail_sales_tb
GROUP BY category;

-- 19. Find minimum total_sale per category

SELECT category,
	MIN(total_sale) AS minimum_sale
	FROM retail_sales_tb
GROUP BY category;

-- 20. Find number of transactions per gender
SELECT 
	gender,
	COUNT(transactions_id) AS Total_Transactions
	FROM retail_sales_tb
GROUP BY gender;



-- 21. Find total sales per gender
SELECT
	gender,
	sum(total_sale)
	FROM retail_sales_tb
GROUP BY gender;

-- 22. Find average quantity per category

SELECT
	category,
	ROUND(AVG(quantity),2) AS avg_quantity
	FROM retail_sales_tb
GROUP BY category;


-- 23. Find total quantity sold per category
SELECT
	 category,
	 SUM(quantity)
	 FROM retail_sales_tb
GROUP BY category;


-- 24. Find transactions where quantity > 2
SELECT * FROM retail_sales_tb
		WHERE quantity>2;

-- 25. Find transactions where price_per_unit > 100

SELECT * FROM retail_sales_tb
		WHERE price_per_unit > 100;

-- 26. Find transactions where cogs > total_sale

SELECT * FROM retail_sales_tb
		WHERE cogs > total_sale;

-- 27. Find profit per transaction (derived column)

SELECT 
	transactions_id,
	total_sale-cogs
FROM retail_sales_tb;

-- 28. Find total profit

SELECT 
    SUM(total_sale - cogs) AS total_profit
FROM retail_sales_tb; 

-- 29. Find total profit per category

SELECT
	category,
	SUM(total_sale - cogs) AS total_profit
	FROM retail_sales_tb
GROUP BY category;

-- 30. Find total profit per gender

SELECT 
	gender,
	ROUND(SUM(total_sale - cogs):: numeric ,2)  AS total_profit
	FROM retail_sales_tb
GROUP BY gender;


-- 31. Extract year from sale_date
SELECT sale_date,
		EXTRACT(YEAR FROM sale_date) AS sale_year
		FROM retail_sales_tb;

-- 32. Extract month from sale_date

SELECT sale_date,
	EXTRACT(MONTH FROM sale_date) AS sale_month
FROM retail_sales_tb;

-- 33. Count transactions per month

SELECT 
    EXTRACT(YEAR FROM sale_date) AS sale_year,				
    EXTRACT(MONTH FROM sale_date) AS sale_month,
    COUNT(*) AS total_transactions
FROM retail_sales_tb
GROUP BY sale_year, sale_month
ORDER BY sale_year, sale_month;								

-- 34. Find total sales per month

SELECT 
	EXTRACT(YEAR FROM sale_date) AS sale_year,
	EXTRACT(MONTH FROM sale_date)  AS sale_month,
	SUM(total_sale) as total_sale
FROM retail_sales_tb
GROUP BY sale_year,sale_month
ORDER BY sale_year,sale_month;


-- 35. Find average sales per month

SELECT 
    EXTRACT(YEAR FROM sale_date) AS sale_year,
    EXTRACT(MONTH FROM sale_date) AS sale_month,
    AVG(total_sale) AS avg_sale
FROM retail_sales_tb
GROUP BY sale_year, sale_month
ORDER BY sale_year, sale_month;

-- 36. Find total sales per year

SELECT 
	EXTRACT(YEAR FROM sale_date) as sale_year,
	SUM(total_sale) total_sale
	FROM retail_sales_tb
	GROUP BY sale_year;

-- 37. Find total sales per year and month

SELECT 
	EXTRACT(YEAR FROM sale_date) AS sale_year,
	EXTRACT(MONTH FROM sale_date) AS sale_month,
	SUM(total_sale)
	FROM retail_sales_tb
	GROUP BY sale_year,sale_month
	ORDER BY sale_year,sale_month;
	
-- 38. Find top 3 highest total_sale transactions
SELECT *
	FROM retail_sales_tb
	ORDER BY total_sale DESC
	LIMIT 3;
	

-- 39. Find bottom 3 lowest total_sale transactions

SELECT * FROM retail_sales_tb
ORDER BY total_sale ASC
LIMIT 3;

-- 40. Find customers who made more than 1 transaction

SELECT 
    customer_id,
    COUNT(*) AS total_transactions
FROM retail_sales_tb
GROUP BY customer_id
HAVING COUNT(*) > 1;        -- IMPORTANT CASE

-- 41. Count unique customers

SELECT 
    COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales_tb;

-- 42. Count unique customers per category

SELECT 
	category,
	COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales_tb
GROUP BY category;

-- 43. Count unique customers per gender

SELECT 
	 gender,
	 COUNT(DISTINCT customer_id )
	 FROM retail_sales_tb
	 GROUP BY gender;

-- 44. Find customers with total_sale > 1000
SELECT * FROM retail_sales_tb
		WHERE total_sale > 1000;


--note 

SELECT * FROM retail_sales_tb
-- 45. Find total sales per customer

SELECT 
	customer_id,
	SUM(total_sale) AS TOTAL_SALE_PER_CUSTOMER
	FROM retail_sales_tb
	GROUP BY customer_id;



-- 46. Find top 5 customers by total sales

SELECT 
	customer_id,
	SUM(total_sale) AS total_sale 
	FROM retail_sales_tb
	GROUP BY customer_id
	ORDER BY total_sale DESC 
	LIMIT 5;


-- 47. Find customers with highest single transaction

-- 47. Find customers with highest single transaction

SELECT 
    customer_id,
    total_sale
FROM retail_sales_tb
WHERE total_sale = (SELECT MAX(total_sale)
FROM retail_sales_tb
);    
-- 48. Find average total_sale per customer
SELECT 
	customer_id,
	AVG(total_sale) AS Avg_total_sale
	FROM retail_sales_tb
	GROUP BY customer_id;

-- 49. Find customers who purchased from multiple categories

SELECT 
    customer_id
FROM retail_sales_tb
GROUP BY customer_id
HAVING COUNT(DISTINCT category) > 1;							--imp case

-- 50. Find categories with more than 50 transactions

SELECT 
    category,
    COUNT(*) AS total_transactions								--imp case
FROM retail_sales_tb
GROUP BY category
HAVING COUNT(*) > 50;

-----Intermediate → Analytical SQL

-- 1. Rank all transactions based on total_sale (highest first)

SELECT *,
	RANK()OVER(ORDER BY total_sale DESC )
	FROM retail_sales_tb;

-- 2. Assign row numbers to all transactions ordered by sale_date


SELECT *,
	ROW_NUMBER() OVER( ORDER BY sale_date)
	FROM retail_sales_tb;

-- 3. Assign dense rank based on total_sale

SELECT *,
		DENSE_RANK() OVER(ORDER BY total_sale)
		FROM retail_sales_tb;

-- 4. Find top 5 transactions using ROW_NUMBER()

SELECT *
		FROM(
	SELECT *,
	ROW_NUMBER() OVER (ORDER BY total_sale desc) r_number
	FROM retail_sales_tb)H
	WHERE r_number<=5


-- 5. Find top 5 transactions using RANK()

SELECT *
		FROM(
		SELECT *,
		RANK() OVER(ORDER BY total_sale DESC)  RANK_BY_T_SALE
		FROM retail_sales_tb)H
WHERE RANK_BY_T_SALE<=5;


-- 6. Find top 5 transactions using DENSE_RANK()

SELECT *
		FROM(
		SELECT*,
		DENSE_RANK() OVER(ORDER BY total_sale DESC) D_RANK
		FROM retail_sales_tb)H
WHERE D_RANK<=5

--7. Rank transactions within each category

SELECT *
FROM (
    SELECT *,
        RANK() OVER (
            PARTITION BY category
            ORDER BY total_sale DESC
        ) AS rank_per_cr
    FROM retail_sales_tb
) H;

-- 8. Assign row number per category based on total_sale
SELECT *
FROM (
    SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY category 
            ORDER BY total_sale DESC
        ) AS row_no_by_cr
    FROM retail_sales_tb
) H;


-- 9. Dense rank transactions per category
SELECT *
		FROM(
		SELECT *,
		DENSE_RANK() OVER(PARTITION BY category ORDER BY total_sale DESC) AS dense_ranks
		FROM retail_sales_tb)H;

-- 10. Find top 3 transactions per category using ROW_NUMBER()

SELECT *
		FROM(
		SELECT *,
		ROW_NUMBER() OVER(PARTITION BY category ORDER BY total_sale DESC) AS ROW_NO
		FROM  retail_sales_tb)H
		WHERE ROW_NO<=3;


-- 11. Find top 3 transactions per category using RANK()

SELECT *
		FROM (
		SELECT *,
		RANK() OVER (PARTITION BY category ORDER BY total_sale DESC) AS RK
		FROM retail_sales_tb)H
		WHERE RK<=3;
-- 12. Find top 3 transactions per category using DENSE_RANK()

SELECT *
		FROM(
		SELECT *,
		DENSE_RANK() OVER (PARTITION BY category ORDER BY total_sale DESC) AS D_RANK
		FROM retail_sales_tb)H
		WHERE D_RANK<=3;

-- 13. Find bottom 3 transactions based on total_sale

SELECT *
		FROM(
		SELECT*,
		ROW_NUMBER() OVER(ORDER BY total_sale ASC) AS TOP_TR
		FROM retail_sales_tb)H
		WHERE TOP_TR<=3;

-- 14. Find lowest transaction per category

SELECT *
		FROM(
		SELECT*,
		ROW_NUMBER() OVER(PARTITION BY category ORDER BY total_sale ASC) AS R_NO
		FROM retail_sales_tb)H
		WHERE R_NO=1

--15. Find highest transaction per customer

SELECT *
		FROM (
		SELECT *,
		ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY total_sale DESC) AS rn
   	    FROM retail_sales_tb) t
		WHERE rn = 1;



-- 16. Find second highest transaction per customer

SELECT *
		FROM (
		SELECT *,
		DENSE_RANK() OVER (PARTITION BY customer_id ORDER BY total_sale DESC) AS R_NO
   	    FROM retail_sales_tb) t
		WHERE R_NO=2;

-- 17. Find third highest transaction per category

SELECT *
		FROM(
		SELECT*,
		DENSE_RANK() OVER(PARTITION BY category ORDER BY total_sale DESC) AS Dr
   	    FROM retail_sales_tb) t
		WHERE Dr=3;


-- 18. Find customers with highest total_sale using ranking
 SELECT *
 		FROM(
		SELECT *,
		RANK() OVER( ORDER BY total_sale DESC) AS RN
		FROM retail_sales_tb)t
		WHERE RN=1;


-- 19. Rank customers based on total sales
SELECT 
    customer_id,
    SUM(total_sale) AS total_sales,
    RANK() OVER (ORDER BY SUM(total_sale) DESC) AS rnk
FROM retail_sales_tb
GROUP BY customer_id;


-- 20. Find top 3 customers based on total sales

SELECT *
		FROM (
	    SELECT customer_id,
        SUM(total_sale) AS total_sales,
        ROW_NUMBER() OVER (ORDER BY SUM(total_sale) DESC) AS rn
        FROM retail_sales_tb
        GROUP BY customer_id) t
		WHERE rn <= 3;

		
-- 21. Calculate total sales contribution (%) of each customer 

SELECT 
    customer_id,
    SUM(total_sale) AS total_sales,
    ROUND(
        SUM(total_sale) * 100.0 / SUM(SUM(total_sale)) OVER (),
        2
    ) AS contribution_percent
FROM retail_sales_tb
GROUP BY customer_id;


-- 22. Find cumulative (running) total sales over time 

SELECT 
    sale_date,
    SUM(total_sale) AS daily_sales,
    SUM(SUM(total_sale)) OVER (ORDER BY sale_date) AS cumulative_sales
FROM retail_sales_tb
GROUP BY sale_date
ORDER BY sale_date;


-- 23. Find running total of sales per customer

SELECT 
    customer_id,
    sale_date,
    total_sale,
    SUM(total_sale) OVER (PARTITION BY customer_id ORDER BY sale_date ) AS running_total
FROM retail_sales_tb;

-- 24. Find difference between current and previous transaction for each customer

SELECT 
    customer_id,
    sale_date,
    total_sale,
    total_sale - LAG(total_sale) OVER (
        PARTITION BY customer_id 
        ORDER BY sale_date, transactions_id) AS diff_prev
FROM retail_sales_tb;

-- 25. Find next transaction value for each customer

SELECT 
    customer_id,
    sale_date,
    total_sale,
    LEAD(total_sale) OVER (PARTITION BY customer_id ORDER BY sale_date, transactions_id) AS next_transaction
FROM retail_sales_tb;


-- 26. Calculate month-over-month sales growth (Advanced)
SELECT 
    EXTRACT(YEAR FROM sale_date) AS year,
    EXTRACT(MONTH FROM sale_date) AS month,
    SUM(total_sale) AS monthly_sales,
    SUM(total_sale) - LAG(SUM(total_sale)) OVER (
        ORDER BY EXTRACT(YEAR FROM sale_date), EXTRACT(MONTH FROM sale_date) ) AS mom_growth
FROM retail_sales_tb
GROUP BY year, month
ORDER BY year, month;

-- 27. Rank transactions within each month based on total_sale

SELECT 
    sale_date,
    customer_id,
    total_sale,
    RANK() OVER (PARTITION BY EXTRACT(YEAR FROM sale_date),
	EXTRACT(MONTH FROM sale_date) ORDER BY total_sale DESC ) AS monthly_rank
FROM retail_sales_tb;

-- 28. Find highest transaction for each day

SELECT 
    sale_date,
    customer_id,
    total_sale,
    RANK() OVER (PARTITION BY sale_date ORDER BY total_sale DESC) AS daily_rank
FROM retail_sales_tb;

-- 29. Find average transaction value per customer using window function

SELECT 
    customer_id,
    sale_date,
    total_sale,
    AVG(total_sale) OVER ( PARTITION BY customer_id) AS avg_transaction_value
FROM retail_sales_tb;

-- 30. Find maximum sale per category using window function
SELECT *,
    max(total_sale) OVER ( PARTITION BY category) AS max_sale
FROM retail_sales_tb;


-- SHOW ALL DATASET
SELECT * FROM retail_sales_tb;
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
SELECT * FROM retail_sales_tb
	WHERE SALE_DATE='2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
SELECT * FROM retail_sales_tb
	WHERE category='Clothing'
AND
	quantity>=4
AND
	sale_date between '2022-11-01' and '2022-11-30';
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

 SELECT 
    category,
    SUM(total_sale) AS net_sale
FROM retail_sales_tb
GROUP BY 1;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
SELECT 
	AVG(age)
FROM retail_sales_tb
where category='Beauty';

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
  SELECT *
  FROM retail_sales_tb
 WHERE total_sale>1000
 ;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
SELECT 
	gender,
	category,
	COUNT(transactions_id)
FROM retail_sales_tb
GROUP BY 1 , 2;
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

SELECT
	EXTRACT(YEAR FROM (sale_date)) as years,
	extract(MONTH FROM(sale_date))as month_number,
	AVG(total_sale) AS AVG_TOTAL_SALE
	FROM retail_sales_tb
	group by 1,2
	order by 1,2;

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales
	
SELECT 
    customer_id,
    SUM(total_sale) AS total_sales
FROM retail_sales_tb
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;


-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
SELECT 
    category,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales_tb
GROUP BY category;



-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

SELECT 
    CASE 
        WHEN EXTRACT(HOUR FROM sale_time) <= 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 13 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS total_orders
FROM retail_sales_tb
GROUP BY shift
ORDER BY shift;



