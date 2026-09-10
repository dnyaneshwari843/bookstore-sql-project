# Bookstore Management System - SQL Project
Complete end-to-end SQL project for managing a bookstore.
 
 1. Database Design
Created 3 relational tables using MySQL Workbench:
**Books Table:**
Book_ID (PK) | Title | Author | Genre | Published_Year | Price | Stock
- Stores book inventory details
**Customers Table:**
Customer_ID (PK) | Name | Email | Phone | City | Country
- Stores customer information
**Orders Table:**
Order_ID (PK) | Customer_ID (FK -> Customers) | Book_ID (FK -> Books) | Order_Date | Quantity | Total_Amount
- Main transaction table that connects Customers and Books

2. Key Features
- Used DROP TABLE IF EXISTS for clean re-creation
- Primary Key & Foreign Key relationships (REFERENCES)
- NUMERIC(10,2) for accurate price calculation

 3. Data Handling
- Imported real datasets from 3 CSV files (Customers.csv, Books.csv, Orders.csv) using Table Data Import Wizard
- Not manual INSERT - real-world data import method

MySQL Workbench | GitHub | CSV

Repo: github.com/dnyaneshwari843/bookstore-sql-project
