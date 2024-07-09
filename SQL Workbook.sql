SELECT area_code,
		SUM(sales) Sales
FROM Product p,
	Fact f
WHERE p.Product_Id = f.Product_Id
		and product_type = 'Espresso'
GROUP BY area_code
ORDER BY Sales DESC
LIMIT 1 OFFSET 24;

SELECT State,
	   SUM(Profit) Profit
FROM Product p,
	 Location l,
     Fact f
WHERE p.Product_Id = f.Product_Id
	  And l.Area_Code = f.Area_Code
      And Market = 'East'
      and product_type = 'Espresso'
GROUP BY state
ORDER BY Profit 
LIMIT 1;

SELECT Quarter, budget_profit_diff
FROM (SELECT Quarter,
             SUM(budget_profit) budget_profit,
             LAG(SUM(budget_profit), 1) OVER (ORDER BY quarter) budget_profit_prev,
             SUM(budget_profit) - LAG(SUM(budget_profit), 1) OVER (ORDER BY quarter) budget_profit_diff

      FROM Location l,
           Date d,
           Fact f  
      WHERE l.Area_Code = f.Area_Code
            and d.Date = f.Date
            and market_size = 'Major Market'
      GROUP BY quarter
      ORDER BY quarter)
 WHERE quarter = '2012Q3';
 
 /* if number of distinct values = number of unique values in a column, then it's a primary key (PK), otherwise it's a foreign key (FK).Date
 ever occur (distinct) = occur only once (unique) + occur more than once (duplicate) */
 
SELECT COUNT(DISTINCT product_id)
FROM Product 

select product_id,
	   count(*)
FROM Product 
group by product_id
having COUNT(*) = 1;

select product_id,
	   count(*)
FROM Product 
group by product_id
having COUNT(*) > 1;

SELECT
FROM 
WHERE 
GROUP BY
ORDER BY