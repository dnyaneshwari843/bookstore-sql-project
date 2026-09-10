use bookstore;
-- Create Tables
DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
    Book_ID int PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);
DROP TABLE IF EXISTS customers;
CREATE TABLE Customers (
    Customer_ID int PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);
DROP TABLE IF EXISTS orders;
CREATE TABLE Orders (
    Order_ID int PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

-- 1) Retrieve all books in the "Fiction" genre:
select * from books
where Genre='Fiction';

-- 2) Find books published after the year 1950:
select * from books
where Published_Year>1950;

-- 3) List all customers from the Canada:
select * from customers
where Country='Canada';

-- 4) Show orders placed in November 2023:
select * from orders
where Order_Date between '2023-11-01' and '2023-11-30';


-- 5) Retrieve the total stock of books available:
select sum(Stock) as total_stock from books;


-- 6) Find the details of the most expensive book:
select * from books
order by Price desc
limit 1;

-- 7) Show all customers who ordered more than 1 quantity of a book:
select  c.Customer_ID,c.Name,o.Quantity
from customers c
join orders o on c.Customer_ID=o.Customer_ID
where o.Quantity>2;

-- 8) Retrieve all orders where the total amount exceeds $20:
select * from orders
where  Total_Amount>20;


-- 9) List all genres available in the Books table:
select Distinct(Genre)from books;


-- 10) Find the book with the lowest stock:
select * from books
order by Stock asc
limit 1;


-- 11) Calculate the total revenue generated from all orders:
select sum(Total_Amount) as total_revenue from orders;


-- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:
select Genre,count(Book_ID) from books
group by Genre;



-- 2) Find the average price of books in the "Fantasy" genre:
select avg(Price) as avgprice from books
where Genre='Fantasy';



-- 3) List customers who have placed at least 2 orders:
select  c.Customer_ID,c.Name,count(o.Order_ID) as total_order
from customers c
join orders o on c.Customer_ID=o.Customer_ID
group by c.Customer_ID
having count(o.Order_ID)>=2;


-- 4) Find the most frequently ordered book:
select  b.Book_ID,b.Title,sum(o.Quantity) as total_order
from books b
join orders o on b.Book_ID=o.Book_ID
group by b.Book_ID
order by total_order desc
limit 1;



-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
select Title,Price from books
where Genre='Fantasy'
order by Price desc
limit 3;



-- 6) Retrieve the total quantity of books sold by each author:
select b.Author,sum(o.Quantity) as quan
from books b
join orders o on b.Book_ID=o.Book_ID
group by b.Author;













