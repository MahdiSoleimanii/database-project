SELECT ID, category_name, AVG(author_revenue) AS avg_author_revenue
FROM Categories INNER JOIN Books ON ID = category_id INNER JOIN AuthBooks ON Books.ISBN = AuthBooks.ISBN
GROUP BY category_id
ORDER BY avg_author_revenue DESC;
