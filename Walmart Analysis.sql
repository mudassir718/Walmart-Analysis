-- How many unique product lines does the data have?

SELECT COUNT(DISTINCT(`product line`)) product_line FROM walmart;

    
-- What is the most common payment method?

SELECT payment, count(*) FROM walmart
GROUP BY payment
ORDER BY count(*) DESC;

-- What is the most selling product line?

SELECT 
    `product line`, COUNT(`product line`) AS cnt
FROM
    walmart
GROUP BY `product line`
ORDER BY cnt DESC;

-- What is the total revenue by month?

SELECT 
    month_name, ROUND(SUM(total), 2) AS revenue
FROM
    walmart
GROUP BY month_name;


-- What month had the largest COGS?

SELECT 
    month_name, SUM(cogs) cogs
FROM
    walmart
GROUP BY month_name
ORDER BY cogs DESC;

-- What product line had the largest revenue?
                                    
SELECT 
    `product line`, round(SUM(total),2) revenue
FROM
    walmart
GROUP BY `product line`
ORDER BY revenue DESC
LIMIT 5;

-- 	What is the city with the largest revenue?

SELECT 
    bra, ROUND(SUM(total), 2) largest_revnue
FROM
    walmart
GROUP BY branch,city;

-- What product line had the largest TAX?
                                
SELECT `product line`, `tax 5%` VAT FROM walmart
ORDER BY `tax 5%` DESC
LIMIT 1;
						

-- Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales

SELECT round(avg(total),0) avg_qty from walmart;

SELECT `product line`, CASE WHEN `product line` > avg(total) THEN 'GOOD' ELSE 'BAD' END AS pro_stats
FROM walmart
GROUP BY `product line`;


-- Which branch sold more products than average product sold?

SELECT 
    branch, SUM(quantity) AS qty
FROM
    walmart
GROUP BY branch
HAVING qty > (SELECT 
        AVG(quantity)
    FROM
        walmart);


-- What is the most common product line by gender?

SELECT 
    `product line`, gender, COUNT(gender) AS total_cnt
FROM
    walmart
GROUP BY gender , `product line`;

-- What is the average rating of each product line?

SELECT 
    `product line`, ROUND(AVG(rating), 2) avg_rating
FROM
    walmart
GROUP BY `product line`
ORDER BY avg_rating DESC;

-- Number of sales made in each time of the day per weekday

SELECT 
    COUNT(total) sales, day_time, day_name
FROM
    walmart
    WHERE day_name='Sunday'
GROUP BY day_time , day_name;

-- Which of the customer types brings the most revenue?

SELECT 
    `customer type`, ROUND(SUM(total), 3) revenue
FROM
    walmart
GROUP BY `customer type`
ORDER BY revenue DESC;

-- Which city has the largest tax percent/ VAT (Value Added Tax)?

SELECT 
    city, AVG(VAT) avg_vat
FROM
    walmart
GROUP BY city
ORDER BY avg_vat DESC;

-- Which customer type pays the most in VAT?

SELECT 
    `customer type`, AVG(VAT) VAT
FROM
    walmart
GROUP BY `customer type`
ORDER BY VAT DESC;

-- How many unique customer types does the data have?

SELECT 
    COUNT(DISTINCT (`customer type`)) customr_types
FROM
    walmart;
    
-- How many unique payment methods does the data have?

SELECT 
    payment, COUNT(DISTINCT (payment)) payment_method
FROM
    walmart
GROUP BY payment;
 
-- Which customer type buys the most?

SELECT 
    `customer type`, COUNT(*) sales
FROM
    walmart
GROUP BY `customer type`
ORDER BY sales DESC
LIMIT 1;

-- What is the gender of most of the customers?

SELECT 
    gender, COUNT(*) gender
FROM
    walmart
GROUP BY gender
ORDER BY gender DESC;

-- What is the gender distribution per branch?

SELECT 
    branch, gender, COUNT(gender) gender
FROM
    walmart
WHERE
    branch = 'C'
GROUP BY branch , gender;

-- Which time of the day do customers give most ratings?

SELECT 
    day_time, AVG(rating)
FROM
    walmart
GROUP BY day_time;