SELECT b.ISBN, b.pages, pb.publisher_ID
FROM Books b INNER JOIN PubBooks pb ON b.ISBN = pb.ISBN
WHERE (
    SELECT COUNT(*)
    FROM Books b2 INNER JOIN PubBooks pb2 ON b2.ISBN = pb2.ISBN
    WHERE b2.pages > b.pages AND pb2.publisher_ID = pb.publisher_ID
) < 5
ORDER BY pb.publisher_ID, b.pages DESC;