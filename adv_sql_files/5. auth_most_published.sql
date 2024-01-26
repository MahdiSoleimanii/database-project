SELECT author_ID, COUNT(*) AS total_books_authored
FROM AuthBooks
GROUP BY author_ID
HAVING COUNT(*) = (
    SELECT MAX(book_count)
    FROM (
        SELECT COUNT(*) AS book_count
        FROM AuthBooks
        GROUP BY author_ID
    )
);
