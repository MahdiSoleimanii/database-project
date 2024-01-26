SELECT ID, category_name, IFNULL(AVG(author_revenue), 0) AS avg_author_revenue
FROM Categories LEFT JOIN Books ON ID = category_id INNER JOIN AuthBooks ON Books.ISBN = AuthBooks.ISBN
GROUP BY ID
ORDER BY avg_author_revenue DESC;
