--This function allows the user to pull up historic order information for a customer given the customer's email address
CREATE FUNCTION Order_Info_From_Email (@email VARCHAR(255))
RETURNS TABLE AS
RETURN
	SELECT O.order_date, O.order_id, C.first_name, C.last_name , O.shipping_street, O.shipping_city, O.shipping_state, O.shipping_zip, 
	P.product_name, I.quantity, I.unit_price
	FROM customers C
	INNER JOIN orders O ON C.customer_id = O.customer_id
	FULL JOIN order_items I on O.order_id = I.order_id
	FULL JOIN products P on I.product_id = P.product_id
	WHERE C.email = @email;
	
--Query the function, using email pantoons0@phoca.cz as example
--Order by date descending to see most recent orders first
SELECT * FROM Order_Info_From_Email('pantoons0@phoca.cz')
ORDER BY order_date DESC;
