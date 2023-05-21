CREATE VIEW Sales_by_State 
AS 
SELECT C.state as State, COUNT(DISTINCT I.order_id) AS Total_Orders, ROUND(SUM(I.line_total),0) AS Revenue_in_USD 
FROM order_items I
INNER JOIN orders O ON O.order_id = I.order_id
INNER JOIN customers C on O.customer_id = C.customer_id
GROUP BY C.state