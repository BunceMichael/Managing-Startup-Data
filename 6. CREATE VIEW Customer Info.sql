--Create a view so information can be viewed/interacted with safely, without risking the data in the database
CREATE VIEW Customer_Info
AS
  SELECT customer_id, first_name, last_name, email, city, state
  FROM customers;

--Select the view to see contents
SELECT * FROM [dbo].[Customer_Info];

--Contents can be manipulated without impacting the database
--User can insert new entries
INSERT INTO [dbo].[Customer_Info] (customer_id, first_name, last_name, email, city, state)
VALUES (101, 'Michael', 'Bunce', 'michaelbunce@email.com', 'Albany', 'New York');

--User can delete entries
DELETE FROM [dbo].[Customer_Info]
WHERE customer_id = 101;

--View can be altered to display different data
ALTER VIEW Customer_Info
AS
	SELECT C.customer_id, C.first_name, C.last_name, O.order_id, O.order_date
	FROM customers C
		FULL JOIN orders O on C.customer_id = O.customer_id;
