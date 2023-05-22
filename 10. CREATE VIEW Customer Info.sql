--Create a view so information can be viewed/interacted with safely, without risking the data in the database
CREATE VIEW Customer_Info
AS
SELECT customer_id, first_name, last_name, email, city, state
FROM customers

--This can be manipulated without impacting the database
