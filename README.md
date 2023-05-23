### SQL/ETL Final Project
# Introduction
In the digital era, effective data management is essential for a business to thrive and make informed decisions. To aid in this, a SQL infrastructure can be created to allow a business to store, organize, retrieve and analyze data. The goal of this project was to provide everything needed to create this infrastructure for a theoretical startup company.
# Design
Once it was decided that the focus of this database would be sales, relevant tables were determined and the relational nature of them was mapped. The data type was also determined. https://drawsql.app/ was used to visualize all of this, as seen in the image below.
![drawSQL-final-project-export-2023-05-22](https://github.com/BunceMichael/SQL-ETL_Final_Project/assets/108441653/788fc332-2b84-4341-9c3c-bd6860178750)
There is a customers table, with information about all of the customers, including contact info, where they are from, and how long they have been a customer. There is an orders table with information about each order, including the date the order was placed, the address it is being sent to, and the subtotal. There is a order_list table, which expands upon the orders table and includes information about the individual items in the order. And there is a products table, with information about each of the products the company sells, such as item description, cost and, sale price. The lines between tables in the image above show how these tables relate to each other.
# Creation of Infrastructure
The next step was to move into Microsoft SQL Server and create the database. File [1. CREATE DB Class.sql](https://github.com/BunceMichael/SQL-ETL_Final_Project/blob/6df46e83a5f3f52f2667cfb4dfe2d98ea481d039/1.%20CREATE%20DB%20Class.sql)
contains the code that was used to make the database and the tables within.
# Creation of Data 
https://www.mockaroo.com/ was used to generate mock data for the project. The schema was laid out, data types input, and parameters set in order to generate data that made sense, was intuitive, and easy to use. Four separate csv files were created, one for each table in the database. 
[FPcustomers.csv](https://github.com/BunceMichael/SQL-ETL_Final_Project/blob/6df46e83a5f3f52f2667cfb4dfe2d98ea481d039/FPcustomers.csv),
[FPorders.csv](https://github.com/BunceMichael/SQL-ETL_Final_Project/blob/6df46e83a5f3f52f2667cfb4dfe2d98ea481d039/FPorders.csv),
[FPorder_items.csv](https://github.com/BunceMichael/SQL-ETL_Final_Project/blob/6df46e83a5f3f52f2667cfb4dfe2d98ea481d039/FPorder_items.csv),
[FPproducts.csv](https://github.com/BunceMichael/SQL-ETL_Final_Project/blob/6df46e83a5f3f52f2667cfb4dfe2d98ea481d039/FPproducts.csv)
# Importing the Data 
In order to load the data into the database, Talend Open Studio for Data Integration was used. The job design can be seen below.  
<img width="695" alt="Screen Shot 2023-05-22 at 8 43 19 PM" src="https://github.com/BunceMichael/SQL-ETL_Final_Project/assets/108441653/4d443af2-10d4-465d-9dfe-d47122df00cb">

First, a connection is made between Talend and the SQL Server database, tDBConnection_1. Then, each csv file is input as a file delimited and output to the database, into its corresponding table (tFileInputDelimited to tDBOutput 1 through 4). Upon completion of these tasks, Talend is disconnected from the database, tDBClose_1. With the current configuration, each time the job is run, the tables in the database are emptied and repopulated with the original csv files. This means if the data is altered or deleted in SQL Server, running the Talend job again would put everything back in its original form.
File [2. Talend Job ImportFPdata.zip](https://github.com/BunceMichael/SQL-ETL_Final_Project/blob/6df46e83a5f3f52f2667cfb4dfe2d98ea481d039/2.%20Talend%20Job%20ImportFPdata.zip)
contains a zip file to the job.
# Using the Database
[3. CREATE VIEW Sales by State.sql](https://github.com/BunceMichael/SQL-ETL_Final_Project/blob/6df46e83a5f3f52f2667cfb4dfe2d98ea481d039/3.%20CREATE%20VIEW%20Sales%20by%20State.sql) shows the creation of a view that combines and selects specific data from the customers, orders, and order_items tables to display a table that shows total sales and revenue by state. This information could be used to identify market opportunites, target marketing efforts, adjust distribution and supply chain, adapt pricing, and develop regional strategies.

[4. CREATE STORED PROCEDURE Calculate Total Sales.sql](https://github.com/BunceMichael/SQL-ETL_Final_Project/blob/6df46e83a5f3f52f2667cfb4dfe2d98ea481d039/4.%20CREATE%20STORED%20PROCEDURE%20Calculate%20Total%20Sales.sql) shows the creation of a stored procedure that can be used whenever a user wants to know the total sales for a given period.

[5. CREATE FUNCTION Order Info From Email.sql](https://github.com/BunceMichael/SQL-ETL_Final_Project/blob/6df46e83a5f3f52f2667cfb4dfe2d98ea481d039/5.%20CREATE%20FUNCTION%20Order%20Info%20From%20Email.sql) shows the creation of a function that allows the user to pull up a table with a customer's order history just by inputing their email address. This could be used by customer service reps to quickly access information about a customer's purchase history.

[6. CREATE VIEW Customer Info.sql](https://github.com/BunceMichael/SQL-ETL_Final_Project/blob/6df46e83a5f3f52f2667cfb4dfe2d98ea481d039/6.%20CREATE%20VIEW%20Customer%20Info.sql) shows the creation and use of a view. A view allows the user to see only selected columns from the database and protects the underlying data by allowing manipulation of the view without affecting the information in the database.
