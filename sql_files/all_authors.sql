SELECT DISTINCT author_name, age
FROM Authors
INNER JOIN AuthBooks ON Authors.ID = AuthBooks.author_ID;