--Now that the data is loaded into SQL Server, we can create useful views
--This one aggregates data by state for geographic sales analysis
CREATE VIEW Sales_by_State 
AS 
SELECT C.state as State, COUNT(DISTINCT I.order_id) AS Total_Orders, ROUND(SUM(I.line_total),0) AS Revenue_in_USD 
FROM order_items I
INNER JOIN orders O ON O.order_id = I.order_id
INNER JOIN customers C on O.customer_id = C.customer_id
GROUP BY C.state;

--Query the view
SELECT * FROM [dbo].[Sales_by_State];

--Sort the data to make it easier to understand
SELECT * FROM [dbo].[Sales_by_State]
ORDER BY Revenue_in_USD DESC;
