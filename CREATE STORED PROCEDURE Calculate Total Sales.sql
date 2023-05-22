--Create stored procedure for use later
--This one calculates the total revenue between two given dates
CREATE PROCEDURE Calculate_Total_Sales
	@Start_Date DATETIME,
	@End_Date DATETIME
AS
BEGIN
	SELECT ROUND(SUM(order_subtotal),2) AS Total_Sales
	FROM orders
	WHERE order_date BETWEEN @Start_Date AND @End_Date;
END

--To use the stored procedure, execute it with a given start and end date
EXEC Calculate_Total_Sales @Start_Date = '2022-07-01 00:00:00.000', @End_Date = '2022-09-30 23:59:59.999';
