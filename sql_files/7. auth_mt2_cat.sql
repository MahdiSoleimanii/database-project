SELECT ID, author_name
FROM Authors
WHERE ID IN (
    SELECT author_ID
    FROM AuthBooks INNER JOIN Books ON AuthBooks.ISBN = Books.ISBN
    GROUP BY author_ID
    HAVING COUNT(DISTINCT category_ID) > 2
);