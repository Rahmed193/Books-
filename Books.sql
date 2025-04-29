-- Create database 
CREATE DATABASE book_store; 

-- Create books table 
DROP TABLE IF EXISTS books; 

CREATE TABLE books (
	isbn VARCHAR(20) PRIMARY KEY, 
	title VARCHAR(255) NOT NULL, 
	author VARCHAR(100), 
	publisher VARCHAR(100), 
	price DECIMAL(10,2),
	category VARCHAR(50)
);

-- Create customers table 
DROP TABLE IF EXISTS customers; 

CREATE TABLE customers (
	customer_id CHAR(5) PRIMARY KEY,
	name VARCHAR(100), 
	email VARCHAR(100), 
	phone VARCHAR(20), 
	address TEXT
);

-- Create employees table 
DROP TABLE IF EXISTS employees; 

CREATE TABLE employees  (
	emp_id CHAR(5) PRIMARY KEY,
	name VARCHAR(100), 
	position VARCHAR(50),
	salary DECIMAL(10,2)
);

-- Create inventory table 
DROP TABLE IF EXISTS inventory; 

CREATE TABLE inventory (
	inventory_id SERIAL PRIMARY KEY,
	isbn VARCHAR(20), 
	quantity INT,
	FOREIGN KEY (isbn) REFERENCES books(isbn) ON DELETE CASCADE
);

-- Create sales table 
DROP TABLE IF EXISTS sales; 

