### SQL/ETL Final Project
# Introduction
In the digital era, effective data management is essential for a business to thrive and make informed decisions. To aid in this, a SQL infrastructure can be created to allow a business to store, organize, retrieve and analyze data. The goal of this project was to provide everything needed to create this infrastructure for a theoretical startup company.
# Design
Once it was decided that the focus of this database would be sales, relevant tables were determined and the relational nature of them was mapped. The data type was also determined. https://drawsql.app/ was used to visualize all of this, as seen in the image below.
![drawSQL-final-project-export-2023-05-22](https://github.com/BunceMichael/SQL-ETL_Final_Project/assets/108441653/788fc332-2b84-4341-9c3c-bd6860178750)
There is a customers table, with information about all of the customers, including contact info, where they are from, and how long they have been a customer. There is an orders table with information about each order, including the date the order was placed, the address it is being sent to, and the subtotal. There is a order_list table, which expands upon the orders table and includes information about the individual items in the order. And there is a products table, with information about each of the products the company sells, such as item description, cost, and sale price. The lines between tables in the image above show how these tables relate to each other.
# Creation of Infrastructure
The next step was to move into Microsoft SQL Server and create the database. File [1. CREATE DB Class.sql](https://github.com/BunceMichael/SQL-ETL_Final_Project/blob/6df46e83a5f3f52f2667cfb4dfe2d98ea481d039/1.%20CREATE%20DB%20Class.sql)
contains the code that was used to make the database and the tables within.
# Creation of Data 
https://www.mockaroo.com/ was used to generate mock data for the project. The schema was laid out, data types input, and parameters set in order to generate data that made sense, was intuitive, and easy to use. The schema for the products table is shown below.
<img width="1092" alt="Screen Shot 2023-05-23 at 1 13 02 PM" src="https://github.com/BunceMichael/SQL-ETL_Final_Project/assets/108441653/5cb21735-188e-44ab-a4a9-04b517da4472">
Four separate csv files were created, one for each table in the database.
[FPcustomers.csv](https://github.com/BunceMichael/SQL-ETL_Final_Project/blob/6df46e83a5f3f52f2667cfb4dfe2d98ea481d039/FPcustomers.csv),
[FPorders.csv](https://github.com/BunceMichael/SQL-ETL_Final_Project/blob/6df46e83a5f3f52f2667cfb4dfe2d98ea481d039/FPorders.csv),
[FPorder_items.csv](https://github.com/BunceMichael/SQL-ETL_Final_Project/blob/6df46e83a5f3f52f2667cfb4dfe2d98ea481d039/FPorder_items.csv),
and [FPproducts.csv](https://github.com/BunceMichael/SQL-ETL_Final_Project/blob/6df46e83a5f3f52f2667cfb4dfe2d98ea481d039/FPproducts.csv)
# Importing the Data 
In order to load the data into the database, Talend Open Studio for Data Integration was used. The job design can be seen below.

<img width="671" alt="Screen Shot 2023-05-23 at 2 13 10 PM" src="https://github.com/BunceMichael/SQL-ETL_Final_Project/assets/108441653/d8356aee-318d-4aab-8c9d-bef961cb772b">

First, a connection is made between Talend and the SQL Server database, tDBConnection_1. Then, each csv file is input as a file delimited and output to the database, into its corresponding table (tFileInputDelimited to tDBOutput 1 through 4, shown with the orange arrows). Upon completion of these tasks, Talend is disconnected from the database, tDBClose_1. With the current configuration, each time the job is run, the tables in the database are emptied and repopulated with the original csv files. This means if the data is altered or deleted in SQL Server, running the Talend job again would put everything back in its original form.
File [2. Talend Job ImportFPdata.zip](https://github.com/BunceMichael/SQL-ETL_Final_Project/blob/6df46e83a5f3f52f2667cfb4dfe2d98ea481d039/2.%20Talend%20Job%20ImportFPdata.zip)
contains a zip file to the job.
# Using the Database
[3. CREATE VIEW Sales by State.sql](https://github.com/BunceMichael/SQL-ETL_Final_Project/blob/6df46e83a5f3f52f2667cfb4dfe2d98ea481d039/3.%20CREATE%20VIEW%20Sales%20by%20State.sql) shows the creation of a view that combines and selects specific data from the customers, orders, and order_items tables to display a table that shows total sales and revenue by state. The resulting view is shown below. 

<img width="658" alt="Screen Shot 2023-05-23 at 2 15 06 PM" src="https://github.com/BunceMichael/SQL-ETL_Final_Project/assets/108441653/64ac70ef-a5d8-49bc-a1e1-584d1bef5793">

By selecting specific columns, joining multiple tables, and applying filters, views can present a simplified and coherent view of the data for reporting purposes. This can improve the efficiency of data retrieval and simplify the reporting and analytics workflow. This information provided by the Sales_by_State view could be used to identify market opportunites, target marketing efforts, adjust distribution and supply chain, adapt pricing, and develop regional sales strategies. 

[4. CREATE STORED PROCEDURE Calculate Total Sales.sql](https://github.com/BunceMichael/SQL-ETL_Final_Project/blob/6df46e83a5f3f52f2667cfb4dfe2d98ea481d039/4.%20CREATE%20STORED%20PROCEDURE%20Calculate%20Total%20Sales.sql) shows the creation of a stored procedure that can be executed whenever a user wants to know the total sales for a given period. This procedure can be integrated with reporting tools or used as a data source for generating reports, dashboards, or visualizations. This could enable the business to monitor sales performance, identify trends, and make data-driven decisions based on accurate and up-to-date information.

[5. CREATE FUNCTION Order Info From Email.sql](https://github.com/BunceMichael/SQL-ETL_Final_Project/blob/6df46e83a5f3f52f2667cfb4dfe2d98ea481d039/5.%20CREATE%20FUNCTION%20Order%20Info%20From%20Email.sql) shows the creation of a function that allows the user to pull up a table with a customer's order history by inputing their email address. The resulting table is shown below.
<img width="631" alt="Screen Shot 2023-05-23 at 2 41 56 PM" src="https://github.com/BunceMichael/SQL-ETL_Final_Project/assets/108441653/c2a04c73-edd1-4b13-b5ea-0c1222053e69">

This could be used by customer service reps to quickly access information about a customer's purchase history. The information provided by this function could also be used for personalized marketing and communication efforts. Using this tool, the business can analyze a customer's past purchases and send targeted promotions or recommendations based on their order history, enhancing customer engagement and loyalty.

[6. CREATE VIEW Customer Info.sql](https://github.com/BunceMichael/SQL-ETL_Final_Project/blob/6df46e83a5f3f52f2667cfb4dfe2d98ea481d039/6.%20CREATE%20VIEW%20Customer%20Info.sql) shows the creation and use of a view. Views can be used to control access to specific data within the database. By defining appropriate permissions and granting access to the view instead of the underlying tables, companies can ensure that users can only see/alter the authorized subset of data. This enables fine-grained access control and helps prevent unauthorized users from viewing or modifying sensitive information. 
