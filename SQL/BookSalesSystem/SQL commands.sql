SELECT b.title, SUM(s.total) as Total
FROM books b
JOIN sales s ON b.book_id=s.book_id
GROUP BY b.title
ORDER BY Total ASC;

SELECT b.genre, SUM(s.total) as Total
FROM books b
JOIN sales s ON b.book_id=s.book_id
GROUP BY genre
ORDER BY Total Desc
LIMIT 3;


SELECT c.name, SUM(s.total) as Total_Spent
FROM customers c
JOIN sales s ON c.customer_id=s.customer_id
GROUP BY c.name
ORDER BY Total_Spent DESC
LIMIT 1;


SELECT c.name, COUNT(s.sales_id) as num_of_purchases
FROM customers c
JOIN sales s ON c.customer_id=s.customer_id
GROUP BY c.name
HAVING num_of_purchases>2;


SELECT title, stock
FROM books
WHERE stock<5;

Delimiter $$

create procedure getcustomerpurchasees(IN customer_id int)
begin
	SELECT c.name, b.title, s.date, s.quantity, s.total
    FROM sales s
    JOIN customers c ON s.customer_id = c.customer_id
    JOIN books b ON s.book_id = b.book_id
    WHERE c.customer_id = customer_id;
end $$
DELIMITER ;

call getcustomerpurchasees(1);

Select title, Total,
RANK() OVER(order by Total DESC) as rankk
FROM ( SELECT 
        b.title, 
        SUM(s.total) AS Total
    FROM books b
    JOIN sales s ON b.book_id = s.book_id
    GROUP BY b.title)subquery;

