SELECT ID, COUNT(ISBN) AS num_books_published
FROM Publishers LEFT JOIN PubBooks ON ID = publisher_ID
                                   AND publish_date BETWEEN '2003-01' AND '2004-06'
GROUP BY ID;
