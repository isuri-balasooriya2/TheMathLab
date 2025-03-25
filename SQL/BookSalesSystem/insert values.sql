INSERT INTO Books (title, author, genre, year,price, stock) VALUES
('The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 1937,12.99, 30),
('1984', 'George Orwell', 'Dystopian', 1949,9.99, 20),
('Pride and Prejudice', 'Jane Austen', 'Romance',1813, 7.99, 15),
('Harry Potter and the Philosophers Stone', 'J.K. Rowling', 'Fantasy',1997,12.99, 30);

INSERT INTO Customers (name, email, phone, address) VALUES
('Alice Johnson', 'alice@email.com', '123-456-7890', '123 Elm St'),
('Bob Smith', 'bob@email.com', '987-654-3210', '456 Oak St');

INSERT INTO Sales (date, total,quantity,book_id, customer_id) VALUES
('2024-03-10', 12.99,1,1,1),
('2024-03-11', 19.98,2,2,2);

INSERT INTO Payments (customer_id, sales_id, amount, date) VALUES
(1, 1, 12.99, '2024-03-10'),
(2, 2, 19.98, '2024-03-11');

INSERT INTO Sales (date, total,quantity,book_id, customer_id) VALUES
('2024-02-10', 45.00,2,3,1),
('2024-01-11', 19.98,2,3,2);