CREATE TABLE sales (
	sales_id CHAR(6) PRIMARY KEY, 
	isbn VARCHAR(20), 
	customer_id CHAR(5), 
	emp_id CHAR(5),
	sales_date DATE,
	quantity INT,
	total_price DECIMAL(10,2), 
	FOREIGN KEY (isbn) REFERENCES books(isbn),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

-- Insert into books table
INSERT INTO books VALUES ('978-0143127741', 'Sapiens', 'Yuval Noah Harari', 'Harper', 14.99, 'History');
INSERT INTO books VALUES ('978-0062316097', 'The Alchemist', 'Paulo Coelho', 'HarperOne', 10.99, 'Fiction');
INSERT INTO books VALUES ('978-1982137274', 'Atomic Habits', 'James Clear', 'Avery', 11.98, 'Self-Help');
INSERT INTO books VALUES ('978-0307277785', 'Outliers', 'Malcolm Gladwell', 'Back Bay Books', 9.89, 'Psychology');
INSERT INTO books VALUES ('978-0140449136', 'Meditations', 'Marcus Aurelius', 'Penguin Classics', 8.50, 'Philosophy');
INSERT INTO books VALUES ('978-0385472579', 'Zen and the Art of Motorcycle Maintenance', 'Robert M. Pirsig', 'HarperTorch', 7.95, 'Philosophy');
INSERT INTO books VALUES ('978-0590353427', 'Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 'Scholastic', 6.98, 'Fantasy');
INSERT INTO books VALUES ('978-0316769488', 'The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', 5.99, 'Fiction');
INSERT INTO books VALUES ('978-1451673319', 'Fahrenheit 451', 'Ray Bradbury', 'Simon & Schuster', 7.19, 'Science Fiction');
INSERT INTO books VALUES ('978-0061122415', 'To Kill a Mockingbird', 'Harper Lee', 'Harper Perennial', 8.99, 'Fiction');
INSERT INTO books VALUES ('978-0140449266', 'The Republic', 'Plato', 'Penguin Classics', 10.99, 'Philosophy');
INSERT INTO books VALUES ('978-0192833983', 'The Odyssey', 'Homer', 'Oxford University Press', 9.95, 'Classics');
INSERT INTO books VALUES ('978-0385319959', 'Slaughterhouse-Five', 'Kurt Vonnegut', 'Dial Press', 6.80, 'Fiction');
INSERT INTO books VALUES ('978-0140449273', 'Nicomachean Ethics', 'Aristotle', 'Penguin Classics', 11.50, 'Philosophy');
INSERT INTO books VALUES ('978-0307743657', 'Thinking, Fast and Slow', 'Daniel Kahneman', 'Farrar, Straus and Giroux', 12.60, 'Psychology');
INSERT INTO books VALUES ('978-1455586691', 'Start with Why', 'Simon Sinek', 'Portfolio', 10.30, 'Business');
INSERT INTO books VALUES ('978-0062457714', 'You Are a Badass', 'Jen Sincero', 'Running Press', 8.70, 'Self-Help');
INSERT INTO books VALUES ('978-0062315007', 'The Power of Now', 'Eckhart Tolle', 'New World Library', 9.75, 'Spirituality');
INSERT INTO books VALUES ('978-1501124020', 'The Subtle Art of Not Giving a F*ck', 'Mark Manson', 'Harper', 12.99, 'Self-Help');
INSERT INTO books VALUES ('978-1594633669', 'The Girl on the Train', 'Paula Hawkins', 'Riverhead Books', 7.99, 'Thriller');
INSERT INTO books VALUES ('978-0439139595', 'Harry Potter and the Goblet of Fire', 'J.K. Rowling', 'Scholastic', 8.50, 'Fantasy');
INSERT INTO books VALUES ('978-0618640157', 'The Hobbit', 'J.R.R. Tolkien', 'Houghton Mifflin', 10.45, 'Fantasy');
INSERT INTO books VALUES ('978-0307949486', 'Gone Girl', 'Gillian Flynn', 'Crown Publishing', 9.30, 'Thriller');
INSERT INTO books VALUES ('978-0143105985', '1984', 'George Orwell', 'Penguin Classics', 6.40, 'Dystopian');
INSERT INTO books VALUES ('978-0060935467', 'Brave New World', 'Aldous Huxley', 'Harper Perennial', 7.60, 'Science Fiction');
INSERT INTO books VALUES ('978-0060850524', 'The Road', 'Cormac McCarthy', 'Vintage', 7.95, 'Post-Apocalyptic');
INSERT INTO books VALUES ('978-0735211292', 'Educated', 'Tara Westover', 'Random House', 11.20, 'Memoir');
INSERT INTO books VALUES ('978-0316015844', 'Twilight', 'Stephenie Meyer', 'Little, Brown', 6.99, 'Young Adult');
INSERT INTO books VALUES ('978-0061120084', 'East of Eden', 'John Steinbeck', 'Penguin Books', 9.50, 'Classics');
INSERT INTO books VALUES ('978-0679783275', 'Pride and Prejudice', 'Jane Austen', 'Vintage', 5.50, 'Romance');

-- Insert data into the customers table 
INSERT INTO customers VALUES ('C0001', 'Alice Johnson', 'alice.johnson@example.com', '555-123-4567', '123 Maple Street, Springfield');
INSERT INTO customers VALUES ('C0002', 'Bob Smith', 'bob.smith@example.com', '555-234-5678', '456 Oak Avenue, Rivertown');
INSERT INTO customers VALUES ('C0003', 'Carol Martinez', 'carol.m@example.com', '555-345-6789', '789 Pine Road, Hillview');
INSERT INTO customers VALUES ('C0004', 'David Lee', 'david.lee@example.com', '555-456-7890', '321 Birch Lane, Lakeside');
INSERT INTO customers VALUES ('C0005', 'Emma Thompson', 'emma.t@example.com', '555-567-8901', '654 Cedar Blvd, Bayview');
INSERT INTO customers VALUES ('C0006', 'Frank Harris', 'frank.h@example.com', '555-678-9012', '987 Willow Dr, Oakdale');
INSERT INTO customers VALUES ('C0007', 'Grace Kim', 'grace.kim@example.com', '555-789-0123', '135 Aspen Way, Brookfield');
INSERT INTO customers VALUES ('C0008', 'Henry Allen', 'henry.allen@example.com', '555-890-1234', '246 Redwood St, Greenhill');
INSERT INTO customers VALUES ('C0009', 'Isabel Clark', 'isabel.c@example.com', '555-901-2345', '357 Poplar Ct, Westport');
INSERT INTO customers VALUES ('C0010', 'Jack Wilson', 'jack.w@example.com', '555-012-3456', '468 Spruce Ave, Northvale');
INSERT INTO customers VALUES ('C0011', 'Karen Adams', 'karen.adams@example.com', '555-234-6789', '579 Fir St, Eastwood');
INSERT INTO customers VALUES ('C0012', 'Leo Parker', 'leo.p@example.com', '555-345-7890', '680 Elm Cir, Midtown');
INSERT INTO customers VALUES ('C0013', 'Mia Scott', 'mia.scott@example.com', '555-456-8901', '791 Sycamore Pl, Riverbend');
INSERT INTO customers VALUES ('C0014', 'Nathan Brooks', 'nathan.b@example.com', '555-567-9012', '892 Magnolia Blvd, Fairview');
INSERT INTO customers VALUES ('C0015', 'Olivia James', 'olivia.j@example.com', '555-678-0123', '903 Chestnut St, Cedarville');
INSERT INTO customers VALUES ('C0016', 'Paul Turner', 'paul.t@example.com', '555-789-1234', '114 Dogwood Dr, Edgewood');
INSERT INTO customers VALUES ('C0017', 'Quinn Young', 'quinn.y@example.com', '555-890-2345', '225 Linden Ln, Hilltop');
INSERT INTO customers VALUES ('C0018', 'Rachel Evans', 'rachel.e@example.com', '555-901-3456', '336 Hickory Rd, Maplewood');
INSERT INTO customers VALUES ('C0019', 'Sam Wright', 'sam.w@example.com', '555-012-4567', '447 Sequoia Way, Stonebridge');
INSERT INTO customers VALUES ('C0020', 'Tina Nelson', 'tina.n@example.com', '555-123-5678', '558 Ironwood Ter, Crystal Bay');
INSERT INTO customers VALUES ('C0021', 'Umar Davis', 'umar.d@example.com', '555-234-6780', '669 Redwood Pl, Silverlake');
INSERT INTO customers VALUES ('C0022', 'Vera Gonzalez', 'vera.g@example.com', '555-345-7891', '770 Alder Ln, Forest Glen');
INSERT INTO customers VALUES ('C0023', 'Will Baker', 'will.b@example.com', '555-456-8902', '881 Walnut Dr, Grandview');
INSERT INTO customers VALUES ('C0024', 'Xena Moore', 'xena.moore@example.com', '555-567-9013', '992 Beech St, Westlake');
INSERT INTO customers VALUES ('C0025', 'Yara Reed', 'yara.r@example.com', '555-678-0124', '103 Pecan Blvd, Highland Park');
INSERT INTO customers VALUES ('C0026', 'Zane Cooper', 'zane.c@example.com', '555-789-1235', '214 Laurel Ct, Eastlake');
INSERT INTO customers VALUES ('C0027', 'Ava Richardson', 'ava.richardson@example.com', '555-890-2346', '325 Cottonwood Ave, Sunset Hill');
INSERT INTO customers VALUES ('C0028', 'Ben Foster', 'ben.foster@example.com', '555-901-3457', '436 Hemlock Rd, Pinecrest');
INSERT INTO customers VALUES ('C0029', 'Chloe Morgan', 'chloe.morgan@example.com', '555-012-4568', '547 Cedar Cir, Oceanview');
INSERT INTO customers VALUES ('C0030', 'Dylan Hayes', 'dylan.hayes@example.com', '555-123-5679', '658 Maple Grove, Greenfield');

-- Insert into the employees table 
INSERT INTO employees VALUES ('E0001', 'Alice Grant', 'Manager', 75000.00);
INSERT INTO employees VALUES ('E0002', 'Brian Ortega', 'Sales Associate', 42000.00);
INSERT INTO employees VALUES ('E0003', 'Catherine Lin', 'HR Specialist', 50000.00);
INSERT INTO employees VALUES ('E0004', 'Daniel White', 'Software Engineer', 85000.00);
INSERT INTO employees VALUES ('E0005', 'Ella Brooks', 'Graphic Designer', 48000.00);
INSERT INTO employees VALUES ('E0006', 'Frank Yang', 'Accountant', 60000.00);
INSERT INTO employees VALUES ('E0007', 'Grace Kim', 'Customer Support', 39000.00);
INSERT INTO employees VALUES ('E0008', 'Henry Coleman', 'Product Manager', 90000.00);
INSERT INTO employees VALUES ('E0009', 'Isla Rivera', 'Marketing Executive', 57000.00);
INSERT INTO employees VALUES ('E0010', 'Jack Wilson', 'IT Technician', 52000.00);
INSERT INTO employees VALUES ('E0011', 'Karen Blake', 'Office Administrator', 44000.00);
INSERT INTO employees VALUES ('E0012', 'Liam Turner', 'Data Analyst', 69000.00);
INSERT INTO employees VALUES ('E0013', 'Mia Stewart', 'Software Tester', 63000.00);
INSERT INTO employees VALUES ('E0014', 'Noah Hayes', 'Sales Manager', 67000.00);
INSERT INTO employees VALUES ('E0015', 'Olivia King', 'Finance Manager', 72000.00);
INSERT INTO employees VALUES ('E0016', 'Peter Adams', 'Warehouse Supervisor', 46000.00);
INSERT INTO employees VALUES ('E0017', 'Quincy Bennett', 'Logistics Coordinator', 49000.00);
INSERT INTO employees VALUES ('E0018', 'Rachel Moore', 'Business Analyst', 68000.00);
INSERT INTO employees VALUES ('E0019', 'Samuel James', 'Operations Manager', 74000.00);
INSERT INTO employees VALUES ('E0020', 'Tina Long', 'Content Writer', 43000.00);
INSERT INTO employees VALUES ('E0021', 'Umar Khan', 'Legal Advisor', 78000.00);
INSERT INTO employees VALUES ('E0022', 'Violet Hart', 'UX Designer', 61000.00);
INSERT INTO employees VALUES ('E0023', 'William Scott', 'Technical Lead', 95000.00);
INSERT INTO employees VALUES ('E0024', 'Xena Dawson', 'Recruiter', 56000.00);
INSERT INTO employees VALUES ('E0025', 'Yusuf Patel', 'Security Officer', 40000.00);
INSERT INTO employees VALUES ('E0026', 'Zara Lewis', 'Training Coordinator', 51000.00);
INSERT INTO employees VALUES ('E0027', 'Andy Chu', 'Data Scientist', 88000.00);
INSERT INTO employees VALUES ('E0028', 'Bella Reyes', 'Executive Assistant', 470);

-- Insert into inventory table 
INSERT INTO inventory (isbn, quantity) VALUES ('978-0143127741', 12);
INSERT INTO inventory (isbn, quantity) VALUES ('978-0062316097', 8);
INSERT INTO inventory (isbn, quantity) VALUES ('978-1982137274', 15);
INSERT INTO inventory (isbn, quantity) VALUES ('978-0307277785', 10);
INSERT INTO inventory (isbn, quantity) VALUES ('978-0140449136', 9);
INSERT INTO inventory (isbn, quantity) VALUES ('978-0385472579', 7);
INSERT INTO inventory (isbn, quantity) VALUES ('978-0590353427', 25);
INSERT INTO inventory (isbn, quantity) VALUES ('978-0316769488', 11);
INSERT INTO inventory (isbn, quantity) VALUES ('978-1451673319', 6);
INSERT INTO inventory (isbn, quantity) VALUES ('978-0061122415', 13);
INSERT INTO inventory (isbn, quantity) VALUES ('978-0140449266', 5);
INSERT INTO inventory (isbn, quantity) VALUES ('978-0192833983', 14);
INSERT INTO inventory (isbn, quantity) VALUES ('978-0385319959', 9);
INSERT INTO inventory (isbn, quantity) VALUES ('978-0140449273', 8);
INSERT INTO inventory (isbn, quantity) VALUES ('978-0307743657', 10);
INSERT INTO inventory (isbn, quantity) VALUES ('978-1455586691', 12);
INSERT INTO inventory (isbn, quantity) VALUES ('978-0062457714', 7);
INSERT INTO inventory (isbn, quantity) VALUES ('978-0062315007', 16);
INSERT INTO inventory (isbn, quantity) VALUES ('978-1501124020', 20);
INSERT INTO inventory (isbn, quantity) VALUES ('978-1594633669', 11);
INSERT INTO inventory (isbn, quantity) VALUES ('978-0439139595', 18);
INSERT INTO inventory (isbn, quantity) VALUES ('978-0618640157', 13);
INSERT INTO inventory (isbn, quantity) VALUES ('978-0307949486', 10);
INSERT INTO inventory (isbn, quantity) VALUES ('978-0143105985', 9);
INSERT INTO inventory (isbn, quantity) VALUES ('978-0060935467', 8);
INSERT INTO inventory (isbn, quantity) VALUES ('978-0060850524', 6);
INSERT INTO inventory (isbn, quantity) VALUES ('978-0735211292', 14);
INSERT INTO inventory (isbn, quantity) VALUES ('978-0316015844', 19);
INSERT INTO inventory (isbn, quantity) VALUES ('978-0061120084', 10);
INSERT INTO inventory (isbn, quantity) VALUES ('978-0679783275', 17);

-- Insert into the Sales table 
INSERT INTO sales VALUES ('S00001', '978-0143127741', 'C0001', 'E0002', '2024-07-12', 2, 29.98);
INSERT INTO sales VALUES ('S00002', '978-0062316097', 'C0003', 'E0010', '2024-08-15', 1, 10.99);
INSERT INTO sales VALUES ('S00003', '978-1982137274', 'C0005', 'E0004', '2024-10-10', 3, 35.94);
INSERT INTO sales VALUES ('S00004', '978-0307277785', 'C0007', 'E0013', '2024-09-08', 2, 19.78);
INSERT INTO sales VALUES ('S00005', '978-0140449136', 'C0010', 'E0005', '2024-06-21', 1, 8.50);
INSERT INTO sales VALUES ('S00006', '978-0385472579', 'C0012', 'E0017', '2024-11-30', 1, 7.95);
INSERT INTO sales VALUES ('S00007', '978-0590353427', 'C0013', 'E0009', '2024-12-05', 4, 27.92);
INSERT INTO sales VALUES ('S00008', '978-0316769488', 'C0014', 'E0020', '2024-10-18', 1, 5.99);
INSERT INTO sales VALUES ('S00009', '978-1451673319', 'C0015', 'E0001', '2024-05-09', 2, 14.38);
INSERT INTO sales VALUES ('S00010', '978-0061122415', 'C0016', 'E0014', '2024-08-25', 3, 26.97);
INSERT INTO sales VALUES ('S00011', '978-0140449266', 'C0017', 'E0011', '2024-11-01', 1, 10.99);
INSERT INTO sales VALUES ('S00012', '978-0192833983', 'C0018', 'E0021', '2024-07-20', 2, 19.90);
INSERT INTO sales VALUES ('S00013', '978-0385319959', 'C0019', 'E0006', '2024-06-10', 1, 6.80);
INSERT INTO sales VALUES ('S00014', '978-0140449273', 'C0020', 'E0015', '2024-09-14', 2, 23.00);
INSERT INTO sales VALUES ('S00015', '978-0307743657', 'C0021', 'E0016', '2024-10-04', 1, 12.60);
INSERT INTO sales VALUES ('S00016', '978-1455586691', 'C0022', 'E0019', '2024-05-27', 3, 30.90);
INSERT INTO sales VALUES ('S00017', '978-0062457714', 'C0023', 'E0022', '2024-06-03', 1, 8.70);
INSERT INTO sales VALUES ('S00018', '978-0062315007', 'C0024', 'E0025', '2024-08-19', 2, 19.50);
INSERT INTO sales VALUES ('S00019', '978-1501124020', 'C0025', 'E0026', '2024-12-22', 4, 51.96);
INSERT INTO sales VALUES ('S00020', '978-1594633669', 'C0026', 'E0018', '2024-07-30', 2, 15.98);
INSERT INTO sales VALUES ('S00021', '978-0439139595', 'C0027', 'E0008', '2024-11-14', 3, 25.50);
INSERT INTO sales VALUES ('S00022', '978-0618640157', 'C0028', 'E0024', '2024-10-01', 1, 10.45);
INSERT INTO sales VALUES ('S00023', '978-0307949486', 'C0029', 'E0012', '2024-12-10', 1, 9.30);
INSERT INTO sales VALUES ('S00024', '978-0143105985', 'C0030', 'E0003', '2024-08-05', 2, 12.80);
INSERT INTO sales VALUES ('S00025', '978-0060935467', 'C0002', 'E0023', '2024-06-16', 2, 15.20);
INSERT INTO sales VALUES ('S00026', '978-0060850524', 'C0004', 'E0007', '2024-09-25', 1, 7.95);
INSERT INTO sales VALUES ('S00027', '978-0735211292', 'C0006', 'E0014', '2024-07-08', 2, 22.40);
INSERT INTO sales VALUES ('S00028', '978-0316015844', 'C0008', 'E0027', '2024-06-28', 3, 20.97);
INSERT INTO sales VALUES ('S00029', '978-0061120084', 'C0009', 'E0020', '2024-08-11', 1, 9.50);
INSERT INTO sales VALUES ('S00030', '978-0679783275', 'C0011', 'E0021', '2024-10-30', 2, 11.00);


-- List all books with their prices 
SELECT title, price 
FROM books; 

-- List all customers alphabetically 
SELECT * 
FROM customers 
ORDER BY name ASC; 

-- List all employees and their salaries in descneding order 
SELECT name, salary 
FROM employees 
ORDER BY salary DESC; 

-- Find the total number of books in stock
SELECT SUM(quantity) AS total_books_in_stock
FROM inventory; 

-- Show sales made by each employee 
SELECT emp_id, COUNT(sales_id) AS number_of_sales
FROM sales 
GROUP BY emp_id; 

-- Total revenue generated so far 
SELECT SUM(total_price) AS total_revenue
FROM sales; 

-- Find the top 5 most sold books 
SELECT isbn, SUM(quantity) AS total_sold 
FROM sales 
GROUP BY isbn
ORDER BY total_sold DESC
LIMIT 5; 

-- List books tha have more than 5 copies in stock 
SELECT b.title, i.quantity 
FROM books b 
JOIN inventory i ON b.isbn = i.isbn
WHERE i.quantity > 5;

-- Find Customers who have made more than 1 purchase 
SELECT customer_id, COUNT(sales_id) AS purchases 
FROM sales 
GROUP BY customer_id 
HAVING COUNT(sales_id) > 1; 

-- Show the highest-selling employee (by total revenue)
SELECT emp_id, SUM(total_price) AS total_sales 
FROM sales
GROUP BY emp_id
ORDER BY total_sales DESC
LIMIT 1; 

-- List the categories of books available 
SELECT DISTINCT category 
FROM books; 

-- Get total sales amount for each month 
SELECT TO_CHAR(sales_date, 'YY-MM') AS month, SUM(total_price) AS monthly_sales
FROM sales 
GROUP BY month
ORDER BY month; 

-- Find employees earning more than the average sales 
SELECT * 
FROM employees 
WHERE salary > (
	SELECT AVG(salary) 
	FROM employees
);

-- Find the books that have never been sold 
SELECT b.title 
FROM books b 
LEFT JOIN sales s
ON b.isbn = s.isbn 
WHERE s.sales_id IS NULL; 

-- List the full sales history with book titles and customer names 
SELECT s.sales_id, b.title, c.name AS customer_name, s.sales_date, s.quantity, s.total_price
FROM sales s 
JOIN books b 
ON s.isbn = b.isbn
JOIN customers c 
ON s.customer_id = c.customer_id 
ORDER BY s.sales_date DESC; 
