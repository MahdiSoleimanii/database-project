SELECT author_name, age
FROM Authors
WHERE ID in (
    SELECT author_ID
    FROM AuthBooks
);