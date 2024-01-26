SELECT ab.author_ID, (
    SELECT b_inner.category_id
    FROM AuthBooks ab_inner INNER JOIN Books b_inner ON ab_inner.ISBN = b_inner.ISBN
    WHERE ab_inner.author_ID = ab.author_ID
    GROUP BY b_inner.category_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
  ) AS favorite_category_id
FROM AuthBooks ab
GROUP BY ab.author_ID;
